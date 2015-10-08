Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 09DF21A0380
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2015 05:44:35 +1100 (AEDT)
Received: from localhost (32.97.110.53 [32.97.110.53]) by mx.zohomail.com
 with SMTPS id 1444329873076518.9234325302058;
 Thu, 8 Oct 2015 11:44:33 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v3] Final IPMI Net Function router
Date: Thu,  8 Oct 2015 13:44:28 -0500
Message-Id: <1444329868-31461-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444329868-31461-1-git-send-email-patches@stwcx.xyz>
References: <1444329868-31461-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 18:44:37 -0000

From: vishwabmc <vishwanath@in.ibm.com>

---
 Makefile     |  24 +++++
 apphandler.C |  58 +++++++++++
 apphandler.h |  11 ++
 ipmid-api.h  |  91 +++++++++++++++++
 ipmid.C      | 326 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 ipmid.H      |  15 +++
 6 files changed, 525 insertions(+)
 create mode 100755 Makefile
 create mode 100755 apphandler.C
 create mode 100644 apphandler.h
 create mode 100755 ipmid-api.h
 create mode 100644 ipmid.C
 create mode 100755 ipmid.H

diff --git a/Makefile b/Makefile
new file mode 100755
index 0000000..4baf209
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,24 @@
+CXX ?= $(CROSS_COMPILE)g++
+
+DAEMON = ipmid
+DAEMON_OBJ = $(DAEMON).o
+LIB_OBJ = apphandler.o
+LIBS = libapphandler.so
+
+INC_FLAG += $(shell pkg-config --cflags glib-2.0 gio-unix-2.0) -I. -O2 --std=gnu++11
+LIB_FLAG += $(shell pkg-config --libs glib-2.0 gio-unix-2.0) -rdynamic
+IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" 
+
+all: $(DAEMON) $(LIBS)
+
+%.o: %.C
+	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
+
+$(LIBS): $(LIB_OBJ)
+	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
+
+$(DAEMON): $(DAEMON_OBJ)
+	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
+
+clean:
+	rm -f $(DAEMON) *.o *.so
diff --git a/apphandler.C b/apphandler.C
new file mode 100755
index 0000000..c86997f
--- /dev/null
+++ b/apphandler.C
@@ -0,0 +1,58 @@
+#include "apphandler.h"
+#include "ipmid-api.h"
+#include <stdio.h>
+#include <string.h>
+
+void register_netfn_app_cap_bit() __attribute__((constructor));
+void register_netfn_app_wildcard() __attribute__((constructor));
+
+ipmi_ret_t ipmi_app_cap_bit_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    printf("Handling Netfn:[0x%X], Cmd:[0x%X]\n",netfn,cmd);
+
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
+
+    // Data length
+    *data_len = sizeof(str);
+
+    // Pack the actual response
+    memcpy(response, &str, *data_len);
+
+    return rc;
+}
+
+ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    printf("Handling WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
+
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    *data_len = strlen("THIS IS WILDCARD");
+
+    // Now pack actual response
+    memcpy(response, "THIS IS WILDCARD", *data_len);
+
+    return rc;
+}
+
+void register_netfn_app_cap_bit()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_CAP_BIT);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_cap_bit_handler);
+    return;
+}
+
+void register_netfn_app_wildcard()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WILDCARD);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_app_wildcard_handler);
+    return;
+}
diff --git a/apphandler.h b/apphandler.h
new file mode 100644
index 0000000..602801b
--- /dev/null
+++ b/apphandler.h
@@ -0,0 +1,11 @@
+#ifndef __HOST_IPMI_APP_HANDLER_H__
+#define __HOST_IPMI_APP_HANDLER_H__
+
+// IPMI commands for net functions.
+enum ipmi_netfn_app_cmds
+{
+    // Get capability bits
+    IPMI_CMD_GET_CAP_BIT    = 0x36,
+};
+
+#endif
diff --git a/ipmid-api.h b/ipmid-api.h
new file mode 100755
index 0000000..615e0d5
--- /dev/null
+++ b/ipmid-api.h
@@ -0,0 +1,91 @@
+#ifndef __HOST_IPMID_IPMI_COMMON_H__
+#define __HOST_IPMID_IPMI_COMMON_H__
+#include <stdlib.h>
+
+// length of Completion Code and its ALWAYS _1_
+#define IPMI_CC_LEN 1
+
+// IPMI Net Function number as specified by IPMI V2.0 spec.
+// Example : 
+// NETFUN_APP      =   (0x06 << 2),
+typedef unsigned char   ipmi_netfn_t;
+
+// IPMI Command for a Net Function number as specified by IPMI V2.0 spec.
+typedef unsigned char   ipmi_cmd_t;
+
+// Buffer containing data from sender of netfn and command as part of request
+typedef void*           ipmi_request_t;
+
+// This is the response buffer that the provider of [netfn,cmd] will send back
+// to the caller. Provider will allocate the memory inside the handler and then
+// will do a memcpy to this response buffer and also will set the data size
+// parameter to the size of the buffer.
+// EXAMPLE :
+// unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
+// *data_len = 6;
+// memcpy(response, &str, *data_len);
+typedef void*           ipmi_response_t;
+
+// This buffer contains any *user specific* data that is of interest only to the
+// plugin. For a ipmi function router, this data is opaque. At the time of
+// registering the plugin handlers, plugin may optionally allocate a memory and
+// fill in whatever needed that will be of help during the actual handling of
+// command. IPMID will just pass the netfn, cmd and also this data to plugins
+// during the command handler invocation.
+typedef void*           ipmi_context_t;
+
+// Length of request / response buffer depending on whether the data is a
+// request or a response from a plugin handler.
+typedef size_t*   ipmi_data_len_t;
+
+// Plugin function return the status code
+typedef unsigned char ipmi_ret_t;
+
+// This is the callback handler that the plugin registers with IPMID. IPMI
+// function router will then make a call to this callback handler with the
+// necessary arguments of netfn, cmd, request, response, size and context.
+typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
+                                       ipmi_response_t, ipmi_data_len_t, ipmi_context_t);
+
+// This is the constructor function that is called into by each plugin handlers.
+// When ipmi sets up the callback handlers, a call is made to this with
+// information of netfn, cmd, callback handler pointer and context data.
+// Making this a extern "C" so that plugin libraries written in C can also use
+// it.
+extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t, 
+                                       ipmi_context_t, ipmid_callback_t);
+
+// These are the command network functions, the response
+// network functions are the function + 1. So to determine
+// the proper network function which issued the command
+// associated with a response, subtract 1.
+// Note: these are also shifted left to make room for the LUN.
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
+    NETFUN_NONE     =   (0x30 << 2)
+};
+
+// IPMI commands for net functions. Since this is to be used both by the ipmi
+// function router and also the callback handler registration function, its put
+// in this .H file.
+enum ipmi_netfn_wild_card_cmd
+{
+    IPMI_CMD_WILDCARD       = 0xFF,
+};
+
+// Return codes from a IPMI operation as needed by IPMI V2.0 spec.
+enum ipmi_return_codes
+{
+    IPMI_CC_OK = 0x00,
+    IPMI_CC_INVALID = 0xC1
+};
+
+#endif
diff --git a/ipmid.C b/ipmid.C
new file mode 100644
index 0000000..8333710
--- /dev/null
+++ b/ipmid.C
@@ -0,0 +1,326 @@
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
+#include "ipmid.H"
+
+// Channel that is used for OpenBMC Barreleye
+const char * DBUS_NAME = "org.openbmc.HostIpmi";
+const char * OBJ_NAME = "/org/openbmc/HostIpmi/1";
+
+typedef std::pair<ipmi_netfn_t, ipmi_cmd_t> ipmi_fn_cmd_t;
+typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
+
+// Global data structure that contains the IPMI command handler's registrations.
+std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
+
+// Method that gets called by shared libraries to get their command handlers registered
+void ipmi_register_callback(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                       ipmi_context_t context, ipmid_callback_t handler)
+{
+    // Pack NetFn and Command in one.
+    auto netfn_and_cmd = std::make_pair(netfn, cmd);
+
+    // Pack Function handler and Data in another.
+    auto handler_and_context = std::make_pair(handler, context);
+
+    // Check if the registration has already been made..
+    auto iter = g_ipmid_router_map.find(netfn_and_cmd);
+    if(iter != g_ipmid_router_map.end())
+    {
+        fprintf(stderr,"ERROR : Duplicate registration for NetFn [0x%X], Cmd:[0x%X]\n",netfn, cmd);
+    }
+    else
+    {
+        // This is a fresh registration.. Add it to the map.
+        g_ipmid_router_map.emplace(netfn_and_cmd, handler_and_context);
+    }
+
+    return;
+}
+
+// Looks at the map and calls corresponding handler functions.
+ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t request,
+                      ipmi_response_t response, ipmi_data_len_t data_len)
+{
+    // return from the Command handlers.
+    ipmi_ret_t rc = IPMI_CC_INVALID;
+
+    // Walk the map that has the registered handlers and invoke the approprite
+    // handlers for matching commands.
+    auto iter = g_ipmid_router_map.find(std::make_pair(netfn, cmd));
+    if(iter == g_ipmid_router_map.end())
+    {
+        printf("No registered handlers for NetFn:[0x%X], Cmd:[0x%X]"
+               " trying Wilcard implementation \n",netfn, cmd);
+
+        // Now that we did not find any specific [NetFn,Cmd], tuple, check for
+        // NetFn, WildCard command present.
+        iter = g_ipmid_router_map.find(std::make_pair(netfn, IPMI_CMD_WILDCARD));
+        if(iter == g_ipmid_router_map.end())
+        {
+            printf("No Registered handlers for NetFn:[0x%X],Cmd:[0x%X]\n",netfn, IPMI_CMD_WILDCARD);
+
+            // Respond with a 0xC1
+            memcpy(response, &rc, IPMI_CC_LEN);
+            *data_len = IPMI_CC_LEN;
+            return rc;
+        }
+    }
+
+#ifdef __IPMI_DEBUG__
+    // We have either a perfect match -OR- a wild card atleast,
+    printf("Calling Net function:[0x%X], Command:[0x%X]\n", netfn, cmd);
+#endif
+
+    // Extract the map data onto appropriate containers
+    auto handler_and_context = iter->second;
+
+    // Creating a pointer type casted to char* to make sure we advance 1 byte
+    // when we advance pointer to next's address. advancing void * would not
+    // make sense.
+    char *respo = &((char *)response)[IPMI_CC_LEN];
+
+    // Response message from the plugin goes into a byte post the base response
+    rc = (handler_and_context.first) (netfn, cmd, request, respo,
+                                      data_len, handler_and_context.second);
+ 
+    // Now copy the return code that we got from handler and pack it in first
+    // byte.
+    memcpy(response, &rc, IPMI_CC_LEN);
+ 
+    // Data length is now actual data + completion code.
+    *data_len = *data_len + IPMI_CC_LEN;
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
+    size_t msg_length = 0;
+    size_t data_len = 0;
+
+    // Response from Net Function Router
+    ipmi_ret_t rc = 0;
+
+    // Variables to marshall and unmarshall the messages.
+    GVariantIter *iter;
+    guchar data;
+    GVariant *dbus_response;
+    GVariantBuilder *builder;
+
+    // Pretty print the message that came on Dbus
+    parameters_str = (guchar *) g_variant_print (parameters, TRUE);
+    printf ("*** Received Signal: %s: %s :%s\n",
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
+        fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",rc, netfn, cmd);
+    }
+
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
+    printf (" *** Response Signal :%s\n", parameters_str);
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
+    // To hold ".so" from entry->d_name;
+    char dname_copy[4] = {0};
+
+    // We want to avoid checking for everything and isolate to the ones having
+    // .so in them.
+    if(strstr(entry->d_name, IPMI_PLUGIN_EXTN))
+    {
+        // It is possible that .so could be anywhere in the string but unlikely
+        // But being careful here. Get the base address of the string, move 
+        // until end and come back 3 steps and that gets what we need.
+        strcpy(dname_copy, (entry->d_name + strlen(entry->d_name)-strlen(IPMI_PLUGIN_EXTN)));
+        if(strcmp(dname_copy, IPMI_PLUGIN_EXTN) == 0)
+        {
+            return 1;
+        }
+    }
+    return 0;
+}
+
+// This will do a dlopen of every .so in ipmi_lib_path and will dlopen everything so that they will
+// register a callback handler 
+void ipmi_register_callback_handlers(const char* ipmi_lib_path)
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
+        fprintf(stderr,"ERROR; No handlers to be registered for ipmi.. Aborting\n");
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
+                fprintf(stderr,"ERROR opening:[%s]\n",handler_list[num_handlers]->d_name);
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
+    ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
+
+#ifdef __IPMI_DEBUG__
+    printf("Registered Function handlers:\n");
+
+    // Print the registered handlers and their arguments.
+    for(auto& iter : g_ipmid_router_map)
+    {
+        ipmi_fn_cmd_t fn_and_cmd = iter.first;
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
index 0000000..6b7d2c9
--- /dev/null
+++ b/ipmid.H
@@ -0,0 +1,15 @@
+#ifndef __HOST_IPMID_IPMI_H__
+#define __HOST_IPMID_IPMI_H__
+#include "ipmid-api.h"
+
+// When the requester sends in a netfn and a command along with data, this
+// function will look for registered handlers that will handle that [netfn,cmd]
+// and will make a call to that plugin implementation and send back the response.
+ipmi_ret_t ipmi_netfn_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_t,
+                             ipmi_response_t, unsigned int *data_len);
+
+// Plugin libraries need to _end_ with .so
+#define IPMI_PLUGIN_EXTN ".so"
+#define MAX_IPMI_BUFFER 255
+
+#endif
-- 
2.6.0
