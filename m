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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41c6SC6RhyzF0tm
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jul 2018 08:38:03 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6QMbiPn003704;
 Thu, 26 Jul 2018 17:37:45 -0500
Message-ID: <e6c0742f2302545cc2dc089e8e5e401588cdffd8.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.17 3/7] mmc: Aspeed: Add Aspeed sdhci core
 driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Ryan Chen <ryanchen.aspeed@gmail.com>
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, mine260309@gmail.com
Date: Fri, 27 Jul 2018 08:37:44 +1000
In-Reply-To: <20180726091055.GA22202@ryan-ubuntu>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531812378-14316-4-git-send-email-ryanchen.aspeed@gmail.com>
 <24399f18e3ee62052398806906cebf242da2abb4.camel@kernel.crashing.org>
 <20180726091055.GA22202@ryan-ubuntu>
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
X-List-Received-Date: Thu, 26 Jul 2018 22:38:04 -0000

On Thu, 2018-07-26 at 17:10 +0800, Ryan Chen wrote:
> On
> 
> If i keep the interrupt controller for dispatch slot. 
> Is the following is compromise way for dts? 
> Each slot need interrupt-parent.
> 
> &sdhci {
> 
> 	sdhci_core: interrupt-controller@0 {
> 		#interrupt-cells = <1>;
> 		compatible = "aspeed,ast2500-sdhci-core";
> 		reg = <0x0 0x100>;
> 		interrupts = <26>;
> 		interrupt-controller;
> 		clocks = <&syscon ASPEED_CLK_GATE_SDCLKCLK>;
> 	};
> 
> 	sdhci_slot0: sdhci_slot@100 {
> 		compatible = "aspeed,ast2500-sdhci-slot";
> 		reg = <0x100 0x100>;
> 		interrupts = <0>;
> 		interrupt-parent = <&sdhci_core>;
> 		sdhci,auto-cmd12;
> 		clocks = <&syscon ASPEED_CLK_SDIO>;
> 		status = "disabled";
> 	};
> 
> 	sdhci_slot1: sdhci_slot@200 {
> 		compatible = "aspeed,ast2500-sdhci-slot";
> 		reg = <0x200 0x100>;
> 		interrupts = <1>;
> 		interrupt-parent = <&sdhci_core>;
> 		sdhci,auto-cmd12;
> 		clocks = <&syscon ASPEED_CLK_SDIO>;
> 		status = "disabled";
> 	};

I think the "core" is more than just the interrupt controller. The
slots should be the children of it.

You don't necessarily need to treat the slots as being matched by a
separate driver, it complicates things imho, but up to you.

Ben.

> };
> 
> 
> 
> > > +MODULE_DEVICE_TABLE(of, irq_aspeed_sdhci_dt_ids);
> > > +
> > > +static struct platform_driver irq_aspeed_sdhci_device_driver = {
> > > +	.probe		= irq_aspeed_sdhci_probe,
> > > +	.driver		= {
> > > +		.name   = KBUILD_MODNAME,
> > > +		.of_match_table	= irq_aspeed_sdhci_dt_ids,
> > > +	}
> > > +};
> > > +
> > > +static int __init irq_aspeed_sdhci_init(void)
> > > +{
> > > +	return platform_driver_register(&irq_aspeed_sdhci_device_driver);
> > > +}
> > > +core_initcall(irq_aspeed_sdhci_init);
> > 
> > This should be a normal device init call, thus module_platform_driver
> > is all you need here.
> > 
> > > +
> > > +MODULE_AUTHOR("Ryan Chen");
> > > +MODULE_DESCRIPTION("ASPEED SOC SDHCI IRQ Driver");
> > > +MODULE_LICENSE("GPL v2");
> > > diff --git a/include/linux/mmc/sdhci-aspeed-data.h b/include/linux/mmc/sdhci-aspeed-data.h
> > > new file mode 100644
> > > index 0000000..fba2bf2
> > > --- /dev/null
> > > +++ b/include/linux/mmc/sdhci-aspeed-data.h
> > > @@ -0,0 +1,28 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef LINUX_MMC_SDHCI_ASPEED_DATA_H
> > > +#define LINUX_MMC_SDHCI_ASPEED_DATA_H
> > > +
> > > +#include <linux/io.h>
> > > +
> > > +#define ASPEED_SDHCI_INFO			0x00
> > > +#define  ASPEED_SDHCI_S1MMC8			BIT(25)
> > > +#define  ASPEED_SDHCI_S0MMC8			BIT(24)
> > > +#define ASPEED_SDHCI_BLOCK			0x04
> > > +#define ASPEED_SDHCI_CTRL			0xF0
> > > +#define ASPEED_SDHCI_ISR			0xFC
> > > +
> > > +struct aspeed_sdhci_irq {
> > > +	void __iomem *regs;
> > > +	int parent_irq;
> > > +	struct irq_domain *irq_domain;
> > > +};
> > > +
> > > +static inline void aspeed_sdhci_set_8bit_mode(struct aspeed_sdhci_irq *sdhci_irq, int mode)
> > > +{
> > > +	if (mode)
> > > +		writel(ASPEED_SDHCI_S0MMC8 | readl(sdhci_irq->regs), sdhci_irq->regs);
> > > +	else
> > > +		writel(~ASPEED_SDHCI_S0MMC8 & readl(sdhci_irq->regs), sdhci_irq->regs);
> > > +}
> > > +
> > > +#endif
