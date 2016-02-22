Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AE62D1A063A
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 13:00:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456106428900364.5510023967263;
 Sun, 21 Feb 2016 18:00:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <njames@us.ibm.com>,
	Norman James <nkskjames@gmail.com>
Subject: [PATCH linux v2] Remove GPIO and LPC from WDT reset list
Date: Sun, 21 Feb 2016 20:00:27 -0600
Message-Id: <1456106427-1171-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456106427-1171-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456106427-1171-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 22 Feb 2016 02:00:39 -0000

From: Norman James <njames@us.ibm.com>

WDT reset mode must also be set to SOC mode.
These changes are required so host is not
interrupted when BMC is reboot.  This change
will keep the GPIO and LPC units from being
reset during an SOC reset.  The SOC reset is
used to perform a BMC reboot.

Signed-off-by: Norman James <nkskjames@gmail.com>
---
 arch/arm/mach-aspeed/aspeed.c | 5 +++--
 drivers/watchdog/aspeed_wdt.c | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 2feb161..6ebd6c0 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -191,9 +191,10 @@ static void __init aspeed_init_early(void)
 	writel(0, AST_IO(AST_BASE_WDT | 0x2c));
 
 	/*
-	 * ensure all IPs are reset on watchdog expiry
+	 * ensure all IPs except GPIO and LPC are reset on watchdog expiry
 	 */
-	writel(0x003ffff3, AST_IO(AST_BASE_SCU | 0x9C));
+	writel(0x001fdff3, AST_IO(AST_BASE_SCU | 0x9C));
+	//writel(0x003ffff3, AST_IO(AST_BASE_SCU | 0x9C));
 
 	/*
 	 * Temporary setup of AST registers until pinmux driver is complete
diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 07ae815..a1ea4c2 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -37,6 +37,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define WDT_RELOAD_VALUE	0x04
 #define WDT_RESTART		0x08
 #define WDT_CTRL		0x0C
+#define   WDT_CTRL_RESET_MODE_SOC	(0x00 << 5)
 #define   WDT_CTRL_RESET_MODE_FULL_CHIP	(0x01 << 5)
 #define   WDT_CTRL_RESET_SYSTEM		(0x1  << 1)
 #define   WDT_CTRL_ENABLE		(0x1  << 0)
@@ -45,7 +46,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 
 static void aspeed_wdt_enable(struct aspeed_wdt *wdt, int count)
 {
-	u32 ctrl = WDT_CTRL_RESET_MODE_FULL_CHIP | WDT_CTRL_RESET_SYSTEM |
+	u32 ctrl = WDT_CTRL_RESET_MODE_SOC | WDT_CTRL_RESET_SYSTEM |
 		WDT_CTRL_ENABLE;
 
 	writel(0, wdt->base + WDT_CTRL);
-- 
2.7.1
