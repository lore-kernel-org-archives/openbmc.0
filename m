Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CD6C71A1A22
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 10:00:45 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454022040436495.24201074824964;
 Thu, 28 Jan 2016 15:00:40 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd] Add system_state dbus property
Date: Thu, 28 Jan 2016 17:00:38 -0600
Message-Id: <1454022038-17086-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454022038-17086-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454022038-17086-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Jan 2016 23:00:46 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add system_state property to keep track of the system
state across reboots.
Include the generated settings_file.py since some build
machines cannot have the yaml python module installed. This
file will be removed once the code is ported to C in the next rework.
Add the path where the settings will be stored in bmc:
/var/lib/obmc/
Address review comments from the initial commit.
---
 settings.yaml       |  4 +++
 settings_file.py    |  2 +-
 settings_manager.py | 77 ++++++++++++++++++++++++-----------------------------
 3 files changed, 40 insertions(+), 43 deletions(-)

diff --git a/settings.yaml b/settings.yaml
index 8bd9543..5f7e767 100644
--- a/settings.yaml
+++ b/settings.yaml
@@ -12,3 +12,7 @@ host:
         name: boot_flags
         type: s
         default: "0000000000"
+    sysstate:
+        name: system_state
+        type: s
+        default: "BMC_INIT"
diff --git a/settings_file.py b/settings_file.py
index 85f04f0..7ffe391 100644
--- a/settings_file.py
+++ b/settings_file.py
@@ -1,2 +1,2 @@
 #!/usr/bin/python -u
-SETTINGS={'host': {'bootflags': {'default': '0000000000', 'type': 's', 'name': 'boot_flags'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}}}
\ No newline at end of file
+SETTINGS={'host': {'bootflags': {'default': '0000000000', 'type': 's', 'name': 'boot_flags'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': 'BMC_INIT', 'type': 's', 'name': 'system_state'}}}
\ No newline at end of file
diff --git a/settings_manager.py b/settings_manager.py
index 53ce7fb..e49b466 100755
--- a/settings_manager.py
+++ b/settings_manager.py
@@ -4,6 +4,8 @@ import gobject
 import dbus
 import dbus.service
 import dbus.mainloop.glib
+import os
+import os.path as path
 import Openbmc
 import settings_file as s
 
@@ -11,14 +13,14 @@ DBUS_NAME = 'org.openbmc.settings.Host'
 OBJ_NAME = '/org/openbmc/settings/host0'
 CONTROL_INTF = 'org.openbmc.Settings'
 
-# TODO Save settings in tmp until persistant storage is available
-# Path where the settings are stored in the BMC
-SETTINGS_PATH = '/tmp/'
-
 class HostSettingsObject(Openbmc.DbusProperties):
-    def __init__(self,bus,name):
+    def __init__(self, bus, name, settings, path):
         Openbmc.DbusProperties.__init__(self)
-        dbus.service.Object.__init__(self,bus,name)
+        dbus.service.Object.__init__(self, bus, name)
+
+        self.path = path
+        if not os.path.exists(path):
+            os.mkdir(path)
 
         # Listen to changes in the property values and sync them to the BMC
         bus.add_signal_receiver(self.settings_signal_handler,
@@ -27,58 +29,49 @@ class HostSettingsObject(Openbmc.DbusProperties):
             path = "/org/openbmc/settings/host0")
 
         # Create the dbus properties
-        for i in s.SETTINGS['host'].iterkeys():
-            self.sname = s.SETTINGS['host'][i]['name']
-            self.stype = s.SETTINGS['host'][i]['type']
-            self.svalue = s.SETTINGS['host'][i]['default']
-            self.bmcvalue = self.svalue # Default BMC value to file value
-            self.set_settings_property()
+        for i in settings['host'].iterkeys():
+            shk = settings['host'][i]
+            self.set_settings_property(shk['name'],
+                                       shk['type'],
+                                       shk['default'])
 
-    # Check if the requested value is the same as the current one in the BMC
-    def check_settings_need_update(self):
-        filepath = SETTINGS_PATH + self.sname
-        update = True
+    def get_bmc_value(self, name):
         try:
-            with open(filepath, 'r') as f:
-                self.bmcvalue = f.read() # Upate BMC value with value on system
-                if self.bmcvalue == self.svalue:
-                    update = False
+            with open(path.join(self.path, name), 'r') as f:
+                return f.read()
         except (IOError):
             pass
-        return update
+        return None
 
     # Create dbus properties based on bmc value. This will be either a value
     # previously set, or the default file value if the BMC value does not exist.
-    def set_settings_property(self):
-        update = self.check_settings_need_update()
-        if update == True:
-            self.svalue = self.bmcvalue # Update svalue with the value that will be used 
-            if self.stype=="i":
-                self.Set(DBUS_NAME,self.sname,self.svalue)
-            elif self.stype=="s":
-                self.Set(DBUS_NAME,self.sname,str(self.svalue))
+    def set_settings_property(self, name, type, value):
+        bmcv = self.get_bmc_value(name)
+        if bmcv:
+            value = bmcv
+        if type=="i":
+            self.Set(DBUS_NAME, name, value)
+        elif type=="s":
+            self.Set(DBUS_NAME, name, str(value))
 
     # Save the settings to the BMC. This will write the settings value in
     # individual files named by the property name to the BMC.
-    def set_system_settings(self):
-        update = self.check_settings_need_update()
-        if update == True:
-            filepath = SETTINGS_PATH + self.sname
+    def set_system_settings(self, name, value):
+        bmcv = self.get_bmc_value(name)
+        if bmcv != value:
+            filepath = path.join(self.path, name)
             with open(filepath, 'w') as f:
-                f.write(str(self.svalue))
+                f.write(str(value))
 
     # Signal handler for when one ore more settings properties were updated.
     # This will sync the changes to the BMC.
     def settings_signal_handler(self, interface_name, changed_properties, invalidated_properties):
-        data = changed_properties                                           
-        for i in data:                                                      
-            self.sname = i
-            self.svalue = data[i]
-            self.set_system_settings()
+        for name, value in changed_properties.items():
+            self.set_system_settings(name, value)
 
     # Placeholder signal. Needed to register the settings interface.
-    @dbus.service.signal(DBUS_NAME,signature='s')
-    def SettingsUpdated(self,sname):
+    @dbus.service.signal(DBUS_NAME, signature='s')
+    def SettingsUpdated(self, sname):
         pass
 
 if __name__ == '__main__':
@@ -86,7 +79,7 @@ if __name__ == '__main__':
 
     bus = Openbmc.getDBus()
     name = dbus.service.BusName(DBUS_NAME, bus)
-    obj = HostSettingsObject(bus, OBJ_NAME)
+    obj = HostSettingsObject(bus, OBJ_NAME, s.SETTINGS, "/var/lib/obmc/")
     mainloop = gobject.MainLoop()
 
     print "Running HostSettingsService"
-- 
2.6.4
