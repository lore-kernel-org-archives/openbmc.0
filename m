Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA68606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 01:35:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFRcD0tPfz2yql;
	Thu, 29 Oct 2026 12:34:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793237691;
	cv=none; b=cvVx4hxz125jzae57bwff4sbTSAHQCTV9C7hRkaZrLwvHfI32rjvPfRWTTEfDmh1PJnXgaph85dubj9ZNzheErI9+MkHKF8jCfErR/YxnD4PoJPukfW/d8MQmoorYxUzr4iv/iVKch1uvThiyaWP4eK8y7UtEBsgz1jMRBcvseEz9/EvkKBT4PWPq8k9p60qVvIe17RJtL8nl8dk0sVUX0Uku7ZSFv64SZy9LdsA6W9Fb8jC6x1x/BUCcEPPe7k97DMc/qeQ1C5XWFtEdgY8aZKmYT0Z9SQrgiwFhw7T8ldOlYX96+hwMsHNiW0mZHXQXvVXSBXA9FQd1KZQyfrA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793237691; c=relaxed/relaxed;
	bh=0evWTmsOmXhddpiMiEtE/R39wTIH5zHfhFj7z+5n70s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ig2jEbF2dCUsCv1Q5lbPfRMIc50sS0Z9siVnUlpuqRgsLf+qYkLrlpz+lCFUt1lMHVXcbClqLQc4nrCyAOIPgMSlDpfKGJp2COuLIngVMTQkxdw6gXjkeCnn9uZulTI6f6zEBcYRCQBhc9jD30pW7mbvsWUDJ19v60tEAYcfmY16bNRdkJKCgf/6r6MocWbS7RMU9UCQ+FSSbQ+k446avqLrdNFiPFwrLHq86ytn/Z0VPK2YwCCSt2Yw558aCWrZ+5iWdOHedD402XIZLLc/pM4Z9dwB57hvhhZKmKAG24toPO/VCD2hL2WadyskMCn2ZnF/dRX0iGB/v1Vq1gEP4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFRcB6gLNz2ynZ
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 12:34:50 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 09:34:31 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 09:34:31 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, <joel@jms.id.au>, Mark Brown
	<broonie@kernel.org>
Subject: [PATCH linux dev-6.18 3/6] spi: aspeed: Force default address decoding range assignment for each CS
Date: Thu, 29 Oct 2026 09:34:19 +0800
Message-ID: <20261029013428.277816-4-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029013428.277816-1-vince_chang@aspeedtech.com>
References: <20261029013428.277816-1-vince_chang@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

On some platforms, we cannot assume that the whole address decoding range
value is ready for each CS. Especially for chip selects other than CS0,
the address decoding range may not be properly configured before the kernel
stage, or the existing configuration may be unsuitable. This can lead to
SPI flash detection failures during driver probe.

To ensure reliable initialization, this patch forcibly assigns a default
address decoding range to each chip select based on a platform-specific
minimum window size. Unused chip selects are explicitly disabled to avoid
conflicts.

This change improves robustness across platforms with varying bootloader
behavior and ensures consistent SPI flash initialization.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Link: https://patch.msgid.link/20251001112605.1130723-4-chin-ting_kuo@aspeedtech.com
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit 630a185fd06109193574d10f38b29812986c21de)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 106 ++++++++++++++++++++++-------------
 1 file changed, 67 insertions(+), 39 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 4b2afa55052f..bbd173924ed8 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -78,6 +78,7 @@ struct aspeed_spi_data {
 	u32	timing;
 	u32	hclk_mask;
 	u32	hdiv_max;
+	u32	min_window_size;
 
 	u32 (*segment_start)(struct aspeed_spi *aspi, u32 reg);
 	u32 (*segment_end)(struct aspeed_spi *aspi, u32 reg);
@@ -96,6 +97,7 @@ struct aspeed_spi {
 	void __iomem		*ahb_base;
 	u32			 ahb_base_phy;
 	u32			 ahb_window_size;
+	u32			 num_cs;
 	struct device		*dev;
 
 	struct clk		*clk;
@@ -401,35 +403,6 @@ static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
 	}
 }
 
-/*
- * On the AST2600, some CE windows are closed by default at reset but
- * U-Boot should open all.
- */
-static int aspeed_spi_chip_set_default_window(struct aspeed_spi_chip *chip)
-{
-	struct aspeed_spi *aspi = chip->aspi;
-	struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] = { 0 };
-	struct aspeed_spi_window *win = &windows[chip->cs];
-
-	/* No segment registers for the AST2400 SPI controller */
-	if (aspi->data == &ast2400_spi_data) {
-		win->offset = 0;
-		win->size = aspi->ahb_window_size;
-	} else {
-		aspeed_spi_get_windows(aspi, windows);
-	}
-
-	chip->ahb_base = aspi->ahb_base + win->offset;
-	chip->ahb_window_size = win->size;
-
-	dev_dbg(aspi->dev, "CE%d default window [ 0x%.8x - 0x%.8x ] %dMB",
-		chip->cs, aspi->ahb_base_phy + win->offset,
-		aspi->ahb_base_phy + win->offset + win->size - 1,
-		win->size >> 20);
-
-	return chip->ahb_window_size ? 0 : -1;
-}
-
 static int aspeed_spi_set_window(struct aspeed_spi *aspi,
 				 const struct aspeed_spi_window *win)
 {
@@ -464,16 +437,63 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi,
 	return 0;
 }
 
+static const struct aspeed_spi_data ast2500_spi_data;
+static const struct aspeed_spi_data ast2600_spi_data;
+static const struct aspeed_spi_data ast2600_fmc_data;
+
+static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
+{
+	int ret;
+	u32 cs;
+	struct aspeed_spi_window win;
+
+	/* No segment registers for the AST2400 SPI controller */
+	if (aspi->data == &ast2400_spi_data) {
+		aspi->chips[0].ahb_base = aspi->ahb_base;
+		aspi->chips[0].ahb_window_size = aspi->ahb_window_size;
+		return 0;
+	}
+
+	/* Assign the minimum window size to each CS */
+	for (cs = 0; cs < aspi->num_cs; cs++) {
+		if (cs == 0)
+			aspi->chips[cs].ahb_base = aspi->ahb_base;
+		else
+			aspi->chips[cs].ahb_base =
+				aspi->chips[cs - 1].ahb_base +
+				aspi->chips[cs - 1].ahb_window_size;
+
+		aspi->chips[cs].ahb_window_size = aspi->data->min_window_size;
+
+		dev_dbg(aspi->dev, "CE%d default window [ 0x%.8x - 0x%.8x ]",
+			cs, aspi->ahb_base_phy + aspi->data->min_window_size * cs,
+			aspi->ahb_base_phy + aspi->data->min_window_size * cs - 1);
+	}
+
+	/* Close unused CS */
+	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++) {
+		aspi->chips[cs].ahb_base = aspi->ahb_base;
+		aspi->chips[cs].ahb_window_size = 0;
+	}
+
+	for (cs = 0; cs < aspi->num_cs; cs++) {
+		win.cs = cs;
+		win.offset = aspi->chips[cs].ahb_base - aspi->ahb_base;
+		win.size = aspi->chips[cs].ahb_window_size;
+		ret = aspeed_spi_set_window(aspi, &win);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /*
  * Yet to be done when possible :
  * - Align mappings on flash size (we don't have the info)
  * - ioremap each window, not strictly necessary since the overall window
  *   is correct.
  */
-static const struct aspeed_spi_data ast2500_spi_data;
-static const struct aspeed_spi_data ast2600_spi_data;
-static const struct aspeed_spi_data ast2600_fmc_data;
-
 static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
 					 u32 local_offset, u32 size)
 {
@@ -678,11 +698,6 @@ static int aspeed_spi_setup(struct spi_device *spi)
 	if (data->hastype)
 		aspeed_spi_chip_set_type(aspi, cs, CONFIG_TYPE_SPI);
 
-	if (aspeed_spi_chip_set_default_window(chip) < 0) {
-		dev_warn(aspi->dev, "CE%d window invalid", cs);
-		return -EINVAL;
-	}
-
 	aspeed_spi_chip_enable(aspi, cs, true);
 
 	chip->ctl_val[ASPEED_SPI_BASE] = CTRL_CE_STOP_ACTIVE | CTRL_IO_MODE_USER;
@@ -763,9 +778,17 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	ctlr->mem_ops = &aspeed_spi_mem_ops;
 	ctlr->setup = aspeed_spi_setup;
 	ctlr->cleanup = aspeed_spi_cleanup;
-	ctlr->num_chipselect = data->max_cs;
+	ctlr->num_chipselect = of_get_available_child_count(dev->of_node);
 	ctlr->dev.of_node = dev->of_node;
 
+	aspi->num_cs = ctlr->num_chipselect;
+
+	ret = aspeed_spi_chip_set_default_window(aspi);
+	if (ret) {
+		dev_err(&pdev->dev, "fail to set default window\n");
+		return ret;
+	}
+
 	ret = spi_register_controller(ctlr);
 	if (ret)
 		dev_err(&pdev->dev, "spi_register_controller failed\n");
@@ -1279,6 +1302,7 @@ static const struct aspeed_spi_data ast2400_fmc_data = {
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
 	.hclk_mask     = 0xfffff0ff,
 	.hdiv_max      = 1,
+	.min_window_size = 0x800000,
 	.calibrate     = aspeed_spi_calibrate,
 	.get_clk_div   = aspeed_get_clk_div_ast2400,
 	.segment_start = aspeed_spi_segment_start,
@@ -1307,6 +1331,7 @@ static const struct aspeed_spi_data ast2500_fmc_data = {
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
 	.hclk_mask     = 0xffffd0ff,
 	.hdiv_max      = 1,
+	.min_window_size = 0x800000,
 	.get_clk_div   = aspeed_get_clk_div_ast2500,
 	.calibrate     = aspeed_spi_calibrate,
 	.segment_start = aspeed_spi_segment_start,
@@ -1322,6 +1347,7 @@ static const struct aspeed_spi_data ast2500_spi_data = {
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
 	.hclk_mask     = 0xffffd0ff,
 	.hdiv_max      = 1,
+	.min_window_size = 0x800000,
 	.get_clk_div   = aspeed_get_clk_div_ast2500,
 	.calibrate     = aspeed_spi_calibrate,
 	.segment_start = aspeed_spi_segment_start,
@@ -1338,6 +1364,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
+	.min_window_size = 0x200000,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2600_start,
@@ -1354,6 +1381,7 @@ static const struct aspeed_spi_data ast2600_spi_data = {
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
+	.min_window_size = 0x200000,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2600_start,
-- 
2.43.0


