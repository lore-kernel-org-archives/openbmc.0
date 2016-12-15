Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tfQrM35drzDw5y
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 19:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lHl+BUuV"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id 3so5344002pgd.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 00:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NxomQjS5EfIio3OkHFn4UtpcTN5Bf9GOlH7EJzGRr/s=;
 b=lHl+BUuVhNb3hpPxYdDXC0cGmg4x/dqaRrhnE00bOigO8Icq/qzHCLTP/vAdKai0HQ
 oSjifUvhaX1gF8I0e0Lb7hWhRSoCH67snEbmzy3C2wAWNZ1F1/kTPygjz30qAbusPUi6
 j22PZSVDdNYRJ4ArDj4wwPTN3VJ6ZOjG3JR5oTl19dfmoGvhHqHijhD1SFEK7egsnNED
 Oy0rHERaEXLlCJm8hoo6H5+ntBnk/R7kNetSge3Xw/BmWoN4ARDrcNkJqkBmrv2pujYS
 UBR8znCHZuR9L6kF9GcVCBh5sCiW5ilsBLOpXnJJ89rIfc8soAf1FAnXWI8/NTz4DQaT
 OUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxomQjS5EfIio3OkHFn4UtpcTN5Bf9GOlH7EJzGRr/s=;
 b=CyDgaML/zs76hHinBVpJCf565T7ZvaMNZJSl1ZF9kk5GXTslBMn05RJWnqOT3kiy/x
 Ig7iCJsK0/hFLvqyvUktWCW+cB0sSZs33FH19kmBaJLzLUcrVUaqYpxJHGCbs4gKvKc2
 yaxaIONedWPECJrYXOaMKDz7AXoTnJME1odCv123PQAA+GsZ3qSdhC2pJXOwqL2ar3UK
 RrZgxpGmJ2FEoEwVj2Tu1ZnkgvpEYibe8IH5BwIkXUaF19h4ok4huUvqopmb1KbFd5g+
 veeS3cTuoeeI5ODice8Y3Opo7Ju7GEq75gS6IPoc0hCeoqWpQFuguLWpwmTXgUEmoPGT
 Htjg==
X-Gm-Message-State: AKaTC03EQUcMFyRImxGZ25AF6BdKJikH6SAIWs5n7TbaV/L9lVylrzWC+Cf1mQ5nKWgEqw==
X-Received: by 10.84.218.13 with SMTP id q13mr96810pli.168.1481788897607;
 Thu, 15 Dec 2016 00:01:37 -0800 (PST)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id v193sm2013937pgb.37.2016.12.15.00.01.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Dec 2016 00:01:37 -0800 (PST)
Message-ID: <1481788893.814.10.camel@gmail.com>
Subject: Re: [PATCH linux 3/3] drivers/misc: Add aspeed lpc controlling driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Date: Thu, 15 Dec 2016 19:01:33 +1100
In-Reply-To: <1481763514.3112.62.camel@aj.id.au>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-4-cyrilbur@gmail.com>
 <1481763514.3112.62.camel@aj.id.au>
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
X-List-Received-Date: Thu, 15 Dec 2016 08:01:40 -0000

On Thu, 2016-12-15 at 11:28 +1030, Andrew Jeffery wrote:
> On Fri, 2016-12-09 at 16:43 +1100, Cyril Bur wrote:
> > This driver exposes a reserved chunk of BMC ram to userspace as
> > well as
> > an ioctl interface to control the BMC<->HOST mapping of the LPC
> > bus.
> > This allows for a communication channel between the BMC and the
> > host
> > 
> > > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > 
> > ---
> >  drivers/misc/Kconfig          |   7 ++
> >  drivers/misc/Makefile         |   2 +-
> >  drivers/misc/lpc-ctrl.c       | 251
> > ++++++++++++++++++++++++++++++++++++++++++
> >  include/uapi/linux/lpc-ctrl.h |  25 +++++
> 
> The naming might be a bit generic. Control of what? Any LPC device?
> 
> >  4 files changed, 284 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/misc/lpc-ctrl.c
> >  create mode 100644 include/uapi/linux/lpc-ctrl.h
> > 
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index 44f191d..2bd3f92 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -811,6 +811,13 @@ config MBOX_HOST
> > >  	---help---
> > >  	  Build the MBOX driver
> > 
> >  
> > +config LPC_CTRL
> > +	depends on ARCH_ASPEED
> 
> Again, maybe we need ASPEED in the config symbol name? And ||
> COMPILE_TEST here too.

Yeah will do.

> 
> > +	bool "Build a driver to control the BMC to HOST LPC bus"
> > > +	default "n"
> > > +	---help---
> > > +	  This will also use a BMC ram region defined in the
> > > device tree
> > 
> > +
> >  source "drivers/misc/c2port/Kconfig"
> >  source "drivers/misc/eeprom/Kconfig"
> >  source "drivers/misc/cb710/Kconfig"
> > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > index 7bcaf30..e8502de 100644
> > --- a/drivers/misc/Makefile
> > +++ b/drivers/misc/Makefile
> > > @@ -58,4 +58,4 @@ obj-$(CONFIG_VEXPRESS_SYSCFG)	+=
> > > vexpress-syscfg.o
> > >  obj-$(CONFIG_CXL_BASE)		+= cxl/
> > 
> >  obj-$(CONFIG_PANEL)             += panel.o
> > >  obj-$(CONFIG_MBOX_HOST)		+= mbox-host.o
> > 
> > ->>>>>>> 6252f95... fixup! drivers/misc: Add aspeed mbox driver
> 
> This doesn't look right.

Oops! How did that happen :/

> 
> > +obj-$(CONFIG_LPC_CTRL)		+= lpc-ctrl.o
> > diff --git a/drivers/misc/lpc-ctrl.c b/drivers/misc/lpc-ctrl.c
> > new file mode 100644
> > index 0000000..f72f44f
> > --- /dev/null
> > +++ b/drivers/misc/lpc-ctrl.c
> > @@ -0,0 +1,251 @@
> > +/*
> > + * Copyright 2016 IBM Corporation
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + */
> > +
> > +#include <linux/mm.h>
> > +#include <linux/module.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/errno.h>
> > +#include <linux/poll.h>
> > +#include <linux/sched.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/slab.h>
> > +#include <linux/init.h>
> > +#include <linux/device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/io.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/delay.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/timer.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/lpc-ctrl.h>
> > +
> > > +#define DEVICE_NAME	"lpc-ctrl"
> > 
> > +
> > +#define LPC_HICR7 0x88
> > +#define LPC_HICR8 0x8c
> > +
> > +struct lpc_ctrl {
> > > > +	struct miscdevice	miscdev;
> > > > +	void __iomem		*ctrl;
> > > > +	phys_addr_t			base;
> > > > +	resource_size_t		size;
> > 
> > +};
> > +
> > +
> > +static struct lpc_ctrl *file_lpc_ctrl(struct file *file)
> > +{
> > > +	return container_of(file->private_data, struct lpc_ctrl,
> > > miscdev);
> > 
> > +}
> > +
> > +static int lpc_ctrl_mmap(struct file *file, struct vm_area_struct
> > *vma)
> > +{
> > > +	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
> > > +	unsigned long vsize = vma->vm_end - vma->vm_start;
> > 
> > +
> > > +	if (vma->vm_pgoff + vsize > lpc_ctrl->base + lpc_ctrl-
> > > >size)
> > > +		return -EINVAL;
> > 
> > +
> > > +	/* Other checks? */
> > 
> > +
> > > +	if (remap_pfn_range(vma, vma->vm_start,
> > > +		(lpc_ctrl->base >> PAGE_SHIFT) + vma->vm_pgoff,
> > > +		vsize, vma->vm_page_prot))
> > > +		return -EAGAIN;
> > 
> > +
> > > +	return 0;
> > 
> > +}
> > +
> > +static int lpc_ctrl_open(struct inode *inode, struct file *file)
> > +{
> > > +	return 0;
> > 
> > +}
> > +
> > +static ssize_t lpc_ctrl_read(struct file *file, char __user *buf,
> > > +				size_t count, loff_t *ppos)
> > 
> > +{
> > > +	if (!access_ok(VERIFY_WRITE, buf, count))
> > > +		return -EFAULT;
> > 
> > +
> > > +	WARN_ON(*ppos);
> > 
> > +
> > > +	return -EPERM;
> > 
> > +}
> > +
> > +static ssize_t lpc_ctrl_write(struct file *file, const char __user
> > *buf,
> > > +				size_t count, loff_t *ppos)
> > 
> > +{
> > > +	if (!access_ok(VERIFY_READ, buf, count))
> > > +		return -EFAULT;
> > 
> > +
> > > +	WARN_ON(*ppos);
> > 
> > +
> > > +	return -EPERM;
> > 
> > +}
> > +
> > +static long lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> > > +		unsigned long param)
> > 
> > +{
> > > +	struct lpc_mapping map;
> > > +	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
> > > +	void __user *p = (void __user *)param;
> > 
> > +
> > > +	switch (cmd) {
> > > +	case LPC_CTRL_IOCTL_SIZE:
> > > +		return copy_to_user(p, &lpc_ctrl->size,
> > > +			sizeof(lpc_ctrl->size)) ? -EFAULT : 0;
> > > +	case LPC_CTRL_IOCTL_MAP:
> > > +		if (copy_from_user(&map, p, sizeof(map)))
> > > +			return -EFAULT;
> > 
> > +
> > > +		iowrite32(lpc_ctrl->base | (map.hostaddr >> 16),
> > > +				lpc_ctrl->ctrl + LPC_HICR7);
> > > +		iowrite32((~(map.size - 1)) | ((map.size >> 16)
> > > - 1),
> > 
> > +				lpc_ctrl->ctrl + LPC_HICR8);
> 
> I think these operations could do with some explanation.

Agreed. I'll see if I can english a simple comment.

> 
> > +		return 0;
> > > +	case LPC_CTRL_IOCTL_UNMAP:
> > > +		if (copy_from_user(&map, p, sizeof(map)))
> > 
> > +			return -EFAULT;
> 
> Is this required? We don't use map below.

Correct - I've changed the ioctl() to not take map

> 
> > +
> > > +		iowrite32((0x3000 << 16) | (0x0e00),
> > > +				lpc_ctrl->ctrl + LPC_HICR7);
> > > +		iowrite32(((~(0x0200 - 1)) << 16) | ((0x0200) -
> > > 1),
> > 
> > +				lpc_ctrl->ctrl + LPC_HICR8);
> 
> Can you comment/#define the magic numbers? I'm not across why we use
> these values.

So these actually go away thanks to Cedric pointing out that I can
quite easily ask the mtd layer for PNOR information. I haven't as yet
found 0x3000 but I suspect I can find that too.

Anyway, this is pointing the LPC bus back at the actual flash. The
flash is at address 0x30000000 on the BMC (the 0x3000 represents that)
and the SBE expects it to be mapped down from 0x0fffffff so for a flash
of size 0x02000000 (HICR8 uses this...) then 0x0e000000 (the other
nibble of HICR7) is where it should be on the host. Anyhow, not that
important this will get replaced by asking the MTD layer which will be
less hardcoded.
> 
> > +		return 0;
> > > +	}
> > 
> > +
> > > +	return -EINVAL;
> > 
> > +}
> > +
> > +static int lpc_ctrl_release(struct inode *inode, struct file
> > *file)
> > +{
> > > +	return 0;
> > 
> > +}
> > +
> > +static const struct file_operations lpc_ctrl_fops = {
> > > > +	.owner		= THIS_MODULE,
> > > > +	.mmap		= lpc_ctrl_mmap,
> > > > +	.open		= lpc_ctrl_open,
> > > > +	.read		= lpc_ctrl_read,
> > > > +	.write		= lpc_ctrl_write,
> > > > +	.release	= lpc_ctrl_release,
> > > > +	.unlocked_ioctl	= lpc_ctrl_ioctl,
> > 
> > +};
> > +
> > +static int lpc_ctrl_probe(struct platform_device *pdev)
> > +{
> > > +	struct lpc_ctrl *lpc_ctrl;
> > > +	struct device *dev;
> > > +	struct device_node *node;
> > > +	struct resource *res;
> > > +	struct resource resm;
> > > +	int rc;
> > 
> > +
> > > +	if (!pdev || !pdev->dev.of_node)
> > > +		return -ENODEV;
> > 
> > +
> > > +	dev = &pdev->dev;
> > 
> > +
> > > +	lpc_ctrl = devm_kzalloc(dev, sizeof(*lpc_ctrl),
> > > GFP_KERNEL);
> > > +	if (!lpc_ctrl)
> > > +		return -ENOMEM;
> > 
> > +
> > > +	dev_set_drvdata(&pdev->dev, lpc_ctrl);
> > 
> > +
> > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	if (!res) {
> > > +		dev_err(dev, "Unable to find resources\n");
> > > +		rc = -ENXIO;
> > > +		goto out_free;
> > > +	}
> > 
> > +
> > +	/* Todo unmap this on fail cases and exit */
> 
> You're using devm_*, which if I understand correctly should handle
> this
> for you.

Yes, I believe you're right, I wasn't sure when I wrote this... should
be fine.

I'll address all of this. Thanks for the review,

Cyril

> 
> > +	lpc_ctrl->ctrl = devm_ioremap_resource(&pdev->dev, res);
> > > +	if (!lpc_ctrl->ctrl) {
> > > +		rc = -ENOMEM;
> > > +		goto out_free;
> > > +	}
> > 
> > +
> > > +	node = of_parse_phandle(dev->of_node, "memory-region",
> > > 0);
> > > +	if (!node) {
> > > +		/*
> > > +		 * Should probaby handle this by allocating 4-
> > > 64k now and
> > > +		 * using that
> > > +		 */
> > > +		dev_err(dev, "Didn't find reserved memory\n");
> > > +		rc = -EINVAL;
> > > +		goto out;
> > > +	}
> > 
> > +
> > > +	rc = of_address_to_resource(node, 0, &resm);
> > > +	of_node_put(node);
> > > +	if (rc) {
> > > +		dev_err(dev, "Could address to resource\n");
> > > +		rc = -ENOMEM;
> > > +		goto out;
> > > +	}
> > 
> > +
> > > +	lpc_ctrl->size = resource_size(&resm);
> > > +	lpc_ctrl->base = resm.start;
> > 
> > +
> > > +	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
> > > +	lpc_ctrl->miscdev.name = DEVICE_NAME;
> > > +	lpc_ctrl->miscdev.fops = &lpc_ctrl_fops;
> > > +	lpc_ctrl->miscdev.parent = dev;
> > > +	rc = misc_register(&lpc_ctrl->miscdev);
> > > +	if (rc) {
> > > +		dev_err(dev, "Unable to register device\n");
> > > +		goto out;
> > > +	}
> > 
> > +
> > > +	dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
> > > +			lpc_ctrl->base, lpc_ctrl->size);
> > > +	return 0;
> > 
> > +
> > +out:
> > > +	devm_iounmap(&pdev->dev, lpc_ctrl->ctrl);
> > 
> > +out_free:
> > +	devm_kfree(dev, lpc_ctrl);
> 
> You shouldn't have to worry about these devm_*() calls.
> 
> > +	return rc;
> > +}
> > +
> > +static int lpc_ctrl_remove(struct platform_device *pdev)
> > +{
> > > +	struct lpc_ctrl *lpc_ctrl = dev_get_drvdata(&pdev->dev);
> > 
> > +
> > > +	misc_deregister(&lpc_ctrl->miscdev);
> > > +	devm_iounmap(&pdev->dev, lpc_ctrl->ctrl);
> > 
> > +	devm_kfree(&pdev->dev, lpc_ctrl);
> 
> As above.
> 
> Andrew
> 
> > +	lpc_ctrl = NULL;
> > +
> > > +	return 0;
> > 
> > +}
> > +
> > +static const struct of_device_id lpc_ctrl_match[] = {
> > > +	{ .compatible = "aspeed,lpc-ctrl" },
> > > +	{ },
> > 
> > +};
> > +
> > +static struct platform_driver lpc_ctrl_driver = {
> > > +	.driver = {
> > > > +		.name		= DEVICE_NAME,
> > > 
> > > +		.of_match_table = lpc_ctrl_match,
> > > +	},
> > > +	.probe = lpc_ctrl_probe,
> > > +	.remove = lpc_ctrl_remove,
> > 
> > +};
> > +
> > +module_platform_driver(lpc_ctrl_driver);
> > +
> > +MODULE_DEVICE_TABLE(of, lpc_ctrl_match);
> > +MODULE_LICENSE("GPL");
> > > +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> > 
> > +MODULE_DESCRIPTION("Linux device interface to control LPC bus");
> > diff --git a/include/uapi/linux/lpc-ctrl.h
> > b/include/uapi/linux/lpc-ctrl.h
> > new file mode 100644
> > index 0000000..c5f1caf
> > --- /dev/null
> > +++ b/include/uapi/linux/lpc-ctrl.h
> > @@ -0,0 +1,25 @@
> > +/*
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + */
> > +
> > +#ifndef _UAPI_LINUX_LPC_CTRL_H
> > +#define _UAPI_LINUX_LPC_CTRL_H
> > +
> > +#include <linux/ioctl.h>
> > +
> > +struct lpc_mapping {
> > > +	uint32_t hostaddr;
> > > +	uint32_t size;
> > 
> > +};
> > +
> > > +#define __LPC_CTRL_IOCTL_MAGIC	0xb2
> > > +#define LPC_CTRL_IOCTL_SIZE	_IOR(__LPC_CTRL_IOCTL_MAGIC,
> > > 0x00, uint32_t)
> > > +#define LPC_CTRL_IOCTL_MAP	_IOW(__LPC_CTRL_IOCTL_MAGIC,
> > > 0x01, struct lpc_mapping)
> > > +#define LPC_CTRL_IOCTL_UNMAP	_IO(__LPC_CTRL_IOCTL_MAGIC,
> > > 0x02)
> > 
> > +
> > +#endif /* _UAPI_LINUX_LPC_CTRL_H */
