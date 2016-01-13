Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 678551A08A4
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 08:00:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452718831923668.3255501249666;
 Wed, 13 Jan 2016 13:00:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Pickup Sprint4 changes for skeleton
Date: Wed, 13 Jan 2016 15:00:30 -0600
Message-Id: <1452718830-9450-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452718830-9450-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452718830-9450-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 13 Jan 2016 21:00:37 -0000

From: Chris Austen <austenc@us.ibm.com>

c0448f0729f2eea6cf1160d3d6a723e2983a443e  Reset the OS power state when the system
3939e2d5752030e383efd37aa70f28a005fae7a0  Support for W25Q256BV flash chip module
7b8811e8d2d638046a000770ab88d4dfe6dcaee9  Added BMC_THROTTLE gpio and hwmon thermal sensor
---
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 87327be..0e596d7 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,7 +16,7 @@ DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-tftpy"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "08b2b46a6df8b5cf93fcd17453072a2ddb48b598"
+SRCREV = "5968064479270edf233739d97dc6e37f04069d38"
 
 S = "${WORKDIR}"
 
-- 
2.6.4
