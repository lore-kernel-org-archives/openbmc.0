Return-Path: <clg@kaod.org>
Received: from 14.mo3.mail-out.ovh.net (14.mo3.mail-out.ovh.net
 [188.165.43.98])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfnrk5KXhzDqvK
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:17:42 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 642D3FF97BD
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:10:41 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 2D118440097;
 Wed, 29 Jun 2016 18:10:38 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc 6/9] aspeed/ast-g4: use literal
 defines in misc_init_r()
Date: Wed, 29 Jun 2016 18:09:48 +0200
Message-Id: <1467216591-8616-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467216591-8616-1-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17510276829757344514
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudehgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 29 Jun 2016 16:17:43 -0000

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
