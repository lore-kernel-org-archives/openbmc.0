Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B5EB81A009D
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 03:59:43 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457453441355152.34303359807257;
 Tue, 8 Mar 2016 08:10:41 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <njames@us.ibm.com>,
	Norman James <nkskjames@gmail.com>
Subject: [PATCH phosphor-host-ipmid v2] DCMI GET_POWER_LEVEL bad return code
Date: Tue,  8 Mar 2016 10:10:38 -0600
Message-Id: <1457453438-9977-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457453438-9977-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457453438-9977-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 08 Mar 2016 16:59:44 -0000

From: Norman James <njames@us.ibm.com>

This function uses static data and should always
return a good return code.  This was causing OCC
not to start.

Signed-off-by: Norman James <nkskjames@gmail.com>
---
 dcmihandler.C | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/dcmihandler.C b/dcmihandler.C
index fafebdc..5e7d879 100644
--- a/dcmihandler.C
+++ b/dcmihandler.C
@@ -11,7 +11,7 @@ ipmi_ret_t ipmi_dcmi_get_power_limit(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
                               ipmi_request_t request, ipmi_response_t response, 
                               ipmi_data_len_t data_len, ipmi_context_t context)
 {
-    ipmi_ret_t rc = IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT;
+    ipmi_ret_t rc = 0;
 
     // dcmi-v1-5-rev-spec.pdf 6.6.2.   
     // This is good enough for OpenBMC support for OpenPOWER based systems
@@ -37,4 +37,3 @@ void register_netfn_dcmi_functions()
     ipmi_register_callback(NETFUN_GRPEXT, IPMI_CMD_DCMI_GET_POWER, NULL, ipmi_dcmi_get_power_limit);
     return;
 }
-// 956379
\ No newline at end of file
-- 
2.7.1
