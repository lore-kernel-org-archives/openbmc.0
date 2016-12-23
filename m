Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tlCgj6Q2QzDt2L
 for <openbmc@lists.ozlabs.org>; Fri, 23 Dec 2016 13:55:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MeiQLAn8"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="N2PmnMW/"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AAEAE20AF3;
 Thu, 22 Dec 2016 21:55:43 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 22 Dec 2016 21:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=Zr1octKIxpc0WaYn0tPLs2/JfD4=; b=MeiQLA
 n81X2cCGPoQRkvOWhqFt4e/HkNX+vccNrsIRCJqvl0EMjx7Ngk9qNARADIsEFS01
 2/OZ7epqXsoRRvTSaIMwfqCb3ZNymxinO0HCs2JBrQx40CJ3vXihjPbGsWz9JHbs
 +18mMhyMSPweY6Z3KVGbu64rEnrErUXXd2pKI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Zr1octKIxpc0Wa
 Yn0tPLs2/JfD4=; b=N2PmnMW/UDsSEXQceOpsz0e+9Ve0NaIc68MuhkFHckd4mI
 QCI1tkkYpsu7Xvb+6VWXrVd2pinxURUo9JUkPcV5sU5OfA9/d8zTXJqcAhvTMaKw
 4sSAfqh06i6TJmhAOggi/EHWSeJ7yQ3+BRM7kCSQAGr85XSvlfjUM+DaXBgPA=
X-ME-Sender: <xms:L5JcWORS2AP1LNcPCqX3-kpryxLxz3ddtaExThXc6iGhPYk6Zw1teQ>
X-Sasl-enc: M7HZC96ip5bmj98DpK+6JnqEKVjhkoZwk710LdzsgTTU 1482461742
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3DF57EA42;
 Thu, 22 Dec 2016 21:55:41 -0500 (EST)
Message-ID: <1482461737.3419.29.camel@aj.id.au>
Subject: Re: [PATCH v2 5/5] drivers/misc: Add aspeed ast2400/ast2500 lpc
 controlling driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Fri, 23 Dec 2016 13:25:37 +1030
In-Reply-To: <20161222060610.29695-6-cyrilbur@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-6-cyrilbur@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-zaaedhIgQ9rhk9aJGjum"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 23 Dec 2016 02:55:46 -0000


--=-zaaedhIgQ9rhk9aJGjum
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-12-22 at 17:06 +1100, Cyril Bur wrote:
> This driver exposes a reserved chunk of BMC ram to userspace as well as
> an ioctl interface to control the BMC<->HOST mapping of the LPC bus.
> This allows for a communication channel between the BMC and the host
>=20
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> =C2=A0drivers/misc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=
=A09 ++
> =C2=A0drivers/misc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> =C2=A0drivers/misc/aspeed-lpc-ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 292 +++++++++++++++++++++++++++++++++++
> =C2=A0include/uapi/linux/aspeed-lpc-ctrl.h |=C2=A0=C2=A025 +++
> =C2=A04 files changed, 327 insertions(+)
> =C2=A0create mode 100644 drivers/misc/aspeed-lpc-ctrl.c
> =C2=A0create mode 100644 include/uapi/linux/aspeed-lpc-ctrl.h
>=20
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index a216b4667742..f1e1c043d91c 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -804,6 +804,15 @@ config PANEL_BOOT_MESSAGE
> > =C2=A0	=C2=A0=C2=A0An empty message will only clear the display at driv=
er init time. Any other
> > =C2=A0	=C2=A0=C2=A0printf()-formatted message is valid with newline and=
 escape codes.
> =C2=A0
> +config ASPEED_LPC_CTRL
> +	depends on ARCH_ASPEED || COMPILE_TEST

Something that I should have mentioned on 4/5 as well is that we now
need to say:

    depends on REGMAP && MFD_SYSCON

> +	bool "Build a driver to control the BMC to HOST LPC bus"
> > +	default "y"
> > +	---help---
> > +	=C2=A0=C2=A0Provides a driver to control BMC to HOST LPC mappings thr=
ough
> > +	=C2=A0=C2=A0ioctl()s, the driver aso provides a read/write interface =
to a BMC ram
> > +	=C2=A0=C2=A0region where host LPC can be buffered.
> +
> =C2=A0source "drivers/misc/c2port/Kconfig"
> =C2=A0source "drivers/misc/eeprom/Kconfig"
> =C2=A0source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index b2fb6dbffcef..cdcd1af48971 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> > @@ -57,3 +57,4 @@ obj-$(CONFIG_ECHO)		+=3D echo/
> > =C2=A0obj-$(CONFIG_VEXPRESS_SYSCFG)	+=3D vexpress-syscfg.o
> > =C2=A0obj-$(CONFIG_CXL_BASE)		+=3D cxl/
> =C2=A0obj-$(CONFIG_PANEL)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=3D panel.o
> > +obj-$(CONFIG_ASPEED_LPC_CTRL)	+=3D aspeed-lpc-ctrl.o
> diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctr=
l.c
> new file mode 100644
> index 000000000000..4698d8fa5a4c
> --- /dev/null
> +++ b/drivers/misc/aspeed-lpc-ctrl.c
> @@ -0,0 +1,292 @@
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
> +#include <linux/mtd/mtd.h>
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/aspeed-lpc-ctrl.h>
> +
> > +#define DEVICE_NAME	"aspeed-lpc-ctrl"
> +
> +#define HICR7 0x8
> +#define HICR8 0xc
> +
> +struct lpc_ctrl {
> > > +	struct miscdevice	miscdev;
> > > +	struct regmap		*regmap;
> > > +	phys_addr_t		base;
> > > +	resource_size_t		size;
> > > +	uint32_t		pnor_size;
> > > +	uint32_t		pnor_base;
> +};
> +
> +static atomic_t lpc_ctrl_open_count =3D ATOMIC_INIT(0);
> +
> +static struct lpc_ctrl *file_lpc_ctrl(struct file *file)
> +{
> > +	return container_of(file->private_data, struct lpc_ctrl, miscdev);
> +}
> +
> +static int lpc_ctrl_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> > +	struct lpc_ctrl *lpc_ctrl =3D file_lpc_ctrl(file);
> > +	unsigned long vsize =3D vma->vm_end - vma->vm_start;
> +
> > +	if (vma->vm_pgoff + vsize > lpc_ctrl->base + lpc_ctrl->size)
> > +		return -EINVAL;
> +
> > +	/* Other checks? */
> +
> > +	if (remap_pfn_range(vma, vma->vm_start,
> > +		(lpc_ctrl->base >> PAGE_SHIFT) + vma->vm_pgoff,
> > +		vsize, vma->vm_page_prot))
> > +		return -EAGAIN;
> +
> > +	return 0;
> +}
> +
> +static int lpc_ctrl_open(struct inode *inode, struct file *file)
> +{
> > +	if (atomic_inc_return(&lpc_ctrl_open_count) =3D=3D 1)
> > +		return 0;
> +
> > +	atomic_dec(&lpc_ctrl_open_count);
> > +	return -EBUSY;
> +}
> +
> +static ssize_t lpc_ctrl_read(struct file *file, char __user *buf,
> > +				size_t count, loff_t *ppos)
> +{
> > +	if (!access_ok(VERIFY_WRITE, buf, count))
> > +		return -EFAULT;
> +
> > +	WARN_ON(*ppos);
> +
> > +	return -EPERM;
> +}
> +
> +static ssize_t lpc_ctrl_write(struct file *file, const char __user *buf,
> > +				size_t count, loff_t *ppos)
> +{
> > +	if (!access_ok(VERIFY_READ, buf, count))
> > +		return -EFAULT;
> +
> > +	WARN_ON(*ppos);
> +
> > +	return -EPERM;
> +}
> +
> +static long lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> > +		unsigned long param)
> +{
> > +	long rc;
> > +	struct lpc_mapping map;
> > +	struct lpc_ctrl *lpc_ctrl =3D file_lpc_ctrl(file);
> > +	void __user *p =3D (void __user *)param;
> +
> > +	switch (cmd) {
> > +	case LPC_CTRL_IOCTL_SIZE:
> > +		return copy_to_user(p, &lpc_ctrl->size,
> > +			sizeof(lpc_ctrl->size)) ? -EFAULT : 0;
> > +	case LPC_CTRL_IOCTL_MAP:
> > +		if (copy_from_user(&map, p, sizeof(map)))
> > +			return -EFAULT;
> +
> +

Whitespace (double line break).

> +		/*
> > +		=C2=A0* The top half of HICR7 is the MSB of the BMC address of the
> > +		=C2=A0* mapping.
> > +		=C2=A0* The bottom half of HICR7 is the MSB of the HOST LPC
> > +		=C2=A0* firmware space address of the mapping.
> > +		=C2=A0*
> > +		=C2=A0* The 1 bits in the top of half of HICR8 represent the bits
> > +		=C2=A0* (in the requested address) that should be ignored and
> > +		=C2=A0* replaced with those from the top half of HICR7.
> > +		=C2=A0* The 1 bits in the bottom half of HICR8 represent the bits
> > +		=C2=A0* (in the requested address) that should be kept and pass
> > +		=C2=A0* into the BMC address space.
> +		=C2=A0*/

If only we could put this comment into the datasheet and re-publish it.

> +
> > +		regmap_write(lpc_ctrl->regmap, HICR7,
> > +				(lpc_ctrl->base | (map.hostaddr >> 16)));
> > +		regmap_write(lpc_ctrl->regmap, HICR8,
> +			(~(map.size - 1)) | ((map.size >> 16) - 1));

What are your thoughts on error handling

> +		return 0;
> > +	case LPC_CTRL_IOCTL_UNMAP:
> > +		/*
> > +		=C2=A0* The top nibble in host lpc addresses references which
> > +		=C2=A0* firmware space, use space zero hence the & 0x0fff
> > +		=C2=A0*/
> +
> > +		dev_info(lpc_ctrl->miscdev.parent, "Setting HICR7 to 0x%08x\n",
> +			lpc_ctrl->pnor_base | (((-lpc_ctrl->pnor_size) >> 16) & 0x0fff));

Lets drop the dev_info()s, we've confirmed this works with the fixes to
the mbox driver.

> +             rc =3D regmap_write(lpc_ctrl->regmap, HICR7,
> > +			lpc_ctrl->pnor_base | (((-lpc_ctrl->pnor_size) >> 16) & 0x0fff));
> > +		if (rc)
> > +			return rc;
> > +		dev_info(lpc_ctrl->miscdev.parent, "Setting HICR8 to 0x%08x\n",
> > +			(~(lpc_ctrl->pnor_size - 1)) | ((lpc_ctrl->pnor_size >> 16) - 1));
> > +		rc =3D regmap_write(lpc_ctrl->regmap, HICR8,
> > +			(~(lpc_ctrl->pnor_size - 1)) | ((lpc_ctrl->pnor_size >> 16) - 1));
> > +		return rc;
> > +	}
> +
> > +	return -EINVAL;
> +}
> +
> +static int lpc_ctrl_release(struct inode *inode, struct file *file)
> +{
> > +	atomic_dec(&lpc_ctrl_open_count);
> > +	return 0;
> +}
> +
> +static const struct file_operations lpc_ctrl_fops =3D {
> > > +	.owner		=3D THIS_MODULE,
> > > +	.mmap		=3D lpc_ctrl_mmap,
> > > +	.open		=3D lpc_ctrl_open,
> > > +	.read		=3D lpc_ctrl_read,
> > > +	.write		=3D lpc_ctrl_write,
> > > +	.release	=3D lpc_ctrl_release,
> > > +	.unlocked_ioctl	=3D lpc_ctrl_ioctl,
> +};
> +
> +static int lpc_ctrl_probe(struct platform_device *pdev)
> +{
> > +	struct lpc_ctrl *lpc_ctrl;
> > +	struct device *dev;
> > +	struct device_node *node;
> > +	struct resource resm;
> > +	struct mtd_info *mtd;
> > +	int rc;
> +
> > +	if (!pdev || !pdev->dev.of_node)
> > +		return -ENODEV;
> +
> > > +	mtd =3D get_mtd_device_nm("1e630000.spi:pnor@0");
> > +	if (IS_ERR(mtd)) {
> > +		dev_err(&pdev->dev, "Couldn't find pnor\n");
> > +		return -EPROBE_DEFER;
> > +	}
> +
> > +	dev =3D &pdev->dev;
> +
> > +	lpc_ctrl =3D devm_kzalloc(dev, sizeof(*lpc_ctrl), GFP_KERNEL);
> > +	if (!lpc_ctrl)
> > +		return -ENOMEM;
> +
> > +	dev_set_drvdata(&pdev->dev, lpc_ctrl);
> +
> > +	node =3D of_get_parent(mtd_get_of_node(mtd));
> > +	if (!node) {
> > +		dev_err(dev, "Couldn't get MTD parent OF node\n");
> > +		return -ENODEV;
> > +	}
> > +	lpc_ctrl->pnor_size =3D mtd->size;
> > +	rc =3D of_property_read_u32_index(node, "reg", 2,
> > +			&lpc_ctrl->pnor_base);
> > +	if (rc)
> > +		return rc;
> +
> > +	dev_info(dev, "Host PNOR base: 0x%08x size: 0x%08x\n",
> > +		lpc_ctrl->pnor_base, lpc_ctrl->pnor_size);
> +
> > +	node =3D of_parse_phandle(dev->of_node, "memory-region", 0);
> > +	if (!node) {
> > +		/*
> > +		=C2=A0* Should probaby handle this by allocating 4-64k now and
> > +		=C2=A0* using that
> > +		=C2=A0*/
> +		dev_err(dev, "Didn't find reserved memory\n");

I think this is good enough for the moment?

> +		rc =3D -EINVAL;
> > +		goto out;
> > +	}
> +
> > +	rc =3D of_address_to_resource(node, 0, &resm);
> > +	of_node_put(node);
> > +	if (rc) {
> > +		dev_err(dev, "Could address to resource\n");
> > +		rc =3D -ENOMEM;
> > +		goto out;
> > +	}
> +
> > +	lpc_ctrl->size =3D resource_size(&resm);
> > +	lpc_ctrl->base =3D resm.start;
> +
> > +	lpc_ctrl->regmap =3D syscon_node_to_regmap(
> > +			pdev->dev.parent->of_node);
> > +	if (IS_ERR(lpc_ctrl->regmap)) {
> > +		dev_err(dev, "Couldn't get regmap\n");
> > +		rc =3D -ENODEV;
> > +		goto out;
> > +	}
> +
> > +	lpc_ctrl->miscdev.minor =3D MISC_DYNAMIC_MINOR;
> > +	lpc_ctrl->miscdev.name =3D DEVICE_NAME;
> > +	lpc_ctrl->miscdev.fops =3D &lpc_ctrl_fops;
> > +	lpc_ctrl->miscdev.parent =3D dev;
> > +	rc =3D misc_register(&lpc_ctrl->miscdev);
> > +	if (rc)
> > +		dev_err(dev, "Unable to register device\n");
> > +	else
> > +		dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
> > +			lpc_ctrl->base, lpc_ctrl->size);
> +
> +out:
> > +	return rc;
> +}
> +
> +static int lpc_ctrl_remove(struct platform_device *pdev)
> +{
> > +	struct lpc_ctrl *lpc_ctrl =3D dev_get_drvdata(&pdev->dev);
> +
> +	misc_deregister(&lpc_ctrl->miscdev);

It feels like there should be a devm_misc_register()...

> +	lpc_ctrl =3D NULL;
> +
> > +	return 0;
> +}
> +
> +static const struct of_device_id lpc_ctrl_match[] =3D {
> +	{ .compatible =3D "aspeed,ast2400-lpc-ctrl" },

Another issue I meant to mention on 4/5 was we'll need bindings
documentation for these compatible strings.

It's probably also worth adding the AST2500.

> +	{ },
> +};
> +
> +static struct platform_driver lpc_ctrl_driver =3D {
> > +	.driver =3D {
> > > +		.name		=3D DEVICE_NAME,
> > +		.of_match_table =3D lpc_ctrl_match,
> > +	},
> > +	.probe =3D lpc_ctrl_probe,
> > +	.remove =3D lpc_ctrl_remove,
> +};
> +
> +module_platform_driver(lpc_ctrl_driver);
> +
> +MODULE_DEVICE_TABLE(of, lpc_ctrl_match);
> +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> +MODULE_DESCRIPTION("Linux device interface to control LPC bus");
> diff --git a/include/uapi/linux/aspeed-lpc-ctrl.h b/include/uapi/linux/as=
peed-lpc-ctrl.h
> new file mode 100644
> index 000000000000..c5f1caf827ac
> --- /dev/null
> +++ b/include/uapi/linux/aspeed-lpc-ctrl.h
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
> > +	uint32_t hostaddr;
> > +	uint32_t size;
> +};
> +
> > +#define __LPC_CTRL_IOCTL_MAGIC	0xb2
> > +#define LPC_CTRL_IOCTL_SIZE	_IOR(__LPC_CTRL_IOCTL_MAGIC, 0x00, uint32_=
t)
> > +#define LPC_CTRL_IOCTL_MAP	_IOW(__LPC_CTRL_IOCTL_MAGIC, 0x01, struct l=
pc_mapping)
> > +#define LPC_CTRL_IOCTL_UNMAP	_IO(__LPC_CTRL_IOCTL_MAGIC, 0x02)
> +
> +#endif /* _UAPI_LINUX_LPC_CTRL_H */

Cheers,

Andrew
--=-zaaedhIgQ9rhk9aJGjum
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYXJIpAAoJEJ0dnzgO5LT5OsQP/jJFSwuhB3u6/G2RBEoQBpqx
xJ3VLlck2mZcz+9ZDjLQ2nmSp5dfHPRh/6CwTryEN5MSzO5Yy0l+xGFssL4557CO
iNGat2uehQxsM9M3nl6ypWVQ5XVkhWSVx+Tl+ajEJoKzmDSfS/AQwmRNJnkJb6xS
nTeM9wlzODUD15Q7gDraJPJ20keIluZAswWRqLGfW+7DM7pBhYzelIIgSU0vWQu9
m8ljJasii9gWGKMN1ZmAss/Ryiw9Pvw8IjjRvh8j97Ag7g0geiIQ9OuvJtifTDxP
lvTsDXzjDQmXYjRGIpWppkCy5rmsc5h7JwZa0v1wpOhOZ8T4Mu6EcIsohIBWJ7h+
JCacxoe1o7hdFQDvgYNgFjMbzcxCtanl8LjDcFVqXXChFDnjsPjx77XNhpq26nHM
g6fq8UGMwNrJBHqLkTm0Yfs2QlIe8ivRW2ANGCFrcoOEA28/de5P3mDh+zGBvmQn
X/Gp1Uc8yZV4NT+NIEGwTmESdXf+/+j4+l3pr2yVfqDey+JesCI6WIrPsNSQkF57
/bz1cQnpSmSLnLALmyjlaSnSuXdmd8+bfvfvTG3U30+kROtM+60zGpXPBGrOBKS/
gi2SvXsHABIRsP390V4soD9+UUTvhAVbFvf/kP/p2EJeKVsG2Avz58Yaw7BIyRpl
GhPvHbrA3PL9pkwNgcL2
=gkJV
-----END PGP SIGNATURE-----

--=-zaaedhIgQ9rhk9aJGjum--
