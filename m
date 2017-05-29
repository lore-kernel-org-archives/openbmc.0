Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wbrgt6QxGzDq9m
 for <openbmc@lists.ozlabs.org>; Mon, 29 May 2017 19:15:54 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 29 May 2017 12:15:46 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v4T9Fk5g004422;
 Mon, 29 May 2017 12:15:46 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH linux dev-4.10 v3] ARM: aspeed: Add Mellanox MSN machine
 (aspeed arch)
Date: Mon, 29 May 2017 12:15:44 +0300
Message-Id: <20170529091544.54256-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Mon, 29 May 2017 09:15:59 -0000

Initial introduction of Mellanox switches of MSNXXXX family equipped
with Aspeed 2520 BMC SoC. This adds the platform early initialization.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
v1->v2
Fixed issues pointed out by Joel:
- Make commit title shorter.
- Replace flash layout from separate dtsi to dts.
- Change compatible = "mellanox,msnxxxx-bmc" to "mellanox,msn-bmc".
- Remove no-hw-checksum from dts.
- Add comments.
- Remove WD2 disable from aspeed.c
- Add wdt2 to dts.

v2->v3
- Split v2 patch into three separate.
---
 arch/arm/mach-aspeed/aspeed.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 0f1a536ba1b2..942cdffed9bd 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -188,6 +188,27 @@ static void __init do_lanyang_setup(void)
 	writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
+static void __init do_mellanox_setup(void)
+{
+	unsigned long reg;
+
+	do_common_setup();
+
+	/* Set strap to RGMII for dedicated PHY networking */
+	reg = readl(AST_IO(AST_BASE_SCU | 0x70));
+	reg |= BIT(7);
+	reg &= ~BIT(6);
+	writel(reg, AST_IO(AST_BASE_SCU | 0x70));
+
+	/* Disable UART1 Reset from LPC */
+	writel(0x00000A00, AST_IO(AST_BASE_LPC | 0x98));
+
+	/* Enable RMII1 50MHz RCLK output.*/
+	reg = readl(AST_IO(AST_BASE_SCU | 0x48));
+	reg |= BIT(29);
+	writel(reg, AST_IO(AST_BASE_SCU | 0x48));
+}
+
 #define SCU_PASSWORD	0x1688A8A8
 
 static void __init aspeed_init_early(void)
@@ -227,6 +248,8 @@ static void __init aspeed_init_early(void)
 		do_romulus_setup();
 	if (of_machine_is_compatible("inventec,lanyang-bmc"))
 		do_lanyang_setup();
+	if (of_machine_is_compatible("mellanox,msn-bmc"))
+		do_mellanox_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
2.11.0
