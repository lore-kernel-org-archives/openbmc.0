Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVmKK70fWzDqnV
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 00:41:09 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466088060952935.6531583565622;
 Thu, 16 Jun 2016 07:41:00 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v7 1/6] Add handling for checkstop gpio
Date: Thu, 16 Jun 2016 09:40:51 -0500
Message-Id: <20160616144056.17931-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616144056.17931-1-openbmc-patches@stwcx.xyz>
References: <20160616144056.17931-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 14:41:10 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add function to handle a checkstop gpio interrupt. Once interrupt
is received, wait an arbitrary time of 30s, and reboot the host
after that time if the gpio interrupt is still set and the system
state indicates the host is running.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 hostcheckstop/Makefile             |   3 +
 hostcheckstop/host_checkstop_obj.c | 202 +++++++++++++++++++++++++++++++++++++
 2 files changed, 205 insertions(+)
 create mode 100644 hostcheckstop/Makefile
 create mode 100644 hostcheckstop/host_checkstop_obj.c

diff --git a/hostcheckstop/Makefile b/hostcheckstop/Makefile
new file mode 100644
index 0000000..2d3b08d
--- /dev/null
+++ b/hostcheckstop/Makefile
@@ -0,0 +1,3 @@
+BINS=host_checkstop
+include ../gdbus.mk
+include ../rules.mk
diff --git a/hostcheckstop/host_checkstop_obj.c b/hostcheckstop/host_checkstop_obj.c
new file mode 100644
index 0000000..0d6d736
--- /dev/null
+++ b/hostcheckstop/host_checkstop_obj.c
@@ -0,0 +1,202 @@
+#include "interfaces/openbmc_intf.h"
+#include "openbmc.h"
+#include "gpio.h"
+
+static const gchar* dbus_object_path = "/org/openbmc/control";
+static const gchar* object_name = "/org/openbmc/control/checkstop0";
+static const gchar* dbus_name = "org.openbmc.control.Checkstop";
+
+static GDBusObjectManagerServer *manager = NULL;
+
+GPIO checkstop = (GPIO){ "CHECKSTOP" };
+
+static bool
+is_host_booted(GDBusConnection* connection)
+{
+    GDBusProxy *proxy;
+    GError *error;
+    GVariant *parm = NULL;
+    GVariant *result = NULL;
+
+    error = NULL;
+    proxy = g_dbus_proxy_new_sync(connection,
+            G_DBUS_PROXY_FLAGS_NONE,
+            NULL, /* GDBusInterfaceInfo* */
+            "org.openbmc.managers.System", /* name */
+            "/org/openbmc/managers/System", /* object path */
+            "org.openbmc.managers.System", /* interface name */
+            NULL, /* GCancellable */
+            &error);
+    g_assert_no_error(error);
+
+    error = NULL;
+    result = g_dbus_proxy_call_sync(proxy,
+            "getSystemState",
+            parm,
+            G_DBUS_CALL_FLAGS_NONE,
+            -1,
+            NULL,
+            &error);
+    g_assert_no_error(error);
+
+    gchar *system_state;
+    g_variant_get(result,"(s)",&system_state);
+    g_variant_unref(result);
+
+    if ((strcmp(system_state, "HOST_BOOTED") == 0) ||
+        (strcmp(system_state, "HOST_BOOTING")== 0)) {
+        return true;
+    }
+
+    return false;
+}
+
+static gboolean
+chassis_reboot(gpointer connection)
+{
+    int rc = 0;
+    uint8_t gpio = 0;
+    GDBusProxy *proxy;
+    GError *error;
+    GVariant *parm = NULL;
+    GVariant *result = NULL;
+
+    // The gpio line may flicker during power on/off, so check that the value
+    // is still 0 (checkstopped) and that host is booted in order to reboot
+    rc = gpio_open(&checkstop);
+    if (rc != GPIO_OK) {
+        return FALSE;
+    }
+    rc = gpio_read(&checkstop, &gpio);
+    if (rc != GPIO_OK) {
+        gpio_close(&checkstop);
+        return FALSE;
+    }
+    gpio_close(&checkstop);
+    if ((!gpio) && (is_host_booted(connection)))
+    {
+        printf("Host Checkstop, rebooting host\n");
+        error = NULL;
+        proxy = g_dbus_proxy_new_sync((GDBusConnection*)connection,
+            G_DBUS_PROXY_FLAGS_NONE,
+            NULL, /* GDBusInterfaceInfo* */
+            "org.openbmc.control.Chassis", /* name */
+            "/org/openbmc/control/chassis0", /* object path */
+            "org.openbmc.control.Chassis", /* interface name */
+            NULL, /* GCancellable */
+            &error);
+        g_assert_no_error(error);
+
+        error = NULL;
+        result = g_dbus_proxy_call_sync(proxy,
+            "reboot",
+            parm,
+            G_DBUS_CALL_FLAGS_NONE,
+            -1,
+            NULL,
+            &error);
+        g_assert_no_error(error);
+    }
+
+    return FALSE;
+}
+
+static gboolean
+on_checkstop_interrupt(GIOChannel *channel,
+        GIOCondition condition,
+        gpointer connection)
+{
+    GError *error = 0;
+    gsize bytes_read = 0;
+    gchar buf[2];
+    buf[1] = '\0';
+
+    g_io_channel_seek_position( channel, 0, G_SEEK_SET, 0 );
+    g_io_channel_read_chars(channel,
+            buf, 1,
+            &bytes_read,
+            &error );
+    printf("checkstop gpio: %s\n",buf);
+
+    if(checkstop.irq_inited) {
+        // Need to wait at least 10s for the SBE to gather failure data.
+        // Also the user may be monitoring the system and reset the system
+        // themselves. So wait an arbitrary time of 30s (and check that the
+        // gpio value is still 0) before issuing reboot.
+        g_timeout_add(30000, chassis_reboot, connection);
+    }
+    else {
+        checkstop.irq_inited = true;
+    }
+
+    return TRUE;
+}
+
+static void
+on_bus_acquired(GDBusConnection *connection,
+        const gchar *name,
+        gpointer object)
+{
+    int rc = GPIO_OK;
+    manager = g_dbus_object_manager_server_new(dbus_object_path);
+
+    ControlCheckstop* control_checkstop = control_checkstop_skeleton_new();
+    object_skeleton_set_control_checkstop(object, control_checkstop);
+    g_object_unref(control_checkstop);
+
+    g_dbus_object_manager_server_set_connection(manager, connection);
+
+    rc = gpio_init(connection, &checkstop);
+    if (rc == GPIO_OK) {
+        rc = gpio_open_interrupt(&checkstop, on_checkstop_interrupt, connection);
+    }
+    if (rc != GPIO_OK) {
+        printf("ERROR Checkstop: GPIO setup (rc=%d)\n", rc);
+    }
+}
+
+static void
+on_name_acquired(GDBusConnection *connection,
+        const gchar *name,
+        gpointer object)
+{
+    g_dbus_object_manager_server_export(manager, G_DBUS_OBJECT_SKELETON(object));
+}
+
+static void
+on_name_lost(GDBusConnection *connection,
+        const gchar *name,
+        gpointer object)
+{
+    g_dbus_object_manager_server_unexport(manager, dbus_object_path);
+}
+
+gint
+main(gint argc, gchar *argv[])
+{
+    GMainLoop *loop;
+    ObjectSkeleton *newobject;
+
+    newobject = object_skeleton_new(object_name);
+
+    guint id;
+    loop = g_main_loop_new(NULL, FALSE);
+
+    id = g_bus_own_name(DBUS_TYPE,
+            dbus_name,
+            G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT |
+            G_BUS_NAME_OWNER_FLAGS_REPLACE,
+            on_bus_acquired,
+            on_name_acquired,
+            on_name_lost,
+            newobject,
+            NULL);
+
+    g_main_loop_run(loop);
+
+    g_bus_unown_name(id);
+    g_object_unref(newobject);
+    g_main_loop_unref(loop);
+    return 0;
+}
+
-- 
2.8.4
