Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B0BE51A0038
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 08:00:57 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455224450485185.38139219127038;
 Thu, 11 Feb 2016 13:00:50 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd] Validating user & group names prior to
 system call and wait() on proc spawned with pexpect.
Date: Thu, 11 Feb 2016 15:00:47 -0600
Message-Id: <1455224447-11108-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455224447-11108-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455224447-11108-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 11 Feb 2016 21:00:58 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 userman.py | 106 ++++++++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 30 deletions(-)

diff --git a/userman.py b/userman.py
index 6109582..033d3d1 100755
--- a/userman.py
+++ b/userman.py
@@ -25,7 +25,8 @@ OBJ_NAME_USER = '/org/openbmc/UserManager/User'
     Object Path > /org/openbmc/UserManager/Groups
         Interface:Method > org.openbmc.Enrol.GroupAddSys string:"groupname"
         Interface:Method > org.openbmc.Enrol.GroupAddUsr string:"groupname"
-        Interface:Method > org.openbmc.Enrol.GroupList
+        Interface:Method > org.openbmc.Enrol.GroupListUsr
+        Interface:Method > org.openbmc.Enrol.GroupListSys
     Object Path > /org/openbmc/UserManager/Group
         Interface:Method > org.openbmc.Enrol.GroupDel string:"groupname"
     Object Path > /org/openbmc/UserManager/Users
@@ -60,16 +61,26 @@ class UserManGroups (dbus.service.Object):
 
     @dbus.service.method(INTF_NAME, "s", "x")
     def GroupAddUsr (self, groupname):
+        if not groupname : return 1
+
+        groups = self.GroupListAll ()
+        if groupname in groups: return 1
+
         r = call (["addgroup", groupname])
         return r
 
     @dbus.service.method(INTF_NAME, "s", "x")
     def GroupAddSys (self, groupname):
+        if not groupname : return 1
+
+        groups = self.GroupListAll ()
+        if groupname in groups: return 1
+
         r = call (["addgroup", "-S", groupname])
         return 0
 
     @dbus.service.method(INTF_NAME, "", "as")
-    def GroupList (self):
+    def GroupListUsr (self):
         groupList = []
         with open("/etc/group", "r") as f:
             for grent in f:
@@ -78,6 +89,23 @@ class UserManGroups (dbus.service.Object):
                     groupList.append(groupParams[0])
         return groupList
 
+    @dbus.service.method(INTF_NAME, "", "as")
+    def GroupListSys (self):
+        groupList = []
+        with open("/etc/group", "r") as f:
+            for grent in f:
+                groupParams = grent.split (":")
+                if (int(groupParams[2]) > 100 and int(groupParams[2]) < 1000): groupList.append(groupParams[0])
+        return groupList
+
+    def GroupListAll (self):
+        groupList = []
+        with open("/etc/group", "r") as f:
+            for grent in f:
+                groupParams = grent.split (":")
+                groupList.append(groupParams[0])
+        return groupList
+
 class UserManGroup (dbus.service.Object):
     def __init__(self, bus, name):
         self.bus = bus
@@ -93,6 +121,11 @@ class UserManGroup (dbus.service.Object):
 
     @dbus.service.method(INTF_NAME, "", "x")
     def GroupDel (self, groupname):
+        if not groupname : return 1
+
+        groups = Groupsobj.GroupListAll ()
+        if groupname not in groups: return 1
+
         r = call (["delgroup", groupname])
         return r
 
@@ -111,39 +144,31 @@ class UserManUsers (dbus.service.Object):
 
     @dbus.service.method(INTF_NAME, "ssss", "x")
     def UserAdd (self, gecos, username, groupname, passwd):
+        if not username: return 1
+
+        users = self.UserList ()
+        if username in users : return 1
+
         if groupname:
-            cmd = "adduser "  + " -g "  + gecos + " -G ", groupname + " " + username
+            groups = Groupsobj.GroupListAll ()
+            if groupname not in groups: return 1
+
+        opts = ""
+        if gecos: opts = " -g " + '"' + gecos + '"'
+
+        if groupname:
+            cmd = "adduser "  + opts + " " + " -G " + groupname + " " + username
         else:
-            cmd = "adduser "  + " -g "  + gecos + username
+            cmd = "adduser "  + opts + " " + username
 
         proc = pexpect.spawn (cmd)
-        proc.expect ("[New password: ]")
+        proc.expect (['New password: ', 'Retype password: '])
         proc.sendline (passwd)
-        proc.expect ("[Retype password: ]")
+        proc.expect (['New password: ', 'Retype password: '])
         proc.sendline (passwd)
-        return 0
 
-
-#        if groupname:
-#            proc = subprocess.Popen(['adduser', "-g", gecos, "-G", groupname, username], shell=False, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, bufsize=1)
-#        else:
-#            proc = subprocess.Popen(['adduser', "-g", gecos, username], shell=False, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, bufsize=1)
-#
-#        with proc.stdout:
-#            for prompt in iter(proc.stdout.readline, b''):
-#                proc.stdin.write(passwd)
-#
-#        return 0
-
-#        proc = subprocess.Popen(['passwd', username], shell=False, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-#        out,err = proc.communicate(passwd)
-#        out,err = proc.communicate(passwd)
-#        proc.stdin.write(passwd)
-#        proc.stdin.write(passwd)
-#        if (not err): return 0
-#        print out
-#        print err
-#        return 0
+        proc.wait()
+        return 0
 
     @dbus.service.method(INTF_NAME, "", "as")
     def UserList (self):
@@ -170,20 +195,41 @@ class UserManUser (dbus.service.Object):
 
     @dbus.service.method(INTF_NAME, "s", "x")
     def UserDel (self, username):
+        if not username : return 1
+
+        users = Usersobj.UserList ()
+        if username not in users : return 1
+
         r = call (["deluser", username])
         return r
 
     @dbus.service.method(INTF_NAME, "ss", "x")
     def Passwd (self, username, passwd):
-        r = call (["echo", "-e", passwd, "passwd", username])
-        return r
+        if not username : return 1
+        
+        users = self.UserList ()
+        if username not in users : return 1
 
+        cmd = "passwd" + " " + username
+        proc = pexpect.spawn (cmd)
+        proc.expect (['New password: ', 'Retype password: '])
+        proc.sendline (passwd)
+        proc.expect (['New password: ', 'Retype password: '])
+        proc.sendline (passwd)
+
+        proc.wait()
+        return r
 
 def main():
     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
     bus = dbus.SystemBus()
     name = dbus.service.BusName(DBUS_NAME, bus)
 
+    global Groupsobj
+    global Groupobj
+    global Usersobj
+    global Userobj
+
     Groupsobj   = UserManGroups (bus, OBJ_NAME_GROUPS)
     Groupobj    = UserManGroup  (bus, OBJ_NAME_GROUP)
     Usersobj    = UserManUsers  (bus, OBJ_NAME_USERS)
-- 
2.7.1
