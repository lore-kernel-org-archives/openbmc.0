Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tlCNT0dZVzDwKf
 for <openbmc@lists.ozlabs.org>; Fri, 23 Dec 2016 13:42:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Mp3WdgEh"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GEiCXD44"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 437C620784;
 Thu, 22 Dec 2016 21:42:30 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 22 Dec 2016 21:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=zw2hC/3d3ocT0dFENR3DA6noTNA=; b=Mp3Wdg
 Ehs0Lfu9AwnMe+kbWLXz+AvVWBoK772mzcJNzAEfa6IuiuWHqUjdZAURdvqqHT+e
 2HMLCGRwdK8zkcjxYC7eFIMm+2Q2N1WBcVZf7LbIDclkXVTX8vlBqLW3/Ps0GJPN
 C/qxRyyoSarOu0932GgsMfu8J3dOM3JQG2qZE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=zw2hC/3d3ocT0d
 FENR3DA6noTNA=; b=GEiCXD44vof5QaSWzaG3W9CKDetKSG+xI4jM+S5MFuj/mU
 ikneQoe3UEY16uoer/RHDgP0D1/qUORYInLasO1zOm+7u0dwSuEpGfMvhLAx4ZVT
 xrfzUeI2P1Zf3jVo4wkZd1ZUrUDexFj1qqJDzCRu+zBq5BgqtFoV0zpM9JDhk=
X-ME-Sender: <xms:Fo9cWIyJkwwPzsyk0Y1mB5cbPpuGd3iNDvoHI3xwgZvJSMjKP7g6nA>
X-Sasl-enc: wl4+U/F0jL4WiocB0yj3Do+1L8Oat5KV5Usr2ROQ8CUj 1482460949
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 778837E753;
 Thu, 22 Dec 2016 21:42:28 -0500 (EST)
Message-ID: <1482460941.3419.26.camel@aj.id.au>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Fri, 23 Dec 2016 13:12:21 +1030
In-Reply-To: <20161222060610.29695-5-cyrilbur@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8J3TWSPiWQJ1FbpZQKRM"
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
X-List-Received-Date: Fri, 23 Dec 2016 02:42:34 -0000


--=-8J3TWSPiWQJ1FbpZQKRM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyril,

This looks good to me. A couple of minor comments below.

On Thu, 2016-12-22 at 17:06 +1100, Cyril Bur wrote:
> This provides access to the mbox registers on the ast2400 and ast2500 boa=
rds.
>=20
> An ioctl() is used to allow users to write to a specific register with a =
specific
> value. This is useful as the other end have configured the mbox registers=
 to
> provide an interrupt when a specific regster gets written to.
>=20
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> =C2=A0drivers/mailbox/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A09 +
> =C2=A0drivers/mailbox/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A03 +
> =C2=A0drivers/mailbox/aspeed-mbox.c=C2=A0=C2=A0=C2=A0=C2=A0| 354 ++++++++=
+++++++++++++++++++++++++++++++
> =C2=A0include/uapi/linux/aspeed-mbox.h |=C2=A0=C2=A023 +++
> =C2=A04 files changed, 389 insertions(+)
> =C2=A0create mode 100644 drivers/mailbox/aspeed-mbox.c
> =C2=A0create mode 100644 include/uapi/linux/aspeed-mbox.h
>=20
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index 5305923752d2..815cfe852dea 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -123,4 +123,13 @@ config XGENE_SLIMPRO_MBOX
> > =C2=A0	=C2=A0=C2=A0It is used to send short messages between ARM64-bit =
cores and
> > =C2=A0	=C2=A0=C2=A0the SLIMpro Management Engine, primarily for PM. Say=
 Y here if you
> > =C2=A0	=C2=A0=C2=A0want to use the APM X-Gene SLIMpro IPCM support.
> +
> +config ASPEED_MBOX
> > +	depends on ARCH_ASPEED || COMPILE_TEST
> > +	bool "Aspeed ast2400/2500 Mailbox Controller"
> > +	default "y"
> > +	---help---
> > +	=C2=A0=C2=A0Provides a driver for the MBOX regsiters found on Aspeed =
SOCs
> > +	=C2=A0=C2=A0(AST2400 and AST2500). This driver provides a device for =
aspeed
> > +	=C2=A0=C2=A0mbox registers
> =C2=A0endif
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 0be3e742bb7d..99d17f3b9552 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -25,3 +25,6 @@ obj-$(CONFIG_TI_MESSAGE_MANAGER) +=3D ti-msgmgr.o
> =C2=A0obj-$(CONFIG_XGENE_SLIMPRO_MBOX) +=3D mailbox-xgene-slimpro.o
> =C2=A0
> > =C2=A0obj-$(CONFIG_HI6220_MBOX)	+=3D hi6220-mailbox.o
> +
> > +obj-$(CONFIG_ASPEED_MBOX)		+=3D aspeed-mbox.o
> +
> diff --git a/drivers/mailbox/aspeed-mbox.c b/drivers/mailbox/aspeed-mbox.=
c
> new file mode 100644
> index 000000000000..a5da7fc0fd23
> --- /dev/null
> +++ b/drivers/mailbox/aspeed-mbox.c
> @@ -0,0 +1,354 @@
> +/*
> + * Copyright 2016 IBM Corporation
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
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
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/delay.h>
> +#include <linux/miscdevice.h>
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/aspeed-mbox.h>
> +
> > +#define DEVICE_NAME	"aspeed-mbox"
> +
> +#define MBOX_NUM_REGS 16
> +#define MBOX_NUM_DATA_REGS 14
> +
> +#define MBOX_DATA_0 0x00
> +#define MBOX_STATUS_0 0x40
> +#define MBOX_STATUS_1 0x44
> +#define MBOX_BMC_CTRL 0x48
> +#define=C2=A0=C2=A0=C2=A0MBOX_CTRL_RECV BIT(7)
> +#define=C2=A0=C2=A0=C2=A0MBOX_CTRL_MASK BIT(1)
> +#define=C2=A0=C2=A0=C2=A0MBOX_CTRL_SEND BIT(0)
> +#define MBOX_HOST_CTRL 0x4c
> +#define MBOX_INTERRUPT_0 0x50
> +#define MBOX_INTERRUPT_1 0x54
> +
> +struct mbox {
> > > +	struct miscdevice	miscdev;
> > > +	struct regmap		*regmap;
> > > +	unsigned int		base;
> > > +	int			irq;
> > > +	wait_queue_head_t	queue;
> > > +	struct timer_list	poll_timer;
> +};
> +
> +static atomic_t mbox_open_count =3D ATOMIC_INIT(0);
> +
> +static u8 mbox_inb(struct mbox *mbox, int reg)
> +{
> > +	/*
> > +	=C2=A0* The mbox registers are actually only 1 byte but are addressed=
 4
> > +	=C2=A0* bytes appart. The other three bytes are marked 'reserved', th=
ey
> > +	=C2=A0* *should* be zero but lets not rely on it.
> > +	=C2=A0* I am going to rely on the fact we can casually read/write to =
them...
> > +	=C2=A0*/
> > +	unsigned int val =3D 0xff; /* If regmap throws an error return 0xff *=
/
> > +	regmap_read(mbox->regmap, mbox->base + reg, &val);
> +	return val & 0xff;
> +}
> +
> +static void mbox_outb(struct mbox *mbox, u8 data, int reg)
> +{
> +	regmap_write(mbox->regmap, mbox->base + reg, data);

We could use regmap_update_bits() here, but ultimately it's not going
to matter. Should we say something if regmap_write() fails (it
shouldn't, but if it does that's extra concerning)?

> +}
> +
> +static struct mbox *file_mbox(struct file *file)
> +{
> > +	return container_of(file->private_data, struct mbox, miscdev);
> +}
> +
> +static int mbox_open(struct inode *inode, struct file *file)
> +{
> > +	struct mbox *mbox =3D file_mbox(file);
> +
> > +	if (atomic_inc_return(&mbox_open_count) =3D=3D 1) {
> > +		/*
> > +		=C2=A0* Clear the interrupt status bit if it was left on and unmask
> > +		=C2=A0* interrupts.
> > +		=C2=A0* MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step
> > +		=C2=A0*/
> > +		mbox_outb(mbox, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
> > +		return 0;
> > +	}
> +
> > +	atomic_dec(&mbox_open_count);
> > +	return -EBUSY;
> +}
> +
> +static ssize_t mbox_read(struct file *file, char __user *buf,
> > +				size_t count, loff_t *ppos)
> +{
> > +	struct mbox *mbox =3D file_mbox(file);
> > +	char __user *p =3D buf;
> > +	int i;
> +
> > +	if (!access_ok(VERIFY_WRITE, buf, count))
> > +		return -EFAULT;
> +
> > +	WARN_ON(*ppos);
> +
> > +	if (wait_event_interruptible(mbox->queue,
> > +		mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
> > +		return -ERESTARTSYS;
> +
> > +	for (i =3D 0; i < MBOX_NUM_DATA_REGS; i++)
> > +		if (__put_user(mbox_inb(mbox, MBOX_DATA_0 + (i * 4)), p++))
> > +			return -EFAULT;
> +
> > +	/* MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step */
> > +	mbox_outb(mbox, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
> > +	return p - buf;
> +}
> +
> +static ssize_t mbox_write(struct file *file, const char __user *buf,
> > +				size_t count, loff_t *ppos)
> +{
> > +	struct mbox *mbox =3D file_mbox(file);
> > +	const char __user *p =3D buf;
> > +	char c;
> > +	int i;
> +
> > +	if (!access_ok(VERIFY_READ, buf, count))
> > +		return -EFAULT;
> +
> > +	WARN_ON(*ppos);
> +
> > +	for (i =3D 0; i < MBOX_NUM_DATA_REGS; i++) {
> > +		if (__get_user(c, p))
> > +			return -EFAULT;
> +
> > +		mbox_outb(mbox, c, MBOX_DATA_0 + (i * 4));
> > +		p++;
> > +	}
> +
> > +	mbox_outb(mbox, MBOX_CTRL_SEND, MBOX_BMC_CTRL);
> +
> > +	return p - buf;
> +}
> +
> +static long mbox_ioctl(struct file *file, unsigned int cmd,
> > +		unsigned long param)
> +{
> > +	struct aspeed_mbox_atn atn;
> > +	struct mbox *mbox =3D file_mbox(file);
> > +	void __user *p =3D (void __user *)param;
> +
> > +	switch (cmd) {
> +	case ASPEED_MBOX_IOCTL_ATN:

I think we should rename the IOCTL as what we do below doesn't
necessarily raise an interrupt.

> +		if (copy_from_user(&atn, p, sizeof(atn)))
> > +			return -EFAULT;
> > +		if (atn.reg > 15)
> > +			return -EINVAL;
> +
> > +		mbox_outb(mbox, atn.val, atn.reg);
> > +		return 0;
> > +	}
> +
> > +	return -EINVAL;
> +}
> +
> +static unsigned int mbox_poll(struct file *file, poll_table *wait)
> +{
> > +	struct mbox *mbox =3D file_mbox(file);
> > +	unsigned int mask =3D 0;
> +
> > +	poll_wait(file, &mbox->queue, wait);
> +
> > +	if (mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV)
> > +		mask |=3D POLLIN;
> +
> > +	return mask;
> +}
> +
> +static int mbox_release(struct inode *inode, struct file *file)
> +{
> > +	atomic_dec(&mbox_open_count);
> > +	return 0;
> +}
> +
> +static const struct file_operations mbox_fops =3D {
> > > +	.owner		=3D THIS_MODULE,
> > > +	.open		=3D mbox_open,
> > > +	.read		=3D mbox_read,
> > > +	.write		=3D mbox_write,
> > > +	.release	=3D mbox_release,
> > > +	.poll		=3D mbox_poll,
> > > +	.unlocked_ioctl	=3D mbox_ioctl,
> +};
> +
> +static void poll_timer(unsigned long data)
> +{
> > +	struct mbox *mbox =3D (void *)data;
> +
> > +	mbox->poll_timer.expires +=3D msecs_to_jiffies(500);
> > +	wake_up(&mbox->queue);
> > +	add_timer(&mbox->poll_timer);
> +}
> +
> +static irqreturn_t mbox_irq(int irq, void *arg)
> +{
> > +	struct mbox *mbox =3D arg;
> +
> > +	if (!(mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
> > +		return IRQ_NONE;
> +
> > +	/*
> > +	=C2=A0* Leave the status bit set so that we know the data is for us,
> > +	=C2=A0* clear it once it has been read.
> > +	=C2=A0*/
> +
> > +	/* Mask it off, we'll clear it when we the data gets read */
> > +	mbox_outb(mbox, MBOX_CTRL_MASK, MBOX_BMC_CTRL);
> +
> > +	wake_up(&mbox->queue);
> > +	return IRQ_HANDLED;
> +}
> +
> +static int mbox_config_irq(struct mbox *mbox,
> > +		struct platform_device *pdev)
> +{
> > +	struct device *dev =3D &pdev->dev;
> > +	int rc;
> +
> > +	mbox->irq =3D irq_of_parse_and_map(dev->of_node, 0);
> > +	if (!mbox->irq)
> > +		return -ENODEV;
> +
> > +	rc =3D devm_request_irq(dev, mbox->irq, mbox_irq, IRQF_SHARED,
> > +			DEVICE_NAME, mbox);
> > +	if (rc < 0) {
> > +		dev_warn(dev, "Unable to request IRQ %d\n", mbox->irq);
> > +		mbox->irq =3D 0;
> > +		return rc;
> > +	}
> +
> > +	/*
> > +	=C2=A0* Disable all register based interrupts, we'll have to change
> > +	=C2=A0* this, protocol seemingly will require regs 0 and 15
> > +	=C2=A0*/
> > +	mbox_outb(mbox, 0x00, MBOX_INTERRUPT_0); /* regs 0 - 7 */
> > +	mbox_outb(mbox, 0x00, MBOX_INTERRUPT_1); /* regs 8 - 15 */
> +
> > +	/* W1C */
> > +	mbox_outb(mbox, 0xff, MBOX_STATUS_0);
> > +	mbox_outb(mbox, 0xff, MBOX_STATUS_1);
> +
> > +	mbox_outb(mbox, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
> > +	return 0;
> +}
> +
> +static int mbox_probe(struct platform_device *pdev)
> +{
> > +	struct mbox *mbox;
> > +	struct device *dev;
> > +	int rc;
> +
> > +	if (!pdev || !pdev->dev.of_node)
> > +		return -ENODEV;
> +
> > +	dev =3D &pdev->dev;
> > +	dev_info(dev, "Found mbox host device\n");
> +
> > +	mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> > +	if (!mbox)
> > +		return -ENOMEM;
> +
> > +	dev_set_drvdata(&pdev->dev, mbox);
> +
> > +	rc =3D of_property_read_u32(dev->of_node, "reg", &mbox->base);
> > +	if (rc) {
> > +		dev_err(dev, "Couldn't read reg device-tree property\n");
> > +		goto out;
> > +	}
> +
> > +	mbox->regmap =3D syscon_node_to_regmap(
> > +			pdev->dev.parent->of_node);
> > +	if (IS_ERR(mbox->regmap)) {
> > +		dev_err(dev, "Couldn't get regmap\n");
> > +		rc =3D -ENODEV;
> > +		goto out;
> > +	}
> +
> > +	init_waitqueue_head(&mbox->queue);
> +
> > +	mbox->miscdev.minor =3D MISC_DYNAMIC_MINOR;
> > +	mbox->miscdev.name =3D DEVICE_NAME;
> > +	mbox->miscdev.fops =3D &mbox_fops;
> > +	mbox->miscdev.parent =3D dev;
> > +	rc =3D misc_register(&mbox->miscdev);
> > +	if (rc) {
> > +		dev_err(dev, "Unable to register device\n");
> > +		goto out;
> > +	}
> +
> > +	mbox_config_irq(mbox, pdev);
> +
> > +	if (mbox->irq) {
> > +		dev_info(dev, "Using IRQ %d\n", mbox->irq);
> > +	} else {
> > +		dev_info(dev, "No IRQ; using timer\n");
> > +		setup_timer(&mbox->poll_timer, poll_timer,
> > +				(unsigned long)mbox);
> > +		mbox->poll_timer.expires =3D jiffies + msecs_to_jiffies(10);
> > +		add_timer(&mbox->poll_timer);
> > +	}
> +
> +out:
> > +	return rc;
> +
> +}
> +
> +static int mbox_remove(struct platform_device *pdev)
> +{
> > +	struct mbox *mbox =3D dev_get_drvdata(&pdev->dev);
> +
> > +	misc_deregister(&mbox->miscdev);
> > +	if (!mbox->irq)
> > +		del_timer_sync(&mbox->poll_timer);
> > +	mbox =3D NULL;
> +
> > +	return 0;
> +}
> +
> +static const struct of_device_id mbox_match[] =3D {
> > +	{ .compatible =3D "aspeed,ast2400-mbox" },
> > +	{ },
> +};
> +
> +static struct platform_driver mbox_driver =3D {
> > +	.driver =3D {
> > > +		.name		=3D DEVICE_NAME,
> > +		.of_match_table =3D mbox_match,
> > +	},
> > +	.probe =3D mbox_probe,
> > +	.remove =3D mbox_remove,
> +};
> +
> +module_platform_driver(mbox_driver);
> +
> +MODULE_DEVICE_TABLE(of, mbox_match);
> +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> +MODULE_DESCRIPTION("Linux device interface to the Aspeed MBOX registers"=
);
> diff --git a/include/uapi/linux/aspeed-mbox.h b/include/uapi/linux/aspeed=
-mbox.h
> new file mode 100644
> index 000000000000..f4e6a9242fd0
> --- /dev/null
> +++ b/include/uapi/linux/aspeed-mbox.h
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright 2016 IBM Corp.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#ifndef _UAPI_LINUX_MBOX_HOST_H
> +#define _UAPI_LINUX_MBOX_HOST_H
> +
> +#include <linux/ioctl.h>
> +
> +struct aspeed_mbox_atn {
> > +	uint8_t reg;
> > +	uint8_t val;
> +};
> +
> > +#define __ASPEED_MBOX_IOCTL_MAGIC	0xb1
> > +#define ASPEED_MBOX_IOCTL_ATN	_IOW(__ASPEED_MBOX_IOCTL_MAGIC, 0x00, st=
ruct aspeed_mbox_atn)
> +
> +#endif /* _UAPI_LINUX_MBOX_HOST_H */
--=-8J3TWSPiWQJ1FbpZQKRM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYXI8NAAoJEJ0dnzgO5LT5rpwQAJFFreKYJS8BbtMruyRivFgR
hOr14g0sZc9+3pTMBwOuyKRYkbflcrkYnCoU+zCHZPlkdK272FNPdgDJqzMN7vbP
CEezB2gtQmcEOfrZcL48MbrRByqtjc+xd0Eoe1/DSLWKqEIjZfkz/Vz6vwndpKlv
RPTOCKnMDFA+S/JSg1Nbj0RBKc5rglTwtpUnrOxpVwsn9NNFruqiwc1nAhAZxZIG
M+pd2tTgGUt9CUObVBf+gEBt+5KJ78BSUmPOn0q1BglymJS9daBhbPqTRzmomm7c
FjMFK0/PERVt6Y5nDcqzedpJPXF2xpU1vr2zZTt7yVw09N86tcZLLOuJJzlvTd0S
XOt7A1EZJhHCvoeBDIbbBqEEG7ahhjoMRq+YyoOrMGiTMRHk9JihQBKyogDXyGI3
n5uOzc+iRpFJSNRp8cFD20utE1/2Kiq4kMxgdxfS5SM3Epz2mrExxkp8q581Hax8
WAHOuqTNsxNbewHWXZEYJGb6k/7RZMqTTWW9wHgMbcty66YU1DX6kEywA5cd0OuG
YnihhQ35X6LIsNXSFCXwp6DdU+LTVXCmmMmf16GvMzFgDxBY5FfGee1YlZXHB0jI
nm1sI/wOBJrQdO262BKptTf+zGOKUlu3sN2nmpiKAWYrqiCFabUj7iW4EJIKXf7N
yNGqvfRNhI10ay5/X+m2
=UcU2
-----END PGP SIGNATURE-----

--=-8J3TWSPiWQJ1FbpZQKRM--
