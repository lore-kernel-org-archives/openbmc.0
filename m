Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6C8831A03BB
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:48 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536784629391.222932829942;
 Thu, 22 Oct 2015 10:59:44 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/3] watchdog/aspeed_wdt: Move watchdog reset to a
 separate function
Date: Thu, 22 Oct 2015 12:59:38 -0500
Message-Id: <1445536779-14516-3-git-send-email-patches@stwcx.xyz>
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

We do the same reset procedure in apeed_wdt_enable and our reboot
notifier, so move these to a separate function.

Also, use a couple of definitions for the watchdog control value
rather than a hardcoded '3'.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/watchdog/aspeed_wdt.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index c4f6795..57503be 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -37,21 +37,27 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define WDT_RELOAD_VALUE	0x04
 #define WDT_RESTART		0x08
 #define WDT_CTRL		0x0C
+#define   WDT_CTRL_RESET_SYSTEM		(0x1  << 1)
+#define   WDT_CTRL_ENABLE		(0x1  << 0)
 
 #define	WDT_RESTART_MAGIC	0x4755
 
-static int aspeed_wdt_start(struct watchdog_device *wdd)
+static void aspeed_wdt_enable(struct aspeed_wdt *wdt, int count)
 {
-	struct aspeed_wdt *wdt = container_of(wdd, struct aspeed_wdt, wdd);
+	u32 ctrl = WDT_CTRL_RESET_SYSTEM | WDT_CTRL_ENABLE;
 
 	writel(0, wdt->base + WDT_CTRL);
-	writel(wdd->timeout * wdt->rate, wdt->base + WDT_RELOAD_VALUE);
+	writel(count, wdt->base + WDT_RELOAD_VALUE);
 	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
-	writel(3, wdt->base + WDT_CTRL);
+	writel(ctrl, wdt->base + WDT_CTRL);
+}
 
+static int aspeed_wdt_start(struct watchdog_device *wdd)
+{
+	struct aspeed_wdt *wdt = container_of(wdd, struct aspeed_wdt, wdd);
 	dev_dbg(wdd->dev, "starting with timeout of %d (rate %lu)\n",
 			  wdd->timeout, wdt->rate);
-
+	aspeed_wdt_enable(wdt, wdd->timeout * wdt->rate);
 	return 0;
 }
 
@@ -83,19 +89,15 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
 static int aspeed_wdt_restart(struct notifier_block *nb, unsigned long action,
 			      void *data)
 {
-	struct aspeed_wdt *wdt = container_of(nb, struct aspeed_wdt, restart_nb);
-	u32 timeout;
+	struct aspeed_wdt *wdt = container_of(nb,
+			struct aspeed_wdt, restart_nb);
 
 	/*
 	 * Trigger watchdog bite:
 	 *    Setup reload count to be 128ms, and enable WDT.
 	 */
-	timeout = 128 * wdt->rate / 1000;
+	aspeed_wdt_enable(wdt, 128 * wdt->rate / 1000);
 
-	writel(0, wdt->base + WDT_CTRL);
-	writel(timeout, wdt->base + WDT_RELOAD_VALUE);
-	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
-	writel(3, wdt->base + WDT_CTRL);
 	return NOTIFY_DONE;
 }
 
-- 
2.6.0
