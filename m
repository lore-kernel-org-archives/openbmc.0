Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B7B1A065B
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 04:48:16 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444758492437185.2271022904588;
 Tue, 13 Oct 2015 10:48:12 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 1/8] Convert to SDBus
Date: Tue, 13 Oct 2015 12:48:00 -0500
Message-Id: <1444758487-9135-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444758487-9135-1-git-send-email-patches@stwcx.xyz>
References: <1444758487-9135-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 13 Oct 2015 17:48:16 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile |   4 +-
 ipmid.C  | 319 +++++++++++++++++++++++++++++++++++++++++----------------------
 2 files changed, 212 insertions(+), 111 deletions(-)

diff --git a/Makefile b/Makefile
index 4baf209..be3aedd 100755
--- a/Makefile
+++ b/Makefile
@@ -5,8 +5,8 @@ DAEMON_OBJ = $(DAEMON).o
 LIB_OBJ = apphandler.o
 LIBS = libapphandler.so
 
-INC_FLAG += $(shell pkg-config --cflags glib-2.0 gio-unix-2.0) -I. -O2 --std=gnu++11
-LIB_FLAG += $(shell pkg-config --libs glib-2.0 gio-unix-2.0) -rdynamic
+INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 --std=gnu++11
+LIB_FLAG += $(shell pkg-config  --libs libsystemd) -rdynamic
 IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" 
 
 all: $(DAEMON) $(LIBS)
diff --git a/ipmid.C b/ipmid.C
index 37ac771..10422e1 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -4,22 +4,82 @@
 #include <unistd.h>
 #include <assert.h>
 #include <dirent.h>
-#include <gio/gio.h>
+#include <systemd/sd-bus.h>
 #include <string.h>
 #include <stdlib.h>
 #include <map>
 #include "ipmid.H"
+#include <sys/time.h>
+#include <errno.h>
+
+
+sd_bus *bus = NULL;
 
 // Channel that is used for OpenBMC Barreleye
 const char * DBUS_NAME = "org.openbmc.HostIpmi";
 const char * OBJ_NAME = "/org/openbmc/HostIpmi/1";
 
+const char * FILTER = "type='signal',sender='org.openbmc.HostIpmi',member='ReceivedMessage'";
+
+
 typedef std::pair<ipmi_netfn_t, ipmi_cmd_t> ipmi_fn_cmd_t;
 typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
 
 // Global data structure that contains the IPMI command handler's registrations.
 std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
 
+
+
+#ifndef HEXDUMP_COLS
+#define HEXDUMP_COLS 16
+#endif
+
+void hexdump(void *mem, size_t len)
+{
+        unsigned int i, j;
+        
+        for(i = 0; i < len + ((len % HEXDUMP_COLS) ? (HEXDUMP_COLS - len % HEXDUMP_COLS) : 0); i++)
+        {
+                /* print offset */
+                if(i % HEXDUMP_COLS == 0)
+                {
+                        printf("0x%06x: ", i);
+                }
+ 
+                /* print hex data */
+                if(i < len)
+                {
+                        printf("%02x ", 0xFF & ((char*)mem)[i]);
+                }
+                else /* end of block, just aligning for ASCII dump */
+                {
+                        printf("   ");
+                }
+                
+                /* print ASCII dump */
+                if(i % HEXDUMP_COLS == (HEXDUMP_COLS - 1))
+                {
+                        for(j = i - (HEXDUMP_COLS - 1); j <= i; j++)
+                        {
+                                if(j >= len) /* end of block, not really printing */
+                                {
+                                        putchar(' ');
+                                }
+                                else if(isprint(((char*)mem)[j])) /* printable char */
+                                {
+                                        putchar(0xFF & ((char*)mem)[j]);        
+                                }
+                                else /* other char */
+                                {
+                                        putchar('.');
+                                }
+                        }
+                        putchar('\n');
+                }
+        }
+}
+
+
 // Method that gets called by shared libraries to get their command handlers registered
 void ipmi_register_callback(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                        ipmi_context_t context, ipmid_callback_t handler)
@@ -101,107 +161,130 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
     return rc;
 }
 
-// This gets called by Glib loop on seeing a Dbus signal 
-static void handle_ipmi_command(GDBusProxy *proxy,
-                        gchar      *sender_name,
-                        gchar      *signal_name,
-                        GVariant   *parameters,
-                        gpointer    user_data)
-{
-    // Used to re-construct the message into IPMI specific ones.
-    guchar *parameters_str;
-    unsigned char sequence, netfn, cmd;
-
-    // Request and Response buffer.
-    unsigned char request[MAX_IPMI_BUFFER] = {0};
-    unsigned char response[MAX_IPMI_BUFFER] = {0};
-
-    size_t msg_length = 0;
-    size_t data_len = 0;
-
-    // Response from Net Function Router
-    ipmi_ret_t rc = 0;
-
-    // Variables to marshall and unmarshall the messages.
-    GVariantIter *iter;
-    guchar data;
-    GVariant *dbus_response;
-    GVariantBuilder *builder;
-
-    // Pretty print the message that came on Dbus
-    parameters_str = (guchar *) g_variant_print (parameters, TRUE);
-    printf ("*** Received Signal: %s: %s :%s\n",
-            signal_name,
-            sender_name,
-            parameters_str);
-
-    // Consume the data pattern "<bYte><bYte><bYte><Array_of_bYtes>
-    g_variant_get(parameters, "(yyyay)", &sequence, &netfn, &cmd, &iter);
-
-    printf("Sequence: %x\n",sequence );
-    printf("Netfn   : %x\n",netfn );
-    printf("Cmd     : %x\n",cmd );
-
-    // Further break down the GVariant byte array
-    while (g_variant_iter_loop (iter, "y", &data))
-    {
-        request[msg_length++] = data;
+
+
+
+static int send_ipmi_message(unsigned char seq, unsigned char netfn, unsigned char cmd, unsigned char *buf, unsigned char len) {
+
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    sd_bus_message *reply = NULL, *m=NULL;
+
+
+    const char *path;
+    int r, pty;
+
+
+    r = sd_bus_message_new_method_call(bus,&m,DBUS_NAME,OBJ_NAME,DBUS_NAME,"sendMessage");
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the method object: %s\n", strerror(-r));
+        return -1;
     }
 
-    // Done with consuming data.
-    g_free (parameters_str);
 
     // Needed to see what we get back from the handlers.
     data_len = msg_length;
 
-    // Now that we have parsed the entire byte array from the caller 
-    // we can call the ipmi router to do the work...
-    rc = ipmi_netfn_router(netfn, cmd, (void *)request, (void *)response, &data_len);
-    if(rc == 0)
-    {
-        printf("SUCCESS handling NetFn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
+
+    // Add the bytes needed for the methods to be called
+    r = sd_bus_message_append(m, "yyy", seq, netfn, cmd);
+    if (r < 0) {
+        fprintf(stderr, "Failed add the netfn and others : %s\n", strerror(-r));
+        return -1;
     }
-    else
-    {
-        fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",rc, netfn, cmd);
+   
+    r = sd_bus_message_append_array(m, 'y', buf, len);
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the string of response bytes: %s\n", strerror(-r));
+        return -1;
     }
 
-    // Now build a response Gvariant package
-    // This example may help
-    // http://stackoverflow.com/questions/22937588/how-to-send-byte-array-over-gdbus
 
-    printf("Bytes to return\n");
-   // hexdump(response,data_len);
 
-    // Now we need to put the data as "Array Of Bytes" as we got them.
-    builder = g_variant_builder_new (G_VARIANT_TYPE ("ay"));
+    // Call the IPMI responder on the bus so the message can be sent to the CEC
+    r = sd_bus_call(bus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
+        return -1;
+    }
+
+    r = sd_bus_message_read(reply, "x", &pty);
+#ifdef __IPMI_DEBUG__
+    printf("RC from the ipmi dbus method :%d \n", pty);
+#endif    
+    if (r < 0) {
+       fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
 
-    for (uint out_data = 0; out_data < data_len; out_data++)
-    {
-        g_variant_builder_add (builder, "y", response[out_data]);
     }
 
-    dbus_response = g_variant_new ("(yyyay)", sequence, netfn+1, cmd, builder);
 
-    // Variant builder is no longer needed.
-    g_variant_builder_unref (builder);
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
 
-    parameters_str = (guchar *) g_variant_print (dbus_response, TRUE);
-    printf (" *** Response Signal :%s\n", parameters_str);
 
-    // Done packing the data.
-    g_free (parameters_str);
+#ifdef __IPMI_DEBUG__
+    printf("%d : %s\n", __LINE__, __PRETTY_FUNCTION__ );
+#endif    
+    return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 
-    // NOW send the respone message in the Dbus calling "sendMessage" interface.
-    g_dbus_proxy_call_sync (proxy,
-            "sendMessage",
-            dbus_response,
-            G_DBUS_CALL_FLAGS_NONE,
-            -1,
-            NULL,
-            NULL);
 }
 
+static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
+                         *ret_error) {
+    int r = 0;
+    const char *msg = NULL;
+    char sequence, netfn, cmd;
+    const void *request;
+    size_t sz;
+    size_t resplen =MAX_IPMI_BUFFER;
+    unsigned char response[MAX_IPMI_BUFFER];
+
+    printf(" *** Received Signal: ");
+
+    memset(response, 0, MAX_IPMI_BUFFER);
+
+    r = sd_bus_message_read(m, "yyy",  &sequence, &netfn, &cmd);
+    if (r < 0) {
+        fprintf(stderr, "Failed to parse signal message: %s\n", strerror(-r));
+        return -1;
+    }
+
+    r = sd_bus_message_read_array(m, 'y',  &request, &sz );
+    if (r < 0) {
+        fprintf(stderr, "Failed to parse signal message: %s\n", strerror(-r));
+        return -1;
+    }
+
+
+    printf("Seq 0x%02x, NetFn 0x%02x, CMD: 0x%02x \n", sequence, netfn, cmd);
+    hexdump((void*)request, sz);
+
+    // Allow the length field to be used for both input and output of the 
+    // ipmi call
+    resplen = sz;
+
+    // Now that we have parsed the entire byte array from the caller 
+    // we can call the ipmi router to do the work...
+    r = ipmi_netfn_router(netfn, cmd, (void *)request, (void *)response, &resplen);
+    if(r != 0)
+    {
+        fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",r, netfn, cmd);
+    }
+
+    printf("Response...\n");
+    hexdump((void*)response, resplen);
+
+    // Send the response buffer from the ipmi command
+    r = send_ipmi_message(sequence, netfn, cmd, response, resplen);
+    if (r < 0) {
+        fprintf(stderr, "Failed to send the response message\n");
+        return -1;
+    }
+
+
+    return 0;
+}
+
+
 //----------------------------------------------------------------------
 // handler_select
 // Select all the files ending with with .so. in the given diretcory
@@ -282,6 +365,11 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
 
 int main(int argc, char *argv[])
 {
+    sd_bus_slot *slot = NULL;
+    int r;
+    char *mode = NULL;
+
+
     // Register all the handlers that provider implementation to IPMI commands.
     ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
 
@@ -295,32 +383,45 @@ int main(int argc, char *argv[])
         printf("NETFN:[0x%X], cmd[0x%X]\n", fn_and_cmd.first, fn_and_cmd.second);  
     }
 #endif
-       
-    // Infrastructure that will wait for IPMi Dbus messages and will call 
-    // into the corresponding IPMI providers.
-    GDBusProxy *proxy;
-    GMainLoop *loop;
-
-    loop = g_main_loop_new (NULL, FALSE);
-
-    // Proxy to use GDbus for OpenBMC channel.
-    proxy = g_dbus_proxy_new_for_bus_sync (G_BUS_TYPE_SYSTEM,
-                                           G_DBUS_PROXY_FLAGS_NONE,
-                                           NULL, /* GDBusInterfaceInfo */
-                                           DBUS_NAME,
-                                           OBJ_NAME,
-                                           DBUS_NAME,
-                                           NULL,
-                                           NULL);
-
-    // On receiving the Dbus Signal, handle_ipmi_command gets invoked.
-    g_signal_connect (proxy,
-                    "g-signal",
-                    G_CALLBACK (handle_ipmi_command),
-                    NULL);
-
-    // This will not return unless we return false from the upmi_handler function.
-    g_main_loop_run (loop);
 
-    return 0;
+
+    /* Connect to system bus */
+    r = sd_bus_open_system(&bus);
+    if (r < 0) {
+        fprintf(stderr, "Failed to connect to system bus: %s\n",
+                strerror(-r));
+        goto finish;
+    }
+
+    r = sd_bus_add_match(bus, &slot, FILTER, handle_ipmi_command, NULL);
+    if (r < 0) {
+        fprintf(stderr, "Failed: sd_bus_add_match: %s : %s\n", strerror(-r), FILTER);
+        goto finish;
+    }
+
+
+    for (;;) {
+        /* Process requests */
+
+        r = sd_bus_process(bus, NULL);
+        if (r < 0) {
+            fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
+            goto finish;
+        }
+        if (r > 0) {
+            continue;
+        }
+
+        r = sd_bus_wait(bus, (uint64_t) - 1);
+        if (r < 0) {
+            fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
+            goto finish;
+        }
+    }
+
+finish:
+    sd_bus_slot_unref(slot);
+    sd_bus_unref(bus);
+    return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+
 }
-- 
2.6.0
