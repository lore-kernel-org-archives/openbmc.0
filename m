Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="giyofgsh"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VBhf6TPkzF3Hw
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 17:28:18 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id r1-v6so58610pgp.11
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 00:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/t/HOxQk7eSXHwM2l7gBmgbTkdLFp7ijZrfK56fM8Y0=;
 b=giyofgshtUkV5ovBt+dMgzjrVF9fLnJqmoxWHP+P2Ylhiu4rR08GHwp7zXFRI6oiUc
 lC7StYR6R5joiAQPrkgoFFHkJ5AXpRKb+gJLcWsXx2cFAqtcHKpBlbsAZoLS/hzjs7wX
 9X9yRX3k6hT2gcBe9iTOz99dilfflle1Ncfe6Bn1U4TBmKwshm/4l8qn2yGaEKczVu84
 5wl25jwm1c47xVfClUIszk0z4xyJZKiFvUiIDCTmcbzuYWgCbyNwvdunjIWE3J+QbyUq
 bl1GUwn2+u1mp1fm/j0Nl8zSaapuI3fU/SuC6D6JOrc6ETElSyCMl9b//CO8R5WbHjl1
 Bg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/t/HOxQk7eSXHwM2l7gBmgbTkdLFp7ijZrfK56fM8Y0=;
 b=iGUdb3NeqQGXSwSp0ALxv/QU5AlKJ6o+ZSqu74J5WH968Lu4CUripVjKkN9g3FTtLc
 ZiDx1ZHZHioBYNCb4+otcHoZUc6Lcs1oQdF05R3bmyVeWl4mbd62AD3o3e2VIarE9Lcl
 QYukzyUAs1w9FkGMwS4Kv6f/ykninz/A9Wt+MiwjvOhZZmytWVQtqdoMNwNiMZRQ3Bha
 VaYgqZ/Q/NCGqLmJ9WM58b4HV+/cHJ0mw6XJETg9f0qYUfQ9II/4FyRQfuK+uJsO5IUI
 EhNM9FqnfWaLSvaxOJVksDbvd/Xi+G2hb0t7ZGtwrcya/lZwtP+oefpxQYitz88l76bb
 zbdw==
X-Gm-Message-State: AOUpUlFKNK9i3yiFfB2Kp1WDtvJoR6YOC8M18SurX3XGnQl4VlnTKYp+
 OiEA7Owpjtz/pKKzxdF1XqKyHQ==
X-Google-Smtp-Source: AAOMgpeKgzQ1T97hB2viKGWAeCaaq7H95Gq2ZOLvsBSfVmNX/Qs0Zp+5eVwrxTffQ6fjPWLNCaYn/Q==
X-Received: by 2002:a63:da04:: with SMTP id c4-v6mr472418pgh.398.1531812496701; 
 Tue, 17 Jul 2018 00:28:16 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id f6-v6sm578647pgp.13.2018.07.17.00.28.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Jul 2018 00:28:15 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 3/7] mmc: Aspeed: Add Aspeed sdhci core driver
Date: Tue, 17 Jul 2018 15:26:14 +0800
Message-Id: <1531812378-14316-4-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Tue, 17 Jul 2018 07:28:19 -0000

In Aspeed SoC's sdhci have two slots and have a interrupt status and
general information in top for register. add sdhci core driver
defore sdhci driver probe

V0->V1
move irqchip/irq-aspeed-sdhci-ic.c to drivers/mmc/host/aspeed-sdhci-core.c

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 drivers/irqchip/Makefile              |   2 +-
 drivers/mmc/host/Makefile             |   1 +
 drivers/mmc/host/aspeed-sdhci-core.c  | 147 ++++++++++++++++++++++++++++++++++
 include/linux/mmc/sdhci-aspeed-data.h |  28 +++++++
 4 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mmc/host/aspeed-sdhci-core.c
 create mode 100644 include/linux/mmc/sdhci-aspeed-data.h

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 5ed465a..d99cb1d 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_MVEBU_ODMI)		+= irq-mvebu-odmi.o
 obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
 obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
 obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
-obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
+obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o 
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
 obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+= irq-uniphier-aidet.o
diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
index 6aead24..c3e5a1f 100644
--- a/drivers/mmc/host/Makefile
+++ b/drivers/mmc/host/Makefile
@@ -78,6 +78,7 @@ obj-$(CONFIG_MMC_SDHCI_ESDHC_IMX)	+= sdhci-esdhc-imx.o
 obj-$(CONFIG_MMC_SDHCI_DOVE)		+= sdhci-dove.o
 obj-$(CONFIG_MMC_SDHCI_TEGRA)		+= sdhci-tegra.o
 obj-$(CONFIG_MMC_SDHCI_OF_ARASAN)	+= sdhci-of-arasan.o
+obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)	+= aspeed-sdhci-core.o
 obj-$(CONFIG_MMC_SDHCI_OF_AT91)		+= sdhci-of-at91.o
 obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+= sdhci-of-esdhc.o
 obj-$(CONFIG_MMC_SDHCI_OF_HLWD)		+= sdhci-of-hlwd.o
diff --git a/drivers/mmc/host/aspeed-sdhci-core.c b/drivers/mmc/host/aspeed-sdhci-core.c
new file mode 100644
index 0000000..c3d9d45
--- /dev/null
+++ b/drivers/mmc/host/aspeed-sdhci-core.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SDHCI IRQCHIP driver for the Aspeed SoC
+ *
+ * Copyright (C) ASPEED Technology Inc.
+ * Ryan Chen <ryan_chen@aspeedtech.com>
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or (at
+ * your option) any later version.
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/mmc/sdhci-aspeed-data.h>
+
+#define ASPEED_SDHCI_SLOT_NUM			2
+
+static void aspeed_sdhci_irq_handler(struct irq_desc *desc)
+{
+	struct aspeed_sdhci_irq *sdhci_irq = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long bit, status;
+	unsigned int slot_irq;
+
+	chained_irq_enter(chip, desc);
+	status = readl(sdhci_irq->regs + ASPEED_SDHCI_ISR);
+	for_each_set_bit(bit, &status, ASPEED_SDHCI_SLOT_NUM) {
+		slot_irq = irq_find_mapping(sdhci_irq->irq_domain, bit);
+		generic_handle_irq(slot_irq);
+	}
+	chained_irq_exit(chip, desc);
+}
+
+static void noop(struct irq_data *data) { }
+
+static unsigned int noop_ret(struct irq_data *data)
+{
+	return 0;
+}
+
+struct irq_chip sdhci_irq_chip = {
+	.name		= "sdhci-ic",
+	.irq_startup	= noop_ret,
+	.irq_shutdown	= noop,
+	.irq_enable	= noop,
+	.irq_disable	= noop,
+	.irq_ack	= noop,
+	.irq_mask	= noop,
+	.irq_unmask	= noop,
+	.flags		= IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int ast_sdhci_map_irq_domain(struct irq_domain *domain,
+				    unsigned int irq, irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &sdhci_irq_chip, handle_simple_irq);
+	irq_set_chip_data(irq, domain->host_data);
+
+	return 0;
+}
+
+static const struct irq_domain_ops aspeed_sdhci_irq_domain_ops = {
+	.map = ast_sdhci_map_irq_domain,
+};
+
+static int irq_aspeed_sdhci_probe(struct platform_device *pdev)
+{
+	struct aspeed_sdhci_irq *sdhci_irq;
+	struct clk *sdclk;
+
+	sdhci_irq = kzalloc(sizeof(*sdhci_irq), GFP_KERNEL);
+	if (!sdhci_irq)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, sdhci_irq);
+	//node->data = sdhci_irq;
+	pdev->dev.of_node->data = sdhci_irq;
+
+	sdhci_irq->regs = of_iomap(pdev->dev.of_node, 0);
+	if (IS_ERR(sdhci_irq->regs))
+		return PTR_ERR(sdhci_irq->regs);
+
+	sdclk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(sdclk)) {
+		dev_err(&pdev->dev, "no sdclk clock defined\n");
+		return PTR_ERR(sdclk);
+	}
+
+	clk_prepare_enable(sdclk);
+
+	sdhci_irq->parent_irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	if (sdhci_irq->parent_irq < 0)
+		return sdhci_irq->parent_irq;
+
+	sdhci_irq->irq_domain = irq_domain_add_linear(
+					pdev->dev.of_node, ASPEED_SDHCI_SLOT_NUM,
+					&aspeed_sdhci_irq_domain_ops, NULL);
+	if (!sdhci_irq->irq_domain)
+		return -ENOMEM;
+
+	sdhci_irq->irq_domain->name = "aspeed-sdhci-irq";
+
+	irq_set_chained_handler_and_data(sdhci_irq->parent_irq,
+					 aspeed_sdhci_irq_handler, sdhci_irq);
+
+	pr_info("sdhci irq controller registered, irq %d\n", sdhci_irq->parent_irq);
+
+	return 0;
+}
+
+static const struct of_device_id irq_aspeed_sdhci_dt_ids[] = {
+	{ .compatible = "aspeed,aspeed-sdhci-irq", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, irq_aspeed_sdhci_dt_ids);
+
+static struct platform_driver irq_aspeed_sdhci_device_driver = {
+	.probe		= irq_aspeed_sdhci_probe,
+	.driver		= {
+		.name   = KBUILD_MODNAME,
+		.of_match_table	= irq_aspeed_sdhci_dt_ids,
+	}
+};
+
+static int __init irq_aspeed_sdhci_init(void)
+{
+	return platform_driver_register(&irq_aspeed_sdhci_device_driver);
+}
+core_initcall(irq_aspeed_sdhci_init);
+
+MODULE_AUTHOR("Ryan Chen");
+MODULE_DESCRIPTION("ASPEED SOC SDHCI IRQ Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mmc/sdhci-aspeed-data.h b/include/linux/mmc/sdhci-aspeed-data.h
new file mode 100644
index 0000000..fba2bf2
--- /dev/null
+++ b/include/linux/mmc/sdhci-aspeed-data.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_MMC_SDHCI_ASPEED_DATA_H
+#define LINUX_MMC_SDHCI_ASPEED_DATA_H
+
+#include <linux/io.h>
+
+#define ASPEED_SDHCI_INFO			0x00
+#define  ASPEED_SDHCI_S1MMC8			BIT(25)
+#define  ASPEED_SDHCI_S0MMC8			BIT(24)
+#define ASPEED_SDHCI_BLOCK			0x04
+#define ASPEED_SDHCI_CTRL			0xF0
+#define ASPEED_SDHCI_ISR			0xFC
+
+struct aspeed_sdhci_irq {
+	void __iomem *regs;
+	int parent_irq;
+	struct irq_domain *irq_domain;
+};
+
+static inline void aspeed_sdhci_set_8bit_mode(struct aspeed_sdhci_irq *sdhci_irq, int mode)
+{
+	if (mode)
+		writel(ASPEED_SDHCI_S0MMC8 | readl(sdhci_irq->regs), sdhci_irq->regs);
+	else
+		writel(~ASPEED_SDHCI_S0MMC8 & readl(sdhci_irq->regs), sdhci_irq->regs);
+}
+
+#endif
-- 
2.7.4
