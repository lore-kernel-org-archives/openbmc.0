Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3C1AA1A0037
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2016 15:40:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453178438401138.10009788118953;
 Mon, 18 Jan 2016 20:40:38 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: William <bjlinan@cn.ibm.com>
Subject: [PATCH skeleton] skeleton: Add BMC coldReset() method to
 org.openbmc.control.Bmc dbus interface
Date: Mon, 18 Jan 2016 22:40:36 -0600
Message-Id: <1453178436-26125-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453178436-26125-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453178436-26125-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 19 Jan 2016 04:40:46 -0000

From: William <bjlinan@cn.ibm.com>

The host sends IPMI 'cold reset' command to reset BMC. Ipmid
calls the org.openbmc.control.Bmc::coldReset() to do reset.
coldReset() just invokes "reboot --force", which in effect
same as a 'cold' reset.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
---
 interfaces/openbmc_intf.c | 56 +++++++++++++++++++++++------------------------
 interfaces/openbmc_intf.h | 10 ++++-----
 objects/control_bmc_obj.c | 37 ++++++++++++++++++++++++++-----
 xml/openbmc_intf.xml      |  2 +-
 4 files changed, 66 insertions(+), 39 deletions(-)

diff --git a/interfaces/openbmc_intf.c b/interfaces/openbmc_intf.c
index 1619115..913ccc7 100644
--- a/interfaces/openbmc_intf.c
+++ b/interfaces/openbmc_intf.c
@@ -14419,22 +14419,22 @@ control_skeleton_new (void)
 
 /* ---- Introspection data for org.openbmc.control.Bmc ---- */
 
-static const _ExtendedGDBusMethodInfo _control_bmc_method_info_place_holder =
+static const _ExtendedGDBusMethodInfo _control_bmc_method_info_cold_reset =
 {
   {
     -1,
-    (gchar *) "place_holder",
+    (gchar *) "coldReset",
     NULL,
     NULL,
     NULL
   },
-  "handle-place-holder",
+  "handle-cold-reset",
   FALSE
 };
 
 static const _ExtendedGDBusMethodInfo * const _control_bmc_method_info_pointers[] =
 {
-  &_control_bmc_method_info_place_holder,
+  &_control_bmc_method_info_cold_reset,
   NULL
 };
 
@@ -14492,7 +14492,7 @@ control_bmc_override_properties (GObjectClass *klass, guint property_id_begin)
 /**
  * ControlBmcIface:
  * @parent_iface: The parent interface.
- * @handle_place_holder: Handler for the #ControlBmc::handle-place-holder signal.
+ * @handle_cold_reset: Handler for the #ControlBmc::handle-cold-reset signal.
  *
  * Virtual table for the D-Bus interface <link linkend="gdbus-interface-org-openbmc-control-Bmc.top_of_page">org.openbmc.control.Bmc</link>.
  */
@@ -14505,20 +14505,20 @@ control_bmc_default_init (ControlBmcIface *iface)
 {
   /* GObject signals for incoming D-Bus method calls: */
   /**
-   * ControlBmc::handle-place-holder:
+   * ControlBmc::handle-cold-reset:
    * @object: A #ControlBmc.
    * @invocation: A #GDBusMethodInvocation.
    *
-   * Signal emitted when a remote caller is invoking the <link linkend="gdbus-method-org-openbmc-control-Bmc.place_holder">place_holder()</link> D-Bus method.
+   * Signal emitted when a remote caller is invoking the <link linkend="gdbus-method-org-openbmc-control-Bmc.coldReset">coldReset()</link> D-Bus method.
    *
-   * If a signal handler returns %TRUE, it means the signal handler will handle the invocation (e.g. take a reference to @invocation and eventually call control_bmc_complete_place_holder() or e.g. g_dbus_method_invocation_return_error() on it) and no order signal handlers will run. If no signal handler handles the invocation, the %G_DBUS_ERROR_UNKNOWN_METHOD error is returned.
+   * If a signal handler returns %TRUE, it means the signal handler will handle the invocation (e.g. take a reference to @invocation and eventually call control_bmc_complete_cold_reset() or e.g. g_dbus_method_invocation_return_error() on it) and no order signal handlers will run. If no signal handler handles the invocation, the %G_DBUS_ERROR_UNKNOWN_METHOD error is returned.
    *
    * Returns: %TRUE if the invocation was handled, %FALSE to let other signal handlers run.
    */
-  g_signal_new ("handle-place-holder",
+  g_signal_new ("handle-cold-reset",
     G_TYPE_FROM_INTERFACE (iface),
     G_SIGNAL_RUN_LAST,
-    G_STRUCT_OFFSET (ControlBmcIface, handle_place_holder),
+    G_STRUCT_OFFSET (ControlBmcIface, handle_cold_reset),
     g_signal_accumulator_true_handled,
     NULL,
     g_cclosure_marshal_generic,
@@ -14529,27 +14529,27 @@ control_bmc_default_init (ControlBmcIface *iface)
 }
 
 /**
- * control_bmc_call_place_holder:
+ * control_bmc_call_cold_reset:
  * @proxy: A #ControlBmcProxy.
  * @cancellable: (allow-none): A #GCancellable or %NULL.
  * @callback: A #GAsyncReadyCallback to call when the request is satisfied or %NULL.
  * @user_data: User data to pass to @callback.
  *
- * Asynchronously invokes the <link linkend="gdbus-method-org-openbmc-control-Bmc.place_holder">place_holder()</link> D-Bus method on @proxy.
+ * Asynchronously invokes the <link linkend="gdbus-method-org-openbmc-control-Bmc.coldReset">coldReset()</link> D-Bus method on @proxy.
  * When the operation is finished, @callback will be invoked in the <link linkend="g-main-context-push-thread-default">thread-default main loop</link> of the thread you are calling this method from.
- * You can then call control_bmc_call_place_holder_finish() to get the result of the operation.
+ * You can then call control_bmc_call_cold_reset_finish() to get the result of the operation.
  *
- * See control_bmc_call_place_holder_sync() for the synchronous, blocking version of this method.
+ * See control_bmc_call_cold_reset_sync() for the synchronous, blocking version of this method.
  */
 void
-control_bmc_call_place_holder (
+control_bmc_call_cold_reset (
     ControlBmc *proxy,
     GCancellable *cancellable,
     GAsyncReadyCallback callback,
     gpointer user_data)
 {
   g_dbus_proxy_call (G_DBUS_PROXY (proxy),
-    "place_holder",
+    "coldReset",
     g_variant_new ("()"),
     G_DBUS_CALL_FLAGS_NONE,
     -1,
@@ -14559,17 +14559,17 @@ control_bmc_call_place_holder (
 }
 
 /**
- * control_bmc_call_place_holder_finish:
+ * control_bmc_call_cold_reset_finish:
  * @proxy: A #ControlBmcProxy.
- * @res: The #GAsyncResult obtained from the #GAsyncReadyCallback passed to control_bmc_call_place_holder().
+ * @res: The #GAsyncResult obtained from the #GAsyncReadyCallback passed to control_bmc_call_cold_reset().
  * @error: Return location for error or %NULL.
  *
- * Finishes an operation started with control_bmc_call_place_holder().
+ * Finishes an operation started with control_bmc_call_cold_reset().
  *
  * Returns: (skip): %TRUE if the call succeded, %FALSE if @error is set.
  */
 gboolean
-control_bmc_call_place_holder_finish (
+control_bmc_call_cold_reset_finish (
     ControlBmc *proxy,
     GAsyncResult *res,
     GError **error)
@@ -14586,26 +14586,26 @@ _out:
 }
 
 /**
- * control_bmc_call_place_holder_sync:
+ * control_bmc_call_cold_reset_sync:
  * @proxy: A #ControlBmcProxy.
  * @cancellable: (allow-none): A #GCancellable or %NULL.
  * @error: Return location for error or %NULL.
  *
- * Synchronously invokes the <link linkend="gdbus-method-org-openbmc-control-Bmc.place_holder">place_holder()</link> D-Bus method on @proxy. The calling thread is blocked until a reply is received.
+ * Synchronously invokes the <link linkend="gdbus-method-org-openbmc-control-Bmc.coldReset">coldReset()</link> D-Bus method on @proxy. The calling thread is blocked until a reply is received.
  *
- * See control_bmc_call_place_holder() for the asynchronous version of this method.
+ * See control_bmc_call_cold_reset() for the asynchronous version of this method.
  *
  * Returns: (skip): %TRUE if the call succeded, %FALSE if @error is set.
  */
 gboolean
-control_bmc_call_place_holder_sync (
+control_bmc_call_cold_reset_sync (
     ControlBmc *proxy,
     GCancellable *cancellable,
     GError **error)
 {
   GVariant *_ret;
   _ret = g_dbus_proxy_call_sync (G_DBUS_PROXY (proxy),
-    "place_holder",
+    "coldReset",
     g_variant_new ("()"),
     G_DBUS_CALL_FLAGS_NONE,
     -1,
@@ -14621,16 +14621,16 @@ _out:
 }
 
 /**
- * control_bmc_complete_place_holder:
+ * control_bmc_complete_cold_reset:
  * @object: A #ControlBmc.
  * @invocation: (transfer full): A #GDBusMethodInvocation.
  *
- * Helper function used in service implementations to finish handling invocations of the <link linkend="gdbus-method-org-openbmc-control-Bmc.place_holder">place_holder()</link> D-Bus method. If you instead want to finish handling an invocation by returning an error, use g_dbus_method_invocation_return_error() or similar.
+ * Helper function used in service implementations to finish handling invocations of the <link linkend="gdbus-method-org-openbmc-control-Bmc.coldReset">coldReset()</link> D-Bus method. If you instead want to finish handling an invocation by returning an error, use g_dbus_method_invocation_return_error() or similar.
  *
  * This method will free @invocation, you cannot use it afterwards.
  */
 void
-control_bmc_complete_place_holder (
+control_bmc_complete_cold_reset (
     ControlBmc *object,
     GDBusMethodInvocation *invocation)
 {
diff --git a/interfaces/openbmc_intf.h b/interfaces/openbmc_intf.h
index bb71e45..4d0801c 100644
--- a/interfaces/openbmc_intf.h
+++ b/interfaces/openbmc_intf.h
@@ -1850,7 +1850,7 @@ struct _ControlBmcIface
 {
   GTypeInterface parent_iface;
 
-  gboolean (*handle_place_holder) (
+  gboolean (*handle_cold_reset) (
     ControlBmc *object,
     GDBusMethodInvocation *invocation);
 
@@ -1863,25 +1863,25 @@ guint control_bmc_override_properties (GObjectClass *klass, guint property_id_be
 
 
 /* D-Bus method call completion functions: */
-void control_bmc_complete_place_holder (
+void control_bmc_complete_cold_reset (
     ControlBmc *object,
     GDBusMethodInvocation *invocation);
 
 
 
 /* D-Bus method calls: */
-void control_bmc_call_place_holder (
+void control_bmc_call_cold_reset (
     ControlBmc *proxy,
     GCancellable *cancellable,
     GAsyncReadyCallback callback,
     gpointer user_data);
 
-gboolean control_bmc_call_place_holder_finish (
+gboolean control_bmc_call_cold_reset_finish (
     ControlBmc *proxy,
     GAsyncResult *res,
     GError **error);
 
-gboolean control_bmc_call_place_holder_sync (
+gboolean control_bmc_call_cold_reset_sync (
     ControlBmc *proxy,
     GCancellable *cancellable,
     GError **error);
diff --git a/objects/control_bmc_obj.c b/objects/control_bmc_obj.c
index 6b92235..818b063 100644
--- a/objects/control_bmc_obj.c
+++ b/objects/control_bmc_obj.c
@@ -67,7 +67,6 @@ void reg_init()
 
 	//UART
 
-	
 	bmcreg = memmap(mem_fd,UART_BASE);
 	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
 	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
@@ -109,9 +108,31 @@ on_init (Control          *control,
 	//#endif
 	control_complete_init(control,invocation);
 	//control_emit_goto_system_state(control,"BMC_STARTING");
-	
 	return TRUE;
 }
+
+static gboolean
+on_cold_reset (ControlBmc	*bmc,
+         GDBusMethodInvocation	*invocation,
+         gpointer		user_data)
+{
+	GError *err = NULL;
+	/* Wait a while before reboot, so the caller can be responded.
+	 * Note that g_spawn_command_line_async() cannot parse ';' as
+	 * a command separator. Need to use 'sh -c' to let shell parse it.
+	 */
+	gchar *reboot_command = "/bin/sh -c 'sleep 3;reboot --force'";
+
+	g_spawn_command_line_async(reboot_command, &err);
+	if (err != NULL) {
+		fprintf(stderr, "coldReset() error: %s\n", err->message);
+		g_error_free(err);
+	}
+
+	control_bmc_complete_cold_reset(bmc, invocation);
+	return TRUE;
+}
+
 gboolean go(gpointer user_data)
 {
  	cmdline *cmd = user_data;
@@ -124,8 +145,8 @@ gboolean go(gpointer user_data)
 	//g_main_loop_quit(cmd->loop);
 	return FALSE;
 }
-
-static void 
+
+static void
 on_bus_acquired (GDBusConnection *connection,
                  const gchar     *name,
                  gpointer         user_data)
@@ -153,6 +174,12 @@ on_bus_acquired (GDBusConnection *connection,
                	    G_CALLBACK (on_init),
                	    NULL); /* user_data */
 
+
+	g_signal_connect (control_bmc,
+		"handle-cold-reset",
+		G_CALLBACK (on_cold_reset),
+		NULL); /* user_data */
+
 	/* Export the object (@manager takes its own reference to @object) */
 	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
 	g_object_unref (object);
@@ -210,7 +237,7 @@ main (gint argc, gchar *argv[])
                        NULL);
 
   g_main_loop_run (loop);
-  
+
   g_bus_unown_name (id);
   g_main_loop_unref (loop);
   return 0;
diff --git a/xml/openbmc_intf.xml b/xml/openbmc_intf.xml
index 791fc48..6099599 100644
--- a/xml/openbmc_intf.xml
+++ b/xml/openbmc_intf.xml
@@ -107,7 +107,7 @@
 		<signal name="Started"/>
 	</interface>
 	<interface name="org.openbmc.control.Bmc">
-		<method name="place_holder"/>
+		<method name="coldReset"/>
 	</interface>
 	<interface name="org.openbmc.control.Host">
 		<method name="boot"/>
-- 
2.6.4
