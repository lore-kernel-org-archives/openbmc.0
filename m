Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qgbdr6QLDzDq64
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2016 18:40:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460018439209164.93474485194986;
 Thu, 7 Apr 2016 01:40:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2] Support for restricted mode for IPMI
 commands
Date: Thu,  7 Apr 2016 03:40:36 -0500
Message-Id: <1460018436-21243-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460018436-21243-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460018436-21243-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 07 Apr 2016 08:40:49 -0000

From: tomjose <tomjoseph@in.ibm.com>

---
 apphandler.C       | 12 ++++++++++++
 chassishandler.C   |  7 ++++++-
 globalhandler.C    |  7 ++++++-
 ipmid-api.h        |  4 ++++
 ipmid.C            | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 sensorhandler.C    |  5 +++++
 storagehandler.C   |  5 +++++
 transporthandler.C | 13 +++++++++++--
 8 files changed, 100 insertions(+), 6 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index fc6c811..1dafec6 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -88,6 +88,12 @@ ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     *data_len = 0;
 
     printf("IPMI SET ACPI STATE Ignoring for now\n");
+
+    if(restricted_mode)
+    {
+        return IPMI_CC_INSUFFICIENT_PRIVILEGE;
+    }
+
     return rc;
 }
 
@@ -395,6 +401,12 @@ ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
 
+    if(restricted_mode)
+    {
+        *data_len = 0;
+        return IPMI_CC_INSUFFICIENT_PRIVILEGE;
+    }
+
     *data_len = strlen("THIS IS WILDCARD");
 
     // Now pack actual response
diff --git a/chassishandler.C b/chassishandler.C
index fca3c79..d89dc20 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -9,7 +9,6 @@ const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
 const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
 const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
 
-
 void register_netfn_chassis_functions() __attribute__((constructor));
 
 // Host settings in dbus
@@ -240,6 +239,12 @@ ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
+
+    if(restricted_mode)
+    {
+        return IPMI_CC_INSUFFICIENT_PRIVILEGE;
+    }
+
     return rc;
 }
 
diff --git a/globalhandler.C b/globalhandler.C
index 2d3af92..5d78203 100644
--- a/globalhandler.C
+++ b/globalhandler.C
@@ -131,14 +131,19 @@ ipmi_ret_t ipmi_global_warm_reset(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                               ipmi_request_t request, ipmi_response_t response,
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
+    *data_len = 0;
     printf("Handling GLOBAL warmReset Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
 
+    if(restricted_mode)
+    {
+        return IPMI_CC_INSUFFICIENT_PRIVILEGE;
+    }
+
     // TODO: call the correct dbus method for warmReset.
     dbus_warm_reset();
 
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
-    *data_len = 0;
     return rc;
 }
 
diff --git a/ipmid-api.h b/ipmid-api.h
index e635528..92f93fb 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -94,12 +94,16 @@ enum ipmi_return_codes
     IPMI_CC_PARM_OUT_OF_RANGE = 0xC9,
     IPMI_CC_SENSOR_INVALID = 0xCB,
     IPMI_CC_RESPONSE_ERROR = 0xCE,
+    IPMI_CC_INSUFFICIENT_PRIVILEGE = 0xD4,
     IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
 };
 
 sd_bus *ipmid_get_sd_bus_connection(void);
 sd_bus_slot *ipmid_get_sd_bus_slot(void);
 
+// If restricted_mode is true, then only IPMI whitelisted commands are executed
+extern uint8_t restricted_mode;
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/ipmid.C b/ipmid.C
index 728ba0b..3daf225 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -15,6 +15,8 @@
 
 sd_bus *bus = NULL;
 sd_bus_slot *ipmid_slot = NULL;
+// Initialise to restricted mode
+uint8_t restricted_mode = true;
 
 FILE *ipmiio, *ipmidbus, *ipmicmddetails;
 
@@ -26,12 +28,15 @@ void print_usage(void) {
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
 typedef std::pair<ipmid_callback_t, ipmi_context_t> ipmi_fn_context_t;
@@ -231,6 +236,41 @@ final:
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
@@ -426,6 +466,15 @@ int main(int argc, char *argv[])
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
index bb14e7a..c133930 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -235,6 +235,11 @@ ipmi_ret_t ipmi_sen_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     printf("IPMI S/E Wildcard Netfn:[0x%X], Cmd:[0x%X]\n",netfn,cmd);
     *data_len = 0;
 
+    if(restricted_mode)
+    {
+        return IPMI_CC_INSUFFICIENT_PRIVILEGE;
+    }
+
     return rc;
 }
 
diff --git a/storagehandler.C b/storagehandler.C
index 020a0c9..f868f0d 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -23,6 +23,11 @@ ipmi_ret_t ipmi_storage_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
+
+    if(restricted_mode)
+    {
+        return IPMI_CC_INSUFFICIENT_PRIVILEGE;
+    }
     return rc;
 }
 
diff --git a/transporthandler.C b/transporthandler.C
index 3b4cf07..d9858aa 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -35,8 +35,6 @@ const uint8_t SET_IN_PROGRESS_RESERVED = 3; //Reserved
 // Status of Set-In-Progress Parameter (# 0)
 uint8_t lan_set_in_progress = SET_COMPLETE;
 
-
-
 void register_netfn_transport_functions() __attribute__((constructor));
 
 // Helper Function to get IP Address/NetMask/Gateway from Network Manager or Cache
@@ -130,6 +128,12 @@ ipmi_ret_t ipmi_transport_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
     *data_len = 0;
+
+    if(restricted_mode)
+    {
+        return IPMI_CC_INSUFFICIENT_PRIVILEGE;
+    }
+
     return rc;
 }
 
@@ -152,6 +156,11 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
     printf("IPMI SET_LAN\n");
 
+    if(restricted_mode)
+    {
+        return IPMI_CC_INSUFFICIENT_PRIVILEGE;
+    }
+
     set_lan_t *reqptr = (set_lan_t*) request;
 
     // TODO Use dbus interface once available. For now use cmd line.
-- 
2.7.1
