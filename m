Return-Path: <clg@kaod.org>
X-Greylist: delayed 30802 seconds by postgrey-1.35 at bilbo;
 Thu, 30 Jun 2016 02:10:56 AEST
Received: from 20.mo3.mail-out.ovh.net (20.mo3.mail-out.ovh.net [178.33.47.94])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfnhw3KK9zDqxX
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 02:10:56 +1000 (AEST)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 58156FF9791
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2016 18:10:53 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id F0E0444009F;
 Wed, 29 Jun 2016 18:10:47 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH uboot v2016.05-aspeed-openbmc 9/9] ast-g4/g5: large cleanup
Date: Wed, 29 Jun 2016 18:09:51 +0200
Message-Id: <1467216591-8616-10-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467216591-8616-1-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17513654528055937794
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudehgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Mailman-Approved-At: Thu, 30 Jun 2016 02:44:43 +1000
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
X-List-Received-Date: Wed, 29 Jun 2016 16:10:58 -0000

This is 99% code alignment cleanups, some removal of code not related
to the G4 of G5 and some very light rewrite.

Tested on palmetto and a ast2500 evb.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/include/asm/arch-aspeed/aspeed.h          |   16 +-
 arch/arm/include/asm/arch-aspeed/ast-ahbc.h        |   28 +-
 arch/arm/include/asm/arch-aspeed/ast-sdmc.h        |   49 +-
 .../arm/include/asm/arch-aspeed/ast2400_platform.h |  110 +-
 arch/arm/include/asm/arch-aspeed/ast_g5_platform.h |  291 ++-
 arch/arm/include/asm/arch-aspeed/ast_scu.h         |   70 +-
 arch/arm/include/asm/arch-aspeed/platform.h        |   26 +-
 arch/arm/include/asm/arch-aspeed/regs-ahbc.h       |   23 +-
 arch/arm/include/asm/arch-aspeed/regs-scu.h        | 1392 ++++++-------
 arch/arm/include/asm/arch-aspeed/regs-sdmc.h       |   20 +-
 arch/arm/include/asm/arch-aspeed/regs-spi.h        |   55 -
 arch/arm/mach-aspeed/ast-ahbc.c                    |  110 +-
 arch/arm/mach-aspeed/ast-scu.c                     | 2127 ++++++++++----------
 arch/arm/mach-aspeed/ast-sdmc.c                    |  179 +-
 arch/arm/mach-aspeed/cpuinfo.c                     |   19 +-
 arch/arm/mach-aspeed/timer.c                       |   50 +-
 16 files changed, 2108 insertions(+), 2457 deletions(-)
 delete mode 100644 arch/arm/include/asm/arch-aspeed/regs-spi.h

diff --git a/arch/arm/include/asm/arch-aspeed/aspeed.h b/arch/arm/include/asm/arch-aspeed/aspeed.h
index 556c280af261..7d2de1cbd43e 100644
--- a/arch/arm/include/asm/arch-aspeed/aspeed.h
+++ b/arch/arm/include/asm/arch-aspeed/aspeed.h
@@ -17,27 +17,13 @@
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
+
 #if defined(CONFIG_ARCH_AST3200) || defined(CONFIG_ARCH_AST2500) || defined(CONFIG_ARCH_AST1520)
 #define AST_SOC_G5
-#define NEW_VIC
 #define SRAM_SIZE 		SZ_32K
 #elif defined(CONFIG_ARCH_AST1400) || defined(CONFIG_ARCH_AST2400) || defined(CONFIG_ARCH_AST3100)
 #define AST_SOC_G4
-#define NEW_VIC
 #define SRAM_SIZE 		SZ_32K
-#elif defined(CONFIG_ARCH_AST1300) || defined(CONFIG_ARCH_AST2300) || defined(CONFIG_ARCH_AST1510)
-#define AST_SOC_G3
-#define NEW_VIC
-#define SRAM_SIZE 		SZ_16K
-#elif defined(CONFIG_ARCH_AST2150) || defined(CONFIG_ARCH_AST2200)
-#define AST_SOC_G2_5
-#elif defined(CONFIG_ARCH_AST1100) || defined(CONFIG_ARCH_AST2050) || defined(CONFIG_ARCH_AST2100)
-#define AST_SOC_G2
-#elif defined(CONFIG_ARCH_AST2000) || defined(CONFIG_ARCH_AST1000)
-#define AST_SOC_G1
-#elif defined(CONFIG_ARCH_AST1010)
-#define NEW_VIC
-#define SRAM_SIZE 		SZ_64K
 #else
 #error "Not define SoC generation"
 #endif
diff --git a/arch/arm/include/asm/arch-aspeed/ast-ahbc.h b/arch/arm/include/asm/arch-aspeed/ast-ahbc.h
index c00d8589d20e..c870d11127b7 100644
--- a/arch/arm/include/asm/arch-aspeed/ast-ahbc.h
+++ b/arch/arm/include/asm/arch-aspeed/ast-ahbc.h
@@ -1,26 +1,32 @@
-/********************************************************************************
+/*******************************************************************************
 * File Name     : arch/arm/mach-aspeed/include/plat/ast-ahbc.h
 * Author        : Ryan Chen
 * Description   : AST SCU Service Header
 *
 * Copyright (C) 2012-2020  ASPEED Technology Inc.
+*
 * This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by the Free Software Foundation;
-* either version 2 of the License, or (at your option) any later version.
-* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
-* without even the implied warranty of MERCHANTABILITY or
-* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+* it under the terms of the GNU General Public License as published by
+* the Free Software Foundation; either version 2 of the License, or
+* (at your option) any later version.
+*
+* This program is distributed in the hope that it will be useful, but
+* WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+* General Public License for more details.
+*
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
-* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
+* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+* USA
+*
 *   History      :
 *      1. 2014/08/03 Ryan Chen create this file
 *
-********************************************************************************/
+*******************************************************************************/
 
-#ifndef __AST_AHBC_H_INCLUDED
-#define __AST_AHBC_H_INCLUDED
+#ifndef __AST_AHBC_H
+#define __AST_AHBC_H
 
 extern void ast_ahbc_boot_remap(void);
 
diff --git a/arch/arm/include/asm/arch-aspeed/ast-sdmc.h b/arch/arm/include/asm/arch-aspeed/ast-sdmc.h
index 73cacb52cc13..4590d307c2e4 100644
--- a/arch/arm/include/asm/arch-aspeed/ast-sdmc.h
+++ b/arch/arm/include/asm/arch-aspeed/ast-sdmc.h
@@ -1,26 +1,31 @@
-/********************************************************************************
-* File Name     : arch/arm/mach-aspeed/include/plat/ast-sdmc.h
-* Author        : Ryan Chen
-* Description   : AST SDMC Header
-*
-* Copyright (C) 2012-2020  ASPEED Technology Inc.
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by the Free Software Foundation;
-* either version 2 of the License, or (at your option) any later version.
-* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
-* without even the implied warranty of MERCHANTABILITY or
-* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+/*******************************************************************************
+ * File Name     : arch/arm/mach-aspeed/include/plat/ast-sdmc.h
+ * Author        : Ryan Chen
+ * Description   : AST SDMC Header
+ *
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ *
+ *   History      :
+ *      1. 2012/08/03 Ryan Chen create this file
+ *
+ ******************************************************************************/
 
-*   History      :
-*      1. 2012/08/03 Ryan Chen create this file
-*
-********************************************************************************/
-
-#ifndef __AST_SDMC_H_INCLUDED
-#define __AST_SDMC_H_INCLUDED
+#ifndef __AST_SDMC_H
+#define __AST_SDMC_H
 
 extern u32 ast_sdmc_get_mem_size(void);
 extern u8 ast_sdmc_get_eec(void);
diff --git a/arch/arm/include/asm/arch-aspeed/ast2400_platform.h b/arch/arm/include/asm/arch-aspeed/ast2400_platform.h
index ba4a8106fad9..5c00bb60ea64 100644
--- a/arch/arm/include/asm/arch-aspeed/ast2400_platform.h
+++ b/arch/arm/include/asm/arch-aspeed/ast2400_platform.h
@@ -14,71 +14,69 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#ifndef _AST2400_PLATFORM_H_
-#define _AST2400_PLATFORM_H_                 1
+#ifndef _AST2400_PLATFORM_H
+#define _AST2400_PLATFORM_H
 
-#define AST_DRAM_BASE					0x40000000
+#define AST_DRAM_BASE		0x40000000
 
-#define AST_SRAM_SIZE					(SZ_16K*2)
+#define AST_SRAM_SIZE		(SZ_16K * 2)
 
-#define AST_OLD_SMC_BASE					0x10000000		/*Legacy BMC Static Memory */
-#define AST_OLD_SMC_CTRL_BASE				0x16000000		/*Legacy BMC Static Memory Ctrl*/
+#define AST_OLD_SMC_BASE	0x10000000 /* Legacy BMC Static Memory */
+#define AST_OLD_SMC_CTRL_BASE	0x16000000 /* Legacy BMC Static Memory Ctrl*/
 
-#define AST_AHBC_BASE            0x1E600000	/* AHB CONTROLLER */
+#define AST_AHBC_BASE		0x1E600000 /* AHB CONTROLLER */
 
-#define AST_FMC_BASE        					0x1E620000	/* NEW SMC CONTROLLER */
-#define AST_SPI_BASE        					0x1E630000	/* SPI CONTROLLER */
-#define AST_MIC_BASE                       0x1E640000	/* MIC CONTROLLER */
-#define AST_MAC0_BASE                      0x1E660000	/* MAC1 */ 
-#define AST_MAC1_BASE                      0x1E680000	/* MAC2 */
+#define AST_FMC_BASE		0x1E620000 /* NEW SMC CONTROLLER */
+#define AST_SPI_BASE		0x1E630000 /* SPI CONTROLLER */
+#define AST_MIC_BASE		0x1E640000 /* MIC CONTROLLER */
+#define AST_MAC0_BASE		0x1E660000 /* MAC1 */
+#define AST_MAC1_BASE		0x1E680000 /* MAC2 */
 
-#define AST_USB20_BASE                     0x1E6A0000	/* USB 2.0 VIRTUAL HUB CONTROLLER */
-#define AST_EHCI_BASE                0x1E6A1000	/* USB 2.0 HOST CONTROLLER */
-#define AST_UHCI_BASE                0x1E6B0000	/* USB 1.1 HOST CONTROLLER */
-#define AST_VIC_BASE                       0x1E6C0000	/* VIC */
-#define AST_SDMC_BASE                       0x1E6E0000	/* MMC */
-#define AST_USB11_BASE                     0x1E6E1000	/* USB11 */
-#define AST_SCU_BASE                       0x1E6E2000	/* SCU */
-#define AST_CRYPTO_BASE                    0x1E6E3000	/* Crypto */
-#define AST_JTAG_BASE                      0x1E6E4000	/* JTAG */
-#define AST_GRAPHIC_BASE                   0x1E6E6000	/* Graphics */
-#define AST_XDMA_BASE                      0x1E6E7000	/* XDMA */
-#define AST_MCTP_BASE                      0x1E6E8000	/* MCTP */
-#define AST_ADC_BASE                       0x1E6E9000	/* ADC */
+#define AST_USB20_BASE		0x1E6A0000 /* USB 2.0 VIRTUAL HUB CONTROLLER */
+#define AST_EHCI_BASE		0x1E6A1000 /* USB 2.0 HOST CONTROLLER */
+#define AST_UHCI_BASE		0x1E6B0000 /* USB 1.1 HOST CONTROLLER */
+#define AST_VIC_BASE		0x1E6C0000 /* VIC */
+#define AST_SDMC_BASE		0x1E6E0000 /* MMC */
+#define AST_USB11_BASE		0x1E6E1000 /* USB11 */
+#define AST_SCU_BASE		0x1E6E2000 /* SCU */
+#define AST_CRYPTO_BASE		0x1E6E3000 /* Crypto */
+#define AST_JTAG_BASE		0x1E6E4000 /* JTAG */
+#define AST_GRAPHIC_BASE	0x1E6E6000 /* Graphics */
+#define AST_XDMA_BASE		0x1E6E7000 /* XDMA */
+#define AST_MCTP_BASE		0x1E6E8000 /* MCTP */
+#define AST_ADC_BASE		0x1E6E9000 /* ADC */
 
-#define AST_LPC_PLUS_BASE                  0x1E6EC000	/* LPC+ Controller */
+#define AST_LPC_PLUS_BASE	0x1E6EC000 /* LPC+ Controller */
 
-#define AST_VIDEO_BASE                     0x1E700000	/* VIDEO ENGINE */
-#define AST_SRAM_BASE                      0x1E720000	/* SRAM */
-#define AST_SDHC_BASE                      0x1E740000	/* SDHC */
-#define AST_2D_BASE                        0x1E760000	/* 2D */
-#define AST_GPIO_BASE                      0x1E780000	/* GPIO */
-#define AST_RTC_BASE                       0x1E781000	/* RTC */
-#define AST_TIMER_BASE                     0x1E782000	/* TIMER #0~7*/
-#define AST_UART1_BASE                     0x1E783000	/* UART1 */
-#define AST_UART0_BASE                     0x1E784000	/* UART5 */
-#define AST_WDT_BASE                       0x1E785000	/* WDT */
-#define AST_PWM_BASE                       0x1E786000	/* PWM */
-#define AST_VUART0_BASE                    0x1E787000	/* VUART1 */
-#define AST_PUART_BASE                     0x1E788000	/* PUART */
-#define AST_LPC_BASE                       0x1E789000	/* LPC */
-#define AST_I2C_BASE                       0x1E78A000	/* I2C */
-#define AST_PECI_BASE                      0x1E78B000	/* PECI */
-#define AST_PCIARBITER_BASE                0x1E78C000	/* PCI ARBITER */
-#define AST_UART2_BASE                     0x1E78D000	/* UART2 */
-#define AST_UART3_BASE                     0x1E78E000	/* UART3 */
-#define AST_UART4_BASE                     0x1E78F000	/* UART4 */
-#define AST_SPI_MEM						  0x30000000
+#define AST_VIDEO_BASE		0x1E700000 /* VIDEO ENGINE */
+#define AST_SRAM_BASE		0x1E720000 /* SRAM */
+#define AST_SDHC_BASE		0x1E740000 /* SDHC */
+#define AST_2D_BASE		0x1E760000 /* 2D */
+#define AST_GPIO_BASE		0x1E780000 /* GPIO */
+#define AST_RTC_BASE		0x1E781000 /* RTC */
+#define AST_TIMER_BASE		0x1E782000 /* TIMER #0~7*/
+#define AST_UART1_BASE		0x1E783000 /* UART1 */
+#define AST_UART0_BASE		0x1E784000 /* UART5 */
+#define AST_WDT_BASE		0x1E785000 /* WDT */
+#define AST_PWM_BASE		0x1E786000 /* PWM */
+#define AST_VUART0_BASE		0x1E787000 /* VUART1 */
+#define AST_PUART_BASE		0x1E788000 /* PUART */
+#define AST_LPC_BASE		0x1E789000 /* LPC */
+#define AST_I2C_BASE		0x1E78A000 /* I2C */
+#define AST_PECI_BASE		0x1E78B000 /* PECI */
+#define AST_PCIARBITER_BASE	0x1E78C000 /* PCI ARBITER */
+#define AST_UART2_BASE		0x1E78D000 /* UART2 */
+#define AST_UART3_BASE		0x1E78E000 /* UART3 */
+#define AST_UART4_BASE		0x1E78F000 /* UART4 */
+#define AST_SPI_MEM		0x30000000
 
-#define AST_LPC_PLUS_BRIDGE					0x70000000
+#define AST_LPC_PLUS_BRIDGE	0x70000000
+#define AST_LPC_BRIDGE		0x60000000
 
-#define AST_LPC_BRIDGE						0x60000000
-
-
-#define AST_FMC_CS0_BASE		               	  0x20000000	/* CS0 */
-#define AST_FMC_CS1_BASE		               	  0x24000000	/* CS1 */
-#define AST_FMC_CS2_BASE		               	  0x26000000	/* CS2 */
-#define AST_FMC_CS3_BASE		               	  0x28000000	/* CS3 */
-#define AST_FMC_CS4_BASE		               	  0x2a000000	/* CS4 */
+#define AST_FMC_CS0_BASE	0x20000000 /* CS0 */
+#define AST_FMC_CS1_BASE	0x24000000 /* CS1 */
+#define AST_FMC_CS2_BASE	0x26000000 /* CS2 */
+#define AST_FMC_CS3_BASE	0x28000000 /* CS3 */
+#define AST_FMC_CS4_BASE	0x2a000000 /* CS4 */
 
 #endif
diff --git a/arch/arm/include/asm/arch-aspeed/ast_g5_platform.h b/arch/arm/include/asm/arch-aspeed/ast_g5_platform.h
index 6284ec8db0e2..3b178cdbe236 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_g5_platform.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_g5_platform.h
@@ -14,178 +14,177 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#ifndef _AST_G5_PLATFORM_H_
-#define _AST_G5_PLATFORM_H_                 1
+#ifndef _AST_G5_PLATFORM_H
+#define _AST_G5_PLATFORM_H
 
 #ifdef CONFIG_AST_PCIE_EXT
 /*
-#define AST_PCI_EXT_ADC					(AST_PCIE_WIN_BASE + 0x2000)
-#define AST_PCI_EXT_PWM					(AST_PCIE_WIN_BASE + 0x3000)
-#define AST_PCI_EXT_GPIO					(AST_PCIE_WIN_BASE + 0x4000)
+#define AST_PCI_EXT_ADC			(AST_PCIE_WIN_BASE + 0x2000)
+#define AST_PCI_EXT_PWM			(AST_PCIE_WIN_BASE + 0x3000)
+#define AST_PCI_EXT_GPIO		(AST_PCIE_WIN_BASE + 0x4000)
 */
-#define AST_PCI_EXT_I2C					(AST_PCIE_WIN_BASE + 0x5000)
-#define AST_PCI_EXT_SCU					(AST_PCIE_WIN_BASE + 0x6000)
-#define AST_PCI_EXT_VIC					(AST_PCIE_WIN_BASE + 0x7000)
+#define AST_PCI_EXT_I2C			(AST_PCIE_WIN_BASE + 0x5000)
+#define AST_PCI_EXT_SCU			(AST_PCIE_WIN_BASE + 0x6000)
+#define AST_PCI_EXT_VIC			(AST_PCIE_WIN_BASE + 0x7000)
 
-#define AST_PCI_EXT_GPIO					(AST_PCIE_WIN_BASE + 0x10000)
-#define AST_PCI_EXT_UART1				(AST_PCIE_WIN_BASE + 0x13000)
-#define AST_PCI_EXT_UART0				(AST_PCIE_WIN_BASE + 0x14000)
-#define AST_PCI_EXT_UART2				(AST_PCIE_WIN_BASE + 0x1D000)
-#define AST_PCI_EXT_UART3				(AST_PCIE_WIN_BASE + 0x1E000)
-#define AST_PCI_EXT_UART4				(AST_PCIE_WIN_BASE + 0x1F000)
+#define AST_PCI_EXT_GPIO		(AST_PCIE_WIN_BASE + 0x10000)
+#define AST_PCI_EXT_UART1		(AST_PCIE_WIN_BASE + 0x13000)
+#define AST_PCI_EXT_UART0		(AST_PCIE_WIN_BASE + 0x14000)
+#define AST_PCI_EXT_UART2		(AST_PCIE_WIN_BASE + 0x1D000)
+#define AST_PCI_EXT_UART3		(AST_PCIE_WIN_BASE + 0x1E000)
+#define AST_PCI_EXT_UART4		(AST_PCIE_WIN_BASE + 0x1F000)
 
 #endif
 
-#define AST_DRAM_BASE					0x80000000
-
-#define AST_SRAM_SIZE					(SZ_32K)
-
-#define AST_AHBC_BASE					0x1E600000	/* AHB CONTROLLER */
-
-#define AST_FMC_BASE        				0x1E620000	/* NEW SMC CONTROLLER */
-#define AST_FMC_SPI0_BASE				0x1E630000	/* NEW SMC CONTROLLER */
-#define AST_FMC_SPI1_BASE				0x1E631000	/* NEW SMC CONTROLLER */
-
-#define AST_MIC_BASE						0x1E650000	/* Memory Integrity Check Controller */
-#define AST_MAC0_BASE					0x1E660000	/* MAC1 */
-#define AST_MAC1_BASE					0x1E680000	/* MAC2 */
-
-#define AST_VHUB_BASE					0x1E6A0000	/* USB 2.0 VIRTUAL HUB CONTROLLER */
-#define AST_EHCI0_BASE					0x1E6A1000	/* USB 2.0 HOST CONTROLLER */
-#define AST_UDC1_BASE					0x1E6A2000	/* USB 2.0 Device CONTROLLER */
-#define AST_EHCI1_BASE					0x1E6A3000	/* USB 2.0 HOST CONTROLLER */
-#define AST_UHCI_BASE					0x1E6B0000	/* USB 1.1 HOST CONTROLLER */
-#define AST_VIC_BASE						0x1E6C0000	/* VIC */
-#define AST_SDMC_BASE					0x1E6E0000	/* MMC SDRAM*/
-#define AST_HID_BASE						0x1E6E1000	/* USB 1.1 Controller */
-#define AST_SCU_BASE						0x1E6E2000	/* SCU */
-#define AST_CRYPTO_BASE					0x1E6E3000	/* Crypto */
-#define AST_JTAG_BASE					0x1E6E4000	/* JTAG */
-#define AST_I2S_BASE						0x1E6E5000	/* I2S */
-#define AST_CRT0_BASE					0x1E6E6000	/* CRT0 */
-#define AST_CRT1_BASE					0x1E6E6100	/* CRT1 */
-#define AST_CRT2_BASE					0x1E6E6200	/* CRT2 */
-#define AST_CRT3_BASE					0x1E6E6300	/* CRT3 */
-#define AST_XDMA_BASE					0x1E6E7000	/* XDMA */
-#define AST_MCTP_BASE					0x1E6E8000	/* MCTP */
-#define AST_ADC_BASE					0x1E6E9000	/* ADC */
-#define AST_ENTROPY_BASE				0x1E6EB000	/* Entropy  */
-#define AST_BULK_BASE					0x1E6EB100	/* Bulk Decoder	*/
-#define AST_CMDQ_BASE					0x1E6EB180	/* CMDQ */
-#define AST_BITBLT_BASE					0x1E6EB200	/* Bitblt	*/
-#define AST_RLE_BASE					0x1E6EB300	/* RLE	*/
-#define AST_EGFX_BASE					0x1E6EB400	/* EGFX	*/
-#define AST_VMASK_BASE					0x1E6EB600	/* VMASK	*/
-#define AST_GMASK_BASE					0x1E6EB680	/* GMASK	*/
-
-#define AST_EGFX_SYS_BASE				0x1E6EB700	/* EGFXSYS*/
-
-#define AST_LPC_PLUS_BASE				0x1E6EC000	/* LPC+ */
-#define AST_PCIE_PLDA_BASE				0x1E6ED000	/* PCIE PLDA Bridge */
-#define AST_ESPI_BASE						0x1E6EE000	/* e-SPI  */
-#define AST_BSRAM_BASE					0x1E6EF000	/* Battery Backup SRAM  */
-#define AST_P2X_BASE                      		0x1E6F0000	/* P2X */
-
-/* */
-
-#define AST_VIDEO_BASE              			0x1E700000	/* VIDEO ENGINE */
-#define AST_SRAM_BASE               			0x1E720000	/* SRAM */
-#define AST_SDHC_BASE					0x1E740000	/* SD */
-#define AST_2D_BASE						0x1E760000	/* 2D */
-#define AST_GPIO_BASE					0x1E780000	/* GPIO */
-#define AST_SGPIO_BASE					0x1E780200	/* SGPIO */
-#define AST_SGPIO_S_BASE				0x1E780300	/* SGPIO Slave*/
-#define AST_RTC_BASE						0x1E781000	/* RTC */
-#define AST_TIMER_BASE              			0x1E782000	/* TIMER #0~2*/
-#define AST_UART1_BASE              			0x1E783000	/* UART1 */
-#define AST_UART0_BASE              			0x1E784000	/* UART5 */
-#define AST_WDT_BASE                			0x1E785000	/* WDT */
-#define AST_PWM_BASE					0x1E786000	/* PWM */
-#define AST_VUART0_BASE					0x1E787000	/* VUART1 */
-#define AST_PUART_BASE					0x1E788000	/* PUART */
-#define AST_LPC_BASE						0x1E789000	/* LPC */
-#define AST_MBX_BASE					0x1E789200	/* Mailbox */
-#define AST_I2C_BASE						0x1E78A000	/* I2C */
-#define AST_PECI_BASE						0x1E78B000	/* PECI */
-#define AST_PCIARBITER_BASE			0x1E78C000	/* PCI ARBITER */
-#define AST_UART2_BASE					0x1E78D000	/* UART2 */
-#define AST_UART3_BASE					0x1E78E000	/* UART3 */
-#define AST_UART4_BASE					0x1E78F000	/* UART4 */
-#define AST_UART5_BASE					0x1E790000	/* UART6 */
-#define AST_UART6_BASE					0x1E791000	/* UART7 */
-#define AST_UART7_BASE					0x1E792000	/* UART8 */
-#define AST_UART8_BASE					0x1E793000	/* UART9 */
-#define AST_UART9_BASE					0x1E794000	/* UART10 */
-#define AST_UART10_BASE					0x1E795000	/* UART11 */
-#define AST_UART11_BASE					0x1E796000	/* UART12 */
-#define AST_UART12_BASE					0x1E797000	/* UART13 */
-#define AST_UART_SDMA_BASE			0x1E79E000	/* UART SDMA */
-
-#define AST_H264_BASE					0x1E7C0000	/* H.264 */
-#define AST_FORMATTER_BASE			0x1E7C2100	/* Formatter */
-
-
-#define AST_FMC_CS0_BASE				0x20000000	/* CS0 */
-#define AST_FMC_CS1_BASE				0x28000000	/* CS1 */
-#define AST_FMC_CS2_BASE				0x2a000000	/* CS2 */
-
-#define AST_SPI0_CS0_BASE				0x30000000	/* SPI 2 Flash CS 0 Memory */
-#define AST_SPI0_CS1_BASE				0x32000000	/* SPI 2 Flash CS 1 Memory */
-
-#define AST_SPI1_CS0_BASE				0x38000000	/* SPI 3 Flash CS 0 Memory */
-#define AST_SPI1_CS1_BASE				0x3a000000	/* SPI 3 Flash CS 1 Memory */
-
-#define AST_LPC_BRIDGE					0x60000000
-#define AST_LPC_PLUS_BRIDGE			0x70000000
-
-#define AST_PCIE_WIN_BASE				0x70000000
-#define AST_PCIE_WIN_SIZE				0x10000000
+#define AST_DRAM_BASE			0x80000000
+
+#define AST_SRAM_SIZE			(SZ_32K)
+
+#define AST_AHBC_BASE			0x1E600000 /* AHB CONTROLLER */
+
+#define AST_FMC_BASE        		0x1E620000 /* NEW SMC CONTROLLER */
+#define AST_FMC_SPI0_BASE		0x1E630000 /* NEW SMC CONTROLLER */
+#define AST_FMC_SPI1_BASE		0x1E631000 /* NEW SMC CONTROLLER */
+
+#define AST_MIC_BASE			0x1E650000 /* Memory Integrity Check Controller */
+#define AST_MAC0_BASE			0x1E660000 /* MAC1 */
+#define AST_MAC1_BASE			0x1E680000 /* MAC2 */
+#define AST_VHUB_BASE			0x1E6A0000 /* USB 2.0 VIRTUAL HUB CONTROLLER */
+#define AST_EHCI0_BASE			0x1E6A1000 /* USB 2.0 HOST CONTROLLER */
+#define AST_UDC1_BASE			0x1E6A2000 /* USB 2.0 Device CONTROLLER */
+#define AST_EHCI1_BASE			0x1E6A3000 /* USB 2.0 HOST CONTROLLER */
+#define AST_UHCI_BASE			0x1E6B0000 /* USB 1.1 HOST CONTROLLER */
+#define AST_VIC_BASE			0x1E6C0000 /* VIC */
+#define AST_SDMC_BASE			0x1E6E0000 /* MMC SDRAM*/
+#define AST_HID_BASE			0x1E6E1000 /* USB 1.1 Controller */
+#define AST_SCU_BASE			0x1E6E2000 /* SCU */
+#define AST_CRYPTO_BASE			0x1E6E3000 /* Crypto */
+#define AST_JTAG_BASE			0x1E6E4000 /* JTAG */
+#define AST_I2S_BASE			0x1E6E5000 /* I2S */
+#define AST_CRT0_BASE			0x1E6E6000 /* CRT0 */
+#define AST_CRT1_BASE			0x1E6E6100 /* CRT1 */
+#define AST_CRT2_BASE			0x1E6E6200 /* CRT2 */
+#define AST_CRT3_BASE			0x1E6E6300 /* CRT3 */
+#define AST_XDMA_BASE			0x1E6E7000 /* XDMA */
+#define AST_MCTP_BASE			0x1E6E8000 /* MCTP */
+#define AST_ADC_BASE			0x1E6E9000 /* ADC */
+#define AST_ENTROPY_BASE		0x1E6EB000 /* Entropy  */
+#define AST_BULK_BASE			0x1E6EB100 /* Bulk Decoder	*/
+#define AST_CMDQ_BASE			0x1E6EB180 /* CMDQ */
+#define AST_BITBLT_BASE			0x1E6EB200 /* Bitblt	*/
+#define AST_RLE_BASE			0x1E6EB300 /* RLE	*/
+#define AST_EGFX_BASE			0x1E6EB400 /* EGFX	*/
+#define AST_VMASK_BASE			0x1E6EB600 /* VMASK	*/
+#define AST_GMASK_BASE			0x1E6EB680 /* GMASK	*/
+
+#define AST_EGFX_SYS_BASE		0x1E6EB700 /* EGFXSYS*/
+
+#define AST_LPC_PLUS_BASE		0x1E6EC000 /* LPC+ */
+#define AST_PCIE_PLDA_BASE		0x1E6ED000 /* PCIE PLDA Bridge */
+#define AST_ESPI_BASE			0x1E6EE000 /* e-SPI  */
+#define AST_BSRAM_BASE			0x1E6EF000 /* Battery Backup SRAM  */
+#define AST_P2X_BASE                    0x1E6F0000 /* P2X */
+
+#define AST_VIDEO_BASE              	0x1E700000 /* VIDEO ENGINE */
+#define AST_SRAM_BASE               	0x1E720000 /* SRAM */
+#define AST_SDHC_BASE			0x1E740000 /* SD */
+#define AST_2D_BASE			0x1E760000 /* 2D */
+#define AST_GPIO_BASE			0x1E780000 /* GPIO */
+#define AST_SGPIO_BASE			0x1E780200 /* SGPIO */
+#define AST_SGPIO_S_BASE		0x1E780300 /* SGPIO Slave*/
+#define AST_RTC_BASE			0x1E781000 /* RTC */
+#define AST_TIMER_BASE              	0x1E782000 /* TIMER #0~2*/
+#define AST_UART1_BASE              	0x1E783000 /* UART1 */
+#define AST_UART0_BASE              	0x1E784000 /* UART5 */
+#define AST_WDT_BASE                	0x1E785000 /* WDT */
+#define AST_PWM_BASE			0x1E786000 /* PWM */
+#define AST_VUART0_BASE			0x1E787000 /* VUART1 */
+#define AST_PUART_BASE			0x1E788000 /* PUART */
+#define AST_LPC_BASE			0x1E789000 /* LPC */
+#define AST_MBX_BASE			0x1E789200 /* Mailbox */
+#define AST_I2C_BASE			0x1E78A000 /* I2C */
+#define AST_PECI_BASE			0x1E78B000 /* PECI */
+#define AST_PCIARBITER_BASE		0x1E78C000 /* PCI ARBITER */
+#define AST_UART2_BASE			0x1E78D000 /* UART2 */
+#define AST_UART3_BASE			0x1E78E000 /* UART3 */
+#define AST_UART4_BASE			0x1E78F000 /* UART4 */
+#define AST_UART5_BASE			0x1E790000 /* UART6 */
+#define AST_UART6_BASE			0x1E791000 /* UART7 */
+#define AST_UART7_BASE			0x1E792000 /* UART8 */
+#define AST_UART8_BASE			0x1E793000 /* UART9 */
+#define AST_UART9_BASE			0x1E794000 /* UART10 */
+#define AST_UART10_BASE			0x1E795000 /* UART11 */
+#define AST_UART11_BASE			0x1E796000 /* UART12 */
+#define AST_UART12_BASE			0x1E797000 /* UART13 */
+#define AST_UART_SDMA_BASE		0x1E79E000 /* UART SDMA */
+
+#define AST_H264_BASE			0x1E7C0000 /* H.264 */
+#define AST_FORMATTER_BASE		0x1E7C2100 /* Formatter */
+
+
+#define AST_FMC_CS0_BASE		0x20000000 /* CS0 */
+#define AST_FMC_CS1_BASE		0x28000000 /* CS1 */
+#define AST_FMC_CS2_BASE		0x2a000000 /* CS2 */
+
+#define AST_SPI0_CS0_BASE		0x30000000 /* SPI 2 Flash CS 0 Memory */
+#define AST_SPI0_CS1_BASE		0x32000000 /* SPI 2 Flash CS 1 Memory */
+
+#define AST_SPI1_CS0_BASE		0x38000000 /* SPI 3 Flash CS 0 Memory */
+#define AST_SPI1_CS1_BASE		0x3a000000 /* SPI 3 Flash CS 1 Memory */
+
+#define AST_LPC_BRIDGE			0x60000000
+#define AST_LPC_PLUS_BRIDGE		0x70000000
+
+#define AST_PCIE_WIN_BASE		0x70000000
+#define AST_PCIE_WIN_SIZE		0x10000000
 
 #ifdef CONFIG_AST_VIDEO
-#define ASR_VIDEO_MEM_SIZE				0x2800000		//40MB
-#define ASR_VIDEO_MEM 					(AST_DRAM_BASE + (SZ_8M*10))//(AST_DRAM_BASE + SZ_256M)
+#define ASR_VIDEO_MEM_SIZE		0x2800000 /* 40MB */
+#define ASR_VIDEO_MEM 			(AST_DRAM_BASE + (SZ_8M*10)) /* (AST_DRAM_BASE + SZ_256M) */
 
-#define AST_CRT0_MEM_SIZE				SZ_8M
-#define AST_CRT0_MEM_BASE				(ASR_VIDEO_MEM + ASR_VIDEO_MEM_SIZE)
+#define AST_CRT0_MEM_SIZE		SZ_8M
+#define AST_CRT0_MEM_BASE		(ASR_VIDEO_MEM + ASR_VIDEO_MEM_SIZE)
 #else
 
-#define AST_CRT0_MEM_SIZE				SZ_8M
-#define AST_CRT0_MEM_BASE				(AST_DRAM_BASE + 0x8000000)		//from 128M
+#define AST_CRT0_MEM_SIZE		SZ_8M
+#define AST_CRT0_MEM_BASE		(AST_DRAM_BASE + 0x8000000)		//from 128M
 #endif
 
-#define AST_CURSOR0_MEM_SIZE			SZ_1M
-#define AST_CURSOR0_MEM_BASE			(AST_CRT0_MEM_BASE + AST_CRT0_MEM_SIZE)
+#define AST_CURSOR0_MEM_SIZE		SZ_1M
+#define AST_CURSOR0_MEM_BASE		(AST_CRT0_MEM_BASE + AST_CRT0_MEM_SIZE)
 
-#define AST_CRT1_MEM_SIZE				SZ_8M
-#define AST_CRT1_MEM_BASE				(AST_CURSOR0_MEM_BASE + AST_CURSOR0_MEM_SIZE)
+#define AST_CRT1_MEM_SIZE		SZ_8M
+#define AST_CRT1_MEM_BASE		(AST_CURSOR0_MEM_BASE + AST_CURSOR0_MEM_SIZE)
 
-#define AST_CRT2_MEM_SIZE				SZ_8M
-#define AST_CRT2_MEM_BASE				(AST_CRT1_MEM_BASE + AST_CRT1_MEM_SIZE)
+#define AST_CRT2_MEM_SIZE		SZ_8M
+#define AST_CRT2_MEM_BASE		(AST_CRT1_MEM_BASE + AST_CRT1_MEM_SIZE)
 
-#define AST_CRT3_MEM_SIZE				SZ_8M
-#define AST_CRT3_MEM_BASE				(AST_CRT2_MEM_BASE + AST_CRT2_MEM_SIZE)
+#define AST_CRT3_MEM_SIZE		SZ_8M
+#define AST_CRT3_MEM_BASE		(AST_CRT2_MEM_BASE + AST_CRT2_MEM_SIZE)
 
-#define AST_BULK_STREAM_MEM_SIZE		SZ_8M	//4Mb for bulk , 4Mb for history
-#define AST_BULK_STREAM_MEM_BASE		(AST_CRT3_MEM_BASE + AST_CRT3_MEM_SIZE)
+#define AST_BULK_STREAM_MEM_SIZE	SZ_8M /* 4Mb for bulk , 4Mb for history */
+#define AST_BULK_STREAM_MEM_BASE	(AST_CRT3_MEM_BASE + AST_CRT3_MEM_SIZE)
 
-#define AST_GRAPHIC_STREAM_MEM_SIZE	SZ_8M	//4Mb for bulk , 4Mb for history
+#define AST_GRAPHIC_STREAM_MEM_SIZE	SZ_8M /* 4Mb for bulk , 4Mb for history */
 #define AST_GRAPHIC_STREAM_MEM_BASE	(AST_BULK_STREAM_MEM_BASE + AST_BULK_STREAM_MEM_SIZE)
 
-#define AST_ENTROPY_MEM_SIZE			SZ_4M
-#define AST_ENTROPY_MEM_BASE 			(AST_GRAPHIC_STREAM_MEM_BASE + AST_GRAPHIC_STREAM_MEM_SIZE)
+#define AST_ENTROPY_MEM_SIZE		SZ_4M
+#define AST_ENTROPY_MEM_BASE 		(AST_GRAPHIC_STREAM_MEM_BASE + AST_GRAPHIC_STREAM_MEM_SIZE)
 
-#define AST_CMDQ_MEM_SIZE				SZ_2M
-#define AST_CMDQ_MEM_BASE 			(AST_ENTROPY_MEM_BASE + AST_ENTROPY_MEM_SIZE)
+#define AST_CMDQ_MEM_SIZE		SZ_2M
+#define AST_CMDQ_MEM_BASE 		(AST_ENTROPY_MEM_BASE + AST_ENTROPY_MEM_SIZE)
 
-#define AST_VMASK_MEM_SIZE			SZ_1M
-#define AST_VMASK_MEM_BASE 			(AST_CMDQ_MEM_BASE + AST_CMDQ_MEM_SIZE)
+#define AST_VMASK_MEM_SIZE		SZ_1M
+#define AST_VMASK_MEM_BASE 		(AST_CMDQ_MEM_BASE + AST_CMDQ_MEM_SIZE)
 
-#define AST_GMASK_MEM_SIZE			SZ_1M
-#define AST_GMASK_MEM_BASE 			(AST_VMASK_MEM_BASE + AST_VMASK_MEM_SIZE)
+#define AST_GMASK_MEM_SIZE		SZ_1M
+#define AST_GMASK_MEM_BASE 		(AST_VMASK_MEM_BASE + AST_VMASK_MEM_SIZE)
 
-#define AST_H264_MEM_SIZE				0x1100000 		//11MB : BS 8MB + fifo 3 * 3MB
-#define AST_H264_MEM_BASE 				(AST_GMASK_MEM_BASE + AST_GMASK_MEM_SIZE)
+#define AST_H264_MEM_SIZE		0x1100000 /* 11MB : BS 8MB + fifo 3 * 3MB */
+#define AST_H264_MEM_BASE 		(AST_GMASK_MEM_BASE + AST_GMASK_MEM_SIZE)
 
-#define AST_FORMATTER_MEM_SIZE		0xC00000 			//12MB
+#define AST_FORMATTER_MEM_SIZE		0xC00000 /* 12MB */
 #define AST_FORMATTER_MEM_BASE 		(AST_H264_MEM_BASE + AST_H264_MEM_SIZE)
+
+
 #endif
diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
index f961f4c289a3..c35aeb829c4f 100644
--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -1,28 +1,34 @@
-/********************************************************************************
-* File Name     : arch/arm/mach-aspeed/include/plat/ast-scu.h
-* Author        : Ryan Chen
-* Description   : AST SCU Service Header
-*
-* Copyright (C) 2012-2020  ASPEED Technology Inc.
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by the Free Software Foundation;
-* either version 2 of the License, or (at your option) any later version.
-* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
-* without even the implied warranty of MERCHANTABILITY or
-* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-*   History      :
-*      1. 2012/08/03 Ryan Chen create this file
-*
-********************************************************************************/
+/*******************************************************************************
+ * File Name     : arch/arm/mach-aspeed/include/plat/ast-scu.h
+ * Author        : Ryan Chen
+ * Description   : AST SCU Service Header
+ *
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+ * USA
+ *
+ *   History      :
+ *      1. 2012/08/03 Ryan Chen create this file
+ *
+ ******************************************************************************/
 
 #ifndef __AST_SCU_H_INCLUDED
 #define __AST_SCU_H_INCLUDED
 
-//information
+/* information */
 extern void ast_scu_show_system_info (void);
 extern void ast_scu_sys_rest_info(void);
 extern void ast_scu_security_info(void);
@@ -32,7 +38,7 @@ extern u32 ast_scu_get_phy_config(u8 mac_num);
 extern u32 ast_scu_get_vga_memsize(void);
 extern void ast_scu_get_who_init_dram(void);
 
-//CLK
+/* CLK */
 extern void ast_scu_uart_div(void);
 extern u32 ast_get_clk_source(void);
 extern u32 ast_get_h_pll_clk(void);
@@ -53,7 +59,7 @@ extern u8 ast_scu_get_vga_display(void);
 
 extern u32 ast_scu_get_vga_memsize(void);
 
-//Ctrl Initial
+/* Ctrl Initial */
 extern void ast_scu_init_uart(u8);
 extern void ast_scu_init_video(u8 dynamic_en);
 extern void ast_scu_reset_video(void);
@@ -80,7 +86,7 @@ extern void ast_scu_init_hace(void);
 extern void ast_scu_uartx_init(void);
 extern void ast_scu_spi_master(u8 mode);
 
-//Share pin
+/* Share pin */
 extern void ast_scu_multi_func_uart(u8 uart);
 extern void ast_scu_multi_func_video(void);
 extern void ast_scu_multi_func_eth(u8 num);
@@ -93,11 +99,21 @@ extern void ast_scu_multi_func_romcs(u8 num);
 
 extern void ast_scu_multi_func_i2c(void);
 extern void ast_scu_multi_func_pwm_tacho(void);
-//0 : usb 1.1 hid controller, 1:usb 2.0 device controller, 2:usb 2.0 host2 controller
+
+/* 0 : usb 1.1 hid controller
+ * 1 : usb 2.0 device controller
+ * 2 : usb 2.0 host2 controller
+ */
 extern void ast_scu_multi_func_usb_port1_mode(u8 mode);
-//0 : hub mode , 1: usb host mode
+
+/* 0 : hub mode
+ * 1 : usb host mode
+ */
 extern void ast_scu_multi_func_usb_port2_mode(u8 mode);
-//0 : gpioQ6,7 mode , 1: usb1.1 host port 4 mode
+
+/* 0 : gpioQ6,7 mode
+ * 1: usb1.1 host port 4 mode
+ */
 extern void ast_scu_multi_func_usb_port34_mode(u8 mode);
 
 extern void ast_scu_multi_func_sdhc_8bit_mode(void);
diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
index 2f5597d99f57..1c02914fcbdf 100644
--- a/arch/arm/include/asm/arch-aspeed/platform.h
+++ b/arch/arm/include/asm/arch-aspeed/platform.h
@@ -14,8 +14,8 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
-#ifndef _AST_PLATFORM_H_
-#define _AST_PLATFORM_H_                 1
+#ifndef _AST_PLATFORM_H
+#define _AST_PLATFORM_H
 
 #include <asm/arch/aspeed.h>
 
@@ -23,32 +23,12 @@
 #define AST_PLL_24MHZ			24000000
 #define AST_PLL_12MHZ			12000000
 
-/*********************************************************************************/
-#if defined(CONFIG_ARCH_AST1520)
-#include <asm/arch/ast1520_platform.h>
-#elif defined(CONFIG_ARCH_AST2000)
-#include <asm/arch/ast2000_platform.h>
-#elif defined(CONFIG_ARCH_AST2100)
-#include <asm/arch/ast2100_platform.h>
-#elif defined(CONFIG_ARCH_AST2200)
-#include <asm/arch/ast2200_platform.h>
-#elif defined(CONFIG_ARCH_AST2300)
-#include <asm/arch/ast2300_platform.h>
-#elif defined(CONFIG_ARCH_AST2400)
+#if defined(CONFIG_ARCH_AST2400)
 #include <asm/arch/ast2400_platform.h>
 #elif defined(AST_SOC_G5)
 #include <asm/arch/ast_g5_platform.h>
-#elif defined(CONFIG_ARCH_AST1010)
-#include <asm/arch/ast1010_platform.h>
 #else
 #err "No define for platform.h"
 #endif
 
-/*********************************************************************************/
-/* Companion Base Address */
-#if defined(CONFIG_ARCH_AST1070)
-#include <asm/arch/ast1070_platform.h>
-#endif
-/*********************************************************************************/
-
 #endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-ahbc.h b/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
index 08d9f65703ca..66e29839e8f1 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
@@ -9,30 +9,27 @@
  *   History      :
  *    1. 2012/12/29 Ryan Chen Create
  *
-********************************************************************************/
+ ******************************************************************************/
 #ifndef __AST_AHBC_H
-#define __AST_AHBC_H                     1
+#define __AST_AHBC_H
 
 #include <asm/arch/aspeed.h>
 
-/* Register for AHBC */
-#define AST_AHBC_PROTECT			0x00		/*	Protection Key Register 	*/
+/* Registers for AHBC */
+#define AST_AHBC_PROTECT		0x00	/* Protection Key Register */
+#define AST_AHBC_PRIORITY_CTRL		0x80	/* Priority Cortrol Register */
+#define AST_AHBC_ADDR_REMAP		0x8C	/* Address Remapping Register */
 
-
-#define AST_AHBC_PRIORITY_CTRL		0x80		/*	Priority Cortrol Register */
-
-#define AST_AHBC_ADDR_REMAP		0x8C		/*	Address Remapping Register */
-
-/*	AST_AHBC_PROTECT			0x00		Protection Key Register 	*/
+/* AST_AHBC_PROTECT	0x00		Protection Key Register 	*/
 #define AHBC_PROTECT_UNLOCK		0xAEED1A03
 
-/*	AST_AHBC_ADDR_REMAP		0x8C		Address Remapping Register */
+/* AST_AHBC_ADDR_REMAP	0x8C		Address Remapping Register */
 #define AHBC_PCI_REMAP1			(1 << 5)
 #define AHBC_PCI_REMAP0			(1 << 4)
 
 #if defined(AST_SOC_G5)
-#define AHBC_PCIE_MAP				(1 << 5)
-#define AHBC_LPC_PLUS_MAP			(1 << 4)
+#define AHBC_PCIE_MAP			(1 << 5)
+#define AHBC_LPC_PLUS_MAP		(1 << 4)
 #else
 #define AHBC_BOOT_REMAP			1
 #endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index e54fb87b2baf..f12a420f5e3b 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -14,218 +14,170 @@
 #define __AST_SCU_H                     1
 
 #include <asm/arch/aspeed.h>
+
 /*
  *  Register for SCU
- *  */
-#define AST_SCU_PROTECT				0x00		/*	protection key register	*/
-#define AST_SCU_RESET				0x04		/*	system reset control register */
-#define AST_SCU_RESET2				0xD4		/*	Reset Control register set 2*/
-#define AST_SCU_CLK_SEL				0x08		/*	clock selection register	*/
-#define AST_SCU_CLK_SEL2			0xD8		/*	clock selection register Set 2*/
-#define AST_SCU_CLK_STOP			0x0C		/*	clock stop control register	*/
-#define AST_SCU_CLK_STOP2			0xDC		/*	clock stop control register set 2*/
-#define AST_SCU_COUNT_CTRL			0x10		/*	frequency counter control register	*/
-#define AST_SCU_COUNT_VAL			0x14		/*	frequency counter measure register 	*/
-#define AST_SCU_INTR_CTRL			0x18		/*	Interrupt control and status register	*/
-#define AST_SCU_D2_PLL				0x1C		/*	D2-PLL Parameter  register	*/
-#define AST_SCU_D2_PLL_EXTEND		0x13C 		/*	D2-PLL Extender Parameter  register */
-#define AST_SCU_M_PLL				0x20		/*	M-PLL Parameter register		*/
-#define AST_SCU_H_PLL				0x24		/*	H-PLL Parameter register		*/
-#define AST_SCU_MH_PLL_EXTEND		0x148		/*	Extended Parameter of M/H-PLL register */
+ */
+#define AST_SCU_PROTECT		0x00	/* protection key register */
+#define AST_SCU_RESET		0x04	/* system reset control register */
+#define AST_SCU_RESET2		0xD4	/* Reset Control register set 2*/
+#define AST_SCU_CLK_SEL		0x08	/* clock selection register */
+#define AST_SCU_CLK_SEL2	0xD8	/* clock selection register Set 2*/
+#define AST_SCU_CLK_STOP	0x0C	/* clock stop control register */
+#define AST_SCU_CLK_STOP2	0xDC	/* clock stop control register set 2*/
+#define AST_SCU_COUNT_CTRL	0x10	/* frequency counter control register */
+#define AST_SCU_COUNT_VAL	0x14	/* frequency counter measure register */
+#define AST_SCU_INTR_CTRL	0x18	/* Interrupt control and status register */
+#define AST_SCU_D2_PLL		0x1C	/* D2-PLL Parameter register */
+#define AST_SCU_D2_PLL_EXTEND	0x13C 	/* D2-PLL Extender Parameter register */
+#define AST_SCU_M_PLL		0x20	/* M-PLL Parameter register */
+#define AST_SCU_H_PLL		0x24	/* H-PLL Parameter register */
+#define AST_SCU_MH_PLL_EXTEND	0x148	/* Extended Parameter of M/H-PLL register */
 #ifdef AST_SOC_G5
-#define AST_SCU_D_PLL				0x28		/*	D-PLL Parameter  register	*/
-#define AST_SCU_D_PLL_EXTEND0		0x130		/*	D-PLL Extended Parameter  register	*/
-#define AST_SCU_D_PLL_EXTEND1		0x134		/*	D-PLL Extended Parameter  register	*/
-#define AST_SCU_D_PLL_EXTEND2		0x138		/*	D-PLL Extended Parameter  register	*/
-#else
-#define AST_SCU_FREQ_LIMIT			0x28		/*	frequency counter comparsion register */
-#endif
-#define AST_SCU_MISC1_CTRL			0x2C		/*	Misc. Control register */
-#define AST_SCU_PCI_CONF1			0x30		/*	PCI configuration setting register#1 */
-#define AST_SCU_PCI_CONF2			0x34		/*	PCI configuration setting register#2 */
-#define AST_SCU_PCI_CONF3			0x38		/*	PCI configuration setting register#3 */
-#define AST_SCU_SYS_CTRL			0x3C		/*	System reset contrl/status register*/
-#define AST_SCU_SOC_SCRATCH0		0x40		/*	SOC scratch 0~31 register */
-#define AST_SCU_SOC_SCRATCH1		0x44		/*	SOC scratch 32~63 register */
-#define AST_SCU_VGA0				0x40		/*	VGA fuction handshake register */
-#define AST_SCU_VGA1				0x44		/*	VGA fuction handshake register */
-#define AST_SCU_MAC_CLK				0x48		/*	MAC interface clock delay setting register */
-#define AST_SCU_MISC2_CTRL			0x4C		/*	Misc. 2 Control register */
-#define AST_SCU_VGA_SCRATCH0		0x50		/*	VGA Scratch register */
-#define AST_SCU_VGA_SCRATCH1		0x54		/*	VGA Scratch register */
-#define AST_SCU_VGA_SCRATCH2		0x58		/*	VGA Scratch register */
-#define AST_SCU_VGA_SCRATCH3		0x5c		/*	VGA Scratch register */
-#define AST_SCU_VGA_SCRATCH4		0x60		/*	VGA Scratch register */
-#define AST_SCU_VGA_SCRATCH5		0x64		/*	VGA Scratch register */
-#define AST_SCU_VGA_SCRATCH6		0x68		/*	VGA Scratch register */
-#define AST_SCU_VGA_SCRATCH7		0x6c		/*	VGA Scratch register */
-#define AST_SCU_HW_STRAP1			0x70		/*	hardware strapping register */
-#define AST_SCU_RAMDOM_GEN			0x74		/*	random number generator register */
-#if defined(CONFIG_ARCH_AST1100) || defined(CONFIG_ARCH_AST2050) || defined(CONFIG_ARCH_AST2100) || defined(CONFIG_ARCH_AST2200)
-#define AST_SCU_MULTI_FUNC_2		0x78
+#define AST_SCU_D_PLL		0x28	/* D-PLL Parameter register */
+#define AST_SCU_D_PLL_EXTEND0	0x130	/* D-PLL Extended Parameter register */
+#define AST_SCU_D_PLL_EXTEND1	0x134	/* D-PLL Extended Parameter register */
+#define AST_SCU_D_PLL_EXTEND2	0x138	/* D-PLL Extended Parameter register */
 #else
-#define AST_SCU_RAMDOM_DATA			0x78		/*	random number generator data output*/
+#define AST_SCU_FREQ_LIMIT	0x28	/* frequency counter comparsion register */
 #endif
-#define AST_SCU_REVISION_ID			0x7C		/*	Silicon revision ID register */
-#define AST_SCU_FUN_PIN_CTRL1		0x80		/*	Multi-function Pin Control#1*/
-#define AST_SCU_FUN_PIN_CTRL2		0x84		/*	Multi-function Pin Control#2*/
-#define AST_SCU_FUN_PIN_CTRL3		0x88		/*	Multi-function Pin Control#3*/
-#define AST_SCU_FUN_PIN_CTRL4		0x8C		/*	Multi-function Pin Control#4*/
-#define AST_SCU_FUN_PIN_CTRL5		0x90		/*	Multi-function Pin Control#5*/
-#define AST_SCU_FUN_PIN_CTRL6		0x94		/*	Multi-function Pin Control#6*/
-#define AST_SCU_WDT_RESET			0x9C		/*	Watchdog Reset Selection */
-#define AST_SCU_FUN_PIN_CTRL7		0xA0		/*	Multi-function Pin Control#7*/
-#define AST_SCU_FUN_PIN_CTRL8		0xA4		/*	Multi-function Pin Control#8*/
-#define AST_SCU_FUN_PIN_CTRL9		0xA8		/*	Multi-function Pin Control#9*/
-#define AST_SCU_MAC_CLK_DELAY_100M	0xB8		/*	MAC interface clock delay 100M setting*/
-#define AST_SCU_MAC_CLK_DELAY_10M		0xBC		/*	MAC interface clock delay 10M setting*/
-#define AST_SCU_PWR_SAVING_EN		0xC0		/*	Power Saving Wakeup Enable*/
-#define AST_SCU_PWR_SAVING_CTRL		0xC4		/*	Power Saving Wakeup Control*/
-#define AST_SCU_HW_STRAP2			0xD0		/*	Haardware strapping register set 2*/
-#define AST_SCU_COUNTER4			0xE0		/*	SCU Free Run Counter Read Back #4*/
-#define AST_SCU_COUNTER4_EXT		0xE4		/*	SCU Free Run Counter Extended Read Back #4*/
-
-#if defined(CONFIG_ARCH_AST1010)
-#define AST_SCU_CPU_BASE0_ADDR      0x100       /*   CPU Base Address for Segment 0x20:0000~0x2F:FFFF*/
-#define AST_SCU_CPU_BASE1_ADDR		0x104		/*	CPU Base Address for Segment 0x30:0000~0x3F:FFFF*/
-#define AST_SCU_CPU_BASE2_ADDR		0x108		/*	CPU Base Address for Segment 0x40:0000~0x4F:FFFF*/
-#define AST_SCU_CPU_BASE3_ADDR		0x10C		/*	CPU Base Address for Segment 0x50:0000~0x5F:FFFF*/
-#define AST_SCU_CPU_BASE4_ADDR		0x110		/*	CPU Base Address for Segment 0x60:0000~0x6F:FFFF*/
-#define AST_SCU_CPU_BASE5_ADDR		0x114		/*	CPU Base Address for Segment 0x70:0000~0x7F:FFFF*/
-#define AST_SCU_CPU_BASE6_ADDR      0x118   	/*   CPU Base Address for Segment 0x80:0000~0xFF:FFFF*/
-#define AST_SCU_CPU_CACHE_CTRL		0x11C		/*	CPU Cache Function Control*/
-#else
-//CPU 2
-#define AST_SCU_CPU2_CTRL			0x100		/*	CPU2 Control Register*/
-#define AST_SCU_CPU2_BASE0_ADDR		0x104		/*	CPU2 Base Address for Segment 0x00:0000~0x1F:FFFF*/
-#define AST_SCU_CPU2_BASE1_ADDR		0x108		/*	CPU2 Base Address for Segment 0x20:0000~0x3F:FFFF*/
-#define AST_SCU_CPU2_BASE2_ADDR		0x10C		/*	CPU2 Base Address for Segment 0x40:0000~0x5F:FFFF*/
-#define AST_SCU_CPU2_BASE3_ADDR		0x110		/*	CPU2 Base Address for Segment 0x60:0000~0x7F:FFFF*/
-#define AST_SCU_CPU2_BASE4_ADDR		0x114		/*	CPU2 Base Address for Segment 0x80:0000~0xFF:FFFF*/
-#define AST_SCU_CPU2_CACHE_CTRL		0x118		/*	CPU2 Cache Function Control */
-#endif
-//
-
-#define AST_SCU_DPLL_PAR0				0x130
-#define AST_SCU_DPLL_PAR1				0x134
-#define AST_SCU_DPLL_PAR2				0x138
-
-#define AST_SCU_OTP0				0x150
-#define AST_SCU_OTP1				0x154
-#define AST_SCU_OTP2				0x158
-#define AST_SCU_OTP3				0x15C
-
-#define AST_SCU_UART24_REF			0x160		/*	Generate UART 24Mhz Ref from H-PLL when CLKIN is 25Mhz */
-#define AST_SCU_PCIE_CONFIG_SET		0x180		/*	PCI-E Configuration Setting Control Register */
-#define AST_SCU_BMC_MMIO_DEC		0x184		/*	BMC MMIO Decode Setting Register */
-#define AST_SCU_DEC_AREA1			0x188		/*	1st relocated controller decode area location */
-#define AST_SCU_DEC_AREA2			0x18C		/*	2nd relocated controller decode area location */
-#define AST_SCU_MBOX_DEC_AREA		0x190		/*	Mailbox decode area location*/
-#define AST_SCU_SRAM_DEC_AREA0		0x194		/*	Shared SRAM area decode location*/
-#define AST_SCU_SRAM_DEC_AREA1		0x198		/*	Shared SRAM area decode location*/
-#define AST_SCU_BMC_CLASS			0x19C		/*	BMC device class code and revision ID */
-#define AST_SCU_BMC_DEV_ID			0x1A4		/*	BMC device ID */
-
-#define AST_SCU_MAC_CLK_DUTY		0x1DC		/*	Clock Duty Selection */
-
-
-/*	AST_SCU_PROTECT: 0x00  - protection key register */
-#define SCU_PROTECT_UNLOCK			0x1688A8A8
-
-/*	AST_SCU_RESET :0x04	 - system reset control register */
-#if defined (CONFIG_ARCH_AST1010)
-#define SCU_RESET_ADC				(0x1 << 6)
-#define SCU_RESET_JTAG				(0x1 << 5)
-#define SCU_RESET_MAC0				(0x1 << 4)
-#define SCU_RESET_PECI				(0x1 << 3)
-#define SCU_RESET_PWM				(0x1 << 2)
-#define SCU_RESET_LPC				(0x1 << 1)
-#define SCU_RESET_I2C				(0x1)
-#else
-#define SCU_RESET_H264				(0x1 << 26)
-#define SCU_RESET_XDMA				(0x1 << 25)
-#define SCU_RESET_MCTP				(0x1 << 24)
-#define SCU_RESET_P2X				(0x1 << 24)
-#define SCU_RESET_ADC				(0x1 << 23)
-#define SCU_RESET_JTAG				(0x1 << 22)
+#define AST_SCU_MISC1_CTRL	0x2C	/* Misc. Control register */
+#define AST_SCU_PCI_CONF1	0x30	/* PCI configuration setting register#1 */
+#define AST_SCU_PCI_CONF2	0x34	/* PCI configuration setting register#2 */
+#define AST_SCU_PCI_CONF3	0x38	/* PCI configuration setting register#3 */
+#define AST_SCU_SYS_CTRL	0x3C	/* System reset contrl/status register*/
+#define AST_SCU_SOC_SCRATCH0	0x40	/* SOC scratch 0~31 register */
+#define AST_SCU_SOC_SCRATCH1	0x44	/* SOC scratch 32~63 register */
+#define AST_SCU_VGA0		0x40	/* VGA fuction handshake register */
+#define AST_SCU_VGA1		0x44	/* VGA fuction handshake register */
+#define AST_SCU_MAC_CLK		0x48	/* MAC interface clock delay setting register */
+#define AST_SCU_MISC2_CTRL	0x4C	/* Misc. 2 Control register */
+#define AST_SCU_VGA_SCRATCH0	0x50	/* VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH1	0x54	/* VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH2	0x58	/* VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH3	0x5c	/* VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH4	0x60	/* VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH5	0x64	/* VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH6	0x68	/* VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH7	0x6c	/* VGA Scratch register */
+#define AST_SCU_HW_STRAP1	0x70	/* hardware strapping register */
+#define AST_SCU_RAMDOM_GEN	0x74	/* random number generator register */
+
+
+#define AST_SCU_RAMDOM_DATA	0x78	/* random number generator data output*/
+#define AST_SCU_REVISION_ID	0x7C	/* Silicon revision ID register */
+#define AST_SCU_FUN_PIN_CTRL1	0x80	/* Multi-function Pin Control#1*/
+#define AST_SCU_FUN_PIN_CTRL2	0x84	/* Multi-function Pin Control#2*/
+#define AST_SCU_FUN_PIN_CTRL3	0x88	/* Multi-function Pin Control#3*/
+#define AST_SCU_FUN_PIN_CTRL4	0x8C	/* Multi-function Pin Control#4*/
+#define AST_SCU_FUN_PIN_CTRL5	0x90	/* Multi-function Pin Control#5*/
+#define AST_SCU_FUN_PIN_CTRL6	0x94	/* Multi-function Pin Control#6*/
+#define AST_SCU_WDT_RESET	0x9C	/* Watchdog Reset Selection */
+#define AST_SCU_FUN_PIN_CTRL7	0xA0	/* Multi-function Pin Control#7*/
+#define AST_SCU_FUN_PIN_CTRL8	0xA4	/* Multi-function Pin Control#8*/
+#define AST_SCU_FUN_PIN_CTRL9	0xA8	/* Multi-function Pin Control#9*/
+#define AST_SCU_MAC_CLK_DELAY_100M	0xB8	/* MAC interface clock delay 100M setting*/
+#define AST_SCU_MAC_CLK_DELAY_10M	0xBC	/* MAC interface clock delay 10M setting*/
+#define AST_SCU_PWR_SAVING_EN	0xC0	/* Power Saving Wakeup Enable*/
+#define AST_SCU_PWR_SAVING_CTRL	0xC4	/* Power Saving Wakeup Control*/
+#define AST_SCU_HW_STRAP2	0xD0	/* Haardware strapping register set 2*/
+#define AST_SCU_COUNTER4	0xE0	/* SCU Free Run Counter Read Back #4*/
+#define AST_SCU_COUNTER4_EXT	0xE4	/* SCU Free Run Counter Extended Read Back #4*/
+
+#define AST_SCU_DPLL_PAR0	0x130
+#define AST_SCU_DPLL_PAR1	0x134
+#define AST_SCU_DPLL_PAR2	0x138
+
+#define AST_SCU_OTP0		0x150
+#define AST_SCU_OTP1		0x154
+#define AST_SCU_OTP2		0x158
+#define AST_SCU_OTP3		0x15C
+
+#define AST_SCU_UART24_REF	0x160	/* Generate UART 24Mhz Ref from H-PLL when CLKIN is 25Mhz */
+#define AST_SCU_PCIE_CONFIG_SET	0x180	/* PCI-E Configuration Setting Control Register */
+#define AST_SCU_BMC_MMIO_DEC	0x184	/* BMC MMIO Decode Setting Register */
+#define AST_SCU_DEC_AREA1	0x188	/* 1st relocated controller decode area location */
+#define AST_SCU_DEC_AREA2	0x18C	/* 2nd relocated controller decode area location */
+#define AST_SCU_MBOX_DEC_AREA	0x190	/* Mailbox decode area location*/
+#define AST_SCU_SRAM_DEC_AREA0	0x194	/* Shared SRAM area decode location*/
+#define AST_SCU_SRAM_DEC_AREA1	0x198	/* Shared SRAM area decode location*/
+#define AST_SCU_BMC_CLASS	0x19C	/* BMC device class code and revision ID */
+#define AST_SCU_BMC_DEV_ID	0x1A4	/* BMC device ID */
+
+#define AST_SCU_MAC_CLK_DUTY	0x1DC	/* Clock Duty Selection */
+
+
+/* AST_SCU_PROTECT			0x00 - protection key register */
+#define SCU_PROTECT_UNLOCK		0x1688A8A8
+
+/* AST_SCU_RESET			0x04 - system reset control register */
+#define SCU_RESET_H264			(0x1 << 26)
+#define SCU_RESET_XDMA			(0x1 << 25)
+#define SCU_RESET_MCTP			(0x1 << 24)
+#define SCU_RESET_P2X			(0x1 << 24)
+#define SCU_RESET_ADC			(0x1 << 23)
+#define SCU_RESET_JTAG			(0x1 << 22)
 #ifdef AST_SOC_G5
-#define SCU_RESET_PCIE_DIR			(0x1 << 21)
-#define SCU_RESET_PCIE				(0x1 << 19)
+#define SCU_RESET_PCIE_DIR		(0x1 << 21)
+#define SCU_RESET_PCIE			(0x1 << 19)
 #else
-#define SCU_PWAKE_PIN_EN			(0x1 << 20)
-#define SCU_PWAKE_PIN_OUT			(0x1 << 19)
+#define SCU_PWAKE_PIN_EN		(0x1 << 20)
+#define SCU_PWAKE_PIN_OUT		(0x1 << 19)
 #endif
-#define SCU_RESET_MIC				(0x1 << 18)
-#define SCU_RESET_RFX				(0x1 << 17)
-#define SCU_RESET_SD				(0x1 << 16)
-#define SCU_RESET_USB11				(0x1 << 15)
-#define SCU_RESET_USB20				(0x1 << 14)
-#define SCU_RESET_CRT				(0x1 << 13)
-#define SCU_RESET_MAC1				(0x1 << 12)
-#define SCU_RESET_MAC0				(0x1 << 11)
-#define SCU_RESET_PECI				(0x1 << 10)
-#define SCU_RESET_PWM				(0x1 << 9)
-#define SCU_PCI_VGA_DIS				(0x1 << 8)
-#define SCU_RESET_2D				(0x1 << 7)
-#define SCU_RESET_VIDEO				(0x1 << 6)
-#define SCU_RESET_LPC				(0x1 << 5)
-#define SCU_RESET_HACE				(0x1 << 4)
-#define SCU_RESET_USB_P1			(0x1 << 3)
-#define SCU_RESET_I2C				(0x1 << 2)
-#define SCU_RESET_AHB				(0x1 << 1)
-#define SCU_RESET_SRAM_CTRL			(0x1 << 0)
-#endif
-
-/* AST_SCU_RESET2				0xD4		Reset Control register set 2	*/
-#define SCU_RESET_CRT3				(0x1 << 8)
-#define SCU_RESET_CRT2				(0x1 << 7)
-#define SCU_RESET_CRT1				(0x1 << 6)
-#define SCU_RESET_CRT0				(0x1 << 5)
-#define SCU_RESET_NIC1				(0x1 << 4)
-#define SCU_RESET_NIC0				(0x1 << 3)
-#define SCU_RESET_RFXDEC			(0x1 << 2)
-#define SCU_RESET_BITBLT				(0x1 << 1)
-#define SCU_RESET_RFXCMQ			(0x1)
-
-/*	AST_SCU_CLK_SEL	 : 0x08 - clock selection register	*/
-#if defined(CONFIG_ARCH_AST1010)
-#define SCU_CLK_MAC_DIV(x)			(x << 12)
-#define SCU_CLK_MAC_MASK			(0x3 << 12)
-#define SCU_LHCLK_SOURCE_EN			(0x1 << 11)		//0: ext , 1:internel
-#define SCU_LHCLK_LPC_DIV(x)		(x << 8)
-#define SCU_LHCLK_LPC_MASK			(0x7 << 8)
-#define SCU_PCLK_APB_DIV(x)			(x << 5)
-#define SCU_GET_PCLK_DIV(x)			((x >> 5) & 0x7)
-#define SCU_PCLK_APB_DIV_MASK		(0x7 << 5)		//limitation on PCLK .. PCLK > 0.5*LCLK (33Mhz)
-#define SCU_CLK_CPU_AHB_SLOW_EN		(0x1 << 4)
-#define SCU_CLK_CPU_AHB_SLOW(x)		(x << 3)
-#define SCU_CLK_CPU_AHB_SLOW_MASK	(0x3 << 3)
-#define SCU_GET_AHB_DIV(x)			((x >> 2) & 0x3)
-#define SCU_CLK_CPU_AHB_SLOW_IDLE	(0x1 << 1)
-#define SCU_CLK_CPU_AHB_DYN_SLOW_EN	(0x1)
-#else
+#define SCU_RESET_MIC			(0x1 << 18)
+#define SCU_RESET_RFX			(0x1 << 17)
+#define SCU_RESET_SD			(0x1 << 16)
+#define SCU_RESET_USB11			(0x1 << 15)
+#define SCU_RESET_USB20			(0x1 << 14)
+#define SCU_RESET_CRT			(0x1 << 13)
+#define SCU_RESET_MAC1			(0x1 << 12)
+#define SCU_RESET_MAC0			(0x1 << 11)
+#define SCU_RESET_PECI			(0x1 << 10)
+#define SCU_RESET_PWM			(0x1 << 9)
+#define SCU_PCI_VGA_DIS			(0x1 << 8)
+#define SCU_RESET_2D			(0x1 << 7)
+#define SCU_RESET_VIDEO			(0x1 << 6)
+#define SCU_RESET_LPC			(0x1 << 5)
+#define SCU_RESET_HACE			(0x1 << 4)
+#define SCU_RESET_USB_P1		(0x1 << 3)
+#define SCU_RESET_I2C			(0x1 << 2)
+#define SCU_RESET_AHB			(0x1 << 1)
+#define SCU_RESET_SRAM_CTRL		(0x1 << 0)
+
+/* AST_SCU_RESET2			0xD4 - Reset Control register set 2 */
+#define SCU_RESET_CRT3			(0x1 << 8)
+#define SCU_RESET_CRT2			(0x1 << 7)
+#define SCU_RESET_CRT1			(0x1 << 6)
+#define SCU_RESET_CRT0			(0x1 << 5)
+#define SCU_RESET_NIC1			(0x1 << 4)
+#define SCU_RESET_NIC0			(0x1 << 3)
+#define SCU_RESET_RFXDEC		(0x1 << 2)
+#define SCU_RESET_BITBLT		(0x1 << 1)
+#define SCU_RESET_RFXCMQ		(0x1)
+
+/* AST_SCU_CLK_SEL			0x08 - clock selection register */
 #define SCU_CLK_VIDEO_SLOW_EN		(0x1 << 31)
 //G5 the same with RemoteFX EPDEC
 #define SCU_CLK_VIDEO_SLOW_SET(x)	(x << 28)
 #define SCU_CLK_VIDEO_SLOW_MASK		(0x7 << 28)
-#define SCU_CLK_2D_ENG_GCLK_INVERT	(0x1 << 27)		//valid only at CRT mode SCU2C[7]
-#define SCU_CLK_2D_ENG_THROT_EN		(0x1 << 26)		//valid only at CRT mode SCU2C[7]
-#define SCU_PCLK_APB_DIV(x)			(x << 23)
-#define SCU_GET_PCLK_DIV(x)			((x >> 23) & 0x7)
-#define SCU_PCLK_APB_DIV_MASK		(0x7 << 23)		//limitation on PCLK .. PCLK > 0.5*LCLK (33Mhz)
+#define SCU_CLK_2D_ENG_GCLK_INVERT	(0x1 << 27) // valid only at CRT mode SCU2C[7]
+#define SCU_CLK_2D_ENG_THROT_EN		(0x1 << 26) //valid only at CRT mode SCU2C[7]
+#define SCU_PCLK_APB_DIV(x)		(x << 23)
+#define SCU_GET_PCLK_DIV(x)		((x >> 23) & 0x7)
+#define SCU_PCLK_APB_DIV_MASK		(0x7 << 23) //limitation on PCLK .. PCLK > 0.5*LCLK (33Mhz)
 #define SCU_GET_LHCLK_DIV(x)		((x >> 20) & 0x7)
 #define SCU_SET_LHCLK_DIV(x)		(x << 20)
-#define SCU_LHCLK_DIV_MASK			(0x7 << 20)
-#define SCU_LHCLK_SOURCE_EN			(0x1 << 19)		//0: ext , 1:internel
-#define SCU_CLK_MAC_DIV(x)			(x << 16)
-#define SCU_CLK_MAC_MASK			(0x7 << 16)
-#define SCU_CLK_SD_EN				(0x1 << 15)
-#define SCU_CLK_VIDE0_SO_D2			(0x1 << 8)
-#define SCU_CLK_SD_DIV(x)			(x << 12)
+#define SCU_LHCLK_DIV_MASK		(0x7 << 20)
+#define SCU_LHCLK_SOURCE_EN		(0x1 << 19) //0: ext , 1:internel
+#define SCU_CLK_MAC_DIV(x)		(x << 16)
+#define SCU_CLK_MAC_MASK		(0x7 << 16)
+#define SCU_CLK_SD_EN			(0x1 << 15)
+#define SCU_CLK_VIDE0_SO_D2		(0x1 << 8)
+#define SCU_CLK_SD_DIV(x)		(x << 12)
 #define SCU_CLK_SD_GET_DIV(x)		((x >> 12) & 0x7)
-#define SCU_CLK_SD_MASK				(0x7 << 12)
+#define SCU_CLK_SD_MASK			(0x7 << 12)
 #if defined(AST_SOC_G5)
-#define SCU_CRT_CLK_L_SOURCE			(0x1 << 8)
+#define SCU_CRT_CLK_L_SOURCE		(0x1 << 8)
 #else
 #define SCU_CLK_VIDEO_DELAY(x)		(x << 8)
 #define SCU_CLK_VIDEO_DELAY_MASK	(0xf << 8)
@@ -234,50 +186,39 @@
 #define SCU_CLK_CPU_AHB_SLOW(x)		(x << 4)
 #define SCU_CLK_CPU_AHB_SLOW_MASK	(0x7 << 4)
 #define SCU_GET_AHB_SLOW_DIV(x)		((x >> 4) & 0x7)
-#define SCU_ECLK_SOURCE(x)			(x << 2)
+#define SCU_ECLK_SOURCE(x)		(x << 2)
 #define SCU_ECLK_SOURCE_MASK		(0x3 << 2)
 #define SCU_CLK_CPU_AHB_SLOW_IDLE	(0x1 << 1)
 #define SCU_CLK_CPU_AHB_DYN_SLOW_EN	(0x1 << 0)
-#endif
 
-/*	AST_SCU_CLK_SEL2	: 0xD8 - clock selection register Set 2	*/
-#define SCU_VIDEO4_OUTPUT_CLK_INVERT			(1 << 29)
-#define SCU_VIDEO4_OUTPUT_CLK_DELAY(x)			(x << 24)
+/* AST_SCU_CLK_SEL2			0xD8 - clock selection register Set 2 */
+#define SCU_VIDEO4_OUTPUT_CLK_INVERT		(1 << 29)
+#define SCU_VIDEO4_OUTPUT_CLK_DELAY(x)		(x << 24)
 #define SCU_VIDEO4_OUTPUT_CLK_DELAY_MASK	(0x1f << 24)
-#define SCU_VIDEO3_OUTPUT_CLK_INVERT			(1 << 23)
-#define SCU_VIDEO3_OUTPUT_CLK_DELAY(x)			(x << 18)
+#define SCU_VIDEO3_OUTPUT_CLK_INVERT		(1 << 23)
+#define SCU_VIDEO3_OUTPUT_CLK_DELAY(x)		(x << 18)
 #define SCU_VIDEO3_OUTPUT_CLK_DELAY_MASK	(0x1f << 18)
-#define SCU_VIDEO2_OUTPUT_CLK_INVERT			(1 << 17)
-#define SCU_VIDEO2_OUTPUT_CLK_DELAY(x)			(x << 12)
+#define SCU_VIDEO2_OUTPUT_CLK_INVERT		(1 << 17)
+#define SCU_VIDEO2_OUTPUT_CLK_DELAY(x)		(x << 12)
 #define SCU_VIDEO2_OUTPUT_CLK_DELAY_MASK	(0x1f << 12)
-#define SCU_VIDEO1_OUTPUT_CLK_INVERT			(1 << 11)
-#define SCU_VIDEO1_OUTPUT_CLK_DELAY(x)			(x << 6)
+#define SCU_VIDEO1_OUTPUT_CLK_INVERT		(1 << 11)
+#define SCU_VIDEO1_OUTPUT_CLK_DELAY(x)		(x << 6)
 #define SCU_VIDEO1_OUTPUT_CLK_DELAY_MASK	(0x1f << 6)
-#define SCU_GET_H264CLK_DIV(x)					((x & 0x7) >> 3)
-#define SCU_SET_H264CLK_DIV(x)					(x << 3)
-#define SCU_H264CLK_MASK						(7 << 3)
-#define SCU_GET_BCLK_DIV(x)						(x & 0x7)
-#define SCU_SET_BCLK_DIV(x)						(x)
-
-
-/*	AST_SCU_CLK_STOP : 0x0C - clock stop control register	*/
-#if defined(CONFIG_ARCH_AST1010)
-#define SCU_LHCLK_STOP_EN			(0x1 << 7)
-#define SCU_MAC0CLK_STOP_EN			(0x1 << 6)
-#define SCU_UART3_CLK_STOP_EN		(0x1 << 5)
-#define SCU_UART2_CLK_STOP_EN		(0x1 << 4)
-#define SCU_UART1_CLK_STOP_EN		(0x1 << 3)
-#define SCU_LCLK_STOP_EN			(0x1 << 2)
-#define SCU_REFCLK_STOP_EN			(0x1 << 1)
-#define SCU_MCLK_STOP_EN			(0x1)
-#else
-#define SCU_LHCLK_STOP_EN			(0x1 << 28)
-#define SCU_SDCLK_STOP_EN			(0x1 << 27)
+#define SCU_GET_H264CLK_DIV(x)			((x & 0x7) >> 3)
+#define SCU_SET_H264CLK_DIV(x)			(x << 3)
+#define SCU_H264CLK_MASK			(7 << 3)
+#define SCU_GET_BCLK_DIV(x)			(x & 0x7)
+#define SCU_SET_BCLK_DIV(x)			(x)
+
+
+/* AST_SCU_CLK_STOP  			0x0C - clock stop control register */
+#define SCU_LHCLK_STOP_EN		(0x1 << 28)
+#define SCU_SDCLK_STOP_EN		(0x1 << 27)
 #define SCU_UART4CLK_STOP_EN		(0x1 << 26)
 #define SCU_UART3CLK_STOP_EN		(0x1 << 25)
-#define SCU_RSACLK_STOP_EN			(0x1 << 24)
+#define SCU_RSACLK_STOP_EN		(0x1 << 24)
 //bit 23 must keep 1
-#define SCU_H264_STOP_EN			(0x1 << 22)
+#define SCU_H264_STOP_EN		(0x1 << 22)
 #define SCU_MAC1CLK_STOP_EN		(0x1 << 21)
 #define SCU_MAC0CLK_STOP_EN		(0x1 << 20)
 //bit 19 must keep 1
@@ -290,355 +231,335 @@
 #define SCU_UART2CLK_STOP_EN		(0x1 << 16)
 #define SCU_UART1CLK_STOP_EN		(0x1 << 15)
 #define SCU_USB20_PHY_CLK_EN		(0x1 << 14)
-#define SCU_YCLK_STOP_EN			(0x1 << 13)
-#define SCU_D2CLK_STOP_EN			(0x1 << 10)
+#define SCU_YCLK_STOP_EN		(0x1 << 13)
+#define SCU_D2CLK_STOP_EN		(0x1 << 10)
 #define SCU_USB11CLK_STOP_EN		(0x1 << 9)
-#define SCU_LCLK_STOP_EN			(0x1 << 8)
-#define SCU_USB_P1_STOP_EN			(0x1 << 7)
-#define SCU_REFCLK_STOP_EN			(0x1 << 6)
-#define SCU_DCLK_STOP_EN			(0x1 << 5)
-#define SCU_SACLK_STOP_EN			(0x1 << 4)
-#define SCU_VCLK_STOP_EN			(0x1 << 3)
-#define SCU_VCLK_STOP_EN			(0x1 << 3)
-#define SCU_MCLK_STOP_EN			(0x1 << 2)
-#define SCU_GCLK_STOP_EN			(0x1 << 1)
-#define SCU_ECLK_STOP_EN			(0x1 << 0)
-#endif
-
-/* AST_SCU_CLK_STOP2	: 0xDC - clock stop control register set 2*/
-#define SCU_NIC2_STOP_EN			(0x1 << 10)
-#define SCU_NIC1_STOP_EN			(0x1 << 9)
+#define SCU_LCLK_STOP_EN		(0x1 << 8)
+#define SCU_USB_P1_STOP_EN		(0x1 << 7)
+#define SCU_REFCLK_STOP_EN		(0x1 << 6)
+#define SCU_DCLK_STOP_EN		(0x1 << 5)
+#define SCU_SACLK_STOP_EN		(0x1 << 4)
+#define SCU_VCLK_STOP_EN		(0x1 << 3)
+#define SCU_VCLK_STOP_EN		(0x1 << 3)
+#define SCU_MCLK_STOP_EN		(0x1 << 2)
+#define SCU_GCLK_STOP_EN		(0x1 << 1)
+#define SCU_ECLK_STOP_EN		(0x1 << 0)
+
+/* AST_SCU_CLK_STOP2			0xDC - clock stop control register set 2*/
+#define SCU_NIC2_STOP_EN		(0x1 << 10)
+#define SCU_NIC1_STOP_EN		(0x1 << 9)
 #define SCU_CMQCLK_STOP			(0x1 << 8)
-#define SCU_RFXCLK_STOP				(0x1 << 7)
-#define SCU_BITBLTCLK_STOP			(0x1 << 6)
+#define SCU_RFXCLK_STOP			(0x1 << 7)
+#define SCU_BITBLTCLK_STOP		(0x1 << 6)
 /* bit 6*/
-#define SCU_UART_DIV13				(0x1 << 4)
-#define SCU_UARTXCLK_STOP			(0x1 << 3)
-#define SCU_D4CLK_STOP				(0x1 << 2)
-#define SCU_D3CLK_STOP				(0x1 << 1)
-#define SCU_D2CLK_STOP				(0x1)
+#define SCU_UART_DIV13			(0x1 << 4)
+#define SCU_UARTXCLK_STOP		(0x1 << 3)
+#define SCU_D4CLK_STOP			(0x1 << 2)
+#define SCU_D3CLK_STOP			(0x1 << 1)
+#define SCU_D2CLK_STOP			(0x1)
 
-/* AST_SCU_COUNT_CTRL : 0x10 - frequency counter control register	*/
+/* AST_SCU_COUNT_CTRL 			0x10 - frequency counter control register */
 #if defined(AST_SOC_G5)
-#define SCU_OSC_OUT_EN				(0x1 << 8)
+#define SCU_OSC_OUT_EN			(0x1 << 8)
 #endif
-#define SCU_FREQ_COMP_RESULT			(0x1 << 7)
-#define SCU_FREQ_MEASU_FINISH			(0x1 << 6)
+#define SCU_FREQ_COMP_RESULT		(0x1 << 7)
+#define SCU_FREQ_MEASU_FINISH		(0x1 << 6)
 #define SCU_FREQ_SOURCE_FOR_MEASU(x)	(x << 2)
 #define SCU_FREQ_SOURCE_FOR_MEASU_MASK	(0xf << 2)
 
 #if defined(AST_SOC_G5)
-#define SCU_SOURCE_PCLK					0xf
-#define SCU_SOURCE_VPACLK				0xe
-#define SCU_SOURCE_VPBCLK				0xd
-#define SCU_SOURCE_12M					0xc
-#define SCU_SOURCE_LCLK					0xb
-#define SCU_SOURCE_GRCLK				0xa
-#define SCU_SOURCE_HCLK					0x9
-#define SCU_SOURCE_MCLK					0x8
-#define SCU_SOURCE_BCLK					0x7
-#define SCU_SOURCE_XPCLK				0x6
-#define SCU_SOURCE_D2_CLK				0x5
-#define SCU_SOURCE_D_CLK				0x4
-#define SCU_SOURCE_DLY32				0x3
-#define SCU_SOURCE_DLY16				0x2
-#define SCU_SOURCE_NAND					0x1
-#define SCU_SOURCE_DEL_CELL				0x0
-#else
-#define SCU_SOURCE_6M					0xf
-#define SCU_SOURCE_12M					0xe
-#define SCU_SOURCE_I2SM_CLK				0xd
-#define SCU_SOURCE_H_CLK				0xc
-#define SCU_SOURCE_B_CLK				0xb
-#define SCU_SOURCE_D2_PLL				0xa
-
-#define SCU_SOURCE_VIDEO_CLK			0x7
-#define SCU_SOURCE_LPC_CLK				0x6
-#define SCU_SOURCE_I2S_CLK				0x5
-#define SCU_SOURCE_M_CLK				0x4
-#define SCU_SOURCE_SALI_CLK				0x3
-#define SCU_SOURCE_D_PLL				0x2
-#define SCU_SOURCE_NAND					0x1
-#define SCU_SOURCE_DEL_CELL				0x0
-#endif
-#define SCU_OSC_COUNT_EN				(0x1 << 1)
-#define SCU_RING_OSC_EN					(0x1 << 0)
-
-
-/*  AST_SCU_INTR_CTRL : 0x18 - Interrupt control and status register   */
-#define INTR_LPC_H_L_RESET				(0x1 << 21)
-#define INTR_LPC_L_H_RESET				(0x1 << 20)
-#define INTR_PCIE_H_L_RESET				(0x1 << 19)
-#define INTR_PCIE_L_H_RESET				(0x1 << 18)
-#define INTR_VGA_SCRATCH_CHANGE			(0x1 << 17)
-#define INTR_VGA_CURSOR_CHANGE			(0x1 << 16)
-#define INTR_ISSUE_MSI					(0x1 << 6)
-#define INTR_LPC_H_L_RESET_EN			(0x1 << 5)
-#define INTR_LPC_L_H_RESET_EN			(0x1 << 4)
-#define INTR_PCIE_H_L_RESET_EN			(0x1 << 3)
-#define INTR_PCIE_L_H_RESET_EN			(0x1 << 2)
-#define INTR_VGA_SCRATCH_CHANGE_EN		(0x1 << 1)
-#define INTR_VGA_CURSOR_CHANGE_EN		(0x1 << 0)
-
-/*	AST_SCU_D2_PLL: 0x1C - D2-PLL Parameter  register */
+#define SCU_SOURCE_PCLK			0xf
+#define SCU_SOURCE_VPACLK		0xe
+#define SCU_SOURCE_VPBCLK		0xd
+#define SCU_SOURCE_12M			0xc
+#define SCU_SOURCE_LCLK			0xb
+#define SCU_SOURCE_GRCLK		0xa
+#define SCU_SOURCE_HCLK			0x9
+#define SCU_SOURCE_MCLK			0x8
+#define SCU_SOURCE_BCLK			0x7
+#define SCU_SOURCE_XPCLK		0x6
+#define SCU_SOURCE_D2_CLK		0x5
+#define SCU_SOURCE_D_CLK		0x4
+#define SCU_SOURCE_DLY32		0x3
+#define SCU_SOURCE_DLY16		0x2
+#define SCU_SOURCE_NAND			0x1
+#define SCU_SOURCE_DEL_CELL		0x0
+#else /* ! AST_SOC_G5 */
+#define SCU_SOURCE_6M			0xf
+#define SCU_SOURCE_12M			0xe
+#define SCU_SOURCE_I2SM_CLK		0xd
+#define SCU_SOURCE_H_CLK		0xc
+#define SCU_SOURCE_B_CLK		0xb
+#define SCU_SOURCE_D2_PLL		0xa
+
+#define SCU_SOURCE_VIDEO_CLK		0x7
+#define SCU_SOURCE_LPC_CLK		0x6
+#define SCU_SOURCE_I2S_CLK		0x5
+#define SCU_SOURCE_M_CLK		0x4
+#define SCU_SOURCE_SALI_CLK		0x3
+#define SCU_SOURCE_D_PLL		0x2
+#define SCU_SOURCE_NAND			0x1
+#define SCU_SOURCE_DEL_CELL		0x0
+#endif /* AST_SOC_G5 */
+#define SCU_OSC_COUNT_EN		(0x1 << 1)
+#define SCU_RING_OSC_EN			(0x1 << 0)
+
+
+/*  AST_SCU_INTR_CTRL 			0x18 - Interrupt register   */
+#define INTR_LPC_H_L_RESET		(0x1 << 21)
+#define INTR_LPC_L_H_RESET		(0x1 << 20)
+#define INTR_PCIE_H_L_RESET		(0x1 << 19)
+#define INTR_PCIE_L_H_RESET		(0x1 << 18)
+#define INTR_VGA_SCRATCH_CHANGE		(0x1 << 17)
+#define INTR_VGA_CURSOR_CHANGE		(0x1 << 16)
+#define INTR_ISSUE_MSI				(0x1 << 6)
+#define INTR_LPC_H_L_RESET_EN		(0x1 << 5)
+#define INTR_LPC_L_H_RESET_EN		(0x1 << 4)
+#define INTR_PCIE_H_L_RESET_EN		(0x1 << 3)
+#define INTR_PCIE_L_H_RESET_EN		(0x1 << 2)
+#define INTR_VGA_SCRATCH_CHANGE_EN	(0x1 << 1)
+#define INTR_VGA_CURSOR_CHANGE_EN	(0x1 << 0)
+
+/* AST_SCU_D2_PLL			0x1C - D2-PLL Parameter register */
 #ifdef AST_SOC_G5
 #define SCU_D2_PLL_SET_ODNUM(x)		(x << 19)
 #define SCU_D2_PLL_GET_ODNUM(x)		((x >> 19) & 0x3)
-#define SCU_D2_PLL_OD_MASK				(0x3 << 19)
-#define SCU_D2_PLL_SET_PNUM(x)			(x << 13)
-#define SCU_D2_PLL_GET_PNUM(x)			((x >>13)&0x3f)
-#define SCU_D2_PLL_PNUM_MASK			(0x3f << 13)
-#define SCU_D2_PLL_SET_NNUM(x)			(x << 8)
-#define SCU_D2_PLL_GET_NNUM(x)			((x >>8)&0x1f)
-#define SCU_D2_PLL_NNUM_MASK			(0x1f << 8)
-#define SCU_D2_PLL_SET_MNUM(x)			(x)
-#define SCU_D2_PLL_GET_MNUM(x)			(x & 0xff)
-#define SCU_D2_PLL_MNUM_MASK			(0xff)
-
-/*	AST_SCU_D2_PLL_EXTEND: 0x13C - D2-PLL Extender Parameter  register */
-#define SCU_D2_PLL_PARAMETER0(x)		((x) << 5)
-#define SCU_D2_PLL_SET_MODE(x)			((x) << 3)
-#define SCU_D2_PLL_GET_MODE(x)			(((x) >> 3) & 0x3)
-#define SCU_D2_PLL_RESET				(0x1 << 2)
-#define SCU_D2_PLL_BYPASS				(0x1 << 1)
-#define SCU_D2_PLL_OFF					(0x1)
-#else
-#define SCU_D2_PLL_SET_PD2(x)			(x << 19)
-#define SCU_D2_PLL_GET_PD2(x)			((x >> 19)&0x7)
-#define SCU_D2_PLL_PD2_MASK				(0x7 << 19)
-#define SCU_D2_PLL_BYPASS				(0x1 << 18)
-#define SCU_D2_PLL_OFF					(0x1 << 17)
-#define SCU_D2_PLL_SET_PD(x)			(x << 15)
-#define SCU_D2_PLL_GET_PD(x)			((x >> 15) &0x3)
-#define SCU_D2_PLL_PD_MASK				(0x3 << 15)
-#define SCU_D2_PLL_SET_OD(x)			(x << 13)
-#define SCU_D2_PLL_GET_OD(x)			((x >> 13) & 0x3)
-#define SCU_D2_PLL_OD_MASK				(0x3 << 13)
-#define SCU_D2_PLL_SET_DENUM(x)			(x << 8)
-#define SCU_D2_PLL_GET_DENUM(x)			((x >>8)&0x1f)
-#define SCU_D2_PLL_DENUM_MASK			(0x1f << 8)
-#define SCU_D2_PLL_SET_NUM(x)			(x)
-#define SCU_D2_PLL_GET_NUM(x)			(x & 0xff)
-#define SCU_D2_PLL_NUM_MASK				(0xff)
-#endif
-
-/*	AST_SCU_M_PLL : 0x20	- M-PLL Parameter register	*/
+#define SCU_D2_PLL_OD_MASK		(0x3 << 19)
+#define SCU_D2_PLL_SET_PNUM(x)		(x << 13)
+#define SCU_D2_PLL_GET_PNUM(x)		((x >>13)&0x3f)
+#define SCU_D2_PLL_PNUM_MASK		(0x3f << 13)
+#define SCU_D2_PLL_SET_NNUM(x)		(x << 8)
+#define SCU_D2_PLL_GET_NNUM(x)		((x >>8)&0x1f)
+#define SCU_D2_PLL_NNUM_MASK		(0x1f << 8)
+#define SCU_D2_PLL_SET_MNUM(x)		(x)
+#define SCU_D2_PLL_GET_MNUM(x)		(x & 0xff)
+#define SCU_D2_PLL_MNUM_MASK		(0xff)
+
+/* AST_SCU_D2_PLL_EXTEND		0x13C - D2-PLL Extender Parameter register */
+#define SCU_D2_PLL_PARAMETER0(x)	((x) << 5)
+#define SCU_D2_PLL_SET_MODE(x)		((x) << 3)
+#define SCU_D2_PLL_GET_MODE(x)		(((x) >> 3) & 0x3)
+#define SCU_D2_PLL_RESET		(0x1 << 2)
+#define SCU_D2_PLL_BYPASS		(0x1 << 1)
+#define SCU_D2_PLL_OFF			(0x1)
+#else /* ! AST_SOC_G5 */
+#define SCU_D2_PLL_SET_PD2(x)		(x << 19)
+#define SCU_D2_PLL_GET_PD2(x)		((x >> 19)&0x7)
+#define SCU_D2_PLL_PD2_MASK		(0x7 << 19)
+#define SCU_D2_PLL_BYPASS		(0x1 << 18)
+#define SCU_D2_PLL_OFF			(0x1 << 17)
+#define SCU_D2_PLL_SET_PD(x)		(x << 15)
+#define SCU_D2_PLL_GET_PD(x)		((x >> 15) &0x3)
+#define SCU_D2_PLL_PD_MASK		(0x3 << 15)
+#define SCU_D2_PLL_SET_OD(x)		(x << 13)
+#define SCU_D2_PLL_GET_OD(x)		((x >> 13) & 0x3)
+#define SCU_D2_PLL_OD_MASK		(0x3 << 13)
+#define SCU_D2_PLL_SET_DENUM(x)		(x << 8)
+#define SCU_D2_PLL_GET_DENUM(x)		((x >>8)&0x1f)
+#define SCU_D2_PLL_DENUM_MASK		(0x1f << 8)
+#define SCU_D2_PLL_SET_NUM(x)		(x)
+#define SCU_D2_PLL_GET_NUM(x)		(x & 0xff)
+#define SCU_D2_PLL_NUM_MASK		(0xff)
+#endif /* AST_SOC_G5 */
+
+/* AST_SCU_M_PLL 			0x20 - M-PLL Parameter register */
 #ifdef AST_SOC_G5
-#define SCU_M_PLL_RESET					(0x1 << 21)
-#define SCU_M_PLL_BYPASS				(0x1 << 20)
-#define SCU_M_PLL_OFF					(0x1 << 19)
-#define SCU_M_PLL_GET_PDNUM(x)			((x >> 13) & 0x3f)
-#define SCU_M_PLL_GET_MNUM(x)			((x >> 5) & 0xff)
-#define SCU_M_PLL_GET_NNUM(x)			(x & 0x1f)
-#else
-#define SCU_M_PLL_BYPASS				(0x1 << 17)
-#define SCU_M_PLL_OFF					(0x1 << 16)
-#define SCU_M_PLL_NUM(x)				(x << 5)
-#define SCU_M_PLL_GET_NUM(x)			((x >> 5) & 0x3f)
-#define SCU_M_PLL_NUM_MASK				(0x3f << 5)
-#define SCU_M_PLL_OUT_DIV				(0x1 << 4)
-#define SCU_M_PLL_GET_DIV(x)			((x >> 4) & 0x1)
-#define SCU_M_PLL_DENUM(x)				(x)
-#define SCU_M_PLL_GET_DENUM(x)			(x & 0xf)
-#endif
-
-/*	AST_SCU_H_PLL: 0x24- H-PLL Parameter register		*/
-#if defined(CONFIG_ARCH_AST1010)
-#define SCU_H_PLL_MASK_EN				(0x1 << 10)
-#define SCU_H_PLL_REST_EN				(0x1 << 9)
-#define SCU_H_PLL_OUT_DIV(x)			(x << 7)
-#define SCU_H_PLL_GET_DIV(x)			((x >> 7) & 0x3)
-#define SCU_H_PLL_GET_DENUM(x)			((x >> 6) & 0x1)
-#define SCU_H_PLL_NUM(x)				(x)
-#define SCU_H_PLL_GET_NUM(x)			(x & 0x3f)
-#define SCU_H_PLL_NUM_MASK				(0x3f)
-#elif defined(AST_SOC_G5)
-#define SCU_H_PLL_PARAMETER0(x)			((x) << 22)
-#define SCU_H_PLL_GET_PARAMETER0(x)		((x >> 22) & 0x3ff)
+#define SCU_M_PLL_RESET			(0x1 << 21)
+#define SCU_M_PLL_BYPASS		(0x1 << 20)
+#define SCU_M_PLL_OFF			(0x1 << 19)
+#define SCU_M_PLL_GET_PDNUM(x)		((x >> 13) & 0x3f)
+#define SCU_M_PLL_GET_MNUM(x)		((x >> 5) & 0xff)
+#define SCU_M_PLL_GET_NNUM(x)		(x & 0x1f)
+#else /* ! AST_SOC_G5 */
+#define SCU_M_PLL_BYPASS		(0x1 << 17)
+#define SCU_M_PLL_OFF			(0x1 << 16)
+#define SCU_M_PLL_NUM(x)		(x << 5)
+#define SCU_M_PLL_GET_NUM(x)		((x >> 5) & 0x3f)
+#define SCU_M_PLL_NUM_MASK		(0x3f << 5)
+#define SCU_M_PLL_OUT_DIV		(0x1 << 4)
+#define SCU_M_PLL_GET_DIV(x)		((x >> 4) & 0x1)
+#define SCU_M_PLL_DENUM(x)		(x)
+#define SCU_M_PLL_GET_DENUM(x)		(x & 0xf)
+#endif /* AST_SOC_G5 */
+
+/* AST_SCU_H_PLL			0x24 - H-PLL Parameter register */
+#ifdef AST_SOC_G5
+#define SCU_H_PLL_PARAMETER0(x)		((x) << 22)
+#define SCU_H_PLL_GET_PARAMETER0(x)	((x >> 22) & 0x3ff)
 #define SCU_H_PLL_PARAMETER0_MASK(x)	(0x3ff << 22)
-#define SCU_H_PLL_GET_PARAMETER0(x)		((x >> 22) & 0x3ff)
-#define SCU_H_PLL_RESET					(0x1 << 21)
-#define SCU_H_PLL_BYPASS_EN			(0x1 << 20)
-#define SCU_H_PLL_OFF					(0x1 << 19)
-#define SCU_H_PLL_PNUM(x)				(x << 13)
-#define SCU_H_PLL_GET_PNUM(x)			((x >> 13) & 0x3f)
-#define SCU_H_PLL_PNUM_MASK			(0x3f << 13)
-#define SCU_H_PLL_MNUM(x)				(x << 5)
-#define SCU_H_PLL_GET_MNUM(x)			((x >> 5) & 0xff)
-#define SCU_H_PLL_MNUM_MASK			(0xff << 5)
-#define SCU_H_PLL_NNUM(x)				(x)
-#define SCU_H_PLL_GET_NNUM(x)			(x & 0xf)
-#define SCU_H_PLL_NNUM_MASK			(0xf)
-#else
-#define SCU_H_PLL_PARAMETER				(0x1 << 18)
-#define SCU_H_PLL_BYPASS_EN				(0x1 << 17)
-#define SCU_H_PLL_OFF					(0x1 << 16)
-#define SCU_H_PLL_NUM(x)				(x << 5)
-#define SCU_H_PLL_GET_NUM(x)			((x >> 5) & 0x3f)
-#define SCU_H_PLL_NUM_MASK				(0x3f << 5)
-#define SCU_H_PLL_OUT_DIV				(0x1 << 4)
-#define SCU_H_PLL_GET_DIV(x)			((x >> 4) & 0x1)
-#define SCU_H_PLL_DENUM(x)				(x)
-#define SCU_H_PLL_GET_DENUM(x)			(x & 0xf)
-#define SCU_H_PLL_DENUM_MASK			(0xf)
-#endif
-
-/* 	AST_SCU_MH_PLL_EXTEND : 0x148 - Extended Parameter of M/H-PLL register */
-#define SCU_H_PLL_GET_PARAMETER1(x)		((x >> 16) & 0x3f)
+#define SCU_H_PLL_GET_PARAMETER0(x)	((x >> 22) & 0x3ff)
+#define SCU_H_PLL_RESET			(0x1 << 21)
+#define SCU_H_PLL_BYPASS_EN		(0x1 << 20)
+#define SCU_H_PLL_OFF			(0x1 << 19)
+#define SCU_H_PLL_PNUM(x)		(x << 13)
+#define SCU_H_PLL_GET_PNUM(x)		((x >> 13) & 0x3f)
+#define SCU_H_PLL_PNUM_MASK		(0x3f << 13)
+#define SCU_H_PLL_MNUM(x)		(x << 5)
+#define SCU_H_PLL_GET_MNUM(x)		((x >> 5) & 0xff)
+#define SCU_H_PLL_MNUM_MASK		(0xff << 5)
+#define SCU_H_PLL_NNUM(x)		(x)
+#define SCU_H_PLL_GET_NNUM(x)		(x & 0xf)
+#define SCU_H_PLL_NNUM_MASK		(0xf)
+#else /* ! AST_SOC_G5 */
+#define SCU_H_PLL_PARAMETER		(0x1 << 18)
+#define SCU_H_PLL_BYPASS_EN		(0x1 << 17)
+#define SCU_H_PLL_OFF			(0x1 << 16)
+#define SCU_H_PLL_NUM(x)		(x << 5)
+#define SCU_H_PLL_GET_NUM(x)		((x >> 5) & 0x3f)
+#define SCU_H_PLL_NUM_MASK		(0x3f << 5)
+#define SCU_H_PLL_OUT_DIV		(0x1 << 4)
+#define SCU_H_PLL_GET_DIV(x)		((x >> 4) & 0x1)
+#define SCU_H_PLL_DENUM(x)		(x)
+#define SCU_H_PLL_GET_DENUM(x)		(x & 0xf)
+#define SCU_H_PLL_DENUM_MASK		(0xf)
+#endif /* AST_SOC_G5 */
+
+/* AST_SCU_MH_PLL_EXTEND 		0x148 - Extended Parameter of M/H-PLL register */
+#define SCU_H_PLL_GET_PARAMETER1(x)	((x >> 16) & 0x3f)
 #define SCU_H_PLL_PARAMETER1_MASK(x)	(0x3f << 16)
-#define SCU_M_PLL_GET_PARAMETER1(x)		(x & 0x3f)
+#define SCU_M_PLL_GET_PARAMETER1(x)	(x & 0x3f)
 #define SCU_M_PLL_PARAMETER1_MASK(x)	(0x3f)
 
 #ifdef AST_SOC_G5
-/*	AST_SCU_D_PLL : 0x28 - D-PLL Parameter  register	*/
-#define SCU_D_PLL_GET_SIP(x)				((x >>27) & 0x1f)
-#define SCU_D_PLL_GET_SIC(x)				((x >>22) & 0x1f)
-#define SCU_D_PLL_GET_ODNUM(x)			((x >>19) & 0x7)
-#define SCU_D_PLL_GET_PNUM(x)			((x >>13) & 0x3f)
-#define SCU_D_PLL_GET_NNUM(x)			((x >>8) & 0x1f)
-#define SCU_D_PLL_GET_MNUM(x)			(x & 0xff)
-
-/*	AST_SCU_D_PLL_EXTEND : 0x130 - D-PLL Extended Parameter  register	*/
-#define SCU_D_PLL_SET_MODE(x)			((x & 0x3) << 3)
-#define SCU_D_PLL_RESET					(0x1 << 2)
-#define SCU_D_PLL_BYPASS				(0x1 << 1)
-#define SCU_D_PLL_OFF					(0x1)
-
-#else
-/*	AST_SCU_FREQ_LIMIT : 0x28 - frequency counter comparsion register */
-#define SCU_FREQ_U_LIMIT(x)			(x << 16)
+/* AST_SCU_D_PLL 			0x28 - D-PLL Parameter  register */
+#define SCU_D_PLL_GET_SIP(x)		((x >>27) & 0x1f)
+#define SCU_D_PLL_GET_SIC(x)		((x >>22) & 0x1f)
+#define SCU_D_PLL_GET_ODNUM(x)		((x >>19) & 0x7)
+#define SCU_D_PLL_GET_PNUM(x)		((x >>13) & 0x3f)
+#define SCU_D_PLL_GET_NNUM(x)		((x >>8) & 0x1f)
+#define SCU_D_PLL_GET_MNUM(x)		(x & 0xff)
+
+/* AST_SCU_D_PLL_EXTEND			0x130 - D-PLL Extended Parameter  register */
+#define SCU_D_PLL_SET_MODE(x)		((x & 0x3) << 3)
+#define SCU_D_PLL_RESET			(0x1 << 2)
+#define SCU_D_PLL_BYPASS		(0x1 << 1)
+#define SCU_D_PLL_OFF			(0x1)
+
+#else /* ! AST_SOC_G5 */
+/* AST_SCU_FREQ_LIMIT			0x28 - frequency counter comparsion register */
+#define SCU_FREQ_U_LIMIT(x)		(x << 16)
 #define SCU_FREQ_U_LIMIT_MASK		(0x3fff << 16)
-#define SCU_FREQ_L_LIMIT(x)			(x)
+#define SCU_FREQ_L_LIMIT(x)		(x)
 #define SCU_FREQ_L_LIMIT_MASK		(0x3fff)
-#endif
+#endif /* AST_SOC_G5 */
 
-/*	AST_SCU_MISC1_CTRL : 0x2C - Misc. Control register */
+/* AST_SCU_MISC1_CTRL			 0x2C - Misc. Control register */
 #define SCU_MISC_JTAG_MASTER_DIS	(0x1 << 26)
 #define SCU_MISC_DRAM_W_P2A_DIS		(0x1 << 25)
 #define SCU_MISC_SPI_W_P2A_DIS		(0x1 << 24)
 #define SCU_MISC_SOC_W_P2A_DIS		(0x1 << 23)
 #define SCU_MISC_FLASH_W_P2A_DIS	(0x1 << 22)
 #ifdef AST_SOC_G5
-#define SCU_MISC_CRT_CLK_H_SOURCE		(0x1 << 21)
-#define SCU_MISC_D_PLL_SOURCE			(0x1 << 20)
+#define SCU_MISC_CRT_CLK_H_SOURCE	(0x1 << 21)
+#define SCU_MISC_D_PLL_SOURCE		(0x1 << 20)
 #else
 #define SCU_MISC_D_PLL_ASSIGN(x)	(x << 20)
 #define SCU_MISC_D_PLL_ASSIGN_MASK	(0x3 << 20)
 #endif
 #define SCU_MISC_VGA_CONFIG_PREFETCH	(0x1 << 19)
-#define SCU_MISC_DVO_SOURCE_CRT			(0x1 << 18) 	//0:VGA , 1:CRT
-#define SCU_MISC_DAC_MASK				(0x3 << 16)
-#define SCU_MISC_SET_DAC_SOURCE(x)		(x << 16)
-#define SCU_MISC_DAC_SOURCE_CRT			(0x1 << 16)		//00 VGA, 01: CRT, 1x: PASS-Through DVO
-#define SCU_MISC_DAC_SOURCE_MASK		(0x3 << 16)
-#define SCU_MISC_JTAG_TO_PCIE_EN		(0x1 << 15)
-#define SCU_MISC_JTAG__M_TO_PCIE_EN		(0x1 << 14)
-#define SCU_MISC_VUART_TO_CTRL			(0x1 << 13)
-#define SCU_MISC_DIV13_EN				(0x1 << 12)
-#define SCU_MISC_Y_CLK_INVERT			(0x1 << 11)
-#define SCU_MISC_OUT_DELAY				(0x1 << 9)
-#define SCU_MISC_PCI_TO_AHB_DIS			(0x1 << 8)
-#define SCU_MISC_2D_CRT_EN				(0x1 << 7)
-#define SCU_MISC_VGA_CRT_DIS			(0x1 << 6)
-#define SCU_MISC_VGA_REG_ACCESS_EN		(0x1 << 5)
-#define SCU_MISC_D2_PLL_DIS				(0x1 << 4)
-#define SCU_MISC_DAC_DIS				(0x1 << 3)
-#define SCU_MISC_D_PLL_DIS				(0x1 << 2)
-#define SCU_MISC_OSC_CLK_OUT_PIN		(0x1 << 1)
-#define SCU_MISC_LPC_TO_SPI_DIS			(0x1 << 0)
-
-/*	AST_SCU_PCI_CONF1 : 0x30 - PCI configuration setting register#1 */
-#define SCU_PCI_DEVICE_ID(x)			(x << 16)
-#define SCU_PCI_VENDOR_ID(x)			(x)
-
-/*	AST_SCU_PCI_CONF2	0x34		PCI configuration setting register#2 */
-#define SCU_PCI_SUB_SYS_ID(x)			(x << 16)
-#define SCU_PCI_SUB_VENDOR_ID(x)		(x)
-
-/*	AST_SCU_PCI_CONF3	0x38		PCI configuration setting register#3 */
-#define SCU_PCI_CLASS_CODE(x)			(x << 8)
-#define SCU_PCI_REVISION_ID(x)			(x)
-
-/*	AST_SCU_SYS_CTRL	0x3C		System reset contrl/status register*/
-#if defined(CONFIG_ARCH_AST1010)
-#define SCU_SYS_WDT_FULL_FLAG			(0x1 << 2)
-#define SCU_SYS_WDT_SOC_RESET			(0x1 << 1)
-#elif defined(AST_SOC_G5)
-#define SCU_SYS_WDT3_RESET_FLAG			(0x1 << 4)
-#define SCU_SYS_WDT2_RESET_FLAG			(0x1 << 3)
-#define SCU_SYS_WDT_RESET_FLAG			(0x1 << 2)
-#define SCU_SYS_EXT_RESET_FLAG			(0x1 << 1)
+#define SCU_MISC_DVO_SOURCE_CRT		(0x1 << 18) 	//0:VGA , 1:CRT
+#define SCU_MISC_DAC_MASK		(0x3 << 16)
+#define SCU_MISC_SET_DAC_SOURCE(x)	(x << 16)
+#define SCU_MISC_DAC_SOURCE_CRT		(0x1 << 16)		//00 VGA, 01: CRT, 1x: PASS-Through DVO
+#define SCU_MISC_DAC_SOURCE_MASK	(0x3 << 16)
+#define SCU_MISC_JTAG_TO_PCIE_EN	(0x1 << 15)
+#define SCU_MISC_JTAG__M_TO_PCIE_EN	(0x1 << 14)
+#define SCU_MISC_VUART_TO_CTRL		(0x1 << 13)
+#define SCU_MISC_DIV13_EN		(0x1 << 12)
+#define SCU_MISC_Y_CLK_INVERT		(0x1 << 11)
+#define SCU_MISC_OUT_DELAY		(0x1 << 9)
+#define SCU_MISC_PCI_TO_AHB_DIS		(0x1 << 8)
+#define SCU_MISC_2D_CRT_EN		(0x1 << 7)
+#define SCU_MISC_VGA_CRT_DIS		(0x1 << 6)
+#define SCU_MISC_VGA_REG_ACCESS_EN	(0x1 << 5)
+#define SCU_MISC_D2_PLL_DIS		(0x1 << 4)
+#define SCU_MISC_DAC_DIS		(0x1 << 3)
+#define SCU_MISC_D_PLL_DIS		(0x1 << 2)
+#define SCU_MISC_OSC_CLK_OUT_PIN	(0x1 << 1)
+#define SCU_MISC_LPC_TO_SPI_DIS		(0x1 << 0)
+
+/* AST_SCU_PCI_CONF1 			0x30 - PCI configuration setting register#1 */
+#define SCU_PCI_DEVICE_ID(x)		(x << 16)
+#define SCU_PCI_VENDOR_ID(x)		(x)
+
+/* AST_SCU_PCI_CONF2			0x34 - PCI configuration setting register#2 */
+#define SCU_PCI_SUB_SYS_ID(x)		(x << 16)
+#define SCU_PCI_SUB_VENDOR_ID(x)	(x)
+
+/* AST_SCU_PCI_CONF3			0x38 - PCI configuration setting register#3 */
+#define SCU_PCI_CLASS_CODE(x)		(x << 8)
+#define SCU_PCI_REVISION_ID(x)		(x)
+
+/* AST_SCU_SYS_CTRL			0x3C - System reset contrl/status register*/
+#ifdef AST_SOC_G5
+#define SCU_SYS_WDT3_RESET_FLAG		(0x1 << 4)
+#define SCU_SYS_WDT2_RESET_FLAG		(0x1 << 3)
+#define SCU_SYS_WDT_RESET_FLAG		(0x1 << 2)
+#define SCU_SYS_EXT_RESET_FLAG		(0x1 << 1)
 #else
-#define SCU_SYS_EXT_SOC_RESET_EN		(0x1 << 3)
-#define SCU_SYS_EXT_RESET_FLAG			(0x1 << 2)
-#define SCU_SYS_WDT_RESET_FLAG			(0x1 << 1)
+#define SCU_SYS_EXT_SOC_RESET_EN	(0x1 << 3)
+#define SCU_SYS_EXT_RESET_FLAG		(0x1 << 2)
+#define SCU_SYS_WDT_RESET_FLAG		(0x1 << 1)
 #endif
-#define SCU_SYS_PWR_RESET_FLAG			(0x1 << 0)
+#define SCU_SYS_PWR_RESET_FLAG		(0x1 << 0)
 
-/*	AST_SCU_SOC_SCRATCH0	0x40		SOC scratch 0~31 register */
+/* AST_SCU_SOC_SCRATCH0			0x40 - SOC scratch 0~31 register */
 
+/* AST_SCU_SOC_SCRATCH1			0x44 - SOC scratch 32~63 register */
 
+/* AST_SCU_VGA0				0x40 - VGA fuction handshake register */
+#define SCU_VGA_SLT_HANDSHAKE(x)	(x << 24)
+#define SCU_VGA_SLT_HANDSHAKE_MASK	(0xff << 24)
+#define SCU_VGA_CTM_DEF(x)		(x << 16)
+#define SCU_VGA_CTM_DEF_MASK		(0xff << 16)
+#define SCU_MAC0_PHY_MODE(x)		(x << 14)
+#define SCU_MAC0_GET_PHY_MODE(x)	((x >> 14) & 0x3)
+#define SCU_MAC0_PHY_MODE_MASK(x)	(0x3 << 14)
+#define SCU_MAC1_PHY_MODE(x)		(x << 12)
+#define SCU_MAC1_PHY_MODE_MASK		(0x3 << 12)
+#define SCU_MAC1_GET_PHY_MODE(x)	((x >> 12) & 0x3)
 
+#define SCU_VGA_ASPEED_DEF(x)		(x << 8)
+#define SCU_VGA_ASPEED_DEF_MASK		(0xf << 8)
 
-/*	AST_SCU_SOC_SCRATCH1	0x44		SOC scratch 32~63 register */
+#define SCU_VGA_DRAM_INIT_MASK(x)	((x >> 7) & 0x1)
 
+/* AST_SCU_VGA1				0x44 - VGA fuction handshake register */
 
-/*	AST_SCU_VGA0		0x40		VGA fuction handshake register */
-#define SCU_VGA_SLT_HANDSHAKE(x)		(x << 24)
-#define SCU_VGA_SLT_HANDSHAKE_MASK		(0xff << 24)
-#define SCU_VGA_CTM_DEF(x)				(x << 16)
-#define SCU_VGA_CTM_DEF_MASK			(0xff << 16)
-#define SCU_MAC0_PHY_MODE(x)			(x << 14)
-#define SCU_MAC0_GET_PHY_MODE(x)		((x >> 14) & 0x3)
-#define SCU_MAC0_PHY_MODE_MASK(x)		(0x3 << 14)
-#define SCU_MAC1_PHY_MODE(x)			(x << 12)
-#define SCU_MAC1_PHY_MODE_MASK			(0x3 << 12)
-#define SCU_MAC1_GET_PHY_MODE(x)		((x >> 12) & 0x3)
+/* AST_SCU_MAC_CLK			0x48 - MAC interface clock delay setting register */
 
-#define SCU_VGA_ASPEED_DEF(x)			(x << 8)
-#define SCU_VGA_ASPEED_DEF_MASK			(0xf << 8)
-
-#define SCU_VGA_DRAM_INIT_MASK(x)		((x >> 7) & 0x1)
-
-/*	AST_SCU_VGA1		0x44		VGA fuction handshake register */
-
-
-/*	AST_SCU_MAC_CLK		0x48		MAC interface clock delay setting register */
-
-
-
-/*	AST_SCU_MISC2_CTRL		0x4C		Misc. 2 Control register */
+/* AST_SCU_MISC2_CTRL			0x4C - Misc. 2 Control register */
 #ifdef AST_SOC_G5
-#define SCU_PCIE_MAPPING_HIGH			(1 << 15)
-#define SCU_MALI_DTY_MODE				(1 << 8)
-#define SCU_MALI_RC_MODE				(1 << 7)
+#define SCU_PCIE_MAPPING_HIGH		(1 << 15)
+#define SCU_MALI_DTY_MODE		(1 << 8)
+#define SCU_MALI_RC_MODE		(1 << 7)
 #endif
-#define SCU_PCI_BM_ENABLE				(1 << 6)
-#define SCU_DAC_GC_SET(x)				((x & 0x7) << 3)
-#define SCU_DAC_FS_SET(x)				(x & 0x7)
-
-/*	AST_SCU_VGA_SCRATCH0	0x50		VGA Scratch register */
-/*	AST_SCU_VGA_SCRATCH1	0x54		VGA Scratch register */
-/*	AST_SCU_VGA_SCRATCH2	0x58		VGA Scratch register */
-/*	AST_SCU_VGA_SCRATCH3	0x5c		VGA Scratch register */
-/*	AST_SCU_VGA_SCRATCH4	0x60		VGA Scratch register */
-/*	AST_SCU_VGA_SCRATCH5	0x64		VGA Scratch register */
-/*	AST_SCU_VGA_SCRATCH6	0x68		VGA Scratch register */
-/*	AST_SCU_VGA_SCRATCH7	0x6c		VGA Scratch register */
-
-/*	AST_SCU_HW_STRAP1			0x70		hardware strapping register */
+#define SCU_PCI_BM_ENABLE		(1 << 6)
+#define SCU_DAC_GC_SET(x)		((x & 0x7) << 3)
+#define SCU_DAC_FS_SET(x)		(x & 0x7)
+
+/* AST_SCU_VGA_SCRATCH0			0x50 - VGA Scratch register */
+/* AST_SCU_VGA_SCRATCH1			0x54 - VGA Scratch register */
+/* AST_SCU_VGA_SCRATCH2			0x58 - VGA Scratch register */
+/* AST_SCU_VGA_SCRATCH3			0x5c - VGA Scratch register */
+/* AST_SCU_VGA_SCRATCH4			0x60 - VGA Scratch register */
+/* AST_SCU_VGA_SCRATCH5			0x64 - VGA Scratch register */
+/* AST_SCU_VGA_SCRATCH6			0x68 - VGA Scratch register */
+/* AST_SCU_VGA_SCRATCH7			0x6c - VGA Scratch register */
+
+/* AST_SCU_HW_STRAP1			0x70 - hardware strapping register */
 #ifdef AST_SOC_G5
 
-#define CLK_25M_IN					(0x1 << 23)
+#define CLK_25M_IN			(0x1 << 23)
 
-#define SCU_HW_STRAP_2ND_BOOT_WDT		(0x1 << 17)
+#define SCU_HW_STRAP_2ND_BOOT_WDT	(0x1 << 17)
 #define SCU_HW_STRAP_SUPER_IO_CONFIG	(0x1 << 16)
-#define SCU_HW_STRAP_VGA_CLASS_CODE		(0x1 << 15)
-#define SCU_HW_STRAP_LPC_RESET_PIN		(0x1 << 14)
-#define SCU_HW_STRAP_SPI_MODE(x)			(x << 12)
-#define SCU_HW_STRAP_SPI_MODE_MASK		(0x3 << 12)
-#define SCU_HW_STRAP_SPI_MASTER			(0x1 << 12)
-#define SCU_HW_STRAP_SPI_M_S_EN			(0x2 << 12)
+#define SCU_HW_STRAP_VGA_CLASS_CODE	(0x1 << 15)
+#define SCU_HW_STRAP_LPC_RESET_PIN	(0x1 << 14)
+#define SCU_HW_STRAP_SPI_MODE(x)	(x << 12)
+#define SCU_HW_STRAP_SPI_MODE_MASK	(0x3 << 12)
+#define SCU_HW_STRAP_SPI_MASTER		(0x1 << 12)
+#define SCU_HW_STRAP_SPI_M_S_EN		(0x2 << 12)
 #define SCU_HW_STRAP_SPI_PASS_THROUGH	(0x3 << 12)
 #define SCU_HW_STRAP_GET_AXI_AHB_RATIO(x)	((x >> 9) & 0x7)
 #define SCU_HW_STRAP_GET_CPU_AXI_RATIO(x)	((x >> 8) & 0x1)
@@ -648,160 +569,154 @@
 #define SCU_HW_STRAP_SPI_WIDTH		(0x1 << 4)
 
 #define SCU_HW_STRAP_VGA_SIZE_GET(x)	((x >> 2)& 0x3)
-#define SCU_HW_STRAP_VGA_MASK			(0x3 << 3)
+#define SCU_HW_STRAP_VGA_MASK		(0x3 << 3)
 #define SCU_HW_STRAP_VGA_SIZE_SET(x)	(x << 2)
 
-#define VGA_8M_DRAM				0
+#define VGA_8M_DRAM			0
 #define VGA_16M_DRAM			1
 #define VGA_32M_DRAM			2
 #define VGA_64M_DRAM			3
 
-#define SCU_HW_STRAP_DIS_BOOT 			(1)
-#else
-#define SCU_HW_STRAP_SW_DEFINE(x)		(x << 29)
-#define SCU_HW_STRAP_SW_DEFINE_MASK		(0x3 << 29)
-#define SCU_HW_STRAP_DRAM_SIZE			(x << 29)
-#define SCU_HW_STRAP_DRAM_SIZE_MASK		(0x3 << 29)
+#define SCU_HW_STRAP_DIS_BOOT 		(1)
+#else /* !AST_SOC_G5 */
+#define SCU_HW_STRAP_SW_DEFINE(x)	(x << 29)
+#define SCU_HW_STRAP_SW_DEFINE_MASK	(0x3 << 29)
+#define SCU_HW_STRAP_DRAM_SIZE		(x << 29)
+#define SCU_HW_STRAP_DRAM_SIZE_MASK	(0x3 << 29)
 
-#define SCU_HW_STRAP_DRAM_CONFIG		(x << 24)
+#define SCU_HW_STRAP_DRAM_CONFIG	(x << 24)
 #define SCU_HW_STRAP_DRAM_CONFIG_MASK	(0x7 << 24)
 
-#define SCU_HW_STRAP_GPIOE_PT_EN		(0x1 << 22)
-#define SCU_HW_STRAP_GPIOD_PT_EN		(0x1 << 21)
+#define SCU_HW_STRAP_GPIOE_PT_EN	(0x1 << 22)
+#define SCU_HW_STRAP_GPIOD_PT_EN	(0x1 << 21)
 #define SCU_HW_STRAP_LPC_DEC_SUPER_IO	(0x1 << 20)
-#define SCU_HW_STRAP_ACPI_DIS			(0x1 << 19)
+#define SCU_HW_STRAP_ACPI_DIS		(0x1 << 19)
 
-//bit 23, 18 [1,0]
-#define SCU_HW_STRAP_SET_CLK_SOURCE(x)		((((x&0x3) >> 1)<<23)||((x&0x1) << 18))
-#define SCU_HW_STRAP_GET_CLK_SOURCE(x)		(((x>>23)&0x1<<1) | ((x>>18)&0x1))
-#define SCU_HW_STRAP_CLK_SOURCE_MASK		((0x1 << 23) | (0x1 << 18))
+/* bit 23, 18 [1,0] */
+#define SCU_HW_STRAP_SET_CLK_SOURCE(x)	((((x&0x3) >> 1)<<23)||((x&0x1) << 18))
+#define SCU_HW_STRAP_GET_CLK_SOURCE(x)	(((x>>23)&0x1<<1) | ((x>>18)&0x1))
+#define SCU_HW_STRAP_CLK_SOURCE_MASK	((0x1 << 23) | (0x1 << 18))
 
-#define CLK_25M_IN					(0x1 << 23)
-#define CLK_24M_IN					0
-#define CLK_48M_IN					1
+#define CLK_25M_IN			(0x1 << 23)
+#define CLK_24M_IN			0
+#define CLK_48M_IN			1
 #define CLK_25M_IN_24M_USB_CKI		3
 #define CLK_25M_IN_48M_USB_CKI		3
 
-#define SCU_HW_STRAP_2ND_BOOT_WDT		(0x1 << 17)
+#define SCU_HW_STRAP_2ND_BOOT_WDT	(0x1 << 17)
 #define SCU_HW_STRAP_SUPER_IO_CONFIG	(0x1 << 16)
-#define SCU_HW_STRAP_VGA_CLASS_CODE		(0x1 << 15)
-#define SCU_HW_STRAP_LPC_RESET_PIN		(0x1 << 14)
-#define SCU_HW_STRAP_SPI_MODE(x)			(x << 12)
-#define SCU_HW_STRAP_SPI_MODE_MASK		(0x3 << 12)
-#define SCU_HW_STRAP_SPI_MASTER			(0x1 << 12)
-#define SCU_HW_STRAP_SPI_M_S_EN			(0x2 << 12)
+#define SCU_HW_STRAP_VGA_CLASS_CODE	(0x1 << 15)
+#define SCU_HW_STRAP_LPC_RESET_PIN	(0x1 << 14)
+#define SCU_HW_STRAP_SPI_MODE(x)	(x << 12)
+#define SCU_HW_STRAP_SPI_MODE_MASK	(0x3 << 12)
+#define SCU_HW_STRAP_SPI_MASTER		(0x1 << 12)
+#define SCU_HW_STRAP_SPI_M_S_EN		(0x2 << 12)
 #define SCU_HW_STRAP_SPI_PASS_THROUGH	(0x3 << 12)
 
-#define SCU_HW_STRAP_SET_CPU_AHB_RATIO(x)		(x << 10)
-#define SCU_HW_STRAP_GET_CPU_AHB_RATIO(x)		((x >> 10) & 3)
+#define SCU_HW_STRAP_SET_CPU_AHB_RATIO(x)	(x << 10)
+#define SCU_HW_STRAP_GET_CPU_AHB_RATIO(x)	((x >> 10) & 3)
 #define SCU_HW_STRAP_CPU_AHB_RATIO_MASK		(0x3 << 10)
 
-
 #define CPU_AHB_RATIO_1_1		0
 #define CPU_AHB_RATIO_2_1		1
 #define CPU_AHB_RATIO_4_1		2
 #define CPU_AHB_RATIO_3_1		3
 
 #define SCU_HW_STRAP_GET_H_PLL_CLK(x)	((x >> 8 )& 0x3)
-#define SCU_HW_STRAP_H_PLL_CLK_MASK		(0x3 << 8)
-#define CPU_384MHZ		0
-#define CPU_360MHZ		1
-#define CPU_336MHZ		2
-#define CPU_408MHZ		3
+#define SCU_HW_STRAP_H_PLL_CLK_MASK	(0x3 << 8)
+#define CPU_384MHZ			0
+#define CPU_360MHZ			1
+#define CPU_336MHZ			2
+#define CPU_408MHZ			3
 
 #define SCU_HW_STRAP_MAC1_RGMII		(0x1 << 7)
 #define SCU_HW_STRAP_MAC0_RGMII		(0x1 << 6)
 #define SCU_HW_STRAP_VGA_BIOS_ROM	(0x1 << 5)
 #define SCU_HW_STRAP_SPI_WIDTH		(0x1 << 4)
-#define SCU_HW_STRAP_VGA_SIZE_GET(x)		((x >> 2)& 0x3)
-#define SCU_HW_STRAP_VGA_MASK			(0x3 << 2)
-#define SCU_HW_STRAP_VGA_SIZE_SET(x)		(x << 2)
+#define SCU_HW_STRAP_VGA_SIZE_GET(x)	((x >> 2)& 0x3)
+#define SCU_HW_STRAP_VGA_MASK		(0x3 << 2)
+#define SCU_HW_STRAP_VGA_SIZE_SET(x)	(x << 2)
 
 #define VGA_8M_DRAM			0
 #define VGA_16M_DRAM			1
 #define VGA_32M_DRAM			2
 #define VGA_64M_DRAM			3
 
-#define SCU_HW_STRAP_BOOT_MODE(x)		(x)
-#define NOR_BOOT		0
-#define NAND_BOOT		1
-#define SPI_BOOT		2
-#define DIS_BOOT		3
-#endif
-/*	AST_SCU_RAMDOM_GEN		0x74		random number generator register */
+#define SCU_HW_STRAP_BOOT_MODE(x)	(x)
+#define NOR_BOOT			0
+#define NAND_BOOT			1
+#define SPI_BOOT			2
+#define DIS_BOOT			3
+#endif /* AST_SOC_G5 */
+
+/* AST_SCU_RAMDOM_GEN			0x74 - random number generator register */
 #define RNG_TYPE_MASK			(0x7 << 1)
 #define RNG_SET_TYPE(x)			((x) << 1)
 #define RNG_GET_TYPE(x)			(((x) >> 1)  & 0x7)
-#define RNG_ENABLE				0x1
-/*	AST_SCU_RAMDOM_DATA		0x78		random number generator data output*/
+#define RNG_ENABLE			0x1
+/* AST_SCU_RAMDOM_DATA			0x78 - random number generator data output */
 
-/*	AST_SCU_MULTI_FUNC_2	0x78 */
+/* AST_SCU_MULTI_FUNC_2			0x78 */
 
-#define MULTI_FUNC_VIDEO_RGB18			(0x1 << 2)
+#define MULTI_FUNC_VIDEO_RGB18		(0x1 << 2)
 #define MULTI_FUNC_VIDEO_SINGLE_EDGE	(0x1 << 0)
 
 
-
-/*	AST_SCU_REVISION_ID		0x7C		Silicon revision ID register */
-#define AST_SOC_GEN				24
-#define AST1100_A0				0x00000200
-#define AST1100_A1				0x00000201
-#define AST1100_A2				0x00000202
-#define AST1100_A3				0x00000202
-
-#define AST2050_A0				0x00000200
-#define AST2050_A1				0x00000201
-#define AST2050_A2				0x00000202
-#define AST2050_A3				0x00000202
-
-#define AST2100_A0				0x00000300
-#define AST2100_A1				0x00000301
-#define AST2100_A2				0x00000302
-#define AST2100_A3				0x00000302
-
-#define AST2200_A0				0x00000102
-#define AST2200_A1				0x00000102
-
-#define AST2300_A0				0x01000003
-#define AST2300_A1				0x01010303
-#define AST1300_A1				0x01010003
-#define AST1050_A1				0x01010203
-
-#define AST2400_A0				0x02000303
-
-#define GET_CHIP_REVISION(x)			((x & 0xff000000) >> 24)
-
-#define GET_HW_REVISION_ID(x)	((x & 0xff0000) >> 16)
-
-#define AST_DRAM_BASE_4		0x40000000
-#define AST_DRAM_BASE_8		0x80000000
-
-/*	AST_SCU_FUN_PIN_CTRL1		0x80		Multi-function Pin Control#1*/
-#define SCU_FUN_PIN_UART4_RXD	(0x1 << 31)
-#define SCU_FUN_PIN_UART4_TXD	(0x1 << 30)
-#define SCU_FUN_PIN_UART4_NRTS	(0x1 << 29)
-#define SCU_FUN_PIN_UART4_NDTR	(0x1 << 28)
-#define SCU_FUN_PIN_UART4_NRI	(0x1 << 27)
-#define SCU_FUN_PIN_UART4_NDSR	(0x1 << 26)
-#define SCU_FUN_PIN_UART4_NDCD	(0x1 << 25)
-#define SCU_FUN_PIN_UART4_NCTS	(0x1 << 24)
-#define SCU_FUN_PIN_UART3_RXD	(0x1 << 23)
-#define SCU_FUN_PIN_UART3_TXD	(0x1 << 22)
-#define SCU_FUN_PIN_UART3_NRTS	(0x1 << 21)
-#define SCU_FUN_PIN_UART3_NDTR	(0x1 << 20)
-#define SCU_FUN_PIN_UART3_NRI	(0x1 << 19)
-#define SCU_FUN_PIN_UART3_NDSR	(0x1 << 18)
-#define SCU_FUN_PIN_UART3_NDCD	(0x1 << 17)
-#define SCU_FUN_PIN_UART3_NCTS	(0x1 << 16)
-
-
-
+/* AST_SCU_REVISION_ID			0x7C - Silicon revision ID register */
+#define AST_SOC_GEN			24
+#define AST1100_A0			0x00000200
+#define AST1100_A1			0x00000201
+#define AST1100_A2			0x00000202
+#define AST1100_A3			0x00000202
+
+#define AST2050_A0			0x00000200
+#define AST2050_A1			0x00000201
+#define AST2050_A2			0x00000202
+#define AST2050_A3			0x00000202
+
+#define AST2100_A0			0x00000300
+#define AST2100_A1			0x00000301
+#define AST2100_A2			0x00000302
+#define AST2100_A3			0x00000302
+
+#define AST2200_A0			0x00000102
+#define AST2200_A1			0x00000102
+
+#define AST2300_A0			0x01000003
+#define AST2300_A1			0x01010303
+#define AST1300_A1			0x01010003
+#define AST1050_A1			0x01010203
+
+#define AST2400_A0			0x02000303
+
+#define GET_CHIP_REVISION(x)		((x & 0xff000000) >> 24)
+#define GET_HW_REVISION_ID(x)		((x & 0xff0000) >> 16)
+
+#define AST_DRAM_BASE_4			0x40000000
+#define AST_DRAM_BASE_8			0x80000000
+
+/* AST_SCU_FUN_PIN_CTRL1		0x80 - Multi-function Pin Control#1 */
+#define SCU_FUN_PIN_UART4_RXD		(0x1 << 31)
+#define SCU_FUN_PIN_UART4_TXD		(0x1 << 30)
+#define SCU_FUN_PIN_UART4_NRTS		(0x1 << 29)
+#define SCU_FUN_PIN_UART4_NDTR		(0x1 << 28)
+#define SCU_FUN_PIN_UART4_NRI		(0x1 << 27)
+#define SCU_FUN_PIN_UART4_NDSR		(0x1 << 26)
+#define SCU_FUN_PIN_UART4_NDCD		(0x1 << 25)
+#define SCU_FUN_PIN_UART4_NCTS		(0x1 << 24)
+#define SCU_FUN_PIN_UART3_RXD		(0x1 << 23)
+#define SCU_FUN_PIN_UART3_TXD		(0x1 << 22)
+#define SCU_FUN_PIN_UART3_NRTS		(0x1 << 21)
+#define SCU_FUN_PIN_UART3_NDTR		(0x1 << 20)
+#define SCU_FUN_PIN_UART3_NRI		(0x1 << 19)
+#define SCU_FUN_PIN_UART3_NDSR		(0x1 << 18)
+#define SCU_FUN_PIN_UART3_NDCD		(0x1 << 17)
+#define SCU_FUN_PIN_UART3_NCTS		(0x1 << 16)
 
 #define SCU_FUN_PIN_MAC1_PHY_LINK	(0x1 << 1)
 #define SCU_FUN_PIN_MAC0_PHY_LINK	(0x1)
 
-
-/*	AST_SCU_FUN_PIN_CTRL2		0x84		Multi-function Pin Control#2*/
+/* AST_SCU_FUN_PIN_CTRL2		0x84 - Multi-function Pin Control#2 */
 #define SCU_FUN_PIN_VPIB9		(0x1 << 31)
 #define SCU_FUN_PIN_VPIB8		(0x1 << 30)
 #define SCU_FUN_PIN_VPIB7		(0x1 << 29)
@@ -823,22 +738,22 @@
 #define SCU_FUN_PIN_VGAVS		(0x1 << 13)
 #define SCU_FUN_PIN_VGAHS		(0x1 << 12)
 
-#define SCU_FUN_PIN_UART2_RXD	(0x1 << 31)
-#define SCU_FUN_PIN_UART2_TXD	(0x1 << 30)
-#define SCU_FUN_PIN_UART2_NRTS	(0x1 << 29)
-#define SCU_FUN_PIN_UART2_NDTR	(0x1 << 28)
-#define SCU_FUN_PIN_UART2_NRI	(0x1 << 27)
-#define SCU_FUN_PIN_UART2_NDSR	(0x1 << 26)
-#define SCU_FUN_PIN_UART2_NDCD	(0x1 << 25)
-#define SCU_FUN_PIN_UART2_NCTS	(0x1 << 24)
-#define SCU_FUN_PIN_UART1_RXD	(0x1 << 23)
-#define SCU_FUN_PIN_UART1_TXD	(0x1 << 22)
-#define SCU_FUN_PIN_UART1_NRTS	(0x1 << 21)
-#define SCU_FUN_PIN_UART1_NDTR	(0x1 << 20)
-#define SCU_FUN_PIN_UART1_NRI	(0x1 << 19)
-#define SCU_FUN_PIN_UART1_NDSR	(0x1 << 18)
-#define SCU_FUN_PIN_UART1_NDCD	(0x1 << 17)
-#define SCU_FUN_PIN_UART1_NCTS	(0x1 << 16)
+#define SCU_FUN_PIN_UART2_RXD		(0x1 << 31)
+#define SCU_FUN_PIN_UART2_TXD		(0x1 << 30)
+#define SCU_FUN_PIN_UART2_NRTS		(0x1 << 29)
+#define SCU_FUN_PIN_UART2_NDTR		(0x1 << 28)
+#define SCU_FUN_PIN_UART2_NRI		(0x1 << 27)
+#define SCU_FUN_PIN_UART2_NDSR		(0x1 << 26)
+#define SCU_FUN_PIN_UART2_NDCD		(0x1 << 25)
+#define SCU_FUN_PIN_UART2_NCTS		(0x1 << 24)
+#define SCU_FUN_PIN_UART1_RXD		(0x1 << 23)
+#define SCU_FUN_PIN_UART1_TXD		(0x1 << 22)
+#define SCU_FUN_PIN_UART1_NRTS		(0x1 << 21)
+#define SCU_FUN_PIN_UART1_NDTR		(0x1 << 20)
+#define SCU_FUN_PIN_UART1_NRI		(0x1 << 19)
+#define SCU_FUN_PIN_UART1_NDSR		(0x1 << 18)
+#define SCU_FUN_PIN_UART1_NDCD		(0x1 << 17)
+#define SCU_FUN_PIN_UART1_NCTS		(0x1 << 16)
 
 #define SCU_FUN_PIN_SGPMI		(0x1 << 11)
 #define SCU_FUN_PIN_SGPMO		(0x1 << 10)
@@ -846,35 +761,31 @@
 #define SCU_FUN_PIN_SGPMCK		(0x1 << 8)
 
 #if defined(AST_SOC_G5)
-#define SCU_FUN_PIN_I2C4_SALT4	(0x1 << 7)
-#define SCU_FUN_PIN_I2C3_SALT3	(0x1 << 6)
-#define SCU_FUN_PIN_I2C2_SALT2	(0x1 << 5)
-#define SCU_FUN_PIN_I2C1_SALT1	(0x1 << 4)
+#define SCU_FUN_PIN_I2C4_SALT4		(0x1 << 7)
+#define SCU_FUN_PIN_I2C3_SALT3		(0x1 << 6)
+#define SCU_FUN_PIN_I2C2_SALT2		(0x1 << 5)
+#define SCU_FUN_PIN_I2C1_SALT1		(0x1 << 4)
 #else
-#define SCU_FUN_PIN_NAND_FLWP	(0x1 << 7)
-#define SCU_FUN_PIN_NAND_FLBUSY	(0x1 << 6)
+#define SCU_FUN_PIN_NAND_FLWP		(0x1 << 7)
+#define SCU_FUN_PIN_NAND_FLBUSY		(0x1 << 6)
 #endif
 
-/*	AST_SCU_FUN_PIN_CTRL3		0x88		Multi-function Pin Control#3*/
-#if	defined(CONFIG_ARCH_AST1010)
-#define SCU_FUN_PIN_MAC0_MDIO	(0x1 << 23)
-#define SCU_FUN_PIN_MAC0_MDC	(0x1 << 22)
-#else
-#define SCU_FUN_PIN_MAC0_MDIO	(0x1 << 31)
-#define SCU_FUN_PIN_MAC0_MDC	(0x1 << 30)
+/* AST_SCU_FUN_PIN_CTRL3		0x88 - Multi-function Pin Control#3 */
+#define SCU_FUN_PIN_MAC0_MDIO		(0x1 << 31)
+#define SCU_FUN_PIN_MAC0_MDC		(0x1 << 30)
 #define SCU_FUN_PIN_ROMA25		(0x1 << 29)
 #define SCU_FUN_PIN_ROMA24		(0x1 << 28)
 #define SCU_FUN_PIN_ROMCS4		(0x1 << 27)
 #define SCU_FUN_PIN_ROMCS3		(0x1 << 26)
 #define SCU_FUN_PIN_ROMCS2		(0x1 << 25)
 #define SCU_FUN_PIN_ROMCS1		(0x1 << 24)
-#define SCU_FUN_PIN_ROMCS(x)	(0x1 << (23+x))
+#define SCU_FUN_PIN_ROMCS(x)		(0x1 << (23+x))
 
-#define SCU_FUN_PIN_USBP4_DN	(0x1 << 23)
-#define SCU_FUN_PIN_USBP4_DP	(0x1 << 22)
-#define SCU_FUN_PIN_USBP3_DN	(0x1 << 21)
-#define SCU_FUN_PIN_USBP3_DP	(0x1 << 20)
-//Video pin
+#define SCU_FUN_PIN_USBP4_DN		(0x1 << 23)
+#define SCU_FUN_PIN_USBP4_DP		(0x1 << 22)
+#define SCU_FUN_PIN_USBP3_DN		(0x1 << 21)
+#define SCU_FUN_PIN_USBP3_DP		(0x1 << 20)
+/* Video pin */
 #define SCU_FUN_PIN_VPIR9		(0x1 << 19)
 #define SCU_FUN_PIN_VPIR8		(0x1 << 18)
 #define SCU_FUN_PIN_VPIR7		(0x1 << 17)
@@ -895,12 +806,10 @@
 #define SCU_FUN_PIN_VPIG2		(0x1 << 2)
 #define SCU_FUN_PIN_VPIG1		(0x1 << 1)
 #define SCU_FUN_PIN_VPIG0		(0x1 << 0)
-#endif
 
-
-//pwm pin
-#define SCU_FUN_PIN_PWM_TACHO	(0)
-/*	AST_SCU_FUN_PIN_CTRL4		0x8C		Multi-function Pin Control#4*/
+/* pwm pin */
+#define SCU_FUN_PIN_PWM_TACHO		(0)
+/* AST_SCU_FUN_PIN_CTRL4		0x8C - Multi-function Pin Control#4 */
 #define SCU_FUN_PIN_ROMA23		(0x1 << 7)
 #define SCU_FUN_PIN_ROMA22		(0x1 << 6)
 
@@ -911,11 +820,11 @@
 #define SCU_FUN_PIN_ROMD5		(0x1 << 1)
 #define SCU_FUN_PIN_ROMD4		(0x1)
 
-/*	AST_SCU_FUN_PIN_CTRL5		0x90		Multi-function Pin Control#5*/
+/* AST_SCU_FUN_PIN_CTRL5		0x90 - Multi-function Pin Control#5 */
 #define SCU_FUN_PIN_SPICS1		(0x1 << 31)
-#define SCU_FUN_PIN_LPC_PLUS	(0x1 << 30)
-#define SCU_FUC_PIN_USB20_HOST	(0x1 << 29)
-#define SCU_FUC_PIN_USB11_PORT4	(0x1 << 28)
+#define SCU_FUN_PIN_LPC_PLUS		(0x1 << 30)
+#define SCU_FUC_PIN_USB20_HOST		(0x1 << 29)
+#define SCU_FUC_PIN_USB11_PORT4		(0x1 << 28)
 #define SCU_FUC_PIN_I2C14		(0x1 << 27)
 #define SCU_FUC_PIN_I2C13		(0x1 << 26)
 #define SCU_FUC_PIN_I2C12		(0x1 << 25)
@@ -928,60 +837,60 @@
 #define SCU_FUC_PIN_I2C5		(0x1 << 18)
 #define SCU_FUC_PIN_I2C4		(0x1 << 17)
 #define SCU_FUC_PIN_I2C3		(0x1 << 16)
-#define SCU_FUC_PIN_MII2_RX_DWN_DIS		(0x1 << 15)
-#define SCU_FUC_PIN_MII2_TX_DWN_DIS		(0x1 << 14)
-#define SCU_FUC_PIN_MII1_RX_DWN_DIS		(0x1 << 13)
-#define SCU_FUC_PIN_MII1_TX_DWN_DIS		(0x1 << 12)
+#define SCU_FUC_PIN_MII2_RX_DWN_DIS	(0x1 << 15)
+#define SCU_FUC_PIN_MII2_TX_DWN_DIS	(0x1 << 14)
+#define SCU_FUC_PIN_MII1_RX_DWN_DIS	(0x1 << 13)
+#define SCU_FUC_PIN_MII1_TX_DWN_DIS	(0x1 << 12)
 
-#define SCU_FUC_PIN_MII2_TX_DRIV(x)		(x << 10)
+#define SCU_FUC_PIN_MII2_TX_DRIV(x)	(x << 10)
 #define SCU_FUC_PIN_MII2_TX_DRIV_MASK	(0x3 << 10)
-#define SCU_FUC_PIN_MII1_TX_DRIV(x)		(x << 8)
+#define SCU_FUC_PIN_MII1_TX_DRIV(x)	(x << 8)
 #define SCU_FUC_PIN_MII1_TX_DRIV_MASK	(0x3 << 8)
 
-#define MII_NORMAL_DRIV	0x0
-#define MII_HIGH_DRIV	0x2
+#define MII_NORMAL_DRIV			0x0
+#define MII_HIGH_DRIV			0x2
 
 #define SCU_FUC_PIN_UART6		(0x1 << 7)
-#define SCU_FUC_PIN_ROM_16BIT	(0x1 << 6)
+#define SCU_FUC_PIN_ROM_16BIT		(0x1 << 6)
 #define SCU_FUC_PIN_DIGI_V_OUT(x)	(x)
 #define SCU_FUC_PIN_DIGI_V_OUT_MASK	(0x3)
 
-#define VIDEO_DISABLE	0x0
-#define VIDEO_12BITS	0x1
-#define VIDEO_24BITS	0x2
-//#define VIDEO_DISABLE	0x3
+#define VIDEO_DISABLE			0x0
+#define VIDEO_12BITS			0x1
+#define VIDEO_24BITS			0x2
+//#define VIDEO_DISABLE			0x3
 
-#define SCU_FUC_PIN_USB11_PORT2	(0x1 << 3)
+#define SCU_FUC_PIN_USB11_PORT2		(0x1 << 3)
 #define SCU_FUC_PIN_SD1_8BIT		(0x1 << 3)
 
 #define SCU_FUC_PIN_MAC1_MDIO		(0x1 << 2)
-#define SCU_FUC_PIN_SD2		(0x1 << 1)
-#define SCU_FUC_PIN_SD1		(0x1 << 0)
+#define SCU_FUC_PIN_SD2			(0x1 << 1)
+#define SCU_FUC_PIN_SD1			(0x1 << 0)
 
 
-/*	AST_SCU_FUN_PIN_CTRL6		0x94		Multi-function Pin Control#6*/
+/* AST_SCU_FUN_PIN_CTRL6		0x94 - Multi-function Pin Control#6*/
 #define SCU_FUN_PIN_USBP1_MODE(x)	(x << 13)	/* Select USB2.0 Port\#2 function mode */
 #define SCU_FUN_PIN_USBP1_MASK		(0x3 << 13)	/* Select USB2.0 Port\#2 function mode */
-#define USB_HID_MODE	0
-#define USB_DEV_MODE	1
-#define USB_HOST_MODE	2
-#define SCU_FUN_PIN_SGPIOP2			(0x1 << 12)	/* Enable Slave SGPIO port 2 function pins */
-#define SCU_FUN_PIN_UART13			(0x1 << 11)	/* Enable UART13 function pins */
-#define SCU_FUN_PIN_UART12			(0x1 << 10)	/* Enable UART12 function pins */
-#define SCU_FUN_PIN_UART11			(0x1 << 9)	/* Enable UART11 function pins */
-#define SCU_FUN_PIN_UART10			(0x1 << 8)	/* Enable UART10 function pins */
-#define SCU_FUN_PIN_UART9			(0x1 << 7)	/* Enable UART9 function pins */
-#define SCU_FUN_PIN_UART8			(0x1 << 6)	/* Enable UART8 function pins */
-#define SCU_FUN_PIN_UART7			(0x1 << 5)	/* Enable UART7 function pins */
-#define SCU_FUN_PIN_I2S2			(0x1 << 4)
-#define SCU_FUN_PIN_I2S1			(0x1 << 3)
+#define USB_HID_MODE			0
+#define USB_DEV_MODE			1
+#define USB_HOST_MODE			2
+#define SCU_FUN_PIN_SGPIOP2		(0x1 << 12)	/* Enable Slave SGPIO port 2 function pins */
+#define SCU_FUN_PIN_UART13		(0x1 << 11)	/* Enable UART13 function pins */
+#define SCU_FUN_PIN_UART12		(0x1 << 10)	/* Enable UART12 function pins */
+#define SCU_FUN_PIN_UART11		(0x1 << 9)	/* Enable UART11 function pins */
+#define SCU_FUN_PIN_UART10		(0x1 << 8)	/* Enable UART10 function pins */
+#define SCU_FUN_PIN_UART9		(0x1 << 7)	/* Enable UART9 function pins */
+#define SCU_FUN_PIN_UART8		(0x1 << 6)	/* Enable UART8 function pins */
+#define SCU_FUN_PIN_UART7		(0x1 << 5)	/* Enable UART7 function pins */
+#define SCU_FUN_PIN_I2S2		(0x1 << 4)
+#define SCU_FUN_PIN_I2S1		(0x1 << 3)
 #define SCU_FUN_PIN_VIDEO_SO		(0x1 << 2)
 #define SCU_FUN_PIN_DVO_24BIT		(0x1)
 #define SCU_VIDEO_OUT_MASK		(~0x3)
 
-/*	AST_SCU_WDT_RESET		0x9C		Watchdog Reset Selection */
-/*	AST_SCU_FUN_PIN_CTRL7		0xA0		Multi-function Pin Control#7*/
-/*	AST_SCU_FUN_PIN_CTRL8		0xA4		Multi-function Pin Control#8*/
+/* AST_SCU_WDT_RESET			0x9C - Watchdog Reset Selection */
+/* AST_SCU_FUN_PIN_CTRL7		0xA0 - Multi-function Pin Control#7*/
+/* AST_SCU_FUN_PIN_CTRL8		0xA4 - Multi-function Pin Control#8*/
 #define SCU_FUN_PIN_ROMA17		(0x1 << 31)
 #define SCU_FUN_PIN_ROMA16		(0x1 << 30)
 #define SCU_FUN_PIN_ROMA15		(0x1 << 29)
@@ -999,51 +908,38 @@
 #define SCU_FUN_PIN_ROMA3		(0x1 << 17)
 #define SCU_FUN_PIN_ROMA2		(0x1 << 16)
 
-/*	AST_SCU_FUN_PIN_CTRL9		0xA8		Multi-function Pin Control#9*/
+/* AST_SCU_FUN_PIN_CTRL9		0xA8 - Multi-function Pin Control#9 */
 #define SCU_FUN_PIN_ROMA21		(0x1 << 3)
 #define SCU_FUN_PIN_ROMA20		(0x1 << 2)
 #define SCU_FUN_PIN_ROMA19		(0x1 << 1)
 #define SCU_FUN_PIN_ROMA18		(0x1)
 
-/*	AST_SCU_PWR_SAVING_EN		0xC0		Power Saving Wakeup Enable*/
-/*	AST_SCU_PWR_SAVING_CTRL		0xC4		Power Saving Wakeup Control*/
-/*	AST_SCU_HW_STRAP2			0xD0		Haardware strapping register set 2*/
+/* AST_SCU_PWR_SAVING_EN		0xC0 - Power Saving Wakeup Enable */
+/* AST_SCU_PWR_SAVING_CTRL		0xC4 - Power Saving Wakeup Control */
+/* AST_SCU_HW_STRAP2			0xD0 - Haardware strapping register set 2 */
 
 
-/*	AST_SCU_COUNTER4			0xE0		SCU Free Run Counter Read Back #4*/
-/*	AST_SCU_COUNTER4_EXT		0xE4		SCU Free Run Counter Extended Read Back #4*/
+/* AST_SCU_COUNTER4			0xE0 - SCU Free Run Counter Read Back #4 */
+/* AST_SCU_COUNTER4_EXT			0xE4 - SCU Free Run Counter Extended Read Back #4 */
 
 //CPU 2
-/*	AST_SCU_CPU2_CTRL			0x100		CPU2 Control Register*/
-/*	AST_SCU_CPU2_BASE0_ADDR		0x104		CPU2 Base Address for Segment 0x00:0000~0x1F:FFFF*/
-/*	AST_SCU_CPU2_BASE1_ADDR		0x108		CPU2 Base Address for Segment 0x20:0000~0x3F:FFFF*/
-/*	AST_SCU_CPU2_BASE2_ADDR		0x10C		CPU2 Base Address for Segment 0x40:0000~0x5F:FFFF*/
-/*	AST_SCU_CPU2_BASE3_ADDR		0x110		CPU2 Base Address for Segment 0x60:0000~0x7F:FFFF*/
-/*	AST_SCU_CPU2_BASE4_ADDR		0x114		CPU2 Base Address for Segment 0x80:0000~0xFF:FFFF*/
-/*	AST_SCU_CPU2_CACHE_CTRL		0x118		CPU2 Cache Function Control */
-
-#if defined(CONFIG_ARCH_AST1010)
-/*	AST_SCU_CPU_CACHE_CTRL		0x11C		CPU Cache Function Control*/
-#define SCU_AREA7_CACHE_EN		(0x1 << 8)
-#define SCU_AREA6_CACHE_EN		(0x1 << 7)
-#define SCU_AREA5_CACHE_EN		(0x1 << 6)
-#define SCU_AREA4_CACHE_EN		(0x1 << 5)
-#define SCU_AREA3_CACHE_EN		(0x1 << 4)
-#define SCU_AREA2_CACHE_EN		(0x1 << 3)
-#define SCU_AREA1_CACHE_EN		(0x1 << 2)
-#define SCU_AREA0_CACHE_EN		(0x1 << 1)
-#define SCU_CACHE_EN			(0x1)
-#endif
-//
-/*	AST_SCU_UART24_REF			0x160		Generate UART 24Mhz Ref from H-PLL when CLKIN is 25Mhz */
-/*	AST_SCU_PCIE_CONFIG_SET		0x180		PCI-E Configuration Setting Control Register */
-/*	AST_SCU_BMC_MMIO_DEC		0x184		BMC MMIO Decode Setting Register */
-/*	AST_SCU_DEC_AREA1			0x188		1st relocated controller decode area location */
-/*	AST_SCU_DEC_AREA2			0x18C		2nd relocated controller decode area location */
-/*	AST_SCU_MBOX_DEC_AREA		0x190		Mailbox decode area location*/
-/*	AST_SCU_SRAM_DEC_AREA0		0x194		Shared SRAM area decode location*/
-/*	AST_SCU_SRAM_DEC_AREA1		0x198		Shared SRAM area decode location*/
-/*	AST_SCU_BMC_CLASS			0x19C		BMC device class code and revision ID */
-/*	AST_SCU_BMC_DEV_ID			0x1A4		BMC device ID */
+/* AST_SCU_CPU2_CTRL			0x100 - CPU2 Control Register*/
+/* AST_SCU_CPU2_BASE0_ADDR		0x104 - CPU2 Base Address for Segment 0x00:0000~0x1F:FFFF */
+/* AST_SCU_CPU2_BASE1_ADDR		0x108 - CPU2 Base Address for Segment 0x20:0000~0x3F:FFFF */
+/* AST_SCU_CPU2_BASE2_ADDR		0x10C - CPU2 Base Address for Segment 0x40:0000~0x5F:FFFF */
+/* AST_SCU_CPU2_BASE3_ADDR		0x110 - CPU2 Base Address for Segment 0x60:0000~0x7F:FFFF */
+/* AST_SCU_CPU2_BASE4_ADDR		0x114 - CPU2 Base Address for Segment 0x80:0000~0xFF:FFFF */
+/* AST_SCU_CPU2_CACHE_CTRL		0x118 - CPU2 Cache Function Control */
+
+/* AST_SCU_UART24_REF			0x160 - Generate UART 24Mhz Ref from H-PLL when CLKIN is 25Mhz */
+/* AST_SCU_PCIE_CONFIG_SET		0x180 - PCI-E Configuration Setting Control Register */
+/* AST_SCU_BMC_MMIO_DEC			0x184 - BMC MMIO Decode Setting Register */
+/* AST_SCU_DEC_AREA1			0x188 - 1st relocated controller decode area location */
+/* AST_SCU_DEC_AREA2			0x18C - 2nd relocated controller decode area location */
+/* AST_SCU_MBOX_DEC_AREA		0x190 - Mailbox decode area location*/
+/* AST_SCU_SRAM_DEC_AREA0		0x194 - Shared SRAM area decode location*/
+/* AST_SCU_SRAM_DEC_AREA1		0x198 - Shared SRAM area decode location*/
+/* AST_SCU_BMC_CLASS			0x19C - BMC device class code and revision ID */
+/* AST_SCU_BMC_DEV_ID			0x1A4 - BMC device ID */
 
 #endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
index 55ce2f2df0ab..2861f3b2c947 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
@@ -9,30 +9,24 @@
  *   History      :
  *    1. 2012/12/29 Ryan Chen Create
  *
-********************************************************************************/
+ ******************************************************************************/
 #ifndef __AST_SDMC_H
-#define __AST_SDMC_H                     1
+#define __AST_SDMC_H
 
 /*
  *  Register for SDMC
- *  */
-#define AST_SDMC_PROTECT	0x00		/*	protection key register	*/
-#define AST_SDMC_CONFIG		0x04		/*	Configuration register */
+ */
+#define AST_SDMC_PROTECT	0x00		/* protection key register */
+#define AST_SDMC_CONFIG		0x04		/* Configuration register */
 
 /*	AST_SDMC_PROTECT: 0x00  - protection key register */
 #define SDMC_PROTECT_UNLOCK			0xFC600309
 
-#if defined(CONFIG_ARCH_AST1010)
-/*	AST_SDMC_CONFIG :0x04	 - Configuration register */
-#define SDMC_CONFIG_16MB			1
-
-#else
-/*	AST_SDMC_CONFIG :0x04	 - Configuration register */
+/*	AST_SDMC_CONFIG : 0x04	- Configuration register */
 #define SDMC_CONFIG_VER_NEW		(0x1 << 28)
 #define SDMC_CONFIG_MEM_GET(x)		(x & 0x3)
 
 #define SDMC_CONFIG_CACHE_EN		(0x1 << 10)
-#define SDMC_CONFIG_EEC_EN			(0x1 << 7)
-#endif
+#define SDMC_CONFIG_EEC_EN		(0x1 << 7)
 
 #endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-spi.h b/arch/arm/include/asm/arch-aspeed/regs-spi.h
deleted file mode 100644
index a5cb39f6e771..000000000000
--- a/arch/arm/include/asm/arch-aspeed/regs-spi.h
+++ /dev/null
@@ -1,55 +0,0 @@
-/*
- * Register definitions for the AST SPI Controller
- */
-
-/* Register offsets */
-#define AST_SPI_CONFIG			0x00
-#define AST_SPI_CTRL			0x04
-#define AST_SPI_DMA_STS			0x08
-#define AST_SPI_MISC			0x10
-#define AST_SPI_TIMING			0x14
-
-#define AST_SPI_DMA_CTRL		0x80
-#define AST_SPI_DMA_FLASH_BASE	0x84
-#define AST_SPI_DMA_DRAM_BASE	0x88
-#define AST_SPI_DMA_LENGTH		0x8c
-
-
-/* AST_SPI_CONFIG 0x00 : SPI Flash Configuration Register */
-#define SPI_CONF_CS1			(0x1 << 2)
-#define SPI_CONF_CLKX2			(0x1 << 1)
-#define SPI_CONF_WRITE_EN		(0x1)
-
-/* FMC_CE0_CTRL	for SPI 0x10, 0x14, 0x18, 0x1c, 0x20 */
-#define SPI_IO_MODE(x)			(x << 28)
-#define SPI_SINGLE_BIT			0
-#define SPI_DUAL_BIT_D			2
-#define SPI_DUAL_BIT_DA			3
-#define SPI_CE_WIDTH(x)			(x << 24)
-#define SPI_CMD_DATA(x)			(x << 16)
-#define SPI_DUMMY_CMD			(1 << 15)
-#define SPI_DUMMY_HIGH			(1 << 14)
-//#define SPI_CLK_DIV				(1 << 13)		?? TODO ask....
-//#define SPI_ADDR_CYCLE			(1 << 13)		?? TODO ask....
-#define SPI_CMD_MERGE_DIS		(1 << 12)
-#define SPI_CLK_DIV(x)			(x << 8)
-#define SPI_CLK_DIV_MASK		(0xf << 8)
-
-#define SPI_DUMMY_LOW			(x << 6)
-#define SPI_LSB_FIRST_CTRL		(1 << 5)
-#define SPI_CPOL_1				(1 << 4)
-#define SPI_DUAL_DATA			(1 << 3)
-#define SPI_CE_INACTIVE			(1 << 2)
-#define SPI_CMD_MODE			(x)
-#define SPI_CMD_NOR_R_MODE		0
-#define SPI_CMD_FAST_R_MODE		1
-#define SPI_CMD_NOR_W_MODE		2
-#define SPI_CMD_USER_MODE		3
-
-/* AST_SPI_DMA_CTRL				0x80 */
-#define SPI_DMA_EN				(1 << 0)
-
-
-#define FLASH_STATUS_DMA_BUSY		0x0000
-#define FLASH_STATUS_DMA_READY		0x0800
-#define FLASH_STATUS_DMA_CLEAR		0x0800
diff --git a/arch/arm/mach-aspeed/ast-ahbc.c b/arch/arm/mach-aspeed/ast-ahbc.c
index 5686bed12df2..9a41482c0f25 100644
--- a/arch/arm/mach-aspeed/ast-ahbc.c
+++ b/arch/arm/mach-aspeed/ast-ahbc.c
@@ -1,24 +1,29 @@
-/********************************************************************************
-* File Name     : arch/arm/mach-aspeed/ast-ahbc.c
-* Author         : Ryan Chen
-* Description   : AST AHB Ctrl
-*
-* Copyright (C) 2012-2020  ASPEED Technology Inc.
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by the Free Software Foundation;
-* either version 2 of the License, or (at your option) any later version.
-* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
-* without even the implied warranty of MERCHANTABILITY or
-* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-
-*   History      :
-*    1. 2014/03/15 Ryan Chen Create
-*
-********************************************************************************/
+/*******************************************************************************
+ * File Name     : arch/arm/mach-aspeed/ast-ahbc.c
+ * Author         : Ryan Chen
+ * Description   : AST AHB Ctrl
+ *
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+ * USA
+ *
+ *   History      :
+ *    1. 2014/03/15 Ryan Chen Create
+ *
+ ******************************************************************************/
 #include <common.h>
 #include <asm/processor.h>
 #include <asm/io.h>
@@ -26,70 +31,57 @@
 #include <asm/arch/ast-ahbc.h>
 #include <asm/arch/aspeed.h>
 
-DECLARE_GLOBAL_DATA_PTR;
-
-//#define AST_AHBC_DEBUG
-
-#ifdef AST_AHBC_DEBUG
-#define AHBCDBUG(fmt, args...) printf("%s() " fmt, __FUNCTION__, ## args)
-#else
-#define AHBCDBUG(fmt, args...)
-#endif
-
-static u32 ast_ahbc_base = AST_AHBC_BASE;
-static inline u32
-ast_ahbc_read(u32 reg)
+static inline u32 ast_ahbc_read(u32 reg)
 {
-	u32 val;
-	val = readl(ast_ahbc_base + reg);
-	AHBCDBUG("reg = 0x%08x, val = 0x%08x\n", reg, val);
+	u32 val = readl(AST_AHBC_BASE + reg);
 
+	debug("reg = 0x%08x, val = 0x%08x\n", reg, val);
 	return val;
 }
 
-static inline void
-ast_ahbc_write(u32 val, u32 reg)
+static inline void ast_ahbc_write(u32 val, u32 reg)
 {
-	AHBCDBUG("reg = 0x%08x, val = 0x%08x\n", reg, val);
+	debug("reg = 0x%08x, val = 0x%08x\n", reg, val);
 
 #ifdef CONFIG_AST_AHBC_LOCK
 	//unlock
-	writel(AHBC_PROTECT_UNLOCK, ast_ahbc_base);
-	writel(val, ast_ahbc_base + reg);
+	writel(AHBC_PROTECT_UNLOCK, AST_AHBC_BASE);
+	writel(val, AST_AHBC_BASE + reg);
 	//lock
-	writel(0xaa,ast_ahbc_base);
+	writel(0xaa,AST_AHBC_BASE);
 #else
-	writel(AHBC_PROTECT_UNLOCK, ast_ahbc_base);
-	writel(val, ast_ahbc_base + reg);
+	writel(AHBC_PROTECT_UNLOCK, AST_AHBC_BASE);
+	writel(val, AST_AHBC_BASE + reg);
 #endif
 
 }
 
-//***********************************Information ***********************************
-
-extern void ast_ahbc_boot_remap(void)
+void ast_ahbc_boot_remap(void)
 {
-#if defined(AST_SOC_G5)
-#else
-	ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) | AHBC_BOOT_REMAP, AST_AHBC_ADDR_REMAP);
+#if ! defined(AST_SOC_G5)
+	ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) |
+		       AHBC_BOOT_REMAP, AST_AHBC_ADDR_REMAP);
 #endif
-
 }
 
 #ifdef AST_SOC_G5
-extern void ast_ahbc_peie_mapping(u8 enable)
+void ast_ahbc_peie_mapping(u8 enable)
 {
-	if(enable)
-		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) | AHBC_PCIE_MAP, AST_AHBC_ADDR_REMAP);
+	if (enable)
+		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) |
+			       AHBC_PCIE_MAP, AST_AHBC_ADDR_REMAP);
 	else
-		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) & ~AHBC_PCIE_MAP, AST_AHBC_ADDR_REMAP);
+		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) &
+			       ~AHBC_PCIE_MAP, AST_AHBC_ADDR_REMAP);
 }
 
-extern void ast_ahbc_lpc_plus_mapping(u8 enable)
+void ast_ahbc_lpc_plus_mapping(u8 enable)
 {
 	if(enable)
-		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) | AHBC_LPC_PLUS_MAP, AST_AHBC_ADDR_REMAP);
+		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) |
+			       AHBC_LPC_PLUS_MAP, AST_AHBC_ADDR_REMAP);
 	else
-		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) & ~AHBC_LPC_PLUS_MAP, AST_AHBC_ADDR_REMAP);
+		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) &
+			       ~AHBC_LPC_PLUS_MAP, AST_AHBC_ADDR_REMAP);
 }
 #endif
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
index fb1ad38c4f17..af0971819006 100644
--- a/arch/arm/mach-aspeed/ast-scu.c
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -1,36 +1,40 @@
-/********************************************************************************
+/*******************************************************************************
 * File Name     : arch/arm/cpu/ast-common/ast-scu.c
 * Author         : Ryan Chen
 * Description   : AST SCU
 *
-* Copyright (C) 2012-2020  ASPEED Technology Inc.
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by the Free Software Foundation;
-* either version 2 of the License, or (at your option) any later version.
-* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
-* without even the implied warranty of MERCHANTABILITY or
-* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+* Copyright (C) 2012-2020 ASPEED Technology Inc.  This program is free
+* software; you can redistribute it and/or modify it under the terms
+* of the GNU General Public License as published by the Free Software
+* Foundation; either version 2 of the License, or (at your option) any
+* later version.
+*
+* This program is distributed in the hope that it will be useful, but
+* WITHOUT ANY WARRANTY; without even the implied warranty of
+* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+* General Public License for more details.
+*
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
-* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-CLK24M
- |
- |--> H-PLL -->HCLK
- |
- |--> M-PLL -xx->MCLK
- |
- |--> V-PLL1 -xx->DCLK
- |
- |--> V-PLL2 -xx->D2CLK
- |
- |--> USB2PHY -->UTMICLK
-
-
+* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+* USA
+*
+* CLK24M
+*  |
+*  |--> H-PLL -->HCLK
+*  |
+*  |--> M-PLL -xx->MCLK
+*  |
+*  |--> V-PLL1 -xx->DCLK
+*  |
+*  |--> V-PLL2 -xx->D2CLK
+*  |
+*  |--> USB2PHY -->UTMICLK
+*
 *   History      :
 *    1. 2012/08/15 Ryan Chen Create
 *
-********************************************************************************/
+*******************************************************************************/
 #include <common.h>
 #include <asm/processor.h>
 #include <asm/io.h>
@@ -39,35 +43,21 @@ CLK24M
 #include <asm/arch/platform.h>
 #include <asm/arch/aspeed.h>
 
-//#define ASPEED_SCU_LOCK
-//#define ASPEED_SCU_DEBUG
-
-#ifdef ASPEED_SCU_DEBUG
-#define SCUDBUG(fmt, args...) printf("%s() " fmt, __FUNCTION__, ## args)
-#else
-#define SCUDBUG(fmt, args...)
-#endif
-
-#define SCUMSG(fmt, args...) printf(fmt, ## args)
+/* #define ASPEED_SCU_LOCK */
 
 static u32 ast_scu_base = AST_SCU_BASE;
 
-static inline u32
-ast_scu_read(u32 reg)
+static inline u32 ast_scu_read(u32 reg)
 {
-	u32 val;
-
-	val = readl(ast_scu_base + reg);
-
-	SCUDBUG("ast_scu_read : reg = 0x%08x, val = 0x%08x\n", reg, val);
+	u32 val = readl(ast_scu_base + reg);
 
+	debug("ast_scu_read : reg = 0x%08x, val = 0x%08x\n", reg, val);
 	return val;
 }
 
-static inline void
-ast_scu_write(u32 val, u32 reg)
+static inline void ast_scu_write(u32 val, u32 reg)
 {
-	SCUDBUG("ast_scu_write : reg = 0x%08x, val = 0x%08x\n", reg, val);
+	debug("ast_scu_write : reg = 0x%08x, val = 0x%08x\n", reg, val);
 #ifdef CONFIG_AST_SCU_LOCK
 	//unlock
 	writel(SCU_PROTECT_UNLOCK, ast_scu_base);
@@ -80,163 +70,94 @@ ast_scu_write(u32 val, u32 reg)
 #endif
 }
 
-//SoC mapping Table
+/* SoC mapping Table */
 struct soc_id {
-	const char	* name;
-	u32	rev_id;
+	const char *name;
+	u32	   rev_id;
 };
 
+#define SOC_ID(str, rev) { .name = str, .rev_id = rev, }
+
 static struct soc_id soc_map_table[] = {
-	[0] = {
-		.name = "AST1100/AST2050-A0",
-		.rev_id = 0x00000200,
-	},
-	[1] = {
-		.name = "AST1100/AST2050-A1",
-		.rev_id = 0x00000201,
-	},
-	[2] = {
-		.name = "AST1100/AST2050-A2,3/AST2150-A0,1",
-		.rev_id = 0x00000202,
-	},
-	[3] = {
-		.name = "AST1510/AST2100-A0",
-		.rev_id = 0x00000300,
-	},
-	[4] = {
-		.name = "AST1510/AST2100-A1",
-		.rev_id = 0x00000301,
-	},
-	[5] = {
-		.name = "AST1510/AST2100-A2,3",
-		.rev_id = 0x00000302,
-	},
-	[6] = {
-		.name = "AST2200-A0,1",
-		.rev_id = 0x00000102,
-	},
-	[7] = {
-		.name = "AST2300-A0",
-		.rev_id = 0x01000003,
-	},
-	[8] = {
-		.name = "AST2300-A1",
-		.rev_id = 0x01010303,
-	},
-	[9] = {
-		.name = "AST1300-A1",
-		.rev_id = 0x01010003,
-	},
-	[10] = {
-		.name = "AST1050-A1",
-		.rev_id = 0x01010203,
-	},
-	[11] = {
-		.name = "AST2400-A0",
-		.rev_id = 0x02000303,
-	},
-	[12] = {
-		.name = "AST2400-A1",
-		.rev_id = 0x02010303,
-	},
-	[13] = {
-		.name = "AST1010-A0",
-		.rev_id = 0x03000003,
-	},
-	[14] = {
-		.name = "AST1010-A1",
-		.rev_id = 0x03010003,
-	},
-	[15] = {
-		.name = "AST1520-A0",
-		.rev_id = 0x03000203,
-	},
-	[16] = {
-		.name = "AST3200-A0",
-		.rev_id = 0x03000303,
-	},
-	[17] = {
-		.name = "AST2500-A0",
-		.rev_id = 0x04000303,
-	},
-	[18] = {
-		.name = "AST2510-A0",
-		.rev_id = 0x04000103,
-	},
-	[19] = {
-		.name = "AST2520-A0",
-		.rev_id = 0x04000203,
-	},
-	[20] = {
-		.name = "AST2530-A0",
-		.rev_id = 0x04000403,
-	},
-	[21] = {
-		.name = "AST1520-A1",
-		.rev_id = 0x03010203,
-	},
-	[22] = {
-		.name = "AST3200-A1",
-		.rev_id = 0x03010303,
-	},
-	[23] = {
-		.name = "AST2500-A1",
-		.rev_id = 0x04010303,
-	},
-	[24] = {
-		.name = "AST2510-A1",
-		.rev_id = 0x04010103,
-	},
-	[25] = {
-		.name = "AST2520-A1",
-		.rev_id = 0x04010203,
-	},
-	[26] = {
-		.name = "AST2530-A1",
-		.rev_id = 0x04010403,
-	},
+	SOC_ID("AST1100/AST2050-A0", 0x00000200),
+	SOC_ID("AST1100/AST2050-A1", 0x00000201),
+	SOC_ID("AST1100/AST2050-A2,3/AST2150-A0,1", 0x00000202),
+	SOC_ID("AST1510/AST2100-A0", 0x00000300),
+	SOC_ID("AST1510/AST2100-A1", 0x00000301),
+	SOC_ID("AST1510/AST2100-A2,3", 0x00000302),
+	SOC_ID("AST2200-A0,1", 0x00000102),
+	SOC_ID("AST2300-A0", 0x01000003),
+	SOC_ID("AST2300-A1", 0x01010303),
+	SOC_ID("AST1300-A1", 0x01010003),
+	SOC_ID("AST1050-A1", 0x01010203),
+	SOC_ID("AST2400-A0", 0x02000303),
+	SOC_ID("AST2400-A1", 0x02010303),
+	SOC_ID("AST1010-A0", 0x03000003),
+	SOC_ID("AST1010-A1", 0x03010003),
+	SOC_ID("AST1520-A0", 0x03000203),
+	SOC_ID("AST3200-A0", 0x03000303),
+	SOC_ID("AST2500-A0", 0x04000303),
+	SOC_ID("AST2510-A0", 0x04000103),
+	SOC_ID("AST2520-A0", 0x04000203),
+	SOC_ID("AST2530-A0", 0x04000403),
+	SOC_ID("AST1520-A1", 0x03010203),
+	SOC_ID("AST3200-A1", 0x03010303),
+	SOC_ID("AST2500-A1", 0x04010303),
+	SOC_ID("AST2510-A1", 0x04010103),
+	SOC_ID("AST2520-A1", 0x04010203),
+	SOC_ID("AST2530-A1", 0x04010403),
 };
-//***********************************Initial control***********************************
+
+/********************************Initial control*******************************/
 #ifdef SCU_RESET_VIDEO
-extern void
-ast_scu_reset_video(void)
+void ast_scu_reset_video(void)
 {
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_VIDEO, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_VIDEO,
+		      AST_SCU_RESET);
 	udelay(100);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_VIDEO, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_VIDEO,
+		      AST_SCU_RESET);
 }
 
-
-extern void
-ast_scu_init_video(u8 dynamic_en)
+void ast_scu_init_video(u8 dynamic_en)
 {
-	//Video Engine Clock Enable and Reset
-	//  Enable Clock & ECLK = inverse of (M-PLL / 2)
-	if(dynamic_en)
-		ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_VIDEO_SLOW_MASK) | SCU_CLK_VIDEO_SLOW_EN | SCU_CLK_VIDEO_SLOW_SET(0), AST_SCU_CLK_SEL);
+	/* Video Engine Clock Enable and Reset
+	 * Enable Clock & ECLK = inverse of (M-PLL / 2)
+	 */
+	if (dynamic_en)
+		ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) &
+			       ~SCU_CLK_VIDEO_SLOW_MASK) |
+			      SCU_CLK_VIDEO_SLOW_EN | SCU_CLK_VIDEO_SLOW_SET(0),
+			      AST_SCU_CLK_SEL);
 	else {
-		if(GET_CHIP_REVISION(ast_scu_read(AST_SCU_REVISION_ID)) == 4)
-			ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~(SCU_ECLK_SOURCE_MASK | SCU_CLK_VIDEO_SLOW_MASK | SCU_CLK_VIDEO_SLOW_EN)), AST_SCU_CLK_SEL);
+		if (GET_CHIP_REVISION(ast_scu_read(AST_SCU_REVISION_ID)) == 4)
+			ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) &
+		       ~(SCU_ECLK_SOURCE_MASK | SCU_CLK_VIDEO_SLOW_MASK |
+			 SCU_CLK_VIDEO_SLOW_EN)), AST_SCU_CLK_SEL);
 		else
-			ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~(SCU_ECLK_SOURCE_MASK | SCU_CLK_VIDEO_SLOW_EN)) | SCU_ECLK_SOURCE(2), AST_SCU_CLK_SEL);
+			ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) &
+		       ~(SCU_ECLK_SOURCE_MASK | SCU_CLK_VIDEO_SLOW_EN)) |
+		      SCU_ECLK_SOURCE(2), AST_SCU_CLK_SEL);
 	}
 
-	// Enable CLK
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~(SCU_ECLK_STOP_EN | SCU_VCLK_STOP_EN), AST_SCU_CLK_STOP);
+	/* Enable CLK */
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) &
+		      ~(SCU_ECLK_STOP_EN | SCU_VCLK_STOP_EN), AST_SCU_CLK_STOP);
 	mdelay(10);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_VIDEO, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_VIDEO,
+		      AST_SCU_RESET);
 	udelay(100);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_VIDEO, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_VIDEO,
+		      AST_SCU_RESET);
 }
 #endif
 
 #ifdef SCU_UART1CLK_STOP_EN
-extern void
-ast_scu_init_uart(u8 uart)
+void ast_scu_init_uart(u8 uart)
 {
 	u32 clk_stop_en = 0;
 
-	//uart 1
+	/* uart 1 */
 	if(uart & 0x2) {
 		clk_stop_en |= SCU_UART1CLK_STOP_EN;
 	}
@@ -253,216 +174,245 @@ ast_scu_init_uart(u8 uart)
 		clk_stop_en |= SCU_UART4CLK_STOP_EN;
 	}
 
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~(clk_stop_en), AST_SCU_CLK_STOP);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~(clk_stop_en),
+		      AST_SCU_CLK_STOP);
 
 }
 #endif
 
-extern void
-ast_scu_init_eth(u8 num)
+void ast_scu_init_eth(u8 num)
 {
 
-//Set MAC delay Timing
+/* Set MAC delay Timing */
 #if defined(AST_SOC_G5)
 	//a1
 //	ast_scu_write(0x00145249, AST_SCU_MAC_CLK);
 //	ast_scu_write(0x00145249, AST_SCU_MAC_CLK_DELAY_100M);
 //	ast_scu_write(0x00145249, AST_SCU_MAC_CLK_DELAY_10M);
 //	ast_scu_write((0x6a << 16) | (0x6a << 8), AST_SCU_MAC_CLK_DUTY);
-#elif defined(CONFIG_ARCH_AST1010)
-// do nothing
 #else
-	//AST2300 max clk to 125Mhz, AST2400 max clk to 198Mhz
-	if(ast_scu_read(AST_SCU_HW_STRAP1) & (SCU_HW_STRAP_MAC1_RGMII | SCU_HW_STRAP_MAC0_RGMII))	//RGMII --> H-PLL/6
-		ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_MAC_MASK) | SCU_CLK_MAC_DIV(2), AST_SCU_CLK_SEL);
-	else	//RMII --> H-PLL/10
-		ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_MAC_MASK) | SCU_CLK_MAC_DIV(4), AST_SCU_CLK_SEL);
+	/* AST2300 max clk to 125Mhz, AST2400 max clk to 198Mhz */
+
+	/* RGMII --> H-PLL/6 */
+	if(ast_scu_read(AST_SCU_HW_STRAP1) &
+	   (SCU_HW_STRAP_MAC1_RGMII | SCU_HW_STRAP_MAC0_RGMII))
+		ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) &
+			       ~SCU_CLK_MAC_MASK) | SCU_CLK_MAC_DIV(2),
+			      AST_SCU_CLK_SEL);
+	else /* RMII --> H-PLL/10 */
+		ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) &
+			       ~SCU_CLK_MAC_MASK) | SCU_CLK_MAC_DIV(4),
+			      AST_SCU_CLK_SEL);
 
 	ast_scu_write(0x2255, AST_SCU_MAC_CLK);
 #endif
 
-	switch(num) {
-		case 0:
-			ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_MAC0,
-							AST_SCU_RESET);
-			udelay(100);
-			ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_MAC0CLK_STOP_EN,
-							AST_SCU_CLK_STOP);
-			udelay(1000);
-			ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_MAC0,
+	switch (num) {
+	case 0:
+		ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_MAC0,
 							AST_SCU_RESET);
-
-			break;
+		udelay(100);
+		ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) &
+			      ~SCU_MAC0CLK_STOP_EN, AST_SCU_CLK_STOP);
+		udelay(1000);
+		ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_MAC0,
+			      AST_SCU_RESET);
+
+		break;
 #if defined(AST_MAC1_BASE)
-		case 1:
-			ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_MAC1,
-							AST_SCU_RESET);
-			udelay(100);
-			ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_MAC1CLK_STOP_EN,
-							AST_SCU_CLK_STOP);
-			udelay(1000);
-			ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_MAC1,
-							AST_SCU_RESET);
-			break;
+	case 1:
+		ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_MAC1,
+			      AST_SCU_RESET);
+		udelay(100);
+		ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) &
+			      ~SCU_MAC1CLK_STOP_EN, AST_SCU_CLK_STOP);
+		udelay(1000);
+		ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_MAC1,
+			      AST_SCU_RESET);
+		break;
 #endif
 	}
 }
 
 #ifdef SCU_RESET_USB11
-extern void
-ast_scu_init_uhci(void)
+void ast_scu_init_uhci(void)
 {
-	//USB1.1 Host's Clock Enable and Reset
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_USB11CLK_STOP_EN, AST_SCU_CLK_STOP);
+	/* USB1.1 Host's Clock Enable and Reset */
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_USB11CLK_STOP_EN,
+		      AST_SCU_CLK_STOP);
 	mdelay(10);
 
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_USB11, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_USB11,
+		      AST_SCU_RESET);
 }
 #endif
 
 #ifdef SCU_RESET_USB20
-extern void
-ast_scu_init_usb_port1(void)
+void ast_scu_init_usb_port1(void)
 {
-	/* EHCI controller engine init. Process similar to VHub. */
-	/* Following reset sequence can resolve "vhub dead on first power on" issue on V4 board. */
-	//reset USB20
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_USB20, AST_SCU_RESET);
+	/*
+	 * EHCI controller engine init. Process similar to VHub.
+	 * Following reset sequence can resolve "vhub dead on first
+	 * power on" issue on V4 board.
+	 */
+
+	/* reset USB20 */
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_USB20,
+		      AST_SCU_RESET);
 
-	//enable USB20 clock
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) | SCU_USB20_PHY_CLK_EN, AST_SCU_CLK_STOP);
+	/* enable USB20 clock */
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) | SCU_USB20_PHY_CLK_EN,
+		      AST_SCU_CLK_STOP);
 	mdelay(10);
 
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_USB20, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_USB20,
+		      AST_SCU_RESET);
 }
 
 
-extern void
-ast_scu_init_usb_port2()
+void ast_scu_init_usb_port2()
 {
 #ifdef AST_SOC_G5
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_USB_P1, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_USB_P1,
+		      AST_SCU_RESET);
 
-	//enable USB20 clock
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_USB_P1_STOP_EN, AST_SCU_CLK_STOP);
+	/* enable USB20 clock */
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_USB_P1_STOP_EN,
+		      AST_SCU_CLK_STOP);
 	mdelay(10);
 
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_USB_P1, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_USB_P1,
+		      AST_SCU_RESET);
 #endif
 }
-#endif
+#endif /* SCU_RESET_USB20 */
 
 #ifdef SCU_RESET_SD
-extern void
-ast_scu_init_sdhci(void)
+void ast_scu_init_sdhci(void)
 {
-	//SDHCI Host's Clock Enable and Reset
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_SD, AST_SCU_RESET);
+	/* SDHCI Host's Clock Enable and Reset */
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_SD,
+		      AST_SCU_RESET);
 
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_SDCLK_STOP_EN, AST_SCU_CLK_STOP);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_SDCLK_STOP_EN,
+		      AST_SCU_CLK_STOP);
 	mdelay(10);
 
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_CLK_SD_EN, AST_SCU_CLK_SEL);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_CLK_SD_EN,
+		      AST_SCU_CLK_SEL);
 	mdelay(10);
 
-	// SDCLK = H-PLL / 4, G5 = H-PLL /8
-	ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_SD_MASK) | SCU_CLK_SD_DIV(1),
-		AST_SCU_CLK_SEL);
+	/* SDCLK = H-PLL / 4, G5 = H-PLL /8 */
+	ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_SD_MASK) |
+		      SCU_CLK_SD_DIV(1), AST_SCU_CLK_SEL);
 	mdelay(10);
 
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_SD, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_SD,
+		      AST_SCU_RESET);
 }
 #endif
 
-extern void
-ast_scu_init_i2c(void)
+void ast_scu_init_i2c(void)
 {
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_I2C, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_I2C,
+		      AST_SCU_RESET);
 }
 
 
-extern void
-ast_scu_init_pwm_tacho(void)
+void ast_scu_init_pwm_tacho(void)
 {
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PWM, AST_SCU_RESET);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PWM, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PWM,
+		      AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PWM,
+		      AST_SCU_RESET);
 }
 
 
-extern void
-ast_scu_init_adc(void)
+void ast_scu_init_adc(void)
 {
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_ADC, AST_SCU_RESET);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_ADC, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_ADC,
+		      AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_ADC,
+		      AST_SCU_RESET);
 }
 
 #ifdef SCU_RESET_PCIE
-extern void
-ast_scu_init_pcie(void)
-{
-	//pcie host reset
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PCIE, AST_SCU_RESET);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PCIE_DIR, AST_SCU_RESET);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PCIE, AST_SCU_RESET);
+void ast_scu_init_pcie(void)
+{
+	/* pcie host reset */
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PCIE,
+		      AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PCIE_DIR,
+		      AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PCIE,
+		      AST_SCU_RESET);
 	mdelay(10);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PCIE, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PCIE,
+		      AST_SCU_RESET);
 
-	//p2x reset
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_P2X, AST_SCU_RESET);
+	/* p2x reset */
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_P2X,
+		      AST_SCU_RESET);
 
-	//use 0x7c for clr
+	/* use 0x7c for clr */
 	ast_scu_write(SCU_HW_STRAP_VGA_MASK, AST_SCU_REVISION_ID);
-	ast_scu_write(SCU_HW_STRAP_VGA_SIZE_SET(VGA_64M_DRAM), AST_SCU_HW_STRAP1);
+	ast_scu_write(SCU_HW_STRAP_VGA_SIZE_SET(VGA_64M_DRAM),
+		      AST_SCU_HW_STRAP1);
 
-	ast_scu_write(ast_scu_read(AST_SCU_MISC2_CTRL) | SCU_PCIE_MAPPING_HIGH | SCU_MALI_RC_MODE | SCU_MALI_DTY_MODE, AST_SCU_MISC2_CTRL);
+	ast_scu_write(ast_scu_read(AST_SCU_MISC2_CTRL) | SCU_PCIE_MAPPING_HIGH |
+		      SCU_MALI_RC_MODE | SCU_MALI_DTY_MODE, AST_SCU_MISC2_CTRL);
 }
 #endif
 
 #ifdef SCU_RESET_MCTP
-extern void
-ast_scu_init_mctp(void)
+void ast_scu_init_mctp(void)
 {
-	//Notice : Must after Host reset
+	/* Notice : Must after Host reset */
 //	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_MCTP, AST_SCU_RESET);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_MCTP, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_MCTP,
+		      AST_SCU_RESET);
 }
 #endif
 
 #ifdef SCU_RESET_XDMA
-extern void
-ast_scu_init_xdma(void)
+void ast_scu_init_xdma(void)
 {
-	//Notice : 1. Must after Host reset, 2. DRAM Controller 0x08 memory protection must disable [Protect REQ#] 3. VGA PCI Bus master enable offset 0x04[bit2]
+	/* Notice : 1. Must after Host reset, 2. DRAM Controller 0x08
+	 * memory protection must disable [Protect REQ#] 3. VGA PCI
+	 * Bus master enable offset 0x04[bit2]
+	 */
 //	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_XDMA, AST_SCU_RESET);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_XDMA, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_XDMA,
+		      AST_SCU_RESET);
 }
 #endif
 
-extern void
-ast_scu_init_peci(void)
+void ast_scu_init_peci(void)
 {
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PECI, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PECI,
+		      AST_SCU_RESET);
 	udelay(3);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PECI, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PECI,
+		      AST_SCU_RESET);
 }
 
 
-extern void
-ast_scu_init_jtag(void)
+void ast_scu_init_jtag(void)
 {
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_JTAG, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_JTAG,
+		      AST_SCU_RESET);
 	udelay(3);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_JTAG, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_JTAG,
+		      AST_SCU_RESET);
 }
 
 #ifdef SCU_RESET_HACE
-extern void
-ast_scu_init_hace(void)
+void ast_scu_init_hace(void)
 {
-	//enable YCLK for HAC
+	/* enable YCLK for HAC */
 	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) &
-					~(SCU_YCLK_STOP_EN | SCU_RSACLK_STOP_EN),
-					AST_SCU_CLK_STOP);
+				~(SCU_YCLK_STOP_EN | SCU_RSACLK_STOP_EN),
+				AST_SCU_CLK_STOP);
 	mdelay(1);
 	ast_scu_write(ast_scu_read(AST_SCU_RESET) &
 					~SCU_RESET_HACE,
@@ -470,23 +420,23 @@ ast_scu_init_hace(void)
 }
 #endif
 
-extern void
-ast_scu_reset_lpc(void)
+void ast_scu_reset_lpc(void)
 {
-	//Note .. It have been enable in U-boot.....
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_LPC, AST_SCU_RESET);
+	/* Note .. It have been enable in U-boot..... */
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_LPC,
+		      AST_SCU_RESET);
 
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_LPC, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_LPC,
+		      AST_SCU_RESET);
 }
 
-
-extern void
-ast_scu_init_lpc(void)
+void ast_scu_init_lpc(void)
 {
-	//Note .. It have been enable in U-boot.....
+	/* Note .. It have been enable in U-boot..... */
+
 //	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_LPC, AST_SCU_RESET);
 
-	//enable LPC clock LHCLK = H-PLL/8, SOC_G5 H-PLL/16
+	/* enable LPC clock LHCLK = H-PLL/8, SOC_G5 H-PLL/16 */
 	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) |
 					SCU_SET_LHCLK_DIV(3) |
 					SCU_LHCLK_SOURCE_EN,
@@ -494,9 +444,8 @@ ast_scu_init_lpc(void)
 }
 
 
-//////1 : lpc plus modes
-extern u8
-ast_scu_get_lpc_plus_enable(void)
+/* lpc plus modes */
+u8 ast_scu_get_lpc_plus_enable(void)
 {
 	if(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) & SCU_FUN_PIN_LPC_PLUS)
 		return 1;
@@ -506,284 +455,303 @@ ast_scu_get_lpc_plus_enable(void)
 
 
 #ifdef AST_SOC_G5
-extern void
-ast_scu_init_rfx(void)
+void ast_scu_init_rfx(void)
 {
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_RFX, AST_SCU_RESET);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET2) | (SCU_RESET_RFXDEC | SCU_RESET_RFXCMQ | SCU_RESET_BITBLT), AST_SCU_RESET2);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_RFX,
+		      AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET2) | (SCU_RESET_RFXDEC |
+		      SCU_RESET_RFXCMQ | SCU_RESET_BITBLT), AST_SCU_RESET2);
 
-	//Use D1-PLL
-	ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~(SCU_ECLK_SOURCE_MASK | SCU_CLK_VIDEO_SLOW_MASK | SCU_CLK_VIDEO_SLOW_EN)), AST_SCU_CLK_SEL);
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_ECLK_SOURCE(2), AST_SCU_CLK_SEL);
+	/* Use D1-PLL */
+	ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~(SCU_ECLK_SOURCE_MASK |
+		      SCU_CLK_VIDEO_SLOW_MASK | SCU_CLK_VIDEO_SLOW_EN)),
+		      AST_SCU_CLK_SEL);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_ECLK_SOURCE(2),
+		      AST_SCU_CLK_SEL);
 
-	ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_D_PLL_DIS) | SCU_MISC_D_PLL_SOURCE, AST_SCU_MISC1_CTRL);
+	ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_D_PLL_DIS) |
+		      SCU_MISC_D_PLL_SOURCE, AST_SCU_MISC1_CTRL);
 
 	ast_scu_write(0x75402031, AST_SCU_D_PLL);
 	ast_scu_write(0x00000580, AST_SCU_DPLL_PAR0);
 	ast_scu_write(0x00000000, AST_SCU_DPLL_PAR1);
 	ast_scu_write(0x0004AB1C, AST_SCU_DPLL_PAR2);
 
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & 	~(SCU_RFX_CLK_STOP_EN), AST_SCU_CLK_STOP);
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP2) & ~(SCU_CMQCLK_STOP | SCU_RFXCLK_STOP | SCU_BITBLTCLK_STOP), AST_SCU_CLK_STOP2);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & 	~(SCU_RFX_CLK_STOP_EN),
+		      AST_SCU_CLK_STOP);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP2) & ~(SCU_CMQCLK_STOP |
+		  SCU_RFXCLK_STOP | SCU_BITBLTCLK_STOP), AST_SCU_CLK_STOP2);
 	udelay(3);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_RFX, AST_SCU_RESET);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET2) & ~(SCU_RESET_RFXDEC | SCU_RESET_RFXCMQ | SCU_RESET_BITBLT), AST_SCU_RESET2);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_RFX,
+		      AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET2) & ~(SCU_RESET_RFXDEC |
+		       SCU_RESET_RFXCMQ | SCU_RESET_BITBLT), AST_SCU_RESET2);
 
-	//Multi fun pin
-	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) | SCU_FUN_PIN_DVO_24BIT, AST_SCU_FUN_PIN_CTRL6);
+	/* Multi fun pin */
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+		      SCU_FUN_PIN_DVO_24BIT, AST_SCU_FUN_PIN_CTRL6);
 
 }
 #else
-extern void
-ast_scu_init_rfx(void)
+void ast_scu_init_rfx(void)
 {
 }
 #endif
 
 #ifdef SCU_RESET_H264
-extern void
-ast_scu_init_h264(void)
-{
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_H264, AST_SCU_RESET);
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL2) & 	~SCU_H264CLK_MASK, AST_SCU_CLK_SEL2);
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL2) | SCU_SET_H264CLK_DIV(3), AST_SCU_CLK_SEL2);
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & 	~SCU_H264_STOP_EN, AST_SCU_CLK_STOP);
+void ast_scu_init_h264(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_H264,
+		      AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL2) & 	~SCU_H264CLK_MASK,
+		      AST_SCU_CLK_SEL2);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL2) | SCU_SET_H264CLK_DIV(3),
+		      AST_SCU_CLK_SEL2);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & 	~SCU_H264_STOP_EN,
+		      AST_SCU_CLK_STOP);
 	udelay(3);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_H264, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_H264,
+		      AST_SCU_RESET);
 }
 #endif
 
-/* 0:disable spi 1: enable spi master 2:enable spi master and spi slave to ahb 3: enable spi pass-through*/
-extern void
-ast_scu_spi_master(u8 mode)
+/* 0: disable spi
+ * 1: enable spi master
+ * 2: enable spi master and spi slave to ahb
+ * 3: enable spi pass-through
+ */
+void ast_scu_spi_master(u8 mode)
 {
 #ifdef AST_SOC_G5
 	switch(mode) {
-		case 0:
-			ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
-			break;
-		case 1:
-			ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
-			ast_scu_write(SCU_HW_STRAP_SPI_MASTER, AST_SCU_HW_STRAP1);
-			break;
-		case 2:
-			ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
-			ast_scu_write(SCU_HW_STRAP_SPI_M_S_EN, AST_SCU_HW_STRAP1);
-			break;
-		case 3:
-			ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
-			ast_scu_write(SCU_HW_STRAP_SPI_PASS_THROUGH, AST_SCU_HW_STRAP1);
-			break;
+	case 0:
+		ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
+		break;
+	case 1:
+		ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
+		ast_scu_write(SCU_HW_STRAP_SPI_MASTER, AST_SCU_HW_STRAP1);
+		break;
+	case 2:
+		ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
+		ast_scu_write(SCU_HW_STRAP_SPI_M_S_EN, AST_SCU_HW_STRAP1);
+		break;
+	case 3:
+		ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
+		ast_scu_write(SCU_HW_STRAP_SPI_PASS_THROUGH, AST_SCU_HW_STRAP1);
+		break;
 	}
 #else
 	switch(mode) {
-		case 0:
-			ast_scu_write(ast_scu_read(AST_SCU_HW_STRAP1) & ~SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_HW_STRAP1);
-			break;
-		case 1:
-			ast_scu_write((ast_scu_read(AST_SCU_HW_STRAP1) & ~SCU_HW_STRAP_SPI_MODE_MASK) |SCU_HW_STRAP_SPI_MASTER, AST_SCU_HW_STRAP1);
-			break;
-		case 2:
-			ast_scu_write((ast_scu_read(AST_SCU_HW_STRAP1) & ~SCU_HW_STRAP_SPI_MODE_MASK) |SCU_HW_STRAP_SPI_MASTER, AST_SCU_HW_STRAP1);
-			break;
-		case 3:
-			ast_scu_write((ast_scu_read(AST_SCU_HW_STRAP1) & ~SCU_HW_STRAP_SPI_MODE_MASK) |SCU_HW_STRAP_SPI_PASS_THROUGH, AST_SCU_HW_STRAP1);
-			break;
+	case 0:
+		ast_scu_write(ast_scu_read(AST_SCU_HW_STRAP1) &
+			      ~SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_HW_STRAP1);
+		break;
+	case 1:
+		ast_scu_write((ast_scu_read(AST_SCU_HW_STRAP1) &
+		       ~SCU_HW_STRAP_SPI_MODE_MASK) |SCU_HW_STRAP_SPI_MASTER,
+			AST_SCU_HW_STRAP1);
+		break;
+	case 2:
+		ast_scu_write((ast_scu_read(AST_SCU_HW_STRAP1) &
+		       ~SCU_HW_STRAP_SPI_MODE_MASK) |SCU_HW_STRAP_SPI_MASTER,
+		       AST_SCU_HW_STRAP1);
+		break;
+	case 3:
+		ast_scu_write((ast_scu_read(AST_SCU_HW_STRAP1) &
+		~SCU_HW_STRAP_SPI_MODE_MASK) |SCU_HW_STRAP_SPI_PASS_THROUGH,
+	        AST_SCU_HW_STRAP1);
+		break;
 	}
-
 #endif
 }
 
 
 #ifdef SCU_RESET_CRT
-extern void
-ast_scu_init_crt(void)
+void ast_scu_init_crt(void)
 {
-	//ast2400 : VGA use D1 clk, CRT use D2 clk
-	//ast2500 : VGA use D1 clk, CRT use 40Mhz
-	//ast3200/ast1520 : VGA use D1 clk, CRT use D1/D2 clk select L: SCU08[bit 8] - H SCU2C[bit 21]
+	/* ast2400 : VGA use D1 clk, CRT use D2 clk
+	 * ast2500 : VGA use D1 clk, CRT use 40Mhz
+	 * ast3200/ast1520 : VGA use D1 clk, CRT use D1/D2 clk select
+	 * L: SCU08[bit 8] - H SCU2C[bit 21]
+	 */
 
 #ifdef AST_SOC_G5
 
 #ifdef CONFIG_ARCH_AST3200
-	//Select D2 CLK source 00:D-PLL, 01: D2-PLL, 1x : 40Mhz
-	//H: 2c[bit : 21], L: 08[bit : 8]
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_CLK_VIDE0_SO_D2 , AST_SCU_CLK_SEL);
-
-	//Select D2-PLL parameter source [01]
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_CRT_CLK_L_SOURCE , AST_SCU_CLK_SEL);
-	ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_CRT_CLK_H_SOURCE , AST_SCU_MISC1_CTRL);
-
-	//Off D2-PLL
+	/* Select D2 CLK source 00:D-PLL, 01: D2-PLL, 1x : 40Mhz
+	 * H: 2c[bit : 21], L: 08[bit : 8]
+	 */
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_CLK_VIDE0_SO_D2 ,
+		      AST_SCU_CLK_SEL);
+
+	/* Select D2-PLL parameter source [01] */
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_CRT_CLK_L_SOURCE ,
+		      AST_SCU_CLK_SEL);
+	ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) &
+		      ~SCU_MISC_CRT_CLK_H_SOURCE , AST_SCU_MISC1_CTRL);
+
+	/* Off D2-PLL */
 //	ast_scu_write(ast_scu_read(AST_SCU_D2_PLL_EXTEND) |  SCU_D2_PLL_OFF | SCU_D2_PLL_RESET , AST_SCU_D2_PLL_EXTEND);
 	ast_scu_write(0x585, AST_SCU_D2_PLL_EXTEND);
 
-	//set D2-PLL parameter
-	ast_scu_write((0x15 << 27) | (0xE << 22) | (0x03D << 13) | (0x40), AST_SCU_D2_PLL);
+	/* set D2-PLL parameter */
+	ast_scu_write((0x15 << 27) | (0xE << 22) | (0x03D << 13) | (0x40),
+		      AST_SCU_D2_PLL);
 
-	//enable D2-PLL
+	/* enable D2-PLL */
 //	ast_scu_write(ast_scu_read(AST_SCU_D2_PLL_EXTEND) &  ~(SCU_D2_PLL_OFF | SCU_D2_PLL_RESET) , AST_SCU_D2_PLL_EXTEND);
 	ast_scu_write(0x580, AST_SCU_D2_PLL_EXTEND);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_CRT, AST_SCU_RESET);
-
-	ast_scu_write(ast_scu_read(AST_SCU_RESET2) & ~(SCU_RESET_CRT0 | SCU_RESET_CRT1 | SCU_RESET_CRT2 | SCU_RESET_CRT3), AST_SCU_RESET2);
-
-#else
-	//ast2500 use 40Mhz (init @ platform.S)
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_CRT, AST_SCU_RESET);
-
-	ast_scu_write(ast_scu_read(AST_SCU_RESET2) & ~SCU_RESET_CRT0, AST_SCU_RESET2);
-#endif
-
-	//enable CRT CLK
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_D2CLK_STOP_EN , AST_SCU_CLK_STOP);
-
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_CRT,
+		      AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET2) & ~(SCU_RESET_CRT0 |
+		       SCU_RESET_CRT1 | SCU_RESET_CRT2 | SCU_RESET_CRT3),
+		      AST_SCU_RESET2);
+
+#else  /* ! CONFIG_ARCH_AST3200 */
+	/* ast2500 use 40Mhz (init @ platform.S) */
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_CRT,
+		      AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET2) & ~SCU_RESET_CRT0,
+		      AST_SCU_RESET2);
+#endif /* CONFIG_ARCH_AST3200 */
+
+	/* enable CRT CLK */
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_D2CLK_STOP_EN,
+		      AST_SCU_CLK_STOP);
 	ast_scu_write(0x1df, 0xd4);
 
-#else
-	//SOC VER < G5
+#else /* ! AST_SOC_G5 */
 	/* Enable D2 - PLL */
-	ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_D2_PLL_DIS, AST_SCU_MISC1_CTRL);
+	ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_D2_PLL_DIS,
+		      AST_SCU_MISC1_CTRL);
 
 	/* Reset CRT */
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_CRT, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_CRT,
+		      AST_SCU_RESET);
 
 	/* Set Delay 5 Compensation TODO ...*/
-	ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_VIDEO_DELAY_MASK) |
-						SCU_CLK_VIDEO_DELAY(5), AST_SCU_CLK_SEL);
+	ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) &
+		       ~SCU_CLK_VIDEO_DELAY_MASK) | SCU_CLK_VIDEO_DELAY(5),
+		      AST_SCU_CLK_SEL);
 
-	//enable D2 CLK
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_D2CLK_STOP_EN , AST_SCU_CLK_STOP);
+	/* enable D2 CLK */
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_D2CLK_STOP_EN ,
+		      AST_SCU_CLK_STOP);
 
 	udelay(10);
-	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_CRT, AST_SCU_RESET);
-
-#endif
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_CRT,
+		      AST_SCU_RESET);
 
+#endif /* AST_SOC_G5 */
 
 }
 #endif
 
-extern void
-ast_scu_uartx_init(void)
+void ast_scu_uartx_init(void)
 {
 	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP2) &
-				~(SCU_UART_DIV13 | SCU_UARTXCLK_STOP),
-		AST_SCU_CLK_STOP2);
+		      ~(SCU_UART_DIV13 | SCU_UARTXCLK_STOP),
+		      AST_SCU_CLK_STOP2);
 
 }
 
 
-//***********************************CLK control***********************************
-extern void
-ast_scu_uart_div(void)
+/**********************************CLK control*********************************/
+void ast_scu_uart_div(void)
 {
-	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP2) &
-				~SCU_UART_DIV13,
-		AST_SCU_CLK_STOP2);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP2) & ~SCU_UART_DIV13,
+		      AST_SCU_CLK_STOP2);
 }
 
-
-extern void
-ast_scu_clk_stop(u32 clk_name,u8 stop_enable)
+void ast_scu_clk_stop(u32 clk_name,u8 stop_enable)
 {
-	switch(clk_name){
-		default:
-			SCUMSG("ERRO clk_name :%d \n",clk_name);
-			break;
+	switch (clk_name){
+	default:
+		printf("ERRO clk_name :%d \n",clk_name);
+		break;
 	}
 }
 
-
-//***********************************CLK Information***********************************
-#ifdef CONFIG_ARCH_AST1010
-extern u32
-ast_get_clk_source(void)
+/**********************************CLK Information*****************************/
+u32 ast_get_clk_source(void)
 {
-	return AST_PLL_CLOCK;
-}
-#else
-extern u32
-ast_get_clk_source(void)
-{
-	if(ast_scu_read(AST_SCU_HW_STRAP1) & CLK_25M_IN)
+	if (ast_scu_read(AST_SCU_HW_STRAP1) & CLK_25M_IN)
 		return AST_PLL_25MHZ;
 	else
 		return AST_PLL_24MHZ;
 }
-#endif
 
 #if defined(AST_SOC_G5)
-extern u32
-ast_get_h_pll_clk(void)
+u32 ast_get_h_pll_clk(void)
 {
-	u32 clk=0;
+	u32 clk = 0;
 	u32 h_pll_set = ast_scu_read(AST_SCU_H_PLL);
 
-	if(h_pll_set & SCU_H_PLL_OFF)
+	if (h_pll_set & SCU_H_PLL_OFF)
 		return 0;
 
-	// Programming
+	/* Programming */
 	clk = ast_get_clk_source();
-	if(h_pll_set & SCU_H_PLL_BYPASS_EN) {
+	if (h_pll_set & SCU_H_PLL_BYPASS_EN) {
 		return clk;
 	} else {
-		//P = SCU24[18:13]
-		//M = SCU24[12:5]
-		//N = SCU24[4:0]
-		//hpll = 24MHz * [(M+1) /(N+1)] / (P+1)
-		clk = ((clk * (SCU_H_PLL_GET_MNUM(h_pll_set) + 1)) / (SCU_H_PLL_GET_NNUM(h_pll_set) + 1)) /(SCU_H_PLL_GET_PNUM(h_pll_set) + 1);
+		/* P = SCU24[18:13]
+		 * M = SCU24[12:5]
+		 * N = SCU24[4:0]
+		 * hpll = 24MHz * [(M+1) /(N+1)] / (P+1)
+		 */
+		clk = ((clk * (SCU_H_PLL_GET_MNUM(h_pll_set) + 1)) /
+		       (SCU_H_PLL_GET_NNUM(h_pll_set) + 1)) /
+			(SCU_H_PLL_GET_PNUM(h_pll_set) + 1);
 	}
-	SCUDBUG("h_pll = %d\n",clk);
+	debug("h_pll = %d\n",clk);
 	return clk;
 }
 
-
-extern u32
-ast_get_m_pll_clk(void)
+u32 ast_get_m_pll_clk(void)
 {
-	u32 clk=0;
+	u32 clk = 0;
 	u32 m_pll_set = ast_scu_read(AST_SCU_M_PLL);
 
-	if(m_pll_set & SCU_M_PLL_OFF)
+	if (m_pll_set & SCU_M_PLL_OFF)
 		return 0;
 
-	// Programming
+	/* Programming */
 	clk = ast_get_clk_source();
-	if(m_pll_set & SCU_M_PLL_BYPASS) {
+	if (m_pll_set & SCU_M_PLL_BYPASS) {
 		return clk;
 	} else {
-		//PD  == SCU20[13:18]
-		//M  == SCU20[5:12]
-		//N  == SCU20[0:4]
-		//mpll =  24MHz * [(M+1) /(N+1)] / (P+1)
-		clk = ((clk * (SCU_M_PLL_GET_MNUM(m_pll_set) + 1)) / (SCU_M_PLL_GET_NNUM(m_pll_set) + 1))/(SCU_M_PLL_GET_PDNUM(m_pll_set) + 1);
+		/* PD  == SCU20[13:18]
+		 * M  == SCU20[5:12]
+		 * N  == SCU20[0:4]
+		 * mpll =  24MHz * [(M+1) /(N+1)] / (P+1)
+		 */
+		clk = ((clk * (SCU_M_PLL_GET_MNUM(m_pll_set) + 1)) /
+		       (SCU_M_PLL_GET_NNUM(m_pll_set) + 1)) /
+			(SCU_M_PLL_GET_PDNUM(m_pll_set) + 1);
 	}
-	SCUDBUG("m_pll = %d\n",clk);
+	debug("m_pll = %d\n",clk);
 	return clk;
 }
 
-
-extern u32
-ast_get_ahbclk(void)
+u32 ast_get_ahbclk(void)
 {
 	unsigned int axi_div, ahb_div, hpll;
 
 	hpll = ast_get_h_pll_clk();
-	//AST2500 A1 fix
+	/* AST2500 A1 fix */
 	axi_div = 2;
-	ahb_div = (SCU_HW_STRAP_GET_AXI_AHB_RATIO(ast_scu_read(AST_SCU_HW_STRAP1)) + 1);
-
-	SCUDBUG("HPLL=%d, AXI_Div=%d, AHB_DIV = %d, AHB CLK=%d\n", hpll, axi_div, ahb_div, (hpll/axi_div)/ahb_div);
-	return ((hpll/axi_div)/ahb_div);
+	ahb_div = (SCU_HW_STRAP_GET_AXI_AHB_RATIO(
+			   ast_scu_read(AST_SCU_HW_STRAP1)) + 1);
 
+	debug("HPLL=%d, AXI_Div=%d, AHB_DIV = %d, AHB CLK=%d\n", hpll, axi_div,
+	      ahb_div, (hpll / axi_div) / ahb_div);
+	return ((hpll / axi_div) / ahb_div);
 }
 
-
-extern u32
-ast_get_d2_pll_clk(void)
+u32 ast_get_d2_pll_clk(void)
 {
-	u32 clk=0;
+	u32 clk = 0;
 	u32 d2_pll_set = ast_scu_read(AST_SCU_D2_PLL);
 	u32 d2_pll_conf = ast_scu_read(AST_SCU_D2_PLL_EXTEND);
 	u32 MNUM,NNUM,PNUM,ODNUM;
@@ -791,7 +759,7 @@ ast_get_d2_pll_clk(void)
 	if(d2_pll_conf & SCU_D2_PLL_OFF)
 		return 0;
 
-	// Programming
+	/* Programming */
 	clk = ast_get_clk_source();
 	if(d2_pll_conf & SCU_D2_PLL_BYPASS) {
 		return clk;
@@ -804,45 +772,40 @@ ast_get_d2_pll_clk(void)
 		PNUM += 1;
 		ODNUM = SCU_D2_PLL_GET_ODNUM(d2_pll_set);
 		ODNUM += 1;
-//		printf("clk %d ,num %d ,denum %d ,od %d ,pd %d ,pd2 %d \n",clk, NUM , DENUM, OD, PD, PD2);
-		//hpll = 24MHz * [(M + 1) /(N + 1)] / (P + 1) / (OD + 1)
+		/* hpll = 24MHz * [(M + 1) /(N + 1)] / (P + 1) / (OD + 1) */
 		clk = (clk * MNUM) / (NNUM) / PNUM / ODNUM;
 	}
 
-	SCUDBUG("d2_pll = %d\n",clk);
+	debug("d2_pll = %d\n",clk);
 	return clk;
 }
 
-
-extern void
-ast_set_d2_pll_clk(u32 pll_setting)
+void ast_set_d2_pll_clk(u32 pll_setting)
 {
-	//Off D2-PLL
+	/* Off D2-PLL */
 //	ast_scu_write(ast_scu_read(AST_SCU_D2_PLL_EXTEND) |  SCU_D2_PLL_OFF | SCU_D2_PLL_RESET , AST_SCU_D2_PLL_EXTEND);
 	ast_scu_write(0x585, AST_SCU_D2_PLL_EXTEND);
 
-	//set D2-PLL parameter
+	/* set D2-PLL parameter */
 	ast_scu_write(pll_setting, AST_SCU_D2_PLL);
 
-	//enable D2-PLL
+	/* enable D2-PLL */
 //	ast_scu_write(ast_scu_read(AST_SCU_D2_PLL_EXTEND) &  ~(SCU_D2_PLL_OFF | SCU_D2_PLL_RESET) , AST_SCU_D2_PLL_EXTEND);
 	ast_scu_write(0x580, AST_SCU_D2_PLL_EXTEND);
 
 }
 
-
-extern u32
-ast_get_d_pll_clk(void)
+u32 ast_get_d_pll_clk(void)
 {
-	u32 clk=0;
+	u32 clk = 0;
 	u32 d_pll_set = ast_scu_read(AST_SCU_D_PLL);
 	u32 d_pll_conf = ast_scu_read(AST_SCU_D_PLL_EXTEND0);
-	u32 MNUM,NNUM,PNUM,ODNUM;
+	u32 MNUM, NNUM, PNUM, ODNUM;
 
 	if(d_pll_conf & SCU_D_PLL_OFF)
 		return 0;
 
-	// Programming
+	/* Programming */
 	clk = ast_get_clk_source();
 	if(d_pll_conf & SCU_D_PLL_BYPASS) {
 		return clk;
@@ -855,110 +818,76 @@ ast_get_d_pll_clk(void)
 		PNUM += 1;
 		ODNUM = SCU_D_PLL_GET_ODNUM(d_pll_set);
 		ODNUM += 1;
-//		printf("clk %d ,num %d ,denum %d ,od %d ,pd %d ,pd2 %d \n",clk, NUM , DENUM, OD, PD, PD2);
-		//hpll = 24MHz * [(M + 1) /(N + 1)] / (P + 1) / (OD + 1)
+		/* hpll = 24MHz * [(M + 1) /(N + 1)] / (P + 1) / (OD + 1) */
 		clk = (clk * MNUM) / (NNUM) / PNUM / ODNUM;
 	}
 
-	SCUDBUG("d_pll = %d\n",clk);
-	return clk;
-}
-
-
-#elif defined(CONFIG_ARCH_AST1010)
-extern u32
-ast_get_h_pll_clk(void)
-{
-	u32 speed,clk=0;
-	u32 OD, NUM, DENUM;
-	u32 h_pll_set = ast_scu_read(AST_SCU_H_PLL);
-
-	clk = AST_PLL_CLOCK;
-	OD = (1 << (SCU_H_PLL_GET_DIV(h_pll_set)));
-	NUM = SCU_H_PLL_GET_NUM(h_pll_set);
-	DENUM = SCU_H_PLL_GET_DENUM(h_pll_set);
-	//hpll = 24MHz * (Numerator+1) / ((OD) * (Denumerator+1))
-	clk = clk * (NUM + 1) / OD / (DENUM + 1);
-
-//	printf("h_pll = %d\n",clk);
+	debug("d_pll = %d\n",clk);
 	return clk;
 }
 
-extern u32
-ast_get_ahbclk(void)
-{
-	return ast_get_h_pll_clk();
-}
 
+#else /* ! AST_SOC_G5 */
 
-extern u32
-ast_get_ahb_div(void)
+u32 ast_get_h_pll_clk(void)
 {
-	u32 div = ast_scu_read(AST_SCU_CLK_SEL);
-	div = SCU_GET_AHB_DIV(div);
-	div = (div + 1) * 2;
-	return div;
-}
-
-#else
-extern u32
-ast_get_h_pll_clk(void)
-{
-	u32 speed,clk=0;
+	u32 speed,clk = 0;
 	u32 h_pll_set = ast_scu_read(AST_SCU_H_PLL);
 
-	if(h_pll_set & SCU_H_PLL_OFF)
+	if (h_pll_set & SCU_H_PLL_OFF)
 		return 0;
 
-	if(h_pll_set & SCU_H_PLL_PARAMETER) {
-		// Programming
+	if (h_pll_set & SCU_H_PLL_PARAMETER) {
+		/* Programming */
 		clk = ast_get_clk_source();
-		if(h_pll_set & SCU_H_PLL_BYPASS_EN) {
+		if (h_pll_set & SCU_H_PLL_BYPASS_EN) {
 			return clk;
 		} else {
-			//OD == SCU24[4]
-			//OD = SCU_H_PLL_GET_DIV(h_pll_set);
-			//Numerator == SCU24[10:5]
-			//num = SCU_H_PLL_GET_NUM(h_pll_set);
-			//Denumerator == SCU24[3:0]
-			//denum = SCU_H_PLL_GET_DENUM(h_pll_set);
-
-			//hpll = 24MHz * (2-OD) * ((Numerator+2)/(Denumerator+1))
-			clk = ((clk * (2-SCU_H_PLL_GET_DIV(h_pll_set)) * (SCU_H_PLL_GET_NUM(h_pll_set)+2))/(SCU_H_PLL_GET_DENUM(h_pll_set)+1));
+		/* OD == SCU24[4]
+		 * OD = SCU_H_PLL_GET_DIV(h_pll_set);
+		 * Numerator == SCU24[10:5]
+		 * num = SCU_H_PLL_GET_NUM(h_pll_set);
+		 * Denumerator == SCU24[3:0]
+		 * denum = SCU_H_PLL_GET_DENUM(h_pll_set);
+		 * hpll = 24MHz * (2-OD) * ((Numerator+2)/(Denumerator+1))
+		 */
+			clk = ((clk * (2-SCU_H_PLL_GET_DIV(h_pll_set)) *
+				(SCU_H_PLL_GET_NUM(h_pll_set)+2)) /
+			       (SCU_H_PLL_GET_DENUM(h_pll_set)+1));
 		}
 	} else {
-		// HW Trap
-		speed = SCU_HW_STRAP_GET_H_PLL_CLK(ast_scu_read(AST_SCU_HW_STRAP1));
+		/* HW Trap */
+		speed = SCU_HW_STRAP_GET_H_PLL_CLK(
+			ast_scu_read(AST_SCU_HW_STRAP1));
 		switch (speed) {
-			case 0:
-				clk = 384000000;
-				break;
-			case 1:
-				clk = 360000000;
-				break;
-			case 2:
-				clk = 336000000;
-				break;
-			case 3:
-				clk = 408000000;
-				break;
-			default:
-				BUG();
-				break;
+		case 0:
+			clk = 384000000;
+			break;
+		case 1:
+			clk = 360000000;
+			break;
+		case 2:
+			clk = 336000000;
+			break;
+		case 3:
+			clk = 408000000;
+			break;
+		default:
+			BUG();
+			break;
 		}
 	}
-	SCUDBUG("h_pll = %d\n",clk);
+	debug("h_pll = %d\n",clk);
 	return clk;
 }
 
 
-extern u32
-ast_get_m_pll_clk(void)
+u32 ast_get_m_pll_clk(void)
 {
-	u32 clk=0;
+	u32 clk = 0;
 	u32 m_pll_set = ast_scu_read(AST_SCU_M_PLL);
 
-	if(m_pll_set & SCU_M_PLL_OFF)
+	if (m_pll_set & SCU_M_PLL_OFF)
 		return 0;
 
 	// Programming
@@ -966,23 +895,25 @@ ast_get_m_pll_clk(void)
 	if(m_pll_set & SCU_M_PLL_BYPASS) {
 		return clk;
 	} else {
-		//OD == SCU24[4]
-		//OD = SCU_M_PLL_GET_DIV(h_pll_set);
-		//Numerator == SCU24[10:5]
-		//num = SCU_M_PLL_GET_NUM(h_pll_set);
-		//Denumerator == SCU24[3:0]
-		//denum = SCU_M_PLL_GET_DENUM(h_pll_set);
-
-		//hpll = 24MHz * (2-OD) * ((Numerator+2)/(Denumerator+1))
-		clk = (clk * (2-SCU_M_PLL_GET_DIV(m_pll_set)) * ((SCU_M_PLL_GET_NUM(m_pll_set)+2)/(SCU_M_PLL_GET_DENUM(m_pll_set)+1)));
+		/* OD == SCU24[4]
+		 * OD = SCU_M_PLL_GET_DIV(h_pll_set);
+		 * Numerator == SCU24[10:5]
+		 * num = SCU_M_PLL_GET_NUM(h_pll_set);
+		 * Denumerator == SCU24[3:0]
+		 * denum = SCU_M_PLL_GET_DENUM(h_pll_set);
+		 *
+		 * hpll = 24MHz * (2-OD) * ((Numerator+2)/(Denumerator+1))
+		 */
+		clk = (clk * (2-SCU_M_PLL_GET_DIV(m_pll_set)) *
+		       ((SCU_M_PLL_GET_NUM(m_pll_set)+2) /
+			(SCU_M_PLL_GET_DENUM(m_pll_set)+1)));
 	}
-	SCUDBUG("m_pll = %d\n",clk);
+	debug("m_pll = %d\n",clk);
 	return clk;
 }
 
 
-extern u32
-ast_get_ahbclk(void)
+u32 ast_get_ahbclk(void)
 {
 	unsigned int div, hpll;
 
@@ -990,24 +921,23 @@ ast_get_ahbclk(void)
 	div = SCU_HW_STRAP_GET_CPU_AHB_RATIO(ast_scu_read(AST_SCU_HW_STRAP1));
 	div += 1;
 
-	SCUDBUG("HPLL=%d, Div=%d, AHB CLK=%d\n", hpll, div, hpll/div);
+	debug("HPLL=%d, Div=%d, AHB CLK=%d\n", hpll, div, hpll/div);
 	return (hpll/div);
 }
 
 
-extern u32
-ast_get_d2_pll_clk(void)
+u32 ast_get_d2_pll_clk(void)
 {
-	u32 clk=0;
+	u32 clk = 0;
 	u32 d2_pll_set = ast_scu_read(AST_SCU_D2_PLL);
-	u32 OD,NUM,DENUM,PD,PD2;
+	u32 OD, NUM, DENUM, PD, PD2;
 
 	if(d2_pll_set & SCU_D2_PLL_OFF)
 		return 0;
 
-	// Programming
+	/*  Programming */
 	clk = ast_get_clk_source();
-	if(d2_pll_set & SCU_D2_PLL_BYPASS) {
+	if (d2_pll_set & SCU_D2_PLL_BYPASS) {
 		return clk;
 	} else {
 		NUM = SCU_D2_PLL_GET_NUM(d2_pll_set);
@@ -1018,20 +948,22 @@ ast_get_d2_pll_clk(void)
 		PD += 1;
 		PD2 = SCU_D2_PLL_GET_PD2(d2_pll_set);
 		PD2 += 1;
-//		printf("clk %d ,num %d ,denum %d ,od %d ,pd %d ,pd2 %d \n",clk, NUM , DENUM, OD, PD, PD2);
-		//hpll = 24MHz * (Numerator * 2) / (Denumerator * OD * PD * PD2)
+		debug("clk %d ,num %d ,denum %d ,od %d ,pd %d ,pd2 %d \n",
+		      clk, NUM , DENUM, OD, PD, PD2);
+		/* hpll = 24MHz * (Numerator * 2) /
+		 *          (Denumerator * OD * PD * PD2)
+		 */
 		clk = (clk * NUM * 2) / (DENUM* OD * PD * PD2);
 	}
 
-	SCUDBUG("d2_pll = %d\n",clk);
+	debug("d2_pll = %d\n",clk);
 	return clk;
 }
 
 
-#endif
+#endif /* AST_SOC_G5 */
 
-extern u32
-ast_get_pclk(void)
+u32 ast_get_pclk(void)
 {
 	unsigned int div, hpll;
 
@@ -1043,14 +975,12 @@ ast_get_pclk(void)
 	div = (div+1) << 1;
 #endif
 
-	SCUDBUG("HPLL=%d, Div=%d, PCLK=%d\n", hpll, div, hpll/div);
+	debug("HPLL=%d, Div=%d, PCLK=%d\n", hpll, div, hpll/div);
 	return (hpll/div);
 
 }
 
-
-extern u32
-ast_get_lhclk(void)
+u32 ast_get_lhclk(void)
 {
 	unsigned int div, hpll;
 	u32 clk_sel = ast_scu_read(AST_SCU_CLK_SEL);
@@ -1064,48 +994,50 @@ ast_get_lhclk(void)
 #else
 		div = (div+1) << 1;
 #endif
-		SCUDBUG("HPLL=%d, Div=%d, LHCLK = %d\n", hpll, div, hpll/div);
+		debug("HPLL=%d, Div=%d, LHCLK = %d\n", hpll, div, hpll/div);
 		return (hpll/div);
 	} else {
-		SCUMSG("LPC CLK not enable \n");
+		printf("LPC CLK not enable \n");
 		return 0;
 	}
 
 }
 
 
-//Because value 0 is not allowed in SDIO12C D[15:8]: Host Control Settings #1 Register, we have to increase the maximum
-//host's clock in case that system will not ask host to set 1 in the sdhci_set_clock() function
-/*
-SCU7C: Silicon Revision ID Register
-D[31:24]: Chip ID
-0: AST2050/AST2100/AST2150/AST2200/AST3000
-1: AST2300
-
-D[23:16] Silicon revision ID for AST2300 generation and later
-0: A0
-1: A1
-2: A2
-.
-.
-.
-FPGA revision starts from 0x80
-
-
-D[11:8] Bounding option
-
-D[7:0] Silicon revision ID for AST2050/AST2100 generation (for software compatible)
-0: A0
-1: A1
-2: A2
-3: A3
-.
-.
-FPGA revision starts from 0x08, 8~10 means A0, 11+ means A1, AST2300 should be assigned to 3
-*/
-
-extern u32
-ast_get_sd_clock_src(void)
+/* Because value 0 is not allowed in SDIO12C D[15:8]: Host Control
+ * Settings #1 Register, we have to increase the maximum host's clock
+ * in case that system will not ask host to set 1 in the
+ * sdhci_set_clock() function
+ *
+ * SCU7C: Silicon Revision ID Register
+ * D[31:24]: Chip ID
+ * 0: AST2050/AST2100/AST2150/AST2200/AST3000
+ * 1: AST2300
+ *
+ * D[23:16] Silicon revision ID for AST2300 generation and later
+ * 0: A0
+ * 1: A1
+ * 2: A2
+ * .
+ * .
+ * .
+ * FPGA revision starts from 0x80
+ *
+ *
+ * D[11:8] Bounding option
+ *
+ * D[7:0] Silicon revision ID for AST2050/AST2100 generation (for
+ * software compatible)
+ * 0: A0
+ * 1: A1
+ * 2: A2
+ * 3: A3
+ * .
+ * .
+ * FPGA revision starts from 0x08, 8~10 means A0, 11+ means A1,
+ * AST2300 should be assigned to 3
+ */
+u32 ast_get_sd_clock_src(void)
 {
 	u32 clk=0, sd_div;
 
@@ -1117,15 +1049,14 @@ ast_get_sd_clock_src(void)
 #else
 		sd_div = (sd_div+1) << 1;
 #endif
-		SCUDBUG("div %d, sdclk =%d \n",sd_div,clk/sd_div);
+		debug("div %d, sdclk =%d \n",sd_div,clk/sd_div);
 		clk /= sd_div;
 
 	return clk;
 }
 
 
-extern void
-ast_scu_show_system_info (void)
+void ast_scu_show_system_info (void)
 {
 
 #ifdef AST_SOC_G5
@@ -1133,11 +1064,12 @@ ast_scu_show_system_info (void)
 
 	h_pll = ast_get_h_pll_clk();
 
-	//AST2500 A1 fix
+	/* AST2500 A1 fix */
 	axi_div = 2;
-	ahb_div = (SCU_HW_STRAP_GET_AXI_AHB_RATIO(ast_scu_read(AST_SCU_HW_STRAP1)) + 1);
+	ahb_div = (SCU_HW_STRAP_GET_AXI_AHB_RATIO(
+			   ast_scu_read(AST_SCU_HW_STRAP1)) + 1);
 
-	SCUMSG("CPU = %d MHz , AXI = %d MHz, AHB = %d MHz (%d:%d:1) \n",
+	printf("CPU = %d MHz , AXI = %d MHz, AHB = %d MHz (%d:%d:1) \n",
 			h_pll/1000000,
 			h_pll/axi_div/1000000,
 			h_pll/axi_div/ahb_div/1000000, axi_div, ahb_div);
@@ -1149,381 +1081,345 @@ ast_scu_show_system_info (void)
 
 	div = SCU_HW_STRAP_GET_CPU_AHB_RATIO(ast_scu_read(AST_SCU_HW_STRAP1));
 	div += 1;
-	SCUMSG("CPU = %d MHz ,AHB = %d MHz (%d:1) \n", h_pll/1000000, h_pll/div/1000000,div);
+
+	printf("CPU = %d MHz ,AHB = %d MHz (%d:1) \n", h_pll/1000000,
+	       h_pll/div / 1000000, div);
 #endif
 	return ;
 }
 
 
-//*********************************** Multi-function pin control ***********************************
-extern void
-ast_scu_multi_func_uart(u8 uart)
+/*********************** Multi-function pin control ***************************/
+void ast_scu_multi_func_uart(u8 uart)
 {
 	switch(uart) {
-		case 1:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
-						SCU_FUN_PIN_UART1_RXD |
-						SCU_FUN_PIN_UART1_TXD |
-						SCU_FUN_PIN_UART1_NRTS |
-						SCU_FUN_PIN_UART1_NDTR |
-						SCU_FUN_PIN_UART1_NRI |
-						SCU_FUN_PIN_UART1_NDSR |
-						SCU_FUN_PIN_UART1_NDCD |
-						SCU_FUN_PIN_UART1_NCTS,
-				AST_SCU_FUN_PIN_CTRL2);
-			break;
-		case 2:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
-						SCU_FUN_PIN_UART2_RXD |
-						SCU_FUN_PIN_UART2_TXD |
-						SCU_FUN_PIN_UART2_NRTS |
-						SCU_FUN_PIN_UART2_NDTR |
-						SCU_FUN_PIN_UART2_NRI |
-						SCU_FUN_PIN_UART2_NDSR |
-						SCU_FUN_PIN_UART2_NDCD |
-						SCU_FUN_PIN_UART2_NCTS,
-				AST_SCU_FUN_PIN_CTRL2);
-			break;
-		case 3:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
-						SCU_FUN_PIN_UART3_RXD |
-						SCU_FUN_PIN_UART3_TXD |
-						SCU_FUN_PIN_UART3_NRTS |
-						SCU_FUN_PIN_UART3_NDTR |
-						SCU_FUN_PIN_UART3_NRI |
-						SCU_FUN_PIN_UART3_NDSR |
-						SCU_FUN_PIN_UART3_NDCD |
-						SCU_FUN_PIN_UART3_NCTS,
-				AST_SCU_FUN_PIN_CTRL1);
-			break;
-		case 4:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
-						SCU_FUN_PIN_UART4_RXD |
-						SCU_FUN_PIN_UART4_TXD |
-						SCU_FUN_PIN_UART4_NRTS |
-						SCU_FUN_PIN_UART4_NDTR |
-						SCU_FUN_PIN_UART4_NRI |
-						SCU_FUN_PIN_UART4_NDSR |
-						SCU_FUN_PIN_UART4_NDCD |
-						SCU_FUN_PIN_UART4_NCTS,
-				AST_SCU_FUN_PIN_CTRL1);
-			break;
-		case 6:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
-						SCU_FUC_PIN_UART6,
-				AST_SCU_FUN_PIN_CTRL5);
-			break;
+	case 1:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
+			      SCU_FUN_PIN_UART1_RXD |
+			      SCU_FUN_PIN_UART1_TXD |
+			      SCU_FUN_PIN_UART1_NRTS |
+			      SCU_FUN_PIN_UART1_NDTR |
+			      SCU_FUN_PIN_UART1_NRI |
+			      SCU_FUN_PIN_UART1_NDSR |
+			      SCU_FUN_PIN_UART1_NDCD |
+			      SCU_FUN_PIN_UART1_NCTS,
+			      AST_SCU_FUN_PIN_CTRL2);
+		break;
+	case 2:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
+			      SCU_FUN_PIN_UART2_RXD |
+			      SCU_FUN_PIN_UART2_TXD |
+			      SCU_FUN_PIN_UART2_NRTS |
+			      SCU_FUN_PIN_UART2_NDTR |
+			      SCU_FUN_PIN_UART2_NRI |
+			      SCU_FUN_PIN_UART2_NDSR |
+			      SCU_FUN_PIN_UART2_NDCD |
+			      SCU_FUN_PIN_UART2_NCTS,
+			      AST_SCU_FUN_PIN_CTRL2);
+		break;
+	case 3:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+			      SCU_FUN_PIN_UART3_RXD |
+			      SCU_FUN_PIN_UART3_TXD |
+			      SCU_FUN_PIN_UART3_NRTS |
+			      SCU_FUN_PIN_UART3_NDTR |
+			      SCU_FUN_PIN_UART3_NRI |
+			      SCU_FUN_PIN_UART3_NDSR |
+			      SCU_FUN_PIN_UART3_NDCD |
+			      SCU_FUN_PIN_UART3_NCTS,
+			      AST_SCU_FUN_PIN_CTRL1);
+		break;
+	case 4:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+			      SCU_FUN_PIN_UART4_RXD |
+			      SCU_FUN_PIN_UART4_TXD |
+			      SCU_FUN_PIN_UART4_NRTS |
+			      SCU_FUN_PIN_UART4_NDTR |
+			      SCU_FUN_PIN_UART4_NRI |
+			      SCU_FUN_PIN_UART4_NDSR |
+			      SCU_FUN_PIN_UART4_NDCD |
+			      SCU_FUN_PIN_UART4_NCTS,
+			      AST_SCU_FUN_PIN_CTRL1);
+		break;
+	case 6:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			      SCU_FUC_PIN_UART6,
+			      AST_SCU_FUN_PIN_CTRL5);
+		break;
 #ifdef AST_SOC_G5
-		case 7:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
-						SCU_FUN_PIN_UART7,
-				AST_SCU_FUN_PIN_CTRL6);
-			break;
-		case 8:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
-						SCU_FUN_PIN_UART8,
-				AST_SCU_FUN_PIN_CTRL6);
-			break;
-		case 9:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
-						SCU_FUN_PIN_UART9,
-				AST_SCU_FUN_PIN_CTRL6);
-			break;
-		case 10:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) &
-						~(SCU_FUN_PIN_VGAVS | SCU_FUN_PIN_VGAHS),
-				AST_SCU_FUN_PIN_CTRL2);
-
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
-						SCU_FUN_PIN_UART10,
-				AST_SCU_FUN_PIN_CTRL6);
-			break;
-		case 11:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) &
-						~(SCU_FUN_PIN_DDCDAT | SCU_FUN_PIN_DDCCLK),
-				AST_SCU_FUN_PIN_CTRL2);
-
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
-						SCU_FUN_PIN_UART11,
-				AST_SCU_FUN_PIN_CTRL6);
-			break;
-		case 12:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
-						SCU_FUN_PIN_UART12,
-				AST_SCU_FUN_PIN_CTRL6);
-			break;
-		case 13:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
-						SCU_FUN_PIN_UART13,
-				AST_SCU_FUN_PIN_CTRL6);
-			break;
+	case 7:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+			      SCU_FUN_PIN_UART7,
+			      AST_SCU_FUN_PIN_CTRL6);
+		break;
+	case 8:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+			      SCU_FUN_PIN_UART8,
+			      AST_SCU_FUN_PIN_CTRL6);
+		break;
+	case 9:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+			      SCU_FUN_PIN_UART9,
+			      AST_SCU_FUN_PIN_CTRL6);
+		break;
+	case 10:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) &
+			      ~(SCU_FUN_PIN_VGAVS | SCU_FUN_PIN_VGAHS),
+			      AST_SCU_FUN_PIN_CTRL2);
+
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+			      SCU_FUN_PIN_UART10,
+			      AST_SCU_FUN_PIN_CTRL6);
+		break;
+	case 11:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) &
+			      ~(SCU_FUN_PIN_DDCDAT | SCU_FUN_PIN_DDCCLK),
+			      AST_SCU_FUN_PIN_CTRL2);
+
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+			      SCU_FUN_PIN_UART11,
+			      AST_SCU_FUN_PIN_CTRL6);
+		break;
+	case 12:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+			      SCU_FUN_PIN_UART12,
+			      AST_SCU_FUN_PIN_CTRL6);
+		break;
+	case 13:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+			      SCU_FUN_PIN_UART13,
+			      AST_SCU_FUN_PIN_CTRL6);
+		break;
 #endif
 	}
 
 
 }
 
-extern void
-ast_scu_multi_func_video()
+void ast_scu_multi_func_video()
 {
-#if defined(CONFIG_ARCH_2100) || defined(CONFIG_ARCH_2200)
-	ast_scu_write(ast_scu_read(AST_SCU_MULTI_FUNC_2) |
-				MULTI_FUNC_VIDEO_RGB18 |
-				MULTI_FUNC_VIDEO_SINGLE_EDGE,
-		AST_SCU_MULTI_FUNC_2);
-#elif defined(CONFIG_ARCH_1100) || defined(CONFIG_ARCH_2050)
-	ast_scu_write(ast_scu_read(AST_SCU_MULTI_FUNC_2) |
-				MULTI_FUNC_VIDEO_RGB18 |
-				MULTI_FUNC_VIDEO_SINGLE_EDGE,
-		AST_SCU_MULTI_FUNC_2);
-#else
 
-#endif
 }
 
-#ifdef CONFIG_ARCH_AST1010
-extern void
-ast_scu_multi_func_eth(u8 num)
+void ast_scu_multi_func_eth(u8 num)
 {
 	switch(num) {
-		case 0:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
-						SCU_FUN_PIN_MAC0_MDIO |
-						SCU_FUN_PIN_MAC0_MDC |
-						0xff000000,
-				AST_SCU_FUN_PIN_CTRL3);
-
-			/* Currently we use fix value in MAC timing on EVB */
-			ast_scu_write(0x2255, AST_SCU_MAC_CLK);
-
-			break;
-		case 1:
+	case 0:
+		if(ast_scu_read(AST_SCU_HW_STRAP1) & SCU_HW_STRAP_MAC0_RGMII) {
+			printf("MAC0 : RGMII \n");
 			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
-						SCU_FUN_PIN_MAC1_PHY_LINK,
-				AST_SCU_FUN_PIN_CTRL1);
-
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
-						SCU_FUC_PIN_MAC1_MDIO,
-				AST_SCU_FUN_PIN_CTRL5);
-
-			break;
-	}
-}
-#else
-extern void
-ast_scu_multi_func_eth(u8 num)
-{
-	switch(num) {
-		case 0:
-			if(ast_scu_read(AST_SCU_HW_STRAP1) & SCU_HW_STRAP_MAC0_RGMII) {
-				SCUMSG("MAC0 : RGMII \n");
-				ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
-							SCU_FUN_PIN_MAC0_PHY_LINK,
-					AST_SCU_FUN_PIN_CTRL1);
-			} else {
-				SCUMSG("MAC0 : RMII/NCSI \n");
-				ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) &
-							~SCU_FUN_PIN_MAC0_PHY_LINK,
-					AST_SCU_FUN_PIN_CTRL1);
-			}
+				      SCU_FUN_PIN_MAC0_PHY_LINK,
+				      AST_SCU_FUN_PIN_CTRL1);
+		} else {
+			printf("MAC0 : RMII/NCSI \n");
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) &
+				      ~SCU_FUN_PIN_MAC0_PHY_LINK,
+				      AST_SCU_FUN_PIN_CTRL1);
+		}
 
 #ifdef AST_SOC_G5
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
-						SCU_FUN_PIN_MAC0_PHY_LINK,
-				AST_SCU_FUN_PIN_CTRL1);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+			      SCU_FUN_PIN_MAC0_PHY_LINK,
+			      AST_SCU_FUN_PIN_CTRL1);
 
 #endif
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
-						SCU_FUN_PIN_MAC0_MDIO |
-						SCU_FUN_PIN_MAC0_MDC,
-				AST_SCU_FUN_PIN_CTRL3);
-
-			break;
-		case 1:
-			if(ast_scu_read(AST_SCU_HW_STRAP1) & SCU_HW_STRAP_MAC1_RGMII) {
-				SCUMSG("MAC1 : RGMII \n");
-				ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
-							SCU_FUN_PIN_MAC1_PHY_LINK,
-					AST_SCU_FUN_PIN_CTRL1);
-			} else {
-				SCUMSG("MAC1 : RMII/NCSI \n");
-				ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) &
-						~SCU_FUN_PIN_MAC1_PHY_LINK,
-					AST_SCU_FUN_PIN_CTRL1);
-			}
-
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
+			      SCU_FUN_PIN_MAC0_MDIO |
+			      SCU_FUN_PIN_MAC0_MDC,
+			      AST_SCU_FUN_PIN_CTRL3);
+
+		break;
+	case 1:
+		if(ast_scu_read(AST_SCU_HW_STRAP1) & SCU_HW_STRAP_MAC1_RGMII) {
+			printf("MAC1 : RGMII \n");
 			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
-						SCU_FUN_PIN_MAC1_PHY_LINK,
-				AST_SCU_FUN_PIN_CTRL1);
+				      SCU_FUN_PIN_MAC1_PHY_LINK,
+				      AST_SCU_FUN_PIN_CTRL1);
+		} else {
+			printf("MAC1 : RMII/NCSI \n");
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) &
+				      ~SCU_FUN_PIN_MAC1_PHY_LINK,
+				      AST_SCU_FUN_PIN_CTRL1);
+		}
 
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
-						SCU_FUC_PIN_MAC1_MDIO,
-				AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+			      SCU_FUN_PIN_MAC1_PHY_LINK,
+			      AST_SCU_FUN_PIN_CTRL1);
 
-			break;
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			      SCU_FUC_PIN_MAC1_MDIO,
+			      AST_SCU_FUN_PIN_CTRL5);
+
+		break;
 	}
 }
-#endif
 
-extern void
-ast_scu_multi_func_nand(void)
+void ast_scu_multi_func_nand(void)
 {
-#ifdef AST_SOC_G5
-#else
-	//enable NAND flash multipin FLBUSY and FLWP
+#ifndef AST_SOC_G5
+	/* enable NAND flash multipin FLBUSY and FLWP */
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
-				SCU_FUN_PIN_NAND_FLBUSY | SCU_FUN_PIN_NAND_FLWP,
-		AST_SCU_FUN_PIN_CTRL2);
+		      SCU_FUN_PIN_NAND_FLBUSY | SCU_FUN_PIN_NAND_FLWP,
+		      AST_SCU_FUN_PIN_CTRL2);
 #endif
 
 }
 
 #if 0
-extern void
-ast_scu_multi_func_nor(void)
+void ast_scu_multi_func_nor(void)
 {
-	//Address
-	//ROMA2~17
+	/* Address */
+
+	/* ROMA2~17 */
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL8) |
-				SCU_FUN_PIN_ROMA2 | SCU_FUN_PIN_ROMA3 |
-				SCU_FUN_PIN_ROMA4 | SCU_FUN_PIN_ROMA5 |
-				SCU_FUN_PIN_ROMA6 | SCU_FUN_PIN_ROMA7 |
-				SCU_FUN_PIN_ROMA8 | SCU_FUN_PIN_ROMA9 |
-				SCU_FUN_PIN_ROMA10 | SCU_FUN_PIN_ROMA11 |
-				SCU_FUN_PIN_ROMA12 | SCU_FUN_PIN_ROMA13 |
-				SCU_FUN_PIN_ROMA14 | SCU_FUN_PIN_ROMA15 |
-				SCU_FUN_PIN_ROMA16 | SCU_FUN_PIN_ROMA17,
-		AST_SCU_FUN_PIN_CTRL8);
-
-	//ROMA18~21
+		      SCU_FUN_PIN_ROMA2 | SCU_FUN_PIN_ROMA3 |
+		      SCU_FUN_PIN_ROMA4 | SCU_FUN_PIN_ROMA5 |
+		      SCU_FUN_PIN_ROMA6 | SCU_FUN_PIN_ROMA7 |
+		      SCU_FUN_PIN_ROMA8 | SCU_FUN_PIN_ROMA9 |
+		      SCU_FUN_PIN_ROMA10 | SCU_FUN_PIN_ROMA11 |
+		      SCU_FUN_PIN_ROMA12 | SCU_FUN_PIN_ROMA13 |
+		      SCU_FUN_PIN_ROMA14 | SCU_FUN_PIN_ROMA15 |
+		      SCU_FUN_PIN_ROMA16 | SCU_FUN_PIN_ROMA17,
+		      AST_SCU_FUN_PIN_CTRL8);
+
+	/* ROMA18~21 */
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL9) |
-				SCU_FUN_PIN_ROMA18 | SCU_FUN_PIN_ROMA19 |
-				SCU_FUN_PIN_ROMA20 | SCU_FUN_PIN_ROMA21,
-		AST_SCU_FUN_PIN_CTRL9);
+		      SCU_FUN_PIN_ROMA18 | SCU_FUN_PIN_ROMA19 |
+		      SCU_FUN_PIN_ROMA20 | SCU_FUN_PIN_ROMA21,
+		      AST_SCU_FUN_PIN_CTRL9);
 
-	//ROMA22,23
-	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL4) | SCU_FUN_PIN_ROMA22 | SCU_FUN_PIN_ROMA23,
-		AST_SCU_FUN_PIN_CTRL4);
+	/* ROMA22,23 */
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL4) |
+		      SCU_FUN_PIN_ROMA22 | SCU_FUN_PIN_ROMA23,
+		      AST_SCU_FUN_PIN_CTRL4);
 
-	//ROMA24,25
-	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) | SCU_FUN_PIN_ROMA24 | SCU_FUN_PIN_ROMA25,
-		AST_SCU_FUN_PIN_CTRL3);
+	/* ROMA24,25 */
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
+		      SCU_FUN_PIN_ROMA24 | SCU_FUN_PIN_ROMA25,
+		      AST_SCU_FUN_PIN_CTRL3);
 
-	//SCU94 [1] = 0
+	/* SCU94 [1] = 0 */
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) & SCU_VIDEO_OUT_MASK,
-		AST_SCU_FUN_PIN_CTRL6);
+		      AST_SCU_FUN_PIN_CTRL6);
+
 
+	/* data */
 
-	//data
-	//ROMD 4~7 //ROMWE#, OE#
+	/* ROMD 4~7 //ROMWE#, OE# */
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL4) |
-			SCU_FUN_PIN_ROMOE | SCU_FUN_PIN_ROMWE |
-			SCU_FUN_PIN_ROMD4 | SCU_FUN_PIN_ROMD5 |
-			SCU_FUN_PIN_ROMD6 | SCU_FUN_PIN_ROMD7,
-			AST_SCU_FUN_PIN_CTRL4);
+		      SCU_FUN_PIN_ROMOE | SCU_FUN_PIN_ROMWE |
+		      SCU_FUN_PIN_ROMD4 | SCU_FUN_PIN_ROMD5 |
+		      SCU_FUN_PIN_ROMD6 | SCU_FUN_PIN_ROMD7,
+		      AST_SCU_FUN_PIN_CTRL4);
 
-	//ROMD 8~15
+	/* ROMD 8~15 */
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
-			SCU_FUC_PIN_ROM_16BIT,
-		AST_SCU_FUN_PIN_CTRL5);
+		      SCU_FUC_PIN_ROM_16BIT,
+		      AST_SCU_FUN_PIN_CTRL5);
 
 }
 #endif
 
-extern void
-ast_scu_multi_func_romcs(u8 num)
+void ast_scu_multi_func_romcs(u8 num)
 {
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
-			SCU_FUN_PIN_ROMCS(num),
-		AST_SCU_FUN_PIN_CTRL3);
+		      SCU_FUN_PIN_ROMCS(num),
+		      AST_SCU_FUN_PIN_CTRL3);
 }
 
-extern void
-ast_scu_multi_func_i2c(void)
+void ast_scu_multi_func_i2c(void)
 {
-	//TODO check ... //In AST2400 Due to share pin with SD , please not enable I2C 10 ~14
-	// AST 2400 have 14 , AST 2300 9 ...
+	/* TODO : In AST2400 Due to share pin with SD , please not
+	 * enable I2C 10 ~14 AST 2400 have 14 , AST 2300 9 ...
+	 */
 #ifdef CONFIG_MMC_AST
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
-			SCU_FUC_PIN_I2C3 |
-			SCU_FUC_PIN_I2C4 |
-			SCU_FUC_PIN_I2C5 |
-			SCU_FUC_PIN_I2C6 |
-			SCU_FUC_PIN_I2C7 |
-			SCU_FUC_PIN_I2C8 |
-			SCU_FUC_PIN_I2C9,
-		AST_SCU_FUN_PIN_CTRL5);
+		      SCU_FUC_PIN_I2C3 |
+		      SCU_FUC_PIN_I2C4 |
+		      SCU_FUC_PIN_I2C5 |
+		      SCU_FUC_PIN_I2C6 |
+		      SCU_FUC_PIN_I2C7 |
+		      SCU_FUC_PIN_I2C8 |
+		      SCU_FUC_PIN_I2C9,
+		      AST_SCU_FUN_PIN_CTRL5);
 #else
 	ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
-			SCU_FUC_PIN_I2C3 |
-			SCU_FUC_PIN_I2C4 |
-			SCU_FUC_PIN_I2C5 |
-			SCU_FUC_PIN_I2C6 |
-			SCU_FUC_PIN_I2C7 |
-			SCU_FUC_PIN_I2C8 |
-			SCU_FUC_PIN_I2C9 |
-			SCU_FUC_PIN_I2C10 |
-			SCU_FUC_PIN_I2C11 |
-			SCU_FUC_PIN_I2C12 |
-			SCU_FUC_PIN_I2C13 |
-			SCU_FUC_PIN_I2C14) &
-			~(SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD2),
-		AST_SCU_FUN_PIN_CTRL5);
+		       SCU_FUC_PIN_I2C3 |
+		       SCU_FUC_PIN_I2C4 |
+		       SCU_FUC_PIN_I2C5 |
+		       SCU_FUC_PIN_I2C6 |
+		       SCU_FUC_PIN_I2C7 |
+		       SCU_FUC_PIN_I2C8 |
+		       SCU_FUC_PIN_I2C9 |
+		       SCU_FUC_PIN_I2C10 |
+		       SCU_FUC_PIN_I2C11 |
+		       SCU_FUC_PIN_I2C12 |
+		       SCU_FUC_PIN_I2C13 |
+		       SCU_FUC_PIN_I2C14) &
+		      ~(SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD2),
+		      AST_SCU_FUN_PIN_CTRL5);
 #endif
 }
 
 
-extern void
-ast_scu_multi_func_pwm_tacho(void)
+void ast_scu_multi_func_pwm_tacho(void)
 {
-	//TODO check
+	/* TODO check */
 	u32 sts = ast_scu_read(AST_SCU_FUN_PIN_CTRL3) &~0xcfffff;
 	ast_scu_write(sts | 0xc000ff, AST_SCU_FUN_PIN_CTRL3);
 }
 
 
-//0 : usb 2.0 hub mode, 1:usb 2.0 host2 controller
-extern void
-ast_scu_multi_func_usb_port1_mode(u8 mode)
+/*
+ * 0 : usb 2.0 hub mode
+ * 1:usb 2.0 host2 controller
+ */
+void ast_scu_multi_func_usb_port1_mode(u8 mode)
 {
 	if(mode)
-		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_USB20_HOST,
-					AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			      SCU_FUC_PIN_USB20_HOST, AST_SCU_FUN_PIN_CTRL5);
 	else
-		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) & ~SCU_FUC_PIN_USB20_HOST,
-					AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
+			      ~SCU_FUC_PIN_USB20_HOST,AST_SCU_FUN_PIN_CTRL5);
 }
 
 
-//0 : 1.1 hid 1, 1.1 host , 2, 2.0 host 3, 2.0 device
-extern void
-ast_scu_multi_func_usb_port2_mode(u8 mode)
+/* 0 : 1.1 hid
+ * 1 : 1.1 host
+ * 2 : 2.0 host
+ * 3 : 2.0 device
+ */
+void ast_scu_multi_func_usb_port2_mode(u8 mode)
 {
 #if defined(AST_SOC_G5)
 	if(mode == 0)
-		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) & ~SCU_FUN_PIN_USBP1_MASK),
-					AST_SCU_FUN_PIN_CTRL6);
+		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
+			       ~SCU_FUN_PIN_USBP1_MASK), AST_SCU_FUN_PIN_CTRL6);
 	else if ((mode == 1) || (mode == 2))
-		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) & ~SCU_FUN_PIN_USBP1_MASK) |
-					SCU_FUN_PIN_USBP1_MODE(0x2),
-					AST_SCU_FUN_PIN_CTRL6);
+		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
+			       ~SCU_FUN_PIN_USBP1_MASK) |
+			      SCU_FUN_PIN_USBP1_MODE(0x2),
+			      AST_SCU_FUN_PIN_CTRL6);
 	else if (mode == 3)
-		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) & ~SCU_FUN_PIN_USBP1_MASK) |
-					SCU_FUN_PIN_USBP1_MODE(0x1),
-					AST_SCU_FUN_PIN_CTRL6);
+		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
+			       ~SCU_FUN_PIN_USBP1_MASK) |
+			      SCU_FUN_PIN_USBP1_MODE(0x1),
+			      AST_SCU_FUN_PIN_CTRL6);
 	else {
 		printf("nothing\n");
 	}
 #else
 	if(mode == 0)
-		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) & ~SCU_FUC_PIN_USB11_PORT2,
-					AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
+			      ~SCU_FUC_PIN_USB11_PORT2,
+			      AST_SCU_FUN_PIN_CTRL5);
 	else if (mode == 1)
-		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_USB11_PORT2,
-			AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			      SCU_FUC_PIN_USB11_PORT2, AST_SCU_FUN_PIN_CTRL5);
 	else if (mode == 2)
-		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_USB20_HOST,
-					AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			      SCU_FUC_PIN_USB20_HOST, AST_SCU_FUN_PIN_CTRL5);
 	else {
 		printf("nothing\n");
 	}
@@ -1531,281 +1427,281 @@ ast_scu_multi_func_usb_port2_mode(u8 mode)
 }
 
 
-//0 : gpioQ6,7 mode , 1: usb1.1 host port 4 mode
-extern void
-ast_scu_multi_func_usb_port34_mode(u8 mode)
+/* 0 : gpioQ6,7 mode
+ * 1 : usb1.1 host port 4 mode
+ */
+void ast_scu_multi_func_usb_port34_mode(u8 mode)
 {
 #if defined(AST_SOC_G5)
 	if(mode) {
-		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_USB11_PORT4,
-					AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			      SCU_FUC_PIN_USB11_PORT4, AST_SCU_FUN_PIN_CTRL5);
 		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
-					(SCU_FUN_PIN_USBP3_DP |SCU_FUN_PIN_USBP3_DN | SCU_FUN_PIN_USBP4_DP | SCU_FUN_PIN_USBP4_DN),
-					AST_SCU_FUN_PIN_CTRL3);
+			      (SCU_FUN_PIN_USBP3_DP |SCU_FUN_PIN_USBP3_DN |
+			       SCU_FUN_PIN_USBP4_DP | SCU_FUN_PIN_USBP4_DN),
+			      AST_SCU_FUN_PIN_CTRL3);
 	} else {
-		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) & ~SCU_FUC_PIN_USB11_PORT4,
-					AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
+			      ~SCU_FUC_PIN_USB11_PORT4, AST_SCU_FUN_PIN_CTRL5);
 		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) &
-					~(SCU_FUN_PIN_USBP3_DP |SCU_FUN_PIN_USBP3_DN | SCU_FUN_PIN_USBP4_DP | SCU_FUN_PIN_USBP4_DN),
-					AST_SCU_FUN_PIN_CTRL3);
+			      ~(SCU_FUN_PIN_USBP3_DP |SCU_FUN_PIN_USBP3_DN |
+				SCU_FUN_PIN_USBP4_DP | SCU_FUN_PIN_USBP4_DN),
+			      AST_SCU_FUN_PIN_CTRL3);
 	}
 #else
 	if(mode) {
-		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_USB11_PORT4,
-					AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			      SCU_FUC_PIN_USB11_PORT4, AST_SCU_FUN_PIN_CTRL5);
 	} else {
-		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) & ~SCU_FUC_PIN_USB11_PORT4,
-					AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) &
+			      ~SCU_FUC_PIN_USB11_PORT4, AST_SCU_FUN_PIN_CTRL5);
 	}
 #endif
 }
 
 
-//0 : 1: SD1 function
-extern void
-ast_scu_multi_func_sdhc_8bit_mode(void)
+/* 0 : 1: SD1 function
+ */
+void ast_scu_multi_func_sdhc_8bit_mode(void)
 {
-		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD1_8BIT,
-					AST_SCU_FUN_PIN_CTRL5);
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_SD1 |
+		      SCU_FUC_PIN_SD1_8BIT, AST_SCU_FUN_PIN_CTRL5);
 }
 
 
-extern void
-ast_scu_multi_func_sdhc_slot(u8 slot)
+void ast_scu_multi_func_sdhc_slot(u8 slot)
 {
 	switch(slot) {
-		case 1:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_SD1,
-						AST_SCU_FUN_PIN_CTRL5);
-			break;
-		case 2:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_SD2,
-						AST_SCU_FUN_PIN_CTRL5);
-			break;
-		case 3:
-			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD2,
-						AST_SCU_FUN_PIN_CTRL5);
-			break;
+	case 1:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			      SCU_FUC_PIN_SD1, AST_SCU_FUN_PIN_CTRL5);
+		break;
+	case 2:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			      SCU_FUC_PIN_SD2, AST_SCU_FUN_PIN_CTRL5);
+		break;
+	case 3:
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			      SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD2,
+			      AST_SCU_FUN_PIN_CTRL5);
+		break;
 	}
 }
 
 
-//0: VGA , 1 : CRT, 2 : PASS through Port -A, 3 : PASS through Port -B
-extern void
-ast_scu_set_crt_source(u8 dac_soource)
+/* 0 : VGA
+ * 1 : CRT
+ * 2 : PASS through Port -A
+ * 3 : PASS through Port -B
+ */
+void ast_scu_set_crt_source(u8 dac_soource)
 {
 	ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_DAC_MASK) |
-				SCU_MISC_SET_DAC_SOURCE(dac_soource)  , AST_SCU_MISC1_CTRL);
+	      SCU_MISC_SET_DAC_SOURCE(dac_soource)  , AST_SCU_MISC1_CTRL);
 
 }
 
-
-extern void
-ast_scu_multi_func_crt(void)
+void ast_scu_multi_func_crt(void)
 {
-	/* multi-pin for DVO enable DVO (bit18) is VGA , enable DAC (bit16) is CRT  */
+	/* multi-pin for DVO enable DVO (bit18) is VGA , enable DAC
+	 * (bit16) is CRT
+	 */
 #if defined(CONFIG_AST_DAC) || defined(CONFIG_AST_DVO)
-		ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_DAC_MASK)
-					| SCU_MISC_DAC_SOURCE_CRT | SCU_MISC_DVO_SOURCE_CRT | SCU_MISC_2D_CRT_EN , AST_SCU_MISC1_CTRL);
+	ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_DAC_MASK) |
+		      SCU_MISC_DAC_SOURCE_CRT | SCU_MISC_DVO_SOURCE_CRT |
+		      SCU_MISC_2D_CRT_EN, AST_SCU_MISC1_CTRL);
 #elif defined(CONFIG_AST_DVO)
-		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) | SCU_MISC_DVO_SOURCE_CRT| SCU_MISC_2D_CRT_EN, AST_SCU_MISC1_CTRL);
-#else //default(CONFIG_AST_DAC)
-		ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_DAC_MASK)
-					| SCU_MISC_DAC_SOURCE_CRT | SCU_MISC_2D_CRT_EN, AST_SCU_MISC1_CTRL);
+	ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) |
+		      SCU_MISC_DVO_SOURCE_CRT| SCU_MISC_2D_CRT_EN,
+		      AST_SCU_MISC1_CTRL);
+#else /* default(CONFIG_AST_DAC) */
+	ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_DAC_MASK)
+		      | SCU_MISC_DAC_SOURCE_CRT | SCU_MISC_2D_CRT_EN,
+		      AST_SCU_MISC1_CTRL);
 #endif
 
-	//Digital vodeo input function pins : 00 disable, 10 24bits mode 888,
+	/* Digital vodeo input function pins :
+	 *     00 disable
+	 *     10 24bits mode 888
+	 */
 	ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
-			~SCU_FUC_PIN_DIGI_V_OUT_MASK) |
-			SCU_FUC_PIN_DIGI_V_OUT(VIDEO_24BITS), AST_SCU_FUN_PIN_CTRL6);
+		       ~SCU_FUC_PIN_DIGI_V_OUT_MASK) |
+		      SCU_FUC_PIN_DIGI_V_OUT(VIDEO_24BITS),
+		      AST_SCU_FUN_PIN_CTRL6);
 
-	//VPI input
+	/* VPI input */
 #if 0
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
-			SCU_FUN_PIN_VPIB9 | SCU_FUN_PIN_VPIB8 |
-			SCU_FUN_PIN_VPIB7 | SCU_FUN_PIN_VPIB6 |
-			SCU_FUN_PIN_VPIB5 | SCU_FUN_PIN_VPIB4 |
-			SCU_FUN_PIN_VPIB3 | SCU_FUN_PIN_VPIB2 |
-			SCU_FUN_PIN_VPIB1 | SCU_FUN_PIN_VPIB0 |
-			SCU_FUN_PIN_VPICLK | SCU_FUN_PIN_VPIVS |
-			SCU_FUN_PIN_VPIHS | SCU_FUN_PIN_VPIODD |
-			SCU_FUN_PIN_VPIDE ,AST_SCU_FUN_PIN_CTRL2);
+		      SCU_FUN_PIN_VPIB9 | SCU_FUN_PIN_VPIB8 |
+		      SCU_FUN_PIN_VPIB7 | SCU_FUN_PIN_VPIB6 |
+		      SCU_FUN_PIN_VPIB5 | SCU_FUN_PIN_VPIB4 |
+		      SCU_FUN_PIN_VPIB3 | SCU_FUN_PIN_VPIB2 |
+		      SCU_FUN_PIN_VPIB1 | SCU_FUN_PIN_VPIB0 |
+		      SCU_FUN_PIN_VPICLK | SCU_FUN_PIN_VPIVS |
+		      SCU_FUN_PIN_VPIHS | SCU_FUN_PIN_VPIODD |
+		      SCU_FUN_PIN_VPIDE ,AST_SCU_FUN_PIN_CTRL2);
 
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
-			SCU_FUN_PIN_VPIR9 | SCU_FUN_PIN_VPIR8 |
-			SCU_FUN_PIN_VPIR7 | SCU_FUN_PIN_VPIR6 |
-			SCU_FUN_PIN_VPIR5 | SCU_FUN_PIN_VPIR4 |
-			SCU_FUN_PIN_VPIR3 | SCU_FUN_PIN_VPIR2 |
-			SCU_FUN_PIN_VPIR1 | SCU_FUN_PIN_VPIR0 |
-			SCU_FUN_PIN_VPIG9 | SCU_FUN_PIN_VPIG8 |
-			SCU_FUN_PIN_VPIG7 | SCU_FUN_PIN_VPIG6 |
-			SCU_FUN_PIN_VPIG5 | SCU_FUN_PIN_VPIG4 |
-			SCU_FUN_PIN_VPIG3 | SCU_FUN_PIN_VPIG2 |
-			SCU_FUN_PIN_VPIG1 | SCU_FUN_PIN_VPIG0 ,AST_SCU_FUN_PIN_CTRL3);
+		      SCU_FUN_PIN_VPIR9 | SCU_FUN_PIN_VPIR8 |
+		      SCU_FUN_PIN_VPIR7 | SCU_FUN_PIN_VPIR6 |
+		      SCU_FUN_PIN_VPIR5 | SCU_FUN_PIN_VPIR4 |
+		      SCU_FUN_PIN_VPIR3 | SCU_FUN_PIN_VPIR2 |
+		      SCU_FUN_PIN_VPIR1 | SCU_FUN_PIN_VPIR0 |
+		      SCU_FUN_PIN_VPIG9 | SCU_FUN_PIN_VPIG8 |
+		      SCU_FUN_PIN_VPIG7 | SCU_FUN_PIN_VPIG6 |
+		      SCU_FUN_PIN_VPIG5 | SCU_FUN_PIN_VPIG4 |
+		      SCU_FUN_PIN_VPIG3 | SCU_FUN_PIN_VPIG2 |
+		      SCU_FUN_PIN_VPIG1 | SCU_FUN_PIN_VPIG0 ,
+		      AST_SCU_FUN_PIN_CTRL3);
 #endif
 }
 
 
-extern void
-ast_scu_multi_nic_switch(u8 enable)
+void ast_scu_multi_nic_switch(u8 enable)
 {
-	if(enable) {
-		ast_scu_write((0x1 << 28) | ast_scu_read(AST_SCU_MAC_CLK), AST_SCU_MAC_CLK);
-		ast_scu_write(~(0x1 << 11) & ast_scu_read(AST_SCU_RESET), AST_SCU_RESET);	//A1 ECO
+	if (enable) {
+		ast_scu_write((0x1 << 28) | ast_scu_read(AST_SCU_MAC_CLK),
+			      AST_SCU_MAC_CLK);
+		ast_scu_write(~(0x1 << 11) & ast_scu_read(AST_SCU_RESET),
+			      AST_SCU_RESET);	/* A1 ECO */
 	} else {
-		ast_scu_write(~(0x1 << 28) & ast_scu_read(AST_SCU_MAC_CLK), AST_SCU_MAC_CLK);
-		ast_scu_write((0x1 << 11) | ast_scu_read(AST_SCU_RESET), AST_SCU_RESET);
+		ast_scu_write(~(0x1 << 28) & ast_scu_read(AST_SCU_MAC_CLK),
+			      AST_SCU_MAC_CLK);
+		ast_scu_write((0x1 << 11) | ast_scu_read(AST_SCU_RESET),
+			      AST_SCU_RESET);
 	}
 
 }
 
-extern void
+void
 ast_scu_multi_func_sgpio(void)
 {
 	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
-			SCU_FUN_PIN_SGPMI |
-			SCU_FUN_PIN_SGPMO |
-			SCU_FUN_PIN_SGPMLD |
-			SCU_FUN_PIN_SGPMCK, AST_SCU_FUN_PIN_CTRL2);
+		      SCU_FUN_PIN_SGPMI |
+		      SCU_FUN_PIN_SGPMO |
+		      SCU_FUN_PIN_SGPMLD |
+		      SCU_FUN_PIN_SGPMCK, AST_SCU_FUN_PIN_CTRL2);
 
 }
 
 
-//***********************************Information ***********************************
-extern u32
-ast_scu_revision_id(void)
+/***********************************Information *******************************/
+u32 ast_scu_revision_id(void)
 {
 	int i;
 	u32 rev_id = ast_scu_read(AST_SCU_REVISION_ID);
-	for(i=0;i<ARRAY_SIZE(soc_map_table);i++) {
-		if(rev_id == soc_map_table[i].rev_id)
+
+	for(i = 0; i < ARRAY_SIZE(soc_map_table); i++) {
+		if (rev_id == soc_map_table[i].rev_id)
 			break;
 	}
-	if(i == ARRAY_SIZE(soc_map_table))
-		SCUMSG("UnKnow-SOC : %x \n",rev_id);
+
+	if (i == ARRAY_SIZE(soc_map_table))
+		printf("UnKnow-SOC : %x \n",rev_id);
 	else
-		SCUMSG("SOC : %4s \n",soc_map_table[i].name);
+		printf("SOC : %4s \n",soc_map_table[i].name);
 
 	return rev_id;
 }
 
-
-extern void
-ast_scu_security_info(void)
+void ast_scu_security_info(void)
 {
 	switch((ast_scu_read(AST_SCU_HW_STRAP2) >> 18) & 0x3) {
-		case 1:
-			printf("SEC : DSS Mode \n");
-			break;
-		case 2:
-			printf("SEC : UnKnow \n");
-			break;
-		case 3:
-			printf("SEC : SPI2 Mode \n");
-			break;
+	case 1:
+		printf("SEC : DSS Mode \n");
+		break;
+	case 2:
+		printf("SEC : UnKnow \n");
+		break;
+	case 3:
+		printf("SEC : SPI2 Mode \n");
+		break;
 	}
 
 }
 
-extern void
-ast_scu_sys_rest_info(void)
+void ast_scu_sys_rest_info(void)
 {
 	u32 rest = ast_scu_read(AST_SCU_SYS_CTRL);
 
-#ifdef CONFIG_ARCH_AST1010
-	if(rest & SCU_SYS_WDT_FULL_FLAG) {
-		SCUMSG("RST : External \n");
-		ast_scu_write(SCU_SYS_WDT_FULL_FLAG, AST_SCU_SYS_CTRL);
-	} else if (rest & SCU_SYS_WDT_SOC_RESET) {
-		SCUMSG("RST : Watchdog - SOC\n");
-		ast_scu_write(SCU_SYS_WDT_SOC_RESET, AST_SCU_SYS_CTRL);
-	} else if (rest & SCU_SYS_PWR_RESET_FLAG) {
-		SCUMSG("RST : Power On \n");
-		ast_scu_write(SCU_SYS_PWR_RESET_FLAG, AST_SCU_SYS_CTRL);
-	} else {
-	}
-#else
 	if(rest & SCU_SYS_EXT_RESET_FLAG) {
-		SCUMSG("RST : External \n");
+		printf("RST : External \n");
 		ast_scu_write(SCU_SYS_EXT_RESET_FLAG, AST_SCU_SYS_CTRL);
 	} else if (rest & SCU_SYS_WDT_RESET_FLAG) {
-		SCUMSG("RST : Watchdog \n");
+		printf("RST : Watchdog \n");
 		ast_scu_write(SCU_SYS_WDT_RESET_FLAG, AST_SCU_SYS_CTRL);
 	} else if (rest & SCU_SYS_PWR_RESET_FLAG) {
-		SCUMSG("RST : Power On \n");
+		printf("RST : Power On \n");
 		ast_scu_write(SCU_SYS_PWR_RESET_FLAG, AST_SCU_SYS_CTRL);
 	} else {
-		SCUMSG("RST : CLK en \n");
+		printf("RST : CLK en \n");
 	}
-#endif
 }
 
 
 /*
-* D[15:11] in 0x1E6E2040 is NCSI scratch from U-Boot. D[15:14] = MAC1, D[13:12] = MAC2
-* The meanings of the 2 bits are:
-* 00(0): Dedicated PHY
-* 01(1): ASPEED's EVA + INTEL's NC-SI PHY chip EVA
-* 10(2): ASPEED's MAC is connected to NC-SI PHY chip directly
-* 11: Reserved
-*/
-
-extern u32
-ast_scu_get_phy_config(u8 mac_num)
+ * D[15:11] in 0x1E6E2040 is NCSI scratch from U-Boot.
+ * D[15:14] = MAC1, D[13:12] = MAC2
+ *
+ * The meanings of the 2 bits are:
+ *   00(0): Dedicated PHY
+ *   01(1): ASPEED's EVA + INTEL's NC-SI PHY chip EVA
+ *   10(2): ASPEED's MAC is connected to NC-SI PHY chip directly
+ *   11   : Reserved
+ */
+u32 ast_scu_get_phy_config(u8 mac_num)
 {
 	u32 scatch = ast_scu_read(AST_SCU_SOC_SCRATCH0);
 
 	switch(mac_num) {
-		case 0:
-			return (SCU_MAC0_GET_PHY_MODE(scatch));
-			break;
-		case 1:
-			return (SCU_MAC1_GET_PHY_MODE(scatch));
-			break;
-		default:
-			SCUMSG("error mac number \n");
-			break;
+	case 0:
+		return (SCU_MAC0_GET_PHY_MODE(scatch));
+		break;
+	case 1:
+		return (SCU_MAC1_GET_PHY_MODE(scatch));
+		break;
+	default:
+		printf("error mac number \n");
+		break;
 	}
 	return -1;
 }
 
-extern u32
-ast_scu_get_phy_interface(u8 mac_num)
+u32 ast_scu_get_phy_interface(u8 mac_num)
 {
 	u32 trap1 = ast_scu_read(AST_SCU_HW_STRAP1);
 
 	switch(mac_num) {
-		case 0:
-			if(SCU_HW_STRAP_MAC0_RGMII & trap1)
-				return 1;
-			else
-				return 0;
-			break;
-		case 1:
-			if(SCU_HW_STRAP_MAC1_RGMII & trap1)
-				return 1;
-			else
-				return 0;
-			break;
-		default:
-			SCUMSG("error mac number \n");
-			break;
+	case 0:
+		if(SCU_HW_STRAP_MAC0_RGMII & trap1)
+			return 1;
+		else
+			return 0;
+		break;
+	case 1:
+		if(SCU_HW_STRAP_MAC1_RGMII & trap1)
+			return 1;
+		else
+			return 0;
+		break;
+	default:
+		printf("error mac number \n");
+		break;
 	}
 	return -1;
 }
 
-extern void
-ast_scu_set_vga_display(u8 enable)
+void ast_scu_set_vga_display(u8 enable)
 {
 	if(enable)
-		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_VGA_CRT_DIS, AST_SCU_MISC1_CTRL);
+		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) &
+			      ~SCU_MISC_VGA_CRT_DIS, AST_SCU_MISC1_CTRL);
 	else
-		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) | SCU_MISC_VGA_CRT_DIS, AST_SCU_MISC1_CTRL);
+		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) |
+			      SCU_MISC_VGA_CRT_DIS, AST_SCU_MISC1_CTRL);
 }
 
-
-extern u8
-ast_scu_get_vga_display(void)
+u8 ast_scu_get_vga_display(void)
 {
 	if(ast_scu_read(AST_SCU_MISC1_CTRL) & SCU_MISC_VGA_CRT_DIS)
 		return 0;
@@ -1813,88 +1709,83 @@ ast_scu_get_vga_display(void)
 		return 1;
 }
 
-
-extern u32
-ast_scu_get_vga_memsize(void)
+u32 ast_scu_get_vga_memsize(void)
 {
 	u32 size=0;
 
-	switch(SCU_HW_STRAP_VGA_SIZE_GET(ast_scu_read(AST_SCU_HW_STRAP1))) {
-		case VGA_8M_DRAM:
-			size = 8*1024*1024;
-			break;
-		case VGA_16M_DRAM:
-			size = 16*1024*1024;
-			break;
-		case VGA_32M_DRAM:
-			size = 32*1024*1024;
-			break;
-		case VGA_64M_DRAM:
-			size = 64*1024*1024;
-			break;
-		default:
-			SCUMSG("error vga size \n");
-			break;
+	switch (SCU_HW_STRAP_VGA_SIZE_GET(ast_scu_read(AST_SCU_HW_STRAP1))) {
+	case VGA_8M_DRAM:
+		size = 8*1024*1024;
+		break;
+	case VGA_16M_DRAM:
+		size = 16*1024*1024;
+		break;
+	case VGA_32M_DRAM:
+		size = 32*1024*1024;
+		break;
+	case VGA_64M_DRAM:
+		size = 64*1024*1024;
+		break;
+	default:
+		printf("error vga size \n");
+		break;
 	}
 	return size;
 }
 
 
-extern u32
-ast_scu_get_soc_dram_base(void)
+u32 ast_scu_get_soc_dram_base(void)
 {
 	u32 rev_id = ast_scu_read(AST_SCU_REVISION_ID);
-	if((rev_id >> AST_SOC_GEN) > 3)
+
+	if ((rev_id >> AST_SOC_GEN) > 3)
 		return AST_DRAM_BASE_8;
 	else
 		return AST_DRAM_BASE_4;
 }
 
-extern void
-ast_scu_get_who_init_dram(void)
+void ast_scu_get_who_init_dram(void)
 {
 	switch(SCU_VGA_DRAM_INIT_MASK(ast_scu_read(AST_SCU_VGA0))) {
-		case 0:
-			printf("DRAM :   init by VBIOS \n");
-			break;
-		case 1:
-			printf("DRAM :   init by SOC \n");
-			break;
-		default:
-			printf("error vga size \n");
-			break;
+	case 0:
+		printf("DRAM :   init by VBIOS \n");
+		break;
+	case 1:
+		printf("DRAM :   init by SOC \n");
+		break;
+	default:
+		printf("error vga size \n");
+		break;
 	}
 }
 
-extern u8
-ast_scu_adc_trim_read(void)
+u8 ast_scu_adc_trim_read(void)
 {
 	return (ast_scu_read(AST_SCU_OTP1) >> 28);
 }
 
-extern void
-ast_scu_hw_random_enable(u8 enable)
+void ast_scu_hw_random_enable(u8 enable)
 {
 	if(enable)
-		ast_scu_write(ast_scu_read(AST_SCU_RAMDOM_GEN) | RNG_ENABLE, AST_SCU_RAMDOM_GEN);
+		ast_scu_write(ast_scu_read(AST_SCU_RAMDOM_GEN) | RNG_ENABLE,
+			      AST_SCU_RAMDOM_GEN);
 	else
-		ast_scu_write(ast_scu_read(AST_SCU_RAMDOM_GEN) & ~RNG_ENABLE, AST_SCU_RAMDOM_GEN);
+		ast_scu_write(ast_scu_read(AST_SCU_RAMDOM_GEN) & ~RNG_ENABLE,
+			      AST_SCU_RAMDOM_GEN);
 }
 
-extern u32
-ast_scu_hw_random_read(void)
+u32 ast_scu_hw_random_read(void)
 {
 	return (ast_scu_read(AST_SCU_RAMDOM_DATA));
 }
 
-extern u8
-ast_scu_get_hw_random_type(void)
+u8 ast_scu_get_hw_random_type(void)
 {
 	return (RNG_GET_TYPE(ast_scu_read(AST_SCU_RAMDOM_GEN)));
 }
 
-extern void
-ast_scu_set_hw_random_type(u8 type)
+void ast_scu_set_hw_random_type(u8 type)
 {
-	ast_scu_write(((ast_scu_read(AST_SCU_RAMDOM_GEN) & ~RNG_TYPE_MASK) | RNG_SET_TYPE(type)), AST_SCU_RAMDOM_GEN);
+	ast_scu_write(((ast_scu_read(AST_SCU_RAMDOM_GEN) & ~RNG_TYPE_MASK) |
+		       RNG_SET_TYPE(type)), AST_SCU_RAMDOM_GEN);
 }
diff --git a/arch/arm/mach-aspeed/ast-sdmc.c b/arch/arm/mach-aspeed/ast-sdmc.c
index 6ac891532bdb..10f3ddb829bb 100644
--- a/arch/arm/mach-aspeed/ast-sdmc.c
+++ b/arch/arm/mach-aspeed/ast-sdmc.c
@@ -1,24 +1,29 @@
-/********************************************************************************
-* File Name     : arch/arm/mach-aspeed/ast-sdmc.c
-* Author         : Ryan Chen
-* Description   : AST SDRAM Memory Ctrl
-*
-* Copyright (C) 2012-2020  ASPEED Technology Inc.
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by the Free Software Foundation;
-* either version 2 of the License, or (at your option) any later version.
-* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
-* without even the implied warranty of MERCHANTABILITY or
-* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-
-
-*   History      :
-*    1. 2013/03/15 Ryan Chen Create
-*
-********************************************************************************/
+/*******************************************************************************
+ * File Name     : arch/arm/mach-aspeed/ast-sdmc.c
+ * Author        : Ryan Chen
+ * Description   : AST SDRAM Memory Ctrl
+ *
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of the
+ * License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
+ * USA
+ *
+ *   History      :
+ *    1. 2013/03/15 Ryan Chen Create
+ *
+ ******************************************************************************/
 #include <common.h>
 #include <asm/processor.h>
 #include <asm/io.h>
@@ -28,125 +33,67 @@
 #include <asm/arch/ast-sdmc.h>
 
 //#define AST_SDMC_LOCK
-//#define AST_SDMC_DEBUG
-
-#ifdef AST_SDMC_DEBUG
-#define SDMCDBUG(fmt, args...) printf("%s() " fmt, __FUNCTION__, ## args)
-#else
-#define SDMCDBUG(fmt, args...)
-#endif
 
-#define SDMCMSG(fmt, args...) printf(fmt, ## args)
-
-static u32 ast_sdmc_base = AST_SDMC_BASE;
-
-static inline u32
-ast_sdmc_read(u32 reg)
+static inline u32 ast_sdmc_read(u32 reg)
 {
-	u32 val;
-
-	val = readl(ast_sdmc_base + reg);
-
-	SDMCDBUG("ast_sdmc_read : reg = 0x%08x, val = 0x%08x\n", reg, val);
+	u32 val = readl(AST_SDMC_BASE + reg);
 
+	debug("ast_sdmc_read : reg = 0x%08x, val = 0x%08x\n", reg, val);
 	return val;
 }
 
-static inline void
-ast_sdmc_write(u32 val, u32 reg)
+static inline void ast_sdmc_write(u32 val, u32 reg)
 {
-	SDMCDBUG("ast_sdmc_write : reg = 0x%08x, val = 0x%08x\n", reg, val);
+	debug("ast_sdmc_write : reg = 0x%08x, val = 0x%08x\n", reg, val);
 #ifdef CONFIG_AST_SDMC_LOCK
 	//unlock
-	writel(SDMC_PROTECT_UNLOCK, ast_sdmc_base);
-	writel(val, ast_sdmc_base + reg);
+	writel(SDMC_PROTECT_UNLOCK, AST_SDMC_BASE);
+	writel(val, AST_SDMC_BASE + reg);
 	//lock
-	writel(0xaa,ast_sdmc_base);
+	writel(0xaa, AST_SDMC_BASE);
 #else
-	writel(SDMC_PROTECT_UNLOCK, ast_sdmc_base);
+	writel(SDMC_PROTECT_UNLOCK, AST_SDMC_BASE);
 
-	writel(val, ast_sdmc_base + reg);
+	writel(val, AST_SDMC_BASE + reg);
 #endif
 }
 
-//***********************************Information ***********************************
-#ifdef CONFIG_ARCH_AST1010
-extern u32
-ast_sdmc_get_mem_size(void)
-{
-	if(ast_sdmc_read(AST_SDMC_CONFIG) & SDMC_CONFIG_16MB) {
-		return PHYS_SDRAM_12M;
-	} else {
-		return PHYS_SDRAM_8M;
-	}
-}
-#else
-extern u32
-ast_sdmc_get_mem_size(void)
+u32 ast_sdmc_get_mem_size(void)
 {
-	u32 size=0;
+	u32 size = 0;
 	u32 conf = ast_sdmc_read(AST_SDMC_CONFIG);
 
-	if(conf & SDMC_CONFIG_VER_NEW) {
-		switch(SDMC_CONFIG_MEM_GET(conf)) {
-			case 0:
-				size = 128*1024*1024;
-				break;
-			case 1:
-				size = 256*1024*1024;
-				break;
-			case 2:
-				size = 512*1024*1024;
-				break;
-			case 3:
-				size = 1024*1024*1024;
-				break;
-
-			default:
-				SDMCMSG("error ddr size \n");
-				break;
-		}
-
-	} else {
-		switch(SDMC_CONFIG_MEM_GET(conf)) {
-			case 0:
-				size = 64*1024*1024;
-				break;
-			case 1:
-				size = 128*1024*1024;
-				break;
-			case 2:
-				size = 256*1024*1024;
-				break;
-			case 3:
-				size = 512*1024*1024;
-				break;
+	switch (SDMC_CONFIG_MEM_GET(conf)) {
+	case 0:
+		size = 64;
+		break;
+	case 1:
+		size = 128;
+		break;
+	case 2:
+		size = 256;
+		break;
+	case 3:
+		size = 512;
+		break;
+	default:
+		printf("error ddr size \n");
+		break;
+	}
 
-			default:
-				SDMCMSG("error ddr size \n");
-				break;
-		}
+	if (conf & SDMC_CONFIG_VER_NEW) {
+		size <<= 1;
 	}
-	return size;
+
+	return size * 1024 * 1024;
 }
-#endif
 
-extern u8
-ast_sdmc_get_eec(void)
+u8 ast_sdmc_get_eec(void)
 {
-	u32 conf = ast_sdmc_read(AST_SDMC_CONFIG);
-	if(conf & SDMC_CONFIG_EEC_EN)
-		return 1;
-	else
-		return 0;
+	return ast_sdmc_read(AST_SDMC_CONFIG) & SDMC_CONFIG_EEC_EN;
 }
 
-extern u8
-ast_sdmc_get_cache(void)
+u8 ast_sdmc_get_cache(void)
 {
-	u32 conf = ast_sdmc_read(AST_SDMC_CONFIG);
-	if(conf & SDMC_CONFIG_CACHE_EN)
-		return 1;
-	else
-		return 0;
+	return ast_sdmc_read(AST_SDMC_CONFIG) & SDMC_CONFIG_CACHE_EN;
 }
diff --git a/arch/arm/mach-aspeed/cpuinfo.c b/arch/arm/mach-aspeed/cpuinfo.c
index 96d2de5a416a..45f70a81833f 100644
--- a/arch/arm/mach-aspeed/cpuinfo.c
+++ b/arch/arm/mach-aspeed/cpuinfo.c
@@ -1,7 +1,7 @@
 /*
  * This file is released under the terms of GPL v2 and any later version.
  * See the file COPYING in the root directory of the source tree for details.
-*/
+ */
 
 #include <common.h>
 #include <command.h>
@@ -10,7 +10,6 @@
 #include <asm/arch/ast-sdmc.h>
 #include <asm/arch/aspeed.h>
 
-
 #if defined(CONFIG_DISPLAY_CPUINFO)
 int print_cpuinfo(void)
 {
@@ -24,26 +23,24 @@ int print_cpuinfo(void)
 #ifdef AST_SOC_G5
 	ast_scu_security_info();
 #endif
-
-	printf("PLL :   %4s MHz\n",
-					strmhz(buf, ast_get_clk_source()));
-	printf("CPU :   %4s MHz\n",
-					strmhz(buf, ast_get_h_pll_clk()));
+	printf("PLL :   %4s MHz\n", strmhz(buf, ast_get_clk_source()));
+	printf("CPU :   %4s MHz\n", strmhz(buf, ast_get_h_pll_clk()));
 #ifdef AST_SOC_G5
 	printf("MEM :	%4s MHz, EEC: %s, Cache: %s \n",
-					strmhz(buf, ast_get_m_pll_clk() * 2), ast_sdmc_get_eec() ? "Enable":"Disable",ast_sdmc_get_cache() ?"Enable":"Disable");
+	       strmhz(buf, ast_get_m_pll_clk() * 2),
+	       ast_sdmc_get_eec() ? "Enable" : "Disable",
+	       ast_sdmc_get_cache() ? "Enable" : "Disable");
 #else
 	printf("MEM :   %4s MHz, EEC:%s \n",
-					strmhz(buf, ast_get_m_pll_clk()), ast_sdmc_get_eec() ? "Enable":"Disable");
+	       strmhz(buf, ast_get_m_pll_clk()),
+	       ast_sdmc_get_eec() ? "Enable" : "Disable");
 #endif
 	size = ast_scu_get_vga_memsize();
 
 	puts("VGA :    ");
-
 	print_size(size, "\n");
 
 	ast_scu_get_who_init_dram();
-
 	return 0;
 }
 #endif
diff --git a/arch/arm/mach-aspeed/timer.c b/arch/arm/mach-aspeed/timer.c
index f1109acbe108..626f992429b6 100644
--- a/arch/arm/mach-aspeed/timer.c
+++ b/arch/arm/mach-aspeed/timer.c
@@ -37,7 +37,7 @@ static ulong lastdec;
 int timer_init (void)
 {
 	*(volatile ulong *)(AST_TIMER_BASE + 4)    = TIMER_LOAD_VAL;
-	*(volatile ulong *)(AST_TIMER_BASE + 0x30) = 0x3;		/* enable timer1 */
+	*(volatile ulong *)(AST_TIMER_BASE + 0x30) = 0x3; /* enable timer1 */
 
 	/* init the timestamp and lastdec value */
 	reset_timer_masked();
@@ -67,23 +67,23 @@ void set_timer (ulong t)
 /* delay x useconds AND perserve advance timstamp value */
 void __udelay (unsigned long usec)
 {
-  ulong last = READ_CLK;
-  ulong clks;
-  ulong elapsed = 0;
-
-  /* translate usec to clocks */
-  clks = (usec / 1000) * CLK_PER_HZ;
-  clks += (usec % 1000) * CLK_PER_HZ / 1000;
-
-  while (clks > elapsed) {
-    ulong now = READ_CLK;
-    if (now <= last) {
-      elapsed += last - now;
-    } else {
-      elapsed += TIMER_LOAD_VAL - (now - last);
-    }
-    last = now;
-  }
+	ulong last = READ_CLK;
+	ulong clks;
+	ulong elapsed = 0;
+
+	/* translate usec to clocks */
+	clks = (usec / 1000) * CLK_PER_HZ;
+	clks += (usec % 1000) * CLK_PER_HZ / 1000;
+
+	while (clks > elapsed) {
+		ulong now = READ_CLK;
+		if (now <= last) {
+			elapsed += last - now;
+		} else {
+			elapsed += TIMER_LOAD_VAL - (now - last);
+		}
+		last = now;
+	}
 }
 
 void reset_timer_masked (void)
@@ -95,16 +95,18 @@ void reset_timer_masked (void)
 
 ulong get_timer_masked (void)
 {
-	ulong now = READ_TIMER;		/* current tick value */
+	ulong now = READ_TIMER;	/* current tick value */
+
+	if (lastdec >= now) {	/* normal mode (non roll) */
+		 /* move stamp fordward with absolute diff ticks */
+		timestamp += lastdec - now;
+	} else { /* we have overflow of the count down timer */
 
-	if (lastdec >= now) {		/* normal mode (non roll) */
-		/* normal mode */
-		timestamp += lastdec - now; /* move stamp fordward with absoulte diff ticks */
-	} else {			/* we have overflow of the count down timer */
 		/* nts = ts + ld + (TLV - now)
 		 * ts=old stamp, ld=time that passed before passing through -1
 		 * (TLV-now) amount of time after passing though -1
-		 * nts = new "advancing time stamp"...it could also roll and cause problems.
+		 * nts = new "advancing time stamp"... it could also roll and
+		 * cause problems.
 		 */
 		timestamp += lastdec + (TIMER_LOAD_VAL / CLK_PER_HZ) - now;
 	}
-- 
2.1.4
