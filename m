Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7F6BC1A004E
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2016 04:00:49 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145529644453326.35504322594693;
 Fri, 12 Feb 2016 09:00:44 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd] Fix for user change password
Date: Fri, 12 Feb 2016 11:00:42 -0600
Message-Id: <1455296442-15065-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455296442-15065-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455296442-15065-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 12 Feb 2016 17:00:50 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Fix to allow to change the user password
---
 userman.py | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/userman.py b/userman.py
index 033d3d1..0488d10 100755
--- a/userman.py
+++ b/userman.py
@@ -38,12 +38,12 @@ OBJ_NAME_USER = '/org/openbmc/UserManager/User'
 '''
 
 userman_providers = {
-	'pam' : { 
-		'adduser' : 'user add',
-	},
-	'ldap' : {
-		'adduser' : 'ldap command to add user',
-	},	
+    'pam' : { 
+        'adduser' : 'user add',
+    },
+    'ldap' : {
+        'adduser' : 'ldap command to add user',
+    },  
 }
 
 class UserManGroups (dbus.service.Object):
@@ -207,7 +207,7 @@ class UserManUser (dbus.service.Object):
     def Passwd (self, username, passwd):
         if not username : return 1
         
-        users = self.UserList ()
+        users = Usersobj.UserList ()
         if username not in users : return 1
 
         cmd = "passwd" + " " + username
@@ -218,7 +218,7 @@ class UserManUser (dbus.service.Object):
         proc.sendline (passwd)
 
         proc.wait()
-        return r
+        return 0
 
 def main():
     dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
@@ -246,3 +246,4 @@ def main():
 
 if __name__ == '__main__':
     sys.exit(main())
+
-- 
2.7.1
