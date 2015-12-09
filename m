Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 305C51A1045
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2015 18:40:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449646827275499.63682945674464;
 Tue, 8 Dec 2015 23:40:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <njames@us.ibm.com>,
	Norman James <nkskjames@gmail.com>
Subject: [PATCH linux] Temporary AST setup for Palmetto and Barreleye
Date: Wed,  9 Dec 2015 01:40:25 -0600
Message-Id: <1449646825-17436-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449646825-17436-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449646825-17436-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 09 Dec 2015 07:40:32 -0000

From: Norman James <njames@us.ibm.com>

Removed when pinmux driver is ready.

Signed-off-by: Norman James <nkskjames@gmail.com>
---
 arch/arm/mach-aspeed/aspeed.c | 77 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 70 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 7ec9141..65e0f1f 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -103,6 +103,71 @@ static void ast_host_uart_setup(unsigned int speed, unsigned int clock)
 	ast_uart_out(UART_FCR, 0x7);
 }
 
+static void __init do_common_setup(void)
+{
+	u32 reg;
+
+	/* Enable LPC FWH cycles, Enable LPC to AHB bridge */
+	writel(0x00000500, AST_IO(AST_BASE_LPC | 0x80));
+
+
+	/* Flash controller */
+	writel(0x00000003, AST_IO(AST_BASE_SPI | 0x00));
+	writel(0x00002404, AST_IO(AST_BASE_SPI | 0x04));
+
+	/* set UART routing */
+	writel(0x00000000, AST_IO(AST_BASE_LPC | 0x9c));
+
+	/* SCU setup */
+	writel(0x01C000FF, AST_IO(AST_BASE_SCU | 0x88));
+	writel(0xC1C000FF, AST_IO(AST_BASE_SCU | 0x8c));
+	writel(0x01C0007F, AST_IO(AST_BASE_SCU | 0x88));
+	writel(0x003FA009, AST_IO(AST_BASE_SCU | 0x90));
+	
+	/* setup scratch registers */
+	writel(0x00000042, AST_IO(AST_BASE_LPC | 0x170));
+	writel(0x00004000, AST_IO(AST_BASE_LPC | 0x174));
+}
+
+static void __init do_barreleye_setup(void)
+{
+	u32 reg;
+	do_common_setup();
+
+	/* Setup PNOR address mapping for 64M flash */
+	writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
+	writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
+
+	/* GPIO setup */
+	writel(0x9E82FCE7, AST_IO(AST_BASE_GPIO | 0x00));
+	writel(0x0370E677, AST_IO(AST_BASE_GPIO | 0x04));
+
+	/*
+	 * Do read/modify/write on power gpio
+	 * to prevent resetting power on reboot
+	*/
+	reg = readl(AST_IO(AST_BASE_GPIO | 0x20));
+	reg |= 0xCFC8F7FD;
+	writel(reg, AST_IO(AST_BASE_GPIO | 0x20));
+	writel(0xC738F20A, AST_IO(AST_BASE_GPIO | 0x24));
+	writel(0x0031FFAF, AST_IO(AST_BASE_GPIO | 0x80));
+}
+
+static void __init do_palmetto_setup(void)
+{
+	do_common_setup();
+
+	/* Setup PNOR address mapping for 32M flash */
+	writel(0x30000E00, AST_IO(AST_BASE_LPC | 0x88));
+	writel(0xFE0001FF, AST_IO(AST_BASE_LPC | 0x8C));
+
+	/* GPIO setup */
+	writel(0x13008CE7, AST_IO(AST_BASE_GPIO | 0x00));
+	writel(0x0370E677, AST_IO(AST_BASE_GPIO | 0x04));
+	writel(0xDF48F7FF, AST_IO(AST_BASE_GPIO | 0x20));
+	writel(0xC738F202, AST_IO(AST_BASE_GPIO | 0x24));
+}
+
 #define SCU_PASSWORD	0x1688A8A8
 
 static void __init aspeed_init_early(void)
@@ -127,13 +192,11 @@ static void __init aspeed_init_early(void)
 	writel(0, AST_IO(AST_BASE_WDT | 0x0c));
 	writel(0, AST_IO(AST_BASE_WDT | 0x2c));
 
-	/*
-	 * temporary: enable i2c usage of the shared GPIO/I2C pins for
-	 * i2c busses 4 - 8
-	 */
-	reg = readl(AST_IO(AST_BASE_SCU | 0x90));
-	reg |= 0x3E0000;
-	writel(reg, AST_IO(AST_BASE_SCU | 0x90));
+	if (of_machine_is_compatible("rackspace,barreleye-bmc"))
+		do_barreleye_setup();
+	if (of_machine_is_compatible("tyan,palmetto-bmc"))
+		do_palmetto_setup();
+
 }
 
 static void __init aspeed_map_io(void)
-- 
2.6.3
