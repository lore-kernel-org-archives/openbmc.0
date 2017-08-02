Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMgcn0WxvzDrJv;
 Wed,  2 Aug 2017 14:46:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="cSxdHQNz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LrYcefno"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F7B220881;
 Wed,  2 Aug 2017 00:46:15 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 02 Aug 2017 00:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=yYiX5F
 zzLh1Vco+52M4hreh/STCE3eXbITZi+hX952w=; b=cSxdHQNziLGD1kjl5q8B3G
 24W5beg7KkQcqAH+wBMsAOtu9uYESL+Lm/ZpCfkqOOrIWVLwxvRzU95pc6bur23i
 fDd8YBLQnIJZmqTlzAg38InvhKookGH6MrMAH3VBBaJdm6hgosS5IcgWeLngKV5x
 aiAFU85yHN3xOuwxQv65AHiueVpu6p6jSGx+B02YU0oLnO0XD5SdGgozChx5siRJ
 VEJtMa48Cuy0VoLGV3n9/O65pdN9AsjP4MD7qHXZzeWSwElHwRXbFmM2msL3SEfR
 euivGQgkTs1hnO9O7kwxEMYP1HAg1L8PFGSI4OPFuH5MYgWzkyu1yHvScb5mQVgw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=yYiX5FzzLh1Vco+52M4hreh/STCE3eXbITZi+hX95
 2w=; b=LrYcefno+JIROvAr4vZ+NZ5aRKE1FQOdM1+smfg5HcBa5seV2pBjohZmR
 U0bACigDJcX6DzeYAsb7OG7g5oU/gOlVwtcX2BB9xW/cEc5qsX1KtQiDvdSYz84y
 81svLJE5CeKNKTzwKS6RYhRZyPC9NxJyexcGYDD/3wSg+SeaSsh0i2xcUrPamkqB
 4opAAcMB+/St0zLnQ15oYAxIxV7uTV4ykImZXociaI7yXL//whPshNZA0zZ3izdl
 pGtbR+Mf7Ty6IueVK0UffsXeKDliaF934LiY2Uh8DIOSrZekFk91uW20w3TzE5su
 ZjD7dnbsZoK7hObYb1297Fi7BIGKA==
X-ME-Sender: <xms:FlmBWWlEOMeix4-ihvQwbdkKW4OkyYTdnBgtu2OW-jx060gCqMsJ4w>
X-Sasl-enc: iaoKN00pOmbpz5fZrXRk/sbvDir0LQX3sbP1a9y03/s2 1501649174
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC465241D9;
 Wed,  2 Aug 2017 00:46:10 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-watchdog@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, wim@iguana.be, linux@roeck-us.net,
 robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] watchdog: aspeed: Support configuration of external
 signal properties
Date: Wed,  2 Aug 2017 14:15:29 +0930
Message-Id: <20170802044529.30032-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170802044529.30032-1-andrew@aj.id.au>
References: <20170802044529.30032-1-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 02 Aug 2017 04:46:17 -0000

Add support for configuring the drive strength and polarity on the
AST2500, and the pulse duration on both the AST2400 and AST2500.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Matt Spinler <mspinler@linux.vnet.ibm.com>
---
 drivers/watchdog/aspeed_wdt.c | 105 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 102 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index c707ab647922..79cc766cd30f 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -23,9 +23,21 @@ struct aspeed_wdt {
 	u32			ctrl;
 };
 
+struct aspeed_wdt_config {
+	u32 ext_pulse_width_mask;
+};
+
+static const struct aspeed_wdt_config ast2400_config = {
+	.ext_pulse_width_mask = 0xff,
+};
+
+static const struct aspeed_wdt_config ast2500_config = {
+	.ext_pulse_width_mask = 0xfffff,
+};
+
 static const struct of_device_id aspeed_wdt_of_table[] = {
-	{ .compatible = "aspeed,ast2400-wdt" },
-	{ .compatible = "aspeed,ast2500-wdt" },
+	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
+	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
@@ -43,6 +55,38 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
 #define   WDT_CTRL_ENABLE		BIT(0)
 
+/*
+ * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
+ * enabled), specifically:
+ *
+ * * Pulse duration
+ * * Drive mode: push-pull vs open-drain
+ * * Polarity: Active high or active low
+ *
+ * Pulse duration configuration is available on both the AST2400 and AST2500,
+ * though the field changes between SoCs:
+ *
+ * AST2400: Bits 7:0
+ * AST2500: Bits 19:0
+ *
+ * This difference is captured in struct aspeed_wdt_config.
+ *
+ * The AST2500 exposes the drive mode and polarity options, but not in a
+ * regular fashion. For read purposes, bit 31 represents active high or low,
+ * and bit 30 represents push-pull or open-drain. With respect to write, magic
+ * values need to be written to the top byte to change the state of the drive
+ * mode and polarity bits. Any other value written to the top byte has no
+ * effect on the state of the drive mode or polarity bits. However, the pulse
+ * width value must be preserved (as desired) if written.
+ */
+#define WDT_RESET_WIDTH		0x18
+#define   WDT_RESET_WIDTH_ACTIVE_HIGH	BIT(31)
+#define     WDT_ACTIVE_HIGH_MAGIC	(0xA5 << 24)
+#define     WDT_ACTIVE_LOW_MAGIC	(0x5A << 24)
+#define   WDT_RESET_WIDTH_PUSH_PULL	BIT(30)
+#define     WDT_PUSH_PULL_MAGIC		(0xA8 << 24)
+#define     WDT_OPEN_DRAIN_MAGIC	(0x8A << 24)
+
 #define WDT_RESTART_MAGIC	0x4755
 
 /* 32 bits at 1MHz, in milliseconds */
@@ -139,10 +183,13 @@ static const struct watchdog_info aspeed_wdt_info = {
 
 static int aspeed_wdt_probe(struct platform_device *pdev)
 {
+	const struct aspeed_wdt_config *config;
+	const struct of_device_id *ofdid;
 	struct aspeed_wdt *wdt;
 	struct resource *res;
 	struct device_node *np;
 	const char *reset_type;
+	u32 duration;
 	int ret;
 
 	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
@@ -167,13 +214,19 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.timeout = WDT_DEFAULT_TIMEOUT;
 	watchdog_init_timeout(&wdt->wdd, 0, &pdev->dev);
 
+	np = pdev->dev.of_node;
+
+	ofdid = of_match_node(aspeed_wdt_of_table, np);
+	if (!ofdid)
+		return -EINVAL;
+	config = ofdid->data;
+
 	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
 
 	/*
 	 * Control reset on a per-device basis to ensure the
 	 * host is not affected by a BMC reboot
 	 */
-	np = pdev->dev.of_node;
 	ret = of_property_read_string(np, "aspeed,reset-type", &reset_type);
 	if (ret) {
 		wdt->ctrl |= WDT_CTRL_RESET_MODE_SOC | WDT_CTRL_RESET_SYSTEM;
@@ -197,6 +250,52 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
+	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
+		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
+
+		reg &= config->ext_pulse_width_mask;
+		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
+			reg |= WDT_PUSH_PULL_MAGIC;
+		else
+			reg |= WDT_OPEN_DRAIN_MAGIC;
+
+		writel(reg, wdt->base + WDT_RESET_WIDTH);
+
+		reg &= config->ext_pulse_width_mask;
+		if (of_property_read_bool(np, "aspeed,ext-active-high"))
+			reg |= WDT_ACTIVE_HIGH_MAGIC;
+		else
+			reg |= WDT_ACTIVE_LOW_MAGIC;
+
+		writel(reg, wdt->base + WDT_RESET_WIDTH);
+	}
+
+	if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &duration)) {
+		u32 max_duration = config->ext_pulse_width_mask + 1;
+
+		if (duration == 0 || duration > max_duration) {
+			dev_err(&pdev->dev, "Invalid pulse duration: %uus\n",
+					duration);
+			duration = max(1U, min(max_duration, duration));
+			dev_info(&pdev->dev, "Pulse duration set to %uus\n",
+					duration);
+		}
+
+		/*
+		 * The watchdog is always configured with a 1MHz source, so
+		 * there is no need to scale the microsecond value. However we
+		 * need to offset it - from the datasheet:
+		 *
+		 * "This register decides the asserting duration of wdt_ext and
+		 * wdt_rstarm signal. The default value is 0xFF. It means the
+		 * default asserting duration of wdt_ext and wdt_rstarm is
+		 * 256us."
+		 *
+		 * This implies a value of 0 gives a 1us pulse.
+		 */
+		writel(duration - 1, wdt->base + WDT_RESET_WIDTH);
+	}
+
 	ret = devm_watchdog_register_device(&pdev->dev, &wdt->wdd);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register\n");
-- 
2.11.0
