Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 019E41A065B
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 04:48:31 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444758507890473.5651633404872;
 Tue, 13 Oct 2015 10:48:27 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 8/8] Add support for the the dcmi
 package
Date: Tue, 13 Oct 2015 12:48:07 -0500
Message-Id: <1444758487-9135-9-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444758487-9135-1-git-send-email-patches@stwcx.xyz>
References: <1444758487-9135-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 13 Oct 2015 17:48:32 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile      |  1 +
 dcmihandler.C | 40 ++++++++++++++++++++++++++++++++++++++++
 dcmihandler.h | 12 ++++++++++++
 ipmid-api.h   |  1 +
 4 files changed, 54 insertions(+)
 create mode 100644 dcmihandler.C
 create mode 100644 dcmihandler.h

diff --git a/Makefile b/Makefile
index 93d3256..2177c9d 100755
--- a/Makefile
+++ b/Makefile
@@ -5,6 +5,7 @@ DAEMON_OBJ  = $(DAEMON).o
 LIB_APP_OBJ = apphandler.o     \
               sensorhandler.o  \
               storagehandler.o \
+              dcmihandler.o
 
 LIB_APP     = libapphandler.so
 
diff --git a/dcmihandler.C b/dcmihandler.C
new file mode 100644
index 0000000..fafebdc
--- /dev/null
+++ b/dcmihandler.C
@@ -0,0 +1,40 @@
+#include "dcmihandler.h"
+#include "ipmid-api.h"
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+void register_netfn_dcmi_functions() __attribute__((constructor));
+
+
+ipmi_ret_t ipmi_dcmi_get_power_limit(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT;
+
+    // dcmi-v1-5-rev-spec.pdf 6.6.2.   
+    // This is good enough for OpenBMC support for OpenPOWER based systems
+    // TODO research if more is needed
+    uint8_t data_response[] = { 0xDC, 0x00, 0x00, 0x01, 0x00, 0x00, 
+                                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
+                                0x00, 0x01};
+
+
+
+    printf("IPMI DCMI_GET_POWER_LEVEL\n");
+
+    memcpy(response, data_response, sizeof(data_response));
+    *data_len = sizeof(data_response);
+
+    return rc;
+}
+
+
+void register_netfn_dcmi_functions()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_GRPEXT, IPMI_CMD_DCMI_GET_POWER);
+    ipmi_register_callback(NETFUN_GRPEXT, IPMI_CMD_DCMI_GET_POWER, NULL, ipmi_dcmi_get_power_limit);
+    return;
+}
+// 956379
\ No newline at end of file
diff --git a/dcmihandler.h b/dcmihandler.h
new file mode 100644
index 0000000..5fc0c10
--- /dev/null
+++ b/dcmihandler.h
@@ -0,0 +1,12 @@
+#ifndef __HOST_IPMI_DCMI_HANDLER_H__
+#define __HOST_IPMI_DCMI_HANDLER_H__
+
+// IPMI commands for net functions.
+enum ipmi_netfn_sen_cmds
+{
+    // Get capability bits
+    IPMI_CMD_DCMI_GET_POWER = 0x03,
+    
+};
+
+#endif
diff --git a/ipmid-api.h b/ipmid-api.h
index 615e0d5..caf18e8 100755
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -85,6 +85,7 @@ enum ipmi_netfn_wild_card_cmd
 enum ipmi_return_codes
 {
     IPMI_CC_OK = 0x00,
+    IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT = 0x80,
     IPMI_CC_INVALID = 0xC1
 };
 
-- 
2.6.0
