Return-Path: <andriy.shevchenko@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znnS14dF7zF1j0;
 Fri, 23 Feb 2018 21:25:44 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Feb 2018 02:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,382,1515484800"; d="scan'208";a="206378503"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga005.fm.intel.com with ESMTP; 23 Feb 2018 02:25:36 -0800
Message-ID: <1519381535.10722.99.camel@linux.intel.com>
Subject: Re: [PATCH arm/aspeed/ast2500 v2] eSPI: add ASPEED AST2500 eSPI
 driver to boot a host with PCH runs on eSPI
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Haiyue Wang <haiyue.wang@linux.intel.com>, joel@jms.id.au,
 andrew@aj.id.au,  arnd@arndb.de, gregkh@linuxfoundation.org,
 openbmc@lists.ozlabs.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Fri, 23 Feb 2018 12:25:35 +0200
In-Reply-To: <1519369459-12468-1-git-send-email-haiyue.wang@linux.intel.com>
References: <1519369459-12468-1-git-send-email-haiyue.wang@linux.intel.com>
Organization: Intel Finland Oy
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Feb 2018 10:25:54 -0000

On Fri, 2018-02-23 at 15:04 +0800, Haiyue Wang wrote:
> When PCH works under eSPI mode, the PMC (Power Management Controller)
> in
> PCH is waiting for SUS_ACK from BMC after it alerts SUS_WARN. It is in
> dead loop if no SUS_ACK assert. This is the basic requirement for the
> BMC
> works as eSPI slave.

So, do we have an agreement that the driver should go in this shape w/o
interacting with SPI subsystem?

Also few comments below.

> +config ASPEED_ESPI_SLAVE

> +	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP_MMIO

I would rather split this to two
	depends on REGMAP_MMIO
	depends on ARCH_ASPEED || COMPILE_TEST

> +	tristate "Aspeed ast2500 eSPI slave device driver"
> +	---help---
> +	  Control Aspeed ast2500 eSPI slave controller to handle
> event
> +	  which needs the firmware's processing.

> +#include <linux/of.h>

What exactly requires this header?

> +static int aspeed_espi_slave_probe(struct platform_device *pdev)
> +{
> +	struct aspeed_espi_slave_data *priv;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int rc;
> +

> +	dev_set_name(dev, DEVICE_NAME);

Do this after checks and memory allocations.

> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->map = devm_regmap_init_mmio(dev, regs,
> &espi_slave_regmap_cfg);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
> +

> +static const struct of_device_id of_espi_slave_match_table[] = {
> +	{ .compatible = "aspeed,ast2500-espi-slave" },
> +	{ }
> +};

> +MODULE_DEVICE_TABLE(of, of_espi_slave_match_table);

This one should be closer to the struct of_device_id.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
