Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 003FC1A1023
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 10:56:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gPeqvFu5; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id e65so13872732pfe.0
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2016 15:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=uIdYbN5osj1OUSpxTb/teF5buSutJP92gr5u3rwD8jU=;
 b=gPeqvFu5Mq4KVZH+3ujQTTyGaS2nkJXGNKcq4+QYrsrO829tGyctXii4l2mLuOIhxq
 JRn4ncRUvCZ/dH2jYQtuc2fh4VGiIyy6IUHs2mgqJkMTQp2ODtyzRGiNv8y/7P1kCpKn
 pJ9e+CArkzEv/7/svIIznmA56B4JGh0Witf4mx2z98yZ85SFASyVtmtguLgBBaZsL/lY
 kGiOHYCPt8KyKvC+qBlYsUT7xRoia3Yj2SrVTSyY4BxsS6bQlPzaLRt3LVwFakkq8qC4
 83Jltvb1dYIh0tNprSg55Nn7SV3eV8KNuHJz8x73UgXdW7vwz/MXfmtUneVtuW5YVxYn
 aK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=uIdYbN5osj1OUSpxTb/teF5buSutJP92gr5u3rwD8jU=;
 b=E9ByhVy4s/a6HlyNncFUT+G4xMhFsTz5KzEFcV1+Ozn/1nU+zYJ4xQJHzVShf/gthi
 a2wqbUMywRYbJufQUgsP/80BTIF1tLc9AJbm07ymakQEwQ4mZOO7z93k99Ne3SPRrENF
 gE5JU4q/mwxHlIszcFA+GqPBR8zux4sLYCLCefxEr35Nj3u2RZ09BcKE0Smd2fsDE+eg
 SjGP0iex2BaxHxgVKOJzWBlwELlMQ3/L7kLFINEQ05CXLwGKL/qZGeAqeTCXpu2MAjv7
 WXYQOCyq/7ekhF14rkL2yOvn1DGm7AolcBefxqzi5kBNQzu+tXBfYGM9pvc7ztklZNRl
 oZAg==
X-Gm-Message-State: ALoCoQkA245pINcB73zLXdA/ailmD/VMBKJ/jmnTruW24xVRy3KZcPt9ILgtqvwyLwvKh5QSbS6Tf98Rwyl1m/zkUKe/d7IzIw==
X-Received: by 10.98.70.90 with SMTP id t87mr48229259pfa.110.1453247809380;
 Tue, 19 Jan 2016 15:56:49 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id g10sm43968595pfd.49.2016.01.19.15.56.47
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 19 Jan 2016 15:56:49 -0800 (PST)
Date: Wed, 20 Jan 2016 10:56:39 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, William <bjlinan@cn.ibm.com>
Subject: Re: [PATCH skeleton] skeleton: Add BMC coldReset() method to
 org.openbmc.control.Bmc dbus interface
Message-ID: <20160120105639.74309c70@camb691>
In-Reply-To: <1453178436-26125-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453178436-26125-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453178436-26125-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.1 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 19 Jan 2016 23:56:54 -0000

On Mon, 18 Jan 2016 22:40:36 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: William <bjlinan@cn.ibm.com>
> 

Hi William,

Is there a reason you're using glib? I was under the impression that the
preferred dbus library was sd_bus. I suppose this is in openbmc/skeleton so it
is destined to be rewritten in which case I don't have too much of and issue
with glib for now.

I do have one concern below.

> The host sends IPMI 'cold reset' command to reset BMC. Ipmid
> calls the org.openbmc.control.Bmc::coldReset() to do reset.
> coldReset() just invokes "reboot --force", which in effect
> same as a 'cold' reset.
> 
> Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
> ---
>  interfaces/openbmc_intf.c | 56 +++++++++++++++++++++++------------------------
>  interfaces/openbmc_intf.h | 10 ++++-----
>  objects/control_bmc_obj.c | 37 ++++++++++++++++++++++++++-----
>  xml/openbmc_intf.xml      |  2 +-
>  4 files changed, 66 insertions(+), 39 deletions(-)
> 
> diff --git a/interfaces/openbmc_intf.c b/interfaces/openbmc_intf.c
> index 1619115..913ccc7 100644
> --- a/interfaces/openbmc_intf.c
> +++ b/interfaces/openbmc_intf.c
> @@ -14419,22 +14419,22 @@ control_skeleton_new (void)
>  
>  /* ---- Introspection data for org.openbmc.control.Bmc ---- */
>  
> -static const _ExtendedGDBusMethodInfo _control_bmc_method_info_place_holder =
> +static const _ExtendedGDBusMethodInfo _control_bmc_method_info_cold_reset =
>  {
>    {
>      -1,
> -    (gchar *) "place_holder",
> +    (gchar *) "coldReset",
>      NULL,
>      NULL,
>      NULL
>    },
> -  "handle-place-holder",
> +  "handle-cold-reset",
>    FALSE
>  };
>  
>  static const _ExtendedGDBusMethodInfo * const _control_bmc_method_info_pointers[] =
>  {
> -  &_control_bmc_method_info_place_holder,
> +  &_control_bmc_method_info_cold_reset,
>    NULL
>  };
>  
> @@ -14492,7 +14492,7 @@ control_bmc_override_properties (GObjectClass *klass, guint property_id_begin)
>  /**
>   * ControlBmcIface:
>   * @parent_iface: The parent interface.
> - * @handle_place_holder: Handler for the #ControlBmc::handle-place-holder signal.
> + * @handle_cold_reset: Handler for the #ControlBmc::handle-cold-reset signal.
>   *
>   * Virtual table for the D-Bus interface <link linkend="gdbus-interface-org-openbmc-control-Bmc.top_of_page">org.openbmc.control.Bmc</link>.
>   */
> @@ -14505,20 +14505,20 @@ control_bmc_default_init (ControlBmcIface *iface)
>  {
>    /* GObject signals for incoming D-Bus method calls: */
>    /**
> -   * ControlBmc::handle-place-holder:
> +   * ControlBmc::handle-cold-reset:
>     * @object: A #ControlBmc.
>     * @invocation: A #GDBusMethodInvocation.
>     *
> -   * Signal emitted when a remote caller is invoking the <link linkend="gdbus-method-org-openbmc-control-Bmc.place_holder">place_holder()</link> D-Bus method.
> +   * Signal emitted when a remote caller is invoking the <link linkend="gdbus-method-org-openbmc-control-Bmc.coldReset">coldReset()</link> D-Bus method.
>     *
> -   * If a signal handler returns %TRUE, it means the signal handler will handle the invocation (e.g. take a reference to @invocation and eventually call control_bmc_complete_place_holder() or e.g. g_dbus_method_invocation_return_error() on it) and no order signal handlers will run. If no signal handler handles the invocation, the %G_DBUS_ERROR_UNKNOWN_METHOD error is returned.
> +   * If a signal handler returns %TRUE, it means the signal handler will handle the invocation (e.g. take a reference to @invocation and eventually call control_bmc_complete_cold_reset() or e.g. g_dbus_method_invocation_return_error() on it) and no order signal handlers will run. If no signal handler handles the invocation, the %G_DBUS_ERROR_UNKNOWN_METHOD error is returned.
>     *
>     * Returns: %TRUE if the invocation was handled, %FALSE to let other signal handlers run.
>     */
> -  g_signal_new ("handle-place-holder",
> +  g_signal_new ("handle-cold-reset",
>      G_TYPE_FROM_INTERFACE (iface),
>      G_SIGNAL_RUN_LAST,
> -    G_STRUCT_OFFSET (ControlBmcIface, handle_place_holder),
> +    G_STRUCT_OFFSET (ControlBmcIface, handle_cold_reset),
>      g_signal_accumulator_true_handled,
>      NULL,
>      g_cclosure_marshal_generic,
> @@ -14529,27 +14529,27 @@ control_bmc_default_init (ControlBmcIface *iface)
>  }
>  
>  /**
> - * control_bmc_call_place_holder:
> + * control_bmc_call_cold_reset:
>   * @proxy: A #ControlBmcProxy.
>   * @cancellable: (allow-none): A #GCancellable or %NULL.
>   * @callback: A #GAsyncReadyCallback to call when the request is satisfied or %NULL.
>   * @user_data: User data to pass to @callback.
>   *
> - * Asynchronously invokes the <link linkend="gdbus-method-org-openbmc-control-Bmc.place_holder">place_holder()</link> D-Bus method on @proxy.
> + * Asynchronously invokes the <link linkend="gdbus-method-org-openbmc-control-Bmc.coldReset">coldReset()</link> D-Bus method on @proxy.
>   * When the operation is finished, @callback will be invoked in the <link linkend="g-main-context-push-thread-default">thread-default main loop</link> of the thread you are calling this method from.
> - * You can then call control_bmc_call_place_holder_finish() to get the result of the operation.
> + * You can then call control_bmc_call_cold_reset_finish() to get the result of the operation.
>   *
> - * See control_bmc_call_place_holder_sync() for the synchronous, blocking version of this method.
> + * See control_bmc_call_cold_reset_sync() for the synchronous, blocking version of this method.
>   */
>  void
> -control_bmc_call_place_holder (
> +control_bmc_call_cold_reset (
>      ControlBmc *proxy,
>      GCancellable *cancellable,
>      GAsyncReadyCallback callback,
>      gpointer user_data)
>  {
>    g_dbus_proxy_call (G_DBUS_PROXY (proxy),
> -    "place_holder",
> +    "coldReset",
>      g_variant_new ("()"),
>      G_DBUS_CALL_FLAGS_NONE,
>      -1,
> @@ -14559,17 +14559,17 @@ control_bmc_call_place_holder (
>  }
>  
>  /**
> - * control_bmc_call_place_holder_finish:
> + * control_bmc_call_cold_reset_finish:
>   * @proxy: A #ControlBmcProxy.
> - * @res: The #GAsyncResult obtained from the #GAsyncReadyCallback passed to control_bmc_call_place_holder().
> + * @res: The #GAsyncResult obtained from the #GAsyncReadyCallback passed to control_bmc_call_cold_reset().
>   * @error: Return location for error or %NULL.
>   *
> - * Finishes an operation started with control_bmc_call_place_holder().
> + * Finishes an operation started with control_bmc_call_cold_reset().
>   *
>   * Returns: (skip): %TRUE if the call succeded, %FALSE if @error is set.
>   */
>  gboolean
> -control_bmc_call_place_holder_finish (
> +control_bmc_call_cold_reset_finish (
>      ControlBmc *proxy,
>      GAsyncResult *res,
>      GError **error)
> @@ -14586,26 +14586,26 @@ _out:
>  }
>  
>  /**
> - * control_bmc_call_place_holder_sync:
> + * control_bmc_call_cold_reset_sync:
>   * @proxy: A #ControlBmcProxy.
>   * @cancellable: (allow-none): A #GCancellable or %NULL.
>   * @error: Return location for error or %NULL.
>   *
> - * Synchronously invokes the <link linkend="gdbus-method-org-openbmc-control-Bmc.place_holder">place_holder()</link> D-Bus method on @proxy. The calling thread is blocked until a reply is received.
> + * Synchronously invokes the <link linkend="gdbus-method-org-openbmc-control-Bmc.coldReset">coldReset()</link> D-Bus method on @proxy. The calling thread is blocked until a reply is received.
>   *
> - * See control_bmc_call_place_holder() for the asynchronous version of this method.
> + * See control_bmc_call_cold_reset() for the asynchronous version of this method.
>   *
>   * Returns: (skip): %TRUE if the call succeded, %FALSE if @error is set.
>   */
>  gboolean
> -control_bmc_call_place_holder_sync (
> +control_bmc_call_cold_reset_sync (
>      ControlBmc *proxy,
>      GCancellable *cancellable,
>      GError **error)
>  {
>    GVariant *_ret;
>    _ret = g_dbus_proxy_call_sync (G_DBUS_PROXY (proxy),
> -    "place_holder",
> +    "coldReset",
>      g_variant_new ("()"),
>      G_DBUS_CALL_FLAGS_NONE,
>      -1,
> @@ -14621,16 +14621,16 @@ _out:
>  }
>  
>  /**
> - * control_bmc_complete_place_holder:
> + * control_bmc_complete_cold_reset:
>   * @object: A #ControlBmc.
>   * @invocation: (transfer full): A #GDBusMethodInvocation.
>   *
> - * Helper function used in service implementations to finish handling invocations of the <link linkend="gdbus-method-org-openbmc-control-Bmc.place_holder">place_holder()</link> D-Bus method. If you instead want to finish handling an invocation by returning an error, use g_dbus_method_invocation_return_error() or similar.
> + * Helper function used in service implementations to finish handling invocations of the <link linkend="gdbus-method-org-openbmc-control-Bmc.coldReset">coldReset()</link> D-Bus method. If you instead want to finish handling an invocation by returning an error, use g_dbus_method_invocation_return_error() or similar.
>   *
>   * This method will free @invocation, you cannot use it afterwards.
>   */
>  void
> -control_bmc_complete_place_holder (
> +control_bmc_complete_cold_reset (
>      ControlBmc *object,
>      GDBusMethodInvocation *invocation)
>  {
> diff --git a/interfaces/openbmc_intf.h b/interfaces/openbmc_intf.h
> index bb71e45..4d0801c 100644
> --- a/interfaces/openbmc_intf.h
> +++ b/interfaces/openbmc_intf.h
> @@ -1850,7 +1850,7 @@ struct _ControlBmcIface
>  {
>    GTypeInterface parent_iface;
>  
> -  gboolean (*handle_place_holder) (
> +  gboolean (*handle_cold_reset) (
>      ControlBmc *object,
>      GDBusMethodInvocation *invocation);
>  
> @@ -1863,25 +1863,25 @@ guint control_bmc_override_properties (GObjectClass *klass, guint property_id_be
>  
>  
>  /* D-Bus method call completion functions: */
> -void control_bmc_complete_place_holder (
> +void control_bmc_complete_cold_reset (
>      ControlBmc *object,
>      GDBusMethodInvocation *invocation);
>  
>  
>  
>  /* D-Bus method calls: */
> -void control_bmc_call_place_holder (
> +void control_bmc_call_cold_reset (
>      ControlBmc *proxy,
>      GCancellable *cancellable,
>      GAsyncReadyCallback callback,
>      gpointer user_data);
>  
> -gboolean control_bmc_call_place_holder_finish (
> +gboolean control_bmc_call_cold_reset_finish (
>      ControlBmc *proxy,
>      GAsyncResult *res,
>      GError **error);
>  
> -gboolean control_bmc_call_place_holder_sync (
> +gboolean control_bmc_call_cold_reset_sync (
>      ControlBmc *proxy,
>      GCancellable *cancellable,
>      GError **error);
> diff --git a/objects/control_bmc_obj.c b/objects/control_bmc_obj.c
> index 6b92235..818b063 100644
> --- a/objects/control_bmc_obj.c
> +++ b/objects/control_bmc_obj.c
> @@ -67,7 +67,6 @@ void reg_init()
>  
>  	//UART
>  
> -	
>  	bmcreg = memmap(mem_fd,UART_BASE);
>  	devmem(bmcreg+0x00,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
>  	devmem(bmcreg+0x04,0x00000000);  //Set Baud rate divisor -> 13 (Baud 115200)
> @@ -109,9 +108,31 @@ on_init (Control          *control,
>  	//#endif
>  	control_complete_init(control,invocation);
>  	//control_emit_goto_system_state(control,"BMC_STARTING");
> -	
>  	return TRUE;
>  }
> +
> +static gboolean
> +on_cold_reset (ControlBmc	*bmc,
> +         GDBusMethodInvocation	*invocation,
> +         gpointer		user_data)
> +{
> +	GError *err = NULL;
> +	/* Wait a while before reboot, so the caller can be responded.
> +	 * Note that g_spawn_command_line_async() cannot parse ';' as
> +	 * a command separator. Need to use 'sh -c' to let shell parse it.
> +	 */
> +	gchar *reboot_command = "/bin/sh -c 'sleep 3;reboot --force'";

This doesn't seem like a good idea, I'm not exactly sure how
g_spawn_command_line_async() works but calling out to the shell to reboot(2)
doesn't seem like the best way of going about things.

Also, sleep 3; is probably fine all of the time but it doesn't actually provide
any guarantee that on_cold_reset() will ever return, it looks like there's a
(however unlikely) race here.

Again, I consider just ignoring these issues for now since I believe this code
is going to be replaced, however, this is starting to differ greatly from what
the finished product will be.

If this code is being put here to exercise these codepathes and not just for the
bare requirement of bringing up a machine, it would be good if it looked more
like the finished product.


Cheers,

Cyril
> +
> +	g_spawn_command_line_async(reboot_command, &err);
> +	if (err != NULL) {
> +		fprintf(stderr, "coldReset() error: %s\n", err->message);
> +		g_error_free(err);
> +	}
> +
> +	control_bmc_complete_cold_reset(bmc, invocation);
> +	return TRUE;
> +}
> +
>  gboolean go(gpointer user_data)
>  {
>   	cmdline *cmd = user_data;
> @@ -124,8 +145,8 @@ gboolean go(gpointer user_data)
>  	//g_main_loop_quit(cmd->loop);
>  	return FALSE;
>  }
> -
> -static void 
> +
> +static void
>  on_bus_acquired (GDBusConnection *connection,
>                   const gchar     *name,
>                   gpointer         user_data)
> @@ -153,6 +174,12 @@ on_bus_acquired (GDBusConnection *connection,
>                 	    G_CALLBACK (on_init),
>                 	    NULL); /* user_data */
>  
> +
> +	g_signal_connect (control_bmc,
> +		"handle-cold-reset",
> +		G_CALLBACK (on_cold_reset),
> +		NULL); /* user_data */
> +
>  	/* Export the object (@manager takes its own reference to @object) */
>  	g_dbus_object_manager_server_export (manager, G_DBUS_OBJECT_SKELETON (object));
>  	g_object_unref (object);
> @@ -210,7 +237,7 @@ main (gint argc, gchar *argv[])
>                         NULL);
>  
>    g_main_loop_run (loop);
> -  
> +
>    g_bus_unown_name (id);
>    g_main_loop_unref (loop);
>    return 0;
> diff --git a/xml/openbmc_intf.xml b/xml/openbmc_intf.xml
> index 791fc48..6099599 100644
> --- a/xml/openbmc_intf.xml
> +++ b/xml/openbmc_intf.xml
> @@ -107,7 +107,7 @@
>  		<signal name="Started"/>
>  	</interface>
>  	<interface name="org.openbmc.control.Bmc">
> -		<method name="place_holder"/>
> +		<method name="coldReset"/>
>  	</interface>
>  	<interface name="org.openbmc.control.Host">
>  		<method name="boot"/>
