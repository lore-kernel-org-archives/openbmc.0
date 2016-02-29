Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 723651A0035
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 22:47:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456746035125637.8736773736947;
 Mon, 29 Feb 2016 03:40:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ratan Gupta <ratagupt@in.ibm.com>
Subject: [PATCH phosphor-host-ipmid v2 2/2] Removed the handler function of
 the wild card command enter the commit message for your changes. Lines
 starting
Date: Mon, 29 Feb 2016 05:40:32 -0600
Message-Id: <1456746032-24977-3-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 29 Feb 2016 11:47:34 -0000

From: Ratan Gupta <ratagupt@in.ibm.com>

---
 globalhandler.C | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/globalhandler.C b/globalhandler.C
index 25ae26a..2d3af92 100644
--- a/globalhandler.C
+++ b/globalhandler.C
@@ -142,22 +142,6 @@ ipmi_ret_t ipmi_global_warm_reset(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     return rc;
 }
 
-ipmi_ret_t ipmi_global_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
-                              ipmi_request_t request, ipmi_response_t response,
-                              ipmi_data_len_t data_len, ipmi_context_t context)
-{
-    printf("Handling WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
-
-    // Status code.
-    ipmi_ret_t rc = IPMI_CC_OK;
-
-    *data_len = strlen("THIS IS WILDCARD");
-
-    // Now pack actual response
-    memcpy(response, "THIS IS WILDCARD", *data_len);
-
-    return rc;
-}
 
 void register_netfn_global_functions()
 {
-- 
2.7.1
