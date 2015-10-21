Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 27C1C1A04DB
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 23:48:59 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445431709260769.9638695005067;
 Wed, 21 Oct 2015 05:48:29 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 02/20] Set response bit returning from
 the ipmi call
Date: Wed, 21 Oct 2015 07:48:03 -0500
Message-Id: <1445431701-8681-3-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 12:49:00 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid.C | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index 10422e1..3b136d0 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -181,8 +181,8 @@ static int send_ipmi_message(unsigned char seq, unsigned char netfn, unsigned ch
     }
 
 
-    // Needed to see what we get back from the handlers.
-    data_len = msg_length;
+    // Responses in IPMI require a bit set.  So there ya go...
+    netfn |= 0x04;
 
 
     // Add the bytes needed for the methods to be called
-- 
2.6.0
