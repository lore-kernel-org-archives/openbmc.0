Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F24C91A0100
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 17:20:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448086820938705.6261249293533;
 Fri, 20 Nov 2015 22:20:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] systems can power on without fans powering on
Date: Sat, 21 Nov 2015 01:20:19 -0500
Message-Id: <1448086819-24938-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448086819-24938-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448086819-24938-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 21 Nov 2015 06:20:26 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 87c5a55..c3d240a 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,7 +16,7 @@ DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-tftpy"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "981f4dc59f23668b567949527c8e9585c2ab7089"
+SRCREV = "af915f1251b4989f41829f9ae8589b42ef81efd7"
 
 S = "${WORKDIR}"
 
-- 
2.6.3
