Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7D3501A005D
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 22:44:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456746033993130.34795570070298;
 Mon, 29 Feb 2016 03:40:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ratan Gupta <ratagupt@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2 1/2] Fixing the Duplicate registration
 for NetFn [0x6], Cmd:[0xFF]
Date: Mon, 29 Feb 2016 05:40:31 -0600
Message-Id: <1456746032-24977-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456746032-24977-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456746032-24977-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 29 Feb 2016 11:44:27 -0000

From: Ratan Gupta <ratagupt@in.ibm.com>

---
 globalhandler.C | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/globalhandler.C b/globalhandler.C
index e68ea79..25ae26a 100644
--- a/globalhandler.C
+++ b/globalhandler.C
@@ -164,8 +164,5 @@ void register_netfn_global_functions()
     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WARM_RESET);
     ipmi_register_callback(NETFUN_APP, IPMI_CMD_WARM_RESET, NULL, ipmi_global_warm_reset);
 
-    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WILDCARD);
-    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_global_wildcard_handler);
-
-	return;
+    return;
 }
-- 
2.7.1
