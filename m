Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r91v80y6QzDqCH
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 03:50:27 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463593821951188.2303222430246;
 Wed, 18 May 2016 10:50:21 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH ipmi-fru-parser] Support for restricted mode for IPMI commands
Date: Wed, 18 May 2016 12:50:14 -0500
Message-Id: <1463593814-1962-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463593814-1962-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463593814-1962-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 May 2016 17:50:29 -0000

From: tomjose <tomjoseph@in.ibm.com>

---
 strgfnhandler.C | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/strgfnhandler.C b/strgfnhandler.C
index eda4290..bb50bb0 100644
--- a/strgfnhandler.C
+++ b/strgfnhandler.C
@@ -99,5 +99,6 @@ ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
 void register_netfn_storage_write_fru()
 {
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA);
-    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA, NULL, ipmi_storage_write_fru_data);
+    ipmi_register_callback(NETFUN_STORAGE, IPMI_CMD_WRITE_FRU_DATA, NULL, ipmi_storage_write_fru_data,
+                           IPMI_WHITELISTED_COMMAND);   
 }
-- 
2.8.2
