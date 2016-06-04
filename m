Return-Path: <clg@kaod.org>
X-Greylist: delayed 1797 seconds by postgrey-1.35 at bilbo;
 Sun, 05 Jun 2016 07:33:15 AEST
Received: from 4.mo1.mail-out.ovh.net (4.mo1.mail-out.ovh.net [46.105.76.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rMZ2M3KRdzDq80
 for <openbmc@lists.ozlabs.org>; Sun,  5 Jun 2016 07:33:14 +1000 (AEST)
Received: from player729.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id A0BCC102C06A
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jun 2016 22:55:33 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 8B3385E008F;
 Sat,  4 Jun 2016 22:55:28 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH uboot] ARM: AST2500: add support
Date: Sat,  4 Jun 2016 22:55:10 +0200
Message-Id: <1465073710-31649-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4631107793164667650
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrieehgdduheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenuc
X-Mailman-Approved-At: Tue, 07 Jun 2016 05:55:14 +1000
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
X-List-Received-Date: Sat, 04 Jun 2016 21:33:17 -0000

This is a port of u-boot from ast_sdk.v00.03.21 on version
v2016.05. Only the ast2500 (g5) support was extracted from the sdk.

To test :

   https://github.com/legoater/u-boot/tree/v2016.05-ast2500

To configure, just use target ast_g5_defconfig :

   make ARCH=arm CROSS_COMPILE=arm-none-eabi- ast_g5_defconfig

This is work in progress, it should boot your kernel but it could
brick your AST. So only use if you have a SPI programmer close by.

Cheers,

C.


Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/Kconfig                                   |    4 +
 arch/arm/Makefile                                  |    1 +
 arch/arm/cpu/arm1176/Makefile                      |    2 +
 arch/arm/cpu/arm1176/aspeed/Makefile               |   13 +
 arch/arm/cpu/arm1176/aspeed/cpu.c                  |   20 +
 arch/arm/cpu/arm1176/start.S                       |    7 +
 arch/arm/include/asm/arch-aspeed/aspeed.h          |   43 +
 arch/arm/include/asm/arch-aspeed/ast-ahbc.h        |   32 +
 arch/arm/include/asm/arch-aspeed/ast-sdmc.h        |   29 +
 arch/arm/include/asm/arch-aspeed/ast_g5_platform.h |  191 ++
 arch/arm/include/asm/arch-aspeed/ast_scu.h         |  116 ++
 arch/arm/include/asm/arch-aspeed/platform.h        |   54 +
 arch/arm/include/asm/arch-aspeed/regs-ahbc.h       |   41 +
 arch/arm/include/asm/arch-aspeed/regs-scu.h        | 1049 +++++++++++
 arch/arm/include/asm/arch-aspeed/regs-sdmc.h       |   38 +
 arch/arm/include/asm/arch-aspeed/regs-spi.h        |   55 +
 arch/arm/include/asm/mach-types.h                  |   13 +
 arch/arm/mach-aspeed/Makefile                      |   15 +
 arch/arm/mach-aspeed/ast-ahbc.c                    |   95 +
 arch/arm/mach-aspeed/ast-scu.c                     | 1900 +++++++++++++++++++
 arch/arm/mach-aspeed/ast-sdmc.c                    |  152 ++
 arch/arm/mach-aspeed/cpuinfo.c                     |   49 +
 arch/arm/mach-aspeed/flash.c                       | 1403 ++++++++++++++
 arch/arm/mach-aspeed/reset.c                       |   18 +
 arch/arm/mach-aspeed/timer.c                       |  147 ++
 board/aspeed/ast-g5/Kconfig                        |   18 +
 board/aspeed/ast-g5/Makefile                       |   30 +
 board/aspeed/ast-g5/ast-g5.c                       |   86 +
 board/aspeed/ast-g5/platform.S                     | 1985 ++++++++++++++++++++
 board/aspeed/ast-g5/platform_armsim2.S             |  451 +++++
 board/aspeed/ast-g5/platform_fpga.S                |  822 ++++++++
 board/aspeed/ast-g5/platform_fpga_ecc.S            |  843 +++++++++
 common/exports.c                                   |    6 +
 common/image.c                                     |   11 +
 configs/ast_g5_defconfig                           |    9 +
 drivers/net/ftgmac100.c                            |  502 +++--
 drivers/net/ftgmac100.h                            |   77 +-
 include/_exports.h                                 |    3 +
 include/configs/ast-g5.h                           |  245 +++
 include/flash.h                                    |   21 +
 include/spi.h                                      |    2 +
 41 files changed, 10467 insertions(+), 131 deletions(-)
 create mode 100644 arch/arm/cpu/arm1176/aspeed/Makefile
 create mode 100644 arch/arm/cpu/arm1176/aspeed/cpu.c
 create mode 100644 arch/arm/include/asm/arch-aspeed/aspeed.h
 create mode 100644 arch/arm/include/asm/arch-aspeed/ast-ahbc.h
 create mode 100644 arch/arm/include/asm/arch-aspeed/ast-sdmc.h
 create mode 100644 arch/arm/include/asm/arch-aspeed/ast_g5_platform.h
 create mode 100644 arch/arm/include/asm/arch-aspeed/ast_scu.h
 create mode 100644 arch/arm/include/asm/arch-aspeed/platform.h
 create mode 100644 arch/arm/include/asm/arch-aspeed/regs-ahbc.h
 create mode 100644 arch/arm/include/asm/arch-aspeed/regs-scu.h
 create mode 100644 arch/arm/include/asm/arch-aspeed/regs-sdmc.h
 create mode 100644 arch/arm/include/asm/arch-aspeed/regs-spi.h
 create mode 100644 arch/arm/mach-aspeed/Makefile
 create mode 100644 arch/arm/mach-aspeed/ast-ahbc.c
 create mode 100644 arch/arm/mach-aspeed/ast-scu.c
 create mode 100644 arch/arm/mach-aspeed/ast-sdmc.c
 create mode 100644 arch/arm/mach-aspeed/cpuinfo.c
 create mode 100644 arch/arm/mach-aspeed/flash.c
 create mode 100644 arch/arm/mach-aspeed/reset.c
 create mode 100644 arch/arm/mach-aspeed/timer.c
 create mode 100644 board/aspeed/ast-g5/Kconfig
 create mode 100644 board/aspeed/ast-g5/Makefile
 create mode 100644 board/aspeed/ast-g5/ast-g5.c
 create mode 100644 board/aspeed/ast-g5/platform.S
 create mode 100644 board/aspeed/ast-g5/platform_armsim2.S
 create mode 100644 board/aspeed/ast-g5/platform_fpga.S
 create mode 100644 board/aspeed/ast-g5/platform_fpga_ecc.S
 create mode 100644 configs/ast_g5_defconfig
 create mode 100644 include/configs/ast-g5.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 6b65d8e76a46..d02d6034c8d5 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -745,6 +745,9 @@ config TARGET_THUNDERX_88XX
 	bool "Support ThunderX 88xx"
 	select OF_CONTROL
 
+config TARGET_AST_G5
+       bool "Support ast2500"
+       select CPU_ARM1176
 endchoice
 
 source "arch/arm/mach-at91/Kconfig"
@@ -882,6 +885,7 @@ source "board/vscom/baltos/Kconfig"
 source "board/woodburn/Kconfig"
 source "board/work-microwave/work_92105/Kconfig"
 source "board/zipitz2/Kconfig"
+source "board/aspeed/ast-g5/Kconfig"
 
 source "arch/arm/Kconfig.debug"
 
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index d51634584bf4..ac328abea5e7 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -42,6 +42,7 @@ PLATFORM_CPPFLAGS += $(arch-y) $(tune-y)
 
 # Machine directory name.  This list is sorted alphanumerically
 # by CONFIG_* macro name.
+machine-$(CONFIG_ARCH_ASPEED)		+= aspeed
 machine-$(CONFIG_ARCH_AT91)		+= at91
 machine-$(CONFIG_ARCH_BCM283X)		+= bcm283x
 machine-$(CONFIG_ARCH_DAVINCI)		+= davinci
diff --git a/arch/arm/cpu/arm1176/Makefile b/arch/arm/cpu/arm1176/Makefile
index cd6dc9c1304d..dcc9dcd141fe 100644
--- a/arch/arm/cpu/arm1176/Makefile
+++ b/arch/arm/cpu/arm1176/Makefile
@@ -12,3 +12,5 @@ obj- += dummy.o
 extra-y	= start.o
 
 obj-y += ../arm11/
+
+obj-$(if $(filter aspeed,$(SOC)),y) += aspeed/
diff --git a/arch/arm/cpu/arm1176/aspeed/Makefile b/arch/arm/cpu/arm1176/aspeed/Makefile
new file mode 100644
index 000000000000..6758fe8d3a50
--- /dev/null
+++ b/arch/arm/cpu/arm1176/aspeed/Makefile
@@ -0,0 +1,13 @@
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+# MA 02111-1307 USA
+#
+
+obj-y	+= cpu.o
diff --git a/arch/arm/cpu/arm1176/aspeed/cpu.c b/arch/arm/cpu/arm1176/aspeed/cpu.c
new file mode 100644
index 000000000000..f9b608a67d08
--- /dev/null
+++ b/arch/arm/cpu/arm1176/aspeed/cpu.c
@@ -0,0 +1,20 @@
+/*
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#include <common.h>
+#include <asm/io.h>
+
+int arch_cpu_init(void)
+{
+
+	return 0;
+}
diff --git a/arch/arm/cpu/arm1176/start.S b/arch/arm/cpu/arm1176/start.S
index a602d4e69374..c86e561223bb 100644
--- a/arch/arm/cpu/arm1176/start.S
+++ b/arch/arm/cpu/arm1176/start.S
@@ -35,6 +35,13 @@
  */
 
 	.globl reset
+#ifdef CONFIG_AST_SCURE_BOOT
+_ast_security_boot:
+	.word CONFIG_DSS_KEY_ADDR
+	.word CONFIG_SIMAGE_ADDR
+	.word CONFIG_SIMAGE_SIZE
+	.word CONFIG_SIGNATURE_ADDR
+#endif
 
 reset:
 	/*
diff --git a/arch/arm/include/asm/arch-aspeed/aspeed.h b/arch/arm/include/asm/arch-aspeed/aspeed.h
new file mode 100644
index 000000000000..556c280af261
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/aspeed.h
@@ -0,0 +1,43 @@
+/*
+ *  arch/arm/plat-aspeed/include/plat/aspeed.h
+ *
+ *  Copyright (C) 2012-2020  ASPEED Technology Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+#if defined(CONFIG_ARCH_AST3200) || defined(CONFIG_ARCH_AST2500) || defined(CONFIG_ARCH_AST1520)
+#define AST_SOC_G5
+#define NEW_VIC
+#define SRAM_SIZE 		SZ_32K
+#elif defined(CONFIG_ARCH_AST1400) || defined(CONFIG_ARCH_AST2400) || defined(CONFIG_ARCH_AST3100)
+#define AST_SOC_G4
+#define NEW_VIC
+#define SRAM_SIZE 		SZ_32K
+#elif defined(CONFIG_ARCH_AST1300) || defined(CONFIG_ARCH_AST2300) || defined(CONFIG_ARCH_AST1510)
+#define AST_SOC_G3
+#define NEW_VIC
+#define SRAM_SIZE 		SZ_16K
+#elif defined(CONFIG_ARCH_AST2150) || defined(CONFIG_ARCH_AST2200)
+#define AST_SOC_G2_5
+#elif defined(CONFIG_ARCH_AST1100) || defined(CONFIG_ARCH_AST2050) || defined(CONFIG_ARCH_AST2100)
+#define AST_SOC_G2
+#elif defined(CONFIG_ARCH_AST2000) || defined(CONFIG_ARCH_AST1000)
+#define AST_SOC_G1
+#elif defined(CONFIG_ARCH_AST1010)
+#define NEW_VIC
+#define SRAM_SIZE 		SZ_64K
+#else
+#error "Not define SoC generation"
+#endif
diff --git a/arch/arm/include/asm/arch-aspeed/ast-ahbc.h b/arch/arm/include/asm/arch-aspeed/ast-ahbc.h
new file mode 100644
index 000000000000..c00d8589d20e
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/ast-ahbc.h
@@ -0,0 +1,32 @@
+/********************************************************************************
+* File Name     : arch/arm/mach-aspeed/include/plat/ast-ahbc.h
+* Author        : Ryan Chen
+* Description   : AST SCU Service Header
+*
+* Copyright (C) 2012-2020  ASPEED Technology Inc.
+* This program is free software; you can redistribute it and/or modify
+* it under the terms of the GNU General Public License as published by the Free Software Foundation;
+* either version 2 of the License, or (at your option) any later version.
+* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
+* without even the implied warranty of MERCHANTABILITY or
+* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+* You should have received a copy of the GNU General Public License
+* along with this program; if not, write to the Free Software
+* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+*   History      :
+*      1. 2014/08/03 Ryan Chen create this file
+*
+********************************************************************************/
+
+#ifndef __AST_AHBC_H_INCLUDED
+#define __AST_AHBC_H_INCLUDED
+
+extern void ast_ahbc_boot_remap(void);
+
+#ifdef AST_SOC_G5
+extern void ast_ahbc_lpc_plus_mapping(u8 enable);
+extern void ast_ahbc_peie_mapping(u8 enable);
+#endif
+
+#endif
diff --git a/arch/arm/include/asm/arch-aspeed/ast-sdmc.h b/arch/arm/include/asm/arch-aspeed/ast-sdmc.h
new file mode 100644
index 000000000000..73cacb52cc13
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/ast-sdmc.h
@@ -0,0 +1,29 @@
+/********************************************************************************
+* File Name     : arch/arm/mach-aspeed/include/plat/ast-sdmc.h
+* Author        : Ryan Chen
+* Description   : AST SDMC Header
+*
+* Copyright (C) 2012-2020  ASPEED Technology Inc.
+* This program is free software; you can redistribute it and/or modify
+* it under the terms of the GNU General Public License as published by the Free Software Foundation;
+* either version 2 of the License, or (at your option) any later version.
+* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
+* without even the implied warranty of MERCHANTABILITY or
+* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+* You should have received a copy of the GNU General Public License
+* along with this program; if not, write to the Free Software
+* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+*   History      :
+*      1. 2012/08/03 Ryan Chen create this file
+*
+********************************************************************************/
+
+#ifndef __AST_SDMC_H_INCLUDED
+#define __AST_SDMC_H_INCLUDED
+
+extern u32 ast_sdmc_get_mem_size(void);
+extern u8 ast_sdmc_get_eec(void);
+extern u8 ast_sdmc_get_cache(void);
+
+#endif
diff --git a/arch/arm/include/asm/arch-aspeed/ast_g5_platform.h b/arch/arm/include/asm/arch-aspeed/ast_g5_platform.h
new file mode 100644
index 000000000000..6284ec8db0e2
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/ast_g5_platform.h
@@ -0,0 +1,191 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#ifndef _AST_G5_PLATFORM_H_
+#define _AST_G5_PLATFORM_H_                 1
+
+#ifdef CONFIG_AST_PCIE_EXT
+/*
+#define AST_PCI_EXT_ADC					(AST_PCIE_WIN_BASE + 0x2000)
+#define AST_PCI_EXT_PWM					(AST_PCIE_WIN_BASE + 0x3000)
+#define AST_PCI_EXT_GPIO					(AST_PCIE_WIN_BASE + 0x4000)
+*/
+#define AST_PCI_EXT_I2C					(AST_PCIE_WIN_BASE + 0x5000)
+#define AST_PCI_EXT_SCU					(AST_PCIE_WIN_BASE + 0x6000)
+#define AST_PCI_EXT_VIC					(AST_PCIE_WIN_BASE + 0x7000)
+
+#define AST_PCI_EXT_GPIO					(AST_PCIE_WIN_BASE + 0x10000)
+#define AST_PCI_EXT_UART1				(AST_PCIE_WIN_BASE + 0x13000)
+#define AST_PCI_EXT_UART0				(AST_PCIE_WIN_BASE + 0x14000)
+#define AST_PCI_EXT_UART2				(AST_PCIE_WIN_BASE + 0x1D000)
+#define AST_PCI_EXT_UART3				(AST_PCIE_WIN_BASE + 0x1E000)
+#define AST_PCI_EXT_UART4				(AST_PCIE_WIN_BASE + 0x1F000)
+
+#endif
+
+#define AST_DRAM_BASE					0x80000000
+
+#define AST_SRAM_SIZE					(SZ_32K)
+
+#define AST_AHBC_BASE					0x1E600000	/* AHB CONTROLLER */
+
+#define AST_FMC_BASE        				0x1E620000	/* NEW SMC CONTROLLER */
+#define AST_FMC_SPI0_BASE				0x1E630000	/* NEW SMC CONTROLLER */
+#define AST_FMC_SPI1_BASE				0x1E631000	/* NEW SMC CONTROLLER */
+
+#define AST_MIC_BASE						0x1E650000	/* Memory Integrity Check Controller */
+#define AST_MAC0_BASE					0x1E660000	/* MAC1 */
+#define AST_MAC1_BASE					0x1E680000	/* MAC2 */
+
+#define AST_VHUB_BASE					0x1E6A0000	/* USB 2.0 VIRTUAL HUB CONTROLLER */
+#define AST_EHCI0_BASE					0x1E6A1000	/* USB 2.0 HOST CONTROLLER */
+#define AST_UDC1_BASE					0x1E6A2000	/* USB 2.0 Device CONTROLLER */
+#define AST_EHCI1_BASE					0x1E6A3000	/* USB 2.0 HOST CONTROLLER */
+#define AST_UHCI_BASE					0x1E6B0000	/* USB 1.1 HOST CONTROLLER */
+#define AST_VIC_BASE						0x1E6C0000	/* VIC */
+#define AST_SDMC_BASE					0x1E6E0000	/* MMC SDRAM*/
+#define AST_HID_BASE						0x1E6E1000	/* USB 1.1 Controller */
+#define AST_SCU_BASE						0x1E6E2000	/* SCU */
+#define AST_CRYPTO_BASE					0x1E6E3000	/* Crypto */
+#define AST_JTAG_BASE					0x1E6E4000	/* JTAG */
+#define AST_I2S_BASE						0x1E6E5000	/* I2S */
+#define AST_CRT0_BASE					0x1E6E6000	/* CRT0 */
+#define AST_CRT1_BASE					0x1E6E6100	/* CRT1 */
+#define AST_CRT2_BASE					0x1E6E6200	/* CRT2 */
+#define AST_CRT3_BASE					0x1E6E6300	/* CRT3 */
+#define AST_XDMA_BASE					0x1E6E7000	/* XDMA */
+#define AST_MCTP_BASE					0x1E6E8000	/* MCTP */
+#define AST_ADC_BASE					0x1E6E9000	/* ADC */
+#define AST_ENTROPY_BASE				0x1E6EB000	/* Entropy  */
+#define AST_BULK_BASE					0x1E6EB100	/* Bulk Decoder	*/
+#define AST_CMDQ_BASE					0x1E6EB180	/* CMDQ */
+#define AST_BITBLT_BASE					0x1E6EB200	/* Bitblt	*/
+#define AST_RLE_BASE					0x1E6EB300	/* RLE	*/
+#define AST_EGFX_BASE					0x1E6EB400	/* EGFX	*/
+#define AST_VMASK_BASE					0x1E6EB600	/* VMASK	*/
+#define AST_GMASK_BASE					0x1E6EB680	/* GMASK	*/
+
+#define AST_EGFX_SYS_BASE				0x1E6EB700	/* EGFXSYS*/
+
+#define AST_LPC_PLUS_BASE				0x1E6EC000	/* LPC+ */
+#define AST_PCIE_PLDA_BASE				0x1E6ED000	/* PCIE PLDA Bridge */
+#define AST_ESPI_BASE						0x1E6EE000	/* e-SPI  */
+#define AST_BSRAM_BASE					0x1E6EF000	/* Battery Backup SRAM  */
+#define AST_P2X_BASE                      		0x1E6F0000	/* P2X */
+
+/* */
+
+#define AST_VIDEO_BASE              			0x1E700000	/* VIDEO ENGINE */
+#define AST_SRAM_BASE               			0x1E720000	/* SRAM */
+#define AST_SDHC_BASE					0x1E740000	/* SD */
+#define AST_2D_BASE						0x1E760000	/* 2D */
+#define AST_GPIO_BASE					0x1E780000	/* GPIO */
+#define AST_SGPIO_BASE					0x1E780200	/* SGPIO */
+#define AST_SGPIO_S_BASE				0x1E780300	/* SGPIO Slave*/
+#define AST_RTC_BASE						0x1E781000	/* RTC */
+#define AST_TIMER_BASE              			0x1E782000	/* TIMER #0~2*/
+#define AST_UART1_BASE              			0x1E783000	/* UART1 */
+#define AST_UART0_BASE              			0x1E784000	/* UART5 */
+#define AST_WDT_BASE                			0x1E785000	/* WDT */
+#define AST_PWM_BASE					0x1E786000	/* PWM */
+#define AST_VUART0_BASE					0x1E787000	/* VUART1 */
+#define AST_PUART_BASE					0x1E788000	/* PUART */
+#define AST_LPC_BASE						0x1E789000	/* LPC */
+#define AST_MBX_BASE					0x1E789200	/* Mailbox */
+#define AST_I2C_BASE						0x1E78A000	/* I2C */
+#define AST_PECI_BASE						0x1E78B000	/* PECI */
+#define AST_PCIARBITER_BASE			0x1E78C000	/* PCI ARBITER */
+#define AST_UART2_BASE					0x1E78D000	/* UART2 */
+#define AST_UART3_BASE					0x1E78E000	/* UART3 */
+#define AST_UART4_BASE					0x1E78F000	/* UART4 */
+#define AST_UART5_BASE					0x1E790000	/* UART6 */
+#define AST_UART6_BASE					0x1E791000	/* UART7 */
+#define AST_UART7_BASE					0x1E792000	/* UART8 */
+#define AST_UART8_BASE					0x1E793000	/* UART9 */
+#define AST_UART9_BASE					0x1E794000	/* UART10 */
+#define AST_UART10_BASE					0x1E795000	/* UART11 */
+#define AST_UART11_BASE					0x1E796000	/* UART12 */
+#define AST_UART12_BASE					0x1E797000	/* UART13 */
+#define AST_UART_SDMA_BASE			0x1E79E000	/* UART SDMA */
+
+#define AST_H264_BASE					0x1E7C0000	/* H.264 */
+#define AST_FORMATTER_BASE			0x1E7C2100	/* Formatter */
+
+
+#define AST_FMC_CS0_BASE				0x20000000	/* CS0 */
+#define AST_FMC_CS1_BASE				0x28000000	/* CS1 */
+#define AST_FMC_CS2_BASE				0x2a000000	/* CS2 */
+
+#define AST_SPI0_CS0_BASE				0x30000000	/* SPI 2 Flash CS 0 Memory */
+#define AST_SPI0_CS1_BASE				0x32000000	/* SPI 2 Flash CS 1 Memory */
+
+#define AST_SPI1_CS0_BASE				0x38000000	/* SPI 3 Flash CS 0 Memory */
+#define AST_SPI1_CS1_BASE				0x3a000000	/* SPI 3 Flash CS 1 Memory */
+
+#define AST_LPC_BRIDGE					0x60000000
+#define AST_LPC_PLUS_BRIDGE			0x70000000
+
+#define AST_PCIE_WIN_BASE				0x70000000
+#define AST_PCIE_WIN_SIZE				0x10000000
+
+#ifdef CONFIG_AST_VIDEO
+#define ASR_VIDEO_MEM_SIZE				0x2800000		//40MB
+#define ASR_VIDEO_MEM 					(AST_DRAM_BASE + (SZ_8M*10))//(AST_DRAM_BASE + SZ_256M)
+
+#define AST_CRT0_MEM_SIZE				SZ_8M
+#define AST_CRT0_MEM_BASE				(ASR_VIDEO_MEM + ASR_VIDEO_MEM_SIZE)
+#else
+
+#define AST_CRT0_MEM_SIZE				SZ_8M
+#define AST_CRT0_MEM_BASE				(AST_DRAM_BASE + 0x8000000)		//from 128M
+#endif
+
+#define AST_CURSOR0_MEM_SIZE			SZ_1M
+#define AST_CURSOR0_MEM_BASE			(AST_CRT0_MEM_BASE + AST_CRT0_MEM_SIZE)
+
+#define AST_CRT1_MEM_SIZE				SZ_8M
+#define AST_CRT1_MEM_BASE				(AST_CURSOR0_MEM_BASE + AST_CURSOR0_MEM_SIZE)
+
+#define AST_CRT2_MEM_SIZE				SZ_8M
+#define AST_CRT2_MEM_BASE				(AST_CRT1_MEM_BASE + AST_CRT1_MEM_SIZE)
+
+#define AST_CRT3_MEM_SIZE				SZ_8M
+#define AST_CRT3_MEM_BASE				(AST_CRT2_MEM_BASE + AST_CRT2_MEM_SIZE)
+
+#define AST_BULK_STREAM_MEM_SIZE		SZ_8M	//4Mb for bulk , 4Mb for history
+#define AST_BULK_STREAM_MEM_BASE		(AST_CRT3_MEM_BASE + AST_CRT3_MEM_SIZE)
+
+#define AST_GRAPHIC_STREAM_MEM_SIZE	SZ_8M	//4Mb for bulk , 4Mb for history
+#define AST_GRAPHIC_STREAM_MEM_BASE	(AST_BULK_STREAM_MEM_BASE + AST_BULK_STREAM_MEM_SIZE)
+
+#define AST_ENTROPY_MEM_SIZE			SZ_4M
+#define AST_ENTROPY_MEM_BASE 			(AST_GRAPHIC_STREAM_MEM_BASE + AST_GRAPHIC_STREAM_MEM_SIZE)
+
+#define AST_CMDQ_MEM_SIZE				SZ_2M
+#define AST_CMDQ_MEM_BASE 			(AST_ENTROPY_MEM_BASE + AST_ENTROPY_MEM_SIZE)
+
+#define AST_VMASK_MEM_SIZE			SZ_1M
+#define AST_VMASK_MEM_BASE 			(AST_CMDQ_MEM_BASE + AST_CMDQ_MEM_SIZE)
+
+#define AST_GMASK_MEM_SIZE			SZ_1M
+#define AST_GMASK_MEM_BASE 			(AST_VMASK_MEM_BASE + AST_VMASK_MEM_SIZE)
+
+#define AST_H264_MEM_SIZE				0x1100000 		//11MB : BS 8MB + fifo 3 * 3MB
+#define AST_H264_MEM_BASE 				(AST_GMASK_MEM_BASE + AST_GMASK_MEM_SIZE)
+
+#define AST_FORMATTER_MEM_SIZE		0xC00000 			//12MB
+#define AST_FORMATTER_MEM_BASE 		(AST_H264_MEM_BASE + AST_H264_MEM_SIZE)
+#endif
diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
new file mode 100644
index 000000000000..f961f4c289a3
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
@@ -0,0 +1,116 @@
+/********************************************************************************
+* File Name     : arch/arm/mach-aspeed/include/plat/ast-scu.h
+* Author        : Ryan Chen
+* Description   : AST SCU Service Header
+*
+* Copyright (C) 2012-2020  ASPEED Technology Inc.
+* This program is free software; you can redistribute it and/or modify
+* it under the terms of the GNU General Public License as published by the Free Software Foundation;
+* either version 2 of the License, or (at your option) any later version.
+* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
+* without even the implied warranty of MERCHANTABILITY or
+* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+* You should have received a copy of the GNU General Public License
+* along with this program; if not, write to the Free Software
+* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+*   History      :
+*      1. 2012/08/03 Ryan Chen create this file
+*
+********************************************************************************/
+
+#ifndef __AST_SCU_H_INCLUDED
+#define __AST_SCU_H_INCLUDED
+
+//information
+extern void ast_scu_show_system_info (void);
+extern void ast_scu_sys_rest_info(void);
+extern void ast_scu_security_info(void);
+extern u32 ast_scu_revision_id(void);
+extern u32 ast_scu_get_phy_interface(u8 mac_num);
+extern u32 ast_scu_get_phy_config(u8 mac_num);
+extern u32 ast_scu_get_vga_memsize(void);
+extern void ast_scu_get_who_init_dram(void);
+
+//CLK
+extern void ast_scu_uart_div(void);
+extern u32 ast_get_clk_source(void);
+extern u32 ast_get_h_pll_clk(void);
+extern u32 ast_get_ahb_div(void);
+
+extern u32 ast_get_m_pll_clk(void);
+extern u32 ast_get_ahbclk(void);
+
+extern u32 ast_get_pclk(void);
+extern u32 ast_get_sd_clock_src(void);
+extern u32 ast_get_d2_pll_clk(void);
+extern void ast_set_d2_pll_clk(u32 pll_setting);
+
+extern u32 ast_get_lhclk(void);
+
+extern void ast_scu_set_vga_display(u8 enable);
+extern u8 ast_scu_get_vga_display(void);
+
+extern u32 ast_scu_get_vga_memsize(void);
+
+//Ctrl Initial
+extern void ast_scu_init_uart(u8);
+extern void ast_scu_init_video(u8 dynamic_en);
+extern void ast_scu_reset_video(void);
+extern void ast_scu_init_eth(u8 num);
+extern void ast_scu_init_lpc(void);
+extern u8 ast_scu_get_lpc_plus_enable(void);
+extern void ast_scu_init_usb_port1(void);
+extern void ast_scu_init_usb_port2(void);
+extern void ast_scu_init_uhci(void);
+extern void ast_scu_init_sdhci(void);
+extern void ast_scu_init_i2c(void);
+extern void ast_scu_init_pwm_tacho(void);
+extern void ast_scu_init_adc(void);
+extern void ast_scu_init_mctp(void);
+extern void ast_scu_init_pcie(void);
+extern void ast_scu_init_xdma(void);
+extern void ast_scu_init_peci(void);
+extern void ast_scu_init_jtag(void);
+extern void ast_scu_init_rfx(void);
+extern void ast_scu_init_h264(void);
+extern void ast_scu_set_crt_source(u8 dac_soource);
+extern void ast_scu_init_crt(void);
+extern void ast_scu_init_hace(void);
+extern void ast_scu_uartx_init(void);
+extern void ast_scu_spi_master(u8 mode);
+
+//Share pin
+extern void ast_scu_multi_func_uart(u8 uart);
+extern void ast_scu_multi_func_video(void);
+extern void ast_scu_multi_func_eth(u8 num);
+
+extern void ast_scu_multi_func_nand(void);
+
+extern void ast_scu_multi_func_nor(void);
+
+extern void ast_scu_multi_func_romcs(u8 num);
+
+extern void ast_scu_multi_func_i2c(void);
+extern void ast_scu_multi_func_pwm_tacho(void);
+//0 : usb 1.1 hid controller, 1:usb 2.0 device controller, 2:usb 2.0 host2 controller
+extern void ast_scu_multi_func_usb_port1_mode(u8 mode);
+//0 : hub mode , 1: usb host mode
+extern void ast_scu_multi_func_usb_port2_mode(u8 mode);
+//0 : gpioQ6,7 mode , 1: usb1.1 host port 4 mode
+extern void ast_scu_multi_func_usb_port34_mode(u8 mode);
+
+extern void ast_scu_multi_func_sdhc_8bit_mode(void);
+extern void ast_scu_multi_func_sdhc_slot(u8 slot);
+extern void ast_scu_multi_func_crt(void);
+
+extern void ast_scu_multi_nic_switch(u8 enable);
+extern void ast_scu_multi_func_sgpio(void);
+
+extern void ast_scu_hw_random_enable(u8 enable);
+extern u32 ast_scu_hw_random_read(void);
+extern u8 ast_scu_get_hw_random_type(void);
+extern void ast_scu_set_hw_random_type(u8 type);
+extern u8 ast_scu_adc_trim_read(void);
+
+#endif
diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
new file mode 100644
index 000000000000..2f5597d99f57
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/platform.h
@@ -0,0 +1,54 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#ifndef _AST_PLATFORM_H_
+#define _AST_PLATFORM_H_                 1
+
+#include <asm/arch/aspeed.h>
+
+#define AST_PLL_25MHZ			25000000
+#define AST_PLL_24MHZ			24000000
+#define AST_PLL_12MHZ			12000000
+
+/*********************************************************************************/
+#if defined(CONFIG_ARCH_AST1520)
+#include <asm/arch/ast1520_platform.h>
+#elif defined(CONFIG_ARCH_AST2000)
+#include <asm/arch/ast2000_platform.h>
+#elif defined(CONFIG_ARCH_AST2100)
+#include <asm/arch/ast2100_platform.h>
+#elif defined(CONFIG_ARCH_AST2200)
+#include <asm/arch/ast2200_platform.h>
+#elif defined(CONFIG_ARCH_AST2300)
+#include <asm/arch/ast2300_platform.h>
+#elif defined(CONFIG_ARCH_AST2400)
+#include <asm/arch/ast2400_platform.h>
+#elif defined(AST_SOC_G5)
+#include <asm/arch/ast_g5_platform.h>
+#elif defined(CONFIG_ARCH_AST1010)
+#include <asm/arch/ast1010_platform.h>
+#else
+#err "No define for platform.h"
+#endif
+
+/*********************************************************************************/
+/* Companion Base Address */
+#if defined(CONFIG_ARCH_AST1070)
+#include <asm/arch/ast1070_platform.h>
+#endif
+/*********************************************************************************/
+
+#endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-ahbc.h b/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
new file mode 100644
index 000000000000..08d9f65703ca
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/regs-ahbc.h
@@ -0,0 +1,41 @@
+/* arch/arm/mach-aspeed/include/mach/regs-ahbc.h
+ *
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *   History      :
+ *    1. 2012/12/29 Ryan Chen Create
+ *
+********************************************************************************/
+#ifndef __AST_AHBC_H
+#define __AST_AHBC_H                     1
+
+#include <asm/arch/aspeed.h>
+
+/* Register for AHBC */
+#define AST_AHBC_PROTECT			0x00		/*	Protection Key Register 	*/
+
+
+#define AST_AHBC_PRIORITY_CTRL		0x80		/*	Priority Cortrol Register */
+
+#define AST_AHBC_ADDR_REMAP		0x8C		/*	Address Remapping Register */
+
+/*	AST_AHBC_PROTECT			0x00		Protection Key Register 	*/
+#define AHBC_PROTECT_UNLOCK		0xAEED1A03
+
+/*	AST_AHBC_ADDR_REMAP		0x8C		Address Remapping Register */
+#define AHBC_PCI_REMAP1			(1 << 5)
+#define AHBC_PCI_REMAP0			(1 << 4)
+
+#if defined(AST_SOC_G5)
+#define AHBC_PCIE_MAP				(1 << 5)
+#define AHBC_LPC_PLUS_MAP			(1 << 4)
+#else
+#define AHBC_BOOT_REMAP			1
+#endif
+
+
+#endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
new file mode 100644
index 000000000000..e54fb87b2baf
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -0,0 +1,1049 @@
+/* arch/arm/mach-aspeed/include/mach/regs-scu.h
+ *
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *   History      :
+ *    1. 2012/12/29 Ryan Chen Create
+ *
+********************************************************************************/
+#ifndef __AST_SCU_H
+#define __AST_SCU_H                     1
+
+#include <asm/arch/aspeed.h>
+/*
+ *  Register for SCU
+ *  */
+#define AST_SCU_PROTECT				0x00		/*	protection key register	*/
+#define AST_SCU_RESET				0x04		/*	system reset control register */
+#define AST_SCU_RESET2				0xD4		/*	Reset Control register set 2*/
+#define AST_SCU_CLK_SEL				0x08		/*	clock selection register	*/
+#define AST_SCU_CLK_SEL2			0xD8		/*	clock selection register Set 2*/
+#define AST_SCU_CLK_STOP			0x0C		/*	clock stop control register	*/
+#define AST_SCU_CLK_STOP2			0xDC		/*	clock stop control register set 2*/
+#define AST_SCU_COUNT_CTRL			0x10		/*	frequency counter control register	*/
+#define AST_SCU_COUNT_VAL			0x14		/*	frequency counter measure register 	*/
+#define AST_SCU_INTR_CTRL			0x18		/*	Interrupt control and status register	*/
+#define AST_SCU_D2_PLL				0x1C		/*	D2-PLL Parameter  register	*/
+#define AST_SCU_D2_PLL_EXTEND		0x13C 		/*	D2-PLL Extender Parameter  register */
+#define AST_SCU_M_PLL				0x20		/*	M-PLL Parameter register		*/
+#define AST_SCU_H_PLL				0x24		/*	H-PLL Parameter register		*/
+#define AST_SCU_MH_PLL_EXTEND		0x148		/*	Extended Parameter of M/H-PLL register */
+#ifdef AST_SOC_G5
+#define AST_SCU_D_PLL				0x28		/*	D-PLL Parameter  register	*/
+#define AST_SCU_D_PLL_EXTEND0		0x130		/*	D-PLL Extended Parameter  register	*/
+#define AST_SCU_D_PLL_EXTEND1		0x134		/*	D-PLL Extended Parameter  register	*/
+#define AST_SCU_D_PLL_EXTEND2		0x138		/*	D-PLL Extended Parameter  register	*/
+#else
+#define AST_SCU_FREQ_LIMIT			0x28		/*	frequency counter comparsion register */
+#endif
+#define AST_SCU_MISC1_CTRL			0x2C		/*	Misc. Control register */
+#define AST_SCU_PCI_CONF1			0x30		/*	PCI configuration setting register#1 */
+#define AST_SCU_PCI_CONF2			0x34		/*	PCI configuration setting register#2 */
+#define AST_SCU_PCI_CONF3			0x38		/*	PCI configuration setting register#3 */
+#define AST_SCU_SYS_CTRL			0x3C		/*	System reset contrl/status register*/
+#define AST_SCU_SOC_SCRATCH0		0x40		/*	SOC scratch 0~31 register */
+#define AST_SCU_SOC_SCRATCH1		0x44		/*	SOC scratch 32~63 register */
+#define AST_SCU_VGA0				0x40		/*	VGA fuction handshake register */
+#define AST_SCU_VGA1				0x44		/*	VGA fuction handshake register */
+#define AST_SCU_MAC_CLK				0x48		/*	MAC interface clock delay setting register */
+#define AST_SCU_MISC2_CTRL			0x4C		/*	Misc. 2 Control register */
+#define AST_SCU_VGA_SCRATCH0		0x50		/*	VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH1		0x54		/*	VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH2		0x58		/*	VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH3		0x5c		/*	VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH4		0x60		/*	VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH5		0x64		/*	VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH6		0x68		/*	VGA Scratch register */
+#define AST_SCU_VGA_SCRATCH7		0x6c		/*	VGA Scratch register */
+#define AST_SCU_HW_STRAP1			0x70		/*	hardware strapping register */
+#define AST_SCU_RAMDOM_GEN			0x74		/*	random number generator register */
+#if defined(CONFIG_ARCH_AST1100) || defined(CONFIG_ARCH_AST2050) || defined(CONFIG_ARCH_AST2100) || defined(CONFIG_ARCH_AST2200)
+#define AST_SCU_MULTI_FUNC_2		0x78
+#else
+#define AST_SCU_RAMDOM_DATA			0x78		/*	random number generator data output*/
+#endif
+#define AST_SCU_REVISION_ID			0x7C		/*	Silicon revision ID register */
+#define AST_SCU_FUN_PIN_CTRL1		0x80		/*	Multi-function Pin Control#1*/
+#define AST_SCU_FUN_PIN_CTRL2		0x84		/*	Multi-function Pin Control#2*/
+#define AST_SCU_FUN_PIN_CTRL3		0x88		/*	Multi-function Pin Control#3*/
+#define AST_SCU_FUN_PIN_CTRL4		0x8C		/*	Multi-function Pin Control#4*/
+#define AST_SCU_FUN_PIN_CTRL5		0x90		/*	Multi-function Pin Control#5*/
+#define AST_SCU_FUN_PIN_CTRL6		0x94		/*	Multi-function Pin Control#6*/
+#define AST_SCU_WDT_RESET			0x9C		/*	Watchdog Reset Selection */
+#define AST_SCU_FUN_PIN_CTRL7		0xA0		/*	Multi-function Pin Control#7*/
+#define AST_SCU_FUN_PIN_CTRL8		0xA4		/*	Multi-function Pin Control#8*/
+#define AST_SCU_FUN_PIN_CTRL9		0xA8		/*	Multi-function Pin Control#9*/
+#define AST_SCU_MAC_CLK_DELAY_100M	0xB8		/*	MAC interface clock delay 100M setting*/
+#define AST_SCU_MAC_CLK_DELAY_10M		0xBC		/*	MAC interface clock delay 10M setting*/
+#define AST_SCU_PWR_SAVING_EN		0xC0		/*	Power Saving Wakeup Enable*/
+#define AST_SCU_PWR_SAVING_CTRL		0xC4		/*	Power Saving Wakeup Control*/
+#define AST_SCU_HW_STRAP2			0xD0		/*	Haardware strapping register set 2*/
+#define AST_SCU_COUNTER4			0xE0		/*	SCU Free Run Counter Read Back #4*/
+#define AST_SCU_COUNTER4_EXT		0xE4		/*	SCU Free Run Counter Extended Read Back #4*/
+
+#if defined(CONFIG_ARCH_AST1010)
+#define AST_SCU_CPU_BASE0_ADDR      0x100       /*   CPU Base Address for Segment 0x20:0000~0x2F:FFFF*/
+#define AST_SCU_CPU_BASE1_ADDR		0x104		/*	CPU Base Address for Segment 0x30:0000~0x3F:FFFF*/
+#define AST_SCU_CPU_BASE2_ADDR		0x108		/*	CPU Base Address for Segment 0x40:0000~0x4F:FFFF*/
+#define AST_SCU_CPU_BASE3_ADDR		0x10C		/*	CPU Base Address for Segment 0x50:0000~0x5F:FFFF*/
+#define AST_SCU_CPU_BASE4_ADDR		0x110		/*	CPU Base Address for Segment 0x60:0000~0x6F:FFFF*/
+#define AST_SCU_CPU_BASE5_ADDR		0x114		/*	CPU Base Address for Segment 0x70:0000~0x7F:FFFF*/
+#define AST_SCU_CPU_BASE6_ADDR      0x118   	/*   CPU Base Address for Segment 0x80:0000~0xFF:FFFF*/
+#define AST_SCU_CPU_CACHE_CTRL		0x11C		/*	CPU Cache Function Control*/
+#else
+//CPU 2
+#define AST_SCU_CPU2_CTRL			0x100		/*	CPU2 Control Register*/
+#define AST_SCU_CPU2_BASE0_ADDR		0x104		/*	CPU2 Base Address for Segment 0x00:0000~0x1F:FFFF*/
+#define AST_SCU_CPU2_BASE1_ADDR		0x108		/*	CPU2 Base Address for Segment 0x20:0000~0x3F:FFFF*/
+#define AST_SCU_CPU2_BASE2_ADDR		0x10C		/*	CPU2 Base Address for Segment 0x40:0000~0x5F:FFFF*/
+#define AST_SCU_CPU2_BASE3_ADDR		0x110		/*	CPU2 Base Address for Segment 0x60:0000~0x7F:FFFF*/
+#define AST_SCU_CPU2_BASE4_ADDR		0x114		/*	CPU2 Base Address for Segment 0x80:0000~0xFF:FFFF*/
+#define AST_SCU_CPU2_CACHE_CTRL		0x118		/*	CPU2 Cache Function Control */
+#endif
+//
+
+#define AST_SCU_DPLL_PAR0				0x130
+#define AST_SCU_DPLL_PAR1				0x134
+#define AST_SCU_DPLL_PAR2				0x138
+
+#define AST_SCU_OTP0				0x150
+#define AST_SCU_OTP1				0x154
+#define AST_SCU_OTP2				0x158
+#define AST_SCU_OTP3				0x15C
+
+#define AST_SCU_UART24_REF			0x160		/*	Generate UART 24Mhz Ref from H-PLL when CLKIN is 25Mhz */
+#define AST_SCU_PCIE_CONFIG_SET		0x180		/*	PCI-E Configuration Setting Control Register */
+#define AST_SCU_BMC_MMIO_DEC		0x184		/*	BMC MMIO Decode Setting Register */
+#define AST_SCU_DEC_AREA1			0x188		/*	1st relocated controller decode area location */
+#define AST_SCU_DEC_AREA2			0x18C		/*	2nd relocated controller decode area location */
+#define AST_SCU_MBOX_DEC_AREA		0x190		/*	Mailbox decode area location*/
+#define AST_SCU_SRAM_DEC_AREA0		0x194		/*	Shared SRAM area decode location*/
+#define AST_SCU_SRAM_DEC_AREA1		0x198		/*	Shared SRAM area decode location*/
+#define AST_SCU_BMC_CLASS			0x19C		/*	BMC device class code and revision ID */
+#define AST_SCU_BMC_DEV_ID			0x1A4		/*	BMC device ID */
+
+#define AST_SCU_MAC_CLK_DUTY		0x1DC		/*	Clock Duty Selection */
+
+
+/*	AST_SCU_PROTECT: 0x00  - protection key register */
+#define SCU_PROTECT_UNLOCK			0x1688A8A8
+
+/*	AST_SCU_RESET :0x04	 - system reset control register */
+#if defined (CONFIG_ARCH_AST1010)
+#define SCU_RESET_ADC				(0x1 << 6)
+#define SCU_RESET_JTAG				(0x1 << 5)
+#define SCU_RESET_MAC0				(0x1 << 4)
+#define SCU_RESET_PECI				(0x1 << 3)
+#define SCU_RESET_PWM				(0x1 << 2)
+#define SCU_RESET_LPC				(0x1 << 1)
+#define SCU_RESET_I2C				(0x1)
+#else
+#define SCU_RESET_H264				(0x1 << 26)
+#define SCU_RESET_XDMA				(0x1 << 25)
+#define SCU_RESET_MCTP				(0x1 << 24)
+#define SCU_RESET_P2X				(0x1 << 24)
+#define SCU_RESET_ADC				(0x1 << 23)
+#define SCU_RESET_JTAG				(0x1 << 22)
+#ifdef AST_SOC_G5
+#define SCU_RESET_PCIE_DIR			(0x1 << 21)
+#define SCU_RESET_PCIE				(0x1 << 19)
+#else
+#define SCU_PWAKE_PIN_EN			(0x1 << 20)
+#define SCU_PWAKE_PIN_OUT			(0x1 << 19)
+#endif
+#define SCU_RESET_MIC				(0x1 << 18)
+#define SCU_RESET_RFX				(0x1 << 17)
+#define SCU_RESET_SD				(0x1 << 16)
+#define SCU_RESET_USB11				(0x1 << 15)
+#define SCU_RESET_USB20				(0x1 << 14)
+#define SCU_RESET_CRT				(0x1 << 13)
+#define SCU_RESET_MAC1				(0x1 << 12)
+#define SCU_RESET_MAC0				(0x1 << 11)
+#define SCU_RESET_PECI				(0x1 << 10)
+#define SCU_RESET_PWM				(0x1 << 9)
+#define SCU_PCI_VGA_DIS				(0x1 << 8)
+#define SCU_RESET_2D				(0x1 << 7)
+#define SCU_RESET_VIDEO				(0x1 << 6)
+#define SCU_RESET_LPC				(0x1 << 5)
+#define SCU_RESET_HACE				(0x1 << 4)
+#define SCU_RESET_USB_P1			(0x1 << 3)
+#define SCU_RESET_I2C				(0x1 << 2)
+#define SCU_RESET_AHB				(0x1 << 1)
+#define SCU_RESET_SRAM_CTRL			(0x1 << 0)
+#endif
+
+/* AST_SCU_RESET2				0xD4		Reset Control register set 2	*/
+#define SCU_RESET_CRT3				(0x1 << 8)
+#define SCU_RESET_CRT2				(0x1 << 7)
+#define SCU_RESET_CRT1				(0x1 << 6)
+#define SCU_RESET_CRT0				(0x1 << 5)
+#define SCU_RESET_NIC1				(0x1 << 4)
+#define SCU_RESET_NIC0				(0x1 << 3)
+#define SCU_RESET_RFXDEC			(0x1 << 2)
+#define SCU_RESET_BITBLT				(0x1 << 1)
+#define SCU_RESET_RFXCMQ			(0x1)
+
+/*	AST_SCU_CLK_SEL	 : 0x08 - clock selection register	*/
+#if defined(CONFIG_ARCH_AST1010)
+#define SCU_CLK_MAC_DIV(x)			(x << 12)
+#define SCU_CLK_MAC_MASK			(0x3 << 12)
+#define SCU_LHCLK_SOURCE_EN			(0x1 << 11)		//0: ext , 1:internel
+#define SCU_LHCLK_LPC_DIV(x)		(x << 8)
+#define SCU_LHCLK_LPC_MASK			(0x7 << 8)
+#define SCU_PCLK_APB_DIV(x)			(x << 5)
+#define SCU_GET_PCLK_DIV(x)			((x >> 5) & 0x7)
+#define SCU_PCLK_APB_DIV_MASK		(0x7 << 5)		//limitation on PCLK .. PCLK > 0.5*LCLK (33Mhz)
+#define SCU_CLK_CPU_AHB_SLOW_EN		(0x1 << 4)
+#define SCU_CLK_CPU_AHB_SLOW(x)		(x << 3)
+#define SCU_CLK_CPU_AHB_SLOW_MASK	(0x3 << 3)
+#define SCU_GET_AHB_DIV(x)			((x >> 2) & 0x3)
+#define SCU_CLK_CPU_AHB_SLOW_IDLE	(0x1 << 1)
+#define SCU_CLK_CPU_AHB_DYN_SLOW_EN	(0x1)
+#else
+#define SCU_CLK_VIDEO_SLOW_EN		(0x1 << 31)
+//G5 the same with RemoteFX EPDEC
+#define SCU_CLK_VIDEO_SLOW_SET(x)	(x << 28)
+#define SCU_CLK_VIDEO_SLOW_MASK		(0x7 << 28)
+#define SCU_CLK_2D_ENG_GCLK_INVERT	(0x1 << 27)		//valid only at CRT mode SCU2C[7]
+#define SCU_CLK_2D_ENG_THROT_EN		(0x1 << 26)		//valid only at CRT mode SCU2C[7]
+#define SCU_PCLK_APB_DIV(x)			(x << 23)
+#define SCU_GET_PCLK_DIV(x)			((x >> 23) & 0x7)
+#define SCU_PCLK_APB_DIV_MASK		(0x7 << 23)		//limitation on PCLK .. PCLK > 0.5*LCLK (33Mhz)
+#define SCU_GET_LHCLK_DIV(x)		((x >> 20) & 0x7)
+#define SCU_SET_LHCLK_DIV(x)		(x << 20)
+#define SCU_LHCLK_DIV_MASK			(0x7 << 20)
+#define SCU_LHCLK_SOURCE_EN			(0x1 << 19)		//0: ext , 1:internel
+#define SCU_CLK_MAC_DIV(x)			(x << 16)
+#define SCU_CLK_MAC_MASK			(0x7 << 16)
+#define SCU_CLK_SD_EN				(0x1 << 15)
+#define SCU_CLK_VIDE0_SO_D2			(0x1 << 8)
+#define SCU_CLK_SD_DIV(x)			(x << 12)
+#define SCU_CLK_SD_GET_DIV(x)		((x >> 12) & 0x7)
+#define SCU_CLK_SD_MASK				(0x7 << 12)
+#if defined(AST_SOC_G5)
+#define SCU_CRT_CLK_L_SOURCE			(0x1 << 8)
+#else
+#define SCU_CLK_VIDEO_DELAY(x)		(x << 8)
+#define SCU_CLK_VIDEO_DELAY_MASK	(0xf << 8)
+#endif
+#define SCU_CLK_CPU_AHB_SLOW_EN		(0x1 << 7)
+#define SCU_CLK_CPU_AHB_SLOW(x)		(x << 4)
+#define SCU_CLK_CPU_AHB_SLOW_MASK	(0x7 << 4)
+#define SCU_GET_AHB_SLOW_DIV(x)		((x >> 4) & 0x7)
+#define SCU_ECLK_SOURCE(x)			(x << 2)
+#define SCU_ECLK_SOURCE_MASK		(0x3 << 2)
+#define SCU_CLK_CPU_AHB_SLOW_IDLE	(0x1 << 1)
+#define SCU_CLK_CPU_AHB_DYN_SLOW_EN	(0x1 << 0)
+#endif
+
+/*	AST_SCU_CLK_SEL2	: 0xD8 - clock selection register Set 2	*/
+#define SCU_VIDEO4_OUTPUT_CLK_INVERT			(1 << 29)
+#define SCU_VIDEO4_OUTPUT_CLK_DELAY(x)			(x << 24)
+#define SCU_VIDEO4_OUTPUT_CLK_DELAY_MASK	(0x1f << 24)
+#define SCU_VIDEO3_OUTPUT_CLK_INVERT			(1 << 23)
+#define SCU_VIDEO3_OUTPUT_CLK_DELAY(x)			(x << 18)
+#define SCU_VIDEO3_OUTPUT_CLK_DELAY_MASK	(0x1f << 18)
+#define SCU_VIDEO2_OUTPUT_CLK_INVERT			(1 << 17)
+#define SCU_VIDEO2_OUTPUT_CLK_DELAY(x)			(x << 12)
+#define SCU_VIDEO2_OUTPUT_CLK_DELAY_MASK	(0x1f << 12)
+#define SCU_VIDEO1_OUTPUT_CLK_INVERT			(1 << 11)
+#define SCU_VIDEO1_OUTPUT_CLK_DELAY(x)			(x << 6)
+#define SCU_VIDEO1_OUTPUT_CLK_DELAY_MASK	(0x1f << 6)
+#define SCU_GET_H264CLK_DIV(x)					((x & 0x7) >> 3)
+#define SCU_SET_H264CLK_DIV(x)					(x << 3)
+#define SCU_H264CLK_MASK						(7 << 3)
+#define SCU_GET_BCLK_DIV(x)						(x & 0x7)
+#define SCU_SET_BCLK_DIV(x)						(x)
+
+
+/*	AST_SCU_CLK_STOP : 0x0C - clock stop control register	*/
+#if defined(CONFIG_ARCH_AST1010)
+#define SCU_LHCLK_STOP_EN			(0x1 << 7)
+#define SCU_MAC0CLK_STOP_EN			(0x1 << 6)
+#define SCU_UART3_CLK_STOP_EN		(0x1 << 5)
+#define SCU_UART2_CLK_STOP_EN		(0x1 << 4)
+#define SCU_UART1_CLK_STOP_EN		(0x1 << 3)
+#define SCU_LCLK_STOP_EN			(0x1 << 2)
+#define SCU_REFCLK_STOP_EN			(0x1 << 1)
+#define SCU_MCLK_STOP_EN			(0x1)
+#else
+#define SCU_LHCLK_STOP_EN			(0x1 << 28)
+#define SCU_SDCLK_STOP_EN			(0x1 << 27)
+#define SCU_UART4CLK_STOP_EN		(0x1 << 26)
+#define SCU_UART3CLK_STOP_EN		(0x1 << 25)
+#define SCU_RSACLK_STOP_EN			(0x1 << 24)
+//bit 23 must keep 1
+#define SCU_H264_STOP_EN			(0x1 << 22)
+#define SCU_MAC1CLK_STOP_EN		(0x1 << 21)
+#define SCU_MAC0CLK_STOP_EN		(0x1 << 20)
+//bit 19 must keep 1
+#if defined(AST_SOC_G5)
+#define SCU_ESPI_CLK_STOP_EN		(0x1 << 19)
+#endif
+
+#define SCU_RFX_CLK_STOP_EN		(0x1 << 18)
+#define SCU_UART5CLK_STOP_EN		(0x1 << 17)
+#define SCU_UART2CLK_STOP_EN		(0x1 << 16)
+#define SCU_UART1CLK_STOP_EN		(0x1 << 15)
+#define SCU_USB20_PHY_CLK_EN		(0x1 << 14)
+#define SCU_YCLK_STOP_EN			(0x1 << 13)
+#define SCU_D2CLK_STOP_EN			(0x1 << 10)
+#define SCU_USB11CLK_STOP_EN		(0x1 << 9)
+#define SCU_LCLK_STOP_EN			(0x1 << 8)
+#define SCU_USB_P1_STOP_EN			(0x1 << 7)
+#define SCU_REFCLK_STOP_EN			(0x1 << 6)
+#define SCU_DCLK_STOP_EN			(0x1 << 5)
+#define SCU_SACLK_STOP_EN			(0x1 << 4)
+#define SCU_VCLK_STOP_EN			(0x1 << 3)
+#define SCU_VCLK_STOP_EN			(0x1 << 3)
+#define SCU_MCLK_STOP_EN			(0x1 << 2)
+#define SCU_GCLK_STOP_EN			(0x1 << 1)
+#define SCU_ECLK_STOP_EN			(0x1 << 0)
+#endif
+
+/* AST_SCU_CLK_STOP2	: 0xDC - clock stop control register set 2*/
+#define SCU_NIC2_STOP_EN			(0x1 << 10)
+#define SCU_NIC1_STOP_EN			(0x1 << 9)
+#define SCU_CMQCLK_STOP			(0x1 << 8)
+#define SCU_RFXCLK_STOP				(0x1 << 7)
+#define SCU_BITBLTCLK_STOP			(0x1 << 6)
+/* bit 6*/
+#define SCU_UART_DIV13				(0x1 << 4)
+#define SCU_UARTXCLK_STOP			(0x1 << 3)
+#define SCU_D4CLK_STOP				(0x1 << 2)
+#define SCU_D3CLK_STOP				(0x1 << 1)
+#define SCU_D2CLK_STOP				(0x1)
+
+/* AST_SCU_COUNT_CTRL : 0x10 - frequency counter control register	*/
+#if defined(AST_SOC_G5)
+#define SCU_OSC_OUT_EN				(0x1 << 8)
+#endif
+#define SCU_FREQ_COMP_RESULT			(0x1 << 7)
+#define SCU_FREQ_MEASU_FINISH			(0x1 << 6)
+#define SCU_FREQ_SOURCE_FOR_MEASU(x)	(x << 2)
+#define SCU_FREQ_SOURCE_FOR_MEASU_MASK	(0xf << 2)
+
+#if defined(AST_SOC_G5)
+#define SCU_SOURCE_PCLK					0xf
+#define SCU_SOURCE_VPACLK				0xe
+#define SCU_SOURCE_VPBCLK				0xd
+#define SCU_SOURCE_12M					0xc
+#define SCU_SOURCE_LCLK					0xb
+#define SCU_SOURCE_GRCLK				0xa
+#define SCU_SOURCE_HCLK					0x9
+#define SCU_SOURCE_MCLK					0x8
+#define SCU_SOURCE_BCLK					0x7
+#define SCU_SOURCE_XPCLK				0x6
+#define SCU_SOURCE_D2_CLK				0x5
+#define SCU_SOURCE_D_CLK				0x4
+#define SCU_SOURCE_DLY32				0x3
+#define SCU_SOURCE_DLY16				0x2
+#define SCU_SOURCE_NAND					0x1
+#define SCU_SOURCE_DEL_CELL				0x0
+#else
+#define SCU_SOURCE_6M					0xf
+#define SCU_SOURCE_12M					0xe
+#define SCU_SOURCE_I2SM_CLK				0xd
+#define SCU_SOURCE_H_CLK				0xc
+#define SCU_SOURCE_B_CLK				0xb
+#define SCU_SOURCE_D2_PLL				0xa
+
+#define SCU_SOURCE_VIDEO_CLK			0x7
+#define SCU_SOURCE_LPC_CLK				0x6
+#define SCU_SOURCE_I2S_CLK				0x5
+#define SCU_SOURCE_M_CLK				0x4
+#define SCU_SOURCE_SALI_CLK				0x3
+#define SCU_SOURCE_D_PLL				0x2
+#define SCU_SOURCE_NAND					0x1
+#define SCU_SOURCE_DEL_CELL				0x0
+#endif
+#define SCU_OSC_COUNT_EN				(0x1 << 1)
+#define SCU_RING_OSC_EN					(0x1 << 0)
+
+
+/*  AST_SCU_INTR_CTRL : 0x18 - Interrupt control and status register   */
+#define INTR_LPC_H_L_RESET				(0x1 << 21)
+#define INTR_LPC_L_H_RESET				(0x1 << 20)
+#define INTR_PCIE_H_L_RESET				(0x1 << 19)
+#define INTR_PCIE_L_H_RESET				(0x1 << 18)
+#define INTR_VGA_SCRATCH_CHANGE			(0x1 << 17)
+#define INTR_VGA_CURSOR_CHANGE			(0x1 << 16)
+#define INTR_ISSUE_MSI					(0x1 << 6)
+#define INTR_LPC_H_L_RESET_EN			(0x1 << 5)
+#define INTR_LPC_L_H_RESET_EN			(0x1 << 4)
+#define INTR_PCIE_H_L_RESET_EN			(0x1 << 3)
+#define INTR_PCIE_L_H_RESET_EN			(0x1 << 2)
+#define INTR_VGA_SCRATCH_CHANGE_EN		(0x1 << 1)
+#define INTR_VGA_CURSOR_CHANGE_EN		(0x1 << 0)
+
+/*	AST_SCU_D2_PLL: 0x1C - D2-PLL Parameter  register */
+#ifdef AST_SOC_G5
+#define SCU_D2_PLL_SET_ODNUM(x)		(x << 19)
+#define SCU_D2_PLL_GET_ODNUM(x)		((x >> 19) & 0x3)
+#define SCU_D2_PLL_OD_MASK				(0x3 << 19)
+#define SCU_D2_PLL_SET_PNUM(x)			(x << 13)
+#define SCU_D2_PLL_GET_PNUM(x)			((x >>13)&0x3f)
+#define SCU_D2_PLL_PNUM_MASK			(0x3f << 13)
+#define SCU_D2_PLL_SET_NNUM(x)			(x << 8)
+#define SCU_D2_PLL_GET_NNUM(x)			((x >>8)&0x1f)
+#define SCU_D2_PLL_NNUM_MASK			(0x1f << 8)
+#define SCU_D2_PLL_SET_MNUM(x)			(x)
+#define SCU_D2_PLL_GET_MNUM(x)			(x & 0xff)
+#define SCU_D2_PLL_MNUM_MASK			(0xff)
+
+/*	AST_SCU_D2_PLL_EXTEND: 0x13C - D2-PLL Extender Parameter  register */
+#define SCU_D2_PLL_PARAMETER0(x)		((x) << 5)
+#define SCU_D2_PLL_SET_MODE(x)			((x) << 3)
+#define SCU_D2_PLL_GET_MODE(x)			(((x) >> 3) & 0x3)
+#define SCU_D2_PLL_RESET				(0x1 << 2)
+#define SCU_D2_PLL_BYPASS				(0x1 << 1)
+#define SCU_D2_PLL_OFF					(0x1)
+#else
+#define SCU_D2_PLL_SET_PD2(x)			(x << 19)
+#define SCU_D2_PLL_GET_PD2(x)			((x >> 19)&0x7)
+#define SCU_D2_PLL_PD2_MASK				(0x7 << 19)
+#define SCU_D2_PLL_BYPASS				(0x1 << 18)
+#define SCU_D2_PLL_OFF					(0x1 << 17)
+#define SCU_D2_PLL_SET_PD(x)			(x << 15)
+#define SCU_D2_PLL_GET_PD(x)			((x >> 15) &0x3)
+#define SCU_D2_PLL_PD_MASK				(0x3 << 15)
+#define SCU_D2_PLL_SET_OD(x)			(x << 13)
+#define SCU_D2_PLL_GET_OD(x)			((x >> 13) & 0x3)
+#define SCU_D2_PLL_OD_MASK				(0x3 << 13)
+#define SCU_D2_PLL_SET_DENUM(x)			(x << 8)
+#define SCU_D2_PLL_GET_DENUM(x)			((x >>8)&0x1f)
+#define SCU_D2_PLL_DENUM_MASK			(0x1f << 8)
+#define SCU_D2_PLL_SET_NUM(x)			(x)
+#define SCU_D2_PLL_GET_NUM(x)			(x & 0xff)
+#define SCU_D2_PLL_NUM_MASK				(0xff)
+#endif
+
+/*	AST_SCU_M_PLL : 0x20	- M-PLL Parameter register	*/
+#ifdef AST_SOC_G5
+#define SCU_M_PLL_RESET					(0x1 << 21)
+#define SCU_M_PLL_BYPASS				(0x1 << 20)
+#define SCU_M_PLL_OFF					(0x1 << 19)
+#define SCU_M_PLL_GET_PDNUM(x)			((x >> 13) & 0x3f)
+#define SCU_M_PLL_GET_MNUM(x)			((x >> 5) & 0xff)
+#define SCU_M_PLL_GET_NNUM(x)			(x & 0x1f)
+#else
+#define SCU_M_PLL_BYPASS				(0x1 << 17)
+#define SCU_M_PLL_OFF					(0x1 << 16)
+#define SCU_M_PLL_NUM(x)				(x << 5)
+#define SCU_M_PLL_GET_NUM(x)			((x >> 5) & 0x3f)
+#define SCU_M_PLL_NUM_MASK				(0x3f << 5)
+#define SCU_M_PLL_OUT_DIV				(0x1 << 4)
+#define SCU_M_PLL_GET_DIV(x)			((x >> 4) & 0x1)
+#define SCU_M_PLL_DENUM(x)				(x)
+#define SCU_M_PLL_GET_DENUM(x)			(x & 0xf)
+#endif
+
+/*	AST_SCU_H_PLL: 0x24- H-PLL Parameter register		*/
+#if defined(CONFIG_ARCH_AST1010)
+#define SCU_H_PLL_MASK_EN				(0x1 << 10)
+#define SCU_H_PLL_REST_EN				(0x1 << 9)
+#define SCU_H_PLL_OUT_DIV(x)			(x << 7)
+#define SCU_H_PLL_GET_DIV(x)			((x >> 7) & 0x3)
+#define SCU_H_PLL_GET_DENUM(x)			((x >> 6) & 0x1)
+#define SCU_H_PLL_NUM(x)				(x)
+#define SCU_H_PLL_GET_NUM(x)			(x & 0x3f)
+#define SCU_H_PLL_NUM_MASK				(0x3f)
+#elif defined(AST_SOC_G5)
+#define SCU_H_PLL_PARAMETER0(x)			((x) << 22)
+#define SCU_H_PLL_GET_PARAMETER0(x)		((x >> 22) & 0x3ff)
+#define SCU_H_PLL_PARAMETER0_MASK(x)	(0x3ff << 22)
+#define SCU_H_PLL_GET_PARAMETER0(x)		((x >> 22) & 0x3ff)
+#define SCU_H_PLL_RESET					(0x1 << 21)
+#define SCU_H_PLL_BYPASS_EN			(0x1 << 20)
+#define SCU_H_PLL_OFF					(0x1 << 19)
+#define SCU_H_PLL_PNUM(x)				(x << 13)
+#define SCU_H_PLL_GET_PNUM(x)			((x >> 13) & 0x3f)
+#define SCU_H_PLL_PNUM_MASK			(0x3f << 13)
+#define SCU_H_PLL_MNUM(x)				(x << 5)
+#define SCU_H_PLL_GET_MNUM(x)			((x >> 5) & 0xff)
+#define SCU_H_PLL_MNUM_MASK			(0xff << 5)
+#define SCU_H_PLL_NNUM(x)				(x)
+#define SCU_H_PLL_GET_NNUM(x)			(x & 0xf)
+#define SCU_H_PLL_NNUM_MASK			(0xf)
+#else
+#define SCU_H_PLL_PARAMETER				(0x1 << 18)
+#define SCU_H_PLL_BYPASS_EN				(0x1 << 17)
+#define SCU_H_PLL_OFF					(0x1 << 16)
+#define SCU_H_PLL_NUM(x)				(x << 5)
+#define SCU_H_PLL_GET_NUM(x)			((x >> 5) & 0x3f)
+#define SCU_H_PLL_NUM_MASK				(0x3f << 5)
+#define SCU_H_PLL_OUT_DIV				(0x1 << 4)
+#define SCU_H_PLL_GET_DIV(x)			((x >> 4) & 0x1)
+#define SCU_H_PLL_DENUM(x)				(x)
+#define SCU_H_PLL_GET_DENUM(x)			(x & 0xf)
+#define SCU_H_PLL_DENUM_MASK			(0xf)
+#endif
+
+/* 	AST_SCU_MH_PLL_EXTEND : 0x148 - Extended Parameter of M/H-PLL register */
+#define SCU_H_PLL_GET_PARAMETER1(x)		((x >> 16) & 0x3f)
+#define SCU_H_PLL_PARAMETER1_MASK(x)	(0x3f << 16)
+#define SCU_M_PLL_GET_PARAMETER1(x)		(x & 0x3f)
+#define SCU_M_PLL_PARAMETER1_MASK(x)	(0x3f)
+
+#ifdef AST_SOC_G5
+/*	AST_SCU_D_PLL : 0x28 - D-PLL Parameter  register	*/
+#define SCU_D_PLL_GET_SIP(x)				((x >>27) & 0x1f)
+#define SCU_D_PLL_GET_SIC(x)				((x >>22) & 0x1f)
+#define SCU_D_PLL_GET_ODNUM(x)			((x >>19) & 0x7)
+#define SCU_D_PLL_GET_PNUM(x)			((x >>13) & 0x3f)
+#define SCU_D_PLL_GET_NNUM(x)			((x >>8) & 0x1f)
+#define SCU_D_PLL_GET_MNUM(x)			(x & 0xff)
+
+/*	AST_SCU_D_PLL_EXTEND : 0x130 - D-PLL Extended Parameter  register	*/
+#define SCU_D_PLL_SET_MODE(x)			((x & 0x3) << 3)
+#define SCU_D_PLL_RESET					(0x1 << 2)
+#define SCU_D_PLL_BYPASS				(0x1 << 1)
+#define SCU_D_PLL_OFF					(0x1)
+
+#else
+/*	AST_SCU_FREQ_LIMIT : 0x28 - frequency counter comparsion register */
+#define SCU_FREQ_U_LIMIT(x)			(x << 16)
+#define SCU_FREQ_U_LIMIT_MASK		(0x3fff << 16)
+#define SCU_FREQ_L_LIMIT(x)			(x)
+#define SCU_FREQ_L_LIMIT_MASK		(0x3fff)
+#endif
+
+/*	AST_SCU_MISC1_CTRL : 0x2C - Misc. Control register */
+#define SCU_MISC_JTAG_MASTER_DIS	(0x1 << 26)
+#define SCU_MISC_DRAM_W_P2A_DIS		(0x1 << 25)
+#define SCU_MISC_SPI_W_P2A_DIS		(0x1 << 24)
+#define SCU_MISC_SOC_W_P2A_DIS		(0x1 << 23)
+#define SCU_MISC_FLASH_W_P2A_DIS	(0x1 << 22)
+#ifdef AST_SOC_G5
+#define SCU_MISC_CRT_CLK_H_SOURCE		(0x1 << 21)
+#define SCU_MISC_D_PLL_SOURCE			(0x1 << 20)
+#else
+#define SCU_MISC_D_PLL_ASSIGN(x)	(x << 20)
+#define SCU_MISC_D_PLL_ASSIGN_MASK	(0x3 << 20)
+#endif
+#define SCU_MISC_VGA_CONFIG_PREFETCH	(0x1 << 19)
+#define SCU_MISC_DVO_SOURCE_CRT			(0x1 << 18) 	//0:VGA , 1:CRT
+#define SCU_MISC_DAC_MASK				(0x3 << 16)
+#define SCU_MISC_SET_DAC_SOURCE(x)		(x << 16)
+#define SCU_MISC_DAC_SOURCE_CRT			(0x1 << 16)		//00 VGA, 01: CRT, 1x: PASS-Through DVO
+#define SCU_MISC_DAC_SOURCE_MASK		(0x3 << 16)
+#define SCU_MISC_JTAG_TO_PCIE_EN		(0x1 << 15)
+#define SCU_MISC_JTAG__M_TO_PCIE_EN		(0x1 << 14)
+#define SCU_MISC_VUART_TO_CTRL			(0x1 << 13)
+#define SCU_MISC_DIV13_EN				(0x1 << 12)
+#define SCU_MISC_Y_CLK_INVERT			(0x1 << 11)
+#define SCU_MISC_OUT_DELAY				(0x1 << 9)
+#define SCU_MISC_PCI_TO_AHB_DIS			(0x1 << 8)
+#define SCU_MISC_2D_CRT_EN				(0x1 << 7)
+#define SCU_MISC_VGA_CRT_DIS			(0x1 << 6)
+#define SCU_MISC_VGA_REG_ACCESS_EN		(0x1 << 5)
+#define SCU_MISC_D2_PLL_DIS				(0x1 << 4)
+#define SCU_MISC_DAC_DIS				(0x1 << 3)
+#define SCU_MISC_D_PLL_DIS				(0x1 << 2)
+#define SCU_MISC_OSC_CLK_OUT_PIN		(0x1 << 1)
+#define SCU_MISC_LPC_TO_SPI_DIS			(0x1 << 0)
+
+/*	AST_SCU_PCI_CONF1 : 0x30 - PCI configuration setting register#1 */
+#define SCU_PCI_DEVICE_ID(x)			(x << 16)
+#define SCU_PCI_VENDOR_ID(x)			(x)
+
+/*	AST_SCU_PCI_CONF2	0x34		PCI configuration setting register#2 */
+#define SCU_PCI_SUB_SYS_ID(x)			(x << 16)
+#define SCU_PCI_SUB_VENDOR_ID(x)		(x)
+
+/*	AST_SCU_PCI_CONF3	0x38		PCI configuration setting register#3 */
+#define SCU_PCI_CLASS_CODE(x)			(x << 8)
+#define SCU_PCI_REVISION_ID(x)			(x)
+
+/*	AST_SCU_SYS_CTRL	0x3C		System reset contrl/status register*/
+#if defined(CONFIG_ARCH_AST1010)
+#define SCU_SYS_WDT_FULL_FLAG			(0x1 << 2)
+#define SCU_SYS_WDT_SOC_RESET			(0x1 << 1)
+#elif defined(AST_SOC_G5)
+#define SCU_SYS_WDT3_RESET_FLAG			(0x1 << 4)
+#define SCU_SYS_WDT2_RESET_FLAG			(0x1 << 3)
+#define SCU_SYS_WDT_RESET_FLAG			(0x1 << 2)
+#define SCU_SYS_EXT_RESET_FLAG			(0x1 << 1)
+#else
+#define SCU_SYS_EXT_SOC_RESET_EN		(0x1 << 3)
+#define SCU_SYS_EXT_RESET_FLAG			(0x1 << 2)
+#define SCU_SYS_WDT_RESET_FLAG			(0x1 << 1)
+#endif
+#define SCU_SYS_PWR_RESET_FLAG			(0x1 << 0)
+
+/*	AST_SCU_SOC_SCRATCH0	0x40		SOC scratch 0~31 register */
+
+
+
+
+/*	AST_SCU_SOC_SCRATCH1	0x44		SOC scratch 32~63 register */
+
+
+/*	AST_SCU_VGA0		0x40		VGA fuction handshake register */
+#define SCU_VGA_SLT_HANDSHAKE(x)		(x << 24)
+#define SCU_VGA_SLT_HANDSHAKE_MASK		(0xff << 24)
+#define SCU_VGA_CTM_DEF(x)				(x << 16)
+#define SCU_VGA_CTM_DEF_MASK			(0xff << 16)
+#define SCU_MAC0_PHY_MODE(x)			(x << 14)
+#define SCU_MAC0_GET_PHY_MODE(x)		((x >> 14) & 0x3)
+#define SCU_MAC0_PHY_MODE_MASK(x)		(0x3 << 14)
+#define SCU_MAC1_PHY_MODE(x)			(x << 12)
+#define SCU_MAC1_PHY_MODE_MASK			(0x3 << 12)
+#define SCU_MAC1_GET_PHY_MODE(x)		((x >> 12) & 0x3)
+
+#define SCU_VGA_ASPEED_DEF(x)			(x << 8)
+#define SCU_VGA_ASPEED_DEF_MASK			(0xf << 8)
+
+#define SCU_VGA_DRAM_INIT_MASK(x)		((x >> 7) & 0x1)
+
+/*	AST_SCU_VGA1		0x44		VGA fuction handshake register */
+
+
+/*	AST_SCU_MAC_CLK		0x48		MAC interface clock delay setting register */
+
+
+
+/*	AST_SCU_MISC2_CTRL		0x4C		Misc. 2 Control register */
+#ifdef AST_SOC_G5
+#define SCU_PCIE_MAPPING_HIGH			(1 << 15)
+#define SCU_MALI_DTY_MODE				(1 << 8)
+#define SCU_MALI_RC_MODE				(1 << 7)
+#endif
+#define SCU_PCI_BM_ENABLE				(1 << 6)
+#define SCU_DAC_GC_SET(x)				((x & 0x7) << 3)
+#define SCU_DAC_FS_SET(x)				(x & 0x7)
+
+/*	AST_SCU_VGA_SCRATCH0	0x50		VGA Scratch register */
+/*	AST_SCU_VGA_SCRATCH1	0x54		VGA Scratch register */
+/*	AST_SCU_VGA_SCRATCH2	0x58		VGA Scratch register */
+/*	AST_SCU_VGA_SCRATCH3	0x5c		VGA Scratch register */
+/*	AST_SCU_VGA_SCRATCH4	0x60		VGA Scratch register */
+/*	AST_SCU_VGA_SCRATCH5	0x64		VGA Scratch register */
+/*	AST_SCU_VGA_SCRATCH6	0x68		VGA Scratch register */
+/*	AST_SCU_VGA_SCRATCH7	0x6c		VGA Scratch register */
+
+/*	AST_SCU_HW_STRAP1			0x70		hardware strapping register */
+#ifdef AST_SOC_G5
+
+#define CLK_25M_IN					(0x1 << 23)
+
+#define SCU_HW_STRAP_2ND_BOOT_WDT		(0x1 << 17)
+#define SCU_HW_STRAP_SUPER_IO_CONFIG	(0x1 << 16)
+#define SCU_HW_STRAP_VGA_CLASS_CODE		(0x1 << 15)
+#define SCU_HW_STRAP_LPC_RESET_PIN		(0x1 << 14)
+#define SCU_HW_STRAP_SPI_MODE(x)			(x << 12)
+#define SCU_HW_STRAP_SPI_MODE_MASK		(0x3 << 12)
+#define SCU_HW_STRAP_SPI_MASTER			(0x1 << 12)
+#define SCU_HW_STRAP_SPI_M_S_EN			(0x2 << 12)
+#define SCU_HW_STRAP_SPI_PASS_THROUGH	(0x3 << 12)
+#define SCU_HW_STRAP_GET_AXI_AHB_RATIO(x)	((x >> 9) & 0x7)
+#define SCU_HW_STRAP_GET_CPU_AXI_RATIO(x)	((x >> 8) & 0x1)
+#define SCU_HW_STRAP_MAC1_RGMII		(0x1 << 7)
+#define SCU_HW_STRAP_MAC0_RGMII		(0x1 << 6)
+#define SCU_HW_STRAP_VGA_BIOS_ROM	(0x1 << 5)
+#define SCU_HW_STRAP_SPI_WIDTH		(0x1 << 4)
+
+#define SCU_HW_STRAP_VGA_SIZE_GET(x)	((x >> 2)& 0x3)
+#define SCU_HW_STRAP_VGA_MASK			(0x3 << 3)
+#define SCU_HW_STRAP_VGA_SIZE_SET(x)	(x << 2)
+
+#define VGA_8M_DRAM				0
+#define VGA_16M_DRAM			1
+#define VGA_32M_DRAM			2
+#define VGA_64M_DRAM			3
+
+#define SCU_HW_STRAP_DIS_BOOT 			(1)
+#else
+#define SCU_HW_STRAP_SW_DEFINE(x)		(x << 29)
+#define SCU_HW_STRAP_SW_DEFINE_MASK		(0x3 << 29)
+#define SCU_HW_STRAP_DRAM_SIZE			(x << 29)
+#define SCU_HW_STRAP_DRAM_SIZE_MASK		(0x3 << 29)
+
+#define SCU_HW_STRAP_DRAM_CONFIG		(x << 24)
+#define SCU_HW_STRAP_DRAM_CONFIG_MASK	(0x7 << 24)
+
+#define SCU_HW_STRAP_GPIOE_PT_EN		(0x1 << 22)
+#define SCU_HW_STRAP_GPIOD_PT_EN		(0x1 << 21)
+#define SCU_HW_STRAP_LPC_DEC_SUPER_IO	(0x1 << 20)
+#define SCU_HW_STRAP_ACPI_DIS			(0x1 << 19)
+
+//bit 23, 18 [1,0]
+#define SCU_HW_STRAP_SET_CLK_SOURCE(x)		((((x&0x3) >> 1)<<23)||((x&0x1) << 18))
+#define SCU_HW_STRAP_GET_CLK_SOURCE(x)		(((x>>23)&0x1<<1) | ((x>>18)&0x1))
+#define SCU_HW_STRAP_CLK_SOURCE_MASK		((0x1 << 23) | (0x1 << 18))
+
+#define CLK_25M_IN					(0x1 << 23)
+#define CLK_24M_IN					0
+#define CLK_48M_IN					1
+#define CLK_25M_IN_24M_USB_CKI		3
+#define CLK_25M_IN_48M_USB_CKI		3
+
+#define SCU_HW_STRAP_2ND_BOOT_WDT		(0x1 << 17)
+#define SCU_HW_STRAP_SUPER_IO_CONFIG	(0x1 << 16)
+#define SCU_HW_STRAP_VGA_CLASS_CODE		(0x1 << 15)
+#define SCU_HW_STRAP_LPC_RESET_PIN		(0x1 << 14)
+#define SCU_HW_STRAP_SPI_MODE(x)			(x << 12)
+#define SCU_HW_STRAP_SPI_MODE_MASK		(0x3 << 12)
+#define SCU_HW_STRAP_SPI_MASTER			(0x1 << 12)
+#define SCU_HW_STRAP_SPI_M_S_EN			(0x2 << 12)
+#define SCU_HW_STRAP_SPI_PASS_THROUGH	(0x3 << 12)
+
+#define SCU_HW_STRAP_SET_CPU_AHB_RATIO(x)		(x << 10)
+#define SCU_HW_STRAP_GET_CPU_AHB_RATIO(x)		((x >> 10) & 3)
+#define SCU_HW_STRAP_CPU_AHB_RATIO_MASK		(0x3 << 10)
+
+
+#define CPU_AHB_RATIO_1_1		0
+#define CPU_AHB_RATIO_2_1		1
+#define CPU_AHB_RATIO_4_1		2
+#define CPU_AHB_RATIO_3_1		3
+
+#define SCU_HW_STRAP_GET_H_PLL_CLK(x)	((x >> 8 )& 0x3)
+#define SCU_HW_STRAP_H_PLL_CLK_MASK		(0x3 << 8)
+#define CPU_384MHZ		0
+#define CPU_360MHZ		1
+#define CPU_336MHZ		2
+#define CPU_408MHZ		3
+
+#define SCU_HW_STRAP_MAC1_RGMII		(0x1 << 7)
+#define SCU_HW_STRAP_MAC0_RGMII		(0x1 << 6)
+#define SCU_HW_STRAP_VGA_BIOS_ROM	(0x1 << 5)
+#define SCU_HW_STRAP_SPI_WIDTH		(0x1 << 4)
+#define SCU_HW_STRAP_VGA_SIZE_GET(x)		((x >> 2)& 0x3)
+#define SCU_HW_STRAP_VGA_MASK			(0x3 << 2)
+#define SCU_HW_STRAP_VGA_SIZE_SET(x)		(x << 2)
+
+#define VGA_8M_DRAM			0
+#define VGA_16M_DRAM			1
+#define VGA_32M_DRAM			2
+#define VGA_64M_DRAM			3
+
+#define SCU_HW_STRAP_BOOT_MODE(x)		(x)
+#define NOR_BOOT		0
+#define NAND_BOOT		1
+#define SPI_BOOT		2
+#define DIS_BOOT		3
+#endif
+/*	AST_SCU_RAMDOM_GEN		0x74		random number generator register */
+#define RNG_TYPE_MASK			(0x7 << 1)
+#define RNG_SET_TYPE(x)			((x) << 1)
+#define RNG_GET_TYPE(x)			(((x) >> 1)  & 0x7)
+#define RNG_ENABLE				0x1
+/*	AST_SCU_RAMDOM_DATA		0x78		random number generator data output*/
+
+/*	AST_SCU_MULTI_FUNC_2	0x78 */
+
+#define MULTI_FUNC_VIDEO_RGB18			(0x1 << 2)
+#define MULTI_FUNC_VIDEO_SINGLE_EDGE	(0x1 << 0)
+
+
+
+/*	AST_SCU_REVISION_ID		0x7C		Silicon revision ID register */
+#define AST_SOC_GEN				24
+#define AST1100_A0				0x00000200
+#define AST1100_A1				0x00000201
+#define AST1100_A2				0x00000202
+#define AST1100_A3				0x00000202
+
+#define AST2050_A0				0x00000200
+#define AST2050_A1				0x00000201
+#define AST2050_A2				0x00000202
+#define AST2050_A3				0x00000202
+
+#define AST2100_A0				0x00000300
+#define AST2100_A1				0x00000301
+#define AST2100_A2				0x00000302
+#define AST2100_A3				0x00000302
+
+#define AST2200_A0				0x00000102
+#define AST2200_A1				0x00000102
+
+#define AST2300_A0				0x01000003
+#define AST2300_A1				0x01010303
+#define AST1300_A1				0x01010003
+#define AST1050_A1				0x01010203
+
+#define AST2400_A0				0x02000303
+
+#define GET_CHIP_REVISION(x)			((x & 0xff000000) >> 24)
+
+#define GET_HW_REVISION_ID(x)	((x & 0xff0000) >> 16)
+
+#define AST_DRAM_BASE_4		0x40000000
+#define AST_DRAM_BASE_8		0x80000000
+
+/*	AST_SCU_FUN_PIN_CTRL1		0x80		Multi-function Pin Control#1*/
+#define SCU_FUN_PIN_UART4_RXD	(0x1 << 31)
+#define SCU_FUN_PIN_UART4_TXD	(0x1 << 30)
+#define SCU_FUN_PIN_UART4_NRTS	(0x1 << 29)
+#define SCU_FUN_PIN_UART4_NDTR	(0x1 << 28)
+#define SCU_FUN_PIN_UART4_NRI	(0x1 << 27)
+#define SCU_FUN_PIN_UART4_NDSR	(0x1 << 26)
+#define SCU_FUN_PIN_UART4_NDCD	(0x1 << 25)
+#define SCU_FUN_PIN_UART4_NCTS	(0x1 << 24)
+#define SCU_FUN_PIN_UART3_RXD	(0x1 << 23)
+#define SCU_FUN_PIN_UART3_TXD	(0x1 << 22)
+#define SCU_FUN_PIN_UART3_NRTS	(0x1 << 21)
+#define SCU_FUN_PIN_UART3_NDTR	(0x1 << 20)
+#define SCU_FUN_PIN_UART3_NRI	(0x1 << 19)
+#define SCU_FUN_PIN_UART3_NDSR	(0x1 << 18)
+#define SCU_FUN_PIN_UART3_NDCD	(0x1 << 17)
+#define SCU_FUN_PIN_UART3_NCTS	(0x1 << 16)
+
+
+
+
+#define SCU_FUN_PIN_MAC1_PHY_LINK	(0x1 << 1)
+#define SCU_FUN_PIN_MAC0_PHY_LINK	(0x1)
+
+
+/*	AST_SCU_FUN_PIN_CTRL2		0x84		Multi-function Pin Control#2*/
+#define SCU_FUN_PIN_VPIB9		(0x1 << 31)
+#define SCU_FUN_PIN_VPIB8		(0x1 << 30)
+#define SCU_FUN_PIN_VPIB7		(0x1 << 29)
+#define SCU_FUN_PIN_VPIB6		(0x1 << 28)
+#define SCU_FUN_PIN_VPIB5		(0x1 << 27)
+#define SCU_FUN_PIN_VPIB4		(0x1 << 26)
+#define SCU_FUN_PIN_VPIB3		(0x1 << 25)
+#define SCU_FUN_PIN_VPIB2		(0x1 << 24)
+#define SCU_FUN_PIN_VPIB1		(0x1 << 23)
+#define SCU_FUN_PIN_VPIB0		(0x1 << 22)
+#define SCU_FUN_PIN_VPICLK		(0x1 << 21)
+#define SCU_FUN_PIN_VPIVS		(0x1 << 20)
+#define SCU_FUN_PIN_VPIHS		(0x1 << 19)
+#define SCU_FUN_PIN_VPIODD		(0x1 << 18)
+#define SCU_FUN_PIN_VPIDE		(0x1 << 17)
+
+#define SCU_FUN_PIN_DDCDAT		(0x1 << 15)
+#define SCU_FUN_PIN_DDCCLK		(0x1 << 14)
+#define SCU_FUN_PIN_VGAVS		(0x1 << 13)
+#define SCU_FUN_PIN_VGAHS		(0x1 << 12)
+
+#define SCU_FUN_PIN_UART2_RXD	(0x1 << 31)
+#define SCU_FUN_PIN_UART2_TXD	(0x1 << 30)
+#define SCU_FUN_PIN_UART2_NRTS	(0x1 << 29)
+#define SCU_FUN_PIN_UART2_NDTR	(0x1 << 28)
+#define SCU_FUN_PIN_UART2_NRI	(0x1 << 27)
+#define SCU_FUN_PIN_UART2_NDSR	(0x1 << 26)
+#define SCU_FUN_PIN_UART2_NDCD	(0x1 << 25)
+#define SCU_FUN_PIN_UART2_NCTS	(0x1 << 24)
+#define SCU_FUN_PIN_UART1_RXD	(0x1 << 23)
+#define SCU_FUN_PIN_UART1_TXD	(0x1 << 22)
+#define SCU_FUN_PIN_UART1_NRTS	(0x1 << 21)
+#define SCU_FUN_PIN_UART1_NDTR	(0x1 << 20)
+#define SCU_FUN_PIN_UART1_NRI	(0x1 << 19)
+#define SCU_FUN_PIN_UART1_NDSR	(0x1 << 18)
+#define SCU_FUN_PIN_UART1_NDCD	(0x1 << 17)
+#define SCU_FUN_PIN_UART1_NCTS	(0x1 << 16)
+
+#define SCU_FUN_PIN_SGPMI		(0x1 << 11)
+#define SCU_FUN_PIN_SGPMO		(0x1 << 10)
+#define SCU_FUN_PIN_SGPMLD		(0x1 << 9)
+#define SCU_FUN_PIN_SGPMCK		(0x1 << 8)
+
+#if defined(AST_SOC_G5)
+#define SCU_FUN_PIN_I2C4_SALT4	(0x1 << 7)
+#define SCU_FUN_PIN_I2C3_SALT3	(0x1 << 6)
+#define SCU_FUN_PIN_I2C2_SALT2	(0x1 << 5)
+#define SCU_FUN_PIN_I2C1_SALT1	(0x1 << 4)
+#else
+#define SCU_FUN_PIN_NAND_FLWP	(0x1 << 7)
+#define SCU_FUN_PIN_NAND_FLBUSY	(0x1 << 6)
+#endif
+
+/*	AST_SCU_FUN_PIN_CTRL3		0x88		Multi-function Pin Control#3*/
+#if	defined(CONFIG_ARCH_AST1010)
+#define SCU_FUN_PIN_MAC0_MDIO	(0x1 << 23)
+#define SCU_FUN_PIN_MAC0_MDC	(0x1 << 22)
+#else
+#define SCU_FUN_PIN_MAC0_MDIO	(0x1 << 31)
+#define SCU_FUN_PIN_MAC0_MDC	(0x1 << 30)
+#define SCU_FUN_PIN_ROMA25		(0x1 << 29)
+#define SCU_FUN_PIN_ROMA24		(0x1 << 28)
+#define SCU_FUN_PIN_ROMCS4		(0x1 << 27)
+#define SCU_FUN_PIN_ROMCS3		(0x1 << 26)
+#define SCU_FUN_PIN_ROMCS2		(0x1 << 25)
+#define SCU_FUN_PIN_ROMCS1		(0x1 << 24)
+#define SCU_FUN_PIN_ROMCS(x)	(0x1 << (23+x))
+
+#define SCU_FUN_PIN_USBP4_DN	(0x1 << 23)
+#define SCU_FUN_PIN_USBP4_DP	(0x1 << 22)
+#define SCU_FUN_PIN_USBP3_DN	(0x1 << 21)
+#define SCU_FUN_PIN_USBP3_DP	(0x1 << 20)
+//Video pin
+#define SCU_FUN_PIN_VPIR9		(0x1 << 19)
+#define SCU_FUN_PIN_VPIR8		(0x1 << 18)
+#define SCU_FUN_PIN_VPIR7		(0x1 << 17)
+#define SCU_FUN_PIN_VPIR6		(0x1 << 16)
+#define SCU_FUN_PIN_VPIR5		(0x1 << 15)
+#define SCU_FUN_PIN_VPIR4		(0x1 << 14)
+#define SCU_FUN_PIN_VPIR3		(0x1 << 13)
+#define SCU_FUN_PIN_VPIR2		(0x1 << 12)
+#define SCU_FUN_PIN_VPIR1		(0x1 << 11)
+#define SCU_FUN_PIN_VPIR0		(0x1 << 10)
+#define SCU_FUN_PIN_VPIG9		(0x1 << 9)
+#define SCU_FUN_PIN_VPIG8		(0x1 << 8)
+#define SCU_FUN_PIN_VPIG7		(0x1 << 7)
+#define SCU_FUN_PIN_VPIG6		(0x1 << 6)
+#define SCU_FUN_PIN_VPIG5		(0x1 << 5)
+#define SCU_FUN_PIN_VPIG4		(0x1 << 4)
+#define SCU_FUN_PIN_VPIG3		(0x1 << 3)
+#define SCU_FUN_PIN_VPIG2		(0x1 << 2)
+#define SCU_FUN_PIN_VPIG1		(0x1 << 1)
+#define SCU_FUN_PIN_VPIG0		(0x1 << 0)
+#endif
+
+
+//pwm pin
+#define SCU_FUN_PIN_PWM_TACHO	(0)
+/*	AST_SCU_FUN_PIN_CTRL4		0x8C		Multi-function Pin Control#4*/
+#define SCU_FUN_PIN_ROMA23		(0x1 << 7)
+#define SCU_FUN_PIN_ROMA22		(0x1 << 6)
+
+#define SCU_FUN_PIN_ROMWE		(0x1 << 5)
+#define SCU_FUN_PIN_ROMOE		(0x1 << 4)
+#define SCU_FUN_PIN_ROMD7		(0x1 << 3)
+#define SCU_FUN_PIN_ROMD6		(0x1 << 2)
+#define SCU_FUN_PIN_ROMD5		(0x1 << 1)
+#define SCU_FUN_PIN_ROMD4		(0x1)
+
+/*	AST_SCU_FUN_PIN_CTRL5		0x90		Multi-function Pin Control#5*/
+#define SCU_FUN_PIN_SPICS1		(0x1 << 31)
+#define SCU_FUN_PIN_LPC_PLUS	(0x1 << 30)
+#define SCU_FUC_PIN_USB20_HOST	(0x1 << 29)
+#define SCU_FUC_PIN_USB11_PORT4	(0x1 << 28)
+#define SCU_FUC_PIN_I2C14		(0x1 << 27)
+#define SCU_FUC_PIN_I2C13		(0x1 << 26)
+#define SCU_FUC_PIN_I2C12		(0x1 << 25)
+#define SCU_FUC_PIN_I2C11		(0x1 << 24)
+#define SCU_FUC_PIN_I2C10		(0x1 << 23)
+#define SCU_FUC_PIN_I2C9		(0x1 << 22)
+#define SCU_FUC_PIN_I2C8		(0x1 << 21)
+#define SCU_FUC_PIN_I2C7		(0x1 << 20)
+#define SCU_FUC_PIN_I2C6		(0x1 << 19)
+#define SCU_FUC_PIN_I2C5		(0x1 << 18)
+#define SCU_FUC_PIN_I2C4		(0x1 << 17)
+#define SCU_FUC_PIN_I2C3		(0x1 << 16)
+#define SCU_FUC_PIN_MII2_RX_DWN_DIS		(0x1 << 15)
+#define SCU_FUC_PIN_MII2_TX_DWN_DIS		(0x1 << 14)
+#define SCU_FUC_PIN_MII1_RX_DWN_DIS		(0x1 << 13)
+#define SCU_FUC_PIN_MII1_TX_DWN_DIS		(0x1 << 12)
+
+#define SCU_FUC_PIN_MII2_TX_DRIV(x)		(x << 10)
+#define SCU_FUC_PIN_MII2_TX_DRIV_MASK	(0x3 << 10)
+#define SCU_FUC_PIN_MII1_TX_DRIV(x)		(x << 8)
+#define SCU_FUC_PIN_MII1_TX_DRIV_MASK	(0x3 << 8)
+
+#define MII_NORMAL_DRIV	0x0
+#define MII_HIGH_DRIV	0x2
+
+#define SCU_FUC_PIN_UART6		(0x1 << 7)
+#define SCU_FUC_PIN_ROM_16BIT	(0x1 << 6)
+#define SCU_FUC_PIN_DIGI_V_OUT(x)	(x)
+#define SCU_FUC_PIN_DIGI_V_OUT_MASK	(0x3)
+
+#define VIDEO_DISABLE	0x0
+#define VIDEO_12BITS	0x1
+#define VIDEO_24BITS	0x2
+//#define VIDEO_DISABLE	0x3
+
+#define SCU_FUC_PIN_USB11_PORT2	(0x1 << 3)
+#define SCU_FUC_PIN_SD1_8BIT		(0x1 << 3)
+
+#define SCU_FUC_PIN_MAC1_MDIO		(0x1 << 2)
+#define SCU_FUC_PIN_SD2		(0x1 << 1)
+#define SCU_FUC_PIN_SD1		(0x1 << 0)
+
+
+/*	AST_SCU_FUN_PIN_CTRL6		0x94		Multi-function Pin Control#6*/
+#define SCU_FUN_PIN_USBP1_MODE(x)	(x << 13)	/* Select USB2.0 Port\#2 function mode */
+#define SCU_FUN_PIN_USBP1_MASK		(0x3 << 13)	/* Select USB2.0 Port\#2 function mode */
+#define USB_HID_MODE	0
+#define USB_DEV_MODE	1
+#define USB_HOST_MODE	2
+#define SCU_FUN_PIN_SGPIOP2			(0x1 << 12)	/* Enable Slave SGPIO port 2 function pins */
+#define SCU_FUN_PIN_UART13			(0x1 << 11)	/* Enable UART13 function pins */
+#define SCU_FUN_PIN_UART12			(0x1 << 10)	/* Enable UART12 function pins */
+#define SCU_FUN_PIN_UART11			(0x1 << 9)	/* Enable UART11 function pins */
+#define SCU_FUN_PIN_UART10			(0x1 << 8)	/* Enable UART10 function pins */
+#define SCU_FUN_PIN_UART9			(0x1 << 7)	/* Enable UART9 function pins */
+#define SCU_FUN_PIN_UART8			(0x1 << 6)	/* Enable UART8 function pins */
+#define SCU_FUN_PIN_UART7			(0x1 << 5)	/* Enable UART7 function pins */
+#define SCU_FUN_PIN_I2S2			(0x1 << 4)
+#define SCU_FUN_PIN_I2S1			(0x1 << 3)
+#define SCU_FUN_PIN_VIDEO_SO		(0x1 << 2)
+#define SCU_FUN_PIN_DVO_24BIT		(0x1)
+#define SCU_VIDEO_OUT_MASK		(~0x3)
+
+/*	AST_SCU_WDT_RESET		0x9C		Watchdog Reset Selection */
+/*	AST_SCU_FUN_PIN_CTRL7		0xA0		Multi-function Pin Control#7*/
+/*	AST_SCU_FUN_PIN_CTRL8		0xA4		Multi-function Pin Control#8*/
+#define SCU_FUN_PIN_ROMA17		(0x1 << 31)
+#define SCU_FUN_PIN_ROMA16		(0x1 << 30)
+#define SCU_FUN_PIN_ROMA15		(0x1 << 29)
+#define SCU_FUN_PIN_ROMA14		(0x1 << 28)
+#define SCU_FUN_PIN_ROMA13		(0x1 << 27)
+#define SCU_FUN_PIN_ROMA12		(0x1 << 26)
+#define SCU_FUN_PIN_ROMA11		(0x1 << 25)
+#define SCU_FUN_PIN_ROMA10		(0x1 << 24)
+#define SCU_FUN_PIN_ROMA9		(0x1 << 23)
+#define SCU_FUN_PIN_ROMA8		(0x1 << 22)
+#define SCU_FUN_PIN_ROMA7		(0x1 << 21)
+#define SCU_FUN_PIN_ROMA6		(0x1 << 20)
+#define SCU_FUN_PIN_ROMA5		(0x1 << 19)
+#define SCU_FUN_PIN_ROMA4		(0x1 << 18)
+#define SCU_FUN_PIN_ROMA3		(0x1 << 17)
+#define SCU_FUN_PIN_ROMA2		(0x1 << 16)
+
+/*	AST_SCU_FUN_PIN_CTRL9		0xA8		Multi-function Pin Control#9*/
+#define SCU_FUN_PIN_ROMA21		(0x1 << 3)
+#define SCU_FUN_PIN_ROMA20		(0x1 << 2)
+#define SCU_FUN_PIN_ROMA19		(0x1 << 1)
+#define SCU_FUN_PIN_ROMA18		(0x1)
+
+/*	AST_SCU_PWR_SAVING_EN		0xC0		Power Saving Wakeup Enable*/
+/*	AST_SCU_PWR_SAVING_CTRL		0xC4		Power Saving Wakeup Control*/
+/*	AST_SCU_HW_STRAP2			0xD0		Haardware strapping register set 2*/
+
+
+/*	AST_SCU_COUNTER4			0xE0		SCU Free Run Counter Read Back #4*/
+/*	AST_SCU_COUNTER4_EXT		0xE4		SCU Free Run Counter Extended Read Back #4*/
+
+//CPU 2
+/*	AST_SCU_CPU2_CTRL			0x100		CPU2 Control Register*/
+/*	AST_SCU_CPU2_BASE0_ADDR		0x104		CPU2 Base Address for Segment 0x00:0000~0x1F:FFFF*/
+/*	AST_SCU_CPU2_BASE1_ADDR		0x108		CPU2 Base Address for Segment 0x20:0000~0x3F:FFFF*/
+/*	AST_SCU_CPU2_BASE2_ADDR		0x10C		CPU2 Base Address for Segment 0x40:0000~0x5F:FFFF*/
+/*	AST_SCU_CPU2_BASE3_ADDR		0x110		CPU2 Base Address for Segment 0x60:0000~0x7F:FFFF*/
+/*	AST_SCU_CPU2_BASE4_ADDR		0x114		CPU2 Base Address for Segment 0x80:0000~0xFF:FFFF*/
+/*	AST_SCU_CPU2_CACHE_CTRL		0x118		CPU2 Cache Function Control */
+
+#if defined(CONFIG_ARCH_AST1010)
+/*	AST_SCU_CPU_CACHE_CTRL		0x11C		CPU Cache Function Control*/
+#define SCU_AREA7_CACHE_EN		(0x1 << 8)
+#define SCU_AREA6_CACHE_EN		(0x1 << 7)
+#define SCU_AREA5_CACHE_EN		(0x1 << 6)
+#define SCU_AREA4_CACHE_EN		(0x1 << 5)
+#define SCU_AREA3_CACHE_EN		(0x1 << 4)
+#define SCU_AREA2_CACHE_EN		(0x1 << 3)
+#define SCU_AREA1_CACHE_EN		(0x1 << 2)
+#define SCU_AREA0_CACHE_EN		(0x1 << 1)
+#define SCU_CACHE_EN			(0x1)
+#endif
+//
+/*	AST_SCU_UART24_REF			0x160		Generate UART 24Mhz Ref from H-PLL when CLKIN is 25Mhz */
+/*	AST_SCU_PCIE_CONFIG_SET		0x180		PCI-E Configuration Setting Control Register */
+/*	AST_SCU_BMC_MMIO_DEC		0x184		BMC MMIO Decode Setting Register */
+/*	AST_SCU_DEC_AREA1			0x188		1st relocated controller decode area location */
+/*	AST_SCU_DEC_AREA2			0x18C		2nd relocated controller decode area location */
+/*	AST_SCU_MBOX_DEC_AREA		0x190		Mailbox decode area location*/
+/*	AST_SCU_SRAM_DEC_AREA0		0x194		Shared SRAM area decode location*/
+/*	AST_SCU_SRAM_DEC_AREA1		0x198		Shared SRAM area decode location*/
+/*	AST_SCU_BMC_CLASS			0x19C		BMC device class code and revision ID */
+/*	AST_SCU_BMC_DEV_ID			0x1A4		BMC device ID */
+
+#endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
new file mode 100644
index 000000000000..55ce2f2df0ab
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
@@ -0,0 +1,38 @@
+/* arch/arm/mach-aspeed/include/mach/regs-sdmc.h
+ *
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *   History      :
+ *    1. 2012/12/29 Ryan Chen Create
+ *
+********************************************************************************/
+#ifndef __AST_SDMC_H
+#define __AST_SDMC_H                     1
+
+/*
+ *  Register for SDMC
+ *  */
+#define AST_SDMC_PROTECT	0x00		/*	protection key register	*/
+#define AST_SDMC_CONFIG		0x04		/*	Configuration register */
+
+/*	AST_SDMC_PROTECT: 0x00  - protection key register */
+#define SDMC_PROTECT_UNLOCK			0xFC600309
+
+#if defined(CONFIG_ARCH_AST1010)
+/*	AST_SDMC_CONFIG :0x04	 - Configuration register */
+#define SDMC_CONFIG_16MB			1
+
+#else
+/*	AST_SDMC_CONFIG :0x04	 - Configuration register */
+#define SDMC_CONFIG_VER_NEW		(0x1 << 28)
+#define SDMC_CONFIG_MEM_GET(x)		(x & 0x3)
+
+#define SDMC_CONFIG_CACHE_EN		(0x1 << 10)
+#define SDMC_CONFIG_EEC_EN			(0x1 << 7)
+#endif
+
+#endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-spi.h b/arch/arm/include/asm/arch-aspeed/regs-spi.h
new file mode 100644
index 000000000000..a5cb39f6e771
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/regs-spi.h
@@ -0,0 +1,55 @@
+/*
+ * Register definitions for the AST SPI Controller
+ */
+
+/* Register offsets */
+#define AST_SPI_CONFIG			0x00
+#define AST_SPI_CTRL			0x04
+#define AST_SPI_DMA_STS			0x08
+#define AST_SPI_MISC			0x10
+#define AST_SPI_TIMING			0x14
+
+#define AST_SPI_DMA_CTRL		0x80
+#define AST_SPI_DMA_FLASH_BASE	0x84
+#define AST_SPI_DMA_DRAM_BASE	0x88
+#define AST_SPI_DMA_LENGTH		0x8c
+
+
+/* AST_SPI_CONFIG 0x00 : SPI Flash Configuration Register */
+#define SPI_CONF_CS1			(0x1 << 2)
+#define SPI_CONF_CLKX2			(0x1 << 1)
+#define SPI_CONF_WRITE_EN		(0x1)
+
+/* FMC_CE0_CTRL	for SPI 0x10, 0x14, 0x18, 0x1c, 0x20 */
+#define SPI_IO_MODE(x)			(x << 28)
+#define SPI_SINGLE_BIT			0
+#define SPI_DUAL_BIT_D			2
+#define SPI_DUAL_BIT_DA			3
+#define SPI_CE_WIDTH(x)			(x << 24)
+#define SPI_CMD_DATA(x)			(x << 16)
+#define SPI_DUMMY_CMD			(1 << 15)
+#define SPI_DUMMY_HIGH			(1 << 14)
+//#define SPI_CLK_DIV				(1 << 13)		?? TODO ask....
+//#define SPI_ADDR_CYCLE			(1 << 13)		?? TODO ask....
+#define SPI_CMD_MERGE_DIS		(1 << 12)
+#define SPI_CLK_DIV(x)			(x << 8)
+#define SPI_CLK_DIV_MASK		(0xf << 8)
+
+#define SPI_DUMMY_LOW			(x << 6)
+#define SPI_LSB_FIRST_CTRL		(1 << 5)
+#define SPI_CPOL_1				(1 << 4)
+#define SPI_DUAL_DATA			(1 << 3)
+#define SPI_CE_INACTIVE			(1 << 2)
+#define SPI_CMD_MODE			(x)
+#define SPI_CMD_NOR_R_MODE		0
+#define SPI_CMD_FAST_R_MODE		1
+#define SPI_CMD_NOR_W_MODE		2
+#define SPI_CMD_USER_MODE		3
+
+/* AST_SPI_DMA_CTRL				0x80 */
+#define SPI_DMA_EN				(1 << 0)
+
+
+#define FLASH_STATUS_DMA_BUSY		0x0000
+#define FLASH_STATUS_DMA_READY		0x0800
+#define FLASH_STATUS_DMA_CLEAR		0x0800
diff --git a/arch/arm/include/asm/mach-types.h b/arch/arm/include/asm/mach-types.h
index d51be0b1d2f8..8b0c2438fe3c 100644
--- a/arch/arm/include/asm/mach-types.h
+++ b/arch/arm/include/asm/mach-types.h
@@ -1107,6 +1107,7 @@ extern unsigned int __machine_arch_type;
 #define MACH_TYPE_COLIBRI_T30          4493
 #define MACH_TYPE_APALIS_T30           4513
 #define MACH_TYPE_OMAPL138_LCDK        2495
+#define MACH_TYPE_ASPEED               8888
 
 #ifdef CONFIG_ARCH_EBSA110
 # ifdef machine_arch_type
@@ -14188,6 +14189,18 @@ extern unsigned int __machine_arch_type;
 # define machine_is_apalis_t30()	(0)
 #endif
 
+#ifdef CONFIG_MACH_ASPEED
+# ifdef machine_arch_type
+#  undef machine_arch_type
+#  define machine_arch_type __machine_arch_type
+# else
+#  define machine_arch_type MACH_TYPE_ASPEED
+# endif
+# define machine_is_aspeed()	(machine_arch_type == MACH_TYPE_ASPEED)
+#else
+# define machine_is_aspeed()	(0)
+#endif
+
 /*
  * These have not yet been registered
  */
diff --git a/arch/arm/mach-aspeed/Makefile b/arch/arm/mach-aspeed/Makefile
new file mode 100644
index 000000000000..d72f62a75fba
--- /dev/null
+++ b/arch/arm/mach-aspeed/Makefile
@@ -0,0 +1,15 @@
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+# MA 02111-1307 USA
+#
+
+
+obj-y += timer.o reset.o cpuinfo.o ast-scu.o ast-ahbc.o ast-sdmc.o
+obj-$(CONFIG_AST_SPI_NOR) += flash.o
diff --git a/arch/arm/mach-aspeed/ast-ahbc.c b/arch/arm/mach-aspeed/ast-ahbc.c
new file mode 100644
index 000000000000..5686bed12df2
--- /dev/null
+++ b/arch/arm/mach-aspeed/ast-ahbc.c
@@ -0,0 +1,95 @@
+/********************************************************************************
+* File Name     : arch/arm/mach-aspeed/ast-ahbc.c
+* Author         : Ryan Chen
+* Description   : AST AHB Ctrl
+*
+* Copyright (C) 2012-2020  ASPEED Technology Inc.
+* This program is free software; you can redistribute it and/or modify
+* it under the terms of the GNU General Public License as published by the Free Software Foundation;
+* either version 2 of the License, or (at your option) any later version.
+* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
+* without even the implied warranty of MERCHANTABILITY or
+* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+* You should have received a copy of the GNU General Public License
+* along with this program; if not, write to the Free Software
+* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+
+*   History      :
+*    1. 2014/03/15 Ryan Chen Create
+*
+********************************************************************************/
+#include <common.h>
+#include <asm/processor.h>
+#include <asm/io.h>
+#include <asm/arch/regs-ahbc.h>
+#include <asm/arch/ast-ahbc.h>
+#include <asm/arch/aspeed.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+//#define AST_AHBC_DEBUG
+
+#ifdef AST_AHBC_DEBUG
+#define AHBCDBUG(fmt, args...) printf("%s() " fmt, __FUNCTION__, ## args)
+#else
+#define AHBCDBUG(fmt, args...)
+#endif
+
+static u32 ast_ahbc_base = AST_AHBC_BASE;
+static inline u32
+ast_ahbc_read(u32 reg)
+{
+	u32 val;
+	val = readl(ast_ahbc_base + reg);
+	AHBCDBUG("reg = 0x%08x, val = 0x%08x\n", reg, val);
+
+	return val;
+}
+
+static inline void
+ast_ahbc_write(u32 val, u32 reg)
+{
+	AHBCDBUG("reg = 0x%08x, val = 0x%08x\n", reg, val);
+
+#ifdef CONFIG_AST_AHBC_LOCK
+	//unlock
+	writel(AHBC_PROTECT_UNLOCK, ast_ahbc_base);
+	writel(val, ast_ahbc_base + reg);
+	//lock
+	writel(0xaa,ast_ahbc_base);
+#else
+	writel(AHBC_PROTECT_UNLOCK, ast_ahbc_base);
+	writel(val, ast_ahbc_base + reg);
+#endif
+
+}
+
+//***********************************Information ***********************************
+
+extern void ast_ahbc_boot_remap(void)
+{
+#if defined(AST_SOC_G5)
+#else
+	ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) | AHBC_BOOT_REMAP, AST_AHBC_ADDR_REMAP);
+#endif
+
+}
+
+#ifdef AST_SOC_G5
+extern void ast_ahbc_peie_mapping(u8 enable)
+{
+	if(enable)
+		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) | AHBC_PCIE_MAP, AST_AHBC_ADDR_REMAP);
+	else
+		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) & ~AHBC_PCIE_MAP, AST_AHBC_ADDR_REMAP);
+}
+
+extern void ast_ahbc_lpc_plus_mapping(u8 enable)
+{
+	if(enable)
+		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) | AHBC_LPC_PLUS_MAP, AST_AHBC_ADDR_REMAP);
+	else
+		ast_ahbc_write(ast_ahbc_read(AST_AHBC_ADDR_REMAP) & ~AHBC_LPC_PLUS_MAP, AST_AHBC_ADDR_REMAP);
+}
+#endif
diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
new file mode 100644
index 000000000000..fb1ad38c4f17
--- /dev/null
+++ b/arch/arm/mach-aspeed/ast-scu.c
@@ -0,0 +1,1900 @@
+/********************************************************************************
+* File Name     : arch/arm/cpu/ast-common/ast-scu.c
+* Author         : Ryan Chen
+* Description   : AST SCU
+*
+* Copyright (C) 2012-2020  ASPEED Technology Inc.
+* This program is free software; you can redistribute it and/or modify
+* it under the terms of the GNU General Public License as published by the Free Software Foundation;
+* either version 2 of the License, or (at your option) any later version.
+* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
+* without even the implied warranty of MERCHANTABILITY or
+* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+* You should have received a copy of the GNU General Public License
+* along with this program; if not, write to the Free Software
+* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+CLK24M
+ |
+ |--> H-PLL -->HCLK
+ |
+ |--> M-PLL -xx->MCLK
+ |
+ |--> V-PLL1 -xx->DCLK
+ |
+ |--> V-PLL2 -xx->D2CLK
+ |
+ |--> USB2PHY -->UTMICLK
+
+
+*   History      :
+*    1. 2012/08/15 Ryan Chen Create
+*
+********************************************************************************/
+#include <common.h>
+#include <asm/processor.h>
+#include <asm/io.h>
+#include <asm/arch/regs-scu.h>
+#include <asm/arch/ast_scu.h>
+#include <asm/arch/platform.h>
+#include <asm/arch/aspeed.h>
+
+//#define ASPEED_SCU_LOCK
+//#define ASPEED_SCU_DEBUG
+
+#ifdef ASPEED_SCU_DEBUG
+#define SCUDBUG(fmt, args...) printf("%s() " fmt, __FUNCTION__, ## args)
+#else
+#define SCUDBUG(fmt, args...)
+#endif
+
+#define SCUMSG(fmt, args...) printf(fmt, ## args)
+
+static u32 ast_scu_base = AST_SCU_BASE;
+
+static inline u32
+ast_scu_read(u32 reg)
+{
+	u32 val;
+
+	val = readl(ast_scu_base + reg);
+
+	SCUDBUG("ast_scu_read : reg = 0x%08x, val = 0x%08x\n", reg, val);
+
+	return val;
+}
+
+static inline void
+ast_scu_write(u32 val, u32 reg)
+{
+	SCUDBUG("ast_scu_write : reg = 0x%08x, val = 0x%08x\n", reg, val);
+#ifdef CONFIG_AST_SCU_LOCK
+	//unlock
+	writel(SCU_PROTECT_UNLOCK, ast_scu_base);
+	writel(val, ast_scu_base + reg);
+	//lock
+	writel(0xaa,ast_scu_base);
+#else
+	writel(SCU_PROTECT_UNLOCK, ast_scu_base);
+	writel(val, ast_scu_base + reg);
+#endif
+}
+
+//SoC mapping Table
+struct soc_id {
+	const char	* name;
+	u32	rev_id;
+};
+
+static struct soc_id soc_map_table[] = {
+	[0] = {
+		.name = "AST1100/AST2050-A0",
+		.rev_id = 0x00000200,
+	},
+	[1] = {
+		.name = "AST1100/AST2050-A1",
+		.rev_id = 0x00000201,
+	},
+	[2] = {
+		.name = "AST1100/AST2050-A2,3/AST2150-A0,1",
+		.rev_id = 0x00000202,
+	},
+	[3] = {
+		.name = "AST1510/AST2100-A0",
+		.rev_id = 0x00000300,
+	},
+	[4] = {
+		.name = "AST1510/AST2100-A1",
+		.rev_id = 0x00000301,
+	},
+	[5] = {
+		.name = "AST1510/AST2100-A2,3",
+		.rev_id = 0x00000302,
+	},
+	[6] = {
+		.name = "AST2200-A0,1",
+		.rev_id = 0x00000102,
+	},
+	[7] = {
+		.name = "AST2300-A0",
+		.rev_id = 0x01000003,
+	},
+	[8] = {
+		.name = "AST2300-A1",
+		.rev_id = 0x01010303,
+	},
+	[9] = {
+		.name = "AST1300-A1",
+		.rev_id = 0x01010003,
+	},
+	[10] = {
+		.name = "AST1050-A1",
+		.rev_id = 0x01010203,
+	},
+	[11] = {
+		.name = "AST2400-A0",
+		.rev_id = 0x02000303,
+	},
+	[12] = {
+		.name = "AST2400-A1",
+		.rev_id = 0x02010303,
+	},
+	[13] = {
+		.name = "AST1010-A0",
+		.rev_id = 0x03000003,
+	},
+	[14] = {
+		.name = "AST1010-A1",
+		.rev_id = 0x03010003,
+	},
+	[15] = {
+		.name = "AST1520-A0",
+		.rev_id = 0x03000203,
+	},
+	[16] = {
+		.name = "AST3200-A0",
+		.rev_id = 0x03000303,
+	},
+	[17] = {
+		.name = "AST2500-A0",
+		.rev_id = 0x04000303,
+	},
+	[18] = {
+		.name = "AST2510-A0",
+		.rev_id = 0x04000103,
+	},
+	[19] = {
+		.name = "AST2520-A0",
+		.rev_id = 0x04000203,
+	},
+	[20] = {
+		.name = "AST2530-A0",
+		.rev_id = 0x04000403,
+	},
+	[21] = {
+		.name = "AST1520-A1",
+		.rev_id = 0x03010203,
+	},
+	[22] = {
+		.name = "AST3200-A1",
+		.rev_id = 0x03010303,
+	},
+	[23] = {
+		.name = "AST2500-A1",
+		.rev_id = 0x04010303,
+	},
+	[24] = {
+		.name = "AST2510-A1",
+		.rev_id = 0x04010103,
+	},
+	[25] = {
+		.name = "AST2520-A1",
+		.rev_id = 0x04010203,
+	},
+	[26] = {
+		.name = "AST2530-A1",
+		.rev_id = 0x04010403,
+	},
+};
+//***********************************Initial control***********************************
+#ifdef SCU_RESET_VIDEO
+extern void
+ast_scu_reset_video(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_VIDEO, AST_SCU_RESET);
+	udelay(100);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_VIDEO, AST_SCU_RESET);
+}
+
+
+extern void
+ast_scu_init_video(u8 dynamic_en)
+{
+	//Video Engine Clock Enable and Reset
+	//  Enable Clock & ECLK = inverse of (M-PLL / 2)
+	if(dynamic_en)
+		ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_VIDEO_SLOW_MASK) | SCU_CLK_VIDEO_SLOW_EN | SCU_CLK_VIDEO_SLOW_SET(0), AST_SCU_CLK_SEL);
+	else {
+		if(GET_CHIP_REVISION(ast_scu_read(AST_SCU_REVISION_ID)) == 4)
+			ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~(SCU_ECLK_SOURCE_MASK | SCU_CLK_VIDEO_SLOW_MASK | SCU_CLK_VIDEO_SLOW_EN)), AST_SCU_CLK_SEL);
+		else
+			ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~(SCU_ECLK_SOURCE_MASK | SCU_CLK_VIDEO_SLOW_EN)) | SCU_ECLK_SOURCE(2), AST_SCU_CLK_SEL);
+	}
+
+	// Enable CLK
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~(SCU_ECLK_STOP_EN | SCU_VCLK_STOP_EN), AST_SCU_CLK_STOP);
+	mdelay(10);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_VIDEO, AST_SCU_RESET);
+	udelay(100);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_VIDEO, AST_SCU_RESET);
+}
+#endif
+
+#ifdef SCU_UART1CLK_STOP_EN
+extern void
+ast_scu_init_uart(u8 uart)
+{
+	u32 clk_stop_en = 0;
+
+	//uart 1
+	if(uart & 0x2) {
+		clk_stop_en |= SCU_UART1CLK_STOP_EN;
+	}
+
+	if(uart & 0x4) {
+		clk_stop_en |= SCU_UART2CLK_STOP_EN;
+	}
+
+	if(uart & 0x8) {
+		clk_stop_en |= SCU_UART3CLK_STOP_EN;
+	}
+
+	if(uart & 0x10) {
+		clk_stop_en |= SCU_UART4CLK_STOP_EN;
+	}
+
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~(clk_stop_en), AST_SCU_CLK_STOP);
+
+}
+#endif
+
+extern void
+ast_scu_init_eth(u8 num)
+{
+
+//Set MAC delay Timing
+#if defined(AST_SOC_G5)
+	//a1
+//	ast_scu_write(0x00145249, AST_SCU_MAC_CLK);
+//	ast_scu_write(0x00145249, AST_SCU_MAC_CLK_DELAY_100M);
+//	ast_scu_write(0x00145249, AST_SCU_MAC_CLK_DELAY_10M);
+//	ast_scu_write((0x6a << 16) | (0x6a << 8), AST_SCU_MAC_CLK_DUTY);
+#elif defined(CONFIG_ARCH_AST1010)
+// do nothing
+#else
+	//AST2300 max clk to 125Mhz, AST2400 max clk to 198Mhz
+	if(ast_scu_read(AST_SCU_HW_STRAP1) & (SCU_HW_STRAP_MAC1_RGMII | SCU_HW_STRAP_MAC0_RGMII))	//RGMII --> H-PLL/6
+		ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_MAC_MASK) | SCU_CLK_MAC_DIV(2), AST_SCU_CLK_SEL);
+	else	//RMII --> H-PLL/10
+		ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_MAC_MASK) | SCU_CLK_MAC_DIV(4), AST_SCU_CLK_SEL);
+
+	ast_scu_write(0x2255, AST_SCU_MAC_CLK);
+#endif
+
+	switch(num) {
+		case 0:
+			ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_MAC0,
+							AST_SCU_RESET);
+			udelay(100);
+			ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_MAC0CLK_STOP_EN,
+							AST_SCU_CLK_STOP);
+			udelay(1000);
+			ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_MAC0,
+							AST_SCU_RESET);
+
+			break;
+#if defined(AST_MAC1_BASE)
+		case 1:
+			ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_MAC1,
+							AST_SCU_RESET);
+			udelay(100);
+			ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_MAC1CLK_STOP_EN,
+							AST_SCU_CLK_STOP);
+			udelay(1000);
+			ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_MAC1,
+							AST_SCU_RESET);
+			break;
+#endif
+	}
+}
+
+#ifdef SCU_RESET_USB11
+extern void
+ast_scu_init_uhci(void)
+{
+	//USB1.1 Host's Clock Enable and Reset
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_USB11CLK_STOP_EN, AST_SCU_CLK_STOP);
+	mdelay(10);
+
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_USB11, AST_SCU_RESET);
+}
+#endif
+
+#ifdef SCU_RESET_USB20
+extern void
+ast_scu_init_usb_port1(void)
+{
+	/* EHCI controller engine init. Process similar to VHub. */
+	/* Following reset sequence can resolve "vhub dead on first power on" issue on V4 board. */
+	//reset USB20
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_USB20, AST_SCU_RESET);
+
+	//enable USB20 clock
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) | SCU_USB20_PHY_CLK_EN, AST_SCU_CLK_STOP);
+	mdelay(10);
+
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_USB20, AST_SCU_RESET);
+}
+
+
+extern void
+ast_scu_init_usb_port2()
+{
+#ifdef AST_SOC_G5
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_USB_P1, AST_SCU_RESET);
+
+	//enable USB20 clock
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_USB_P1_STOP_EN, AST_SCU_CLK_STOP);
+	mdelay(10);
+
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_USB_P1, AST_SCU_RESET);
+#endif
+}
+#endif
+
+#ifdef SCU_RESET_SD
+extern void
+ast_scu_init_sdhci(void)
+{
+	//SDHCI Host's Clock Enable and Reset
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_SD, AST_SCU_RESET);
+
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_SDCLK_STOP_EN, AST_SCU_CLK_STOP);
+	mdelay(10);
+
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_CLK_SD_EN, AST_SCU_CLK_SEL);
+	mdelay(10);
+
+	// SDCLK = H-PLL / 4, G5 = H-PLL /8
+	ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_SD_MASK) | SCU_CLK_SD_DIV(1),
+		AST_SCU_CLK_SEL);
+	mdelay(10);
+
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_SD, AST_SCU_RESET);
+}
+#endif
+
+extern void
+ast_scu_init_i2c(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_I2C, AST_SCU_RESET);
+}
+
+
+extern void
+ast_scu_init_pwm_tacho(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PWM, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PWM, AST_SCU_RESET);
+}
+
+
+extern void
+ast_scu_init_adc(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_ADC, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_ADC, AST_SCU_RESET);
+}
+
+#ifdef SCU_RESET_PCIE
+extern void
+ast_scu_init_pcie(void)
+{
+	//pcie host reset
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PCIE, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PCIE_DIR, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PCIE, AST_SCU_RESET);
+	mdelay(10);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PCIE, AST_SCU_RESET);
+
+	//p2x reset
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_P2X, AST_SCU_RESET);
+
+	//use 0x7c for clr
+	ast_scu_write(SCU_HW_STRAP_VGA_MASK, AST_SCU_REVISION_ID);
+	ast_scu_write(SCU_HW_STRAP_VGA_SIZE_SET(VGA_64M_DRAM), AST_SCU_HW_STRAP1);
+
+	ast_scu_write(ast_scu_read(AST_SCU_MISC2_CTRL) | SCU_PCIE_MAPPING_HIGH | SCU_MALI_RC_MODE | SCU_MALI_DTY_MODE, AST_SCU_MISC2_CTRL);
+}
+#endif
+
+#ifdef SCU_RESET_MCTP
+extern void
+ast_scu_init_mctp(void)
+{
+	//Notice : Must after Host reset
+//	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_MCTP, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_MCTP, AST_SCU_RESET);
+}
+#endif
+
+#ifdef SCU_RESET_XDMA
+extern void
+ast_scu_init_xdma(void)
+{
+	//Notice : 1. Must after Host reset, 2. DRAM Controller 0x08 memory protection must disable [Protect REQ#] 3. VGA PCI Bus master enable offset 0x04[bit2]
+//	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_XDMA, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_XDMA, AST_SCU_RESET);
+}
+#endif
+
+extern void
+ast_scu_init_peci(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_PECI, AST_SCU_RESET);
+	udelay(3);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_PECI, AST_SCU_RESET);
+}
+
+
+extern void
+ast_scu_init_jtag(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_JTAG, AST_SCU_RESET);
+	udelay(3);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_JTAG, AST_SCU_RESET);
+}
+
+#ifdef SCU_RESET_HACE
+extern void
+ast_scu_init_hace(void)
+{
+	//enable YCLK for HAC
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) &
+					~(SCU_YCLK_STOP_EN | SCU_RSACLK_STOP_EN),
+					AST_SCU_CLK_STOP);
+	mdelay(1);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) &
+					~SCU_RESET_HACE,
+					AST_SCU_RESET);
+}
+#endif
+
+extern void
+ast_scu_reset_lpc(void)
+{
+	//Note .. It have been enable in U-boot.....
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_LPC, AST_SCU_RESET);
+
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_LPC, AST_SCU_RESET);
+}
+
+
+extern void
+ast_scu_init_lpc(void)
+{
+	//Note .. It have been enable in U-boot.....
+//	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_LPC, AST_SCU_RESET);
+
+	//enable LPC clock LHCLK = H-PLL/8, SOC_G5 H-PLL/16
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) |
+					SCU_SET_LHCLK_DIV(3) |
+					SCU_LHCLK_SOURCE_EN,
+					AST_SCU_CLK_STOP);
+}
+
+
+//////1 : lpc plus modes
+extern u8
+ast_scu_get_lpc_plus_enable(void)
+{
+	if(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) & SCU_FUN_PIN_LPC_PLUS)
+		return 1;
+	else
+		return 0;
+}
+
+
+#ifdef AST_SOC_G5
+extern void
+ast_scu_init_rfx(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_RFX, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET2) | (SCU_RESET_RFXDEC | SCU_RESET_RFXCMQ | SCU_RESET_BITBLT), AST_SCU_RESET2);
+
+	//Use D1-PLL
+	ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~(SCU_ECLK_SOURCE_MASK | SCU_CLK_VIDEO_SLOW_MASK | SCU_CLK_VIDEO_SLOW_EN)), AST_SCU_CLK_SEL);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_ECLK_SOURCE(2), AST_SCU_CLK_SEL);
+
+	ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_D_PLL_DIS) | SCU_MISC_D_PLL_SOURCE, AST_SCU_MISC1_CTRL);
+
+	ast_scu_write(0x75402031, AST_SCU_D_PLL);
+	ast_scu_write(0x00000580, AST_SCU_DPLL_PAR0);
+	ast_scu_write(0x00000000, AST_SCU_DPLL_PAR1);
+	ast_scu_write(0x0004AB1C, AST_SCU_DPLL_PAR2);
+
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & 	~(SCU_RFX_CLK_STOP_EN), AST_SCU_CLK_STOP);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP2) & ~(SCU_CMQCLK_STOP | SCU_RFXCLK_STOP | SCU_BITBLTCLK_STOP), AST_SCU_CLK_STOP2);
+	udelay(3);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_RFX, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET2) & ~(SCU_RESET_RFXDEC | SCU_RESET_RFXCMQ | SCU_RESET_BITBLT), AST_SCU_RESET2);
+
+	//Multi fun pin
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) | SCU_FUN_PIN_DVO_24BIT, AST_SCU_FUN_PIN_CTRL6);
+
+}
+#else
+extern void
+ast_scu_init_rfx(void)
+{
+}
+#endif
+
+#ifdef SCU_RESET_H264
+extern void
+ast_scu_init_h264(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_H264, AST_SCU_RESET);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL2) & 	~SCU_H264CLK_MASK, AST_SCU_CLK_SEL2);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL2) | SCU_SET_H264CLK_DIV(3), AST_SCU_CLK_SEL2);
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & 	~SCU_H264_STOP_EN, AST_SCU_CLK_STOP);
+	udelay(3);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_H264, AST_SCU_RESET);
+}
+#endif
+
+/* 0:disable spi 1: enable spi master 2:enable spi master and spi slave to ahb 3: enable spi pass-through*/
+extern void
+ast_scu_spi_master(u8 mode)
+{
+#ifdef AST_SOC_G5
+	switch(mode) {
+		case 0:
+			ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
+			break;
+		case 1:
+			ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
+			ast_scu_write(SCU_HW_STRAP_SPI_MASTER, AST_SCU_HW_STRAP1);
+			break;
+		case 2:
+			ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
+			ast_scu_write(SCU_HW_STRAP_SPI_M_S_EN, AST_SCU_HW_STRAP1);
+			break;
+		case 3:
+			ast_scu_write(SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_REVISION_ID);
+			ast_scu_write(SCU_HW_STRAP_SPI_PASS_THROUGH, AST_SCU_HW_STRAP1);
+			break;
+	}
+#else
+	switch(mode) {
+		case 0:
+			ast_scu_write(ast_scu_read(AST_SCU_HW_STRAP1) & ~SCU_HW_STRAP_SPI_MODE_MASK, AST_SCU_HW_STRAP1);
+			break;
+		case 1:
+			ast_scu_write((ast_scu_read(AST_SCU_HW_STRAP1) & ~SCU_HW_STRAP_SPI_MODE_MASK) |SCU_HW_STRAP_SPI_MASTER, AST_SCU_HW_STRAP1);
+			break;
+		case 2:
+			ast_scu_write((ast_scu_read(AST_SCU_HW_STRAP1) & ~SCU_HW_STRAP_SPI_MODE_MASK) |SCU_HW_STRAP_SPI_MASTER, AST_SCU_HW_STRAP1);
+			break;
+		case 3:
+			ast_scu_write((ast_scu_read(AST_SCU_HW_STRAP1) & ~SCU_HW_STRAP_SPI_MODE_MASK) |SCU_HW_STRAP_SPI_PASS_THROUGH, AST_SCU_HW_STRAP1);
+			break;
+	}
+
+#endif
+}
+
+
+#ifdef SCU_RESET_CRT
+extern void
+ast_scu_init_crt(void)
+{
+	//ast2400 : VGA use D1 clk, CRT use D2 clk
+	//ast2500 : VGA use D1 clk, CRT use 40Mhz
+	//ast3200/ast1520 : VGA use D1 clk, CRT use D1/D2 clk select L: SCU08[bit 8] - H SCU2C[bit 21]
+
+#ifdef AST_SOC_G5
+
+#ifdef CONFIG_ARCH_AST3200
+	//Select D2 CLK source 00:D-PLL, 01: D2-PLL, 1x : 40Mhz
+	//H: 2c[bit : 21], L: 08[bit : 8]
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_CLK_VIDE0_SO_D2 , AST_SCU_CLK_SEL);
+
+	//Select D2-PLL parameter source [01]
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_SEL) | SCU_CRT_CLK_L_SOURCE , AST_SCU_CLK_SEL);
+	ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_CRT_CLK_H_SOURCE , AST_SCU_MISC1_CTRL);
+
+	//Off D2-PLL
+//	ast_scu_write(ast_scu_read(AST_SCU_D2_PLL_EXTEND) |  SCU_D2_PLL_OFF | SCU_D2_PLL_RESET , AST_SCU_D2_PLL_EXTEND);
+	ast_scu_write(0x585, AST_SCU_D2_PLL_EXTEND);
+
+	//set D2-PLL parameter
+	ast_scu_write((0x15 << 27) | (0xE << 22) | (0x03D << 13) | (0x40), AST_SCU_D2_PLL);
+
+	//enable D2-PLL
+//	ast_scu_write(ast_scu_read(AST_SCU_D2_PLL_EXTEND) &  ~(SCU_D2_PLL_OFF | SCU_D2_PLL_RESET) , AST_SCU_D2_PLL_EXTEND);
+	ast_scu_write(0x580, AST_SCU_D2_PLL_EXTEND);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_CRT, AST_SCU_RESET);
+
+	ast_scu_write(ast_scu_read(AST_SCU_RESET2) & ~(SCU_RESET_CRT0 | SCU_RESET_CRT1 | SCU_RESET_CRT2 | SCU_RESET_CRT3), AST_SCU_RESET2);
+
+#else
+	//ast2500 use 40Mhz (init @ platform.S)
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_CRT, AST_SCU_RESET);
+
+	ast_scu_write(ast_scu_read(AST_SCU_RESET2) & ~SCU_RESET_CRT0, AST_SCU_RESET2);
+#endif
+
+	//enable CRT CLK
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_D2CLK_STOP_EN , AST_SCU_CLK_STOP);
+
+	ast_scu_write(0x1df, 0xd4);
+
+#else
+	//SOC VER < G5
+	/* Enable D2 - PLL */
+	ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_D2_PLL_DIS, AST_SCU_MISC1_CTRL);
+
+	/* Reset CRT */
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) | SCU_RESET_CRT, AST_SCU_RESET);
+
+	/* Set Delay 5 Compensation TODO ...*/
+	ast_scu_write((ast_scu_read(AST_SCU_CLK_SEL) & ~SCU_CLK_VIDEO_DELAY_MASK) |
+						SCU_CLK_VIDEO_DELAY(5), AST_SCU_CLK_SEL);
+
+	//enable D2 CLK
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP) & ~SCU_D2CLK_STOP_EN , AST_SCU_CLK_STOP);
+
+	udelay(10);
+	ast_scu_write(ast_scu_read(AST_SCU_RESET) & ~SCU_RESET_CRT, AST_SCU_RESET);
+
+#endif
+
+
+}
+#endif
+
+extern void
+ast_scu_uartx_init(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP2) &
+				~(SCU_UART_DIV13 | SCU_UARTXCLK_STOP),
+		AST_SCU_CLK_STOP2);
+
+}
+
+
+//***********************************CLK control***********************************
+extern void
+ast_scu_uart_div(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_CLK_STOP2) &
+				~SCU_UART_DIV13,
+		AST_SCU_CLK_STOP2);
+}
+
+
+extern void
+ast_scu_clk_stop(u32 clk_name,u8 stop_enable)
+{
+	switch(clk_name){
+		default:
+			SCUMSG("ERRO clk_name :%d \n",clk_name);
+			break;
+	}
+}
+
+
+//***********************************CLK Information***********************************
+#ifdef CONFIG_ARCH_AST1010
+extern u32
+ast_get_clk_source(void)
+{
+	return AST_PLL_CLOCK;
+}
+#else
+extern u32
+ast_get_clk_source(void)
+{
+	if(ast_scu_read(AST_SCU_HW_STRAP1) & CLK_25M_IN)
+		return AST_PLL_25MHZ;
+	else
+		return AST_PLL_24MHZ;
+}
+#endif
+
+#if defined(AST_SOC_G5)
+extern u32
+ast_get_h_pll_clk(void)
+{
+	u32 clk=0;
+	u32 h_pll_set = ast_scu_read(AST_SCU_H_PLL);
+
+	if(h_pll_set & SCU_H_PLL_OFF)
+		return 0;
+
+	// Programming
+	clk = ast_get_clk_source();
+	if(h_pll_set & SCU_H_PLL_BYPASS_EN) {
+		return clk;
+	} else {
+		//P = SCU24[18:13]
+		//M = SCU24[12:5]
+		//N = SCU24[4:0]
+		//hpll = 24MHz * [(M+1) /(N+1)] / (P+1)
+		clk = ((clk * (SCU_H_PLL_GET_MNUM(h_pll_set) + 1)) / (SCU_H_PLL_GET_NNUM(h_pll_set) + 1)) /(SCU_H_PLL_GET_PNUM(h_pll_set) + 1);
+	}
+	SCUDBUG("h_pll = %d\n",clk);
+	return clk;
+}
+
+
+extern u32
+ast_get_m_pll_clk(void)
+{
+	u32 clk=0;
+	u32 m_pll_set = ast_scu_read(AST_SCU_M_PLL);
+
+	if(m_pll_set & SCU_M_PLL_OFF)
+		return 0;
+
+	// Programming
+	clk = ast_get_clk_source();
+	if(m_pll_set & SCU_M_PLL_BYPASS) {
+		return clk;
+	} else {
+		//PD  == SCU20[13:18]
+		//M  == SCU20[5:12]
+		//N  == SCU20[0:4]
+		//mpll =  24MHz * [(M+1) /(N+1)] / (P+1)
+		clk = ((clk * (SCU_M_PLL_GET_MNUM(m_pll_set) + 1)) / (SCU_M_PLL_GET_NNUM(m_pll_set) + 1))/(SCU_M_PLL_GET_PDNUM(m_pll_set) + 1);
+	}
+	SCUDBUG("m_pll = %d\n",clk);
+	return clk;
+}
+
+
+extern u32
+ast_get_ahbclk(void)
+{
+	unsigned int axi_div, ahb_div, hpll;
+
+	hpll = ast_get_h_pll_clk();
+	//AST2500 A1 fix
+	axi_div = 2;
+	ahb_div = (SCU_HW_STRAP_GET_AXI_AHB_RATIO(ast_scu_read(AST_SCU_HW_STRAP1)) + 1);
+
+	SCUDBUG("HPLL=%d, AXI_Div=%d, AHB_DIV = %d, AHB CLK=%d\n", hpll, axi_div, ahb_div, (hpll/axi_div)/ahb_div);
+	return ((hpll/axi_div)/ahb_div);
+
+}
+
+
+extern u32
+ast_get_d2_pll_clk(void)
+{
+	u32 clk=0;
+	u32 d2_pll_set = ast_scu_read(AST_SCU_D2_PLL);
+	u32 d2_pll_conf = ast_scu_read(AST_SCU_D2_PLL_EXTEND);
+	u32 MNUM,NNUM,PNUM,ODNUM;
+
+	if(d2_pll_conf & SCU_D2_PLL_OFF)
+		return 0;
+
+	// Programming
+	clk = ast_get_clk_source();
+	if(d2_pll_conf & SCU_D2_PLL_BYPASS) {
+		return clk;
+	} else {
+		MNUM = SCU_D2_PLL_GET_MNUM(d2_pll_set);
+		MNUM += 1;
+		NNUM = SCU_D2_PLL_GET_NNUM(d2_pll_set);
+		NNUM += 1;
+		PNUM = SCU_D2_PLL_GET_PNUM(d2_pll_set);
+		PNUM += 1;
+		ODNUM = SCU_D2_PLL_GET_ODNUM(d2_pll_set);
+		ODNUM += 1;
+//		printf("clk %d ,num %d ,denum %d ,od %d ,pd %d ,pd2 %d \n",clk, NUM , DENUM, OD, PD, PD2);
+		//hpll = 24MHz * [(M + 1) /(N + 1)] / (P + 1) / (OD + 1)
+		clk = (clk * MNUM) / (NNUM) / PNUM / ODNUM;
+	}
+
+	SCUDBUG("d2_pll = %d\n",clk);
+	return clk;
+}
+
+
+extern void
+ast_set_d2_pll_clk(u32 pll_setting)
+{
+	//Off D2-PLL
+//	ast_scu_write(ast_scu_read(AST_SCU_D2_PLL_EXTEND) |  SCU_D2_PLL_OFF | SCU_D2_PLL_RESET , AST_SCU_D2_PLL_EXTEND);
+	ast_scu_write(0x585, AST_SCU_D2_PLL_EXTEND);
+
+	//set D2-PLL parameter
+	ast_scu_write(pll_setting, AST_SCU_D2_PLL);
+
+	//enable D2-PLL
+//	ast_scu_write(ast_scu_read(AST_SCU_D2_PLL_EXTEND) &  ~(SCU_D2_PLL_OFF | SCU_D2_PLL_RESET) , AST_SCU_D2_PLL_EXTEND);
+	ast_scu_write(0x580, AST_SCU_D2_PLL_EXTEND);
+
+}
+
+
+extern u32
+ast_get_d_pll_clk(void)
+{
+	u32 clk=0;
+	u32 d_pll_set = ast_scu_read(AST_SCU_D_PLL);
+	u32 d_pll_conf = ast_scu_read(AST_SCU_D_PLL_EXTEND0);
+	u32 MNUM,NNUM,PNUM,ODNUM;
+
+	if(d_pll_conf & SCU_D_PLL_OFF)
+		return 0;
+
+	// Programming
+	clk = ast_get_clk_source();
+	if(d_pll_conf & SCU_D_PLL_BYPASS) {
+		return clk;
+	} else {
+		MNUM = SCU_D_PLL_GET_MNUM(d_pll_set);
+		MNUM += 1;
+		NNUM = SCU_D_PLL_GET_NNUM(d_pll_set);
+		NNUM += 1;
+		PNUM = SCU_D_PLL_GET_PNUM(d_pll_set);
+		PNUM += 1;
+		ODNUM = SCU_D_PLL_GET_ODNUM(d_pll_set);
+		ODNUM += 1;
+//		printf("clk %d ,num %d ,denum %d ,od %d ,pd %d ,pd2 %d \n",clk, NUM , DENUM, OD, PD, PD2);
+		//hpll = 24MHz * [(M + 1) /(N + 1)] / (P + 1) / (OD + 1)
+		clk = (clk * MNUM) / (NNUM) / PNUM / ODNUM;
+	}
+
+	SCUDBUG("d_pll = %d\n",clk);
+	return clk;
+}
+
+
+#elif defined(CONFIG_ARCH_AST1010)
+extern u32
+ast_get_h_pll_clk(void)
+{
+	u32 speed,clk=0;
+	u32 OD, NUM, DENUM;
+	u32 h_pll_set = ast_scu_read(AST_SCU_H_PLL);
+
+	clk = AST_PLL_CLOCK;
+	OD = (1 << (SCU_H_PLL_GET_DIV(h_pll_set)));
+	NUM = SCU_H_PLL_GET_NUM(h_pll_set);
+	DENUM = SCU_H_PLL_GET_DENUM(h_pll_set);
+	//hpll = 24MHz * (Numerator+1) / ((OD) * (Denumerator+1))
+	clk = clk * (NUM + 1) / OD / (DENUM + 1);
+
+//	printf("h_pll = %d\n",clk);
+	return clk;
+}
+
+extern u32
+ast_get_ahbclk(void)
+{
+	return ast_get_h_pll_clk();
+}
+
+
+extern u32
+ast_get_ahb_div(void)
+{
+	u32 div = ast_scu_read(AST_SCU_CLK_SEL);
+	div = SCU_GET_AHB_DIV(div);
+	div = (div + 1) * 2;
+	return div;
+}
+
+#else
+extern u32
+ast_get_h_pll_clk(void)
+{
+	u32 speed,clk=0;
+	u32 h_pll_set = ast_scu_read(AST_SCU_H_PLL);
+
+	if(h_pll_set & SCU_H_PLL_OFF)
+		return 0;
+
+	if(h_pll_set & SCU_H_PLL_PARAMETER) {
+		// Programming
+		clk = ast_get_clk_source();
+		if(h_pll_set & SCU_H_PLL_BYPASS_EN) {
+			return clk;
+		} else {
+			//OD == SCU24[4]
+			//OD = SCU_H_PLL_GET_DIV(h_pll_set);
+			//Numerator == SCU24[10:5]
+			//num = SCU_H_PLL_GET_NUM(h_pll_set);
+			//Denumerator == SCU24[3:0]
+			//denum = SCU_H_PLL_GET_DENUM(h_pll_set);
+
+			//hpll = 24MHz * (2-OD) * ((Numerator+2)/(Denumerator+1))
+			clk = ((clk * (2-SCU_H_PLL_GET_DIV(h_pll_set)) * (SCU_H_PLL_GET_NUM(h_pll_set)+2))/(SCU_H_PLL_GET_DENUM(h_pll_set)+1));
+		}
+	} else {
+		// HW Trap
+		speed = SCU_HW_STRAP_GET_H_PLL_CLK(ast_scu_read(AST_SCU_HW_STRAP1));
+		switch (speed) {
+			case 0:
+				clk = 384000000;
+				break;
+			case 1:
+				clk = 360000000;
+				break;
+			case 2:
+				clk = 336000000;
+				break;
+			case 3:
+				clk = 408000000;
+				break;
+			default:
+				BUG();
+				break;
+		}
+	}
+	SCUDBUG("h_pll = %d\n",clk);
+	return clk;
+}
+
+
+extern u32
+ast_get_m_pll_clk(void)
+{
+	u32 clk=0;
+	u32 m_pll_set = ast_scu_read(AST_SCU_M_PLL);
+
+	if(m_pll_set & SCU_M_PLL_OFF)
+		return 0;
+
+	// Programming
+	clk = ast_get_clk_source();
+	if(m_pll_set & SCU_M_PLL_BYPASS) {
+		return clk;
+	} else {
+		//OD == SCU24[4]
+		//OD = SCU_M_PLL_GET_DIV(h_pll_set);
+		//Numerator == SCU24[10:5]
+		//num = SCU_M_PLL_GET_NUM(h_pll_set);
+		//Denumerator == SCU24[3:0]
+		//denum = SCU_M_PLL_GET_DENUM(h_pll_set);
+
+		//hpll = 24MHz * (2-OD) * ((Numerator+2)/(Denumerator+1))
+		clk = (clk * (2-SCU_M_PLL_GET_DIV(m_pll_set)) * ((SCU_M_PLL_GET_NUM(m_pll_set)+2)/(SCU_M_PLL_GET_DENUM(m_pll_set)+1)));
+	}
+	SCUDBUG("m_pll = %d\n",clk);
+	return clk;
+}
+
+
+extern u32
+ast_get_ahbclk(void)
+{
+	unsigned int div, hpll;
+
+	hpll = ast_get_h_pll_clk();
+	div = SCU_HW_STRAP_GET_CPU_AHB_RATIO(ast_scu_read(AST_SCU_HW_STRAP1));
+	div += 1;
+
+	SCUDBUG("HPLL=%d, Div=%d, AHB CLK=%d\n", hpll, div, hpll/div);
+	return (hpll/div);
+}
+
+
+extern u32
+ast_get_d2_pll_clk(void)
+{
+	u32 clk=0;
+	u32 d2_pll_set = ast_scu_read(AST_SCU_D2_PLL);
+	u32 OD,NUM,DENUM,PD,PD2;
+
+	if(d2_pll_set & SCU_D2_PLL_OFF)
+		return 0;
+
+	// Programming
+	clk = ast_get_clk_source();
+	if(d2_pll_set & SCU_D2_PLL_BYPASS) {
+		return clk;
+	} else {
+		NUM = SCU_D2_PLL_GET_NUM(d2_pll_set);
+		DENUM = SCU_D2_PLL_GET_DENUM(d2_pll_set);
+		OD = SCU_D2_PLL_GET_OD(d2_pll_set);
+		OD = (1 << (OD - 1));
+		PD = SCU_D2_PLL_GET_PD(d2_pll_set);
+		PD += 1;
+		PD2 = SCU_D2_PLL_GET_PD2(d2_pll_set);
+		PD2 += 1;
+//		printf("clk %d ,num %d ,denum %d ,od %d ,pd %d ,pd2 %d \n",clk, NUM , DENUM, OD, PD, PD2);
+		//hpll = 24MHz * (Numerator * 2) / (Denumerator * OD * PD * PD2)
+		clk = (clk * NUM * 2) / (DENUM* OD * PD * PD2);
+	}
+
+	SCUDBUG("d2_pll = %d\n",clk);
+	return clk;
+}
+
+
+#endif
+
+extern u32
+ast_get_pclk(void)
+{
+	unsigned int div, hpll;
+
+	hpll = ast_get_h_pll_clk();
+	div = SCU_GET_PCLK_DIV(ast_scu_read(AST_SCU_CLK_SEL));
+#ifdef AST_SOC_G5
+	div = (div+1) << 2;
+#else
+	div = (div+1) << 1;
+#endif
+
+	SCUDBUG("HPLL=%d, Div=%d, PCLK=%d\n", hpll, div, hpll/div);
+	return (hpll/div);
+
+}
+
+
+extern u32
+ast_get_lhclk(void)
+{
+	unsigned int div, hpll;
+	u32 clk_sel = ast_scu_read(AST_SCU_CLK_SEL);
+//FPGA AST1070 is default 100/2 Mhz input
+//	return 50000000;
+	hpll = ast_get_h_pll_clk();
+	if(SCU_LHCLK_SOURCE_EN & clk_sel) {
+		div = SCU_GET_LHCLK_DIV(clk_sel);
+#ifdef AST_SOC_G5
+		div = (div+1) << 2;
+#else
+		div = (div+1) << 1;
+#endif
+		SCUDBUG("HPLL=%d, Div=%d, LHCLK = %d\n", hpll, div, hpll/div);
+		return (hpll/div);
+	} else {
+		SCUMSG("LPC CLK not enable \n");
+		return 0;
+	}
+
+}
+
+
+//Because value 0 is not allowed in SDIO12C D[15:8]: Host Control Settings #1 Register, we have to increase the maximum
+//host's clock in case that system will not ask host to set 1 in the sdhci_set_clock() function
+/*
+SCU7C: Silicon Revision ID Register
+D[31:24]: Chip ID
+0: AST2050/AST2100/AST2150/AST2200/AST3000
+1: AST2300
+
+D[23:16] Silicon revision ID for AST2300 generation and later
+0: A0
+1: A1
+2: A2
+.
+.
+.
+FPGA revision starts from 0x80
+
+
+D[11:8] Bounding option
+
+D[7:0] Silicon revision ID for AST2050/AST2100 generation (for software compatible)
+0: A0
+1: A1
+2: A2
+3: A3
+.
+.
+FPGA revision starts from 0x08, 8~10 means A0, 11+ means A1, AST2300 should be assigned to 3
+*/
+
+extern u32
+ast_get_sd_clock_src(void)
+{
+	u32 clk=0, sd_div;
+
+	clk = ast_get_h_pll_clk();
+	//get div
+	sd_div = SCU_CLK_SD_GET_DIV(ast_scu_read(AST_SCU_CLK_SEL));
+#ifdef AST_SOC_G5
+		sd_div = (sd_div+1) << 2;
+#else
+		sd_div = (sd_div+1) << 1;
+#endif
+		SCUDBUG("div %d, sdclk =%d \n",sd_div,clk/sd_div);
+		clk /= sd_div;
+
+	return clk;
+}
+
+
+extern void
+ast_scu_show_system_info (void)
+{
+
+#ifdef AST_SOC_G5
+	unsigned int axi_div, ahb_div, h_pll;
+
+	h_pll = ast_get_h_pll_clk();
+
+	//AST2500 A1 fix
+	axi_div = 2;
+	ahb_div = (SCU_HW_STRAP_GET_AXI_AHB_RATIO(ast_scu_read(AST_SCU_HW_STRAP1)) + 1);
+
+	SCUMSG("CPU = %d MHz , AXI = %d MHz, AHB = %d MHz (%d:%d:1) \n",
+			h_pll/1000000,
+			h_pll/axi_div/1000000,
+			h_pll/axi_div/ahb_div/1000000, axi_div, ahb_div);
+
+#else
+	u32 h_pll, div;
+
+	h_pll = ast_get_h_pll_clk();
+
+	div = SCU_HW_STRAP_GET_CPU_AHB_RATIO(ast_scu_read(AST_SCU_HW_STRAP1));
+	div += 1;
+	SCUMSG("CPU = %d MHz ,AHB = %d MHz (%d:1) \n", h_pll/1000000, h_pll/div/1000000,div);
+#endif
+	return ;
+}
+
+
+//*********************************** Multi-function pin control ***********************************
+extern void
+ast_scu_multi_func_uart(u8 uart)
+{
+	switch(uart) {
+		case 1:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
+						SCU_FUN_PIN_UART1_RXD |
+						SCU_FUN_PIN_UART1_TXD |
+						SCU_FUN_PIN_UART1_NRTS |
+						SCU_FUN_PIN_UART1_NDTR |
+						SCU_FUN_PIN_UART1_NRI |
+						SCU_FUN_PIN_UART1_NDSR |
+						SCU_FUN_PIN_UART1_NDCD |
+						SCU_FUN_PIN_UART1_NCTS,
+				AST_SCU_FUN_PIN_CTRL2);
+			break;
+		case 2:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
+						SCU_FUN_PIN_UART2_RXD |
+						SCU_FUN_PIN_UART2_TXD |
+						SCU_FUN_PIN_UART2_NRTS |
+						SCU_FUN_PIN_UART2_NDTR |
+						SCU_FUN_PIN_UART2_NRI |
+						SCU_FUN_PIN_UART2_NDSR |
+						SCU_FUN_PIN_UART2_NDCD |
+						SCU_FUN_PIN_UART2_NCTS,
+				AST_SCU_FUN_PIN_CTRL2);
+			break;
+		case 3:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+						SCU_FUN_PIN_UART3_RXD |
+						SCU_FUN_PIN_UART3_TXD |
+						SCU_FUN_PIN_UART3_NRTS |
+						SCU_FUN_PIN_UART3_NDTR |
+						SCU_FUN_PIN_UART3_NRI |
+						SCU_FUN_PIN_UART3_NDSR |
+						SCU_FUN_PIN_UART3_NDCD |
+						SCU_FUN_PIN_UART3_NCTS,
+				AST_SCU_FUN_PIN_CTRL1);
+			break;
+		case 4:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+						SCU_FUN_PIN_UART4_RXD |
+						SCU_FUN_PIN_UART4_TXD |
+						SCU_FUN_PIN_UART4_NRTS |
+						SCU_FUN_PIN_UART4_NDTR |
+						SCU_FUN_PIN_UART4_NRI |
+						SCU_FUN_PIN_UART4_NDSR |
+						SCU_FUN_PIN_UART4_NDCD |
+						SCU_FUN_PIN_UART4_NCTS,
+				AST_SCU_FUN_PIN_CTRL1);
+			break;
+		case 6:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+						SCU_FUC_PIN_UART6,
+				AST_SCU_FUN_PIN_CTRL5);
+			break;
+#ifdef AST_SOC_G5
+		case 7:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+						SCU_FUN_PIN_UART7,
+				AST_SCU_FUN_PIN_CTRL6);
+			break;
+		case 8:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+						SCU_FUN_PIN_UART8,
+				AST_SCU_FUN_PIN_CTRL6);
+			break;
+		case 9:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+						SCU_FUN_PIN_UART9,
+				AST_SCU_FUN_PIN_CTRL6);
+			break;
+		case 10:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) &
+						~(SCU_FUN_PIN_VGAVS | SCU_FUN_PIN_VGAHS),
+				AST_SCU_FUN_PIN_CTRL2);
+
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+						SCU_FUN_PIN_UART10,
+				AST_SCU_FUN_PIN_CTRL6);
+			break;
+		case 11:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) &
+						~(SCU_FUN_PIN_DDCDAT | SCU_FUN_PIN_DDCCLK),
+				AST_SCU_FUN_PIN_CTRL2);
+
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+						SCU_FUN_PIN_UART11,
+				AST_SCU_FUN_PIN_CTRL6);
+			break;
+		case 12:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+						SCU_FUN_PIN_UART12,
+				AST_SCU_FUN_PIN_CTRL6);
+			break;
+		case 13:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) |
+						SCU_FUN_PIN_UART13,
+				AST_SCU_FUN_PIN_CTRL6);
+			break;
+#endif
+	}
+
+
+}
+
+extern void
+ast_scu_multi_func_video()
+{
+#if defined(CONFIG_ARCH_2100) || defined(CONFIG_ARCH_2200)
+	ast_scu_write(ast_scu_read(AST_SCU_MULTI_FUNC_2) |
+				MULTI_FUNC_VIDEO_RGB18 |
+				MULTI_FUNC_VIDEO_SINGLE_EDGE,
+		AST_SCU_MULTI_FUNC_2);
+#elif defined(CONFIG_ARCH_1100) || defined(CONFIG_ARCH_2050)
+	ast_scu_write(ast_scu_read(AST_SCU_MULTI_FUNC_2) |
+				MULTI_FUNC_VIDEO_RGB18 |
+				MULTI_FUNC_VIDEO_SINGLE_EDGE,
+		AST_SCU_MULTI_FUNC_2);
+#else
+
+#endif
+}
+
+#ifdef CONFIG_ARCH_AST1010
+extern void
+ast_scu_multi_func_eth(u8 num)
+{
+	switch(num) {
+		case 0:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
+						SCU_FUN_PIN_MAC0_MDIO |
+						SCU_FUN_PIN_MAC0_MDC |
+						0xff000000,
+				AST_SCU_FUN_PIN_CTRL3);
+
+			/* Currently we use fix value in MAC timing on EVB */
+			ast_scu_write(0x2255, AST_SCU_MAC_CLK);
+
+			break;
+		case 1:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+						SCU_FUN_PIN_MAC1_PHY_LINK,
+				AST_SCU_FUN_PIN_CTRL1);
+
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+						SCU_FUC_PIN_MAC1_MDIO,
+				AST_SCU_FUN_PIN_CTRL5);
+
+			break;
+	}
+}
+#else
+extern void
+ast_scu_multi_func_eth(u8 num)
+{
+	switch(num) {
+		case 0:
+			if(ast_scu_read(AST_SCU_HW_STRAP1) & SCU_HW_STRAP_MAC0_RGMII) {
+				SCUMSG("MAC0 : RGMII \n");
+				ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+							SCU_FUN_PIN_MAC0_PHY_LINK,
+					AST_SCU_FUN_PIN_CTRL1);
+			} else {
+				SCUMSG("MAC0 : RMII/NCSI \n");
+				ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) &
+							~SCU_FUN_PIN_MAC0_PHY_LINK,
+					AST_SCU_FUN_PIN_CTRL1);
+			}
+
+#ifdef AST_SOC_G5
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+						SCU_FUN_PIN_MAC0_PHY_LINK,
+				AST_SCU_FUN_PIN_CTRL1);
+
+#endif
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
+						SCU_FUN_PIN_MAC0_MDIO |
+						SCU_FUN_PIN_MAC0_MDC,
+				AST_SCU_FUN_PIN_CTRL3);
+
+			break;
+		case 1:
+			if(ast_scu_read(AST_SCU_HW_STRAP1) & SCU_HW_STRAP_MAC1_RGMII) {
+				SCUMSG("MAC1 : RGMII \n");
+				ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+							SCU_FUN_PIN_MAC1_PHY_LINK,
+					AST_SCU_FUN_PIN_CTRL1);
+			} else {
+				SCUMSG("MAC1 : RMII/NCSI \n");
+				ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) &
+						~SCU_FUN_PIN_MAC1_PHY_LINK,
+					AST_SCU_FUN_PIN_CTRL1);
+			}
+
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL1) |
+						SCU_FUN_PIN_MAC1_PHY_LINK,
+				AST_SCU_FUN_PIN_CTRL1);
+
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+						SCU_FUC_PIN_MAC1_MDIO,
+				AST_SCU_FUN_PIN_CTRL5);
+
+			break;
+	}
+}
+#endif
+
+extern void
+ast_scu_multi_func_nand(void)
+{
+#ifdef AST_SOC_G5
+#else
+	//enable NAND flash multipin FLBUSY and FLWP
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
+				SCU_FUN_PIN_NAND_FLBUSY | SCU_FUN_PIN_NAND_FLWP,
+		AST_SCU_FUN_PIN_CTRL2);
+#endif
+
+}
+
+#if 0
+extern void
+ast_scu_multi_func_nor(void)
+{
+	//Address
+	//ROMA2~17
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL8) |
+				SCU_FUN_PIN_ROMA2 | SCU_FUN_PIN_ROMA3 |
+				SCU_FUN_PIN_ROMA4 | SCU_FUN_PIN_ROMA5 |
+				SCU_FUN_PIN_ROMA6 | SCU_FUN_PIN_ROMA7 |
+				SCU_FUN_PIN_ROMA8 | SCU_FUN_PIN_ROMA9 |
+				SCU_FUN_PIN_ROMA10 | SCU_FUN_PIN_ROMA11 |
+				SCU_FUN_PIN_ROMA12 | SCU_FUN_PIN_ROMA13 |
+				SCU_FUN_PIN_ROMA14 | SCU_FUN_PIN_ROMA15 |
+				SCU_FUN_PIN_ROMA16 | SCU_FUN_PIN_ROMA17,
+		AST_SCU_FUN_PIN_CTRL8);
+
+	//ROMA18~21
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL9) |
+				SCU_FUN_PIN_ROMA18 | SCU_FUN_PIN_ROMA19 |
+				SCU_FUN_PIN_ROMA20 | SCU_FUN_PIN_ROMA21,
+		AST_SCU_FUN_PIN_CTRL9);
+
+	//ROMA22,23
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL4) | SCU_FUN_PIN_ROMA22 | SCU_FUN_PIN_ROMA23,
+		AST_SCU_FUN_PIN_CTRL4);
+
+	//ROMA24,25
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) | SCU_FUN_PIN_ROMA24 | SCU_FUN_PIN_ROMA25,
+		AST_SCU_FUN_PIN_CTRL3);
+
+	//SCU94 [1] = 0
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL6) & SCU_VIDEO_OUT_MASK,
+		AST_SCU_FUN_PIN_CTRL6);
+
+
+	//data
+	//ROMD 4~7 //ROMWE#, OE#
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL4) |
+			SCU_FUN_PIN_ROMOE | SCU_FUN_PIN_ROMWE |
+			SCU_FUN_PIN_ROMD4 | SCU_FUN_PIN_ROMD5 |
+			SCU_FUN_PIN_ROMD6 | SCU_FUN_PIN_ROMD7,
+			AST_SCU_FUN_PIN_CTRL4);
+
+	//ROMD 8~15
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			SCU_FUC_PIN_ROM_16BIT,
+		AST_SCU_FUN_PIN_CTRL5);
+
+}
+#endif
+
+extern void
+ast_scu_multi_func_romcs(u8 num)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
+			SCU_FUN_PIN_ROMCS(num),
+		AST_SCU_FUN_PIN_CTRL3);
+}
+
+extern void
+ast_scu_multi_func_i2c(void)
+{
+	//TODO check ... //In AST2400 Due to share pin with SD , please not enable I2C 10 ~14
+	// AST 2400 have 14 , AST 2300 9 ...
+#ifdef CONFIG_MMC_AST
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			SCU_FUC_PIN_I2C3 |
+			SCU_FUC_PIN_I2C4 |
+			SCU_FUC_PIN_I2C5 |
+			SCU_FUC_PIN_I2C6 |
+			SCU_FUC_PIN_I2C7 |
+			SCU_FUC_PIN_I2C8 |
+			SCU_FUC_PIN_I2C9,
+		AST_SCU_FUN_PIN_CTRL5);
+#else
+	ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL5) |
+			SCU_FUC_PIN_I2C3 |
+			SCU_FUC_PIN_I2C4 |
+			SCU_FUC_PIN_I2C5 |
+			SCU_FUC_PIN_I2C6 |
+			SCU_FUC_PIN_I2C7 |
+			SCU_FUC_PIN_I2C8 |
+			SCU_FUC_PIN_I2C9 |
+			SCU_FUC_PIN_I2C10 |
+			SCU_FUC_PIN_I2C11 |
+			SCU_FUC_PIN_I2C12 |
+			SCU_FUC_PIN_I2C13 |
+			SCU_FUC_PIN_I2C14) &
+			~(SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD2),
+		AST_SCU_FUN_PIN_CTRL5);
+#endif
+}
+
+
+extern void
+ast_scu_multi_func_pwm_tacho(void)
+{
+	//TODO check
+	u32 sts = ast_scu_read(AST_SCU_FUN_PIN_CTRL3) &~0xcfffff;
+	ast_scu_write(sts | 0xc000ff, AST_SCU_FUN_PIN_CTRL3);
+}
+
+
+//0 : usb 2.0 hub mode, 1:usb 2.0 host2 controller
+extern void
+ast_scu_multi_func_usb_port1_mode(u8 mode)
+{
+	if(mode)
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_USB20_HOST,
+					AST_SCU_FUN_PIN_CTRL5);
+	else
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) & ~SCU_FUC_PIN_USB20_HOST,
+					AST_SCU_FUN_PIN_CTRL5);
+}
+
+
+//0 : 1.1 hid 1, 1.1 host , 2, 2.0 host 3, 2.0 device
+extern void
+ast_scu_multi_func_usb_port2_mode(u8 mode)
+{
+#if defined(AST_SOC_G5)
+	if(mode == 0)
+		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) & ~SCU_FUN_PIN_USBP1_MASK),
+					AST_SCU_FUN_PIN_CTRL6);
+	else if ((mode == 1) || (mode == 2))
+		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) & ~SCU_FUN_PIN_USBP1_MASK) |
+					SCU_FUN_PIN_USBP1_MODE(0x2),
+					AST_SCU_FUN_PIN_CTRL6);
+	else if (mode == 3)
+		ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) & ~SCU_FUN_PIN_USBP1_MASK) |
+					SCU_FUN_PIN_USBP1_MODE(0x1),
+					AST_SCU_FUN_PIN_CTRL6);
+	else {
+		printf("nothing\n");
+	}
+#else
+	if(mode == 0)
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) & ~SCU_FUC_PIN_USB11_PORT2,
+					AST_SCU_FUN_PIN_CTRL5);
+	else if (mode == 1)
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_USB11_PORT2,
+			AST_SCU_FUN_PIN_CTRL5);
+	else if (mode == 2)
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_USB20_HOST,
+					AST_SCU_FUN_PIN_CTRL5);
+	else {
+		printf("nothing\n");
+	}
+#endif
+}
+
+
+//0 : gpioQ6,7 mode , 1: usb1.1 host port 4 mode
+extern void
+ast_scu_multi_func_usb_port34_mode(u8 mode)
+{
+#if defined(AST_SOC_G5)
+	if(mode) {
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_USB11_PORT4,
+					AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
+					(SCU_FUN_PIN_USBP3_DP |SCU_FUN_PIN_USBP3_DN | SCU_FUN_PIN_USBP4_DP | SCU_FUN_PIN_USBP4_DN),
+					AST_SCU_FUN_PIN_CTRL3);
+	} else {
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) & ~SCU_FUC_PIN_USB11_PORT4,
+					AST_SCU_FUN_PIN_CTRL5);
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) &
+					~(SCU_FUN_PIN_USBP3_DP |SCU_FUN_PIN_USBP3_DN | SCU_FUN_PIN_USBP4_DP | SCU_FUN_PIN_USBP4_DN),
+					AST_SCU_FUN_PIN_CTRL3);
+	}
+#else
+	if(mode) {
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_USB11_PORT4,
+					AST_SCU_FUN_PIN_CTRL5);
+	} else {
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) & ~SCU_FUC_PIN_USB11_PORT4,
+					AST_SCU_FUN_PIN_CTRL5);
+	}
+#endif
+}
+
+
+//0 : 1: SD1 function
+extern void
+ast_scu_multi_func_sdhc_8bit_mode(void)
+{
+		ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD1_8BIT,
+					AST_SCU_FUN_PIN_CTRL5);
+}
+
+
+extern void
+ast_scu_multi_func_sdhc_slot(u8 slot)
+{
+	switch(slot) {
+		case 1:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_SD1,
+						AST_SCU_FUN_PIN_CTRL5);
+			break;
+		case 2:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_SD2,
+						AST_SCU_FUN_PIN_CTRL5);
+			break;
+		case 3:
+			ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL5) | SCU_FUC_PIN_SD1 | SCU_FUC_PIN_SD2,
+						AST_SCU_FUN_PIN_CTRL5);
+			break;
+	}
+}
+
+
+//0: VGA , 1 : CRT, 2 : PASS through Port -A, 3 : PASS through Port -B
+extern void
+ast_scu_set_crt_source(u8 dac_soource)
+{
+	ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_DAC_MASK) |
+				SCU_MISC_SET_DAC_SOURCE(dac_soource)  , AST_SCU_MISC1_CTRL);
+
+}
+
+
+extern void
+ast_scu_multi_func_crt(void)
+{
+	/* multi-pin for DVO enable DVO (bit18) is VGA , enable DAC (bit16) is CRT  */
+#if defined(CONFIG_AST_DAC) || defined(CONFIG_AST_DVO)
+		ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_DAC_MASK)
+					| SCU_MISC_DAC_SOURCE_CRT | SCU_MISC_DVO_SOURCE_CRT | SCU_MISC_2D_CRT_EN , AST_SCU_MISC1_CTRL);
+#elif defined(CONFIG_AST_DVO)
+		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) | SCU_MISC_DVO_SOURCE_CRT| SCU_MISC_2D_CRT_EN, AST_SCU_MISC1_CTRL);
+#else //default(CONFIG_AST_DAC)
+		ast_scu_write((ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_DAC_MASK)
+					| SCU_MISC_DAC_SOURCE_CRT | SCU_MISC_2D_CRT_EN, AST_SCU_MISC1_CTRL);
+#endif
+
+	//Digital vodeo input function pins : 00 disable, 10 24bits mode 888,
+	ast_scu_write((ast_scu_read(AST_SCU_FUN_PIN_CTRL6) &
+			~SCU_FUC_PIN_DIGI_V_OUT_MASK) |
+			SCU_FUC_PIN_DIGI_V_OUT(VIDEO_24BITS), AST_SCU_FUN_PIN_CTRL6);
+
+	//VPI input
+#if 0
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
+			SCU_FUN_PIN_VPIB9 | SCU_FUN_PIN_VPIB8 |
+			SCU_FUN_PIN_VPIB7 | SCU_FUN_PIN_VPIB6 |
+			SCU_FUN_PIN_VPIB5 | SCU_FUN_PIN_VPIB4 |
+			SCU_FUN_PIN_VPIB3 | SCU_FUN_PIN_VPIB2 |
+			SCU_FUN_PIN_VPIB1 | SCU_FUN_PIN_VPIB0 |
+			SCU_FUN_PIN_VPICLK | SCU_FUN_PIN_VPIVS |
+			SCU_FUN_PIN_VPIHS | SCU_FUN_PIN_VPIODD |
+			SCU_FUN_PIN_VPIDE ,AST_SCU_FUN_PIN_CTRL2);
+
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL3) |
+			SCU_FUN_PIN_VPIR9 | SCU_FUN_PIN_VPIR8 |
+			SCU_FUN_PIN_VPIR7 | SCU_FUN_PIN_VPIR6 |
+			SCU_FUN_PIN_VPIR5 | SCU_FUN_PIN_VPIR4 |
+			SCU_FUN_PIN_VPIR3 | SCU_FUN_PIN_VPIR2 |
+			SCU_FUN_PIN_VPIR1 | SCU_FUN_PIN_VPIR0 |
+			SCU_FUN_PIN_VPIG9 | SCU_FUN_PIN_VPIG8 |
+			SCU_FUN_PIN_VPIG7 | SCU_FUN_PIN_VPIG6 |
+			SCU_FUN_PIN_VPIG5 | SCU_FUN_PIN_VPIG4 |
+			SCU_FUN_PIN_VPIG3 | SCU_FUN_PIN_VPIG2 |
+			SCU_FUN_PIN_VPIG1 | SCU_FUN_PIN_VPIG0 ,AST_SCU_FUN_PIN_CTRL3);
+#endif
+}
+
+
+extern void
+ast_scu_multi_nic_switch(u8 enable)
+{
+	if(enable) {
+		ast_scu_write((0x1 << 28) | ast_scu_read(AST_SCU_MAC_CLK), AST_SCU_MAC_CLK);
+		ast_scu_write(~(0x1 << 11) & ast_scu_read(AST_SCU_RESET), AST_SCU_RESET);	//A1 ECO
+	} else {
+		ast_scu_write(~(0x1 << 28) & ast_scu_read(AST_SCU_MAC_CLK), AST_SCU_MAC_CLK);
+		ast_scu_write((0x1 << 11) | ast_scu_read(AST_SCU_RESET), AST_SCU_RESET);
+	}
+
+}
+
+extern void
+ast_scu_multi_func_sgpio(void)
+{
+	ast_scu_write(ast_scu_read(AST_SCU_FUN_PIN_CTRL2) |
+			SCU_FUN_PIN_SGPMI |
+			SCU_FUN_PIN_SGPMO |
+			SCU_FUN_PIN_SGPMLD |
+			SCU_FUN_PIN_SGPMCK, AST_SCU_FUN_PIN_CTRL2);
+
+}
+
+
+//***********************************Information ***********************************
+extern u32
+ast_scu_revision_id(void)
+{
+	int i;
+	u32 rev_id = ast_scu_read(AST_SCU_REVISION_ID);
+	for(i=0;i<ARRAY_SIZE(soc_map_table);i++) {
+		if(rev_id == soc_map_table[i].rev_id)
+			break;
+	}
+	if(i == ARRAY_SIZE(soc_map_table))
+		SCUMSG("UnKnow-SOC : %x \n",rev_id);
+	else
+		SCUMSG("SOC : %4s \n",soc_map_table[i].name);
+
+	return rev_id;
+}
+
+
+extern void
+ast_scu_security_info(void)
+{
+	switch((ast_scu_read(AST_SCU_HW_STRAP2) >> 18) & 0x3) {
+		case 1:
+			printf("SEC : DSS Mode \n");
+			break;
+		case 2:
+			printf("SEC : UnKnow \n");
+			break;
+		case 3:
+			printf("SEC : SPI2 Mode \n");
+			break;
+	}
+
+}
+
+extern void
+ast_scu_sys_rest_info(void)
+{
+	u32 rest = ast_scu_read(AST_SCU_SYS_CTRL);
+
+#ifdef CONFIG_ARCH_AST1010
+	if(rest & SCU_SYS_WDT_FULL_FLAG) {
+		SCUMSG("RST : External \n");
+		ast_scu_write(SCU_SYS_WDT_FULL_FLAG, AST_SCU_SYS_CTRL);
+	} else if (rest & SCU_SYS_WDT_SOC_RESET) {
+		SCUMSG("RST : Watchdog - SOC\n");
+		ast_scu_write(SCU_SYS_WDT_SOC_RESET, AST_SCU_SYS_CTRL);
+	} else if (rest & SCU_SYS_PWR_RESET_FLAG) {
+		SCUMSG("RST : Power On \n");
+		ast_scu_write(SCU_SYS_PWR_RESET_FLAG, AST_SCU_SYS_CTRL);
+	} else {
+	}
+#else
+	if(rest & SCU_SYS_EXT_RESET_FLAG) {
+		SCUMSG("RST : External \n");
+		ast_scu_write(SCU_SYS_EXT_RESET_FLAG, AST_SCU_SYS_CTRL);
+	} else if (rest & SCU_SYS_WDT_RESET_FLAG) {
+		SCUMSG("RST : Watchdog \n");
+		ast_scu_write(SCU_SYS_WDT_RESET_FLAG, AST_SCU_SYS_CTRL);
+	} else if (rest & SCU_SYS_PWR_RESET_FLAG) {
+		SCUMSG("RST : Power On \n");
+		ast_scu_write(SCU_SYS_PWR_RESET_FLAG, AST_SCU_SYS_CTRL);
+	} else {
+		SCUMSG("RST : CLK en \n");
+	}
+#endif
+}
+
+
+/*
+* D[15:11] in 0x1E6E2040 is NCSI scratch from U-Boot. D[15:14] = MAC1, D[13:12] = MAC2
+* The meanings of the 2 bits are:
+* 00(0): Dedicated PHY
+* 01(1): ASPEED's EVA + INTEL's NC-SI PHY chip EVA
+* 10(2): ASPEED's MAC is connected to NC-SI PHY chip directly
+* 11: Reserved
+*/
+
+extern u32
+ast_scu_get_phy_config(u8 mac_num)
+{
+	u32 scatch = ast_scu_read(AST_SCU_SOC_SCRATCH0);
+
+	switch(mac_num) {
+		case 0:
+			return (SCU_MAC0_GET_PHY_MODE(scatch));
+			break;
+		case 1:
+			return (SCU_MAC1_GET_PHY_MODE(scatch));
+			break;
+		default:
+			SCUMSG("error mac number \n");
+			break;
+	}
+	return -1;
+}
+
+extern u32
+ast_scu_get_phy_interface(u8 mac_num)
+{
+	u32 trap1 = ast_scu_read(AST_SCU_HW_STRAP1);
+
+	switch(mac_num) {
+		case 0:
+			if(SCU_HW_STRAP_MAC0_RGMII & trap1)
+				return 1;
+			else
+				return 0;
+			break;
+		case 1:
+			if(SCU_HW_STRAP_MAC1_RGMII & trap1)
+				return 1;
+			else
+				return 0;
+			break;
+		default:
+			SCUMSG("error mac number \n");
+			break;
+	}
+	return -1;
+}
+
+extern void
+ast_scu_set_vga_display(u8 enable)
+{
+	if(enable)
+		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) & ~SCU_MISC_VGA_CRT_DIS, AST_SCU_MISC1_CTRL);
+	else
+		ast_scu_write(ast_scu_read(AST_SCU_MISC1_CTRL) | SCU_MISC_VGA_CRT_DIS, AST_SCU_MISC1_CTRL);
+}
+
+
+extern u8
+ast_scu_get_vga_display(void)
+{
+	if(ast_scu_read(AST_SCU_MISC1_CTRL) & SCU_MISC_VGA_CRT_DIS)
+		return 0;
+	else
+		return 1;
+}
+
+
+extern u32
+ast_scu_get_vga_memsize(void)
+{
+	u32 size=0;
+
+	switch(SCU_HW_STRAP_VGA_SIZE_GET(ast_scu_read(AST_SCU_HW_STRAP1))) {
+		case VGA_8M_DRAM:
+			size = 8*1024*1024;
+			break;
+		case VGA_16M_DRAM:
+			size = 16*1024*1024;
+			break;
+		case VGA_32M_DRAM:
+			size = 32*1024*1024;
+			break;
+		case VGA_64M_DRAM:
+			size = 64*1024*1024;
+			break;
+		default:
+			SCUMSG("error vga size \n");
+			break;
+	}
+	return size;
+}
+
+
+extern u32
+ast_scu_get_soc_dram_base(void)
+{
+	u32 rev_id = ast_scu_read(AST_SCU_REVISION_ID);
+	if((rev_id >> AST_SOC_GEN) > 3)
+		return AST_DRAM_BASE_8;
+	else
+		return AST_DRAM_BASE_4;
+}
+
+extern void
+ast_scu_get_who_init_dram(void)
+{
+	switch(SCU_VGA_DRAM_INIT_MASK(ast_scu_read(AST_SCU_VGA0))) {
+		case 0:
+			printf("DRAM :   init by VBIOS \n");
+			break;
+		case 1:
+			printf("DRAM :   init by SOC \n");
+			break;
+		default:
+			printf("error vga size \n");
+			break;
+	}
+}
+
+extern u8
+ast_scu_adc_trim_read(void)
+{
+	return (ast_scu_read(AST_SCU_OTP1) >> 28);
+}
+
+extern void
+ast_scu_hw_random_enable(u8 enable)
+{
+	if(enable)
+		ast_scu_write(ast_scu_read(AST_SCU_RAMDOM_GEN) | RNG_ENABLE, AST_SCU_RAMDOM_GEN);
+	else
+		ast_scu_write(ast_scu_read(AST_SCU_RAMDOM_GEN) & ~RNG_ENABLE, AST_SCU_RAMDOM_GEN);
+}
+
+extern u32
+ast_scu_hw_random_read(void)
+{
+	return (ast_scu_read(AST_SCU_RAMDOM_DATA));
+}
+
+extern u8
+ast_scu_get_hw_random_type(void)
+{
+	return (RNG_GET_TYPE(ast_scu_read(AST_SCU_RAMDOM_GEN)));
+}
+
+extern void
+ast_scu_set_hw_random_type(u8 type)
+{
+	ast_scu_write(((ast_scu_read(AST_SCU_RAMDOM_GEN) & ~RNG_TYPE_MASK) | RNG_SET_TYPE(type)), AST_SCU_RAMDOM_GEN);
+}
diff --git a/arch/arm/mach-aspeed/ast-sdmc.c b/arch/arm/mach-aspeed/ast-sdmc.c
new file mode 100644
index 000000000000..6ac891532bdb
--- /dev/null
+++ b/arch/arm/mach-aspeed/ast-sdmc.c
@@ -0,0 +1,152 @@
+/********************************************************************************
+* File Name     : arch/arm/mach-aspeed/ast-sdmc.c
+* Author         : Ryan Chen
+* Description   : AST SDRAM Memory Ctrl
+*
+* Copyright (C) 2012-2020  ASPEED Technology Inc.
+* This program is free software; you can redistribute it and/or modify
+* it under the terms of the GNU General Public License as published by the Free Software Foundation;
+* either version 2 of the License, or (at your option) any later version.
+* This program is distributed in the hope that it will be useful,  but WITHOUT ANY WARRANTY;
+* without even the implied warranty of MERCHANTABILITY or
+* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+* You should have received a copy of the GNU General Public License
+* along with this program; if not, write to the Free Software
+* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+
+*   History      :
+*    1. 2013/03/15 Ryan Chen Create
+*
+********************************************************************************/
+#include <common.h>
+#include <asm/processor.h>
+#include <asm/io.h>
+#include <asm/arch/platform.h>
+
+#include <asm/arch/regs-sdmc.h>
+#include <asm/arch/ast-sdmc.h>
+
+//#define AST_SDMC_LOCK
+//#define AST_SDMC_DEBUG
+
+#ifdef AST_SDMC_DEBUG
+#define SDMCDBUG(fmt, args...) printf("%s() " fmt, __FUNCTION__, ## args)
+#else
+#define SDMCDBUG(fmt, args...)
+#endif
+
+#define SDMCMSG(fmt, args...) printf(fmt, ## args)
+
+static u32 ast_sdmc_base = AST_SDMC_BASE;
+
+static inline u32
+ast_sdmc_read(u32 reg)
+{
+	u32 val;
+
+	val = readl(ast_sdmc_base + reg);
+
+	SDMCDBUG("ast_sdmc_read : reg = 0x%08x, val = 0x%08x\n", reg, val);
+
+	return val;
+}
+
+static inline void
+ast_sdmc_write(u32 val, u32 reg)
+{
+	SDMCDBUG("ast_sdmc_write : reg = 0x%08x, val = 0x%08x\n", reg, val);
+#ifdef CONFIG_AST_SDMC_LOCK
+	//unlock
+	writel(SDMC_PROTECT_UNLOCK, ast_sdmc_base);
+	writel(val, ast_sdmc_base + reg);
+	//lock
+	writel(0xaa,ast_sdmc_base);
+#else
+	writel(SDMC_PROTECT_UNLOCK, ast_sdmc_base);
+
+	writel(val, ast_sdmc_base + reg);
+#endif
+}
+
+//***********************************Information ***********************************
+#ifdef CONFIG_ARCH_AST1010
+extern u32
+ast_sdmc_get_mem_size(void)
+{
+	if(ast_sdmc_read(AST_SDMC_CONFIG) & SDMC_CONFIG_16MB) {
+		return PHYS_SDRAM_12M;
+	} else {
+		return PHYS_SDRAM_8M;
+	}
+}
+#else
+extern u32
+ast_sdmc_get_mem_size(void)
+{
+	u32 size=0;
+	u32 conf = ast_sdmc_read(AST_SDMC_CONFIG);
+
+	if(conf & SDMC_CONFIG_VER_NEW) {
+		switch(SDMC_CONFIG_MEM_GET(conf)) {
+			case 0:
+				size = 128*1024*1024;
+				break;
+			case 1:
+				size = 256*1024*1024;
+				break;
+			case 2:
+				size = 512*1024*1024;
+				break;
+			case 3:
+				size = 1024*1024*1024;
+				break;
+
+			default:
+				SDMCMSG("error ddr size \n");
+				break;
+		}
+
+	} else {
+		switch(SDMC_CONFIG_MEM_GET(conf)) {
+			case 0:
+				size = 64*1024*1024;
+				break;
+			case 1:
+				size = 128*1024*1024;
+				break;
+			case 2:
+				size = 256*1024*1024;
+				break;
+			case 3:
+				size = 512*1024*1024;
+				break;
+
+			default:
+				SDMCMSG("error ddr size \n");
+				break;
+		}
+	}
+	return size;
+}
+#endif
+
+extern u8
+ast_sdmc_get_eec(void)
+{
+	u32 conf = ast_sdmc_read(AST_SDMC_CONFIG);
+	if(conf & SDMC_CONFIG_EEC_EN)
+		return 1;
+	else
+		return 0;
+}
+
+extern u8
+ast_sdmc_get_cache(void)
+{
+	u32 conf = ast_sdmc_read(AST_SDMC_CONFIG);
+	if(conf & SDMC_CONFIG_CACHE_EN)
+		return 1;
+	else
+		return 0;
+}
diff --git a/arch/arm/mach-aspeed/cpuinfo.c b/arch/arm/mach-aspeed/cpuinfo.c
new file mode 100644
index 000000000000..96d2de5a416a
--- /dev/null
+++ b/arch/arm/mach-aspeed/cpuinfo.c
@@ -0,0 +1,49 @@
+/*
+ * This file is released under the terms of GPL v2 and any later version.
+ * See the file COPYING in the root directory of the source tree for details.
+*/
+
+#include <common.h>
+#include <command.h>
+#include <asm/io.h>
+#include <asm/arch/ast_scu.h>
+#include <asm/arch/ast-sdmc.h>
+#include <asm/arch/aspeed.h>
+
+
+#if defined(CONFIG_DISPLAY_CPUINFO)
+int print_cpuinfo(void)
+{
+	char buf[32];
+	ulong size = 0;
+
+	ast_scu_revision_id();
+
+	ast_scu_sys_rest_info();
+
+#ifdef AST_SOC_G5
+	ast_scu_security_info();
+#endif
+
+	printf("PLL :   %4s MHz\n",
+					strmhz(buf, ast_get_clk_source()));
+	printf("CPU :   %4s MHz\n",
+					strmhz(buf, ast_get_h_pll_clk()));
+#ifdef AST_SOC_G5
+	printf("MEM :	%4s MHz, EEC: %s, Cache: %s \n",
+					strmhz(buf, ast_get_m_pll_clk() * 2), ast_sdmc_get_eec() ? "Enable":"Disable",ast_sdmc_get_cache() ?"Enable":"Disable");
+#else
+	printf("MEM :   %4s MHz, EEC:%s \n",
+					strmhz(buf, ast_get_m_pll_clk()), ast_sdmc_get_eec() ? "Enable":"Disable");
+#endif
+	size = ast_scu_get_vga_memsize();
+
+	puts("VGA :    ");
+
+	print_size(size, "\n");
+
+	ast_scu_get_who_init_dram();
+
+	return 0;
+}
+#endif
diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
new file mode 100644
index 000000000000..51db87261d53
--- /dev/null
+++ b/arch/arm/mach-aspeed/flash.c
@@ -0,0 +1,1403 @@
+/*
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ *
+ * History
+ * 01/20/2004 - combined variants of original driver.
+ * 01/22/2004 - Write performance enhancements for parallel chips (Tolunay)
+ * 01/23/2004 - Support for x8/x16 chips (Rune Raknerud)
+ * 01/27/2004 - Little endian support Ed Okerson
+ *
+ * Tested Architectures
+ * Port Width  Chip Width    # of banks	   Flash Chip  Board
+ * 32	       16	     1		   28F128J3    seranoa/eagle
+ * 64	       16	     1		   28F128J3    seranoa/falcon
+ *
+ */
+
+/* The DEBUG define must be before common to enable debugging */
+/* #define DEBUG	*/
+
+#include <common.h>
+#include <asm/processor.h>
+#include <asm/byteorder.h>
+#include <environment.h>
+
+#include <asm/arch/ast_scu.h>
+#include <asm/arch/aspeed.h>
+
+
+/*
+ * This file implements a Common Flash Interface (CFI) driver for U-Boot.
+ * The width of the port and the width of the chips are determined at initialization.
+ * These widths are used to calculate the address for access CFI data structures.
+ * It has been tested on an Intel Strataflash implementation and AMD 29F016D.
+ *
+ * References
+ * JEDEC Standard JESD68 - Common Flash Interface (CFI)
+ * JEDEC Standard JEP137-A Common Flash Interface (CFI) ID Codes
+ * Intel Application Note 646 Common Flash Interface (CFI) and Command Sets
+ * Intel 290667-008 3 Volt Intel StrataFlash Memory datasheet
+ *
+ * TODO
+ *
+ * Use Primary Extended Query table (PRI) and Alternate Algorithm Query
+ * Table (ALT) to determine if protection is available
+ *
+ * Add support for other command sets Use the PRI and ALT to determine command set
+ * Verify erase and program timeouts.
+ */
+
+#define CFI_MFR_MACRONIX		0x00C2
+#define CFI_MFR_MICRON			0x0020
+#define CFI_MFR_WINBOND         	0x00DA
+
+flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];		/* FLASH chips info */
+
+/* Support Flash ID */
+#define STM25P64		0x172020
+#define STM25P128		0x182020
+#define N25Q256			0x19ba20
+#define N25Q512			0x20ba20
+#define S25FL064A		0x160201
+#define S25FL128P		0x182001
+#define S25FL256S		0x190201
+#define W25X16			0x1530ef
+#define W25X64			0x1730ef
+#define W25Q64BV		0x1740ef
+#define W25Q128BV		0x1840ef
+#define W25Q256FV		0x1940ef
+#define MX25L1605D		0x1520C2
+#define MX25L12805D		0x1820C2
+#define MX25L25635E		0x1920C2
+#define MX66L51235F		0x1A20C2
+#define SST25VF016B		0x4125bf
+#define SST25VF064C		0x4b25bf
+#define SST25VF040B		0x8d25bf
+#define AT25DF161		0x02461F
+#define AT25DF321		0x01471F
+
+/* SPI Define */
+#define CS0_CTRL			0x10
+#define CS1_CTRL			0x14
+#define CS2_CTRL			0x18
+
+/* for DMA */
+#define REG_FLASH_INTERRUPT_STATUS	0x08
+#define REG_FLASH_DMA_CONTROL		0x80
+#define REG_FLASH_DMA_FLASH_BASE		0x84
+#define REG_FLASH_DMA_DRAM_BASE		0x88
+#define REG_FLASH_DMA_LENGTH			0x8c
+
+#define FLASH_STATUS_DMA_BUSY			0x0000
+#define FLASH_STATUS_DMA_READY		0x0800
+#define FLASH_STATUS_DMA_CLEAR		0x0800
+
+#define FLASH_DMA_ENABLE		0x01
+
+#define CMD_MASK		0xFFFFFFF8
+
+#define NORMALREAD		0x00
+#define FASTREAD		0x01
+#define NORMALWRITE	0x02
+#define USERMODE		0x03
+
+#define CE_LOW			0x00
+#define CE_HIGH			0x04
+
+/* AST2300 only */
+#define IOMODEx1		0x00000000
+#define IOMODEx2		0x20000000
+#define IOMODEx2_dummy		0x30000000
+#define IOMODEx4		0x40000000
+#define IOMODEx4_dummy		0x50000000
+
+#define DUMMY_COMMAND_OUT	0x00008000
+
+/* specificspi */
+#define SpecificSPI_N25Q512	0x00000001
+
+/*-----------------------------------------------------------------------*/
+static u32 ast_spi_calculate_divisor(u32 max_speed_hz)
+{
+	// [0] ->15 : HCLK , HCLK/16
+	u8 SPI_DIV[16] = {16, 7, 14, 6, 13, 5, 12, 4, 11, 3, 10, 2, 9, 1, 8, 0};
+	u32 i, hclk, spi_cdvr=0;
+
+	hclk = ast_get_ahbclk();
+	for(i=1;i<17;i++) {
+		if(max_speed_hz >= (hclk/i)) {
+			spi_cdvr = SPI_DIV[i-1];
+//			printf("hclk = %d , spi_cdvr = %d \n",hclk, spi_cdvr);
+			break;
+		}
+	}
+
+//	printf("hclk is %d, divisor is %d, target :%d , cal speed %d\n", hclk, spi_cdvr, max_speed_hz, hclk/i);
+	return spi_cdvr;
+}
+
+/* create an address based on the offset and the port width  */
+inline uchar *flash_make_addr(flash_info_t * info, flash_sect_t sect, uint offset)
+{
+#ifdef CONFIG_2SPIFLASH
+        if (info->start[0] >= PHYS_FLASH_2)
+	    return ((uchar *) (info->start[sect] + (offset * 1) - (PHYS_FLASH_2 - PHYS_FLASH_2_BASE) ));
+        else
+	    return ((uchar *) (info->start[sect] + (offset * 1)));
+#else
+	return ((uchar *) (info->start[sect] + (offset * 1)));
+#endif
+}
+
+static void reset_flash (flash_info_t * info)
+{
+	ulong ulCtrlData, CtrlOffset = CS0_CTRL;
+
+	switch(info->CE) {
+		case 0:
+			CtrlOffset = CS0_CTRL;
+			break;
+		case 1:
+			ast_scu_multi_func_romcs(1);
+			CtrlOffset = CS1_CTRL;
+			break;
+		case 2:
+			ast_scu_multi_func_romcs(2);
+			CtrlOffset = CS2_CTRL;
+			break;
+	}
+
+
+#if 1
+        ulCtrlData = info->iomode | (info->readcmd << 16) | (info->tCK_Read << 8) | (info->dummybyte << 6) | FASTREAD;
+#else
+        ulCtrlData  = (info->readcmd << 16) | (info->tCK_Read << 8) | (info->dummybyte << 6) | FASTREAD;
+        if (info->dualport)
+            ulCtrlData  |= 0x08;
+#endif
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+
+}
+
+static void enable_write (flash_info_t * info)
+{
+	ulong base;
+	ulong ulCtrlData, CtrlOffset = CS0_CTRL;
+	uchar jReg;
+
+	switch(info->CE) {
+		case 0:
+			CtrlOffset = CS0_CTRL;
+			break;
+		case 1:
+			ast_scu_multi_func_romcs(1);
+			CtrlOffset = CS1_CTRL;
+			break;
+		case 2:
+			ast_scu_multi_func_romcs(2);
+			CtrlOffset = CS2_CTRL;
+			break;
+	}
+
+	//base = info->start[0];
+	base = (ulong) flash_make_addr(info, 0, 0);
+
+        ulCtrlData  = (info->tCK_Write << 8);
+        ulCtrlData |= CE_LOW | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+        *(uchar *) (base) = (uchar) (0x06);
+        udelay(10);
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_HIGH | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_LOW | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+        *(uchar *) (base) = (uchar) (0x05);
+        udelay(10);
+        do {
+            jReg = *(volatile uchar *) (base);
+        } while (!(jReg & 0x02));
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_HIGH | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+
+}
+
+static void write_status_register (flash_info_t * info, uchar data)
+{
+	ulong base;
+	ulong ulCtrlData, CtrlOffset = CS0_CTRL;
+	uchar jReg;
+
+	switch(info->CE) {
+		case 0:
+			CtrlOffset = CS0_CTRL;
+			break;
+		case 1:
+			ast_scu_multi_func_romcs(1);
+			CtrlOffset = CS1_CTRL;
+			break;
+		case 2:
+			ast_scu_multi_func_romcs(2);
+			CtrlOffset = CS2_CTRL;
+			break;
+	}
+
+	//base = info->start[0];
+	base = (ulong) flash_make_addr(info, 0, 0);
+
+        enable_write (info);
+
+        ulCtrlData  = (info->tCK_Write << 8);
+        ulCtrlData |= CE_LOW | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+        *(uchar *) (base) = (uchar) (0x01);
+        udelay(10);
+        *(uchar *) (base) = (uchar) (data);
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_HIGH | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_LOW | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+        *(uchar *) (base) = (uchar) (0x05);
+        udelay(10);
+        do {
+            jReg = *(volatile uchar *) (base);
+        } while (jReg & 0x01);
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_HIGH | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+
+}
+
+static void enable4b (flash_info_t * info)
+{
+	ulong base;
+	ulong ulCtrlData, CtrlOffset = CS0_CTRL;
+
+	switch(info->CE) {
+		case 0:
+			CtrlOffset = CS0_CTRL;
+			break;
+		case 1:
+			ast_scu_multi_func_romcs(1);
+			CtrlOffset = CS1_CTRL;
+			break;
+		case 2:
+			ast_scu_multi_func_romcs(2);
+			CtrlOffset = CS2_CTRL;
+			break;
+	}
+
+	//base = info->start[0];
+	base = (ulong) flash_make_addr(info, 0, 0);
+
+        ulCtrlData  = (info->tCK_Write << 8);
+        ulCtrlData |= CE_LOW | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+        *(uchar *) (base) = (uchar) (0xb7);
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_HIGH | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+
+} /* enable4b */
+
+static void enable4b_spansion (flash_info_t * info)
+{
+	ulong base;
+	ulong ulCtrlData, CtrlOffset = CS0_CTRL;
+	uchar jReg;
+
+	switch(info->CE) {
+		case 0:
+			CtrlOffset = CS0_CTRL;
+			break;
+		case 1:
+			ast_scu_multi_func_romcs(1);
+			CtrlOffset = CS1_CTRL;
+			break;
+		case 2:
+			ast_scu_multi_func_romcs(2);
+			CtrlOffset = CS2_CTRL;
+			break;
+	}
+
+	//base = info->start[0];
+	base = (ulong) flash_make_addr(info, 0, 0);
+
+	/* Enable 4B: BAR0 D[7] = 1 */
+	ulCtrlData  = (info->tCK_Write << 8);
+	ulCtrlData |= CE_LOW | USERMODE;
+	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+	udelay(200);
+	*(uchar *) (base) = (uchar) (0x17);
+	udelay(10);
+	*(uchar *) (base) = (uchar) (0x80);
+	ulCtrlData &= CMD_MASK;
+	ulCtrlData |= CE_HIGH | USERMODE;
+	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+	udelay(200);
+
+	ulCtrlData &= CMD_MASK;
+	ulCtrlData |= CE_LOW | USERMODE;
+	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+	udelay(200);
+	*(uchar *) (base) = (uchar) (0x16);
+	udelay(10);
+	do {
+            jReg = *(volatile uchar *) (base);
+	} while (!(jReg & 0x80));
+	ulCtrlData &= CMD_MASK;
+	ulCtrlData |= CE_HIGH | USERMODE;
+	 *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+	udelay(200);
+
+} /* enable4b_spansion */
+
+static void enable4b_numonyx (flash_info_t * info)
+{
+	ulong base;
+	ulong ulCtrlData, CtrlOffset = CS0_CTRL;
+
+	switch(info->CE) {
+		case 0:
+			CtrlOffset = CS0_CTRL;
+			break;
+		case 1:
+			ast_scu_multi_func_romcs(1);
+			CtrlOffset = CS1_CTRL;
+			break;
+		case 2:
+			ast_scu_multi_func_romcs(2);
+			CtrlOffset = CS2_CTRL;
+			break;
+	}
+
+	//base = info->start[0];
+	base = (ulong) flash_make_addr(info, 0, 0);
+
+	/* Enable Write */
+	enable_write (info);
+
+	/* Enable 4B: CMD:0xB7 */
+	ulCtrlData  = (info->tCK_Write << 8);
+	ulCtrlData |= CE_LOW | USERMODE;
+	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+	udelay(200);
+	*(uchar *) (base) = (uchar) (0xB7);
+	udelay(10);
+	ulCtrlData &= CMD_MASK;
+	ulCtrlData |= CE_HIGH | USERMODE;
+	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+	udelay(200);
+
+} /* enable4b_numonyx */
+
+/*-----------------------------------------------------------------------
+ */
+static void flash_write_buffer (flash_info_t *info, uchar *src, ulong addr, int len)
+{
+	ulong j, base, offset;
+	ulong ulCtrlData, CtrlOffset = CS0_CTRL;
+	uchar jReg;
+
+	switch(info->CE) {
+		case 0:
+			CtrlOffset = CS0_CTRL;
+			break;
+		case 1:
+			ast_scu_multi_func_romcs(1);
+			CtrlOffset = CS1_CTRL;
+			break;
+		case 2:
+			ast_scu_multi_func_romcs(2);
+			CtrlOffset = CS2_CTRL;
+			break;
+	}
+
+	base = info->start[0];
+	offset = addr - base;
+	base = (ulong) flash_make_addr(info, 0, 0);
+
+        enable_write (info);
+
+        ulCtrlData  = (info->tCK_Write << 8);
+
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_LOW | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+        *(uchar *) (base) = (uchar) (0x02);
+        udelay(10);
+        if (info->address32)
+        {
+            *(uchar *) (base) = (uchar) ((offset & 0xff000000) >> 24);
+            udelay(10);
+        }
+        *(uchar *) (base) = (uchar) ((offset & 0xff0000) >> 16);
+        udelay(10);
+        *(uchar *) (base) = (uchar) ((offset & 0x00ff00) >> 8);
+        udelay(10);
+        *(uchar *) (base) = (uchar) ((offset & 0x0000ff));
+        udelay(10);
+
+        for (j=0; j<len; j++)
+        {
+            *(uchar *) (base) = *(uchar *) (src++);
+            udelay(10);
+        }
+
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_HIGH | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_LOW | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+        *(uchar *) (base) = (uchar) (0x05);
+        udelay(10);
+        do {
+            jReg = *(volatile uchar *) (base);
+        } while ((jReg & 0x01));
+        ulCtrlData &= CMD_MASK;
+        ulCtrlData |= CE_HIGH | USERMODE;
+        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+        udelay(200);
+
+        /* RFSR */
+        if (info->specificspi == SpecificSPI_N25Q512)
+        {
+            ulCtrlData &= CMD_MASK;
+            ulCtrlData |= CE_LOW | USERMODE;
+            *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+            udelay(200);
+            *(uchar *) (base) = (uchar) (0x70);
+            udelay(10);
+            do {
+                jReg = *(volatile uchar *) (base);
+            } while (!(jReg & 0x80));
+            ulCtrlData &= CMD_MASK;
+            ulCtrlData |= CE_HIGH | USERMODE;
+            *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+            udelay(200);
+        }
+}
+
+/*-----------------------------------------------------------------------
+ *
+ * export functions
+ *
+ */
+
+
+
+#if defined(CFG_ENV_IS_IN_FLASH) || defined(CFG_ENV_ADDR_REDUND) || (CFG_MONITOR_BASE >= CFG_FLASH_BASE)
+static flash_info_t *flash_get_info(ulong base)
+{
+	int i;
+	flash_info_t * info = 0;
+
+	for (i = 0; i < CONFIG_SYS_MAX_FLASH_BANKS; i ++) {
+		info = & flash_info[i];
+		if (info->size && info->start[0] <= base &&
+		    base <= info->start[0] + info->size - 1)
+			break;
+	}
+
+	return i == CONFIG_SYS_MAX_FLASH_BANKS ? 0 : info;
+}
+#endif
+
+/*-----------------------------------------------------------------------
+ */
+int flash_erase (flash_info_t * info, int s_first, int s_last)
+{
+	int rcode = 0;
+	int prot;
+	flash_sect_t sect;
+
+	ulong base, offset;
+	ulong ulCtrlData, CtrlOffset = CS0_CTRL;
+	uchar jReg;
+
+	switch(info->CE) {
+		case 0:
+			CtrlOffset = CS0_CTRL;
+			break;
+		case 1:
+			ast_scu_multi_func_romcs(1);
+			CtrlOffset = CS1_CTRL;
+			break;
+		case 2:
+			ast_scu_multi_func_romcs(2);
+			CtrlOffset = CS2_CTRL;
+			break;
+	}
+
+	if ((s_first < 0) || (s_first > s_last)) {
+		puts ("- no sectors to erase\n");
+		return 1;
+	}
+
+	prot = 0;
+	for (sect = s_first; sect <= s_last; ++sect) {
+		if (info->protect[sect]) {
+			prot++;
+		}
+	}
+	if (prot) {
+		printf ("- Warning: %d protected sectors will not be erased!\n", prot);
+	} else {
+		putc ('\n');
+	}
+
+        ulCtrlData  = (info->tCK_Erase << 8);
+	for (sect = s_first; sect <= s_last; sect++) {
+		if (info->protect[sect] == 0) { /* not protected */
+                        /* start erasing */
+                        enable_write(info);
+
+	                base = info->start[0];
+                        offset = info->start[sect] - base;
+	                base = (ulong) flash_make_addr(info, 0, 0);
+
+                        ulCtrlData &= CMD_MASK;
+                        ulCtrlData |= CE_LOW | USERMODE;
+                        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+                        udelay(200);
+                        *(uchar *) (base) = (uchar) (0xd8);
+                        udelay(10);
+                        if (info->address32)
+                        {
+                            *(uchar *) (base) = (uchar) ((offset & 0xff000000) >> 24);
+                            udelay(10);
+                        }
+                        *(uchar *) (base) = (uchar) ((offset & 0xff0000) >> 16);
+                        udelay(10);
+                        *(uchar *) (base) = (uchar) ((offset & 0x00ff00) >> 8);
+                        udelay(10);
+                        *(uchar *) (base) = (uchar) ((offset & 0x0000ff));
+                        udelay(10);
+
+                        ulCtrlData &= CMD_MASK;
+                        ulCtrlData |= CE_HIGH | USERMODE;
+                        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+                        udelay(200);
+
+                        ulCtrlData &= CMD_MASK;
+                        ulCtrlData |= CE_LOW | USERMODE;
+                        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+                        udelay(200);
+                        *(uchar *) (base) = (uchar) (0x05);
+                        udelay(10);
+                        do {
+                            jReg = *(volatile uchar *) (base);
+                        } while ((jReg & 0x01));
+                        ulCtrlData &= CMD_MASK;
+                        ulCtrlData |= CE_HIGH | USERMODE;
+                        *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+                        udelay(200);
+
+                        /* RFSR */
+                        if (info->specificspi == SpecificSPI_N25Q512)
+                        {
+                            ulCtrlData &= CMD_MASK;
+                            ulCtrlData |= CE_LOW | USERMODE;
+                            *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+                            udelay(200);
+                            *(uchar *) (base) = (uchar) (0x70);
+                            udelay(10);
+                            do {
+                                jReg = *(volatile uchar *) (base);
+                            } while (!(jReg & 0x80));
+                            ulCtrlData &= CMD_MASK;
+                            ulCtrlData |= CE_HIGH | USERMODE;
+                            *(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+                            udelay(200);
+                        }
+
+			putc ('.');
+		}
+	}
+	puts (" done\n");
+
+	reset_flash(info);
+
+	return rcode;
+}
+
+void flash_print_info (flash_info_t * info)
+{
+	int i;
+
+	if (info->flash_id == FLASH_UNKNOWN) {
+		printf ("missing or unknown FLASH type\n");
+		return;
+	}
+
+	printf("%lx : CS#%ld: ", info->start[0] , info->CE);
+	switch (info->flash_id & 0xff) {
+		case CFI_MFR_MACRONIX: 	printf ("MACRONIX ");		break;
+		case CFI_MFR_MICRON: 	printf ("MICRON ");		break;
+		case CFI_MFR_WINBOND: 	printf ("WINBOND ");		break;
+		default:		printf ("Unknown Vendor %lx", info->flash_id); break;
+	}
+
+	if (info->size >= (1 << 20)) {
+		i = 20;
+	} else {
+		i = 10;
+	}
+	printf ("  Size: %ld %cB in %d Sectors\n",
+		info->size >> i,
+		(i == 20) ? 'M' : 'k',
+		info->sector_count);
+
+	return;
+}
+
+/*-----------------------------------------------------------------------
+ * Copy memory to flash, returns:
+ * 0 - OK
+ * 1 - write timeout
+ * 2 - Flash not erased
+ */
+int write_buff (flash_info_t * info, uchar * src, ulong addr, ulong cnt)
+{
+	int count;
+	unsigned char pat[] = {'|', '-', '/', '\\'};
+	int patcnt = 0;
+	ulong BufferSize = info->buffersize;
+	/* get lower aligned address */
+	if (addr & (BufferSize - 1))
+	{
+		count = cnt >= BufferSize ? (BufferSize - (addr & 0xff)):cnt;
+		flash_write_buffer (info, src, addr, count);
+		addr+= count;
+		src += count;
+		cnt -= count;
+	}
+
+	/* prog */
+	while (cnt > 0) {
+		count = cnt >= BufferSize ? BufferSize:cnt;
+		flash_write_buffer (info, src, addr, count);
+		addr+= count;
+		src += count;
+		cnt -= count;
+		printf("%c\b", pat[(patcnt++) & 0x03]);
+	}
+
+	reset_flash(info);
+
+	return (0);
+}
+
+static ulong flash_get_size (ulong base, flash_info_t *info)
+{
+	int j;
+	unsigned long sector;
+	int erase_region_size;
+	ulong ulCtrlData, CtrlOffset = CS0_CTRL;
+	ulong ulID;
+	uchar ch[3];
+	ulong reg;
+	ulong WriteClk, EraseClk, ReadClk;
+	ulong vbase;
+
+	info->start[0] = base;
+//	printf("base %x \n",base);
+	vbase = (ulong) flash_make_addr(info, 0, 0);
+
+	switch(info->CE) {
+		case 0:
+			CtrlOffset = CS0_CTRL;
+			break;
+		case 1:
+			ast_scu_multi_func_romcs(1);
+			CtrlOffset = CS1_CTRL;
+			break;
+		case 2:
+			ast_scu_multi_func_romcs(2);
+			CtrlOffset = CS2_CTRL;
+			break;
+	}
+
+	/* Get Flash ID */
+	ulCtrlData  = *(ulong *) (info->reg_base + CtrlOffset) & CMD_MASK;
+	ulCtrlData |= CE_LOW | USERMODE;
+	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+	udelay(200);
+	*(uchar *) (vbase) = (uchar) (0x9F);
+	udelay(10);
+	ch[0] = *(volatile uchar *)(vbase);
+	udelay(10);
+	ch[1] = *(volatile uchar *)(vbase);
+	udelay(10);
+	ch[2] = *(volatile uchar *)(vbase);
+	udelay(10);
+	ulCtrlData  = *(ulong *) (info->reg_base + CtrlOffset) & CMD_MASK;
+	ulCtrlData |= CE_HIGH | USERMODE;
+	*(ulong *) (info->reg_base + CtrlOffset) = ulCtrlData;
+	udelay(200);
+	ulID = ((ulong)ch[0]) | ((ulong)ch[1] << 8) | ((ulong)ch[2] << 16) ;
+	info->flash_id = ulID;
+
+//	printf("SPI Flash ID: %x \n", ulID);
+
+	/* init default */
+	info->iomode = IOMODEx1;
+	info->address32 = 0;
+	info->quadport = 0;
+	info->specificspi = 0;
+
+	switch (info->flash_id) {
+		case STM25P64:
+			info->sector_count = 128;
+			info->size = 0x800000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 40;
+			EraseClk = 20;
+			ReadClk  = 40;
+			break;
+
+		case STM25P128:
+			info->sector_count = 64;
+			info->size = 0x1000000;
+			erase_region_size  = 0x40000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 20;
+			ReadClk  = 50;
+			break;
+
+		case N25Q256:
+			info->sector_count = 256;
+			info->size = 0x1000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 20;
+			ReadClk  = 50;
+#if	1
+			info->sector_count = 512;
+			info->size = 0x2000000;
+			info->address32 = 1;
+#endif
+			break;
+
+		case N25Q512:
+			info->sector_count = 256;
+			info->size = 0x1000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			info->specificspi = SpecificSPI_N25Q512;
+			WriteClk = 50;
+			EraseClk = 20;
+			ReadClk  = 50;
+#if	1
+			info->sector_count = 1024;
+			info->size = 0x4000000;
+			info->address32 = 1;
+#endif
+			break;
+
+		case W25X16:
+			info->sector_count = 32;
+			info->size = 0x200000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x3b;
+			info->dualport = 1;
+			info->dummybyte = 1;
+			info->iomode = IOMODEx2;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			break;
+
+		case W25X64:
+			info->sector_count = 128;
+			info->size = 0x800000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x3b;
+			info->dualport = 1;
+			info->dummybyte = 1;
+			info->iomode = IOMODEx2;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			break;
+
+		case W25Q64BV:
+			info->sector_count = 128;
+			info->size = 0x800000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x3b;
+			info->dualport = 1;
+			info->dummybyte = 1;
+			info->iomode = IOMODEx2;
+			info->buffersize = 256;
+			WriteClk = 80;
+			EraseClk = 40;
+			ReadClk  = 80;
+			break;
+
+		case W25Q128BV:
+			info->sector_count = 256;
+			info->size = 0x1000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x3b;
+			info->dualport = 1;
+			info->dummybyte = 1;
+			info->iomode = IOMODEx2;
+			info->buffersize = 256;
+			WriteClk = 104;
+			EraseClk = 50;
+			ReadClk  = 104;
+			break;
+
+		case W25Q256FV:
+			info->sector_count = 256;
+			info->size = 0x1000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 20;
+			ReadClk  = 50;
+#if	1
+			info->sector_count = 512;
+			info->size = 0x2000000;
+			info->address32 = 1;
+#endif
+			break;
+
+		case S25FL064A:
+			info->sector_count = 128;
+			info->size = 0x800000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			break;
+
+		case S25FL128P:
+			info->sector_count = 256;
+			info->size = 0x1000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 100;
+			EraseClk = 40;
+			ReadClk  = 100;
+			break;
+
+		case S25FL256S:
+			info->sector_count = 256;
+			info->size = 0x1000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 20;
+			ReadClk  = 50;
+#if	1
+			info->sector_count = 512;
+			info->size = 0x2000000;
+			info->address32 = 1;
+#endif
+			break;
+
+		case MX25L25635E:
+			info->sector_count = 256;
+			info->size = 0x1000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 20;
+			ReadClk  = 50;
+#if	1
+			info->sector_count = 512;
+			info->size = 0x2000000;
+			info->address32 = 1;
+#if	defined(CONFIG_FLASH_SPIx2_Dummy)
+			info->readcmd = 0xbb;
+			info->dummybyte = 1;
+			info->dualport = 1;
+			info->iomode = IOMODEx2_dummy;
+#elif	defined(CONFIG_FLASH_SPIx4_Dummy)
+			info->readcmd = 0xeb;
+			info->dummybyte = 3;
+			info->dualport = 0;
+			info->iomode = IOMODEx4_dummy;
+			info->quadport = 1;
+			info->dummydata = 0xaa;
+#endif
+#endif
+			break;
+
+		case MX66L51235F:
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 512;
+			WriteClk = 50;
+			EraseClk = 20;
+			ReadClk  = 50;
+#if	1
+			info->sector_count = 1024;
+			info->size = 0x4000000;
+			info->address32 = 1;
+#if	defined(CONFIG_FLASH_SPIx2_Dummy)
+			info->readcmd = 0xbb;
+			info->dummybyte = 1;
+			info->dualport = 1;
+			info->iomode = IOMODEx2_dummy;
+#elif	defined(CONFIG_FLASH_SPIx4_Dummy)
+			info->readcmd = 0xeb;
+			info->dummybyte = 3;
+			info->dualport = 0;
+			info->iomode = IOMODEx4_dummy;
+			info->quadport = 1;
+			info->dummydata = 0xaa;
+#endif
+#endif
+			break;
+
+		case MX25L12805D:
+			info->sector_count = 256;
+			info->size = 0x1000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+
+			WriteClk = 50;
+			EraseClk = 20;
+			ReadClk  = 50;
+
+#if	1
+#if	defined(CONFIG_FLASH_SPIx2_Dummy)
+			info->readcmd = 0xbb;
+			info->dummybyte = 1;
+			info->dualport = 1;
+			info->iomode = IOMODEx2_dummy;
+#elif	defined(CONFIG_FLASH_SPIx4_Dummy)
+			info->readcmd = 0xeb;
+			info->dummybyte = 3;
+			info->dualport = 0;
+			info->iomode = IOMODEx4_dummy;
+			info->quadport = 1;
+			info->dummydata = 0xaa;
+#endif
+#endif
+			break;
+
+		case MX25L1605D:
+			info->sector_count = 32;
+			info->size = 0x200000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 20;
+			ReadClk  = 50;
+			break;
+
+		case SST25VF016B:
+			info->sector_count = 32;
+			info->size = 0x200000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 1;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			break;
+
+		case SST25VF064C:
+			info->sector_count = 128;
+			info->size = 0x800000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 1;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			break;
+
+		case SST25VF040B:
+			info->sector_count = 8;
+			info->size = 0x80000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 1;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			break;
+
+		case AT25DF161:
+			info->sector_count = 32;
+			info->size = 0x200000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 1;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			break;
+
+		case AT25DF321:
+			info->sector_count = 32;
+			info->size = 0x400000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 0;
+			info->dummybyte = 1;
+			info->buffersize = 1;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			break;
+
+		default:	/* use JEDEC ID */
+			printf("Unsupported SPI Flash!! 0x%08lx\n", info->flash_id);
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport  = 0;
+			info->dummybyte = 1;
+			info->buffersize = 1;
+			WriteClk = 50;
+			EraseClk = 25;
+			ReadClk  = 50;
+			if ((info->flash_id & 0xFF) == 0x1F) {
+			/* Atmel */
+				switch (info->flash_id & 0x001F00) {
+					case 0x000400:
+						info->sector_count = 8;
+						info->size = 0x80000;
+						break;
+					case 0x000500:
+						info->sector_count = 16;
+						info->size = 0x100000;
+						break;
+					case 0x000600:
+						info->sector_count = 32;
+						info->size = 0x200000;
+						break;
+					case 0x000700:
+						info->sector_count = 64;
+						info->size = 0x400000;
+						break;
+					case 0x000800:
+						info->sector_count = 128;
+						info->size = 0x800000;
+						break;
+					case 0x000900:
+						info->sector_count = 256;
+						info->size = 0x1000000;
+						break;
+					default:
+						printf("Can't support this SPI Flash!! \n");
+						return 0;
+				}
+			} else {
+				/* JDEC */
+				switch (info->flash_id & 0xFF0000)
+				{
+					case 0x120000:
+						info->sector_count = 4;
+						info->size = 0x40000;
+						break;
+					case 0x130000:
+						info->sector_count = 8;
+						info->size = 0x80000;
+						break;
+					case 0x140000:
+						info->sector_count =16;
+						info->size = 0x100000;
+						break;
+					case 0x150000:
+						info->sector_count =32;
+						info->size = 0x200000;
+						break;
+					case 0x160000:
+						info->sector_count =64;
+						info->size = 0x400000;
+						break;
+					case 0x170000:
+						info->sector_count =128;
+						info->size = 0x800000;
+						break;
+					case 0x180000:
+						info->sector_count =256;
+						info->size = 0x1000000;
+						break;
+					case 0x190000:
+						info->sector_count =256;
+						info->size = 0x1000000;
+#if	1
+						info->sector_count = 512;
+						info->size = 0x2000000;
+						info->address32 = 1;
+#if	defined(CONFIG_FLASH_SPIx2_Dummy)
+						info->readcmd = 0xbb;
+						info->dummybyte = 1;
+						info->dualport = 1;
+						info->iomode = IOMODEx2_dummy;
+#elif	defined(CONFIG_FLASH_SPIx4_Dummy)
+						info->readcmd = 0xeb;
+						info->dummybyte = 3;
+						info->dualport = 0;
+						info->iomode = IOMODEx4_dummy;
+						info->quadport = 1;
+						info->dummydata = 0xaa;
+#endif
+#endif
+						break;
+
+					case 0x200000:
+						info->sector_count =256;
+						info->size = 0x1000000;
+						if ((info->flash_id & 0xFF) == 0x20)	/* numonyx */
+						info->specificspi = SpecificSPI_N25Q512;
+#if	1
+						info->sector_count = 1024;
+						info->size = 0x4000000;
+						info->address32 = 1;
+#if	defined(CONFIG_FLASH_SPIx2_Dummy)
+						info->readcmd = 0xbb;
+						info->dummybyte = 1;
+						info->dualport = 1;
+						info->iomode = IOMODEx2_dummy;
+#elif	defined(CONFIG_FLASH_SPIx4_Dummy)
+						info->readcmd = 0xeb;
+						info->dummybyte = 3;
+						info->dualport = 0;
+						info->iomode = IOMODEx4_dummy;
+						info->quadport = 1;
+						info->dummydata = 0xaa;
+#endif
+#endif
+						break;
+
+					default:
+						printf("Can't support this SPI Flash!! \n");
+						return 0;
+				}
+			} /* JDEC */
+	}
+
+	sector = base;
+	for (j = 0; j < info->sector_count; j++) {
+
+		info->start[j] = sector;
+		sector += erase_region_size;
+		info->protect[j] = 0; /* default: not protected */
+	}
+
+	/* limit Max SPI CLK to 50MHz (Datasheet v1.2) */
+	if (WriteClk > 50) WriteClk = 50;
+	if (EraseClk > 50) EraseClk = 50;
+	if (ReadClk > 50)  ReadClk  = 50;
+
+	info->tCK_Write = ast_spi_calculate_divisor(WriteClk*1000000);
+	info->tCK_Erase = ast_spi_calculate_divisor(EraseClk*1000000);
+	info->tCK_Read = ast_spi_calculate_divisor(ReadClk*1000000);
+
+	/* unprotect flash */
+	write_status_register(info, 0);
+
+	if (info->quadport)
+		write_status_register(info, 0x40);	/* enable QE */
+
+	if (info->address32) {
+#ifndef AST_SOC_G5
+		reg = *((volatile ulong*) 0x1e6e2070);	/* set H/W Trappings */
+		reg |= 0x10;
+		*((volatile ulong*) 0x1e6e2070) = reg;
+#endif
+		reg  = *((volatile ulong*) (info->reg_base + 0x4));	/* enable 32b control bit*/
+		reg |= (0x01 << info->CE);
+		*((volatile ulong*) (info->reg_base + 0x4)) = reg;
+
+		/* set flash chips to 32bits addressing mode */
+		if ((info->flash_id & 0xFF) == 0x01)	/* Spansion */
+			enable4b_spansion(info);
+		else if ((info->flash_id & 0xFF) == 0x20)	/* Numonyx */
+			enable4b_numonyx(info);
+		else /* MXIC, Winbond */
+			enable4b(info);
+	}
+
+	reset_flash(info);
+//	printf("%08x \n", info->size);
+	return (info->size);
+}
+
+/*-----------------------------------------------------------------------*/
+unsigned long flash_init (void)
+{
+	unsigned long size = 0;
+	int i;
+
+	*((volatile ulong*) AST_FMC_BASE) |= 0x800f0000;	/* enable Flash Write */
+
+	/* Init: FMC  */
+	/* BANK 0 : FMC CS0 , 1: FMC CS1, */
+	for (i = 0; i < CONFIG_FMC_CS; ++i) {
+		flash_info[i].sysspi = 0;
+		flash_info[i].reg_base = AST_FMC_BASE;
+		flash_info[i].flash_id = FLASH_UNKNOWN;
+		flash_info[i].CE = i;
+		switch(i) {
+			case 0:
+				size += flash_info[i].size = flash_get_size(AST_FMC_CS0_BASE, &flash_info[i]);
+				break;
+			case 1:
+				size += flash_info[i].size = flash_get_size(AST_FMC_CS1_BASE, &flash_info[i]);
+				break;
+			default:
+				printf("TODO ~~~~ \n");
+				break;
+		}
+		if (flash_info[i].flash_id == FLASH_UNKNOWN) {
+			printf ("## Unknown FLASH on Bank %d - Size = 0x%08lx = %ld MB\n",
+				i, flash_info[i].size, flash_info[i].size << 20);
+		}
+	}
+
+	/* BANK 2:SYSSPI CS0 */
+#ifdef CONFIG_SPI0_CS
+	//pin switch by trap[13:12]	-- [0:1] Enable SPI Master
+	ast_scu_spi_master(1);	/* enable SPI master */
+	*((volatile ulong*) AST_FMC_SPI0_BASE) |= 0x10000;	/* enable Flash Write */
+	flash_info[CONFIG_FMC_CS].sysspi = 1;
+	flash_info[CONFIG_FMC_CS].reg_base = AST_FMC_SPI0_BASE;
+	flash_info[CONFIG_FMC_CS].flash_id = FLASH_UNKNOWN;
+	flash_info[CONFIG_FMC_CS].CE = 0;
+	size += flash_info[CONFIG_FMC_CS].size = flash_get_size(AST_SPI0_CS0_BASE, &flash_info[CONFIG_FMC_CS]);
+	if (flash_info[2].flash_id == FLASH_UNKNOWN) {
+		printf ("## Unknown FLASH on Bank 2 SYS SPI - Size = 0x%08lx = %ld MB\n",
+			flash_info[CONFIG_FMC_CS].size, flash_info[CONFIG_FMC_CS].size << 20);
+	}
+#endif
+
+	/* Monitor protection ON by default */
+#if (CONFIG_MONITOR_BASE >= AST_FMC_CS0_BASE)
+	flash_protect (FLAG_PROTECT_SET,
+		       CONFIG_MONITOR_BASE,
+		       CONFIG_MONITOR_BASE + monitor_flash_len  - 1,
+		       flash_get_info(CONFIG_MONITOR_BASE));
+#endif
+
+	/* Environment protection ON by default */
+#ifdef CONFIG_ENV_IS_IN_FLASH
+	flash_protect (FLAG_PROTECT_SET,
+		       CONFIG_ENV_ADDR,
+		       CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE - 1,
+		       flash_get_info(CONFIG_ENV_ADDR));
+#endif
+
+	/* Redundant environment protection ON by default */
+#ifdef CONFIG_ENV_ADDR_REDUND
+	flash_protect (FLAG_PROTECT_SET,
+		       CONFIG_ENV_ADDR_REDUND,
+		       CONFIG_ENV_ADDR_REDUND + CONFIG_ENV_SIZE_REDUND - 1,
+		       flash_get_info(CONFIG_ENV_ADDR_REDUND));
+#endif
+
+	return (size);
+}
+
+void memmove_dma(void * dest,const void *src,size_t count)
+{
+	ulong count_align, poll_time, data;
+
+	count_align = (count + 3) & 0xFFFFFFFC;	/* 4-bytes align */
+        poll_time = 100;			/* set 100 us as default */
+
+        /* force end of burst read */
+	*(volatile ulong *) (AST_FMC_BASE + CS0_CTRL) |= CE_HIGH;
+	*(volatile ulong *) (AST_FMC_BASE + CS0_CTRL) &= ~CE_HIGH;
+
+	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_CONTROL) = (ulong) (~FLASH_DMA_ENABLE);
+	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_FLASH_BASE) = (ulong *) (src);
+	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_DRAM_BASE) = (ulong *) (dest);
+	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_LENGTH) = (ulong) (count_align);
+	*(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_CONTROL) = (ulong) (FLASH_DMA_ENABLE);
+
+	/* wait poll */
+	do {
+		udelay(poll_time);
+		data = *(ulong *) (AST_FMC_BASE + REG_FLASH_INTERRUPT_STATUS);
+	} while (!(data & FLASH_STATUS_DMA_READY));
+
+	/* clear status */
+	*(ulong *) (AST_FMC_BASE + REG_FLASH_INTERRUPT_STATUS) |= FLASH_STATUS_DMA_CLEAR;
+}
diff --git a/arch/arm/mach-aspeed/reset.c b/arch/arm/mach-aspeed/reset.c
new file mode 100644
index 000000000000..b4d8c40623b4
--- /dev/null
+++ b/arch/arm/mach-aspeed/reset.c
@@ -0,0 +1,18 @@
+/*
+ * This file is released under the terms of GPL v2 and any later version.
+ * See the file COPYING in the root directory of the source tree for details.
+*/
+
+#include <common.h>
+#include <asm/io.h>
+#include <asm/arch/platform.h>
+
+void reset_cpu(ulong addr)
+{
+	__raw_writel(0x10 , AST_WDT_BASE+0x04);
+	__raw_writel(0x4755, AST_WDT_BASE+0x08);
+	__raw_writel(0x3, AST_WDT_BASE+0x0c);
+
+	while (1)
+	/*nothing*/;
+}
diff --git a/arch/arm/mach-aspeed/timer.c b/arch/arm/mach-aspeed/timer.c
new file mode 100644
index 000000000000..8960fe715fd1
--- /dev/null
+++ b/arch/arm/mach-aspeed/timer.c
@@ -0,0 +1,147 @@
+/*
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ * Ryan Chen <ryan_chen@aspeedtech.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#include <common.h>
+#include <asm/arch/platform.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+#define TIMER_LOAD_VAL 0xffffffff
+
+/* macro to read the 32 bit timer */
+#define READ_TIMER (*(volatile ulong *)(AST_TIMER_BASE))
+
+static ulong timestamp;
+static ulong lastdec;
+
+void reset_timer_masked (void)
+{
+	/* reset time */
+	lastdec = READ_TIMER;  /* capure current decrementer value time */
+	timestamp = 0;	       /* start "advancing" time stamp from 0 */
+}
+
+int timer_init (void)
+{
+	*(volatile ulong *)(AST_TIMER_BASE + 4)    = TIMER_LOAD_VAL;
+	*(volatile ulong *)(AST_TIMER_BASE + 0x30) = 0x3;		/* enable timer1 */
+
+	/* init the timestamp and lastdec value */
+	reset_timer_masked();
+
+	return 0;
+}
+
+/*
+ * timer without interrupts
+ */
+ulong get_timer (ulong base)
+{
+	return get_timer_masked () - base;
+}
+
+/* delay x useconds AND preserve advance timestamp value */
+void __udelay (unsigned long usec)
+{
+	ulong tmo, tmp;
+
+	if(usec >= 1000){		/* if "big" number, spread normalization to seconds */
+		tmo = usec / 1000;	/* start to normalize for usec to ticks per sec */
+		tmo *= CONFIG_SYS_HZ;		/* find number of "ticks" to wait to achieve target */
+		tmo /= 1000;		/* finish normalize. */
+	}else{				/* else small number, don't kill it prior to HZ multiply */
+		tmo = usec * CONFIG_SYS_HZ;
+		tmo /= (1000*1000);
+	}
+
+	tmp = get_timer (0);		/* get current timestamp */
+	if( (tmo + tmp + 1) < tmp )	/* if setting this fordward will roll time stamp */
+		reset_timer_masked ();	/* reset "advancing" timestamp to 0, set lastdec value */
+	else
+		tmo += tmp;		/* else, set advancing stamp wake up time */
+
+	while (get_timer_masked () < tmo)/* loop till event */
+		/*NOP*/;
+}
+
+ulong get_timer_masked (void)
+{
+	ulong now = READ_TIMER;		/* current tick value */
+
+	if (lastdec >= now) {		/* normal mode (non roll) */
+		/* normal mode */
+		timestamp += lastdec - now; /* move stamp fordward with absoulte diff ticks */
+	} else {			/* we have overflow of the count down timer */
+		/* nts = ts + ld + (TLV - now)
+		 * ts=old stamp, ld=time that passed before passing through -1
+		 * (TLV-now) amount of time after passing though -1
+		 * nts = new "advancing time stamp"...it could also roll and cause problems.
+		 */
+		timestamp += lastdec + TIMER_LOAD_VAL - now;
+	}
+	lastdec = now;
+
+	return timestamp;
+}
+
+/* waits specified delay value and resets timestamp */
+void udelay_masked (unsigned long usec)
+{
+	ulong tmo;
+	ulong endtime;
+	signed long diff;
+
+	if (usec >= 1000) {		/* if "big" number, spread normalization to seconds */
+		tmo = usec / 1000;	/* start to normalize for usec to ticks per sec */
+		tmo *= CONFIG_SYS_HZ;		/* find number of "ticks" to wait to achieve target */
+		tmo /= 1000;		/* finish normalize. */
+	} else {			/* else small number, don't kill it prior to HZ multiply */
+		tmo = usec * CONFIG_SYS_HZ;
+		tmo /= (1000*1000);
+	}
+
+	endtime = get_timer_masked () + tmo;
+
+	do {
+		ulong now = get_timer_masked ();
+		diff = endtime - now;
+	} while (diff >= 0);
+}
+
+/*
+ * This function is derived from PowerPC code (read timebase as long long).
+ * On ARM it just returns the timer value.
+ */
+unsigned long long get_ticks(void)
+{
+	return get_timer(0);
+}
+
+/*
+ * This function is derived from PowerPC code (timebase clock frequency).
+ * On ARM it returns the number of timer ticks per second.
+ */
+ulong get_tbclk (void)
+{
+	ulong tbclk;
+
+	tbclk = CONFIG_SYS_HZ;
+	return tbclk;
+}
diff --git a/board/aspeed/ast-g5/Kconfig b/board/aspeed/ast-g5/Kconfig
new file mode 100644
index 000000000000..1ef0ae8d9052
--- /dev/null
+++ b/board/aspeed/ast-g5/Kconfig
@@ -0,0 +1,18 @@
+if TARGET_AST_G5
+
+config SYS_CPU
+	default "arm1176"
+
+config SYS_BOARD
+	default "ast-g5"
+
+config SYS_VENDOR
+	default "aspeed"
+
+config SYS_SOC
+	default "aspeed"
+
+config SYS_CONFIG_NAME
+	default "ast-g5"
+
+endif
diff --git a/board/aspeed/ast-g5/Makefile b/board/aspeed/ast-g5/Makefile
new file mode 100644
index 000000000000..c2881154b237
--- /dev/null
+++ b/board/aspeed/ast-g5/Makefile
@@ -0,0 +1,30 @@
+#
+# (C) Copyright 2000-2006
+# Wolfgang Denk, DENX Software Engineering, wd@denx.de.
+#
+# See file CREDITS for list of people who contributed to this
+# project.
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of the GNU General Public License as
+# published by the Free Software Foundation; either version 2 of
+# the License, or (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+# MA 02111-1307 USA
+#
+
+obj-y   = ast-g5.o
+
+ifeq ($(CONFIG_FPGA_ASPEED),y)
+obj-y   += platform_fpga.o
+else
+obj-y   += platform.o
+endif
diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
new file mode 100644
index 000000000000..4643ef37c13c
--- /dev/null
+++ b/board/aspeed/ast-g5/ast-g5.c
@@ -0,0 +1,86 @@
+/*
+ * (C) Copyright 2002
+ * Sysgo Real-Time Solutions, GmbH <www.elinos.com>
+ * Marius Groeger <mgroeger@sysgo.de>
+ *
+ * (C) Copyright 2002
+ * David Mueller, ELSOFT AG, <d.mueller@elsoft.ch>
+ *
+ * (C) Copyright 2003
+ * Texas Instruments, <www.ti.com>
+ * Kshitij Gupta <Kshitij@ti.com>
+ *
+ * (C) Copyright 2004
+ * ARM Ltd.
+ * Philippe Robin, <philippe.robin@arm.com>
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#include <common.h>
+#include <netdev.h>
+#include <asm/arch/ast_scu.h>
+#include <asm/arch/ast-sdmc.h>
+#include <asm/io.h>
+
+DECLARE_GLOBAL_DATA_PTR;
+
+#if defined(CONFIG_SHOW_BOOT_PROGRESS)
+void show_boot_progress(int progress)
+{
+    printf("Boot reached stage %d\n", progress);
+}
+#endif
+
+int board_init (void)
+{
+	/* adress of boot parameters */
+	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
+	gd->flags = 0;
+	return 0;
+}
+
+
+int misc_init_r (void)
+{
+	return 0;
+
+}
+
+/******************************
+ Routine:
+ Description:
+******************************/
+int dram_init (void)
+{
+	/* dram_init must store complete ramsize in gd->ram_size */
+	u32 vga = ast_scu_get_vga_memsize();
+	u32 dram = ast_sdmc_get_mem_size();
+	gd->ram_size = (dram - vga);
+
+	return 0;
+
+}
+
+#ifdef CONFIG_CMD_NET
+int board_eth_init(bd_t *bd)
+{
+        return ftgmac100_initialize(bd);
+}
+#endif
diff --git a/board/aspeed/ast-g5/platform.S b/board/aspeed/ast-g5/platform.S
new file mode 100644
index 000000000000..4dbdbf21be1f
--- /dev/null
+++ b/board/aspeed/ast-g5/platform.S
@@ -0,0 +1,1985 @@
+/*
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+/*
+ * Board specific setup info
+ *
+ ******************************************************************************
+ * ASPEED Technology Inc.
+ * AST25x0 DDR3/DDR4 SDRAM controller initialization sequence
+ *
+ * Gary Hsu, <gary_hsu@aspeedtech.com>
+ *
+ * Version     : 9
+ * Release date: 2016.02.19
+ *
+ * Change List :
+ * V2|2014.07.25 : 1. Modify HPLL config sequence
+ * V2|2014.07.30 : 1. Modify DDR3 AC parameters table
+ *   |             2. Turn on ZQCS mode
+ * V2|2014.08.13 : 1. Add disable XDMA
+ * V2|2014.09.09 : 1. Disable CKE dynamic power down
+ * V2|2014.10.31 : 1. Enable VGA wide screen support (SCU40[0]=1)
+ * V2|2015.03.26 : 1. Revise AC timing table
+ *   |             2. Add check code to bypass A0 patch
+ *   |             3. Add MPLL parameter of A1
+ *   |             4. Set X-DMA into VGA memory domain
+ * V2|2015.04.24 : 1. Add disabling all DRAM requests during PHY init
+ *   |             2. Set MCR1C & MCR38
+ * V3|2015.05.13 : 1. Modify DDR4 PHY Vref training algorithm
+ *   |             2. Enable CKE dynamic power down
+ * V4|2015.06.15 : 1. Add MAC timing setting
+ * V5|2015.07.09 : 1. Modify MHCLK divider ratio
+ *   |             2. Add DDR read margin report
+ * V6|2015.08.13 : 1. Disable MMC password before exit
+ * V6|2015.08.24 : 1. Fix SCU160 parameter value for CLKIN=25MHz condition
+ * V7|2015.09.18 : 1. Clear AHB bus lock condition at power up time
+ *   |             2. Add reset MMC controller to solve init DRAM again during VGA ON
+ * V7|2015.09.22 : 1. Add watchdog full reset for resolving reset incomplete issue at fast reset condition
+ *   |             2. Add DRAM stress test after train complete, and redo DRAM initial if stress fail
+ *   |             3. Enable JTAG master mode
+ *   |             4. Add DDR4 Vref trainig retry timeout
+ * V8|2015.11.02 : 1. Clear software strap flag before doing watchdog full reset
+ *   |2015.12.10 : 1. Add USB PHY initial code
+ *   |2016.01.27 : 1. Modify the first reset from full chip reset to SOC reset
+ *   |             2. Remove HPLL/MPLL patch code for revision A0
+ *   |             3. Move the reset_mmc code to be after MPLL initialized
+ * V9|2016.02.19 : 1. Remove definietion "CONFIG_FIRMWARE_2ND_BOOT"
+ *
+ * Optional define variable
+ * 1. DRAM Speed             //
+ *    CONFIG_DRAM_1333       //
+ *    CONFIG_DRAM_1600       // (default)
+ * 2. ECC Function enable
+ *    CONFIG_DRAM_ECC        // define to enable ECC function
+ *    CONFIG_DRAM_ECC_SIZE   // define the ECC protected memory size
+ * 3. UART5 message output   //
+ *    CONFIG_DRAM_UART_38400 // set the UART baud rate to 38400, default is 115200
+ * 4. DRAM Type
+ *    CONFIG_DDR3_8GSTACK    // DDR3 8Gbit Stack die
+ *    CONFIG_DDR4_4GX8       // DDR4 4Gbit X8 dual part
+ * 5. Firmware 2nd boot flash
+ *    CONFIG_FIRMWARE_2ND_BOOT (Removed)
+ ******************************************************************************
+ */
+
+#include <config.h>
+#include <version.h>
+
+/******************************************************************************
+  r4 : return program counter
+  r5 : DDR speed timing table base address
+  Free registers:
+  r0, r1, r2, r3, r6, r7, r8, r9, r10, r11
+ ******************************************************************************/
+#define ASTMMC_INIT_VER      0x09                @ 8bit verison number
+#define ASTMMC_INIT_DATE     0x20160219          @ Release date
+
+#define ASTMMC_REGIDX_010    0x00
+#define ASTMMC_REGIDX_014    0x04
+#define ASTMMC_REGIDX_018    0x08
+#define ASTMMC_REGIDX_020    0x0C
+#define ASTMMC_REGIDX_024    0x10
+#define ASTMMC_REGIDX_02C    0x14
+#define ASTMMC_REGIDX_030    0x18
+#define ASTMMC_REGIDX_214    0x1C
+#define ASTMMC_REGIDX_2E0    0x20
+#define ASTMMC_REGIDX_2E4    0x24
+#define ASTMMC_REGIDX_2E8    0x28
+#define ASTMMC_REGIDX_2EC    0x2C
+#define ASTMMC_REGIDX_2F0    0x30
+#define ASTMMC_REGIDX_2F4    0x34
+#define ASTMMC_REGIDX_2F8    0x38
+#define ASTMMC_REGIDX_RFC    0x3C
+#define ASTMMC_REGIDX_PLL    0x40
+
+TIME_TABLE_DDR3_1333:
+    .word   0x53503C37       @ 0x010
+    .word   0xF858D47F       @ 0x014
+    .word   0x00010000       @ 0x018
+    .word   0x00000000       @ 0x020
+    .word   0x00000000       @ 0x024
+    .word   0x02101C60       @ 0x02C
+    .word   0x00000040       @ 0x030
+    .word   0x00000020       @ 0x214
+    .word   0x02001000       @ 0x2E0
+    .word   0x0C000085       @ 0x2E4
+    .word   0x000BA018       @ 0x2E8
+    .word   0x2CB92104       @ 0x2EC
+    .word   0x07090407       @ 0x2F0
+    .word   0x81000700       @ 0x2F4
+    .word   0x0C400800       @ 0x2F8
+    .word   0x7F5E3A27       @ tRFC
+    .word   0x00005B80       @ PLL
+TIME_TABLE_DDR3_1600:
+    .word   0x64604D38       @ 0x010
+    .word   0x29690599       @ 0x014
+    .word   0x00000300       @ 0x018
+    .word   0x00000000       @ 0x020
+    .word   0x00000000       @ 0x024
+    .word   0x02181E70       @ 0x02C
+    .word   0x00000040       @ 0x030
+    .word   0x00000024       @ 0x214
+    .word   0x02001300       @ 0x2E0
+    .word   0x0E0000A0       @ 0x2E4
+    .word   0x000E001B       @ 0x2E8
+    .word   0x35B8C105       @ 0x2EC
+    .word   0x08090408       @ 0x2F0
+    .word   0x9B000800       @ 0x2F4
+    .word   0x0E400A00       @ 0x2F8
+    .word   0x9971452F       @ tRFC
+    .word   0x000071C1       @ PLL
+
+TIME_TABLE_DDR4_1333:
+    .word   0x53503D26       @ 0x010
+    .word   0xE878D87F       @ 0x014
+    .word   0x00019000       @ 0x018
+    .word   0x08000000       @ 0x020
+    .word   0x00000400       @ 0x024
+    .word   0x00000200       @ 0x02C
+    .word   0x00000101       @ 0x030
+    .word   0x00000020       @ 0x214
+    .word   0x03002200       @ 0x2E0
+    .word   0x0C000085       @ 0x2E4
+    .word   0x000BA01A       @ 0x2E8
+    .word   0x2CB92106       @ 0x2EC
+    .word   0x07060606       @ 0x2F0
+    .word   0x81000700       @ 0x2F4
+    .word   0x0C400800       @ 0x2F8
+    .word   0x7F5E3A3A       @ tRFC
+    .word   0x00005B80       @ PLL
+TIME_TABLE_DDR4_1600:
+    .word   0x63604E37       @ 0x010
+    .word   0xE97AFA99       @ 0x014
+    .word   0x00019000       @ 0x018
+    .word   0x08000000       @ 0x020
+    .word   0x00000400       @ 0x024
+    .word   0x00000410       @ 0x02C
+    .word   0x00000101       @ 0x030
+    .word   0x00000024       @ 0x214
+    .word   0x03002900       @ 0x2E0
+    .word   0x0E0000A0       @ 0x2E4
+    .word   0x000E001C       @ 0x2E8
+    .word   0x35B8C106       @ 0x2EC
+    .word   0x08080607       @ 0x2F0
+    .word   0x9B000900       @ 0x2F4
+    .word   0x0E400A00       @ 0x2F8
+    .word   0x99714545       @ tRFC
+    .word   0x000071C1       @ PLL
+
+    .macro init_delay_timer
+    ldr   r0, =0x1e782024                        @ Set Timer3 Reload
+    str   r2, [r0]
+
+    ldr   r0, =0x1e6c0038                        @ Clear Timer3 ISR
+    ldr   r1, =0x00040000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e782030                        @ Enable Timer3
+    mov   r2, #7
+    mov   r1, r2, lsl #8
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6c0090                        @ Check ISR for Timer3 timeout
+    .endm
+
+    .macro check_delay_timer
+    ldr   r1, [r0]
+    bic   r1, r1, #0xFFFBFFFF
+    mov   r2, r1, lsr #18
+    cmp   r2, #0x01
+    .endm
+
+    .macro clear_delay_timer
+    ldr   r0, =0x1e78203C                        @ Disable Timer3
+    mov   r2, #0xF
+    mov   r1, r2, lsl #8
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6c0038                        @ Clear Timer3 ISR
+    ldr   r1, =0x00040000
+    str   r1, [r0]
+    .endm
+
+    .macro init_spi_checksum
+    ldr   r0, =0x1e620084
+    ldr   r1, =0x20010000
+    str   r1, [r0]
+    ldr   r0, =0x1e62008C
+    ldr   r1, =0x20000200
+    str   r1, [r0]
+    ldr   r0, =0x1e620080
+    ldr   r1, =0x0000000D
+    orr   r2, r2, r7
+    orr   r1, r1, r2, lsl #8
+    and   r2, r6, #0xF
+    orr   r1, r1, r2, lsl #4
+    str   r1, [r0]
+    ldr   r0, =0x1e620008
+    ldr   r2, =0x00000800
+    .endm
+
+    .macro print_hex_char
+    and   r1, r1, #0xF
+    cmp   r1, #9
+    addgt r1, r1, #0x37
+    addle r1, r1, #0x30
+    str   r1, [r0]
+    .endm
+
+/******************************************************************************
+ Calibration Macro End
+ ******************************************************************************/
+
+.globl lowlevel_init
+lowlevel_init:
+
+init_dram:
+    /* save lr */
+    mov   r4, lr
+
+    /* Clear AHB bus lock condition */
+    ldr   r0, =0x1e600000
+    ldr   r1, =0xAEED1A03
+    str   r1, [r0]
+    ldr   r0, =0x1e600084
+    ldr   r1, =0x00010000
+    str   r1, [r0]
+    add   r0, r0, #0x4
+    mov   r1, #0x0
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e2000
+    ldr   r1, =0x1688a8a8
+    str   r1, [r0]
+
+    /* Reset again */
+    ldr   r0, =0x1e6e2070                        @ check fast reset flag
+    ldr   r2, =0x08000000
+    ldr   r1, [r0]
+    tst   r1, r2
+    beq   bypass_first_reset
+
+    ldr   r0, =0x1e785010
+    ldr   r3, [r0]
+    cmp   r3, #0x0
+    beq   start_first_reset
+    add   r0, r0, #0x04
+    mov   r3, #0x77
+    str   r3, [r0]
+    ldr   r0, =0x1e720004
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    ldr   r0, =0x1e6e207c                        @ clear fast reset flag
+    str   r2, [r0]
+    ldr   r0, =0x1e6e203c                        @ clear watchdog reset flag
+    ldr   r1, [r0]
+    and   r1, r1, #0x01
+    str   r1, [r0]
+    b     bypass_first_reset
+
+start_first_reset:
+    ldr   r0, =0x1e62009c                        @ clear software strap flag for doing again after reset
+    ldr   r1, =0xAEEDFC20
+    str   r1, [r0]
+    ldr   r0, =0x1e785004
+    ldr   r1, =0x00000001
+    str   r1, [r0]
+    ldr   r0, =0x1e785008
+    ldr   r1, =0x00004755
+    str   r1, [r0]
+    ldr   r0, =0x1e78500c                        @ enable soc reset
+    ldr   r1, =0x00000013
+    str   r1, [r0]
+wait_first_reset:
+    b     wait_first_reset
+
+bypass_first_reset:
+    /* Enable Timer separate clear mode */
+    ldr   r0, =0x1e782038
+    mov   r1, #0xAE
+    str   r1, [r0]
+
+/* Test - DRAM initial time */
+    ldr   r0, =0x1e78203c
+    ldr   r1, =0x0000F000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e782044
+    ldr   r1, =0xFFFFFFFF
+    str   r1, [r0]
+
+    ldr   r0, =0x1e782030
+    mov   r2, #3
+    mov   r1, r2, lsl #12
+    str   r1, [r0]
+/* Test - DRAM initial time */
+
+    /*Set Scratch register Bit 7 before initialize*/
+    ldr   r0, =0x1e6e2000
+    ldr   r1, =0x1688a8a8
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e2040
+    ldr   r1, [r0]
+    orr   r1, r1, #0x80
+    str   r1, [r0]
+
+    /* Configure USB ports to the correct pin state */
+    ldr   r0, =0x1e6e200c
+    ldr   r2, =0x00004000
+    ldr   r1, [r0]
+    orr   r1, r1, r2
+    str   r1, [r0]
+    ldr   r0, =0x1e6e2070
+    ldr   r2, =0x00800000
+    ldr   r1, [r0]
+    tst   r1, r2
+    beq   bypass_USB_init
+    ldr   r0, =0x1e6e207c
+    str   r2, [r0]
+
+    /* Delay about 1ms */
+    clear_delay_timer
+    ldr   r2, =0x000003E8                        @ Set Timer3 Reload = 1 ms
+    init_delay_timer
+wait_usb_init:
+    check_delay_timer
+    bne   wait_usb_init
+    clear_delay_timer
+    /* end delay 1ms */
+
+    ldr   r0, =0x1e6e2070
+    ldr   r1, =0x00800000
+    str   r1, [r0]
+
+bypass_USB_init:
+    /* Enable AXI_P */
+    ldr   r0, =0x00000016
+    mrc   p15, 0, r1, c15, c2, 4
+    mcr   p15, 0, r0, c15, c2, 4
+
+/******************************************************************************
+ Disable WDT2 for 2nd boot function
+ ******************************************************************************/
+/*
+#ifndef CONFIG_FIRMWARE_2ND_BOOT
+    ldr   r0, =0x1e78502c
+    mov   r1, #0
+    str   r1, [r0]
+#endif
+*/
+/******************************************************************************
+ Disable WDT3 for SPI Address mode (3 or 4 bytes) detection function
+ ******************************************************************************/
+    ldr   r0, =0x1e78504c
+    mov   r1, #0
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0000
+    ldr   r1, =0xFC600309
+    str   r1, [r0]
+
+    /* Check Scratch Register Bit 6 */
+    ldr   r0, =0x1e6e2040
+    ldr   r1, [r0]
+    bic   r1, r1, #0xFFFFFFBF
+    mov   r2, r1, lsr #6
+    cmp   r2, #0x01
+    beq   platform_exit
+
+    /* Disable VGA display */
+    ldr   r0, =0x1e6e202c
+    ldr   r1, [r0]
+    orr   r1, r1, #0x40
+    str   r1, [r0]
+
+    /* Set M-PLL */
+#if   defined (CONFIG_DRAM_1333)
+    ldr   r2, =0xC48066C0                        @ load PLL parameter for 24Mhz CLKIN (330)
+#else
+    ldr   r2, =0x93002400                        @ load PLL parameter for 24Mhz CLKIN (396)
+#endif
+
+    ldr   r0, =0x1e6e2070                        @ Check CLKIN = 25MHz
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #23
+    tst   r1, #0x01
+    beq   set_MPLL
+#if   defined (CONFIG_DRAM_1333)
+    ldr   r2, =0xC4806680                        @ load PLL parameter for 25Mhz CLKIN (331)
+#else
+    ldr   r2, =0x930023E0                        @ load PLL parameter for 25Mhz CLKIN (400)
+#endif
+    ldr   r0, =0x1e6e2160                        @ set 24M Jitter divider (HPLL=825MHz)
+    ldr   r1, =0x00011320
+    str   r1, [r0]
+
+set_MPLL:
+    ldr   r0, =0x1e6e2020                        @ M-PLL (DDR SDRAM) Frequency
+    str   r2, [r0]
+
+    clear_delay_timer
+
+    /* Delay about 3ms */
+    ldr   r2, =0x00000BB8                        @ Set Timer3 Reload = 3 ms
+    init_delay_timer
+wait_mpll_init:
+    check_delay_timer
+    bne   wait_mpll_init
+    clear_delay_timer
+    /* end delay 3ms */
+
+    /* Reset MMC */
+reset_mmc:
+    ldr   r0, =0x1e78505c
+    ldr   r1, =0x00000004
+    str   r1, [r0]
+    ldr   r0, =0x1e785044
+    ldr   r1, =0x00000001
+    str   r1, [r0]
+    ldr   r0, =0x1e785048
+    ldr   r1, =0x00004755
+    str   r1, [r0]
+    ldr   r0, =0x1e78504c
+    ldr   r1, =0x00000013
+    str   r1, [r0]
+wait_mmc_reset:
+    ldr   r1, [r0]
+    tst   r1, #0x02
+    bne   wait_mmc_reset
+
+    ldr   r0, =0x1e78505c
+    ldr   r1, =0x023FFFF3
+    str   r1, [r0]
+    ldr   r0, =0x1e785044
+    ldr   r1, =0x000F4240
+    str   r1, [r0]
+    ldr   r0, =0x1e785048
+    ldr   r1, =0x00004755
+    str   r1, [r0]
+    ldr   r0, =0x1e785054
+    ldr   r1, =0x00000077
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0000
+    ldr   r1, =0xFC600309
+wait_mmc_reset_done:
+    str   r1, [r0]
+    ldr   r2, [r0]
+    cmp   r2, #0x1
+    bne   wait_mmc_reset_done
+
+    ldr   r0, =0x1e6e0034                        @ disable MMC request
+    ldr   r1, =0x00020000
+    str   r1, [r0]
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e78400c
+    mov   r1, #0x83
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e202c
+    ldr   r2, [r0]
+    mov   r2, r2, lsr #12
+    tst   r2, #0x01
+    ldr   r0, =0x1e784000
+    moveq r1, #0x0D                              @ Baudrate 115200
+    movne r1, #0x01                              @ Baudrate 115200, div13
+#ifdef CONFIG_DRAM_UART_38400
+    moveq r1, #0x27                              @ Baudrate 38400
+    movne r1, #0x03                              @ Baudrate 38400 , div13
+#endif
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784004
+    mov   r1, #0x00
+    str   r1, [r0]
+
+    ldr   r0, =0x1e78400c
+    mov   r1, #0x03
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784008
+    mov   r1, #0x07
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784000
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x52                              @ 'R'
+    str   r1, [r0]
+    mov   r1, #0x41                              @ 'A'
+    str   r1, [r0]
+    mov   r1, #0x4D                              @ 'M'
+    str   r1, [r0]
+    mov   r1, #0x20                              @ ' '
+    str   r1, [r0]
+    mov   r1, #0x49                              @ 'I'
+    str   r1, [r0]
+    mov   r1, #0x6E                              @ 'n'
+    str   r1, [r0]
+    mov   r1, #0x69                              @ 'i'
+    str   r1, [r0]
+    mov   r1, #0x74                              @ 't'
+    str   r1, [r0]
+    mov   r1, #0x2D                              @ '-'
+    str   r1, [r0]
+    mov   r1, #0x56                              @ 'V'
+    str   r1, [r0]
+    mov   r1, #ASTMMC_INIT_VER
+    mov   r1, r1, lsr #4
+    print_hex_char
+    mov   r1, #ASTMMC_INIT_VER
+    print_hex_char
+    mov   r1, #0x2D                              @ '-'
+    str   r1, [r0]
+    ldr   r0, =0x1e784014
+wait_print:
+    ldr   r1, [r0]
+    tst   r1, #0x40
+    beq   wait_print
+    ldr   r0, =0x1e784000
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x52                              @ 'R'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+/******************************************************************************
+ Init DRAM common registers
+ ******************************************************************************/
+    ldr   r0, =0x1e6e0034                        @ disable SDRAM reset
+    ldr   r1, =0x00020080
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0008
+    ldr   r1, =0x2003000F                        /* VGA */
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0038                        @ disable all DRAM requests except CPU during PHY init
+    ldr   r1, =0xFFFFEBFF
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0040
+    ldr   r1, =0x88448844
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0044
+    ldr   r1, =0x24422288
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0048
+    ldr   r1, =0x22222222
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e004c
+    ldr   r1, =0x22222222
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0050
+    ldr   r1, =0x80000000
+    str   r1, [r0]
+
+    ldr   r1, =0x00000000
+    ldr   r0, =0x1e6e0208                        @ PHY Setting
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0218
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0220
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0228
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0230
+    str   r1, [r0]
+    ldr   r0, =0x1e6e02a8
+    str   r1, [r0]
+    ldr   r0, =0x1e6e02b0
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0240
+    ldr   r1, =0x86000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0244
+    ldr   r1, =0x00008600
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0248
+    ldr   r1, =0x80000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e024c
+    ldr   r1, =0x80808080
+    str   r1, [r0]
+
+    /* Check DRAM Type by H/W Trapping */
+    ldr   r0, =0x1e6e2070
+    ldr   r1, [r0]
+    ldr   r2, =0x01000000                        @ bit[24]=1 => DDR4
+    tst   r1, r2
+    bne   ddr4_init
+    b     ddr3_init
+.LTORG
+
+/******************************************************************************
+ DDR3 Init
+ ******************************************************************************/
+ddr3_init:
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x33                              @ '3'
+    str   r1, [r0]
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+#if   defined (CONFIG_DRAM_1333)
+    adrl  r5, TIME_TABLE_DDR3_1333               @ Init DRAM parameter table
+#else
+    adrl  r5, TIME_TABLE_DDR3_1600
+#endif
+
+    ldr   r0, =0x1e6e0004
+#ifdef CONFIG_DDR3_8GSTACK
+    ldr   r1, =0x00000323                        @ Init to 8GB stack
+#else
+    ldr   r1, =0x00000303                        @ Init to 8GB
+#endif
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0010
+    ldr   r1, [r5, #ASTMMC_REGIDX_010]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0014
+    ldr   r1, [r5, #ASTMMC_REGIDX_014]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0018
+    ldr   r1, [r5, #ASTMMC_REGIDX_018]
+    str   r1, [r0]
+
+    /* DRAM Mode Register Setting */
+    ldr   r0, =0x1e6e0020                        @ MRS_4/6
+    ldr   r1, [r5, #ASTMMC_REGIDX_020]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0024                        @ MRS_5
+    ldr   r1, [r5, #ASTMMC_REGIDX_024]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e002c                        @ MRS_0/2
+    ldr   r1, [r5, #ASTMMC_REGIDX_02C]
+    mov   r2, #0x1
+    orr   r1, r1, r2, lsl #8
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0030                        @ MRS_1/3
+    ldr   r1, [r5, #ASTMMC_REGIDX_030]
+    str   r1, [r0]
+
+    /* Start DDR PHY Setting */
+    ldr   r0, =0x1e6e0200
+    ldr   r1, =0x02492AAE
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0204
+#ifdef CONFIG_DDR3_8GSTACK
+    ldr   r1, =0x10001001
+#else
+    ldr   r1, =0x00001001
+#endif
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e020c
+    ldr   r1, =0x55E00B0B
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0210
+    ldr   r1, =0x20000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0214
+    ldr   r1, [r5, #ASTMMC_REGIDX_214]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02e0
+    ldr   r1, [r5, #ASTMMC_REGIDX_2E0]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02e4
+    ldr   r1, [r5, #ASTMMC_REGIDX_2E4]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02e8
+    ldr   r1, [r5, #ASTMMC_REGIDX_2E8]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02ec
+    ldr   r1, [r5, #ASTMMC_REGIDX_2EC]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02f0
+    ldr   r1, [r5, #ASTMMC_REGIDX_2F0]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02f4
+    ldr   r1, [r5, #ASTMMC_REGIDX_2F4]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02f8
+    ldr   r1, [r5, #ASTMMC_REGIDX_2F8]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0290
+    ldr   r1, =0x00100008
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02c0
+    ldr   r1, =0x00000006
+    str   r1, [r0]
+
+    /* Controller Setting */
+    ldr   r0, =0x1e6e0060                        @ Fire DDRPHY Init
+    ldr   r1, =0x00000005
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x00020091
+    str   r1, [r0]
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x30                              @ '0'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    ldr   r0, =0x1e6e0120
+    mov   r1, #0x00
+    str   r1, [r0]
+    b     ddr_phy_init_process
+
+ddr3_phyinit_done:
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x31                              @ '1'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    ldr   r0, =0x1e6e000c
+    ldr   r1, =0x00000040
+    str   r1, [r0]
+
+#ifdef CONFIG_DDR3_8GSTACK
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000025
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000027
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000023
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000021
+    str   r1, [r0]
+#endif
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000005
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000007
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000003
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000011
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e000c
+    ldr   r1, =0x00005C41
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r2, =0x70000000
+ddr3_check_dllrdy:
+    ldr   r1, [r0]
+    tst   r1, r2
+    bne   ddr3_check_dllrdy
+
+    ldr   r0, =0x1e6e000c
+    ldr   r1, =0x42AA5C81
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x0001AF93
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0120                        @ VGA Compatible Mode
+    ldr   r1, [r5, #ASTMMC_REGIDX_PLL]
+    str   r1, [r0]
+
+    b     Calibration_End
+.LTORG
+/******************************************************************************
+ End DDR3 Init
+ ******************************************************************************/
+/******************************************************************************
+ DDR4 Init
+ ******************************************************************************/
+ddr4_init:
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x34                              @ '4'
+    str   r1, [r0]
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+#if   defined (CONFIG_DRAM_1333)
+    adrl  r5, TIME_TABLE_DDR4_1333               @ Init DRAM parameter table
+#else
+    adrl  r5, TIME_TABLE_DDR4_1600
+#endif
+
+    ldr   r0, =0x1e6e0004
+#ifdef CONFIG_DDR4_4GX8
+    ldr   r1, =0x00002313                        @ Init to 8GB
+#else
+    ldr   r1, =0x00000313                        @ Init to 8GB
+#endif
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0010
+    ldr   r1, [r5, #ASTMMC_REGIDX_010]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0014
+    ldr   r1, [r5, #ASTMMC_REGIDX_014]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0018
+    ldr   r1, [r5, #ASTMMC_REGIDX_018]
+    str   r1, [r0]
+
+    /* DRAM Mode Register Setting */
+    ldr   r0, =0x1e6e0020                        @ MRS_4/6
+    ldr   r1, [r5, #ASTMMC_REGIDX_020]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0024                        @ MRS_5
+    ldr   r1, [r5, #ASTMMC_REGIDX_024]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e002c                        @ MRS_0/2
+    ldr   r1, [r5, #ASTMMC_REGIDX_02C]
+    mov   r2, #0x1
+    orr   r1, r1, r2, lsl #8
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0030                        @ MRS_1/3
+    ldr   r1, [r5, #ASTMMC_REGIDX_030]
+    str   r1, [r0]
+
+    /* Start DDR PHY Setting */
+    ldr   r0, =0x1e6e0200
+    ldr   r1, =0x42492AAE
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0204
+    ldr   r1, =0x09002000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e020c
+    ldr   r1, =0x55E00B0B
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0210
+    ldr   r1, =0x20000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0214
+    ldr   r1, [r5, #ASTMMC_REGIDX_214]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02e0
+    ldr   r1, [r5, #ASTMMC_REGIDX_2E0]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02e4
+    ldr   r1, [r5, #ASTMMC_REGIDX_2E4]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02e8
+    ldr   r1, [r5, #ASTMMC_REGIDX_2E8]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02ec
+    ldr   r1, [r5, #ASTMMC_REGIDX_2EC]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02f0
+    ldr   r1, [r5, #ASTMMC_REGIDX_2F0]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02f4
+    ldr   r1, [r5, #ASTMMC_REGIDX_2F4]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02f8
+    ldr   r1, [r5, #ASTMMC_REGIDX_2F8]
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0290
+    ldr   r1, =0x00100008
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02c4
+    ldr   r1, =0x3C183C3C
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02c8
+    ldr   r1, =0x00631E0E
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x0001A991
+    str   r1, [r0]
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x30                              @ '0'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    /********************************************
+     PHY Vref Scan
+     r6 : recorded vref value
+     r7 : max read eye pass window
+     r8 : passcnt
+     r9 : CBRtest result
+     r10: loopcnt
+     r11: free
+    ********************************************/
+    ldr   r0, =0x1e720000                        @ retry count
+    mov   r1, #0x5
+    str   r1, [r0]
+ddr4_vref_phy_cal_start:
+    mov   r7, #0x0
+    mov   r8, #0x0
+    mov   r10, #0x3F
+
+    ldr   r0, =0x1e720000
+    ldr   r1, [r0]
+    subs  r1, r1, #0x01
+    beq   ddr_test_fail
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0120
+    ldr   r1, =0x00000001
+    str   r1, [r0]
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x61                              @ 'a'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    ldr   r0, =0x1e6e02c0
+    ldr   r1, =0x00001C06
+    str   r1, [r0]
+
+ddr4_vref_phy_loop:
+    ldr   r0, =0x1e6e0060
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    add   r10, r10, #0x01
+    cmp   r10, #0x80
+    beq   ddr4_vref_phy_test_fail                @ no valid margin and retry
+
+    ldr   r0, =0x1e6e02cc
+    orr   r1, r10, r10, lsl #8
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0060
+    ldr   r1, =0x00000005
+    str   r1, [r0]
+    b     ddr_phy_init_process
+
+ddr4_vref_phy_phyinit_done:
+
+    b     cbr_test_start
+
+ddr4_vref_phy_cbrtest_done:
+    cmp   r9, #0x01
+    bne   ddr4_vref_phy_test_fail
+    add   r8, r8, #0x01
+    ldr   r0, =0x1e6e03d0                        @ read eye pass window
+    ldr   r1, [r0]
+    mov   r2, r1, lsr #8                         @ r2 = DQH
+    and   r1, r1, #0xFF                          @ r1 = DQL
+    cmp   r1, r2
+    movgt r1, r2                                 @ r1 = smaller one
+    cmp   r1, r7
+    movgt r6, r10
+    movgt r7, r1
+    b     ddr4_vref_phy_loop
+
+ddr4_vref_phy_test_fail:
+    cmp   r8, #0x0
+    bne   ddr4_vref_phy_loop_end
+    cmp   r10, #0x80
+    beq   ddr4_vref_phy_cal_start
+    b     ddr4_vref_phy_loop
+
+ddr4_vref_phy_loop_end:
+    ldr   r0, =0x1e6e02cc
+    orr   r1, r6, r6, lsl #8
+    str   r1, [r0]
+
+    /********************************************
+     DDR Vref Scan
+     r6 : min
+     r7 : max
+     r8 : passcnt
+     r9 : CBRtest result
+     r10: loopcnt
+     r11: free
+    ********************************************/
+    ldr   r0, =0x1e720000                        @ retry count
+    mov   r1, #0x5
+    str   r1, [r0]
+ddr4_vref_ddr_cal_start:
+    mov   r6, #0xFF
+    mov   r7, #0x0
+    mov   r8, #0x0
+    mov   r10, #0x0
+
+    ldr   r0, =0x1e720000
+    ldr   r1, [r0]
+    subs  r1, r1, #0x01
+    beq   ddr_test_fail
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0120
+    ldr   r1, =0x00000002
+    str   r1, [r0]
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x62                              @ 'b'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+ddr4_vref_ddr_loop:
+    ldr   r0, =0x1e6e0060
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    add   r10, r10, #0x01
+    cmp   r10, #0x40
+    beq   ddr4_vref_ddr_test_fail                @ no valid margin and retry
+
+    ldr   r0, =0x1e6e02c0
+    mov   r1, #0x06
+    orr   r1, r1, r10, lsl #8
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0060
+    ldr   r1, =0x00000005
+    str   r1, [r0]
+    b     ddr_phy_init_process
+
+ddr4_vref_ddr_phyinit_done:
+
+    b     cbr_test_start
+
+ddr4_vref_ddr_cbrtest_done:
+    cmp   r9, #0x01
+    bne   ddr4_vref_ddr_test_fail
+    add   r8, r8, #0x01
+    cmp   r6, r10
+    movgt r6, r10
+    cmp   r7, r10
+    movlt r7, r10
+    b     ddr4_vref_ddr_loop
+
+ddr4_vref_ddr_test_fail:
+    cmp   r8, #0x0
+    bne   ddr4_vref_ddr_loop_end
+    cmp   r10, #0x40
+    beq   ddr4_vref_ddr_cal_start
+    b     ddr4_vref_ddr_loop
+
+ddr4_vref_ddr_loop_end:
+    ldr   r0, =0x1e6e0060
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e02c0
+    add   r1, r6, r7
+    add   r1, r1, #0x01
+    mov   r2, r1, lsr #1
+    mov   r1, r2, lsl #8
+    orr   r1, r1, #0x06
+    str   r1, [r0]
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x63                              @ 'c'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    ldr   r0, =0x1e6e0120
+    ldr   r1, =0x00000003
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0060                        @ Fire DDRPHY Init
+    ldr   r1, =0x00000005
+    str   r1, [r0]
+    b     ddr_phy_init_process
+
+ddr4_phyinit_done:
+    /*******************************************/
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x31                              @ '1'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    ldr   r0, =0x1e6e000c
+    ldr   r1, =0x42AA5C81
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x0001AF93
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0120                        @ VGA Compatible Mode
+    ldr   r1, [r5, #ASTMMC_REGIDX_PLL]
+    str   r1, [r0]
+
+    b     Calibration_End
+
+.LTORG
+/******************************************************************************
+ End DDR4 Init
+ ******************************************************************************/
+/******************************************************************************
+ Global Process
+ ******************************************************************************/
+    /********************************************
+     DDRPHY Init Process
+    ********************************************/
+ddr_phy_init_process:
+    clear_delay_timer
+    /* Wait DDR PHY init done - timeout 300 ms */
+    ldr   r2, =0x000493E0                        @ Set Timer3 Reload = 300 ms
+    init_delay_timer
+    ldr   r3, =0x1e6e0060
+ddr_phy_init:
+    check_delay_timer
+    beq   ddr_phy_init_timeout
+    ldr   r1, [r3]
+    tst   r1, #0x01
+    bne   ddr_phy_init
+
+    /* Check DDR PHY init status */
+    ldr   r0, =0x1e6e0300
+    ldr   r2, =0x000A0000
+    ldr   r1, [r0]
+    tst   r1, r2
+    beq   ddr_phy_init_success
+
+ddr_phy_init_timeout:
+    ldr   r0, =0x1e6e0060                        @ Reset PHY
+    mov   r1, #0x00
+    str   r1, [r0]
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x2E                              @ '.'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    clear_delay_timer
+    /* Delay about 10us */
+    ldr   r2, =0x0000000A                        @ Set Timer3 Reload = 10 us
+    init_delay_timer
+ddr_phy_init_delay_0:
+    check_delay_timer
+    bne   ddr_phy_init_delay_0
+    clear_delay_timer
+    /* end delay 10us */
+
+    ldr   r0, =0x1e6e0060                        @ Fire PHY Init
+    mov   r1, #0x05
+    str   r1, [r0]
+    b     ddr_phy_init_process
+
+ddr_phy_init_success:
+    clear_delay_timer
+    ldr   r0, =0x1e6e0060
+    mov   r1, #0x06
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0120
+    ldr   r1, [r0]
+    cmp   r1, #0
+    beq   ddr3_phyinit_done
+    cmp   r1, #1
+    beq   ddr4_vref_phy_phyinit_done
+    cmp   r1, #2
+    beq   ddr4_vref_ddr_phyinit_done
+    b     ddr4_phyinit_done
+
+    /********************************************
+     CBRTest
+    ********************************************/
+cbr_test_start:
+    ldr   r0, =0x1e6e000c
+    ldr   r1, =0x00005C01
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0074
+    ldr   r1, =0x0000FFFF                        @ test size = 64KB
+    str   r1, [r0]
+    ldr   r0, =0x1e6e007c
+    ldr   r1, =0xFF00FF00
+    str   r1, [r0]
+
+cbr_test_single:
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    ldr   r1, =0x00000085
+    str   r1, [r0]
+    ldr   r3, =0x3000
+    ldr   r11, =0x50000
+cbr_wait_engine_idle_0:
+    subs  r11, r11, #1
+    beq   cbr_test_fail
+    ldr   r2, [r0]
+    tst   r2, r3                                 @ D[12] = idle bit
+    beq   cbr_wait_engine_idle_0
+
+    ldr   r0, =0x1e6e0070                        @ read fail bit status
+    ldr   r3, =0x2000
+    ldr   r2, [r0]
+    tst   r2, r3                                 @ D[13] = fail bit
+    bne   cbr_test_fail
+
+cbr_test_burst:
+    mov   r1, #0x00                              @ initialize loop index, r1 is loop index
+cbr_test_burst_loop:
+    ldr   r0, =0x1e6e0070
+    ldr   r2, =0x00000000
+    str   r2, [r0]
+    mov   r2, r1, lsl #3
+    orr   r2, r2, #0xC1                          @ test command = 0xC1 | (datagen << 3)
+    str   r2, [r0]
+    ldr   r3, =0x3000
+    ldr   r11, =0x20000
+cbr_wait_engine_idle_1:
+    subs  r11, r11, #1
+    beq   cbr_test_fail
+    ldr   r2, [r0]
+    tst   r2, r3                                 @ D[12] = idle bit
+    beq   cbr_wait_engine_idle_1
+
+    ldr   r0, =0x1e6e0070                        @ read fail bit status
+    ldr   r3, =0x2000
+    ldr   r2, [r0]
+    tst   r2, r3                                 @ D[13] = fail bit
+    bne   cbr_test_fail
+
+    add   r1, r1, #1                             @ increase the test mode index
+    cmp   r1, #0x04                              @ test 4 modes
+    bne   cbr_test_burst_loop
+
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    mov   r9, #0x1
+    b     cbr_test_pattern_end                   @ CBRTest() return(1)
+
+cbr_test_fail:
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    mov   r9, #0x0                               @ CBRTest() return(0)
+
+cbr_test_pattern_end:
+    ldr   r0, =0x1e6e000c
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0120
+    ldr   r1, [r0]
+    cmp   r1, #1
+    beq   ddr4_vref_phy_cbrtest_done
+    b     ddr4_vref_ddr_cbrtest_done
+
+.LTORG
+/******************************************************************************
+ Other features configuration
+ *****************************************************************************/
+Calibration_End:
+    /*******************************
+     Check DRAM Size
+     1Gb : 0x80000000 ~ 0x87FFFFFF
+     2Gb : 0x80000000 ~ 0x8FFFFFFF
+     4Gb : 0x80000000 ~ 0x9FFFFFFF
+     8Gb : 0x80000000 ~ 0xBFFFFFFF
+    *******************************/
+    ldr   r0, =0x1e6e0004
+    ldr   r6, [r0]
+    bic   r6, r6, #0x00000003                    @ record MCR04
+    ldr   r7, [r5, #ASTMMC_REGIDX_RFC]
+
+check_dram_size:
+    ldr   r0, =0xA0100000
+    ldr   r1, =0x41424344
+    str   r1, [r0]
+    ldr   r0, =0x90100000
+    ldr   r1, =0x35363738
+    str   r1, [r0]
+    ldr   r0, =0x88100000
+    ldr   r1, =0x292A2B2C
+    str   r1, [r0]
+    ldr   r0, =0x80100000
+    ldr   r1, =0x1D1E1F10
+    str   r1, [r0]
+    ldr   r0, =0xA0100000
+    ldr   r1, =0x41424344
+    ldr   r2, [r0]
+    cmp   r2, r1                                 @ == 8Gbit
+    orreq r6, r6, #0x03
+    moveq r7, r7, lsr #24
+    mov   r3, #0x38                              @ '8'
+    beq   check_dram_size_end
+    ldr   r0, =0x90100000
+    ldr   r1, =0x35363738
+    ldr   r2, [r0]
+    cmp   r2, r1                                 @ == 4Gbit
+    orreq r6, r6, #0x02
+    moveq r7, r7, lsr #16
+    mov   r3, #0x34                              @ '4'
+    beq   check_dram_size_end
+    ldr   r0, =0x88100000
+    ldr   r1, =0x292A2B2C
+    ldr   r2, [r0]
+    cmp   r2, r1                                 @ == 2Gbit
+    orreq r6, r6, #0x01
+    moveq r7, r7, lsr #8
+    mov   r3, #0x32                              @ '2'
+    beq   check_dram_size_end
+    mov   r3, #0x31                              @ '1'
+
+check_dram_size_end:
+    ldr   r0, =0x1e6e0004
+    str   r6, [r0]
+    ldr   r0, =0x1e6e0014
+    ldr   r1, [r0]
+    bic   r1, r1, #0x000000FF
+    and   r7, r7, #0xFF
+    orr   r1, r1, r7
+    str   r1, [r0]
+
+    /* Version Number */
+    ldr   r0, =0x1e6e0004
+    ldr   r1, [r0]
+    mov   r2, #ASTMMC_INIT_VER
+    orr   r1, r1, r2, lsl #20
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0088
+    ldr   r1, =ASTMMC_INIT_DATE
+    str   r1, [r0]
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x2D                              @ '-'
+    str   r1, [r0]
+    str   r3, [r0]
+    mov   r1, #0x47                              @ 'G'
+    str   r1, [r0]
+    mov   r1, #0x62                              @ 'b'
+    str   r1, [r0]
+    mov   r1, #0x2D                              @ '-'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    /* Enable DRAM Cache */
+    ldr   r0, =0x1e6e0004
+    ldr   r1, [r0]
+    mov   r2, #1
+    orr   r2, r1, r2, lsl #12
+    str   r2, [r0]
+    ldr   r3, =0x00080000
+dram_cache_init:
+    ldr   r2, [r0]
+    tst   r2, r3
+    beq   dram_cache_init
+    mov   r2, #1
+    orr   r1, r1, r2, lsl #10
+    str   r1, [r0]
+
+    /* Set DRAM requests threshold */
+    ldr   r0, =0x1e6e001c
+    ldr   r1, =0x00000008
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0038
+    ldr   r1, =0xFFFFFF00
+    str   r1, [r0]
+
+    /********************************************
+     DDRTest
+    ********************************************/
+ddr_test_start:
+    ldr   r0, =0x1e6e0074
+    ldr   r1, =0x0000FFFF                        @ test size = 64KB
+    str   r1, [r0]
+    ldr   r0, =0x1e6e007c
+    ldr   r1, =0xFF00FF00
+    str   r1, [r0]
+
+ddr_test_burst:
+    mov   r1, #0x00                              @ initialize loop index, r1 is loop index
+ddr_test_burst_loop:
+    ldr   r0, =0x1e6e0070
+    ldr   r2, =0x00000000
+    str   r2, [r0]
+    mov   r2, r1, lsl #3
+    orr   r2, r2, #0xC1                          @ test command = 0xC1 | (datagen << 3)
+    str   r2, [r0]
+    ldr   r3, =0x3000
+    ldr   r11, =0x20000
+ddr_wait_engine_idle_1:
+    subs  r11, r11, #1
+    beq   ddr_test_fail
+    ldr   r2, [r0]
+    tst   r2, r3                                 @ D[12] = idle bit
+    beq   ddr_wait_engine_idle_1
+
+    ldr   r0, =0x1e6e0070                        @ read fail bit status
+    ldr   r3, =0x2000
+    ldr   r2, [r0]
+    tst   r2, r3                                 @ D[13] = fail bit
+    bne   ddr_test_fail
+
+    add   r1, r1, #1                             @ increase the test mode index
+    cmp   r1, #0x01                              @ test 1 modes
+    bne   ddr_test_burst_loop
+
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    b     set_scratch                            @ CBRTest() return(1)
+
+ddr_test_fail:
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x46                              @ 'F'
+    str   r1, [r0]
+    mov   r1, #0x61                              @ 'a'
+    str   r1, [r0]
+    mov   r1, #0x69                              @ 'i'
+    str   r1, [r0]
+    mov   r1, #0x6C                              @ 'l'
+    str   r1, [r0]
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+    ldr   r0, =0x1e784014
+wait_print_0:
+    ldr   r1, [r0]
+    tst   r1, #0x40
+    beq   wait_print_0
+/* Debug - UART console message */
+    b     reset_mmc
+
+set_scratch:
+    /*Set Scratch register Bit 6 after ddr initial finished */
+    ldr   r0, =0x1e6e2040
+    ldr   r1, [r0]
+    orr   r1, r1, #0x41
+    str   r1, [r0]
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x6F                              @ 'o'
+    str   r1, [r0]
+    mov   r1, #0x6E                              @ 'n'
+    str   r1, [r0]
+    mov   r1, #0x65                              @ 'e'
+    str   r1, [r0]
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    /* Enable VGA display */
+    ldr   r0, =0x1e6e202c
+    ldr   r1, [r0]
+    bic   r1, r1, #0x40
+    str   r1, [r0]
+
+/* Debug - UART console message */
+   /* Print PHY timing information */
+    ldr   r0, =0x1e784014
+wait_print_1:
+    ldr   r1, [r0]
+    tst   r1, #0x40
+    beq   wait_print_1
+
+    ldr   r0, =0x1e784000
+    mov   r1, #0x52                              @ 'R'
+    str   r1, [r0]
+    mov   r1, #0x65                              @ 'e'
+    str   r1, [r0]
+    mov   r1, #0x61                              @ 'a'
+    str   r1, [r0]
+    mov   r1, #0x64                              @ 'd'
+    str   r1, [r0]
+    mov   r1, #0x20                              @ ' '
+    str   r1, [r0]
+    mov   r1, #0x6D                              @ 'm'
+    str   r1, [r0]
+    mov   r1, #0x61                              @ 'a'
+    str   r1, [r0]
+    mov   r1, #0x72                              @ 'r'
+    str   r1, [r0]
+    mov   r1, #0x67                              @ 'g'
+    str   r1, [r0]
+    mov   r1, #0x69                              @ 'i'
+    str   r1, [r0]
+    mov   r1, #0x6E                              @ 'n'
+    str   r1, [r0]
+    mov   r1, #0x2D                              @ '-'
+    str   r1, [r0]
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x4C                              @ 'L'
+    str   r1, [r0]
+    mov   r1, #0x3A                              @ ':'
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784014
+wait_print_2:
+    ldr   r1, [r0]
+    tst   r1, #0x40
+    beq   wait_print_2
+
+    ldr   r7, =0x000001FE                        @ divide by 510
+    mov   r8, #10                                @ multiply by 10
+print_DQL_eye_margin:
+    ldr   r0, =0x1e6e03d0
+    ldr   r2, [r0]
+    and   r2, r2, #0xFF
+    ldr   r0, =0x1e784000
+    mov   r1, #0x30                              @ '0'
+    str   r1, [r0]
+    mov   r1, #0x2E                              @ '.'
+    str   r1, [r0]
+    mov   r3, #0x4                               @ print 4 digits
+print_DQL_div_loop:
+    mul   r2, r8, r2
+    cmp   r2, r7
+    blt   print_DQL_div_0
+    mov   r6, #0x0
+print_DQL_div_digit:
+    sub   r2, r2, r7
+    add   r6, r6, #0x1
+    cmp   r2, r7
+    bge   print_DQL_div_digit
+    b     print_DQL_div_n
+
+print_DQL_div_0:
+    mov   r1, #0x30                              @ '0'
+    str   r1, [r0]
+    b     print_DQL_next
+print_DQL_div_n:
+    add   r1, r6, #0x30                          @ print n
+    str   r1, [r0]
+print_DQL_next:
+    subs  r3, r3, #1
+    beq   print_DQH_eye_margin
+    cmp   r2, #0x0
+    beq   print_DQH_eye_margin
+    b     print_DQL_div_loop
+
+print_DQH_eye_margin:
+    mov   r1, #0x2F                              @ '/'
+    str   r1, [r0]
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x48                              @ 'H'
+    str   r1, [r0]
+    mov   r1, #0x3A                              @ ':'
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784014
+wait_print_3:
+    ldr   r1, [r0]
+    tst   r1, #0x40
+    beq   wait_print_3
+
+    ldr   r0, =0x1e6e03d0
+    ldr   r2, [r0]
+    mov   r2, r2, lsr #8
+    and   r2, r2, #0xFF
+    ldr   r0, =0x1e784000
+    mov   r1, #0x30                              @ '0'
+    str   r1, [r0]
+    mov   r1, #0x2E                              @ '.'
+    str   r1, [r0]
+    mov   r3, #0x4                               @ print 4 digits
+print_DQH_div_loop:
+    mul   r2, r8, r2
+    cmp   r2, r7
+    blt   print_DQH_div_0
+    mov   r6, #0x0
+print_DQH_div_digit:
+    sub   r2, r2, r7
+    add   r6, r6, #0x1
+    cmp   r2, r7
+    bge   print_DQH_div_digit
+    b     print_DQH_div_n
+
+print_DQH_div_0:
+    mov   r1, #0x30                              @ '0'
+    str   r1, [r0]
+    b     print_DQH_next
+print_DQH_div_n:
+    add   r1, r6, #0x30                          @ print n
+    str   r1, [r0]
+print_DQH_next:
+    subs  r3, r3, #1
+    beq   print_DQ_eye_margin_last
+    cmp   r2, #0x0
+    beq   print_DQ_eye_margin_last
+    b     print_DQH_div_loop
+
+print_DQ_eye_margin_last:
+    mov   r1, #0x20                              @ ' '
+    str   r1, [r0]
+    mov   r1, #0x43                              @ 'C'
+    str   r1, [r0]
+    mov   r1, #0x4B                              @ 'K'
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784014
+wait_print_4:
+    ldr   r1, [r0]
+    tst   r1, #0x40
+    beq   wait_print_4
+
+    ldr   r0, =0x1e784000
+    mov   r1, #0x20                              @ ' '
+    str   r1, [r0]
+    mov   r1, #0x28                              @ '('
+    str   r1, [r0]
+    mov   r1, #0x6D                              @ 'm'
+    str   r1, [r0]
+    mov   r1, #0x69                              @ 'i'
+    str   r1, [r0]
+    mov   r1, #0x6E                              @ 'n'
+    str   r1, [r0]
+    mov   r1, #0x3A                              @ ':'
+    str   r1, [r0]
+    mov   r1, #0x30                              @ '0'
+    str   r1, [r0]
+    mov   r1, #0x2E                              @ '.'
+    str   r1, [r0]
+    mov   r1, #0x33                              @ '3'
+    str   r1, [r0]
+    mov   r1, #0x35                              @ '5'
+    str   r1, [r0]
+    mov   r1, #0x29                              @ ')'
+    str   r1, [r0]
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+platform_exit:
+#ifdef CONFIG_DRAM_ECC
+    ldr   r0, =0x1e6e0004
+    ldr   r1, [r0]
+    orr   r1, r1, #0x80
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0054
+    ldr   r1, =CONFIG_DRAM_ECC_SIZE              /* ECC protected memory size */
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e007C
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0074
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000221
+    str   r1, [r0]
+
+    ldr   r2, =0x00001000
+ECC_Init_Flag:
+    ldr   r1, [r0]
+    tst   r1, r2                                 @ D[12] = 1, Done
+    beq   ECC_Init_Flag
+
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0050
+    ldr   r1, =0x80000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0050
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000400                        @ Enable ECC auto-scrubbing
+    str   r1, [r0]
+#endif
+
+/******************************************************************************
+ SPI Timing Calibration
+ ******************************************************************************/
+    mov   r2, #0x0
+    mov   r6, #0x0
+    mov   r7, #0x0
+    init_spi_checksum
+spi_checksum_wait_0:
+    ldr   r1, [r0]
+    tst   r1, r2
+    beq   spi_checksum_wait_0
+    ldr   r0, =0x1e620090
+    ldr   r5, [r0]                               @ record golden checksum
+    ldr   r0, =0x1e620080
+    mov   r1, #0x0
+    str   r1, [r0]
+
+    ldr   r0, =0x1e620010                        @ set to fast read mode
+    ldr   r1, =0x000B0041
+    str   r1, [r0]
+
+    ldr   r6, =0x00F7E6D0                        @ Init spiclk loop
+    mov   r8, #0x0                               @ Init delay record
+
+spi_cbr_next_clkrate:
+    mov   r6, r6, lsr #0x4
+    cmp   r6, #0x0
+    beq   spi_cbr_end
+
+    mov   r7, #0x0                               @ Init delay loop
+    mov   r8, r8, lsl #4
+
+spi_cbr_next_delay_s:
+    mov   r2, #0x8
+    init_spi_checksum
+spi_checksum_wait_1:
+    ldr   r1, [r0]
+    tst   r1, r2
+    beq   spi_checksum_wait_1
+    ldr   r0, =0x1e620090
+    ldr   r2, [r0]                               @ read checksum
+    ldr   r0, =0x1e620080
+    mov   r1, #0x0
+    str   r1, [r0]
+    cmp   r2, r5
+    bne   spi_cbr_next_delay_e
+
+    mov   r2, #0x0
+    init_spi_checksum
+spi_checksum_wait_2:
+    ldr   r1, [r0]
+    tst   r1, r2
+    beq   spi_checksum_wait_2
+    ldr   r0, =0x1e620090
+    ldr   r2, [r0]                               @ read checksum
+    ldr   r0, =0x1e620080
+    mov   r1, #0x0
+    str   r1, [r0]
+    cmp   r2, r5
+    bne   spi_cbr_next_delay_e
+
+    orr   r8, r8, r7                             @ record passed delay
+    b     spi_cbr_next_clkrate
+
+spi_cbr_next_delay_e:
+    add   r7, r7, #0x1
+    cmp   r7, #0x6
+    blt   spi_cbr_next_delay_s
+    b     spi_cbr_next_clkrate
+
+spi_cbr_end:
+    ldr   r0, =0x1e620094
+    str   r8, [r0]
+    ldr   r0, =0x1e620010
+    mov   r1, #0x0
+    str   r1, [r0]
+
+/******************************************************************************
+ Miscellaneous Setting
+ ******************************************************************************/
+    /* Set UART DMA as AHB high priority master */
+    ldr   r0, =0x1e600000
+    ldr   r1, =0xAEED1A03
+    str   r1, [r0]
+
+    ldr   r0, =0x1e600080
+    ldr   r2, =0x100
+    ldr   r1, [r0]
+    orr   r1, r1, r2
+    str   r1, [r0]
+
+    /* Enable UART3/4 clock and disable LHCLK */
+    ldr   r0, =0x1e6e200c
+    ldr   r1, [r0]
+    ldr   r2, =0xF9FFFFFF
+    and   r1, r1, r2
+    ldr   r2, =0x10000000
+    orr   r1, r1, r2
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e2008                        @ Set Video ECLK phase
+    ldr   r1, [r0]
+    ldr   r2, =0x0ffffff3
+    and   r1, r1, r2
+    str   r1, [r0]
+
+    ldr r0, =0x1e6e2004                          @ Enable JTAG Master, solve ARM stucked by JTAG issue
+    ldr r1, [r0]
+    bic r1, r1, #0x00400000
+    str r1, [r0]
+
+/******************************************************************************
+ Configure MAC timing
+ ******************************************************************************/
+    /* Enable D2PLL and set to 250MHz */
+    ldr   r0, =0x1e6e213c
+    ldr   r1, =0x00000585                        @ Reset D2PLL
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e202c
+    ldr   r1, [r0]
+    bic   r1, r1, #0x10                          @ Enable D2PLL
+    ldr   r2, =0x00200000                        @ Set CRT = 40MHz
+    orr   r1, r1, r2
+    str   r1, [r0]
+
+    ldr   r2, =0x8E00A17C                        @ Set to 250MHz
+
+    ldr   r0, =0x1e6e2070                        @ Check CLKIN = 25MHz
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #23
+    tst   r1, #0x01
+    beq   set_D2PLL
+    ldr   r2, =0x8E00A177
+
+set_D2PLL:
+    ldr   r0, =0x1e6e201c
+    str   r2, [r0]
+    ldr   r0, =0x1e6e213c                        @ Enable D2PLL
+    ldr   r1, =0x00000580
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204c
+    ldr   r1, [r0]
+    bic   r1, r1, #0xFF0000
+    ldr   r2, =0x00040000                        @ Set divider ratio
+    orr   r1, r1, r2
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e2048                        @ Set MAC interface delay timing = 1G
+    ldr   r1, =0x80082208                        @ Select internal 125MHz
+    str   r1, [r0]
+    ldr   r0, =0x1e6e20b8                        @ Set MAC interface delay timing = 100M
+    str   r1, [r0]
+    ldr   r0, =0x1e6e20bc                        @ Set MAC interface delay timing = 10M
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e2070                        @ Set MAC AHB bus clock
+    ldr   r1, [r0]
+    mov   r2, #0x04                              @ Default RMII, set MHCLK = HPLL/10
+    tst   r1, #0xC0
+    movne r2, #0x02                              @ if RGMII,     set MHCLK = HPLL/6
+    ldr   r0, =0x1e6e2008
+    ldr   r1, [r0]
+    bic   r1, r1, #0x00070000
+    orr   r1, r1, r2, lsl #16
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e21dc                        @ Set MAC duty
+    ldr   r1, =0x00666400
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e2090                        @ Enable MAC interface pull low
+    ldr   r1, [r0]
+    bic   r1, r1, #0x0000F000
+    str   r1, [r0]
+
+/* Test - DRAM initial time */
+    ldr   r0, =0x1e782040
+    ldr   r1, [r0]
+    ldr   r0, =0xFFFFFFFF
+    sub   r1, r0, r1
+    ldr   r0, =0x1e6e008c
+    str   r1, [r0]
+    ldr   r0, =0x1e78203c
+    ldr   r1, =0x0000F000
+    str   r1, [r0]
+/* Test - DRAM initial time */
+
+    ldr   r0, =0x1e6e0000                        @ disable MMC password
+    mov   r1, #0x0
+    str   r1, [r0]
+
+    /* Disable Timer separate mode */
+    ldr   r0, =0x1e782038
+    ldr   r1, =0xEA
+    str   r1, [r0]
+
+    /* restore lr */
+    mov   lr, r4
+
+    /* back to arch calling code */
+    mov   pc, lr
diff --git a/board/aspeed/ast-g5/platform_armsim2.S b/board/aspeed/ast-g5/platform_armsim2.S
new file mode 100644
index 000000000000..d1c253dcfa68
--- /dev/null
+++ b/board/aspeed/ast-g5/platform_armsim2.S
@@ -0,0 +1,451 @@
+/*
+ * Board specific setup info
+ *
+ * (C) Copyright 2003, ARM Ltd.
+ * Philippe Robin, <philippe.robin@arm.com>
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ *
+ ******************************************************************************
+ * ARM11 Simulation
+ *
+ ******************************************************************************
+ */
+
+#include <config.h>
+#include <version.h>
+/******************************************************************************
+ Calibration Macro Start
+ Usable registers:
+  r0, r1, r2, r3, r5, r6, r7, r8, r9, r10, r11
+ ******************************************************************************/
+    .macro init_delay_timer
+    ldr r0, =0x1e782024                          @ Set Timer3 Reload
+    str r2, [r0]
+
+    ldr r0, =0x1e6c0038                          @ Clear Timer3 ISR
+    ldr r1, =0x00040000
+    str r1, [r0]
+
+    ldr r0, =0x1e782030                          @ Enable Timer3
+    ldr r1, [r0]
+    mov r2, #7
+    orr r1, r1, r2, lsl #8
+    str r1, [r0]
+
+    ldr r0, =0x1e6c0090                          @ Check ISR for Timer3 timeout
+    .endm
+
+    .macro check_delay_timer
+    ldr r1, [r0]
+    bic r1, r1, #0xFFFBFFFF
+    mov r2, r1, lsr #18
+    cmp r2, #0x01
+    .endm
+
+    .macro clear_delay_timer
+    ldr r0, =0x1e78203C                          @ Disable Timer3
+    mov r2, #0xF
+    mov r1, r2, lsl #8
+    str r1, [r0]
+
+    ldr r0, =0x1e6c0038                          @ Clear Timer3 ISR
+    ldr r1, =0x00040000
+    str r1, [r0]
+    .endm
+
+/******************************************************************************
+ Calibration Macro End
+ ******************************************************************************/
+.globl lowlevel_init
+lowlevel_init:
+
+init_dram:
+    /* save lr */
+    mov r4, lr
+
+    /*Set Scratch register Bit 7 before initialize*/
+    ldr r0, =0x1e6e2000
+    ldr r1, =0x1688a8a8
+    str r1, [r0]
+
+    ldr r0, =0x1e6e2040
+    ldr r1, [r0]
+    orr r1, r1, #0x80
+    str r1, [r0]
+
+/******************************************************************************
+ Disable WDT3 for SPI Address mode detection function
+ ******************************************************************************/
+    ldr   r0, =0x1e78504c
+    mov   r1, #0
+    str   r1, [r0]
+/******************************************************************************
+ Disable WDT2 for 2nd boot function
+ ******************************************************************************/
+    ldr   r0, =0x1e78502c
+    mov   r1, #0
+    str   r1, [r0]
+
+    /* Check Scratch Register Bit 6 */
+    ldr r0, =0x1e6e2040
+    ldr r1, [r0]
+    bic r1, r1, #0xFFFFFFBF
+    mov r2, r1, lsr #6
+    cmp r2, #0x01
+    beq platform_exit
+
+set_MPLL:
+    ldr r0, =0x1e6e2020                          @ M-PLL (DDR SDRAM) Frequency
+    ldr r1, =0x63002400
+    str r1, [r0]
+
+    ldr r0, =0x1e780000
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e780004
+    ldr r1, =0xFFFFFFFF
+    str r1, [r0]
+
+    /* Enable Timer separate clear mode */
+    ldr   r0, =0x1e782038
+    mov   r1, #0xAE
+    str   r1, [r0]
+    clear_delay_timer
+
+    /* Delay about 100us */
+    ldr   r2, =0x0000000A                        @ Set Timer3 Reload = 10 us
+    init_delay_timer
+delay_0:
+    check_delay_timer
+    bne   delay_0
+    clear_delay_timer
+    /* end delay 10us */
+
+    /* Enable AXI_P */
+    ldr   r0, =0x00000016
+    mrc   p15, 0, r1, c15, c2, 4
+    mcr   p15, 0, r0, c15, c2, 4
+
+/******************************************************************************
+ Init DRAM common registers
+ ******************************************************************************/
+    ldr r0, =0x1e6e0000
+    ldr r1, =0xfc600309
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0020
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0024
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e002c
+    ldr r1, =0x00181D60
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0030
+    ldr r1, =0x00000040
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0208
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0218
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0220
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0228
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0230
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e02a8
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e02b0
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0200
+    ldr r1, =0x02492AAE
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0204
+    ldr r1, =0x00000801
+    str r1, [r0]
+
+    ldr r0, =0x1e6e020c
+    ldr r1, =0x55E00A0A
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0210
+    ldr r1, =0x20000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0214
+    ldr r1, =0x00000024
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0240
+    ldr r1, =0x86000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0244
+    ldr r1, =0x00008600
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0248
+    ldr r1, =0x80000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e024c
+    ldr r1, =0x80808080
+    str r1, [r0]
+
+    ldr r0, =0x1e6e02e0
+    ldr r1, =0x01000600
+    str r1, [r0]
+
+    ldr r0, =0x1e6e02e4
+    ldr r1, =0x05000091
+    str r1, [r0]
+
+    ldr r0, =0x1e6e02e8
+    ldr r1, =0x000F800C
+    str r1, [r0]
+
+    ldr r0, =0x1e6e02ec
+    ldr r1, =0x00258105
+    str r1, [r0]
+
+    ldr r0, =0x1e6e02f0
+    ldr r1, =0x03040403
+    str r1, [r0]
+
+    ldr r0, =0x1e6e02f4
+    ldr r1, =0x8D000700
+    str r1, [r0]
+
+    ldr r0, =0x1e6e02f8
+    ldr r1, =0x05400A00
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0290
+    ldr r1, =0x00100018
+    str r1, [r0]
+
+    ldr r0, =0x1e6e02c0
+    ldr r1, =0x00000006
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0060
+    ldr r1, =0x00000005
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0004
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0010
+    ldr r1, =0x43403C38
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0014
+    ldr r1, =0x0568E32B
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0018
+    ldr r1, =0x00000200
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0008
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0038
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e003c
+    ldr r1, =0xFFFFFFF0
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0040
+    ldr r1, =0x88888888
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0044
+    ldr r1, =0x88888888
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0048
+    ldr r1, =0x88888888
+    str r1, [r0]
+
+    ldr r0, =0x1e6e004c
+    ldr r1, =0x88888888
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0070
+    ldr r1, =0x00000400
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0074
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0078
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e007c
+    ldr r1, =0x00000000
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0034
+    ldr r1, =0x00000081
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0004
+    ldr r1, =0x00001000
+    ldr r2, [r0]
+    orr r1, r1, r2
+    str r1, [r0]
+
+    ldr r1, =0x00080000
+wait_cache_init:
+    ldr r2, [r0]
+    tst r1, r2
+    beq wait_cache_init
+
+    ldr r0, =0x1e780000
+    ldr r1, =0x00000001
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0060
+wait_ddrphy_init:
+    ldr r1, [r0]
+    tst r1, #0x01
+    bne wait_ddrphy_init
+    ldr r1, =0x00000006
+    str r1, [r0]
+
+    ldr r0, =0x1e780000
+    ldr r1, =0x00000002
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0034
+    ldr r1, =0x00000091
+    str r1, [r0]
+
+    ldr r0, =0x1e6e000c
+    ldr r1, =0x00000040
+    str r1, [r0]
+
+    /* Delay about 400us */
+    ldr   r2, =0x00000002                        @ Set Timer3 Reload = 400 us
+    init_delay_timer
+delay_1:
+    check_delay_timer
+    bne   delay_1
+    clear_delay_timer
+    /* end delay 400us */
+
+    ldr r0, =0x1e6e002c
+    ldr r1, =0x00181D60
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0030
+    ldr r1, =0x00000040
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0028
+    ldr r1, =0x00000005
+    str r1, [r0]
+    ldr r1, =0x00000007
+    str r1, [r0]
+    ldr r1, =0x00000003
+    str r1, [r0]
+    ldr r1, =0x00000011
+    str r1, [r0]
+
+    ldr r0, =0x1e6e000c
+    ldr r1, =0x00005A01
+    str r1, [r0]
+
+    /* Delay about 1us */
+    ldr   r2, =0x00000001                        @ Set Timer3 Reload = 1 us
+    init_delay_timer
+delay_2:
+    check_delay_timer
+    bne   delay_2
+    clear_delay_timer
+    /* end delay 1us */
+
+    ldr r0, =0x1e6e000c
+    ldr r1, =0x00002048
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0034
+    ldr r1, =0x70000000
+wait_ddrdll_reset:
+    ldr r2, [r0]
+    tst r1, r2
+    bne wait_ddrdll_reset
+
+    ldr r0, =0x1e6e002c
+    ldr r1, =0x00181C60
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0028
+    ldr r1, =0x00000001
+    str r1, [r0]
+
+    ldr r0, =0x1e6e000c
+    ldr r1, =0x00005C01
+    str r1, [r0]
+
+    ldr r0, =0x1e6e0034
+    ldr r1, =0x0001AF93
+    str r1, [r0]
+
+    ldr r0, =0x1e780000
+    ldr r1, =0x00000004
+    str r1, [r0]
+
+platform_exit:
+
+    /* restore lr */
+    mov   lr, r4
+
+    /* back to arch calling code */
+    mov   pc, lr
diff --git a/board/aspeed/ast-g5/platform_fpga.S b/board/aspeed/ast-g5/platform_fpga.S
new file mode 100644
index 000000000000..2a730f962073
--- /dev/null
+++ b/board/aspeed/ast-g5/platform_fpga.S
@@ -0,0 +1,822 @@
+/*
+ * Board specific setup info
+ *
+ ******************************************************************************
+ * ASPEED Technology Inc.
+ * AST2500 FPGA DDR3 SDRAM controller initialization and calibration sequence
+ *
+ * Gary Hsu, <gary_hsu@aspeedtech.com>
+ *
+ * Release date:
+ *
+ * Optional define variable
+ ******************************************************************************
+ */
+
+#include <config.h>
+#include <version.h>
+
+/******************************************************************************
+ Calibration Macro Start
+ Usable registers:
+  r0, r1, r2, r3, r5, r6, r7, r8, r9, r10, r11
+ ******************************************************************************/
+/* PATTERN_TABLE,
+   init_delay_timer,
+   check_delay_timer,
+   clear_delay_timer,
+   record_pll_pass_range,
+   record_pll_pass_range_h,
+   are for DRAM calibration */
+
+PATTERN_TABLE:
+    .word   0xff00ff00
+    .word   0xcc33cc33
+    .word   0xaa55aa55
+    .word   0x88778877
+    .word   0x92cc4d6e       @ 5
+    .word   0x543d3cde
+    .word   0xf1e843c7
+    .word   0x7c61d253
+    .word   0x00000000       @ 8
+
+    .macro init_delay_timer
+    ldr r0, =0x1e782024                          @ Set Timer3 Reload
+    str r2, [r0]
+
+    ldr r0, =0x1e6c0038                          @ Clear Timer3 ISR
+    ldr r1, =0x00040000
+    str r1, [r0]
+
+    ldr r0, =0x1e782030                          @ Enable Timer3
+    mov r2, #7
+    mov r1, r2, lsl #8
+    str r1, [r0]
+
+    ldr r0, =0x1e6c0090                          @ Check ISR for Timer3 timeout
+    .endm
+
+    .macro check_delay_timer
+    ldr r1, [r0]
+    bic r1, r1, #0xFFFBFFFF
+    mov r2, r1, lsr #18
+    cmp r2, #0x01
+    .endm
+
+    .macro clear_delay_timer
+    ldr r0, =0x1e78203C                          @ Disable Timer3
+    mov r2, #0xF
+    mov r1, r2, lsl #8
+    str r1, [r0]
+
+    ldr r0, =0x1e6c0038                          @ Clear Timer3 ISR
+    ldr r1, =0x00040000
+    str r1, [r0]
+    .endm
+
+    .macro record_pll_pass_range
+    ldr                 r1, [r0]
+    bic                 r2, r1, #0xFFFFFF00
+    cmp                 r2, r3                   @ record min
+    bicgt               r1, r1, #0x000000FF
+    orrgt               r1, r1, r3
+    bic                 r2, r1, #0xFFFF00FF
+    cmp                 r3, r2, lsr #8           @ record max
+    bicgt               r1, r1, #0x0000FF00
+    orrgt               r1, r1, r3, lsl #8
+    str                 r1, [r0]
+    .endm
+
+    .macro record_pll_pass_range_h
+    ldr                 r1, [r0]
+    bic                 r2, r1, #0xFF00FFFF
+    mov                 r2, r2, lsr #16
+    cmp                 r2, r3                   @ record min
+    bicgt               r1, r1, #0x00FF0000
+    orrgt               r1, r1, r3, lsl #16
+    bic                 r2, r1, #0x00FFFFFF
+    cmp                 r3, r2, lsr #24          @ record max
+    bicgt               r1, r1, #0xFF000000
+    orrgt               r1, r1, r3, lsl #24
+    str                 r1, [r0]
+    .endm
+
+/******************************************************************************
+ Calibration Macro End
+ ******************************************************************************/
+
+.globl lowlevel_init
+lowlevel_init:
+
+    /* save lr */
+    mov   r4, lr
+
+    /*Set Scratch register Bit 7 before initialize*/
+    ldr r0, =0x1e6e2000
+    ldr r1, =0x1688a8a8
+    str r1, [r0]
+
+    ldr r0, =0x1e6e2040
+    ldr r1, [r0]
+    orr r1, r1, #0x80
+    str r1, [r0]
+
+/******************************************************************************
+ Disable WDT3 for SPI Address mode detection function
+ ******************************************************************************/
+    ldr   r0, =0x1e78504c
+    mov   r1, #0
+    str   r1, [r0]
+/******************************************************************************
+ Disable WDT2 for 2nd boot function
+ ******************************************************************************/
+    ldr   r0, =0x1e78502c
+    mov   r1, #0
+    str   r1, [r0]
+
+#if (CONFIG_AST_FPGA_VER == 4)
+init_arm11:
+    /* Start of ES40004A PLL init */
+    /* Step 1. Program PLL_config and keep power down */
+    ldr   r0, =0x33000000
+    ldr   r1, =0x01000000
+    str   r1, [r0]
+    ldr   r1, =0x0102001A                        @ 324 MHz
+    str   r1, [r0]
+
+    /* Step 2. Wait 1us for PLL initialization */
+    ldr   r2, =0x00000100
+delay_ES40004A_pll_init:
+    subs  r2, r2, #1
+    bne   delay_ES40004A_pll_init
+
+    /* Step 3. Program PLL_config to exit Power down */
+    ldr   r1, =0x0002001A
+    str   r1, [r0]
+
+    /* Step 4. Check pll_ld = 1?. Read PLL_config, check bit 27. */
+    ldr   r2, =0x08000000                        @ bit[27] PLL lock detection
+check_pll_ld:
+    ldr   r1, [r0]
+    tst   r1, r2
+    beq   check_pll_ld
+
+    /* Step 5. Program aclk_div */
+    ldr   r0, =0x33000004
+    ldr   r1, =0x00000007                        @ CPU/AXI = 8/1
+    str   r1, [r0]
+
+    /* Step 6. Program set_pll */
+    ldr   r1, =0x00010007
+    str   r1, [r0]
+    /* End of ES40004A PLL init */
+#endif
+
+    /* Check Scratch Register Bit 6 */
+    ldr r0, =0x1e6e2040
+    ldr r1, [r0]
+    bic r1, r1, #0xFFFFFFBF
+    mov r2, r1, lsr #6
+    cmp r2, #0x01
+    beq platform_exit
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e78400c
+    mov   r1, #0x83
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e202c
+    ldr   r2, [r0]
+    mov   r2, r2, lsr #12
+    tst   r2, #0x01
+    ldr   r0, =0x1e784000
+    moveq r1, #0x0D                              @ Baudrate 115200
+    movne r1, #0x01                              @ Baudrate 115200, div13
+#if defined(CONFIG_DRAM_UART_38400)
+    moveq r1, #0x27                              @ Baudrate 38400
+    movne r1, #0x03                              @ Baudrate 38400 , div13
+#endif
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784004
+    mov   r1, #0x00
+    str   r1, [r0]
+
+    ldr   r0, =0x1e78400c
+    mov   r1, #0x03
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784008
+    mov   r1, #0x07
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784000
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x52                              @ 'R'
+    str   r1, [r0]
+    mov   r1, #0x41                              @ 'A'
+    str   r1, [r0]
+    mov   r1, #0x4D                              @ 'M'
+    str   r1, [r0]
+    mov   r1, #0x20                              @ ' '
+    str   r1, [r0]
+    mov   r1, #0x49                              @ 'I'
+    str   r1, [r0]
+    mov   r1, #0x6E                              @ 'n'
+    str   r1, [r0]
+    mov   r1, #0x69                              @ 'i'
+    str   r1, [r0]
+    mov   r1, #0x74                              @ 't'
+    str   r1, [r0]
+    mov   r1, #0x2D                              @ '-'
+    str   r1, [r0]
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x52                              @ 'R'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    /* Enable Timer separate clear mode */
+    ldr   r0, =0x1e782038
+    mov   r1, #0xAE
+    str   r1, [r0]
+    clear_delay_timer
+
+    /* Delay about 100us */
+    ldr   r2, =0x00000064                        @ Set Timer3 Reload = 100 us
+    init_delay_timer
+delay_0:
+    check_delay_timer
+    bne   delay_0
+    clear_delay_timer
+    /* end delay 100us */
+/**************************************************************************************************/
+/**************************************************************************************************/
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x33                              @ '3'
+    str   r1, [r0]
+    mov   r1, #0x2D                              @ '-'
+    str   r1, [r0]
+    mov   r1, #0x46                              @ 'F'
+    str   r1, [r0]
+    mov   r1, #0x50                              @ 'P'
+    str   r1, [r0]
+    mov   r1, #0x47                              @ 'G'
+    str   r1, [r0]
+    mov   r1, #0x41                              @ 'A'
+    str   r1, [r0]
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    ldr   r0, =0x1e6e0000
+    ldr   r1, =0xfc600309
+    str   r1, [r0]
+
+    /* Reset MMC */
+    ldr   r1, =0x00000000
+    ldr   r0, =0x1e6e0004
+    ldr   r2, =0x1e6e00A0
+reset_mmc:
+    str   r1, [r0]
+    add   r0, r0, #4
+    cmp   r2, r0
+    bge   reset_mmc
+
+    ldr   r0, =0x1e6e0034                        @ disable SDRAM reset
+    ldr   r1, =0x00000080
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0004
+    ldr   r1, =0x00000107
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0008
+    ldr   r1, =0x2001000F
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0010
+    ldr   r1, =0x12102725
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0014
+    ldr   r1, =0x52344420
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0018
+    ldr   r1, =0x00010000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0038
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e003C
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0040
+    ldr   r1, =0x88888888
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x00000081
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e000C
+    ldr   r1, =0x00000040
+    str   r1, [r0]
+
+    /* Delay about 400us */
+    ldr   r2, =0x00000190                        @ Set Timer3 Reload = 400 us
+    init_delay_timer
+delay_1:
+    check_delay_timer
+    bne   delay_1
+    clear_delay_timer
+    /* end delay 400us */
+
+    ldr   r0, =0x1e6e002C
+    ldr   r1, =0x04001320
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0030
+    ldr   r1, =0x00000041
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000005
+    str   r1, [r0]
+    ldr   r1, =0x00000007
+    str   r1, [r0]
+    ldr   r1, =0x00000003
+    str   r1, [r0]
+    ldr   r1, =0x00000001
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e002C
+    ldr   r1, =0x04001220
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e000C
+    ldr   r1, =0x00005C48
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000001
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e000C
+    ldr   r1, =0x00005C01
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x00008081
+    str   r1, [r0]
+
+/******************************************************************************
+ CBR Start
+ *****************************************************************************/
+/* Debug - UART console message */
+    ldr r0, =0x1e784000
+    mov r1, #0x43                                @ 'C'
+    str r1, [r0]
+    mov r1, #0x42                                @ 'B'
+    str r1, [r0]
+    mov r1, #0x52                                @ 'R'
+    str r1, [r0]
+/* Debug - UART console message */
+
+CBR_START:
+/* Debug - UART console message */
+    ldr r0, =0x1e784000
+    mov r1, #0x23                                @ '#'
+    str r1, [r0]
+/* Debug - UART console message */
+    /* Calibrate PLL Read clock phase */
+    /* Reset PLL */
+    ldr   r0, =0x1e6e2050
+    ldr   r1, =0x00000026
+    str   r1, [r0]
+    mov   r1, #0x00
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    ldr   r1, =0xAD000000
+    add   r0, r0, #0x04
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_reset_done_1:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    beq   check_pll_reset_done_1
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xDA000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_reset_clear_1:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    bne   check_pll_reset_clear_1
+
+    mov   r6, #0x00                              @ init pass count
+    mov   r7, #0x01                              @ init PLL parameter index
+    ldr   r1, =0x000000ff
+    ldr   r0, =0x1e6e0088                        @ init dllmax,dllmin
+    str   r1, [r0]
+
+/****************************
+ PLL delay margin test loop
+ ***************************/
+cbr_next_pll_parameter:
+    ldr   r2, =0xFF                              @ parameter's max is to 0xFF
+    cmp   r7, r2
+    bge   CBR_END
+    add   r7, r7, #0x01
+
+    /* Phase shift */
+    ldr   r0, =0x1e6e2050
+    ldr   r1, =0x00000016
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xAD000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_phase_done_1:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    beq   check_pll_phase_done_1
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xDA000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0074                        @ set the testing DRAM size = 16KB
+    ldr   r1, =0x00003FFF
+    str   r1, [r0]
+
+/* CBRScan() start */
+    mov   r9, #0x01                              @ init test status
+    adrl  r5, PATTERN_TABLE                      @ init pattern table index
+/****************************
+ Test pattern iteration loop
+ ***************************/
+cbr_next_test_pattern:
+    mov   r10, #3                                @ set the retry loop of each pattern
+    ldr   r1, [r5]                               @ load test pattern
+    ldr   r0, =0x1e6e007c
+    str   r1, [r0]
+    cmp   r1, #0x00                              @ the last data in pattern is 0x00
+    bne   cbr_test_single
+
+cbr_test_pattern_end:
+    cmp   r9, #0x00
+    bne   cbr_test_pass_dql
+    cmp   r6, #10
+    bge   CBR_END
+    b     cbr_next_pll_parameter                 @ CBRScan() end and test result fail, go to next step
+
+cbr_test_pass_dql:
+    and   r3, r7, #0xFF
+    sub   r3, r3, #0x01                          @ we add one after loop check so we need to decrease 1
+    add   r6, r6, #0x01                          @ increment pass count
+
+    ldr   r0, =0x1e6e0088
+    record_pll_pass_range
+    b     cbr_next_pll_parameter
+
+/****************************
+ Test fail retry loop
+ ***************************/
+cbr_pattern_fail_retry:
+
+/* CBRTest() start */
+cbr_test_single:
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    ldr   r1, =0x00000005
+    str   r1, [r0]
+    ldr   r3, =0x1000
+    ldr   r8, =0x10000
+cbr_wait_engine_idle_0:
+    subs  r8, r8, #1
+    beq   cbr_test_single_end
+    ldr   r2, [r0]
+    tst   r2, r3                                 @ D[12] = idle bit
+    beq   cbr_wait_engine_idle_0
+
+cbr_test_single_end:
+    ldr   r0, =0x1e6e0070                        @ read fail bit status
+    ldr   r3, =0x2000
+    ldr   r2, [r0]
+    tst   r2, r3
+    bne   cbr_test_fail
+
+cbr_test_burst:
+    ldr   r0, =0x1e6e0070
+    ldr   r2, =0x00000000
+    str   r2, [r0]
+    mov   r2, #0xC1
+    str   r2, [r0]
+    ldr   r3, =0x1000
+    ldr   r8, =0x10000
+cbr_wait_engine_idle_1:
+    subs  r8, r8, #1
+    beq   cbr_test_burst_end
+    ldr   r2, [r0]
+    tst   r2, r3                                 @ D[12] = idle bit
+    beq   cbr_wait_engine_idle_1
+
+cbr_test_burst_end:
+    ldr   r0, =0x1e6e0070                        @ read fail bit status
+    ldr   r3, =0x2000
+    ldr   r2, [r0]
+    tst   r2, r3
+    bne   cbr_test_fail
+    b     cbr_next_test_burst_mode
+/* CBRTest() end */
+
+cbr_test_fail:
+    subs  r10, r10, #1
+    bne   cbr_pattern_fail_retry
+    mov   r9, #0x00
+    b     cbr_test_pattern_end                   @ CBRScan() return(0)
+
+cbr_next_test_burst_mode:
+    add   r5, r5, #0x04                          @ increase the test pattern index
+    b     cbr_next_test_pattern
+
+CBR_END:
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0088                        @ check PLL margin
+    ldr   r1, [r0]
+    mov   r2, r1, lsr #8
+    and   r2, r2, #0xFF                          @ get dllmax
+    and   r1, r1, #0xFF                          @ get dllmin
+    subs  r5, r2, r1                             @ dllmax - dllmin
+    bmi   CBR_START                              @ no valid margin found, retry again
+    cmp   r5, #10                                @ (dllmax - dllmin) < 10
+    blt   CBR_START                              @ no enough margin found, retry again
+    add   r2, r1, r2                             @ (dllmin[1] + dllmax[1] + 1) >> 1
+    add   r2, r2, #0x01
+    mov   r5, r2, lsr #1
+    ldr   r0, =0x1e6e008c
+    str   r5, [r0]                               @ store the dll search result
+
+    /* Reset PLL */
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x00008080
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e2050
+    ldr   r1, =0x00000026
+    str   r1, [r0]
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xAD000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_reset_done_2:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    beq   check_pll_reset_done_2
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xDA000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_reset_clear_2:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    bne   check_pll_reset_clear_2
+
+    /* Phase shift */
+    ldr   r0, =0x1e6e2050
+    ldr   r1, =0x00000016
+    orr   r1, r1, r5, lsl #8
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xAD000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_phase_done_2:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    beq   check_pll_phase_done_2
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xDA000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x00008083
+    str   r1, [r0]
+
+/******************************************************************************
+ CBR Finish
+ *****************************************************************************/
+/******************************************************************************
+ Check DRAM Size
+ 1Gb : 0x80000000 ~ 0x87FFFFFF
+ 2Gb : 0x80000000 ~ 0x8FFFFFFF
+ 4Gb : 0x80000000 ~ 0x9FFFFFFF
+ 8Gb : 0x80000000 ~ 0xBFFFFFFF
+ *****************************************************************************/
+    ldr   r0, =0x1e6e0004
+    ldr   r5, [r0]
+    bic   r5, r5, #0x00000003                    @ record MCR04
+    orr   r1, r5, #0x23
+    str   r1, [r0]                               @ set to 8Gbit
+    ldr   r6, =0x0020100B
+
+check_dram_size:
+    ldr   r0, =0xA0100000
+    ldr   r1, =0x41424344
+    str   r1, [r0]
+    ldr   r0, =0x90100000
+    ldr   r1, =0x35363738
+    str   r1, [r0]
+    ldr   r0, =0x88100000
+    ldr   r1, =0x292A2B2C
+    str   r1, [r0]
+    ldr   r0, =0x80100000
+    ldr   r1, =0x1D1E1F10
+    str   r1, [r0]
+    ldr   r0, =0xA0100000
+    ldr   r1, =0x41424344
+    ldr   r2, [r0]
+    cmp   r2, r1                                 @ == 8Gbit
+    orreq r5, r5, #0x23
+    moveq r6, r6, lsr #16
+    beq   check_dram_size_end
+    ldr   r0, =0x90100000
+    ldr   r1, =0x35363738
+    ldr   r2, [r0]
+    cmp   r2, r1                                 @ == 4Gbit
+    orreq r5, r5, #0x02
+    moveq r6, r6, lsr #16
+    beq   check_dram_size_end
+    ldr   r0, =0x88100000
+    ldr   r1, =0x292A2B2C
+    ldr   r2, [r0]
+    cmp   r2, r1                                 @ == 2Gbit
+    orreq r5, r5, #0x01
+    moveq r6, r6, lsr #8
+    beq   check_dram_size_end
+
+check_dram_size_end:
+    ldr   r0, =0x1e6e0004
+    str   r5, [r0]
+    ldr   r0, =0x1e6e0014
+    ldr   r1, [r0]
+    bic   r1, r1, #0x000000FF
+    and   r6, r6, #0xFF
+    orr   r1, r1, r6
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0120                        @ VGA Compatible Mode
+    ldr   r1, =0x000050C0                        @ 408 MHz
+    str   r1, [r0]
+
+    /* Enable DRAM Cache */
+    ldr   r0, =0x1e6e0004
+    ldr   r1, [r0]
+    mov   r2, #1
+    orr   r2, r1, r2, lsl #12
+    ldr   r3, =0x00080000
+    str   r2, [r0]
+dram_cache_init:
+    ldr   r2, [r0]
+    tst   r2, r3
+    beq   dram_cache_init
+    mov   r2, #1
+    orr   r1, r1, r2, lsl #10
+    str   r1, [r0]
+
+    /* Enable DRAM ECC */
+    orr   r1, r1, r2, lsl #7
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0050
+    ldr   r1, =0x80000000
+    str   r1, [r0]
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0054
+    ldr   r1, =0x05FFFFFF                        @ set ECC size = 96MB
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0074
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    ldr   r0, =0x1e6e007C
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000221
+    ldr   r2, =0x00001000
+    str   r1, [r0]
+dram_ecc_init:
+    ldr   r1, [r0]
+    tst   r1, r2
+    beq   dram_ecc_init
+    ldr   r1, =0x00000400
+    str   r1, [r0]
+
+/******************************************************************************
+ Version Number
+ *****************************************************************************/
+    ldr   r0, =0x1e6e0004
+    ldr   r1, [r0]
+    mov   r2, #0x01
+    orr   r1, r1, r2, lsl #20
+    str   r1, [r0]
+
+/******************************************************************************
+ Calibration Code End
+ ******************************************************************************/
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x6F                              @ 'o'
+    str   r1, [r0]
+    mov   r1, #0x6E                              @ 'n'
+    str   r1, [r0]
+    mov   r1, #0x65                              @ 'e'
+    str   r1, [r0]
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+platform_exit:
+
+    ldr   r0, =0x1e6e2004                        @ enable CPUI DRAM request for ARM9
+    ldr   r1, [r0]
+    bic   r1, r1, #0x00020000
+    str   r1, [r0]
+
+    ldr r0, =0x1e6e2040
+    ldr r1, [r0]
+    orr r1, r1, #0xC0
+    str r1, [r0]
+
+    ldr r0, =0x1e6e2070
+    ldr r1, [r0]
+    orr r1, r1, #0x20
+    str r1, [r0]
+
+    /* restore lr */
+    mov   lr, r4
+
+    /* back to arch calling code */
+    mov   pc, lr
diff --git a/board/aspeed/ast-g5/platform_fpga_ecc.S b/board/aspeed/ast-g5/platform_fpga_ecc.S
new file mode 100644
index 000000000000..50832bcaf521
--- /dev/null
+++ b/board/aspeed/ast-g5/platform_fpga_ecc.S
@@ -0,0 +1,843 @@
+/*
+ * Board specific setup info
+ *
+ * (C) Copyright 2003, ARM Ltd.
+ * Philippe Robin, <philippe.robin@arm.com>
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ *
+ ******************************************************************************
+ * ASPEED Technology Inc.
+ * AST2500 FPGA DDR3 SDRAM controller initialization and calibration sequence
+ *
+ * Gary Hsu, <gary_hsu@aspeedtech.com>
+ *
+ * Release date:
+ *
+ * Optional define variable
+ ******************************************************************************
+ */
+
+#include <config.h>
+#include <version.h>
+
+/******************************************************************************
+ Calibration Macro Start
+ Usable registers:
+  r0, r1, r2, r3, r5, r6, r7, r8, r9, r10, r11
+ ******************************************************************************/
+/* PATTERN_TABLE,
+   init_delay_timer,
+   check_delay_timer,
+   clear_delay_timer,
+   record_pll_pass_range,
+   record_pll_pass_range_h,
+   are for DRAM calibration */
+
+PATTERN_TABLE:
+    .word   0xff00ff00
+    .word   0xcc33cc33
+    .word   0xaa55aa55
+    .word   0x88778877
+    .word   0x92cc4d6e       @ 5
+    .word   0x543d3cde
+    .word   0xf1e843c7
+    .word   0x7c61d253
+    .word   0x00000000       @ 8
+
+    .macro init_delay_timer
+    ldr r0, =0x1e782024                          @ Set Timer3 Reload
+    str r2, [r0]
+
+    ldr r0, =0x1e6c0038                          @ Clear Timer3 ISR
+    ldr r1, =0x00040000
+    str r1, [r0]
+
+    ldr r0, =0x1e782030                          @ Enable Timer3
+    mov r2, #7
+    mov r1, r2, lsl #8
+    str r1, [r0]
+
+    ldr r0, =0x1e6c0090                          @ Check ISR for Timer3 timeout
+    .endm
+
+    .macro check_delay_timer
+    ldr r1, [r0]
+    bic r1, r1, #0xFFFBFFFF
+    mov r2, r1, lsr #18
+    cmp r2, #0x01
+    .endm
+
+    .macro clear_delay_timer
+    ldr r0, =0x1e78203C                          @ Disable Timer3
+    mov r2, #0xF
+    mov r1, r2, lsl #8
+    str r1, [r0]
+
+    ldr r0, =0x1e6c0038                          @ Clear Timer3 ISR
+    ldr r1, =0x00040000
+    str r1, [r0]
+    .endm
+
+    .macro record_pll_pass_range
+    ldr                 r1, [r0]
+    bic                 r2, r1, #0xFFFFFF00
+    cmp                 r2, r3                   @ record min
+    bicgt               r1, r1, #0x000000FF
+    orrgt               r1, r1, r3
+    bic                 r2, r1, #0xFFFF00FF
+    cmp                 r3, r2, lsr #8           @ record max
+    bicgt               r1, r1, #0x0000FF00
+    orrgt               r1, r1, r3, lsl #8
+    str                 r1, [r0]
+    .endm
+
+    .macro record_pll_pass_range_h
+    ldr                 r1, [r0]
+    bic                 r2, r1, #0xFF00FFFF
+    mov                 r2, r2, lsr #16
+    cmp                 r2, r3                   @ record min
+    bicgt               r1, r1, #0x00FF0000
+    orrgt               r1, r1, r3, lsl #16
+    bic                 r2, r1, #0x00FFFFFF
+    cmp                 r3, r2, lsr #24          @ record max
+    bicgt               r1, r1, #0xFF000000
+    orrgt               r1, r1, r3, lsl #24
+    str                 r1, [r0]
+    .endm
+
+/******************************************************************************
+ Calibration Macro End
+ ******************************************************************************/
+
+.globl lowlevel_init
+lowlevel_init:
+
+    /* save lr */
+    mov   r4, lr
+
+    /*Set Scratch register Bit 7 before initialize*/
+    ldr r0, =0x1e6e2000
+    ldr r1, =0x1688a8a8
+    str r1, [r0]
+
+    ldr r0, =0x1e6e2040
+    ldr r1, [r0]
+    orr r1, r1, #0x80
+    str r1, [r0]
+
+/******************************************************************************
+ Disable WDT3 for SPI Address mode detection function
+ ******************************************************************************/
+    ldr   r0, =0x1e78504c
+    mov   r1, #0
+    str   r1, [r0]
+/******************************************************************************
+ Disable WDT2 for 2nd boot function
+ ******************************************************************************/
+    ldr   r0, =0x1e78502c
+    mov   r1, #0
+    str   r1, [r0]
+
+#if (CONFIG_AST_FPGA_VER == 4)
+init_arm11:
+    /* Start of ES40004A PLL init */
+    /* Step 1. Program PLL_config and keep power down */
+    ldr   r0, =0x33000000
+    ldr   r1, =0x01000000
+    str   r1, [r0]
+    ldr   r1, =0x0102001A                        @ 324 MHz
+    str   r1, [r0]
+
+    /* Step 2. Wait 1us for PLL initialization */
+    ldr   r2, =0x00000100
+delay_ES40004A_pll_init:
+    subs  r2, r2, #1
+    bne   delay_ES40004A_pll_init
+
+    /* Step 3. Program PLL_config to exit Power down */
+    ldr   r1, =0x0002001A
+    str   r1, [r0]
+
+    /* Step 4. Check pll_ld = 1?. Read PLL_config, check bit 27. */
+    ldr   r2, =0x08000000                        @ bit[27] PLL lock detection
+check_pll_ld:
+    ldr   r1, [r0]
+    tst   r1, r2
+    beq   check_pll_ld
+
+    /* Step 5. Program aclk_div */
+    ldr   r0, =0x33000004
+    ldr   r1, =0x00000007                        @ CPU/AXI = 8/1
+    str   r1, [r0]
+
+    /* Step 6. Program set_pll */
+    ldr   r1, =0x00010007
+    str   r1, [r0]
+    /* End of ES40004A PLL init */
+#endif
+
+    /* Check Scratch Register Bit 6 */
+    ldr r0, =0x1e6e2040
+    ldr r1, [r0]
+    bic r1, r1, #0xFFFFFFBF
+    mov r2, r1, lsr #6
+    cmp r2, #0x01
+    beq platform_exit
+
+/* Debug - UART console message */
+    ldr   r0, =0x1e78400c
+    mov   r1, #0x83
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e202c
+    ldr   r2, [r0]
+    mov   r2, r2, lsr #12
+    tst   r2, #0x01
+    ldr   r0, =0x1e784000
+    moveq r1, #0x0D                              @ Baudrate 115200
+    movne r1, #0x01                              @ Baudrate 115200, div13
+#if defined(CONFIG_DRAM_UART_38400)
+    moveq r1, #0x27                              @ Baudrate 38400
+    movne r1, #0x03                              @ Baudrate 38400 , div13
+#endif
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784004
+    mov   r1, #0x00
+    str   r1, [r0]
+
+    ldr   r0, =0x1e78400c
+    mov   r1, #0x03
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784008
+    mov   r1, #0x07
+    str   r1, [r0]
+
+    ldr   r0, =0x1e784000
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x52                              @ 'R'
+    str   r1, [r0]
+    mov   r1, #0x41                              @ 'A'
+    str   r1, [r0]
+    mov   r1, #0x4D                              @ 'M'
+    str   r1, [r0]
+    mov   r1, #0x20                              @ ' '
+    str   r1, [r0]
+    mov   r1, #0x49                              @ 'I'
+    str   r1, [r0]
+    mov   r1, #0x6E                              @ 'n'
+    str   r1, [r0]
+    mov   r1, #0x69                              @ 'i'
+    str   r1, [r0]
+    mov   r1, #0x74                              @ 't'
+    str   r1, [r0]
+    mov   r1, #0x2D                              @ '-'
+    str   r1, [r0]
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x52                              @ 'R'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    /* Enable Timer separate clear mode */
+    ldr   r0, =0x1e782038
+    mov   r1, #0xAE
+    str   r1, [r0]
+    clear_delay_timer
+
+    /* Delay about 100us */
+    ldr   r2, =0x00000064                        @ Set Timer3 Reload = 100 us
+    init_delay_timer
+delay_0:
+    check_delay_timer
+    bne   delay_0
+    clear_delay_timer
+    /* end delay 100us */
+/**************************************************************************************************/
+/**************************************************************************************************/
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x33                              @ '3'
+    str   r1, [r0]
+    mov   r1, #0x2D                              @ '-'
+    str   r1, [r0]
+    mov   r1, #0x46                              @ 'F'
+    str   r1, [r0]
+    mov   r1, #0x50                              @ 'P'
+    str   r1, [r0]
+    mov   r1, #0x47                              @ 'G'
+    str   r1, [r0]
+    mov   r1, #0x41                              @ 'A'
+    str   r1, [r0]
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+    ldr   r0, =0x1e6e0000
+    ldr   r1, =0xfc600309
+    str   r1, [r0]
+
+    /* Reset MMC */
+    ldr   r1, =0x00000000
+    ldr   r0, =0x1e6e0004
+    ldr   r2, =0x1e6e00A0
+reset_mmc:
+    str   r1, [r0]
+    add   r0, r0, #4
+    cmp   r2, r0
+    bge   reset_mmc
+
+    ldr   r0, =0x1e6e0034                        @ disable SDRAM reset
+    ldr   r1, =0x00000080
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0004
+    ldr   r1, =0x00000107
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0008
+    ldr   r1, =0x2001000F
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0010
+    ldr   r1, =0x12102725
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0014
+    ldr   r1, =0x52344420
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0018
+    ldr   r1, =0x00010000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0038
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e003C
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0040
+    ldr   r1, =0x88888888
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x00000081
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e000C
+    ldr   r1, =0x00000040
+    str   r1, [r0]
+
+    /* Delay about 400us */
+    ldr   r2, =0x00000190                        @ Set Timer3 Reload = 400 us
+    init_delay_timer
+delay_1:
+    check_delay_timer
+    bne   delay_1
+    clear_delay_timer
+    /* end delay 400us */
+
+    ldr   r0, =0x1e6e002C
+    ldr   r1, =0x04001320
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0030
+    ldr   r1, =0x00000041
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000005
+    str   r1, [r0]
+    ldr   r1, =0x00000007
+    str   r1, [r0]
+    ldr   r1, =0x00000003
+    str   r1, [r0]
+    ldr   r1, =0x00000001
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e002C
+    ldr   r1, =0x04001220
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e000C
+    ldr   r1, =0x00005C48
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0028
+    ldr   r1, =0x00000001
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e000C
+    ldr   r1, =0x00005C01
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x00008081
+    str   r1, [r0]
+
+/******************************************************************************
+ CBR Start
+ *****************************************************************************/
+/* Debug - UART console message */
+    ldr r0, =0x1e784000
+    mov r1, #0x43                                @ 'C'
+    str r1, [r0]
+    mov r1, #0x42                                @ 'B'
+    str r1, [r0]
+    mov r1, #0x52                                @ 'R'
+    str r1, [r0]
+/* Debug - UART console message */
+
+CBR_START:
+/* Debug - UART console message */
+    ldr r0, =0x1e784000
+    mov r1, #0x23                                @ '#'
+    str r1, [r0]
+/* Debug - UART console message */
+    /* Calibrate PLL Read clock phase */
+    /* Reset PLL */
+    ldr   r0, =0x1e6e2050
+    ldr   r1, =0x00000026
+    str   r1, [r0]
+    mov   r1, #0x00
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    add   r0, r0, #0x04
+    str   r1, [r0]
+    ldr   r1, =0xAD000000
+    add   r0, r0, #0x04
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_reset_done_1:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    beq   check_pll_reset_done_1
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xDA000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_reset_clear_1:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    bne   check_pll_reset_clear_1
+
+    mov   r6, #0x00                              @ init pass count
+    mov   r7, #0x01                              @ init PLL parameter index
+    ldr   r1, =0x000000ff
+    ldr   r0, =0x1e6e0088                        @ init dllmax,dllmin
+    str   r1, [r0]
+
+/****************************
+ PLL delay margin test loop
+ ***************************/
+cbr_next_pll_parameter:
+    ldr   r2, =0xFF                              @ parameter's max is to 0xFF
+    cmp   r7, r2
+    bge   CBR_END
+    add   r7, r7, #0x01
+
+    /* Phase shift */
+    ldr   r0, =0x1e6e2050
+    ldr   r1, =0x00000016
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xAD000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_phase_done_1:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    beq   check_pll_phase_done_1
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xDA000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0074                        @ set the testing DRAM size = 16KB
+    ldr   r1, =0x00003FFF
+    str   r1, [r0]
+
+/* CBRScan() start */
+    mov   r9, #0x01                              @ init test status
+    adrl  r5, PATTERN_TABLE                      @ init pattern table index
+/****************************
+ Test pattern iteration loop
+ ***************************/
+cbr_next_test_pattern:
+    mov   r10, #3                                @ set the retry loop of each pattern
+    ldr   r1, [r5]                               @ load test pattern
+    ldr   r0, =0x1e6e007c
+    str   r1, [r0]
+    cmp   r1, #0x00                              @ the last data in pattern is 0x00
+    bne   cbr_test_single
+
+cbr_test_pattern_end:
+    cmp   r9, #0x00
+    bne   cbr_test_pass_dql
+    cmp   r6, #10
+    bge   CBR_END
+    b     cbr_next_pll_parameter                 @ CBRScan() end and test result fail, go to next step
+
+cbr_test_pass_dql:
+    and   r3, r7, #0xFF
+    sub   r3, r3, #0x01                          @ we add one after loop check so we need to decrease 1
+    add   r6, r6, #0x01                          @ increment pass count
+
+    ldr   r0, =0x1e6e0088
+    record_pll_pass_range
+    b     cbr_next_pll_parameter
+
+/****************************
+ Test fail retry loop
+ ***************************/
+cbr_pattern_fail_retry:
+
+/* CBRTest() start */
+cbr_test_single:
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    ldr   r1, =0x00000005
+    str   r1, [r0]
+    ldr   r3, =0x1000
+    ldr   r8, =0x10000
+cbr_wait_engine_idle_0:
+    subs  r8, r8, #1
+    beq   cbr_test_single_end
+    ldr   r2, [r0]
+    tst   r2, r3                                 @ D[12] = idle bit
+    beq   cbr_wait_engine_idle_0
+
+cbr_test_single_end:
+    ldr   r0, =0x1e6e0070                        @ read fail bit status
+    ldr   r3, =0x2000
+    ldr   r2, [r0]
+    tst   r2, r3
+    bne   cbr_test_fail
+
+cbr_test_burst:
+    ldr   r0, =0x1e6e0070
+    ldr   r2, =0x00000000
+    str   r2, [r0]
+    mov   r2, #0xC1
+    str   r2, [r0]
+    ldr   r3, =0x1000
+    ldr   r8, =0x10000
+cbr_wait_engine_idle_1:
+    subs  r8, r8, #1
+    beq   cbr_test_burst_end
+    ldr   r2, [r0]
+    tst   r2, r3                                 @ D[12] = idle bit
+    beq   cbr_wait_engine_idle_1
+
+cbr_test_burst_end:
+    ldr   r0, =0x1e6e0070                        @ read fail bit status
+    ldr   r3, =0x2000
+    ldr   r2, [r0]
+    tst   r2, r3
+    bne   cbr_test_fail
+    b     cbr_next_test_burst_mode
+/* CBRTest() end */
+
+cbr_test_fail:
+    subs  r10, r10, #1
+    bne   cbr_pattern_fail_retry
+    mov   r9, #0x00
+    b     cbr_test_pattern_end                   @ CBRScan() return(0)
+
+cbr_next_test_burst_mode:
+    add   r5, r5, #0x04                          @ increase the test pattern index
+    b     cbr_next_test_pattern
+
+CBR_END:
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0088                        @ check PLL margin
+    ldr   r1, [r0]
+    mov   r2, r1, lsr #8
+    and   r2, r2, #0xFF                          @ get dllmax
+    and   r1, r1, #0xFF                          @ get dllmin
+    subs  r5, r2, r1                             @ dllmax - dllmin
+    bmi   CBR_START                              @ no valid margin found, retry again
+    cmp   r5, #10                                @ (dllmax - dllmin) < 10
+    blt   CBR_START                              @ no enough margin found, retry again
+    add   r2, r1, r2                             @ (dllmin[1] + dllmax[1] + 1) >> 1
+    add   r2, r2, #0x01
+    mov   r5, r2, lsr #1
+    ldr   r0, =0x1e6e008c
+    str   r5, [r0]                               @ store the dll search result
+
+    /* Reset PLL */
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x00008080
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e2050
+    ldr   r1, =0x00000026
+    str   r1, [r0]
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xAD000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_reset_done_2:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    beq   check_pll_reset_done_2
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xDA000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_reset_clear_2:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    bne   check_pll_reset_clear_2
+
+    /* Phase shift */
+    ldr   r0, =0x1e6e2050
+    ldr   r1, =0x00000016
+    orr   r1, r1, r5, lsl #8
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xAD000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e204C
+check_pll_phase_done_2:
+    ldr   r1, [r0]
+    mov   r1, r1, lsr #24
+    and   r1, r1, #0x0F
+    cmp   r1, #0x00
+    beq   check_pll_phase_done_2
+
+    ldr   r0, =0x1e6e206C
+    ldr   r1, =0xDA000000
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0034
+    ldr   r1, =0x00008083
+    str   r1, [r0]
+
+/******************************************************************************
+ CBR Finish
+ *****************************************************************************/
+/******************************************************************************
+ Check DRAM Size
+ 1Gb : 0x80000000 ~ 0x87FFFFFF
+ 2Gb : 0x80000000 ~ 0x8FFFFFFF
+ 4Gb : 0x80000000 ~ 0x9FFFFFFF
+ 8Gb : 0x80000000 ~ 0xBFFFFFFF
+ *****************************************************************************/
+    ldr   r0, =0x1e6e0004
+    ldr   r5, [r0]
+    bic   r5, r5, #0x00000003                    @ record MCR04
+    orr   r1, r5, #0x23
+    str   r1, [r0]                               @ set to 8Gbit
+    ldr   r6, =0x0020100B
+
+check_dram_size:
+    ldr   r0, =0xA0100000
+    ldr   r1, =0x41424344
+    str   r1, [r0]
+    ldr   r0, =0x90100000
+    ldr   r1, =0x35363738
+    str   r1, [r0]
+    ldr   r0, =0x88100000
+    ldr   r1, =0x292A2B2C
+    str   r1, [r0]
+    ldr   r0, =0x80100000
+    ldr   r1, =0x1D1E1F10
+    str   r1, [r0]
+    ldr   r0, =0xA0100000
+    ldr   r1, =0x41424344
+    ldr   r2, [r0]
+    cmp   r2, r1                                 @ == 8Gbit
+    orreq r5, r5, #0x23
+    moveq r6, r6, lsr #16
+    beq   check_dram_size_end
+    ldr   r0, =0x90100000
+    ldr   r1, =0x35363738
+    ldr   r2, [r0]
+    cmp   r2, r1                                 @ == 4Gbit
+    orreq r5, r5, #0x02
+    moveq r6, r6, lsr #16
+    beq   check_dram_size_end
+    ldr   r0, =0x88100000
+    ldr   r1, =0x292A2B2C
+    ldr   r2, [r0]
+    cmp   r2, r1                                 @ == 2Gbit
+    orreq r5, r5, #0x01
+    moveq r6, r6, lsr #8
+    beq   check_dram_size_end
+
+check_dram_size_end:
+    ldr   r0, =0x1e6e0004
+    str   r5, [r0]
+    ldr   r0, =0x1e6e0014
+    ldr   r1, [r0]
+    bic   r1, r1, #0x000000FF
+    and   r6, r6, #0xFF
+    orr   r1, r1, r6
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0120                        @ VGA Compatible Mode
+    ldr   r1, =0x000050C0                        @ 408 MHz
+    str   r1, [r0]
+
+    /* Enable DRAM Cache */
+    ldr   r0, =0x1e6e0004
+    ldr   r1, [r0]
+    mov   r2, #1
+    orr   r2, r1, r2, lsl #12
+    ldr   r3, =0x00080000
+    str   r2, [r0]
+dram_cache_init:
+    ldr   r2, [r0]
+    tst   r2, r3
+    beq   dram_cache_init
+    mov   r2, #1
+    orr   r1, r1, r2, lsl #10
+    str   r1, [r0]
+
+    /* Enable DRAM ECC */
+    orr   r1, r1, r2, lsl #7
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0050
+    ldr   r1, =0x80000000
+    str   r1, [r0]
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0054
+    ldr   r1, =0x05FFFFFF                        @ set ECC size = 96MB
+    str   r1, [r0]
+
+    ldr   r0, =0x1e6e0074
+    ldr   r1, =0x00000000
+    str   r1, [r0]
+    ldr   r0, =0x1e6e007C
+    str   r1, [r0]
+    ldr   r0, =0x1e6e0070
+    ldr   r1, =0x00000221
+    ldr   r2, =0x00001000
+    str   r1, [r0]
+dram_ecc_init:
+    ldr   r1, [r0]
+    tst   r1, r2
+    beq   dram_ecc_init
+    ldr   r1, =0x00000400
+    str   r1, [r0]
+
+/******************************************************************************
+ Version Number
+ *****************************************************************************/
+    ldr   r0, =0x1e6e0004
+    ldr   r1, [r0]
+    mov   r2, #0x01
+    orr   r1, r1, r2, lsl #20
+    str   r1, [r0]
+
+/******************************************************************************
+ Calibration Code End
+ ******************************************************************************/
+/* Debug - UART console message */
+    ldr   r0, =0x1e784000
+    mov   r1, #0x44                              @ 'D'
+    str   r1, [r0]
+    mov   r1, #0x6F                              @ 'o'
+    str   r1, [r0]
+    mov   r1, #0x6E                              @ 'n'
+    str   r1, [r0]
+    mov   r1, #0x65                              @ 'e'
+    str   r1, [r0]
+    mov   r1, #0x0D                              @ '\r'
+    str   r1, [r0]
+    mov   r1, #0x0A                              @ '\n'
+    str   r1, [r0]
+/* Debug - UART console message */
+
+platform_exit:
+
+    ldr   r0, =0x1e6e2004                        @ enable CPUI DRAM request for ARM9
+    ldr   r1, [r0]
+    bic   r1, r1, #0x00020000
+    str   r1, [r0]
+
+    ldr r0, =0x1e6e2040
+    ldr r1, [r0]
+    orr r1, r1, #0xC0
+    str r1, [r0]
+
+    ldr r0, =0x1e6e2070
+    ldr r1, [r0]
+    orr r1, r1, #0x20
+    str r1, [r0]
+
+    /* restore lr */
+    mov   lr, r4
+
+    /* back to arch calling code */
+    mov   pc, lr
diff --git a/common/exports.c b/common/exports.c
index b4f1f7af1529..568be21fc94c 100644
--- a/common/exports.c
+++ b/common/exports.c
@@ -21,6 +21,12 @@ unsigned long get_version(void)
 # define phy_find_by_mask		dummy
 # define mdio_phydev_for_ethname	dummy
 # define miiphy_set_current_dev		dummy
+#ifdef CONFIG_FMC_SPI
+# define spi_dma          dummy
+#endif
+#endif
+#ifndef CONFIG_AST_SPI_NOR
+# define memmove_dma          dummy
 #endif
 
 void jumptable_init(void)
diff --git a/common/image.c b/common/image.c
index 26d6c9a59279..066dbaa237e1 100644
--- a/common/image.c
+++ b/common/image.c
@@ -1065,6 +1065,17 @@ int boot_get_ramdisk(int argc, char * const argv[], bootm_headers_t *images,
 				return 1;
 			}
 		}
+/// TODO ... Check Why ..................
+#if  defined(CONFIG_ARCH_ASPEED)
+		/*
+		 * We need to copy the ramdisk to SRAM to let Linux boot
+		 */
+		if (rd_data) {
+			memmove ((void *)rd_load, (uchar *)rd_data, rd_len);
+			rd_data = rd_load;
+		}
+#endif /* CONFIG_ASPEED */
+
 	} else if (images->legacy_hdr_valid &&
 			image_check_type(&images->legacy_hdr_os_copy,
 						IH_TYPE_MULTI)) {
diff --git a/configs/ast_g5_defconfig b/configs/ast_g5_defconfig
new file mode 100644
index 000000000000..b5f2b24dae89
--- /dev/null
+++ b/configs/ast_g5_defconfig
@@ -0,0 +1,9 @@
+CONFIG_ARM=y
+CONFIG_TARGET_AST_G5=y
+CONFIG_SPI_FLASH=y
+CONFIG_SYS_NS16550=y
+CONFIG_SYS_PROMPT="ast# "
+CONFIG_CMD_SAVEENV=y
+CONFIG_CMD_FLASH=y
+CONFIG_CMD_PING=y
+CONFIG_CMD_DHCP=y
\ No newline at end of file
diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index 5ccc4beda817..05bbd929ddef 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -7,7 +7,19 @@
  * (C) Copyright 2010 Andes Technology
  * Macpaul Lin <macpaul@andestech.com>
  *
- * SPDX-License-Identifier:	GPL-2.0+
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
 #include <config.h>
@@ -15,13 +27,21 @@
 #include <malloc.h>
 #include <net.h>
 #include <asm/io.h>
-#include <asm/dma-mapping.h>
 #include <linux/mii.h>
 
+#include <i2c.h>
+
+#include <asm/arch/ast_scu.h>
+#include <asm/arch/aspeed.h>
+
+#if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
+#include <miiphy.h>
+#endif
+
+
 #include "ftgmac100.h"
 
 #define ETH_ZLEN	60
-#define CFG_XBUF_SIZE	1536
 
 /* RBSR - hw default init value is also 0x640 */
 #define RBSR_DEFAULT_VALUE	0x640
@@ -30,10 +50,8 @@
 #define PKTBUFSTX	4	/* must be power of 2 */
 
 struct ftgmac100_data {
-	ulong txdes_dma;
-	struct ftgmac100_txdes *txdes;
-	ulong rxdes_dma;
-	struct ftgmac100_rxdes *rxdes;
+	struct ftgmac100_txdes txdes[PKTBUFSTX];
+	struct ftgmac100_rxdes rxdes[PKTBUFSRX];
 	int tx_index;
 	int rx_index;
 	int phy_addr;
@@ -46,73 +64,171 @@ static int ftgmac100_mdiobus_read(struct eth_device *dev, int phy_addr,
 	int regnum)
 {
 	struct ftgmac100 *ftgmac100 = (struct ftgmac100 *)dev->iobase;
+	int fear0;
 	int phycr;
 	int i;
 
-	phycr = readl(&ftgmac100->phycr);
+#ifdef AST_MAC_OWN
+	if (__raw_readl(&ftgmac100->physts) & FTGMAC100_PHY_STS_UNVALID) {
+		printf("owner \n");
+	} else {
+		printf("not owner \n");
+		__raw_writel(__raw_readl(&ftgmac100->physts) | FTGMAC100_PHY_REQ_EN, &ftgmac100->physts);
+		while(!(__raw_readl(&ftgmac100->isr) & FTGMAC100_INT_FLAG_ACK)) {
+			mdelay(10);
+			i++;
+			if(i > 1000) {
+				printf("time out \n");
+				break;
+			}
+		}
+		__raw_writel(__raw_readl(&ftgmac100->physts) | FTGMAC100_PHY_POLL, &ftgmac100->physts);
+		__raw_writel(__raw_readl(&ftgmac100->physts) & ~FTGMAC100_PHY_REQ_EN, &ftgmac100->physts);
+		__raw_writel(FTGMAC100_INT_FLAG_ACK, &ftgmac100->isr);
+
+	}
+#endif
 
-	/* preserve MDC cycle threshold */
-	phycr &= FTGMAC100_PHYCR_MDC_CYCTHR_MASK;
+	fear0 = __raw_readl(&ftgmac100->fear0);
+	if(fear0 & (1 << 31)) {	//New MDC/MDIO
+		phycr = FTGMAC100_PHYCR_NEW_FIRE | FTGMAC100_PHYCR_ST_22 | FTGMAC100_PHYCR_NEW_READ |
+				FTGMAC100_PHYCR_NEW_PHYAD(phy_addr) | // 20141114
+				FTGMAC100_PHYCR_NEW_REGAD(regnum); // 20141114
 
-	phycr |= FTGMAC100_PHYCR_PHYAD(phy_addr)
-	      |  FTGMAC100_PHYCR_REGAD(regnum)
-	      |  FTGMAC100_PHYCR_MIIRD;
+		__raw_writel(phycr, &ftgmac100->phycr);
 
-	writel(phycr, &ftgmac100->phycr);
+		for (i = 0; i < 10; i++) {
+			phycr = __raw_readl(&ftgmac100->phycr);
 
-	for (i = 0; i < 10; i++) {
-		phycr = readl(&ftgmac100->phycr);
+			if ((phycr & FTGMAC100_PHYCR_NEW_FIRE) == 0) {
+				int data;
 
-		if ((phycr & FTGMAC100_PHYCR_MIIRD) == 0) {
-			int data;
+				data = __raw_readl(&ftgmac100->phydata);
+				return FTGMAC100_PHYDATA_NEW_MIIWDATA(data);
+			}
 
-			data = readl(&ftgmac100->phydata);
-			return FTGMAC100_PHYDATA_MIIRDATA(data);
+			mdelay(10);
 		}
 
-		mdelay(10);
-	}
+		debug("mdio read timed out\n");
+		return -1;
 
-	debug("mdio read timed out\n");
-	return -1;
+	} else {
+		phycr = __raw_readl(&ftgmac100->phycr);
+
+		/* preserve MDC cycle threshold */
+	//	phycr &= FTGMAC100_PHYCR_MDC_CYCTHR_MASK;
+
+		phycr = FTGMAC100_PHYCR_PHYAD(phy_addr)
+		      |  FTGMAC100_PHYCR_REGAD(regnum)
+		      |  FTGMAC100_PHYCR_MIIRD | 0x34;
+
+		__raw_writel(phycr, &ftgmac100->phycr);
+
+		for (i = 0; i < 10; i++) {
+			phycr = __raw_readl(&ftgmac100->phycr);
+
+			if ((phycr & FTGMAC100_PHYCR_MIIRD) == 0) {
+				int data;
+
+				data = __raw_readl(&ftgmac100->phydata);
+				return FTGMAC100_PHYDATA_MIIRDATA(data);
+			}
+
+			mdelay(10);
+		}
+
+		debug("mdio read timed out\n");
+		return -1;
+	}
 }
 
 static int ftgmac100_mdiobus_write(struct eth_device *dev, int phy_addr,
 	int regnum, u16 value)
 {
 	struct ftgmac100 *ftgmac100 = (struct ftgmac100 *)dev->iobase;
+	int fear0;
 	int phycr;
 	int data;
 	int i;
 
-	phycr = readl(&ftgmac100->phycr);
+#ifdef AST_MAC_OWN
+	if (__raw_readl(&ftgmac100->physts) & FTGMAC100_PHY_STS_UNVALID) {
+		printf("owner \n");
+	} else {
+		printf("not owner \n");
+		__raw_writel(__raw_readl(&ftgmac100->physts) | FTGMAC100_PHY_REQ_EN, &ftgmac100->physts);
+		while(!(__raw_readl(&ftgmac100->isr) & FTGMAC100_INT_FLAG_ACK)) {
+			mdelay(10);
+			i++;
+			if(i > 1000) {
+				printf("time out \n");
+				break;
+			}
+		}
+		__raw_writel(__raw_readl(&ftgmac100->physts) | FTGMAC100_PHY_POLL, &ftgmac100->physts);
+		__raw_writel(__raw_readl(&ftgmac100->physts) & ~FTGMAC100_PHY_REQ_EN, &ftgmac100->physts);
+		__raw_writel(FTGMAC100_INT_FLAG_ACK, &ftgmac100->isr);
 
-	/* preserve MDC cycle threshold */
-	phycr &= FTGMAC100_PHYCR_MDC_CYCTHR_MASK;
+	}
+#endif
 
-	phycr |= FTGMAC100_PHYCR_PHYAD(phy_addr)
-	      |  FTGMAC100_PHYCR_REGAD(regnum)
-	      |  FTGMAC100_PHYCR_MIIWR;
+	fear0 = __raw_readl(&ftgmac100->fear0);
+	if(fear0 & (1 << 31)) {	//New MDC/MDIO
+		phycr = (value << 16) |
+				FTGMAC100_PHYCR_NEW_FIRE | FTGMAC100_PHYCR_ST_22 |
+				FTGMAC100_PHYCR_NEW_WRITE |
+				FTGMAC100_PHYCR_NEW_PHYAD(phy_addr) | // 20141114
+				FTGMAC100_PHYCR_NEW_REGAD(regnum); // 20141114
 
-	data = FTGMAC100_PHYDATA_MIIWDATA(value);
+		__raw_writel(phycr, &ftgmac100->phycr);
 
-	writel(data, &ftgmac100->phydata);
-	writel(phycr, &ftgmac100->phycr);
+		for (i = 0; i < 10; i++) {
+			phycr = __raw_readl(&ftgmac100->phycr);
 
-	for (i = 0; i < 10; i++) {
-		phycr = readl(&ftgmac100->phycr);
+			if ((phycr & FTGMAC100_PHYCR_NEW_FIRE) == 0) {
+				debug("(phycr & FTGMAC100_PHYCR_MIIWR) == 0: " \
+					"phy_addr: %x\n", phy_addr);
+				return 0;
+			}
 
-		if ((phycr & FTGMAC100_PHYCR_MIIWR) == 0) {
-			debug("(phycr & FTGMAC100_PHYCR_MIIWR) == 0: " \
-				"phy_addr: %x\n", phy_addr);
-			return 0;
+			mdelay(10);
 		}
 
-		mdelay(1);
-	}
+		debug("mdio write timed out\n");
+		return -1;
+
+	} else {
+
+		phycr = __raw_readl(&ftgmac100->phycr);
+
+		/* preserve MDC cycle threshold */
+	//	phycr &= FTGMAC100_PHYCR_MDC_CYCTHR_MASK;
+
+		phycr = FTGMAC100_PHYCR_PHYAD(phy_addr)
+		      |  FTGMAC100_PHYCR_REGAD(regnum)
+		      |  FTGMAC100_PHYCR_MIIWR | 0x34;
+
+		data = FTGMAC100_PHYDATA_MIIWDATA(value);
+
+		__raw_writel(data, &ftgmac100->phydata);
+		__raw_writel(phycr, &ftgmac100->phycr);
+
+		for (i = 0; i < 10; i++) {
+			phycr = __raw_readl(&ftgmac100->phycr);
+
+			if ((phycr & FTGMAC100_PHYCR_MIIWR) == 0) {
+				debug("(phycr & FTGMAC100_PHYCR_MIIWR) == 0: " \
+					"phy_addr: %x\n", phy_addr);
+				return 0;
+			}
+
+			mdelay(1);
+		}
 
-	debug("mdio write timed out\n");
-	return -1;
+		debug("mdio write timed out\n");
+		return -1;
+	}
 }
 
 int ftgmac100_phy_read(struct eth_device *dev, int addr, int reg, u16 *value)
@@ -133,6 +249,30 @@ int  ftgmac100_phy_write(struct eth_device *dev, int addr, int reg, u16 value)
 	return 0;
 }
 
+#if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
+static int ftgmac100_reg_read(const char *devname, u8 phy_addr, u8 phy_reg,
+			u16 *value)
+{
+	struct eth_device *dev = eth_get_dev_by_name(devname);
+	*value = ftgmac100_mdiobus_read(dev , phy_addr, phy_reg);
+
+	if (*value == -1)
+		return -1;
+
+	return 0;
+
+}
+
+static int ftgmac100_reg_write(const char *devname, u8 phy_addr, u8 phy_reg, u16 value)
+{
+	struct eth_device *dev = eth_get_dev_by_name(devname);
+	if (ftgmac100_mdiobus_write(dev, phy_addr, phy_reg, value) == -1)
+		return -1;
+
+	return 0;
+}
+#endif
+
 static int ftgmac100_phy_reset(struct eth_device *dev)
 {
 	struct ftgmac100_data *priv = dev->priv;
@@ -172,35 +312,41 @@ static int ftgmac100_phy_init(struct eth_device *dev)
 	struct ftgmac100_data *priv = dev->priv;
 
 	int phy_addr;
-	u16 phy_id, status, adv, lpa, stat_ge;
+//	u32 phy_id;
+	u16 phy_id1, status, adv, lpa, stat_ge;
+	u16 phy_id2;
 	int media, speed, duplex;
 	int i;
 
 	/* Check if the PHY is up to snuff... */
 	for (phy_addr = 0; phy_addr < CONFIG_PHY_MAX_ADDR; phy_addr++) {
 
-		ftgmac100_phy_read(dev, phy_addr, MII_PHYSID1, &phy_id);
+		ftgmac100_phy_read(dev, phy_addr, MII_PHYSID1, &phy_id1);
+		ftgmac100_phy_read(dev, phy_addr, MII_PHYSID2, &phy_id2);
 
 		/*
 		 * When it is unable to found PHY,
 		 * the interface usually return 0xffff or 0x0000
 		 */
-		if (phy_id != 0xffff && phy_id != 0x0) {
-			printf("%s: found PHY at 0x%02x\n",
-				dev->name, phy_addr);
+		if (phy_id1 != 0xffff && phy_id1 != 0x0) {
+//			printf("%s: found PHY at 0x%02x\n",
+//				dev->name, phy_addr);
 			priv->phy_addr = phy_addr;
 			break;
 		}
 	}
 
-	if (phy_id == 0xffff || phy_id == 0x0) {
+	if (phy_id1 == 0xffff || phy_id1 == 0x0) {
 		printf("%s: no PHY present\n", dev->name);
 		return 0;
 	}
 
 	ftgmac100_phy_read(dev, priv->phy_addr, MII_BMSR, &status);
 
+//	printf("phy_id : %x , status %x \n",((phy_id1 << 16) | phy_id2), status );
+
 	if (!(status & BMSR_LSTATUS)) {
+//		printf("! status \n");
 		/* Try to re-negotiate if we don't have link already. */
 		ftgmac100_phy_reset(dev);
 
@@ -269,7 +415,7 @@ static int ftgmac100_update_link_speed(struct eth_device *dev)
 		return 0;
 
 	/* read MAC control register and clear related bits */
-	maccr = readl(&ftgmac100->maccr) &
+	maccr = __raw_readl(&ftgmac100->maccr) &
 		~(FTGMAC100_MACCR_GIGA_MODE |
 		  FTGMAC100_MACCR_FAST_MODE |
 		  FTGMAC100_MACCR_FULLDUP);
@@ -308,7 +454,7 @@ static int ftgmac100_update_link_speed(struct eth_device *dev)
 	}
 
 	/* update MII config into maccr */
-	writel(maccr, &ftgmac100->maccr);
+	__raw_writel(maccr, &ftgmac100->maccr);
 
 	return 1;
 }
@@ -322,10 +468,13 @@ static void ftgmac100_reset(struct eth_device *dev)
 
 	debug("%s()\n", __func__);
 
-	writel(FTGMAC100_MACCR_SW_RST, &ftgmac100->maccr);
+	//Ryan modify
+	__raw_writel(__raw_readl(&ftgmac100->maccr) | FTGMAC100_MACCR_SW_RST, &ftgmac100->maccr);
 
-	while (readl(&ftgmac100->maccr) & FTGMAC100_MACCR_SW_RST)
-		;
+	while (__raw_readl(&ftgmac100->maccr) & FTGMAC100_MACCR_SW_RST);
+
+	//Use New MDC and MDIO interface
+	__raw_writel(__raw_readl(&ftgmac100->fear0) | 0x80000000, &ftgmac100->fear0);
 }
 
 /*
@@ -340,15 +489,47 @@ static void ftgmac100_set_mac(struct eth_device *dev,
 
 	debug("%s(%x %x)\n", __func__, maddr, laddr);
 
-	writel(maddr, &ftgmac100->mac_madr);
-	writel(laddr, &ftgmac100->mac_ladr);
+	__raw_writel(maddr, &ftgmac100->mac_madr);
+	__raw_writel(laddr, &ftgmac100->mac_ladr);
 }
 
 static void ftgmac100_set_mac_from_env(struct eth_device *dev)
 {
-	eth_getenv_enetaddr("ethaddr", dev->enetaddr);
+#ifdef CONFIG_SYS_I2C_MAC_OFFSET
+
+	char *s;
+    int i, env;                // env variable 0: eeprom, 1: environment parameters
+
+	s = getenv ("eeprom");
+	env = (s && (*s == 'y')) ? 1 : 0;
 
+	if (env) {
+		printf("TODO ... eerprom --> \n");
+	    eeprom_init();
+		i2c_set_bus_num(3);
+	    eeprom_read(CONFIG_SYS_I2C_EEPROM_ADDR, CONFIG_SYS_I2C_MAC_OFFSET, dev->enetaddr, 6);
+
+		for (i = 0; i < 6; i++) {
+		    if (dev->enetaddr[i] != 0xFF) {
+		        env = 0;	//Suppose not all 0xFF is valid
+		    }
+		}
+	}
+
+	if(env)
+		eth_getenv_enetaddr_by_index("eth", dev->index, dev->enetaddr);
+//		eth_setenv_enetaddr("ethaddr", dev->enetaddr);
+	else
+		eth_getenv_enetaddr_by_index("eth", dev->index, dev->enetaddr);
+//		eth_getenv_enetaddr("ethaddr", dev->enetaddr);
+
+	ftgmac100_set_mac(dev, dev->enetaddr);
+#else
+	eth_getenv_enetaddr_by_index("eth", dev->index, dev->enetaddr);
+//	eth_getenv_enetaddr("ethaddr", dev->enetaddr);
 	ftgmac100_set_mac(dev, dev->enetaddr);
+#endif
+
 }
 
 /*
@@ -360,87 +541,64 @@ static void ftgmac100_halt(struct eth_device *dev)
 
 	debug("%s()\n", __func__);
 
-	writel(0, &ftgmac100->maccr);
+//	__raw_writel(0, &ftgmac100->maccr);
+	//ryan modify
+	__raw_writel(__raw_readl(&ftgmac100->maccr) & ~(FTGMAC100_MACCR_TXDMA_EN | FTGMAC100_MACCR_RXDMA_EN | FTGMAC100_MACCR_TXMAC_EN | FTGMAC100_MACCR_RXMAC_EN), &ftgmac100->maccr);
+
 }
 
 static int ftgmac100_init(struct eth_device *dev, bd_t *bd)
 {
 	struct ftgmac100 *ftgmac100 = (struct ftgmac100 *)dev->iobase;
 	struct ftgmac100_data *priv = dev->priv;
-	struct ftgmac100_txdes *txdes;
-	struct ftgmac100_rxdes *rxdes;
+	struct ftgmac100_txdes *txdes = priv->txdes;
+	struct ftgmac100_rxdes *rxdes = priv->rxdes;
 	unsigned int maccr;
-	void *buf;
 	int i;
 
 	debug("%s()\n", __func__);
 
-	if (!priv->txdes) {
-		txdes = dma_alloc_coherent(
-			sizeof(*txdes) * PKTBUFSTX, &priv->txdes_dma);
-		if (!txdes)
-			panic("ftgmac100: out of memory\n");
-		memset(txdes, 0, sizeof(*txdes) * PKTBUFSTX);
-		priv->txdes = txdes;
-	}
-	txdes = priv->txdes;
-
-	if (!priv->rxdes) {
-		rxdes = dma_alloc_coherent(
-			sizeof(*rxdes) * PKTBUFSRX, &priv->rxdes_dma);
-		if (!rxdes)
-			panic("ftgmac100: out of memory\n");
-		memset(rxdes, 0, sizeof(*rxdes) * PKTBUFSRX);
-		priv->rxdes = rxdes;
-	}
-	rxdes = priv->rxdes;
+	//Ryan Add
+	ftgmac100_reset(dev);
 
 	/* set the ethernet address */
 	ftgmac100_set_mac_from_env(dev);
 
 	/* disable all interrupts */
-	writel(0, &ftgmac100->ier);
+	__raw_writel(0, &ftgmac100->ier);
 
 	/* initialize descriptors */
 	priv->tx_index = 0;
 	priv->rx_index = 0;
 
-	txdes[PKTBUFSTX - 1].txdes0	= FTGMAC100_TXDES0_EDOTR;
-	rxdes[PKTBUFSRX - 1].rxdes0	= FTGMAC100_RXDES0_EDORR;
+	txdes[PKTBUFSTX - 1].txdes0	= cpu_to_le32(FTGMAC100_TXDES0_EDOTR);
+	rxdes[PKTBUFSRX - 1].rxdes0	= cpu_to_le32(FTGMAC100_RXDES0_EDORR);
 
 	for (i = 0; i < PKTBUFSTX; i++) {
 		/* TXBUF_BADR */
-		if (!txdes[i].txdes2) {
-			buf = memalign(ARCH_DMA_MINALIGN, CFG_XBUF_SIZE);
-			if (!buf)
-				panic("ftgmac100: out of memory\n");
-			txdes[i].txdes3 = virt_to_phys(buf);
-			txdes[i].txdes2 = (uint)buf;
-		}
+		txdes[i].txdes3 = 0;
 		txdes[i].txdes1 = 0;
 	}
 
 	for (i = 0; i < PKTBUFSRX; i++) {
 		/* RXBUF_BADR */
-		if (!rxdes[i].rxdes2) {
-			buf = net_rx_packets[i];
-			rxdes[i].rxdes3 = virt_to_phys(buf);
-			rxdes[i].rxdes2 = (uint)buf;
-		}
-		rxdes[i].rxdes0 &= ~FTGMAC100_RXDES0_RXPKT_RDY;
+		rxdes[i].rxdes3 = cpu_to_le32((unsigned int)net_rx_packets[i]);
+
+//		rxdes[i].rxdes0 &= ~FTGMAC100_RXDES0_RXPKT_RDY;
+		rxdes[i].rxdes0 = cpu_to_le32(le32_to_cpu(rxdes[i].rxdes0) & ~FTGMAC100_RXDES0_RXPKT_RDY);
 	}
 
 	/* transmit ring */
-	writel(priv->txdes_dma, &ftgmac100->txr_badr);
+	__raw_writel((unsigned int)txdes, &ftgmac100->txr_badr);
 
 	/* receive ring */
-	writel(priv->rxdes_dma, &ftgmac100->rxr_badr);
+	__raw_writel((unsigned int)rxdes, &ftgmac100->rxr_badr);
 
 	/* poll receive descriptor automatically */
-	writel(FTGMAC100_APTC_RXPOLL_CNT(1), &ftgmac100->aptc);
+	__raw_writel(FTGMAC100_APTC_RXPOLL_CNT(1), &ftgmac100->aptc);
 
 	/* config receive buffer size register */
-	writel(FTGMAC100_RBSR_SIZE(RBSR_DEFAULT_VALUE), &ftgmac100->rbsr);
+	__raw_writel(FTGMAC100_RBSR_SIZE(RBSR_DEFAULT_VALUE), &ftgmac100->rbsr);
 
 	/* enable transmitter, receiver */
 	maccr = FTGMAC100_MACCR_TXMAC_EN |
@@ -452,13 +610,34 @@ static int ftgmac100_init(struct eth_device *dev, bd_t *bd)
 		FTGMAC100_MACCR_RX_RUNT |
 		FTGMAC100_MACCR_RX_BROADPKT;
 
-	writel(maccr, &ftgmac100->maccr);
+	__raw_writel(maccr, &ftgmac100->maccr);
 
+//Ryan modify
+#if 1
+	ftgmac100_phy_init(dev);
+	if (!ftgmac100_update_link_speed(dev))
+		return -1;
+#else
 	if (!ftgmac100_phy_init(dev)) {
 		if (!ftgmac100_update_link_speed(dev))
 			return -1;
 	}
+#endif
+
+/////////////////
+#if 0 //(defined(CONFIG_MII) || defined(CONFIG_CMD_MII))
+	/* Search phy address from range 0-31 */
+	phy_adr = ethernet_phy_detect(dev);
+	if (phy_adr < 0) {
+		printf("FTGMAC100 : PHY not detected at address range 0-31\n");
+		return -1;
+	} else {
+		debug("FTGMAC100 : PHY detected at addr %d\n", phy_adr);
+		miiphy_write(dev->name, PHY_ADR_REQ, PHY_ADR_REQ, phy_adr);
+	}
+#endif
 
+//////////////////
 	return 0;
 }
 
@@ -473,10 +652,12 @@ static int ftgmac100_recv(struct eth_device *dev)
 
 	curr_des = &priv->rxdes[priv->rx_index];
 
-	if (!(curr_des->rxdes0 & FTGMAC100_RXDES0_RXPKT_RDY))
+	invalidate_dcache_range((u32) curr_des, (u32) curr_des + sizeof(struct ftgmac100_rxdes));
+
+	if (!(le32_to_cpu(curr_des->rxdes0) & FTGMAC100_RXDES0_RXPKT_RDY))
 		return -1;
 
-	if (curr_des->rxdes0 & (FTGMAC100_RXDES0_RX_ERR |
+	if (le32_to_cpu(curr_des->rxdes0) & (FTGMAC100_RXDES0_RX_ERR |
 				FTGMAC100_RXDES0_CRC_ERR |
 				FTGMAC100_RXDES0_FTL |
 				FTGMAC100_RXDES0_RUNT |
@@ -484,19 +665,20 @@ static int ftgmac100_recv(struct eth_device *dev)
 		return -1;
 	}
 
-	rxlen = FTGMAC100_RXDES0_VDBC(curr_des->rxdes0);
+	rxlen = FTGMAC100_RXDES0_VDBC(le32_to_cpu(curr_des->rxdes0));
 
 	debug("%s(): RX buffer %d, %x received\n",
 	       __func__, priv->rx_index, rxlen);
 
-	/* invalidate d-cache */
-	dma_map_single((void *)curr_des->rxdes2, rxlen, DMA_FROM_DEVICE);
+	invalidate_dcache_range((u32) (le32_to_cpu(curr_des->rxdes3)), (u32) (le32_to_cpu(curr_des->rxdes3)) + rxlen);
 
 	/* pass the packet up to the protocol layers. */
-	net_process_received_packet((void *)curr_des->rxdes2, rxlen);
+	net_process_received_packet((void *)le32_to_cpu(curr_des->rxdes3), rxlen);
 
 	/* release buffer to DMA */
-	curr_des->rxdes0 &= ~FTGMAC100_RXDES0_RXPKT_RDY;
+	//curr_des->rxdes0 &= ~FTGMAC100_RXDES0_RXPKT_RDY;
+
+	curr_des->rxdes0 = cpu_to_le32(le32_to_cpu(curr_des->rxdes0) & ~FTGMAC100_RXDES0_RXPKT_RDY);
 
 	priv->rx_index = (priv->rx_index + 1) % PKTBUFSRX;
 
@@ -511,6 +693,9 @@ static int ftgmac100_send(struct eth_device *dev, void *packet, int length)
 	struct ftgmac100 *ftgmac100 = (struct ftgmac100 *)dev->iobase;
 	struct ftgmac100_data *priv = dev->priv;
 	struct ftgmac100_txdes *curr_des = &priv->txdes[priv->tx_index];
+	unsigned long start;
+    unsigned long now;
+    unsigned long diff_time;
 
 	if (curr_des->txdes0 & FTGMAC100_TXDES0_TXDMA_OWN) {
 		debug("%s(): no TX descriptor available\n", __func__);
@@ -521,18 +706,45 @@ static int ftgmac100_send(struct eth_device *dev, void *packet, int length)
 
 	length = (length < ETH_ZLEN) ? ETH_ZLEN : length;
 
-	memcpy((void *)curr_des->txdes2, (void *)packet, length);
-	dma_map_single((void *)curr_des->txdes2, length, DMA_TO_DEVICE);
+	/* initiate a transmit sequence */
+	curr_des->txdes3 = cpu_to_le32((unsigned int)packet);	/* TXBUF_BADR */
 
 	/* only one descriptor on TXBUF */
+	/*
 	curr_des->txdes0 &= FTGMAC100_TXDES0_EDOTR;
+
 	curr_des->txdes0 |= FTGMAC100_TXDES0_FTS |
 			    FTGMAC100_TXDES0_LTS |
 			    FTGMAC100_TXDES0_TXBUF_SIZE(length) |
 			    FTGMAC100_TXDES0_TXDMA_OWN ;
+	*/
+	curr_des->txdes0 = cpu_to_le32(le32_to_cpu(curr_des->txdes0) & FTGMAC100_TXDES0_EDOTR);
+
+	curr_des->txdes0 = cpu_to_le32(le32_to_cpu(curr_des->txdes0) | (FTGMAC100_TXDES0_FTS |
+			    FTGMAC100_TXDES0_LTS |
+			    FTGMAC100_TXDES0_TXBUF_SIZE(length) |
+			    FTGMAC100_TXDES0_TXDMA_OWN));
 
 	/* start transmit */
-	writel(1, &ftgmac100->txpd);
+	__raw_writel(1, &ftgmac100->txpd);
+	invalidate_dcache_range((u32) curr_des, (u32) curr_des + sizeof(struct ftgmac100_rxdes));
+
+	/* wait for transfer to succeed */
+	start = get_timer(0);
+
+	while (le32_to_cpu(curr_des->txdes0) & FTGMAC100_TXDES0_TXDMA_OWN) {
+//		invalidate_dcache_range((u32) curr_des, (u32) curr_des + sizeof(struct ftgmac100_rxdes));
+        now = get_timer(0);
+        if ( now >= start )
+            diff_time = now - start;
+        else
+            diff_time = now + 0xFFFFFFFF - start;
+        if (diff_time >= 5000) /* 5ms */
+        {
+			debug("%s(): timed out\n", __func__);
+			return -1;
+		}
+	}
 
 	debug("%s(): packet sent\n", __func__);
 
@@ -546,6 +758,61 @@ int ftgmac100_initialize(bd_t *bd)
 	struct eth_device *dev;
 	struct ftgmac100_data *priv;
 
+#if 1   //Ryan Chen for more mac use
+	int i, card_number = 0, mac_no;
+	unsigned int			iobase[CONFIG_MAC_NUM];
+
+	mac_no = CONFIG_MAC_NUM;
+	iobase[0] = AST_MAC0_BASE;
+
+#ifdef AST_MAC1_BASE
+	iobase[1] = AST_MAC1_BASE;
+#endif
+	for (i = 0; i < mac_no; i++)
+	{
+		ast_scu_multi_func_eth(i);
+		ast_scu_init_eth(i);
+
+		debug ("FTGMAC100: Device @0x%x\n", iobase[i]);
+
+		dev = malloc(sizeof *dev);
+
+		/* Transmit and receive descriptors should align to 16 bytes */
+		priv = memalign(16, sizeof(struct ftgmac100_data));
+		if (!priv) {
+			printf("%s(): failed to allocate priv\n", __func__);
+			goto free_dev;
+		}
+
+		memset(dev, 0, sizeof(*dev));
+		memset(priv, 0, sizeof(*priv));
+
+		sprintf(dev->name, "FTGMAC100#%d", card_number);
+
+		dev->iobase = iobase[i];
+		dev->init	= ftgmac100_init;
+		dev->halt	= ftgmac100_halt;
+		dev->send	= ftgmac100_send;
+		dev->recv	= ftgmac100_recv;
+		dev->priv	= priv;
+		dev->write_hwaddr = NULL;		//20130209, ryan chen add
+
+		eth_register(dev);
+
+#if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
+		miiphy_register(dev->name, ftgmac100_reg_read, ftgmac100_reg_write);
+#endif
+
+		/* set the ethernet address */
+		ftgmac100_set_mac_from_env(dev);
+
+		ftgmac100_reset(dev);
+
+		card_number++;
+	}
+	return card_number;
+
+#else
 	dev = malloc(sizeof *dev);
 	if (!dev) {
 		printf("%s(): failed to allocate dev\n", __func__);
@@ -562,8 +829,8 @@ int ftgmac100_initialize(bd_t *bd)
 	memset(dev, 0, sizeof(*dev));
 	memset(priv, 0, sizeof(*priv));
 
-	strcpy(dev->name, "FTGMAC100");
-	dev->iobase	= CONFIG_FTGMAC100_BASE;
+	sprintf(dev->name, "FTGMAC100#0");
+	dev->iobase	= AST_MAC0_BASE;
 	dev->init	= ftgmac100_init;
 	dev->halt	= ftgmac100_halt;
 	dev->send	= ftgmac100_send;
@@ -571,13 +838,18 @@ int ftgmac100_initialize(bd_t *bd)
 	dev->priv	= priv;
 
 	eth_register(dev);
-
+//////
+	ast_scu_multi_func_eth(0);
+	ast_scu_init_eth(0);
+/////
 	ftgmac100_reset(dev);
 
 	return 1;
+#endif
 
 free_dev:
 	free(dev);
-out:
+//out:
 	return 0;
+
 }
diff --git a/drivers/net/ftgmac100.h b/drivers/net/ftgmac100.h
index 71121ba9d40f..de86379750ec 100644
--- a/drivers/net/ftgmac100.h
+++ b/drivers/net/ftgmac100.h
@@ -7,7 +7,19 @@
  * (C) Copyright 2010 Andes Technology
  * Macpaul Lin <macpaul@andestech.com>
  *
- * SPDX-License-Identifier:	GPL-2.0+
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
 #ifndef __FTGMAC100_H
@@ -31,26 +43,28 @@ struct ftgmac100 {
 	unsigned int	aptc;		/* 0x34 */
 	unsigned int	dblac;		/* 0x38 */
 	unsigned int	dmafifos;	/* 0x3c */
-	unsigned int	revr;		/* 0x40 */
-	unsigned int	fear;		/* 0x44 */
+	unsigned int	fear0;		/* 0x40 */
+	unsigned int	fear1;		/* 0x44 */
 	unsigned int	tpafcr;		/* 0x48 */
 	unsigned int	rbsr;		/* 0x4c */
 	unsigned int	maccr;		/* 0x50 */
 	unsigned int	macsr;		/* 0x54 */
 	unsigned int	tm;		/* 0x58 */
-	unsigned int	resv1;		/* 0x5c */ /* not defined in spec */
+	unsigned int	physts;		/* 0x5c */ /* not defined in spec */
 	unsigned int	phycr;		/* 0x60 */
 	unsigned int	phydata;	/* 0x64 */
 	unsigned int	fcr;		/* 0x68 */
 	unsigned int	bpr;		/* 0x6c */
 	unsigned int	wolcr;		/* 0x70 */
 	unsigned int	wolsr;		/* 0x74 */
-	unsigned int	wfcrc;		/* 0x78 */
-	unsigned int	resv2;		/* 0x7c */ /* not defined in spec */
-	unsigned int	wfbm1;		/* 0x80 */
-	unsigned int	wfbm2;		/* 0x84 */
-	unsigned int	wfbm3;		/* 0x88 */
-	unsigned int	wfbm4;		/* 0x8c */
+//	unsigned int	wfcrc;		/* 0x78 */
+//	unsigned int	resv2;		/* 0x7c */ /* not defined in spec */
+	unsigned int	wfbm1m;		/* 0x78 */
+	unsigned int	wfbm1l;		/* 0x7c */
+	unsigned int	wfbm2m;		/* 0x80 */
+	unsigned int	wfbm2l;		/* 0x84 */
+	unsigned int	wfbm3m;		/* 0x88 */
+	unsigned int	wfbm3l;		/* 0x8c */
 	unsigned int	nptxr_ptr;	/* 0x90 */
 	unsigned int	hptxr_ptr;	/* 0x94 */
 	unsigned int	rxr_ptr;	/* 0x98 */
@@ -82,6 +96,11 @@ struct ftgmac100 {
 #define FTGMAC100_INT_AHB_ERR		(1 << 8)
 #define FTGMAC100_INT_PHYSTS_CHG	(1 << 9)
 #define FTGMAC100_INT_NO_HPTXBUF	(1 << 10)
+////
+#define FTGMAC100_INT_PHY_CHG		(1 << 28)
+#define FTGMAC100_INT_PHY_TIMEOUT	(1 << 29)
+#define FTGMAC100_INT_FLAG_ACK		(1 << 30)
+#define FTGMAC100_INT_FLAG_REQ		(1 << 31)
 
 /*
  * Interrupt timer control register
@@ -144,11 +163,12 @@ struct ftgmac100 {
 #define FTGMAC100_MACCR_RXMAC_EN	(1 << 3)
 #define FTGMAC100_MACCR_RM_VLAN		(1 << 4)
 #define FTGMAC100_MACCR_HPTXR_EN	(1 << 5)
-#define FTGMAC100_MACCR_LOOP_EN		(1 << 6)
+//#define FTGMAC100_MACCR_LOOP_EN		(1 << 6)
 #define FTGMAC100_MACCR_ENRX_IN_HALFTX	(1 << 7)
 #define FTGMAC100_MACCR_FULLDUP		(1 << 8)
 #define FTGMAC100_MACCR_GIGA_MODE	(1 << 9)
 #define FTGMAC100_MACCR_CRC_APD		(1 << 10)
+#define FTGMAC100_MACCR_LOW_SEN		(1 << 11) //new
 #define FTGMAC100_MACCR_RX_RUNT		(1 << 12)
 #define FTGMAC100_MACCR_JUMBO_LF	(1 << 13)
 #define FTGMAC100_MACCR_RX_ALL		(1 << 14)
@@ -159,6 +179,19 @@ struct ftgmac100 {
 #define FTGMAC100_MACCR_FAST_MODE	(1 << 19)
 #define FTGMAC100_MACCR_SW_RST		(1 << 31)
 
+/* */
+#define FTGMAC100_PHY_LINK_UP		(1 << 0)
+#define FTGMAC100_PHY_100M_MODE		(1 << 2)
+#define FTGMAC100_PHY_FULL_DUPLEX	(1 << 1)
+#define FTGMAC100_PHY_1G_MODE		(1 << 3)
+
+#define FTGMAC100_PHY_STS_UNVALID	(1 << 16)
+
+#define FTGMAC100_PHY_POLL			(1 << 28)
+#define FTGMAC100_PHY_LINK			(1 << 29)
+#define FTGMAC100_PHY_ACK_EN		(1 << 30)
+#define FTGMAC100_PHY_REQ_EN		(1 << 31)
+
 /*
  * PHY control register
  */
@@ -169,12 +202,22 @@ struct ftgmac100 {
 #define FTGMAC100_PHYCR_MIIRD		(1 << 26)
 #define FTGMAC100_PHYCR_MIIWR		(1 << 27)
 
+//New MDC/MDIO
+#define FTGMAC100_PHYCR_NEW_FIRE		(1 << 15)
+#define FTGMAC100_PHYCR_ST_22			(1 << 12)
+#define FTGMAC100_PHYCR_NEW_WRITE		(1 << 10)
+#define FTGMAC100_PHYCR_NEW_READ		(2 << 10)
+#define FTGMAC100_PHYCR_NEW_PHYAD(x)	(((x) & 0x1f) << 5)
+#define FTGMAC100_PHYCR_NEW_REGAD(x)	((x) & 0x1f)
+
 /*
  * PHY data register
  */
 #define FTGMAC100_PHYDATA_MIIWDATA(x)		((x) & 0xffff)
 #define FTGMAC100_PHYDATA_MIIRDATA(phydata)	(((phydata) >> 16) & 0xffff)
 
+#define FTGMAC100_PHYDATA_NEW_MIIWDATA(x)		((x) & 0xffff)
+
 /*
  * Transmit descriptor, aligned to 16 bytes
  */
@@ -186,17 +229,18 @@ struct ftgmac100_txdes {
 } __attribute__ ((aligned(16)));
 
 #define FTGMAC100_TXDES0_TXBUF_SIZE(x)	((x) & 0x3fff)
-#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
+//#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
 #define FTGMAC100_TXDES0_CRC_ERR	(1 << 19)
 #define FTGMAC100_TXDES0_LTS		(1 << 28)
 #define FTGMAC100_TXDES0_FTS		(1 << 29)
+#define FTGMAC100_TXDES0_EDOTR		(1 << 30) //org is 15 ->30
 #define FTGMAC100_TXDES0_TXDMA_OWN	(1 << 31)
 
 #define FTGMAC100_TXDES1_VLANTAG_CI(x)	((x) & 0xffff)
 #define FTGMAC100_TXDES1_INS_VLANTAG	(1 << 16)
-#define FTGMAC100_TXDES1_TCP_CHKSUM	(1 << 17)
-#define FTGMAC100_TXDES1_UDP_CHKSUM	(1 << 18)
-#define FTGMAC100_TXDES1_IP_CHKSUM	(1 << 19)
+//#define FTGMAC100_TXDES1_TCP_CHKSUM	(1 << 17)
+//#define FTGMAC100_TXDES1_UDP_CHKSUM	(1 << 18)
+//#define FTGMAC100_TXDES1_IP_CHKSUM	(1 << 19)
 #define FTGMAC100_TXDES1_LLC		(1 << 22)
 #define FTGMAC100_TXDES1_TX2FIC		(1 << 30)
 #define FTGMAC100_TXDES1_TXIC		(1 << 31)
@@ -212,7 +256,7 @@ struct ftgmac100_rxdes {
 } __attribute__ ((aligned(16)));
 
 #define FTGMAC100_RXDES0_VDBC(x)	((x) & 0x3fff)
-#define FTGMAC100_RXDES0_EDORR		(1 << 15)
+//#define FTGMAC100_RXDES0_EDORR		(1 << 15)
 #define FTGMAC100_RXDES0_MULTICAST	(1 << 16)
 #define FTGMAC100_RXDES0_BROADCAST	(1 << 17)
 #define FTGMAC100_RXDES0_RX_ERR		(1 << 18)
@@ -225,6 +269,7 @@ struct ftgmac100_rxdes {
 #define FTGMAC100_RXDES0_PAUSE_FRAME	(1 << 25)
 #define FTGMAC100_RXDES0_LRS		(1 << 28)
 #define FTGMAC100_RXDES0_FRS		(1 << 29)
+#define FTGMAC100_RXDES0_EDORR		(1 << 30)	//org 15->30
 #define FTGMAC100_RXDES0_RXPKT_RDY	(1 << 31)
 
 #define FTGMAC100_RXDES1_VLANTAG_CI	0xffff
diff --git a/include/_exports.h b/include/_exports.h
index 11beeb24f183..d4ad18c35ef0 100644
--- a/include/_exports.h
+++ b/include/_exports.h
@@ -55,6 +55,9 @@
 	EXPORT_FUNC(dummy, void, spi_free_slave, void)
 #else
 	EXPORT_FUNC(spi_init, void, spi_init, void)
+#ifdef CONFIG_FMC_SPI
+	EXPORT_FUNC(spi_dma)
+#endif
 	EXPORT_FUNC(spi_setup_slave, struct spi_slave *, spi_setup_slave,
 		    unsigned int, unsigned int, unsigned int, unsigned int)
 	EXPORT_FUNC(spi_free_slave, void, spi_free_slave, struct spi_slave *)
diff --git a/include/configs/ast-g5.h b/include/configs/ast-g5.h
new file mode 100644
index 000000000000..5621a6967fe1
--- /dev/null
+++ b/include/configs/ast-g5.h
@@ -0,0 +1,245 @@
+/*
+ * Copyright (C) 2012-2020  ASPEED Technology Inc.
+ * Ryan Chen <ryan_chen@aspeedtech.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ */
+
+#ifndef __CONFIG_H
+#define __CONFIG_H
+
+#define CONFIG_ARCH_ASPEED
+#define CONFIG_ARCH_AST2500
+#define CONFIG_MAC_NUM 2
+#define CONFIG_EXTRA_ENV_SETTINGS AST2500_ENV_SETTINGS
+
+/* #define DEBUG	1 */
+/* #define  CONFIG_SKIP_LOWLEVEL_INIT */
+#define CONFIG_AST_FPGA_VER 4 /* for arm1176 */
+
+/*
+ * High Level Configuration Options
+ * (easy to change)
+ */
+#define CONFIG_ARCH_CPU_INIT
+#define CONFIG_MISC_INIT_R		1
+#define CONFIG_MACH_TYPE				MACH_TYPE_ASPEED
+#ifdef CONFIG_ARCH_AST1070
+#define CONFIG_AST_GPIO
+#endif
+
+
+#include <asm/arch/platform.h>
+
+/* Misc CPU related */
+/* #define CONFIG_ARCH_CPU_INIT */
+#define CONFIG_CMDLINE_TAG		/* enable passing of ATAGs */
+#define CONFIG_SETUP_MEMORY_TAGS
+#define CONFIG_INITRD_TAG
+
+#define CONFIG_CMDLINE_EDITING		1	/* command line history */
+/* #define CONFIG_SYS_HUSH_PARSER		1 */	/* Use the HUSH parser		*/
+
+/* ------------------------------------------------------------------------- */
+
+/* Enable cache controller */
+#define CONFIG_SYS_DCACHE_OFF	1
+
+/* ------------------------------------------------------------------------- */
+/* additions for new relocation code, must added to all boards */
+#define CONFIG_SYS_SDRAM_BASE			(AST_DRAM_BASE)
+#define CONFIG_SYS_INIT_RAM_ADDR		CONFIG_SYS_SDRAM_BASE /*(AST_SRAM_BASE)*/
+#define CONFIG_SYS_INIT_RAM_SIZE		(32*1024)
+#define CONFIG_SYS_INIT_RAM_END     (CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_RAM_SIZE)
+#define CONFIG_SYS_INIT_SP_ADDR 	(CONFIG_SYS_INIT_RAM_END - GENERATED_GBL_DATA_SIZE)
+
+#define CONFIG_NR_DRAM_BANKS	1
+
+#define CONFIG_SYS_MEMTEST_START		CONFIG_SYS_SDRAM_BASE + 0x300000
+#define CONFIG_SYS_MEMTEST_END			(CONFIG_SYS_MEMTEST_START + (80*1024*1024))
+/*-----------------------------------------------------------------------*/
+
+#define CONFIG_SYS_TEXT_BASE            0
+#define CONFIG_SYS_UBOOT_BASE		CONFIG_SYS_TEXT_BASE
+/*
+ * Memory Info
+ */
+#define CONFIG_SYS_MALLOC_LEN   	(0x1000 + 4*1024*1024) /* malloc() len */
+
+
+/*
+ * Timer Set
+ */
+#undef CONFIG_SYS_HZ
+#define CONFIG_SYS_HZ				(1*1000*1000) /* use external clk (1M) */
+
+/*
+ * Hardware drivers
+ */
+
+/* #define CONFIG_FARADAYNIC */
+/* #define CONFIG_DRIVER_ASPEED_I2C */
+
+/*
+ * NS16550 Configuration
+ */
+#define CONFIG_SYS_NS16550_SERIAL
+#define CONFIG_SYS_NS16550_REG_SIZE		-4
+#define CONFIG_SYS_NS16550_CLK			24000000
+#define CONFIG_SYS_NS16550_COM1			AST_UART0_BASE
+#define CONFIG_SYS_LOADS_BAUD_CHANGE
+#define CONFIG_SERIAL1					1
+#define CONFIG_CONS_INDEX				1
+#define CONFIG_BAUDRATE					115200
+
+/* #define CONFIG_SYS_BAUDRATE_TABLE		{ 9600, 19200, 38400, 57600, 115200 } */
+
+/* #define CONFIG_SYS_MAX_FLASH_BANKS      1 */
+/* #define CONFIG_SYS_MAX_FLASH_SECT       (256) */           /* max number of sectors on one chip */
+
+/*
+ * BOOTP options
+ */
+#define CONFIG_BOOTP_BOOTFILESIZE
+#define CONFIG_BOOTP_BOOTPATH
+#define CONFIG_BOOTP_GATEWAY
+#define CONFIG_BOOTP_HOSTNAME
+#define CONFIG_BOOTP_SUBNETMASK
+
+/*
+ * Environment Config
+ */
+#define CONFIG_BOOTDELAY	2
+#define CONFIG_BOOTFILE		"all.bin"
+
+/*
+ * Miscellaneous configurable options
+ */
+#define CONFIG_SYS_LONGHELP	/* undef to save memory */
+#define CONFIG_SYS_CBSIZE	256		/* Console I/O Buffer Size */
+/* Monitor Command Prompt	 */
+#define CONFIG_SYS_PROMPT		"ast# "
+
+/* Print Buffer Size */
+#define CONFIG_SYS_PBSIZE	(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
+#define CONFIG_SYS_MAXARGS	16		/* max number of command args */
+#define CONFIG_SYS_BARGSIZE	CONFIG_SYS_CBSIZE /* Boot Argument Buffer Size */
+
+#define CONFIG_SYS_LOAD_ADDR		0x83000000	/* default load address */
+
+#define CONFIG_BOOTARGS		"console=ttyS0,115200n8 ramdisk_size=16384 root=/dev/ram rw init=/linuxrc mem=80M"
+
+/* ------------------------------------------------------------------------- */
+
+/* ------------------------------------------------------------------------- */
+#define CONFIG_AST_SPI_NOR    /* AST SPI NOR Flash */
+
+#ifdef CONFIG_AST_SPI_NOR
+
+#define CONFIG_FMC_CS			1
+/*#define CONFIG_SPI0_CS		1 */
+
+/*#define CONFIG_FLASH_DMA */
+#define CONFIG_SYS_MAX_FLASH_BANKS 	(CONFIG_FMC_CS)
+/*#define CONFIG_SYS_MAX_FLASH_SECT	(1024)	*/	/* max number of sectors on one chip */
+#define CONFIG_SYS_MAX_FLASH_SECT	(8192)		/* max number of sectors on one chip */
+#define CONFIG_ENV_IS_IN_FLASH		1
+#define CONFIG_ENV_ADDR				(AST_FMC_CS0_BASE + 0x60000)
+
+#endif
+
+/* ------------------------------------------------------------------------- */
+#define CONFIG_ENV_OFFSET				0x60000	/* environment starts here  */
+#define CONFIG_ENV_SIZE					0x20000		/* Total Size of Environment Sector */
+
+#define CONFIG_BOOTCOMMAND	"bootm 20080000 20300000"
+#define CONFIG_ENV_OVERWRITE
+
+#define AST2500_ENV_SETTINGS					\
+	"verify=yes\0"	\
+	"spi_dma=yes\0" \
+	"update=tftp 80800000 ast2500.scr; so 80800000\0" \
+	""
+
+/* ------------------------------------------------------------------------- */
+
+/* Ethernet */
+#ifdef CONFIG_CMD_MII
+#define CONFIG_MII			1
+#define CONFIG_PHY_GIGE
+#define CONFIG_PHYLIB
+#define CONFIG_PHY_ADDR			0
+#define CONFIG_PHY_REALTEK
+#endif
+
+#ifdef CONFIG_CMD_NET
+/* #define CONFIG_MAC_NUM	2 */
+#define CONFIG_FTGMAC100
+#define CONFIG_PHY_MAX_ADDR	32	/* this comes from <linux/phy.h> */
+/* #define CONFIG_SYS_DISCOVER_PHY */
+#define CONFIG_FTGMAC100_EGIGA
+
+#define CONFIG_GATEWAYIP		192.168.0.1
+#define CONFIG_NETMASK			255.255.255.0
+#define CONFIG_IPADDR			192.168.0.45
+#define CONFIG_SERVERIP			192.168.0.81
+#define CONFIG_ETHADDR			00:C0:A8:12:34:56
+#define CONFIG_ETH1ADDR			00:C0:A8:12:34:57
+
+#endif
+
+#ifdef CONFIG_PCI
+#define CONFIG_CMD_PCI
+#define CONFIG_PCI_PNP
+#define CONFIG_PCI_SCAN_SHOW
+#define CONFIG_PCI_CONFIG_HOST_BRIDGE
+
+#define CONFIG_SYS_PCIE1_BASE		0x8c000000
+#define CONFIG_SYS_PCIE1_CFG_BASE	0x8c000000
+#define CONFIG_SYS_PCIE1_CFG_SIZE	0x01000000
+#define CONFIG_SYS_PCIE1_MEM_BASE	0x8d000000
+#define CONFIG_SYS_PCIE1_MEM_PHYS	0x8d000000
+#define CONFIG_SYS_PCIE1_MEM_SIZE	0x01000000
+#define CONFIG_SYS_PCIE1_IO_BASE	0x8e000000
+#define CONFIG_SYS_PCIE1_IO_PHYS	0x8e000000
+#define CONFIG_SYS_PCIE1_IO_SIZE	0x00100000
+
+#define CONFIG_SYS_PCIE2_BASE		0x8f000000
+#define CONFIG_SYS_PCIE2_CFG_BASE	0x8f000000
+#define CONFIG_SYS_PCIE2_CFG_SIZE	0x01000000
+#define CONFIG_SYS_PCIE2_MEM_BASE	0x90000000
+#define CONFIG_SYS_PCIE2_MEM_PHYS	0x90000000
+#define CONFIG_SYS_PCIE2_MEM_SIZE	0x00100000
+#define CONFIG_SYS_PCIE2_IO_BASE	0x91000000
+#define CONFIG_SYS_PCIE2_IO_PHYS	0x91000000
+#define CONFIG_SYS_PCIE2_IO_SIZE	0x00100000
+#endif
+
+/* -------------------------------------------------------------------------
+ * 1. DRAM Speed
+ * #define CONFIG_DRAM_1333
+ * #define CONFIG_DRAM_1600        (default)
+ * #define CONFIG_DRAM_1866
+ *  2. UART5 message output
+ * #define	 CONFIG_DRAM_UART_38400
+ * 3. DRAM Type
+ * #define CONFIG_DDR3_8GSTACK     DDR3 8Gbit Stack die
+ * 4. ECC Function enable
+ * #define CONFIG_DRAM_ECC
+ */
+#define	CONFIG_DRAM_ECC_SIZE	0x10000000
+
+#endif	/* __CONFIG_H */
diff --git a/include/flash.h b/include/flash.h
index c6321a02ef8e..431f4ff47cfa 100644
--- a/include/flash.h
+++ b/include/flash.h
@@ -47,6 +47,23 @@ typedef struct {
 #ifdef CONFIG_MTD
 	struct mtd_info *mtd;
 #endif
+#ifdef CONFIG_AST_SPI_NOR
+	ulong 	reg_base;
+        ulong   readcmd;
+        ulong   dualport;
+	ulong	dummybyte;
+	ulong	tCK_Write;
+	ulong	tCK_Erase;
+	ulong	tCK_Read;
+	ulong	CE;
+	ulong 	sysspi;
+	ulong	iomode;
+	ulong   address32;
+	ulong   quadport;
+	ulong	dummydata;
+	ulong	buffersize;
+	ulong	specificspi;
+#endif
 } flash_info_t;
 
 extern flash_info_t flash_info[]; /* info for FLASH chips	*/
@@ -98,6 +115,10 @@ extern int flash_write (char *, ulong, ulong);
 extern flash_info_t *addr2info (ulong);
 extern int write_buff (flash_info_t *info, uchar *src, ulong addr, ulong cnt);
 
+#ifdef CONFIG_AST_SPI_NOR
+extern void memmove_dma(void * dest,const void *src,size_t count);
+#endif
+
 /* drivers/mtd/cfi_mtd.c */
 #ifdef CONFIG_FLASH_CFI_MTD
 extern int cfi_mtd_init(void);
diff --git a/include/spi.h b/include/spi.h
index 4b88d3986e78..8e22c5fe4faf 100644
--- a/include/spi.h
+++ b/include/spi.h
@@ -194,6 +194,8 @@ void *spi_do_alloc_slave(int offset, int size, unsigned int bus,
 struct spi_slave *spi_setup_slave(unsigned int bus, unsigned int cs,
 		unsigned int max_hz, unsigned int mode);
 
+void spi_dma(struct spi_slave *slave, void *to, void *from, size_t len);
+
 /**
  * Free any memory associated with a SPI slave.
  *
-- 
2.1.4
