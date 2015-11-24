Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 716C01A009B
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 15:30:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448339424815417.0673422834701;
 Mon, 23 Nov 2015 20:30:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] arm/mach-aspeed: Remove UART prints & early_init printks
Date: Mon, 23 Nov 2015 23:30:23 -0500
Message-Id: <1448339423-15983-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448339423-15983-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448339423-15983-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 Nov 2015 04:30:30 -0000

From: Jeremy Kerr <jk@ozlabs.org>

These were useful for bringup, but we don't need them currently. This
allows us to remove most of the udbg code, and rename it to something
non-powerpc-specific.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/mach-aspeed/aspeed.c | 57 +++++++++----------------------------------
 1 file changed, 12 insertions(+), 45 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index ae4b5a0..7ec9141 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -72,17 +72,12 @@ static struct map_desc aspeed_io_desc[] __initdata __maybe_unused = {
 
 #define LCR_DLAB 0x80
 
-static void udbg_uart_out(unsigned int reg, u8 data)
+static void ast_uart_out(unsigned int reg, u8 data)
 {
 	writeb(data, AST_IO(0x1E78F000 + reg * 4));
 }
 
-static u8 udbg_uart_in(unsigned int reg)
-{
-	return readb(AST_IO(0x1E78F000 + reg * 4)) & 0xff;
-}
-
-static void udbg_uart_setup(unsigned int speed, unsigned int clock)
+static void ast_host_uart_setup(unsigned int speed, unsigned int clock)
 {
 	unsigned int dll, base_bauds;
 
@@ -94,34 +89,18 @@ static void udbg_uart_setup(unsigned int speed, unsigned int clock)
 	base_bauds = clock / 16;
 	dll = base_bauds / speed;
 
-	printk("DLL=%d\n", dll);
-	udbg_uart_out(UART_LCR, 0x00);
-	udbg_uart_out(UART_IER, 0xff);
-	udbg_uart_out(UART_IER, 0x00);
-	udbg_uart_out(UART_LCR, LCR_DLAB);
-	udbg_uart_out(UART_DLL, dll & 0xff);
-	udbg_uart_out(UART_DLM, dll >> 8);
+	ast_uart_out(UART_LCR, 0x00);
+	ast_uart_out(UART_IER, 0xff);
+	ast_uart_out(UART_IER, 0x00);
+	ast_uart_out(UART_LCR, LCR_DLAB);
+	ast_uart_out(UART_DLL, dll & 0xff);
+	ast_uart_out(UART_DLM, dll >> 8);
 	/* 8 data, 1 stop, no parity */
-	udbg_uart_out(UART_LCR, 0x3);
+	ast_uart_out(UART_LCR, 0x3);
 	/* RTS/DTR */
-	udbg_uart_out(UART_MCR, 0x3);
+	ast_uart_out(UART_MCR, 0x3);
 	/* Clear & enable FIFOs */
-	udbg_uart_out(UART_FCR, 0x7);
-}
-
-static void udbg_uart_flush(void)
-{
-	/* wait for idle */
-	while ((udbg_uart_in(UART_LSR) & LSR_THRE) == 0)
-		;
-}
-
-static void udbg_uart_putc(char c)
-{
-	if (c == '\n')
-		udbg_uart_putc('\r');
-	udbg_uart_flush();
-	udbg_uart_out(UART_THR, c);
+	ast_uart_out(UART_FCR, 0x7);
 }
 
 #define SCU_PASSWORD	0x1688A8A8
@@ -131,11 +110,8 @@ static void __init aspeed_init_early(void)
 	u32 reg;
 
 	// XXX UART stuff to fix to pinmux & co
-	printk("UART IO MUX...\n");
 	writel(0x02010023, AST_IO(AST_BASE_LPC | 0x9c));
-	printk("UART PIN MUX...\n");
 	writel(SCU_PASSWORD, AST_IO(AST_BASE_SCU)); // UNLOCK SCU
-	printk("SCU LOCK: %08x\n", readl(AST_IO(AST_BASE_SCU)));
 	writel(0xcb000000, AST_IO(AST_BASE_SCU | 0x80));
 	writel(0x00fff0c0, AST_IO(AST_BASE_SCU | 0x84));
 	writel(0x10CC5E80, AST_IO(AST_BASE_SCU | 0x0c));
@@ -146,19 +122,10 @@ static void __init aspeed_init_early(void)
 	 */
 	reg = readl(AST_IO(AST_BASE_SCU | 0x2c));
 	writel(reg | 0x00001000, AST_IO(AST_BASE_SCU | 0x2c));
+	ast_host_uart_setup(115200,0);
 
-	printk("DONE, MUX=%08x %08x\n", readl(AST_IO(AST_BASE_SCU | 0x80)),
-	       readl(AST_IO(AST_BASE_SCU | 0x84)));
-	printk("CLOCK_CTRL=%08x\n", readl(AST_IO(AST_BASE_SCU)));
-	printk("WDT0C=%08x\n", readl(AST_IO(AST_BASE_WDT | 0x0c)));
 	writel(0, AST_IO(AST_BASE_WDT | 0x0c));
-	printk("WDT2C=%08x\n", readl(AST_IO(AST_BASE_WDT | 0x2c)));
 	writel(0, AST_IO(AST_BASE_WDT | 0x2c));
-	udbg_uart_setup(115200,0);
-	udbg_uart_putc('F');
-	udbg_uart_putc('O');
-	udbg_uart_putc('O');
-	udbg_uart_putc('\n');
 
 	/*
 	 * temporary: enable i2c usage of the shared GPIO/I2C pins for
-- 
2.6.3
