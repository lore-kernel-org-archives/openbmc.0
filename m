Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GbeHaZ7v"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zn25g3ZNxzF16y
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:52:23 +1100 (AEDT)
Received: by mail-qk0-x242.google.com with SMTP id d206so4997711qkb.3
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 20:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lkXjk23jeQ9mAgQp15SSVECOZgfHYwfb8AYyWSNbxxg=;
 b=GbeHaZ7vZ62U3gOXDp1Exrtxm/xSCosSalW/PncPXSzU7BInvoywlnazzWOON22StT
 bxb3UA0gLamnJ8pUjbUQvhmosYWngQfg5oBD8zsylNTM19quwhdWZKY5weyVe912e7/o
 eysqcBqbgRNamUaZVmgednoh7FTB4kC78bWDk+JUCMCdOsOil4isHotlVPcN+RcQF4/Y
 qQSCkQtrR2cPiwrFE6ZweEiwNwK0YEdz7UmeevAH7TbgjrBVRkvEG3TEsKfIzRYSlHeq
 G0wmXChnP/W3dHra62psIHx4KWGN9S+qUwgre1tjxYLL/81PCmmRRgWD2Gay1Uk5kxcN
 oVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lkXjk23jeQ9mAgQp15SSVECOZgfHYwfb8AYyWSNbxxg=;
 b=ilRI1MDzHHtjTHxqnDr2Dr/RrXCFmLq9ZVCUfewksvPHZ4W2vdCBJN2SGPxJk2kP5f
 kKRJNUr7I8pjPZRzx4HvWRzx0tVgJ91tHOS+6A64ErC58OVrN1UtIHSf1jFbPhjG74Js
 RA3WZG2gApqGyC3YAyhF8xq4pHKOeOxIJPAVLNIy3qL4BFHtZFwL4ka9x4Jom0BP1Df5
 k6QirEjZ/u0koOGuOHKOyWDIwxQ/rx/4yQJnoaLq9yEu/YEPT6V0Gi+uC13/w4KF+1/F
 QDOwtPKU1PiXSnGuA4MpjkXpJLajSZ+TW+Yv2zr+mlfpigqKWYQOMBmCA7a83+Owctde
 fqkQ==
X-Gm-Message-State: APf1xPAbHQuVgyIzukRrq3slEJDQBZ4lGGtCwxWhscKA1MxiPLZ9H3ot
 IROUD9RAj+ns0dR8FHNkiv5RVLGE0g0eE/5bA3g=
X-Google-Smtp-Source: AH8x227LrTXIIL6GYII/z/lrXS5vGpibn+cTBgyle1qp2g35yAFTh6JYiuu9HAEGFOs3Mi+7bSaY/Vjm8zTZfTr9SyQ=
X-Received: by 10.55.139.133 with SMTP id n127mr8920589qkd.231.1519275140865; 
 Wed, 21 Feb 2018 20:52:20 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Wed, 21 Feb 2018 20:52:00 -0800 (PST)
In-Reply-To: <20180221032554.9852-2-cyrilbur@gmail.com>
References: <20180221032554.9852-1-cyrilbur@gmail.com>
 <20180221032554.9852-2-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 22 Feb 2018 15:22:00 +1030
X-Google-Sender-Auth: VBHV-DJ39iRJnZAnPu8tnCD1fpY
Message-ID: <CACPK8XdxW0H_w7iSskSVk8BvQn5KZM89d03uYYP4xaT=eOc-gg@mail.gmail.com>
Subject: Re: [PATCH linux 2/2] drivers/misc: Add Aspeed LPC mbox register
 driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 22 Feb 2018 04:52:26 -0000

On Wed, Feb 21, 2018 at 1:55 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> This provides access to the LPC mbox registers on the ast2400 and
> ast2500 SoCs.
>
> This driver allows arbitrary reads and writes to the 16 mbox data registers

arbitrary sounds scary. Perhaps drop that word?

> on the Aspeed SoC LPC bus. These Aspeed chips are often used in BMC

ASPEED is all caps. I didn't used to, but I'm trying to converge on that.

> systems. This access allows for an inband communication channel with its
> host.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  drivers/misc/Kconfig           |   8 +
>  drivers/misc/Makefile          |   1 +
>  drivers/misc/aspeed-lpc-mbox.c | 343 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 352 insertions(+)
>  create mode 100644 drivers/misc/aspeed-lpc-mbox.c
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 03605f8fc0dc..ea1a723d0db3 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -488,6 +488,14 @@ config ASPEED_LPC_SNOOP
>           allows the BMC to listen on and save the data written by
>           the host to an arbitrary LPC I/O port.
>
> +config ASPEED_LPC_MBOX
> +       tristate "Aspeed ast2400/2500 LPC MBOX Controller"
> +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> +       help
> +         Provides a driver for the LPC attached MBOX registers on Aspeed
> +         SoCs (ast2400/2500). This allows for interrupt driven

delete (ast2400/2500)

> +         communication between a HOST and BMC.

s/HOST/host/

> +
>  config PCI_ENDPOINT_TEST
>         depends on PCI
>         select CRC32
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index c3c8624f4d95..32b1db960f33 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -54,6 +54,7 @@ obj-$(CONFIG_VEXPRESS_SYSCFG) += vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)         += cxl/
>  obj-$(CONFIG_ASPEED_LPC_CTRL)  += aspeed-lpc-ctrl.o
>  obj-$(CONFIG_ASPEED_LPC_SNOOP) += aspeed-lpc-snoop.o
> +obj-$(CONFIG_ASPEED_LPC_MBOX)  += aspeed-lpc-mbox.o
>  obj-$(CONFIG_PCI_ENDPOINT_TEST)        += pci_endpoint_test.o
>  obj-$(CONFIG_OCXL)             += ocxl/
>  obj-$(CONFIG_MISC_RTSX)                += cardreader/
> diff --git a/drivers/misc/aspeed-lpc-mbox.c b/drivers/misc/aspeed-lpc-mbox.c
> new file mode 100644
> index 000000000000..c4e468ab3524
> --- /dev/null
> +++ b/drivers/misc/aspeed-lpc-mbox.c
> @@ -0,0 +1,343 @@
> +/*
> + * Copyright 2018 IBM Corporation
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */

Cool kids do this one now:

// SPDX-License-Identifier: GPL-2.0+
// Copyright 2018 IBM Corporation

> +
> +#include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/poll.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define DEVICE_NAME    "aspeed-mbox"
> +
> +#define ASPEED_MBOX_NUM_REGS 16
> +
> +#define ASPEED_MBOX_DATA_0 0x00
> +#define ASPEED_MBOX_STATUS_0 0x40
> +#define ASPEED_MBOX_STATUS_1 0x44
> +#define ASPEED_MBOX_BMC_CTRL 0x48
> +#define   ASPEED_MBOX_CTRL_RECV BIT(7)
> +#define   ASPEED_MBOX_CTRL_MASK BIT(1)
> +#define   ASPEED_MBOX_CTRL_SEND BIT(0)
> +#define ASPEED_MBOX_HOST_CTRL 0x4c
> +#define ASPEED_MBOX_INTERRUPT_0 0x50
> +#define ASPEED_MBOX_INTERRUPT_1 0x54
> +
> +struct aspeed_mbox {
> +       struct miscdevice       miscdev;
> +       struct regmap           *regmap;
> +       unsigned int            base;
> +       wait_queue_head_t       queue;
> +       struct mutex            mutex;
> +};
> +
> +static atomic_t aspeed_mbox_open_count = ATOMIC_INIT(0);
> +
> +static u8 aspeed_mbox_inb(struct aspeed_mbox *mbox, int reg)
> +{
> +       /*
> +        * The mbox registers are actually only one byte but are addressed
> +        * four bytes apart. The other three bytes are marked 'reserved',
> +        * they *should* be zero but lets not rely on it.
> +        * I am going to rely on the fact we can casually read/write to them...
> +        */
> +       unsigned int val = 0xff; /* If regmap throws an error return 0xff */
> +       int rc = regmap_read(mbox->regmap, mbox->base + reg, &val);
> +
> +       if (rc)
> +               dev_err(mbox->miscdev.parent,
> +                       "regmap_read() failed with %d (reg: 0x%08x)\n",
> +                       rc, reg);
> +
> +       return val & 0xff;
> +}

This is a mess. I'd prefer:

static u8 aspeed_mbox_inb(struct aspeed_mbox *mbox, int reg)
{
       int val;

       regmap_read(mbox->regmap, mbox->base + reg, &val);

       return val;
}

static void aspeed_mbox_outb(struct aspeed_mbox *mbox, u8 data, int reg)
{
       regmap_write(mbox->regmap, mbox->base + reg, data);
}

Reads and writes to a mmio address will never fail. Regmap incurs
enough overhead already; we don't need to add more in the driver.

> +
> +static void aspeed_mbox_outb(struct aspeed_mbox *mbox, u8 data, int reg)
> +{
> +       int rc = regmap_write(mbox->regmap, mbox->base + reg, data);
> +
> +       if (rc)
> +               dev_err(mbox->miscdev.parent,
> +                       "regmap_write() failed with %d (data: %u reg: 0x%08x)\n",
> +                       rc, data, reg);
> +}
> +
> +static struct aspeed_mbox *file_mbox(struct file *file)
> +{
> +       return container_of(file->private_data, struct aspeed_mbox, miscdev);
> +}
> +
> +static int aspeed_mbox_open(struct inode *inode, struct file *file)
> +{
> +       struct aspeed_mbox *mbox = file_mbox(file);
> +
> +       if (atomic_inc_return(&aspeed_mbox_open_count) == 1) {
> +               /*
> +                * Clear the interrupt status bit if it was left on and unmask
> +                * interrupts.
> +                * ASPEED_MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step
> +                */
> +               aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV,
> +                               ASPEED_MBOX_BMC_CTRL);
> +               return 0;
> +       }
> +
> +       atomic_dec(&aspeed_mbox_open_count);
> +       return -EBUSY;
> +}
> +
> +static ssize_t aspeed_mbox_read(struct file *file, char __user *buf,
> +                               size_t count, loff_t *ppos)
> +{
> +       struct aspeed_mbox *mbox = file_mbox(file);
> +       char __user *p = buf;
> +       ssize_t ret;
> +       int i;
> +
> +       if (!access_ok(VERIFY_WRITE, buf, count))
> +               return -EFAULT;
> +
> +       if (count + *ppos > ASPEED_MBOX_NUM_REGS)
> +               return -EINVAL;
> +
> +       if (file->f_flags & O_NONBLOCK) {
> +               if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> +                       ASPEED_MBOX_CTRL_RECV))
> +                       return -EAGAIN;
> +       } else if (wait_event_interruptible(mbox->queue,
> +                       aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> +                       ASPEED_MBOX_CTRL_RECV)) {
> +               return -ERESTARTSYS;
> +       }
> +
> +       mutex_lock(&mbox->mutex);
> +
> +       for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
> +               uint8_t reg = aspeed_mbox_inb(mbox,
> +                               ASPEED_MBOX_DATA_0 + (i * 4));
> +
> +               ret = __put_user(reg, p);
> +               if (ret)
> +                       goto out_unlock;
> +
> +               p++;
> +               count--;
> +       }
> +
> +       /*
> +        * ASPEED_MBOX_CTRL_RECV bit is write to clear
> +        * also unmasks in 1 step
> +        */
> +       aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV,
> +                       ASPEED_MBOX_BMC_CTRL);
> +       ret = p - buf;
> +
> +out_unlock:
> +       mutex_unlock(&mbox->mutex);
> +       return ret;
> +}
> +
> +static ssize_t aspeed_mbox_write(struct file *file, const char __user *buf,
> +                               size_t count, loff_t *ppos)
> +{
> +       struct aspeed_mbox *mbox = file_mbox(file);
> +       const char __user *p = buf;
> +       ssize_t ret;
> +       char c;
> +       int i;
> +
> +       if (!access_ok(VERIFY_READ, buf, count))
> +               return -EFAULT;
> +
> +       if (count + *ppos > ASPEED_MBOX_NUM_REGS)
> +               return -EINVAL;
> +
> +       mutex_lock(&mbox->mutex);
> +
> +       for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
> +               ret = __get_user(c, p);
> +               if (ret)
> +                       goto out_unlock;
> +
> +               aspeed_mbox_outb(mbox, c, ASPEED_MBOX_DATA_0 + (i * 4));
> +               p++;
> +               count--;
> +       }
> +
> +       aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_SEND, ASPEED_MBOX_BMC_CTRL);
> +       ret = p - buf;
> +
> +out_unlock:
> +       mutex_unlock(&mbox->mutex);
> +       return ret;
> +}
> +
> +static unsigned int aspeed_mbox_poll(struct file *file, poll_table *wait)
> +{
> +       struct aspeed_mbox *mbox = file_mbox(file);
> +       unsigned int mask = 0;
> +
> +       poll_wait(file, &mbox->queue, wait);
> +
> +       if (aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) & ASPEED_MBOX_CTRL_RECV)
> +               mask |= POLLIN;
> +
> +       return mask;
> +}
> +
> +static int aspeed_mbox_release(struct inode *inode, struct file *file)
> +{
> +       atomic_dec(&aspeed_mbox_open_count);
> +       return 0;
> +}
> +
> +static const struct file_operations aspeed_mbox_fops = {
> +       .owner          = THIS_MODULE,
> +       .llseek         = no_seek_end_llseek,
> +       .read           = aspeed_mbox_read,
> +       .write          = aspeed_mbox_write,
> +       .open           = aspeed_mbox_open,
> +       .release        = aspeed_mbox_release,
> +       .poll           = aspeed_mbox_poll,
> +};
> +
> +static irqreturn_t aspeed_mbox_irq(int irq, void *arg)
> +{
> +       struct aspeed_mbox *mbox = arg;
> +
> +       if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL)
> +                               & ASPEED_MBOX_CTRL_RECV))
> +               return IRQ_NONE;
> +
> +       /*
> +        * Leave the status bit set so that we know the data is for us,
> +        * clear it once it has been read.
> +        */
> +
> +       /* Mask it off, we'll clear it when we the data gets read */
> +       aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_MASK, ASPEED_MBOX_BMC_CTRL);
> +
> +       wake_up(&mbox->queue);
> +       return IRQ_HANDLED;
> +}
> +
> +static int aspeed_mbox_config_irq(struct aspeed_mbox *mbox,
> +               struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       int rc, irq;
> +
> +       irq = irq_of_parse_and_map(dev->of_node, 0);
> +       if (!irq)
> +               return -ENODEV;
> +
> +       rc = devm_request_irq(dev, irq, aspeed_mbox_irq,
> +                       IRQF_SHARED, DEVICE_NAME, mbox);
> +       if (rc < 0) {
> +               dev_err(dev, "Unable to request IRQ %d\n", irq);
> +               return rc;
> +       }
> +
> +       /*
> +        * Disable all register based interrupts.
> +        */
> +       aspeed_mbox_outb(mbox, 0x00, ASPEED_MBOX_INTERRUPT_0); /* regs 0 - 7 */
> +       aspeed_mbox_outb(mbox, 0x00, ASPEED_MBOX_INTERRUPT_1); /* regs 8 - 15 */
> +
> +       /* These registers are write one to clear. Clear them. */
> +       aspeed_mbox_outb(mbox, 0xff, ASPEED_MBOX_STATUS_0);
> +       aspeed_mbox_outb(mbox, 0xff, ASPEED_MBOX_STATUS_1);
> +
> +       aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV, ASPEED_MBOX_BMC_CTRL);
> +       return 0;
> +}
> +
> +static int aspeed_mbox_probe(struct platform_device *pdev)
> +{
> +       struct aspeed_mbox *mbox;
> +       struct device *dev;
> +       int rc;
> +
> +       dev = &pdev->dev;
> +
> +       mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +       if (!mbox)
> +               return -ENOMEM;
> +
> +       dev_set_drvdata(&pdev->dev, mbox);
> +
> +       rc = of_property_read_u32(dev->of_node, "reg", &mbox->base);
> +       if (rc) {
> +               dev_err(dev, "Couldn't read reg device-tree property\n");
> +               return rc;
> +       }
> +
> +       mbox->regmap = syscon_node_to_regmap(
> +                       pdev->dev.parent->of_node);
> +       if (IS_ERR(mbox->regmap)) {
> +               dev_err(dev, "Couldn't get regmap\n");
> +               return -ENODEV;
> +       }
> +
> +       mutex_init(&mbox->mutex);
> +       init_waitqueue_head(&mbox->queue);
> +
> +       mbox->miscdev.minor = MISC_DYNAMIC_MINOR;
> +       mbox->miscdev.name = DEVICE_NAME;
> +       mbox->miscdev.fops = &aspeed_mbox_fops;
> +       mbox->miscdev.parent = dev;
> +       rc = misc_register(&mbox->miscdev);
> +       if (rc) {
> +               dev_err(dev, "Unable to register device\n");
> +               return rc;
> +       }
> +
> +       rc = aspeed_mbox_config_irq(mbox, pdev);
> +       if (rc) {
> +               dev_err(dev, "Failed to configure IRQ\n");
> +               misc_deregister(&mbox->miscdev);
> +               return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +static int aspeed_mbox_remove(struct platform_device *pdev)
> +{
> +       struct aspeed_mbox *mbox = dev_get_drvdata(&pdev->dev);
> +
> +       misc_deregister(&mbox->miscdev);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id aspeed_mbox_match[] = {
> +       { .compatible = "aspeed,ast2400-mbox" },
> +       { .compatible = "aspeed,ast2500-mbox" },
> +       { },
> +};
> +
> +static struct platform_driver aspeed_mbox_driver = {
> +       .driver = {
> +               .name           = DEVICE_NAME,
> +               .of_match_table = aspeed_mbox_match,
> +       },
> +       .probe = aspeed_mbox_probe,
> +       .remove = aspeed_mbox_remove,
> +};
> +
> +module_platform_driver(aspeed_mbox_driver);
> +
> +MODULE_DEVICE_TABLE(of, aspeed_mbox_match);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> +MODULE_DESCRIPTION("Aspeed LPC MBOX reg device driver");
> --
> 2.16.2
>
