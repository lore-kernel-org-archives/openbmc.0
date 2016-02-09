Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5496F1A0338
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 00:00:43 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455022835189452.40039592534754;
 Tue, 9 Feb 2016 05:00:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd 1/2] org.openbmc.NetworkManager : Bug fixes,
 SetHwAddress & EnableDHCP
Date: Tue,  9 Feb 2016 07:00:31 -0600
Message-Id: <1455022832-4842-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1455022832-4842-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455022832-4842-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 13:00:44 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 netman.py | 82 +++++++++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 54 insertions(+), 28 deletions(-)

diff --git a/netman.py b/netman.py
index 3978cef..7f9d14e 100755
--- a/netman.py
+++ b/netman.py
@@ -16,25 +16,27 @@ DBUS_NAME = 'org.openbmc.NetworkManager'
 OBJ_NAME = '/org/openbmc/NetworkManager/Interface'
 
 network_providers = {
-    'networkd' : { 
-        'bus_name' : 'org.freedesktop.network1',
-        'ip_object_name' : '/org/freedesktop/network1/network/default',
-        'hw_object_name' : '/org/freedesktop/network1/link/_31',
-        'interface_name' : 'org.freedesktop.network1.Network',
-        'method' : 'org.freedesktop.network1.Network.SetAddr'
-    },
-    'NetworkManager' : {
-        'bus_name' : 'org.freedesktop.NetworkManager',
-        'ip_object_name' : '/org/freedesktop/NetworkManager',
-        'hw_object_name' : '/org/freedesktop/NetworkManager',
-        'interface_name' : 'org.freedesktop.NetworkManager',
-        'method' : 'org.freedesktop.NetworkManager' # FIXME: 
-    },  
+	'networkd' : { 
+		'bus_name' : 'org.freedesktop.network1',
+		'ip_object_name' : '/org/freedesktop/network1/network/default',
+		'hw_object_name' : '/org/freedesktop/network1/link/_31',
+		'ip_if_name' : 'org.freedesktop.network1.Network',
+		'hw_if_name' : 'org.freedesktop.network1.Link',
+		'method' : 'org.freedesktop.network1.Network.SetAddr'
+	},
+	'NetworkManager' : {
+		'bus_name' : 'org.freedesktop.NetworkManager',
+		'ip_object_name' : '/org/freedesktop/NetworkManager',
+		'hw_object_name' : '/org/freedesktop/NetworkManager',
+		'ip_if_name' : 'org.freedesktop.NetworkManager',
+		'hw_if_name' : 'org.freedesktop.NetworkManager',
+		'method' : 'org.freedesktop.NetworkManager' # FIXME: 
+	},	
 }
 
 def getPrefixLen(mask):
-    prefixLen = sum([bin(int(x)).count('1') for x in mask.split('.')])
-    return prefixLen
+	prefixLen = sum([bin(int(x)).count('1') for x in mask.split('.')])
+	return prefixLen
 
 class IfAddr ():
     def __init__ (self, family, scope, flags, prefixlen, addr, gw):
@@ -58,7 +60,7 @@ class NetMan (dbus.service.Object):
         netprov     = network_providers [self.provider]
         bus_name    = netprov ['bus_name']
         obj_path    = netprov ['ip_object_name']
-        intf_name   = netprov ['interface_name']
+        intf_name   = netprov ['ip_if_name']
 
         obj = self.bus.get_object(bus_name, obj_path)
         intf = dbus.Interface(obj, intf_name)
@@ -73,14 +75,14 @@ class NetMan (dbus.service.Object):
         bus_name    = netprov ['bus_name']
 
         if (target == "ip"):
-            intf_name   = 'org.freedesktop.network1.Network'
+            intf_name   = netprov ['ip_if_name'] #'org.freedesktop.network1.Network'
             obj_path    = netprov ['ip_object_name']
             obj = self.bus.get_object(bus_name, obj_path)
             intf = dbus.Interface(obj, intf_name)
             return intf.GetAddress (device)
 
         if (target == "mac"):
-            intf_name   = 'org.freedesktop.network1.Link'
+            intf_name   = netprov ['hw_if_name'] #'org.freedesktop.network1.Link'
             obj_path    = netprov ['hw_object_name']
             obj = self.bus.get_object(bus_name, obj_path)
             intf = dbus.Interface(obj, intf_name)
@@ -88,16 +90,35 @@ class NetMan (dbus.service.Object):
             print mac
             return mac
 
-
-
     @dbus.service.method(DBUS_NAME, "", "")
     def test(self):
         print("TEST")
 
+    @dbus.service.method(DBUS_NAME, "s", "x")
+    def EnableDHCP (self, device):
+        confFile = "/etc/systemd/network/10-bmc-" + device + "-" + "dhcp.network"
+        if os.path.exists(confFile):
+            return 0
+
+        print("Making .network file...")
+        networkconf = open (confFile, "w+") 
+        networkconf.write ('[Match]'+ '\n')
+        networkconf.write ('Name=' + (device) + '\n')
+        networkconf.write ('[Network]' + '\n')
+        networkconf.write ('DHCP=yes')
+        networkconf.close ()
+
+        print("Restarting networkd service...")
+        call(["systemctl", "restart", "systemd-networkd.service"])
+        return 0
+        #return self._setAddr ("add", device, ipaddr, netmask, 2, 0, 253, gateway)
+
     @dbus.service.method(DBUS_NAME, "ssss", "x")
     def AddAddress4 (self, device, ipaddr, netmask, gateway):
         prefixLen = getPrefixLen (netmask)
-        confFile = "/etc/systemd/network/10-bmc-" + device + ".network"
+        confFile = "/etc/systemd/network/10-bmc-" + device + "-" + ipaddr + '_' + str(prefixLen) + ".network"
+        if os.path.exists(confFile):
+            return 0
 
         print("Making .network file...")
         networkconf = open (confFile, "w+") 
@@ -116,7 +137,7 @@ class NetMan (dbus.service.Object):
     @dbus.service.method(DBUS_NAME, "ssss", "x")
     def DelAddress4 (self, device, ipaddr, netmask, gateway):
         prefixLen = getPrefixLen (netmask)
-        confFile = "/etc/systemd/network/10-bmc-" + device + ".network"
+        confFile = "/etc/systemd/network/10-bmc-" + device + "-" + ipaddr + '_' + str(prefixLen) + ".network"
         if not (os.path.exists(confFile)):
             return 1
 
@@ -132,10 +153,16 @@ class NetMan (dbus.service.Object):
     def GetHwAddress (self, device):
         return self._getAddr ("mac", device)
 
-    @dbus.service.method(DBUS_NAME, "s", "i")
-    def SetHwAddress (self, mac):
-        rc = subprocess.call(["fw_setenv", "ethaddr", mac])
-        return rc
+    @dbus.service.method(DBUS_NAME, "ss", "s")
+    def SetHwAddress (self, device, mac):
+        netprov     = network_providers [self.provider]
+        bus_name    = netprov ['bus_name']
+        obj_path    = netprov ['hw_object_name']
+        intf_name   = netprov ['hw_if_name']
+
+        obj = self.bus.get_object(bus_name, obj_path)
+        intf = dbus.Interface(obj, intf_name)
+        return intf.SetAddress (device, mac)
 
 def main():
     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
@@ -149,4 +176,3 @@ def main():
 
 if __name__ == '__main__':
     sys.exit(main())
-
-- 
2.6.4
