Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B4A381A0014
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 12:20:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448328026100204.4298582259994;
 Mon, 23 Nov 2015 17:20:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Externing api for others
Date: Mon, 23 Nov 2015 20:20:24 -0500
Message-Id: <1448328024-6132-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448328024-6132-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448328024-6132-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 Nov 2015 01:20:31 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid-api.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipmid-api.h b/ipmid-api.h
index 34d3bbe..5da7636 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -94,5 +94,5 @@ enum ipmi_return_codes
     IPMI_CC_UNSPECIFIED_ERROR = 0xFF,
 };
 
-sd_bus *ipmid_get_sd_bus_connection(void);
+extern "C" sd_bus *ipmid_get_sd_bus_connection(void);
 #endif
-- 
2.6.3
