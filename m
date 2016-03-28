Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qYlCn4fZBzDq8X
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2016 07:01:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459195277496314.02812375332223;
 Mon, 28 Mar 2016 13:01:17 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH phosphor-settingsd] Add Restricted mode as a host setting
Date: Mon, 28 Mar 2016 15:01:14 -0500
Message-Id: <1459195274-17203-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1459195274-17203-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459195274-17203-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 28 Mar 2016 20:01:26 -0000

From: tomjose <tomjoseph@in.ibm.com>

---
 settings.yaml       | 4 ++++
 settings_file.py    | 2 +-
 settings_manager.py | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/settings.yaml b/settings.yaml
index 200aa86..c950e4c 100644
--- a/settings.yaml
+++ b/settings.yaml
@@ -20,3 +20,7 @@ host:
         name: power_policy
         type: s
         default: "RESTORE_LAST_STATE"
+    restrictedmode:
+        name: restricted_mode
+        type: b
+        default: false 
diff --git a/settings_file.py b/settings_file.py
index 3efad0b..698d941 100644
--- a/settings_file.py
+++ b/settings_file.py
@@ -1,2 +1,2 @@
 #!/usr/bin/python -u
-SETTINGS={'host': {'bootflags': {'default': 'default', 'type': 's', 'name': 'boot_flags'}, 'powerpolicy': {'default': 'RESTORE_LAST_STATE', 'type': 's', 'name': 'power_policy'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': '', 'type': 's', 'name': 'system_state'}}}
\ No newline at end of file
+SETTINGS={'host': {'bootflags': {'default': 'default', 'type': 's', 'name': 'boot_flags'}, 'powerpolicy': {'default': 'RESTORE_LAST_STATE', 'type': 's', 'name': 'power_policy'}, 'restrictedmode': {'default': False, 'type': 'b', 'name': 'restricted_mode'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': '', 'type': 's', 'name': 'system_state'}}}
\ No newline at end of file
diff --git a/settings_manager.py b/settings_manager.py
index e49b466..3d5cf14 100755
--- a/settings_manager.py
+++ b/settings_manager.py
@@ -53,6 +53,8 @@ class HostSettingsObject(Openbmc.DbusProperties):
             self.Set(DBUS_NAME, name, value)
         elif type=="s":
             self.Set(DBUS_NAME, name, str(value))
+        elif type=="b":
+            self.Set(DBUS_NAME, name, value)
 
     # Save the settings to the BMC. This will write the settings value in
     # individual files named by the property name to the BMC.
-- 
2.7.1
