Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472B11A0B54
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 02:40:51 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457019641302910.737467206663;
 Thu, 3 Mar 2016 07:40:41 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd] netman and userman throws exceptions and
 other bugfixes.
Date: Thu,  3 Mar 2016 09:40:38 -0600
Message-Id: <1457019638-25601-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457019638-25601-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457019638-25601-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2016 15:40:51 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 netman.py  | 168 ++++++++++++++++++++++++++++++++++++++++++-------------------
 userman.py |  44 +++++++++-------
 2 files changed, 141 insertions(+), 71 deletions(-)
 mode change 100755 => 100644 userman.py

diff --git a/netman.py b/netman.py
index 38ee9d3..377833d 100755
--- a/netman.py
+++ b/netman.py
@@ -1,10 +1,12 @@
 #!/usr/bin/env python
 
-from subprocess import call
+from subprocess import call, Popen, PIPE
 import sys
 import subprocess
 import dbus
 import string
+import socket
+import re
 import os
 import fcntl
 import glib
@@ -56,38 +58,81 @@ class NetMan (dbus.service.Object):
     def setNetworkProvider(self, provider):
         self.provider = provider
 
-    def _setAddr (self, op, device, ipaddr, netmask, family, flags, scope, gateway):
-        netprov     = network_providers [self.provider]
-        bus_name    = netprov ['bus_name']
-        obj_path    = netprov ['ip_object_name']
-        intf_name   = netprov ['ip_if_name']
-
-        obj = self.bus.get_object(bus_name, obj_path)
-        intf = dbus.Interface(obj, intf_name)
-        if (op == "add"):
-            return intf.AddAddress (device, ipaddr, netmask, family, flags, scope, gateway)
-
-        if (op == "del"):
-            return intf.DelAddress (device, ipaddr, netmask, family, flags, scope, gateway)
+    def _isvaliddev(self, device):
+        devices = os.listdir ("/sys/class/net")
+        if not device in devices : return False
+        else: return True
+
+    def _ishwdev (self, device):
+        f = open ("/sys/class/net/"+device+"/type")
+        type = f.read()
+        return False if (int(type) ==  772) else True
+
+    def _isvalidmask (self, mask):
+        for x in mask.split('.'):
+            try:
+                y = int(x)
+            except:
+                return False
+            if y > 255: return False
+        return mask.count('.') == 3
+
+    def _isvalidmac(self, mac):
+        macre = '([a-fA-F0-9]{2}[:|\-]?){6}'
+        if re.compile(macre).search(mac) : return True
+        else: return False
+
+    def _isvalidip(self, family, ipaddr):
+        if family == socket.AF_INET:
+            try:
+                socket.inet_pton(socket.AF_INET, ipaddr)
+            except AttributeError:  # no inet_pton here, sorry
+                try:
+                    socket.inet_aton(ipaddr)
+                except socket.error:
+                    return False
+                return ipaddr.count('.') == 3
+            except socket.error:  # not a valid address
+                return False
+
+            return True
+
+        elif family == socket.AF_INET6:
+            try:
+                socket.inet_pton(socket.AF_INET6, ipaddr)
+            except socket.error:  # not a valid address
+                return False
+            return True
+
+        else: return False
 
     def _getAddr (self, target, device):
         netprov     = network_providers [self.provider]
         bus_name    = netprov ['bus_name']
 
         if (target == "ip"):
-            intf_name   = netprov ['ip_if_name'] #'org.freedesktop.network1.Network'
-            obj_path    = netprov ['ip_object_name']
-            obj = self.bus.get_object(bus_name, obj_path)
-            intf = dbus.Interface(obj, intf_name)
-            return intf.GetAddress (device)
+            ipaddr = ""
+            defgw = ""
+            prefixlen = "0"
+
+            proc = subprocess.Popen(["ip", "addr", "show", "dev", device], stdout=PIPE)
+            procout = proc.communicate()
+            if procout: 
+                ipout = procout[0].splitlines()[2].strip()
+                ipaddr,prefixlen = ipout.split ()[1].split("/")
+
+            proc = subprocess.Popen(["ip", "route", "show", "dev", device, "default", "0.0.0.0/0"], stdout=PIPE)
+            procout = proc.communicate()
+            if procout[0]:
+                ipout = procout[0].splitlines()[0].strip()
+                defgw = ipout.split ()[2]
+
+            return 2, int(prefixlen), ipaddr, defgw
 
         if (target == "mac"):
-            intf_name   = netprov ['hw_if_name'] #'org.freedesktop.network1.Link'
-            obj_path    = netprov ['hw_object_name']
-            obj = self.bus.get_object(bus_name, obj_path)
-            intf = dbus.Interface(obj, intf_name)
-            mac = intf.GetAddress (device)
-            print mac
+            proc = subprocess.Popen(["ip", "link", "show", "dev", device], stdout=PIPE)
+            ipout = proc.communicate()[0].splitlines()[1].strip()
+            mac = ipout.split ()[1]
             return mac
 
     @dbus.service.method(DBUS_NAME, "", "")
@@ -96,12 +141,16 @@ class NetMan (dbus.service.Object):
 
     @dbus.service.method(DBUS_NAME, "s", "x")
     def EnableDHCP (self, device):
-        confFile = "/etc/systemd/network/10-bmc-" + device + ".network"
-        if os.path.exists(confFile):
-            return 0
+        if not self._isvaliddev (device) : raise ValueError, "Invalid Device"
+
+        confFile = "/etc/systemd/network/00-bmc-" + device + ".network"
 
         print("Making .network file...")
-        networkconf = open (confFile, "w+") 
+        try:
+            networkconf = open (confFile, "w+") 
+        except IOError:
+            raise IOError, "Failed to open " + confFile
+            
         networkconf.write ('[Match]'+ '\n')
         networkconf.write ('Name=' + (device) + '\n')
         networkconf.write ('[Network]' + '\n')
@@ -109,18 +158,28 @@ class NetMan (dbus.service.Object):
         networkconf.close ()
 
         print("Restarting networkd service...")
-        call(["ip", "addr", "flush", device])
-        call(["systemctl", "restart", "systemd-networkd.service"])
-        return 0
-        #return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253, gateway)
+        rc = call(["ip", "addr", "flush", device])
+        rc = call(["systemctl", "restart", "systemd-networkd.service"])
+        return rc
 
     @dbus.service.method(DBUS_NAME, "ssss", "x")
-    def AddAddress4 (self, device, ipaddr, netmask, gateway):
+    def SetAddress4 (self, device, ipaddr, netmask, gateway):
+        if not self._isvaliddev (device) : raise ValueError, "Invalid Device"
+        if not self._isvalidip (socket.AF_INET, ipaddr) : raise ValueError, "Malformed IP Address"
+        if not self._isvalidip (socket.AF_INET, gateway) : raise ValueError, "Malformed GW Address"
+        if not self._isvalidmask (netmask) : raise ValueError, "Invalid Mask"
+
         prefixLen = getPrefixLen (netmask)
-        confFile = "/etc/systemd/network/10-bmc-" + device + ".network"
+        if prefixLen == 0: raise ValueError, "Invalid Mask"
+
+        confFile = "/etc/systemd/network/00-bmc-" + device + ".network"
 
         print("Making .network file...")
-        networkconf = open (confFile, "w+") 
+        try:
+            networkconf = open (confFile, "w+") 
+        except IOError:
+            raise IOError, "Failed to open " + confFile
+
         networkconf.write ('[Match]'+ '\n')
         networkconf.write ('Name=' + (device) + '\n')
         networkconf.write ('[Network]' + '\n')
@@ -129,32 +188,35 @@ class NetMan (dbus.service.Object):
         networkconf.close()
 
         print("Restarting networkd service...")
-        call(["ip", "addr", "flush", device])
-        return 0
-        #return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253, gateway
-
-    @dbus.service.method(DBUS_NAME, "ssss", "x")
-    def DelAddress4 (self, device, ipaddr, netmask, gateway):
-        prefixLen = getPrefixLen (netmask)
-        confFile = "/etc/systemd/network/10-bmc-" + device + ".network"
-        if not (os.path.exists(confFile)):
-            return 1
-
-        self._setAddr ("del", device, ipaddr, netmask, 2, 0, 253, gateway)
-        os.remove (confFile)
-        return  0;
+        rc = call(["ip", "addr", "flush", device])
+        rc = call(["systemctl", "restart", "systemd-networkd.service"])
+        return rc
 
-    @dbus.service.method(DBUS_NAME, "s", "a(iyyus)s")
+    #family, prefixlen, ip, defgw
+    @dbus.service.method(DBUS_NAME, "s", "iyss")
     def GetAddress4 (self, device):
+        if not self._isvaliddev (device) : raise ValueError, "Invalid Device"
         return self._getAddr ("ip", device)
 
     @dbus.service.method(DBUS_NAME, "s", "s")
     def GetHwAddress (self, device):
+        if not self._isvaliddev (device) : raise ValueError, "Invalid Device"
         return self._getAddr ("mac", device)
 
-    @dbus.service.method(DBUS_NAME, "s", "i")
-    def SetHwAddress (self, mac):
+    @dbus.service.method(DBUS_NAME, "ss", "i")
+    def SetHwAddress (self, device, mac):
+        if not self._isvaliddev (device) : raise ValueError, "Invalid Device"
+        if not self._ishwdev (device) : raise ValueError, "Not a Hardware Device"
+        if not self._isvalidmac (mac) : raise ValueError, "Malformed MAC address"
+
         rc = subprocess.call(["fw_setenv", "ethaddr", mac])
+
+        print("Restarting networkd service...")
+        rc = call(["ip", "link", "set", "dev", device, "down"])
+        rc = call(["ip", "link", "set", "dev", device, "address", mac])
+        rc = call(["ip", "link", "set", "dev", device, "up"])
+
+        rc = call(["systemctl", "restart", "systemd-networkd.service"])
         return rc
 
 def main():
diff --git a/userman.py b/userman.py
old mode 100755
new mode 100644
index 033d3d1..7bca15a
--- a/userman.py
+++ b/userman.py
@@ -61,23 +61,23 @@ class UserManGroups (dbus.service.Object):
 
     @dbus.service.method(INTF_NAME, "s", "x")
     def GroupAddUsr (self, groupname):
-        if not groupname : return 1
+        if not groupname : raise ValueError("Invalid Groupname")
 
         groups = self.GroupListAll ()
-        if groupname in groups: return 1
+        if groupname in groups: raise ValueError("Group ", groupname, " Exists")
 
         r = call (["addgroup", groupname])
         return r
 
-    @dbus.service.method(INTF_NAME, "s", "x")
+    #@dbus.service.method(INTF_NAME, "s", "x")
     def GroupAddSys (self, groupname):
-        if not groupname : return 1
+        if not groupname : raise ValueError("Invalid Groupname")
 
         groups = self.GroupListAll ()
-        if groupname in groups: return 1
+        if groupname in groups: raise ValueError("Group ", groupname, " Exists")
 
         r = call (["addgroup", "-S", groupname])
-        return 0
+        return r
 
     @dbus.service.method(INTF_NAME, "", "as")
     def GroupListUsr (self):
@@ -121,10 +121,10 @@ class UserManGroup (dbus.service.Object):
 
     @dbus.service.method(INTF_NAME, "", "x")
     def GroupDel (self, groupname):
-        if not groupname : return 1
+        if not groupname : raise ValueError("Invalid Groupname")
 
         groups = Groupsobj.GroupListAll ()
-        if groupname not in groups: return 1
+        if groupname not in groups: raise ValueError("No such Group: ", groupname)
 
         r = call (["delgroup", groupname])
         return r
@@ -144,14 +144,14 @@ class UserManUsers (dbus.service.Object):
 
     @dbus.service.method(INTF_NAME, "ssss", "x")
     def UserAdd (self, gecos, username, groupname, passwd):
-        if not username: return 1
+        if not username : raise ValueError("Invalid Username")
 
-        users = self.UserList ()
-        if username in users : return 1
+        users = self.UserListAll ()
+        if username in users : raise ValueError("User ", username, " Exists")
 
         if groupname:
             groups = Groupsobj.GroupListAll ()
-            if groupname not in groups: return 1
+            if groupname not in groups: raise ValueError("No such Group: ", groupname)
 
         opts = ""
         if gecos: opts = " -g " + '"' + gecos + '"'
@@ -167,8 +167,8 @@ class UserManUsers (dbus.service.Object):
         proc.expect (['New password: ', 'Retype password: '])
         proc.sendline (passwd)
 
-        proc.wait()
-        return 0
+        r = proc.wait()
+        return r
 
     @dbus.service.method(INTF_NAME, "", "as")
     def UserList (self):
@@ -180,6 +180,14 @@ class UserManUsers (dbus.service.Object):
                     userList.append(userParams[0])
         return userList
 
+    def UserListAll (self):
+        userList = []
+        with open("/etc/passwd", "r") as f:
+            for usent in f:
+                userParams = usent.split (":")
+                userList.append(userParams[0])
+        return userList
+
 class UserManUser (dbus.service.Object):
     def __init__(self, bus, name):
         self.bus = bus
@@ -195,20 +203,20 @@ class UserManUser (dbus.service.Object):
 
     @dbus.service.method(INTF_NAME, "s", "x")
     def UserDel (self, username):
-        if not username : return 1
+        if not username : raise ValueError("Invalid Username")
 
         users = Usersobj.UserList ()
-        if username not in users : return 1
+        if username not in users : raise ValueError("No such User: ", username)
 
         r = call (["deluser", username])
         return r
 
     @dbus.service.method(INTF_NAME, "ss", "x")
     def Passwd (self, username, passwd):
-        if not username : return 1
+        if not username : raise ValueError("Invalid Username")
         
         users = self.UserList ()
-        if username not in users : return 1
+        if username not in users : raise ValueError("No such User: ", username)
 
         cmd = "passwd" + " " + username
         proc = pexpect.spawn (cmd)
-- 
2.7.1
