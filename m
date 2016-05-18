Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r911T4kFVzDqD3
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 03:10:53 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463591444968758.575773989515;
 Wed, 18 May 2016 10:10:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid v3] Support for restricted mode for IPMI
 commands
Date: Wed, 18 May 2016 12:10:40 -0500
Message-Id: <1463591440-32553-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463591440-32553-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463591440-32553-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 17:10:55 -0000

From: tomjose <tomjoseph@in.ibm.com>

---
 apphandler.C       | 23 +++++++++--------
 chassishandler.C   | 10 ++++----
 dcmihandler.C      |  4 +--
 globalhandler.C    |  4 +--
 groupext.C         |  2 +-
 ipmid-api.h        | 13 ++++++++--
 ipmid.C            | 73 ++++++++++++++++++++++++++++++++++++++++++++++++------
 sensorhandler.C    |  8 +++---
 storagehandler.C   | 13 +++++-----
 transporthandler.C |  9 +++----
 10 files changed, 114 insertions(+), 45 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index 71dba66..215eff3 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -92,6 +92,7 @@ ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     *data_len = 0;
 
     printf("IPMI SET ACPI STATE Ignoring for now\n");
+
     return rc;
 }
 
@@ -492,40 +493,40 @@ ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 void register_netfn_app_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_CAP_BIT);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_get_bt_capabilities);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_get_bt_capabilities, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WILDCARD);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_app_wildcard_handler);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_app_wildcard_handler, IPMI_BLACKLISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_RESET_WD);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_RESET_WD, NULL, ipmi_app_reset_watchdog);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_RESET_WD, NULL, ipmi_app_reset_watchdog, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_SET_WD);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_WD, NULL, ipmi_app_set_watchdog);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_WD, NULL, ipmi_app_set_watchdog, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_DEVICE_ID);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_ID, NULL, ipmi_app_get_device_id);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_ID, NULL, ipmi_app_get_device_id, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_DEVICE_GUID);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_GUID, NULL, ipmi_app_get_device_guid);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_GUID, NULL, ipmi_app_get_device_guid, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_SET_ACPI);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_ACPI, NULL, ipmi_app_set_acpi_power_state);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_ACPI, NULL, ipmi_app_set_acpi_power_state, IPMI_BLACKLISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_READ_EVENT);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_READ_EVENT, NULL, ipmi_app_read_event);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_READ_EVENT, NULL, ipmi_app_read_event, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP,
                                             IPMI_CMD_SET_BMC_GLOBAL_ENABLES);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_BMC_GLOBAL_ENABLES, NULL,
-                                            ipmi_app_set_bmc_global_enables);
+                                            ipmi_app_set_bmc_global_enables, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_MSG_FLAGS);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_MSG_FLAGS, NULL, ipmi_app_get_msg_flags);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_MSG_FLAGS, NULL, ipmi_app_get_msg_flags, IPMI_WHITELISTED_COMMAND);
 
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_CHAN_INFO);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CHAN_INFO, NULL, ipmi_app_channel_info);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CHAN_INFO, NULL, ipmi_app_channel_info, IPMI_WHITELISTED_COMMAND);
 
 
 
diff --git a/chassishandler.C b/chassishandler.C
index fca3c79..231c480 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -9,7 +9,6 @@ const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
 const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
 const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
 
-
 void register_netfn_chassis_functions() __attribute__((constructor));
 
 // Host settings in dbus
@@ -240,6 +239,7 @@ ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
+
     return rc;
 }
 
@@ -474,15 +474,15 @@ ipmi_ret_t ipmi_chassis_set_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 void register_netfn_chassis_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_WILDCARD);
-    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_WILDCARD, NULL, ipmi_chassis_wildcard);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_WILDCARD, NULL, ipmi_chassis_wildcard, IPMI_BLACKLISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
-    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL);
-    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_CHASSIS_CONTROL, NULL, ipmi_chassis_control, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS);
-    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_set_sys_boot_options);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_SET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_set_sys_boot_options, IPMI_WHITELISTED_COMMAND);
 }
 
diff --git a/dcmihandler.C b/dcmihandler.C
index fafebdc..cc03807 100644
--- a/dcmihandler.C
+++ b/dcmihandler.C
@@ -34,7 +34,7 @@ ipmi_ret_t ipmi_dcmi_get_power_limit(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 void register_netfn_dcmi_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_GRPEXT, IPMI_CMD_DCMI_GET_POWER);
-    ipmi_register_callback(NETFUN_GRPEXT, IPMI_CMD_DCMI_GET_POWER, NULL, ipmi_dcmi_get_power_limit);
+    ipmi_register_callback(NETFUN_GRPEXT, IPMI_CMD_DCMI_GET_POWER, NULL, ipmi_dcmi_get_power_limit, IPMI_WHITELISTED_COMMAND);
     return;
 }
-// 956379
\ No newline at end of file
+// 956379
diff --git a/globalhandler.C b/globalhandler.C
index 2d3af92..49e6668 100644
--- a/globalhandler.C
+++ b/globalhandler.C
@@ -131,6 +131,7 @@ ipmi_ret_t ipmi_global_warm_reset(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                               ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
+    *data_len = 0;
     printf("Handling GLOBAL warmReset Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
 
     // TODO: call the correct dbus method for warmReset.
@@ -138,7 +139,6 @@ ipmi_ret_t ipmi_global_warm_reset(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
-    *data_len = 0;
     return rc;
 }
 
@@ -146,7 +146,7 @@ ipmi_ret_t ipmi_global_warm_reset(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 void register_netfn_global_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WARM_RESET);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WARM_RESET, NULL, ipmi_global_warm_reset);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WARM_RESET, NULL, ipmi_global_warm_reset, IPMI_BLACKLISTED_COMMAND);
 
     return;
 }
diff --git a/groupext.C b/groupext.C
index b834f9b..bb40b2f 100644
--- a/groupext.C
+++ b/groupext.C
@@ -25,7 +25,7 @@ ipmi_ret_t ipmi_groupext(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 void register_netfn_groupext_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_GRPEXT, GRPEXT_GET_GROUP_CMD);
-    ipmi_register_callback(NETFUN_GRPEXT, GRPEXT_GET_GROUP_CMD, NULL, ipmi_groupext);
+    ipmi_register_callback(NETFUN_GRPEXT, GRPEXT_GET_GROUP_CMD, NULL, ipmi_groupext, IPMI_WHITELISTED_COMMAND);
 
     return;
 }
diff --git a/ipmid-api.h b/ipmid-api.h
index e635528..1d5e93e 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -54,9 +54,10 @@ typedef ipmi_ret_t (*ipmid_callback_t)(ipmi_netfn_t, ipmi_cmd_t, ipmi_request_t,
 
 // This is the constructor function that is called into by each plugin handlers.
 // When ipmi sets up the callback handlers, a call is made to this with
-// information of netfn, cmd, callback handler pointer and context data.
+// information of netfn, cmd, callback handler pointer ,context data and command
+// flag mentioning whether the command is whitelisted.
 void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,
-                                       ipmi_context_t, ipmid_callback_t);
+                                       ipmi_context_t, ipmid_callback_t, int);
 
 // These are the command network functions, the response
 // network functions are the function + 1. So to determine
@@ -94,12 +95,20 @@ enum ipmi_return_codes
     IPMI_CC_PARM_OUT_OF_RANGE = 0xC9,
     IPMI_CC_SENSOR_INVALID = 0xCB,
     IPMI_CC_RESPONSE_ERROR = 0xCE,
+    IPMI_CC_INSUFFICIENT_PRIVILEGE = 0xD4,
     IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
 };
 
 sd_bus *ipmid_get_sd_bus_connection(void);
 sd_bus_slot *ipmid_get_sd_bus_slot(void);
 
+// In restricted mode only whitelisted commands are executed.
+enum ipmi_command_flag
+{
+    IPMI_WHITELISTED_COMMAND = 0x00,
+    IPMI_BLACKLISTED_COMMAND = 0x01,
+};
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/ipmid.C b/ipmid.C
index 728ba0b..0dda312 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -15,6 +15,8 @@
 
 sd_bus *bus = NULL;
 sd_bus_slot *ipmid_slot = NULL;
+// Initialise to restricted mode
+uint8_t restricted_mode = true;
 
 FILE *ipmiio, *ipmidbus, *ipmicmddetails;
 
@@ -26,15 +28,18 @@ void print_usage(void) {
   fprintf(stderr, "    mask : 0xFF - Print all trace\n");
 }
 
-
+// Host settings in DBUS
+const char *settings_host_app = "org.openbmc.settings.Host";
+const char *settings_host_object = "/org/openbmc/settings/host0";
+const char *settings_host_intf = "org.freedesktop.DBus.Properties";
 
 const char * DBUS_INTF = "org.openbmc.HostIpmi";
 
 const char * FILTER = "type='signal',interface='org.openbmc.HostIpmi',member='ReceivedMessage'";
-
+const char * RESTRICTED_MODE_FILTER = "type='signal',interface='org.freedesktop.DBus.Properties',path='/org/openbmc/settings/host0'";
 
 typedef std::pair<ipmi_netfn_t, ipmi_cmd_t> ipmi_fn_cmd_t;
-typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
+typedef std::tuple<ipmid_callback_t, ipmi_context_t, int> ipmi_fn_context_t;
 
 // Global data structure that contains the IPMI command handler's registrations.
 std::map<ipmi_fn_cmd_t, ipmi_fn_context_t> g_ipmid_router_map;
@@ -92,13 +97,13 @@ void hexdump(FILE *s, void *mem, size_t len)
 
 // Method that gets called by shared libraries to get their command handlers registered
 void ipmi_register_callback(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
-                       ipmi_context_t context, ipmid_callback_t handler)
+                       ipmi_context_t context, ipmid_callback_t handler, int restricted_mode)
 {
     // Pack NetFn and Command in one.
     auto netfn_and_cmd = std::make_pair(netfn, cmd);
 
     // Pack Function handler and Data in another.
-    auto handler_and_context = std::make_pair(handler, context);
+    auto handler_and_context = std::make_tuple(handler, context, restricted_mode);
 
     // Check if the registration has already been made..
     auto iter = g_ipmid_router_map.find(netfn_and_cmd);
@@ -152,14 +157,24 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
     // Extract the map data onto appropriate containers
     auto handler_and_context = iter->second;
 
+    // If restricted mode is true and command is not whitelisted, don't
+    // execute the command
+    if(restricted_mode && std::get<2>(handler_and_context))
+    {
+        rc = IPMI_CC_INSUFFICIENT_PRIVILEGE;
+        memcpy(response, &rc, IPMI_CC_LEN);
+        *data_len = IPMI_CC_LEN;
+        return rc;
+    }
+
     // Creating a pointer type casted to char* to make sure we advance 1 byte
     // when we advance pointer to next's address. advancing void * would not
     // make sense.
     char *respo = &((char *)response)[IPMI_CC_LEN];
 
     // Response message from the plugin goes into a byte post the base response
-    rc = (handler_and_context.first) (netfn, cmd, request, respo,
-                                      data_len, handler_and_context.second);
+    rc = (std::get<0>(handler_and_context)) (netfn, cmd, request, respo,
+                                      data_len, std::get<1>(handler_and_context));
 
     // Now copy the return code that we got from handler and pack it in first
     // byte.
@@ -231,6 +246,41 @@ final:
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 }
 
+void cache_restricted_mode()
+{
+    sd_bus *bus = ipmid_get_sd_bus_connection();
+    sd_bus_message *reply = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    int rc = 0;
+
+    rc = sd_bus_call_method(bus, settings_host_app, settings_host_object, settings_host_intf,
+                               "Get", &error, &reply, "ss", settings_host_app, "restricted_mode");
+    if(rc < 0)
+    {
+        fprintf(stderr, "Failed to issue call method: %s\n", strerror(-rc));
+        goto cleanup;
+    }
+
+    rc = sd_bus_message_read(reply, "v", "b", &restricted_mode);
+    if(rc < 0)
+    {
+        fprintf(stderr, "Failed to parse response message: %s\n", strerror(-rc));
+        // Fail-safe to restricted mode
+        restricted_mode = true;
+        goto cleanup;
+    }
+
+cleanup:
+    sd_bus_error_free(&error);
+    reply = sd_bus_message_unref(reply);
+}
+
+static int handle_restricted_mode_change(sd_bus_message *m, void *user_data, sd_bus_error *ret_error)
+{
+    cache_restricted_mode();
+    return 0;
+}
+
 static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
                          *ret_error) {
     int r = 0;
@@ -426,6 +476,15 @@ int main(int argc, char *argv[])
         goto finish;
     }
 
+    // Wait for changes on Restricted mode
+    r = sd_bus_add_match(bus, &ipmid_slot, RESTRICTED_MODE_FILTER, handle_restricted_mode_change, NULL);
+    if (r < 0) {
+        fprintf(stderr, "Failed: sd_bus_add_match: %s : %s\n", strerror(-r), RESTRICTED_MODE_FILTER);
+        goto finish;
+    }
+
+    // Read restricted mode
+    cache_restricted_mode();
 
     for (;;) {
         /* Process requests */
diff --git a/sensorhandler.C b/sensorhandler.C
index bb14e7a..37925b2 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -242,16 +242,16 @@ ipmi_ret_t ipmi_sen_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 void register_netfn_sen_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_WILDCARD);
-    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_WILDCARD, NULL, ipmi_sen_wildcard);
+    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_WILDCARD, NULL, ipmi_sen_wildcard, IPMI_BLACKLISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_TYPE);
-    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_TYPE, NULL, ipmi_sen_get_sensor_type);
+    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_TYPE, NULL, ipmi_sen_get_sensor_type, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_SET_SENSOR);
-    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_SET_SENSOR, NULL, ipmi_sen_set_sensor);
+    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_SET_SENSOR, NULL, ipmi_sen_set_sensor, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_READING);
-    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_READING, NULL, ipmi_sen_get_sensor_reading);
+    ipmi_register_callback(NETFUN_SENSOR, IPMI_CMD_GET_SENSOR_READING, NULL, ipmi_sen_get_sensor_reading, IPMI_WHITELISTED_COMMAND);
 
     return;
 }
diff --git a/storagehandler.C b/storagehandler.C
index 020a0c9..e6331d4 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -23,6 +23,7 @@ ipmi_ret_t ipmi_storage_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
+
     return rc;
 }
 
@@ -148,22 +149,22 @@ ipmi_ret_t ipmi_storage_add_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 void register_netfn_storage_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_WILDCARD);
-    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WILDCARD, NULL, ipmi_storage_wildcard);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WILDCARD, NULL, ipmi_storage_wildcard, IPMI_BLACKLISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_GET_SEL_TIME);
-    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_GET_SEL_TIME, NULL, ipmi_storage_get_sel_time);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_GET_SEL_TIME, NULL, ipmi_storage_get_sel_time, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_SET_SEL_TIME);
-    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_SET_SEL_TIME, NULL, ipmi_storage_set_sel_time);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_SET_SEL_TIME, NULL, ipmi_storage_set_sel_time, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_GET_SEL_INFO);
-    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_GET_SEL_INFO, NULL, ipmi_storage_get_sel_info);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_GET_SEL_INFO, NULL, ipmi_storage_get_sel_info, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_RESERVE_SEL);
-    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_RESERVE_SEL, NULL, ipmi_storage_reserve_sel);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_RESERVE_SEL, NULL, ipmi_storage_reserve_sel, IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_ADD_SEL);
-    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_ADD_SEL, NULL, ipmi_storage_add_sel);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_ADD_SEL, NULL, ipmi_storage_add_sel, IPMI_WHITELISTED_COMMAND);
     return;
 }
 
diff --git a/transporthandler.C b/transporthandler.C
index 3b4cf07..d6d30bc 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -35,8 +35,6 @@ const uint8_t SET_IN_PROGRESS_RESERVED = 3; //Reserved
 // Status of Set-In-Progress Parameter (# 0)
 uint8_t lan_set_in_progress = SET_COMPLETE;
 
-
-
 void register_netfn_transport_functions() __attribute__((constructor));
 
 // Helper Function to get IP Address/NetMask/Gateway from Network Manager or Cache
@@ -130,6 +128,7 @@ ipmi_ret_t ipmi_transport_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
+
     return rc;
 }
 
@@ -383,13 +382,13 @@ cleanup:
 void register_netfn_transport_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_TRANSPORT, IPMI_CMD_WILDCARD);
-    ipmi_register_callback(NETFUN_TRANSPORT, IPMI_CMD_WILDCARD, NULL, ipmi_transport_wildcard);
+    ipmi_register_callback(NETFUN_TRANSPORT, IPMI_CMD_WILDCARD, NULL, ipmi_transport_wildcard, IPMI_BLACKLISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_TRANSPORT, IPMI_CMD_SET_LAN);
-    ipmi_register_callback(NETFUN_TRANSPORT, IPMI_CMD_SET_LAN, NULL, ipmi_transport_set_lan);
+    ipmi_register_callback(NETFUN_TRANSPORT, IPMI_CMD_SET_LAN, NULL, ipmi_transport_set_lan, IPMI_BLACKLISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_TRANSPORT, IPMI_CMD_GET_LAN);
-    ipmi_register_callback(NETFUN_TRANSPORT, IPMI_CMD_GET_LAN, NULL, ipmi_transport_get_lan);
+    ipmi_register_callback(NETFUN_TRANSPORT, IPMI_CMD_GET_LAN, NULL, ipmi_transport_get_lan, IPMI_WHITELISTED_COMMAND);
 
     return;
 }
-- 
2.8.2
