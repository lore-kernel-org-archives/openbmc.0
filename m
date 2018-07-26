Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G0tnb7j+"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41bmbD6tYzzDqnG
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 19:12:55 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id j26-v6so377433pfi.10
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xn5QVjX5DTX70qYKyXZlwTUlna5IlUcxmCUNaCRoFw0=;
 b=G0tnb7j++RFRRQ8Iiw25wcpGKi+uN7cRfjBPTHMV/iwFMLEXgAQlFcL3BVDXZaSy6T
 4i8O4ub6hTf/w389V1ei+3PCr6O3r9XDrSJpaIHyGH22IswxNkS3HyxQdQZbx2kxv7TH
 6VcfN+uoNKuFJbohSxrx/tdUCIAk4uO6qdU6ffbz8oRQYoHxc60WCTjJttWKYs8oCrcZ
 AGdjklLMmIYFpZ5e0NIe5NHvOzzkwH32PGTOODW+eyVWYfcKDQAsT8sfU0oiDRYP+kjx
 FX8fNsfshey4aEGLIHcBy0o1Uem2h8IWXb5CG3j4lxyRDeg7QOq0RWb/e4e/nSyHYX2f
 X+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xn5QVjX5DTX70qYKyXZlwTUlna5IlUcxmCUNaCRoFw0=;
 b=cV897c4ZJWZ3TW+WFM77TsEto3WxVbRF9/T7AZ87rCUtY+t4SPu3RoT1YN0F2isr1f
 EvY0b0yckz/KWmNTCjfpUcG5O/k9TbxgCXRpet0qC6yWqvn488wzIcE7nYDbT0vusMXV
 i9e7poFzb1fOfGXTqVuB6dqeuZon+YWa8PdmcJCpt95QUb+7ftdfd9awA2BiGoKxIjgn
 7IGZJtbGZoXEfKNjt4mHB2G1Ml1uiL+8xuHdTG9unbus47itr52YNbeN8/UEWxWxqKen
 lC/7UeiZkwG2pkX/sV39nzTQWKln+EmC26F35h4hNQCRqvs9fCGOhDypTXWpoUmz6RJI
 gvYg==
X-Gm-Message-State: AOUpUlGVwyLEkMiNJGTV2WOFfphkPj41orjz4KOswE7tyHbCL/F9ukGG
 UpOMBYqAcm2SGSRFNgzg4ZM=
X-Google-Smtp-Source: AAOMgpeIVsYUvsYPDr2cuTg2Mmq0NuLQPl7gnNlONT4i7TyMt21fG1Q1Z5OTdOV4PjLyVkG1CKY5qQ==
X-Received: by 2002:a63:6b03:: with SMTP id g3-v6mr1154528pgc.57.1532596373527; 
 Thu, 26 Jul 2018 02:12:53 -0700 (PDT)
Received: from ryan-ubuntu (211-20-114-70.HINET-IP.hinet.net. [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id
 z5-v6sm3142707pfi.4.2018.07.26.02.12.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Jul 2018 02:12:52 -0700 (PDT)
Date: Thu, 26 Jul 2018 17:10:55 +0800
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, mine260309@gmail.com
Subject: Re: [PATCH linux dev-4.17 3/7] mmc: Aspeed: Add Aspeed sdhci core
 driver
Message-ID: <20180726091055.GA22202@ryan-ubuntu>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531812378-14316-4-git-send-email-ryanchen.aspeed@gmail.com>
 <24399f18e3ee62052398806906cebf242da2abb4.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24399f18e3ee62052398806906cebf242da2abb4.camel@kernel.crashing.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 26 Jul 2018 09:12:58 -0000

On Thu, Jul 26, 2018 at 11:41:49AM +1000, Benjamin Herrenschmidt wrote:
> On Tue, 2018-07-17 at 15:26 +0800, Ryan Chen wrote:
> > In Aspeed SoC's sdhci have two slots and have a interrupt status and
> > general information in top for register. add sdhci core driver
> > defore sdhci driver probe
> > 
> > V0->V1
> > move irqchip/irq-aspeed-sdhci-ic.c to drivers/mmc/host/aspeed-sdhci-core.c
> > 
> > Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
> > ---
> >  drivers/irqchip/Makefile              |   2 +-
> >  drivers/mmc/host/Makefile             |   1 +
> >  drivers/mmc/host/aspeed-sdhci-core.c  | 147 ++++++++++++++++++++++++++++++++++
> >  include/linux/mmc/sdhci-aspeed-data.h |  28 +++++++
> >  4 files changed, 177 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/mmc/host/aspeed-sdhci-core.c
> >  create mode 100644 include/linux/mmc/sdhci-aspeed-data.h
> > 
> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index 5ed465a..d99cb1d 100644
> > --- a/drivers/irqchip/Makefile
> > +++ b/drivers/irqchip/Makefile
> > @@ -78,7 +78,7 @@ obj-$(CONFIG_MVEBU_ODMI)		+= irq-mvebu-odmi.o
> >  obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
> >  obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
> >  obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
> > -obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
> > +obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o 
> >  obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
> >  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
> >  obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+= irq-uniphier-aidet.o
> > diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> > index 6aead24..c3e5a1f 100644
> > --- a/drivers/mmc/host/Makefile
> > +++ b/drivers/mmc/host/Makefile
> > @@ -78,6 +78,7 @@ obj-$(CONFIG_MMC_SDHCI_ESDHC_IMX)	+= sdhci-esdhc-imx.o
> >  obj-$(CONFIG_MMC_SDHCI_DOVE)		+= sdhci-dove.o
> >  obj-$(CONFIG_MMC_SDHCI_TEGRA)		+= sdhci-tegra.o
> >  obj-$(CONFIG_MMC_SDHCI_OF_ARASAN)	+= sdhci-of-arasan.o
> > +obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)	+= aspeed-sdhci-core.o
> >  obj-$(CONFIG_MMC_SDHCI_OF_AT91)		+= sdhci-of-at91.o
> >  obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+= sdhci-of-esdhc.o
> >  obj-$(CONFIG_MMC_SDHCI_OF_HLWD)		+= sdhci-of-hlwd.o
> > diff --git a/drivers/mmc/host/aspeed-sdhci-core.c b/drivers/mmc/host/aspeed-sdhci-core.c
> > new file mode 100644
> > index 0000000..c3d9d45
> > --- /dev/null
> > +++ b/drivers/mmc/host/aspeed-sdhci-core.c
> > @@ -0,0 +1,147 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * SDHCI IRQCHIP driver for the Aspeed SoC
> > + *
> > + * Copyright (C) ASPEED Technology Inc.
> > + * Ryan Chen <ryan_chen@aspeedtech.com>
> > + *
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or (at
> > + * your option) any later version.
> > + *
> > + */
> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/module.h>
> > +#include <linux/delay.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of.h>
> > +#include <linux/io.h>
> > +#include <linux/clk.h>
> > +#include <linux/mmc/sdhci-aspeed-data.h>
> > +
> > +#define ASPEED_SDHCI_SLOT_NUM			2
> > 
> 
> Change the "irq" prefixes on the functions.. Dont' do a chained
> handler, that will be too much overhead for no benefit. Your SoC aren't
> very fast and you want to avoid that overhead.
> 
> Just do a normal interrupt handler, and have it call each port
> interrupts.
> 
> This isn't really an interrupt controller, it has no
> enable/disable/masking ability, I would just create the ports directly
> from the same driver and process the interrupts.
> 
> I don't think there's benefit in keeping the ports as separate drivers.
> 
> > +static void aspeed_sdhci_irq_handler(struct irq_desc *desc)
> > +{
> > +	struct aspeed_sdhci_irq *sdhci_irq = irq_desc_get_handler_data(desc);
> > +	struct irq_chip *chip = irq_desc_get_chip(desc);
> > +	unsigned long bit, status;
> > +	unsigned int slot_irq;
> > +
> > +	chained_irq_enter(chip, desc);
> > +	status = readl(sdhci_irq->regs + ASPEED_SDHCI_ISR);
> > +	for_each_set_bit(bit, &status, ASPEED_SDHCI_SLOT_NUM) {
> > +		slot_irq = irq_find_mapping(sdhci_irq->irq_domain, bit);
> > +		generic_handle_irq(slot_irq);
> > +	}
> > +	chained_irq_exit(chip, desc);
> > +}
> > +
> > +static void noop(struct irq_data *data) { }
> > +
> > +static unsigned int noop_ret(struct irq_data *data)
> > +{
> > +	return 0;
> > +}
> > +
> > +struct irq_chip sdhci_irq_chip = {
> > +	.name		= "sdhci-ic",
> > +	.irq_startup	= noop_ret,
> > +	.irq_shutdown	= noop,
> > +	.irq_enable	= noop,
> > +	.irq_disable	= noop,
> > +	.irq_ack	= noop,
> > +	.irq_mask	= noop,
> > +	.irq_unmask	= noop,
> > +	.flags		= IRQCHIP_SKIP_SET_WAKE,
> > +};
> > +
> > +static int ast_sdhci_map_irq_domain(struct irq_domain *domain,
> > +				    unsigned int irq, irq_hw_number_t hwirq)
> > +{
> > +	irq_set_chip_and_handler(irq, &sdhci_irq_chip, handle_simple_irq);
> > +	irq_set_chip_data(irq, domain->host_data);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct irq_domain_ops aspeed_sdhci_irq_domain_ops = {
> > +	.map = ast_sdhci_map_irq_domain,
> > +};
> > +
> > +static int irq_aspeed_sdhci_probe(struct platform_device *pdev)
> > +{
> > +	struct aspeed_sdhci_irq *sdhci_irq;
> > +	struct clk *sdclk;
> > +
> > +	sdhci_irq = kzalloc(sizeof(*sdhci_irq), GFP_KERNEL);
> > +	if (!sdhci_irq)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, sdhci_irq);
> > +	//node->data = sdhci_irq;
> > +	pdev->dev.of_node->data = sdhci_irq;
> > +
> > +	sdhci_irq->regs = of_iomap(pdev->dev.of_node, 0);
> > +	if (IS_ERR(sdhci_irq->regs))
> > +		return PTR_ERR(sdhci_irq->regs);
> > +
> > +	sdclk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(sdclk)) {
> > +		dev_err(&pdev->dev, "no sdclk clock defined\n");
> > +		return PTR_ERR(sdclk);
> > +	}
> > +
> > +	clk_prepare_enable(sdclk);
> > +
> > +	sdhci_irq->parent_irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> > +	if (sdhci_irq->parent_irq < 0)
> > +		return sdhci_irq->parent_irq;
> > +
> > +	sdhci_irq->irq_domain = irq_domain_add_linear(
> > +					pdev->dev.of_node, ASPEED_SDHCI_SLOT_NUM,
> > +					&aspeed_sdhci_irq_domain_ops, NULL);
> > +	if (!sdhci_irq->irq_domain)
> > +		return -ENOMEM;
> > +
> > +	sdhci_irq->irq_domain->name = "aspeed-sdhci-irq";
> > +
> > +	irq_set_chained_handler_and_data(sdhci_irq->parent_irq,
> > +					 aspeed_sdhci_irq_handler, sdhci_irq);
> > +
> > +	pr_info("sdhci irq controller registered, irq %d\n", sdhci_irq->parent_irq);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id irq_aspeed_sdhci_dt_ids[] = {
> > +	{ .compatible = "aspeed,aspeed-sdhci-irq", },
> > +	{},
> > +};
> 
> You should call this aspeed,ast2{4,5}00-sdhci-core. I would change your
> device-tree representation as follow (add back all the reg &
> properties):
> 
> 	sdhci-core {
> 		reg = <common regs>
> 		ranges = either empty prop or the 2 ranges goign to the children
> 		compatible = <aspeed,ast2400-sdhci-core>;
> 
> 		sdhci-slot@xxx {
> 			compatible = <aspeed,ast2400-sdhci-slot>;
> 		};
> 
> 		sdhci-slot@yyy {
> 			compatible = <aspeed,ast2400-sdhci-slot>;
> 		};
> 	}
> 

If i keep the interrupt controller for dispatch slot. 
Is the following is compromise way for dts? 
Each slot need interrupt-parent.

&sdhci {

	sdhci_core: interrupt-controller@0 {
		#interrupt-cells = <1>;
		compatible = "aspeed,ast2500-sdhci-core";
		reg = <0x0 0x100>;
		interrupts = <26>;
		interrupt-controller;
		clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
	};

	sdhci_slot0: sdhci_slot@100 {
		compatible = "aspeed,ast2500-sdhci-slot";
		reg = <0x100 0x100>;
		interrupts = <0>;
		interrupt-parent = <&sdhci_core>;
		sdhci,auto-cmd12;
		clocks = <&syscon ASPEED_CLK_SDIO>;
		status = "disabled";
	};

	sdhci_slot1: sdhci_slot@200 {
		compatible = "aspeed,ast2500-sdhci-slot";
		reg = <0x200 0x100>;
		interrupts = <1>;
		interrupt-parent = <&sdhci_core>;
		sdhci,auto-cmd12;
		clocks = <&syscon ASPEED_CLK_SDIO>;
		status = "disabled";
	};

};



> > +MODULE_DEVICE_TABLE(of, irq_aspeed_sdhci_dt_ids);
> > +
> > +static struct platform_driver irq_aspeed_sdhci_device_driver = {
> > +	.probe		= irq_aspeed_sdhci_probe,
> > +	.driver		= {
> > +		.name   = KBUILD_MODNAME,
> > +		.of_match_table	= irq_aspeed_sdhci_dt_ids,
> > +	}
> > +};
> > +
> > +static int __init irq_aspeed_sdhci_init(void)
> > +{
> > +	return platform_driver_register(&irq_aspeed_sdhci_device_driver);
> > +}
> > +core_initcall(irq_aspeed_sdhci_init);
> 
> This should be a normal device init call, thus module_platform_driver
> is all you need here.
> 
> > +
> > +MODULE_AUTHOR("Ryan Chen");
> > +MODULE_DESCRIPTION("ASPEED SOC SDHCI IRQ Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/include/linux/mmc/sdhci-aspeed-data.h b/include/linux/mmc/sdhci-aspeed-data.h
> > new file mode 100644
> > index 0000000..fba2bf2
> > --- /dev/null
> > +++ b/include/linux/mmc/sdhci-aspeed-data.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef LINUX_MMC_SDHCI_ASPEED_DATA_H
> > +#define LINUX_MMC_SDHCI_ASPEED_DATA_H
> > +
> > +#include <linux/io.h>
> > +
> > +#define ASPEED_SDHCI_INFO			0x00
> > +#define  ASPEED_SDHCI_S1MMC8			BIT(25)
> > +#define  ASPEED_SDHCI_S0MMC8			BIT(24)
> > +#define ASPEED_SDHCI_BLOCK			0x04
> > +#define ASPEED_SDHCI_CTRL			0xF0
> > +#define ASPEED_SDHCI_ISR			0xFC
> > +
> > +struct aspeed_sdhci_irq {
> > +	void __iomem *regs;
> > +	int parent_irq;
> > +	struct irq_domain *irq_domain;
> > +};
> > +
> > +static inline void aspeed_sdhci_set_8bit_mode(struct aspeed_sdhci_irq *sdhci_irq, int mode)
> > +{
> > +	if (mode)
> > +		writel(ASPEED_SDHCI_S0MMC8 | readl(sdhci_irq->regs), sdhci_irq->regs);
> > +	else
> > +		writel(~ASPEED_SDHCI_S0MMC8 & readl(sdhci_irq->regs), sdhci_irq->regs);
> > +}
> > +
> > +#endif
> 
