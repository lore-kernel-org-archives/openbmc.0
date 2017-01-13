Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v0JvB0vpPzDqWt
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 21:36:05 +1100 (AEDT)
Received: from localhost (unknown [78.192.101.3])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 48D77B2A;
 Fri, 13 Jan 2017 10:36:03 +0000 (UTC)
Date: Fri, 13 Jan 2017 11:36:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: jk@ozlabs.org, benh@kernel.crashing.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: Re: [PATCH v2] drivers/misc: Add ASpeed LPC control driver
Message-ID: <20170113103625.GA15142@kroah.com>
References: <20170113074713.6175-1-cyrilbur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170113074713.6175-1-cyrilbur@gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
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
X-List-Received-Date: Fri, 13 Jan 2017 10:36:06 -0000

On Fri, Jan 13, 2017 at 06:47:13PM +1100, Cyril Bur wrote:
> +config ASPEED_LPC_CTRL
> +	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> +	bool "Build a driver to control the BMC to HOST LPC bus"
> +	default "y"

Unless a kernel option prevents a machine from booting, it should never
be 'default y'.  This is a misc driver, it should never be 'default y'.


> --- /dev/null
> +++ b/drivers/misc/aspeed-lpc-ctrl.c
> @@ -0,0 +1,264 @@
> +/*
> + * Copyright 2017 IBM Corporation
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.

I have to ask, do you really mean "any later version"?

> + */
> +
> +#include <linux/mfd/syscon.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/poll.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/aspeed-lpc-ctrl.h>
> +
> +#define DEVICE_NAME	"aspeed-lpc-ctrl"
> +
> +#define HICR7 0x8
> +#define HICR8 0xc
> +
> +struct aspeed_lpc_ctrl {
> +	struct miscdevice	miscdev;
> +	struct regmap		*regmap;
> +	phys_addr_t		mem_base;
> +	resource_size_t		mem_size;
> +	__u32		pnor_size;
> +	__u32		pnor_base;
> +};
> +
> +static struct aspeed_lpc_ctrl *file_aspeed_lpc_ctrl(struct file *file)
> +{
> +	return container_of(file->private_data, struct aspeed_lpc_ctrl,
> +			miscdev);
> +}
> +
> +static int aspeed_lpc_ctrl_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	struct aspeed_lpc_ctrl *lpc_ctrl = file_aspeed_lpc_ctrl(file);
> +	unsigned long vsize = vma->vm_end - vma->vm_start;
> +	pgprot_t prot = vma->vm_page_prot;
> +
> +	if (vma->vm_pgoff + vsize > lpc_ctrl->mem_base + lpc_ctrl->mem_size)
> +		return -EINVAL;
> +
> +	/* AHB access are not cache coherent */
> +	if (file->f_flags & O_DSYNC)
> +		prot = pgprot_noncached(prot);
> +
> +	if (remap_pfn_range(vma, vma->vm_start,
> +		(lpc_ctrl->mem_base >> PAGE_SHIFT) + vma->vm_pgoff,
> +		vsize, prot))
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
> +static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> +		unsigned long param)
> +{
> +	long rc;
> +	struct aspeed_lpc_ctrl_mapping map;
> +	struct aspeed_lpc_ctrl *lpc_ctrl = file_aspeed_lpc_ctrl(file);
> +	void __user *p = (void __user *)param;
> +	u32 addr;
> +	u32 size;
> +
> +	if (copy_from_user(&map, p, sizeof(map)))
> +		return -EFAULT;
> +
> +	switch (cmd) {
> +	case ASPEED_LPC_CTRL_IOCTL_GET_SIZE:
> +		/* The flash windows don't report their size */
> +		if (map.window_type != ASPEED_LPC_CTRL_WINDOW_MEMORY)
> +			return -EINVAL;
> +
> +		/* Support more than one window id in the future */
> +		if (map.window_id != 0)
> +			return -EINVAL;
> +
> +		map.size = lpc_ctrl->mem_size;
> +
> +		return copy_to_user(p, &map, sizeof(map)) ? -EFAULT : 0;
> +	case ASPEED_LPC_CTRL_IOCTL_MAP:
> +
> +		/*
> +		 * The top half of HICR7 is the MSB of the BMC address of the
> +		 * mapping.
> +		 * The bottom half of HICR7 is the MSB of the HOST LPC
> +		 * firmware space address of the mapping.
> +		 *
> +		 * The 1 bits in the top of half of HICR8 represent the bits
> +		 * (in the requested address) that should be ignored and
> +		 * replaced with those from the top half of HICR7.
> +		 * The 1 bits in the bottom half of HICR8 represent the bits
> +		 * (in the requested address) that should be kept and pass
> +		 * into the BMC address space.
> +		 */
> +
> +		/*
> +		 * It doesn't make sense to talk about a size or offset with
> +		 * low 16 bits set. Both HICR7 and HICR8 talk about the top 16
> +		 * bits of addresses and sizes.
> +		 */
> +
> +		if ((map.size & 0x0000ffff) || (map.offset & 0x0000ffff))
> +			return -EINVAL;
> +
> +		/*
> +		 * Because of the way the masks work in HICR8 offset has to
> +		 * be a multiple of size
> +		 */
> +		if (map.offset & (map.size - 1))
> +			return -EINVAL;
> +
> +		if (map.window_type == ASPEED_LPC_CTRL_WINDOW_FLASH) {
> +			addr = lpc_ctrl->pnor_base;
> +			size = lpc_ctrl->pnor_size;
> +		} else if (map.window_type == ASPEED_LPC_CTRL_WINDOW_MEMORY) {
> +			addr = lpc_ctrl->mem_base;
> +			size = lpc_ctrl->mem_size;
> +		} else {
> +			return -EINVAL;
> +		}
> +
> +		/* Overflow first! */
> +		if (map.offset + map.size < map.offset ||
> +			map.offset + map.size > size)
> +			return -EINVAL;
> +
> +		if (map.size == 0 || map.size > size)
> +			return -EINVAL;
> +
> +		addr += map.offset;
> +
> +		/*
> +		 * hostaddr is safe regardless of values. This simply changes
> +		 * the address the host has to request on its side of the LPC
> +		 * bus. This cannot impact the hosts own memory space by
> +		 * surprise as LPC specific accessors are required. The only
> +		 * strange thing that could be done is setting the lower 16
> +		 * bits but the shift takes care of that.
> +		 */
> +
> +		rc = regmap_write(lpc_ctrl->regmap, HICR7,
> +				(addr | (map.addr >> 16)));
> +		if (rc)
> +			return rc;
> +
> +		return regmap_write(lpc_ctrl->regmap, HICR8,
> +			(~(map.size - 1)) | ((map.size >> 16) - 1));
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static const struct file_operations aspeed_lpc_ctrl_fops = {
> +	.owner		= THIS_MODULE,
> +	.mmap		= aspeed_lpc_ctrl_mmap,
> +	.unlocked_ioctl	= aspeed_lpc_ctrl_ioctl,
> +};
> +
> +static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
> +{
> +	struct aspeed_lpc_ctrl *lpc_ctrl;
> +	struct device *dev;
> +	struct device_node *node;
> +	struct resource resm;
> +	int rc;
> +
> +	dev = &pdev->dev;
> +
> +	lpc_ctrl = devm_kzalloc(dev, sizeof(*lpc_ctrl), GFP_KERNEL);
> +	if (!lpc_ctrl)
> +		return -ENOMEM;
> +
> +	node = of_parse_phandle(dev->of_node, "flash", 0);
> +	if (!node) {
> +		dev_err(dev, "Didn't find host pnor flash node\n");
> +		return -ENODEV;
> +	}
> +
> +	rc = of_property_read_u32_index(node, "reg", 3,
> +			&lpc_ctrl->pnor_size);
> +	if (rc)
> +		return rc;
> +	rc = of_property_read_u32_index(node, "reg", 2,
> +			&lpc_ctrl->pnor_base);
> +	if (rc)
> +		return rc;
> +
> +	dev_set_drvdata(&pdev->dev, lpc_ctrl);
> +
> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> +	if (!node) {
> +		dev_err(dev, "Didn't find reserved memory\n");
> +		return -EINVAL;
> +	}
> +
> +	rc = of_address_to_resource(node, 0, &resm);
> +	of_node_put(node);
> +	if (rc) {
> +		dev_err(dev, "Could address to resource\n");
> +		return -ENOMEM;
> +	}
> +
> +	lpc_ctrl->mem_size = resource_size(&resm);
> +	lpc_ctrl->mem_base = resm.start;
> +
> +	lpc_ctrl->regmap = syscon_node_to_regmap(
> +			pdev->dev.parent->of_node);
> +	if (IS_ERR(lpc_ctrl->regmap)) {
> +		dev_err(dev, "Couldn't get regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
> +	lpc_ctrl->miscdev.name = DEVICE_NAME;
> +	lpc_ctrl->miscdev.fops = &aspeed_lpc_ctrl_fops;
> +	lpc_ctrl->miscdev.parent = dev;
> +	rc = misc_register(&lpc_ctrl->miscdev);
> +	if (rc)
> +		dev_err(dev, "Unable to register device\n");
> +	else
> +		dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
> +			lpc_ctrl->mem_base, lpc_ctrl->mem_size);
> +
> +	return rc;
> +}
> +
> +static int aspeed_lpc_ctrl_remove(struct platform_device *pdev)
> +{
> +	struct aspeed_lpc_ctrl *lpc_ctrl = dev_get_drvdata(&pdev->dev);
> +
> +	misc_deregister(&lpc_ctrl->miscdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id aspeed_lpc_ctrl_match[] = {
> +	{ .compatible = "aspeed,ast2400-lpc-ctrl" },
> +	{ .compatible = "aspeed,ast2500-lpc-ctrl" },
> +	{ },
> +};
> +
> +static struct platform_driver aspeed_lpc_ctrl_driver = {
> +	.driver = {
> +		.name		= DEVICE_NAME,
> +		.of_match_table = aspeed_lpc_ctrl_match,
> +	},
> +	.probe = aspeed_lpc_ctrl_probe,
> +	.remove = aspeed_lpc_ctrl_remove,
> +};
> +
> +module_platform_driver(aspeed_lpc_ctrl_driver);
> +
> +MODULE_DEVICE_TABLE(of, aspeed_lpc_ctrl_match);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> +MODULE_DESCRIPTION("Linux device interface to control LPC bus");
> diff --git a/include/uapi/linux/aspeed-lpc-ctrl.h b/include/uapi/linux/aspeed-lpc-ctrl.h
> new file mode 100644
> index 000000000000..220220b6c83a
> --- /dev/null
> +++ b/include/uapi/linux/aspeed-lpc-ctrl.h
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright 2017 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#ifndef _UAPI_LINUX_ASPEED_LPC_CTRL_H
> +#define _UAPI_LINUX_ASPEED_LPC_CTRL_H
> +
> +#include <linux/ioctl.h>
> +
> +/* Window types */
> +#define ASPEED_LPC_CTRL_WINDOW_FLASH	1
> +#define ASPEED_LPC_CTRL_WINDOW_MEMORY	2
> +
> +struct aspeed_lpc_ctrl_mapping {
> +	__u8	window_type;
> +	__u8	window_id;
> +	__u32	addr;
> +	__u32	offset;
> +	__u32	size;

That's some crazy alignment, do you really mean to put a 32bit value
aligned like that?  Will it work properly on your systems?

thanks,

greg k-h
