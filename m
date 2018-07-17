Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YvAPVM1i"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VBhj3F21zF3Hh
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 17:28:21 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id m19-v6so68652pgv.3
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 00:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LxoD+D/IPhsdBy/Sw1MWEEZDj4tDaVt5j9JwitkBkio=;
 b=YvAPVM1iQwA48MBInO888P6degKiT94vXuRj32inyB5JD9ysc6pFK/YU+Wj1zZpmep
 EJBkcdAYnMR0VMxggFX60gMUwCAya9j0QktWgp2bMtdwgucpfdiHuvj4MUEIQqvqCQKS
 bS1r4XG6vHctgqU7Dnz9szl3cphdYhP1MKJffv8EYesOiXVCkBpeZ8jSB7mPVjckqc5J
 E4dwboz87PNAWu7IcFp3OcDmcvktuu6E+BhixtrGrqwcpg9YS1RhX9Ed+cBuP8CH9Ys8
 Ts8aHfUY1LPfnhgeMG+wgJ4Inqpl3EcA246H4vNACZDy+vxR0AJ2mTWmj2aLFpjTuMdL
 QXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LxoD+D/IPhsdBy/Sw1MWEEZDj4tDaVt5j9JwitkBkio=;
 b=DX3izhwGCwvmBP3DDEUGFah7j4qIaXPtW8WjhK8cthdb6otp6Cr55ZZD0854jmSjt7
 nLwpuO898GI4+/uk5HVX12DLu6WkGhhhjA8IepZMXWF+81ZEblZtUlhQjthYva8Dpkae
 8PilVbmb3L0BoNWeYv/Af0a+c+J3BXmrsKRRQNTZnrLi9ePl1YQqcqJmNZ1DHdsaesOp
 zjIGH79SVDJI/PsapMy+tTwN0xFp+jbs3LKFOeH39Nt+vja7FGJWWloYr3ObchtCnBix
 5tZTHCd941fbEBUTHjWrqMTbXwTWiaqfYEvpWu/Tzm/jg9u/izSCmmVF0ItY7hi0m02y
 mP9w==
X-Gm-Message-State: AOUpUlEAqbogQ/WzJ02jxUiyqfJ0zzGzub21qnKk/9XXYbItOoVJw2NJ
 GPgFH8PqeSYf1upGdOjUpBkL6A==
X-Google-Smtp-Source: AAOMgpd2MJMcl48R/FEtwOIWlZFG+pJfG4FQ+olUPP/kxbHuUsYT0exTRBE23h8sQKmWOpi7C1go5A==
X-Received: by 2002:a65:614a:: with SMTP id
 o10-v6mr454957pgv.387.1531812499538; 
 Tue, 17 Jul 2018 00:28:19 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id f6-v6sm578647pgp.13.2018.07.17.00.28.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Jul 2018 00:28:18 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 4/7] mmc: Aspeed: Add driver for Aspeed sdhci
Date: Tue, 17 Jul 2018 15:26:15 +0800
Message-Id: <1531812378-14316-5-git-send-email-ryanchen.aspeed@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 07:28:22 -0000

Add a driver for Aspeed's sdhci controller core.

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 drivers/mmc/host/Kconfig           |  12 +++
 drivers/mmc/host/Makefile          |   2 +-
 drivers/mmc/host/sdhci-of-aspeed.c | 178 +++++++++++++++++++++++++++++++++++++
 3 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 9589f9c..5056e6e 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -142,6 +142,18 @@ config MMC_SDHCI_OF_ARASAN
 
 	  If unsure, say N.
 
+config MMC_SDHCI_OF_ASPEED
+	tristate "SDHCI OF support for the ASPEED SDHCI controller"
+	depends on MMC_SDHCI_PLTFM
+	depends on OF
+	help
+	  This selects the ASPEED Secure Digital Host Controller Interface.
+
+	  If you have a controller with this interface, say Y or M here. You
+	  also need to enable an appropriate bus interface.
+
+	  If unsure, say N.
+
 config MMC_SDHCI_OF_AT91
 	tristate "SDHCI OF support for the Atmel SDMMC controller"
 	depends on MMC_SDHCI_PLTFM
diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
index c3e5a1f..6214d11 100644
--- a/drivers/mmc/host/Makefile
+++ b/drivers/mmc/host/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_MMC_SDHCI_ESDHC_IMX)	+= sdhci-esdhc-imx.o
 obj-$(CONFIG_MMC_SDHCI_DOVE)		+= sdhci-dove.o
 obj-$(CONFIG_MMC_SDHCI_TEGRA)		+= sdhci-tegra.o
 obj-$(CONFIG_MMC_SDHCI_OF_ARASAN)	+= sdhci-of-arasan.o
-obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)	+= aspeed-sdhci-core.o
+obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)	+= aspeed-sdhci-core.o sdhci-of-aspeed.o
 obj-$(CONFIG_MMC_SDHCI_OF_AT91)		+= sdhci-of-at91.o
 obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+= sdhci-of-esdhc.o
 obj-$(CONFIG_MMC_SDHCI_OF_HLWD)		+= sdhci-of-hlwd.o
diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
new file mode 100644
index 0000000..8e609e1
--- /dev/null
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ASPEED Secure Digital Host Controller Interface.
+ * Copyright (C) ASPEED Technology Inc.
+ * Ryan Chen <ryan_chen@aspeedtech.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or (at
+ * your option) any later version.
+ *
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/mmc/host.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/mmc/sdhci-aspeed-data.h>
+#include <linux/reset.h>
+#include "sdhci-pltfm.h"
+
+static void sdhci_aspeed_set_clock(struct sdhci_host *host, unsigned int clock)
+{
+	int div;
+	u16 clk;
+	unsigned long timeout;
+
+	if (clock == host->clock)
+		return;
+
+	sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
+
+	if (clock == 0)
+		goto out;
+
+	for (div = 1; div < 256; div *= 2) {
+		if ((host->max_clk / div) <= clock)
+			break;
+	}
+	div >>= 1;
+
+	clk = div << SDHCI_DIVIDER_SHIFT;
+	clk |= SDHCI_CLOCK_INT_EN;
+	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
+
+	/* Wait max 20 ms */
+	timeout = 20;
+	while (!((clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL))
+		 & SDHCI_CLOCK_INT_STABLE)) {
+		if (timeout == 0) {
+			pr_err("%s: Internal clock never stabilised.\n",
+			       mmc_hostname(host->mmc));
+			return;
+		}
+		timeout--;
+		mdelay(1);
+	}
+
+	clk |= SDHCI_CLOCK_CARD_EN;
+	sdhci_writew(host, clk, SDHCI_CLOCK_CONTROL);
+
+out:
+	host->clock = clock;
+}
+
+static void sdhci_aspeed_set_bus_width(struct sdhci_host *host, int width)
+{
+	struct sdhci_pltfm_host *pltfm_priv = sdhci_priv(host);
+	struct aspeed_sdhci_irq *sdhci_irq = sdhci_pltfm_priv(pltfm_priv);
+
+	u8 ctrl = sdhci_readb(host, SDHCI_HOST_CONTROL);
+
+	if (sdhci_irq->regs) {
+		if (width == MMC_BUS_WIDTH_8)
+			aspeed_sdhci_set_8bit_mode(sdhci_irq, 1);
+		else
+			aspeed_sdhci_set_8bit_mode(sdhci_irq, 0);
+	}
+	if (width == MMC_BUS_WIDTH_4)
+		ctrl |= SDHCI_CTRL_4BITBUS;
+	else
+		ctrl &= ~SDHCI_CTRL_4BITBUS;
+
+	sdhci_writeb(host, ctrl, SDHCI_HOST_CONTROL);
+
+}
+
+static struct sdhci_ops  sdhci_aspeed_ops = {
+	.set_clock = sdhci_aspeed_set_clock,
+	.get_max_clock = sdhci_pltfm_clk_get_max_clock,
+	.set_bus_width = sdhci_aspeed_set_bus_width,
+	.get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
+	.reset = sdhci_reset,
+	.set_uhs_signaling = sdhci_set_uhs_signaling,
+};
+
+static struct sdhci_pltfm_data sdhci_aspeed_pdata = {
+	.ops = &sdhci_aspeed_ops,
+	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
+	.quirks2 = SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
+};
+
+static int sdhci_aspeed_probe(struct platform_device *pdev)
+{
+	struct sdhci_host *host;
+	struct device_node *pnode;
+	struct device_node *np = pdev->dev.of_node;
+	struct sdhci_pltfm_host *pltfm_host;
+	struct aspeed_sdhci_irq *sdhci_irq;
+
+	int ret;
+
+	host = sdhci_pltfm_init(pdev, &sdhci_aspeed_pdata, sizeof(struct aspeed_sdhci_irq));
+	if (IS_ERR(host))
+		return PTR_ERR(host);
+
+	pltfm_host = sdhci_priv(host);
+	sdhci_irq = sdhci_pltfm_priv(pltfm_host);
+
+	sdhci_get_of_property(pdev);
+
+	pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
+
+	pnode = of_parse_phandle(np, "interrupt-parent", 0);
+	if (pnode)
+		memcpy(sdhci_irq, pnode->data, sizeof(struct aspeed_sdhci_irq));
+
+	ret = mmc_of_parse(host->mmc);
+	if (ret)
+		goto err_sdhci_add;
+
+	ret = sdhci_add_host(host);
+	if (ret)
+		goto err_sdhci_add;
+
+	return 0;
+
+err_sdhci_add:
+	sdhci_pltfm_free(pdev);
+	return ret;
+}
+
+static int sdhci_aspeed_remove(struct platform_device *pdev)
+{
+	struct sdhci_host	*host = platform_get_drvdata(pdev);
+	int dead = (readl(host->ioaddr + SDHCI_INT_STATUS) == 0xffffffff);
+
+	sdhci_remove_host(host, dead);
+	sdhci_pltfm_free(pdev);
+	return 0;
+}
+
+static const struct of_device_id sdhci_aspeed_of_match[] = {
+	{ .compatible = "aspeed,sdhci-ast2400", .data = &sdhci_aspeed_pdata },
+	{ .compatible = "aspeed,sdhci-ast2500", .data = &sdhci_aspeed_pdata },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, sdhci_aspeed_of_match);
+
+static struct platform_driver sdhci_aspeed_driver = {
+	.driver		= {
+		.name	= "sdhci-aspeed",
+		.pm	= &sdhci_pltfm_pmops,
+		.of_match_table = sdhci_aspeed_of_match,
+	},
+	.probe		= sdhci_aspeed_probe,
+	.remove		= sdhci_aspeed_remove,
+};
+
+module_platform_driver(sdhci_aspeed_driver);
+
+MODULE_DESCRIPTION("Driver for the ASPEED SDHCI Controller");
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4
