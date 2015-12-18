Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DC81A1A1AFE
 for <openbmc@lists.ozlabs.org>; Sat, 19 Dec 2015 10:40:52 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450482046320281.8685453683887;
 Fri, 18 Dec 2015 15:40:46 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken <ken.sk.lai@mail.foxconn.com>
Subject: [PATCH skeleton 15/15] Add reset button
Date: Fri, 18 Dec 2015 17:40:35 -0600
Message-Id: <1450482035-4530-16-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Dec 2015 23:40:53 -0000

From: Ken <ken.sk.lai@mail.foxconn.com>

---
 Makefile                   |   6 +-
 bin/Barreleye.py           |   9 +++
 bin/chassis_control.py     |   6 ++
 objects/button_reset_obj.c | 179 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 199 insertions(+), 1 deletion(-)
 mode change 100644 => 100755 Makefile
 create mode 100755 objects/button_reset_obj.c

diff --git a/Makefile b/Makefile
old mode 100644
new mode 100755
index e3875ad..ea2dde2
--- a/Makefile
+++ b/Makefile
@@ -22,7 +22,7 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
 %.o: objects/pflash/libflash/%.c
 	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
 
-all: setup libopenbmc_intf power_control led_controller button_power control_host host_watchdog control_bmc board_vpd pcie_slot_present flash_bios flasher control_bmc_barreleye pflash hwmons_barreleye
+all: setup libopenbmc_intf power_control led_controller button_power button_reset control_host host_watchdog control_bmc board_vpd pcie_slot_present flash_bios flasher control_bmc_barreleye pflash hwmons_barreleye
 
 setup: 
 	mkdir -p obj lib
@@ -42,6 +42,10 @@ led_controller: led_controller.o gpio.o object_mapper.o libopenbmc_intf
 button_power: button_power_obj.o gpio.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/button_power_obj.o obj/gpio.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
+button_reset: button_reset_obj.o gpio.o object_mapper.o libopenbmc_intf
+	$(CC) -o bin/$@.exe obj/button_reset_obj.o obj/gpio.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
+
+
 control_host: control_host_obj.o gpio.o object_mapper.o libopenbmc_intf
 	$(CC) -o bin/$@.exe obj/gpio.o obj/control_host_obj.o obj/object_mapper.o $(LDFLAGS) $(LIBS)
 
diff --git a/bin/Barreleye.py b/bin/Barreleye.py
index 5d3d2b7..e8a90d0 100755
--- a/bin/Barreleye.py
+++ b/bin/Barreleye.py
@@ -141,6 +141,15 @@ APPS = {
 		'monitor_process' : True,
 		'process_name'    : 'button_power.exe',
 	},
+
+        'reset_button' : {
+                'system_state'    : 'BMC_STARTING',
+                'start_process'   : True,
+                'monitor_process' : True,
+                'process_name'    : 'button_reset.exe',
+        },
+
+
 	'led_control' : {
 		'system_state'    : 'BMC_STARTING',
 		'start_process'   : True,
diff --git a/bin/chassis_control.py b/bin/chassis_control.py
index 1981a82..27e9152 100755
--- a/bin/chassis_control.py
+++ b/bin/chassis_control.py
@@ -60,6 +60,9 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 		bus.add_signal_receiver(self.reset_button_signal_handler, 
 					dbus_interface = "org.openbmc.Button", signal_name = "PressedLong", 
 					path="/org/openbmc/buttons/power0" )
+		bus.add_signal_receiver(self.softreset_button_signal_handler, 
+					dbus_interface = "org.openbmc.Button", signal_name = "Released", 
+					path="/org/openbmc/buttons/reset0" )
 
     		bus.add_signal_receiver(self.host_watchdog_signal_handler, 
 					dbus_interface = "org.openbmc.Watchdog", signal_name = "WatchdogError")
@@ -179,6 +182,9 @@ class ChassisControlObject(Openbmc.DbusProperties,Openbmc.DbusObjectManager):
 
 	def reset_button_signal_handler(self):
 		self.reboot();
+
+	def softreset_button_signal_handler(self):
+		self.softReboot();
 		
 	def host_watchdog_signal_handler(self):
 		print "Watchdog Error, Hard Rebooting"
diff --git a/objects/button_reset_obj.c b/objects/button_reset_obj.c
new file mode 100755
index 0000000..759e83a
--- /dev/null
+++ b/objects/button_reset_obj.c
@@ -0,0 +1,179 @@
+#include <stdio.h>
+#include "interfaces/openbmc_intf.h"
+#include "gpio.h"
+#include "openbmc.h"
+#include "object_mapper.h"
+
+/* ---------------------------------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/buttons";
+static const gchar* instance_name = "reset0";
+static const gchar* dbus_name        = "org.openbmc.buttons.reset";
+static const int LONG_PRESS_SECONDS = 3;
+static GDBusObjectManagerServer *manager = NULL;
+
+//This object will use these GPIOs
+GPIO gpio_button    = (GPIO){ "RESET_BUTTON" };
+
+static gboolean
+on_is_on       (Button          *btn,
+                GDBusMethodInvocation  *invocation,
+                gpointer                user_data)
+{
+  gboolean btn_state=button_get_state(btn);
+  button_complete_is_on(btn,invocation,btn_state);
+  return TRUE;
+
+}
+
+static gboolean
+on_button_press       (Button          *btn,
+                GDBusMethodInvocation  *invocation,
+                gpointer                user_data)
+{
+	button_emit_pressed(btn);
+	button_complete_sim_press(btn,invocation);
+	return TRUE;
+}
+static gboolean
+on_button_interrupt( GIOChannel *channel,
+               GIOCondition condition,
+               gpointer user_data )
+{
+
+	GError *error = 0;
+	gsize bytes_read = 0;
+	gchar buf[2]; 
+	buf[1] = '\0';
+	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
+	GIOStatus rc = g_io_channel_read_chars( channel,
+                                            buf, 1,
+                                            &bytes_read,
+                                            &error );
+	printf("%s\n",buf);
+	
+	time_t current_time = time(NULL);
+	if (gpio_button.irq_inited)
+	{
+		Button* button = object_get_button((Object*)user_data);
+		if (buf[0] == '0')
+		{
+			printf("reset Button pressed\n");
+			button_emit_pressed(button);
+			button_set_timer(button,(long)current_time);
+		}
+		else
+		{
+			long press_time = current_time-button_get_timer(button);
+			printf("reset Button released, held for %ld seconds\n",press_time);
+			if (press_time > LONG_PRESS_SECONDS)
+			{
+				button_emit_pressed_long(button);
+			} else {
+				button_emit_released(button);
+			}
+		}
+	} 
+	else { gpio_button.irq_inited = true; }
+
+	return TRUE;
+}
+static void 
+on_bus_acquired (GDBusConnection *connection,
+                 const gchar     *name,
+                 gpointer         user_data)
+{
+	ObjectSkeleton *object;
+	//g_print ("Acquired a message bus connection: %s\n",name);
+ 	cmdline *cmd = user_data;
+  	manager = g_dbus_object_manager_server_new (dbus_object_path);
+  	int i=0;
+	gchar *s;
+	s = g_strdup_printf ("%s/%s",dbus_object_path,instance_name);
+	object = object_skeleton_new (s);
+	g_free (s);
+
+	Button* button = button_skeleton_new ();
+	object_skeleton_set_button (object, button);
+	g_object_unref (button);
+
+	ObjectMapper* mapper = object_mapper_skeleton_new ();
+	object_skeleton_set_object_mapper (object, mapper);
+	g_object_unref (mapper);
+
+	//define method callbacks
+	g_signal_connect (button,
+                   "handle-is-on",
+                   G_CALLBACK (on_is_on),
+                   NULL); /* user_data */
+	g_signal_connect (button,
+                    "handle-sim-press",
+                    G_CALLBACK (on_button_press),
+                    NULL); /* user_data */
+
+		
+	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
+	g_object_unref (object);
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection (manager, connection);
+
+	// get gpio device paths
+	int rc = GPIO_OK;
+	do {
+		rc = gpio_init(connection,&gpio_button);
+		if (rc != GPIO_OK) { break; }
+		rc = gpio_open_interrupt(&gpio_button,on_button_interrupt,object);
+		if (rc != GPIO_OK) { break; }
+	} while(0);
+	if (rc != GPIO_OK)
+	{
+		printf("ERROR PowerButton: GPIO setup (rc=%d)\n",rc);
+	}
+	emit_object_added((GDBusObjectManager*)manager); 
+}
+
+static void
+on_name_acquired (GDBusConnection *connection,
+                  const gchar     *name,
+                  gpointer         user_data)
+{
+}
+
+static void
+on_name_lost (GDBusConnection *connection,
+              const gchar     *name,
+              gpointer         user_data)
+{
+}
+
+
+gint
+main (gint argc, gchar *argv[])
+{
+  GMainLoop *loop;
+
+  cmdline cmd;
+  cmd.argc = argc;
+  cmd.argv = argv;
+
+  guint id;
+  loop = g_main_loop_new (NULL, FALSE);
+
+  id = g_bus_own_name (DBUS_TYPE,
+                       dbus_name,
+                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
+                       on_bus_acquired,
+                       on_name_acquired,
+                       on_name_lost,
+                       &cmd,
+                       NULL);
+
+  g_main_loop_run (loop);
+  
+  g_bus_unown_name (id);
+  g_main_loop_unref (loop);
+  return 0;
+}
+
-- 
2.6.3
