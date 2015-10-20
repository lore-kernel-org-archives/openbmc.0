Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BF9361A06C1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:55 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368852186288.8492391911858;
 Tue, 20 Oct 2015 12:20:52 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 1/3] Add App Set BMC Global Enables ipmi
 cmd
Date: Tue, 20 Oct 2015 14:20:46 -0500
Message-Id: <1445368848-31548-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445368848-31548-1-git-send-email-patches@stwcx.xyz>
References: <1445368848-31548-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:56 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

---
 apphandler.C | 17 +++++++++++++++++
 apphandler.h | 16 ++++++++--------
 2 files changed, 25 insertions(+), 8 deletions(-)

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
index 2c4ea22..3b8995c 100644
--- a/apphandler.h
+++ b/apphandler.h
@@ -1,16 +1,16 @@
 #ifndef __HOST_IPMI_APP_HANDLER_H__
 #define __HOST_IPMI_APP_HANDLER_H__
 
-// IPMI commands for net functions.
+// IPMI commands for App net functions.
 enum ipmi_netfn_app_cmds
 {
-    // Get capability bits
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
