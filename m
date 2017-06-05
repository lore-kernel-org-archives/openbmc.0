Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh0ZS3xF2zDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 13:25:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j4BksEsQ"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id h82so7472059ywb.3
 for <openbmc@lists.ozlabs.org>; Sun, 04 Jun 2017 20:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=HtZDHbiiH0ZNaE8LUksyEq7fwckrE/RtJ6k8sp05aMI=;
 b=j4BksEsQ8qq2RFrx1Mm5S7UP6+snHZKFughLrwKDlbxV5kq1wPznGaD/VZJ1ugOwXH
 eZEsJSMtg+isIZ6eRDOArMwyzJN0pyRozfqQHQy0si1BL455gMK6LFWvY2aK7itJY+Ao
 VcFZOzfkXz+ak6LAzVadDQ8Q6sVmwnZGuH969foKSIj2ioWv5bKwbYYXTqmH9nloMLBf
 L+pMKqFxHEBx0iVaReU6x7Kfn1+4ReYbTFkqRjFym/J5Nbr7wCGVoxFBm/4lLEfqw9j4
 SKGqGQNzpNDldsN4BGNAHqYkVxQFbNAE9903Rm237YYGz9wCco/6B+7s7HaWILZxxHz5
 Ff7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=HtZDHbiiH0ZNaE8LUksyEq7fwckrE/RtJ6k8sp05aMI=;
 b=anGttnFT3V+teF+vSXkFGaBXlY6dald9QCzc7M3tmjBVJQB8XIETBYhqM8iYqfsn3D
 6DCJcT9oUfd5M8V9imlhLOACXU4+1ZCy8hDC6Ywf6kC3R67ng1Kbial4XWbzM0xDYI0P
 vUKAD60up4cckLSR2kjd/XKSqIBmksQGNFJsLaS7VIBDhiRHMRdJg+dRC93oYSK/93g+
 aKIagCajrI/r/YhK2oYcJC+l62DsdtrKW5CFQ/uKZrBGuyifLF9aJkhO8uOEr9/UgKxc
 kodL27dP0irp6HJU1kBeIjP4EIkhyFHvKwJ/DPcvYAOklsTjuq8+nA4zafI7XFvek4QB
 gSEQ==
X-Gm-Message-State: AODbwcCi54LMHytuodNRDav4NzUGOrFy1R0ZNl47CMxg44kn8dqtwWVj
 mS59gUjiOSCIAjglZiXtvkaTdbbVGg==
X-Received: by 10.13.225.196 with SMTP id k187mr13351500ywe.178.1496633133972; 
 Sun, 04 Jun 2017 20:25:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Sun, 4 Jun 2017 20:25:13 -0700 (PDT)
In-Reply-To: <20170602215322.24376-1-rlippert@google.com>
References: <20170602215322.24376-1-rlippert@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 12:55:13 +0930
X-Google-Sender-Auth: 4L6_KsEcrzcpXeuJnEsHWwoi5-E
Message-ID: <CACPK8XfWySi5kDEASVpmDKAmBSByB6w0ocQxinazqTHbv+omcQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/misc: add Aspeed LPC snoop driver
To: Robert Lippert <roblip@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>, Robert Lippert <rlippert@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 05 Jun 2017 03:25:37 -0000

Hello Rob,

On Sat, Jun 3, 2017 at 7:23 AM, Robert Lippert <roblip@gmail.com> wrote:
> This driver enables the LPC snoop hardware on the ASPEED BMC
> which generates an interrupt upon every write to an I/O port
> by the host.
>
> This is typically used to monitor BIOS boot progress by listening
> to well-known debug port 80h.
>
> The functionality in this commit just saves all snooped values
> to a circular 2K buffer in the kernel, subsequent commits can
> act on the values to do things with them.

Reviewed-by: Joel Stanley <joel@jms.id.au>

The driver looks okay to me. I can stage it in the OpenBMC kernel tree
while we get it reviewed upstream.

Can you re-send to the upstream mailing lists so it gets reviewed
there. You will need to include a device tree binding document too
(something to put in Documentation/devicetree/bindings/).

Cheers,

Joel

>
> Signed-off-by: Robert Lippert <rlippert@google.com>
> ---
>  drivers/misc/Kconfig            |   8 ++
>  drivers/misc/Makefile           |   1 +
>  drivers/misc/aspeed-lpc-snoop.c | 261 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 270 insertions(+)
>  create mode 100644 drivers/misc/aspeed-lpc-snoop.c
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 07bbd4cc1852..8136dc7e863d 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -490,6 +490,14 @@ config ASPEED_LPC_CTRL
>           ioctl()s, the driver also provides a read/write interface to a BMC ram
>           region where the host LPC read/write region can be buffered.
>
> +config ASPEED_LPC_SNOOP
> +       tristate "Aspeed ast2500 HOST LPC snoop support"
> +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> +       help
> +         Provides a driver to control the LPC snoop interface which
> +         allows the BMC to listen on and save the data written by
> +         the host to an arbitrary LPC I/O port.
> +
>  config PCI_ENDPOINT_TEST
>         depends on PCI
>         select CRC32
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 81ef3e67acc9..b0b766416306 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -53,6 +53,7 @@ obj-$(CONFIG_ECHO)            += echo/
>  obj-$(CONFIG_VEXPRESS_SYSCFG)  += vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)         += cxl/
>  obj-$(CONFIG_ASPEED_LPC_CTRL)  += aspeed-lpc-ctrl.o
> +obj-$(CONFIG_ASPEED_LPC_SNOOP) += aspeed-lpc-snoop.o
>  obj-$(CONFIG_PCI_ENDPOINT_TEST)        += pci_endpoint_test.o
>
>  lkdtm-$(CONFIG_LKDTM)          += lkdtm_core.o
> diff --git a/drivers/misc/aspeed-lpc-snoop.c b/drivers/misc/aspeed-lpc-snoop.c
> new file mode 100644
> index 000000000000..593905565b74
> --- /dev/null
> +++ b/drivers/misc/aspeed-lpc-snoop.c
> @@ -0,0 +1,261 @@
> +/*
> + * Copyright 2017 Google Inc
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + *
> + * Provides a simple driver to control the ASPEED LPC snoop interface which
> + * allows the BMC to listen on and save the data written by
> + * the host to an arbitrary LPC I/O port.
> + *
> + * Typically used by the BMC to "watch" host boot progress via port
> + * 0x80 writes made by the BIOS during the boot process.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/interrupt.h>
> +#include <linux/kfifo.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define DEVICE_NAME    "aspeed-lpc-snoop"
> +
> +#define NUM_SNOOP_CHANNELS 2
> +#define SNOOP_FIFO_SIZE 2048
> +
> +#define HICR5  0x0
> +#define HICR5_EN_SNP0W         BIT(0)
> +#define HICR5_ENINT_SNP0W      BIT(1)
> +#define HICR5_EN_SNP1W         BIT(2)
> +#define HICR5_ENINT_SNP1W      BIT(3)
> +
> +#define HICR6  0x4
> +#define HICR6_STR_SNP0W                BIT(0)
> +#define HICR6_STR_SNP1W                BIT(1)
> +#define SNPWADR        0x10
> +#define SNPWADR_CH0_MASK       GENMASK(15, 0)
> +#define SNPWADR_CH0_SHIFT      0
> +#define SNPWADR_CH1_MASK       GENMASK(31, 16)
> +#define SNPWADR_CH1_SHIFT      16
> +#define SNPWDR 0x14
> +#define SNPWDR_CH0_MASK                GENMASK(7, 0)
> +#define SNPWDR_CH0_SHIFT       0
> +#define SNPWDR_CH1_MASK                GENMASK(15, 8)
> +#define SNPWDR_CH1_SHIFT       8
> +#define HICRB  0x80
> +#define HICRB_ENSNP0D          BIT(14)
> +#define HICRB_ENSNP1D          BIT(15)
> +
> +struct aspeed_lpc_snoop {
> +       struct regmap           *regmap;
> +       int                     irq;
> +       struct kfifo            snoop_fifo[NUM_SNOOP_CHANNELS];
> +};
> +
> +/* Save a byte to a FIFO and discard the oldest byte if FIFO is full */
> +static void put_fifo_with_discard(struct kfifo *fifo, u8 val)
> +{
> +       if (!kfifo_initialized(fifo))
> +               return;
> +       if (kfifo_is_full(fifo))
> +               kfifo_skip(fifo);
> +       kfifo_put(fifo, val);
> +}
> +
> +static irqreturn_t aspeed_lpc_snoop_irq(int irq, void *arg)
> +{
> +       struct aspeed_lpc_snoop *lpc_snoop = arg;
> +       u32 reg, data;
> +
> +       if (regmap_read(lpc_snoop->regmap, HICR6, &reg))
> +               return IRQ_NONE;
> +
> +       /* Check if one of the snoop channels is interrupting */
> +       reg &= (HICR6_STR_SNP0W | HICR6_STR_SNP1W);
> +       if (!reg)
> +               return IRQ_NONE;
> +
> +       /* Ack pending IRQs */
> +       regmap_write(lpc_snoop->regmap, HICR6, reg);
> +
> +       /* Read and save most recent snoop'ed data byte to FIFO */
> +       regmap_read(lpc_snoop->regmap, SNPWDR, &data);
> +
> +       if (reg & HICR6_STR_SNP0W) {
> +               u8 val = (data & SNPWDR_CH0_MASK) >> SNPWDR_CH0_SHIFT;
> +
> +               put_fifo_with_discard(&lpc_snoop->snoop_fifo[0], val);
> +       }
> +       if (reg & HICR6_STR_SNP1W) {
> +               u8 val = (data & SNPWDR_CH1_MASK) >> SNPWDR_CH1_SHIFT;
> +
> +               put_fifo_with_discard(&lpc_snoop->snoop_fifo[1], val);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
> +                                      struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       int rc;
> +
> +       lpc_snoop->irq = platform_get_irq(pdev, 0);
> +       if (!lpc_snoop->irq)
> +               return -ENODEV;
> +
> +       rc = devm_request_irq(dev, lpc_snoop->irq,
> +                             aspeed_lpc_snoop_irq, IRQF_SHARED,
> +                             DEVICE_NAME, lpc_snoop);
> +       if (rc < 0) {
> +               dev_warn(dev, "Unable to request IRQ %d\n", lpc_snoop->irq);
> +               lpc_snoop->irq = 0;
> +               return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
> +                                 int channel, u16 lpc_port)
> +{
> +       int rc = 0;
> +       u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
> +
> +       /* Create FIFO datastructure */
> +       rc = kfifo_alloc(&lpc_snoop->snoop_fifo[channel],
> +                        SNOOP_FIFO_SIZE, GFP_KERNEL);
> +       if (rc)
> +               return rc;
> +
> +       /* Enable LPC snoop channel at requested port */
> +       switch (channel) {
> +       case 0:
> +               hicr5_en = HICR5_EN_SNP0W | HICR5_ENINT_SNP0W;
> +               snpwadr_mask = SNPWADR_CH0_MASK;
> +               snpwadr_shift = SNPWADR_CH0_SHIFT;
> +               hicrb_en = HICRB_ENSNP0D;
> +               break;
> +       case 1:
> +               hicr5_en = HICR5_EN_SNP1W | HICR5_ENINT_SNP1W;
> +               snpwadr_mask = SNPWADR_CH1_MASK;
> +               snpwadr_shift = SNPWADR_CH1_SHIFT;
> +               hicrb_en = HICRB_ENSNP1D;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
> +       regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
> +                          lpc_port << snpwadr_shift);
> +       regmap_update_bits(lpc_snoop->regmap, HICRB, hicrb_en, hicrb_en);
> +
> +       return rc;
> +}
> +
> +static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
> +                                    int channel)
> +{
> +       switch (channel) {
> +       case 0:
> +               regmap_update_bits(lpc_snoop->regmap, HICR5,
> +                                  HICR5_EN_SNP0W | HICR5_ENINT_SNP0W,
> +                                  0);
> +               break;
> +       case 1:
> +               regmap_update_bits(lpc_snoop->regmap, HICR5,
> +                                  HICR5_EN_SNP1W | HICR5_ENINT_SNP1W,
> +                                  0);
> +               break;
> +       default:
> +               return;
> +       }
> +
> +       kfifo_free(&lpc_snoop->snoop_fifo[channel]);
> +}
> +
> +static int aspeed_lpc_snoop_probe(struct platform_device *pdev)
> +{
> +       struct aspeed_lpc_snoop *lpc_snoop;
> +       struct device *dev;
> +       u32 port;
> +       int rc;
> +
> +       dev = &pdev->dev;
> +
> +       lpc_snoop = devm_kzalloc(dev, sizeof(*lpc_snoop), GFP_KERNEL);
> +       if (!lpc_snoop)
> +               return -ENOMEM;
> +
> +       lpc_snoop->regmap = syscon_node_to_regmap(
> +                       pdev->dev.parent->of_node);
> +       if (IS_ERR(lpc_snoop->regmap)) {
> +               dev_err(dev, "Couldn't get regmap\n");
> +               return -ENODEV;
> +       }
> +
> +       dev_set_drvdata(&pdev->dev, lpc_snoop);
> +
> +       rc = of_property_read_u32_index(dev->of_node, "snoop-ports", 0, &port);
> +       if (rc) {
> +               dev_err(dev, "no snoop ports configured\n");
> +               return -ENODEV;
> +       }
> +
> +       rc = aspeed_lpc_snoop_config_irq(lpc_snoop, pdev);
> +       if (rc)
> +               return rc;
> +
> +       rc = aspeed_lpc_enable_snoop(lpc_snoop, 0, port);
> +       if (rc)
> +               return rc;
> +
> +       /* Configuration of 2nd snoop channel port is optional */
> +       if (of_property_read_u32_index(dev->of_node, "snoop-ports",
> +                                      1, &port) == 0) {
> +               rc = aspeed_lpc_enable_snoop(lpc_snoop, 1, port);
> +               if (rc)
> +                       aspeed_lpc_disable_snoop(lpc_snoop, 0);
> +       }
> +
> +       return rc;
> +}
> +
> +static int aspeed_lpc_snoop_remove(struct platform_device *pdev)
> +{
> +       struct aspeed_lpc_snoop *lpc_snoop = dev_get_drvdata(&pdev->dev);
> +
> +       /* Disable both snoop channels */
> +       aspeed_lpc_disable_snoop(lpc_snoop, 0);
> +       aspeed_lpc_disable_snoop(lpc_snoop, 1);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id aspeed_lpc_snoop_match[] = {
> +       { .compatible = "aspeed,ast2500-lpc-snoop" },
> +       { },
> +};
> +
> +static struct platform_driver aspeed_lpc_snoop_driver = {
> +       .driver = {
> +               .name           = DEVICE_NAME,
> +               .of_match_table = aspeed_lpc_snoop_match,
> +       },
> +       .probe = aspeed_lpc_snoop_probe,
> +       .remove = aspeed_lpc_snoop_remove,
> +};
> +
> +module_platform_driver(aspeed_lpc_snoop_driver);
> +
> +MODULE_DEVICE_TABLE(of, aspeed_lpc_snoop_match);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Robert Lippert <rlippert@google.com>");
> +MODULE_DESCRIPTION("Linux driver to control Aspeed LPC snoop functionality");
> --
> 2.13.0.506.g27d5fe0cd-goog
>
