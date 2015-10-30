Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DEB9A1A0CE6
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 05:52:52 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446231168652630.6414330763757;
 Fri, 30 Oct 2015 11:52:48 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] resolved file not found for adding new log
Date: Fri, 30 Oct 2015 13:52:45 -0500
Message-Id: <1446231165-31278-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446231165-31278-1-git-send-email-patches@stwcx.xyz>
References: <1446231165-31278-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 18:52:53 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 storagehandler.C | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/storagehandler.C b/storagehandler.C
index dc0217e..359e53f 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -182,7 +182,7 @@ ipmi_ret_t ipmi_storage_add_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     ipmi_add_sel_request_t *p = (ipmi_add_sel_request_t*) request;
     uint16_t recordid;
 
-    recordid = ((uint16_t)p->eventdata[1] << 8) | p->eventdata[2];
+    recordid = ((uint16_t)p->eventdata[2] << 8) | p->eventdata[1];
 
     printf("IPMI Handling ADD-SEL for record 0x%04x\n", recordid);
 
-- 
2.6.0
