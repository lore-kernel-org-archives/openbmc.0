Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EW/WBVOB"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="a7j/lEM2"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLj826LTzDrKZ
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:31:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2930820D60;
 Tue,  7 Nov 2017 02:31:54 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=plhpMynHBDTUoIw6T
 9pLJmv4p7a/f2BsyqIz6TdrBxE=; b=EW/WBVOB1f+fY+Vmpasy45evJZ6XPcQWj
 Niy4TmLsYKYk+wYhtsKksbJgT0MH3hgO2JmjumapkX7mz/kVZzuox/j2RkXWXhXX
 3ni5w64IfnV3wjcYVyfNIhzQN44tPrHHY1w/o/3zUTIednZt027RmbMRGxAik6pN
 fTtlUj5M7sngDI2Pk/+ENxL2kiSwTaGx9pJnvlSkvk7+Mwu0FPGSx+bHCPYCxjcy
 hQnotmx36D46HgMw754wOk31FztJvFlS0m1D8TnnGZVnzzROGf1jFdUSjS0jtIf9
 Po9aqTeSdixwYO1vuZbmc0tkRX5ex3/BLtfCFOKxwXDxwt1ruU9bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=plhpMynHBDTUoIw6T9pLJmv4p7a/f2BsyqIz6TdrBxE=; b=a7j/lEM2
 3aO8/FAwrdS2PtxFTH8jZu+6RD9PboDTPTlbk5CStkPrfVZDFtiBIyF1v8a1VP21
 tMKnJh1HbVQSLEbGRC9oczJuzbCv4SCjqL2SJ/YbsnPs7YDhhoXtPdW4yIXn6DUy
 4Lh2S/1OdQHWTk6svRw0yB/dvxSYOSw3O9uc6gFmSuyyFu+UW8zvRaoLX30LwjCY
 P6tjS+oN3u4GkvSq4fLEvI5kc1R/Jf7lHNGYicoisvvxDOFoc3xAmthiTqPSJh7t
 r5869CxVcGCCjYeOM6P4xNF5nssn/JCyKGY6o+/eJ2X2YnqQEiVyq1Y+0ygYi1VC
 8GxQV/lFdUniZQ==
X-ME-Sender: <xms:amEBWiFJlbuaFx_92wTii2zyXnA3YjJez7toEsWfQUhjfQ5H31ZT3Q>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 577FA24108;
 Tue,  7 Nov 2017 02:31:52 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 13/23] watchdog: aspeed: Support configuration
 of external signal properties
Date: Tue,  7 Nov 2017 18:00:36 +1030
Message-Id: <20171107073046.13319-14-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 07:31:57 -0000

Add support for configuring the drive strength and polarity on the
AST2500, and the pulse duration on both the AST2400 and AST2500.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Matt Spinler <mspinler@linux.vnet.ibm.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@iguana.be>
(cherry picked from commit 012c04601f9dc6a268ebff87a890b339af6d25bf)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
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
