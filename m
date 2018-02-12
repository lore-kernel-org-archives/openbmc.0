Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c01::244; helo=mail-pl0-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="s8FtFquf"; 
 dkim-atps=neutral
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgJ1M6fBRzF0q9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 07:58:44 +1100 (AEDT)
Received: by mail-pl0-x244.google.com with SMTP id f8so5547805plk.11
 for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2018 12:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=phpU1w3+7BvtI12jMUMt7A9gjem5ba3QWMHIPB+zZi8=;
 b=s8FtFqufmTPZ29D76ktKPhNafkBjpshCiATokQQAIVOM8ryFSHjAnR3SG2x8cAecp6
 riQPPWRTQHYHLSGFXwWQ82X8jFTT7CyHl1VN4V3uwW0uxH9kTNkXZw5Xq2C42Y85C/ZX
 Y2teFUd+dDQl09845czmWnfaeY8ClmWetOAj/iteUHQfqfejS/mGFIsPzZ1Nb3GsErYx
 GLYz4xXfzhque/RcnB2Yuua/m4TE8OyfSAOl5dhmtZfagSObUkyf7aw6dN9XOqeQGgW8
 89vxM26MYIq9XqPuPw7LM9IWUgTH866xPS1weFOjoPVTESRDfkjt7s8M374lGwe/+mXT
 RaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=phpU1w3+7BvtI12jMUMt7A9gjem5ba3QWMHIPB+zZi8=;
 b=OuAJLsfbxsLw/Kc7J0KG6c08VQs8DNK70Gmb+P9az2SN1T7P5V6vxgPHTgPU1HXls1
 8XUY19xcGxGAoNgH/iLe35/YoWv7UiUudnyw+tsce4OKzE9UCDBGMkaBRMFse+h0s3Ld
 vihuISERdtf5Z+HLc0IoS86ycHelTdyJPXQU/73P1SZ+kcaxhanXqkQBcK312kkXf9yf
 cys355TKn/gqPDR+hHYdjdTsaTQ/6zwxytpjKA28HbjA2IvMHnd9QjEJPjYkPxQM6KLg
 BMv9Pds/wgQCm+JaNvDr1sfvKuVtEVfJ74L/zhXsX72lsMKx5ocxOFz1fEBy4G3rAY85
 Kpeg==
X-Gm-Message-State: APf1xPBfBKIYSOok8FLKydi3M/YuptcEy+vcgWrB+0edr/oqXu6I/pTN
 zRgLNgjruQiq4mcrL0d0qO76Qw==
X-Google-Smtp-Source: AH8x224Q+2AoAM+BIyNvT9metYyLVwbTHaOwaYIG+KUO4cskXWopEwXHqka+p1rVWI57oHBw7uuq/A==
X-Received: by 2002:a17:902:bd01:: with SMTP id
 p1-v6mr12231216pls.172.1518469122398; 
 Mon, 12 Feb 2018 12:58:42 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id q13sm24629005pgp.76.2018.02.12.12.58.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 12 Feb 2018 12:58:41 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com,
 venture@google.com, yuenn@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 1/2] arm: npcm: add low-level debug support for NPCM7XX
Date: Mon, 12 Feb 2018 12:58:32 -0800
Message-Id: <20180212205833.151019-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.16.0.rc1.238.g530d649a79-goog
In-Reply-To: <20180212205833.151019-1-brendanhiggins@google.com>
References: <20180212205833.151019-1-brendanhiggins@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Feb 2018 20:58:49 -0000

Enable low-level debug support for Nuvoton NPCM7XX family by adding the
debug port definitions for the SoC.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 arch/arm/Kconfig.debug           | 11 +++++++++++
 arch/arm/include/debug/npcm7xx.S | 30 ++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 arch/arm/include/debug/npcm7xx.S

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 447629d89884..d8f925cb8872 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -595,6 +595,12 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  on Hilscher NetX based platforms.
 
+	config DEBUG_NPCM7XX_UART
+		bool "Kernel low-level debugging messages via Nuvoton NPCMx50 UART"
+		help
+		  Say Y here if you want kernel low-level debugging support
+		  on Nuvoton based platforms.
+
 	config DEBUG_NOMADIK_UART
 		bool "Kernel low-level debugging messages via NOMADIK UART"
 		depends on ARCH_NOMADIK
@@ -1444,6 +1450,7 @@ config DEBUG_LL_INCLUDE
 	default "debug/ks8695.S" if DEBUG_KS8695_UART
 	default "debug/msm.S" if DEBUG_QCOM_UARTDM
 	default "debug/netx.S" if DEBUG_NETX_UART
+	default "debug/npcm7xx.S" if DEBUG_NPCM7XX_UART
 	default "debug/omap2plus.S" if DEBUG_OMAP2PLUS_UART
 	default "debug/renesas-scif.S" if DEBUG_R7S72100_SCIF2
 	default "debug/renesas-scif.S" if DEBUG_RCAR_GEN1_SCIF0
@@ -1481,6 +1488,7 @@ config DEBUG_UART_8250
 config DEBUG_UART_PHYS
 	hex "Physical base address of debug UART"
 	default 0x00100a00 if DEBUG_NETX_UART
+	default 0xf0004000 if DEBUG_NPCM7XX_UART
 	default 0x01c20000 if DEBUG_DAVINCI_DMx_UART0
 	default 0x01c28000 if DEBUG_SUNXI_UART0
 	default 0x01c28400 if DEBUG_SUNXI_UART1
@@ -1589,6 +1597,7 @@ config DEBUG_UART_PHYS
 		DEBUG_LL_UART_EFM32 || \
 		DEBUG_UART_8250 || DEBUG_UART_PL01X || DEBUG_MESON_UARTAO || \
 		DEBUG_NETX_UART || \
+		DEBUG_NPCM7XX_UART || \
 		DEBUG_QCOM_UARTDM || DEBUG_R7S72100_SCIF2 || \
 		DEBUG_RCAR_GEN1_SCIF0 || DEBUG_RCAR_GEN1_SCIF2 || \
 		DEBUG_RCAR_GEN2_SCIF0 || DEBUG_RCAR_GEN2_SCIF2 || \
@@ -1605,6 +1614,7 @@ config DEBUG_UART_VIRT
 	default 0xc8821000 if DEBUG_RV1108_UART1
 	default 0xc8912000 if DEBUG_RV1108_UART0
 	default 0xe0000a00 if DEBUG_NETX_UART
+	default 0xf0001000 if DEBUG_NPCM7XX_UART
 	default 0xe0010fe0 if ARCH_RPC
 	default 0xf0000be0 if ARCH_EBSA110
 	default 0xf0010000 if DEBUG_ASM9260_UART
@@ -1695,6 +1705,7 @@ config DEBUG_UART_VIRT
 	depends on DEBUG_LL_UART_8250 || DEBUG_LL_UART_PL01X || \
 		DEBUG_UART_8250 || DEBUG_UART_PL01X || DEBUG_MESON_UARTAO || \
 		DEBUG_NETX_UART || \
+		DEBUG_NPCM7XX_UART || \
 		DEBUG_QCOM_UARTDM || DEBUG_S3C24XX_UART || \
 		DEBUG_S3C64XX_UART || \
 		DEBUG_BCM63XX_UART || DEBUG_ASM9260_UART || \
diff --git a/arch/arm/include/debug/npcm7xx.S b/arch/arm/include/debug/npcm7xx.S
new file mode 100644
index 000000000000..d08e14e73d79
--- /dev/null
+++ b/arch/arm/include/debug/npcm7xx.S
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2018 Google, Inc.
+// This is heavily based on arch/arm/include/debug/at91.S
+
+#define NPCM7XX_SR	(0x14)	/* Status Register */
+#define NPCM7XX_THR	(0x00)	/* Transmitter Holding Register */
+#define NPCM7XX_TXRDY	(1 << 6)	/* Transmitter Ready */
+#define NPCM7XX_TXEMPTY	(1 << 6)	/* Transmitter Empty */
+
+	.macro	addruart, rp, rv, tmp
+	ldr	\rp, =CONFIG_DEBUG_UART_PHYS	@ System peripherals (phys)
+	ldr	\rv, =CONFIG_DEBUG_UART_VIRT	@ System peripherals (virt)
+	.endm
+
+	.macro	senduart,rd,rx
+	strb	\rd, [\rx, #(NPCM7XX_THR)]	@ Write to Transmit Holding Reg
+	.endm
+
+	.macro	waituart,rd,rx
+1001:	ldr	\rd, [\rx, #(NPCM7XX_SR)]	@ Read Status Register
+	tst	\rd, #NPCM7XX_TXRDY		@ TXRDY = 1 when ready to tx
+	beq	1001b
+	.endm
+
+	.macro	busyuart,rd,rx
+1001:	ldr	\rd, [\rx, #(NPCM7XX_SR)]	@ Read Status Register
+	tst	\rd, #NPCM7XX_TXEMPTY		@ TXEMPTY = 1 when tx complete
+	beq	1001b
+	.endm
+
-- 
2.16.0.rc1.238.g530d649a79-goog
