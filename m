Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A9CB21A06CD
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:32:00 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445481117710617.8558987766795;
 Wed, 21 Oct 2015 19:31:57 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Add ipmi cc for invalid sensor
Date: Wed, 21 Oct 2015 21:31:54 -0500
Message-Id: <1445481114-29889-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445481114-29889-1-git-send-email-patches@stwcx.xyz>
References: <1445481114-29889-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:32:01 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid-api.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ipmid-api.h b/ipmid-api.h
index caf18e8..588dd24 100755
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -86,7 +86,9 @@ enum ipmi_return_codes
 {
     IPMI_CC_OK = 0x00,
     IPMI_DCMI_CC_NO_ACTIVE_POWER_LIMIT = 0x80,
-    IPMI_CC_INVALID = 0xC1
+    IPMI_CC_INVALID = 0xC1,
+    IPMI_CC_SENSOR_INVALID = 0xCB
+
 };
 
 #endif
-- 
2.6.0
