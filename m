Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 51C9A1A0376
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 16:40:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448430021276392.00155526758124;
 Tue, 24 Nov 2015 21:40:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 2/2] Updates for Skeleton
Date: Wed, 25 Nov 2015 00:40:19 -0500
Message-Id: <1448430019-6573-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448430019-6573-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448430019-6573-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 05:40:26 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index b8259a0..02b1934 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,7 +16,7 @@ DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-tftpy"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "4732708e4e10411145f7eb4652f23dbfac341a2d"
+SRCREV = "8fec681abd01d610730bf8753ca33001e9ad361b"
 
 S = "${WORKDIR}"
 
-- 
2.6.3
