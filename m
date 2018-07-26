Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41bZb745FBzF0dY
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 11:42:11 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6Q1fnVR028294;
 Wed, 25 Jul 2018 20:41:50 -0500
Message-ID: <24399f18e3ee62052398806906cebf242da2abb4.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.17 3/7] mmc: Aspeed: Add Aspeed sdhci core
 driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Ryan Chen <ryanchen.aspeed@gmail.com>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, ryan_chen@aspeedtech.com,
 mine260309@gmail.com
Date: Thu, 26 Jul 2018 11:41:49 +1000
In-Reply-To: <1531812378-14316-4-git-send-email-ryanchen.aspeed@gmail.com>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531812378-14316-4-git-send-email-ryanchen.aspeed@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.4 (3.28.4-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 26 Jul 2018 01:42:12 -0000

On Tue, 2018-07-17 at 15:26 +0800, Ryan Chen wrote:
> In Aspeed SoC's sdhci have two slots and have a interrupt status and
> general information in top for register. add sdhci core driver
> defore sdhci driver probe
> 
> V0->V1
> move irqchip/irq-aspeed-sdhci-ic.c to drivers/mmc/host/aspeed-sdhci-core.c
> 
> Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
> ---
>  drivers/irqchip/Makefile              |   2 +-
>  drivers/mmc/host/Makefile             |   1 +
>  drivers/mmc/host/aspeed-sdhci-core.c  | 147 ++++++++++++++++++++++++++++++++++
>  include/linux/mmc/sdhci-aspeed-data.h |  28 +++++++
>  4 files changed, 177 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/mmc/host/aspeed-sdhci-core.c
>  create mode 100644 include/linux/mmc/sdhci-aspeed-data.h
> 
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 5ed465a..d99cb1d 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -78,7 +78,7 @@ obj-$(CONFIG_MVEBU_ODMI)		+= irq-mvebu-odmi.o
>  obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
>  obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
>  obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
> -obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
> +obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o 
>  obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
>  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
>  obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+= irq-uniphier-aidet.o
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index 6aead24..c3e5a1f 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_MMC_SDHCI_ESDHC_IMX)	+= sdhci-esdhc-imx.o
>  obj-$(CONFIG_MMC_SDHCI_DOVE)		+= sdhci-dove.o
>  obj-$(CONFIG_MMC_SDHCI_TEGRA)		+= sdhci-tegra.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ARASAN)	+= sdhci-of-arasan.o
> +obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)	+= aspeed-sdhci-core.o
>  obj-$(CONFIG_MMC_SDHCI_OF_AT91)		+= sdhci-of-at91.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+= sdhci-of-esdhc.o
>  obj-$(CONFIG_MMC_SDHCI_OF_HLWD)		+= sdhci-of-hlwd.o
> diff --git a/drivers/mmc/host/aspeed-sdhci-core.c b/drivers/mmc/host/aspeed-sdhci-core.c
> new file mode 100644
> index 0000000..c3d9d45
> --- /dev/null
> +++ b/drivers/mmc/host/aspeed-sdhci-core.c
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SDHCI IRQCHIP driver for the Aspeed SoC
> + *
> + * Copyright (C) ASPEED Technology Inc.
> + * Ryan Chen <ryan_chen@aspeedtech.com>
> + *
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or (at
> + * your option) any later version.
> + *
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>
> +#include <linux/mmc/sdhci-aspeed-data.h>
> +
> +#define ASPEED_SDHCI_SLOT_NUM			2
> 

Change the "irq" prefixes on the functions.. Dont' do a chained
handler, that will be too much overhead for no benefit. Your SoC aren't
very fast and you want to avoid that overhead.

Just do a normal interrupt handler, and have it call each port
interrupts.

This isn't really an interrupt controller, it has no
enable/disable/masking ability, I would just create the ports directly
from the same driver and process the interrupts.

I don't think there's benefit in keeping the ports as separate drivers.

> +static void aspeed_sdhci_irq_handler(struct irq_desc *desc)
> +{
> +	struct aspeed_sdhci_irq *sdhci_irq = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	unsigned long bit, status;
> +	unsigned int slot_irq;
> +
> +	chained_irq_enter(chip, desc);
> +	status = readl(sdhci_irq->regs + ASPEED_SDHCI_ISR);
> +	for_each_set_bit(bit, &status, ASPEED_SDHCI_SLOT_NUM) {
> +		slot_irq = irq_find_mapping(sdhci_irq->irq_domain, bit);
> +		generic_handle_irq(slot_irq);
> +	}
> +	chained_irq_exit(chip, desc);
> +}
> +
> +static void noop(struct irq_data *data) { }
> +
> +static unsigned int noop_ret(struct irq_data *data)
> +{
> +	return 0;
> +}
> +
> +struct irq_chip sdhci_irq_chip = {
> +	.name		= "sdhci-ic",
> +	.irq_startup	= noop_ret,
> +	.irq_shutdown	= noop,
> +	.irq_enable	= noop,
> +	.irq_disable	= noop,
> +	.irq_ack	= noop,
> +	.irq_mask	= noop,
> +	.irq_unmask	= noop,
> +	.flags		= IRQCHIP_SKIP_SET_WAKE,
> +};
> +
> +static int ast_sdhci_map_irq_domain(struct irq_domain *domain,
> +				    unsigned int irq, irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_and_handler(irq, &sdhci_irq_chip, handle_simple_irq);
> +	irq_set_chip_data(irq, domain->host_data);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops aspeed_sdhci_irq_domain_ops = {
> +	.map = ast_sdhci_map_irq_domain,
> +};
> +
> +static int irq_aspeed_sdhci_probe(struct platform_device *pdev)
> +{
> +	struct aspeed_sdhci_irq *sdhci_irq;
> +	struct clk *sdclk;
> +
> +	sdhci_irq = kzalloc(sizeof(*sdhci_irq), GFP_KERNEL);
> +	if (!sdhci_irq)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, sdhci_irq);
> +	//node->data = sdhci_irq;
> +	pdev->dev.of_node->data = sdhci_irq;
> +
> +	sdhci_irq->regs = of_iomap(pdev->dev.of_node, 0);
> +	if (IS_ERR(sdhci_irq->regs))
> +		return PTR_ERR(sdhci_irq->regs);
> +
> +	sdclk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(sdclk)) {
> +		dev_err(&pdev->dev, "no sdclk clock defined\n");
> +		return PTR_ERR(sdclk);
> +	}
> +
> +	clk_prepare_enable(sdclk);
> +
> +	sdhci_irq->parent_irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +	if (sdhci_irq->parent_irq < 0)
> +		return sdhci_irq->parent_irq;
> +
> +	sdhci_irq->irq_domain = irq_domain_add_linear(
> +					pdev->dev.of_node, ASPEED_SDHCI_SLOT_NUM,
> +					&aspeed_sdhci_irq_domain_ops, NULL);
> +	if (!sdhci_irq->irq_domain)
> +		return -ENOMEM;
> +
> +	sdhci_irq->irq_domain->name = "aspeed-sdhci-irq";
> +
> +	irq_set_chained_handler_and_data(sdhci_irq->parent_irq,
> +					 aspeed_sdhci_irq_handler, sdhci_irq);
> +
> +	pr_info("sdhci irq controller registered, irq %d\n", sdhci_irq->parent_irq);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id irq_aspeed_sdhci_dt_ids[] = {
> +	{ .compatible = "aspeed,aspeed-sdhci-irq", },
> +	{},
> +};

You should call this aspeed,ast2{4,5}00-sdhci-core. I would change your
device-tree representation as follow (add back all the reg &
properties):

	sdhci-core {
		reg = <common regs>
		ranges = either empty prop or the 2 ranges goign to the children
		compatible = <aspeed,ast2400-sdhci-core>;

		sdhci-slot@xxx {
			compatible = <aspeed,ast2400-sdhci-slot>;
		};

		sdhci-slot@yyy {
			compatible = <aspeed,ast2400-sdhci-slot>;
		};
	}

> +MODULE_DEVICE_TABLE(of, irq_aspeed_sdhci_dt_ids);
> +
> +static struct platform_driver irq_aspeed_sdhci_device_driver = {
> +	.probe		= irq_aspeed_sdhci_probe,
> +	.driver		= {
> +		.name   = KBUILD_MODNAME,
> +		.of_match_table	= irq_aspeed_sdhci_dt_ids,
> +	}
> +};
> +
> +static int __init irq_aspeed_sdhci_init(void)
> +{
> +	return platform_driver_register(&irq_aspeed_sdhci_device_driver);
> +}
> +core_initcall(irq_aspeed_sdhci_init);

This should be a normal device init call, thus module_platform_driver
is all you need here.

> +
> +MODULE_AUTHOR("Ryan Chen");
> +MODULE_DESCRIPTION("ASPEED SOC SDHCI IRQ Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/mmc/sdhci-aspeed-data.h b/include/linux/mmc/sdhci-aspeed-data.h
> new file mode 100644
> index 0000000..fba2bf2
> --- /dev/null
> +++ b/include/linux/mmc/sdhci-aspeed-data.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef LINUX_MMC_SDHCI_ASPEED_DATA_H
> +#define LINUX_MMC_SDHCI_ASPEED_DATA_H
> +
> +#include <linux/io.h>
> +
> +#define ASPEED_SDHCI_INFO			0x00
> +#define  ASPEED_SDHCI_S1MMC8			BIT(25)
> +#define  ASPEED_SDHCI_S0MMC8			BIT(24)
> +#define ASPEED_SDHCI_BLOCK			0x04
> +#define ASPEED_SDHCI_CTRL			0xF0
> +#define ASPEED_SDHCI_ISR			0xFC
> +
> +struct aspeed_sdhci_irq {
> +	void __iomem *regs;
> +	int parent_irq;
> +	struct irq_domain *irq_domain;
> +};
> +
> +static inline void aspeed_sdhci_set_8bit_mode(struct aspeed_sdhci_irq *sdhci_irq, int mode)
> +{
> +	if (mode)
> +		writel(ASPEED_SDHCI_S0MMC8 | readl(sdhci_irq->regs), sdhci_irq->regs);
> +	else
> +		writel(~ASPEED_SDHCI_S0MMC8 & readl(sdhci_irq->regs), sdhci_irq->regs);
> +}
> +
> +#endif
