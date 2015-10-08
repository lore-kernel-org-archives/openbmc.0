Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0C4811A018F
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 11:20:31 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 144426267549321.55604102519885;
 Wed, 7 Oct 2015 17:04:35 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 3/3] Patch set-3 for IPMI function router
Date: Wed,  7 Oct 2015 19:04:29 -0500
Message-Id: <1444262669-18679-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444262669-18679-1-git-send-email-patches@stwcx.xyz>
References: <1444262669-18679-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 00:20:32 -0000

From: vishwabmc <vishwanath@in.ibm.com>

---
 Makefile      |  21 ++++++------
 apphandler.C  |  46 ++++++++++++++++---------
 apphandler.H  |  32 ++++++++++++++++++
 apphandler.h  |  11 ++++++
 ipmid-api.h   |  91 ++++++++++++++++++++++++++++++++++++++++++++++++++
 ipmid.C       | 105 ++++++++++++++++++++++++++++++++++++----------------------
 ipmid.H       |  73 ++++++----------------------------------
 ipmidcommon.H |  63 +++++++++++++++++++++++++++++++++++
 8 files changed, 314 insertions(+), 128 deletions(-)
 create mode 100644 apphandler.H
 create mode 100644 apphandler.h
 create mode 100755 ipmid-api.h
 create mode 100755 ipmidcommon.H

diff --git a/Makefile b/Makefile
index 81e5d1f..dc83143 100755
--- a/Makefile
+++ b/Makefile
@@ -1,23 +1,24 @@
-CC=g++
-CFLAGS = -I. -I/usr/include/gio-unix-2.0 -Wall -rdynamic
-CFLAGS += $(shell pkg-config --cflags --libs glib-2.0 gio-unix-2.0)
-CFLAGS += -DHOST_IPMI_LIB_PATH=\"/home/OpenBMC/1_EDUCATION/IPMI_DBUS/\"
+CXX ?= $(CROSS_COMPILE)g++
 
-DAEMON_OBJ = ipmid.o
-LIB_OBJ = apphandler.o
 DAEMON = ipmid
+DAEMON_OBJ = $(DAEMON).o
+LIB_OBJ = apphandler.o
 LIBS = libapphandler.so
 
+INC_FLAG += $(shell pkg-config --cflags glib-2.0 gio-unix-2.0) -I. -O2 --std=gnu++11 -D__IPMI_DEBUG__
+LIB_FLAG += $(shell pkg-config --libs glib-2.0 gio-unix-2.0) -rdynamic
+IPMID_PATH = -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" 
+
 all: $(DAEMON) $(LIBS)
 
 %.o: %.C
-	$(CC) -fpic -c -o $@ $< $(CFLAGS)
+	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
 
 $(LIBS): $(LIB_OBJ)
-	$(CC) -shared -o $@ $^ $(CFLAGS)
+	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
 
 $(DAEMON): $(DAEMON_OBJ)
-	$(CC) -o $@ $^ $(CFLAGS) -ldl
+	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
 
 clean:
-	rm -f $(DAEMON) *.o *.d *.so
+	rm -f $(DAEMON) *.o *.so
diff --git a/apphandler.C b/apphandler.C
index 090adf5..14d51e0 100755
--- a/apphandler.C
+++ b/apphandler.C
@@ -1,44 +1,58 @@
+#include "apphandler.h"
+#include "ipmid-api.h"
 #include <stdio.h>
-#include "ipmid.H"
 #include <string.h>
 
 void register_netfn_app_cap_bit() __attribute__((constructor));
 void register_netfn_app_wildcard() __attribute__((constructor));
 
-int ipmi_app_cap_bit_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, void *request, 
-                             void *response, unsigned int *data_len, void *context)
+ipmi_ret_t ipmi_app_cap_bit_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
 {
     printf("Handling Netfn:[0x%X], Cmd:[0x%X]\n",netfn,cmd);
 
-	unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
-	*data_len = 6;
-	memcpy(response, &str, *data_len);
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
 
-    return CC_OK;
+    unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
+
+    // Data length is that of payload + CC
+    *data_len = sizeof(str);
+
+    // Pack the actual response
+    memcpy(response, &str, *data_len);
+
+    return rc;
 }
 
-int ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, void *request, 
-                        void *response, unsigned int *data_len, void *context)
+ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
     printf("Handling WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
 
-	*data_len = strlen("THIS IS WILDCARD") + 1;
-	memcpy(response, "THIS IS WILDCARD", *data_len);
-    return CC_OK;
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    *data_len = strlen("THIS IS WILDCARD");
+
+    // Now pack actual response
+    memcpy(response, "THIS IS WILDCARD", *data_len);
+
+    return rc;
 }
 
 void register_netfn_app_cap_bit()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_CAP_BIT);
-
-    register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_cap_bit_handler);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_cap_bit_handler);
     return;
 }
 
 void register_netfn_app_wildcard()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WILDCARD);
-
-    register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_app_wildcard_handler);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_app_wildcard_handler);
     return;
 }
diff --git a/apphandler.H b/apphandler.H
new file mode 100644
index 0000000..fdcd66f
--- /dev/null
+++ b/apphandler.H
@@ -0,0 +1,32 @@
+#ifndef  __HOST_IPMI_APP_HANDLER_H__
+#define __HOST_IPMI_APP_HANDLER_H__
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
+// TODO :: As and when we write plugin's these will go into apporpriate
+// provider space.
+
+// IPMI commands for net functions.
+enum ipmi_netfn_app_cmds
+{
+    // Get capability bits
+    IPMI_CMD_GET_CAP_BIT    = 0x36,
+};
+
+#endif
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
index cdcb765..3a0c7f1 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -8,55 +8,56 @@
 #include <string.h>
 #include <stdlib.h>
 #include <map>
-#include "./ipmid.H"
+#include "ipmid.H"
 
-using namespace std;
+// Channel that is used for OpenBMC Barreleye
+const char * DBUS_NAME = "org.openbmc.HostIpmi";
+const char * OBJ_NAME = "/org/openbmc/HostIpmi/1";
+
+typedef std::pair<ipmi_netfn_t, ipmi_cmd_t> ipmi_fn_cmd_t;
+typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
 
 // Global data structure that contains the IPMI command handler's registrations.
 std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
-typedef std::map<ipmi_fn_cmd_t, ipmi_fn_context_t>::iterator router_iter_t;
 
 // Method that gets called by shared libraries to get their command handlers registered
-void register_callback(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+void ipmi_register_callback(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                        ipmi_context_t context, ipmid_callback_t handler)
 {
-    ipmi_fn_cmd_t netfn_and_cmd;
-    ipmi_fn_context_t handler_and_context;
-
     // Pack NetFn and Command in one.
-    netfn_and_cmd = std::make_pair(netfn, cmd);
+    auto netfn_and_cmd = std::make_pair(netfn, cmd);
 
     // Pack Function handler and Data in another.
-    handler_and_context = std::make_pair(handler, context);
+    auto handler_and_context = std::make_pair(handler, context);
 
     // Check if the registration has already been made..
-    router_iter_t iter = g_ipmid_router_map.find(netfn_and_cmd);
+    auto iter = g_ipmid_router_map.find(netfn_and_cmd);
     if(iter != g_ipmid_router_map.end())
     {
-        printf("ERROR : Duplicate registration for NetFn [0x%X], Cmd:[0x%X]\n",netfn, cmd);
+        fprintf(stderr,"ERROR : Duplicate registration for NetFn [0x%X], Cmd:[0x%X]\n",netfn, cmd);
     }
     else
     {
         // This is a fresh registration.. Add it to the map.
-        g_ipmid_router_map.insert(make_pair(netfn_and_cmd, handler_and_context));
+        g_ipmid_router_map.emplace(netfn_and_cmd, handler_and_context);
     }
 
     return;
 }
 
 // Looks at the map and calls corresponding handler functions.
-int ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t request,
-                      ipmi_response_t response, unsigned int *data_len)
+ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t request,
+                      ipmi_response_t response, ipmi_data_len_t data_len)
 {
     // return from the Command handlers.
-    int rc = 0;
+    ipmi_ret_t rc = IPMI_CC_INVALID;
 
     // Extract Handler and context from Map.
-    ipmi_fn_context_t handler_and_context;
+    //ipmi_fn_context_t handler_and_context;
 
     // Walk the map that has the registered handlers and invoke the approprite
     // handlers for matching commands.
-    router_iter_t iter = g_ipmid_router_map.find(make_pair(netfn, cmd));
+    auto iter = g_ipmid_router_map.find(std::make_pair(netfn, cmd));
     if(iter == g_ipmid_router_map.end())
     {
         printf("No registered handlers for NetFn:[0x%X], Cmd:[0x%X]"
@@ -64,11 +65,15 @@ int ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t request
 
         // Now that we did not find any specific [NetFn,Cmd], tuple, check for
         // NetFn, WildCard command present.
-        iter = g_ipmid_router_map.find(make_pair(netfn, IPMI_CMD_WILDCARD));
+        iter = g_ipmid_router_map.find(std::make_pair(netfn, IPMI_CMD_WILDCARD));
         if(iter == g_ipmid_router_map.end())
         {
             printf("No Registered handlers for NetFn:[0x%X],Cmd:[0x%X]\n",netfn, IPMI_CMD_WILDCARD);
-            return CC_INVALID;
+
+            // Respond with a 0xC1
+            memcpy(response, &rc, IPMI_CC_LEN);
+            *data_len = IPMI_CC_LEN;
+            return rc;
         }
     }
 
@@ -77,11 +82,24 @@ int ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t request
     printf("Calling Net function:[0x%X], Command:[0x%X]\n", netfn, cmd);
 #endif
 
-    // Extract the map data onto appropriate containers.
-    handler_and_context = iter->second;
+    // Extract the map data onto appropriate containers
+    auto handler_and_context = iter->second;
+
+    // Creating a pointer type casted to char* to make sure we advance 1 byte
+    // when we advance pointer to next's address. advancing void * would not
+    // make sense.
+    char *resp = (char *)response;
 
-    rc = (handler_and_context.first) (netfn, cmd, request, response,
+    // Response message from the plugin goes into a byte post the base response
+    rc = (handler_and_context.first) (netfn, cmd, request, resp + IPMI_CC_LEN,
                                       data_len, handler_and_context.second);
+ 
+    // Now copy the return code that we got from handler and pack it in first
+    // byte.
+    memcpy(response, &rc, IPMI_CC_LEN);
+ 
+    // Data length is now actual data + completion code.
+    *data_len = *data_len + IPMI_CC_LEN;
 
     return rc;
 }
@@ -101,11 +119,11 @@ static void handle_ipmi_command(GDBusProxy *proxy,
     unsigned char request[MAX_IPMI_BUFFER] = {0};
     unsigned char response[MAX_IPMI_BUFFER] = {0};
 
-    unsigned int msg_length = 0;
-    unsigned int data_len = 0;
+    size_t msg_length = 0;
+    size_t data_len = 0;
 
     // Response from Net Function Router
-    int rc = 0;
+    ipmi_ret_t rc = 0;
 
     // Variables to marshall and unmarshall the messages.
     GVariantIter *iter;
@@ -115,7 +133,7 @@ static void handle_ipmi_command(GDBusProxy *proxy,
 
     // Pretty print the message that came on Dbus
     parameters_str = (guchar *) g_variant_print (parameters, TRUE);
-    g_print ("*** Received Signal: %s: %s :%s\n",
+    printf ("*** Received Signal: %s: %s :%s\n",
             signal_name,
             sender_name,
             parameters_str);
@@ -148,10 +166,9 @@ static void handle_ipmi_command(GDBusProxy *proxy,
     }
     else
     {
-        printf("ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",rc, netfn, cmd);
+        fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",rc, netfn, cmd);
     }
 
-    // TODO mark the write bit
     // Now build a response Gvariant package
     // This example may help
     // http://stackoverflow.com/questions/22937588/how-to-send-byte-array-over-gdbus
@@ -173,7 +190,7 @@ static void handle_ipmi_command(GDBusProxy *proxy,
     g_variant_builder_unref (builder);
 
     parameters_str = (guchar *) g_variant_print (dbus_response, TRUE);
-    g_print (" *** Response Signal :%s\n", parameters_str);
+    printf (" *** Response Signal :%s\n", parameters_str);
 
     // Done packing the data.
     g_free (parameters_str);
@@ -195,17 +212,28 @@ static void handle_ipmi_command(GDBusProxy *proxy,
 //----------------------------------------------------------------------
 int handler_select(const struct dirent *entry)
 {
-    if(strstr(entry->d_name, LIBRARY_EXTN))
+    // To hold ".so" from entry->d_name;
+    char dname_copy[4] = {0};
+
+    // We want to avoid checking for everything and isolate to the ones having
+    // .so in them.
+    if(strstr(entry->d_name, IPMI_PLUGIN_EXTN))
     {
-        return 1;
+        // It is possible that .so could be anywhere in the string but unlikely
+        // But being careful here. Get the base address of the string, move 
+        // until end and come back 3 steps and that gets what we need.
+        strcpy(dname_copy, (entry->d_name + strlen(entry->d_name)-strlen(IPMI_PLUGIN_EXTN)));
+        if(strcmp(dname_copy, IPMI_PLUGIN_EXTN) == 0)
+        {
+            return 1;
+        }
     }
-
     return 0;
 }
 
 // This will do a dlopen of every .so in ipmi_lib_path and will dlopen everything so that they will
 // register a callback handler 
-void register_callback_handlers(const char* ipmi_lib_path)
+void ipmi_register_callback_handlers(const char* ipmi_lib_path)
 {
     // For walking the ipmi_lib_path
     struct dirent **handler_list;
@@ -216,7 +244,7 @@ void register_callback_handlers(const char* ipmi_lib_path)
 
     if(ipmi_lib_path == NULL)
     {
-        printf("ERROR; No handlers to be registered for ipmi.. Aborting\n");
+        fprintf(stderr,"ERROR; No handlers to be registered for ipmi.. Aborting\n");
         assert(0);
     }
     else
@@ -241,7 +269,7 @@ void register_callback_handlers(const char* ipmi_lib_path)
             lib_handler = dlopen(handler_fqdn.c_str(), RTLD_NOW);
             if(lib_handler == NULL)
             {
-                printf("ERROR opening:[%s]\n",handler_list[num_handlers]->d_name);
+                fprintf(stderr,"ERROR opening:[%s]\n",handler_list[num_handlers]->d_name);
                 dlerror();
             }
             // Wipe the memory allocated for this particular entry.
@@ -258,16 +286,15 @@ void register_callback_handlers(const char* ipmi_lib_path)
 int main(int argc, char *argv[])
 {
     // Register all the handlers that provider implementation to IPMI commands.
-    register_callback_handlers(HOST_IPMI_LIB_PATH);
+    ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
 
 #ifdef __IPMI_DEBUG__
     printf("Registered Function handlers:\n");
 
     // Print the registered handlers and their arguments.
-    router_iter_t iter;
-    for(iter = g_ipmid_router_map.begin() ; iter != g_ipmid_router_map.end(); iter++)
+    for(auto& iter : g_ipmid_router_map)
     {
-        ipmi_fn_cmd_t fn_and_cmd = iter->first;
+        ipmi_fn_cmd_t fn_and_cmd = iter.first;
         printf("NETFN:[0x%X], cmd[0x%X]\n", fn_and_cmd.first, fn_and_cmd.second);  
     }
 #endif
diff --git a/ipmid.H b/ipmid.H
index 31a2ba2..2b449ee 100755
--- a/ipmid.H
+++ b/ipmid.H
@@ -1,68 +1,15 @@
-#ifndef __IPMI_H__
-#define __IPMI_H__
-#include <utility>
-
-typedef unsigned char   ipmi_netfn_t;
-typedef unsigned char   ipmi_cmd_t;
-typedef void*           ipmi_request_t;
-typedef void*           ipmi_response_t;
-typedef void*           ipmi_context_t;
-
-// This is the provider of the net function. 
-typedef int (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
-                                ipmi_response_t, unsigned int *, ipmi_context_t);
-
-typedef std::pair<ipmi_netfn_t, ipmi_cmd_t> ipmi_fn_cmd_t;
-typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
-
-// This is a callback function defined in ipmid and called into by providers.
-void register_callback(ipmi_netfn_t, ipmi_cmd_t, ipmi_context_t, ipmid_callback_t);
-
-// This looks up in router map and calls corresponding Net function handlers.
-int ipmi_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_t,
+#ifndef __HOST_IPMID_IPMI_H__
+#define __HOST_IPMID_IPMI_H__
+#include "ipmid-api.h"
+
+// When the requester sends in a netfn and a command along with data, this
+// function will look for registered handlers that will handle that [netfn,cmd]
+// and will make a call to that plugin implementation and send back the response.
+ipmi_ret_t ipmi_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_t,
                 ipmi_response_t, unsigned int *data_len);
 
-#define LIBRARY_EXTN ".so"
+// Plugin libraries need to _end_ with .so
+#define IPMI_PLUGIN_EXTN ".so"
 #define MAX_IPMI_BUFFER 255
 
-// These are the command network functions, the response
-// network functions are the function + 1. So to determine
-// the proper network function which issued the command
-// associated with a response, subtract 1.
-// Note: these are also shifted left to make room for the LUN.
-
-enum ipmi_net_fns
-{
-    NETFUN_CHASSIS  =   (0x00 << 2),
-    NETFUN_BRIDGE   =   (0x02 << 2),
-    NETFUN_SENSOR   =   (0x04 << 2),
-    NETFUN_APP      =   (0x06 << 2),
-    NETFUN_FIRMWARE =   (0x08 << 2),
-    NETFUN_STORAGE  =   (0x0a << 2),
-    NETFUN_TRANPORT =   (0x0c << 2),
-    NETFUN_GRPEXT   =   (0x2c << 2),
-    NETFUN_AMI      =   (0x32 << 2),
-    NETFUN_IBM      =   (0x3a << 2),
-    NETFUN_NONE     =   (0x30 << 2)
-};
-
-// IPMI commands for net functions.
-enum ipmi_netfn_cmds
-{
-    IPMI_CMD_GET_CAP_BIT    = 0x36,
-    IPMI_CMD_WILDCARD       = 0xFF
-};
-
-// Return codes from a IPMI operation.
-
-enum ipmi_return_codes
-{
-    CC_OK = 0x00,
-    CC_INVALID = 0xC1
-};
-
-// Channel that is used for OpenBMC Barreleye
-const char * DBUS_NAME = "org.openbmc.HostIpmi";
-const char * OBJ_NAME = "/org/openbmc/HostIpmi/1";
-
 #endif
diff --git a/ipmidcommon.H b/ipmidcommon.H
new file mode 100755
index 0000000..9fa2284
--- /dev/null
+++ b/ipmidcommon.H
@@ -0,0 +1,63 @@
+#ifndef __HOST_IPMID_IPMI_COMMON_H__
+#define __HOST_IPMID_IPMI_COMMON_H__
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
+typedef unsigned int*   ipmi_data_len_t;
+
+// This is the callback handler that the plugin registers with IPMID. IPMI
+// function router will then make a call to this callback handler with the
+// necessary arguments of netfn, cmd, request, response, size and context.
+typedef int (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
+                                ipmi_response_t, ipmi_data_len_t, ipmi_context_t);
+
+// This is the constructor function that is called into by each plugin handlers.
+// When ipmi sets up the callback handlers, a call is made to this with
+// information of netfn, cmd, callback handler pointer and context data.
+void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t, ipmi_context_t, ipmid_callback_t);
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
+    CC_OK = 0x00,
+    CC_INVALID = 0xC1
+};
+
+#endif
-- 
2.6.0
