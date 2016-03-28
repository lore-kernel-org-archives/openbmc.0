Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qYkzc1dw9zDqFZ
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2016 06:50:52 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1459194645238297.0541867460719;
 Mon, 28 Mar 2016 12:50:45 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid] Support for restricted mode for IPMI
 commands
Date: Mon, 28 Mar 2016 14:50:42 -0500
Message-Id: <1459194642-16791-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1459194642-16791-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459194642-16791-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 28 Mar 2016 19:50:52 -0000

From: tomjose <tomjoseph@in.ibm.com>

---
 apphandler.C       | 13 +++++++++++++
 chassishandler.C   |  8 ++++++++
 globalhandler.C    |  9 ++++++++-
 ipmid-api.h        |  1 +
 ipmid.C            | 51 +++++++++++++++++++++++++++++++++++++++++++++++++--
 sensorhandler.C    |  6 ++++++
 storagehandler.C   |  7 +++++++
 transporthandler.C | 13 ++++++++++++-
 8 files changed, 104 insertions(+), 4 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index fc6c811..d5ed849 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -7,6 +7,7 @@
 #include <systemd/sd-bus.h>
 
 extern sd_bus *bus;
+extern bool restricted_mode;
 
 void register_netfn_app_functions() __attribute__((constructor));
 
@@ -88,6 +89,12 @@ ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
 
@@ -395,6 +402,12 @@ ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
index fca3c79..b681a4d 100644
--- a/chassishandler.C
+++ b/chassishandler.C
@@ -9,6 +9,8 @@ const char  *chassis_bus_name      =  "org.openbmc.control.Chassis";
 const char  *chassis_object_name   =  "/org/openbmc/control/chassis0";
 const char  *chassis_intf_name     =  "org.openbmc.control.Chassis";
 
+extern bool restricted_mode;
+
 
 void register_netfn_chassis_functions() __attribute__((constructor));
 
@@ -240,6 +242,12 @@ ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
index 2d3af92..03cf6f0 100644
--- a/globalhandler.C
+++ b/globalhandler.C
@@ -4,6 +4,8 @@
 #include <string.h>
 #include <stdint.h>
 
+extern bool restricted_mode;
+
 const char  *control_object_name  =  "/org/openbmc/control/bmc0";
 const char  *control_intf_name    =  "org.openbmc.control.Bmc";
 
@@ -131,14 +133,19 @@ ipmi_ret_t ipmi_global_warm_reset(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
index e635528..a952b68 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -94,6 +94,7 @@ enum ipmi_return_codes
     IPMI_CC_PARM_OUT_OF_RANGE = 0xC9,
     IPMI_CC_SENSOR_INVALID = 0xCB,
     IPMI_CC_RESPONSE_ERROR = 0xCE,
+    IPMI_CC_INSUFFICIENT_PRIVILEGE = 0xD4,
     IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
 };
 
diff --git a/ipmid.C b/ipmid.C
index 728ba0b..cb165bb 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -15,6 +15,8 @@
 
 sd_bus *bus = NULL;
 sd_bus_slot *ipmid_slot = NULL;
+// If restricted_mode is true, then only IPMI whitelisted commands are executed
+bool restricted_mode = false;
 
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
@@ -231,6 +236,39 @@ final:
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
@@ -426,6 +464,15 @@ int main(int argc, char *argv[])
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
index bb14e7a..d1c45bc 100644
--- a/sensorhandler.C
+++ b/sensorhandler.C
@@ -8,6 +8,7 @@
 extern int updateSensorRecordFromSSRAESC(const void *);
 extern int find_interface_property_fru_type(dbus_interface_t *interface, const char *property_name, char *property_value) ;
 extern int find_openbmc_path(const char *type, const uint8_t num, dbus_interface_t *interface) ;
+extern bool restricted_mode;
 
 void register_netfn_sen_functions()   __attribute__((constructor));
 
@@ -235,6 +236,11 @@ ipmi_ret_t ipmi_sen_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
index 020a0c9..8e7b71a 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -9,6 +9,8 @@
 #include "storageaddsel.h"
 #include "ipmid-api.h"
 
+extern bool restricted_mode;
+
 void register_netfn_storage_functions() __attribute__((constructor));
 
 
@@ -23,6 +25,11 @@ ipmi_ret_t ipmi_storage_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
index 3b4cf07..959098d 100644
--- a/transporthandler.C
+++ b/transporthandler.C
@@ -35,7 +35,7 @@ const uint8_t SET_IN_PROGRESS_RESERVED = 3; //Reserved
 // Status of Set-In-Progress Parameter (# 0)
 uint8_t lan_set_in_progress = SET_COMPLETE;
 
-
+extern bool restricted_mode;
 
 void register_netfn_transport_functions() __attribute__((constructor));
 
@@ -130,6 +130,12 @@ ipmi_ret_t ipmi_transport_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
 
@@ -152,6 +158,11 @@ ipmi_ret_t ipmi_transport_set_lan(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 
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
