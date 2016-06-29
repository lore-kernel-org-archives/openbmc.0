Return-Path: <clg@kaod.org>
X-Greylist: delayed 906 seconds by postgrey-1.35 at bilbo;
 Wed, 29 Jun 2016 17:52:43 AEST
Received: from 14.mo3.mail-out.ovh.net (14.mo3.mail-out.ovh.net
 [188.165.43.98])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfZf35qzQzDqtW
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 17:52:43 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 6709FFF8668
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 09:37:36 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 2FFB0440097;
 Wed, 29 Jun 2016 09:37:33 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/3] aspeed/ast-g4: use literal defines in misc_init_r()
Date: Wed, 29 Jun 2016 09:37:17 +0200
Message-Id: <1467185838-28342-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467185838-28342-1-git-send-email-clg@kaod.org>
References: <1467185838-28342-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8845069671316425474
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudeggdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2016 07:52:44 -0000

and also make sure the routine is called: CONFIG_MISC_INIT_R still
needs to be defined in the platform config file.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 board/aspeed/ast-g4/ast-g4.c | 15 +++++++++------
 include/configs/ast-g4.h     |  1 +
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
index c4fa76d216be..c632af70b9e1 100644
--- a/board/aspeed/ast-g4/ast-g4.c
+++ b/board/aspeed/ast-g4/ast-g4.c
@@ -7,7 +7,10 @@
 
 #include <common.h>
 #include <netdev.h>
+#include <asm/arch/platform.h>
 #include <asm/arch/ast-sdmc.h>
+#include <asm/arch/regs-ahbc.h>
+#include <asm/arch/regs-scu.h>
 #include <asm/io.h>
 
 DECLARE_GLOBAL_DATA_PTR;
@@ -36,14 +39,14 @@ int misc_init_r(void)
 	u32 reg;
 
 	/* Unlock AHB controller */
-	writel(0xAEED1A03, 0x1E600000);
+	writel(AHBC_PROTECT_UNLOCK, AST_AHBC_BASE);
 
 	/* Map DRAM to 0x00000000 */
-	reg = readl(0x1E60008C);
-	writel(reg | BIT(0), 0x1E60008C);
+	reg = readl(AST_AHBC_BASE + AST_AHBC_ADDR_REMAP);
+	writel(reg | BIT(0), AST_AHBC_BASE + AST_AHBC_ADDR_REMAP);
 
 	/* Unlock SCU */
-	writel(0x1688A8A8, 0x1e6e2000);
+	writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
 
 	/*
 	 * The original file contained these comments.
@@ -53,10 +56,10 @@ int misc_init_r(void)
 	 * PCLK  = HPLL/8
 	 * BHCLK = HPLL/8
 	 */
-	reg = readl(0x1e6e2008);
+	reg = readl(AST_SCU_BASE + AST_SCU_CLK_SEL);
 	reg &= 0x1c0fffff;
 	reg |= 0x61800000;
-	writel(reg, 0x1e6e2008);
+	writel(reg, AST_SCU_BASE + AST_SCU_CLK_SEL);
 
 	return 0;
 }
diff --git a/include/configs/ast-g4.h b/include/configs/ast-g4.h
index ed182e0c8829..ab0a4bb7654d 100644
--- a/include/configs/ast-g4.h
+++ b/include/configs/ast-g4.h
@@ -20,6 +20,7 @@
 
 
 #define CONFIG_ARCH_CPU_INIT
+#define CONFIG_MISC_INIT_R
 #define CONFIG_MACH_TYPE		MACH_TYPE_ASPEED
 
 #include <asm/arch/platform.h>
-- 
2.1.4
