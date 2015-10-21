Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BFBCC1A03C6
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 14:23:38 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445397817020953.8707871679599;
 Tue, 20 Oct 2015 20:23:37 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 4/4] Add Get Device UUID
Date: Tue, 20 Oct 2015 22:23:29 -0500
Message-Id: <1445397809-31483-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445397809-31483-1-git-send-email-patches@stwcx.xyz>
References: <1445397809-31483-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 03:23:39 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

---
 apphandler.C | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 apphandler.h |  1 +
 2 files changed, 48 insertions(+)

diff --git a/apphandler.C b/apphandler.C
index 132f5c6..963a3bb 100755
--- a/apphandler.C
+++ b/apphandler.C
@@ -58,6 +58,50 @@ ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
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
+    char *id = NULL;
+
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    printf("IPMI GET DEVICE GUID\n");
+
+    r = sd_bus_message_new_method_call(bus,&m,busname,objname,iface,"getID");
+    if (r < 0) {
+        fprintf(stderr, "Failed to add the start method object: %s\n", strerror(-r));
+        return -1;
+    }
+    r = sd_bus_call(bus, m, 0, &error, &reply);
+    if (r < 0) {
+        fprintf(stderr, "Failed to call the start method: %s\n", strerror(-r));
+        return -1;
+    }
+    r = sd_bus_message_read(reply, "s", &id);
+    if (r < 0) {
+        fprintf(stderr, "Failed to get a response: %s", strerror(-r));
+        return -1;
+    }
+
+    // Data length
+    *data_len = strlen(id);
+
+    // Pack the actual response
+    memcpy(response, &id, *data_len);
+
+    sd_bus_error_free(&error);
+    sd_bus_message_unref(m);
+
+    return rc;
+}
 
 ipmi_ret_t ipmi_app_get_bt_capabilities(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
@@ -237,6 +281,9 @@ void register_netfn_app_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_DEVICE_ID);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_ID, NULL, ipmi_app_get_device_id);
 
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_DEVICE_GUID);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_GUID, NULL, ipmi_app_get_device_guid);
+
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_SET_ACPI);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_ACPI, NULL, ipmi_app_set_acpi_power_state);
 
diff --git a/apphandler.h b/apphandler.h
index 3b8995c..5ae3c9b 100644
--- a/apphandler.h
+++ b/apphandler.h
@@ -6,6 +6,7 @@ enum ipmi_netfn_app_cmds
 {
     IPMI_CMD_GET_DEVICE_ID          = 0x01,
     IPMI_CMD_SET_ACPI               = 0x06,
+    IPMI_CMD_GET_DEVICE_GUID        = 0x08,
     IPMI_CMD_RESET_WD               = 0x22,
     IPMI_CMD_SET_WD                 = 0x24,
     IPMI_CMD_SET_BMC_GLOBAL_ENABLES = 0x2E,
-- 
2.6.0
