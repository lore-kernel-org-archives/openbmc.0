Return-Path: <clg@kaod.org>
Received: from 4.mo5.mail-out.ovh.net (4.mo5.mail-out.ovh.net [178.33.111.247])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rkvjw55fPzDqx8
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jul 2016 18:56:04 +1000 (AEST)
Received: from player794.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 34AC9FFB2BD
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jul 2016 10:56:00 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player794.ha.ovh.net (Postfix) with ESMTPSA id 4C81914006B;
 Wed,  6 Jul 2016 10:55:54 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc] aspeed: fix typos in hardware
 strapping register1 
Date: Wed,  6 Jul 2016 10:55:44 +0200
Message-Id: <1467795344-11232-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14384215738319211266
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvdeigddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 06 Jul 2016 08:56:05 -0000

This adds also some bit definitions. The list should be clean enough
to be used in other projects, such as in the qemu SCU device model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/include/asm/arch-aspeed/regs-scu.h |   76 +++++++++++++++-------------
 1 file changed, 42 insertions(+), 34 deletions(-)

Index: u-boot-v2016.05-aspeed-openbmc.git/arch/arm/include/asm/arch-aspeed/regs-scu.h
===================================================================
--- u-boot-v2016.05-aspeed-openbmc.git.orig/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ u-boot-v2016.05-aspeed-openbmc.git/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -581,10 +581,15 @@
 #else /* !AST_SOC_G5 */
 #define SCU_HW_STRAP_SW_DEFINE(x)	(x << 29)
 #define SCU_HW_STRAP_SW_DEFINE_MASK	(0x3 << 29)
-#define SCU_HW_STRAP_DRAM_SIZE		(x << 29)
-#define SCU_HW_STRAP_DRAM_SIZE_MASK	(0x3 << 29)
 
-#define SCU_HW_STRAP_DRAM_CONFIG	(x << 24)
+#define SCU_HW_STRAP_DRAM_SIZE(x)	(x << 27)
+#define SCU_HW_STRAP_DRAM_SIZE_MASK	(0x3 << 27)
+#define     DRAM_SIZE_64MB                  0
+#define     DRAM_SIZE_128MB                 1
+#define     DRAM_SIZE_256MB                 2
+#define     DRAM_SIZE_512MB                 3
+
+#define SCU_HW_STRAP_DRAM_CONFIG(x)	(x << 24)
 #define SCU_HW_STRAP_DRAM_CONFIG_MASK	(0x7 << 24)
 
 #define SCU_HW_STRAP_GPIOE_PT_EN	(0x1 << 22)
@@ -593,60 +598,63 @@
 #define SCU_HW_STRAP_ACPI_DIS		(0x1 << 19)
 
 /* bit 23, 18 [1,0] */
-#define SCU_HW_STRAP_SET_CLK_SOURCE(x)	((((x&0x3) >> 1)<<23)||((x&0x1) << 18))
-#define SCU_HW_STRAP_GET_CLK_SOURCE(x)	(((x>>23)&0x1<<1) | ((x>>18)&0x1))
+#define SCU_HW_STRAP_SET_CLK_SOURCE(x)  ((((x & 0x3) >> 1) << 23) | \
+                                         ((x & 0x1) << 18))
+#define SCU_HW_STRAP_GET_CLK_SOURCE(x)  (((x >> 23) & 0x1 << 1) | \
+					 ((x >> 18) & 0x1))
 #define SCU_HW_STRAP_CLK_SOURCE_MASK	((0x1 << 23) | (0x1 << 18))
-
-#define CLK_25M_IN			(0x1 << 23)
-#define CLK_24M_IN			0
-#define CLK_48M_IN			1
-#define CLK_25M_IN_24M_USB_CKI		3
-#define CLK_25M_IN_48M_USB_CKI		3
+#define     CLK_25M_IN			    (0x1 << 23)
+#define     CLK_24M_IN			    0
+#define     CLK_48M_IN			    1
+#define     CLK_25M_IN_24M_USB_CKI	    2
+#define     CLK_25M_IN_48M_USB_CKI	    3
 
 #define SCU_HW_STRAP_2ND_BOOT_WDT	(0x1 << 17)
 #define SCU_HW_STRAP_SUPER_IO_CONFIG	(0x1 << 16)
 #define SCU_HW_STRAP_VGA_CLASS_CODE	(0x1 << 15)
 #define SCU_HW_STRAP_LPC_RESET_PIN	(0x1 << 14)
+
 #define SCU_HW_STRAP_SPI_MODE(x)	(x << 12)
 #define SCU_HW_STRAP_SPI_MODE_MASK	(0x3 << 12)
-#define SCU_HW_STRAP_SPI_MASTER		(0x1 << 12)
-#define SCU_HW_STRAP_SPI_M_S_EN		(0x2 << 12)
-#define SCU_HW_STRAP_SPI_PASS_THROUGH	(0x3 << 12)
+#define     SCU_HW_STRAP_SPI_DIS            0
+#define     SCU_HW_STRAP_SPI_MASTER	    1
+#define     SCU_HW_STRAP_SPI_M_S_EN	    2
+#define     SCU_HW_STRAP_SPI_PASS_THROUGH   3
 
 #define SCU_HW_STRAP_SET_CPU_AHB_RATIO(x)	(x << 10)
 #define SCU_HW_STRAP_GET_CPU_AHB_RATIO(x)	((x >> 10) & 3)
 #define SCU_HW_STRAP_CPU_AHB_RATIO_MASK		(0x3 << 10)
+#define     CPU_AHB_RATIO_1_1		    0
+#define     CPU_AHB_RATIO_2_1		    1
+#define     CPU_AHB_RATIO_4_1		    2
+#define     CPU_AHB_RATIO_3_1		    3
 
-#define CPU_AHB_RATIO_1_1		0
-#define CPU_AHB_RATIO_2_1		1
-#define CPU_AHB_RATIO_4_1		2
-#define CPU_AHB_RATIO_3_1		3
-
-#define SCU_HW_STRAP_GET_H_PLL_CLK(x)	((x >> 8 )& 0x3)
+#define SCU_HW_STRAP_GET_H_PLL_CLK(x)	((x >> 8) & 0x3)
 #define SCU_HW_STRAP_H_PLL_CLK_MASK	(0x3 << 8)
-#define CPU_384MHZ			0
-#define CPU_360MHZ			1
-#define CPU_336MHZ			2
-#define CPU_408MHZ			3
+#define     CPU_384MHZ			    0
+#define     CPU_360MHZ			    1
+#define     CPU_336MHZ			    2
+#define     CPU_408MHZ			    3
 
 #define SCU_HW_STRAP_MAC1_RGMII		(0x1 << 7)
 #define SCU_HW_STRAP_MAC0_RGMII		(0x1 << 6)
 #define SCU_HW_STRAP_VGA_BIOS_ROM	(0x1 << 5)
 #define SCU_HW_STRAP_SPI_WIDTH		(0x1 << 4)
-#define SCU_HW_STRAP_VGA_SIZE_GET(x)	((x >> 2)& 0x3)
+
+#define SCU_HW_STRAP_VGA_SIZE_GET(x)	((x >> 2) & 0x3)
 #define SCU_HW_STRAP_VGA_MASK		(0x3 << 2)
 #define SCU_HW_STRAP_VGA_SIZE_SET(x)	(x << 2)
-
-#define VGA_8M_DRAM			0
-#define VGA_16M_DRAM			1
-#define VGA_32M_DRAM			2
-#define VGA_64M_DRAM			3
+#define     VGA_8M_DRAM			    0
+#define     VGA_16M_DRAM		    1
+#define     VGA_32M_DRAM		    2
+#define     VGA_64M_DRAM		    3
 
 #define SCU_HW_STRAP_BOOT_MODE(x)	(x)
-#define NOR_BOOT			0
-#define NAND_BOOT			1
-#define SPI_BOOT			2
-#define DIS_BOOT			3
+#define     NOR_BOOT			    0
+#define     NAND_BOOT			    1
+#define     SPI_BOOT			    2
+#define     DIS_BOOT			    3
+
 #endif /* AST_SOC_G5 */
 
 /* AST_SCU_RAMDOM_GEN			0x74 - random number generator register */
