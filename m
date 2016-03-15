Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPL4h46z3zDq7K
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 14:41:08 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458013232038263.23418784503906;
 Mon, 14 Mar 2016 20:40:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2 1/3] Remove unused code
Date: Mon, 14 Mar 2016 22:40:28 -0500
Message-Id: <1458013230-17330-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458013230-17330-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458013230-17330-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Mar 2016 03:41:09 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

Several calls to sd_bus methods pass pointers to an error variable and a reply
variable which are not ever used. These must later be unrefed to avoid memory
leaks.

This change removes this code to improve maintainability and avoid future
leaks.

Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
---
 apphandler.C       | 30 ++++++------------------------
 globalhandler.C    |  4 +---
 ipmid.C            | 34 ++++++++++++----------------------
 transporthandler.C | 18 ++++++------------
 4 files changed, 25 insertions(+), 61 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index fc6c811..b832b85 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -120,7 +120,6 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     const char  *iface = "org.freedesktop.DBus.Properties";
     const char  *chassis_iface = "org.openbmc.control.Chassis";
     sd_bus_message *reply = NULL;
-    sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
     char *uuid = NULL;
 
@@ -143,7 +142,7 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     // Call Get properties method with the interface and property name
     r = sd_bus_call_method(bus,busname,objname,iface,
-                           "Get",&error, &reply, "ss",
+                           "Get", NULL, &reply, "ss",
                            chassis_iface, "uuid");
     if (r < 0)
     {
@@ -197,8 +196,7 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     memcpy(response, &resp_uuid, *data_len);
 
 finish:
-    sd_bus_error_free(&error);
-    reply = sd_bus_message_unref(reply);
+    sd_bus_message_unref(reply);
 
     return rc;
 }
@@ -242,8 +240,6 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     const char  *busname = "org.openbmc.watchdog.Host";
     const char  *objname = "/org/openbmc/watchdog/host0";
     const char  *iface = "org.openbmc.Watchdog";
-    sd_bus_message *reply = NULL;
-    sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
 
     set_wd_data_t *reqptr = (set_wd_data_t*) request;
@@ -261,19 +257,16 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     // Set watchdog timer
     r = sd_bus_call_method(bus, busname, objname, iface,
-                           "set", &error, &reply, "i", timer_ms);
+                           "set", NULL, NULL, "i", timer_ms);
     if(r < 0)
     {
         fprintf(stderr, "Failed to call the SET method: %s\n", strerror(-r));
         goto finish;
     }
 
-    sd_bus_error_free(&error);
-    reply = sd_bus_message_unref(reply);
-
     // Stop the current watchdog if any
     r = sd_bus_call_method(bus, busname, objname, iface,
-                           "stop", &error, &reply, NULL);
+                           "stop", NULL, NULL, NULL);
     if(r < 0)
     {
         fprintf(stderr, "Failed to call the STOP method: %s\n", strerror(-r));
@@ -282,12 +275,9 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     if (reqptr->t_use & 0x40)
     {
-        sd_bus_error_free(&error);
-        reply = sd_bus_message_unref(reply);
-
         // Start the watchdog if requested
         r = sd_bus_call_method(bus, busname, objname, iface,
-                               "start", &error, &reply, NULL);
+                               "start", NULL, NULL, NULL);
         if(r < 0)
         {
             fprintf(stderr, "Failed to call the START method: %s\n", strerror(-r));
@@ -295,9 +285,6 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     }
 
 finish:
-    sd_bus_error_free(&error);
-    reply = sd_bus_message_unref(reply);
-
     return (r < 0) ? -1 : IPMI_CC_OK;
 }
 
@@ -309,8 +296,6 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     const char  *busname = "org.openbmc.watchdog.Host";
     const char  *objname = "/org/openbmc/watchdog/host0";
     const char  *iface = "org.openbmc.Watchdog";
-    sd_bus_message *reply = NULL;
-    sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
 
     // Status code.
@@ -321,15 +306,12 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     // Refresh watchdog
     r = sd_bus_call_method(bus, busname, objname, iface,
-                           "poke", &error, &reply, NULL);
+                           "poke", NULL, NULL, NULL);
     if (r < 0) {
         fprintf(stderr, "Failed to add reset  watchdog: %s\n", strerror(-r));
         rc = -1;
     }
 
-    sd_bus_error_free(&error);
-    reply = sd_bus_message_unref(reply);
-
     return rc;
 }
 
diff --git a/globalhandler.C b/globalhandler.C
index 2d3af92..0087455 100644
--- a/globalhandler.C
+++ b/globalhandler.C
@@ -79,7 +79,6 @@ finish:
 int dbus_warm_reset()
 {
     sd_bus_error error = SD_BUS_ERROR_NULL;
-    sd_bus_message *m = NULL;
     sd_bus *bus = NULL;
     char* temp_buf = NULL;
     uint8_t* get_value = NULL;
@@ -109,7 +108,7 @@ int dbus_warm_reset()
             control_intf_name,                         /* interface name */
             "warmReset",                               /* method name */
             &error,                                    /* object to return error in */
-            &m,                                        /* return message on success */
+            NULL,                                      /* reply unused */
             NULL,
             NULL
             );
@@ -121,7 +120,6 @@ int dbus_warm_reset()
 
 finish:
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
     free(connection);
 
     return r;
diff --git a/ipmid.C b/ipmid.C
index 728ba0b..a42e2c1 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -176,7 +176,6 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
 
 static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned char netfn, unsigned char lun, unsigned char cmd, unsigned char cc, unsigned char *buf, unsigned char len) {
 
-    sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
     const char *dest, *path;
     int r, pty;
@@ -211,7 +210,7 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
 
 
     // Call the IPMI responder on the bus so the message can be sent to the CEC
-    r = sd_bus_call(bus, m, 0, &error, &reply);
+    r = sd_bus_call(bus, m, 0, NULL, &reply);
     if (r < 0) {
         fprintf(stderr, "Failed to call the method: %s\n", strerror(-r));
         fprintf(stderr, "Dest: %s, Path: %s\n", dest, path);
@@ -224,9 +223,8 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
     }
 
 final:
-    sd_bus_error_free(&error);
-    m = sd_bus_message_unref(m);
-    reply = sd_bus_message_unref(reply);
+    sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
 
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 }
@@ -458,7 +456,6 @@ finish:
 int find_interface_property_fru_type(dbus_interface_t *interface, const char *property_name, char *property_value) {
 
     char  *str1;
-    sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
 
 
@@ -480,7 +477,7 @@ int find_interface_property_fru_type(dbus_interface_t *interface, const char *pr
         goto final;
     }
 
-    r = sd_bus_call(bus, m, 0, &error, &reply);
+    r = sd_bus_call(bus, m, 0, NULL, &reply);
     if (r < 0) {
         fprintf(stderr, "Failed to call the method: %s", strerror(-r));
         goto final;
@@ -496,9 +493,8 @@ int find_interface_property_fru_type(dbus_interface_t *interface, const char *pr
 
 final:
 
-    sd_bus_error_free(&error);
-    m = sd_bus_message_unref(m);
-    reply = sd_bus_message_unref(reply);
+    sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
 
     return r;
 }
@@ -513,14 +509,13 @@ int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *int
     const char  *objname = "/org/openbmc/managers/System";
 
     char  *str1, *str2, *str3;
-    sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL;
 
 
     int r;
 
     r = sd_bus_call_method(bus,busname,objname,busname, "getObjectFromByteId",
-                           &error, &reply, "sy", type, num);
+                           NULL, &reply, "sy", type, num);
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
         goto final;
@@ -540,8 +535,7 @@ int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *int
 
 final:
 
-    sd_bus_error_free(&error);
-    reply = sd_bus_message_unref(reply);
+    sd_bus_message_unref(reply);
 
     return r;
 }
@@ -557,7 +551,6 @@ int set_sensor_dbus_state_s(uint8_t number, const char *method, const char *valu
 
     dbus_interface_t a;
     int r;
-    sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *m=NULL;
 
     fprintf(ipmidbus, "Attempting to set a dbus Variant Sensor 0x%02x via %s with a value of %s\n",
@@ -578,14 +571,13 @@ int set_sensor_dbus_state_s(uint8_t number, const char *method, const char *valu
     }
 
 
-    r = sd_bus_call(bus, m, 0, &error, NULL);
+    r = sd_bus_call(bus, m, 0, NULL, NULL);
     if (r < 0) {
         fprintf(stderr, "Failed to call the method: %s", strerror(-r));
     }
 
 final:
-    sd_bus_error_free(&error);
-    m = sd_bus_message_unref(m);
+    sd_bus_message_unref(m);
 
     return 0;
 }
@@ -594,7 +586,6 @@ int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t va
 
     dbus_interface_t a;
     int r;
-    sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *m=NULL;
 
     fprintf(ipmidbus, "Attempting to set a dbus Variant Sensor 0x%02x via %s with a value of 0x%02x\n",
@@ -615,14 +606,13 @@ int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t va
     }
 
 
-    r = sd_bus_call(bus, m, 0, &error, NULL);
+    r = sd_bus_call(bus, m, 0, NULL, NULL);
     if (r < 0) {
         fprintf(stderr, "12 Failed to call the method: %s", strerror(-r));
     }
 
 final:
-    sd_bus_error_free(&error);
-    m = sd_bus_message_unref(m);
+    sd_bus_message_unref(m);
 
     return 0;
 }
diff --git a/transporthandler.C b/transporthandler.C
index 3b4cf07..e7140f1 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -45,7 +45,6 @@ ipmi_ret_t getNetworkData(uint8_t lan_param, uint8_t * data)
 {
     sd_bus *bus = ipmid_get_sd_bus_connection();
     sd_bus_message *reply = NULL;
-    sd_bus_error error = SD_BUS_ERROR_NULL;
     int family;
     unsigned char prefixlen;
     char* ipaddr = NULL;
@@ -54,7 +53,7 @@ ipmi_ret_t getNetworkData(uint8_t lan_param, uint8_t * data)
     int r = 0;
     ipmi_ret_t rc = IPMI_CC_OK;
 
-    r = sd_bus_call_method(bus, app, obj, ifc, "GetAddress4", &error,
+    r = sd_bus_call_method(bus, app, obj, ifc, "GetAddress4", NULL,
                             &reply, "s", nwinterface);
     if(r < 0)
     {
@@ -116,8 +115,7 @@ ipmi_ret_t getNetworkData(uint8_t lan_param, uint8_t * data)
     }
 
 cleanup:
-    sd_bus_error_free(&error);
-    reply = sd_bus_message_unref(reply);
+    sd_bus_message_unref(reply);
 
     return rc;
 }
@@ -146,7 +144,6 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
     sd_bus *bus = ipmid_get_sd_bus_connection();
-    sd_bus_message *reply = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
 
@@ -176,7 +173,7 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                 reqptr->data[5]);
 
         r = sd_bus_call_method(bus, app, obj, ifc, "SetHwAddress", &error,
-                                &reply, "ss", nwinterface, mac);
+                               NULL, "ss", nwinterface, mac);
         if(r < 0)
         {
             fprintf(stderr, "Failed to call the method: %s\n", strerror(-r));
@@ -212,7 +209,7 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                                         ifc,            // Interface name
                                         "SetAddress4",  // Method to be called
                                         &error,         // object to return error
-                                        &reply,         // Response message on success
+                                        NULL,           // No response required
                                         "ssss",         // input message (Interface, IP Address, Netmask, Gateway)
                                         nwinterface,    // eth0
                                         new_ipaddr,
@@ -240,7 +237,6 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     }
 
     sd_bus_error_free(&error);
-    reply = sd_bus_message_unref(reply);
 
     return rc;
 }
@@ -260,7 +256,6 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     *data_len = 0;
     sd_bus *bus = ipmid_get_sd_bus_connection();
     sd_bus_message *reply = NULL;
-    sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
     const uint8_t current_revision = 0x11; // Current rev per IPMI Spec 2.0
     int i = 0;
@@ -321,7 +316,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         uint8_t buf[7];
         char *eaddr1 = NULL;
 
-        r = sd_bus_call_method(bus, app, obj, ifc, "GetHwAddress", &error,
+        r = sd_bus_call_method(bus, app, obj, ifc, "GetHwAddress", NULL,
                                 &reply, "s", nwinterface);
         if(r < 0)
         {
@@ -374,8 +369,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     }
 
 cleanup:
-    sd_bus_error_free(&error);
-    reply = sd_bus_message_unref(reply);
+    sd_bus_message_unref(reply);
 
     return rc;
 }
-- 
2.7.1
