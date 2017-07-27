Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ7Fm3hH6zDrHp
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 20:17:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rMkqUdb4"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lziSlsYH"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5B54520847;
 Thu, 27 Jul 2017 06:17:30 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 06:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=6S3Mkx
 TsEVOgdxrz4TWTOYiRVFozdS91j2/Z5owMFJo=; b=rMkqUdb4rm+pUePdzuxDIK
 3HJXyF0yH6W+NnpqS9p6MhfXBygO8x7ea6tYihtCfITgrMoFLtcV7ibyLddqlwBK
 kuFQtsj/LMgyFpSxvBOZAxPVfuYeuG3ZUcxgT6XJz1vqXUQQL/0xQHdVq+NtY87z
 FVbtyr2pxo3XOqWX8SoygmSd/ZdM0jaD4fNAYZMlUCLgh1Mh9aRA2jGL/EoamjXk
 Pw2LeZLEGX8igG7mPgXEo9TmNHmmwmoQxAtudBJIOJfAW/6OCs3ONIFi9VO8OCEi
 YiwZ6astJRuP/Ie2pY6Q0lSIpPhSsGKZGg/Nhnd5mvLMfkOfqUSVk+L7fYUZkegw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=6S3MkxTsEVOgdxrz4TWTOYiRVFozdS91j2/Z5owMF
 Jo=; b=lziSlsYHSaZ3hdDLtPKFI3inTkkmzJ/ky312LLBhyOKodtZ8CCDExCGiw
 R5roCNNf+YAERHCik2xEivKX+QCW/zCW3dVkbgU7spHZ19Mxou9QK7bpHiqdx81w
 wJeZQNRtYLJvjwmdTBnwTvW3caa44lExrbz2MWVSYkoOKBj/1/5bb6Iw0F/IGRNn
 5WiG3NUxLdDwlSpzl/KK0cmUaBzpbakkAeH0CK1dGE3qjHhgNf9nQRpdMlFsqpX2
 TJmNiXrGHiY+1VWniHI0vMiY99UD8dHog/z6o2syIXWRP/q3WLvpRuBReoJswKwk
 eAsnZILb65bU3LiVzUL/8JCnOaPGA==
X-ME-Sender: <xms:ur15WR7Hl_zh7sjplh5CJpDBWLt5Rmv-g1baXCMadwqwlSUwGGazCg>
X-Sasl-enc: 0Qx2fwWXtIJf3XAHTOP2DSu0eDeA0hNZsscR2dHgaNoj 1501150649
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0843E7E2DE;
 Thu, 27 Jul 2017 06:17:27 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, mspinler@linux.vnet.ibm.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v3 3/4] watchdog: aspeed: Support configuration
 of external signal properties
Date: Thu, 27 Jul 2017 19:46:46 +0930
Message-Id: <20170727101647.26960-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170727101647.26960-1-andrew@aj.id.au>
References: <20170727101647.26960-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Jul 2017 10:17:33 -0000

Add support for configuring the drive strength and polarity on the
AST2500, and the pulse duration on both the AST2400 and AST2500.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/watchdog/aspeed_wdt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index d29f75e90bb6..334e43f0164b 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -42,6 +42,14 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CTRL_WDT_INTR		BIT(2)
 #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
 #define   WDT_CTRL_ENABLE		BIT(0)
+#define WDT_RESET_WIDTH		0x18
+#define   WDT_RESET_WIDTH_ACTIVE_HIGH	BIT(31)
+#define     WDT_ACTIVE_HIGH_MAGIC	(0xA5 << 24)
+#define     WDT_ACTIVE_LOW_MAGIC	(0x5A << 24)
+#define   WDT_RESET_WIDTH_PUSH_PULL	BIT(30)
+#define     WDT_PUSH_PULL_MAGIC		(0xA8 << 24)
+#define     WDT_OPEN_DRAIN_MAGIC	(0x8A << 24)
+#define   WDT_RESET_WIDTH_DURATION	0xFFF
 
 #define WDT_RESTART_MAGIC	0x4755
 
@@ -152,6 +160,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct device_node *np;
 	const char *reset_type;
+	u32 duration;
 	int ret;
 
 	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
@@ -204,6 +213,39 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
+	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
+		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
+
+		reg &= WDT_RESET_WIDTH_DURATION;
+		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
+			reg |= WDT_PUSH_PULL_MAGIC;
+		else
+			reg |= WDT_OPEN_DRAIN_MAGIC;
+
+		writel(reg, wdt->base + WDT_RESET_WIDTH);
+
+		reg &= WDT_RESET_WIDTH_DURATION;
+		if (of_property_read_bool(np, "aspeed,ext-active-high"))
+			reg |= WDT_ACTIVE_HIGH_MAGIC;
+		else
+			reg |= WDT_ACTIVE_LOW_MAGIC;
+
+		writel(reg, wdt->base + WDT_RESET_WIDTH);
+	}
+
+	if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &duration)) {
+		if (duration > WDT_RESET_WIDTH_DURATION) {
+			dev_err(&pdev->dev, "Invalid reset width\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * The watchdog is always configured with a 1MHz source, so
+		 * there is no need to scale the microsecond value.
+		 */
+		writel(duration, wdt->base + WDT_RESET_WIDTH);
+	}
+
 	ret = watchdog_register_device(&wdt->wdd);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register\n");
-- 
2.11.0
