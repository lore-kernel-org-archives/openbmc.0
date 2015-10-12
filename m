Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 559311A0679
 for <openbmc@lists.ozlabs.org>; Mon, 12 Oct 2015 11:33:56 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444610033682658.032907848674;
 Sun, 11 Oct 2015 17:33:53 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Moved from gdbus to sdbus. Fixed sdbus
 memory leak. Added commands to get a Palmetto to IPL further
Date: Sun, 11 Oct 2015 19:33:49 -0500
Message-Id: <1444610029-11956-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444610029-11956-1-git-send-email-patches@stwcx.xyz>
References: <1444610029-11956-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 00:33:57 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile         |  29 ++++-
 apphandler.C     | 151 ++++++++++++++++++++++++-
 apphandler.h     |   6 +
 ipmid-api.h      |   3 +-
 ipmid.C          | 334 ++++++++++++++++++++++++++++++++++++-------------------
 ipmid.H          |   2 +-
 oemhandler.C     | 105 +++++++++++++++++
 oemhandler.h     |  12 ++
 sensorhandler.C  | 225 +++++++++++++++++++++++++++++++++++++
 sensorhandler.h  |  13 +++
 storagehandler.C | 222 ++++++++++++++++++++++++++++++++++++
 storagehandler.h |  16 +++
 12 files changed, 993 insertions(+), 125 deletions(-)
 create mode 100644 oemhandler.C
 create mode 100644 oemhandler.h
 create mode 100644 sensorhandler.C
 create mode 100644 sensorhandler.h
 create mode 100644 storagehandler.C
 create mode 100644 storagehandler.h

diff --git a/Makefile b/Makefile
index 4baf209..929ef21 100755
--- a/Makefile
+++ b/Makefile
@@ -2,19 +2,36 @@ CXX ?= $(CROSS_COMPILE)g++
 
 DAEMON = ipmid
 DAEMON_OBJ = $(DAEMON).o
-LIB_OBJ = apphandler.o
-LIBS = libapphandler.so
+LIB_APP_OBJ     = apphandler.o
+LIB_SEN_OBJ     = sensorhandler.o
+LIB_STORAGE_OBJ = storagehandler.o
+LIB_OEM_OBJ     = oemhandler.o
 
-INC_FLAG += $(shell pkg-config --cflags glib-2.0 gio-unix-2.0) -I. -O2 --std=gnu++11
-LIB_FLAG += $(shell pkg-config --libs glib-2.0 gio-unix-2.0) -rdynamic
+LIB_APP     = libsenhandler.so
+LIB_SEN     = libapphandler.so
+LIB_STORAGE = libstoragehandler.so
+LIB_OEM     = liboemhandler.so
+
+INC_FLAG += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 --std=gnu++11
+LIB_FLAG += $(shell pkg-config  --libs libsystemd) -rdynamic
 IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" 
 
-all: $(DAEMON) $(LIBS)
+all: $(DAEMON) $(LIB_APP) $(LIB_SEN) $(LIB_STORAGE) $(LIB_OEM)
 
 %.o: %.C
 	$(CXX) -fpic -c $< $(CXXFLAGS) $(INC_FLAG) $(IPMID_PATH) -o $@
+	
+
+$(LIB_APP): $(LIB_APP_OBJ)
+	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
+
+$(LIB_OEM): $(LIB_OEM_OBJ)
+	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
+
+$(LIB_STORAGE): $(LIB_STORAGE_OBJ)
+	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
 
-$(LIBS): $(LIB_OBJ)
+$(LIB_SEN): $(LIB_SEN_OBJ)
 	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
 
 $(DAEMON): $(DAEMON_OBJ)
diff --git a/apphandler.C b/apphandler.C
index c86997f..1058b82 100755
--- a/apphandler.C
+++ b/apphandler.C
@@ -1,12 +1,67 @@
 #include "apphandler.h"
 #include "ipmid-api.h"
+#include "ipmid.H"
 #include <stdio.h>
 #include <string.h>
 
 void register_netfn_app_cap_bit() __attribute__((constructor));
 void register_netfn_app_wildcard() __attribute__((constructor));
+void register_netfn_app_reset_wd() __attribute__((constructor));
+void register_netfn_app_set_wd() __attribute__((constructor));
+void register_netfn_app_get_device_id() __attribute__((constructor));
+void register_netfn_app_set_acpi_power_state() __attribute__((constructor));
+void register_netfn_app_read_event()  __attribute__((constructor));
 
-ipmi_ret_t ipmi_app_cap_bit_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+
+ipmi_ret_t ipmi_app_read_event(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    printf("IPMI APP READ EVENT Ignoring for now\n");
+    return rc;
+
+}
+
+
+ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    printf("IPMI SET ACPI STATE Ignoring for now\n");
+    return rc;
+}
+
+ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    // TODO GET REAL VALUES HERE....  I made these ones up because 
+    // we are in bringup mode.  Version Major and Minor can be what we
+    // want like v1.03  but the IANA really should be something that 
+    // we own.  I would suggest getting the IANA from Hostboot as 
+    // long as IBM owns it then no problem.  If some other company 
+    // gave us the IANA to use then use the one we have from the 
+    // FSP ipmi code.
+    unsigned char str[] = {0x00, 0, 1, 1,2, 0xD, 0x49, 0x42, 0x4D, 0x43, 0x40};
+
+    // Data length
+    *data_len = sizeof(str);
+
+    // Pack the actual response
+    memcpy(response, &str, *data_len);
+    return rc;
+}
+
+
+ipmi_ret_t ipmi_app_get_bt_capabilities(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                              ipmi_request_t request, ipmi_response_t response, 
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
@@ -15,7 +70,7 @@ ipmi_ret_t ipmi_app_cap_bit_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
 
-    unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
+    unsigned char str[] = {0x01, MAX_IPMI_BUFFER, MAX_IPMI_BUFFER, 0x0A, 0x01};
 
     // Data length
     *data_len = sizeof(str);
@@ -26,6 +81,60 @@ ipmi_ret_t ipmi_app_cap_bit_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+
+typedef struct {
+    unsigned char  t_use;
+    unsigned char  t_action;
+    unsigned char  preset;
+    unsigned char  flags;
+    unsigned char  ls;
+    unsigned char  ms;
+} SET_WD_DATA ;
+
+
+
+ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+
+    SET_WD_DATA *reqptr = (SET_WD_DATA*) request;
+    unsigned short timer = 0;
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    *data_len = 0;
+
+    timer = (((unsigned short)reqptr->ms) << 8) + reqptr->ls;
+
+    printf("WATCHDOG SET Timer:[0x%X] 100ms intervals\n",timer);
+
+    // TODO: Right here is where we would call some dbus method as a timer.
+    // If the timer expires it would iniate a reboot of the host.
+
+    return rc;
+}
+
+
+ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    printf("WATCHDOG RESET\n");
+    // TODO Right here is where we would call some sdbus timer.
+    // If your are experiencing dejavu you are right.  the
+    // set and the reset do similar things
+    return rc;
+}
+
+
+
+
+
 ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
                               ipmi_data_len_t data_len, ipmi_context_t context)
@@ -46,7 +155,7 @@ ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 void register_netfn_app_cap_bit()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_CAP_BIT);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_cap_bit_handler);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_get_bt_capabilities);
     return;
 }
 
@@ -56,3 +165,39 @@ void register_netfn_app_wildcard()
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_app_wildcard_handler);
     return;
 }
+
+void register_netfn_app_reset_wd()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_RESET_WD);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_RESET_WD, NULL, ipmi_app_reset_watchdog);
+    return;
+}
+void register_netfn_app_set_wd()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_SET_WD);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_WD, NULL, ipmi_app_set_watchdog);
+    return;
+}
+
+void register_netfn_app_get_device_id()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_DEVICE_ID);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_ID, NULL, ipmi_app_get_device_id);
+    return;
+}
+
+void register_netfn_app_set_acpi_power_state()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_SET_ACPI);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_ACPI, NULL, ipmi_app_set_acpi_power_state);
+    return;
+}
+
+void register_netfn_app_read_event()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_READ_EVENT);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_READ_EVENT, NULL, ipmi_app_read_event);
+    return;
+}
+
+
diff --git a/apphandler.h b/apphandler.h
index 602801b..2c4ea22 100644
--- a/apphandler.h
+++ b/apphandler.h
@@ -5,7 +5,13 @@
 enum ipmi_netfn_app_cmds
 {
     // Get capability bits
+    IPMI_CMD_RESET_WD       = 0x22,
+    IPMI_CMD_SET_WD         = 0x24,
     IPMI_CMD_GET_CAP_BIT    = 0x36,
+    IPMI_CMD_GET_DEVICE_ID  = 0x00,
+    IPMI_CMD_SET_ACPI       = 0x06,
+    IPMI_CMD_READ_EVENT     = 0x35,
+
 };
 
 #endif
diff --git a/ipmid-api.h b/ipmid-api.h
index 615e0d5..03e1cb6 100755
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -70,7 +70,8 @@ enum ipmi_net_fns
     NETFUN_STORAGE  =   (0x0a << 2),
     NETFUN_TRANPORT =   (0x0c << 2),
     NETFUN_GRPEXT   =   (0x2c << 2),
-    NETFUN_NONE     =   (0x30 << 2)
+    NETFUN_NONE     =   (0x30 << 2), 
+    NETFUN_OEM_IBM  =   (0x32 << 2)
 };
 
 // IPMI commands for net functions. Since this is to be used both by the ipmi
diff --git a/ipmid.C b/ipmid.C
index 37ac771..38dba91 100644
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
 
+#define FILTER "type='signal',sender='org.openbmc.HostIpmi',member='ReceivedMessage'"
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
@@ -101,107 +161,134 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
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
 
-    // Needed to see what we get back from the handlers.
-    data_len = msg_length;
+    // Responses in IPMI require a bit set.  So there ya go...
+    netfn |= 0x04;
 
-    // Now that we have parsed the entire byte array from the caller 
-    // we can call the ipmi router to do the work...
-    rc = ipmi_netfn_router(netfn, cmd, (void *)request, (void *)response, &data_len);
-    if(rc == 0)
-    {
-        printf("SUCCESS handling NetFn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
+
+    // Add the bytes needed for the methos to obe called
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
+    // TODO: Need to pass the buffer length of the request bytes
+    // Probably should just pass an ipmi object with all the 
+    // interesting stuff in there and just one parameter.  
+    // May be easier to add testing too
+    // Also this is not thread safe at all.  response is a single buffer
+    // used by all commands.  Seems wrong
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
@@ -260,13 +347,14 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
         num_handlers = scandir(ipmi_lib_path, &handler_list, handler_select, alphasort);
         while(num_handlers--)
         {
-            printf("Registering handler:[%s]\n",handler_list[num_handlers]->d_name);
-
+            handler_fqdn = ipmi_lib_path;
             handler_fqdn += handler_list[num_handlers]->d_name;
+            printf("Registering handler:[%s]\n",handler_fqdn.c_str());
+
             lib_handler = dlopen(handler_fqdn.c_str(), RTLD_NOW);
             if(lib_handler == NULL)
             {
-                fprintf(stderr,"ERROR opening:[%s]\n",handler_list[num_handlers]->d_name);
+                fprintf(stderr,"ERROR opening:[%s]\n",handler_fqdn.c_str());
                 dlerror();
             }
             // Wipe the memory allocated for this particular entry.
@@ -282,6 +370,11 @@ void ipmi_register_callback_handlers(const char* ipmi_lib_path)
 
 int main(int argc, char *argv[])
 {
+    sd_bus_slot *slot = NULL;
+    int r;
+    char *mode = NULL;
+
+
     // Register all the handlers that provider implementation to IPMI commands.
     ipmi_register_callback_handlers(HOST_IPMI_LIB_PATH);
 
@@ -295,32 +388,45 @@ int main(int argc, char *argv[])
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
diff --git a/ipmid.H b/ipmid.H
index 6b7d2c9..ab8b030 100755
--- a/ipmid.H
+++ b/ipmid.H
@@ -10,6 +10,6 @@ ipmi_ret_t ipmi_netfn_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_
 
 // Plugin libraries need to _end_ with .so
 #define IPMI_PLUGIN_EXTN ".so"
-#define MAX_IPMI_BUFFER 255
+#define MAX_IPMI_BUFFER 64
 
 #endif
diff --git a/oemhandler.C b/oemhandler.C
new file mode 100644
index 0000000..a686c1f
--- /dev/null
+++ b/oemhandler.C
@@ -0,0 +1,105 @@
+#include "oemhandler.h"
+#include "ipmid-api.h"
+#include <stdio.h>
+#include <string.h>
+
+
+void register_netfn_oem_wildcard() __attribute__((constructor));
+void register_netfn_oem_partial_esel() __attribute__((constructor));
+
+
+ipmi_ret_t ipmi_ibm_oem_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    printf("Handling OEM WILDCARD\n");
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+    return rc;
+}
+
+
+unsigned short g_record_id = 0x0100;
+
+
+typedef struct {
+    unsigned char  residls;
+    unsigned char  residms;
+    unsigned short selrecord;
+    unsigned short offset;
+    unsigned char  progress;
+    unsigned char  data;
+
+} ESEL_DATA ;
+
+
+// This function creates a /tmp/esel# file to store the 
+// incoming partial esel.  It is the role of some other
+// function to commit the error log in to long term 
+// storage.  Likely via the ipmi add_sel command.  
+ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ESEL_DATA *reqptr = (ESEL_DATA*) request;
+    FILE *fp;
+    char string[16];
+    short offset = 0;
+    unsigned short rlen;
+    ipmi_ret_t rc = IPMI_CC_OK;
+    char iocmd[3];
+
+    sprintf(string, "%s%04x", "/tmp/esel", reqptr->selrecord);
+
+
+    // Length is the number of request bytes minus the header itself.
+    // The header contains an extra byte to indicate the start of
+    // the data (so didn't need to worry about word/byte boundaries)
+    // hence the -1...
+    rlen = ((unsigned short)*data_len) - (sizeof(ESEL_DATA)-1);
+
+
+    printf("IPMI PARTIAL ESEL for %s  Offset = %d Length = %d\n", 
+        string, reqptr->offset, rlen);
+
+    if (reqptr->offset == 0) {
+        strcpy(iocmd, "wb");
+    } else {
+        // I was thinking "ab+" but it appears it doesn't
+        // do what fseek asks.  Modify to rb+ and fseek 
+        // works great...
+        strcpy(iocmd, "rb+");
+    }
+
+    if ((fp = fopen(string, iocmd)) != NULL) {
+        fseek(fp, reqptr->offset, SEEK_SET);
+        fwrite(&reqptr->data,rlen,1,fp);
+        fclose(fp);
+
+        *data_len = sizeof(g_record_id);
+        memcpy(response, &g_record_id, *data_len);
+
+
+    } else {
+        fprintf(stderr, "Error trying to perform %s for esel%s\n",cmd, string);
+        ipmi_ret_t rc = IPMI_CC_INVALID;   
+        *data_len     = 0;
+    }
+    
+    return rc;
+}
+
+void register_netfn_oem_wildcard()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM_IBM, IPMI_CMD_WILDCARD);
+    ipmi_register_callback(NETFUN_OEM_IBM, IPMI_CMD_WILDCARD, NULL, ipmi_ibm_oem_wildcard);
+    return;
+}
+
+void register_netfn_oem_partial_esel()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM_IBM, IPMI_CMD_PESEL);
+    ipmi_register_callback(NETFUN_OEM_IBM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel);
+    return;
+}
diff --git a/oemhandler.h b/oemhandler.h
new file mode 100644
index 0000000..dd80e9f
--- /dev/null
+++ b/oemhandler.h
@@ -0,0 +1,12 @@
+#ifndef __HOST_IPMI_IBMOEM_HANDLER_H__
+#define __HOST_IPMI_IBMOEM_HANDLER_H__
+
+// IPMI commands for net functions.
+enum ipmi_netfn_sen_cmds
+{
+    // Get capability bits
+    IPMI_CMD_PESEL = 0xF0,
+
+};
+
+#endif
diff --git a/sensorhandler.C b/sensorhandler.C
new file mode 100644
index 0000000..3bef067
--- /dev/null
+++ b/sensorhandler.C
@@ -0,0 +1,225 @@
+#include "sensorhandler.h"
+#include "ipmid-api.h"
+#include <stdio.h>
+#include <string.h>
+
+
+
+void register_netfn_sen_wildcard()   __attribute__((constructor));
+void register_netfn_sen_set_sensor() __attribute__((constructor));
+void register_netfn_sen_get_sensor_type() __attribute__((constructor));
+
+
+
+typedef struct {
+    unsigned char  sennum;
+} SENSOR_DATA ;
+
+unsigned char g_sensortype [][2] = {
+    {0xc7, 58},
+{0x01, 113},
+{0xc7, 56},
+{0x01, 114},
+{0xc6, 54},
+{0x07, 40},
+{0xC1, 121},
+{0xC2, 137},
+{0x07, 36},
+{0x07, 43},
+{0xC1, 122},
+{0xC1, 119},
+{0x01, 12},
+{0x01, 111},
+{0x01, 116},
+{0xC1, 127},
+{0xC2, 134},
+{0xC2, 130},
+{0xc, 33},
+{0xC1, 125},
+{0x01, 115},
+{0x22, 4},
+{0xC2, 138},
+{0x01, 108},
+{0x01, 102},
+{0xc, 46},
+{0x7, 11},
+{0xC1, 120},
+{0x07, 39},
+{0x07, 42},
+{0x5, 21},
+{0xC2, 131},
+{0xc1, 48},
+{0x12, 53},
+{0xC1, 124},
+{0x01, 117},
+{0xC1, 126},
+{0xf, 5},
+{0x23, 0},
+{0xC2, 139},
+{0x07, 34},
+{0x09, 146},
+{0x02, 178},
+{0xC2, 140},
+{0xC1, 118},
+{0xC2, 133},
+{0x07, 38},
+{0xC2, 143},
+{0x01, 101},
+{0xc3, 9},
+{0x7, 10},
+{0xc2, 51},
+{0x01, 109},
+{0xc, 32},
+{0x7, 8},
+{0xC1, 129},
+{0x01, 112},
+{0x01, 107},
+{0x07, 37},
+{0x07, 44},
+{0x1f, 50},
+{0xC2, 144},
+{0xc7, 52},
+{0xC2, 141},
+{0x01, 106},
+{0x01, 110},
+{0x01, 103},
+{0x9, 28},
+{0x07, 35},
+{0xc7, 55},
+{0x03, 179},
+{0x07, 41},
+{0xc, 30},
+{0x01, 100},
+{0xC1, 128},
+{0xC2, 135},
+{0x01, 105},
+{0x7, 47},
+{0xC2, 145},
+{0xc7, 57},
+{0x01, 104},
+{0x07, 45},
+{0xC2, 132},
+{0xc4, 49},
+{0xC1, 123},
+{0xC2, 142},
+{0x01, 13},
+{0xC2, 136},
+{0xc, 31},
+{0xff,0xff}
+};
+
+
+unsigned char findSensor(char sensor_number) {
+
+    int i=0;
+
+    // TODO : This function should actually call
+    // a dbus object and have it return the data
+    // it is not ready yet so use a Palmetto 
+    // based lookup table for now.  The g_sensortype
+    // can be removed once the dbus method exists
+    while (g_sensortype[i][0] != 0xff) {
+        if (g_sensortype[i][1] == sensor_number) {
+            break;
+        } else {
+            i++;
+        }
+
+    }
+
+    return g_sensortype[i][0];
+
+}
+
+ipmi_ret_t ipmi_sen_get_sensor_type(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    SENSOR_DATA *reqptr = (SENSOR_DATA*)request;
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    printf("IPMI GET_SENSOR_TYPE [0x%02X]\n",reqptr->sennum);
+
+    // TODO Not sure what the System-event-sensor is suppose to return
+    // need to ask Hostboot team
+    unsigned char buf[] = {0x00,0x6F};
+
+    buf[0] = findSensor(reqptr->sennum);
+
+    *data_len = sizeof(buf);
+    memcpy(response, &buf, *data_len);
+
+
+
+    return rc;
+}
+
+
+
+// TODO: Saves the sensor information to a file in /tmp.  This
+// will need to change to calling the correct method 
+// once it exists in the stack.  
+ipmi_ret_t ipmi_sen_set_sensor(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    FILE *fp;
+    char string[16];
+    SENSOR_DATA *reqptr = (SENSOR_DATA*)request;
+    ipmi_ret_t rc = IPMI_CC_OK;
+    unsigned short rlen;
+
+    rlen = (unsigned short) *data_len - 1;
+
+    sprintf(string, "%s%02x", "/tmp/sen", reqptr->sennum);
+
+    printf("IPMI SET_SENSOR [%s]\n",string);
+
+    if ((fp = fopen(string, "wb")) != NULL) {
+        fwrite(reqptr+1,rlen,1,fp);
+        fclose(fp);
+    } else {
+        fprintf(stderr, "Error trying to write to sensor file %s\n",string);
+        ipmi_ret_t rc = IPMI_CC_INVALID;        
+    }
+
+    *data_len=0;
+
+
+    return rc;
+}
+
+ipmi_ret_t ipmi_sen_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    printf("IPMI S/E Wildcard Netfn:[0x%X], Cmd:[0x%X]\n",netfn,cmd);
+    *data_len = 0;
+
+    return rc;
+}
+
+
+void register_netfn_sen_wildcard()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_WILDCARD);
+    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_WILDCARD, NULL, ipmi_sen_wildcard);
+    return;
+}
+
+
+void register_netfn_sen_get_sensor_type()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_TYPE);
+    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_TYPE, NULL, ipmi_sen_get_sensor_type);
+    return;
+}
+
+void register_netfn_sen_set_sensor()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_SET_SENSOR);
+    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_SET_SENSOR, NULL, ipmi_sen_set_sensor);
+    return;
+}
diff --git a/sensorhandler.h b/sensorhandler.h
new file mode 100644
index 0000000..da63bcb
--- /dev/null
+++ b/sensorhandler.h
@@ -0,0 +1,13 @@
+#ifndef __HOST_IPMI_SEN_HANDLER_H__
+#define __HOST_IPMI_SEN_HANDLER_H__
+
+// IPMI commands for net functions.
+enum ipmi_netfn_sen_cmds
+{
+    // Get capability bits
+    IPMI_CMD_GET_SENSOR_TYPE = 0x2F,
+    IPMI_CMD_SET_SENSOR      = 0x30,
+
+};
+
+#endif
diff --git a/storagehandler.C b/storagehandler.C
new file mode 100644
index 0000000..085b442
--- /dev/null
+++ b/storagehandler.C
@@ -0,0 +1,222 @@
+#include "storagehandler.h"
+#include "ipmid-api.h"
+#include <stdio.h>
+#include <string.h>
+
+
+void register_netfn_storage_wildcard() __attribute__((constructor));
+void register_netfn_stoage_set_sel_time() __attribute__((constructor));
+void register_netfn_stoage_write_fru_data() __attribute__((constructor));
+void register_netfn_stoage_get_sel_info() __attribute__((constructor));
+void register_netfn_stoage_reserve_sel() __attribute__((constructor));
+void register_netfn_stoage_add_sel() __attribute__((constructor));
+
+
+unsigned int   g_sel_time    = 0xFFFFFFFF;
+unsigned short g_sel_reserve = 0x1;
+
+ipmi_ret_t ipmi_storage_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    printf("Handling STORAGE WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+    return rc;
+}
+
+
+ipmi_ret_t ipmi_storage_set_sel_time(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    unsigned int *bufftype = (unsigned int *) request;
+
+    printf("Handling Set-SEL-Time:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
+    printf("Data: 0x%X]\n",*bufftype);
+
+    g_sel_time = *bufftype;
+
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+    return rc;
+}
+
+typedef struct {
+    unsigned char  frunum;
+    unsigned char  offsetls;
+    unsigned char  offsetms;
+    unsigned char  data;
+} WRITE_FRU_DATA ;
+
+ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    WRITE_FRU_DATA *reqptr = (WRITE_FRU_DATA*) request;
+    FILE *fp;
+    char string[16];
+    short offset = 0;
+    unsigned short rlen;
+    ipmi_ret_t rc = IPMI_CC_OK;
+    char iocmd[3];
+
+    sprintf(string, "%s%02x", "/tmp/fru", reqptr->frunum);
+
+    offset = (reqptr->offsetms) << 8 | reqptr->offsetls;
+
+
+    // Length is the number of request bytes minus the header itself.
+    // The header contains an extra byte to indicate the start of
+    // the data (so didn't need to worry about word/byte boundaries)
+    // hence the -1...
+    rlen = ((unsigned short)*data_len) - (sizeof(WRITE_FRU_DATA)-1);
+    
+
+    printf("IPMI WRITE-FRU-DATA for %s  Offset = %d Length = %d\n",
+        string, offset, rlen);
+
+
+    // I was thinking "ab+" but it appears it doesn't
+    // do what fseek asks.  Modify to rb+ and fseek 
+    // works great...
+    if (offset == 0) {
+        strcpy(iocmd, "wb");
+    } else {
+        strcpy(iocmd, "rb+");
+    }
+
+    if ((fp = fopen(string, iocmd)) != NULL) {
+        fseek(fp, offset, SEEK_SET);
+        fwrite(&reqptr->data,rlen,1,fp);
+        fclose(fp);
+    } else {
+        fprintf(stderr, "Error trying to write to fru file %s\n",string);
+        ipmi_ret_t rc = IPMI_CC_INVALID;        
+    }
+    
+
+    // TODO : Here is where some validation code could determine if the 
+    // fru data is a legitimate FRU record (not just a partial).  Once
+    // the record is valid the code should call a parser routine to call
+    // the various methods updating interesting properties.  Perhaps 
+    // thinigs like Model#, Serial#, DIMM Size, etc
+    
+
+    *data_len = 0;
+    
+    return rc;
+}
+
+ipmi_ret_t ipmi_storage_get_sel_info(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+
+    ipmi_ret_t rc = IPMI_CC_OK;
+    unsigned char buf[] = {0x51,0,0,0xff, 0xff,0xff,0xff,0xff,0xff, 0xff,0xff,0xff,0xff,0x06};
+
+    printf("IPMI Handling GET-SEL-INFO\n");
+
+    *data_len = sizeof(buf);
+
+    // TODO There is plently of work here.  The SEL DB needs to hold a bunch
+    // of things in a header.  Items like Time Stamp, number of entries, etc
+    // This is one place where the dbus object with the SEL information could
+    // mimic what IPMI needs.
+
+    // Pack the actual response
+    memcpy(response, &buf, *data_len);
+
+    return rc;
+}
+
+
+
+ipmi_ret_t ipmi_storage_reserve_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    printf("IPMI Handling RESERVE-SEL 0x%04x\n", g_sel_reserve);
+
+    *data_len = sizeof(g_sel_reserve);
+
+    // Pack the actual response
+    memcpy(response, &g_sel_reserve, *data_len);
+
+    return rc;
+}
+
+
+ipmi_ret_t ipmi_storage_add_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    printf("IPMI Handling ADD-SEL \n");
+
+    *data_len = sizeof(g_sel_reserve);
+
+    // Pack the actual response
+    memcpy(response, &g_sel_reserve, *data_len);
+
+    // TODO This code should grab the completed partial esel located in 
+    // the /tmp/esel0100 file and commit it to the error log handler.  
+
+
+    // TODO I advanced the sel reservation number so next time HB asks
+    // for a reservation they get a new number.  This tech may change 
+    // based on how the HB team currently uses sel reservations but
+    // for now provide the ability to get new reservations 
+    g_sel_reserve++;
+
+    return rc;
+}
+
+
+
+void register_netfn_storage_wildcard()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_WILDCARD);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WILDCARD, NULL, ipmi_storage_wildcard);
+    return;
+}
+
+void register_netfn_stoage_set_sel_time()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_SET_SEL_TIME);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_SET_SEL_TIME, NULL, ipmi_storage_set_sel_time);
+    return;
+}
+
+void register_netfn_stoage_write_fru_data()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA, NULL, ipmi_storage_write_fru_data);
+    return;
+}
+void register_netfn_stoage_get_sel_info()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_GET_SEL_INFO);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_GET_SEL_INFO, NULL, ipmi_storage_get_sel_info);
+    return;
+}
+void register_netfn_stoage_reserve_sel()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_RESERVE_SEL);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_RESERVE_SEL, NULL, ipmi_storage_reserve_sel);
+    return;
+}
+void register_netfn_stoage_add_sel()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_ADD_SEL);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_ADD_SEL, NULL, ipmi_storage_add_sel);
+    return;
+}
+
diff --git a/storagehandler.h b/storagehandler.h
new file mode 100644
index 0000000..56c1a8b
--- /dev/null
+++ b/storagehandler.h
@@ -0,0 +1,16 @@
+#ifndef __HOST_IPMI_STORAGE_HANDLER_H__
+#define __HOST_IPMI_STORAGE_HANDLER_H__
+
+// IPMI commands for net functions.
+enum ipmi_netfn_storage_cmds
+{
+    // Get capability bits
+    IPMI_CMD_SET_SEL_TIME   = 0x49,
+    IPMI_CMD_WRITE_FRU_DATA = 0x12,
+    IPMI_CMD_GET_SEL_INFO   = 0x40,
+    IPMI_CMD_RESERVE_SEL    = 0x42,
+    IPMI_CMD_ADD_SEL        = 0x44,
+
+};
+
+#endif
-- 
2.6.0
