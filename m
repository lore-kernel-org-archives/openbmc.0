Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td1PM5SD3zDvjf
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 11:51:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="v+KKLEeP"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id b35so10332879uaa.1
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 16:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dxU17wJmUT9wova+dbHRHoR66DKWfGaFDD/Y2B0ZXo8=;
 b=v+KKLEeP52cRNg4rdBV8s0n2pIOnESlfURElvxVOhdsG6Y2ah9FAcAQTckEb/dvKxV
 DYByI6dPhzFzq/ioKfNGqsYe+nZlDwcm3ddvAWzVHFwk2G4RY4KukJd9on3Uo0EuRMq5
 Kxo9QXTbH/juTLRaRvaojUNM1TnjpWb/i2T2ci0TRJrc7Ocjb9/JKCBpwlFkWv3ujwl8
 fy0MoBJGyo7tsApfBFiMY7yfpdPk14MfbfNMMnp1GmeQObAspnzROc9rFHMKI2oFg/PA
 rqTl/0cNV+CZM7wHh+003EUQPNn7wO825Vfc9+P+Z9UJHd4IlgaH2n4NxuHNb5xgWJrV
 O3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dxU17wJmUT9wova+dbHRHoR66DKWfGaFDD/Y2B0ZXo8=;
 b=EHTym0hc21mnLExUG7fgEkZmBpIg8RtIafXTzMJX4nBUtg8edS4PBO8ru98MI3kJKD
 J5BpIRmfaPx8DYCFJ4csUtl4w7rjPniVKUjPMmFGeS0tVLAKXl4MmyzMgZ3h+xcweAea
 CFfRStrujC87S+f6U54LogPEhMStzWBwuRoyNYv598ngGziNW6RzV1X5tA2Ha5FjwO8G
 QE8jRYg/XkX2AOdbF5js29o9ZbBpa6/K6I8WYr4O280/sAqck6YtnwHafk+QQpbOc205
 4ugBMsLkOzBBDLGkLJ9e6BmvR7di7BX8WlHHuJyM3YYJwwn2PQnxqxLxROg6LQugkxuy
 AAig==
X-Gm-Message-State: AKaTC00OxIBk0L8Lqm/SY+u8aRM7xUtWbz25DGLY3twkmHTPb5sNCiJSflgDQiKEWDjOOuLnxgvhdqdY1B0/OA==
X-Received: by 10.159.50.138 with SMTP id l10mr64550448uab.166.1481590309448; 
 Mon, 12 Dec 2016 16:51:49 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Mon, 12 Dec 2016 16:51:28 -0800 (PST)
In-Reply-To: <20161209054323.7320-4-cyrilbur@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-4-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Dec 2016 11:51:28 +1100
X-Google-Sender-Auth: zRHYZImWu8zIdsmY4GAQVRpMFXM
Message-ID: <CACPK8XeS71PN7fo_9DPD-L81RD89B+spyd13_CM8SRabuZQ6VA@mail.gmail.com>
Subject: Re: [PATCH linux 3/3] drivers/misc: Add aspeed lpc controlling driver
To: Cyril Bur <cyrilbur@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 13 Dec 2016 00:51:52 -0000

Hi Cyril,

On Fri, Dec 9, 2016 at 4:43 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> This driver exposes a reserved chunk of BMC ram to userspace as well as
> an ioctl interface to control the BMC<->HOST mapping of the LPC bus.
> This allows for a communication channel between the BMC and the host

Jagha and Andrew are both interested in a LPC Host Controller driver.

I like your ioctl approach.

Is the register layout generic to many LPC Host Controllers, or is it
specific to the Aspeed chips? If it's specific then perhaps we should
add the aspeed_ prefix to the filename, kconfig symbol and functions.

Andrew has recently sent device tree bindings upstream for the LPC
address space. You should review them to make sure they describe the
hardware well enough for your purposes:

 http://patchwork.ozlabs.org/patch/693032/

With these bindings you will need to perform the memory accesses
through regmap, instead of directly mapping the address space
yourself.

Cheers,

Joel

>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  drivers/misc/Kconfig          |   7 ++
>  drivers/misc/Makefile         |   2 +-
>  drivers/misc/lpc-ctrl.c       | 251 ++++++++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/lpc-ctrl.h |  25 +++++
>  4 files changed, 284 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/misc/lpc-ctrl.c
>  create mode 100644 include/uapi/linux/lpc-ctrl.h
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 44f191d..2bd3f92 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -811,6 +811,13 @@ config MBOX_HOST
>         ---help---
>           Build the MBOX driver
>
> +config LPC_CTRL
> +       depends on ARCH_ASPEED
> +       bool "Build a driver to control the BMC to HOST LPC bus"
> +       default "n"
> +       ---help---
> +         This will also use a BMC ram region defined in the device tree
> +
>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 7bcaf30..e8502de 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -58,4 +58,4 @@ obj-$(CONFIG_VEXPRESS_SYSCFG) += vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)         += cxl/
>  obj-$(CONFIG_PANEL)             += panel.o
>  obj-$(CONFIG_MBOX_HOST)                += mbox-host.o
> ->>>>>>> 6252f95... fixup! drivers/misc: Add aspeed mbox driver
> +obj-$(CONFIG_LPC_CTRL)         += lpc-ctrl.o
> diff --git a/drivers/misc/lpc-ctrl.c b/drivers/misc/lpc-ctrl.c
> new file mode 100644
> index 0000000..f72f44f
> --- /dev/null
> +++ b/drivers/misc/lpc-ctrl.c
> @@ -0,0 +1,251 @@
> +/*
> + * Copyright 2016 IBM Corporation
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/errno.h>
> +#include <linux/poll.h>
> +#include <linux/sched.h>
> +#include <linux/spinlock.h>
> +#include <linux/slab.h>
> +#include <linux/init.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/delay.h>
> +#include <linux/miscdevice.h>
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +#include <linux/lpc-ctrl.h>
> +
> +#define DEVICE_NAME    "lpc-ctrl"
> +
> +#define LPC_HICR7 0x88
> +#define LPC_HICR8 0x8c
> +
> +struct lpc_ctrl {
> +       struct miscdevice       miscdev;
> +       void __iomem            *ctrl;
> +       phys_addr_t                     base;
> +       resource_size_t         size;
> +};
> +
> +
> +static struct lpc_ctrl *file_lpc_ctrl(struct file *file)
> +{
> +       return container_of(file->private_data, struct lpc_ctrl, miscdev);
> +}
> +
> +static int lpc_ctrl_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +       struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
> +       unsigned long vsize = vma->vm_end - vma->vm_start;
> +
> +       if (vma->vm_pgoff + vsize > lpc_ctrl->base + lpc_ctrl->size)
> +               return -EINVAL;
> +
> +       /* Other checks? */
> +
> +       if (remap_pfn_range(vma, vma->vm_start,
> +               (lpc_ctrl->base >> PAGE_SHIFT) + vma->vm_pgoff,
> +               vsize, vma->vm_page_prot))
> +               return -EAGAIN;
> +
> +       return 0;
> +}
> +
> +static int lpc_ctrl_open(struct inode *inode, struct file *file)
> +{
> +       return 0;
> +}
> +
> +static ssize_t lpc_ctrl_read(struct file *file, char __user *buf,
> +                               size_t count, loff_t *ppos)
> +{
> +       if (!access_ok(VERIFY_WRITE, buf, count))
> +               return -EFAULT;
> +
> +       WARN_ON(*ppos);
> +
> +       return -EPERM;
> +}
> +
> +static ssize_t lpc_ctrl_write(struct file *file, const char __user *buf,
> +                               size_t count, loff_t *ppos)
> +{
> +       if (!access_ok(VERIFY_READ, buf, count))
> +               return -EFAULT;
> +
> +       WARN_ON(*ppos);
> +
> +       return -EPERM;
> +}
> +
> +static long lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> +               unsigned long param)
> +{
> +       struct lpc_mapping map;
> +       struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
> +       void __user *p = (void __user *)param;
> +
> +       switch (cmd) {
> +       case LPC_CTRL_IOCTL_SIZE:
> +               return copy_to_user(p, &lpc_ctrl->size,
> +                       sizeof(lpc_ctrl->size)) ? -EFAULT : 0;
> +       case LPC_CTRL_IOCTL_MAP:
> +               if (copy_from_user(&map, p, sizeof(map)))
> +                       return -EFAULT;
> +
> +               iowrite32(lpc_ctrl->base | (map.hostaddr >> 16),
> +                               lpc_ctrl->ctrl + LPC_HICR7);
> +               iowrite32((~(map.size - 1)) | ((map.size >> 16) - 1),
> +                               lpc_ctrl->ctrl + LPC_HICR8);
> +               return 0;
> +       case LPC_CTRL_IOCTL_UNMAP:
> +               if (copy_from_user(&map, p, sizeof(map)))
> +                       return -EFAULT;
> +
> +               iowrite32((0x3000 << 16) | (0x0e00),
> +                               lpc_ctrl->ctrl + LPC_HICR7);
> +               iowrite32(((~(0x0200 - 1)) << 16) | ((0x0200) - 1),
> +                               lpc_ctrl->ctrl + LPC_HICR8);
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int lpc_ctrl_release(struct inode *inode, struct file *file)
> +{
> +       return 0;
> +}
> +
> +static const struct file_operations lpc_ctrl_fops = {
> +       .owner          = THIS_MODULE,
> +       .mmap           = lpc_ctrl_mmap,
> +       .open           = lpc_ctrl_open,
> +       .read           = lpc_ctrl_read,
> +       .write          = lpc_ctrl_write,
> +       .release        = lpc_ctrl_release,
> +       .unlocked_ioctl = lpc_ctrl_ioctl,
> +};
> +
> +static int lpc_ctrl_probe(struct platform_device *pdev)
> +{
> +       struct lpc_ctrl *lpc_ctrl;
> +       struct device *dev;
> +       struct device_node *node;
> +       struct resource *res;
> +       struct resource resm;
> +       int rc;
> +
> +       if (!pdev || !pdev->dev.of_node)
> +               return -ENODEV;
> +
> +       dev = &pdev->dev;
> +
> +       lpc_ctrl = devm_kzalloc(dev, sizeof(*lpc_ctrl), GFP_KERNEL);
> +       if (!lpc_ctrl)
> +               return -ENOMEM;
> +
> +       dev_set_drvdata(&pdev->dev, lpc_ctrl);
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res) {
> +               dev_err(dev, "Unable to find resources\n");
> +               rc = -ENXIO;
> +               goto out_free;
> +       }
> +
> +       /* Todo unmap this on fail cases and exit */
> +       lpc_ctrl->ctrl = devm_ioremap_resource(&pdev->dev, res);
> +       if (!lpc_ctrl->ctrl) {
> +               rc = -ENOMEM;
> +               goto out_free;
> +       }
> +
> +       node = of_parse_phandle(dev->of_node, "memory-region", 0);
> +       if (!node) {
> +               /*
> +                * Should probaby handle this by allocating 4-64k now and
> +                * using that
> +                */
> +               dev_err(dev, "Didn't find reserved memory\n");
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       rc = of_address_to_resource(node, 0, &resm);
> +       of_node_put(node);
> +       if (rc) {
> +               dev_err(dev, "Could address to resource\n");
> +               rc = -ENOMEM;
> +               goto out;
> +       }
> +
> +       lpc_ctrl->size = resource_size(&resm);
> +       lpc_ctrl->base = resm.start;
> +
> +       lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
> +       lpc_ctrl->miscdev.name = DEVICE_NAME;
> +       lpc_ctrl->miscdev.fops = &lpc_ctrl_fops;
> +       lpc_ctrl->miscdev.parent = dev;
> +       rc = misc_register(&lpc_ctrl->miscdev);
> +       if (rc) {
> +               dev_err(dev, "Unable to register device\n");
> +               goto out;
> +       }
> +
> +       dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
> +                       lpc_ctrl->base, lpc_ctrl->size);
> +       return 0;
> +
> +out:
> +       devm_iounmap(&pdev->dev, lpc_ctrl->ctrl);
> +out_free:
> +       devm_kfree(dev, lpc_ctrl);
> +       return rc;
> +}
> +
> +static int lpc_ctrl_remove(struct platform_device *pdev)
> +{
> +       struct lpc_ctrl *lpc_ctrl = dev_get_drvdata(&pdev->dev);
> +
> +       misc_deregister(&lpc_ctrl->miscdev);
> +       devm_iounmap(&pdev->dev, lpc_ctrl->ctrl);
> +       devm_kfree(&pdev->dev, lpc_ctrl);
> +       lpc_ctrl = NULL;
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id lpc_ctrl_match[] = {
> +       { .compatible = "aspeed,lpc-ctrl" },
> +       { },
> +};
> +
> +static struct platform_driver lpc_ctrl_driver = {
> +       .driver = {
> +               .name           = DEVICE_NAME,
> +               .of_match_table = lpc_ctrl_match,
> +       },
> +       .probe = lpc_ctrl_probe,
> +       .remove = lpc_ctrl_remove,
> +};
> +
> +module_platform_driver(lpc_ctrl_driver);
> +
> +MODULE_DEVICE_TABLE(of, lpc_ctrl_match);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> +MODULE_DESCRIPTION("Linux device interface to control LPC bus");
> diff --git a/include/uapi/linux/lpc-ctrl.h b/include/uapi/linux/lpc-ctrl.h
> new file mode 100644
> index 0000000..c5f1caf
> --- /dev/null
> +++ b/include/uapi/linux/lpc-ctrl.h
> @@ -0,0 +1,25 @@
> +/*
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#ifndef _UAPI_LINUX_LPC_CTRL_H
> +#define _UAPI_LINUX_LPC_CTRL_H
> +
> +#include <linux/ioctl.h>
> +
> +struct lpc_mapping {
> +       uint32_t hostaddr;
> +       uint32_t size;
> +};
> +
> +#define __LPC_CTRL_IOCTL_MAGIC 0xb2
> +#define LPC_CTRL_IOCTL_SIZE    _IOR(__LPC_CTRL_IOCTL_MAGIC, 0x00, uint32_t)
> +#define LPC_CTRL_IOCTL_MAP     _IOW(__LPC_CTRL_IOCTL_MAGIC, 0x01, struct lpc_mapping)
> +#define LPC_CTRL_IOCTL_UNMAP   _IO(__LPC_CTRL_IOCTL_MAGIC, 0x02)
> +
> +#endif /* _UAPI_LINUX_LPC_CTRL_H */
> --
> 2.10.2
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
