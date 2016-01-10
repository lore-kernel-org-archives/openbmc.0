Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B260C1A0023
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 08:40:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452462034172386.37284691881496;
 Sun, 10 Jan 2016 13:40:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd] Create the settings dbus object.
Date: Sun, 10 Jan 2016 15:40:32 -0600
Message-Id: <1452462032-12848-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452462032-12848-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452462032-12848-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 10 Jan 2016 21:40:39 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Host settings are specified in a yaml file.
Parser converts the yaml file into a dictionary.
The settings manager runs on the BMC and uses the dictionary to
create the dbus properties and save the values in the BMC so that
the values persist.
---
 settings.yaml       | 14 ++++++++
 settings_file.py    |  2 ++
 settings_manager.py | 94 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 settings_parser.py  | 20 ++++++++++++
 4 files changed, 130 insertions(+)
 create mode 100644 settings.yaml
 create mode 100644 settings_file.py
 create mode 100755 settings_manager.py
 create mode 100755 settings_parser.py

diff --git a/settings.yaml b/settings.yaml
new file mode 100644
index 0000000..8bd9543
--- /dev/null
+++ b/settings.yaml
@@ -0,0 +1,14 @@
+---
+# Settings Config File
+host:
+    powercap:
+        name: power_cap
+        type: i
+        default: 0
+        min: 0
+        max: 1000
+        unit: watts
+    bootflags:
+        name: boot_flags
+        type: s
+        default: "0000000000"
diff --git a/settings_file.py b/settings_file.py
new file mode 100644
index 0000000..85f04f0
--- /dev/null
+++ b/settings_file.py
@@ -0,0 +1,2 @@
+#!/usr/bin/python -u
+SETTINGS={'host': {'bootflags': {'default': '0000000000', 'type': 's', 'name': 'boot_flags'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}}}
\ No newline at end of file
diff --git a/settings_manager.py b/settings_manager.py
new file mode 100755
index 0000000..53ce7fb
--- /dev/null
+++ b/settings_manager.py
@@ -0,0 +1,94 @@
+#!/usr/bin/python -u
+
+import gobject
+import dbus
+import dbus.service
+import dbus.mainloop.glib
+import Openbmc
+import settings_file as s
+
+DBUS_NAME = 'org.openbmc.settings.Host'
+OBJ_NAME = '/org/openbmc/settings/host0'
+CONTROL_INTF = 'org.openbmc.Settings'
+
+# TODO Save settings in tmp until persistant storage is available
+# Path where the settings are stored in the BMC
+SETTINGS_PATH = '/tmp/'
+
+class HostSettingsObject(Openbmc.DbusProperties):
+    def __init__(self,bus,name):
+        Openbmc.DbusProperties.__init__(self)
+        dbus.service.Object.__init__(self,bus,name)
+
+        # Listen to changes in the property values and sync them to the BMC
+        bus.add_signal_receiver(self.settings_signal_handler,
+            dbus_interface = "org.freedesktop.DBus.Properties",
+            signal_name = "PropertiesChanged",
+            path = "/org/openbmc/settings/host0")
+
+        # Create the dbus properties
+        for i in s.SETTINGS['host'].iterkeys():
+            self.sname = s.SETTINGS['host'][i]['name']
+            self.stype = s.SETTINGS['host'][i]['type']
+            self.svalue = s.SETTINGS['host'][i]['default']
+            self.bmcvalue = self.svalue # Default BMC value to file value
+            self.set_settings_property()
+
+    # Check if the requested value is the same as the current one in the BMC
+    def check_settings_need_update(self):
+        filepath = SETTINGS_PATH + self.sname
+        update = True
+        try:
+            with open(filepath, 'r') as f:
+                self.bmcvalue = f.read() # Upate BMC value with value on system
+                if self.bmcvalue == self.svalue:
+                    update = False
+        except (IOError):
+            pass
+        return update
+
+    # Create dbus properties based on bmc value. This will be either a value
+    # previously set, or the default file value if the BMC value does not exist.
+    def set_settings_property(self):
+        update = self.check_settings_need_update()
+        if update == True:
+            self.svalue = self.bmcvalue # Update svalue with the value that will be used 
+            if self.stype=="i":
+                self.Set(DBUS_NAME,self.sname,self.svalue)
+            elif self.stype=="s":
+                self.Set(DBUS_NAME,self.sname,str(self.svalue))
+
+    # Save the settings to the BMC. This will write the settings value in
+    # individual files named by the property name to the BMC.
+    def set_system_settings(self):
+        update = self.check_settings_need_update()
+        if update == True:
+            filepath = SETTINGS_PATH + self.sname
+            with open(filepath, 'w') as f:
+                f.write(str(self.svalue))
+
+    # Signal handler for when one ore more settings properties were updated.
+    # This will sync the changes to the BMC.
+    def settings_signal_handler(self, interface_name, changed_properties, invalidated_properties):
+        data = changed_properties                                           
+        for i in data:                                                      
+            self.sname = i
+            self.svalue = data[i]
+            self.set_system_settings()
+
+    # Placeholder signal. Needed to register the settings interface.
+    @dbus.service.signal(DBUS_NAME,signature='s')
+    def SettingsUpdated(self,sname):
+        pass
+
+if __name__ == '__main__':
+    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
+
+    bus = Openbmc.getDBus()
+    name = dbus.service.BusName(DBUS_NAME, bus)
+    obj = HostSettingsObject(bus, OBJ_NAME)
+    mainloop = gobject.MainLoop()
+
+    print "Running HostSettingsService"
+    mainloop.run()
+
diff --git a/settings_parser.py b/settings_parser.py
new file mode 100755
index 0000000..46bb474
--- /dev/null
+++ b/settings_parser.py
@@ -0,0 +1,20 @@
+#!/usr/bin/python -u
+
+# Simple parser to create a python dictionary from a yaml file.
+# It saves the applications from doing the parsing and
+# adding dependencies to additional modules like yaml
+
+import yaml
+
+SETTINGS_FILE = 'settings.yaml'
+OUTPUT_FILE = 'settings_file.py'
+FILE_HEADER = '#!/usr/bin/python -u'
+
+with open(SETTINGS_FILE) as s:
+    data = yaml.safe_load(s)
+
+with open(OUTPUT_FILE, 'w') as f:
+    f.write(FILE_HEADER)
+    f.write('\n')
+    f.write('SETTINGS=')
+    f.write(str(data))
-- 
2.6.4
