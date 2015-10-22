Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B54871A03BE
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 04:59:45 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536782959675.5437005099631;
 Thu, 22 Oct 2015 10:59:42 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/3] watchdog/aspeed_wdt: Unify register names with the
 doc
Date: Thu, 22 Oct 2015 12:59:37 -0500
Message-Id: <1445536779-14516-2-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 17:59:46 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 drivers/watchdog/aspeed_wdt.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index e863424..c4f6795 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -33,20 +33,20 @@ static const struct of_device_id aspeed_wdt_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 
-#define WDT_STATUS	0x00
-#define WDT_BITE_COUNT	0x04
-#define WDT_RELOAD	0x08
-#define WDT_CTRL	0x0C
+#define WDT_STATUS		0x00
+#define WDT_RELOAD_VALUE	0x04
+#define WDT_RESTART		0x08
+#define WDT_CTRL		0x0C
 
-#define	WDT_RELOAD_MAGIC 0x4755
+#define	WDT_RESTART_MAGIC	0x4755
 
 static int aspeed_wdt_start(struct watchdog_device *wdd)
 {
 	struct aspeed_wdt *wdt = container_of(wdd, struct aspeed_wdt, wdd);
 
 	writel(0, wdt->base + WDT_CTRL);
-	writel(wdd->timeout * wdt->rate, wdt->base + WDT_BITE_COUNT);
-	writel(WDT_RELOAD_MAGIC, wdt->base + WDT_RELOAD);
+	writel(wdd->timeout * wdt->rate, wdt->base + WDT_RELOAD_VALUE);
+	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
 	writel(3, wdt->base + WDT_CTRL);
 
 	dev_dbg(wdd->dev, "starting with timeout of %d (rate %lu)\n",
@@ -68,7 +68,7 @@ static int aspeed_wdt_ping(struct watchdog_device *wdd)
 	struct aspeed_wdt *wdt = container_of(wdd, struct aspeed_wdt, wdd);
 
 	dev_dbg(wdd->dev, "ping\n");
-	writel(WDT_RELOAD_MAGIC, wdt->base + WDT_RELOAD);
+	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
 	return 0;
 }
 
@@ -88,13 +88,13 @@ static int aspeed_wdt_restart(struct notifier_block *nb, unsigned long action,
 
 	/*
 	 * Trigger watchdog bite:
-	 *    Setup BITE_TIME to be 128ms, and enable WDT.
+	 *    Setup reload count to be 128ms, and enable WDT.
 	 */
 	timeout = 128 * wdt->rate / 1000;
 
 	writel(0, wdt->base + WDT_CTRL);
-	writel(timeout, wdt->base + WDT_BITE_COUNT);
-	writel(WDT_RELOAD_MAGIC, wdt->base + WDT_RELOAD);
+	writel(timeout, wdt->base + WDT_RELOAD_VALUE);
+	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
 	writel(3, wdt->base + WDT_CTRL);
 	return NOTIFY_DONE;
 }
-- 
2.6.0
