Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qsDFZ43bmzDq9s
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2016 10:41:38 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461372094115803.1494757324456;
 Fri, 22 Apr 2016 17:41:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH linux] Removed firestone from dt makefile.
Date: Fri, 22 Apr 2016 19:41:32 -0500
Message-Id: <1461372092-23839-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461372092-23839-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461372092-23839-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 23 Apr 2016 00:41:39 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

There isn't any firestone dts to compile.
---
 arch/arm/boot/dts/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index aa4daf2..9697ea5 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -779,8 +779,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 dtb-$(CONFIG_MACH_OPP_PALMETTO_BMC) += \
 	aspeed-bmc-opp-palmetto.dtb \
-	aspeed-bmc-opp-barreleye.dtb \
-	aspeed-bmc-opp-firestone.dtb
+	aspeed-bmc-opp-barreleye.dtb
 endif
 
 dtstree		:= $(srctree)/$(src)
-- 
2.8.1
