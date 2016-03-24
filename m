Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qWKrJ6qfczDq8g
 for <openbmc@lists.ozlabs.org>; Fri, 25 Mar 2016 08:51:12 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458856268326355.9674355417633;
 Thu, 24 Mar 2016 14:51:08 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] arm: aspeed: Remove include/machine directory
Date: Thu, 24 Mar 2016 16:51:05 -0500
Message-Id: <1458856265-28039-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458856265-28039-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458856265-28039-1-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 24 Mar 2016 21:51:13 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Remove the need for the include/mach-aspeed directory like the
other platforms included in the multiplatform kernel.  That is,
move the include files to the machine directory with their users.

Using git grep shows exactly one use of ast2400.h in the tree.
This reduces our diff to upstream, removing the hack to allow
the include file to be found.  I decided not to merge the file
as the contents will eventually be encoded in the device tree.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 arch/arm/Makefile                           |   2 +
 arch/arm/mach-aspeed/aspeed.c               |   2 +-
 arch/arm/mach-aspeed/ast2400.h              | 117 ++++++++++++++++++++++++++++
 arch/arm/mach-aspeed/include/mach/ast2400.h | 117 ----------------------------
 4 files changed, 120 insertions(+), 118 deletions(-)
 create mode 100644 arch/arm/mach-aspeed/ast2400.h
 delete mode 100644 arch/arm/mach-aspeed/include/mach/ast2400.h

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 69bd768..299cc13 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -259,11 +259,13 @@ endif
 machdirs := $(patsubst %,arch/arm/mach-%/,$(machine-y))
 platdirs := $(patsubst %,arch/arm/plat-%/,$(sort $(plat-y)))
 
+ifneq ($(CONFIG_ARCH_MULTIPLATFORM),y)
 ifeq ($(KBUILD_SRC),)
 KBUILD_CPPFLAGS += $(patsubst %,-I%include,$(machdirs) $(platdirs))
 else
 KBUILD_CPPFLAGS += $(patsubst %,-I$(srctree)/%include,$(machdirs) $(platdirs))
 endif
+endif
 
 export	TEXT_OFFSET GZFLAGS MMUEXT
 
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index f3180fc..4a0200c 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -6,7 +6,7 @@
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
-#include <mach/ast2400.h>
+#include "ast2400.h"
 
 // XXX TEMP HACKERY
 //
diff --git a/arch/arm/mach-aspeed/ast2400.h b/arch/arm/mach-aspeed/ast2400.h
new file mode 100644
index 0000000..1daf85c
--- /dev/null
+++ b/arch/arm/mach-aspeed/ast2400.h
@@ -0,0 +1,117 @@
+/*
+ * Copyright 2015 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ */
+
+#ifndef AST2400_H
+#define AST2400_H
+
+/* Periperhal base addresses */
+#define AST_BASE_LEGACY_SRAM	0x10000000 /* Legacy BMC Static Memory */
+#define AST_BASE_LEGACY_SMC	0x16000000 /* Legacy BMC Static Memory Controller (SMC) */
+#define AST_BASE_APBC		0x1E600000 /* AHB Bus Controller (AHBC) */
+#define AST_BASE_FMC		0x1E620000 /* New BMC Static Memory Controller (FMC) */
+#define AST_BASE_SPI		0x1E630000 /* SPI Memory Controller */
+#define AST_BASE_MIC		0x1E640000 /* Memory Integrity Check Controller (MIC) */
+#define AST_BASE_MAC1		0x1E660000 /* Fast Ethernet MAC Controller #1 (MAC1) */
+#define AST_BASE_MAC2		0x1E680000 /* Fast Ethernet MAC Controller #2 (MAC2) */
+#define AST_BASE_USB2HUB	0x1E6A0000 /* USB2.0 Hub Controller */
+#define AST_BASE_USB2HC		0x1E6A1000 /* USB2.0 Host Controller */
+#define AST_BASE_USB1HC		0x1E6B0000 /* USB1.1 Host Controller */
+#define AST_BASE_VIC		0x1E6C0000 /* Interrupt Controller (VIC) */
+#define AST_BASE_MMC		0x1E6E0000 /* SDRAM Controller (MMC) */
+#define AST_BASE_USB1		0x1E6E1000 /* USB1.1 Controller */
+#define AST_BASE_SCU		0x1E6E2000 /* System Control Unit (SCU) */
+#define AST_BASE_HACE		0x1E6E3000 /* Hash & Crypto Engine (HACE) */
+#define AST_BASE_JTAG		0x1E6E4000 /* JTAG Master */
+#define AST_BASE_CRT		0x1E6E6000 /* Graphics Display Controller (CRT) */
+#define AST_BASE_DMA		0x1E6E7000 /* X-DMA Controller */
+#define AST_BASE_MCTP		0x1E6E8000 /* MCTP Controller */
+#define AST_BASE_ADC		0x1E6E9000 /* ADC Voltage Monitor */
+#define AST_BASE_LPCPLUS	0x1E6EC000 /* LPC+ Controller */
+#define AST_BASE_VIDEO		0x1E700000 /* Video Engine */
+#define AST_BASE_SRAM		0x1E720000 /* 32KB SRAM */
+#define AST_BASE_SDIO		0x1E740000 /* SD/SDIO Controller */
+#define AST_BASE_2D		0x1E760000 /* 2D Engine */
+#define AST_BASE_GPIO		0x1E780000 /* GPIO Controller */
+#define AST_BASE_RTC		0x1E781000 /* Real-Time Clock (RTC) */
+#define AST_BASE_TIMER		0x1E782000 /* Timer #1 ∼ #8 Controller */
+#define AST_BASE_UART1		0x1E783000 /* UART - #1 (LPC UART1) */
+#define AST_BASE_UART5		0x1E784000 /* UART - #5 (BMC Debug) */
+#define AST_BASE_WDT		0x1E785000 /* Watchdog Timer (WDT) */
+#define AST_BASE_PWM		0x1E786000 /* PWM & Fan Tacho Controller */
+#define AST_BASE_VUART		0x1E787000 /* Virtual UART (VUART) */
+#define AST_BASE_PUART		0x1E788000 /* Pass Through UART (PUART) */
+#define AST_BASE_LPC		0x1E789000 /* LPC Controller */
+#define AST_BASE_I2C		0x1E78A000 /* I2C/SMBus Controller */
+#define AST_BASE_PECI		0x1E78B000 /* PECI Controller */
+#define AST_BASE_UART2		0x1E78D000 /* UART - #2 (LPC UART2) */
+#define AST_BASE_UART3		0x1E78E000 /* UART - #3 */
+#define AST_BASE_UART4		0x1E78F000 /* UART - #4 */
+
+/* Memory */
+#define AST_BASE_BMCSRAM	0x20000000 /* BMC Static Memory */
+#define AST_BASE_SPIMEM		0x30000000 /* SPI Flash Memory */
+#define AST_BASE_SDRAM		0x40000000 /* SDRAM */
+#define AST_BASE_LPCBRIDGE	0x60000000 /* AHB Bus to LPC Bus Bridge */
+#define AST_BASE_LPCPBRIDGE	0x70000000 /* AHB Bus to LPC+ Bus Bridge */
+
+/* BMC interrupt sources */
+#define AST_ID_SDRAM		0	/* SDRAM interrupt */
+#define AST_ID_MIC		1	/* MIC interrupt */
+#define AST_ID_MAC1		2	/* MAC1 interrupt */
+#define AST_ID_MAC2		3	/* MAC2 interrupt */
+#define AST_ID_CRYPTO		4	/* Crypto interrupt */
+#define AST_ID_USB2		5	/* USB 2.0 Hub/Host interrupt */
+#define AST_ID_XDMA		6	/* X-DMA interrupt */
+#define AST_ID_VIDEO		7	/* Video Engine interrupt */
+#define AST_ID_LPC		8	/* LPC interrupt */
+#define AST_ID_UART1		9	/* UART1 interrupt */
+#define AST_ID_UART5		10	/* UART5 interrupt */
+#define AST_ID_11		11	/* Reserved */
+#define AST_ID_I2C		12	/* I2C/SMBus interrupt */
+#define AST_ID_USB1HID		13	/* USB 1.1 HID interrupt */
+#define AST_ID_USB1HOST		14	/* USB 1.1 Host interrupt */
+#define AST_ID_PECI		15	/* PECI interrupt */
+#define AST_ID_TIMER1		16	/* Timer 1 interrupt */
+#define AST_ID_TIMER2		17	/* Timer 2 interrupt */
+#define AST_ID_TIMER3		18	/* Timer 3 interrupt */
+#define AST_ID_SMC		19	/* SMC interrupt */
+#define AST_ID_GPIO		20	/* GPIO interrupt */
+#define AST_ID_SCU		21	/* SCU interrupt */
+#define AST_ID_RTC		22	/* RTC alarm interrupt */
+#define AST_ID_23		23	/* Reserved */
+#define AST_ID_24		24	/* Reserved */
+#define AST_ID_GRAPHICS		25	/* Graphics CRT interrupt */
+#define AST_ID_SDIO		26	/* SD/SDIO interrupt */
+#define AST_ID_WDT		27	/* WDT alarm interrupt */
+#define AST_ID_PWM		28	/* PWM/Tachometer interrupt */
+#define AST_ID_2D		29	/* Graphics 2D interrupt */
+#define AST_ID_WAKEUP		30	/* System Wakeup Control */
+#define AST_ID_ADC		31	/* ADC interrupt */
+#define AST_ID_UART2		32	/* UART2 interrupt */
+#define AST_ID_UART3		33	/* UART3 interrupt */
+#define AST_ID_UART4		34	/* UART4 interrupt */
+#define AST_ID_TIMER4		35	/* Timer 4 interrupt */
+#define AST_ID_TIMER5		36	/* Timer 5 interrupt */
+#define AST_ID_TIMER6		37	/* Timer 6 interrupt */
+#define AST_ID_TIMER38		38	/* Timer 7 interrupt */
+#define AST_ID_TIMER39		39	/* Timer 8 interrupt */
+#define AST_ID_SGPIOMASTER	40	/* SGPIO Master interrupt */
+#define AST_ID_SGPIOSLAVE	41	/* SGPIO Slave interrupt */
+#define AST_ID_MCTP		42	/* MCTP interrupt */
+#define AST_ID_JTAG		43	/* JTAG Master interrupt */
+#define AST_ID_44		44	/* Reserved */
+#define AST_ID_COPRO		45	/* Coprocessor interrupt */
+#define AST_ID_MAILBOX		46	/* MailBox interrupt */
+#define AST_ID_GPIOL1		47	/* GPIOL1 direct input */
+#define AST_ID_GPIOL3		48	/* GPIOL3 direct input */
+#define AST_ID_GPIOM1		49	/* GPIOM1 direct input */
+#define AST_ID_GPIOM3		50	/* GPIOM3 direct input */
+
+#endif /*AST2400_H*/
diff --git a/arch/arm/mach-aspeed/include/mach/ast2400.h b/arch/arm/mach-aspeed/include/mach/ast2400.h
deleted file mode 100644
index 1daf85c..0000000
--- a/arch/arm/mach-aspeed/include/mach/ast2400.h
+++ /dev/null
@@ -1,117 +0,0 @@
-/*
- * Copyright 2015 IBM Corp.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version
- * 2 of the License, or (at your option) any later version.
- *
- */
-
-#ifndef AST2400_H
-#define AST2400_H
-
-/* Periperhal base addresses */
-#define AST_BASE_LEGACY_SRAM	0x10000000 /* Legacy BMC Static Memory */
-#define AST_BASE_LEGACY_SMC	0x16000000 /* Legacy BMC Static Memory Controller (SMC) */
-#define AST_BASE_APBC		0x1E600000 /* AHB Bus Controller (AHBC) */
-#define AST_BASE_FMC		0x1E620000 /* New BMC Static Memory Controller (FMC) */
-#define AST_BASE_SPI		0x1E630000 /* SPI Memory Controller */
-#define AST_BASE_MIC		0x1E640000 /* Memory Integrity Check Controller (MIC) */
-#define AST_BASE_MAC1		0x1E660000 /* Fast Ethernet MAC Controller #1 (MAC1) */
-#define AST_BASE_MAC2		0x1E680000 /* Fast Ethernet MAC Controller #2 (MAC2) */
-#define AST_BASE_USB2HUB	0x1E6A0000 /* USB2.0 Hub Controller */
-#define AST_BASE_USB2HC		0x1E6A1000 /* USB2.0 Host Controller */
-#define AST_BASE_USB1HC		0x1E6B0000 /* USB1.1 Host Controller */
-#define AST_BASE_VIC		0x1E6C0000 /* Interrupt Controller (VIC) */
-#define AST_BASE_MMC		0x1E6E0000 /* SDRAM Controller (MMC) */
-#define AST_BASE_USB1		0x1E6E1000 /* USB1.1 Controller */
-#define AST_BASE_SCU		0x1E6E2000 /* System Control Unit (SCU) */
-#define AST_BASE_HACE		0x1E6E3000 /* Hash & Crypto Engine (HACE) */
-#define AST_BASE_JTAG		0x1E6E4000 /* JTAG Master */
-#define AST_BASE_CRT		0x1E6E6000 /* Graphics Display Controller (CRT) */
-#define AST_BASE_DMA		0x1E6E7000 /* X-DMA Controller */
-#define AST_BASE_MCTP		0x1E6E8000 /* MCTP Controller */
-#define AST_BASE_ADC		0x1E6E9000 /* ADC Voltage Monitor */
-#define AST_BASE_LPCPLUS	0x1E6EC000 /* LPC+ Controller */
-#define AST_BASE_VIDEO		0x1E700000 /* Video Engine */
-#define AST_BASE_SRAM		0x1E720000 /* 32KB SRAM */
-#define AST_BASE_SDIO		0x1E740000 /* SD/SDIO Controller */
-#define AST_BASE_2D		0x1E760000 /* 2D Engine */
-#define AST_BASE_GPIO		0x1E780000 /* GPIO Controller */
-#define AST_BASE_RTC		0x1E781000 /* Real-Time Clock (RTC) */
-#define AST_BASE_TIMER		0x1E782000 /* Timer #1 ∼ #8 Controller */
-#define AST_BASE_UART1		0x1E783000 /* UART - #1 (LPC UART1) */
-#define AST_BASE_UART5		0x1E784000 /* UART - #5 (BMC Debug) */
-#define AST_BASE_WDT		0x1E785000 /* Watchdog Timer (WDT) */
-#define AST_BASE_PWM		0x1E786000 /* PWM & Fan Tacho Controller */
-#define AST_BASE_VUART		0x1E787000 /* Virtual UART (VUART) */
-#define AST_BASE_PUART		0x1E788000 /* Pass Through UART (PUART) */
-#define AST_BASE_LPC		0x1E789000 /* LPC Controller */
-#define AST_BASE_I2C		0x1E78A000 /* I2C/SMBus Controller */
-#define AST_BASE_PECI		0x1E78B000 /* PECI Controller */
-#define AST_BASE_UART2		0x1E78D000 /* UART - #2 (LPC UART2) */
-#define AST_BASE_UART3		0x1E78E000 /* UART - #3 */
-#define AST_BASE_UART4		0x1E78F000 /* UART - #4 */
-
-/* Memory */
-#define AST_BASE_BMCSRAM	0x20000000 /* BMC Static Memory */
-#define AST_BASE_SPIMEM		0x30000000 /* SPI Flash Memory */
-#define AST_BASE_SDRAM		0x40000000 /* SDRAM */
-#define AST_BASE_LPCBRIDGE	0x60000000 /* AHB Bus to LPC Bus Bridge */
-#define AST_BASE_LPCPBRIDGE	0x70000000 /* AHB Bus to LPC+ Bus Bridge */
-
-/* BMC interrupt sources */
-#define AST_ID_SDRAM		0	/* SDRAM interrupt */
-#define AST_ID_MIC		1	/* MIC interrupt */
-#define AST_ID_MAC1		2	/* MAC1 interrupt */
-#define AST_ID_MAC2		3	/* MAC2 interrupt */
-#define AST_ID_CRYPTO		4	/* Crypto interrupt */
-#define AST_ID_USB2		5	/* USB 2.0 Hub/Host interrupt */
-#define AST_ID_XDMA		6	/* X-DMA interrupt */
-#define AST_ID_VIDEO		7	/* Video Engine interrupt */
-#define AST_ID_LPC		8	/* LPC interrupt */
-#define AST_ID_UART1		9	/* UART1 interrupt */
-#define AST_ID_UART5		10	/* UART5 interrupt */
-#define AST_ID_11		11	/* Reserved */
-#define AST_ID_I2C		12	/* I2C/SMBus interrupt */
-#define AST_ID_USB1HID		13	/* USB 1.1 HID interrupt */
-#define AST_ID_USB1HOST		14	/* USB 1.1 Host interrupt */
-#define AST_ID_PECI		15	/* PECI interrupt */
-#define AST_ID_TIMER1		16	/* Timer 1 interrupt */
-#define AST_ID_TIMER2		17	/* Timer 2 interrupt */
-#define AST_ID_TIMER3		18	/* Timer 3 interrupt */
-#define AST_ID_SMC		19	/* SMC interrupt */
-#define AST_ID_GPIO		20	/* GPIO interrupt */
-#define AST_ID_SCU		21	/* SCU interrupt */
-#define AST_ID_RTC		22	/* RTC alarm interrupt */
-#define AST_ID_23		23	/* Reserved */
-#define AST_ID_24		24	/* Reserved */
-#define AST_ID_GRAPHICS		25	/* Graphics CRT interrupt */
-#define AST_ID_SDIO		26	/* SD/SDIO interrupt */
-#define AST_ID_WDT		27	/* WDT alarm interrupt */
-#define AST_ID_PWM		28	/* PWM/Tachometer interrupt */
-#define AST_ID_2D		29	/* Graphics 2D interrupt */
-#define AST_ID_WAKEUP		30	/* System Wakeup Control */
-#define AST_ID_ADC		31	/* ADC interrupt */
-#define AST_ID_UART2		32	/* UART2 interrupt */
-#define AST_ID_UART3		33	/* UART3 interrupt */
-#define AST_ID_UART4		34	/* UART4 interrupt */
-#define AST_ID_TIMER4		35	/* Timer 4 interrupt */
-#define AST_ID_TIMER5		36	/* Timer 5 interrupt */
-#define AST_ID_TIMER6		37	/* Timer 6 interrupt */
-#define AST_ID_TIMER38		38	/* Timer 7 interrupt */
-#define AST_ID_TIMER39		39	/* Timer 8 interrupt */
-#define AST_ID_SGPIOMASTER	40	/* SGPIO Master interrupt */
-#define AST_ID_SGPIOSLAVE	41	/* SGPIO Slave interrupt */
-#define AST_ID_MCTP		42	/* MCTP interrupt */
-#define AST_ID_JTAG		43	/* JTAG Master interrupt */
-#define AST_ID_44		44	/* Reserved */
-#define AST_ID_COPRO		45	/* Coprocessor interrupt */
-#define AST_ID_MAILBOX		46	/* MailBox interrupt */
-#define AST_ID_GPIOL1		47	/* GPIOL1 direct input */
-#define AST_ID_GPIOL3		48	/* GPIOL3 direct input */
-#define AST_ID_GPIOM1		49	/* GPIOM1 direct input */
-#define AST_ID_GPIOM3		50	/* GPIOM3 direct input */
-
-#endif /*AST2400_H*/
-- 
2.7.1
