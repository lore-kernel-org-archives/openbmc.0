Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znsJF5RLjzF1kp
 for <openbmc@lists.ozlabs.org>; Sat, 24 Feb 2018 00:19:23 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Feb 2018 05:19:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,383,1515484800"; d="scan'208";a="30125968"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.254.208.163])
 ([10.254.208.163])
 by orsmga003.jf.intel.com with ESMTP; 23 Feb 2018 05:19:16 -0800
Subject: Re: [PATCH arm/aspeed/ast2500 v2] eSPI: add ASPEED AST2500 eSPI
 driver to boot a host with PCH runs on eSPI
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, joel@jms.id.au,
 andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <1519369459-12468-1-git-send-email-haiyue.wang@linux.intel.com>
 <1519381535.10722.99.camel@linux.intel.com>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <ae72a9ca-e506-5279-c1b3-114e4eec2be3@linux.intel.com>
Date: Fri, 23 Feb 2018 21:19:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519381535.10722.99.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Fri, 23 Feb 2018 13:19:27 -0000

On 2018-02-23 18:25, Andy Shevchenko wrote:
> On Fri, 2018-02-23 at 15:04 +0800, Haiyue Wang wrote:
>> When PCH works under eSPI mode, the PMC (Power Management Controller)
>> in
>> PCH is waiting for SUS_ACK from BMC after it alerts SUS_WARN. It is in
>> dead loop if no SUS_ACK assert. This is the basic requirement for the
>> BMC
>> works as eSPI slave.
> So, do we have an agreement that the driver should go in this shape w/o
> interacting with SPI subsystem?
Not sure, I've added the specification of eSPI, hope people don't feel 
confused with SPI. :-)
> Also few comments below.
>
>> +config ASPEED_ESPI_SLAVE
>> +	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP_MMIO
> I would rather split this to two
> 	depends on REGMAP_MMIO
> 	depends on ARCH_ASPEED || COMPILE_TEST
OK, it looks clean. I referred to:
config ASPEED_LPC_CTRL
         depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON

>> +	tristate "Aspeed ast2500 eSPI slave device driver"
>> +	---help---
>> +	  Control Aspeed ast2500 eSPI slave controller to handle
>> event
>> +	  which needs the firmware's processing.
>> +#include <linux/of.h>
> What exactly requires this header?
Oh, I ctrl+c / ctrl+v from other device tree usage module. :-(
Remove it now. Thanks for making the code more clean.
>> +static int aspeed_espi_slave_probe(struct platform_device *pdev)
>> +{
>> +	struct aspeed_espi_slave_data *priv;
>> +	struct device *dev = &pdev->dev;
>> +	struct resource *res;
>> +	void __iomem *regs;
>> +	int rc;
>> +
>> +	dev_set_name(dev, DEVICE_NAME);
> Do this after checks and memory allocations.
Fixed!
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	regs = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(regs))
>> +		return PTR_ERR(regs);
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->map = devm_regmap_init_mmio(dev, regs,
>> &espi_slave_regmap_cfg);
>> +	if (IS_ERR(priv->map))
>> +		return PTR_ERR(priv->map);
>> +
>> +static const struct of_device_id of_espi_slave_match_table[] = {
>> +	{ .compatible = "aspeed,ast2500-espi-slave" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, of_espi_slave_match_table);
> This one should be closer to the struct of_device_id.
Fixed.
