Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8RNl5bpRzDvPX
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 11:56:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=h3ntchtH; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id i88so3103216pfk.2
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 17:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=message-id:subject:from:to:date:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ChKbzNSyzvrGc9QV8G1p6SAOPpjSPKH1mxZSF/P4BYc=;
 b=h3ntchtHDVYT00DR/EirZ3ERkYJgKIrPheuuO5Z9qKUKBPRjtmfpfbnASar1MxdyRp
 Hdc27ft9NadlBAyZwaj7lnwMeDjINZq+beHaiM5L9JRHxZQnAJ2I2BGFWtj4fYFs9IUT
 4domd84fPoi3Vf3kXRFF3/jHV+Rx28KlNq1B2ZLVlAlYmgnndDwXuiz9fXDrHW8oqRBT
 3hxHSIaW0ezGFCGYHlgTt4FUWXLRvyFoFvQI4lWuBx7A80c5h694muYCpSwbs4itAeXt
 6yZnBijvqQUB7JZR933l9oFvjigvIUWBVIu5tb4Rf4ZwrmbPdzeVnd486NBPcrn5GiSm
 jQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ChKbzNSyzvrGc9QV8G1p6SAOPpjSPKH1mxZSF/P4BYc=;
 b=d2yi2YLguVMZzrpFrp4oNy7zssXEogJh0gbFVmC0JidGbGCs4k+YsPQXcixnitf3HL
 hUtyJVTua/uT1ylwS5Pz+zZRodl6Mt9rV5TXQIcd5PiLxRuyJjAiZwe22xMh6SzL9id0
 LVsOyFU7S1viaGsvBRRqDFb2tO9IIj8H93oupANy7rW3rDYJG1yV6itOGM7AeW+tN3MO
 Yqc7W1cGheDfPpJ6P0yBUTaWzeIos6w/AjqAIv7jzJM/g4zl06CLkes23mUq8Z+lvWTh
 QjEXb4WBl+cwXHOE1+fZVOqEbEyRKxvBOWDVS9u8iGQWSKI+zIvd6jYzL1j8EfZwCMbw
 sF0Q==
X-Gm-Message-State: ABUngvfNoki81XmlS/bgq90GBGgeYXh7CnGmyZPyPLho3K1GmJk7RHDfSlP0EY9i6SNCfw==
X-Received: by 10.98.18.6 with SMTP id a6mr12126420pfj.184.1478134565883;
 Wed, 02 Nov 2016 17:56:05 -0700 (PDT)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id 186sm2167902pfv.61.2016.11.02.17.56.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Nov 2016 17:56:05 -0700 (PDT)
Message-ID: <1478134561.728.7.camel@gmail.com>
Subject: Re: [PATCH linux dev-4.7 4/8] ipmi: add an Aspeed BT IPMI BMC driver
From: Cyril Bur <cyrilbur@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 03 Nov 2016 11:56:01 +1100
In-Reply-To: <1477465067-19034-5-git-send-email-clg@kaod.org>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-5-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.2 
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
X-List-Received-Date: Thu, 03 Nov 2016 00:56:08 -0000

On Wed, 2016-10-26 at 08:57 +0200, Cédric Le Goater wrote:
> Backport from mainline of the main IPMI BMC driver patch plus fixes :
> 
>  - commit d94655b405ba ("ipmi/bt-bmc: remove redundant return value
>    check of platform_get_resource()")
>  - commit a3e6061bad62 ("ipmi/bt-bmc: add a dependency on
>    ARCH_ASPEED")
>  - commit 1a377a79211a ("ipmi: Fix ioremap error handling in bt-bmc")
>  - commit 54f9c4d0778b ("ipmi: add an Aspeed BT IPMI BMC driver")
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

[snip]

> +
> +static int bt_bmc_probe(struct platform_device *pdev)
> +{
> +	struct bt_bmc *bt_bmc;
> +	struct device *dev;
> +	struct resource *res;
> +	int rc;
> +
> +	if (!pdev || !pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	dev = &pdev->dev;
> +	dev_info(dev, "Found bt bmc device\n");
> +
> +	bt_bmc = devm_kzalloc(dev, sizeof(*bt_bmc), GFP_KERNEL);
> +	if (!bt_bmc)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&pdev->dev, bt_bmc);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	bt_bmc->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(bt_bmc->base))
> +		return PTR_ERR(bt_bmc->base);
> +
> +	mutex_init(&bt_bmc->mutex);
> +	init_waitqueue_head(&bt_bmc->queue);
> +
> +	bt_bmc->miscdev.minor	= MISC_DYNAMIC_MINOR,
> +		bt_bmc->miscdev.name	= DEVICE_NAME,
> +		bt_bmc->miscdev.fops	= &bt_bmc_fops,
> +		bt_bmc->miscdev.parent = dev;
> +	rc = misc_register(&bt_bmc->miscdev);
> +	if (rc) {
> +		dev_err(dev, "Unable to register misc device\n");
> +		return rc;
> +	}
> +
> +	bt_bmc_config_irq(bt_bmc, pdev);
> +
> +	if (bt_bmc->irq) {
> +		dev_info(dev, "Using IRQ %d\n", bt_bmc->irq);
> +	} else {
> +		dev_info(dev, "No IRQ; using timer\n");
> +		setup_timer(&bt_bmc->poll_timer, poll_timer,
> +			    (unsigned long)bt_bmc);
> +		bt_bmc->poll_timer.expires = jiffies +
> msecs_to_jiffies(10);
> +		add_timer(&bt_bmc->poll_timer);
> +	}
> +
> +	iowrite32((BT_IO_BASE << BT_CR0_IO_BASE) |
> +		  (BT_IRQ << BT_CR0_IRQ) |
> +		  BT_CR0_EN_CLR_SLV_RDP |
> +		  BT_CR0_EN_CLR_SLV_WRP |
> +		  BT_CR0_ENABLE_IBT,
> +		  bt_bmc->base + BT_CR0);
> +
> +	clr_b_busy(bt_bmc);
> +
> +	return 0;
> +}
> +
> +static int bt_bmc_remove(struct platform_device *pdev)
> +{
> +	struct bt_bmc *bt_bmc = dev_get_drvdata(&pdev->dev);
> +
> +	misc_deregister(&bt_bmc->miscdev);
> +	if (!bt_bmc->irq)
> +		del_timer_sync(&bt_bmc->poll_timer);

The old bt-host driver had:
       devm_iounmap(&pdev->dev, bt_host->base);
       devm_kfree(&pdev->dev, bt_host);

Is there kernel magic that means they aren't needed?

> +	return 0;
> +}
> +
> +static const struct of_device_id bt_bmc_match[] = {
> +	{ .compatible = "aspeed,ast2400-bt-bmc" },
> +	{ },
> +};
> +
> +static struct platform_driver bt_bmc_driver = {
> +	.driver = {
> +		.name		= DEVICE_NAME,
> +		.of_match_table = bt_bmc_match,
> +	},
> +	.probe = bt_bmc_probe,
> +	.remove = bt_bmc_remove,
> +};
> +
> +module_platform_driver(bt_bmc_driver);
> +
> +MODULE_DEVICE_TABLE(of, bt_bmc_match);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Alistair Popple <alistair@popple.id.au>");
> +MODULE_DESCRIPTION("Linux device interface to the BT interface");
> diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
> index ec10cfef166a..9493842de93b 100644
> --- a/include/uapi/linux/Kbuild
> +++ b/include/uapi/linux/Kbuild
> @@ -74,6 +74,7 @@ header-y += bpf_common.h
>  header-y += bpf.h
>  header-y += bpqether.h
>  header-y += bsg.h
> +header-y += bt-bmc.h
>  header-y += btrfs.h
>  header-y += can.h
>  header-y += capability.h
> diff --git a/include/uapi/linux/bt-bmc.h b/include/uapi/linux/bt-
> bmc.h
> new file mode 100644
> index 000000000000..d9ec766a63d0
> --- /dev/null
> +++ b/include/uapi/linux/bt-bmc.h
> @@ -0,0 +1,18 @@
> +/*
> + * Copyright (c) 2015-2016, IBM Corporation.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#ifndef _UAPI_LINUX_BT_BMC_H
> +#define _UAPI_LINUX_BT_BMC_H
> +
> +#include <linux/ioctl.h>
> +
> +#define __BT_BMC_IOCTL_MAGIC	0xb1
> +#define BT_BMC_IOCTL_SMS_ATN	_IO(__BT_BMC_IOCTL_MAGIC, 0x00)
> +
> +#endif /* _UAPI_LINUX_BT_BMC_H */
