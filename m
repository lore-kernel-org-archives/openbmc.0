Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7AB571A064D
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:20:40 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1444998037221122.41128354339412;
 Fri, 16 Oct 2015 05:20:37 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/2] arm/mach-aspeed: Enable UART clock divisor
Date: Fri, 16 Oct 2015 07:20:33 -0500
Message-Id: <1444998034-17639-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444998034-17639-1-git-send-email-patches@stwcx.xyz>
References: <1444998034-17639-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 12:20:41 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Our .dts assumes that the UART clock is divided by 13, but different
u-boots may leave this bit in different states. Initialise it in
aspeed_early_init explicitly.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/mach-aspeed/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 64d379a..9d106b8 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -128,6 +128,8 @@ static void udbg_uart_putc(char c)
 
 static void __init aspeed_init_early(void)
 {
+	u32 reg;
+
 	// XXX UART stuff to fix to pinmux & co
 	printk("UART IO MUX...\n");
 	writel(0x02010023, AST_IO(AST_BASE_LPC | 0x9c));
@@ -137,6 +139,14 @@ static void __init aspeed_init_early(void)
 	writel(0xcb000000, AST_IO(AST_BASE_SCU | 0x80));
 	writel(0x00fff0c0, AST_IO(AST_BASE_SCU | 0x84));
 	writel(0x10CC5E80, AST_IO(AST_BASE_SCU | 0x0c));
+
+	/* We enable the UART clock divisor in the SCU's misc control
+	 * register, as the baud rates in aspeed.dtb all assume that the
+	 * divisor is active
+	 */
+	reg = readl(AST_IO(AST_BASE_SCU | 0x2c));
+	writel(reg | 0x00001000, AST_IO(AST_BASE_SCU | 0x2c));
+
 	printk("DONE, MUX=%08x %08x\n", readl(AST_IO(AST_BASE_SCU | 0x80)),
 	       readl(AST_IO(AST_BASE_SCU | 0x84)));
 	printk("CLOCK_CTRL=%08x\n", readl(AST_IO(AST_BASE_SCU)));
-- 
2.6.0
