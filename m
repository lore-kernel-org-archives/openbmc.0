Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jkRdlu7K"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Q03Uncxe"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Z4Q01GrFzDqmj
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jul 2018 00:59:04 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CF91221751;
 Mon, 23 Jul 2018 10:59:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 23 Jul 2018 10:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=i9kTY6nRtqr7KQKJl
 +ZgmWsfEZ3CryzP0Hh+K8B7/e0=; b=jkRdlu7KrPHFBactlUNlUv2KBF8NYRcTq
 cZs+XErVXJZzUr1f4oyRnYqoJxx67TUXd+z5syFImlU0oPUCIW/nFiTXBVuYZSpl
 dP4n1jlJamGqy5QdDvSX/rrYDuRZwJeoBnMa0CmGUxbZUsHy77SB8ADP7JhlLsoK
 piaROsvsV+19vBINXrIELowBMTe6yIH7vbgF+Z5niYWcGebk1bb7LEizci1SMJ4R
 pPhe7Dj5lsvzXwRRAwgQIQVAlFJoNcrZ3VmHDlT1NWXHxLVvp1ZDGVYSxa4nxzZH
 vHy3mCXAJcDYJFu6Dg8fsE32EkmCZo5C5G2o13bLq0WwHL3WqpRPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=i9kTY6nRtqr7KQKJl+ZgmWsfEZ3CryzP0Hh+K8B7/e0=; b=Q03Uncxe
 zwBN/qSmt/VC9Vyv1Zb1UVjXa0QfKjQZiSdAntEmKDvztggo/yEoHvBwGYYMZlX2
 4v9zYIJ4Xg3i7DkQ1p4zy/Wqi1q6AfjVkNAOHOyrjfO5yW04K9gy/r1eiQP+apgc
 WzOchZncLyLobA7NaCWAL3/iqkw3WL58Da8cyZ061PPex5/Rs2kKDs0KvB3miZfE
 tVeHTvFf5n5XXOUgKIiqwS0hvlco7Zo0ysPmd6EkSQpQRjs3eRAl6WqQ8WZwrlm6
 KyyHkJYYigvcZwerVjHVueFiDn4hD21xHyK+8DUPUp1ryiXrrU5bOndGvprKFTpw
 r949CYu+YsOoZw==
X-ME-Proxy: <xmx:Ne1VW-oQ4vyStJLtss7aJTeKuBB50JJbQcIf6GuZf-_JN7d5KnFRqw>
 <xmx:Ne1VW2VSuCh5tC4BZe74p8gstAMljUm1zgaQtmF4vKIxQyPTTPO1qA>
 <xmx:Ne1VWygU_3oR2eiykfYpoeXTMqIk2Y-QdXvqN5UGL1Dpm3WM72Ts3A>
 <xmx:Ne1VW1-jmN9HWytLllFIc2ca5IS8brv6uTIU_NtMZrW0Tte_0YS2bw>
 <xmx:Ne1VWyQ-IbFFJI167KOLlmTXkZTMA_9JBNvWvyx0VCSp5KpQZUsHlQ>
 <xmx:Ne1VW3pPLDNNsJB9mmtTVjFvCRL67JIeWQX4tYW_LedeBW4ejqLxwg>
X-ME-Sender: <xms:Ne1VW4gXPk_yHtpjY9Da7d-G-Zm25YWB70W7Sfbo6ARAj7QEXkBXVA>
Received: from localhost.localdomain
 (ppp118-210-173-37.bras2.adl6.internode.on.net [118.210.173.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 02ACEE4445;
 Mon, 23 Jul 2018 10:58:59 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 4/4] aspeed: Disable unnecessary features
Date: Tue, 24 Jul 2018 00:28:40 +0930
Message-Id: <20180723145840.17856-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180723145840.17856-1-andrew@aj.id.au>
References: <20180723145840.17856-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2018 14:59:04 -0000

Adjust board_init() to disable hardware features that we don't need
available during normal BMC operation.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/include/asm/arch-aspeed/regs-lpc.h  | 29 +++++++++++++++
 arch/arm/include/asm/arch-aspeed/regs-scu.h  |  8 +++-
 arch/arm/include/asm/arch-aspeed/regs-sdmc.h |  4 ++
 board/aspeed/ast-g4/ast-g4.c                 | 33 ++++++++++++++++-
 board/aspeed/ast-g5/ast-g5.c                 | 39 +++++++++++++++++++-
 5 files changed, 110 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-aspeed/regs-lpc.h

diff --git a/arch/arm/include/asm/arch-aspeed/regs-lpc.h b/arch/arm/include/asm/arch-aspeed/regs-lpc.h
new file mode 100644
index 000000000000..b0162ae4f37c
--- /dev/null
+++ b/arch/arm/include/asm/arch-aspeed/regs-lpc.h
@@ -0,0 +1,29 @@
+/* arch/arm/mach-aspeed/include/mach/regs-sdmc.h
+ *
+ * Copyright (C) 2018  IBM Corp
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ *   History      :
+ *    1. 2018/07/23 Andrew Jeffery Create
+ *
+ ******************************************************************************/
+#ifndef __AST_REGS_LPC_H
+#define __AST_REGS_LPC_H
+
+/*
+ *  Register for LPC
+ */
+
+#define AST_LPC_HICR5		0x80
+#define AST_LPC_HICRB		0x100
+
+/*	AST_LPC_HICR5 : 0x80	Host Interface Control Register 5 */
+#define LPC_HICR5_ENFWH		(0x1 << 10)
+
+/*	AST_LPC_HICRB : 0x100	Host Interface Control Register B */
+#define LPC_HICRB_ILPC2AHB	(0x1 << 6)
+
+#endif
diff --git a/arch/arm/include/asm/arch-aspeed/regs-scu.h b/arch/arm/include/asm/arch-aspeed/regs-scu.h
index b714fa92341d..c9b91795d1aa 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-scu.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-scu.h
@@ -466,6 +466,7 @@
 #define SCU_MISC_JTAG__M_TO_PCIE_EN	(0x1 << 14)
 #define SCU_MISC_VUART_TO_CTRL		(0x1 << 13)
 #define SCU_MISC_DIV13_EN		(0x1 << 12)
+#define SCU_MISC_DEBUG_UART             (0x1 << 10)
 #define SCU_MISC_Y_CLK_INVERT		(0x1 << 11)
 #define SCU_MISC_OUT_DELAY		(0x1 << 9)
 #define SCU_MISC_PCI_TO_AHB_DIS		(0x1 << 8)
@@ -548,6 +549,7 @@
 /* AST_SCU_VGA_SCRATCH7			0x6c - VGA Scratch register */
 
 /* AST_SCU_HW_STRAP1			0x70 - hardware strapping register */
+#define SCU_HW_STRAP_LPC_DEC_SUPER_IO	(0x1 << 20)
 #ifdef AST_SOC_G5
 
 #define CLK_25M_IN			(0x1 << 23)
@@ -593,7 +595,6 @@
 
 #define SCU_HW_STRAP_GPIOE_PT_EN	(0x1 << 22)
 #define SCU_HW_STRAP_GPIOD_PT_EN	(0x1 << 21)
-#define SCU_HW_STRAP_LPC_DEC_SUPER_IO	(0x1 << 20)
 #define SCU_HW_STRAP_ACPI_DIS		(0x1 << 19)
 
 /* bit 23, 18 [1,0] */
@@ -940,6 +941,11 @@
 
 /* AST_SCU_UART24_REF			0x160 - Generate UART 24Mhz Ref from H-PLL when CLKIN is 25Mhz */
 /* AST_SCU_PCIE_CONFIG_SET		0x180 - PCI-E Configuration Setting Control Register */
+#define SCU_PCIE_CONFIG_SET_BMC_DMA     (0x1 << 14)
+#define SCU_PCIE_CONFIG_SET_BMC_MMIO    (0x1 << 9)
+#define SCU_PCIE_CONFIG_SET_BMC_EN      (0x1 << 8)
+#define SCU_PCIE_CONFIG_SET_VGA_MMIO    (0x1 << 1)
+
 /* AST_SCU_BMC_MMIO_DEC			0x184 - BMC MMIO Decode Setting Register */
 /* AST_SCU_DEC_AREA1			0x188 - 1st relocated controller decode area location */
 /* AST_SCU_DEC_AREA2			0x18C - 2nd relocated controller decode area location */
diff --git a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
index 2cc26d29aa9e..3b516ecccdde 100644
--- a/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
+++ b/arch/arm/include/asm/arch-aspeed/regs-sdmc.h
@@ -18,6 +18,7 @@
  */
 #define AST_SDMC_PROTECT	0x00		/* protection key register */
 #define AST_SDMC_CONFIG		0x04		/* Configuration register */
+#define AST_SDMC_GFX_PROT	0x08		/* Graphics protection register */
 
 /*	AST_SDMC_PROTECT: 0x00  - protection key register */
 #define SDMC_PROTECT_UNLOCK			0xFC600309
@@ -29,4 +30,7 @@
 #define SDMC_CONFIG_CACHE_EN		(0x1 << 10)
 #define SDMC_CONFIG_EEC_EN		(0x1 << 7)
 
+/*	AST_SDMC_GFX_PROT : 0x08 - Graphics protection register */
+#define SDMC_GFX_PROT_XDMA	(0x1 << 16)
+
 #endif
diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
index 656495307b03..eda087fa5c17 100644
--- a/board/aspeed/ast-g4/ast-g4.c
+++ b/board/aspeed/ast-g4/ast-g4.c
@@ -1,6 +1,6 @@
 /*
  * (C) Copyright 2002 Ryan Chen
- * Copyright 2016 IBM Corporation
+ * Copyright 2016,2018 IBM Corporation
  *
  * SPDX-License-Identifier:     GPL-2.0+
  */
@@ -12,13 +12,44 @@
 #include <asm/arch/ast-sdmc.h>
 #include <asm/arch/ast_scu.h>
 #include <asm/arch/regs-ahbc.h>
+#include <asm/arch/regs-lpc.h>
 #include <asm/arch/regs-scu.h>
+#include <asm/arch/regs-sdmc.h>
 #include <asm/io.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
 int board_init(void)
 {
+	u32 val;
+
+	/* iLPC2AHB */
+	val = readl(AST_SCU_BASE + AST_SCU_HW_STRAP1);
+	val |= SCU_HW_STRAP_LPC_DEC_SUPER_IO;
+	writel(val, AST_SCU_BASE + AST_SCU_HW_STRAP1);
+
+	val = readl(AST_LPC_BASE + AST_LPC_HICRB);
+	val |= LPC_HICRB_ILPC2AHB;
+	writel(val, AST_LPC_BASE + AST_LPC_HICRB);
+
+	/* P2A, PCIe BMC */
+	val = readl(AST_SCU_BASE + AST_SCU_PCIE_CONFIG_SET);
+	val &= ~(SCU_PCIE_CONFIG_SET_BMC_DMA
+			| SCU_PCIE_CONFIG_SET_BMC_MMIO
+			| SCU_PCIE_CONFIG_SET_BMC_EN
+			| SCU_PCIE_CONFIG_SET_VGA_MMIO);
+	writel(val, AST_SCU_BASE + AST_SCU_PCIE_CONFIG_SET);
+
+	/* X-DMA */
+	val = readl(AST_SDMC_BASE + AST_SDMC_GFX_PROT);
+	val |= SDMC_GFX_PROT_XDMA;
+	writel(val, AST_SDMC_BASE + AST_SDMC_GFX_PROT);
+
+	/* LPC2AHB */
+	val = readl(AST_LPC_BASE + AST_LPC_HICR5);
+	val &= ~LPC_HICR5_ENFWH;
+	writel(val, AST_LPC_BASE + AST_LPC_HICR5);
+
 	/* address of boot parameters */
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
 	gd->flags = 0;
diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
index e67a4bf8b2b4..e8827524e3b2 100644
--- a/board/aspeed/ast-g5/ast-g5.c
+++ b/board/aspeed/ast-g5/ast-g5.c
@@ -1,5 +1,5 @@
 /*
- * Copyright 2016 IBM Corporation
+ * Copyright 2016,2018 IBM Corporation
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
@@ -12,12 +12,49 @@
 
 #include <asm/arch/ast_scu.h>
 #include <asm/arch/ast-sdmc.h>
+#include <asm/arch/regs-lpc.h>
+#include <asm/arch/regs-scu.h>
+#include <asm/arch/regs-sdmc.h>
 #include <asm/io.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
 int board_init(void)
 {
+	u32 val;
+
+	/* iLPC2AHB */
+	val = readl(AST_SCU_BASE + AST_SCU_HW_STRAP1);
+	val |= SCU_HW_STRAP_LPC_DEC_SUPER_IO;
+	writel(val, AST_SCU_BASE + AST_SCU_HW_STRAP1);
+
+	val = readl(AST_LPC_BASE + AST_LPC_HICRB);
+	val |= LPC_HICRB_ILPC2AHB;
+	writel(val, AST_LPC_BASE + AST_LPC_HICRB);
+
+	/* P2A, PCIe BMC */
+	val = readl(AST_SCU_BASE + AST_SCU_PCIE_CONFIG_SET);
+	val &= ~(SCU_PCIE_CONFIG_SET_BMC_DMA
+			| SCU_PCIE_CONFIG_SET_BMC_MMIO
+			| SCU_PCIE_CONFIG_SET_BMC_EN
+			| SCU_PCIE_CONFIG_SET_VGA_MMIO);
+	writel(val, AST_SCU_BASE + AST_SCU_PCIE_CONFIG_SET);
+
+	/* Debug UART */
+	val = readl(AST_SCU_BASE + AST_SCU_MISC1_CTRL);
+	val |= SCU_MISC_DEBUG_UART;
+	writel(val, AST_SCU_BASE + AST_SCU_MISC1_CTRL);
+
+	/* X-DMA */
+	val = readl(AST_SDMC_BASE + AST_SDMC_GFX_PROT);
+	val |= SDMC_GFX_PROT_XDMA;
+	writel(val, AST_SDMC_BASE + AST_SDMC_GFX_PROT);
+
+	/* LPC2AHB */
+	val = readl(AST_LPC_BASE + AST_LPC_HICR5);
+	val &= ~LPC_HICR5_ENFWH;
+	writel(val, AST_LPC_BASE + AST_LPC_HICR5);
+
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
 	gd->flags = 0;
 
-- 
2.17.1
