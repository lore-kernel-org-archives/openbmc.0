Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7B0BE1A04C2
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 23:48:40 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445431713357337.2860024801256;
 Wed, 21 Oct 2015 05:48:33 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 04/20] Reduced MAX_IPMI_BUFFER to
 support ast2400 FIFO
Date: Wed, 21 Oct 2015 07:48:05 -0500
Message-Id: <1445431701-8681-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
References: <1445431701-8681-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 12:48:41 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid.H | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ipmid.H b/ipmid.H
index 6b7d2c9..1cfe4c3 100755
--- a/ipmid.H
+++ b/ipmid.H
@@ -10,6 +10,10 @@ ipmi_ret_t ipmi_netfn_router(const ipmi_netfn_t, const ipmi_cmd_t, ipmi_request_
 
 // Plugin libraries need to _end_ with .so
 #define IPMI_PLUGIN_EXTN ".so"
-#define MAX_IPMI_BUFFER 255
+
+// The BT FIFO in the AST2400 can only handle 64 bytes.  
+// Can only allow 63 because the BT interface still 
+// needs 1 byte for the length field. 
+#define MAX_IPMI_BUFFER 63
 
 #endif
-- 
2.6.0
