Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 10B411A0129
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jan 2016 09:50:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454107832616727.7310567214142;
 Fri, 29 Jan 2016 14:50:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-settingsd] Move settings to c code
Date: Fri, 29 Jan 2016 16:50:31 -0600
Message-Id: <1454107831-18878-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454107831-18878-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454107831-18878-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 29 Jan 2016 22:50:38 -0000

From: Chris Austen <austenc@us.ibm.com>

This gets the boot_list and PowerCap settings exposed
on the dbus.

Examples of how to now interact...
$ curl -c cjar -b cjar -k https://x.x.x.x/org/openbmc/settings/host0
{
  "data": {
    "boot_mode_list": [
      "Default",
      "Network",
      "Disk",
      "Safe",
      "CDROM",
      "Setup"
    ],
    "current_boot_mode": "Default",
    "power_cap_default": 999,
    "power_cap_max": 1000,
    "power_cap_min": 1,
    "power_cap_now": 998
  },
  "message": "200 OK",
  "status": "ok"
}
View a single property
curl -c cjar -b cjar -k https://192.168.7.2/org/openbmc/settings/host0/attr/Current_boot_mode
Make the Network the current boot device
curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": [\"CDROM\"]}" https://x.x.x.x/org/openbmc/settings/host0/action/setBootMode
Set the powercap to 42
curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": [42]}" https://x.x.x.x/org/openbmc/settings/host0/action/setPowerCap
---
 Makefile            |  22 ++++++
 settings_file.py    |   2 -
 settings_manager.c  | 206 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 settings_manager.py |  87 ----------------------
 settings_parser.py  |  20 -----
 5 files changed, 228 insertions(+), 109 deletions(-)
 create mode 100644 Makefile
 delete mode 100644 settings_file.py
 create mode 100644 settings_manager.c
 delete mode 100755 settings_manager.py
 delete mode 100755 settings_parser.py

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..5d00300
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,22 @@
+
+EXE     = settings_manager
+
+OBJS    = $(EXE).o   \
+
+
+DEPPKGS = libsystemd
+CC      ?= $(CROSS_COMPILE)gcc
+INCLUDES += $(shell pkg-config --cflags $(DEPPKGS)) 
+LIBS += $(shell pkg-config --libs $(DEPPKGS))
+CFLAGS += -Wall
+
+all: $(EXE)
+
+%.o : %.c 
+	$(CC) -c $< $(CFLAGS) $(INCLUDES) -o $@
+
+$(EXE): $(OBJS)
+	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
+
+clean:
+	rm -f $(OBJS) $(EXE) *.o 
diff --git a/settings_file.py b/settings_file.py
deleted file mode 100644
index e05bc31..0000000
--- a/settings_file.py
+++ /dev/null
@@ -1,2 +0,0 @@
-#!/usr/bin/python -u
-SETTINGS={'host': {'bootflags': {'default': '0000000000', 'type': 's', 'name': 'boot_flags'}, 'powercap': {'name': 'power_cap', 'min': 0, 'default': 0, 'max': 1000, 'type': 'i', 'unit': 'watts'}, 'sysstate': {'default': '', 'type': 's', 'name': 'system_state'}}}
\ No newline at end of file
diff --git a/settings_manager.c b/settings_manager.c
new file mode 100644
index 0000000..7125cb8
--- /dev/null
+++ b/settings_manager.c
@@ -0,0 +1,206 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <stddef.h>
+#include <systemd/sd-bus.h>
+
+const char *gService = "org.openbmc.settings.Host";
+const char *gObjPath = "/org/openbmc/settings/host0";
+const char *gIntPath = "org.openbmc.Settings";
+
+
+typedef struct _settings_t {
+    char*   currentBootMode;
+    int32_t powercap;
+    int32_t powercap_min;
+    int32_t powercap_max;
+    int32_t powercap_default;
+} settings_t;
+
+#define MAX_BOOT_MODES 6
+char gPossibleBootModes[MAX_BOOT_MODES][10] = {
+    "Default",
+    "Network",
+    "Disk",
+    "Safe",
+    "CDROM",
+    "Setup"
+};
+
+static int method_boot_mode_list(sd_bus *bus,
+                          const char *path,
+                          const char *interface,
+                          const char *property,
+                          sd_bus_message *reply,
+                          void *userdata,
+                          sd_bus_error *error) {
+
+    int r, i=0;
+
+    printf("Building boot mode list\n");
+
+    r = sd_bus_message_open_container(reply, 'a', "s");
+    if (r < 0)
+        return r;
+
+    for (i=0;i<MAX_BOOT_MODES;i++) {
+        r = sd_bus_message_append(reply, "s", gPossibleBootModes[i]);
+        if (r < 0) {
+            fprintf(stderr, "Failed to build the list of failed boot modes: %s", strerror(-r));
+            return r;
+        }
+    }
+
+    return sd_bus_message_close_container(reply);
+}
+
+static int method_setBootMode(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
+
+    int i, r=-1;
+    char *str;
+    settings_t *settings = (settings_t *) userdata;
+
+    printf("Setting boot mode list\n");
+
+    r = sd_bus_message_read(m, "s", &str);
+    if (r < 0) {
+        fprintf(stderr, "Failed to extract string: %s", strerror(-r));
+        goto final;
+    } 
+
+    for (i=0;i<MAX_BOOT_MODES;i++) {
+        if(!strcmp(gPossibleBootModes[i], str)) {
+            settings->currentBootMode = &gPossibleBootModes[i][0];
+            break;
+        }
+    }
+
+    if (i == MAX_BOOT_MODES) {
+        // Getting here means string of what 
+        // they wanted did not map to anything
+        r = -1;
+    }
+
+    final:
+    return sd_bus_reply_method_return(m, "i", r);
+}
+
+
+static int method_setPowerCap(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
+
+    int r;
+    int32_t  pcap;
+    settings_t *settings = (settings_t *) userdata;
+
+    printf("Setting Power Cap\n");
+
+    r = sd_bus_message_read(m, "i", &pcap);
+    if (r < 0) {
+        fprintf(stderr, "Failed to extract data: %s", strerror(-r));
+    }  else {
+
+        if ((pcap <= settings->powercap_max) &&
+            (pcap >= settings->powercap_min)) {
+                settings->powercap = pcap;
+        } else {
+            return sd_bus_reply_method_error(m,&SD_BUS_ERROR_MAKE_CONST( \
+                SD_BUS_ERROR_INVALID_ARGS,                               \
+                "value not supported"));
+        }
+    }
+
+    return sd_bus_reply_method_return(m, "i", r);
+}
+
+static const sd_bus_vtable vtable[] = {
+    SD_BUS_VTABLE_START(0),
+    SD_BUS_METHOD("setBootMode", "s", "i", method_setBootMode, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_METHOD("setPowerCap", "i", "i", method_setPowerCap, SD_BUS_VTABLE_UNPRIVILEGED),
+    SD_BUS_PROPERTY("current_boot_mode", "s", NULL, offsetof(settings_t, currentBootMode), SD_BUS_VTABLE_PROPERTY_CONST),
+    SD_BUS_PROPERTY("boot_mode_list", "as", method_boot_mode_list, 0, SD_BUS_VTABLE_PROPERTY_CONST),
+    SD_BUS_PROPERTY("power_cap_now",     "i", NULL, offsetof(settings_t, powercap), SD_BUS_VTABLE_PROPERTY_CONST),
+    SD_BUS_PROPERTY("power_cap_min",     "i", NULL, offsetof(settings_t, powercap_min), SD_BUS_VTABLE_PROPERTY_CONST),
+    SD_BUS_PROPERTY("power_cap_max",     "i", NULL, offsetof(settings_t, powercap_max), SD_BUS_VTABLE_PROPERTY_CONST),
+    SD_BUS_PROPERTY("power_cap_default", "i", NULL, offsetof(settings_t, powercap_default), SD_BUS_VTABLE_PROPERTY_CONST),
+    SD_BUS_VTABLE_END
+};
+
+
+void init_settings(settings_t *p) {
+
+    // Someday there will be a file that the defaults can come from
+    // This stuff for now is completely fake and doesn't do anything.
+    // Simply the place holder to make it easier for the pcap to be
+    // set
+    settings_t t = { 
+        gPossibleBootModes[0],
+        998, 1, 1000, 999
+    };
+
+    memcpy(p,&t,sizeof(settings_t));
+
+    return;
+}
+
+int start_HostSettingsService(void) {
+
+    sd_bus *bus;
+    sd_bus_slot *slot;
+    int r;
+    settings_t settings;
+
+    init_settings(&settings);
+
+    r = sd_bus_open_system(&bus);
+    if (r < 0) {
+        fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+        goto finish;
+    }
+
+    /* Install the object */
+    r = sd_bus_add_object_vtable(bus,
+                                 &slot,
+                                 gObjPath,
+                                 gIntPath,
+                                 vtable,
+                                 &settings);
+    if (r < 0) {
+        fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
+        goto finish;
+    }
+    
+    /* Take a well-known service name so that clients can find us */
+    r = sd_bus_request_name(bus, gService, 0);
+    if (r < 0) {
+        fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
+        goto finish;
+    }
+
+
+    for (;;) {
+        r = sd_bus_process(bus, NULL);
+        if (r < 0) {
+            fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
+            goto finish;
+        }
+
+        if (r > 0)
+            continue;       
+
+        r = sd_bus_wait(bus, (uint64_t) -1);
+        if (r < 0) {
+            fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
+            goto finish;
+        }
+    }
+    finish:
+        sd_bus_unref(bus);
+
+    return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
+
+int main(int argc, char *argv[]) {
+
+    return start_HostSettingsService();
+}
\ No newline at end of file
diff --git a/settings_manager.py b/settings_manager.py
deleted file mode 100755
index e49b466..0000000
--- a/settings_manager.py
+++ /dev/null
@@ -1,87 +0,0 @@
-#!/usr/bin/python -u
-
-import gobject
-import dbus
-import dbus.service
-import dbus.mainloop.glib
-import os
-import os.path as path
-import Openbmc
-import settings_file as s
-
-DBUS_NAME = 'org.openbmc.settings.Host'
-OBJ_NAME = '/org/openbmc/settings/host0'
-CONTROL_INTF = 'org.openbmc.Settings'
-
-class HostSettingsObject(Openbmc.DbusProperties):
-    def __init__(self, bus, name, settings, path):
-        Openbmc.DbusProperties.__init__(self)
-        dbus.service.Object.__init__(self, bus, name)
-
-        self.path = path
-        if not os.path.exists(path):
-            os.mkdir(path)
-
-        # Listen to changes in the property values and sync them to the BMC
-        bus.add_signal_receiver(self.settings_signal_handler,
-            dbus_interface = "org.freedesktop.DBus.Properties",
-            signal_name = "PropertiesChanged",
-            path = "/org/openbmc/settings/host0")
-
-        # Create the dbus properties
-        for i in settings['host'].iterkeys():
-            shk = settings['host'][i]
-            self.set_settings_property(shk['name'],
-                                       shk['type'],
-                                       shk['default'])
-
-    def get_bmc_value(self, name):
-        try:
-            with open(path.join(self.path, name), 'r') as f:
-                return f.read()
-        except (IOError):
-            pass
-        return None
-
-    # Create dbus properties based on bmc value. This will be either a value
-    # previously set, or the default file value if the BMC value does not exist.
-    def set_settings_property(self, name, type, value):
-        bmcv = self.get_bmc_value(name)
-        if bmcv:
-            value = bmcv
-        if type=="i":
-            self.Set(DBUS_NAME, name, value)
-        elif type=="s":
-            self.Set(DBUS_NAME, name, str(value))
-
-    # Save the settings to the BMC. This will write the settings value in
-    # individual files named by the property name to the BMC.
-    def set_system_settings(self, name, value):
-        bmcv = self.get_bmc_value(name)
-        if bmcv != value:
-            filepath = path.join(self.path, name)
-            with open(filepath, 'w') as f:
-                f.write(str(value))
-
-    # Signal handler for when one ore more settings properties were updated.
-    # This will sync the changes to the BMC.
-    def settings_signal_handler(self, interface_name, changed_properties, invalidated_properties):
-        for name, value in changed_properties.items():
-            self.set_system_settings(name, value)
-
-    # Placeholder signal. Needed to register the settings interface.
-    @dbus.service.signal(DBUS_NAME, signature='s')
-    def SettingsUpdated(self, sname):
-        pass
-
-if __name__ == '__main__':
-    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
-
-    bus = Openbmc.getDBus()
-    name = dbus.service.BusName(DBUS_NAME, bus)
-    obj = HostSettingsObject(bus, OBJ_NAME, s.SETTINGS, "/var/lib/obmc/")
-    mainloop = gobject.MainLoop()
-
-    print "Running HostSettingsService"
-    mainloop.run()
-
diff --git a/settings_parser.py b/settings_parser.py
deleted file mode 100755
index 46bb474..0000000
--- a/settings_parser.py
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/usr/bin/python -u
-
-# Simple parser to create a python dictionary from a yaml file.
-# It saves the applications from doing the parsing and
-# adding dependencies to additional modules like yaml
-
-import yaml
-
-SETTINGS_FILE = 'settings.yaml'
-OUTPUT_FILE = 'settings_file.py'
-FILE_HEADER = '#!/usr/bin/python -u'
-
-with open(SETTINGS_FILE) as s:
-    data = yaml.safe_load(s)
-
-with open(OUTPUT_FILE, 'w') as f:
-    f.write(FILE_HEADER)
-    f.write('\n')
-    f.write('SETTINGS=')
-    f.write(str(data))
-- 
2.6.4
