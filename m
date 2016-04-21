Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qrLX26XPrzDqfb
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2016 00:21:06 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461248459646280.2765030329872;
 Thu, 21 Apr 2016 07:20:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH skeleton v2 3/5] Whitespace fixes for objects/*.c
Date: Thu, 21 Apr 2016 09:20:51 -0500
Message-Id: <1461248453-8652-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461248453-8652-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461248453-8652-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailman-Approved-At: Fri, 29 Apr 2016 02:27:07 +1000
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
X-List-Received-Date: Thu, 21 Apr 2016 14:21:08 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

No functional changes.
gg=G
set ff=unix
removed trailing whitespace
remove executable perms
---
 objects/board_vpd_obj.c         |  120 ++---
 objects/button_power_obj.c      |  355 +++++++------
 objects/button_reset_obj.c      |  180 ++++---
 objects/control_bmc_barreleye.c |  496 +++++++++---------
 objects/control_bmc_obj.c       |  445 ++++++++--------
 objects/control_host_obj.c      |  549 ++++++++++----------
 objects/fan_generic_obj.c       |  271 +++++-----
 objects/flash_bios_obj.c        |  896 ++++++++++++++++----------------
 objects/flasher_obj.c           |  921 ++++++++++++++++----------------
 objects/host_watchdog_obj.c     |  372 ++++++-------
 objects/hwmons_barreleye.c      |  441 ++++++++--------
 objects/hwmons_palmetto.c       |  429 ++++++++-------
 objects/led_controller.c        | 1097 ++++++++++++++++++++-------------------
 objects/pcie_slot_present_obj.c |  331 ++++++------
 objects/power_control_obj.c     |  644 ++++++++++++-----------
 15 files changed, 3778 insertions(+), 3769 deletions(-)
 mode change 100755 => 100644 objects/button_reset_obj.c
 mode change 100755 => 100644 objects/control_host_obj.c
 mode change 100755 => 100644 objects/led_controller.c

diff --git a/objects/board_vpd_obj.c b/objects/board_vpd_obj.c
index 217148b..a6576db 100644
--- a/objects/board_vpd_obj.c
+++ b/objects/board_vpd_obj.c
@@ -1,60 +1,60 @@
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-
-
-/* ---------------------------------------------------------------------------------------------------- */
-
-gint
-main (gint argc, gchar *argv[])
-{
-	GMainLoop *loop;
-	GDBusConnection *c;
-	GDBusProxy *p;
- 	GError *error;
-	GVariant *parm;
-	GVariant *result;
-
-	loop = g_main_loop_new (NULL, FALSE);
-
-	error = NULL;
-	c = g_bus_get_sync (DBUS_TYPE, NULL, &error);
-
-	error = NULL;
-	p = g_dbus_proxy_new_sync (c,
-                             G_DBUS_PROXY_FLAGS_NONE,
-                             NULL,                      /* GDBusInterfaceInfo* */
-                             "org.openbmc.managers.Inventory", /* name */
-                             "/org/openbmc/inventory/items/system/io_board", /* object path */
-                             "org.openbmc.InventoryItem",        /* interface name */
-                             NULL,                      /* GCancellable */
-                             &error);
-	g_assert_no_error (error);
-
-	//TODO:  Read actual vpd
-	g_print("Reading VPD\n");
-	GVariantBuilder *b;
-	GVariant *dict;
-
-	b = g_variant_builder_new (G_VARIANT_TYPE ("a{sv}"));
-	g_variant_builder_add (b, "{sv}", "manufacturer", g_variant_new_string ("ibm"));
-	g_variant_builder_add (b, "{sv}", "part_num", g_variant_new_string("3N0001"));
-	dict = g_variant_builder_end (b);
-
-	//proxy_call wants parm as an array
-	parm = g_variant_new("(v)",dict);
-
-	error = NULL;
-	result = g_dbus_proxy_call_sync (p,
-                                   "update",
-				   parm,
-                                   G_DBUS_CALL_FLAGS_NONE,
-                                   -1,
-                                   NULL,
-                                   &error);
-	g_assert_no_error (error);
-	
-	g_object_unref(p);
-	g_object_unref(c);
- 	g_main_loop_unref (loop);
- 	return 0;
-}
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+
+
+/* ------------------------------------------------------------------------- */
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	GDBusConnection *c;
+	GDBusProxy *p;
+	GError *error;
+	GVariant *parm;
+	GVariant *result;
+
+	loop = g_main_loop_new(NULL, FALSE);
+
+	error = NULL;
+	c = g_bus_get_sync(DBUS_TYPE, NULL, &error);
+
+	error = NULL;
+	p = g_dbus_proxy_new_sync(c,
+			G_DBUS_PROXY_FLAGS_NONE,
+			NULL, /* GDBusInterfaceInfo* */
+			"org.openbmc.managers.Inventory", /* name */
+			"/org/openbmc/inventory/items/system/io_board", /* object path */
+			"org.openbmc.InventoryItem", /* interface name */
+			NULL, /* GCancellable */
+			&error);
+	g_assert_no_error(error);
+
+	//TODO: Read actual vpd
+	g_print("Reading VPD\n");
+	GVariantBuilder *b;
+	GVariant *dict;
+
+	b = g_variant_builder_new(G_VARIANT_TYPE("a{sv}"));
+	g_variant_builder_add(b, "{sv}", "manufacturer", g_variant_new_string("ibm"));
+	g_variant_builder_add(b, "{sv}", "part_num", g_variant_new_string("3N0001"));
+	dict = g_variant_builder_end(b);
+
+	//proxy_call wants parm as an array
+	parm = g_variant_new("(v)",dict);
+
+	error = NULL;
+	result = g_dbus_proxy_call_sync(p,
+			"update",
+			parm,
+			G_DBUS_CALL_FLAGS_NONE,
+			-1,
+			NULL,
+			&error);
+	g_assert_no_error(error);
+
+	g_object_unref(p);
+	g_object_unref(c);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/button_power_obj.c b/objects/button_power_obj.c
index 94f8922..f9a2b09 100644
--- a/objects/button_power_obj.c
+++ b/objects/button_power_obj.c
@@ -1,178 +1,177 @@
-#include <stdio.h>
-#include "interfaces/openbmc_intf.h"
-#include "gpio.h"
-#include "openbmc.h"
-#include "object_mapper.h"
-
-/* ---------------------------------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/buttons";
-static const gchar* instance_name = "power0";
-static const gchar* dbus_name        = "org.openbmc.buttons.Power";
-static const int LONG_PRESS_SECONDS = 3;
-static GDBusObjectManagerServer *manager = NULL;
-
-//This object will use these GPIOs
-GPIO gpio_button    = (GPIO){ "POWER_BUTTON" };
-
-static gboolean
-on_is_on       (Button          *btn,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-  gboolean btn_state=button_get_state(btn);
-  button_complete_is_on(btn,invocation,btn_state);
-  return TRUE;
-
-}
-
-static gboolean
-on_button_press       (Button          *btn,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-	button_emit_pressed(btn);
-	button_complete_sim_press(btn,invocation);
-	return TRUE;
-}
-static gboolean
-on_button_interrupt( GIOChannel *channel,
-               GIOCondition condition,
-               gpointer user_data )
-{
-
-	GError *error = 0;
-	gsize bytes_read = 0;
-	gchar buf[2]; 
-	buf[1] = '\0';
-	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
-	GIOStatus rc = g_io_channel_read_chars( channel,
-                                            buf, 1,
-                                            &bytes_read,
-                                            &error );
-	printf("%s\n",buf);
-	
-	time_t current_time = time(NULL);
-	if (gpio_button.irq_inited)
-	{
-		Button* button = object_get_button((Object*)user_data);
-		if (buf[0] == '0')
-		{
-			printf("Power Button pressed\n");
-			button_emit_pressed(button);
-			button_set_timer(button,(long)current_time);
-		}
-		else
-		{
-			long press_time = current_time-button_get_timer(button);
-			printf("Power Button released, held for %ld seconds\n",press_time);
-			if (press_time > LONG_PRESS_SECONDS)
-			{
-				button_emit_pressed_long(button);
-			} else {
-				button_emit_released(button);
-			}
-		}
-	} 
-	else { gpio_button.irq_inited = true; }
-
-	return TRUE;
-}
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-	ObjectSkeleton *object;
-	//g_print ("Acquired a message bus connection: %s\n",name);
- 	cmdline *cmd = user_data;
-  	manager = g_dbus_object_manager_server_new (dbus_object_path);
-  	int i=0;
-	gchar *s;
-	s = g_strdup_printf ("%s/%s",dbus_object_path,instance_name);
-	object = object_skeleton_new (s);
-	g_free (s);
-
-	Button* button = button_skeleton_new ();
-	object_skeleton_set_button (object, button);
-	g_object_unref (button);
-
-	ObjectMapper* mapper = object_mapper_skeleton_new ();
-	object_skeleton_set_object_mapper (object, mapper);
-	g_object_unref (mapper);
-
-	//define method callbacks
-	g_signal_connect (button,
-                   "handle-is-on",
-                   G_CALLBACK (on_is_on),
-                   NULL); /* user_data */
-	g_signal_connect (button,
-                    "handle-sim-press",
-                    G_CALLBACK (on_button_press),
-                    NULL); /* user_data */
-
-		
-	/* Export the object (@manager takes its own reference to @object) */
-	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-	g_object_unref (object);
-
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection (manager, connection);
-
-	// get gpio device paths
-	int rc = GPIO_OK;
-	do {
-		rc = gpio_init(connection,&gpio_button);
-		if (rc != GPIO_OK) { break; }
-		rc = gpio_open_interrupt(&gpio_button,on_button_interrupt,object);
-		if (rc != GPIO_OK) { break; }
-	} while(0);
-	if (rc != GPIO_OK)
-	{
-		printf("ERROR PowerButton: GPIO setup (rc=%d)\n",rc);
-	}
-	emit_object_added((GDBusObjectManager*)manager); 
-}
-
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
-{
-}
-
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
-{
-}
-
-
-gint
-main (gint argc, gchar *argv[])
-{
-  GMainLoop *loop;
-
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
-}
+#include <stdio.h>
+#include "interfaces/openbmc_intf.h"
+#include "gpio.h"
+#include "openbmc.h"
+#include "object_mapper.h"
+
+/* ------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/buttons";
+static const gchar* instance_name = "power0";
+static const gchar* dbus_name = "org.openbmc.buttons.Power";
+static const int LONG_PRESS_SECONDS = 3;
+static GDBusObjectManagerServer *manager = NULL;
+
+//This object will use these GPIOs
+GPIO gpio_button = (GPIO){ "POWER_BUTTON" };
+
+static gboolean
+on_is_on(Button *btn,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	gboolean btn_state=button_get_state(btn);
+	button_complete_is_on(btn,invocation,btn_state);
+	return TRUE;
+}
+
+static gboolean
+on_button_press(Button *btn,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	button_emit_pressed(btn);
+	button_complete_sim_press(btn,invocation);
+	return TRUE;
+}
+
+static gboolean
+on_button_interrupt( GIOChannel *channel,
+		GIOCondition condition,
+		gpointer user_data )
+{
+	GError *error = 0;
+	gsize bytes_read = 0;
+	gchar buf[2];
+	buf[1] = '\0';
+	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
+	GIOStatus rc = g_io_channel_read_chars( channel,
+			buf, 1,
+			&bytes_read,
+			&error );
+	printf("%s\n",buf);
+
+	time_t current_time = time(NULL);
+	if(gpio_button.irq_inited)
+	{
+		Button* button = object_get_button((Object*)user_data);
+		if(buf[0] == '0')
+		{
+			printf("Power Button pressed\n");
+			button_emit_pressed(button);
+			button_set_timer(button,(long)current_time);
+		}
+		else
+		{
+			long press_time = current_time-button_get_timer(button);
+			printf("Power Button released, held for %ld seconds\n",press_time);
+			if(press_time > LONG_PRESS_SECONDS)
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
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	ObjectSkeleton *object;
+	//g_print ("Acquired a message bus connection: %s\n",name);
+	cmdline *cmd = user_data;
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+	int i=0;
+	gchar *s;
+	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
+	object = object_skeleton_new(s);
+	g_free(s);
+
+	Button* button = button_skeleton_new();
+	object_skeleton_set_button(object, button);
+	g_object_unref(button);
+
+	ObjectMapper* mapper = object_mapper_skeleton_new();
+	object_skeleton_set_object_mapper(object, mapper);
+	g_object_unref(mapper);
+
+	//define method callbacks
+	g_signal_connect(button,
+			"handle-is-on",
+			G_CALLBACK(on_is_on),
+			NULL); /* user_data */
+	g_signal_connect(button,
+			"handle-sim-press",
+			G_CALLBACK(on_button_press),
+			NULL); /* user_data */
+
+
+	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+	g_object_unref(object);
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+
+	// get gpio device paths
+	int rc = GPIO_OK;
+	do {
+		rc = gpio_init(connection,&gpio_button);
+		if(rc != GPIO_OK) { break; }
+		rc = gpio_open_interrupt(&gpio_button,on_button_interrupt,object);
+		if(rc != GPIO_OK) { break; }
+	} while(0);
+	if(rc != GPIO_OK)
+	{
+		printf("ERROR PowerButton: GPIO setup (rc=%d)\n",rc);
+	}
+	emit_object_added((GDBusObjectManager*)manager);
+}
+
+static void
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/button_reset_obj.c b/objects/button_reset_obj.c
old mode 100755
new mode 100644
index 759e83a..6e915a5
--- a/objects/button_reset_obj.c
+++ b/objects/button_reset_obj.c
@@ -4,58 +4,57 @@
 #include "openbmc.h"
 #include "object_mapper.h"
 
-/* ---------------------------------------------------------------------------------------------------- */
+/* ------------------------------------------------------------------------- */
 static const gchar* dbus_object_path = "/org/openbmc/buttons";
 static const gchar* instance_name = "reset0";
-static const gchar* dbus_name        = "org.openbmc.buttons.reset";
+static const gchar* dbus_name = "org.openbmc.buttons.reset";
 static const int LONG_PRESS_SECONDS = 3;
 static GDBusObjectManagerServer *manager = NULL;
 
 //This object will use these GPIOs
-GPIO gpio_button    = (GPIO){ "RESET_BUTTON" };
+GPIO gpio_button = (GPIO){ "RESET_BUTTON" };
 
 static gboolean
-on_is_on       (Button          *btn,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
+on_is_on(Button *btn,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
 {
-  gboolean btn_state=button_get_state(btn);
-  button_complete_is_on(btn,invocation,btn_state);
-  return TRUE;
-
+	gboolean btn_state=button_get_state(btn);
+	button_complete_is_on(btn,invocation,btn_state);
+	return TRUE;
 }
 
 static gboolean
-on_button_press       (Button          *btn,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
+on_button_press(Button *btn,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
 {
 	button_emit_pressed(btn);
 	button_complete_sim_press(btn,invocation);
 	return TRUE;
 }
+
 static gboolean
 on_button_interrupt( GIOChannel *channel,
-               GIOCondition condition,
-               gpointer user_data )
+		GIOCondition condition,
+		gpointer user_data )
 {
-
 	GError *error = 0;
 	gsize bytes_read = 0;
-	gchar buf[2]; 
+	gchar buf[2];
 	buf[1] = '\0';
 	g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
 	GIOStatus rc = g_io_channel_read_chars( channel,
-                                            buf, 1,
-                                            &bytes_read,
-                                            &error );
+			buf, 1,
+			&bytes_read,
+			&error );
 	printf("%s\n",buf);
-	
+
 	time_t current_time = time(NULL);
-	if (gpio_button.irq_inited)
+	if(gpio_button.irq_inited)
 	{
 		Button* button = object_get_button((Object*)user_data);
-		if (buf[0] == '0')
+		if(buf[0] == '0')
 		{
 			printf("reset Button pressed\n");
 			button_emit_pressed(button);
@@ -65,115 +64,114 @@ on_button_interrupt( GIOChannel *channel,
 		{
 			long press_time = current_time-button_get_timer(button);
 			printf("reset Button released, held for %ld seconds\n",press_time);
-			if (press_time > LONG_PRESS_SECONDS)
+			if(press_time > LONG_PRESS_SECONDS)
 			{
 				button_emit_pressed_long(button);
 			} else {
 				button_emit_released(button);
 			}
 		}
-	} 
+	}
 	else { gpio_button.irq_inited = true; }
 
 	return TRUE;
 }
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
 {
 	ObjectSkeleton *object;
 	//g_print ("Acquired a message bus connection: %s\n",name);
- 	cmdline *cmd = user_data;
-  	manager = g_dbus_object_manager_server_new (dbus_object_path);
-  	int i=0;
+	cmdline *cmd = user_data;
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+	int i=0;
 	gchar *s;
-	s = g_strdup_printf ("%s/%s",dbus_object_path,instance_name);
-	object = object_skeleton_new (s);
-	g_free (s);
+	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
+	object = object_skeleton_new(s);
+	g_free(s);
 
-	Button* button = button_skeleton_new ();
-	object_skeleton_set_button (object, button);
-	g_object_unref (button);
+	Button* button = button_skeleton_new();
+	object_skeleton_set_button(object, button);
+	g_object_unref(button);
 
-	ObjectMapper* mapper = object_mapper_skeleton_new ();
-	object_skeleton_set_object_mapper (object, mapper);
-	g_object_unref (mapper);
+	ObjectMapper* mapper = object_mapper_skeleton_new();
+	object_skeleton_set_object_mapper(object, mapper);
+	g_object_unref(mapper);
 
 	//define method callbacks
-	g_signal_connect (button,
-                   "handle-is-on",
-                   G_CALLBACK (on_is_on),
-                   NULL); /* user_data */
-	g_signal_connect (button,
-                    "handle-sim-press",
-                    G_CALLBACK (on_button_press),
-                    NULL); /* user_data */
-
-		
+	g_signal_connect(button,
+			"handle-is-on",
+			G_CALLBACK(on_is_on),
+			NULL); /* user_data */
+	g_signal_connect(button,
+			"handle-sim-press",
+			G_CALLBACK(on_button_press),
+			NULL); /* user_data */
+
+
 	/* Export the object (@manager takes its own reference to @object) */
-	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-	g_object_unref (object);
+	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+	g_object_unref(object);
 
 	/* Export all objects */
-	g_dbus_object_manager_server_set_connection (manager, connection);
+	g_dbus_object_manager_server_set_connection(manager, connection);
 
 	// get gpio device paths
 	int rc = GPIO_OK;
 	do {
 		rc = gpio_init(connection,&gpio_button);
-		if (rc != GPIO_OK) { break; }
+		if(rc != GPIO_OK) { break; }
 		rc = gpio_open_interrupt(&gpio_button,on_button_interrupt,object);
-		if (rc != GPIO_OK) { break; }
+		if(rc != GPIO_OK) { break; }
 	} while(0);
-	if (rc != GPIO_OK)
+	if(rc != GPIO_OK)
 	{
 		printf("ERROR PowerButton: GPIO setup (rc=%d)\n",rc);
 	}
-	emit_object_added((GDBusObjectManager*)manager); 
+	emit_object_added((GDBusObjectManager*)manager);
 }
 
 static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
 {
 }
 
 static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
+on_name_lost(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
 {
 }
 
-
 gint
-main (gint argc, gchar *argv[])
+main(gint argc, gchar *argv[])
 {
-  GMainLoop *loop;
-
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
+	GMainLoop *loop;
+
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
 }
-
diff --git a/objects/control_bmc_barreleye.c b/objects/control_bmc_barreleye.c
index ddfde88..f09e379 100644
--- a/objects/control_bmc_barreleye.c
+++ b/objects/control_bmc_barreleye.c
@@ -1,249 +1,247 @@
-#include <stdint.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "gpio.h"
-
-/* ---------------------------------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/control";
-static const gchar* instance_name = "bmc0";
-static const gchar* dbus_name        = "org.openbmc.control.Bmc";
-static const gchar* i2c_dev = "/sys/bus/i2c/devices";
-
-//this probably should come from some global SOC config
-
-#define LPC_BASE		(off_t)0x1e789000
-#define LPC_HICR6		0x80
-#define LPC_HICR7		0x88
-#define LPC_HICR8		0x8c
-#define SPI_BASE		(off_t)0x1e630000
-#define SCU_BASE                (off_t)0x1e780000
-#define UART_BASE               (off_t)0x1e783000
-#define COM_BASE                (off_t)0x1e789000
-#define COM_BASE2               (off_t)0x1e789100
-#define GPIO_BASE		(off_t)0x1e6e2000
-
-static GDBusObjectManagerServer *manager = NULL;
-
-void* memmap(int mem_fd,off_t base)
-{
-	void* bmcreg;
-	bmcreg = mmap(NULL, getpagesize(),
-			PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, base);
-
-	if (bmcreg == MAP_FAILED) {
-		printf("ERROR: Unable to map LPC register memory");
-		exit(1);
-	}
-	return bmcreg;
-}
-
-void reg_init()
-{
-	g_print("BMC init\n");
-	// BMC init done here
-
-	void *bmcreg;
-	int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
-	if (mem_fd < 0) {
-		printf("ERROR: Unable to open /dev/mem");
-		exit(1);
-	}
-
-	bmcreg = memmap(mem_fd,LPC_BASE);
-	devmem(bmcreg+LPC_HICR6,0x00000500); //Enable LPC FWH cycles, Enable LPC to AHB bridge
-	devmem(bmcreg+LPC_HICR7,0x30000C00); //32M PNOR
-	devmem(bmcreg+LPC_HICR8,0xFC0003FF);
-
-	//flash controller
-	bmcreg = memmap(mem_fd,SPI_BASE);
-	devmem(bmcreg+0x00,0x00000003);
-	devmem(bmcreg+0x04,0x00002404);
-
-	//UART
-
-	
-	bmcreg = memmap(mem_fd,UART_BASE);
-	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
-	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
-	devmem(bmcreg+0x08,0x000000c1);  //Disable Parity, 1 stop bit, 8 bits
-	bmcreg = memmap(mem_fd,COM_BASE);
-	devmem(bmcreg+0x9C,0x00000000);  //Set UART routing
-
-	bmcreg = memmap(mem_fd,SCU_BASE);
-	devmem(bmcreg+0x00,0x9e82fce7);
-	//devmem(bmcreg+0x00,0x9f82fce7); // B2?
-	devmem(bmcreg+0x04,0x0370e677);
-	
-	// do not modify state of power pin, otherwise 
-	// if this is a reboot, host will shutdown
-	uint32_t reg_20 = devmem_read(bmcreg+0x20);
-	reg_20 = reg_20 & 0x00000002;	
-	devmem(bmcreg+0x20,0xcfc8f7fd | reg_20);
-	devmem(bmcreg+0x24,0xc738f20a);
-	devmem(bmcreg+0x80,0x0031ffaf);
-
-
-	//GPIO
-	bmcreg = memmap(mem_fd,GPIO_BASE);
-	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
-	devmem(bmcreg+0x80,0xCB000000);
-	devmem(bmcreg+0x88,0x01C000FF);
-	devmem(bmcreg+0x8c,0xC1C000FF);
-	devmem(bmcreg+0x90,0x003FA009);
-	devmem(bmcreg+0x88,0x01C0007F);
-
-
-	bmcreg = memmap(mem_fd,COM_BASE);
-	devmem(bmcreg+0x170,0x00000042);
-	devmem(bmcreg+0x174,0x00004000);
-
-	close(mem_fd);
-}
-
-int init_i2c_driver(int i2c_bus, const char* device, int address,bool delete)
-{
-	char dev[255];
-	g_print("Initing: device = %s, address = %02x\n",device,address);
-	if (!delete) {
-		sprintf(dev,"%s/i2c-%d/new_device",i2c_dev,i2c_bus);
-	} else {
-		sprintf(dev,"%s/i2c-%d/delete_device",i2c_dev,i2c_bus);
-	}
-	int fd = open(dev, O_WRONLY);
-	if (fd == -1) {
-		g_print("ERROR control_bmc: Unable to open device %s\n",dev);
-		return 1;
-	}
-	if (!delete) {
-		sprintf(dev,"%s 0x%02x",device,address);
-	} else {
-		sprintf(dev,"0x%02x",address);
-	}
-	int rc = write(fd,dev,strlen(dev));
-	close(fd);
-	if (rc != strlen(dev)) {
-		g_print("ERROR control_bmc: Unable to write %s\n",dev);
-		return 2;
-	}
-	return 0;
-}
-
-
-static gboolean
-on_init (Control          *control,
-         GDBusMethodInvocation  *invocation,
-         gpointer                user_data)
-{
-	control_complete_init(control,invocation);
-	
-	return TRUE;
-}
-gboolean go(gpointer user_data)
-{
- 	cmdline *cmd = user_data;
-	Control* control = object_get_control((Object*)cmd->user_data);
-	#ifdef __arm__
-	reg_init();
-	#endif
-	control_emit_goto_system_state(control,"BMC_STARTING");
-	
-	return FALSE;
-}
-
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-	ObjectSkeleton *object;
- 	cmdline *cmd = user_data;
-  	manager = g_dbus_object_manager_server_new (dbus_object_path);
-
-	gchar *s;
-	s = g_strdup_printf ("%s/%s",dbus_object_path,instance_name);
-	object = object_skeleton_new (s);
-	g_free (s);
-
-	ControlBmc* control_bmc = control_bmc_skeleton_new ();
-	object_skeleton_set_control_bmc (object, control_bmc);
-	g_object_unref (control_bmc);
-
-	Control* control = control_skeleton_new ();
-	object_skeleton_set_control (object, control);
-	g_object_unref (control);
-
-	//define method callbacks here
-	g_signal_connect (control,
-       	            "handle-init",
-               	    G_CALLBACK (on_init),
-               	    NULL); /* user_data */
-
-	/* Export the object (@manager takes its own reference to @object) */
-	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-	g_object_unref (object);
-
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection (manager, connection);
-
-	//TODO:  This is a bad hack to wait for object to be on bus
-	//sleep(1);
-	cmd->user_data = object;
-	g_idle_add(go,cmd);
-}
-
-
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
-{
-
-
-}
-
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
-{
-}
-
-
-/*----------------------------------------------------------------*/
-/* Main Event Loop                                                */
-
-gint
-main (gint argc, gchar *argv[])
-{
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-  cmd.loop = loop;
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
-}
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include "gpio.h"
+
+/* ------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/control";
+static const gchar* instance_name = "bmc0";
+static const gchar* dbus_name = "org.openbmc.control.Bmc";
+static const gchar* i2c_dev = "/sys/bus/i2c/devices";
+
+//this probably should come from some global SOC config
+
+#define LPC_BASE		(off_t)0x1e789000
+#define LPC_HICR6		0x80
+#define LPC_HICR7		0x88
+#define LPC_HICR8		0x8c
+#define SPI_BASE		(off_t)0x1e630000
+#define SCU_BASE		(off_t)0x1e780000
+#define UART_BASE		(off_t)0x1e783000
+#define COM_BASE		(off_t)0x1e789000
+#define COM_BASE2		(off_t)0x1e789100
+#define GPIO_BASE		(off_t)0x1e6e2000
+
+static GDBusObjectManagerServer *manager = NULL;
+
+void*
+memmap(int mem_fd,off_t base)
+{
+	void* bmcreg;
+	bmcreg = mmap(NULL, getpagesize(),
+			PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, base);
+
+	if(bmcreg == MAP_FAILED) {
+		printf("ERROR: Unable to map LPC register memory");
+		exit(1);
+	}
+	return bmcreg;
+}
+
+void
+reg_init()
+{
+	g_print("BMC init\n");
+	// BMC init done here
+
+	void *bmcreg;
+	int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
+	if(mem_fd < 0) {
+		printf("ERROR: Unable to open /dev/mem");
+		exit(1);
+	}
+
+	bmcreg = memmap(mem_fd,LPC_BASE);
+	devmem(bmcreg+LPC_HICR6,0x00000500); //Enable LPC FWH cycles, Enable LPC to AHB bridge
+	devmem(bmcreg+LPC_HICR7,0x30000C00); //32M PNOR
+	devmem(bmcreg+LPC_HICR8,0xFC0003FF);
+
+	//flash controller
+	bmcreg = memmap(mem_fd,SPI_BASE);
+	devmem(bmcreg+0x00,0x00000003);
+	devmem(bmcreg+0x04,0x00002404);
+
+	//UART
+	bmcreg = memmap(mem_fd,UART_BASE);
+	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
+	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
+	devmem(bmcreg+0x08,0x000000c1);  //Disable Parity, 1 stop bit, 8 bits
+	bmcreg = memmap(mem_fd,COM_BASE);
+	devmem(bmcreg+0x9C,0x00000000);  //Set UART routing
+
+	bmcreg = memmap(mem_fd,SCU_BASE);
+	devmem(bmcreg+0x00,0x9e82fce7);
+	//devmem(bmcreg+0x00,0x9f82fce7); // B2?
+	devmem(bmcreg+0x04,0x0370e677);
+
+	// do not modify state of power pin, otherwise
+	// if this is a reboot, host will shutdown
+	uint32_t reg_20 = devmem_read(bmcreg+0x20);
+	reg_20 = reg_20 & 0x00000002;
+	devmem(bmcreg+0x20,0xcfc8f7fd | reg_20);
+	devmem(bmcreg+0x24,0xc738f20a);
+	devmem(bmcreg+0x80,0x0031ffaf);
+
+
+	//GPIO
+	bmcreg = memmap(mem_fd,GPIO_BASE);
+	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
+	devmem(bmcreg+0x80,0xCB000000);
+	devmem(bmcreg+0x88,0x01C000FF);
+	devmem(bmcreg+0x8c,0xC1C000FF);
+	devmem(bmcreg+0x90,0x003FA009);
+	devmem(bmcreg+0x88,0x01C0007F);
+
+
+	bmcreg = memmap(mem_fd,COM_BASE);
+	devmem(bmcreg+0x170,0x00000042);
+	devmem(bmcreg+0x174,0x00004000);
+
+	close(mem_fd);
+}
+
+int
+init_i2c_driver(int i2c_bus, const char* device, int address,bool delete)
+{
+	char dev[255];
+	g_print("Initing: device = %s, address = %02x\n",device,address);
+	if(!delete) {
+		sprintf(dev,"%s/i2c-%d/new_device",i2c_dev,i2c_bus);
+	} else {
+		sprintf(dev,"%s/i2c-%d/delete_device",i2c_dev,i2c_bus);
+	}
+	int fd = open(dev, O_WRONLY);
+	if(fd == -1) {
+		g_print("ERROR control_bmc: Unable to open device %s\n",dev);
+		return 1;
+	}
+	if(!delete) {
+		sprintf(dev,"%s 0x%02x",device,address);
+	} else {
+		sprintf(dev,"0x%02x",address);
+	}
+	int rc = write(fd,dev,strlen(dev));
+	close(fd);
+	if(rc != strlen(dev)) {
+		g_print("ERROR control_bmc: Unable to write %s\n",dev);
+		return 2;
+	}
+	return 0;
+}
+
+static gboolean
+on_init(Control *control,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	control_complete_init(control,invocation);
+
+	return TRUE;
+}
+
+gboolean
+go(gpointer user_data)
+{
+	cmdline *cmd = user_data;
+	Control* control = object_get_control((Object*)cmd->user_data);
+#ifdef __arm__
+	reg_init();
+#endif
+	control_emit_goto_system_state(control,"BMC_STARTING");
+
+	return FALSE;
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	ObjectSkeleton *object;
+	cmdline *cmd = user_data;
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+
+	gchar *s;
+	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
+	object = object_skeleton_new(s);
+	g_free(s);
+
+	ControlBmc* control_bmc = control_bmc_skeleton_new();
+	object_skeleton_set_control_bmc(object, control_bmc);
+	g_object_unref(control_bmc);
+
+	Control* control = control_skeleton_new();
+	object_skeleton_set_control(object, control);
+	g_object_unref(control);
+
+	//define method callbacks here
+	g_signal_connect(control,
+			"handle-init",
+			G_CALLBACK(on_init),
+			NULL); /* user_data */
+
+	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+	g_object_unref(object);
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+
+	//TODO:  This is a bad hack to wait for object to be on bus
+	//sleep(1);
+	cmd->user_data = object;
+	g_idle_add(go,cmd);
+}
+
+static void
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+		const gchar     *name,
+		gpointer         user_data)
+{
+}
+
+/*----------------------------------------------------------------*/
+/* Main Event Loop                                                */
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+	cmd.loop = loop;
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/control_bmc_obj.c b/objects/control_bmc_obj.c
index f1a47c7..f3571cd 100644
--- a/objects/control_bmc_obj.c
+++ b/objects/control_bmc_obj.c
@@ -1,120 +1,122 @@
-#include <stdint.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "gpio.h"
-
-/* ---------------------------------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/control";
-static const gchar* instance_name = "bmc0";
-static const gchar* dbus_name        = "org.openbmc.control.Bmc";
-
-//this probably should come from some global SOC config
-
-#define LPC_BASE		(off_t)0x1e789000
-#define LPC_HICR6		0x80
-#define LPC_HICR7		0x88
-#define LPC_HICR8		0x8c
-#define SPI_BASE		(off_t)0x1e630000
-#define SCU_BASE                (off_t)0x1e780000
-#define UART_BASE               (off_t)0x1e783000
-#define COM_BASE                (off_t)0x1e789000
-#define COM_BASE2               (off_t)0x1e789100
-#define GPIO_BASE		(off_t)0x1e6e2000
-
-static GDBusObjectManagerServer *manager = NULL;
-
-void* memmap(int mem_fd,off_t base)
-{
-	void* bmcreg;
-	bmcreg = mmap(NULL, getpagesize(),
-			PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, base);
-
-	if (bmcreg == MAP_FAILED) {
-		printf("ERROR: Unable to map LPC register memory");
-		exit(1);
-	}
-	return bmcreg;
-}
-
-void reg_init()
-{
-	g_print("BMC init\n");
-	// BMC init done here
-
-	void *bmcreg;
-	int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
-	if (mem_fd < 0) {
-		printf("ERROR: Unable to open /dev/mem");
-		exit(1);
-	}
-
-	bmcreg = memmap(mem_fd,LPC_BASE);
-	devmem(bmcreg+LPC_HICR6,0x00000500); //Enable LPC FWH cycles, Enable LPC to AHB bridge
-	devmem(bmcreg+LPC_HICR7,0x30000E00); //32M PNOR
-	devmem(bmcreg+LPC_HICR8,0xFE0001FF);
-
-	//flash controller
-	bmcreg = memmap(mem_fd,SPI_BASE);
-	devmem(bmcreg+0x00,0x00000003);
-	devmem(bmcreg+0x04,0x00002404);
-
-	//UART
-
-	bmcreg = memmap(mem_fd,UART_BASE);
-	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
-	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
-	devmem(bmcreg+0x08,0x000000c1);  //Disable Parity, 1 stop bit, 8 bits
-	bmcreg = memmap(mem_fd,COM_BASE);
-	devmem(bmcreg+0x9C,0x00000000);  //Set UART routing
-
-	bmcreg = memmap(mem_fd,SCU_BASE);
-	devmem(bmcreg+0x00,0x13008CE7);
-	devmem(bmcreg+0x04,0x0370E677);
-	devmem(bmcreg+0x20,0xDF48F7FF);
-	devmem(bmcreg+0x24,0xC738F202);
-
-
-	//GPIO
-	bmcreg = memmap(mem_fd,GPIO_BASE);
-	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
-        devmem(bmcreg+0x70,0x120CE406);
-	devmem(bmcreg+0x80,0xCB000000);
-	devmem(bmcreg+0x88,0x01C000FF);
-	devmem(bmcreg+0x8c,0xC1C000FF);
-	devmem(bmcreg+0x90,0x003FA009);
-
-	bmcreg = memmap(mem_fd,COM_BASE);
-	devmem(bmcreg+0x170,0x00000042);
-	devmem(bmcreg+0x174,0x00004000);
-
-
-	close(mem_fd);
-}
-
-static gboolean
-on_init (Control          *control,
-         GDBusMethodInvocation  *invocation,
-         gpointer                user_data)
-{
-	//#ifdef __arm__
-	//reg_init();
-	//#endif
-	control_complete_init(control,invocation);
-	//control_emit_goto_system_state(control,"BMC_STARTING");
-	return TRUE;
-}
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include "gpio.h"
+
+/* ------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/control";
+static const gchar* instance_name = "bmc0";
+static const gchar* dbus_name = "org.openbmc.control.Bmc";
+
+//this probably should come from some global SOC config
+
+#define LPC_BASE		(off_t)0x1e789000
+#define LPC_HICR6		0x80
+#define LPC_HICR7		0x88
+#define LPC_HICR8		0x8c
+#define SPI_BASE		(off_t)0x1e630000
+#define SCU_BASE		(off_t)0x1e780000
+#define UART_BASE		(off_t)0x1e783000
+#define COM_BASE		(off_t)0x1e789000
+#define COM_BASE2		(off_t)0x1e789100
+#define GPIO_BASE		(off_t)0x1e6e2000
+
+static GDBusObjectManagerServer *manager = NULL;
+
+void*
+memmap(int mem_fd,off_t base)
+{
+	void* bmcreg;
+	bmcreg = mmap(NULL, getpagesize(),
+			PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, base);
+
+	if(bmcreg == MAP_FAILED) {
+		printf("ERROR: Unable to map LPC register memory");
+		exit(1);
+	}
+	return bmcreg;
+}
+
+void
+reg_init()
+{
+	g_print("BMC init\n");
+	// BMC init done here
+
+	void *bmcreg;
+	int mem_fd = open("/dev/mem", O_RDWR | O_SYNC);
+	if(mem_fd < 0) {
+		printf("ERROR: Unable to open /dev/mem");
+		exit(1);
+	}
+
+	bmcreg = memmap(mem_fd,LPC_BASE);
+	devmem(bmcreg+LPC_HICR6,0x00000500); //Enable LPC FWH cycles, Enable LPC to AHB bridge
+	devmem(bmcreg+LPC_HICR7,0x30000E00); //32M PNOR
+	devmem(bmcreg+LPC_HICR8,0xFE0001FF);
+
+	//flash controller
+	bmcreg = memmap(mem_fd,SPI_BASE);
+	devmem(bmcreg+0x00,0x00000003);
+	devmem(bmcreg+0x04,0x00002404);
+
+	//UART
+
+	bmcreg = memmap(mem_fd,UART_BASE);
+	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
+	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
+	devmem(bmcreg+0x08,0x000000c1);  //Disable Parity, 1 stop bit, 8 bits
+	bmcreg = memmap(mem_fd,COM_BASE);
+	devmem(bmcreg+0x9C,0x00000000);  //Set UART routing
+
+	bmcreg = memmap(mem_fd,SCU_BASE);
+	devmem(bmcreg+0x00,0x13008CE7);
+	devmem(bmcreg+0x04,0x0370E677);
+	devmem(bmcreg+0x20,0xDF48F7FF);
+	devmem(bmcreg+0x24,0xC738F202);
+
+
+	//GPIO
+	bmcreg = memmap(mem_fd,GPIO_BASE);
+	devmem(bmcreg+0x84,0x00fff0c0);  //Enable UART1
+	devmem(bmcreg+0x70,0x120CE406);
+	devmem(bmcreg+0x80,0xCB000000);
+	devmem(bmcreg+0x88,0x01C000FF);
+	devmem(bmcreg+0x8c,0xC1C000FF);
+	devmem(bmcreg+0x90,0x003FA009);
+
+	bmcreg = memmap(mem_fd,COM_BASE);
+	devmem(bmcreg+0x170,0x00000042);
+	devmem(bmcreg+0x174,0x00004000);
+
+
+	close(mem_fd);
+}
 
 static gboolean
-on_warm_reset (ControlBmc            	*bmc,
-               GDBusMethodInvocation	*invocation,
-               gpointer		            user_data)
+on_init(Control *control,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	//#ifdef __arm__
+	//reg_init();
+	//#endif
+	control_complete_init(control,invocation);
+	//control_emit_goto_system_state(control,"BMC_STARTING");
+	return TRUE;
+}
+
+static gboolean
+on_warm_reset(ControlBmc *bmc,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
 {
 	GError *err = NULL;
 	/* Wait a while before reboot, so the caller can be responded.
@@ -124,7 +126,7 @@ on_warm_reset (ControlBmc            	*bmc,
 	gchar *reboot_command = "/bin/sh -c 'sleep 3;reboot'";
 
 	g_spawn_command_line_async(reboot_command, &err);
-	if (err != NULL) {
+	if(err != NULL) {
 		fprintf(stderr, "warmReset() error: %s\n", err->message);
 		g_error_free(err);
 	}
@@ -133,112 +135,109 @@ on_warm_reset (ControlBmc            	*bmc,
 	return TRUE;
 }
 
-gboolean go(gpointer user_data)
-{
- 	cmdline *cmd = user_data;
-	Control* control = object_get_control((Object*)cmd->user_data);
-	#ifdef __arm__
-	reg_init();
-	#endif
-	control_emit_goto_system_state(control,"BMC_STARTING");
-
-	//g_main_loop_quit(cmd->loop);
-	return FALSE;
-}
+gboolean
+go(gpointer user_data)
+{
+	cmdline *cmd = user_data;
+	Control* control = object_get_control((Object*)cmd->user_data);
+#ifdef __arm__
+	reg_init();
+#endif
+	control_emit_goto_system_state(control,"BMC_STARTING");
+
+	//g_main_loop_quit(cmd->loop);
+	return FALSE;
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	ObjectSkeleton *object;
+	cmdline *cmd = user_data;
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+
+	gchar *s;
+	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
+	object = object_skeleton_new(s);
+	g_free(s);
+
+	ControlBmc* control_bmc = control_bmc_skeleton_new();
+	object_skeleton_set_control_bmc(object, control_bmc);
+	g_object_unref(control_bmc);
+
+	Control* control = control_skeleton_new();
+	object_skeleton_set_control(object, control);
+	g_object_unref(control);
+
+	//define method callbacks here
+	g_signal_connect(control,
+			"handle-init",
+			G_CALLBACK(on_init),
+			NULL); /* user_data */
+
+
+	g_signal_connect(control_bmc,
+			"handle-warm-reset",
+			G_CALLBACK(on_warm_reset),
+			NULL); /* user_data */
+
+	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+	g_object_unref(object);
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+
+	//TODO:  This is a bad hack to wait for object to be on bus
+	//sleep(1);
+	cmd->user_data = object;
+	//g_idle_add(go,cmd);
+}
 
 static void
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-	ObjectSkeleton *object;
- 	cmdline *cmd = user_data;
-  	manager = g_dbus_object_manager_server_new (dbus_object_path);
-
-	gchar *s;
-	s = g_strdup_printf ("%s/%s",dbus_object_path,instance_name);
-	object = object_skeleton_new (s);
-	g_free (s);
-
-	ControlBmc* control_bmc = control_bmc_skeleton_new ();
-	object_skeleton_set_control_bmc (object, control_bmc);
-	g_object_unref (control_bmc);
-
-	Control* control = control_skeleton_new ();
-	object_skeleton_set_control (object, control);
-	g_object_unref (control);
-
-	//define method callbacks here
-	g_signal_connect (control,
-       	            "handle-init",
-               	    G_CALLBACK (on_init),
-               	    NULL); /* user_data */
-
-
-	g_signal_connect (control_bmc,
-		"handle-warm-reset",
-		G_CALLBACK (on_warm_reset),
-		NULL); /* user_data */
-
-	/* Export the object (@manager takes its own reference to @object) */
-	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-	g_object_unref (object);
-
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection (manager, connection);
-
-	//TODO:  This is a bad hack to wait for object to be on bus
-	//sleep(1);
-	cmd->user_data = object;
-	//g_idle_add(go,cmd);
-}
-
-
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
-{
-
-
-}
-
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
-{
-}
-
-
-/*----------------------------------------------------------------*/
-/* Main Event Loop                                                */
-
-gint
-main (gint argc, gchar *argv[])
-{
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-  cmd.loop = loop;
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
-}
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+/*----------------------------------------------------------------*/
+/* Main Event Loop                                                */
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+	cmd.loop = loop;
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/control_host_obj.c b/objects/control_host_obj.c
old mode 100755
new mode 100644
index ac72b6e..3e7f2ae
--- a/objects/control_host_obj.c
+++ b/objects/control_host_obj.c
@@ -1,274 +1,275 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "gpio.h"
-#include "object_mapper.h"
-
-/* ---------------------------------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/control";
-static const gchar* instance_name = "host0";
-static const gchar* dbus_name = "org.openbmc.control.Host";
-
-static GDBusObjectManagerServer *manager = NULL;
-
-GPIO fsi_data     = (GPIO){ "FSI_DATA" };
-GPIO fsi_clk      = (GPIO){ "FSI_CLK" };
-GPIO fsi_enable   = (GPIO){ "FSI_ENABLE" };
-GPIO cronus_sel   = (GPIO){ "CRONUS_SEL" };
-GPIO Throttle     = (GPIO){ "BMC_THROTTLE" };
-
-/* Bit bang patterns */
-
-//putcfam pu 281c 30000000 -p0 (Primary Side Select)
-static const char* primary = "000011111111110101111000111001100111111111111111111111111111101111111111";
-//putcfam pu 281c B0000000 -p0
-static const char* go = "000011111111110101111000111000100111111111111111111111111111101101111111";
-//putcfam pu 0x281c 30900000 (Golden Side Select)
-static const char* golden = "000011111111110101111000111001100111101101111111111111111111101001111111";
-
-/* Setup attentions */
-//putcfam pu 0x081C 20000000
-static const char* attnA = "000011111111111101111110001001101111111111111111111111111111110001111111";
-//putcfam pu 0x100D 40000000
-static const char* attnB = "000011111111111011111100101001011111111111111111111111111111110001111111";
-//putcfam pu  0x100B FFFFFFFF
-static const char* attnC = "000011111111111011111101001000000000000000000000000000000000001011111111";
-
-
-
-static gboolean
-on_init         (Control       *control,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-	control_complete_init(control,invocation);
-	return TRUE;
-}
-
-int fsi_bitbang(const char* pattern)
-{
-	int rc=GPIO_OK;
-	int i;
-	for(i=0;i<strlen(pattern);i++) {
-		rc = gpio_writec(&fsi_data,pattern[i]);
-		if (rc!=GPIO_OK) { break; }
-		rc = gpio_clock_cycle(&fsi_clk,1);
-		if (rc!=GPIO_OK) { break; }
-	}
-	return rc;
-	
-}
-
-int fsi_standby()
-{
-	int rc=GPIO_OK;
-	rc = gpio_write(&fsi_data,1);
-	if (rc!=GPIO_OK) { return rc; }
-	rc = gpio_clock_cycle(&fsi_clk,5000);
-	if (rc!=GPIO_OK) { return rc; }
-	return rc;
-}
-
-
-static gboolean
-on_boot         (ControlHost        *host,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-	int rc = GPIO_OK;
-
-	if (control_host_get_debug_mode(host)==1)
-	{
-		g_print("Enabling debug mode; not booting host\n");
-		rc |= gpio_open(&fsi_enable);
-		rc |= gpio_open(&cronus_sel);
-		rc |= gpio_write(&fsi_enable,1);
-		rc |= gpio_write(&cronus_sel,0);
-		if (rc!=GPIO_OK) {
-			g_print("ERROR enabling debug mode: %d\n",rc);
-		}
-		return TRUE;
-	}
-	g_print("Booting host\n");
-	Control* control = object_get_control((Object*)user_data);
-	control_host_complete_boot(host,invocation);
-	do {	
-		rc = gpio_open(&fsi_clk);
-		rc |= gpio_open(&fsi_data);
-		rc |= gpio_open(&fsi_enable);
-		rc |= gpio_open(&cronus_sel);
-		rc |= gpio_open(&Throttle);
-		if (rc!=GPIO_OK) { break; }
-
-		//setup dc pins		
-		rc = gpio_write(&cronus_sel,1);
-		rc |= gpio_write(&fsi_enable,1);
-		rc |= gpio_write(&fsi_clk,1);
-		rc |= gpio_write(&Throttle,1);
-		if (rc!=GPIO_OK) { break; }
-
-		//data standy state
-		rc = fsi_standby();
-
-		//clear out pipes
-		rc |= gpio_write(&fsi_data,0);
-		rc |= gpio_clock_cycle(&fsi_clk,256);
-		rc |= gpio_write(&fsi_data,1);
-		rc |= gpio_clock_cycle(&fsi_clk,50);
-		if (rc!=GPIO_OK) { break; }
-
-		rc = fsi_bitbang(attnA);
-		rc |= fsi_standby();
-
-		rc |= fsi_bitbang(attnB);
-		rc |= fsi_standby();
-
-		rc |= fsi_bitbang(attnC);
-		rc |= fsi_standby();
-		if (rc!=GPIO_OK) { break; }
-
-		const gchar* flash_side = control_host_get_flash_side(host);
-		g_print("Using %s side of the bios flash\n",flash_side);
-		if (strcmp(flash_side,"primary")==0) {
-			rc |= fsi_bitbang(primary);
-		} else if (strcmp(flash_side,"golden") == 0) {
-			rc |= fsi_bitbang(golden);
-		} else {
-			g_print("ERROR: Invalid flash side: %s\n",flash_side);
-			rc = 0xff;
-			
-		}
-		rc |= fsi_standby();
-		if (rc!=GPIO_OK) { break; }
-		
-		rc = fsi_bitbang(go);
-
-		rc |= gpio_write(&fsi_data,1); /* Data standby state */
-		rc |= gpio_clock_cycle(&fsi_clk,2);
-
-	        rc |= gpio_write(&fsi_clk,0); /* hold clk low for clock mux */
-	        rc |= gpio_write(&fsi_enable,0);
-	        rc |= gpio_clock_cycle(&fsi_clk,16);
-	        rc |= gpio_write(&fsi_clk,0); /* Data standby state */
-	
-	} while(0);
-	if (rc != GPIO_OK)
-	{
-		g_print("ERROR HostControl: GPIO sequence failed (rc=%d)\n",rc);
-	} else {
-		control_emit_goto_system_state(control,"HOST_BOOTING");
-	}
-	gpio_close(&fsi_clk);
-	gpio_close(&fsi_data);
-	gpio_close(&fsi_enable);
-	gpio_close(&cronus_sel);
-	gpio_close(&Throttle);
-
-	control_host_emit_booted(host);
-	return TRUE;
-}
-
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-	ObjectSkeleton *object;
-	//g_print ("Acquired a message bus connection: %s\n",name);
- 	cmdline *cmd = user_data;
-  	manager = g_dbus_object_manager_server_new (dbus_object_path);
-
-	gchar *s;
-	s = g_strdup_printf ("%s/%s",dbus_object_path,instance_name);
-	object = object_skeleton_new (s);
-	g_free (s);
-
-	ControlHost* control_host = control_host_skeleton_new ();
-	object_skeleton_set_control_host (object, control_host);
-	g_object_unref (control_host);
-
-	Control* control = control_skeleton_new ();
-	object_skeleton_set_control (object, control);
-	g_object_unref (control);
-
-	ObjectMapper* mapper = object_mapper_skeleton_new ();
-	object_skeleton_set_object_mapper (object, mapper);
-	g_object_unref (mapper);
-
-	//define method callbacks here
-	g_signal_connect (control_host,
-                 "handle-boot",
-                 G_CALLBACK (on_boot),
-                 object); /* user_data */
-	g_signal_connect (control,
-                 "handle-init",
-                 G_CALLBACK (on_init),
-                 NULL); /* user_data */
-
-	control_host_set_debug_mode(control_host,0);
-	control_host_set_flash_side(control_host,"primary");
-
-	/* Export the object (@manager takes its own reference to @object) */
-	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-	g_object_unref (object);
-
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection (manager, connection);
-	
-	gpio_init(connection,&fsi_data);
-	gpio_init(connection,&fsi_clk);
-	gpio_init(connection,&fsi_enable);
-	gpio_init(connection,&cronus_sel);
-	gpio_init(connection,&Throttle);
-	emit_object_added((GDBusObjectManager*)manager); 	
-}
-
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
-{
-//  g_print ("Acquired the name %s\n", name);
-}
-
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
-{
-//  g_print ("Lost the name %s\n", name);
-}
-
-gint
-main (gint argc, gchar *argv[])
-{
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
-}
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include "gpio.h"
+#include "object_mapper.h"
+
+/* ------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/control";
+static const gchar* instance_name = "host0";
+static const gchar* dbus_name = "org.openbmc.control.Host";
+
+static GDBusObjectManagerServer *manager = NULL;
+
+GPIO fsi_data     = (GPIO){ "FSI_DATA" };
+GPIO fsi_clk      = (GPIO){ "FSI_CLK" };
+GPIO fsi_enable   = (GPIO){ "FSI_ENABLE" };
+GPIO cronus_sel   = (GPIO){ "CRONUS_SEL" };
+GPIO Throttle     = (GPIO){ "BMC_THROTTLE" };
+
+/* Bit bang patterns */
+
+//putcfam pu 281c 30000000 -p0 (Primary Side Select)
+static const char* primary = "000011111111110101111000111001100111111111111111111111111111101111111111";
+//putcfam pu 281c B0000000 -p0
+static const char* go = "000011111111110101111000111000100111111111111111111111111111101101111111";
+//putcfam pu 0x281c 30900000 (Golden Side Select)
+static const char* golden = "000011111111110101111000111001100111101101111111111111111111101001111111";
+
+/* Setup attentions */
+//putcfam pu 0x081C 20000000
+static const char* attnA = "000011111111111101111110001001101111111111111111111111111111110001111111";
+//putcfam pu 0x100D 40000000
+static const char* attnB = "000011111111111011111100101001011111111111111111111111111111110001111111";
+//putcfam pu  0x100B FFFFFFFF
+static const char* attnC = "000011111111111011111101001000000000000000000000000000000000001011111111";
+
+
+
+static gboolean
+on_init(Control *control,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	control_complete_init(control,invocation);
+	return TRUE;
+}
+
+int
+fsi_bitbang(const char* pattern)
+{
+	int rc=GPIO_OK;
+	int i;
+	for(i=0;i<strlen(pattern);i++) {
+		rc = gpio_writec(&fsi_data,pattern[i]);
+		if(rc!=GPIO_OK) { break; }
+		rc = gpio_clock_cycle(&fsi_clk,1);
+		if(rc!=GPIO_OK) { break; }
+	}
+	return rc;
+}
+
+int
+fsi_standby()
+{
+	int rc=GPIO_OK;
+	rc = gpio_write(&fsi_data,1);
+	if(rc!=GPIO_OK) { return rc; }
+	rc = gpio_clock_cycle(&fsi_clk,5000);
+	if(rc!=GPIO_OK) { return rc; }
+	return rc;
+}
+
+
+static gboolean
+on_boot(ControlHost *host,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	int rc = GPIO_OK;
+
+	if(control_host_get_debug_mode(host)==1)
+	{
+		g_print("Enabling debug mode; not booting host\n");
+		rc |= gpio_open(&fsi_enable);
+		rc |= gpio_open(&cronus_sel);
+		rc |= gpio_write(&fsi_enable,1);
+		rc |= gpio_write(&cronus_sel,0);
+		if(rc!=GPIO_OK) {
+			g_print("ERROR enabling debug mode: %d\n",rc);
+		}
+		return TRUE;
+	}
+	g_print("Booting host\n");
+	Control* control = object_get_control((Object*)user_data);
+	control_host_complete_boot(host,invocation);
+	do {
+		rc = gpio_open(&fsi_clk);
+		rc |= gpio_open(&fsi_data);
+		rc |= gpio_open(&fsi_enable);
+		rc |= gpio_open(&cronus_sel);
+		rc |= gpio_open(&Throttle);
+		if(rc!=GPIO_OK) { break; }
+
+		//setup dc pins
+		rc = gpio_write(&cronus_sel,1);
+		rc |= gpio_write(&fsi_enable,1);
+		rc |= gpio_write(&fsi_clk,1);
+		rc |= gpio_write(&Throttle,1);
+		if(rc!=GPIO_OK) { break; }
+
+		//data standy state
+		rc = fsi_standby();
+
+		//clear out pipes
+		rc |= gpio_write(&fsi_data,0);
+		rc |= gpio_clock_cycle(&fsi_clk,256);
+		rc |= gpio_write(&fsi_data,1);
+		rc |= gpio_clock_cycle(&fsi_clk,50);
+		if(rc!=GPIO_OK) { break; }
+
+		rc = fsi_bitbang(attnA);
+		rc |= fsi_standby();
+
+		rc |= fsi_bitbang(attnB);
+		rc |= fsi_standby();
+
+		rc |= fsi_bitbang(attnC);
+		rc |= fsi_standby();
+		if(rc!=GPIO_OK) { break; }
+
+		const gchar* flash_side = control_host_get_flash_side(host);
+		g_print("Using %s side of the bios flash\n",flash_side);
+		if(strcmp(flash_side,"primary")==0) {
+			rc |= fsi_bitbang(primary);
+		} else if(strcmp(flash_side,"golden") == 0) {
+			rc |= fsi_bitbang(golden);
+		} else {
+			g_print("ERROR: Invalid flash side: %s\n",flash_side);
+			rc = 0xff;
+
+		}
+		rc |= fsi_standby();
+		if(rc!=GPIO_OK) { break; }
+
+		rc = fsi_bitbang(go);
+
+		rc |= gpio_write(&fsi_data,1); /* Data standby state */
+		rc |= gpio_clock_cycle(&fsi_clk,2);
+
+		rc |= gpio_write(&fsi_clk,0); /* hold clk low for clock mux */
+		rc |= gpio_write(&fsi_enable,0);
+		rc |= gpio_clock_cycle(&fsi_clk,16);
+		rc |= gpio_write(&fsi_clk,0); /* Data standby state */
+
+	} while(0);
+	if(rc != GPIO_OK)
+	{
+		g_print("ERROR HostControl: GPIO sequence failed (rc=%d)\n",rc);
+	} else {
+		control_emit_goto_system_state(control,"HOST_BOOTING");
+	}
+	gpio_close(&fsi_clk);
+	gpio_close(&fsi_data);
+	gpio_close(&fsi_enable);
+	gpio_close(&cronus_sel);
+	gpio_close(&Throttle);
+
+	control_host_emit_booted(host);
+	return TRUE;
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	ObjectSkeleton *object;
+	//g_print ("Acquired a message bus connection: %s\n",name);
+	cmdline *cmd = user_data;
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+
+	gchar *s;
+	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
+	object = object_skeleton_new(s);
+	g_free(s);
+
+	ControlHost* control_host = control_host_skeleton_new();
+	object_skeleton_set_control_host(object, control_host);
+	g_object_unref(control_host);
+
+	Control* control = control_skeleton_new();
+	object_skeleton_set_control(object, control);
+	g_object_unref(control);
+
+	ObjectMapper* mapper = object_mapper_skeleton_new();
+	object_skeleton_set_object_mapper(object, mapper);
+	g_object_unref(mapper);
+
+	//define method callbacks here
+	g_signal_connect(control_host,
+			"handle-boot",
+			G_CALLBACK(on_boot),
+			object); /* user_data */
+	g_signal_connect(control,
+			"handle-init",
+			G_CALLBACK(on_init),
+			NULL); /* user_data */
+
+	control_host_set_debug_mode(control_host,0);
+	control_host_set_flash_side(control_host,"primary");
+
+	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+	g_object_unref(object);
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+
+	gpio_init(connection,&fsi_data);
+	gpio_init(connection,&fsi_clk);
+	gpio_init(connection,&fsi_enable);
+	gpio_init(connection,&cronus_sel);
+	gpio_init(connection,&Throttle);
+	emit_object_added((GDBusObjectManager*)manager);
+}
+
+static void
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	//  g_print ("Acquired the name %s\n", name);
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	//  g_print ("Lost the name %s\n", name);
+}
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/fan_generic_obj.c b/objects/fan_generic_obj.c
index fb61c5c..72bfb11 100644
--- a/objects/fan_generic_obj.c
+++ b/objects/fan_generic_obj.c
@@ -1,137 +1,134 @@
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "object_mapper.h"
-
-/* ---------------------------------------------------------------------------------------------------- */
-
-static const gchar* dbus_object_path = "/org/openbmc/control";
-static const gchar* dbus_name        = "org.openbmc.control.Fan";
-static guint heartbeat = 0;
-
-static GDBusObjectManagerServer *manager = NULL;
-
-static gboolean
-poll_sensor(gpointer user_data)
-{
-    //FruFan *fan = object_get_fan((Object*)user_data);
-    return TRUE;
-}
-
-
-
-static gboolean
-on_set_speed    (Fan  *fan,
-                GDBusMethodInvocation  *invocation,
-		guint                  speed,
-                gpointer                user_data)
-{
-  fan_set_speed(fan,speed);
-  fan_complete_set_speed(fan,invocation);
-  return TRUE;
-}
-
-static gboolean
-on_get_speed (Fan                 *fan,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-  guint reading = fan_get_speed(fan);
-  fan_complete_get_speed(fan,invocation,reading);
-  return TRUE;
-}
-
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-  	//g_print ("Acquired a message bus connection: %s\n",name);
-
-  	cmdline *cmd = user_data;
-	if (cmd->argc < 2)
-	{
-		g_print("No objects created.  Put object name(s) on command line\n");
-		return;
-	}	
-  	manager = g_dbus_object_manager_server_new (dbus_object_path);
-  	int i=0;
-  	for (i=1;i<cmd->argc;i++)
-  	{
-		gchar *s;
- 		s = g_strdup_printf ("%s/%s",dbus_object_path,cmd->argv[i]);
-		ObjectSkeleton *object = object_skeleton_new (s);
-		g_free (s);
-
-		Fan *fan = fan_skeleton_new ();
-  		object_skeleton_set_fan (object, fan);
-  		g_object_unref (fan);
-		
-		ObjectMapper* mapper = object_mapper_skeleton_new ();
-		object_skeleton_set_object_mapper (object, mapper);
-		g_object_unref (mapper);
-	
-  		//define method callbacks here
-  		g_signal_connect (fan,
-                    "handle-get-speed",
-                    G_CALLBACK (on_get_speed),
-                    NULL); /* user_data */
-  		g_signal_connect (fan,
-                    "handle-set-speed",
-                    G_CALLBACK (on_set_speed),
-                    NULL); /* user_data */
-
-		//g_timeout_add(poll_interval, poll_sensor, object);
-
-  		/* Export the object (@manager takes its own reference to @object) */
-  		g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-  		g_object_unref (object);
-	}
-
-  /* Export all objects */
-  g_dbus_object_manager_server_set_connection (manager, connection);
-  emit_object_added((GDBusObjectManager*)manager); 
-}
-
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
-{
-  //g_print ("Acquired the name %s\n", name);
-}
-
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
-{
-  //g_print ("Lost the name %s\n", name);
-}
-
-
-gint
-main (gint argc, gchar *argv[])
-{
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
-}
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include "object_mapper.h"
+
+/* ------------------------------------------------------------------------- */
+
+static const gchar* dbus_object_path = "/org/openbmc/control";
+static const gchar* dbus_name = "org.openbmc.control.Fan";
+static guint heartbeat = 0;
+
+static GDBusObjectManagerServer *manager = NULL;
+
+static gboolean
+poll_sensor(gpointer user_data)
+{
+	//FruFan *fan = object_get_fan((Object*)user_data);
+	return TRUE;
+}
+
+static gboolean
+on_set_speed(Fan *fan,
+		GDBusMethodInvocation *invocation,
+		guint speed,
+		gpointer user_data)
+{
+	fan_set_speed(fan,speed);
+	fan_complete_set_speed(fan,invocation);
+	return TRUE;
+}
+
+static gboolean
+on_get_speed(Fan *fan,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	guint reading = fan_get_speed(fan);
+	fan_complete_get_speed(fan,invocation,reading);
+	return TRUE;
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	//g_print ("Acquired a message bus connection: %s\n",name);
+
+	cmdline *cmd = user_data;
+	if(cmd->argc < 2)
+	{
+		g_print("No objects created.  Put object name(s) on command line\n");
+		return;
+	}
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+	int i=0;
+	for(i=1;i<cmd->argc;i++)
+	{
+		gchar *s;
+		s = g_strdup_printf("%s/%s",dbus_object_path,cmd->argv[i]);
+		ObjectSkeleton *object = object_skeleton_new(s);
+		g_free(s);
+
+		Fan *fan = fan_skeleton_new();
+		object_skeleton_set_fan(object, fan);
+		g_object_unref(fan);
+
+		ObjectMapper* mapper = object_mapper_skeleton_new();
+		object_skeleton_set_object_mapper(object, mapper);
+		g_object_unref(mapper);
+
+		//define method callbacks here
+		g_signal_connect(fan,
+				"handle-get-speed",
+				G_CALLBACK(on_get_speed),
+				NULL); /* user_data */
+		g_signal_connect(fan,
+				"handle-set-speed",
+				G_CALLBACK(on_set_speed),
+				NULL); /* user_data */
+
+		//g_timeout_add(poll_interval, poll_sensor, object);
+
+		/* Export the object (@manager takes its own reference to @object) */
+		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+		g_object_unref(object);
+	}
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+	emit_object_added((GDBusObjectManager*)manager);
+}
+
+static void
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	//g_print ("Acquired the name %s\n", name);
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	//g_print ("Lost the name %s\n", name);
+}
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/flash_bios_obj.c b/objects/flash_bios_obj.c
index 89ddc4e..e661545 100644
--- a/objects/flash_bios_obj.c
+++ b/objects/flash_bios_obj.c
@@ -1,447 +1,449 @@
-#include <stdio.h>
-#include <stdbool.h>
-#include <string.h>
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "object_mapper.h"
-
-/* ---------------------------------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/control/flash";
-static const gchar* dbus_name        = "org.openbmc.control.Flash";
-static const gchar* FLASHER_BIN      = "flasher.exe";
-static const gchar* DLOAD_BUS = "org.openbmc.managers.Download";
-static const gchar* DLOAD_OBJ = "/org/openbmc/managers/Download";
-
-static GDBusObjectManagerServer *manager = NULL;
-
-void catch_child(int sig_num)
-{
-    /* when we get here, we know there's a zombie child waiting */
-    int child_status;
-
-    wait(&child_status);
-    printf("flasher exited.\n");
-}
-
-
-int update(Flash* flash, const char* obj_path)
-{
-	pid_t pid;
-	int status=-1;
-	pid = fork();
-	if (pid == 0)
-	{
-		const gchar* path = flash_get_flasher_path(flash);
-		const gchar* name = flash_get_flasher_name(flash);
-		const gchar* inst = flash_get_flasher_instance(flash);
-		const gchar* filename = flash_get_filename(flash);
-		status = execl(path, name, inst, filename, obj_path, NULL);
-		return status;
-	}
-	return 0;
-}
-
-static gboolean
-on_init (Flash          *f,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-	flash_complete_init(f,invocation);
-
-	//tune flash
-	if (strcmp(flash_get_flasher_instance(f),"bios") == 0)
-	{
-		flash_set_filename(f,"");
-		const gchar* obj_path = g_dbus_object_get_object_path((GDBusObject*)user_data);
-		int rc = update(f,obj_path);
-		if (rc==-1)
-		{
-			printf("ERROR FlashControl: Unable to init\n");
-		}
-		sleep(3);
-		rc = update(f,obj_path);
-		
-	}
-	return TRUE;
-}
-
-static gboolean
-on_lock (SharedResource          *lock,
-                GDBusMethodInvocation  *invocation,
-		gchar*                  name,
-                gpointer                user_data)
-{
-	gboolean locked = shared_resource_get_lock(lock);
-	if (locked)
-	{
-		const gchar* name = shared_resource_get_name(lock);
-		printf("ERROR: BIOS Flash is already locked: %s\n",name);
-	}
-	else
-	{	
-		printf("Locking BIOS Flash: %s\n",name);
-		shared_resource_set_lock(lock,true);
-		shared_resource_set_name(lock,name);
-	}
-	shared_resource_complete_lock(lock,invocation);
-	return TRUE;
-}
-static gboolean
-on_is_locked (SharedResource          *lock,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-	gboolean locked = shared_resource_get_lock(lock);
-	const gchar* name = shared_resource_get_name(lock);
-	shared_resource_complete_is_locked(lock,invocation,locked,name);
-	return TRUE;
-}
-
-
-static gboolean
-on_unlock (SharedResource          *lock,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-	printf("Unlocking BIOS Flash\n");
-	shared_resource_set_lock(lock,false);
-	shared_resource_set_name(lock,"");
-	shared_resource_complete_unlock(lock,invocation);
-	return TRUE;
-}
-
-static gboolean
-on_update_via_tftp (Flash          *flash,
-                GDBusMethodInvocation  *invocation,
-                gchar*                  url,
-                gchar*                  write_file,
-                gpointer                user_data)
-{
-	SharedResource *lock = object_get_shared_resource((Object*)user_data);
-	gboolean locked = shared_resource_get_lock(lock);
-	flash_complete_update_via_tftp(flash,invocation);
-	if (locked)
-	{
-		const gchar* name = shared_resource_get_name(lock);
-		printf("BIOS Flash is locked: %s\n",name);
-	}
-	else
-	{	
-		printf("Flashing BIOS from TFTP: %s,%s\n",url,write_file);
-		flash_set_filename(flash,write_file);
-		flash_emit_download(flash,url,write_file);
-		flash_set_status(flash,"Downloading");
-	}
-	return TRUE;
-}
-
-static gboolean
-on_error        (Flash          *flash,
-                GDBusMethodInvocation  *invocation,
-                gchar*                  error_msg,
-                gpointer                user_data)
-{
-	int rc = 0;
-	SharedResource *lock = object_get_shared_resource((Object*)user_data);
-	gboolean locked = shared_resource_get_lock(lock);
-	flash_set_status(flash, error_msg);
-	flash_complete_error(flash,invocation);
-	printf("ERROR: %s.  Clearing locks\n",error_msg);
-	shared_resource_set_lock(lock,false);
-	shared_resource_set_name(lock,"");
-	
-	return TRUE;
-}
-static gboolean
-on_done        (Flash          *flash,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-	int rc = 0;
-	SharedResource *lock = object_get_shared_resource((Object*)user_data);
-	gboolean locked = shared_resource_get_lock(lock);
-	flash_set_status(flash, "Flash Done");
-	flash_complete_done(flash,invocation);
-	printf("Flash Done. Clearing locks\n");
-	shared_resource_set_lock(lock,false);
-	shared_resource_set_name(lock,"");
-	const gchar* filename = flash_get_filename(flash);
-	rc = unlink(filename);
-	if (rc != 0 )
-	{
-		printf("ERROR: Unable to delete file %s (%d)\n",filename,rc);
-	}
-	
-	return TRUE;
-}
-
-
-static gboolean
-on_update (Flash          *flash,
-                GDBusMethodInvocation  *invocation,
-                gchar*                  write_file,
-                gpointer                user_data)
-{
-	int rc = 0;
-	SharedResource *lock = object_get_shared_resource((Object*)user_data);
-	gboolean locked = shared_resource_get_lock(lock);
-	flash_set_status(flash,"Flashing");
-	flash_complete_update(flash,invocation);
-	if (locked)
-	{
-		const gchar* name = shared_resource_get_name(lock);
-		printf("BIOS Flash is locked: %s\n",name);
-	}
-	else
-	{	
-		printf("Flashing BIOS from: %s\n",write_file);
-		flash_set_status(flash, "Flashing");
-		shared_resource_set_lock(lock,true);
-		shared_resource_set_name(lock,dbus_object_path);
-		flash_set_filename(flash,write_file);
-		const gchar* obj_path = g_dbus_object_get_object_path((GDBusObject*)user_data);
-		rc = update(flash,obj_path);
-		if (!rc)
-		{
-			shared_resource_set_lock(lock,false);
-			shared_resource_set_name(lock,"");
-		}
-	}
-	return TRUE;
-}
-static void
-on_flash_progress (GDBusConnection* connection,
-               const gchar* sender_name,
-               const gchar* object_path,
-               const gchar* interface_name,
-               const gchar* signal_name,
-               GVariant* parameters,
-               gpointer user_data) 
-{
-	Flash *flash = object_get_flash((Object*)user_data);
-	SharedResource *lock = object_get_shared_resource((Object*)user_data);
-	GVariantIter *iter = g_variant_iter_new(parameters);
-	GVariant* v_filename = g_variant_iter_next_value(iter);
-	GVariant* v_progress = g_variant_iter_next_value(iter);
-	
-	uint8_t progress = g_variant_get_byte(v_progress);
-
-	gchar *s;
-	s = g_strdup_printf ("Flashing: %d%%",progress);
-	flash_set_status(flash,s);
-	g_free(s);
-}
-
-static void
-on_flash_done (GDBusConnection* connection,
-               const gchar* sender_name,
-               const gchar* object_path,
-               const gchar* interface_name,
-               const gchar* signal_name,
-               GVariant* parameters,
-               gpointer user_data) 
-{
-	Flash *flash = object_get_flash((Object*)user_data);
-	SharedResource *lock = object_get_shared_resource((Object*)user_data);
-	printf("Flash succeeded; unlocking flash\n");
-	shared_resource_set_lock(lock,false);
-	shared_resource_set_name(lock,"");
-	flash_set_status(flash,"Flash Done");
-}
-
-static void
-on_flash_error (GDBusConnection* connection,
-               const gchar* sender_name,
-               const gchar* object_path,
-               const gchar* interface_name,
-               const gchar* signal_name,
-               GVariant* parameters,
-               gpointer user_data) 
-{
-	Flash *flash = object_get_flash((Object*)user_data);
-	SharedResource *lock = object_get_shared_resource((Object*)user_data);
-	printf("Flash Error; unlocking flash\n");
-	shared_resource_set_lock(lock,false);
-	shared_resource_set_name(lock,"");
-}
-
-static void
-on_download_error (GDBusConnection* connection,
-               const gchar* sender_name,
-               const gchar* object_path,
-               const gchar* interface_name,
-               const gchar* signal_name,
-               GVariant* parameters,
-               gpointer user_data) 
-{
-	Flash *flash = object_get_flash((Object*)user_data);
-	SharedResource *lock = object_get_shared_resource((Object*)user_data);
-	printf("ERROR: FlashBios:  Download error; clearing flash lock\n");
-	shared_resource_set_lock(lock,false);
-	shared_resource_set_name(lock,"");
-}
-
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-	ObjectSkeleton *object;
- 	cmdline *cmd = user_data;
-  	manager = g_dbus_object_manager_server_new (dbus_object_path);
-  	int i=0;
-
-	//TODO: don't use fixed buffer
-	char flasher_path[512];
-	memset(flasher_path, '\0', sizeof(flasher_path));
-	bool found = false;
-	gchar *flasher_file;
-	int c = strlen(cmd->argv[0]);
-	while(c>0)
-	{
-		if (cmd->argv[0][c] == '/')
-		{
-			strncpy(flasher_path,cmd->argv[0],c);
-			flasher_file = g_strdup_printf ("%s/%s",flasher_path,FLASHER_BIN);
-			break;
-		}
-		c--;
-	}
-
-	const char* inst[] = {"bios"};
-  	for (i=0;i<1;i++)
-  	{
-		gchar* s;
-		s = g_strdup_printf ("%s/%s",dbus_object_path,inst[i]);
-		object = object_skeleton_new (s);
-		g_free (s);
-
-		Flash* flash = flash_skeleton_new ();
-		object_skeleton_set_flash (object, flash);
- 		g_object_unref (flash);
-
-		SharedResource* lock = shared_resource_skeleton_new ();
-		object_skeleton_set_shared_resource (object, lock);
- 		g_object_unref (lock);
-
-		ObjectMapper* mapper = object_mapper_skeleton_new ();
-		object_skeleton_set_object_mapper (object, mapper);
-		g_object_unref (mapper);
-
-		shared_resource_set_lock(lock,false);
-		shared_resource_set_name(lock,"");
-
-		flash_set_flasher_path(flash,flasher_file);
-		flash_set_flasher_name(flash,FLASHER_BIN);
-		flash_set_flasher_instance(flash,inst[i]);
-		//g_free (s);
-
-
-		//define method callbacks here
-		g_signal_connect (lock,
-                    "handle-lock",
-                    G_CALLBACK (on_lock),
-                    NULL); /* user_data */
-		g_signal_connect (lock,
-                    "handle-unlock",
-                    G_CALLBACK (on_unlock),
-                    NULL); /* user_data */
-		g_signal_connect (lock,
-                    "handle-is-locked",
-                    G_CALLBACK (on_is_locked),
-                    NULL); /* user_data */
-
-		g_signal_connect (flash,
-                    "handle-update",
-                    G_CALLBACK (on_update),
-                    object); /* user_data */
-
-		g_signal_connect (flash,
-                    "handle-error",
-                    G_CALLBACK (on_error),
-                    object); /* user_data */
-
-		g_signal_connect (flash,
-                    "handle-done",
-                    G_CALLBACK (on_done),
-                    object); /* user_data */
-
-		g_signal_connect (flash,
-                    "handle-update-via-tftp",
-                    G_CALLBACK (on_update_via_tftp),
-                    object); /* user_data */
-
-		g_signal_connect (flash,
-                    "handle-init",
-                    G_CALLBACK (on_init),
-                    object); /* user_data */
-
-		s = g_strdup_printf ("/org/openbmc/control/%s",inst[i]);
-		g_dbus_connection_signal_subscribe(connection,
-                                   NULL,
-                                   "org.openbmc.FlashControl",
-                                   "Progress",
-                                   s,
-                                   NULL,
-                                   G_DBUS_SIGNAL_FLAGS_NONE,
-                                   (GDBusSignalCallback) on_flash_progress,
-                                   object,
-                                   NULL );
-
-		g_free (s);
-
- 
-		flash_set_filename(flash,"");
-		/* Export the object (@manager takes its own reference to @object) */
-		g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-  		g_object_unref (object);
-	}
-	g_free(flasher_file);
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection (manager, connection);
-	emit_object_added((GDBusObjectManager*)manager); 
-}
-
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
-{
-//  g_print ("Acquired the name %s\n", name);
-}
-
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
-{
-  //g_print ("Lost the name %s\n", name);
-}
-
-gint
-main (gint argc, gchar *argv[])
-{
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-
-  //signal(SIGCHLD, catch_child);
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
-}
+#include <stdio.h>
+#include <stdbool.h>
+#include <string.h>
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include "object_mapper.h"
+
+/* ------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/control/flash";
+static const gchar* dbus_name = "org.openbmc.control.Flash";
+static const gchar* FLASHER_BIN = "flasher.exe";
+static const gchar* DLOAD_BUS = "org.openbmc.managers.Download";
+static const gchar* DLOAD_OBJ = "/org/openbmc/managers/Download";
+
+static GDBusObjectManagerServer *manager = NULL;
+
+void
+catch_child(int sig_num)
+{
+	/* when we get here, we know there's a zombie child waiting */
+	int child_status;
+
+	wait(&child_status);
+	printf("flasher exited.\n");
+}
+
+int
+update(Flash* flash, const char* obj_path)
+{
+	pid_t pid;
+	int status=-1;
+	pid = fork();
+	if(pid == 0)
+	{
+		const gchar* path = flash_get_flasher_path(flash);
+		const gchar* name = flash_get_flasher_name(flash);
+		const gchar* inst = flash_get_flasher_instance(flash);
+		const gchar* filename = flash_get_filename(flash);
+		status = execl(path, name, inst, filename, obj_path, NULL);
+		return status;
+	}
+	return 0;
+}
+
+static gboolean
+on_init(Flash *f,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	flash_complete_init(f,invocation);
+
+	//tune flash
+	if(strcmp(flash_get_flasher_instance(f),"bios") == 0)
+	{
+		flash_set_filename(f,"");
+		const gchar* obj_path = g_dbus_object_get_object_path((GDBusObject*)user_data);
+		int rc = update(f,obj_path);
+		if(rc==-1)
+		{
+			printf("ERROR FlashControl: Unable to init\n");
+		}
+		sleep(3);
+		rc = update(f,obj_path);
+
+	}
+	return TRUE;
+}
+
+static gboolean
+on_lock(SharedResource *lock,
+		GDBusMethodInvocation *invocation,
+		gchar* name,
+		gpointer user_data)
+{
+	gboolean locked = shared_resource_get_lock(lock);
+	if(locked)
+	{
+		const gchar* name = shared_resource_get_name(lock);
+		printf("ERROR: BIOS Flash is already locked: %s\n",name);
+	}
+	else
+	{
+		printf("Locking BIOS Flash: %s\n",name);
+		shared_resource_set_lock(lock,true);
+		shared_resource_set_name(lock,name);
+	}
+	shared_resource_complete_lock(lock,invocation);
+	return TRUE;
+}
+
+static gboolean
+on_is_locked(SharedResource *lock,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	gboolean locked = shared_resource_get_lock(lock);
+	const gchar* name = shared_resource_get_name(lock);
+	shared_resource_complete_is_locked(lock,invocation,locked,name);
+	return TRUE;
+}
+
+static gboolean
+on_unlock(SharedResource *lock,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	printf("Unlocking BIOS Flash\n");
+	shared_resource_set_lock(lock,false);
+	shared_resource_set_name(lock,"");
+	shared_resource_complete_unlock(lock,invocation);
+	return TRUE;
+}
+
+static gboolean
+on_update_via_tftp(Flash *flash,
+		GDBusMethodInvocation *invocation,
+		gchar* url,
+		gchar* write_file,
+		gpointer user_data)
+{
+	SharedResource *lock = object_get_shared_resource((Object*)user_data);
+	gboolean locked = shared_resource_get_lock(lock);
+	flash_complete_update_via_tftp(flash,invocation);
+	if(locked)
+	{
+		const gchar* name = shared_resource_get_name(lock);
+		printf("BIOS Flash is locked: %s\n",name);
+	}
+	else
+	{
+		printf("Flashing BIOS from TFTP: %s,%s\n",url,write_file);
+		flash_set_filename(flash,write_file);
+		flash_emit_download(flash,url,write_file);
+		flash_set_status(flash,"Downloading");
+	}
+	return TRUE;
+}
+
+static gboolean
+on_error(Flash *flash,
+		GDBusMethodInvocation *invocation,
+		gchar* error_msg,
+		gpointer user_data)
+{
+	int rc = 0;
+	SharedResource *lock = object_get_shared_resource((Object*)user_data);
+	gboolean locked = shared_resource_get_lock(lock);
+	flash_set_status(flash, error_msg);
+	flash_complete_error(flash,invocation);
+	printf("ERROR: %s.  Clearing locks\n",error_msg);
+	shared_resource_set_lock(lock,false);
+	shared_resource_set_name(lock,"");
+
+	return TRUE;
+}
+
+static gboolean
+on_done(Flash *flash,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	int rc = 0;
+	SharedResource *lock = object_get_shared_resource((Object*)user_data);
+	gboolean locked = shared_resource_get_lock(lock);
+	flash_set_status(flash, "Flash Done");
+	flash_complete_done(flash,invocation);
+	printf("Flash Done. Clearing locks\n");
+	shared_resource_set_lock(lock,false);
+	shared_resource_set_name(lock,"");
+	const gchar* filename = flash_get_filename(flash);
+	rc = unlink(filename);
+	if(rc != 0 )
+	{
+		printf("ERROR: Unable to delete file %s (%d)\n",filename,rc);
+	}
+
+	return TRUE;
+}
+
+static gboolean
+on_update(Flash *flash,
+		GDBusMethodInvocation *invocation,
+		gchar* write_file,
+		gpointer user_data)
+{
+	int rc = 0;
+	SharedResource *lock = object_get_shared_resource((Object*)user_data);
+	gboolean locked = shared_resource_get_lock(lock);
+	flash_set_status(flash,"Flashing");
+	flash_complete_update(flash,invocation);
+	if(locked)
+	{
+		const gchar* name = shared_resource_get_name(lock);
+		printf("BIOS Flash is locked: %s\n",name);
+	}
+	else
+	{
+		printf("Flashing BIOS from: %s\n",write_file);
+		flash_set_status(flash, "Flashing");
+		shared_resource_set_lock(lock,true);
+		shared_resource_set_name(lock,dbus_object_path);
+		flash_set_filename(flash,write_file);
+		const gchar* obj_path = g_dbus_object_get_object_path((GDBusObject*)user_data);
+		rc = update(flash,obj_path);
+		if(!rc)
+		{
+			shared_resource_set_lock(lock,false);
+			shared_resource_set_name(lock,"");
+		}
+	}
+	return TRUE;
+}
+
+static void
+on_flash_progress(GDBusConnection* connection,
+		const gchar* sender_name,
+		const gchar* object_path,
+		const gchar* interface_name,
+		const gchar* signal_name,
+		GVariant* parameters,
+		gpointer user_data)
+{
+	Flash *flash = object_get_flash((Object*)user_data);
+	SharedResource *lock = object_get_shared_resource((Object*)user_data);
+	GVariantIter *iter = g_variant_iter_new(parameters);
+	GVariant* v_filename = g_variant_iter_next_value(iter);
+	GVariant* v_progress = g_variant_iter_next_value(iter);
+
+	uint8_t progress = g_variant_get_byte(v_progress);
+
+	gchar *s;
+	s = g_strdup_printf("Flashing: %d%%",progress);
+	flash_set_status(flash,s);
+	g_free(s);
+}
+
+static void
+on_flash_done(GDBusConnection* connection,
+		const gchar* sender_name,
+		const gchar* object_path,
+		const gchar* interface_name,
+		const gchar* signal_name,
+		GVariant* parameters,
+		gpointer user_data)
+{
+	Flash *flash = object_get_flash((Object*)user_data);
+	SharedResource *lock = object_get_shared_resource((Object*)user_data);
+	printf("Flash succeeded; unlocking flash\n");
+	shared_resource_set_lock(lock,false);
+	shared_resource_set_name(lock,"");
+	flash_set_status(flash,"Flash Done");
+}
+
+static void
+on_flash_error(GDBusConnection* connection,
+		const gchar* sender_name,
+		const gchar* object_path,
+		const gchar* interface_name,
+		const gchar* signal_name,
+		GVariant* parameters,
+		gpointer user_data)
+{
+	Flash *flash = object_get_flash((Object*)user_data);
+	SharedResource *lock = object_get_shared_resource((Object*)user_data);
+	printf("Flash Error; unlocking flash\n");
+	shared_resource_set_lock(lock,false);
+	shared_resource_set_name(lock,"");
+}
+
+static void
+on_download_error(GDBusConnection* connection,
+		const gchar* sender_name,
+		const gchar* object_path,
+		const gchar* interface_name,
+		const gchar* signal_name,
+		GVariant* parameters,
+		gpointer user_data)
+{
+	Flash *flash = object_get_flash((Object*)user_data);
+	SharedResource *lock = object_get_shared_resource((Object*)user_data);
+	printf("ERROR: FlashBios:  Download error; clearing flash lock\n");
+	shared_resource_set_lock(lock,false);
+	shared_resource_set_name(lock,"");
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	ObjectSkeleton *object;
+	cmdline *cmd = user_data;
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+	int i=0;
+
+	//TODO: don't use fixed buffer
+	char flasher_path[512];
+	memset(flasher_path, '\0', sizeof(flasher_path));
+	bool found = false;
+	gchar *flasher_file;
+	int c = strlen(cmd->argv[0]);
+	while(c>0)
+	{
+		if(cmd->argv[0][c] == '/')
+		{
+			strncpy(flasher_path,cmd->argv[0],c);
+			flasher_file = g_strdup_printf("%s/%s",flasher_path,FLASHER_BIN);
+			break;
+		}
+		c--;
+	}
+
+	const char* inst[] = {"bios"};
+	for(i=0;i<1;i++)
+	{
+		gchar* s;
+		s = g_strdup_printf("%s/%s",dbus_object_path,inst[i]);
+		object = object_skeleton_new(s);
+		g_free(s);
+
+		Flash* flash = flash_skeleton_new();
+		object_skeleton_set_flash(object, flash);
+		g_object_unref(flash);
+
+		SharedResource* lock = shared_resource_skeleton_new();
+		object_skeleton_set_shared_resource(object, lock);
+		g_object_unref(lock);
+
+		ObjectMapper* mapper = object_mapper_skeleton_new();
+		object_skeleton_set_object_mapper(object, mapper);
+		g_object_unref(mapper);
+
+		shared_resource_set_lock(lock,false);
+		shared_resource_set_name(lock,"");
+
+		flash_set_flasher_path(flash,flasher_file);
+		flash_set_flasher_name(flash,FLASHER_BIN);
+		flash_set_flasher_instance(flash,inst[i]);
+		//g_free (s);
+
+
+		//define method callbacks here
+		g_signal_connect(lock,
+				"handle-lock",
+				G_CALLBACK(on_lock),
+				NULL); /* user_data */
+		g_signal_connect(lock,
+				"handle-unlock",
+				G_CALLBACK(on_unlock),
+				NULL); /* user_data */
+		g_signal_connect(lock,
+				"handle-is-locked",
+				G_CALLBACK(on_is_locked),
+				NULL); /* user_data */
+
+		g_signal_connect(flash,
+				"handle-update",
+				G_CALLBACK(on_update),
+				object); /* user_data */
+
+		g_signal_connect(flash,
+				"handle-error",
+				G_CALLBACK(on_error),
+				object); /* user_data */
+
+		g_signal_connect(flash,
+				"handle-done",
+				G_CALLBACK(on_done),
+				object); /* user_data */
+
+		g_signal_connect(flash,
+				"handle-update-via-tftp",
+				G_CALLBACK(on_update_via_tftp),
+				object); /* user_data */
+
+		g_signal_connect(flash,
+				"handle-init",
+				G_CALLBACK(on_init),
+				object); /* user_data */
+
+		s = g_strdup_printf("/org/openbmc/control/%s",inst[i]);
+		g_dbus_connection_signal_subscribe(connection,
+				NULL,
+				"org.openbmc.FlashControl",
+				"Progress",
+				s,
+				NULL,
+				G_DBUS_SIGNAL_FLAGS_NONE,
+				(GDBusSignalCallback) on_flash_progress,
+				object,
+				NULL );
+
+		g_free(s);
+
+
+		flash_set_filename(flash,"");
+		/* Export the object (@manager takes its own reference to @object) */
+		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+		g_object_unref(object);
+	}
+	g_free(flasher_file);
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+	emit_object_added((GDBusObjectManager*)manager);
+}
+
+static void
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	//  g_print ("Acquired the name %s\n", name);
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	//g_print ("Lost the name %s\n", name);
+}
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+
+	//signal(SIGCHLD, catch_child);
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/flasher_obj.c b/objects/flasher_obj.c
index 2c46760..2d80847 100644
--- a/objects/flasher_obj.c
+++ b/objects/flasher_obj.c
@@ -1,457 +1,464 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <fcntl.h>
-#include <sys/mman.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <unistd.h>
-#include <byteswap.h>
-#include <stdint.h>
-#include <stdbool.h>
-#include <getopt.h>
-#include <limits.h>
-#include <arpa/inet.h>
-#include <assert.h>
-
-#include <libflash/libflash.h>
-#include <libflash/libffs.h>
-#include "progress.h"
-#include "io.h"
-#include "ast.h"
-#include "sfc-ctrl.h"
-#include "interfaces/openbmc_intf.h"
-#include "includes/openbmc.h"
-
-static const gchar* dbus_object_path = "/org/openbmc/control";
-static const gchar* dbus_object_name = "Flasher_0";
-static const gchar* dbus_name        = "org.openbmc.control.Flasher";
-
-static GDBusObjectManagerServer *manager = NULL;
-
-#define __aligned(x)			__attribute__((aligned(x)))
-
-#define PFLASH_VERSION	"0.8.6"
-
-static bool must_confirm = false;
-static bool dummy_run;
-static bool need_relock;
-static bool bmc_flash;
-#ifdef __powerpc__
-static bool using_sfc;
-#endif
-
-#define FILE_BUF_SIZE	0x10000
-static uint8_t file_buf[FILE_BUF_SIZE] __aligned(0x1000);
-
-static struct spi_flash_ctrl	*fl_ctrl;
-static struct flash_chip	*fl_chip;
-static struct ffs_handle	*ffsh;
-static uint32_t			fl_total_size, fl_erase_granule;
-static const char		*fl_name;
-static int32_t			ffs_index = -1;
-
-static uint8_t FLASH_OK = 0;
-static uint8_t FLASH_ERROR = 0x01;
-static uint8_t FLASH_SETUP_ERROR = 0x02;
-static struct blocklevel_device *bl;
-
-static int erase_chip(void)
-{
-	int rc = 0;
-
-	printf("Erasing... (may take a while !) ");
-	fflush(stdout);
-
-	rc = flash_erase_chip(fl_chip);
-	if (rc) {
-		fprintf(stderr, "Error %d erasing chip\n", rc);
-		return(rc);
-	}
-
-	printf("done !\n");
-	return (rc);
-}
-
-
-void flash_message(GDBusConnection* connection,char* obj_path,char* method, char* error_msg)
-{
-	GDBusProxy *proxy;
- 	GError *error;
-	GVariant *parm = NULL;
-	GVariant *result;
-	error = NULL;
-	proxy = g_dbus_proxy_new_sync (connection,
-                             G_DBUS_PROXY_FLAGS_NONE,
-                             NULL,                      /* GDBusInterfaceInfo* */
-                             "org.openbmc.control.Flash", /* name */
-                             obj_path, /* object path */
-                             "org.openbmc.Flash",        /* interface name */
-                             NULL,                      /* GCancellable */
-                             &error);
-	g_assert_no_error (error);
-
-	error = NULL;
-	if (strcmp(method,"error")==0) {
-		parm = g_variant_new("(s)",error_msg);
-	}
-	result = g_dbus_proxy_call_sync (proxy,
-                                   method,
-				   parm,
-                                   G_DBUS_CALL_FLAGS_NONE,
-                                   -1,
-                                   NULL,
-                                   &error);
-
-	g_assert_no_error (error);
-}
-
-
-static int program_file(FlashControl* flash_control, const char *file, uint32_t start, uint32_t size)
-{
-	int fd, rc;
-	ssize_t len;
-	uint32_t actual_size = 0;
-
-	fd = open(file, O_RDONLY);
-	if (fd == -1) {
-		perror("Failed to open file");
-		return(fd);
-	}
-	printf("About to program \"%s\" at 0x%08x..0x%08x !\n",
-	       file, start, size);
-
-	printf("Programming & Verifying...\n");
-	//progress_init(size >> 8);
-	unsigned int save_size = size;
-	uint8_t last_progress = 0;
-	while(size) {
-		len = read(fd, file_buf, FILE_BUF_SIZE);
-		if (len < 0) {
-			perror("Error reading file");
-			return(1);
-		}
-		if (len == 0)
-			break;
-		if (len > size)
-			len = size;
-		size -= len;
-		actual_size += len;
-		rc = flash_write(fl_chip, start, file_buf, len, true);
-		if (rc) {
-			if (rc == FLASH_ERR_VERIFY_FAILURE)
-				fprintf(stderr, "Verification failed for"
-					" chunk at 0x%08x\n", start);
-			else
-				fprintf(stderr, "Flash write error %d for"
-					" chunk at 0x%08x\n", rc, start);
-			return(rc);
-		}
-		start += len;
-		unsigned int percent = (100*actual_size/save_size);
-		uint8_t progress = (uint8_t) (percent);
-		if (progress != last_progress) {
-			flash_control_emit_progress(flash_control,file,progress);
-			last_progress = progress;
-		}
-	}
-	close(fd);
-
-	/* If this is a flash partition, adjust its size */
-	if (ffsh && ffs_index >= 0) {
-		printf("Updating actual size in partition header...\n");
-		ffs_update_act_size(ffsh, ffs_index, actual_size);
-	}
-	return(0);
-}
-
-static void do_read_file(const char *file, uint32_t start, uint32_t size)
-{
-	int fd, rc;
-	ssize_t len;
-	uint32_t done = 0;
-
-	fd = open(file, O_WRONLY | O_TRUNC | O_CREAT, 00666);
-	if (fd == -1) {
-		perror("Failed to open file");
-		exit(1);
-	}
-	printf("Reading to \"%s\" from 0x%08x..0x%08x !\n",
-	       file, start, size);
-
-	progress_init(size >> 8);
-	while(size) {
-		len = size > FILE_BUF_SIZE ? FILE_BUF_SIZE : size;
-		rc = flash_read(fl_chip, start, file_buf, len);
-		if (rc) {
-			fprintf(stderr, "Flash read error %d for"
-				" chunk at 0x%08x\n", rc, start);
-			exit(1);
-		}
-		rc = write(fd, file_buf, len);
-		if (rc < 0) {
-			perror("Error writing file");
-			exit(1);
-		}
-		start += len;
-		size -= len;
-		done += len;
-		progress_tick(done >> 8);
-	}
-	progress_end();
-	close(fd);
-}
-static void flash_access_cleanup_bmc(void)
-{
-	if (ffsh)
-		ffs_close(ffsh);
-	flash_exit(fl_chip);
-	ast_sf_close(fl_ctrl);
-	close_devs();
-}
-
-static int flash_access_setup_bmc(bool use_lpc, bool need_write)
-{
-	int rc;
-	printf("Setting up BMC flash\n");
-	/* Open and map devices */
-	open_devs(use_lpc, true);
-
-	/* Create the AST flash controller */
-	rc = ast_sf_open(AST_SF_TYPE_BMC, &fl_ctrl);
-	if (rc) {
-		fprintf(stderr, "Failed to open controller\n");
-		return FLASH_SETUP_ERROR;
-	}
-
-	/* Open flash chip */
-	rc = flash_init(fl_ctrl, &fl_chip);
-	if (rc) {
-		fprintf(stderr, "Failed to open flash chip\n");
-		return FLASH_SETUP_ERROR;
-	}
-
-	/* Setup cleanup function */
-	atexit(flash_access_cleanup_bmc);
-	return FLASH_OK;
-}
-
-static void flash_access_cleanup_pnor(void)
-{
-	/* Re-lock flash */
-	if (need_relock)
-		set_wrprotect(true);
-
-	if (ffsh)
-		ffs_close(ffsh);
-	flash_exit(fl_chip);
-#ifdef __powerpc__
-	if (using_sfc)
-		sfc_close(fl_ctrl);
-	else
-		ast_sf_close(fl_ctrl);
-#else
-	ast_sf_close(fl_ctrl);
-#endif
-	close_devs();
-}
-
-static int flash_access_setup_pnor(bool use_lpc, bool use_sfc, bool need_write)
-{
-	int rc;
-	printf("Setting up BIOS flash\n");
-
-	/* Open and map devices */
-	open_devs(use_lpc, false);
-
-#ifdef __powerpc__
-	if (use_sfc) {
-		/* Create the SFC flash controller */
-		rc = sfc_open(&fl_ctrl);
-		if (rc) {
-			fprintf(stderr, "Failed to open controller\n");
-			return FLASH_SETUP_ERROR;
-		}
-		using_sfc = true;
-	} else {
-#endif			
-		/* Create the AST flash controller */
-		rc = ast_sf_open(AST_SF_TYPE_PNOR, &fl_ctrl);
-		if (rc) {
-			fprintf(stderr, "Failed to open controller\n");
-			return FLASH_SETUP_ERROR;
-		}
-#ifdef __powerpc__
-	}
-#endif
-
-	/* Open flash chip */
-	rc = flash_init(fl_ctrl, &fl_chip);
-	if (rc) {
-		fprintf(stderr, "Failed to open flash chip\n");
-		return FLASH_SETUP_ERROR;
-	}
-
-	/* Unlock flash (PNOR only) */
-	if (need_write)
-		need_relock = set_wrprotect(false);
-
-	/* Setup cleanup function */
-	atexit(flash_access_cleanup_pnor);
-	return FLASH_OK;
-}
-
-uint8_t flash(FlashControl* flash_control,bool bmc_flash, uint32_t address, char* write_file, char* obj_path)
-{
-	bool has_sfc = false, has_ast = false, use_lpc = true;
-	bool erase = true, program = true;
-
-	int rc;
-	printf("flasher: %s, BMC = %d, address = 0x%x\n",write_file,bmc_flash,address);
-#ifdef __arm__
-	/* Check platform */
-	check_platform(&has_sfc, &has_ast);
-
-	/* Prepare for access */
-	if (bmc_flash) {
-		if (!has_ast) {
-			fprintf(stderr, "No BMC on this platform\n");
-			return FLASH_SETUP_ERROR;
-		}
-		rc = flash_access_setup_bmc(use_lpc, erase || program);
-		if (rc) {
-			return FLASH_SETUP_ERROR;
-		}
-	} else {
-		if (!has_ast && !has_sfc) {
-			fprintf(stderr, "No BMC nor SFC on this platform\n");
-			return FLASH_SETUP_ERROR;
-		}
-		rc = flash_access_setup_pnor(use_lpc, has_sfc, erase || program);
-		if (rc) {
-			return FLASH_SETUP_ERROR;
-		}
-	}
-
-	rc = flash_get_info(fl_chip, &fl_name,
-			    &fl_total_size, &fl_erase_granule);
-	if (rc) {
-		fprintf(stderr, "Error %d getting flash info\n", rc);
-		return FLASH_SETUP_ERROR;
-	}
-#endif
-	if (strcmp(write_file,"")!=0)
-	{
-		// If file specified but not size, get size from file
-		struct stat stbuf;
-		if (stat(write_file, &stbuf)) {
-			perror("Failed to get file size");
-			return FLASH_ERROR;
-		}
-		uint32_t write_size = stbuf.st_size;
-#ifdef __arm__
-		rc = erase_chip();
-		if (rc) {
-			return FLASH_ERROR;
-		}
-		rc = program_file(flash_control, write_file, address, write_size);
-		if (rc) {
-			return FLASH_ERROR;
-		}
-#endif
-	
-		printf("Flash done\n");
-	}
-	else 
-	{
-		printf("Flash tuned\n");
-	}
-	return FLASH_OK;
-}
-
-static void
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-
-	cmdline *cmd = user_data;
-	if (cmd->argc < 4)
-	{
-		g_print("flasher [flash name] [filename] [source object]\n");
-		g_main_loop_quit(cmd->loop);
-		return;
-	}
-	printf("Starting flasher: %s,%s,%s,\n",cmd->argv[1],cmd->argv[2],cmd->argv[3]);	
-	ObjectSkeleton *object;
-  	manager = g_dbus_object_manager_server_new (dbus_object_path);
-	gchar *s;
-	s = g_strdup_printf ("%s/%s",dbus_object_path,cmd->argv[1]);
-
-	object = object_skeleton_new (s);
-	g_free (s);
-
-	FlashControl* flash_control = flash_control_skeleton_new ();
-	object_skeleton_set_flash_control (object, flash_control);
-	g_object_unref (flash_control);
-
-	/* Export the object (@manager takes its own reference to @object) */
-	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-	g_object_unref (object);
-
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection (manager, connection);
-	bool bmc_flash = false;
-	uint32_t address = 0;
-	if (strcmp(cmd->argv[1],"bmc")==0) {
-		bmc_flash = true;
-	}
-	if (strcmp(cmd->argv[1],"bmc_ramdisk")==0) {
-		bmc_flash = true;
-		address = 0x20300000;
-	}
-	if (strcmp(cmd->argv[1],"bmc_kernel")==0) {
-		bmc_flash = true;
-		address = 0x20080000;
-	}
-
-	int rc = flash(flash_control,bmc_flash,address,cmd->argv[2],cmd->argv[3]);
-	if (rc) {
-		flash_message(connection,cmd->argv[3],"error","Flash Error");
-	} else {
-		flash_message(connection,cmd->argv[3],"done","");
-	}
-
-	//Object exits when done flashing	
-	g_main_loop_quit(cmd->loop);
-}
-
-int main(int argc, char *argv[])
-{
-
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-  cmd.loop = loop;
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       NULL,
-                       NULL,
-                       &cmd,
-                       NULL);
-
-   g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-
-	return 0;
-}
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+#include <byteswap.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <getopt.h>
+#include <limits.h>
+#include <arpa/inet.h>
+#include <assert.h>
+
+#include <libflash/libflash.h>
+#include <libflash/libffs.h>
+#include "progress.h"
+#include "io.h"
+#include "ast.h"
+#include "sfc-ctrl.h"
+#include "interfaces/openbmc_intf.h"
+#include "includes/openbmc.h"
+
+static const gchar* dbus_object_path = "/org/openbmc/control";
+static const gchar* dbus_object_name = "Flasher_0";
+static const gchar* dbus_name = "org.openbmc.control.Flasher";
+
+static GDBusObjectManagerServer *manager = NULL;
+
+#define __aligned(x)			__attribute__((aligned(x)))
+
+#define PFLASH_VERSION	"0.8.6"
+
+static bool must_confirm = false;
+static bool dummy_run;
+static bool need_relock;
+static bool bmc_flash;
+#ifdef __powerpc__
+static bool using_sfc;
+#endif
+
+#define FILE_BUF_SIZE	0x10000
+static uint8_t file_buf[FILE_BUF_SIZE] __aligned(0x1000);
+
+static struct spi_flash_ctrl	*fl_ctrl;
+static struct flash_chip	*fl_chip;
+static struct ffs_handle	*ffsh;
+static uint32_t			fl_total_size, fl_erase_granule;
+static const char		*fl_name;
+static int32_t			ffs_index = -1;
+
+static uint8_t FLASH_OK = 0;
+static uint8_t FLASH_ERROR = 0x01;
+static uint8_t FLASH_SETUP_ERROR = 0x02;
+static struct blocklevel_device *bl;
+
+static int
+erase_chip(void)
+{
+	int rc = 0;
+
+	printf("Erasing... (may take a while !) ");
+	fflush(stdout);
+
+	rc = flash_erase_chip(fl_chip);
+	if(rc) {
+		fprintf(stderr, "Error %d erasing chip\n", rc);
+		return(rc);
+	}
+
+	printf("done !\n");
+	return(rc);
+}
+
+void
+flash_message(GDBusConnection* connection,char* obj_path,char* method, char* error_msg)
+{
+	GDBusProxy *proxy;
+	GError *error;
+	GVariant *parm = NULL;
+	GVariant *result;
+	error = NULL;
+	proxy = g_dbus_proxy_new_sync(connection,
+			G_DBUS_PROXY_FLAGS_NONE,
+			NULL, /* GDBusInterfaceInfo* */
+			"org.openbmc.control.Flash", /* name */
+			obj_path, /* object path */
+			"org.openbmc.Flash", /* interface name */
+			NULL, /* GCancellable */
+			&error);
+	g_assert_no_error(error);
+
+	error = NULL;
+	if(strcmp(method,"error")==0) {
+		parm = g_variant_new("(s)",error_msg);
+	}
+	result = g_dbus_proxy_call_sync(proxy,
+			method,
+			parm,
+			G_DBUS_CALL_FLAGS_NONE,
+			-1,
+			NULL,
+			&error);
+
+	g_assert_no_error(error);
+}
+
+static int
+program_file(FlashControl* flash_control, const char *file, uint32_t start, uint32_t size)
+{
+	int fd, rc;
+	ssize_t len;
+	uint32_t actual_size = 0;
+
+	fd = open(file, O_RDONLY);
+	if(fd == -1) {
+		perror("Failed to open file");
+		return(fd);
+	}
+	printf("About to program \"%s\" at 0x%08x..0x%08x !\n",
+			file, start, size);
+
+	printf("Programming & Verifying...\n");
+	//progress_init(size >> 8);
+	unsigned int save_size = size;
+	uint8_t last_progress = 0;
+	while(size) {
+		len = read(fd, file_buf, FILE_BUF_SIZE);
+		if(len < 0) {
+			perror("Error reading file");
+			return(1);
+		}
+		if(len == 0)
+			break;
+		if(len > size)
+			len = size;
+		size -= len;
+		actual_size += len;
+		rc = flash_write(fl_chip, start, file_buf, len, true);
+		if(rc) {
+			if(rc == FLASH_ERR_VERIFY_FAILURE)
+				fprintf(stderr, "Verification failed for"
+						" chunk at 0x%08x\n", start);
+			else
+				fprintf(stderr, "Flash write error %d for"
+						" chunk at 0x%08x\n", rc, start);
+			return(rc);
+		}
+		start += len;
+		unsigned int percent = (100*actual_size/save_size);
+		uint8_t progress = (uint8_t)(percent);
+		if(progress != last_progress) {
+			flash_control_emit_progress(flash_control,file,progress);
+			last_progress = progress;
+		}
+	}
+	close(fd);
+
+	/* If this is a flash partition, adjust its size */
+	if(ffsh && ffs_index >= 0) {
+		printf("Updating actual size in partition header...\n");
+		ffs_update_act_size(ffsh, ffs_index, actual_size);
+	}
+	return(0);
+}
+
+static void
+do_read_file(const char *file, uint32_t start, uint32_t size)
+{
+	int fd, rc;
+	ssize_t len;
+	uint32_t done = 0;
+
+	fd = open(file, O_WRONLY | O_TRUNC | O_CREAT, 00666);
+	if(fd == -1) {
+		perror("Failed to open file");
+		exit(1);
+	}
+	printf("Reading to \"%s\" from 0x%08x..0x%08x !\n",
+			file, start, size);
+
+	progress_init(size >> 8);
+	while(size) {
+		len = size > FILE_BUF_SIZE ? FILE_BUF_SIZE : size;
+		rc = flash_read(fl_chip, start, file_buf, len);
+		if(rc) {
+			fprintf(stderr, "Flash read error %d for"
+					" chunk at 0x%08x\n", rc, start);
+			exit(1);
+		}
+		rc = write(fd, file_buf, len);
+		if(rc < 0) {
+			perror("Error writing file");
+			exit(1);
+		}
+		start += len;
+		size -= len;
+		done += len;
+		progress_tick(done >> 8);
+	}
+	progress_end();
+	close(fd);
+}
+
+static void
+flash_access_cleanup_bmc(void)
+{
+	if(ffsh)
+		ffs_close(ffsh);
+	flash_exit(fl_chip);
+	ast_sf_close(fl_ctrl);
+	close_devs();
+}
+
+static int
+flash_access_setup_bmc(bool use_lpc, bool need_write)
+{
+	int rc;
+	printf("Setting up BMC flash\n");
+	/* Open and map devices */
+	open_devs(use_lpc, true);
+
+	/* Create the AST flash controller */
+	rc = ast_sf_open(AST_SF_TYPE_BMC, &fl_ctrl);
+	if(rc) {
+		fprintf(stderr, "Failed to open controller\n");
+		return FLASH_SETUP_ERROR;
+	}
+
+	/* Open flash chip */
+	rc = flash_init(fl_ctrl, &fl_chip);
+	if(rc) {
+		fprintf(stderr, "Failed to open flash chip\n");
+		return FLASH_SETUP_ERROR;
+	}
+
+	/* Setup cleanup function */
+	atexit(flash_access_cleanup_bmc);
+	return FLASH_OK;
+}
+
+static void
+flash_access_cleanup_pnor(void)
+{
+	/* Re-lock flash */
+	if(need_relock)
+		set_wrprotect(true);
+
+	if(ffsh)
+		ffs_close(ffsh);
+	flash_exit(fl_chip);
+#ifdef __powerpc__
+	if(using_sfc)
+		sfc_close(fl_ctrl);
+	else
+		ast_sf_close(fl_ctrl);
+#else
+	ast_sf_close(fl_ctrl);
+#endif
+	close_devs();
+}
+
+static int
+flash_access_setup_pnor(bool use_lpc, bool use_sfc, bool need_write)
+{
+	int rc;
+	printf("Setting up BIOS flash\n");
+
+	/* Open and map devices */
+	open_devs(use_lpc, false);
+
+#ifdef __powerpc__
+	if(use_sfc) {
+		/* Create the SFC flash controller */
+		rc = sfc_open(&fl_ctrl);
+		if(rc) {
+			fprintf(stderr, "Failed to open controller\n");
+			return FLASH_SETUP_ERROR;
+		}
+		using_sfc = true;
+	} else {
+#endif
+		/* Create the AST flash controller */
+		rc = ast_sf_open(AST_SF_TYPE_PNOR, &fl_ctrl);
+		if(rc) {
+			fprintf(stderr, "Failed to open controller\n");
+			return FLASH_SETUP_ERROR;
+		}
+#ifdef __powerpc__
+	}
+#endif
+
+	/* Open flash chip */
+	rc = flash_init(fl_ctrl, &fl_chip);
+	if(rc) {
+		fprintf(stderr, "Failed to open flash chip\n");
+		return FLASH_SETUP_ERROR;
+	}
+
+	/* Unlock flash (PNOR only) */
+	if(need_write)
+		need_relock = set_wrprotect(false);
+
+	/* Setup cleanup function */
+	atexit(flash_access_cleanup_pnor);
+	return FLASH_OK;
+}
+
+uint8_t
+flash(FlashControl* flash_control,bool bmc_flash, uint32_t address, char* write_file, char* obj_path)
+{
+	bool has_sfc = false, has_ast = false, use_lpc = true;
+	bool erase = true, program = true;
+
+	int rc;
+	printf("flasher: %s, BMC = %d, address = 0x%x\n",write_file,bmc_flash,address);
+#ifdef __arm__
+	/* Check platform */
+	check_platform(&has_sfc, &has_ast);
+
+	/* Prepare for access */
+	if(bmc_flash) {
+		if(!has_ast) {
+			fprintf(stderr, "No BMC on this platform\n");
+			return FLASH_SETUP_ERROR;
+		}
+		rc = flash_access_setup_bmc(use_lpc, erase || program);
+		if(rc) {
+			return FLASH_SETUP_ERROR;
+		}
+	} else {
+		if(!has_ast && !has_sfc) {
+			fprintf(stderr, "No BMC nor SFC on this platform\n");
+			return FLASH_SETUP_ERROR;
+		}
+		rc = flash_access_setup_pnor(use_lpc, has_sfc, erase || program);
+		if(rc) {
+			return FLASH_SETUP_ERROR;
+		}
+	}
+
+	rc = flash_get_info(fl_chip, &fl_name,
+			&fl_total_size, &fl_erase_granule);
+	if(rc) {
+		fprintf(stderr, "Error %d getting flash info\n", rc);
+		return FLASH_SETUP_ERROR;
+	}
+#endif
+	if(strcmp(write_file,"")!=0)
+	{
+		// If file specified but not size, get size from file
+		struct stat stbuf;
+		if(stat(write_file, &stbuf)) {
+			perror("Failed to get file size");
+			return FLASH_ERROR;
+		}
+		uint32_t write_size = stbuf.st_size;
+#ifdef __arm__
+		rc = erase_chip();
+		if(rc) {
+			return FLASH_ERROR;
+		}
+		rc = program_file(flash_control, write_file, address, write_size);
+		if(rc) {
+			return FLASH_ERROR;
+		}
+#endif
+
+		printf("Flash done\n");
+	}
+	else
+	{
+		printf("Flash tuned\n");
+	}
+	return FLASH_OK;
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	cmdline *cmd = user_data;
+	if(cmd->argc < 4)
+	{
+		g_print("flasher [flash name] [filename] [source object]\n");
+		g_main_loop_quit(cmd->loop);
+		return;
+	}
+	printf("Starting flasher: %s,%s,%s,\n",cmd->argv[1],cmd->argv[2],cmd->argv[3]);
+	ObjectSkeleton *object;
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+	gchar *s;
+	s = g_strdup_printf("%s/%s",dbus_object_path,cmd->argv[1]);
+
+	object = object_skeleton_new(s);
+	g_free(s);
+
+	FlashControl* flash_control = flash_control_skeleton_new();
+	object_skeleton_set_flash_control(object, flash_control);
+	g_object_unref(flash_control);
+
+	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+	g_object_unref(object);
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+	bool bmc_flash = false;
+	uint32_t address = 0;
+	if(strcmp(cmd->argv[1],"bmc")==0) {
+		bmc_flash = true;
+	}
+	if(strcmp(cmd->argv[1],"bmc_ramdisk")==0) {
+		bmc_flash = true;
+		address = 0x20300000;
+	}
+	if(strcmp(cmd->argv[1],"bmc_kernel")==0) {
+		bmc_flash = true;
+		address = 0x20080000;
+	}
+
+	int rc = flash(flash_control,bmc_flash,address,cmd->argv[2],cmd->argv[3]);
+	if(rc) {
+		flash_message(connection,cmd->argv[3],"error","Flash Error");
+	} else {
+		flash_message(connection,cmd->argv[3],"done","");
+	}
+
+	//Object exits when done flashing
+	g_main_loop_quit(cmd->loop);
+}
+
+int
+main(int argc, char *argv[])
+{
+	GMainLoop *loop;
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+	cmd.loop = loop;
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			NULL,
+			NULL,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+
+	return 0;
+}
diff --git a/objects/host_watchdog_obj.c b/objects/host_watchdog_obj.c
index dbc4119..0b3b149 100644
--- a/objects/host_watchdog_obj.c
+++ b/objects/host_watchdog_obj.c
@@ -1,186 +1,186 @@
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "object_mapper.h"
-
-/* ---------------------------------------------------------------------------------------------------- */
-
-static const gchar* dbus_object_path = "/org/openbmc/watchdog";
-static const gchar* instance_name = "host0";
-static const gchar* dbus_name        = "org.openbmc.watchdog.Host";
-
-static GDBusObjectManagerServer *manager = NULL;
-static guint watchdogid = 0;
-
-static gboolean
-poll_watchdog(gpointer user_data)
-{
-	Watchdog *watchdog = object_get_watchdog((Object*)user_data);
-
- 	guint count = watchdog_get_watchdog(watchdog);
-	g_print("Polling watchdog: %d\n",count);
-	
-	if (count == 0)
-	{
-		//watchdog error, emit error and stop watchdog
-		watchdogid = 0;
-		watchdog_emit_watchdog_error(watchdog);
-		return FALSE;
-	}
-
-	//reset watchdog
-	watchdog_set_watchdog(watchdog,0);	
-	return TRUE;
-}
-
-static gboolean
-remove_watchdog(void)
-{
-    if (watchdogid)
-    {
-        g_source_remove(watchdogid);
-        watchdogid = 0;
-    }
-}
-
-static gboolean
-set_poll_interval (Watchdog  *wd,
-                GDBusMethodInvocation  *invocation,
-                guint                   interval,
-                gpointer                user_data)
-{
-    g_print("Setting watchdog poll interval to: %d\n", interval);
-    watchdog_set_poll_interval(wd, interval);
-    watchdog_complete_set(wd,invocation);
-}
-
-static gboolean
-on_start        (Watchdog  *wd,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-  	remove_watchdog();
-  	watchdog_set_watchdog(wd,0);
-	guint poll_interval = watchdog_get_poll_interval(wd);
-    g_print("Starting watchdog with poll interval: %d\n", poll_interval);
-  	watchdogid = g_timeout_add(poll_interval, poll_watchdog, user_data);
-	watchdog_complete_start(wd,invocation);
-	return TRUE;
-}
-
-static gboolean
-on_poke         (Watchdog  *wd,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-	watchdog_set_watchdog(wd,1);
-	watchdog_complete_poke(wd,invocation);
-	return TRUE;
-}
-
-static gboolean
-on_stop         (Watchdog  *wd,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-    g_print("Stopping watchdog\n");
-    remove_watchdog();
-    watchdog_complete_stop(wd,invocation);
-    return TRUE;
-}
-
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-  	cmdline *cmd = user_data;
-  	manager = g_dbus_object_manager_server_new (dbus_object_path);
-		gchar *s;
- 		s = g_strdup_printf ("%s/%s",dbus_object_path,instance_name);
-		ObjectSkeleton *object = object_skeleton_new (s);
-		g_free (s);
-
-		Watchdog *wd = watchdog_skeleton_new ();
-  		object_skeleton_set_watchdog (object, wd);
-  		g_object_unref (wd);
-
-		ObjectMapper* mapper = object_mapper_skeleton_new ();
-		object_skeleton_set_object_mapper (object, mapper);
-		g_object_unref (mapper);
-		
-  		// set properties
-  		watchdog_set_watchdog(wd,1);
-		
-		//define method callbacks here
- 		g_signal_connect (wd,
-                    "handle-start",
-                    G_CALLBACK (on_start),
-                    object); /* user_data */
- 
- 		g_signal_connect (wd,
-                    "handle-poke",
-                    G_CALLBACK (on_poke),
-                    object); /* user_data */
-
-        g_signal_connect (wd,
-                    "handle-stop",
-                    G_CALLBACK (on_stop),
-                    object); /* user_data */
-
-        g_signal_connect (wd,
-                    "handle-set",
-                    G_CALLBACK (set_poll_interval),
-                    object); /* user_data */
-
-  		/* Export the object (@manager takes its own reference to @object) */
-  		g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-  		g_object_unref (object);
-
-  /* Export all objects */
-  g_dbus_object_manager_server_set_connection (manager, connection);
-  emit_object_added((GDBusObjectManager*)manager); 
-}
-
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
-{
-  //g_print ("Acquired the name %s\n", name);
-}
-
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
-{
-  //g_print ("Lost the name %s\n", name);
-}
-
-
-gint
-main (gint argc, gchar *argv[])
-{
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
-}
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include "object_mapper.h"
+
+/* ------------------------------------------------------------------------- */
+
+static const gchar* dbus_object_path = "/org/openbmc/watchdog";
+static const gchar* instance_name = "host0";
+static const gchar* dbus_name = "org.openbmc.watchdog.Host";
+
+static GDBusObjectManagerServer *manager = NULL;
+static guint watchdogid = 0;
+
+static gboolean
+poll_watchdog(gpointer user_data)
+{
+	Watchdog *watchdog = object_get_watchdog((Object*)user_data);
+
+	guint count = watchdog_get_watchdog(watchdog);
+	g_print("Polling watchdog: %d\n",count);
+
+	if(count == 0)
+	{
+		//watchdog error, emit error and stop watchdog
+		watchdogid = 0;
+		watchdog_emit_watchdog_error(watchdog);
+		return FALSE;
+	}
+
+	//reset watchdog
+	watchdog_set_watchdog(watchdog,0);
+	return TRUE;
+}
+
+static gboolean
+remove_watchdog(void)
+{
+	if(watchdogid)
+	{
+		g_source_remove(watchdogid);
+		watchdogid = 0;
+	}
+}
+
+static gboolean
+set_poll_interval(Watchdog *wd,
+		GDBusMethodInvocation *invocation,
+		guint interval,
+		gpointer user_data)
+{
+	g_print("Setting watchdog poll interval to: %d\n", interval);
+	watchdog_set_poll_interval(wd, interval);
+	watchdog_complete_set(wd,invocation);
+}
+
+static gboolean
+on_start(Watchdog *wd,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	remove_watchdog();
+	watchdog_set_watchdog(wd,0);
+	guint poll_interval = watchdog_get_poll_interval(wd);
+	g_print("Starting watchdog with poll interval: %d\n", poll_interval);
+	watchdogid = g_timeout_add(poll_interval, poll_watchdog, user_data);
+	watchdog_complete_start(wd,invocation);
+	return TRUE;
+}
+
+static gboolean
+on_poke(Watchdog *wd,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	watchdog_set_watchdog(wd,1);
+	watchdog_complete_poke(wd,invocation);
+	return TRUE;
+}
+
+static gboolean
+on_stop(Watchdog *wd,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	g_print("Stopping watchdog\n");
+	remove_watchdog();
+	watchdog_complete_stop(wd,invocation);
+	return TRUE;
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	cmdline *cmd = user_data;
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+	gchar *s;
+	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
+	ObjectSkeleton *object = object_skeleton_new(s);
+	g_free(s);
+
+	Watchdog *wd = watchdog_skeleton_new();
+	object_skeleton_set_watchdog(object, wd);
+	g_object_unref(wd);
+
+	ObjectMapper* mapper = object_mapper_skeleton_new();
+	object_skeleton_set_object_mapper(object, mapper);
+	g_object_unref(mapper);
+
+	// set properties
+	watchdog_set_watchdog(wd,1);
+
+	//define method callbacks here
+	g_signal_connect(wd,
+			"handle-start",
+			G_CALLBACK(on_start),
+			object); /* user_data */
+
+	g_signal_connect(wd,
+			"handle-poke",
+			G_CALLBACK(on_poke),
+			object); /* user_data */
+
+	g_signal_connect(wd,
+			"handle-stop",
+			G_CALLBACK(on_stop),
+			object); /* user_data */
+
+	g_signal_connect(wd,
+			"handle-set",
+			G_CALLBACK(set_poll_interval),
+			object); /* user_data */
+
+	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+	g_object_unref(object);
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+	emit_object_added((GDBusObjectManager*)manager);
+}
+
+static void
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	//g_print ("Acquired the name %s\n", name);
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	//g_print ("Lost the name %s\n", name);
+}
+
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/hwmons_barreleye.c b/objects/hwmons_barreleye.c
index 5acde7c..06b1554 100644
--- a/objects/hwmons_barreleye.c
+++ b/objects/hwmons_barreleye.c
@@ -1,221 +1,220 @@
-#include "interfaces/openbmc_intf.h"
-#include <stdio.h>
-#include <fcntl.h>
-#include "openbmc.h"
-#include "gpio.h"
-#include "object_mapper.h"
-
-/* ---------------------------------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/sensors";
-static const gchar* dbus_name        = "org.openbmc.sensors.hwmon";
-
-static GDBusObjectManagerServer *manager = NULL;
-
-typedef struct {
-  const gchar* filename;
-  const gchar* name;
-  int poll_interval;
-  const gchar* units;
-  int scale;
-  int fd;
-} HWMON;
-
-#define  NUM_HWMONS 7
-
-// TODO: Don't hardcode
-//Hardcoded for barreleye
-HWMON hwmons[NUM_HWMONS] = { 
-	(HWMON){"/sys/class/hwmon/hwmon0/temp1_input","temperature/ambient",3000,"C",1000},
-	(HWMON){"/sys/class/hwmon/hwmon1/pwm1","speed/fan0",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon1/pwm2","speed/fan1",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon1/pwm3","speed/fan2",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm1","speed/fan3",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm2","speed/fan4",30000,"",1},
-	(HWMON){"/sys/class/hwmon/hwmon2/pwm3","speed/fan5",30000,"",1},
-};
-bool is_hwmon_valid(HWMON* hwmon)
-{
-	int fd = open(hwmon->filename, O_RDONLY);
-	if (fd == -1)
-	{
-		g_print("ERROR hwmon is not valid: %s\n",hwmon->filename);
-		return false;
-	}
-	close(fd);
-	return true;
-}
-
-static gboolean poll_hwmon(gpointer user_data)
-{
-	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
-	SensorValue *sensor = object_get_sensor_value((Object*)user_data);
-	const gchar* filename = hwmon_get_sysfs_path(hwmon);
-
-	int fd = open(filename, O_RDONLY);
-	if (fd != -1)
-	{
-		char buf[255];
-		if (read(fd,&buf,255) == -1)
-		{
-			g_print("ERROR: Unable to read value: %s\n",filename);
-		} else {
-			guint32 scale = hwmon_get_scale(hwmon);
-			if (scale == 0)
-			{
-				g_print("ERROR: Invalid scale value of 0\n");
-				scale = 1;
-				
-			}
-			guint32 value = atoi(buf)/scale;
-			GVariant* v = NEW_VARIANT_U(value);
-			GVariant* old_value = sensor_value_get_value(sensor);
-			bool do_set = false;
-			if (old_value == NULL)
-			{
-				do_set = true;
-			}
-			else
-			{
-				if (GET_VARIANT_U(old_value) != value) { do_set = true; }
-			}
-			if (do_set)
-			{
-				g_print("Sensor changed: %s,%d\n",filename,value);
-				GVariant* v = NEW_VARIANT_U(value);
-				const gchar* units = sensor_value_get_units(sensor);
-				sensor_value_set_value(sensor,v);
-				sensor_value_emit_changed(sensor,v,units);
-			}
-		}
-		close(fd);
-	} else {
-		g_print("ERROR - hwmons: File %s doesn't exist\n",filename);
-	}
-
-	return TRUE;
-}
-static gboolean
-on_set_value   (SensorValue            *sensor,
-                GDBusMethodInvocation  *invocation,
-		GVariant*                v_value,	
-                gpointer                user_data)
-{
-	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
-	const gchar* filename = hwmon_get_sysfs_path(hwmon);
-
-	int fd = open(filename, O_WRONLY);
-	if (fd != -1)
-	{
-		char buf[255];
-		guint32 value = GET_VARIANT_U(v_value);
-		sprintf(buf,"%d",value);
-		if (write(fd, buf, 255) == -1)
-		{
-			g_print("ERROR: Unable to read value: %s\n",filename);
-		}
-		close(fd);
-	}
-	sensor_value_complete_set_value(sensor,invocation);
-	return TRUE;
-}
-
-
-
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-	ObjectSkeleton *object;
-
-	cmdline *cmd = user_data;
-
-
-	manager = g_dbus_object_manager_server_new (dbus_object_path);
-	int i = 0;
-	for (i=0;i<NUM_HWMONS;i++)
-  	{
-		if (!is_hwmon_valid(&hwmons[i])) { continue; }
-		gchar *s;
-		s = g_strdup_printf ("%s/%s",dbus_object_path,hwmons[i].name);
-		object = object_skeleton_new (s);
-		g_free (s);
-
-		Hwmon *hwmon = hwmon_skeleton_new ();
-		object_skeleton_set_hwmon (object, hwmon);
-		g_object_unref (hwmon);
-
-		SensorValue *sensor = sensor_value_skeleton_new ();
-		object_skeleton_set_sensor_value (object, sensor);
-		g_object_unref (sensor);
-
-		ObjectMapper* mapper = object_mapper_skeleton_new ();
-		object_skeleton_set_object_mapper (object, mapper);
-		g_object_unref (mapper);
-
-		hwmon_set_sysfs_path(hwmon,hwmons[i].filename);
-		hwmon_set_scale(hwmon,hwmons[i].scale);
-		sensor_value_set_units(sensor,hwmons[i].units);
-
-		//define method callbacks here
-		g_signal_connect (sensor,
-       	            "handle-set-value",
-               	    G_CALLBACK (on_set_value),
-               	    object); /* user_data */
-		
-
-		if (hwmons[i].poll_interval > 0) {
-			g_timeout_add(hwmons[i].poll_interval, poll_hwmon, object);
-		}
-		/* Export the object (@manager takes its own reference to @object) */
-		g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-		g_object_unref (object);
-	}
-	/* Export all objects */
- 	g_dbus_object_manager_server_set_connection (manager, connection);
-	emit_object_added((GDBusObjectManager*)manager); 
-}
-
-
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
-{
-}
-
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
-{
-}
-
-
-gint
-main (gint argc, gchar *argv[])
-{
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
-}
+#include "interfaces/openbmc_intf.h"
+#include <stdio.h>
+#include <fcntl.h>
+#include "openbmc.h"
+#include "gpio.h"
+#include "object_mapper.h"
+
+/* ------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/sensors";
+static const gchar* dbus_name = "org.openbmc.sensors.hwmon";
+
+static GDBusObjectManagerServer *manager = NULL;
+
+typedef struct {
+	const gchar* filename;
+	const gchar* name;
+	int poll_interval;
+	const gchar* units;
+	int scale;
+	int fd;
+} HWMON;
+
+#define NUM_HWMONS 7
+
+// TODO: Don't hardcode
+//Hardcoded for barreleye
+HWMON hwmons[NUM_HWMONS] = {
+	(HWMON){"/sys/class/hwmon/hwmon0/temp1_input","temperature/ambient",3000,"C",1000},
+	(HWMON){"/sys/class/hwmon/hwmon1/pwm1","speed/fan0",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon1/pwm2","speed/fan1",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon1/pwm3","speed/fan2",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon2/pwm1","speed/fan3",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon2/pwm2","speed/fan4",30000,"",1},
+	(HWMON){"/sys/class/hwmon/hwmon2/pwm3","speed/fan5",30000,"",1},
+};
+
+bool
+is_hwmon_valid(HWMON* hwmon)
+{
+	int fd = open(hwmon->filename, O_RDONLY);
+	if(fd == -1)
+	{
+		g_print("ERROR hwmon is not valid: %s\n",hwmon->filename);
+		return false;
+	}
+	close(fd);
+	return true;
+}
+
+static gboolean
+poll_hwmon(gpointer user_data)
+{
+	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
+	SensorValue *sensor = object_get_sensor_value((Object*)user_data);
+	const gchar* filename = hwmon_get_sysfs_path(hwmon);
+
+	int fd = open(filename, O_RDONLY);
+	if(fd != -1)
+	{
+		char buf[255];
+		if(read(fd,&buf,255) == -1)
+		{
+			g_print("ERROR: Unable to read value: %s\n",filename);
+		} else {
+			guint32 scale = hwmon_get_scale(hwmon);
+			if(scale == 0)
+			{
+				g_print("ERROR: Invalid scale value of 0\n");
+				scale = 1;
+
+			}
+			guint32 value = atoi(buf)/scale;
+			GVariant* v = NEW_VARIANT_U(value);
+			GVariant* old_value = sensor_value_get_value(sensor);
+			bool do_set = false;
+			if(old_value == NULL)
+			{
+				do_set = true;
+			}
+			else
+			{
+				if(GET_VARIANT_U(old_value) != value) { do_set = true; }
+			}
+			if(do_set)
+			{
+				g_print("Sensor changed: %s,%d\n",filename,value);
+				GVariant* v = NEW_VARIANT_U(value);
+				const gchar* units = sensor_value_get_units(sensor);
+				sensor_value_set_value(sensor,v);
+				sensor_value_emit_changed(sensor,v,units);
+			}
+		}
+		close(fd);
+	} else {
+		g_print("ERROR - hwmons: File %s doesn't exist\n",filename);
+	}
+
+	return TRUE;
+}
+
+static gboolean
+on_set_value(SensorValue *sensor,
+		GDBusMethodInvocation *invocation,
+		GVariant* v_value,
+		gpointer user_data)
+{
+	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
+	const gchar* filename = hwmon_get_sysfs_path(hwmon);
+
+	int fd = open(filename, O_WRONLY);
+	if(fd != -1)
+	{
+		char buf[255];
+		guint32 value = GET_VARIANT_U(v_value);
+		sprintf(buf,"%d",value);
+		if(write(fd, buf, 255) == -1)
+		{
+			g_print("ERROR: Unable to read value: %s\n",filename);
+		}
+		close(fd);
+	}
+	sensor_value_complete_set_value(sensor,invocation);
+	return TRUE;
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	ObjectSkeleton *object;
+
+	cmdline *cmd = user_data;
+
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+	int i = 0;
+	for(i=0;i<NUM_HWMONS;i++)
+	{
+		if(!is_hwmon_valid(&hwmons[i])) { continue; }
+		gchar *s;
+		s = g_strdup_printf("%s/%s",dbus_object_path,hwmons[i].name);
+		object = object_skeleton_new(s);
+		g_free(s);
+
+		Hwmon *hwmon = hwmon_skeleton_new();
+		object_skeleton_set_hwmon(object, hwmon);
+		g_object_unref(hwmon);
+
+		SensorValue *sensor = sensor_value_skeleton_new();
+		object_skeleton_set_sensor_value(object, sensor);
+		g_object_unref(sensor);
+
+		ObjectMapper* mapper = object_mapper_skeleton_new();
+		object_skeleton_set_object_mapper(object, mapper);
+		g_object_unref(mapper);
+
+		hwmon_set_sysfs_path(hwmon,hwmons[i].filename);
+		hwmon_set_scale(hwmon,hwmons[i].scale);
+		sensor_value_set_units(sensor,hwmons[i].units);
+
+		//define method callbacks here
+		g_signal_connect(sensor,
+				"handle-set-value",
+				G_CALLBACK(on_set_value),
+				object); /* user_data */
+
+
+		if(hwmons[i].poll_interval > 0) {
+			g_timeout_add(hwmons[i].poll_interval, poll_hwmon, object);
+		}
+		/* Export the object (@manager takes its own reference to @object) */
+		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+		g_object_unref(object);
+	}
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+	emit_object_added((GDBusObjectManager*)manager);
+}
+
+static void
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/hwmons_palmetto.c b/objects/hwmons_palmetto.c
index c38a3c9..c627d27 100644
--- a/objects/hwmons_palmetto.c
+++ b/objects/hwmons_palmetto.c
@@ -1,215 +1,214 @@
-#include "interfaces/openbmc_intf.h"
-#include <stdio.h>
-#include <fcntl.h>
-#include "openbmc.h"
-#include "gpio.h"
-#include "object_mapper.h"
-
-/* ---------------------------------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/sensors";
-static const gchar* dbus_name        = "org.openbmc.sensors.hwmon";
-
-static GDBusObjectManagerServer *manager = NULL;
-
-typedef struct {
-  const gchar* filename;
-  const gchar* name;
-  int poll_interval;
-  const gchar* units;
-  int scale;
-  int fd;
-} HWMON;
-
-#define  NUM_HWMONS 1
-
-// TODO: Don't hardcode
-//Hardcoded for palmetto
-HWMON hwmons[NUM_HWMONS] = { 
-	(HWMON){"/sys/class/hwmon/hwmon0/temp1_input","temperature/ambient",3000,"C",1000},
-};
-bool is_hwmon_valid(HWMON* hwmon)
-{
-	int fd = open(hwmon->filename, O_RDONLY);
-	if (fd == -1)
-	{
-		g_print("ERROR hwmon is not valid: %s\n",hwmon->filename);
-		return false;
-	}
-	close(fd);
-	return true;
-}
-
-static gboolean poll_hwmon(gpointer user_data)
-{
-	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
-	SensorValue *sensor = object_get_sensor_value((Object*)user_data);
-	const gchar* filename = hwmon_get_sysfs_path(hwmon);
-
-	int fd = open(filename, O_RDONLY);
-	if (fd != -1)
-	{
-		char buf[255];
-		if (read(fd,&buf,255) == -1)
-		{
-			g_print("ERROR: Unable to read value: %s\n",filename);
-		} else {
-			guint32 scale = hwmon_get_scale(hwmon);
-			if (scale == 0)
-			{
-				g_print("ERROR: Invalid scale value of 0\n");
-				scale = 1;
-				
-			}
-			guint32 value = atoi(buf)/scale;
-			GVariant* v = NEW_VARIANT_U(value);
-			GVariant* old_value = sensor_value_get_value(sensor);
-			bool do_set = false;
-			if (old_value == NULL)
-			{
-				do_set = true;
-			}
-			else
-			{
-				if (GET_VARIANT_U(old_value) != value) { do_set = true; }
-			}
-			if (do_set)
-			{
-				g_print("Sensor changed: %s,%d\n",filename,value);
-				GVariant* v = NEW_VARIANT_U(value);
-				const gchar* units = sensor_value_get_units(sensor);
-				sensor_value_set_value(sensor,v);
-				sensor_value_emit_changed(sensor,v,units);
-			}
-		}
-		close(fd);
-	} else {
-		g_print("ERROR - hwmons: File %s doesn't exist\n",filename);
-	}
-
-	return TRUE;
-}
-static gboolean
-on_set_value   (SensorValue            *sensor,
-                GDBusMethodInvocation  *invocation,
-		GVariant*                v_value,	
-                gpointer                user_data)
-{
-	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
-	const gchar* filename = hwmon_get_sysfs_path(hwmon);
-
-	int fd = open(filename, O_WRONLY);
-	if (fd != -1)
-	{
-		char buf[255];
-		guint32 value = GET_VARIANT_U(v_value);
-		sprintf(buf,"%d",value);
-		if (write(fd, buf, 255) == -1)
-		{
-			g_print("ERROR: Unable to read value: %s\n",filename);
-		}
-		close(fd);
-	}
-	sensor_value_complete_set_value(sensor,invocation);
-	return TRUE;
-}
-
-
-
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-	ObjectSkeleton *object;
-
-	cmdline *cmd = user_data;
-
-
-	manager = g_dbus_object_manager_server_new (dbus_object_path);
-	int i = 0;
-	for (i=0;i<NUM_HWMONS;i++)
-  	{
-		if (!is_hwmon_valid(&hwmons[i])) { continue; }
-		gchar *s;
-		s = g_strdup_printf ("%s/%s",dbus_object_path,hwmons[i].name);
-		object = object_skeleton_new (s);
-		g_free (s);
-
-		Hwmon *hwmon = hwmon_skeleton_new ();
-		object_skeleton_set_hwmon (object, hwmon);
-		g_object_unref (hwmon);
-
-		SensorValue *sensor = sensor_value_skeleton_new ();
-		object_skeleton_set_sensor_value (object, sensor);
-		g_object_unref (sensor);
-
-		ObjectMapper* mapper = object_mapper_skeleton_new ();
-		object_skeleton_set_object_mapper (object, mapper);
-		g_object_unref (mapper);
-
-		hwmon_set_sysfs_path(hwmon,hwmons[i].filename);
-		hwmon_set_scale(hwmon,hwmons[i].scale);
-		sensor_value_set_units(sensor,hwmons[i].units);
-
-		//define method callbacks here
-		g_signal_connect (sensor,
-       	            "handle-set-value",
-               	    G_CALLBACK (on_set_value),
-               	    object); /* user_data */
-		
-
-		if (hwmons[i].poll_interval > 0) {
-			g_timeout_add(hwmons[i].poll_interval, poll_hwmon, object);
-		}
-		/* Export the object (@manager takes its own reference to @object) */
-		g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-		g_object_unref (object);
-	}
-	/* Export all objects */
- 	g_dbus_object_manager_server_set_connection (manager, connection);
-	emit_object_added((GDBusObjectManager*)manager); 
-}
-
-
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
-{
-}
-
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
-{
-}
-
-
-gint
-main (gint argc, gchar *argv[])
-{
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-  g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
-}
+#include "interfaces/openbmc_intf.h"
+#include <stdio.h>
+#include <fcntl.h>
+#include "openbmc.h"
+#include "gpio.h"
+#include "object_mapper.h"
+
+/* ------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/sensors";
+static const gchar* dbus_name = "org.openbmc.sensors.hwmon";
+
+static GDBusObjectManagerServer *manager = NULL;
+
+typedef struct {
+	const gchar* filename;
+	const gchar* name;
+	int poll_interval;
+	const gchar* units;
+	int scale;
+	int fd;
+} HWMON;
+
+#define NUM_HWMONS 1
+
+// TODO: Don't hardcode
+//Hardcoded for palmetto
+HWMON hwmons[NUM_HWMONS] = {
+	(HWMON){"/sys/class/hwmon/hwmon0/temp1_input","temperature/ambient",3000,"C",1000},
+};
+
+bool
+is_hwmon_valid(HWMON* hwmon)
+{
+	int fd = open(hwmon->filename, O_RDONLY);
+	if(fd == -1)
+	{
+		g_print("ERROR hwmon is not valid: %s\n",hwmon->filename);
+		return false;
+	}
+	close(fd);
+	return true;
+}
+
+static gboolean
+poll_hwmon(gpointer user_data)
+{
+	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
+	SensorValue *sensor = object_get_sensor_value((Object*)user_data);
+	const gchar* filename = hwmon_get_sysfs_path(hwmon);
+
+	int fd = open(filename, O_RDONLY);
+	if(fd != -1)
+	{
+		char buf[255];
+		if(read(fd,&buf,255) == -1)
+		{
+			g_print("ERROR: Unable to read value: %s\n",filename);
+		} else {
+			guint32 scale = hwmon_get_scale(hwmon);
+			if(scale == 0)
+			{
+				g_print("ERROR: Invalid scale value of 0\n");
+				scale = 1;
+
+			}
+			guint32 value = atoi(buf)/scale;
+			GVariant* v = NEW_VARIANT_U(value);
+			GVariant* old_value = sensor_value_get_value(sensor);
+			bool do_set = false;
+			if(old_value == NULL)
+			{
+				do_set = true;
+			}
+			else
+			{
+				if(GET_VARIANT_U(old_value) != value) { do_set = true; }
+			}
+			if(do_set)
+			{
+				g_print("Sensor changed: %s,%d\n",filename,value);
+				GVariant* v = NEW_VARIANT_U(value);
+				const gchar* units = sensor_value_get_units(sensor);
+				sensor_value_set_value(sensor,v);
+				sensor_value_emit_changed(sensor,v,units);
+			}
+		}
+		close(fd);
+	} else {
+		g_print("ERROR - hwmons: File %s doesn't exist\n",filename);
+	}
+
+	return TRUE;
+}
+
+static gboolean
+on_set_value(SensorValue *sensor,
+		GDBusMethodInvocation *invocation,
+		GVariant* v_value,
+		gpointer user_data)
+{
+	Hwmon *hwmon = object_get_hwmon((Object*)user_data);
+	const gchar* filename = hwmon_get_sysfs_path(hwmon);
+
+	int fd = open(filename, O_WRONLY);
+	if(fd != -1)
+	{
+		char buf[255];
+		guint32 value = GET_VARIANT_U(v_value);
+		sprintf(buf,"%d",value);
+		if(write(fd, buf, 255) == -1)
+		{
+			g_print("ERROR: Unable to read value: %s\n",filename);
+		}
+		close(fd);
+	}
+	sensor_value_complete_set_value(sensor,invocation);
+	return TRUE;
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	ObjectSkeleton *object;
+
+	cmdline *cmd = user_data;
+
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+	int i = 0;
+	for(i=0;i<NUM_HWMONS;i++)
+	{
+		if(!is_hwmon_valid(&hwmons[i])) { continue; }
+		gchar *s;
+		s = g_strdup_printf("%s/%s",dbus_object_path,hwmons[i].name);
+		object = object_skeleton_new(s);
+		g_free(s);
+
+		Hwmon *hwmon = hwmon_skeleton_new();
+		object_skeleton_set_hwmon(object, hwmon);
+		g_object_unref(hwmon);
+
+		SensorValue *sensor = sensor_value_skeleton_new();
+		object_skeleton_set_sensor_value(object, sensor);
+		g_object_unref(sensor);
+
+		ObjectMapper* mapper = object_mapper_skeleton_new();
+		object_skeleton_set_object_mapper(object, mapper);
+		g_object_unref(mapper);
+
+		hwmon_set_sysfs_path(hwmon,hwmons[i].filename);
+		hwmon_set_scale(hwmon,hwmons[i].scale);
+		sensor_value_set_units(sensor,hwmons[i].units);
+
+		//define method callbacks here
+		g_signal_connect(sensor,
+				"handle-set-value",
+				G_CALLBACK(on_set_value),
+				object); /* user_data */
+
+
+		if(hwmons[i].poll_interval > 0) {
+			g_timeout_add(hwmons[i].poll_interval, poll_hwmon, object);
+		}
+		/* Export the object (@manager takes its own reference to @object) */
+		g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+		g_object_unref(object);
+	}
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+	emit_object_added((GDBusObjectManager*)manager);
+}
+
+static void
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/led_controller.c b/objects/led_controller.c
old mode 100755
new mode 100644
index 4fe0aa4..1f542e1
--- a/objects/led_controller.c
+++ b/objects/led_controller.c
@@ -1,543 +1,554 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <string.h>
-#include <dirent.h>
-#include <systemd/sd-bus.h>
-
-/*
- * These are control files that are present for each led under
- *'/sys/class/leds/<led_name>/' which are used to trigger action
- * on the respective leds by writing predefined data.
- */
-const char *power_ctrl = "brightness";
-const char *blink_ctrl = "trigger";
-const char *duty_on    = "delay_on";
-const char *duty_off   = "delay_off";
-
-/*
- * --------------------------------------------------
- * Given the dbus path, returns the name of the LED
- * --------------------------------------------------
- */
-char *get_led_name(const char *dbus_path)
-{
-    char *led_name = NULL;
-
-    /* Get the led name from /org/openbmc/control/led/<name> */
-    led_name = strrchr(dbus_path, '/');
-    if(led_name)
-    {
-        led_name++;
-    }
-
-    return led_name;
-}
-
-/*
- * -------------------------------------------------------------------------
- * Writes the 'on / off / blink' trigger to leds.
- * -------------------------------------------------------------------------
- */
-int write_to_led(const char *name, const char *ctrl_file, const char *value)
-{
-    /* Generic error reporter. */
-    int rc = -1;
-
-    /* To get /sys/class/leds/<name>/<control file> */
-    char led_path[128] = {0};
-
-    int len = 0;
-    len = snprintf(led_path, sizeof(led_path),
-                   "/sys/class/leds/%s/%s",name, ctrl_file);
-    if(len >= sizeof(led_path))
-    {
-        fprintf(stderr, "Error. LED path is too long. :[%d]\n",len);
-        return rc;
-    }
-
-    FILE *fp = fopen(led_path,"w");
-    if(fp == NULL)
-    {
-        fprintf(stderr,"Error:[%s] opening:[%s]\n",strerror(errno),led_path);
-        return rc;
-    }
-
-    rc = fwrite(value, strlen(value), 1, fp);
-    if(rc != 1)
-    {
-        fprintf(stderr, "Error:[%s] writing to :[%s]\n",strerror(errno),led_path);
-    }
-
-    fclose(fp);
-
-    /* When we get here, rc would be what it was from writing to the file */
-    return (rc == 1) ? 0 : -1;
-}
-
-/*
- * ----------------------------------------------------------------
- * Router function for any LED operations that come via dbus
- *----------------------------------------------------------------
- */
-static int led_function_router(sd_bus_message *msg, void *user_data,
-                               sd_bus_error *ret_error)
-{
-    /* Generic error reporter. */
-    int rc = -1;
-
-    /* Extract the led name from the full dbus path */
-    const char *led_path = sd_bus_message_get_path(msg);
-    if(led_path == NULL)
-    {
-        fprintf(stderr, "Error. LED path is empty");
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-
-    char *led_name = get_led_name(led_path);
-    if(led_name == NULL)
-    {
-        fprintf(stderr, "Invalid LED name for path :[%s]\n",led_path);
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-
-    /* Now that we have the LED name, get the Operation. */
-    const char *led_function = sd_bus_message_get_member(msg);
-    if(led_function == NULL)
-    {
-        fprintf(stderr, "Null LED function specificed for : [%s]\n",led_name);
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-
-    /* Route the user action to appropriate handlers. */
-    if( (strcmp(led_function, "setOn") == 0) ||
-        (strcmp(led_function, "setOff") == 0))
-    {
-        rc = led_stable_state_function(led_name, led_function);
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-    else if( (strcmp(led_function, "setBlinkFast") == 0) ||
-             (strcmp(led_function, "setBlinkSlow") == 0))
-    {
-        rc = led_default_blink(led_name, led_function);
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-    else if(strcmp(led_function, "BlinkCustom") == 0)
-    {
-        rc = led_custom_blink(led_name, msg);
-        return sd_bus_reply_method_return(msg, "i", rc);
-    }
-    else if(strcmp(led_function, "GetLedState") == 0)
-    {
-        char value_str[10] = {0};
-        const char *led_state = NULL;
-
-        rc = read_led(led_name, power_ctrl, value_str, sizeof(value_str)-1);
-        if(rc >= 0)
-        {
-            /* LED is active HI */
-            led_state = strtoul(value_str, NULL, 0) ? "On" : "Off";
-        }
-        return sd_bus_reply_method_return(msg, "is", rc, led_state);
-    }
-    else
-    {
-        fprintf(stderr,"Invalid LED function:[%s]\n",led_function);
-    }
-
-    return sd_bus_reply_method_return(msg, "i", rc);
-}
-
-/*
- * --------------------------------------------------------------
- * Turn On or Turn Off the LED
- * --------------------------------------------------------------
- */
-int led_stable_state_function(char *led_name, char *led_function)
-{
-    /* Generic error reporter. */
-    int rc = -1;
-
-    const char *value = NULL;
-    if(strcmp(led_function, "setOff") == 0)
-    {
-        /* LED active low */
-        value = "0";
-    }
-    else if(strcmp(led_function, "setOn") == 0)
-    {
-        value  = "255";
-    }
-    else
-    {
-        fprintf(stderr,"Invalid LED stable state operation:[%s] \n",led_function);
-        return rc;
-    }
-
-    /*
-     * Before doing anything, need to turn off the blinking
-     * if there is one in progress by writing 'none' to trigger
-     */
-    rc = write_to_led(led_name, blink_ctrl, "none");
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error disabling blink. Function:[%s]\n", led_function);
-        return rc;
-    }
-
-    /*
-     * Open the brightness file and write corresponding values.
-     */
-    rc = write_to_led(led_name, power_ctrl, value);
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error driving LED. Function:[%s]\n", led_function);
-    }
-
-    return rc;
-}
-
-//-----------------------------------------------------------------------------------
-// Given the on and off duration, applies the action on the specified LED.
-//-----------------------------------------------------------------------------------
-int blink_led(const char *led_name, const char *on_duration, const char *off_duration)
-{
-    /* Generic error reporter */
-    int rc = -1;
-
-    /* Protocol demands that 'timer' be echoed to 'trigger' */
-    rc = write_to_led(led_name, blink_ctrl, "timer");
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error writing timer to Led:[%s]\n", led_name);
-        return rc;
-    }
-
-    /*
-     * After writing 'timer to 'trigger', 2 new files get generated namely
-     *'delay_on' and 'delay_off' which are telling the time duration for a
-     * particular LED on and off.
-     */
-    rc = write_to_led(led_name, duty_on, on_duration);
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error writing [%s] to delay_on:[%s]\n",on_duration,led_name);
-        return rc;
-    }
-
-    rc = write_to_led(led_name, duty_off, off_duration);
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error writing [%s] to delay_off:[%s]\n",off_duration,led_name);
-    }
-
-    return rc;
-}
-
-/*
- * ----------------------------------------------------
- * Default blink action on the LED.
- * ----------------------------------------------------
- */
-int led_default_blink(char *led_name, char *blink_type)
-{
-    /* Generic error reporter */
-    int rc = -1;
-
-    /* How long the LED needs to be in on and off state while blinking */
-    const char *on_duration = NULL;
-    const char *off_duration = NULL;
-    if(strcmp(blink_type, "setBlinkSlow") == 0)
-    {
-        //*Delay 900 millisec before 'on' and delay 900 millisec before off */
-        on_duration = "900";
-        off_duration = "900";
-    }
-    else if(strcmp(blink_type, "setBlinkFast") == 0)
-    {
-        /* Delay 200 millisec before 'on' and delay 200 millisec before off */
-        on_duration = "200";
-        off_duration = "200";
-    }
-    else
-    {
-        fprintf(stderr,"Invalid blink operation:[%s]\n",blink_type);
-        return rc;
-    }
-
-    rc = blink_led(led_name, on_duration, off_duration);
-
-    return rc;
-}
-
-/*
- * -------------------------------------------------
- * Blinks at user defined 'on' and 'off' intervals.
- * -------------------------------------------------
- */
-int led_custom_blink(const char *led_name, sd_bus_message *msg)
-{
-    /* Generic error reporter. */
-    int rc = -1;
-    int led_len = 0;
-
-    /* User supplied 'on' and 'off' duration converted into string */
-    char on_duration[32] = {0};
-    char off_duration[32] = {0};
-
-    /* User supplied 'on' and 'off' duration */
-    uint32_t user_input_on = 0;
-    uint32_t user_input_off = 0;
-
-    /* Extract values into 'ss' ( string, string) */
-    rc = sd_bus_message_read(msg, "uu", &user_input_on, &user_input_off);
-    if(rc < 0)
-    {
-        fprintf(stderr, "Failed to read 'on' and 'off' duration.[%s]\n", strerror(-rc));
-    }
-    else
-    {
-        /*
-         * Converting user supplied integer arguments into string as required by
-         * sys interface. The top level REST will make sure that an error is
-         * thrown right away on invalid inputs. However, REST is allowing the
-         * unsigned decimal and floating numbers but when its received here, its
-         * received as decimal so no input validation needed.
-         */
-        led_len = snprintf(on_duration, sizeof(on_duration),
-                           "%d",user_input_on);
-        if(led_len >= sizeof(on_duration))
-        {
-            fprintf(stderr, "Error. Blink ON duration is too long. :[%d]\n",led_len);
-            return rc;
-        }
-
-        led_len = snprintf(off_duration, sizeof(off_duration),
-                           "%d",user_input_off);
-        if(led_len >= sizeof(off_duration))
-        {
-            fprintf(stderr, "Error. Blink OFF duration is too long. :[%d]\n",led_len);
-            return rc;
-        }
-
-        /* We are good here.*/
-        rc = blink_led(led_name, on_duration, off_duration);
-    }
-    return rc;
-}
-
-/*
- * ---------------------------------------------------------------
- * Gets the current value of passed in LED file
- * Mainly used for reading 'brightness'
- * NOTE : It is the responsibility of the caller to allocate
- * sufficient space for buffer. This will read upto user supplied
- * size -or- entire contents of file whichever is smaller
- * ----------------------------------------------------------------
- */
-int read_led(const char *name, const char *ctrl_file,
-             void *value, const size_t len)
-{
-    /* Generic error reporter. */
-    int rc = -1;
-    int count = 0;
-
-    if(value == NULL || len <= 0)
-    {
-        fprintf(stderr, "Invalid buffer passed to LED read\n");
-        return rc;
-    }
-
-    /* To get /sys/class/leds/<name>/<control file> */
-    char led_path[128] = {0};
-
-    int led_len = 0;
-    led_len = snprintf(led_path, sizeof(led_path),
-                   "/sys/class/leds/%s/%s",name, ctrl_file);
-    if(led_len >= sizeof(led_path))
-    {
-        fprintf(stderr, "Error. LED path is too long. :[%d]\n",led_len);
-        return rc;
-    }
-
-    FILE *fp = fopen(led_path,"rb");
-    if(fp == NULL)
-    {
-        fprintf(stderr,"Error:[%s] opening:[%s]\n",strerror(errno),led_path);
-        return rc;
-    }
-
-    char *sysfs_value = (char *)value;
-    while(!feof(fp) && (count < len))
-    {
-        sysfs_value[count++] = fgetc(fp);
-    }
-
-    fclose(fp);
-    return 0;
-}
-
-/*
- * -----------------------------------------------
- * Dbus Services offered by this LED controller
- * -----------------------------------------------
- */
-static const sd_bus_vtable led_control_vtable[] =
-{
-    SD_BUS_VTABLE_START(0),
-    SD_BUS_METHOD("setOn", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_METHOD("setOff", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_METHOD("setBlinkFast", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_METHOD("setBlinkSlow", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_METHOD("GetLedState", "", "is", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_METHOD("BlinkCustom", "uu", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
-    SD_BUS_VTABLE_END,
-};
-
-/*
- * ---------------------------------------------
- * Interested in all files except standard ones
- * ---------------------------------------------
- */
-int led_select(const struct dirent *entry)
-{
-    if( (strcmp(entry->d_name, ".") == 0) ||
-        (strcmp(entry->d_name, "..") == 0))
-    {
-        return 0;
-    }
-    return 1;
-}
-
-/*
- * ------------------------------------------------
- * Called as part of setting up skeleton services.
- * -----------------------------------------------
- */
-int start_led_services()
-{
-    /* Generic error reporter. */
-    int rc = -1;
-    int num_leds = 0;
-    int count_leds = 0;
-
-    /* Bus and slot where we are offering the LED dbus service. */
-    sd_bus *bus_type = NULL;
-    sd_bus_slot *led_slot = NULL;
-
-    /* For walking '/sys/class/leds/' looking for names of LED.*/
-    struct dirent **led_list;
-
-    /* Get a hook onto system bus. */
-    rc = sd_bus_open_system(&bus_type);
-    if(rc < 0)
-    {
-        fprintf(stderr,"Error opening system bus.\n");
-        return rc;
-    }
-
-    count_leds = num_leds = scandir("/sys/class/leds/",
-                                    &led_list, led_select, alphasort);
-    if(num_leds <= 0)
-    {
-        fprintf(stderr,"No LEDs present in the system\n");
-
-        sd_bus_slot_unref(led_slot);
-        sd_bus_unref(bus_type);
-        return rc;
-    }
-
-    /* Fully qualified Dbus object for a particular LED */
-    char led_object[128] = {0};
-    int len = 0;
-
-    /* For each led present, announce the service on dbus. */
-    while(num_leds--)
-    {
-        memset(led_object, 0x0, sizeof(led_object));
-
-        len = snprintf(led_object, sizeof(led_object), "%s%s",
-                "/org/openbmc/control/led/", led_list[num_leds]->d_name);
-
-        if(len >= sizeof(led_object))
-        {
-            fprintf(stderr, "Error. LED object is too long:[%d]\n",len);
-            rc = -1;
-            break;
-        }
-
-        /* Install the object */
-        rc = sd_bus_add_object_vtable(bus_type,
-                                      &led_slot,
-                                      led_object,          /* object path */
-                                      "org.openbmc.Led",   /* interface name */
-                                      led_control_vtable,
-                                      NULL);
-
-        if (rc < 0)
-        {
-            fprintf(stderr, "Failed to add object to dbus: %s\n", strerror(-rc));
-            break;
-        }
-    }
-
-    /* Done with all registration. */
-    while (count_leds > 0)
-    {
-        free(led_list[--count_leds]);
-    }
-    free(led_list);
-
-    /* If we had success in adding the providers, request for a bus name. */
-    if(rc == 0)
-    {
-        /* Take one in OpenBmc */
-        rc = sd_bus_request_name(bus_type, "org.openbmc.control.led", 0);
-        if (rc < 0)
-        {
-            fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-rc));
-        }
-        else
-        {
-            for (;;)
-            {
-                /* Process requests */
-                rc = sd_bus_process(bus_type, NULL);
-                if (rc < 0)
-                {
-                    fprintf(stderr, "Failed to process bus: %s\n", strerror(-rc));
-                    break;
-                }
-                if (rc > 0)
-                {
-                    continue;
-                }
-
-                rc = sd_bus_wait(bus_type, (uint64_t) - 1);
-                if (rc < 0)
-                {
-                    fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-rc));
-                    break;
-                }
-            }
-        }
-    }
-    sd_bus_slot_unref(led_slot);
-    sd_bus_unref(bus_type);
-
-    return rc;
-}
-
-int main(void)
-{
-    int rc = 0;
-
-    /* This call is not supposed to return. If it does, then an error */
-    rc = start_led_services();
-    if(rc < 0)
-    {
-        fprintf(stderr, "Error starting LED Services. Exiting");
-    }
-
-    return rc;
-}
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <string.h>
+#include <dirent.h>
+#include <systemd/sd-bus.h>
+
+/*
+ * These are control files that are present for each led under
+ *'/sys/class/leds/<led_name>/' which are used to trigger action
+ * on the respective leds by writing predefined data.
+ */
+const char *power_ctrl = "brightness";
+const char *blink_ctrl = "trigger";
+const char *duty_on = "delay_on";
+const char *duty_off = "delay_off";
+
+/*
+ * --------------------------------------------------
+ * Given the dbus path, returns the name of the LED
+ * --------------------------------------------------
+ */
+char *
+get_led_name(const char *dbus_path)
+{
+	char *led_name = NULL;
+
+	/* Get the led name from /org/openbmc/control/led/<name> */
+	led_name = strrchr(dbus_path, '/');
+	if(led_name)
+	{
+		led_name++;
+	}
+
+	return led_name;
+}
+
+/*
+ * -------------------------------------------------------------------------
+ * Writes the 'on / off / blink' trigger to leds.
+ * -------------------------------------------------------------------------
+ */
+int
+write_to_led(const char *name, const char *ctrl_file, const char *value)
+{
+	/* Generic error reporter. */
+	int rc = -1;
+
+	/* To get /sys/class/leds/<name>/<control file> */
+	char led_path[128] = {0};
+
+	int len = 0;
+	len = snprintf(led_path, sizeof(led_path),
+			"/sys/class/leds/%s/%s",name, ctrl_file);
+	if(len >= sizeof(led_path))
+	{
+		fprintf(stderr, "Error. LED path is too long. :[%d]\n",len);
+		return rc;
+	}
+
+	FILE *fp = fopen(led_path,"w");
+	if(fp == NULL)
+	{
+		fprintf(stderr,"Error:[%s] opening:[%s]\n",strerror(errno),led_path);
+		return rc;
+	}
+
+	rc = fwrite(value, strlen(value), 1, fp);
+	if(rc != 1)
+	{
+		fprintf(stderr, "Error:[%s] writing to :[%s]\n",strerror(errno),led_path);
+	}
+
+	fclose(fp);
+
+	/* When we get here, rc would be what it was from writing to the file */
+	return (rc == 1) ? 0 : -1;
+}
+
+/*
+ * ----------------------------------------------------------------
+ * Router function for any LED operations that come via dbus
+ *----------------------------------------------------------------
+ */
+static int
+led_function_router(sd_bus_message *msg, void *user_data,
+		sd_bus_error *ret_error)
+{
+	/* Generic error reporter. */
+	int rc = -1;
+
+	/* Extract the led name from the full dbus path */
+	const char *led_path = sd_bus_message_get_path(msg);
+	if(led_path == NULL)
+	{
+		fprintf(stderr, "Error. LED path is empty");
+		return sd_bus_reply_method_return(msg, "i", rc);
+	}
+
+	char *led_name = get_led_name(led_path);
+	if(led_name == NULL)
+	{
+		fprintf(stderr, "Invalid LED name for path :[%s]\n",led_path);
+		return sd_bus_reply_method_return(msg, "i", rc);
+	}
+
+	/* Now that we have the LED name, get the Operation. */
+	const char *led_function = sd_bus_message_get_member(msg);
+	if(led_function == NULL)
+	{
+		fprintf(stderr, "Null LED function specificed for : [%s]\n",led_name);
+		return sd_bus_reply_method_return(msg, "i", rc);
+	}
+
+	/* Route the user action to appropriate handlers. */
+	if( (strcmp(led_function, "setOn") == 0) ||
+			(strcmp(led_function, "setOff") == 0))
+	{
+		rc = led_stable_state_function(led_name, led_function);
+		return sd_bus_reply_method_return(msg, "i", rc);
+	}
+	else if( (strcmp(led_function, "setBlinkFast") == 0) ||
+			(strcmp(led_function, "setBlinkSlow") == 0))
+	{
+		rc = led_default_blink(led_name, led_function);
+		return sd_bus_reply_method_return(msg, "i", rc);
+	}
+	else if(strcmp(led_function, "BlinkCustom") == 0)
+	{
+		rc = led_custom_blink(led_name, msg);
+		return sd_bus_reply_method_return(msg, "i", rc);
+	}
+	else if(strcmp(led_function, "GetLedState") == 0)
+	{
+		char value_str[10] = {0};
+		const char *led_state = NULL;
+
+		rc = read_led(led_name, power_ctrl, value_str, sizeof(value_str)-1);
+		if(rc >= 0)
+		{
+			/* LED is active HI */
+			led_state = strtoul(value_str, NULL, 0) ? "On" : "Off";
+		}
+		return sd_bus_reply_method_return(msg, "is", rc, led_state);
+	}
+	else
+	{
+		fprintf(stderr,"Invalid LED function:[%s]\n",led_function);
+	}
+
+	return sd_bus_reply_method_return(msg, "i", rc);
+}
+
+/*
+ * --------------------------------------------------------------
+ * Turn On or Turn Off the LED
+ * --------------------------------------------------------------
+ */
+int
+led_stable_state_function(char *led_name, char *led_function)
+{
+	/* Generic error reporter. */
+	int rc = -1;
+
+	const char *value = NULL;
+	if(strcmp(led_function, "setOff") == 0)
+	{
+		/* LED active low */
+		value = "0";
+	}
+	else if(strcmp(led_function, "setOn") == 0)
+	{
+		value = "255";
+	}
+	else
+	{
+		fprintf(stderr,"Invalid LED stable state operation:[%s] \n",led_function);
+		return rc;
+	}
+
+	/*
+	 * Before doing anything, need to turn off the blinking
+	 * if there is one in progress by writing 'none' to trigger
+	 */
+	rc = write_to_led(led_name, blink_ctrl, "none");
+	if(rc < 0)
+	{
+		fprintf(stderr,"Error disabling blink. Function:[%s]\n", led_function);
+		return rc;
+	}
+
+	/*
+	 * Open the brightness file and write corresponding values.
+	 */
+	rc = write_to_led(led_name, power_ctrl, value);
+	if(rc < 0)
+	{
+		fprintf(stderr,"Error driving LED. Function:[%s]\n", led_function);
+	}
+
+	return rc;
+}
+
+//-----------------------------------------------------------------------------------
+// Given the on and off duration, applies the action on the specified LED.
+//-----------------------------------------------------------------------------------
+int
+blink_led(const char *led_name, const char *on_duration, const char *off_duration)
+{
+	/* Generic error reporter */
+	int rc = -1;
+
+	/* Protocol demands that 'timer' be echoed to 'trigger' */
+	rc = write_to_led(led_name, blink_ctrl, "timer");
+	if(rc < 0)
+	{
+		fprintf(stderr,"Error writing timer to Led:[%s]\n", led_name);
+		return rc;
+	}
+
+	/*
+	 * After writing 'timer to 'trigger', 2 new files get generated namely
+	 *'delay_on' and 'delay_off' which are telling the time duration for a
+	 * particular LED on and off.
+	 */
+	rc = write_to_led(led_name, duty_on, on_duration);
+	if(rc < 0)
+	{
+		fprintf(stderr,"Error writing [%s] to delay_on:[%s]\n",on_duration,led_name);
+		return rc;
+	}
+
+	rc = write_to_led(led_name, duty_off, off_duration);
+	if(rc < 0)
+	{
+		fprintf(stderr,"Error writing [%s] to delay_off:[%s]\n",off_duration,led_name);
+	}
+
+	return rc;
+}
+
+/*
+ * ----------------------------------------------------
+ * Default blink action on the LED.
+ * ----------------------------------------------------
+ */
+int
+led_default_blink(char *led_name, char *blink_type)
+{
+	/* Generic error reporter */
+	int rc = -1;
+
+	/* How long the LED needs to be in on and off state while blinking */
+	const char *on_duration = NULL;
+	const char *off_duration = NULL;
+	if(strcmp(blink_type, "setBlinkSlow") == 0)
+	{
+		//*Delay 900 millisec before 'on' and delay 900 millisec before off */
+		on_duration = "900";
+		off_duration = "900";
+	}
+	else if(strcmp(blink_type, "setBlinkFast") == 0)
+	{
+		/* Delay 200 millisec before 'on' and delay 200 millisec before off */
+		on_duration = "200";
+		off_duration = "200";
+	}
+	else
+	{
+		fprintf(stderr,"Invalid blink operation:[%s]\n",blink_type);
+		return rc;
+	}
+
+	rc = blink_led(led_name, on_duration, off_duration);
+
+	return rc;
+}
+
+/*
+ * -------------------------------------------------
+ * Blinks at user defined 'on' and 'off' intervals.
+ * -------------------------------------------------
+ */
+int
+led_custom_blink(const char *led_name, sd_bus_message *msg)
+{
+	/* Generic error reporter. */
+	int rc = -1;
+	int led_len = 0;
+
+	/* User supplied 'on' and 'off' duration converted into string */
+	char on_duration[32] = {0};
+	char off_duration[32] = {0};
+
+	/* User supplied 'on' and 'off' duration */
+	uint32_t user_input_on = 0;
+	uint32_t user_input_off = 0;
+
+	/* Extract values into 'ss' ( string, string) */
+	rc = sd_bus_message_read(msg, "uu", &user_input_on, &user_input_off);
+	if(rc < 0)
+	{
+		fprintf(stderr, "Failed to read 'on' and 'off' duration.[%s]\n", strerror(-rc));
+	}
+	else
+	{
+		/*
+		 * Converting user supplied integer arguments into string as required by
+		 * sys interface. The top level REST will make sure that an error is
+		 * thrown right away on invalid inputs. However, REST is allowing the
+		 * unsigned decimal and floating numbers but when its received here, its
+		 * received as decimal so no input validation needed.
+		 */
+		led_len = snprintf(on_duration, sizeof(on_duration),
+				"%d",user_input_on);
+		if(led_len >= sizeof(on_duration))
+		{
+			fprintf(stderr, "Error. Blink ON duration is too long. :[%d]\n",led_len);
+			return rc;
+		}
+
+		led_len = snprintf(off_duration, sizeof(off_duration),
+				"%d",user_input_off);
+		if(led_len >= sizeof(off_duration))
+		{
+			fprintf(stderr, "Error. Blink OFF duration is too long. :[%d]\n",led_len);
+			return rc;
+		}
+
+		/* We are good here.*/
+		rc = blink_led(led_name, on_duration, off_duration);
+	}
+	return rc;
+}
+
+/*
+ * ---------------------------------------------------------------
+ * Gets the current value of passed in LED file
+ * Mainly used for reading 'brightness'
+ * NOTE : It is the responsibility of the caller to allocate
+ * sufficient space for buffer. This will read upto user supplied
+ * size -or- entire contents of file whichever is smaller
+ * ----------------------------------------------------------------
+ */
+int
+read_led(const char *name, const char *ctrl_file,
+		void *value, const size_t len)
+{
+	/* Generic error reporter. */
+	int rc = -1;
+	int count = 0;
+
+	if(value == NULL || len <= 0)
+	{
+		fprintf(stderr, "Invalid buffer passed to LED read\n");
+		return rc;
+	}
+
+	/* To get /sys/class/leds/<name>/<control file> */
+	char led_path[128] = {0};
+
+	int led_len = 0;
+	led_len = snprintf(led_path, sizeof(led_path),
+			"/sys/class/leds/%s/%s",name, ctrl_file);
+	if(led_len >= sizeof(led_path))
+	{
+		fprintf(stderr, "Error. LED path is too long. :[%d]\n",led_len);
+		return rc;
+	}
+
+	FILE *fp = fopen(led_path,"rb");
+	if(fp == NULL)
+	{
+		fprintf(stderr,"Error:[%s] opening:[%s]\n",strerror(errno),led_path);
+		return rc;
+	}
+
+	char *sysfs_value = (char *)value;
+	while(!feof(fp) && (count < len))
+	{
+		sysfs_value[count++] = fgetc(fp);
+	}
+
+	fclose(fp);
+	return 0;
+}
+
+/*
+ * -----------------------------------------------
+ * Dbus Services offered by this LED controller
+ * -----------------------------------------------
+ */
+static const sd_bus_vtable led_control_vtable[] =
+{
+	SD_BUS_VTABLE_START(0),
+	SD_BUS_METHOD("setOn", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("setOff", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("setBlinkFast", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("setBlinkSlow", "", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("GetLedState", "", "is", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("BlinkCustom", "uu", "i", &led_function_router, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_VTABLE_END,
+};
+
+/*
+ * ---------------------------------------------
+ * Interested in all files except standard ones
+ * ---------------------------------------------
+ */
+int
+led_select(const struct dirent *entry)
+{
+	if( (strcmp(entry->d_name, ".") == 0) ||
+			(strcmp(entry->d_name, "..") == 0))
+	{
+		return 0;
+	}
+	return 1;
+}
+
+/*
+ * ------------------------------------------------
+ * Called as part of setting up skeleton services.
+ * -----------------------------------------------
+ */
+int
+start_led_services()
+{
+	/* Generic error reporter. */
+	int rc = -1;
+	int num_leds = 0;
+	int count_leds = 0;
+
+	/* Bus and slot where we are offering the LED dbus service. */
+	sd_bus *bus_type = NULL;
+	sd_bus_slot *led_slot = NULL;
+
+	/* For walking '/sys/class/leds/' looking for names of LED.*/
+	struct dirent **led_list;
+
+	/* Get a hook onto system bus. */
+	rc = sd_bus_open_system(&bus_type);
+	if(rc < 0)
+	{
+		fprintf(stderr,"Error opening system bus.\n");
+		return rc;
+	}
+
+	count_leds = num_leds = scandir("/sys/class/leds/",
+			&led_list, led_select, alphasort);
+	if(num_leds <= 0)
+	{
+		fprintf(stderr,"No LEDs present in the system\n");
+
+		sd_bus_slot_unref(led_slot);
+		sd_bus_unref(bus_type);
+		return rc;
+	}
+
+	/* Fully qualified Dbus object for a particular LED */
+	char led_object[128] = {0};
+	int len = 0;
+
+	/* For each led present, announce the service on dbus. */
+	while(num_leds--)
+	{
+		memset(led_object, 0x0, sizeof(led_object));
+
+		len = snprintf(led_object, sizeof(led_object), "%s%s",
+				"/org/openbmc/control/led/", led_list[num_leds]->d_name);
+
+		if(len >= sizeof(led_object))
+		{
+			fprintf(stderr, "Error. LED object is too long:[%d]\n",len);
+			rc = -1;
+			break;
+		}
+
+		/* Install the object */
+		rc = sd_bus_add_object_vtable(bus_type,
+				&led_slot,
+				led_object, /* object path */
+				"org.openbmc.Led", /* interface name */
+				led_control_vtable,
+				NULL);
+
+		if(rc < 0)
+		{
+			fprintf(stderr, "Failed to add object to dbus: %s\n", strerror(-rc));
+			break;
+		}
+	}
+
+	/* Done with all registration. */
+	while(count_leds > 0)
+	{
+		free(led_list[--count_leds]);
+	}
+	free(led_list);
+
+	/* If we had success in adding the providers, request for a bus name. */
+	if(rc == 0)
+	{
+		/* Take one in OpenBmc */
+		rc = sd_bus_request_name(bus_type, "org.openbmc.control.led", 0);
+		if(rc < 0)
+		{
+			fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-rc));
+		}
+		else
+		{
+			for(;;)
+			{
+				/* Process requests */
+				rc = sd_bus_process(bus_type, NULL);
+				if(rc < 0)
+				{
+					fprintf(stderr, "Failed to process bus: %s\n", strerror(-rc));
+					break;
+				}
+				if(rc > 0)
+				{
+					continue;
+				}
+
+				rc = sd_bus_wait(bus_type, (uint64_t) - 1);
+				if(rc < 0)
+				{
+					fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-rc));
+					break;
+				}
+			}
+		}
+	}
+	sd_bus_slot_unref(led_slot);
+	sd_bus_unref(bus_type);
+
+	return rc;
+}
+
+int
+main(void)
+{
+	int rc = 0;
+
+	/* This call is not supposed to return. If it does, then an error */
+	rc = start_led_services();
+	if(rc < 0)
+	{
+		fprintf(stderr, "Error starting LED Services. Exiting");
+	}
+
+	return rc;
+}
diff --git a/objects/pcie_slot_present_obj.c b/objects/pcie_slot_present_obj.c
index 0cbc2d7..a71ba2d 100644
--- a/objects/pcie_slot_present_obj.c
+++ b/objects/pcie_slot_present_obj.c
@@ -1,164 +1,167 @@
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include <stdio.h>
-#include <stdbool.h>
-#include <string.h>
-#include "gpio.h"
-
-#define NUM_SLOTS 8
-GPIO slots[NUM_SLOTS] = {
-	{ "SLOT0_RISER_PRESENT" },
-	{ "SLOT1_RISER_PRESENT" },
-	{ "SLOT2_RISER_PRESENT" },
-	{ "SLOT0_PRESENT" },
-	{ "SLOT1_PRESENT" },
-	{ "SLOT2_PRESENT" },
-	{ "MEZZ0_PRESENT" },
-	{ "MEZZ1_PRESENT" },
-};
-
-typedef struct {
-	const char* bus_name;
-	const char* path;
-	const char* intf_name;
-} object_info;
-	
-
-
-/* ---------------------------------------------------------------------------------------------------- */
-int get_object(GDBusProxy *proxy, GPIO* gpio, object_info* obj_info)
-{
-	g_print("Checking Presence: %s\n",gpio->name);
- 	GError *error;
-	GVariant *parm;
-	GVariant *result;
-
-	error = NULL;
-	parm = g_variant_new("(ss)","GPIO_PRESENT",gpio->name);
-	result = g_dbus_proxy_call_sync (proxy,
-                                   "getObjectFromId",
-				   parm,
-                                   G_DBUS_CALL_FLAGS_NONE,
-                                   -1,
-                                   NULL,
-                                   &error);
-	g_assert_no_error (error);
-
-	GVariantIter *iter = g_variant_iter_new(result);
-	GVariant* v_result = g_variant_iter_next_value(iter);
-
-	g_variant_get(v_result,"(sss)",&obj_info->bus_name,&obj_info->path,&obj_info->intf_name);
-int rc=0;
-	if (strlen(obj_info->bus_name) == 0) {
-		rc = 1;
-	}
-	g_variant_unref(v_result);
-	g_variant_unref(result);
-
-	return rc;
-}
-
-int get_presence(GDBusConnection* connection, GPIO* gpio, uint8_t* present)
-{
-	int rc = GPIO_OK;
-	do {
-		rc = gpio_init(connection,gpio);
-		if (rc != GPIO_OK) { break; }
-		uint8_t gpio_val;
-		rc = gpio_open(gpio);
-		if (rc != GPIO_OK) { break; }
-		rc = gpio_read(gpio,&gpio_val);
-		if (rc != GPIO_OK) { gpio_close(gpio); break; }
-		gpio_close(gpio);
-		*present = gpio_val;	
-	} while(0);
-	if (rc != GPIO_OK)
-	{
-		printf("ERROR pcie_slot_present: GPIO error %s (rc=%d)\n",gpio->name,rc);
-	}
-	return rc; 
-}
-
-void update_fru_obj(GDBusConnection* connection, object_info* obj_info, const char* present)
-{
-	GDBusProxy *proxy;
- 	GError *error;
-	GVariant *parm;
-	GVariant *result;
-
-	error = NULL;
-	proxy = g_dbus_proxy_new_sync (connection,
-                             G_DBUS_PROXY_FLAGS_NONE,
-                             NULL,                      /* GDBusInterfaceInfo* */
-                             obj_info->bus_name, /* name */
-                             obj_info->path, /* object path */
-                             obj_info->intf_name,        /* interface name */
-                             NULL,                      /* GCancellable */
-                             &error);
-	g_assert_no_error (error);
-
-	error = NULL;
-	parm = g_variant_new("(s)",present);
-	
-	result = g_dbus_proxy_call_sync (proxy,
-                                   "setPresent",
-				   parm,
-                                   G_DBUS_CALL_FLAGS_NONE,
-                                   -1,
-                                   NULL,
-                                   &error);
-
-	g_assert_no_error (error);
-}
-
-gint
-main (gint argc, gchar *argv[])
-{
-	GMainLoop *loop;
-	GDBusConnection *c;
-	GDBusProxy *sys_proxy;
- 	GError *error;
-	GVariant *parm;
-	GVariant *result;
-
-	loop = g_main_loop_new (NULL, FALSE);
-
-	error = NULL;
-	c = g_bus_get_sync (DBUS_TYPE, NULL, &error);
-
-	error = NULL;
-	sys_proxy = g_dbus_proxy_new_sync (c,
-                             G_DBUS_PROXY_FLAGS_NONE,
-                             NULL,                      /* GDBusInterfaceInfo* */
-                             "org.openbmc.managers.System", /* name */
-                             "/org/openbmc/managers/System", /* object path */
-                             "org.openbmc.managers.System",        /* interface name */
-                             NULL,                      /* GCancellable */
-                             &error);
-	g_assert_no_error (error);
-
-	int i = 0;
-	int rc = 0;	
-	for (i=0;i<NUM_SLOTS;i++)
-	{
-		object_info obj_info;
-		uint8_t present;
-		char* chr_present;
-		do {
-			rc = get_object(sys_proxy,&slots[i],&obj_info);
-			if (rc) { break; }
-			rc = get_presence(c,&slots[i],&present);
-			//if (rc) { break; }
-			// TODO: send correct state
-			if (present == 0) {
-				update_fru_obj(c,&obj_info,"True");
-			} else {
-				update_fru_obj(c,&obj_info,"False");
-			}
-		} while(0);
-	}
-
-	g_object_unref(c);
- 	g_main_loop_unref (loop);
- 	return 0;
-}
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include <stdio.h>
+#include <stdbool.h>
+#include <string.h>
+#include "gpio.h"
+
+#define NUM_SLOTS 8
+GPIO slots[NUM_SLOTS] = {
+	{ "SLOT0_RISER_PRESENT" },
+	{ "SLOT1_RISER_PRESENT" },
+	{ "SLOT2_RISER_PRESENT" },
+	{ "SLOT0_PRESENT" },
+	{ "SLOT1_PRESENT" },
+	{ "SLOT2_PRESENT" },
+	{ "MEZZ0_PRESENT" },
+	{ "MEZZ1_PRESENT" },
+};
+
+typedef struct {
+	const char* bus_name;
+	const char* path;
+	const char* intf_name;
+} object_info;
+
+
+
+/* ------------------------------------------------------------------------- */
+int
+get_object(GDBusProxy *proxy, GPIO* gpio, object_info* obj_info)
+{
+	g_print("Checking Presence: %s\n",gpio->name);
+	GError *error;
+	GVariant *parm;
+	GVariant *result;
+
+	error = NULL;
+	parm = g_variant_new("(ss)","GPIO_PRESENT",gpio->name);
+	result = g_dbus_proxy_call_sync(proxy,
+			"getObjectFromId",
+			parm,
+			G_DBUS_CALL_FLAGS_NONE,
+			-1,
+			NULL,
+			&error);
+	g_assert_no_error(error);
+
+	GVariantIter *iter = g_variant_iter_new(result);
+	GVariant* v_result = g_variant_iter_next_value(iter);
+
+	g_variant_get(v_result,"(sss)",&obj_info->bus_name,&obj_info->path,&obj_info->intf_name);
+	int rc=0;
+	if(strlen(obj_info->bus_name) == 0) {
+		rc = 1;
+	}
+	g_variant_unref(v_result);
+	g_variant_unref(result);
+
+	return rc;
+}
+
+int
+get_presence(GDBusConnection* connection, GPIO* gpio, uint8_t* present)
+{
+	int rc = GPIO_OK;
+	do {
+		rc = gpio_init(connection,gpio);
+		if(rc != GPIO_OK) { break; }
+		uint8_t gpio_val;
+		rc = gpio_open(gpio);
+		if(rc != GPIO_OK) { break; }
+		rc = gpio_read(gpio,&gpio_val);
+		if(rc != GPIO_OK) { gpio_close(gpio); break; }
+		gpio_close(gpio);
+		*present = gpio_val;
+	} while(0);
+	if(rc != GPIO_OK)
+	{
+		printf("ERROR pcie_slot_present: GPIO error %s (rc=%d)\n",gpio->name,rc);
+	}
+	return rc;
+}
+
+void
+update_fru_obj(GDBusConnection* connection, object_info* obj_info, const char* present)
+{
+	GDBusProxy *proxy;
+	GError *error;
+	GVariant *parm;
+	GVariant *result;
+
+	error = NULL;
+	proxy = g_dbus_proxy_new_sync(connection,
+			G_DBUS_PROXY_FLAGS_NONE,
+			NULL, /* GDBusInterfaceInfo* */
+			obj_info->bus_name, /* name */
+			obj_info->path, /* object path */
+			obj_info->intf_name, /* interface name */
+			NULL, /* GCancellable */
+			&error);
+	g_assert_no_error(error);
+
+	error = NULL;
+	parm = g_variant_new("(s)",present);
+
+	result = g_dbus_proxy_call_sync(proxy,
+			"setPresent",
+			parm,
+			G_DBUS_CALL_FLAGS_NONE,
+			-1,
+			NULL,
+			&error);
+
+	g_assert_no_error(error);
+}
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	GDBusConnection *c;
+	GDBusProxy *sys_proxy;
+	GError *error;
+	GVariant *parm;
+	GVariant *result;
+
+	loop = g_main_loop_new(NULL, FALSE);
+
+	error = NULL;
+	c = g_bus_get_sync(DBUS_TYPE, NULL, &error);
+
+	error = NULL;
+	sys_proxy = g_dbus_proxy_new_sync(c,
+			G_DBUS_PROXY_FLAGS_NONE,
+			NULL, /* GDBusInterfaceInfo* */
+			"org.openbmc.managers.System", /* name */
+			"/org/openbmc/managers/System", /* object path */
+			"org.openbmc.managers.System", /* interface name */
+			NULL, /* GCancellable */
+			&error);
+	g_assert_no_error(error);
+
+	int i = 0;
+	int rc = 0;
+	for(i=0;i<NUM_SLOTS;i++)
+	{
+		object_info obj_info;
+		uint8_t present;
+		char* chr_present;
+		do {
+			rc = get_object(sys_proxy,&slots[i],&obj_info);
+			if(rc) { break; }
+			rc = get_presence(c,&slots[i],&present);
+			//if (rc) { break; }
+			// TODO: send correct state
+			if(present == 0) {
+				update_fru_obj(c,&obj_info,"True");
+			} else {
+				update_fru_obj(c,&obj_info,"False");
+			}
+		} while(0);
+	}
+
+	g_object_unref(c);
+	g_main_loop_unref(loop);
+	return 0;
+}
diff --git a/objects/power_control_obj.c b/objects/power_control_obj.c
index a7abba4..72947f5 100644
--- a/objects/power_control_obj.c
+++ b/objects/power_control_obj.c
@@ -1,324 +1,320 @@
-#include <stdint.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include <syslog.h>
-#include "interfaces/openbmc_intf.h"
-#include "openbmc.h"
-#include "gpio.h"
-#include "object_mapper.h"
-
-/* ---------------------------------------------------------------------------------------------------- */
-static const gchar* dbus_object_path = "/org/openbmc/control";
-static const gchar* instance_name = "power0";
-static const gchar* dbus_name        = "org.openbmc.control.Power";
-
-//This object will use these GPIOs
-GPIO power_pin    = (GPIO){ "POWER_PIN" };
-GPIO pgood        = (GPIO){ "PGOOD" };
-GPIO usb_reset    = (GPIO){ "USB_RESET" };
-GPIO pcie_reset   = (GPIO){ "PCIE_RESET" };
-
-
-static GDBusObjectManagerServer *manager = NULL;
-
-time_t pgood_timeout_start = 0;
-
-// TODO:  Change to interrupt driven instead of polling
-static gboolean poll_pgood(gpointer user_data)
-{
-	ControlPower *control_power = object_get_control_power((Object*)user_data);
-	Control* control = object_get_control((Object*)user_data);
-
-	//send the heartbeat
-	const gchar* obj_path = g_dbus_object_get_object_path((GDBusObject*)user_data);
-
-	guint poll_int = control_get_poll_interval(control);
-	if (poll_int == 0)
-	{
-		printf("ERROR PowerControl: Poll interval cannot be 0\n");
-		return FALSE;
-	}
-	//handle timeout
-	time_t current_time = time(NULL);
-	if (difftime(current_time,pgood_timeout_start) > control_power_get_pgood_timeout(control_power)
-		&& pgood_timeout_start != 0)
-	{
-		printf("ERROR PowerControl: Pgood poll timeout\n");
-		// set timeout to 0 so timeout doesn't happen again
-		control_power_set_pgood_timeout(control_power,0);
-		pgood_timeout_start = 0;
-		return TRUE;
-	}
-	uint8_t gpio;
-	
-	int rc = gpio_open(&pgood);
-	rc = gpio_read(&pgood,&gpio);
-	gpio_close(&pgood);	
-	if (rc == GPIO_OK)
-	{
-		//if changed, set property and emit signal
-		if (gpio != control_power_get_pgood(control_power))
-		{
- 			control_power_set_pgood(control_power,gpio);
- 			if (gpio==0)
- 			{
- 				control_power_emit_power_lost(control_power);
-				control_emit_goto_system_state(control,"HOST_POWERED_OFF");
-				rc = gpio_open(&pcie_reset);
-				rc = gpio_write(&pcie_reset,0);
-				gpio_close(&pcie_reset);
-
-				rc = gpio_open(&usb_reset);
-				rc = gpio_write(&usb_reset,0);
-				gpio_close(&usb_reset);		
-
- 			}
- 			else
- 			{
- 				control_power_emit_power_good(control_power);
-				control_emit_goto_system_state(control,"HOST_POWERED_ON");
-				rc = gpio_open(&pcie_reset);
-				rc = gpio_write(&pcie_reset,1);
-				gpio_close(&pcie_reset);
-
-				rc = gpio_open(&usb_reset);
-				rc = gpio_write(&usb_reset,1);
-				gpio_close(&usb_reset);		
- 			}
-		}
-	} else {
-		printf("ERROR PowerControl: GPIO read error (gpio=%s,rc=%d)\n",pgood.name,rc);
-		//return false so poll won't get called anymore
-		return FALSE;
-	}
-	//pgood is not at desired state yet
-	if (gpio != control_power_get_state(control_power) &&
-		control_power_get_pgood_timeout(control_power) > 0)
-	{
-		if (pgood_timeout_start == 0 ) {
-			pgood_timeout_start = current_time;
-		}
-	}
-	else 
-	{
-		pgood_timeout_start = 0;
-	}
-	return TRUE;
-}
-
-
-
-static gboolean
-on_set_power_state (ControlPower          *pwr,
-                GDBusMethodInvocation  *invocation,
-                guint                   state,
-                gpointer                user_data)
-{
-	Control* control = object_get_control((Object*)user_data);
-	const gchar* obj_path = g_dbus_object_get_object_path((GDBusObject*)user_data);
-	if (state > 1)
-	{
-		g_dbus_method_invocation_return_dbus_error (invocation,
-                                                "org.openbmc.ControlPower.Error.Failed",
-                                                "Invalid power state");
-		return TRUE;
-	}
-	// return from method call
-	control_power_complete_set_power_state(pwr,invocation);
-	if (state == control_power_get_state(pwr))
-	{
-		g_print("Power already at requested state: %d\n",state);
-	}
-	else
-	{
-		int error = 0;
-		do {
-			if (state == 1) {
-				control_emit_goto_system_state(control,"HOST_POWERING_ON");
-			} else {
-				control_emit_goto_system_state(control,"HOST_POWERING_OFF");
-			}
-			error = gpio_open(&power_pin);
-			if (error != GPIO_OK) { break;	}
-			error = gpio_write(&power_pin,!state);
-			if (error != GPIO_OK) { break;	}
-			gpio_close(&power_pin);
-			control_power_set_state(pwr,state);
-		} while(0);
-		if (error != GPIO_OK)
-		{
-			printf("ERROR PowerControl: GPIO set power state (rc=%d)\n",error);
-		}
-	}
-	return TRUE;
-}
-
-static gboolean
-on_init (Control         *control,
-         GDBusMethodInvocation  *invocation,
-         gpointer                user_data)
-{
-	pgood_timeout_start = 0;
-	//guint poll_interval = control_get_poll_interval(control);
-	//g_timeout_add(poll_interval, poll_pgood, user_data);
-	control_complete_init(control,invocation);
-	return TRUE;
-}
-
-static gboolean
-on_get_power_state (ControlPower          *pwr,
-                GDBusMethodInvocation  *invocation,
-                gpointer                user_data)
-{
-	guint pgood = control_power_get_pgood(pwr);
-	control_power_complete_get_power_state(pwr,invocation,pgood);
-	return TRUE;
-}
-
-static void 
-on_bus_acquired (GDBusConnection *connection,
-                 const gchar     *name,
-                 gpointer         user_data)
-{
-	ObjectSkeleton *object;
- 	cmdline *cmd = user_data;
-	if (cmd->argc < 3)
-	{
-		g_print("Usage: power_control.exe [poll interval] [timeout]\n");
-		return;
-	}	
-  	manager = g_dbus_object_manager_server_new (dbus_object_path);
-	gchar *s;
-  	s = g_strdup_printf ("%s/%s",dbus_object_path,instance_name);
-  	object = object_skeleton_new (s);
-  	g_free (s);
-
-	ControlPower* control_power = control_power_skeleton_new ();
-	object_skeleton_set_control_power (object, control_power);
-	g_object_unref (control_power);
-	
-	Control* control = control_skeleton_new ();
-	object_skeleton_set_control (object, control);
-	g_object_unref (control);
-
-	ObjectMapper* mapper = object_mapper_skeleton_new ();
-	object_skeleton_set_object_mapper (object, mapper);
-	g_object_unref (mapper);
-
-	//define method callbacks here
-	g_signal_connect (control_power,
-       	            "handle-set-power-state",
-               	    G_CALLBACK (on_set_power_state),
-               	    object); /* user_data */
-
-	g_signal_connect (control_power,
-               	    "handle-get-power-state",
-               	    G_CALLBACK (on_get_power_state),
-               	    NULL); /* user_data */
-
-	g_signal_connect (control,
-               	    "handle-init",
-               	    G_CALLBACK (on_init),
-               	    object); /* user_data */
-
-
-	/* Export the object (@manager takes its own reference to @object) */
-	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
-	g_object_unref (object);
-
-	/* Export all objects */
-	g_dbus_object_manager_server_set_connection (manager, connection);
-
-	// get gpio device paths
-	int rc = GPIO_OK;
-	do {
-		rc = gpio_init(connection,&power_pin);
-		if (rc != GPIO_OK) { break; }
-		rc = gpio_init(connection,&pgood);
-		if (rc != GPIO_OK) { break; }
-		rc = gpio_init(connection,&pcie_reset);
-		if (rc != GPIO_OK) { break; }
-		rc = gpio_init(connection,&usb_reset);
-		if (rc != GPIO_OK) { break; }
-
-		uint8_t gpio;
-		rc = gpio_open(&pgood);
-		if (rc != GPIO_OK) { break; }
-		rc = gpio_read(&pgood,&gpio);
-		if (rc != GPIO_OK) { break; }
-		gpio_close(&pgood);	
-		control_power_set_pgood(control_power,gpio);
-		control_power_set_state(control_power,gpio);
-		printf("Pgood state: %d\n",gpio);
-
-	} while(0);
-	if (rc != GPIO_OK)
-	{
-		printf("ERROR PowerControl: GPIO setup (rc=%d)\n",rc);
-	}
-	//start poll
-	pgood_timeout_start = 0;
-	int poll_interval = atoi(cmd->argv[1]);
-	int pgood_timeout = atoi(cmd->argv[2]);
-	if (poll_interval < 1000 || pgood_timeout <5) {
-		printf("ERROR PowerControl: poll_interval < 1000 or pgood_timeout < 5\n");
-	} else {
-		control_set_poll_interval(control,poll_interval);
-		control_power_set_pgood_timeout(control_power,pgood_timeout);
-		g_timeout_add(poll_interval, poll_pgood, object);
-	}
-	emit_object_added((GDBusObjectManager*)manager);  
-}
-
-static void
-on_name_acquired (GDBusConnection *connection,
-                  const gchar     *name,
-                  gpointer         user_data)
-{
-}
-
-static void
-on_name_lost (GDBusConnection *connection,
-              const gchar     *name,
-              gpointer         user_data)
-{
-}
-
-
-
-
-/*----------------------------------------------------------------*/
-/* Main Event Loop                                                */
-
-gint
-main (gint argc, gchar *argv[])
-{
-  GMainLoop *loop;
-  cmdline cmd;
-  cmd.argc = argc;
-  cmd.argv = argv;
-
-  guint id;
-  loop = g_main_loop_new (NULL, FALSE);
-
-  id = g_bus_own_name (DBUS_TYPE,
-                       dbus_name,
-                       G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
-                       G_BUS_NAME_OWNER_FLAGS_REPLACE,
-                       on_bus_acquired,
-                       on_name_acquired,
-                       on_name_lost,
-                       &cmd,
-                       NULL);
-
-   g_main_loop_run (loop);
-  
-  g_bus_unown_name (id);
-  g_main_loop_unref (loop);
-  return 0;
-}
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include <syslog.h>
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include "gpio.h"
+#include "object_mapper.h"
+
+/* ------------------------------------------------------------------------- */
+static const gchar* dbus_object_path = "/org/openbmc/control";
+static const gchar* instance_name = "power0";
+static const gchar* dbus_name = "org.openbmc.control.Power";
+
+//This object will use these GPIOs
+GPIO power_pin    = (GPIO){ "POWER_PIN" };
+GPIO pgood        = (GPIO){ "PGOOD" };
+GPIO usb_reset    = (GPIO){ "USB_RESET" };
+GPIO pcie_reset   = (GPIO){ "PCIE_RESET" };
+
+
+static GDBusObjectManagerServer *manager = NULL;
+
+time_t pgood_timeout_start = 0;
+
+// TODO:  Change to interrupt driven instead of polling
+static gboolean
+poll_pgood(gpointer user_data)
+{
+	ControlPower *control_power = object_get_control_power((Object*)user_data);
+	Control* control = object_get_control((Object*)user_data);
+
+	//send the heartbeat
+	const gchar* obj_path = g_dbus_object_get_object_path((GDBusObject*)user_data);
+
+	guint poll_int = control_get_poll_interval(control);
+	if(poll_int == 0)
+	{
+		printf("ERROR PowerControl: Poll interval cannot be 0\n");
+		return FALSE;
+	}
+	//handle timeout
+	time_t current_time = time(NULL);
+	if(difftime(current_time,pgood_timeout_start) > control_power_get_pgood_timeout(control_power)
+			&& pgood_timeout_start != 0)
+	{
+		printf("ERROR PowerControl: Pgood poll timeout\n");
+		// set timeout to 0 so timeout doesn't happen again
+		control_power_set_pgood_timeout(control_power,0);
+		pgood_timeout_start = 0;
+		return TRUE;
+	}
+	uint8_t gpio;
+
+	int rc = gpio_open(&pgood);
+	rc = gpio_read(&pgood,&gpio);
+	gpio_close(&pgood);
+	if(rc == GPIO_OK)
+	{
+		//if changed, set property and emit signal
+		if(gpio != control_power_get_pgood(control_power))
+		{
+			control_power_set_pgood(control_power,gpio);
+			if(gpio==0)
+			{
+				control_power_emit_power_lost(control_power);
+				control_emit_goto_system_state(control,"HOST_POWERED_OFF");
+				rc = gpio_open(&pcie_reset);
+				rc = gpio_write(&pcie_reset,0);
+				gpio_close(&pcie_reset);
+
+				rc = gpio_open(&usb_reset);
+				rc = gpio_write(&usb_reset,0);
+				gpio_close(&usb_reset);
+
+			}
+			else
+			{
+				control_power_emit_power_good(control_power);
+				control_emit_goto_system_state(control,"HOST_POWERED_ON");
+				rc = gpio_open(&pcie_reset);
+				rc = gpio_write(&pcie_reset,1);
+				gpio_close(&pcie_reset);
+
+				rc = gpio_open(&usb_reset);
+				rc = gpio_write(&usb_reset,1);
+				gpio_close(&usb_reset);
+			}
+		}
+	} else {
+		printf("ERROR PowerControl: GPIO read error (gpio=%s,rc=%d)\n",pgood.name,rc);
+		//return false so poll won't get called anymore
+		return FALSE;
+	}
+	//pgood is not at desired state yet
+	if(gpio != control_power_get_state(control_power) &&
+			control_power_get_pgood_timeout(control_power) > 0)
+	{
+		if(pgood_timeout_start == 0 ) {
+			pgood_timeout_start = current_time;
+		}
+	}
+	else
+	{
+		pgood_timeout_start = 0;
+	}
+	return TRUE;
+}
+
+static gboolean
+on_set_power_state(ControlPower *pwr,
+		GDBusMethodInvocation *invocation,
+		guint state,
+		gpointer user_data)
+{
+	Control* control = object_get_control((Object*)user_data);
+	const gchar* obj_path = g_dbus_object_get_object_path((GDBusObject*)user_data);
+	if(state > 1)
+	{
+		g_dbus_method_invocation_return_dbus_error(invocation,
+				"org.openbmc.ControlPower.Error.Failed",
+				"Invalid power state");
+		return TRUE;
+	}
+	// return from method call
+	control_power_complete_set_power_state(pwr,invocation);
+	if(state == control_power_get_state(pwr))
+	{
+		g_print("Power already at requested state: %d\n",state);
+	}
+	else
+	{
+		int error = 0;
+		do {
+			if(state == 1) {
+				control_emit_goto_system_state(control,"HOST_POWERING_ON");
+			} else {
+				control_emit_goto_system_state(control,"HOST_POWERING_OFF");
+			}
+			error = gpio_open(&power_pin);
+			if(error != GPIO_OK) { break;	}
+			error = gpio_write(&power_pin,!state);
+			if(error != GPIO_OK) { break;	}
+			gpio_close(&power_pin);
+			control_power_set_state(pwr,state);
+		} while(0);
+		if(error != GPIO_OK)
+		{
+			printf("ERROR PowerControl: GPIO set power state (rc=%d)\n",error);
+		}
+	}
+	return TRUE;
+}
+
+static gboolean
+on_init(Control *control,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	pgood_timeout_start = 0;
+	//guint poll_interval = control_get_poll_interval(control);
+	//g_timeout_add(poll_interval, poll_pgood, user_data);
+	control_complete_init(control,invocation);
+	return TRUE;
+}
+
+static gboolean
+on_get_power_state(ControlPower *pwr,
+		GDBusMethodInvocation *invocation,
+		gpointer user_data)
+{
+	guint pgood = control_power_get_pgood(pwr);
+	control_power_complete_get_power_state(pwr,invocation,pgood);
+	return TRUE;
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+	ObjectSkeleton *object;
+	cmdline *cmd = user_data;
+	if(cmd->argc < 3)
+	{
+		g_print("Usage: power_control.exe [poll interval] [timeout]\n");
+		return;
+	}
+	manager = g_dbus_object_manager_server_new(dbus_object_path);
+	gchar *s;
+	s = g_strdup_printf("%s/%s",dbus_object_path,instance_name);
+	object = object_skeleton_new(s);
+	g_free(s);
+
+	ControlPower* control_power = control_power_skeleton_new();
+	object_skeleton_set_control_power(object, control_power);
+	g_object_unref(control_power);
+
+	Control* control = control_skeleton_new();
+	object_skeleton_set_control(object, control);
+	g_object_unref(control);
+
+	ObjectMapper* mapper = object_mapper_skeleton_new();
+	object_skeleton_set_object_mapper(object, mapper);
+	g_object_unref(mapper);
+
+	//define method callbacks here
+	g_signal_connect(control_power,
+			"handle-set-power-state",
+			G_CALLBACK(on_set_power_state),
+			object); /* user_data */
+
+	g_signal_connect(control_power,
+			"handle-get-power-state",
+			G_CALLBACK(on_get_power_state),
+			NULL); /* user_data */
+
+	g_signal_connect(control,
+			"handle-init",
+			G_CALLBACK(on_init),
+			object); /* user_data */
+
+
+	/* Export the object (@manager takes its own reference to @object) */
+	g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+	g_object_unref(object);
+
+	/* Export all objects */
+	g_dbus_object_manager_server_set_connection(manager, connection);
+
+	// get gpio device paths
+	int rc = GPIO_OK;
+	do {
+		rc = gpio_init(connection,&power_pin);
+		if(rc != GPIO_OK) { break; }
+		rc = gpio_init(connection,&pgood);
+		if(rc != GPIO_OK) { break; }
+		rc = gpio_init(connection,&pcie_reset);
+		if(rc != GPIO_OK) { break; }
+		rc = gpio_init(connection,&usb_reset);
+		if(rc != GPIO_OK) { break; }
+
+		uint8_t gpio;
+		rc = gpio_open(&pgood);
+		if(rc != GPIO_OK) { break; }
+		rc = gpio_read(&pgood,&gpio);
+		if(rc != GPIO_OK) { break; }
+		gpio_close(&pgood);
+		control_power_set_pgood(control_power,gpio);
+		control_power_set_state(control_power,gpio);
+		printf("Pgood state: %d\n",gpio);
+
+	} while(0);
+	if(rc != GPIO_OK)
+	{
+		printf("ERROR PowerControl: GPIO setup (rc=%d)\n",rc);
+	}
+	//start poll
+	pgood_timeout_start = 0;
+	int poll_interval = atoi(cmd->argv[1]);
+	int pgood_timeout = atoi(cmd->argv[2]);
+	if(poll_interval < 1000 || pgood_timeout <5) {
+		printf("ERROR PowerControl: poll_interval < 1000 or pgood_timeout < 5\n");
+	} else {
+		control_set_poll_interval(control,poll_interval);
+		control_power_set_pgood_timeout(control_power,pgood_timeout);
+		g_timeout_add(poll_interval, poll_pgood, object);
+	}
+	emit_object_added((GDBusObjectManager*)manager);
+}
+
+static void
+on_name_acquired(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+		const gchar *name,
+		gpointer user_data)
+{
+}
+
+/*----------------------------------------------------------------*/
+/* Main Event Loop                                                */
+
+gint
+main(gint argc, gchar *argv[])
+{
+	GMainLoop *loop;
+	cmdline cmd;
+	cmd.argc = argc;
+	cmd.argv = argv;
+
+	guint id;
+	loop = g_main_loop_new(NULL, FALSE);
+
+	id = g_bus_own_name(DBUS_TYPE,
+			dbus_name,
+			G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+			G_BUS_NAME_OWNER_FLAGS_REPLACE,
+			on_bus_acquired,
+			on_name_acquired,
+			on_name_lost,
+			&cmd,
+			NULL);
+
+	g_main_loop_run(loop);
+
+	g_bus_unown_name(id);
+	g_main_loop_unref(loop);
+	return 0;
+}
-- 
2.8.1
