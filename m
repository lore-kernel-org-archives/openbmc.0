Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DF5581A0291
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2016 13:10:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454724628349720.7444128578412;
 Fri, 5 Feb 2016 18:10:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Add minimal support for ipmitool
Date: Fri,  5 Feb 2016 20:10:26 -0600
Message-Id: <1454724626-7200-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454724626-7200-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454724626-7200-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 06 Feb 2016 02:10:33 -0000

From: Chris Austen <austenc@us.ibm.com>

Adding just a couple of ipmi commands that ipmitool always calls.
I'm doing this because in order to run the ipmitool lan 1 <parms>
instead of just the raw command the get channel info was needed.
---
 Makefile     |  3 ++-
 apphandler.C | 44 ++++++++++++++++++++++++++++++++++++++++++++
 apphandler.h |  2 ++
 groupext.C   | 31 +++++++++++++++++++++++++++++++
 ipmid-api.h  |  1 +
 5 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 groupext.C

diff --git a/Makefile b/Makefile
index 58e7310..7a3b6af 100644
--- a/Makefile
+++ b/Makefile
@@ -15,7 +15,8 @@ LIB_APP_OBJ = apphandler.o     \
               ipmisensor.o     \
               storageaddsel.o  \
               transporthandler.o  \
-              globalhandler.o  
+              globalhandler.o  \
+              groupext.o
 
 LIB_HOST_SRV_OBJ = host-services.o
 
diff --git a/apphandler.C b/apphandler.C
index 2c9ce6b..a48059f 100644
--- a/apphandler.C
+++ b/apphandler.C
@@ -351,6 +351,44 @@ ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+// ATTENTION: This ipmi function is very hardcoded on purpose
+// OpenBMC does not fully support IPMI.  This command is useful
+// to have around because it enables testing of interfaces with
+// the IPMI tool.
+#define GET_CHANNEL_INFO_CHANNEL_OFFSET 0
+// IPMI Table 6-2
+#define IPMI_CHANNEL_TYPE_IPMB 1
+// IPMI Table 6-3
+#define IPMI_CHANNEL_MEDIUM_TYPE_OTHER 6
+
+ipmi_ret_t ipmi_app_channel_info(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+    uint8_t resp[] = {
+        1,
+        IPMI_CHANNEL_MEDIUM_TYPE_OTHER,
+        IPMI_CHANNEL_TYPE_IPMB,
+        1,0x41,0xA7,0x00,0,0};
+    uint8_t *p = (uint8_t*) request;
+
+    printf("IPMI APP GET CHANNEL INFO\n");
+
+    // I"m only supporting channel 1.  0xE is the 'default channel'
+    if (*p == 0xe || *p == 1) {
+
+        *data_len = sizeof(resp);
+        memcpy(response, resp, *data_len);
+
+    } else {
+        rc = IPMI_CC_PARM_OUT_OF_RANGE;
+        *data_len = 0;
+    }
+
+    return rc;
+}
+
 ipmi_ret_t ipmi_app_set_bmc_global_enables(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                              ipmi_request_t request, ipmi_response_t response,
                              ipmi_data_len_t data_len, ipmi_context_t context)
@@ -417,6 +455,12 @@ void register_netfn_app_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_MSG_FLAGS);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_MSG_FLAGS, NULL, ipmi_app_get_msg_flags);
 
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_CHAN_INFO);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CHAN_INFO, NULL, ipmi_app_channel_info);
+
+
+
     return;
 }
 
diff --git a/apphandler.h b/apphandler.h
index aa2a55d..a17ee7f 100644
--- a/apphandler.h
+++ b/apphandler.h
@@ -27,6 +27,8 @@ enum ipmi_netfn_app_cmds
     IPMI_CMD_GET_MSG_FLAGS          = 0x31,
     IPMI_CMD_READ_EVENT             = 0x35,
     IPMI_CMD_GET_CAP_BIT            = 0x36,
+    IPMI_CMD_GET_CHAN_INFO          = 0x42,
+
 };
 
 // A Mechanism to tell host to shtudown hosts by sending this PEM SEL. Really
diff --git a/groupext.C b/groupext.C
new file mode 100644
index 0000000..b834f9b
--- /dev/null
+++ b/groupext.C
@@ -0,0 +1,31 @@
+#include "ipmid-api.h"
+#include "ipmid.H"
+#include <stdio.h>
+#include <stdint.h>
+
+#define GRPEXT_GET_GROUP_CMD 0
+void register_netfn_groupext_functions() __attribute__((constructor));
+
+ipmi_ret_t ipmi_groupext(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                             ipmi_request_t request, ipmi_response_t response,
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+	// Generic return from IPMI commands.
+    ipmi_ret_t rc = IPMI_CC_OK;
+    uint8_t *p = (uint8_t*) response;
+
+    printf("IPMI GROUP EXTENTIONS\n");
+
+    *data_len = 1;
+    *p = 0;
+
+    return rc;
+}
+
+void register_netfn_groupext_functions()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_GRPEXT, GRPEXT_GET_GROUP_CMD);
+    ipmi_register_callback(NETFUN_GRPEXT, GRPEXT_GET_GROUP_CMD, NULL, ipmi_groupext);
+
+    return;
+}
diff --git a/ipmid-api.h b/ipmid-api.h
index 4f00798..e635528 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -91,6 +91,7 @@ enum ipmi_return_codes
     IPMI_CC_OK = 0x00,
     IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT = 0x80,
     IPMI_CC_INVALID = 0xC1,
+    IPMI_CC_PARM_OUT_OF_RANGE = 0xC9,
     IPMI_CC_SENSOR_INVALID = 0xCB,
     IPMI_CC_RESPONSE_ERROR = 0xCE,
     IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
-- 
2.6.4
