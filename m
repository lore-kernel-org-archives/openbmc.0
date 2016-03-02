Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8FBD61A0B5E
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 17:40:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456900830313828.5773814327285;
 Tue, 1 Mar 2016 22:40:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v4] memory leak found during multiple
 reboots. it was found that in many cases the reply was not unref'ed
Date: Wed,  2 Mar 2016 00:40:28 -0600
Message-Id: <1456900828-20255-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456900828-20255-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456900828-20255-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 02 Mar 2016 06:40:38 -0000

From: vishwa <vishwanath@in.ibm.com>

--signed off by vishwanath@in.ibm.com---
---
 apphandler.C       | 150 ++++++++++++++++++----------------------
 host-services.c    |   2 +-
 ipmid.C            |  53 +++++++-------
 sensorhandler.C    |   2 +-
 storageaddsel.C    |   4 +-
 transporthandler.C | 199 +++++++++++++++++++++++------------------------------
 6 files changed, 182 insertions(+), 228 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index a48059f..a921643 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -119,11 +119,22 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     const char  *objname = "/org/openbmc/control/chassis0";
     const char  *iface = "org.freedesktop.DBus.Properties";
     const char  *chassis_iface = "org.openbmc.control.Chassis";
-    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_message *reply = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
     char *uuid = NULL;
 
+    // UUID is in RFC4122 format. Ex: 61a39523-78f2-11e5-9862-e6402cfc3223
+    // Per IPMI Spec 2.0 need to convert to 16 hex bytes and reverse the byte order
+    // Ex: 0x2332fc2c40e66298e511f2782395a361
+
+    const int resp_size = 16; // Response is 16 hex bytes per IPMI Spec
+    uint8_t resp_uuid[resp_size]; // Array to hold the formatted response
+    int resp_loc = resp_size-1; // Point resp end of array to save in reverse order
+    int i = 0;
+    char *tokptr = NULL;
+    char *id_octet = NULL;
+
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
@@ -131,49 +142,33 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     printf("IPMI GET DEVICE GUID\n");
 
     // Call Get properties method with the interface and property name
-    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"Get");
-    if (r < 0) {
-        fprintf(stderr, "Failed to add the Get method object: %s\n", strerror(-r));
-        return IPMI_CC_UNSPECIFIED_ERROR;
-    }
-    r = sd_bus_message_append(m, "ss", chassis_iface, "uuid");
-    if (r < 0) {
-        fprintf(stderr, "Failed to append arguments: %s\n", strerror(-r));
-        return -1;
-    }
-    r = sd_bus_call(bus, m, 0, &error, &reply);
-    if (r < 0) {
-        fprintf(stderr, "Failed to call the Get method: %s\n", strerror(-r));
-        return IPMI_CC_UNSPECIFIED_ERROR;
+    r = sd_bus_call_method(bus,busname,objname,iface,
+                           "Get",&error, &reply, "ss",
+                           chassis_iface, "uuid");
+    if (r < 0)
+    {
+        fprintf(stderr, "Failed to call Get Method: %s\n", strerror(-r));
+        rc = IPMI_CC_UNSPECIFIED_ERROR;
+        goto finish;
     }
+
     r = sd_bus_message_read(reply, "v", "s", &uuid);
-    if (r < 0) {
-        fprintf(stderr, "Failed to get a response: %s", strerror(-r));
-        return IPMI_CC_RESPONSE_ERROR;
-    }
-    if (uuid == NULL)
+    if (r < 0 || uuid == NULL)
     {
-        fprintf(stderr, "Failed to get a valid response: %s", strerror(-r));
-        return IPMI_CC_RESPONSE_ERROR;
+        fprintf(stderr, "Failed to get a response: %s", strerror(-r));
+        rc = IPMI_CC_RESPONSE_ERROR;
+        goto finish;
     }
 
-    // UUID is in RFC4122 format. Ex: 61a39523-78f2-11e5-9862-e6402cfc3223
-    // Per IPMI Spec 2.0 need to convert to 16 hex bytes and reverse the byte order
-    // Ex: 0x2332fc2c40e66298e511f2782395a361
-
-    const int resp_size = 16; // Response is 16 hex bytes per IPMI Spec
-    uint8_t resp_uuid[resp_size]; // Array to hold the formatted response
-    int resp_loc = resp_size-1; // Point resp end of array to save in reverse order
-    int i = 0;
-    char *tokptr = NULL;
-
     // Traverse the UUID
-    char* id_octet = strtok_r(uuid, "-", &tokptr); // Get the UUID octects separated by dash
+    id_octet = strtok_r(uuid, "-", &tokptr); // Get the UUID octects separated by dash
 
     if (id_octet == NULL)
-    { // Error
+    {
+        // Error
         fprintf(stderr, "Unexpected UUID format: %s", uuid);
-        return IPMI_CC_RESPONSE_ERROR;
+        rc = IPMI_CC_RESPONSE_ERROR;
+        goto finish;
     }
 
     while (id_octet != NULL)
@@ -201,8 +196,9 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Pack the actual response
     memcpy(response, &resp_uuid, *data_len);
 
+finish:
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
+    reply = sd_bus_message_unref(reply);
 
     return rc;
 }
@@ -246,15 +242,13 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     const char  *busname = "org.openbmc.watchdog.Host";
     const char  *objname = "/org/openbmc/watchdog/host0";
     const char  *iface = "org.openbmc.Watchdog";
-    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_message *reply = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
 
     set_wd_data_t *reqptr = (set_wd_data_t*) request;
     uint16_t timer = 0;
     uint32_t timer_ms = 0;
-    // Status code.
-    ipmi_ret_t rc = IPMI_CC_OK;
 
     *data_len = 0;
 
@@ -266,53 +260,45 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     printf("WATCHDOG SET Timer:[0x%X] 100ms intervals\n",timer);
 
     // Set watchdog timer
-    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"set");
-    if (r < 0) {
-        fprintf(stderr, "Failed to add the set method object: %s\n", strerror(-r));
-        return -1;
-    }
-    r = sd_bus_message_append(m, "i", timer_ms);
-    if (r < 0) {
-        fprintf(stderr, "Failed to add timer value: %s\n", strerror(-r));
-        return -1;
-    }
-    r = sd_bus_call(bus, m, 0, &error, &reply);
-    if (r < 0) {
-        fprintf(stderr, "Failed to call the set method: %s\n", strerror(-r));
-        return -1;
+    r = sd_bus_call_method(bus, busname, objname, iface,
+                           "set", &error, &reply, "i", timer_ms);
+    if(r < 0)
+    {
+        fprintf(stderr, "Failed to call the SET method: %s\n", strerror(-r));
+        goto finish;
     }
 
+    sd_bus_error_free(&error);
+    reply = sd_bus_message_unref(reply);
+
     // Stop the current watchdog if any
-    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"stop");
-    if (r < 0) {
-        fprintf(stderr, "Failed to add the start method object: %s\n", strerror(-r));
-        return -1;
-    }
-    r = sd_bus_call(bus, m, 0, &error, &reply);
-    if (r < 0) {
-        fprintf(stderr, "Failed to call the start method: %s\n", strerror(-r));
-        return -1;
+    r = sd_bus_call_method(bus, busname, objname, iface,
+                           "stop", &error, &reply, NULL);
+    if(r < 0)
+    {
+        fprintf(stderr, "Failed to call the STOP method: %s\n", strerror(-r));
+        goto finish;
     }
 
-    // Start the watchdog if requested
     if (reqptr->t_use & 0x40)
     {
-        r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"start");
-        if (r < 0) {
-            fprintf(stderr, "Failed to add the start method object: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_call(bus, m, 0, &error, &reply);
-        if (r < 0) {
-            fprintf(stderr, "Failed to call the start method: %s\n", strerror(-r));
-            return -1;
+        sd_bus_error_free(&error);
+        reply = sd_bus_message_unref(reply);
+
+        // Start the watchdog if requested
+        r = sd_bus_call_method(bus, busname, objname, iface,
+                               "start", &error, &reply, NULL);
+        if(r < 0)
+        {
+            fprintf(stderr, "Failed to call the START method: %s\n", strerror(-r));
         }
     }
 
+finish:
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
+    reply = sd_bus_message_unref(reply);
 
-    return rc;
+    return (r < 0) ? -1 : IPMI_CC_OK;
 }
 
 
@@ -323,7 +309,7 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     const char  *busname = "org.openbmc.watchdog.Host";
     const char  *objname = "/org/openbmc/watchdog/host0";
     const char  *iface = "org.openbmc.Watchdog";
-    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_message *reply = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
 
@@ -334,19 +320,15 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     printf("WATCHDOG RESET\n");
 
     // Refresh watchdog
-    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"poke");
-    if (r < 0) {
-        fprintf(stderr, "Failed to add the method object: %s\n", strerror(-r));
-        return -1;
-    }
-    r = sd_bus_call(bus, m, 0, &error, &reply);
+    r = sd_bus_call_method(bus, busname, objname, iface,
+                           "poke", &error, &reply, NULL);
     if (r < 0) {
-        fprintf(stderr, "Failed to call the method: %s\n", strerror(-r));
-        return -1;
+        fprintf(stderr, "Failed to add reset  watchdog: %s\n", strerror(-r));
+        rc = -1;
     }
 
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
+    reply = sd_bus_message_unref(reply);
 
     return rc;
 }
diff --git a/host-services.c b/host-services.c
index 23aa55e..cc47439 100644
--- a/host-services.c
+++ b/host-services.c
@@ -68,7 +68,7 @@ static int soft_power_off(sd_bus_message *m, void *userdata, sd_bus_error *ret_e
 
 finish:
     sd_bus_error_free(&bus_error);
-    sd_bus_message_unref(response);
+    response = sd_bus_message_unref(response);
 
     if(rc < 0)
     {
diff --git a/ipmid.C b/ipmid.C
index 0f4139c..06fbf05 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -225,9 +225,8 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
 
 final:
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
-    sd_bus_message_unref(reply);
-
+    m = sd_bus_message_unref(m);
+    reply = sd_bus_message_unref(reply);
 
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 }
@@ -246,13 +245,13 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
     r = sd_bus_message_read(m, "yyyy",  &sequence, &netfn, &lun, &cmd);
     if (r < 0) {
         fprintf(stderr, "Failed to parse signal message: %s\n", strerror(-r));
-        return -1;
+        goto final;
     }
 
     r = sd_bus_message_read_array(m, 'y',  &request, &sz );
     if (r < 0) {
         fprintf(stderr, "Failed to parse signal message: %s\n", strerror(-r));
-        return -1;
+        goto final;
     }
 
     fprintf(ipmiio, "IPMI Incoming: Seq 0x%02x, NetFn 0x%02x, CMD: 0x%02x \n", sequence, netfn, cmd);
@@ -268,6 +267,7 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
     if(r != 0)
     {
         fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",r, netfn, cmd);
+        goto final;
     }
 
     fprintf(ipmiio, "IPMI Response:\n");
@@ -278,11 +278,12 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
 		    ((unsigned char *)response) + 1, resplen - 1);
     if (r < 0) {
         fprintf(stderr, "Failed to send the response message\n");
-        return -1;
     }
 
+final:
+    m = sd_bus_message_unref(m);
 
-    return 0;
+    return (r < 0) ? -1 : 0;
 }
 
 
@@ -470,6 +471,7 @@ int find_interface_property_fru_type(dbus_interface_t *interface, const char *pr
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
         fprintf(stderr,"Bus: %s Path: %s Interface: %s \n",
                 interface->bus, interface->path, interface->interface);
+        goto final;
     }
 
     r = sd_bus_message_append(m, "ss", "org.openbmc.InventoryItem", property_name);
@@ -477,6 +479,7 @@ int find_interface_property_fru_type(dbus_interface_t *interface, const char *pr
         fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
         fprintf(stderr,"Bus: %s Path: %s Interface: %s \n",
                 interface->bus, interface->path, interface->interface);
+        goto final;
     }
 
     r = sd_bus_call(bus, m, 0, &error, &reply);
@@ -496,7 +499,8 @@ int find_interface_property_fru_type(dbus_interface_t *interface, const char *pr
 final:
 
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
+    m = sd_bus_message_unref(m);
+    reply = sd_bus_message_unref(reply);
 
     return r;
 }
@@ -512,29 +516,18 @@ int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *int
 
     char  *str1, *str2, *str3;
     sd_bus_error error = SD_BUS_ERROR_NULL;
-    sd_bus_message *reply = NULL, *m=NULL;
+    sd_bus_message *reply = NULL;
 
 
     int r;
 
-    r = sd_bus_message_new_method_call(bus,&m,busname,objname,busname,"getObjectFromByteId");
+    r = sd_bus_call_method(bus,busname,objname,busname, "getObjectFromByteId",
+                           &error, &reply, "sy", type, num);
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
-    }
-
-    r = sd_bus_message_append(m, "sy", type, num);
-    if (r < 0) {
-        fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
-    }
-
-    // Call the IPMI responder on the bus so the message can be sent to the CEC
-    r = sd_bus_call(bus, m, 0, &error, &reply);
-    if (r < 0) {
-        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
         goto final;
     }
 
-
     r = sd_bus_message_read(reply, "(sss)", &str1, &str2, &str3);
     if (r < 0) {
         fprintf(stderr, "Failed to get a response: %s", strerror(-r));
@@ -550,7 +543,7 @@ int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *int
 final:
 
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
+    reply = sd_bus_message_unref(reply);
 
     return r;
 }
@@ -577,11 +570,13 @@ int set_sensor_dbus_state_s(uint8_t number, const char *method, const char *valu
     r = sd_bus_message_new_method_call(bus,&m,a.bus,a.path,a.interface,method);
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
+        goto final;
     }
 
     r = sd_bus_message_append(m, "v", "s", value);
     if (r < 0) {
         fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
+        goto final;
     }
 
 
@@ -590,9 +585,9 @@ int set_sensor_dbus_state_s(uint8_t number, const char *method, const char *valu
         fprintf(stderr, "Failed to call the method: %s", strerror(-r));
     }
 
-
+final:
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
+    m = sd_bus_message_unref(m);
 
     return 0;
 }
@@ -612,11 +607,13 @@ int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t va
     r = sd_bus_message_new_method_call(bus,&m,a.bus,a.path,a.interface,method);
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
+        goto final;
     }
 
     r = sd_bus_message_append(m, "v", "y", value);
     if (r < 0) {
         fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
+        goto final;
     }
 
 
@@ -625,9 +622,9 @@ int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t va
         fprintf(stderr, "12 Failed to call the method: %s", strerror(-r));
     }
 
-
+final:
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
+    m = sd_bus_message_unref(m);
 
     return 0;
-}
\ No newline at end of file
+}
diff --git a/sensorhandler.C b/sensorhandler.C
index d171bf5..90bfd0f 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -221,7 +221,7 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     }
 
 
-    sd_bus_message_unref(reply);
+    reply = sd_bus_message_unref(reply);
 
     return rc;
 }
diff --git a/storageaddsel.C b/storageaddsel.C
index 51edc59..cb90aab 100644
--- a/storageaddsel.C
+++ b/storageaddsel.C
@@ -193,8 +193,8 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
 
 finish:
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
-    sd_bus_message_unref(reply);
+    m = sd_bus_message_unref(m);
+    reply = sd_bus_message_unref(reply);
     return r;
 }
 
diff --git a/transporthandler.C b/transporthandler.C
index d43f1f9..0fd25f9 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -55,7 +55,7 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
     sd_bus *bus = ipmid_get_sd_bus_connection();
-    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_message *reply = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
 
@@ -84,20 +84,10 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                 reqptr->data[4],
                 reqptr->data[5]);
 
-        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"SetHwAddress");
-        if (r < 0) {
-            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_message_append(m, "s", mac);
-        if (r < 0) {
-            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_call(bus, m, 0, &error, &reply);
+        r = sd_bus_call_method(bus,app,obj,ifc,"SetHwAddress",
+                               &error, &reply, "s", mac);
         if (r < 0) {
             fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
-            return -1;
         }
     }
     else if (reqptr->parameter == LAN_PARM_SUBNET)
@@ -112,84 +102,72 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     }
     else if (reqptr->parameter == LAN_PARM_INPROGRESS) // Apply config
     {
-        int rc = 0;
-        sd_bus_message *req = NULL;
-        sd_bus_message *res = NULL;
-        sd_bus *bus1        = NULL;
-        sd_bus_error err    = SD_BUS_ERROR_NULL;
-        
         if (!strcmp(new_ipaddr, "") || !strcmp (new_netmask, "") || !strcmp (new_gateway, ""))
         {
             fprintf(stderr,"ERROR: Incomplete LAN Parameters\n");
             return -1;
         }
-            
-        rc = sd_bus_open_system(&bus1);
-        if(rc < 0)
-        {
-            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
-            return -1;
-        }
 
         if (strcmp(cur_ipaddr, ""))
         {
-            sd_bus_error_free(&err);
-            sd_bus_message_unref(req);
-            sd_bus_message_unref(res);
-
-            rc = sd_bus_call_method(bus1,            // On the System Bus
-                                    app,            // Service to contact
-                                    obj,            // Object path 
-                                    ifc,            // Interface name
-                                    "DelAddress4",  // Method to be called
-                                    &err,           // object to return error
-                                    &res,           // Response message on success
-                                    "ssss",         // input message (dev,ip,nm,gw)
-                                    "eth0",
-                                    cur_ipaddr,
-                                    cur_netmask,
-                                    cur_gateway);
+            r = sd_bus_call_method(bus,           // On the System Bus
+                                   app,            // Service to contact
+                                   obj,            // Object path
+                                   ifc,            // Interface name
+                                   "DelAddress4",  // Method to be called
+                                   &error,         // object to return error
+                                   &reply,         // Response message on success
+                                   "ssss",         // input message (dev,ip,nm,gw)
+                                   "eth0",
+                                   cur_ipaddr,
+                                   cur_netmask,
+                                   cur_gateway);
         }
 
-        if(rc < 0)
+        if(r < 0)
         {
-            fprintf(stderr, "Failed to remove existing IP %s: %s\n", cur_ipaddr, err.message);
-            return -1;
+            fprintf(stderr, "Failed to remove existing IP %s: %s\n", cur_ipaddr, error.message);
+            goto finish;
         }
 
-        sd_bus_error_free(&err);
-        sd_bus_message_unref(req);
-        sd_bus_message_unref(res);
-
-        rc = sd_bus_call_method(bus1,            // On the System Bus
-                                app,            // Service to contact
-                                obj,            // Object path 
-                                ifc,            // Interface name
-                                "AddAddress4",  // Method to be called
-                                &err,           // object to return error
-                                &res,           // Response message on success
-                                "ssss",         // input message (dev,ip,nm,gw)
-                                "eth0",
-                                new_ipaddr,
-                                new_netmask,
-                                new_gateway);
-        if(rc < 0)
+        sd_bus_error_free(&error);
+        reply = sd_bus_message_unref(reply);
+
+        r = sd_bus_call_method(bus,            // On the System Bus
+                               app,            // Service to contact
+                               obj,            // Object path
+                               ifc,            // Interface name
+                               "AddAddress4",  // Method to be called
+                               &error,         // object to return error
+                               &reply,         // Response message on success
+                               "ssss",         // input message (dev,ip,nm,gw)
+                               "eth0",
+                               new_ipaddr,
+                               new_netmask,
+                               new_gateway);
+        if(r < 0)
         {
-            fprintf(stderr, "Failed to set IP %s: %s\n", new_ipaddr, err.message);
-            return -1;
+            fprintf(stderr, "Failed to set IP %s: %s\n", new_ipaddr, error.message);
+        }
+        else
+        {
+            strcpy (cur_ipaddr, new_ipaddr);
+            strcpy (cur_netmask, new_netmask);
+            strcpy (cur_gateway, new_gateway);
         }
-
-        strcpy (cur_ipaddr, new_ipaddr);
-        strcpy (cur_netmask, new_netmask);
-        strcpy (cur_gateway, new_gateway);
     }
     else
     {
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
-        return IPMI_CC_PARM_NOT_SUPPORTED;
+        rc = IPMI_CC_PARM_NOT_SUPPORTED;
     }
 
-    return rc;
+finish:
+    // Clenaup the resources allocated reply and error
+    sd_bus_error_free(&error);
+    reply = sd_bus_message_unref(reply);
+
+    return (r < 0) ? -1 : rc;
 }
 
 struct get_lan_t {
@@ -206,7 +184,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
     sd_bus *bus = ipmid_get_sd_bus_connection();
-    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_message *reply = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
     const uint8_t current_revision = 0x11; // Current rev per IPMI Spec 2.0
@@ -259,32 +237,27 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         const char*         device             = "eth0";
         uint8_t buf[5]; // Size of expected IPMI response msg
 
-        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"GetAddress4");
-        if (r < 0) {
-            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_message_append(m, "s", device);
-        if (r < 0) {
-            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_call(bus, m, 0, &error, &reply);
-        if (r < 0) {
+        r = sd_bus_call_method(bus,app,obj,ifc,"GetAddress4",
+                               &error, &reply, "s", device);
+        if (r < 0)
+        {
             fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
-            return -1;
+            rc = -1;
+            goto finish;
         }
-        rc = sd_bus_message_enter_container (reply, 'a', "(iyyus)");
-        if(rc < 0)
+        r = sd_bus_message_enter_container (reply, 'a', "(iyyus)");
+        if(r < 0)
         {
             fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
-            return -1;
+            rc = -1;
+            goto finish;
         }
-        rc = sd_bus_message_read(reply, "(iyyus)", &family, &prefixlen, &scope, &flags, &saddr);
-        if (rc < 0)
+        r = sd_bus_message_read(reply, "(iyyus)", &family, &prefixlen, &scope, &flags, &saddr);
+        if (r < 0)
         {
             fprintf(stderr, "Failed to receive response: %s\n", strerror(-r));
-            return -1;
+            rc = -1;
+            goto finish;
         }
 
         printf("%s:%d:%d:%d:%s\n", family==AF_INET?"IPv4":"IPv6", prefixlen, scope, flags, saddr);
@@ -297,7 +270,8 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         if (digit == NULL)
         {
             fprintf(stderr, "Unexpected IP format: %s", saddr);
-            return IPMI_CC_RESPONSE_ERROR;
+            rc = IPMI_CC_RESPONSE_ERROR;
+            goto finish;
         }
         i = 0;
         while (digit != NULL)
@@ -311,7 +285,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
 
-        return IPMI_CC_OK;
+        rc = IPMI_CC_OK;
     }
     else if (reqptr->parameter == LAN_PARM_MAC)
     {
@@ -321,30 +295,26 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         uint8_t             buf[7];
         char *eaddr1 = NULL;
 
-        r = sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"GetHwAddress");
-        if (r < 0) {
-            fprintf(stderr, "Failed to add method object: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_message_append(m, "s", device);
-        if (r < 0) {
-            fprintf(stderr, "Failed to append message data: %s\n", strerror(-r));
-            return -1;
-        }
-        r = sd_bus_call(bus, m, 0, &error, &reply);
-        if (r < 0) {
-            fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
-            return -1;
+        r = sd_bus_call_method(bus,app,obj,ifc,"GetHwAddress",
+                               &error, &reply, "s", device);
+        if (r < 0)
+        {
+            fprintf(stderr, "Failed to call GetHwAddress: %s\n", strerror(-r));
+            rc = -1;
+            goto finish;
         }
         r = sd_bus_message_read(reply, "s", &eaddr1);
-        if (r < 0) {
+        if (r < 0)
+        {
             fprintf(stderr, "Failed to get a response: %s", strerror(-r));
-            return IPMI_CC_RESPONSE_ERROR;
+            rc = IPMI_CC_RESPONSE_ERROR;
+            goto finish;
         }
         if (eaddr1 == NULL)
         {
             fprintf(stderr, "Failed to get a valid response: %s", strerror(-r));
-            return IPMI_CC_RESPONSE_ERROR;
+            rc = IPMI_CC_RESPONSE_ERROR;
+            goto finish;
         }
 
         memcpy((void*)&buf[0], &current_revision, 1);
@@ -354,7 +324,8 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         if (digit == NULL)
         {
             fprintf(stderr, "Unexpected MAC format: %s", eaddr1);
-            return IPMI_CC_RESPONSE_ERROR;
+            rc = IPMI_CC_RESPONSE_ERROR;
+            goto finish;
         }
 
         i=0;
@@ -369,14 +340,18 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
 
-        return IPMI_CC_OK;
+        rc = IPMI_CC_OK;
     }
     else
     {
         fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
-        return IPMI_CC_PARM_NOT_SUPPORTED;
+        rc = IPMI_CC_PARM_NOT_SUPPORTED;
     }
 
+finish:
+    sd_bus_error_free(&error);
+    reply = sd_bus_message_unref(reply);
+
     return rc;
 }
 
-- 
2.7.1
