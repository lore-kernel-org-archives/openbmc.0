Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E49D91A03A1
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:48 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536786096574.4868881909275;
 Thu, 22 Oct 2015 10:59:46 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 3/3] watchdog/aspeed_wdt: Set system reset mode to 'full
 chip'
Date: Thu, 22 Oct 2015 12:59:39 -0500
Message-Id: <1445536779-14516-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445536779-14516-1-git-send-email-patches@stwcx.xyz>
References: <1445536779-14516-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:49 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Currently, the watchdog timer does nothing on expiry - the 'SoC system'
reset type doesn't seem to have any effect.

This change uses the 'full chip' reset type instead.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/watchdog/aspeed_wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 57503be..9b82420 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -37,6 +37,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define WDT_RELOAD_VALUE	0x04
 #define WDT_RESTART		0x08
 #define WDT_CTRL		0x0C
+#define   WDT_CTRL_RESET_MODE_FULL_CHIP	(0x01 << 5)
 #define   WDT_CTRL_RESET_SYSTEM		(0x1  << 1)
 #define   WDT_CTRL_ENABLE		(0x1  << 0)
 
@@ -44,7 +45,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 
 static void aspeed_wdt_enable(struct aspeed_wdt *wdt, int count)
 {
-	u32 ctrl = WDT_CTRL_RESET_SYSTEM | WDT_CTRL_ENABLE;
+	u32 ctrl = WDT_CTRL_RESET_MODE_FULL_CHIP | WDT_CTRL_RESET_SYSTEM |
+		WDT_CTRL_ENABLE;
 
 	writel(0, wdt->base + WDT_CTRL);
 	writel(count, wdt->base + WDT_RELOAD_VALUE);
-- 
2.6.0
