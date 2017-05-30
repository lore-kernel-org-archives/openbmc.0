Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wcY772f1fzDq9m
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 22:38:26 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 30 May 2017 15:38:22 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v4UCcMNx028534;
 Tue, 30 May 2017 15:38:22 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH linux dev-4.10 v4] ARM: aspeed: Add Mellanox MSN machine
 (aspeed arch)
Date: Tue, 30 May 2017 15:38:10 +0300
Message-Id: <20170530123810.102882-1-c_mykolak@mellanox.com>
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
X-List-Received-Date: Tue, 30 May 2017 12:38:28 -0000

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

v3->v4
Fixed issues pointed by Andrew:
- Fix comment.
- Fix UART1 reset disable sequence(read/modify/write).
---
 arch/arm/mach-aspeed/aspeed.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 0f1a536ba1b2..5c88286c96fd 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -188,6 +188,31 @@ static void __init do_lanyang_setup(void)
 	writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
 }
 
+static void __init do_mellanox_setup(void)
+{
+	unsigned long reg;
+
+	do_common_setup();
+
+	/* Set strapping for MAC1 to RMII/NCSI and MAC2 to RGMII. */
+	reg = readl(AST_IO(AST_BASE_SCU | 0x70));
+	reg |= BIT(7);
+	reg &= ~BIT(6);
+	writel(reg, AST_IO(AST_BASE_SCU | 0x70));
+
+	/* Disable default behavior of UART1 being held in reset by LPCRST#.
+	 * By releasing UART1 from being controlled by LPC reset, it becomes
+	 * immediately available regardless of the host being up. */
+	reg = readl(AST_IO(AST_BASE_LPC | 0x98));
+	/* Clear "Enable UART1 reset source from LPC" */
+	writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
+
+	/* Enable RMII1 50MHz RCLK output. */
+	reg = readl(AST_IO(AST_BASE_SCU | 0x48));
+	reg |= BIT(29);
+	writel(reg, AST_IO(AST_BASE_SCU | 0x48));
+}
+
 #define SCU_PASSWORD	0x1688A8A8
 
 static void __init aspeed_init_early(void)
@@ -227,6 +252,8 @@ static void __init aspeed_init_early(void)
 		do_romulus_setup();
 	if (of_machine_is_compatible("inventec,lanyang-bmc"))
 		do_lanyang_setup();
+	if (of_machine_is_compatible("mellanox,msn-bmc"))
+		do_mellanox_setup();
 }
 
 static void __init aspeed_map_io(void)
-- 
2.11.0
