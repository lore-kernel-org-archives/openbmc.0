Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 55AE31A04E2
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2015 09:39:56 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445639990479922.0655723775286;
 Fri, 23 Oct 2015 15:39:50 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Add Get Device UUID
Date: Fri, 23 Oct 2015 17:25:14 -0500
Message-Id: <1445639114-8724-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445639114-8724-1-git-send-email-patches@stwcx.xyz>
References: <1445639114-8724-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 23 Oct 2015 22:39:56 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add support to get the UUID and return it in the specified
format per the IPMI Spec 2.0
---
 apphandler.C | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 apphandler.h |  1 +
 ipmid-api.h  |  7 +++--
 3 files changed, 95 insertions(+), 3 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index 40cd79d..53c7ac2 100755
--- a/apphandler.C
+++ b/apphandler.C
@@ -58,6 +58,93 @@ ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+ipmi_ret_t ipmi_app_get_device_guid(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    const char  *busname = "org.openbmc.control.Chassis";
+    const char  *objname = "/org/openbmc/control/chassis0";
+    const char  *iface = "org.openbmc.control.Chassis";
+    sd_bus_message *reply = NULL, *m = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    int r = 0;
+    char *uuid = NULL;
+
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    printf("IPMI GET DEVICE GUID\n");
+
+    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"getID");
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the start method object: %s\n", strerror(-r));
+        return IPMI_CC_UNSPECIFIED_ERROR;
+    }
+    r = sd_bus_call(bus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the start method: %s\n", strerror(-r));
+        return IPMI_CC_UNSPECIFIED_ERROR;
+    }
+    r = sd_bus_message_read(reply, "s", &uuid);
+    if (r < 0) {
+        fprintf(stderr, "Failed to get a response: %s", strerror(-r));
+        return IPMI_CC_RESPONSE_ERROR;
+    }
+    if (uuid == NULL)
+    {
+        fprintf(stderr, "Failed to get a valid response: %s", strerror(-r));
+        return IPMI_CC_RESPONSE_ERROR;
+    }
+
+    // UUID is in RFC4122 format. Ex: 61a39523-78f2-11e5-9862-e6402cfc3223
+    // Per IPMI Spec 2.0 need to convert to 16 hex bytes and reverse the byte order
+    // Ex: 0x2332fc2c40e66298e511f2782395a361
+
+    const int resp_size = 16; // Response is 16 hex bytes per IPMI Spec
+    uint8_t resp_uuid[resp_size]; // Array to hold the formatted response
+    int resp_loc = resp_size-1; // Point resp end of array to save in reverse order
+    int i = 0;
+
+    // Traverse the UUID
+    char* id_octet = strtok(uuid, "-"); // Get the UUID octects separated by dash
+
+    if (id_octet == NULL)
+    { // Error
+        fprintf(stderr, "Unexpected UUID format: %s", uuid);
+        return IPMI_CC_RESPONSE_ERROR;
+    }
+
+    while (id_octet != NULL)
+    {
+        // Calculate the octet string size since it varies
+        // Divide it by 2 for the array size since 1 byte is built from 2 chars
+        int tmp_size = strlen(id_octet)/2;
+
+        for(i = 0; i < tmp_size; i++)
+        {
+            char tmp_array[3]; // Holder of the 2 chars that will become a byte
+            strncpy(tmp_array, id_octet, 2); // 2 chars at a time
+
+            int resp_byte = strtoul(tmp_array, NULL, 16); // Convert to hex byte
+            memcpy((void*)&resp_uuid[resp_loc], &resp_byte, 1); // Copy end to first
+            resp_loc--;
+            id_octet+=2; // Finished with the 2 chars, advance
+        }
+        id_octet=strtok(NULL, "-"); // Get next octet
+    }
+
+    // Data length
+    *data_len = resp_size;
+
+    // Pack the actual response
+    memcpy(response, &resp_uuid, *data_len);
+
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+
+    return rc;
+}
 
 ipmi_ret_t ipmi_app_get_bt_capabilities(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
@@ -252,6 +339,9 @@ void register_netfn_app_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_DEVICE_ID);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_ID, NULL, ipmi_app_get_device_id);
 
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_DEVICE_GUID);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_GUID, NULL, ipmi_app_get_device_guid);
+
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_SET_ACPI);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_ACPI, NULL, ipmi_app_set_acpi_power_state);
 
diff --git a/apphandler.h b/apphandler.h
index 2957437..35a2b20 100644
--- a/apphandler.h
+++ b/apphandler.h
@@ -7,6 +7,7 @@ enum ipmi_netfn_app_cmds
     // Get capability bits
     IPMI_CMD_GET_DEVICE_ID          = 0x01,
     IPMI_CMD_SET_ACPI               = 0x06,
+    IPMI_CMD_GET_DEVICE_GUID        = 0x08,
     IPMI_CMD_RESET_WD               = 0x22,
     IPMI_CMD_SET_WD                 = 0x24,
     IPMI_CMD_SET_BMC_GLOBAL_ENABLES = 0x2E,
diff --git a/ipmid-api.h b/ipmid-api.h
index f028e7f..aa54dd7 100755
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -82,14 +82,15 @@ enum ipmi_netfn_wild_card_cmd
     IPMI_CMD_WILDCARD       = 0xFF,
 };
 
-// Return codes from a IPMI operation as needed by IPMI V2.0 spec.
+// Return (completion) codes from a IPMI operation as needed by IPMI V2.0 spec.
 enum ipmi_return_codes
 {
     IPMI_CC_OK = 0x00,
     IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT = 0x80,
     IPMI_CC_INVALID = 0xC1,
-    IPMI_CC_SENSOR_INVALID = 0xCB
-
+    IPMI_CC_SENSOR_INVALID = 0xCB,
+    IPMI_CC_RESPONSE_ERROR = 0xCE,
+    IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
 };
 
 #endif
-- 
2.6.0
