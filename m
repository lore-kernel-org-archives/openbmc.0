Return-Path: <marc.zyngier@arm.com>
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vskf44xy6zDqZS
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 19:32:11 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E34A2B;
 Tue, 28 Mar 2017 01:32:08 -0700 (PDT)
Received: from [10.1.207.16] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 03FC33F220; Tue, 28 Mar 2017 01:32:03 -0700 (PDT)
Subject: Re: [PATCH v6 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller for
 Aspeed
To: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, joel@jms.id.au, vz@mleia.com, mouse@mayc.ru,
 clg@kaod.org
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-3-brendanhiggins@google.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 benh@kernel.crashing.org
From: Marc Zyngier <marc.zyngier@arm.com>
Organization: ARM Ltd
Message-ID: <49a13bbc-aec3-a349-4323-3c8d2728c62f@arm.com>
Date: Tue, 28 Mar 2017 09:32:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170328051226.21677-3-brendanhiggins@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 Mar 2017 22:33:42 +1100
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
X-List-Received-Date: Tue, 28 Mar 2017 08:32:13 -0000

Hi Brendan,

On 28/03/17 06:12, Brendan Higgins wrote:
> The Aspeed 24XX/25XX chips share a single hardware interrupt across 14
> separate I2C busses. This adds a dummy irqchip which maps the single
> hardware interrupt to software interrupts for each of the busses.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Added in v6:
>   - Pulled "aspeed_i2c_controller" out into a interrupt controller since that is
>     what it actually does.
> ---
>  drivers/irqchip/Makefile            |   2 +-
>  drivers/irqchip/irq-aspeed-i2c-ic.c | 102 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 103 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/irqchip/irq-aspeed-i2c-ic.c
> 
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 152bc40b6762..c136c2bd1761 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -74,6 +74,6 @@ obj-$(CONFIG_MVEBU_ODMI)		+= irq-mvebu-odmi.o
>  obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
>  obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
>  obj-$(CONFIG_EZNPS_GIC)			+= irq-eznps.o
> -obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o
> +obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o
>  obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
>  obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
> diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
> new file mode 100644
> index 000000000000..59c50b28dec0
> --- /dev/null
> +++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
> @@ -0,0 +1,102 @@
> +/*
> + *  Aspeed 24XX/25XX I2C Interrupt Controller.
> + *
> + *  Copyright (C) 2012-2017 ASPEED Technology Inc.
> + *  Copyright 2017 IBM Corporation
> + *  Copyright 2017 Google, Inc.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 as
> + *  published by the Free Software Foundation.
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
> + * The aspeed chip provides a single hardware interrupt for all of the I2C
> + * busses, so we use a dummy interrupt chip to translate this single interrupt
> + * into multiple interrupts, each associated with a single I2C bus.
> + */
> +static void aspeed_i2c_ic_irq_handler(struct irq_desc *desc)
> +{
> +	struct aspeed_i2c_ic *i2c_ic = irq_desc_get_handler_data(desc);
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
> + * Set simple handler and mark IRQ as valid. Nothing interesting to do here
> + * since we are using a dummy interrupt chip.
> + */
> +static int aspeed_i2c_ic_map_irq_domain(struct irq_domain *domain,
> +					unsigned int irq, irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_and_handler(irq, &dummy_irq_chip, handle_simple_irq);
> +	irq_set_chip_data(irq, domain->host_data);
> +
> +	return 0;
> +}

I'm a bit concerned by this. It means that you can't even mask an
interrupt. Is that really what you intend to do? Or all that the HW can
do? If you cannot mask an interrupt, you're at the mercy of a screaming
device...

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
