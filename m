Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 413951A0965
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 08:31:44 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 144554949974674.20273864518379;
 Thu, 22 Oct 2015 14:31:39 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Add App Set BMC Global Enables ipmi cmd
Date: Thu, 22 Oct 2015 16:31:37 -0500
Message-Id: <1445549497-2972-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445549497-2972-1-git-send-email-patches@stwcx.xyz>
References: <1445549497-2972-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 21:31:44 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add support for the IPMI cmd Set BMC Global Enables
---
 apphandler.C | 17 +++++++++++++++++
 apphandler.h | 15 ++++++++-------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index 9d53552..132f5c6 100755
--- a/apphandler.C
+++ b/apphandler.C
@@ -188,7 +188,18 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+ipmi_ret_t ipmi_app_set_bmc_global_enables(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
 
+    // Event and message logging enabled by default so return for now
+    printf("IPMI APP SET BMC GLOBAL ENABLES Ignoring for now\n");
+
+    return rc;
+}
 
 
 
@@ -231,6 +242,12 @@ void register_netfn_app_functions()
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_READ_EVENT);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_READ_EVENT, NULL, ipmi_app_read_event);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP,
+                                            IPMI_CMD_SET_BMC_GLOBAL_ENABLES);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_BMC_GLOBAL_ENABLES, NULL,
+                                            ipmi_app_set_bmc_global_enables);
+
     return;
 }
 
diff --git a/apphandler.h b/apphandler.h
index 2c4ea22..2957437 100644
--- a/apphandler.h
+++ b/apphandler.h
@@ -1,16 +1,17 @@
 #ifndef __HOST_IPMI_APP_HANDLER_H__
 #define __HOST_IPMI_APP_HANDLER_H__
 
-// IPMI commands for net functions.
+// IPMI commands for App net functions.
 enum ipmi_netfn_app_cmds
 {
     // Get capability bits
-    IPMI_CMD_RESET_WD       = 0x22,
-    IPMI_CMD_SET_WD         = 0x24,
-    IPMI_CMD_GET_CAP_BIT    = 0x36,
-    IPMI_CMD_GET_DEVICE_ID  = 0x00,
-    IPMI_CMD_SET_ACPI       = 0x06,
-    IPMI_CMD_READ_EVENT     = 0x35,
+    IPMI_CMD_GET_DEVICE_ID          = 0x01,
+    IPMI_CMD_SET_ACPI               = 0x06,
+    IPMI_CMD_RESET_WD               = 0x22,
+    IPMI_CMD_SET_WD                 = 0x24,
+    IPMI_CMD_SET_BMC_GLOBAL_ENABLES = 0x2E,
+    IPMI_CMD_READ_EVENT             = 0x35,
+    IPMI_CMD_GET_CAP_BIT            = 0x36,
 
 };
 
-- 
2.6.0
