Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mQ0tkihu"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QS5z4cjPzF35T
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:18:47 +1000 (AEST)
Received: by mail-pf0-x243.google.com with SMTP id u16-v6so17609550pfh.3
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=76YecRGUx5l8FGj1cE8OlDuZN10niFEBYMlu0YkNh3U=;
 b=mQ0tkihuwWMOnwPa5Po+wps96VIz6ENoYIHVGPeLFD4NPmmwdCsqpoaI5el253UYXh
 bx6Mwbtvq0p/sCSKN9tKdXe1GNCn/gbBaFCAEpi6eiT9pgEmsH71wOjLu7JW3c6Q7tDK
 vyduLC6z+e3fD5uDTwengOBVG+Qko1EWwVb0yI7B6qaDjcFYYVJi70f5nF/zZkRBCFm4
 6Q2ZcywPHd6WqUbZ9Dbk1bpqdTRsqQIlcsQLAVD2A/y+xYtScA9H8/MV6Ue5dTDvJHwj
 I1kFmc2UgMdB2Em7jdcuH10ilQIASPUlw/DBy4qs8x7lDn/YEB2J7opvob42BDDeLsAx
 zVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=76YecRGUx5l8FGj1cE8OlDuZN10niFEBYMlu0YkNh3U=;
 b=Xzfj+0IF1yZbO9aEvi+XzhT+Wq3KmRV8k76V/I8nY96Rl57Ko1jPmReJtvkdMDXVMp
 NGmFjPH6AlUMh1t97J3QwzA+EtNh4M/C/IYxPzhj2KCGuzzuBLOmlp/+ndS4ptj4TjhX
 3Y67Uflf2J2BYbi01i+JA2doyg78vVt1y89/LbrZjI/wZJlvHWTduH1sY0jzScTcbbG3
 vEroc3/owqXlmm86pObFUygovXjz669LzhfGjAsz7eve7yjKfrtknccnM8zhjF1EXBKv
 04Ld4kt0sfRXXQ9Lh37zy+c5mNL9ypBW/CR5317f5Auw3xe7IeliMyWSG3zXI2O+sOeW
 K1qQ==
X-Gm-Message-State: APt69E0hlBP4L24qspLOR1G8v2eI71Yn0bc0YvsvU2ZfAo/kR8Ocz0uX
 jcsw2WAiAV565z5FFY5I4L6dyQ==
X-Google-Smtp-Source: AAOMgpfVzfkyBb0Gr63vMtxFPx4SGx0EtMjhQPJBx+nMswZjzCXBfAmgvt9G4VrVJIipRVhCKKgabg==
X-Received: by 2002:a63:647:: with SMTP id
 68-v6mr25446796pgg.205.1531286325430; 
 Tue, 10 Jul 2018 22:18:45 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id p18-v6sm21357097pfe.22.2018.07.10.22.18.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jul 2018 22:18:44 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 3/7] irqchip: Aspeed: Add Aspeed sdhci irq
 driver
Date: Wed, 11 Jul 2018 13:17:06 +0800
Message-Id: <1531286230-28453-4-git-send-email-ryanchen.aspeed@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Wed, 11 Jul 2018 05:18:48 -0000

In Aspeed SoC's sdhci have two slots and have a interrupt status and
general information in top for register. so it need a sdhci irq driver
probe defore sdhci driver probe

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 drivers/irqchip/Makefile              |   2 +-
 drivers/irqchip/irq-aspeed-sdhci-ic.c | 147 ++++++++++++++++++++++++++++++++++
 include/linux/mmc/sdhci-aspeed-data.h |  28 +++++++
 3 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100644 drivers/irqchip/irq-aspeed-sdhci-ic.c
 create mode 100644 include/linux/mmc/sdhci-aspeed-data.h

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 5ed465a..579c4fb 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_MVEBU_ODMI)		+= irq-mvebu-odmi.o
 obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
 obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
 obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
-obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
+obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-sdhci-ic.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
 obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+= irq-uniphier-aidet.o
diff --git a/drivers/irqchip/irq-aspeed-sdhci-ic.c b/drivers/irqchip/irq-aspeed-sdhci-ic.c
new file mode 100644
index 0000000..c3d9d45
--- /dev/null
+++ b/drivers/irqchip/irq-aspeed-sdhci-ic.c
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
