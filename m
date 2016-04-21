Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qrLX767JZzDqfV
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2016 00:21:11 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461248462841852.9076798798591;
 Thu, 21 Apr 2016 07:21:02 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH skeleton v2 5/5] Remove custom org.openbmc.Object.ObjectMapper
Date: Thu, 21 Apr 2016 09:20:53 -0500
Message-Id: <1461248453-8652-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461248453-8652-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461248453-8652-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 21 Apr 2016 14:21:12 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Use the standard freedesktop ObjectManager interface.

Moved gdbus OM export calls to the correct place so these
signals are emitted as expected by system_manager.py.
Python apps that use pyobmc are already emitting these
correctly.

Change system_manager.py to watch for the freedesktop
signal rather than the custom one.

Added an sd_bus OM to led_controller.
---
 Makefile                    | 28 ++++++++++++++--------------
 bin/system_manager.py       |  4 ++--
 includes/object_mapper.c    | 31 -------------------------------
 includes/object_mapper.h    | 10 ----------
 objects/button_power_obj.c  | 10 +---------
 objects/button_reset_obj.c  | 10 +---------
 objects/control_host_obj.c  | 10 +---------
 objects/fan_generic_obj.c   | 10 +---------
 objects/flash_bios_obj.c    |  9 +--------
 objects/host_watchdog_obj.c | 10 +---------
 objects/hwmons_barreleye.c  |  9 +--------
 objects/hwmons_palmetto.c   |  9 +--------
 objects/led_controller.c    | 28 +++++++++++++++++++++++++---
 objects/power_control_obj.c | 10 +---------
 14 files changed, 50 insertions(+), 138 deletions(-)
 delete mode 100644 includes/object_mapper.c
 delete mode 100644 includes/object_mapper.h

diff --git a/Makefile b/Makefile
index 8a88a37..7129082 100755
--- a/Makefile
+++ b/Makefile
@@ -35,27 +35,27 @@ clean:
 libopenbmc_intf: openbmc_intf.o
 	$(CC) -shared -o lib/$@.so obj/openbmc_intf.o $(LDFLAGS)
 
-power_control: power_control_obj.o gpio.o object_mapper.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/gpio.o obj/power_control_obj.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
+power_control: power_control_obj.o gpio.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/gpio.o obj/power_control_obj.o $(LDFLAGS) $(LIBS)
 
 led_controller: led_controller.o
 	$(CC) -o bin/$@.exe obj/led_controller.o $(LDFLAGS) $(LIB_FLAG)
 
-button_power: button_power_obj.o gpio.o object_mapper.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
+button_power: button_power_obj.o gpio.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o $(LDFLAGS) $(LIBS)
 
-button_reset: button_reset_obj.o gpio.o object_mapper.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/button_reset_obj.o obj/gpio.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
+button_reset: button_reset_obj.o gpio.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/button_reset_obj.o obj/gpio.o $(LDFLAGS) $(LIBS)
 
 
-control_host: control_host_obj.o gpio.o object_mapper.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/gpio.o obj/control_host_obj.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
+control_host: control_host_obj.o gpio.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/gpio.o obj/control_host_obj.o $(LDFLAGS) $(LIBS)
 
-flash_bios:  flash_bios_obj.o object_mapper.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/flash_bios_obj.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
+flash_bios:  flash_bios_obj.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/flash_bios_obj.o $(LDFLAGS) $(LIBS)
 
-host_watchdog: host_watchdog_obj.o object_mapper.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/host_watchdog_obj.o obj/object_mapper.o  $(LDFLAGS) $(LIBS)
+host_watchdog: host_watchdog_obj.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/host_watchdog_obj.o $(LDFLAGS) $(LIBS)
 
 board_vpd: board_vpd_obj.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/board_vpd_obj.o $(LDFLAGS) $(LIBS)
@@ -69,8 +69,8 @@ flasher:  $(OBJS2) flasher_obj.o libopenbmc_intf
 pflash:  $(OBJS2) pflash.o
 	$(CC) -o bin/$@ obj/pflash.o $(OBJS3) $(LDFLAGS)
 
-hwmons_barreleye: hwmons_barreleye.o object_mapper.o libopenbmc_intf
-	$(CC) -o bin/$@.exe obj/hwmons_barreleye.o obj/object_mapper.o  $(LDFLAGS) $(LIBS)
+hwmons_barreleye: hwmons_barreleye.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/hwmons_barreleye.o $(LDFLAGS) $(LIBS)
 
 control_bmc: control_bmc_obj.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/control_bmc_obj.o $(LDFLAGS) $(LIBS)
diff --git a/bin/system_manager.py b/bin/system_manager.py
index 004d978..e74788a 100755
--- a/bin/system_manager.py
+++ b/bin/system_manager.py
@@ -34,7 +34,7 @@ class SystemManager(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		dbus.service.Object.__init__(self,bus,obj_name)
 
 		bus.add_signal_receiver(self.NewObjectHandler,
-			signal_name = "ObjectAdded", sender_keyword = 'bus_name')
+			signal_name = "InterfacesAdded", sender_keyword = 'bus_name')
 		bus.add_signal_receiver(self.SystemStateHandler,signal_name = "GotoSystemState")
 
 		self.Set(DBUS_NAME,"current_state","")
@@ -173,7 +173,7 @@ class SystemManager(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 	
 		return True
 
-	def NewObjectHandler(self,obj_path, interface_name, bus_name = None):
+	def NewObjectHandler(self, obj_path, iprops, bus_name = None):
 		current_state = self.Get(DBUS_NAME,"current_state")
 		if (self.bus_name_lookup.has_key(obj_path)):
 			if (self.bus_name_lookup[obj_path] == bus_name):
diff --git a/includes/object_mapper.c b/includes/object_mapper.c
deleted file mode 100644
index 1164251..0000000
--- a/includes/object_mapper.c
+++ /dev/null
@@ -1,31 +0,0 @@
-#include "object_mapper.h"
-
-
-void
-emit_object_added(GDBusObjectManager *manager)
-{
-    GList *objects;
-    GList *l;
-
-    objects = g_dbus_object_manager_get_objects(manager);
-    for (l = objects; l != NULL; l = l->next)
-    {
-        GDBusObject *object = l->data;
-	ObjectMapper* map = object_get_object_mapper((Object*)object);
-
-        GList *interfaces;
-        GList *ll;
-	const gchar *object_path = g_dbus_object_get_object_path(G_DBUS_OBJECT(object));
-
-        interfaces = g_dbus_object_get_interfaces(G_DBUS_OBJECT(object));
-        for (ll = interfaces; ll != NULL; ll = ll->next)
-        {
-            GDBusInterface *interface = G_DBUS_INTERFACE(ll->data);
-            object_mapper_emit_object_added(map,object_path,
-		g_dbus_interface_get_info(interface)->name);
-        }
-        g_list_free_full(interfaces, g_object_unref);
-    }
-    g_list_free_full(objects, g_object_unref);
-}
-
diff --git a/includes/object_mapper.h b/includes/object_mapper.h
deleted file mode 100644
index b0a97a7..0000000
--- a/includes/object_mapper.h
+++ /dev/null
@@ -1,10 +0,0 @@
-#ifndef __OBJECTMAPPER2_H__
-#define __OBJECTMAPPER2_H__
-
-#include "interfaces/openbmc_intf.h"
-
-
-void emit_object_added(GDBusObjectManager*);
-
-
-#endif
diff --git a/objects/button_power_obj.c b/objects/button_power_obj.c
index 8c5ebb8..e093a00 100644
--- a/objects/button_power_obj.c
+++ b/objects/button_power_obj.c
@@ -2,7 +2,6 @@
 #include "interfaces/openbmc_intf.h"
 #include "gpio.h"
 #include "openbmc.h"
-#include "object_mapper.h"
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/buttons";
@@ -94,10 +93,6 @@ on_bus_acquired(GDBusConnection *connection,
 	object_skeleton_set_button(object, button);
 	g_object_unref(button);
 
-	ObjectMapper* mapper = object_mapper_skeleton_new();
-	object_skeleton_set_object_mapper(object, mapper);
-	g_object_unref(mapper);
-
 	//define method callbacks
 	g_signal_connect(button,
 			"handle-is-on",
@@ -110,12 +105,10 @@ on_bus_acquired(GDBusConnection *connection,
 
 
 	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_set_connection(manager, connection);
 	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
 	g_object_unref(object);
 
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection(manager, connection);
-
 	// get gpio device paths
 	int rc = GPIO_OK;
 	do {
@@ -128,7 +121,6 @@ on_bus_acquired(GDBusConnection *connection,
 	{
 		printf("ERROR PowerButton: GPIO setup (rc=%d)\n",rc);
 	}
-	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
diff --git a/objects/button_reset_obj.c b/objects/button_reset_obj.c
index 7fdad40..a9321e3 100644
--- a/objects/button_reset_obj.c
+++ b/objects/button_reset_obj.c
@@ -2,7 +2,6 @@
 #include "interfaces/openbmc_intf.h"
 #include "gpio.h"
 #include "openbmc.h"
-#include "object_mapper.h"
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/buttons";
@@ -94,10 +93,6 @@ on_bus_acquired(GDBusConnection *connection,
 	object_skeleton_set_button(object, button);
 	g_object_unref(button);
 
-	ObjectMapper* mapper = object_mapper_skeleton_new();
-	object_skeleton_set_object_mapper(object, mapper);
-	g_object_unref(mapper);
-
 	//define method callbacks
 	g_signal_connect(button,
 			"handle-is-on",
@@ -110,12 +105,10 @@ on_bus_acquired(GDBusConnection *connection,
 
 
 	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_set_connection(manager, connection);
 	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
 	g_object_unref(object);
 
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection(manager, connection);
-
 	// get gpio device paths
 	int rc = GPIO_OK;
 	do {
@@ -128,7 +121,6 @@ on_bus_acquired(GDBusConnection *connection,
 	{
 		printf("ERROR PowerButton: GPIO setup (rc=%d)\n",rc);
 	}
-	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
diff --git a/objects/control_host_obj.c b/objects/control_host_obj.c
index e8d1745..9253007 100644
--- a/objects/control_host_obj.c
+++ b/objects/control_host_obj.c
@@ -8,7 +8,6 @@
 #include "interfaces/openbmc_intf.h"
 #include "openbmc.h"
 #include "gpio.h"
-#include "object_mapper.h"
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/control";
@@ -197,10 +196,6 @@ on_bus_acquired(GDBusConnection *connection,
 	object_skeleton_set_control(object, control);
 	g_object_unref(control);
 
-	ObjectMapper* mapper = object_mapper_skeleton_new();
-	object_skeleton_set_object_mapper(object, mapper);
-	g_object_unref(mapper);
-
 	//define method callbacks here
 	g_signal_connect(control_host,
 			"handle-boot",
@@ -215,18 +210,15 @@ on_bus_acquired(GDBusConnection *connection,
 	control_host_set_flash_side(control_host,"primary");
 
 	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_set_connection(manager, connection);
 	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
 	g_object_unref(object);
 
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection(manager, connection);
-
 	gpio_init(connection,&fsi_data);
 	gpio_init(connection,&fsi_clk);
 	gpio_init(connection,&fsi_enable);
 	gpio_init(connection,&cronus_sel);
 	gpio_init(connection,&Throttle);
-	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
diff --git a/objects/fan_generic_obj.c b/objects/fan_generic_obj.c
index 72bfb11..61083ae 100644
--- a/objects/fan_generic_obj.c
+++ b/objects/fan_generic_obj.c
@@ -1,6 +1,5 @@
 #include "interfaces/openbmc_intf.h"
 #include "openbmc.h"
-#include "object_mapper.h"
 
 /* ------------------------------------------------------------------------- */
 
@@ -64,10 +63,6 @@ on_bus_acquired(GDBusConnection *connection,
 		object_skeleton_set_fan(object, fan);
 		g_object_unref(fan);
 
-		ObjectMapper* mapper = object_mapper_skeleton_new();
-		object_skeleton_set_object_mapper(object, mapper);
-		g_object_unref(mapper);
-
 		//define method callbacks here
 		g_signal_connect(fan,
 				"handle-get-speed",
@@ -81,13 +76,10 @@ on_bus_acquired(GDBusConnection *connection,
 		//g_timeout_add(poll_interval, poll_sensor, object);
 
 		/* Export the object (@manager takes its own reference to @object) */
+		g_dbus_object_manager_server_set_connection(manager, connection);
 		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
 		g_object_unref(object);
 	}
-
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection(manager, connection);
-	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
diff --git a/objects/flash_bios_obj.c b/objects/flash_bios_obj.c
index a3f7ac4..f865be1 100644
--- a/objects/flash_bios_obj.c
+++ b/objects/flash_bios_obj.c
@@ -5,7 +5,6 @@
 #include <sys/types.h>
 #include "interfaces/openbmc_intf.h"
 #include "openbmc.h"
-#include "object_mapper.h"
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/control/flash";
@@ -275,10 +274,6 @@ on_bus_acquired(GDBusConnection *connection,
 		object_skeleton_set_shared_resource(object, lock);
 		g_object_unref(lock);
 
-		ObjectMapper* mapper = object_mapper_skeleton_new();
-		object_skeleton_set_object_mapper(object, mapper);
-		g_object_unref(mapper);
-
 		shared_resource_set_lock(lock,false);
 		shared_resource_set_name(lock,"");
 
@@ -344,13 +339,11 @@ on_bus_acquired(GDBusConnection *connection,
 
 		flash_set_filename(flash,"");
 		/* Export the object (@manager takes its own reference to @object) */
+		g_dbus_object_manager_server_set_connection(manager, connection);
 		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
 		g_object_unref(object);
 	}
 	g_free(flasher_file);
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection(manager, connection);
-	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
diff --git a/objects/host_watchdog_obj.c b/objects/host_watchdog_obj.c
index 2e0ef15..e922dc3 100644
--- a/objects/host_watchdog_obj.c
+++ b/objects/host_watchdog_obj.c
@@ -1,6 +1,5 @@
 #include "interfaces/openbmc_intf.h"
 #include "openbmc.h"
-#include "object_mapper.h"
 
 /* ------------------------------------------------------------------------- */
 
@@ -105,10 +104,6 @@ on_bus_acquired(GDBusConnection *connection,
 	object_skeleton_set_watchdog(object, wd);
 	g_object_unref(wd);
 
-	ObjectMapper* mapper = object_mapper_skeleton_new();
-	object_skeleton_set_object_mapper(object, mapper);
-	g_object_unref(mapper);
-
 	// set properties
 	watchdog_set_watchdog(wd,1);
 
@@ -134,12 +129,9 @@ on_bus_acquired(GDBusConnection *connection,
 			object); /* user_data */
 
 	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_set_connection(manager, connection);
 	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
 	g_object_unref(object);
-
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection(manager, connection);
-	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
diff --git a/objects/hwmons_barreleye.c b/objects/hwmons_barreleye.c
index 0057af4..07717cf 100644
--- a/objects/hwmons_barreleye.c
+++ b/objects/hwmons_barreleye.c
@@ -4,7 +4,6 @@
 #include <fcntl.h>
 #include "openbmc.h"
 #include "gpio.h"
-#include "object_mapper.h"
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/sensors";
@@ -149,10 +148,6 @@ on_bus_acquired(GDBusConnection *connection,
 		object_skeleton_set_sensor_value(object, sensor);
 		g_object_unref(sensor);
 
-		ObjectMapper* mapper = object_mapper_skeleton_new();
-		object_skeleton_set_object_mapper(object, mapper);
-		g_object_unref(mapper);
-
 		hwmon_set_sysfs_path(hwmon,hwmons[i].filename);
 		hwmon_set_scale(hwmon,hwmons[i].scale);
 		sensor_value_set_units(sensor,hwmons[i].units);
@@ -168,12 +163,10 @@ on_bus_acquired(GDBusConnection *connection,
 			g_timeout_add(hwmons[i].poll_interval, poll_hwmon, object);
 		}
 		/* Export the object (@manager takes its own reference to @object) */
+		g_dbus_object_manager_server_set_connection(manager, connection);
 		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
 		g_object_unref(object);
 	}
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection(manager, connection);
-	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
diff --git a/objects/hwmons_palmetto.c b/objects/hwmons_palmetto.c
index c627d27..7d76c91 100644
--- a/objects/hwmons_palmetto.c
+++ b/objects/hwmons_palmetto.c
@@ -3,7 +3,6 @@
 #include <fcntl.h>
 #include "openbmc.h"
 #include "gpio.h"
-#include "object_mapper.h"
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/sensors";
@@ -144,10 +143,6 @@ on_bus_acquired(GDBusConnection *connection,
 		object_skeleton_set_sensor_value(object, sensor);
 		g_object_unref(sensor);
 
-		ObjectMapper* mapper = object_mapper_skeleton_new();
-		object_skeleton_set_object_mapper(object, mapper);
-		g_object_unref(mapper);
-
 		hwmon_set_sysfs_path(hwmon,hwmons[i].filename);
 		hwmon_set_scale(hwmon,hwmons[i].scale);
 		sensor_value_set_units(sensor,hwmons[i].units);
@@ -163,12 +158,10 @@ on_bus_acquired(GDBusConnection *connection,
 			g_timeout_add(hwmons[i].poll_interval, poll_hwmon, object);
 		}
 		/* Export the object (@manager takes its own reference to @object) */
+		g_dbus_object_manager_server_set_connection(manager, connection);
 		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
 		g_object_unref(object);
 	}
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection(manager, connection);
-	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
diff --git a/objects/led_controller.c b/objects/led_controller.c
index 96e7ad1..9eda9ee 100644
--- a/objects/led_controller.c
+++ b/objects/led_controller.c
@@ -431,6 +431,8 @@ led_select(const struct dirent *entry)
 int
 start_led_services()
 {
+	static const char *led_dbus_root = "/org/openbmc/control/led";
+
 	/* Generic error reporter. */
 	int rc = -1;
 	int num_leds = 0;
@@ -462,6 +464,17 @@ start_led_services()
 		return rc;
 	}
 
+	/* Install a freedesktop object manager */
+	rc = sd_bus_add_object_manager(bus_type, NULL, led_dbus_root);
+	if(rc < 0) {
+		fprintf(stderr, "Failed to add object to dbus: %s\n",
+				strerror(-rc));
+
+		sd_bus_slot_unref(led_slot);
+		sd_bus_unref(bus_type);
+		return rc;
+	}
+
 	/* Fully qualified Dbus object for a particular LED */
 	char led_object[128] = {0};
 	int len = 0;
@@ -471,8 +484,8 @@ start_led_services()
 	{
 		memset(led_object, 0x0, sizeof(led_object));
 
-		len = snprintf(led_object, sizeof(led_object), "%s%s",
-				"/org/openbmc/control/led/", led_list[num_leds]->d_name);
+		len = snprintf(led_object, sizeof(led_object), "%s%s%s",
+				led_dbus_root, "/", led_list[num_leds]->d_name);
 
 		if(len >= sizeof(led_object))
 		{
@@ -494,6 +507,15 @@ start_led_services()
 			fprintf(stderr, "Failed to add object to dbus: %s\n", strerror(-rc));
 			break;
 		}
+
+		rc = sd_bus_emit_object_added(bus_type, led_object);
+
+		if(rc < 0)
+		{
+			fprintf(stderr, "Failed to emit InterfacesAdded "
+					"signal: %s\n", strerror(-rc));
+			break;
+		}
 	}
 
 	/* Done with all registration. */
@@ -504,7 +526,7 @@ start_led_services()
 	free(led_list);
 
 	/* If we had success in adding the providers, request for a bus name. */
-	if(rc == 0)
+	if(rc >= 0)
 	{
 		/* Take one in OpenBmc */
 		rc = sd_bus_request_name(bus_type, "org.openbmc.control.led", 0);
diff --git a/objects/power_control_obj.c b/objects/power_control_obj.c
index da69413..85a8cff 100644
--- a/objects/power_control_obj.c
+++ b/objects/power_control_obj.c
@@ -10,7 +10,6 @@
 #include "interfaces/openbmc_intf.h"
 #include "openbmc.h"
 #include "gpio.h"
-#include "object_mapper.h"
 
 /* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/control";
@@ -202,10 +201,6 @@ on_bus_acquired(GDBusConnection *connection,
 	object_skeleton_set_control(object, control);
 	g_object_unref(control);
 
-	ObjectMapper* mapper = object_mapper_skeleton_new();
-	object_skeleton_set_object_mapper(object, mapper);
-	g_object_unref(mapper);
-
 	//define method callbacks here
 	g_signal_connect(control_power,
 			"handle-set-power-state",
@@ -224,12 +219,10 @@ on_bus_acquired(GDBusConnection *connection,
 
 
 	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_set_connection(manager, connection);
 	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
 	g_object_unref(object);
 
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection(manager, connection);
-
 	// get gpio device paths
 	int rc = GPIO_OK;
 	do {
@@ -268,7 +261,6 @@ on_bus_acquired(GDBusConnection *connection,
 		control_power_set_pgood_timeout(control_power,pgood_timeout);
 		g_timeout_add(poll_interval, poll_pgood, object);
 	}
-	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
-- 
2.8.1
