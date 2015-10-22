Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DB0DB1A062A
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:32:03 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445481121877818.1228756183547;
 Wed, 21 Oct 2015 19:32:01 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Add OEM NETFN
Date: Wed, 21 Oct 2015 21:31:58 -0500
Message-Id: <1445481118-29951-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445481118-29951-1-git-send-email-patches@stwcx.xyz>
References: <1445481118-29951-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:32:04 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid-api.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ipmid-api.h b/ipmid-api.h
index caf18e8..58810fa 100755
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -70,7 +70,8 @@ enum ipmi_net_fns
     NETFUN_STORAGE  =   (0x0a << 2),
     NETFUN_TRANPORT =   (0x0c << 2),
     NETFUN_GRPEXT   =   (0x2c << 2),
-    NETFUN_NONE     =   (0x30 << 2)
+    NETFUN_NONE     =   (0x30 << 2),
+    NETFUN_OEM      =   (0x32 << 2)
 };
 
 // IPMI commands for net functions. Since this is to be used both by the ipmi
-- 
2.6.0
