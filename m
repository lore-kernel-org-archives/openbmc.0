Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9F95A1A0E6B
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 15:50:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449550225215461.7746837732458;
 Mon, 7 Dec 2015 20:50:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Increase ipmi BT to 64 bytes
Date: Mon,  7 Dec 2015 23:50:23 -0500
Message-Id: <1449550223-24173-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449550223-24173-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449550223-24173-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 08 Dec 2015 04:50:31 -0000

From: Chris Austen <austenc@us.ibm.com>

after a lot of testing and verification from Hostboot it appears it is
fine to move this back to 64 bytes.  I'm doing this to reduce the
number of IPMI calls from the host.
---
 ipmid.H | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipmid.H b/ipmid.H
index 3de2c8c..c75b4ac 100644
--- a/ipmid.H
+++ b/ipmid.H
@@ -16,7 +16,7 @@ ipmi_ret_t ipmi_netfn_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_
 // The BT FIFO in the AST2400 can only handle 64 bytes.  
 // Can only allow 63 because the BT interface still 
 // needs 1 byte for the length field. 
-#define MAX_IPMI_BUFFER 63
+#define MAX_IPMI_BUFFER 64
 
 extern FILE *ipmiio, *ipmidbus, *ipmicmddetails;
 
-- 
2.6.3
