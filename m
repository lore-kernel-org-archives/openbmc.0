Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CF2891A0B52
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 05:20:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457115629270369.6635447842119;
 Fri, 4 Mar 2016 10:20:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem] Add IPMI interface to allow FW
 updates from Host
Date: Fri,  4 Mar 2016 12:20:26 -0600
Message-Id: <1457115626-18686-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457115626-18686-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457115626-18686-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 04 Mar 2016 18:20:37 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

New OEM IPMI command to execute commands that would allow the Host to have access to the BMC to perform a FW update.
---
 Makefile     |  2 +-
 oemhandler.C | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 oemhandler.h |  1 +
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index eaa7324..bacdef9 100644
--- a/Makefile
+++ b/Makefile
@@ -10,7 +10,7 @@ CXXFLAGS += -fPIC -Wall
 all:  $(LIB_OEM)
 
 %.o: %.C
-	$(CXX) -c $< $(CXXFLAGS) -o $@
+	$(CXX) -std=c++14 -c $< $(CXXFLAGS) -o $@
 
 $(LIB_OEM): $(LIB_OEM_OBJ)
 	$(CXX) $^ -shared $(LDFLAGS) -o $@
diff --git a/oemhandler.C b/oemhandler.C
index f577d67..22452d6 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -1,7 +1,9 @@
 #include "oemhandler.h"
 #include <host-ipmid/ipmid-api.h>
+#include <fstream>
 #include <stdio.h>
 #include <string.h>
+#include <systemd/sd-bus.h>
 
 void register_netfn_oem_partial_esel() __attribute__((constructor));
 
@@ -70,10 +72,60 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 	return rc;
 }
 
+// Prepare for FW Update.
+// Execute needed commands to prepare the system for a fw update from the host.
+ipmi_ret_t ipmi_ibm_oem_prep_fw_update(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
+                                     ipmi_request_t request, ipmi_response_t response,
+                                     ipmi_data_len_t data_len, ipmi_context_t context)
+{
+    ipmi_ret_t ipmi_rc = IPMI_CC_OK;
+    *data_len = 0;
+
+    int rc = 0;
+    std::ofstream rwfs_file;
+    const char  *busname = "org.openbmc.control.Bmc";
+    const char  *objname = "/org/openbmc/control/bmc0";
+    const char  *iface = "org.openbmc.control.Bmc";
+    sd_bus *bus = ipmid_get_sd_bus_connection();
+    sd_bus_message *reply = NULL;
+    sd_bus_error error = SD_BUS_ERROR_NULL;
+    int r = 0;
+
+    // Set one time flag
+    rc = system("fw_setenv openbmconce copy-files-to-ram copy-base-filesystem-to-ram");
+    rc = WEXITSTATUS(rc);
+    if (rc != 0) {
+        fprintf(stderr, "fw_setenv openbmconce failed with rc=%d\n", rc);
+        return IPMI_CC_UNSPECIFIED_ERROR; 
+    }
+
+    // Touch the image-rwfs file to perform an empty update to force the save
+    // in case we're already in ram and the flash is the same causing the ram files
+    // to not be copied back to flash
+    rwfs_file.open("/run/initramfs/image-rwfs", std::ofstream::out | std::ofstream::app);
+    rwfs_file.close();
+
+    // Reboot the BMC for settings to take effect
+    r = sd_bus_call_method(bus, busname, objname, iface,
+                           "warmReset", &error, &reply, NULL);
+    if (r < 0) {
+        fprintf(stderr, "Failed to reset BMC: %s\n", strerror(-r));
+        return -1;
+    }
+    printf("Warning: BMC is going down for reboot!\n");
+    sd_bus_error_free(&error);
+    reply = sd_bus_message_unref(reply);
+
+    return ipmi_rc;
+}
 
 void register_netfn_oem_partial_esel()
 {
 	printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM, IPMI_CMD_PESEL);
 	ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel);
+
+    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_OEM, IPMI_CMD_PREP_FW_UPDATE);
+    ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PREP_FW_UPDATE, NULL, ipmi_ibm_oem_prep_fw_update);
+
 	return;
 }
diff --git a/oemhandler.h b/oemhandler.h
index 9cc397f..71ae01c 100644
--- a/oemhandler.h
+++ b/oemhandler.h
@@ -8,6 +8,7 @@
 // IPMI commands for net functions.
 enum ipmi_netfn_oem_cmds
 {
+    IPMI_CMD_PREP_FW_UPDATE = 0x10,
     IPMI_CMD_PESEL = 0xF0,
 };
 
-- 
2.7.1
