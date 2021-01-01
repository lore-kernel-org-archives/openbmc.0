Return-Path: <SRS0=6QMd=GE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE960C433E0
	for <openbmc@archiver.kernel.org>; Fri,  1 Jan 2021 12:52:11 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36AEE22202
	for <openbmc@archiver.kernel.org>; Fri,  1 Jan 2021 12:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36AEE22202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D6lKP2GHNzDqNV
	for <openbmc@archiver.kernel.org>; Fri,  1 Jan 2021 23:52:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D6kxd3whpzDqJW
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jan 2021 23:35:00 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 101CNd4q027183;
 Fri, 1 Jan 2021 14:23:39 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 2D0F563A17; Fri,  1 Jan 2021 14:23:39 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v1 04/11] watchdog: npcm: Add DT restart
 priority and reset type support
Date: Fri,  1 Jan 2021 14:23:21 +0200
Message-Id: <20210101122328.43510-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210101122328.43510-1-tmaimon77@gmail.com>
References: <20210101122328.43510-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Add Device tree restart priority and
three reset types support.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 121 +++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 765577f11c8d..bbf27da34834 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -11,7 +11,24 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/watchdog.h>
-
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+/* NPCM7xx GCR module */
+#define NPCM7XX_RESSR_OFFSET		0x6C
+#define NPCM7XX_INTCR2_OFFSET		0x60
+
+#define NPCM7XX_PORST			BIT(31)
+#define NPCM7XX_CORST			BIT(30)
+#define NPCM7XX_WD0RST			BIT(29)
+#define NPCM7XX_WD1RST			BIT(24)
+#define NPCM7XX_WD2RST			BIT(23)
+#define NPCM7XX_SWR1RST			BIT(28)
+#define NPCM7XX_SWR2RST			BIT(27)
+#define NPCM7XX_SWR3RST			BIT(26)
+#define NPCM7XX_SWR4RST			BIT(25)
+
+ /* WD register */
 #define NPCM_WTCR	0x1C
 
 #define NPCM_WTCLK	(BIT(10) | BIT(11))	/* Clock divider */
@@ -43,6 +60,10 @@
 struct npcm_wdt {
 	struct watchdog_device  wdd;
 	void __iomem		*reg;
+	u32 			card_reset;
+	u32 			ext1_reset;
+	u32 			ext2_reset;
+
 };
 
 static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
@@ -176,14 +197,70 @@ static const struct watchdog_ops npcm_wdt_ops = {
 	.restart = npcm_wdt_restart,
 };
 
+static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev)
+{
+	struct regmap *gcr_regmap;
+	u32 rstval;
+
+	if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
+		gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+		if (IS_ERR(gcr_regmap)) {
+			dev_warn(dev, "Failed to find nuvoton,npcm750-gcr WD reset status not supported\n");
+		}
+
+		regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &rstval);
+		if (!rstval) {
+			regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &rstval);
+			rstval = ~rstval;
+		}
+
+		if(rstval & wdt->card_reset)
+			wdt->wdd.bootstatus |= WDIOF_CARDRESET;
+		if(rstval & wdt->ext1_reset)
+			wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+		if(rstval & wdt->ext2_reset)
+			wdt->wdd.bootstatus |= WDIOF_EXTERN2;
+	}
+
+}
+
+static u32 npcm_wdt_reset_type(const char *reset_type)
+{
+	if (!strcmp(reset_type, "porst"))
+		return NPCM7XX_PORST;
+	else if (!strcmp(reset_type, "corst"))
+		return NPCM7XX_CORST;
+	else if (!strcmp(reset_type, "wd0"))
+		return NPCM7XX_WD0RST;
+	else if (!strcmp(reset_type, "wd1"))
+		return NPCM7XX_WD1RST;
+	else if (!strcmp(reset_type, "wd2"))
+		return NPCM7XX_WD2RST;
+	else if (!strcmp(reset_type, "sw1"))
+		return NPCM7XX_SWR1RST;
+	else if (!strcmp(reset_type, "sw2"))
+		return NPCM7XX_SWR2RST;
+	else if (!strcmp(reset_type, "sw3"))
+		return NPCM7XX_SWR3RST;
+	else if (!strcmp(reset_type, "sw4"))
+		return NPCM7XX_SWR4RST;
+
+	return 0;
+}
+
 static int npcm_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const char *card_reset_type;
+	const char *ext1_reset_type;
+	const char *ext2_reset_type;
 	struct npcm_wdt *wdt;
+	struct resource *res;
+	u32 priority;
 	int irq;
 	int ret;
 
-	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
+	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
 		return -ENOMEM;
 
@@ -195,6 +272,45 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	if (of_property_read_u32(pdev->dev.of_node, "nuvoton,restart-priority", 
+				 &priority))
+		watchdog_set_restart_priority(&wdt->wdd, 128);
+	else
+		watchdog_set_restart_priority(&wdt->wdd, priority);
+
+	ret = of_property_read_string(pdev->dev.of_node,
+				      "nuvoton,card-reset-type",
+				      &card_reset_type);
+	if (ret)
+		wdt->card_reset = NPCM7XX_PORST;
+	else {
+		wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
+		if (!wdt->card_reset)
+			wdt->card_reset = NPCM7XX_PORST;
+	}
+
+	ret = of_property_read_string(pdev->dev.of_node,
+				      "nuvoton,ext1-reset-type",
+				      &ext1_reset_type);
+	if (ret)
+		wdt->ext1_reset = NPCM7XX_WD0RST;
+	else {
+		wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
+		if (!wdt->ext1_reset)
+			wdt->ext1_reset = NPCM7XX_WD0RST;
+	}
+
+	ret = of_property_read_string(pdev->dev.of_node,
+				      "nuvoton,ext2-reset-type",
+				      &ext2_reset_type);
+	if (ret)
+		wdt->ext2_reset = NPCM7XX_SWR1RST;
+	else {
+		wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
+		if (!wdt->ext2_reset)
+			wdt->ext2_reset = NPCM7XX_SWR1RST;
+	}
+
 	wdt->wdd.info = &npcm_wdt_info;
 	wdt->wdd.ops = &npcm_wdt_ops;
 	wdt->wdd.min_timeout = 1;
@@ -213,6 +329,7 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
+	npcm_get_reset_status(wdt, dev);
 	ret = devm_request_irq(dev, irq, npcm_wdt_interrupt, 0, "watchdog",
 			       wdt);
 	if (ret)
-- 
2.22.0

