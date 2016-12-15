Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tfFSM2V4WzDvk6
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 11:58:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="W20AN/lP"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FzMlu/oE"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7CA6E20692;
 Wed, 14 Dec 2016 19:58:40 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 14 Dec 2016 19:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=S0Z02ir6AJvw3sQP2tCk8bcth3Y=; b=W20AN/
 lPkGqcYakQgNXP09ASUC78ehgRg8BiB1kJDuiWF3mdu9jvafrGjaDBJ3e3rOqFBF
 yEFnf/RGDLCo0K8ElnwFyM7evVvqagh19tvYOgDmZY3QDnCsOCXC2FNd9cB0IK/O
 GKEhKYsFdtd47I+VqxMNixgDOeKA8ZtecELCQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=S0Z02ir6AJvw3s
 QP2tCk8bcth3Y=; b=FzMlu/oEVcAzHcUnUaI3trJ9ifJHoGQ+E8h7g78RNCyPMI
 JOM4DPKdPpLtKxRY63Tt6EDPcLE7plgrJfnDs9MDuPfWBocfbS0rywTe+Zfp5aay
 Y6Q0FbnlnUV4WlnvNJ7JjeTfIoAKPt0eVx3G5KTsnENbCprXNjlOGXYpvRpzM=
X-ME-Sender: <xms:wOpRWFVnmAGvnVdUa4CVKGkxFN6QMbDbTpFC6i5HgDq2zVlM_BzQcA>
X-Sasl-enc: pHVbDOBVuPefEBxIamkjVBgFAowNcjboZ9G9/oiDtkVQ 1481763519
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 196AC243A5;
 Wed, 14 Dec 2016 19:58:38 -0500 (EST)
Message-ID: <1481763514.3112.62.camel@aj.id.au>
Subject: Re: [PATCH linux 3/3] drivers/misc: Add aspeed lpc controlling driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 15 Dec 2016 11:28:34 +1030
In-Reply-To: <20161209054323.7320-4-cyrilbur@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-4-cyrilbur@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4ewm3eashDzrNKZADIQs"
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
X-List-Received-Date: Thu, 15 Dec 2016 00:58:44 -0000


--=-4ewm3eashDzrNKZADIQs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-09 at 16:43 +1100, Cyril Bur wrote:
> This driver exposes a reserved chunk of BMC ram to userspace as well as
> an ioctl interface to control the BMC<->HOST mapping of the LPC bus.
> This allows for a communication channel between the BMC and the host
>=20
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> =C2=A0drivers/misc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A07 ++
> =C2=A0drivers/misc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A0=C2=A02 +-
> =C2=A0drivers/misc/lpc-ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =
251 ++++++++++++++++++++++++++++++++++++++++++
> =C2=A0include/uapi/linux/lpc-ctrl.h |=C2=A0=C2=A025 +++++

The naming might be a bit generic. Control of what? Any LPC device?

> =C2=A04 files changed, 284 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/misc/lpc-ctrl.c
> =C2=A0create mode 100644 include/uapi/linux/lpc-ctrl.h
>=20
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 44f191d..2bd3f92 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -811,6 +811,13 @@ config MBOX_HOST
> > =C2=A0	---help---
> > =C2=A0	=C2=A0=C2=A0Build the MBOX driver
> =C2=A0
> +config LPC_CTRL
> +	depends on ARCH_ASPEED

Again, maybe we need ASPEED in the config symbol name? And ||
COMPILE_TEST here too.

> +	bool "Build a driver to control the BMC to HOST LPC bus"
> > +	default "n"
> > +	---help---
> > +	=C2=A0=C2=A0This will also use a BMC ram region defined in the device=
 tree
> +
> =C2=A0source "drivers/misc/c2port/Kconfig"
> =C2=A0source "drivers/misc/eeprom/Kconfig"
> =C2=A0source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 7bcaf30..e8502de 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> > @@ -58,4 +58,4 @@ obj-$(CONFIG_VEXPRESS_SYSCFG)	+=3D vexpress-syscfg.o
> > =C2=A0obj-$(CONFIG_CXL_BASE)		+=3D cxl/
> =C2=A0obj-$(CONFIG_PANEL)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=3D panel.o
> > =C2=A0obj-$(CONFIG_MBOX_HOST)		+=3D mbox-host.o
> ->>>>>>> 6252f95... fixup! drivers/misc: Add aspeed mbox driver

This doesn't look right.

> +obj-$(CONFIG_LPC_CTRL)		+=3D lpc-ctrl.o
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
> > +#define DEVICE_NAME	"lpc-ctrl"
> +
> +#define LPC_HICR7 0x88
> +#define LPC_HICR8 0x8c
> +
> +struct lpc_ctrl {
> > > +	struct miscdevice	miscdev;
> > > +	void __iomem		*ctrl;
> > > +	phys_addr_t			base;
> > > +	resource_size_t		size;
> +};
> +
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
> > +	return 0;
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
> > +		iowrite32(lpc_ctrl->base | (map.hostaddr >> 16),
> > +				lpc_ctrl->ctrl + LPC_HICR7);
> > +		iowrite32((~(map.size - 1)) | ((map.size >> 16) - 1),
> +				lpc_ctrl->ctrl + LPC_HICR8);

I think these operations could do with some explanation.

> +		return 0;
> > +	case LPC_CTRL_IOCTL_UNMAP:
> > +		if (copy_from_user(&map, p, sizeof(map)))
> +			return -EFAULT;

Is this required? We don't use map below.

> +
> > +		iowrite32((0x3000 << 16) | (0x0e00),
> > +				lpc_ctrl->ctrl + LPC_HICR7);
> > +		iowrite32(((~(0x0200 - 1)) << 16) | ((0x0200) - 1),
> +				lpc_ctrl->ctrl + LPC_HICR8);

Can you comment/#define the magic numbers? I'm not across why we use
these values.

> +		return 0;
> > +	}
> +
> > +	return -EINVAL;
> +}
> +
> +static int lpc_ctrl_release(struct inode *inode, struct file *file)
> +{
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
> > +	struct resource *res;
> > +	struct resource resm;
> > +	int rc;
> +
> > +	if (!pdev || !pdev->dev.of_node)
> > +		return -ENODEV;
> +
> > +	dev =3D &pdev->dev;
> +
> > +	lpc_ctrl =3D devm_kzalloc(dev, sizeof(*lpc_ctrl), GFP_KERNEL);
> > +	if (!lpc_ctrl)
> > +		return -ENOMEM;
> +
> > +	dev_set_drvdata(&pdev->dev, lpc_ctrl);
> +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(dev, "Unable to find resources\n");
> > +		rc =3D -ENXIO;
> > +		goto out_free;
> > +	}
> +
> +	/* Todo unmap this on fail cases and exit */

You're using devm_*, which if I understand correctly should handle this
for you.

> +	lpc_ctrl->ctrl =3D devm_ioremap_resource(&pdev->dev, res);
> > +	if (!lpc_ctrl->ctrl) {
> > +		rc =3D -ENOMEM;
> > +		goto out_free;
> > +	}
> +
> > +	node =3D of_parse_phandle(dev->of_node, "memory-region", 0);
> > +	if (!node) {
> > +		/*
> > +		=C2=A0* Should probaby handle this by allocating 4-64k now and
> > +		=C2=A0* using that
> > +		=C2=A0*/
> > +		dev_err(dev, "Didn't find reserved memory\n");
> > +		rc =3D -EINVAL;
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
> > +	lpc_ctrl->miscdev.minor =3D MISC_DYNAMIC_MINOR;
> > +	lpc_ctrl->miscdev.name =3D DEVICE_NAME;
> > +	lpc_ctrl->miscdev.fops =3D &lpc_ctrl_fops;
> > +	lpc_ctrl->miscdev.parent =3D dev;
> > +	rc =3D misc_register(&lpc_ctrl->miscdev);
> > +	if (rc) {
> > +		dev_err(dev, "Unable to register device\n");
> > +		goto out;
> > +	}
> +
> > +	dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
> > +			lpc_ctrl->base, lpc_ctrl->size);
> > +	return 0;
> +
> +out:
> > +	devm_iounmap(&pdev->dev, lpc_ctrl->ctrl);
> +out_free:
> +	devm_kfree(dev, lpc_ctrl);

You shouldn't have to worry about these devm_*() calls.

> +	return rc;
> +}
> +
> +static int lpc_ctrl_remove(struct platform_device *pdev)
> +{
> > +	struct lpc_ctrl *lpc_ctrl =3D dev_get_drvdata(&pdev->dev);
> +
> > +	misc_deregister(&lpc_ctrl->miscdev);
> > +	devm_iounmap(&pdev->dev, lpc_ctrl->ctrl);
> +	devm_kfree(&pdev->dev, lpc_ctrl);

As above.

Andrew

> +	lpc_ctrl =3D NULL;
> +
> > +	return 0;
> +}
> +
> +static const struct of_device_id lpc_ctrl_match[] =3D {
> > +	{ .compatible =3D "aspeed,lpc-ctrl" },
> > +	{ },
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
> diff --git a/include/uapi/linux/lpc-ctrl.h b/include/uapi/linux/lpc-ctrl.=
h
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
--=-4ewm3eashDzrNKZADIQs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYUeq6AAoJEJ0dnzgO5LT5RsUP/1qMazm0DpvjWZqXtWWO4svh
P0HY5nSX6ikCbjHdEfXzaJcS1hQ7LLySqDqAIZvjhVd1MlSkjHXQ31i+dNu17UaA
vJaI0CYTAAvZ+W1q9i7mhR5xGHBu7wWQ/2izIuoJGaMo+VMQOz8CsplT8Pxs3XdB
RCIdDerCrONJDwhQj0p72CLqqWwJKONdCTnwHvfFQdUXKFdZk9VyB0A8jLyzqbuK
erTOSomNc3t+aP1Sean+YpiVYqJLSfJJ34NTO2lZHOKwteqE1neIP7eIhyBMtZHw
g/ji2XJ1zden9u+eqmUkl+GIoSpz103CO1BMhHDCcrDLzrjF+2YMP3np3+ZFiv98
cnxfgsWwcaDOIII7RbcQ4UWmN9WTQvlwAK4MYAZG105oJdbYXlr4lpmngpsczAAt
ani8NXiz+CEb8maT6XcrMnIBz/renYGujoO1MOBh/WK7QknFUtOkBvsXWbmUvcSL
aJqu55RY7CrqOFA9wNttIfDNJ4PPEuU9L+fPSX3R+JXsuKvPdWGDV2EZe7QrJJkt
d4nuyzFD0HyOHM5Ia+FL6Xk+L4HGS7M6eDNVKjYaFcEV7RRgCbmURbW9IJMFtTrA
8SSV7eZlRlXGbDqlmWG5T0R7BbWeO/T87Y6F1u2o0AAz7sVG0YGViMtOx5ulsrSV
8N7RbiZTqpNJ1DcZz3rt
=Hqap
-----END PGP SIGNATURE-----

--=-4ewm3eashDzrNKZADIQs--
