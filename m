Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8D2C71A01C9
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2015 06:20:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447183225548370.72133519689464;
 Tue, 10 Nov 2015 11:20:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Add support for IPMI Get Boot Options
 command
Date: Tue, 10 Nov 2015 14:20:24 -0500
Message-Id: <1447183224-2548-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447183224-2548-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447183224-2548-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 Nov 2015 19:20:31 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Create new Chassis NetFn file and add basic support
for OPAL to call the IPMI Get Boot Options command.
---
 Makefile         |  1 +
 chassishandler.C | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 chassishandler.h | 17 ++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 chassishandler.C
 create mode 100644 chassishandler.h

diff --git a/Makefile b/Makefile
index 97c45e6..1a37c0f 100644
--- a/Makefile
+++ b/Makefile
@@ -11,6 +11,7 @@ DAEMON_OBJ  = $(DAEMON).o
 LIB_APP_OBJ = apphandler.o     \
               sensorhandler.o  \
               storagehandler.o \
+              chassishandler.o \
               dcmihandler.o    \
               ipmisensor.o     \
               storageaddsel.o  \
diff --git a/chassishandler.C b/chassishandler.C
new file mode 100644
index 0000000..d00a124
--- /dev/null
+++ b/chassishandler.C
@@ -0,0 +1,62 @@
+#include "chassishandler.h"
+#include "ipmid-api.h"
+#include <stdio.h>
+#include <string.h>
+#include <stdint.h>
+
+void register_netfn_chassis_functions() __attribute__((constructor));
+
+struct get_sys_boot_options_t {
+    uint8_t parameter;
+    uint8_t set;
+    uint8_t block;
+}  __attribute__ ((packed));
+
+ipmi_ret_t ipmi_chassis_wildcard(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    printf("Handling CHASSIS WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+    return rc;
+}
+
+ipmi_ret_t ipmi_chassis_get_sys_boot_options(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                              ipmi_request_t request, ipmi_response_t response, 
+                              ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    printf("IPMI GET_SYS_BOOT_OPTIONS\n");
+
+    get_sys_boot_options_t *reqptr = (get_sys_boot_options_t*) request;
+
+    // TODO Return default values to OPAL until dbus interface is available
+
+    if (reqptr->parameter == 5) // Parameter #5
+    {
+        uint8_t buf[] = {0x1,0x5,80,0,0,0,0};
+        *data_len = sizeof(buf);
+        memcpy(response, &buf, *data_len);
+    }
+    else
+    {
+        fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr->parameter);
+        return IPMI_CC_PARM_NOT_SUPPORTED;        
+    }
+
+    return rc;
+}
+
+void register_netfn_chassis_functions()
+{
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_WILDCARD);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_WILDCARD, NULL, ipmi_chassis_wildcard);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS);
+    ipmi_register_callback(NETFUN_CHASSIS, IPMI_CMD_GET_SYS_BOOT_OPTIONS, NULL, ipmi_chassis_get_sys_boot_options);
+}
+
diff --git a/chassishandler.h b/chassishandler.h
new file mode 100644
index 0000000..99ed366
--- /dev/null
+++ b/chassishandler.h
@@ -0,0 +1,17 @@
+#ifndef __HOST_IPMI_CHASSIS_HANDLER_H__
+#define __HOST_IPMI_CHASSIS_HANDLER_H__
+
+// IPMI commands for Chassis net functions.
+enum ipmi_netfn_app_cmds
+{
+    // Get capability bits
+    IPMI_CMD_GET_SYS_BOOT_OPTIONS = 0x09,
+};
+
+// Command specific completion codes
+enum ipmi_chassis_return_codes
+{
+    IPMI_CC_PARM_NOT_SUPPORTED = 0x80,
+};
+
+#endif
-- 
2.6.3
