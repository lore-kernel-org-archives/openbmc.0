Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CEF606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 01:36:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFRcJ0LSkz30DK;
	Thu, 29 Oct 2026 12:34:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793237695;
	cv=none; b=ao7XuSCXUfkH8xhs0fypXU7JWvWpBRsEJaYMGIoXTle/PrIQ+En8hoMB9Ank+LAGkc3VvPtrLFEiQKHLlIy53p2sUHvuBH0wFmdRcnR43xe+2JPeOfTVZSM5YqpHbG0e1rRohtjODL43nuderQZ8I7YCyQrRX8UEfcQ3NoLqXUOapNxRIS7gyveNuBYfDKTIcVFEGXZ3t35RjSMp44Wzbc7mVTZwxHYOYsjXtthsv4ZST8qGZnXkMm/YLzzUqXedF5cgKl9e7MjcVR91iFid9R/6rO8aI6WGvgdz7x2FpMxCjwA62XNmk9UFv1K4r9VRRfr2tW0okcG1eqACj902vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793237695; c=relaxed/relaxed;
	bh=1i+Tw65XKB/W+8C+os6drdLk7ArzBcHIOz61RrLmstA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CAE5KuZpGWDr4sDNvKPGapuU6V1ILcYit1NFdsAXVulVRdJn3SlYgpdfjUEqBkHf4PH+E4pq3b4xlloAiZ8DBMDd2t13yaCSV1pU4AxENaxtelbpK1wfkZNR9lqfreTQI09hceHh8PLffqz15Ush1v3L6uIY6PEPX6Nnb9e8qrQXeMhDvV7NTqgGPvlrqy8VkT+ttbckSP9GCfpACMV2YQuuCoTFuXkDW2amN4rg9i1Q/rqk9J/zoHvsozRgJ0BW29UuyJ15rNTQt53PHB+QzacztEepRmf9QDu2gI3NS0eT83L/hBgA89cSJ69JOcV5m/Rt5LmsA7HgmYB2/17/QA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFRcG6vv1z30C6
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 12:34:54 +1100 (AEDT)
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
Subject: [PATCH linux dev-6.18 6/6] spi: aspeed: Only map necessary address window region
Date: Thu, 29 Oct 2026 09:34:22 +0800
Message-ID: <20261029013428.277816-7-vince_chang@aspeedtech.com>
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

Previously, the driver mapped the entire SPI address decoding region during
probe. On systems with small flash or limited memory, this could lead to
excessive memory usage or allocation failures.

This patch changes the strategy to initially map a small address window
for SPI flash device probing. After determining each chip select's flash
size, the driver unmaps the temporary region and remaps only the required
address window accordingly.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Link: https://patch.msgid.link/20251001112605.1130723-7-chin-ting_kuo@aspeedtech.com
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit 64d87ccfae3326a9561fe41dc6073064a083e0df)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 39 +++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index d75b38636640..01fe42bdbc39 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -96,7 +97,6 @@ struct aspeed_spi {
 	const struct aspeed_spi_data	*data;
 
 	void __iomem		*regs;
-	void __iomem		*ahb_base;
 	u32			 ahb_base_phy;
 	u32			 ahb_window_size;
 	u32			 num_cs;
@@ -394,6 +394,13 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi)
 	u32 cs;
 	size_t window_size;
 
+	for (cs = 0; cs < aspi->data->max_cs; cs++) {
+		if (aspi->chips[cs].ahb_base) {
+			iounmap(aspi->chips[cs].ahb_base);
+			aspi->chips[cs].ahb_base = NULL;
+		}
+	}
+
 	for (cs = 0; cs < aspi->data->max_cs; cs++) {
 		seg_reg = seg_reg_base + cs * 4;
 		seg_val_backup = readl(seg_reg);
@@ -425,13 +432,29 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi)
 		else
 			dev_dbg(dev, "CE%d window closed\n", cs);
 
-		aspi->chips[cs].ahb_base = aspi->ahb_base + offset;
 		offset += window_size;
 		if (offset > aspi->ahb_window_size) {
 			dev_err(dev, "CE%d offset value 0x%llx is too large.\n",
 				cs, (u64)offset);
 			return -ENOSPC;
 		}
+
+		/*
+		 * No need to map the address deocding range when
+		 * - window size is 0.
+		 * - the CS is unused.
+		 */
+		if (window_size == 0 || cs >= aspi->num_cs)
+			continue;
+
+		aspi->chips[cs].ahb_base =
+			devm_ioremap(aspi->dev, start, window_size);
+		if (!aspi->chips[cs].ahb_base) {
+			dev_err(aspi->dev,
+				"Fail to remap window [0x%.9llx - 0x%.9llx]\n",
+				(u64)start, (u64)end - 1);
+			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -447,7 +470,9 @@ static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 
 	/* No segment registers for the AST2400 SPI controller */
 	if (aspi->data == &ast2400_spi_data) {
-		aspi->chips[0].ahb_base = aspi->ahb_base;
+		aspi->chips[0].ahb_base = devm_ioremap(aspi->dev,
+						       aspi->ahb_base_phy,
+						       aspi->ahb_window_size);
 		aspi->chips[0].ahb_window_size = aspi->ahb_window_size;
 		return 0;
 	}
@@ -839,10 +864,10 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	if (IS_ERR(aspi->regs))
 		return PTR_ERR(aspi->regs);
 
-	aspi->ahb_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
-	if (IS_ERR(aspi->ahb_base)) {
-		dev_err(dev, "missing AHB mapping window\n");
-		return PTR_ERR(aspi->ahb_base);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (IS_ERR(res)) {
+		dev_err(dev, "missing AHB memory\n");
+		return PTR_ERR(res);
 	}
 
 	aspi->ahb_window_size = resource_size(res);
-- 
2.43.0


