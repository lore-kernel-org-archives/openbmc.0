Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D95441A073D
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 04:48:22 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444758500893524.0359810821444;
 Tue, 13 Oct 2015 10:48:20 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 5/8] Add more ipmi commands for app
 function
Date: Tue, 13 Oct 2015 12:48:04 -0500
Message-Id: <1444758487-9135-6-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 13 Oct 2015 17:48:23 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 apphandler.C | 137 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 apphandler.h |   6 +++
 2 files changed, 133 insertions(+), 10 deletions(-)

diff --git a/apphandler.C b/apphandler.C
index c86997f..596ec9c 100755
--- a/apphandler.C
+++ b/apphandler.C
@@ -1,12 +1,62 @@
 #include "apphandler.h"
 #include "ipmid-api.h"
+#include "ipmid.H"
 #include <stdio.h>
 #include <string.h>
+#include <stdint.h>
 
-void register_netfn_app_cap_bit() __attribute__((constructor));
-void register_netfn_app_wildcard() __attribute__((constructor));
+void register_netfn_app_functions() __attribute__((constructor));
 
-ipmi_ret_t ipmi_app_cap_bit_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+
+ipmi_ret_t ipmi_app_read_event(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    printf("IPMI APP READ EVENT Ignoring for now\n");
+    return rc;
+
+}
+
+
+ipmi_ret_t ipmi_app_set_acpi_power_state(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    printf("IPMI SET ACPI STATE Ignoring for now\n");
+    return rc;
+}
+
+ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    // TODO GET REAL VALUES HERE....  I made these ones up because 
+    // we are in bringup mode.  Version Major and Minor can be what we
+    // want like v1.03  but the IANA really should be something that 
+    // we own.  I would suggest getting the IANA from Hostboot as 
+    // long as IBM owns it then no problem.  If some other company 
+    // gave us the IANA to use then use the one we have from the 
+    // FSP ipmi code.
+    uint8_t str[] = {0x00, 0, 1, 1,2, 0xD, 0x41, 0xA7, 0x00, 0x43, 0x40};
+
+    // Data length
+    *data_len = sizeof(str);
+
+    // Pack the actual response
+    memcpy(response, &str, *data_len);
+    return rc;
+}
+
+
+ipmi_ret_t ipmi_app_get_bt_capabilities(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                              ipmi_request_t request, ipmi_response_t response, 
                              ipmi_data_len_t data_len, ipmi_context_t context)
 {
@@ -15,7 +65,7 @@ ipmi_ret_t ipmi_app_cap_bit_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     // Status code.
     ipmi_ret_t rc = IPMI_CC_OK;
 
-    unsigned char str[] = {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
+    uint8_t str[] = {0x01, MAX_IPMI_BUFFER, MAX_IPMI_BUFFER, 0x0A, 0x01};
 
     // Data length
     *data_len = sizeof(str);
@@ -26,6 +76,60 @@ ipmi_ret_t ipmi_app_cap_bit_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
+
+struct set_wd_data_t {
+    uint8_t t_use;
+    uint8_t t_action;
+    uint8_t preset;
+    uint8_t flags;
+    uint8_t ls;
+    uint8_t ms;
+}  __attribute__ ((packed));
+
+
+
+ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+
+    set_wd_data_t *reqptr = (set_wd_data_t*) request;
+    uint16_t timer = 0;
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+
+    *data_len = 0;
+
+    timer = (((uint16_t)reqptr->ms) << 8) + reqptr->ls;
+
+    printf("WATCHDOG SET Timer:[0x%X] 100ms intervals\n",timer);
+
+    // TODO: Right here is where we would call some dbus method as a timer.
+    // If the timer expires it would iniate a reboot of the host.
+
+    return rc;
+}
+
+
+ipmi_ret_t ipmi_app_reset_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
+                             ipmi_request_t request, ipmi_response_t response, 
+                             ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    // Status code.
+    ipmi_ret_t rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    printf("WATCHDOG RESET\n");
+    // TODO Right here is where we would call some sdbus timer.
+    // If your are experiencing dejavu you are right.  the
+    // set and the reset do similar things
+    return rc;
+}
+
+
+
+
+
 ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd, 
                               ipmi_request_t request, ipmi_response_t response, 
                               ipmi_data_len_t data_len, ipmi_context_t context)
@@ -43,16 +147,29 @@ ipmi_ret_t ipmi_app_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
-void register_netfn_app_cap_bit()
+void register_netfn_app_functions()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_CAP_BIT);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_cap_bit_handler);
-    return;
-}
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_CAP_BIT, NULL, ipmi_app_get_bt_capabilities);
 
-void register_netfn_app_wildcard()
-{
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WILDCARD);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_app_wildcard_handler);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_RESET_WD);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_RESET_WD, NULL, ipmi_app_reset_watchdog);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_SET_WD);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_WD, NULL, ipmi_app_set_watchdog);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_GET_DEVICE_ID);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_GET_DEVICE_ID, NULL, ipmi_app_get_device_id);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_SET_ACPI);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_SET_ACPI, NULL, ipmi_app_set_acpi_power_state);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_READ_EVENT);
+    ipmi_register_callback(NETFUN_APP, IPMI_CMD_READ_EVENT, NULL, ipmi_app_read_event);
     return;
 }
+
+
diff --git a/apphandler.h b/apphandler.h
index 602801b..2c4ea22 100644
--- a/apphandler.h
+++ b/apphandler.h
@@ -5,7 +5,13 @@
 enum ipmi_netfn_app_cmds
 {
     // Get capability bits
+    IPMI_CMD_RESET_WD       = 0x22,
+    IPMI_CMD_SET_WD         = 0x24,
     IPMI_CMD_GET_CAP_BIT    = 0x36,
+    IPMI_CMD_GET_DEVICE_ID  = 0x00,
+    IPMI_CMD_SET_ACPI       = 0x06,
+    IPMI_CMD_READ_EVENT     = 0x35,
+
 };
 
 #endif
-- 
2.6.0
