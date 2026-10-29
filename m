Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B74606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:03:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFTYp07YTz30DZ;
	Thu, 29 Oct 2026 14:02:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793242973;
	cv=none; b=FQNrR7G+eExUVFvN/tL1T9AS7D0RAJvToZxPBkgd/3WKzGRRN814AIEHTYuz3YNqbydIgiNH5Hj2yuWBB3GOtH49s1h1CqINAPCz/yldQZ3xJ1zkwy1/b46xwg44cWou0VNcySgnIKog6sUHRNsA4QNSe3n8u++mkdBIyC3sF2SS5kWsdbzxFlDL1kQlwlFLUjOvK3qZJLKaOTzPxN+vOz2Vq0fvRSW1kBTtVvx6LPzIosk5Y9mnAYKQlApBQqjOf0IsJ6LGFqeK+NqHtfROw/d4I0pGZBtfBEg9Y8yY6HIyrB4SbzfLjib6UrGhbEmm7wwA8Nj5xuPhMiNaNSm9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793242973; c=relaxed/relaxed;
	bh=ofDLOSKsFjZJ8EuK2yQC1r0nfSEyUOEX8f+Iq6T49TY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4rneAMIrcZN+Oeh+8kLCXokmP4xnb4tEXrn5HtyEYqLx/hH0G7pZLJ1q7kdFCRWMfIMf2L9ThCBaFrVAXkWTBuk3OxBq35iP39vqE5n2FGHWncGz3wgSbedunSry5PJjr8RRXpyTYShno7yCRJA/VHRo/4xXAQsujtVicHzAkBlPkpuxBbW19H6nmPDU8rhDnEHpt4dK47o8YAdS7NwO+ArhglQ+jb2Hlp40McKP60OWPPVUniGaP8nzDU3BytLVC5I6DGkNDIFxor8zsvJ/0t2Z3149ND3BHzQyCsWXb4taIJ7bqD0vh6d8n9adnj5UN3pnRk3Aax5BVT8+wD6GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFTYm6VrLz30C9
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:02:52 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:02:25 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:02:25 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Ryan Chen <ryan_chen@aspeedtech.com>, <joel@jms.id.au>, Thomas Gleixner
	<tglx@kernel.org>
Subject: [PATCH linux dev-6.18 4/6] irqchip/aspeed-intc: Remove AST2700-A0 support
Date: Thu, 29 Oct 2026 11:02:19 +0800
Message-ID: <20261029030224.470029-5-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029030224.470029-1-vince_chang@aspeedtech.com>
References: <20261029030224.470029-1-vince_chang@aspeedtech.com>
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

From: Ryan Chen <ryan_chen@aspeedtech.com>

The existing AST2700 interrupt controller driver ("aspeed,ast2700-intc-ic")
was written against the A0 pre-production design.

From A1 onwards (retained in the A2 production silicon), the interrupt
fabric was re-architected: interrupt routing is programmable and interrupt
outputs can be directed to multiple upstream controllers (PSP GIC,
Secondary Service Processor (SSP) NVIC, Tertiary Service Processor (TSP)
NVIC, and Boot MCU interrupt controller). This design requires route
resolution and a controller hierarchy model which the A0 driver cannot
represent.

Remove driver support for A0 in favour of the driver for the A2 production
design.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260407-irqchip-v5-4-c0b0a300a057@aspeedtech.com
(cherry picked from commit d3587cc4a5e691539c46f327f8d510c1bc482b7e)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/irqchip/Makefile          |   1 -
 drivers/irqchip/irq-aspeed-intc.c | 139 ------------------------------
 2 files changed, 140 deletions(-)
 delete mode 100644 drivers/irqchip/irq-aspeed-intc.c

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index d3aba1bce44e..b92a3665eaad 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -92,7 +92,6 @@ obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
 obj-$(CONFIG_ASPEED_AST2700_INTC)	+= irq-ast2700.o irq-ast2700-intc0.o irq-ast2700-intc1.o
 obj-$(CONFIG_ASPEED_AST2700_INTC_TEST)	+= irq-ast2700-intc0-test.o
 obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-scu-ic.o
-obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-intc.o
 obj-$(CONFIG_STM32MP_EXTI)		+= irq-stm32mp-exti.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
diff --git a/drivers/irqchip/irq-aspeed-intc.c b/drivers/irqchip/irq-aspeed-intc.c
deleted file mode 100644
index 8330221799a0..000000000000
--- a/drivers/irqchip/irq-aspeed-intc.c
+++ /dev/null
@@ -1,139 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Aspeed Interrupt Controller.
- *
- *  Copyright (C) 2023 ASPEED Technology Inc.
- */
-
-#include <linux/bitops.h>
-#include <linux/irq.h>
-#include <linux/irqchip.h>
-#include <linux/irqchip/chained_irq.h>
-#include <linux/irqdomain.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/io.h>
-#include <linux/spinlock.h>
-
-#define INTC_INT_ENABLE_REG	0x00
-#define INTC_INT_STATUS_REG	0x04
-#define INTC_IRQS_PER_WORD	32
-
-struct aspeed_intc_ic {
-	void __iomem		*base;
-	raw_spinlock_t		gic_lock;
-	raw_spinlock_t		intc_lock;
-	struct irq_domain	*irq_domain;
-};
-
-static void aspeed_intc_ic_irq_handler(struct irq_desc *desc)
-{
-	struct aspeed_intc_ic *intc_ic = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-
-	chained_irq_enter(chip, desc);
-
-	scoped_guard(raw_spinlock, &intc_ic->gic_lock) {
-		unsigned long bit, status;
-
-		status = readl(intc_ic->base + INTC_INT_STATUS_REG);
-		for_each_set_bit(bit, &status, INTC_IRQS_PER_WORD) {
-			generic_handle_domain_irq(intc_ic->irq_domain, bit);
-			writel(BIT(bit), intc_ic->base + INTC_INT_STATUS_REG);
-		}
-	}
-
-	chained_irq_exit(chip, desc);
-}
-
-static void aspeed_intc_irq_mask(struct irq_data *data)
-{
-	struct aspeed_intc_ic *intc_ic = irq_data_get_irq_chip_data(data);
-	unsigned int mask = readl(intc_ic->base + INTC_INT_ENABLE_REG) & ~BIT(data->hwirq);
-
-	guard(raw_spinlock)(&intc_ic->intc_lock);
-	writel(mask, intc_ic->base + INTC_INT_ENABLE_REG);
-}
-
-static void aspeed_intc_irq_unmask(struct irq_data *data)
-{
-	struct aspeed_intc_ic *intc_ic = irq_data_get_irq_chip_data(data);
-	unsigned int unmask = readl(intc_ic->base + INTC_INT_ENABLE_REG) | BIT(data->hwirq);
-
-	guard(raw_spinlock)(&intc_ic->intc_lock);
-	writel(unmask, intc_ic->base + INTC_INT_ENABLE_REG);
-}
-
-static struct irq_chip aspeed_intc_chip = {
-	.name			= "ASPEED INTC",
-	.irq_mask		= aspeed_intc_irq_mask,
-	.irq_unmask		= aspeed_intc_irq_unmask,
-};
-
-static int aspeed_intc_ic_map_irq_domain(struct irq_domain *domain, unsigned int irq,
-					 irq_hw_number_t hwirq)
-{
-	irq_set_chip_and_handler(irq, &aspeed_intc_chip, handle_level_irq);
-	irq_set_chip_data(irq, domain->host_data);
-
-	return 0;
-}
-
-static const struct irq_domain_ops aspeed_intc_ic_irq_domain_ops = {
-	.map = aspeed_intc_ic_map_irq_domain,
-};
-
-static int __init aspeed_intc_ic_of_init(struct device_node *node,
-					 struct device_node *parent)
-{
-	struct aspeed_intc_ic *intc_ic;
-	int irq, i, ret = 0;
-
-	intc_ic = kzalloc(sizeof(*intc_ic), GFP_KERNEL);
-	if (!intc_ic)
-		return -ENOMEM;
-
-	intc_ic->base = of_iomap(node, 0);
-	if (!intc_ic->base) {
-		pr_err("Failed to iomap intc_ic base\n");
-		ret = -ENOMEM;
-		goto err_free_ic;
-	}
-	writel(0xffffffff, intc_ic->base + INTC_INT_STATUS_REG);
-	writel(0x0, intc_ic->base + INTC_INT_ENABLE_REG);
-
-	intc_ic->irq_domain = irq_domain_create_linear(of_fwnode_handle(node), INTC_IRQS_PER_WORD,
-						    &aspeed_intc_ic_irq_domain_ops, intc_ic);
-	if (!intc_ic->irq_domain) {
-		ret = -ENOMEM;
-		goto err_iounmap;
-	}
-
-	raw_spin_lock_init(&intc_ic->gic_lock);
-	raw_spin_lock_init(&intc_ic->intc_lock);
-
-	/* Check all the irq numbers valid. If not, unmaps all the base and frees the data. */
-	for (i = 0; i < of_irq_count(node); i++) {
-		irq = irq_of_parse_and_map(node, i);
-		if (!irq) {
-			pr_err("Failed to get irq number\n");
-			ret = -EINVAL;
-			goto err_iounmap;
-		}
-	}
-
-	for (i = 0; i < of_irq_count(node); i++) {
-		irq = irq_of_parse_and_map(node, i);
-		irq_set_chained_handler_and_data(irq, aspeed_intc_ic_irq_handler, intc_ic);
-	}
-
-	return 0;
-
-err_iounmap:
-	iounmap(intc_ic->base);
-err_free_ic:
-	kfree(intc_ic);
-	return ret;
-}
-
-IRQCHIP_DECLARE(ast2700_intc_ic, "aspeed,ast2700-intc-ic", aspeed_intc_ic_of_init);
-- 
2.43.0


