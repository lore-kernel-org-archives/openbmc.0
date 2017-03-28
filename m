Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsl5z563LzDqZS
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 19:52:55 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2S8qIZn015400;
 Tue, 28 Mar 2017 03:52:20 -0500
Message-ID: <1490691138.3177.109.camel@kernel.crashing.org>
Subject: Re: [PATCH v6 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller
 for Aspeed
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Tue, 28 Mar 2017 19:52:18 +1100
In-Reply-To: <20170328051226.21677-3-brendanhiggins@google.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-3-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 28 Mar 2017 08:52:56 -0000

On Mon, 2017-03-27 at 22:12 -0700, Brendan Higgins wrote:
> The Aspeed 24XX/25XX chips share a single hardware interrupt across
> 14
> separate I2C busses. This adds a dummy irqchip which maps the single
> hardware interrupt to software interrupts for each of the busses.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

I do think as I said earlier that is' a tiny bit overkill, I do worry
about the overhead of the added layer of indirections on a 400Mhz ARMv9
(AST2400) core but otherwise:

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

> ---
> Added in v6:
>   - Pulled "aspeed_i2c_controller" out into a interrupt controller
> since that is
>     what it actually does.
> ---
>  drivers/irqchip/Makefile            |   2 +-
>  drivers/irqchip/irq-aspeed-i2c-ic.c | 102
> ++++++++++++++++++++++++++++++++++++
>  2 files changed, 103 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/irqchip/irq-aspeed-i2c-ic.c
> 
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 152bc40b6762..c136c2bd1761 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -74,6 +74,6 @@ obj-$(CONFIG_MVEBU_ODMI)		+= irq-
> mvebu-odmi.o
>  obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
>  obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
>  obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
> -obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o
> +obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-
> aspeed-i2c-ic.o
>  obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
>  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-
> combiner.o
> diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c
> b/drivers/irqchip/irq-aspeed-i2c-ic.c
> new file mode 100644
> index 000000000000..59c50b28dec0
> --- /dev/null
> +++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
> @@ -0,0 +1,102 @@
> +/*
> + *  Aspeed 24XX/25XX I2C Interrupt Controller.
> + *
> + *  Copyright (C) 2012-2017 ASPEED Technology Inc.
> + *  Copyright 2017 IBM Corporation
> + *  Copyright 2017 Google, Inc.
> + *
> + *  This program is free software; you can redistribute it and/or
> modify
> + *  it under the terms of the GNU General Public License version 2
> as
> + *  published by the Free Software Foundation.
> + */
> +
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/io.h>
> +
> +
> +#define ASPEED_I2C_IC_NUM_BUS 14
> +
> +struct aspeed_i2c_ic {
> +	void __iomem		*base;
> +	int			parent_irq;
> +	struct irq_domain	*irq_domain;
> +};
> +
> +/*
> + * The aspeed chip provides a single hardware interrupt for all of
> the I2C
> + * busses, so we use a dummy interrupt chip to translate this single
> interrupt
> + * into multiple interrupts, each associated with a single I2C bus.
> + */
> +static void aspeed_i2c_ic_irq_handler(struct irq_desc *desc)
> +{
> +	struct aspeed_i2c_ic *i2c_ic =
> irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	unsigned long bit, status;
> +	unsigned int bus_irq;
> +
> +	chained_irq_enter(chip, desc);
> +	status = readl(i2c_ic->base);
> +	for_each_set_bit(bit, &status, ASPEED_I2C_IC_NUM_BUS) {
> +		bus_irq = irq_find_mapping(i2c_ic->irq_domain, bit);
> +		generic_handle_irq(bus_irq);
> +	}
> +	chained_irq_exit(chip, desc);
> +}
> +
> +/*
> + * Set simple handler and mark IRQ as valid. Nothing interesting to
> do here
> + * since we are using a dummy interrupt chip.
> + */
> +static int aspeed_i2c_ic_map_irq_domain(struct irq_domain *domain,
> +					unsigned int irq,
> irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_and_handler(irq, &dummy_irq_chip,
> handle_simple_irq);
> +	irq_set_chip_data(irq, domain->host_data);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops aspeed_i2c_ic_irq_domain_ops = {
> +	.map = aspeed_i2c_ic_map_irq_domain,
> +};
> +
> +static int __init aspeed_i2c_ic_of_init(struct device_node *node,
> +					struct device_node *parent)
> +{
> +	struct aspeed_i2c_ic *i2c_ic;
> +
> +	i2c_ic = kzalloc(sizeof(*i2c_ic), GFP_KERNEL);
> +	if (!i2c_ic)
> +		return -ENOMEM;
> +
> +	i2c_ic->base = of_iomap(node, 0);
> +	if (IS_ERR(i2c_ic->base))
> +		return PTR_ERR(i2c_ic->base);
> +
> +	i2c_ic->parent_irq = irq_of_parse_and_map(node, 0);
> +	if (i2c_ic->parent_irq < 0)
> +		return i2c_ic->parent_irq;
> +
> +	i2c_ic->irq_domain = irq_domain_add_linear(
> +			node, ASPEED_I2C_IC_NUM_BUS,
> +			&aspeed_i2c_ic_irq_domain_ops, NULL);
> +	if (!i2c_ic->irq_domain)
> +		return -ENOMEM;
> +
> +	i2c_ic->irq_domain->name = "ast-i2c-domain";
> +
> +	irq_set_chained_handler_and_data(i2c_ic->parent_irq,
> +					 aspeed_i2c_ic_irq_handler,
> i2c_ic);
> +
> +	pr_info("i2c controller registered, irq %d\n", i2c_ic-
> >parent_irq);
> +
> +	return 0;
> +}
> +
> +IRQCHIP_DECLARE(ast2400_i2c_ic, "aspeed,ast2400-i2c-ic",
> aspeed_i2c_ic_of_init);
> +IRQCHIP_DECLARE(ast2500_i2c_ic, "aspeed,ast2500-i2c-ic",
> aspeed_i2c_ic_of_init);
