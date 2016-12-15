Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tfQrB2qNWzDw5P
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 19:01:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="szL5L2hw"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id 144so2452392pfv.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Dec 2016 00:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IVzk9Y+4yfFm3n/h0pVpvEjIt1R5eeKgJrkfDPHHPSs=;
 b=szL5L2hwu+B1DBzfNBaEPN86HfA36TQ2STljB5nFvGPHjt1kR9FXmbGdCzYY7uRpLV
 Ajkiw7VE4ZjG+LQuwLMM8O5J2D+9QesbnNg/O6VmTd6EXSi3YbL4+T1coKNgab700B+f
 imhAqMHfaSfTzS0wKyPlEaVyfmS2Z3n0nI/VL+CaoFsOIrzvU/n0GHaopa8rrwnCrft/
 IgDyd9EyDxErS7Cmdf5hQBAMvOgI2Zud8x3V/GN/nNpjPJJjg6iULuValgRvmFH9dHRy
 lorPFPLcaNOa0RKiQQmeL0lB9zJ8PJdr/ZAMP/EZZtz7PU5yLLwVDorJvxlzf+HXmoeq
 D6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IVzk9Y+4yfFm3n/h0pVpvEjIt1R5eeKgJrkfDPHHPSs=;
 b=fdqzhZ1fVZFO3mqEk850Ha+Px+lj7sGO57ZfQrxbuNRTMJNiH+8jwkERlnvU1Oq4tx
 JbnketNCpyvmKJI+aBlKRB83gv8CU8npodHc/nKvgCx/E+G604whCLd6uyujEedYtAGD
 jDBHXUFzOIcnetoJM5hSV7FFsXCzK+ee+mQRhl2ZOkpY82ZeoRwNpRbDFKLlDhsY18dp
 R2BvLwjRQ2h18g4DHAqK5qela5xbJUKcxSR+Ch9jCj6+18Q2MD+PYpytRtMezHA/KdFw
 u4wTjYuEKQlLVYG3Sc1dxFUvTN//G4Iy647dHdW1kZ+WHQKEncnq5dGe2JeVNcj4IsN4
 AEeQ==
X-Gm-Message-State: AKaTC03fHFZEobP5kgCyrjpm6ivmnBJMtxijVKTKl+KfXsC7pTETh0SKK1uduwTPZVUURw==
X-Received: by 10.99.5.21 with SMTP id 21mr121520pgf.32.1481788888267;
 Thu, 15 Dec 2016 00:01:28 -0800 (PST)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id p1sm2026446pgc.29.2016.12.15.00.01.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 15 Dec 2016 00:01:27 -0800 (PST)
Message-ID: <1481788884.814.9.camel@gmail.com>
Subject: Re: [PATCH linux 2/3] drivers/misc: Add aspeed mbox driver
From: Cyril Bur <cyrilbur@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 15 Dec 2016 19:01:24 +1100
In-Reply-To: <99fd21bc-b0b6-34fc-f0b2-b1c1c291e56a@kaod.org>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-3-cyrilbur@gmail.com>
 <99fd21bc-b0b6-34fc-f0b2-b1c1c291e56a@kaod.org>
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
X-List-Received-Date: Thu, 15 Dec 2016 08:01:31 -0000

On Tue, 2016-12-13 at 09:14 +0100, Cédric Le Goater wrote:
> Hello Cyril,
> 
> On 12/09/2016 06:43 AM, Cyril Bur wrote:
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  drivers/misc/Kconfig           |   7 +
> >  drivers/misc/Makefile          |   2 +
> >  drivers/misc/mbox-host.c       | 326
> > +++++++++++++++++++++++++++++++++++++++++
> >  include/uapi/linux/mbox-host.h |  18 +++
> >  4 files changed, 353 insertions(+)
> >  create mode 100644 drivers/misc/mbox-host.c
> >  create mode 100644 include/uapi/linux/mbox-host.h
> > 
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index a216b46..44f191d 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -804,6 +804,13 @@ config PANEL_BOOT_MESSAGE
> >  	  An empty message will only clear the display at driver
> > init time. Any other
> >  	  printf()-formatted message is valid with newline and
> > escape codes.
> >  
> > +config MBOX_HOST
> > +	depends on ARCH_ASPEED
> > +	bool "Build MBOX driver for BMC to HOST communication"
> > +	default "n"
> > +	---help---
> > +	  Build the MBOX driver
> 
> nah. we need a little more doc here :)

Probably :), I'm terrible at this kind of stuff - I'll be sure to have
something before we finally upstream it.

> 
> >  source "drivers/misc/c2port/Kconfig"
> >  source "drivers/misc/eeprom/Kconfig"
> >  source "drivers/misc/cb710/Kconfig"
> > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > index b2fb6dbf..7bcaf30 100644
> > --- a/drivers/misc/Makefile
> > +++ b/drivers/misc/Makefile
> > @@ -57,3 +57,5 @@ obj-$(CONFIG_ECHO)		+= echo/
> >  obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
> >  obj-$(CONFIG_CXL_BASE)		+= cxl/
> >  obj-$(CONFIG_PANEL)             += panel.o
> > +obj-$(CONFIG_MBOX_HOST)		+= mbox-host.o
> > +>>>>>>> 6252f95... fixup! drivers/misc: Add aspeed mbox driver
> > diff --git a/drivers/misc/mbox-host.c b/drivers/misc/mbox-host.c
> > new file mode 100644
> > index 0000000..9d11da4
> > --- /dev/null
> > +++ b/drivers/misc/mbox-host.c
> > @@ -0,0 +1,326 @@
> > +/*
> > + * Copyright 2016 IBM Corporation
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + */
> > +
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
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/io.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/delay.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/timer.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/mbox-host.h>
> > +
> > +#define DEVICE_NAME	"mbox-host"
> > +
> > +#define MBOX_NUM_REGS 16
> > +#define MBOX_NUM_DATA_REGS 14
> > +
> > +#define MBOX_DATA_0 0x00
> > +#define MBOX_STATUS_0 0x40
> > +#define MBOX_STATUS_1 0x44
> > +#define MBOX_BMC_CTRL 0x48
> > +	#define MBOX_CTRL_RECV 0x80
> > +	#define MBOX_CTRL_MASK 0x02
> > +	#define MBOX_CTRL_SEND 0x01
> > +#define MBOX_HOST_CTRL 0x4c
> > +#define MBOX_INTERRUPT_0 0x50
> > +#define MBOX_INTERRUPT_1 0x54
> > +
> > +struct mbox_host {
> > +	struct miscdevice	miscdev;
> > +	void __iomem		*base;
> > +	int			irq;
> > +	wait_queue_head_t	queue;
> > +	struct timer_list	poll_timer;
> > +};
> 
> you should may be use an atomic to prevent multiple process to 
> open the device. I don't think we want more than one ? 
> 

Yes, I suppose it would be wise - I'll add that

> What about multiple threads ? Maybe we need a mutex to protect 
> the read and write ops ? 

Thoughts? I'm not against letting userspace shoot its self in the foot
here. Protecting against multiple processes does make sense but if
you're going to have two threads writing, you're doing something
wrong... I don't have particularly strong feelings either way...

> 
> 
> > +static u8 mbox_inb(struct mbox_host *mbox_host, int reg)
> > +{
> > +	return ioread8(mbox_host->base + reg);
> > +}
> > +
> > +static void mbox_outb(struct mbox_host *mbox_host, u8 data, int
> > reg)
> > +{
> > +	iowrite8(data, mbox_host->base + reg);
> > +}
> > +
> > +static struct mbox_host *file_mbox_host(struct file *file)
> > +{
> > +	return container_of(file->private_data, struct mbox_host,
> > miscdev);
> > +}
> > +
> > +static int mbox_host_open(struct inode *inode, struct file *file)
> > +{
> > +	return 0;
> > +}
> > +
> > +static ssize_t mbox_host_read(struct file *file, char __user *buf,
> > +				size_t count, loff_t *ppos)
> > +{
> > +	struct mbox_host *mbox_host = file_mbox_host(file);
> > +	char __user *p = buf;
> > +	int i;
> > +
> > +	if (!access_ok(VERIFY_WRITE, buf, count))
> > +		return -EFAULT;
> > +
> > +	WARN_ON(*ppos);
> > +
> > +	if (wait_event_interruptible(mbox_host->queue,
> > +		mbox_inb(mbox_host, MBOX_BMC_CTRL) &
> > MBOX_CTRL_RECV))
> > +		return -ERESTARTSYS;
> > +
> > +	for (i = 0; i < MBOX_NUM_DATA_REGS; i++)
> > +		if (__put_user(mbox_inb(mbox_host, MBOX_DATA_0 +
> > (i * 4)), p++))
> > +			return -EFAULT;
> 
> could you change the code to not use byte at a time call from
> userspace ? and
> any how, __put_user(mbox_inb(...)) looks like it could be splitted :)

Yeah, I could/should buffer it.

> 
> > +	/* MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step
> > */
> > +	mbox_outb(mbox_host, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
> > +	return p - buf;
> > +}
> > +
> > +static ssize_t mbox_host_write(struct file *file, const char
> > __user *buf,
> > +				size_t count, loff_t *ppos)
> > +{
> > +	struct mbox_host *mbox_host = file_mbox_host(file);
> > +	const char __user *p = buf;
> > +	char c;
> > +	int i;
> > +
> > +	if (!access_ok(VERIFY_READ, buf, count))
> > +		return -EFAULT;
> > +
> > +	WARN_ON(*ppos);
> > +
> > +	for (i = 0; i < MBOX_NUM_DATA_REGS; i++) {
> > +		if (__get_user(c, p))
> > +			return -EFAULT;
> > +
> > +		mbox_outb(mbox_host, c, MBOX_DATA_0 + (i * 4));
> > +		p++;
> > +	}
> 
> same here.

Yep.

> 
> > +	mbox_outb(mbox_host, MBOX_CTRL_SEND, MBOX_BMC_CTRL);
> > +
> > +	return p - buf;
> > +}
> > +
> > +static long mbox_host_ioctl(struct file *file, unsigned int cmd,
> > +		unsigned long param)
> > +{
> > +	struct mbox_host *mbox_host = file_mbox_host(file);
> > +
> > +	switch (cmd) {
> > +	case MBOX_HOST_IOCTL_ATN:
> > +		mbox_outb(mbox_host, param, MBOX_DATA_0 + 15);
> 
> 15 ? 

Ah yes nice catch. Ignoring the obvious issue that 15 is quite magic,
theres actually a bit more of a problem. This is really a part of the
userspace protocol I've developed. The kernel really shouldn't know
which byte the host is listening to receive interrupts and I'm not
super comfortable with this. Perhaps I should actually change the
ioctl() to actually let userspace write a single byte to any of the 16
data regs, this means the kernel doesn't actually have to know anything
special about my protocol.

Yeah I'll just do that, I'm glad we all agree. heh

> 
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int mbox_host_release(struct inode *inode, struct file
> > *file)
> > +{
> > +	return 0;
> > +}
> > +
> > +static unsigned int mbox_host_poll(struct file *file, poll_table
> > *wait)
> > +{
> > +	struct mbox_host *mbox_host = file_mbox_host(file);
> > +	unsigned int mask = 0;
> > +
> > +	poll_wait(file, &mbox_host->queue, wait);
> > +
> > +	if (mbox_inb(mbox_host, MBOX_BMC_CTRL) & MBOX_CTRL_RECV)
> > +		mask |= POLLIN;
> > +
> > +	return mask;
> > +}
> > +
> > +static const struct file_operations mbox_host_fops = {
> > +	.owner		= THIS_MODULE,
> > +	.open		= mbox_host_open,
> > +	.read		= mbox_host_read,
> > +	.write		= mbox_host_write,
> > +	.release	= mbox_host_release,
> > +	.poll		= mbox_host_poll,
> > +	.unlocked_ioctl	= mbox_host_ioctl,
> > +};
> > +
> > +static void poll_timer(unsigned long data)
> > +{
> > +	struct mbox_host *mbox_host = (void *)data;
> > +
> > +	mbox_host->poll_timer.expires += msecs_to_jiffies(500);
> > +	wake_up(&mbox_host->queue);
> > +	add_timer(&mbox_host->poll_timer);
> > +}
> > +
> > +static irqreturn_t mbox_host_irq(int irq, void *arg)
> > +{
> > +	struct mbox_host *mbox_host = arg;
> > +
> > +	if (!(mbox_inb(mbox_host, MBOX_BMC_CTRL) &
> > MBOX_CTRL_RECV))
> > +		return IRQ_NONE;
> > +
> > +	/*
> > +	 * Leave the status bit set so that we know the data is
> > for us,
> > +	 * clear it once it has been read.
> > +	 */
> > +
> > +	/* Mask it off, we'll clear it when we the data gets read
> > */
> > +	mbox_outb(mbox_host, MBOX_CTRL_MASK, MBOX_BMC_CTRL);
> > +
> > +	wake_up(&mbox_host->queue);
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int mbox_host_config_irq(struct mbox_host *mbox_host,
> > +		struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	int rc;
> > +
> > +	mbox_host->irq = irq_of_parse_and_map(dev->of_node, 0);
> > +	if (!mbox_host->irq)
> > +		return -ENODEV;
> > +
> > +	rc = devm_request_irq(dev, mbox_host->irq, mbox_host_irq,
> > IRQF_SHARED,
> > +			DEVICE_NAME, mbox_host);
> > +	if (rc < 0) {
> > +		dev_warn(dev, "Unable to request IRQ %d\n",
> > mbox_host->irq);
> > +		mbox_host->irq = 0;
> > +		return rc;
> > +	}
> > +
> > +	/*
> > +	 * Disable all register based interrupts, we'll have to
> > change
> > +	 * this, protocol seemingly will require regs 0 and 15
> > +	 */
> > +	mbox_outb(mbox_host, 0x00, MBOX_INTERRUPT_0); /* regs 0 -
> > 7 */
> > +	mbox_outb(mbox_host, 0x00, MBOX_INTERRUPT_1); /* regs 8 -
> > 15 */
> > +
> > +	/* W1C */
> > +	mbox_outb(mbox_host, 0xff, MBOX_STATUS_0);
> > +	mbox_outb(mbox_host, 0xff, MBOX_STATUS_1);
> > +
> > +	mbox_outb(mbox_host, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
> > +	return 0;
> > +}
> > +
> > +static int mbox_host_probe(struct platform_device *pdev)
> > +{
> > +	struct mbox_host *mbox_host;
> > +	struct device *dev;
> > +	struct resource *res;
> > +	int rc;
> > +
> > +	if (!pdev || !pdev->dev.of_node)
> > +		return -ENODEV;
> > +
> > +	dev = &pdev->dev;
> > +	dev_info(dev, "Found mbox host device\n");
> > +
> > +	mbox_host = devm_kzalloc(dev, sizeof(*mbox_host),
> > GFP_KERNEL);
> > +	if (!mbox_host)
> > +		return -ENOMEM;
> > +
> > +	dev_set_drvdata(&pdev->dev, mbox_host);
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(dev, "Unable to find resources\n");
> > +		rc = -ENXIO;
> > +		goto out_free;
> > +	}
> > +
> > +	mbox_host->base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (!mbox_host->base) {
> > +		rc = -ENOMEM;
> > +		goto out_free;
> > +	}
> > +	init_waitqueue_head(&mbox_host->queue);
> > +
> > +	mbox_host->miscdev.minor = MISC_DYNAMIC_MINOR;
> > +	mbox_host->miscdev.name = DEVICE_NAME;
> > +	mbox_host->miscdev.fops = &mbox_host_fops;
> > +	mbox_host->miscdev.parent = dev;
> > +	rc = misc_register(&mbox_host->miscdev);
> > +	if (rc) {
> > +		dev_err(dev, "Unable to register device\n");
> > +		goto out_unmap;
> > +	}
> > +
> > +	mbox_host_config_irq(mbox_host, pdev);
> > +
> > +	if (mbox_host->irq) {
> > +		dev_info(dev, "Using IRQ %d\n", mbox_host->irq);
> > +	} else {
> > +		dev_info(dev, "No IRQ; using timer\n");
> > +		setup_timer(&mbox_host->poll_timer, poll_timer,
> > +				(unsigned long)mbox_host);
> > +		mbox_host->poll_timer.expires = jiffies +
> > msecs_to_jiffies(10);
> > +		add_timer(&mbox_host->poll_timer);
> > +	}
> > +	return 0;
> > +
> > +out_unmap:
> > +	devm_iounmap(&pdev->dev, mbox_host->base);
> > +
> > +out_free:
> > +	devm_kfree(dev, mbox_host);
> > +	return rc;
> 
> These calls should be handled automatically by the driver when you
> use the devm_*
> routines

Yep, wasn't sure, I'll take them out

> 
> > +}
> > +
> > +static int mbox_host_remove(struct platform_device *pdev)
> > +{
> > +	struct mbox_host *mbox_host = dev_get_drvdata(&pdev->dev);
> > +
> > +	misc_deregister(&mbox_host->miscdev);
> > +	if (!mbox_host->irq)
> > +		del_timer_sync(&mbox_host->poll_timer);
> > +	devm_iounmap(&pdev->dev, mbox_host->base);
> > +	devm_kfree(&pdev->dev, mbox_host);
> 
> 
> These calls should be handled automatically by the driver.
> 
> 
> > +	mbox_host = NULL;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id mbox_host_match[] = {
> > +	{ .compatible = "aspeed,mbox-host" },
> 
> you need a soc revision here. 
> 

Ack

> 

Thanks for the review,

Cyril

> Thanks,
> 
> C. 
> 
> > +	{ },
> > +};
> > +
> > +static struct platform_driver mbox_host_driver = {
> > +	.driver = {
> > +		.name		= DEVICE_NAME,
> > +		.of_match_table = mbox_host_match,
> > +	},
> > +	.probe = mbox_host_probe,
> > +	.remove = mbox_host_remove,
> > +};
> > +
> > +module_platform_driver(mbox_host_driver);
> > +
> > +MODULE_DEVICE_TABLE(of, mbox_host_match);
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> > +MODULE_DESCRIPTION("Linux device interface to the MBOX
> > interface");
> > diff --git a/include/uapi/linux/mbox-host.h
> > b/include/uapi/linux/mbox-host.h
> > new file mode 100644
> > index 0000000..3888f43
> > --- /dev/null
> > +++ b/include/uapi/linux/mbox-host.h
> > @@ -0,0 +1,18 @@
> > +/*
> > + * Copyright 2016 IBM Corp.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + */
> > +
> > +#ifndef _UAPI_LINUX_MBOX_HOST_H
> > +#define _UAPI_LINUX_MBOX_HOST_H
> > +
> > +#include <linux/ioctl.h>
> > +
> > +#define __MBOX_HOST_IOCTL_MAGIC	0xb1
> > +#define MBOX_HOST_IOCTL_ATN	_IOW(__MBOX_HOST_IOCTL_MAGIC,
> > 0x00, uint8_t)
> > +
> > +#endif /* _UAPI_LINUX_MBOX_HOST_H */
> > 
> 
> 
