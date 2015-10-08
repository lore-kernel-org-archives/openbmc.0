Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 113011A0174
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 19:59:11 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444294748832386.2727037830572;
 Thu, 8 Oct 2015 01:59:08 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 1/3] Initial IPMI Net Function router
Date: Thu,  8 Oct 2015 03:59:03 -0500
Message-Id: <1444294745-22248-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444294745-22248-1-git-send-email-patches@stwcx.xyz>
References: <1444294745-22248-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 08:59:12 -0000

From: vishwabmc <vishwanath@in.ibm.com>

---
 Makefile     |  23 +++++
 apphandler.C |  44 +++++++++
 ipmid.C      | 302 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 ipmid.H      |  68 ++++++++++++++
 4 files changed, 437 insertions(+)
 create mode 100755 Makefile
 create mode 100755 apphandler.C
 create mode 100644 ipmid.C
 create mode 100755 ipmid.H

diff --git a/Makefile b/Makefile
new file mode 100755
index 0000000..81e5d1f
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,23 @@
+CC=g++
+CFLAGS = -I. -I/usr/include/gio-unix-2.0 -Wall -rdynamic
+CFLAGS += $(shell pkg-config --cflags --libs glib-2.0 gio-unix-2.0)
+CFLAGS += -DHOST_IPMI_LIB_PATH=\"/home/OpenBMC/1_EDUCATION/IPMI_DBUS/\"
+
+DAEMON_OBJ = ipmid.o
+LIB_OBJ = apphandler.o
+DAEMON = ipmid
+LIBS = libapphandler.so
+
+all: $(DAEMON) $(LIBS)
+
+%.o: %.C
+	$(CC) -fpic -c -o $@ $< $(CFLAGS)
+
+$(LIBS): $(LIB_OBJ)
+	$(CC) -shared -o $@ $^ $(CFLAGS)
+
+$(DAEMON): $(DAEMON_OBJ)
+	$(CC) -o $@ $^ $(CFLAGS) -ldl
+
+clean:
+	rm -f $(DAEMON) *.o *.d *.so
diff --git a/apphandler.C b/apphandler.C
new file mode 100755
index 0000000..090adf5
--- /dev/null
+++ b/apphandler.C
@@ -0,0 +1,44 @@
+#include <stdio.h>
+#include "ipmid.H"
+#include <string.h>
+
+void register_netfn_app_cap_bit() __attribute__((constructor));
+void register_netfn_app_wildcard() __attribute__((constructor));
+
+int ipmi_app_cap_bit_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, void *request, 
+                             void *response, unsigned int *data_len, void *context)
+{
+    printf("Handling Netfn:[0x%X], Cmd:[0x%X]\n",netfn,cmd);
+
+	unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
+	*data_len = 6;
+	memcpy(response, &str, *data_len);
+
+    return CC_OK;
+}
+
+int ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, void *request, 
+                        void *response, unsigned int *data_len, void *context)
+{
+    printf("Handling WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
+
+	*data_len = strlen("THIS IS WILDCARD") + 1;
+	memcpy(response, "THIS IS WILDCARD", *data_len);
+    return CC_OK;
+}
+
+void register_netfn_app_cap_bit()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_CAP_BIT);
+
+    register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_cap_bit_handler);
+    return;
+}
+
+void register_netfn_app_wildcard()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WILDCARD);
+
+    register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_app_wildcard_handler);
+    return;
+}
diff --git a/ipmid.C b/ipmid.C
new file mode 100644
index 0000000..cdcb765
--- /dev/null
+++ b/ipmid.C
@@ -0,0 +1,302 @@
+#include <stdio.h>
+#include <dlfcn.h>
+#include <iostream>
+#include <unistd.h>
+#include <assert.h>
+#include <dirent.h>
+#include <gio/gio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <map>
+#include "./ipmid.H"
+
+using namespace std;
+
+// Global data structure that contains the IPMI command handler's registrations.
+std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
+typedef std::map<ipmi_fn_cmd_t, ipmi_fn_context_t>::iterator router_iter_t;
+
+// Method that gets called by shared libraries to get their command handlers registered
+void register_callback(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                       ipmi_context_t context, ipmid_callback_t handler)
+{
+    ipmi_fn_cmd_t netfn_and_cmd;
+    ipmi_fn_context_t handler_and_context;
+
+    // Pack NetFn and Command in one.
+    netfn_and_cmd = std::make_pair(netfn, cmd);
+
+    // Pack Function handler and Data in another.
+    handler_and_context = std::make_pair(handler, context);
+
+    // Check if the registration has already been made..
+    router_iter_t iter = g_ipmid_router_map.find(netfn_and_cmd);
+    if(iter != g_ipmid_router_map.end())
+    {
+        printf("ERROR : Duplicate registration for NetFn [0x%X], Cmd:[0x%X]\n",netfn, cmd);
+    }
+    else
+    {
+        // This is a fresh registration.. Add it to the map.
+        g_ipmid_router_map.insert(make_pair(netfn_and_cmd, handler_and_context));
+    }
+
+    return;
+}
+
+// Looks at the map and calls corresponding handler functions.
+int ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t request,
+                      ipmi_response_t response, unsigned int *data_len)
+{
+    // return from the Command handlers.
+    int rc = 0;
+
+    // Extract Handler and context from Map.
+    ipmi_fn_context_t handler_and_context;
+
+    // Walk the map that has the registered handlers and invoke the approprite
+    // handlers for matching commands.
+    router_iter_t iter = g_ipmid_router_map.find(make_pair(netfn, cmd));
+    if(iter == g_ipmid_router_map.end())
+    {
+        printf("No registered handlers for NetFn:[0x%X], Cmd:[0x%X]"
+               " trying Wilcard implementation \n",netfn, cmd);
+
+        // Now that we did not find any specific [NetFn,Cmd], tuple, check for
+        // NetFn, WildCard command present.
+        iter = g_ipmid_router_map.find(make_pair(netfn, IPMI_CMD_WILDCARD));
+        if(iter == g_ipmid_router_map.end())
+        {
+            printf("No Registered handlers for NetFn:[0x%X],Cmd:[0x%X]\n",netfn, IPMI_CMD_WILDCARD);
+            return CC_INVALID;
+        }
+    }
+
+#ifdef __IPMI_DEBUG__
+    // We have either a perfect match -OR- a wild card atleast,
+    printf("Calling Net function:[0x%X], Command:[0x%X]\n", netfn, cmd);
+#endif
+
+    // Extract the map data onto appropriate containers.
+    handler_and_context = iter->second;
+
+    rc = (handler_and_context.first) (netfn, cmd, request, response,
+                                      data_len, handler_and_context.second);
+
+    return rc;
+}
+
+// This gets called by Glib loop on seeing a Dbus signal 
+static void handle_ipmi_command(GDBusProxy *proxy,
+                        gchar      *sender_name,
+                        gchar      *signal_name,
+                        GVariant   *parameters,
+                        gpointer    user_data)
+{
+    // Used to re-construct the message into IPMI specific ones.
+    guchar *parameters_str;
+    unsigned char sequence, netfn, cmd;
+
+    // Request and Response buffer.
+    unsigned char request[MAX_IPMI_BUFFER] = {0};
+    unsigned char response[MAX_IPMI_BUFFER] = {0};
+
+    unsigned int msg_length = 0;
+    unsigned int data_len = 0;
+
+    // Response from Net Function Router
+    int rc = 0;
+
+    // Variables to marshall and unmarshall the messages.
+    GVariantIter *iter;
+    guchar data;
+    GVariant *dbus_response;
+    GVariantBuilder *builder;
+
+    // Pretty print the message that came on Dbus
+    parameters_str = (guchar *) g_variant_print (parameters, TRUE);
+    g_print ("*** Received Signal: %s: %s :%s\n",
+            signal_name,
+            sender_name,
+            parameters_str);
+
+    // Consume the data pattern "<bYte><bYte><bYte><Array_of_bYtes>
+    g_variant_get(parameters, "(yyyay)", &sequence, &netfn, &cmd, &iter);
+
+    printf("Sequence: %x\n",sequence );
+    printf("Netfn   : %x\n",netfn );
+    printf("Cmd     : %x\n",cmd );
+
+    // Further break down the GVariant byte array
+    while (g_variant_iter_loop (iter, "y", &data))
+    {
+        request[msg_length++] = data;
+    }
+
+    // Done with consuming data.
+    g_free (parameters_str);
+
+    // Needed to see what we get back from the handlers.
+    data_len = msg_length;
+
+    // Now that we have parsed the entire byte array from the caller 
+    // we can call the ipmi router to do the work...
+    rc = ipmi_netfn_router(netfn, cmd, (void *)request, (void *)response, &data_len);
+    if(rc == 0)
+    {
+        printf("SUCCESS handling NetFn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
+    }
+    else
+    {
+        printf("ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",rc, netfn, cmd);
+    }
+
+    // TODO mark the write bit
+    // Now build a response Gvariant package
+    // This example may help
+    // http://stackoverflow.com/questions/22937588/how-to-send-byte-array-over-gdbus
+
+    printf("Bytes to return\n");
+   // hexdump(response,data_len);
+
+    // Now we need to put the data as "Array Of Bytes" as we got them.
+    builder = g_variant_builder_new (G_VARIANT_TYPE ("ay"));
+
+    for (uint out_data = 0; out_data < data_len; out_data++)
+    {
+        g_variant_builder_add (builder, "y", response[out_data]);
+    }
+
+    dbus_response = g_variant_new ("(yyyay)", sequence, netfn+1, cmd, builder);
+
+    // Variant builder is no longer needed.
+    g_variant_builder_unref (builder);
+
+    parameters_str = (guchar *) g_variant_print (dbus_response, TRUE);
+    g_print (" *** Response Signal :%s\n", parameters_str);
+
+    // Done packing the data.
+    g_free (parameters_str);
+
+    // NOW send the respone message in the Dbus calling "sendMessage" interface.
+    g_dbus_proxy_call_sync (proxy,
+            "sendMessage",
+            dbus_response,
+            G_DBUS_CALL_FLAGS_NONE,
+            -1,
+            NULL,
+            NULL);
+}
+
+//----------------------------------------------------------------------
+// handler_select
+// Select all the files ending with with .so. in the given diretcory
+// @d: dirent structure containing the file name
+//----------------------------------------------------------------------
+int handler_select(const struct dirent *entry)
+{
+    if(strstr(entry->d_name, LIBRARY_EXTN))
+    {
+        return 1;
+    }
+
+    return 0;
+}
+
+// This will do a dlopen of every .so in ipmi_lib_path and will dlopen everything so that they will
+// register a callback handler 
+void register_callback_handlers(const char* ipmi_lib_path)
+{
+    // For walking the ipmi_lib_path
+    struct dirent **handler_list;
+    int num_handlers = 0;
+
+    // This is used to check and abort if someone tries to register a bad one.
+    void *lib_handler = NULL;
+
+    if(ipmi_lib_path == NULL)
+    {
+        printf("ERROR; No handlers to be registered for ipmi.. Aborting\n");
+        assert(0);
+    }
+    else
+    {
+        // 1: Open ipmi_lib_path. Its usually "/usr/lib/phosphor-host-ipmid"
+        // 2: Scan the directory for the files that end with .so
+        // 3: For each one of them, just do a 'dlopen' so that they register 
+        //    the handlers for callback routines.
+
+        std::string handler_fqdn = ipmi_lib_path;
+        
+        // Append a "/" since we need to add the name of the .so. If there is
+        // already a .so, adding one more is not any harm.
+        handler_fqdn += "/";
+
+        num_handlers = scandir(ipmi_lib_path, &handler_list, handler_select, alphasort);
+        while(num_handlers--)
+        {
+            printf("Registering handler:[%s]\n",handler_list[num_handlers]->d_name);
+
+            handler_fqdn += handler_list[num_handlers]->d_name;
+            lib_handler = dlopen(handler_fqdn.c_str(), RTLD_NOW);
+            if(lib_handler == NULL)
+            {
+                printf("ERROR opening:[%s]\n",handler_list[num_handlers]->d_name);
+                dlerror();
+            }
+            // Wipe the memory allocated for this particular entry.
+            free(handler_list[num_handlers]);
+        }
+        // Done with all registration.
+        free(handler_list);
+    }
+
+    // TODO : What to be done on the memory that is given by dlopen ?.
+    return;
+}
+
+int main(int argc, char *argv[])
+{
+    // Register all the handlers that provider implementation to IPMI commands.
+    register_callback_handlers(HOST_IPMI_LIB_PATH);
+
+#ifdef __IPMI_DEBUG__
+    printf("Registered Function handlers:\n");
+
+    // Print the registered handlers and their arguments.
+    router_iter_t iter;
+    for(iter = g_ipmid_router_map.begin() ; iter != g_ipmid_router_map.end(); iter++)
+    {
+        ipmi_fn_cmd_t fn_and_cmd = iter->first;
+        printf("NETFN:[0x%X], cmd[0x%X]\n", fn_and_cmd.first, fn_and_cmd.second);  
+    }
+#endif
+       
+    // Infrastructure that will wait for IPMi Dbus messages and will call 
+    // into the corresponding IPMI providers.
+    GDBusProxy *proxy;
+    GMainLoop *loop;
+
+    loop = g_main_loop_new (NULL, FALSE);
+
+    // Proxy to use GDbus for OpenBMC channel.
+    proxy = g_dbus_proxy_new_for_bus_sync (G_BUS_TYPE_SESSION,
+                                           G_DBUS_PROXY_FLAGS_NONE,
+                                           NULL, /* GDBusInterfaceInfo */
+                                           DBUS_NAME,
+                                           OBJ_NAME,
+                                           DBUS_NAME,
+                                           NULL,
+                                           NULL);
+
+    // On receiving the Dbus Signal, handle_ipmi_command gets invoked.
+    g_signal_connect (proxy,
+                    "g-signal",
+                    G_CALLBACK (handle_ipmi_command),
+                    NULL);
+
+    // This will not return unless we return false from the upmi_handler function.
+    g_main_loop_run (loop);
+
+    return 0;
+}
diff --git a/ipmid.H b/ipmid.H
new file mode 100755
index 0000000..31a2ba2
--- /dev/null
+++ b/ipmid.H
@@ -0,0 +1,68 @@
+#ifndef __IPMI_H__
+#define __IPMI_H__
+#include <utility>
+
+typedef unsigned char   ipmi_netfn_t;
+typedef unsigned char   ipmi_cmd_t;
+typedef void*           ipmi_request_t;
+typedef void*           ipmi_response_t;
+typedef void*           ipmi_context_t;
+
+// This is the provider of the net function. 
+typedef int (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
+                                ipmi_response_t, unsigned int *, ipmi_context_t);
+
+typedef std::pair<ipmi_netfn_t, ipmi_cmd_t> ipmi_fn_cmd_t;
+typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
+
+// This is a callback function defined in ipmid and called into by providers.
+void register_callback(ipmi_netfn_t, ipmi_cmd_t, ipmi_context_t, ipmid_callback_t);
+
+// This looks up in router map and calls corresponding Net function handlers.
+int ipmi_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_t,
+                ipmi_response_t, unsigned int *data_len);
+
+#define LIBRARY_EXTN ".so"
+#define MAX_IPMI_BUFFER 255
+
+// These are the command network functions, the response
+// network functions are the function + 1. So to determine
+// the proper network function which issued the command
+// associated with a response, subtract 1.
+// Note: these are also shifted left to make room for the LUN.
+
+enum ipmi_net_fns
+{
+    NETFUN_CHASSIS  =   (0x00 << 2),
+    NETFUN_BRIDGE   =   (0x02 << 2),
+    NETFUN_SENSOR   =   (0x04 << 2),
+    NETFUN_APP      =   (0x06 << 2),
+    NETFUN_FIRMWARE =   (0x08 << 2),
+    NETFUN_STORAGE  =   (0x0a << 2),
+    NETFUN_TRANPORT =   (0x0c << 2),
+    NETFUN_GRPEXT   =   (0x2c << 2),
+    NETFUN_AMI      =   (0x32 << 2),
+    NETFUN_IBM      =   (0x3a << 2),
+    NETFUN_NONE     =   (0x30 << 2)
+};
+
+// IPMI commands for net functions.
+enum ipmi_netfn_cmds
+{
+    IPMI_CMD_GET_CAP_BIT    = 0x36,
+    IPMI_CMD_WILDCARD       = 0xFF
+};
+
+// Return codes from a IPMI operation.
+
+enum ipmi_return_codes
+{
+    CC_OK = 0x00,
+    CC_INVALID = 0xC1
+};
+
+// Channel that is used for OpenBMC Barreleye
+const char * DBUS_NAME = "org.openbmc.HostIpmi";
+const char * OBJ_NAME = "/org/openbmc/HostIpmi/1";
+
+#endif
-- 
2.6.0
