Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r91SR552QzDqDq
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 03:30:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463592641267463.1995770300829;
 Wed, 18 May 2016 10:30:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH openpower-host-ipmi-oem v3] Support for restricted mode for
 IPMI commands
Date: Wed, 18 May 2016 12:30:37 -0500
Message-Id: <1463592637-1147-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463592637-1147-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463592637-1147-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 17:30:48 -0000

From: tomjose <tomjoseph@in.ibm.com>

---
 oemhandler.C | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/oemhandler.C b/oemhandler.C
index 22452d6..72fbea7 100644
--- a/oemhandler.C
+++ b/oemhandler.C
@@ -5,6 +5,7 @@
 #include <string.h>
 #include <systemd/sd-bus.h>
 
+
 void register_netfn_oem_partial_esel() __attribute__((constructor));
 
 const char *g_esel_path = "/tmp/esel";
@@ -122,10 +123,12 @@ ipmi_ret_t ipmi_ibm_oem_prep_fw_update(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 void register_netfn_oem_partial_esel()
 {
 	printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_OEM, IPMI_CMD_PESEL);
-	ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel);
+	ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PESEL, NULL, ipmi_ibm_oem_partial_esel,
+                                                                 IPMI_WHITELISTED_COMMAND);
 
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN_OEM, IPMI_CMD_PREP_FW_UPDATE);
-    ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PREP_FW_UPDATE, NULL, ipmi_ibm_oem_prep_fw_update);
+    ipmi_register_callback(NETFUN_OEM, IPMI_CMD_PREP_FW_UPDATE, NULL, ipmi_ibm_oem_prep_fw_update, 
+                                                                        IPMI_BLACKLISTED_COMMAND);
 
 	return;
 }
-- 
2.8.2
