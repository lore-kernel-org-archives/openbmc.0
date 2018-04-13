Return-Path: <tcminyard@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::244; helo=mail-ot0-x244.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YuSpqNqT"; 
 dkim-atps=neutral
Received: from mail-ot0-x244.google.com (mail-ot0-x244.google.com
 [IPv6:2607:f8b0:4003:c0f::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N2Sn4RP7zF1gW
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 01:56:22 +1000 (AEST)
Received: by mail-ot0-x244.google.com with SMTP id j8-v6so10378463ota.7
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=v7KM0K1g+9aBom7TnL//NLHdHaPBWTtguL/NX3zb3wA=;
 b=YuSpqNqTfjHqFfbUIgblHdftfKH4J1kANZc37F1w4d8x081ZfCBEPiP0vL59NLzJIr
 rSz3xBnobpgji6aknDIidfROKnpmNpt/zyfG7CGRBNVcY0Ii1pSjWWFIjyzh4eiKj+3g
 PFtgiVck/lBaZjkU1mPg1555TQsufMij2t/dgBZlx3Db7CxA4GFpAin7sUwUYu7buMKt
 +SthjUXxobteoh6BZ3vYx38wCjqyixd5C8qLw8mxMNksY5C5EJ2AYLMH1IO9Eh4GFw1u
 vMxoCEDOr1XdC17kOxtR7fi4/0bbkvEqzK3cZwZEudKSFn7rNJ6MavJJS80EK8mrVekd
 dCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=v7KM0K1g+9aBom7TnL//NLHdHaPBWTtguL/NX3zb3wA=;
 b=rZGpVYChbDTiCXl8Aa8O1oaAYT1F/gWusTvwLeCUAb0G/ZjqIzvejFEflyyHd9gTcN
 9M4nNNX2nqqWsxSAuMlhSILfiy1BmNLujNACsTHOtxwz+xiwo5n+xfzdL9mvb7jeVEFS
 0B4+E8SK6jlKAs/soUZ5mYnY4wFfnXj/N0oukVrCheagB6figErggFf6OCCV4aaL7O2s
 +p0fO1qblOjmlRWfSagBpOzpXgSPT6JNUBqaHwLtYEi7wA82Yn2ts++27OTOlKj5IP07
 d3V3WwbHUfVpsmP7Se7VJSlNBx36yHPq9gUpT+1q1LpfaigzvQwrfAQOmn7Rfvky+ZeZ
 ouQA==
X-Gm-Message-State: ALQs6tCTEKG5vMy42Z/WaXjLFs4kDdzXXGJVZyxj9uB8UX8LpJom+dr1
 NZf/qOyYaqlfWT1njxf7iw==
X-Google-Smtp-Source: AIpwx48qMV3BUjb4IwSiUpKIz5oPha5o/NX4173Sih2jkKk323tLp4qlQcxuhyx5VChjjAig5foHpQ==
X-Received: by 2002:a9d:4494:: with SMTP id
 v20-v6mr3701570ote.397.1523634979805; 
 Fri, 13 Apr 2018 08:56:19 -0700 (PDT)
Received: from serve.minyard.net ([47.184.168.85])
 by smtp.gmail.com with ESMTPSA id w93-v6sm3943601ota.67.2018.04.13.08.56.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Apr 2018 08:56:18 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id C4D5F662;
 Fri, 13 Apr 2018 10:56:17 -0500 (CDT)
Reply-To: minyard@acm.org
Subject: Re: [PATCH ipmi/kcs_bmc v1] ipmi: add an NPCM7xx KCS BMC driver
To: Haiyue Wang <haiyue.wang@linux.intel.com>,
 openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: joel@jms.id.au, avifishman70@gmail.com
References: <1521723015-19142-1-git-send-email-haiyue.wang@linux.intel.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <4a878c46-9451-8ee6-c067-955a0bd651d0@acm.org>
Date: Fri, 13 Apr 2018 10:56:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1521723015-19142-1-git-send-email-haiyue.wang@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
X-List-Received-Date: Fri, 13 Apr 2018 15:56:26 -0000

On 03/22/2018 07:50 AM, Haiyue Wang wrote:
> This driver exposes the Keyboard Controller Style (KCS) interface on
> Novoton NPCM7xx SoCs as a character device. Such SOCs are commonly used
> as a BaseBoard Management Controller (BMC) on a server board, and KCS
> interface is commonly used to perform the in-band IPMI communication
> between the server and its BMC.

Sorry, I missed this.  It is queued for the next kernel release.

Thanks,

-corey

>
> Signed-off-by: Avi Fishman <avifishman70@gmail.com>
> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> ---
>   .../devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt   |  39 ++++
>   drivers/char/ipmi/Kconfig                          |  15 ++
>   drivers/char/ipmi/Makefile                         |   1 +
>   drivers/char/ipmi/kcs_bmc_npcm7xx.c                | 204 +++++++++++++++++++++
>   4 files changed, 259 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
>   create mode 100644 drivers/char/ipmi/kcs_bmc_npcm7xx.c
>
> diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> new file mode 100644
> index 0000000..3538a21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
> @@ -0,0 +1,39 @@
> +* Nuvoton NPCM7xx KCS (Keyboard Controller Style) IPMI interface
> +
> +The Nuvoton SOCs (NPCM7xx) are commonly used as BMCs
> +(Baseboard Management Controllers) and the KCS interface can be
> +used to perform in-band IPMI communication with their host.
> +
> +Required properties:
> +- compatible : should be one of
> +    "nuvoton,npcm750-kcs-bmc"
> +- interrupts : interrupt generated by the controller
> +- kcs_chan : The KCS channel number in the controller
> +
> +Example:
> +
> +    lpc_kcs: lpc_kcs@f0007000 {
> +        compatible = "nuvoton,npcm750-lpc-kcs", "simple-mfd", "syscon";
> +        reg = <0xf0007000 0x40>;
> +        reg-io-width = <1>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0xf0007000 0x40>;
> +
> +        kcs1: kcs1@0 {
> +            compatible = "nuvoton,npcm750-kcs-bmc";
> +            reg = <0x0 0x40>;
> +            interrupts = <0 9 4>;
> +            kcs_chan = <1>;
> +            status = "disabled";
> +        };
> +
> +        kcs2: kcs2@0 {
> +            compatible = "nuvoton,npcm750-kcs-bmc";
> +            reg = <0x0 0x40>;
> +            interrupts = <0 9 4>;
> +            kcs_chan = <2>;
> +            status = "disabled";
> +        };
> +    };
> \ No newline at end of file
> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 3bda116..470f976 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -111,6 +111,21 @@ config ASPEED_KCS_IPMI_BMC
>   	  The driver implements the BMC side of the KCS contorller, it
>   	  provides the access of KCS IO space for BMC side.
>   
> +config NPCM7XX_KCS_IPMI_BMC
> +	depends on ARCH_NPCM7XX || COMPILE_TEST
> +	select IPMI_KCS_BMC
> +	select REGMAP_MMIO
> +	tristate "NPCM7xx KCS IPMI BMC driver"
> +	help
> +	  Provides a driver for the KCS (Keyboard Controller Style) IPMI
> +	  interface found on Nuvoton NPCM7xx SOCs.
> +
> +	  The driver implements the BMC side of the KCS contorller, it
> +	  provides the access of KCS IO space for BMC side.
> +
> +	  This support is also available as a module.  If so, the module
> +	  will be called kcs_bmc_npcm7xx.
> +
>   config ASPEED_BT_IPMI_BMC
>   	depends on ARCH_ASPEED || COMPILE_TEST
>          depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index 21e9e87..7a3baf3 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -24,3 +24,4 @@ obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
>   obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
>   obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
>   obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
> +obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
> diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> new file mode 100644
> index 0000000..7bc898c
> --- /dev/null
> +++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, Nuvoton Corporation.
> + * Copyright (c) 2018, Intel Corporation.
> + */
> +
> +#define pr_fmt(fmt) "nuvoton-kcs-bmc: " fmt
> +
> +#include <linux/atomic.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#include "kcs_bmc.h"
> +
> +#define DEVICE_NAME	"npcm-kcs-bmc"
> +#define KCS_CHANNEL_MAX	3
> +
> +#define KCS1ST		0x0C
> +#define KCS2ST		0x1E
> +#define KCS3ST		0x30
> +
> +#define KCS1DO		0x0E
> +#define KCS2DO		0x20
> +#define KCS3DO		0x32
> +
> +#define KCS1DI		0x10
> +#define KCS2DI		0x22
> +#define KCS3DI		0x34
> +
> +#define KCS1CTL		0x18
> +#define KCS2CTL		0x2A
> +#define KCS3CTL		0x3C
> +#define    KCS_CTL_IBFIE	BIT(0)
> +
> +/*
> + * 7.2.4 Core KCS Registers
> + * Registers in this module are 8 bits. An 8-bit register must be accessed
> + * by an 8-bit read or write.
> + *
> + * sts: KCS Channel n Status Register (KCSnST).
> + * dob: KCS Channel n Data Out Buffer Register (KCSnDO).
> + * dib: KCS Channel n Data In Buffer Register (KCSnDI).
> + * ctl: KCS Channel n Control Register (KCSnCTL).
> + */
> +struct npcm7xx_kcs_reg {
> +	u32 sts;
> +	u32 dob;
> +	u32 dib;
> +	u32 ctl;
> +};
> +
> +struct npcm7xx_kcs_bmc {
> +	struct regmap *map;
> +
> +	const struct npcm7xx_kcs_reg *reg;
> +};
> +
> +static const struct npcm7xx_kcs_reg npcm7xx_kcs_reg_tbl[KCS_CHANNEL_MAX] = {
> +	{ .sts = KCS1ST, .dob = KCS1DO, .dib = KCS1DI, .ctl = KCS1CTL },
> +	{ .sts = KCS2ST, .dob = KCS2DO, .dib = KCS2DI, .ctl = KCS2CTL },
> +	{ .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL },
> +};
> +
> +static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
> +{
> +	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	u32 val = 0;
> +	int rc;
> +
> +	rc = regmap_read(priv->map, reg, &val);
> +	WARN(rc != 0, "regmap_read() failed: %d\n", rc);
> +
> +	return rc == 0 ? (u8)val : 0;
> +}
> +
> +static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
> +{
> +	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	int rc;
> +
> +	rc = regmap_write(priv->map, reg, data);
> +	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
> +}
> +
> +static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
> +{
> +	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +
> +	regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
> +			   enable ? KCS_CTL_IBFIE : 0);
> +}
> +
> +static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
> +{
> +	struct kcs_bmc *kcs_bmc = arg;
> +
> +	if (!kcs_bmc_handle_event(kcs_bmc))
> +		return IRQ_HANDLED;
> +
> +	return IRQ_NONE;
> +}
> +
> +static int npcm7xx_kcs_config_irq(struct kcs_bmc *kcs_bmc,
> +				  struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int irq;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	return devm_request_irq(dev, irq, npcm7xx_kcs_irq, IRQF_SHARED,
> +				dev_name(dev), kcs_bmc);
> +}
> +
> +static int npcm7xx_kcs_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct npcm7xx_kcs_bmc *priv;
> +	struct kcs_bmc *kcs_bmc;
> +	u32 chan;
> +	int rc;
> +
> +	rc = of_property_read_u32(dev->of_node, "kcs_chan", &chan);
> +	if (rc != 0 || chan == 0 || chan > KCS_CHANNEL_MAX) {
> +		dev_err(dev, "no valid 'kcs_chan' configured\n");
> +		return -ENODEV;
> +	}
> +
> +	kcs_bmc = kcs_bmc_alloc(dev, sizeof(*priv), chan);
> +	if (!kcs_bmc)
> +		return -ENOMEM;
> +
> +	priv = kcs_bmc_priv(kcs_bmc);
> +	priv->map = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(priv->map)) {
> +		dev_err(dev, "Couldn't get regmap\n");
> +		return -ENODEV;
> +	}
> +	priv->reg = &npcm7xx_kcs_reg_tbl[chan - 1];
> +
> +	kcs_bmc->ioreg.idr = priv->reg->dib;
> +	kcs_bmc->ioreg.odr = priv->reg->dob;
> +	kcs_bmc->ioreg.str = priv->reg->sts;
> +	kcs_bmc->io_inputb = npcm7xx_kcs_inb;
> +	kcs_bmc->io_outputb = npcm7xx_kcs_outb;
> +
> +	dev_set_drvdata(dev, kcs_bmc);
> +
> +	npcm7xx_kcs_enable_channel(kcs_bmc, true);
> +	rc = npcm7xx_kcs_config_irq(kcs_bmc, pdev);
> +	if (rc)
> +		return rc;
> +
> +	rc = misc_register(&kcs_bmc->miscdev);
> +	if (rc) {
> +		dev_err(dev, "Unable to register device\n");
> +		return rc;
> +	}
> +
> +	pr_info("channel=%u idr=0x%x odr=0x%x str=0x%x\n",
> +		chan,
> +		kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr, kcs_bmc->ioreg.str);
> +
> +	return 0;
> +}
> +
> +static int npcm7xx_kcs_remove(struct platform_device *pdev)
> +{
> +	struct kcs_bmc *kcs_bmc = dev_get_drvdata(&pdev->dev);
> +
> +	misc_deregister(&kcs_bmc->miscdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id npcm_kcs_bmc_match[] = {
> +	{ .compatible = "nuvoton,npcm750-kcs-bmc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, npcm_kcs_bmc_match);
> +
> +static struct platform_driver npcm_kcs_bmc_driver = {
> +	.driver = {
> +		.name		= DEVICE_NAME,
> +		.of_match_table	= npcm_kcs_bmc_match,
> +	},
> +	.probe	= npcm7xx_kcs_probe,
> +	.remove	= npcm7xx_kcs_remove,
> +};
> +module_platform_driver(npcm_kcs_bmc_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Avi Fishman <avifishman70@gmail.com>");
> +MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
> +MODULE_DESCRIPTION("NPCM7xx device interface to the KCS BMC device");
