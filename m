Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0EAC11A0347
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 22:44:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456746029645992.2816735316701;
 Mon, 29 Feb 2016 03:40:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Fix memory leak in ipmid
Date: Mon, 29 Feb 2016 05:40:27 -0600
Message-Id: <1456746027-24921-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456746027-24921-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456746027-24921-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 29 Feb 2016 11:44:24 -0000

From: vishwa <vishwanath@in.ibm.com>

---
 apphandler.C       | 147 ++++++++++++++++++-----------------------
 host-services.c    |   1 +
 ipmid.C            |  33 +++++++---
 sensorhandler.C    |   1 +
 storageaddsel.C    |   1 +
 transporthandler.C | 190 +++++++++++++++++++++++------------------------------
 6 files changed, 173 insertions(+), 200 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index a48059f..df71111 100644
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
@@ -201,8 +196,10 @@ ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Pack the actual response
     memcpy(response, &resp_uuid, *data_len);
 
+finish:
     sd_bus_error_free(&error);
-    sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
+    reply = NULL;
 
     return rc;
 }
@@ -246,15 +243,13 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
 
@@ -266,53 +261,40 @@ ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
+    sd_bus_message_unref(reply);
+    reply = NULL;
 
-    return rc;
+    return (r < 0) ? -1 : IPMI_CC_OK;
 }
 
 
@@ -323,7 +305,7 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     const char  *busname = "org.openbmc.watchdog.Host";
     const char  *objname = "/org/openbmc/watchdog/host0";
     const char  *iface = "org.openbmc.Watchdog";
-    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_message *reply = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
 
@@ -334,19 +316,16 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
+    sd_bus_message_unref(reply);
+    reply = NULL;
 
     return rc;
 }
diff --git a/host-services.c b/host-services.c
index 23aa55e..4c618f9 100644
--- a/host-services.c
+++ b/host-services.c
@@ -69,6 +69,7 @@ static int soft_power_off(sd_bus_message *m, void *userdata, sd_bus_error *ret_e
 finish:
     sd_bus_error_free(&bus_error);
     sd_bus_message_unref(response);
+    response = NULL;
 
     if(rc < 0)
     {
diff --git a/ipmid.C b/ipmid.C
index 0f4139c..fee7d1e 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -228,7 +228,7 @@ final:
     sd_bus_message_unref(m);
     sd_bus_message_unref(reply);
 
-
+    m = NULL; reply = NULL;
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 }
 
@@ -246,13 +246,13 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
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
@@ -268,6 +268,7 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
     if(r != 0)
     {
         fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",r, netfn, cmd);
+        goto final;
     }
 
     fprintf(ipmiio, "IPMI Response:\n");
@@ -278,11 +279,13 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
 		    ((unsigned char *)response) + 1, resplen - 1);
     if (r < 0) {
         fprintf(stderr, "Failed to send the response message\n");
-        return -1;
     }
 
+final:
+    sd_bus_message_unref(m);
+    m = NULL;
 
-    return 0;
+    return (r < 0) ? -1 : 0;
 }
 
 
@@ -470,6 +473,7 @@ int find_interface_property_fru_type(dbus_interface_t *interface, const char *pr
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
         fprintf(stderr,"Bus: %s Path: %s Interface: %s \n",
                 interface->bus, interface->path, interface->interface);
+        goto final;
     }
 
     r = sd_bus_message_append(m, "ss", "org.openbmc.InventoryItem", property_name);
@@ -477,6 +481,7 @@ int find_interface_property_fru_type(dbus_interface_t *interface, const char *pr
         fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
         fprintf(stderr,"Bus: %s Path: %s Interface: %s \n",
                 interface->bus, interface->path, interface->interface);
+        goto final;
     }
 
     r = sd_bus_call(bus, m, 0, &error, &reply);
@@ -497,6 +502,8 @@ final:
 
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
+    m = NULL; reply = NULL;
 
     return r;
 }
@@ -520,11 +527,13 @@ int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *int
     r = sd_bus_message_new_method_call(bus,&m,busname,objname,busname,"getObjectFromByteId");
     if (r < 0) {
         fprintf(stderr, "Failed to create a method call: %s", strerror(-r));
+        goto final;
     }
 
     r = sd_bus_message_append(m, "sy", type, num);
     if (r < 0) {
         fprintf(stderr, "Failed to create a input parameter: %s", strerror(-r));
+        goto final;
     }
 
     // Call the IPMI responder on the bus so the message can be sent to the CEC
@@ -551,6 +560,8 @@ final:
 
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
+    reply = NULL; m = NULL;
 
     return r;
 }
@@ -577,11 +588,13 @@ int set_sensor_dbus_state_s(uint8_t number, const char *method, const char *valu
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
 
 
@@ -590,9 +603,10 @@ int set_sensor_dbus_state_s(uint8_t number, const char *method, const char *valu
         fprintf(stderr, "Failed to call the method: %s", strerror(-r));
     }
 
-
+final:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
+    m = NULL;
 
     return 0;
 }
@@ -612,11 +626,13 @@ int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t va
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
 
 
@@ -625,9 +641,10 @@ int set_sensor_dbus_state_y(uint8_t number, const char *method, const uint8_t va
         fprintf(stderr, "12 Failed to call the method: %s", strerror(-r));
     }
 
-
+final:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
+    m = NULL;
 
     return 0;
-}
\ No newline at end of file
+}
diff --git a/sensorhandler.C b/sensorhandler.C
index d171bf5..0461991 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -222,6 +222,7 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
 
     sd_bus_message_unref(reply);
+    reply = NULL;
 
     return rc;
 }
diff --git a/storageaddsel.C b/storageaddsel.C
index 3c24ec0..a3a6461 100644
--- a/storageaddsel.C
+++ b/storageaddsel.C
@@ -196,6 +196,7 @@ finish:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
     sd_bus_message_unref(reply);
+    m = NULL; reply = NULL;
     return r;
 }
 
diff --git a/transporthandler.C b/transporthandler.C
index d43f1f9..3f85e74 100644
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
@@ -112,84 +102,70 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
+    sd_bus_message_unref(reply);
+    reply = NULL;
+
+    return (r < 0) ? -1 : rc;
 }
 
 struct get_lan_t {
@@ -206,7 +182,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
     sd_bus *bus = ipmid_get_sd_bus_connection();
-    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_message *reply = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     int r = 0;
     const uint8_t current_revision = 0x11; // Current rev per IPMI Spec 2.0
@@ -259,32 +235,27 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
         rc = sd_bus_message_enter_container (reply, 'a', "(iyyus)");
         if(rc < 0)
         {
             fprintf(stderr, "Failed to parse response message:[%s]\n", strerror(-rc));
-            return -1;
+            rc = -1;
+            goto finish;
         }
         rc = sd_bus_message_read(reply, "(iyyus)", &family, &prefixlen, &scope, &flags, &saddr);
         if (rc < 0)
         {
             fprintf(stderr, "Failed to receive response: %s\n", strerror(-r));
-            return -1;
+            rc = -1;
+            goto finish;
         }
 
         printf("%s:%d:%d:%d:%s\n", family==AF_INET?"IPv4":"IPv6", prefixlen, scope, flags, saddr);
@@ -297,7 +268,8 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         if (digit == NULL)
         {
             fprintf(stderr, "Unexpected IP format: %s", saddr);
-            return IPMI_CC_RESPONSE_ERROR;
+            rc = IPMI_CC_RESPONSE_ERROR;
+            goto finish;
         }
         i = 0;
         while (digit != NULL)
@@ -311,7 +283,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         *data_len = sizeof(buf);
         memcpy(response, &buf, *data_len);
 
-        return IPMI_CC_OK;
+        rc = IPMI_CC_OK;
     }
     else if (reqptr->parameter == LAN_PARM_MAC)
     {
@@ -321,30 +293,26 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
@@ -354,7 +322,8 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
         if (digit == NULL)
         {
             fprintf(stderr, "Unexpected MAC format: %s", eaddr1);
-            return IPMI_CC_RESPONSE_ERROR;
+            rc = IPMI_CC_RESPONSE_ERROR;
+            goto finish;
         }
 
         i=0;
@@ -369,14 +338,19 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
+    sd_bus_message_unref(reply);
+    reply = NULL;
+
     return rc;
 }
 
-- 
2.7.1
