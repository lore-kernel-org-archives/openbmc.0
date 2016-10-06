Return-Path: <clg@kaod.org>
Received: from 2.mo1.mail-out.ovh.net (2.mo1.mail-out.ovh.net [178.32.119.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqm2817pGzDrSF
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:27:12 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 76203119EC
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:08 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id E339D2A0067;
 Thu,  6 Oct 2016 23:27:04 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 03/12] aspeed: use CONFIG_TARGET_AST_G{4,5}
Date: Thu,  6 Oct 2016 23:26:36 +0200
Message-Id: <1475789205-19618-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13955529346206305026
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeefgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Oct 2016 21:27:12 -0000

The generated config with the SoC definitions is included in each file
at compile time. So we can remove the AST_SOC_G* define which are
redundant.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/include/asm/arch-aspeed/aspeed.h    | 29 --------------
 arch/arm/include/asm/arch-aspeed/ast-ahbc.h  |  2 +-
 arch/arm/include/asm/arch-aspeed/platform.h  | 10 +----
 arch/arm/include/asm/arch-aspeed/regs-ahbc.h |  4 +-
 arch/arm/include/asm/arch-aspeed/regs-scu.h  | 56 ++++++++++++++--------------
 arch/arm/mach-aspeed/Makefile                |  4 +-
 arch/arm/mach-aspeed/ast-ahbc.c              |  5 +--
 arch/arm/mach-aspeed/ast-scu.c               | 19 ++++++----
 arch/arm/mach-aspeed/cpuinfo.c               |  5 +--
 arch/arm/mach-aspeed/flash.c                 |  3 +-
 board/aspeed/ast-g4/ast-g4.c                 |  1 -
 drivers/net/ftgmac100.c                      |  1 -
 include/configs/ast-common.h                 |  2 -
 include/configs/ast-g4-ncsi.h                |  2 +-
 include/configs/ast-g4-phy.h                 |  2 +-
 include/configs/ast-g5-ncsi.h                |  2 +-
 include/configs/ast-g5-phy.h                 |  2 +-
 17 files changed, 53 insertions(+), 96 deletions(-)
 delete mode 100644 arch/arm/include/asm/arch-aspeed/aspeed.h

diff --git a/arch/arm/include/asm/arch-aspeed/aspeed.h b/arch/arm/include/asm/arch-aspeed/aspeed.h
deleted file mode 100644
index 7d2de1cbd43e..000000000000
--- a/arch/arm/include/asm/arch-aspeed/aspeed.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- *  arch/arm/plat-aspeed/include/plat/aspeed.h
- *
- *  Copyright (C) 2012-2020  ASPEED Technology Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- */
-
-#if defined(CONFIG_ARCH_AST3200) || defined(CONFIG_ARCH_AST2500) || defined(CONFIG_ARCH_AST1520)
-#define AST_SOC_G5
-#define SRAM_SIZE 		SZ_32K
-#elif defined(CONFIG_ARCH_AST1400) || defined(CONFIG_ARCH_AST2400) || defined(CONFIG_ARCH_AST3100)
-#define AST_SOC_G4
-#define SRAM_SIZE 		SZ_32K
-#else
-#error "Not define SoC generation"
-#endif
diff --git a/arch/arm/include/asm/arch-aspeed/ast-ahbc.h b/arch/arm/include/asm/arch-aspeed/ast-ahbc.h
index c870d11127b7..a0de8cf14d86 100644
--- a/arch/arm/include/asm/arch-aspeed/ast-ahbc.h
+++ b/arch/arm/include/asm/arch-aspeed/ast-ahbc.h
@@ -30,7 +30,7 @@
 
 extern void ast_ahbc_boot_remap(void);
 
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 extern void ast_ahbc_lpc_plus_mapping(u8 enable);
 extern void ast_ahbc_peie_mapping(u8 enable);
 #endif
diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
index 1c02914fcbdf..f5db09d2a417 100644
--- a/arch/arm/include/asm/arch-aspeed/platform.h
+++ b/arch/arm/include/asm/arch-aspeed/platform.h
@@ -17,15 +17,9 @@
 #ifndef _AST_PLATFORM_H
 #define _AST_PLATFORM_H
 
-#include <asm/arch/aspeed.h>
-
-#define AST_PLL_25MHZ			25000000
-#define AST_PLL_24MHZ			24000000
-#define AST_PLL_12MHZ			12000000
-
-#if defined(CONFIG_ARCH_AST2400)
+#if defined(CONFIG_TARGET_AST_G4)
 #include <asm/arch/ast2400_platform.h>
-#elif defined(AST_SOC_G5)
+#elif defined(CONFIG_TARGET_AST_G5)
 #include <asm/arch/ast_g5_platform.h>
 #else
 #err "No define for platform.h"
diff --git a/arch/arm/include/asm/arch-aspeed/regs-ahbc.h b/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
index 66e29839e8f1..c867b540dd5e 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
@@ -13,8 +13,6 @@
 #ifndef __AST_AHBC_H
 #define __AST_AHBC_H
 
-#include <asm/arch/aspeed.h>
-
 /* Registers for AHBC */
 #define AST_AHBC_PROTECT		0x00	/* Protection Key Register */
 #define AST_AHBC_PRIORITY_CTRL		0x80	/* Priority Cortrol Register */
@@ -27,7 +25,7 @@
 #define AHBC_PCI_REMAP1			(1 << 5)
 #define AHBC_PCI_REMAP0			(1 << 4)
 
-#if defined(AST_SOC_G5)
+#if defined(CONFIG_TARGET_AST_G5)
 #define AHBC_PCIE_MAP			(1 << 5)
 #define AHBC_LPC_PLUS_MAP		(1 << 4)
 #else
diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index b714fa92341d..ea1c0932ccc6 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -13,8 +13,6 @@
 #ifndef __AST_REGS_SCU_H
 #define __AST_REGS_SCU_H                     1
 
-#include <asm/arch/aspeed.h>
-
 /*
  *  Register for SCU
  */
@@ -33,7 +31,7 @@
 #define AST_SCU_M_PLL		0x20	/* M-PLL Parameter register */
 #define AST_SCU_H_PLL		0x24	/* H-PLL Parameter register */
 #define AST_SCU_MH_PLL_EXTEND	0x148	/* Extended Parameter of M/H-PLL register */
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 #define AST_SCU_D_PLL		0x28	/* D-PLL Parameter register */
 #define AST_SCU_D_PLL_EXTEND0	0x130	/* D-PLL Extended Parameter register */
 #define AST_SCU_D_PLL_EXTEND1	0x134	/* D-PLL Extended Parameter register */
@@ -117,7 +115,7 @@
 #define SCU_RESET_P2X			(0x1 << 24)
 #define SCU_RESET_ADC			(0x1 << 23)
 #define SCU_RESET_JTAG			(0x1 << 22)
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 #define SCU_RESET_PCIE_DIR		(0x1 << 21)
 #define SCU_RESET_PCIE			(0x1 << 19)
 #else
@@ -176,7 +174,7 @@
 #define SCU_CLK_SD_DIV(x)		(x << 12)
 #define SCU_CLK_SD_GET_DIV(x)		((x >> 12) & 0x7)
 #define SCU_CLK_SD_MASK			(0x7 << 12)
-#if defined(AST_SOC_G5)
+#if defined(CONFIG_TARGET_AST_G5)
 #define SCU_CRT_CLK_L_SOURCE		(0x1 << 8)
 #else
 #define SCU_CLK_VIDEO_DELAY(x)		(x << 8)
@@ -222,7 +220,7 @@
 #define SCU_MAC1CLK_STOP_EN		(0x1 << 21)
 #define SCU_MAC0CLK_STOP_EN		(0x1 << 20)
 //bit 19 must keep 1
-#if defined(AST_SOC_G5)
+#if defined(CONFIG_TARGET_AST_G5)
 #define SCU_ESPI_CLK_STOP_EN		(0x1 << 19)
 #endif
 
@@ -259,7 +257,7 @@
 #define SCU_D2CLK_STOP			(0x1)
 
 /* AST_SCU_COUNT_CTRL 			0x10 - frequency counter control register */
-#if defined(AST_SOC_G5)
+#if defined(CONFIG_TARGET_AST_G5)
 #define SCU_OSC_OUT_EN			(0x1 << 8)
 #endif
 #define SCU_FREQ_COMP_RESULT		(0x1 << 7)
@@ -267,7 +265,7 @@
 #define SCU_FREQ_SOURCE_FOR_MEASU(x)	(x << 2)
 #define SCU_FREQ_SOURCE_FOR_MEASU_MASK	(0xf << 2)
 
-#if defined(AST_SOC_G5)
+#if defined(CONFIG_TARGET_AST_G5)
 #define SCU_SOURCE_PCLK			0xf
 #define SCU_SOURCE_VPACLK		0xe
 #define SCU_SOURCE_VPBCLK		0xd
@@ -284,7 +282,7 @@
 #define SCU_SOURCE_DLY16		0x2
 #define SCU_SOURCE_NAND			0x1
 #define SCU_SOURCE_DEL_CELL		0x0
-#else /* ! AST_SOC_G5 */
+#else /* ! CONFIG_TARGET_AST_G5 */
 #define SCU_SOURCE_6M			0xf
 #define SCU_SOURCE_12M			0xe
 #define SCU_SOURCE_I2SM_CLK		0xd
@@ -300,7 +298,7 @@
 #define SCU_SOURCE_D_PLL		0x2
 #define SCU_SOURCE_NAND			0x1
 #define SCU_SOURCE_DEL_CELL		0x0
-#endif /* AST_SOC_G5 */
+#endif /* CONFIG_TARGET_AST_G5 */
 #define SCU_OSC_COUNT_EN		(0x1 << 1)
 #define SCU_RING_OSC_EN			(0x1 << 0)
 
@@ -321,7 +319,7 @@
 #define INTR_VGA_CURSOR_CHANGE_EN	(0x1 << 0)
 
 /* AST_SCU_D2_PLL			0x1C - D2-PLL Parameter register */
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 #define SCU_D2_PLL_SET_ODNUM(x)		(x << 19)
 #define SCU_D2_PLL_GET_ODNUM(x)		((x >> 19) & 0x3)
 #define SCU_D2_PLL_OD_MASK		(0x3 << 19)
@@ -342,7 +340,7 @@
 #define SCU_D2_PLL_RESET		(0x1 << 2)
 #define SCU_D2_PLL_BYPASS		(0x1 << 1)
 #define SCU_D2_PLL_OFF			(0x1)
-#else /* ! AST_SOC_G5 */
+#else /* ! CONFIG_TARGET_AST_G5 */
 #define SCU_D2_PLL_SET_PD2(x)		(x << 19)
 #define SCU_D2_PLL_GET_PD2(x)		((x >> 19)&0x7)
 #define SCU_D2_PLL_PD2_MASK		(0x7 << 19)
@@ -360,17 +358,17 @@
 #define SCU_D2_PLL_SET_NUM(x)		(x)
 #define SCU_D2_PLL_GET_NUM(x)		(x & 0xff)
 #define SCU_D2_PLL_NUM_MASK		(0xff)
-#endif /* AST_SOC_G5 */
+#endif /* CONFIG_TARGET_AST_G5 */
 
 /* AST_SCU_M_PLL 			0x20 - M-PLL Parameter register */
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 #define SCU_M_PLL_RESET			(0x1 << 21)
 #define SCU_M_PLL_BYPASS		(0x1 << 20)
 #define SCU_M_PLL_OFF			(0x1 << 19)
 #define SCU_M_PLL_GET_PDNUM(x)		((x >> 13) & 0x3f)
 #define SCU_M_PLL_GET_MNUM(x)		((x >> 5) & 0xff)
 #define SCU_M_PLL_GET_NNUM(x)		(x & 0x1f)
-#else /* ! AST_SOC_G5 */
+#else /* ! CONFIG_TARGET_AST_G5 */
 #define SCU_M_PLL_BYPASS		(0x1 << 17)
 #define SCU_M_PLL_OFF			(0x1 << 16)
 #define SCU_M_PLL_NUM(x)		(x << 5)
@@ -380,10 +378,10 @@
 #define SCU_M_PLL_GET_DIV(x)		((x >> 4) & 0x1)
 #define SCU_M_PLL_DENUM(x)		(x)
 #define SCU_M_PLL_GET_DENUM(x)		(x & 0xf)
-#endif /* AST_SOC_G5 */
+#endif /* CONFIG_TARGET_AST_G5 */
 
 /* AST_SCU_H_PLL			0x24 - H-PLL Parameter register */
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 #define SCU_H_PLL_PARAMETER0(x)		((x) << 22)
 #define SCU_H_PLL_GET_PARAMETER0(x)	((x >> 22) & 0x3ff)
 #define SCU_H_PLL_PARAMETER0_MASK(x)	(0x3ff << 22)
@@ -400,7 +398,7 @@
 #define SCU_H_PLL_NNUM(x)		(x)
 #define SCU_H_PLL_GET_NNUM(x)		(x & 0xf)
 #define SCU_H_PLL_NNUM_MASK		(0xf)
-#else /* ! AST_SOC_G5 */
+#else /* ! CONFIG_TARGET_AST_G5 */
 #define SCU_H_PLL_PARAMETER		(0x1 << 18)
 #define SCU_H_PLL_BYPASS_EN		(0x1 << 17)
 #define SCU_H_PLL_OFF			(0x1 << 16)
@@ -412,7 +410,7 @@
 #define SCU_H_PLL_DENUM(x)		(x)
 #define SCU_H_PLL_GET_DENUM(x)		(x & 0xf)
 #define SCU_H_PLL_DENUM_MASK		(0xf)
-#endif /* AST_SOC_G5 */
+#endif /* CONFIG_TARGET_AST_G5 */
 
 /* AST_SCU_MH_PLL_EXTEND 		0x148 - Extended Parameter of M/H-PLL register */
 #define SCU_H_PLL_GET_PARAMETER1(x)	((x >> 16) & 0x3f)
@@ -420,7 +418,7 @@
 #define SCU_M_PLL_GET_PARAMETER1(x)	(x & 0x3f)
 #define SCU_M_PLL_PARAMETER1_MASK(x)	(0x3f)
 
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 /* AST_SCU_D_PLL 			0x28 - D-PLL Parameter  register */
 #define SCU_D_PLL_GET_SIP(x)		((x >>27) & 0x1f)
 #define SCU_D_PLL_GET_SIC(x)		((x >>22) & 0x1f)
@@ -435,13 +433,13 @@
 #define SCU_D_PLL_BYPASS		(0x1 << 1)
 #define SCU_D_PLL_OFF			(0x1)
 
-#else /* ! AST_SOC_G5 */
+#else /* ! CONFIG_TARGET_AST_G5 */
 /* AST_SCU_FREQ_LIMIT			0x28 - frequency counter comparsion register */
 #define SCU_FREQ_U_LIMIT(x)		(x << 16)
 #define SCU_FREQ_U_LIMIT_MASK		(0x3fff << 16)
 #define SCU_FREQ_L_LIMIT(x)		(x)
 #define SCU_FREQ_L_LIMIT_MASK		(0x3fff)
-#endif /* AST_SOC_G5 */
+#endif /* CONFIG_TARGET_AST_G5 */
 
 /* AST_SCU_MISC1_CTRL			 0x2C - Misc. Control register */
 #define SCU_MISC_JTAG_MASTER_DIS	(0x1 << 26)
@@ -449,7 +447,7 @@
 #define SCU_MISC_SPI_W_P2A_DIS		(0x1 << 24)
 #define SCU_MISC_SOC_W_P2A_DIS		(0x1 << 23)
 #define SCU_MISC_FLASH_W_P2A_DIS	(0x1 << 22)
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 #define SCU_MISC_CRT_CLK_H_SOURCE	(0x1 << 21)
 #define SCU_MISC_D_PLL_SOURCE		(0x1 << 20)
 #else
@@ -491,7 +489,7 @@
 #define SCU_PCI_REVISION_ID(x)		(x)
 
 /* AST_SCU_SYS_CTRL			0x3C - System reset contrl/status register*/
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 #define SCU_SYS_WDT3_RESET_FLAG		(0x1 << 4)
 #define SCU_SYS_WDT2_RESET_FLAG		(0x1 << 3)
 #define SCU_SYS_WDT_RESET_FLAG		(0x1 << 2)
@@ -529,7 +527,7 @@
 /* AST_SCU_MAC_CLK			0x48 - MAC interface clock delay setting register */
 
 /* AST_SCU_MISC2_CTRL			0x4C - Misc. 2 Control register */
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 #define SCU_PCIE_MAPPING_HIGH		(1 << 15)
 #define SCU_MALI_DTY_MODE		(1 << 8)
 #define SCU_MALI_RC_MODE		(1 << 7)
@@ -548,7 +546,7 @@
 /* AST_SCU_VGA_SCRATCH7			0x6c - VGA Scratch register */
 
 /* AST_SCU_HW_STRAP1			0x70 - hardware strapping register */
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 
 #define CLK_25M_IN			(0x1 << 23)
 
@@ -577,7 +575,7 @@
 #define     VGA_64M_DRAM		    3
 
 #define SCU_HW_STRAP_DIS_BOOT 		(1)
-#else /* !AST_SOC_G5 */
+#else /* !CONFIG_TARGET_AST_G5 */
 #define SCU_HW_STRAP_SW_DEFINE(x)	(x << 29)
 #define SCU_HW_STRAP_SW_DEFINE_MASK	(0x7 << 29)
 
@@ -654,7 +652,7 @@
 #define     SPI_BOOT			    2
 #define     DIS_BOOT			    3
 
-#endif /* AST_SOC_G5 */
+#endif /* CONFIG_TARGET_AST_G5 */
 
 /* AST_SCU_RAMDOM_GEN			0x74 - random number generator register */
 #define RNG_TYPE_MASK			(0x7 << 1)
@@ -767,7 +765,7 @@
 #define SCU_FUN_PIN_SGPMLD		(0x1 << 9)
 #define SCU_FUN_PIN_SGPMCK		(0x1 << 8)
 
-#if defined(AST_SOC_G5)
+#if defined(CONFIG_TARGET_AST_G5)
 #define SCU_FUN_PIN_I2C4_SALT4		(0x1 << 7)
 #define SCU_FUN_PIN_I2C3_SALT3		(0x1 << 6)
 #define SCU_FUN_PIN_I2C2_SALT2		(0x1 << 5)
diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefile
index 7d8930beb988..069eca939873 100644
--- a/arch/arm/mach-aspeed/Makefile
+++ b/arch/arm/mach-aspeed/Makefile
@@ -13,5 +13,5 @@
 
 obj-y += timer.o reset.o cpuinfo.o ast-scu.o ast-ahbc.o ast-sdmc.o
 obj-$(CONFIG_AST_SPI_NOR) += flash.o
-obj-$(CONFIG_ARCH_AST2500) += platform_g5.o
-obj-$(CONFIG_ARCH_AST2400) += platform_g4.o
+obj-$(CONFIG_TARGET_AST_G5) += platform_g5.o
+obj-$(CONFIG_TARGET_AST_G4) += platform_g4.o
diff --git a/arch/arm/mach-aspeed/ast-ahbc.c b/arch/arm/mach-aspeed/ast-ahbc.c
index 9a41482c0f25..800cd2c5fb1f 100644
--- a/arch/arm/mach-aspeed/ast-ahbc.c
+++ b/arch/arm/mach-aspeed/ast-ahbc.c
@@ -29,7 +29,6 @@
 #include <asm/io.h>
 #include <asm/arch/regs-ahbc.h>
 #include <asm/arch/ast-ahbc.h>
-#include <asm/arch/aspeed.h>
 
 static inline u32 ast_ahbc_read(u32 reg)
 {
@@ -58,13 +57,13 @@ static inline void ast_ahbc_write(u32 val, u32 reg)
 
 void ast_ahbc_boot_remap(void)
 {
-#if ! defined(AST_SOC_G5)
+#if ! defined(CONFIG_TARGET_AST_G5)
 	ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) |
 		       AHBC_BOOT_REMAP, AST_AHBC_ADDR_REMAP);
 #endif
 }
 
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 void ast_ahbc_peie_mapping(u8 enable)
 {
 	if (enable)
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index 0cc0d67b5d31..1a005d0c9547 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -41,7 +41,6 @@
 #include <asm/arch/regs-scu.h>
 #include <asm/arch/ast_scu.h>
 #include <asm/arch/platform.h>
-#include <asm/arch/aspeed.h>
 
 /* #define ASPEED_SCU_LOCK */
 
@@ -105,7 +104,7 @@ static struct soc_id soc_map_table[] = {
 void ast_scu_init_eth(u8 num)
 {
 /* Set MAC delay Timing */
-#ifndef AST_SOC_G5
+#ifndef CONFIG_TARGET_AST_G5
 	/* AST2300 max clk to 125Mhz, AST2400 max clk to 198Mhz */
 
 	/* RGMII --> H-PLL/6 */
@@ -156,7 +155,7 @@ void ast_scu_init_eth(u8 num)
  */
 void ast_scu_spi_master(u8 mode)
 {
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 	switch (mode) {
 	case 0:
 		ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
@@ -199,6 +198,10 @@ void ast_scu_spi_master(u8 mode)
 #endif
 }
 
+#define AST_PLL_25MHZ			25000000
+#define AST_PLL_24MHZ			24000000
+#define AST_PLL_12MHZ			12000000
+
 u32 ast_get_clk_source(void)
 {
 	if (ast_scu_read(AST_SCU_HW_STRAP1) & CLK_25M_IN)
@@ -207,7 +210,7 @@ u32 ast_get_clk_source(void)
 		return AST_PLL_24MHZ;
 }
 
-#if defined(AST_SOC_G5)
+#if defined(CONFIG_TARGET_AST_G5)
 
 u32 ast_get_h_pll_clk(void)
 {
@@ -250,7 +253,7 @@ u32 ast_get_ahbclk(void)
 	return ((hpll / axi_div) / ahb_div);
 }
 
-#else /* ! AST_SOC_G5 */
+#else /* ! CONFIG_TARGET_AST_G5 */
 
 u32 ast_get_h_pll_clk(void)
 {
@@ -316,12 +319,12 @@ u32 ast_get_ahbclk(void)
 	return (hpll / div);
 }
 
-#endif /* AST_SOC_G5 */
+#endif /* CONFIG_TARGET_AST_G5 */
 
 void ast_scu_show_system_info(void)
 {
 
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 	unsigned int axi_div, ahb_div, h_pll;
 
 	h_pll = ast_get_h_pll_clk();
@@ -366,7 +369,7 @@ void ast_scu_multi_func_eth(u8 num)
 				      AST_SCU_FUN_PIN_CTRL1);
 		}
 
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
 			      SCU_FUN_PIN_MAC0_PHY_LINK, AST_SCU_FUN_PIN_CTRL1);
 
diff --git a/arch/arm/mach-aspeed/cpuinfo.c b/arch/arm/mach-aspeed/cpuinfo.c
index 45f70a81833f..72f198587f41 100644
--- a/arch/arm/mach-aspeed/cpuinfo.c
+++ b/arch/arm/mach-aspeed/cpuinfo.c
@@ -8,7 +8,6 @@
 #include <asm/io.h>
 #include <asm/arch/ast_scu.h>
 #include <asm/arch/ast-sdmc.h>
-#include <asm/arch/aspeed.h>
 
 #if defined(CONFIG_DISPLAY_CPUINFO)
 int print_cpuinfo(void)
@@ -20,12 +19,12 @@ int print_cpuinfo(void)
 
 	ast_scu_sys_rest_info();
 
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 	ast_scu_security_info();
 #endif
 	printf("PLL :   %4s MHz\n", strmhz(buf, ast_get_clk_source()));
 	printf("CPU :   %4s MHz\n", strmhz(buf, ast_get_h_pll_clk()));
-#ifdef AST_SOC_G5
+#ifdef CONFIG_TARGET_AST_G5
 	printf("MEM :	%4s MHz, EEC: %s, Cache: %s \n",
 	       strmhz(buf, ast_get_m_pll_clk() * 2),
 	       ast_sdmc_get_eec() ? "Enable" : "Disable",
diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
index 01c5354b66d4..327aacb00c8f 100644
--- a/arch/arm/mach-aspeed/flash.c
+++ b/arch/arm/mach-aspeed/flash.c
@@ -31,7 +31,6 @@
 #include <environment.h>
 
 #include <asm/arch/ast_scu.h>
-#include <asm/arch/aspeed.h>
 
 
 /*
@@ -1277,7 +1276,7 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
 		write_status_register(info, 0x40);	/* enable QE */
 
 	if (info->address32) {
-#ifndef AST_SOC_G5
+#ifndef CONFIG_TARGET_AST_G5
 		reg = *((volatile ulong*) 0x1e6e2070);	/* set H/W Trappings */
 		reg |= 0x10;
 		*((volatile ulong*) 0x1e6e2070) = reg;
diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
index cc26a78529bc..84bdd39f2cac 100644
--- a/board/aspeed/ast-g4/ast-g4.c
+++ b/board/aspeed/ast-g4/ast-g4.c
@@ -8,7 +8,6 @@
 #include <common.h>
 #include <netdev.h>
 
-#include <asm/arch/platform.h>
 #include <asm/arch/ast-sdmc.h>
 #include <asm/arch/ast_scu.h>
 #include <asm/arch/regs-ahbc.h>
diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index 9d5ba98243ec..16cfac87cb8e 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -20,7 +20,6 @@
 #include <i2c.h>
 
 #include <asm/arch/ast_scu.h>
-#include <asm/arch/aspeed.h>
 
 #if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
 #include <miiphy.h>
diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index d0638158ab25..7725c1af173f 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -19,8 +19,6 @@
 #define CONFIG_ARCH_CPU_INIT
 #define CONFIG_MACH_TYPE		MACH_TYPE_ASPEED
 
-#include <asm/arch/platform.h>
-
 /* Misc CPU related */
 #define CONFIG_CMDLINE_TAG		/* enable passing of ATAGs */
 #define CONFIG_SETUP_MEMORY_TAGS
diff --git a/include/configs/ast-g4-ncsi.h b/include/configs/ast-g4-ncsi.h
index 31aa9fe1fec6..9a17a3bd0cd3 100644
--- a/include/configs/ast-g4-ncsi.h
+++ b/include/configs/ast-g4-ncsi.h
@@ -11,11 +11,11 @@
 #ifndef __AST_G4_NCSI_CONFIG_H
 #define __AST_G4_NCSI_CONFIG_H
 
-#define CONFIG_ARCH_AST2400
 #define CONFIG_SYS_LOAD_ADDR		0x43000000
 
 #define CONFIG_MISC_INIT_R
 
+#include <asm/arch/ast2400_platform.h>
 #include <configs/ast-common.h>
 
 /* Ethernet */
diff --git a/include/configs/ast-g4-phy.h b/include/configs/ast-g4-phy.h
index 185553864f3f..250abf5a2f44 100644
--- a/include/configs/ast-g4-phy.h
+++ b/include/configs/ast-g4-phy.h
@@ -11,11 +11,11 @@
 #ifndef __AST_G4_NCSI_CONFIG_H
 #define __AST_G4_NCSI_CONFIG_H
 
-#define CONFIG_ARCH_AST2400
 #define CONFIG_SYS_LOAD_ADDR		0x43000000
 
 #define CONFIG_MISC_INIT_R
 
+#include <asm/arch/ast2400_platform.h>
 #include <configs/ast-common.h>
 
 /* Ethernet */
diff --git a/include/configs/ast-g5-ncsi.h b/include/configs/ast-g5-ncsi.h
index f73a8f11507b..907ff9a5bb9d 100644
--- a/include/configs/ast-g5-ncsi.h
+++ b/include/configs/ast-g5-ncsi.h
@@ -11,9 +11,9 @@
 #ifndef __AST_G5_NCSI_CONFIG_H
 #define __AST_G5_NCSI_CONFIG_H
 
-#define CONFIG_ARCH_AST2500
 #define CONFIG_SYS_LOAD_ADDR		0x83000000
 
+#include <asm/arch/ast_g5_platform.h>
 #include <configs/ast-common.h>
 
 /* arm1176/start.S */
diff --git a/include/configs/ast-g5-phy.h b/include/configs/ast-g5-phy.h
index 9b10d06212e7..738fb93419f4 100644
--- a/include/configs/ast-g5-phy.h
+++ b/include/configs/ast-g5-phy.h
@@ -11,9 +11,9 @@
 #ifndef __AST_G5_PHY_CONFIG_H
 #define __AST_G5_PHY_CONFIG_H
 
-#define CONFIG_ARCH_AST2500
 #define CONFIG_SYS_LOAD_ADDR		0x83000000
 
+#include <asm/arch/ast_g5_platform.h>
 #include <configs/ast-common.h>
 
 /* arm1176/start.S */
-- 
2.7.4
