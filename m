Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tlLMN0DgDzDwMM
 for <openbmc@lists.ozlabs.org>; Fri, 23 Dec 2016 18:57:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gm0XL3y1"; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id 127so3604647pfg.0
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 23:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mtbHkaH3nxpuK1ZCJWRkJOBN5JlQmepfsBk5tWGaDyA=;
 b=Gm0XL3y1JwZTyxDpsds8yenXieCaDKmNspbx53IcNbJLoruMedy1h76skJSUG+JMcs
 qdeherUUP0ub9Yc296Mygrq+kvjPIqADSv7hVuri8uQU5yPEvESA9RIgd29wsGzBgb7A
 a4OH7/SaIBlNDlEG2u0oqcomsM5XlbyWnMJS2JsOIHYW96/X2TFZt0AKnNCPwe8ZGJOj
 F4FFUnm/SCT2AUrwOHLrWLgNx71EbWxlGEtmvl20qSQ5DO23WiGWyQHy5aPQMQGRqGKQ
 41/d0PKUkEpNz68MQvduMV20EBES8nMYUvSjUO0IH/0WKGnK0tYX633xtX0tDnCJhmyk
 IEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mtbHkaH3nxpuK1ZCJWRkJOBN5JlQmepfsBk5tWGaDyA=;
 b=s34T6vnM+bqYXJu9IlTTJgBEQ76M5FtCcwabzNIl8o3Jr6yDpEqMnliBXv2IFw0svx
 NOb0jBJhCVF8dq0Nil3JOE12iiqP0c1eIWYJHEY3MPCzjPiDak8CXAadA4yiVPBjWoYq
 u+FHl/s+9UkrElZg9KANfWLU0yykb83yI6iPI5vHH9dfSUeelwWNCNbXLJoQXWoPlMy3
 HnBsWf4YHRgncsIZnSwOQ2EaWnE9bG8UJ5n1fHIWsprlUR6yoALPXR5zuUnAYfVQwwtC
 hOtsMvhJ3PJ6dy0Z0Cut1s0iAoxqRfx7DnidpfDC8sJ2AJGSyXO1T/2CYvczS6DeNQ5x
 iwfQ==
X-Gm-Message-State: AIkVDXKoLi9zL8jZqV7GkOj7bX9/mdfQyhi/954N4ThMhil+Mu/NNWk6ic41Jl4Thd4Baw==
X-Received: by 10.84.241.66 with SMTP id u2mr26168966plm.107.1482479821499;
 Thu, 22 Dec 2016 23:57:01 -0800 (PST)
Received: from [192.168.1.20] ([220.240.15.54])
 by smtp.googlemail.com with ESMTPSA id n25sm59841518pfi.33.2016.12.22.23.56.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 22 Dec 2016 23:57:00 -0800 (PST)
Message-ID: <1482479795.14044.5.camel@gmail.com>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Fri, 23 Dec 2016 18:56:35 +1100
In-Reply-To: <1482460941.3419.26.camel@aj.id.au>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
 <1482460941.3419.26.camel@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 
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
X-List-Received-Date: Fri, 23 Dec 2016 07:57:04 -0000

On Fri, 2016-12-23 at 13:12 +1030, Andrew Jeffery wrote:
> Hi Cyril,
> 
> This looks good to me. A couple of minor comments below.
> 
> On Thu, 2016-12-22 at 17:06 +1100, Cyril Bur wrote:
> > This provides access to the mbox registers on the ast2400 and ast2500 boards.
> > 
> > An ioctl() is used to allow users to write to a specific register with a specific
> > value. This is useful as the other end have configured the mbox registers to
> > provide an interrupt when a specific regster gets written to.
> > 
> > > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > 
> > ---
> >  drivers/mailbox/Kconfig          |   9 +
> >  drivers/mailbox/Makefile         |   3 +
> >  drivers/mailbox/aspeed-mbox.c    | 354 +++++++++++++++++++++++++++++++++++++++
> >  include/uapi/linux/aspeed-mbox.h |  23 +++
> >  4 files changed, 389 insertions(+)
> >  create mode 100644 drivers/mailbox/aspeed-mbox.c
> >  create mode 100644 include/uapi/linux/aspeed-mbox.h
> > 
> > diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> > index 5305923752d2..815cfe852dea 100644
> > --- a/drivers/mailbox/Kconfig
> > +++ b/drivers/mailbox/Kconfig
> > @@ -123,4 +123,13 @@ config XGENE_SLIMPRO_MBOX
> > >  	  It is used to send short messages between ARM64-bit cores and
> > >  	  the SLIMpro Management Engine, primarily for PM. Say Y here if you
> > >  	  want to use the APM X-Gene SLIMpro IPCM support.
> > 
> > +
> > +config ASPEED_MBOX
> > > +	depends on ARCH_ASPEED || COMPILE_TEST
> > > +	bool "Aspeed ast2400/2500 Mailbox Controller"
> > > +	default "y"
> > > +	---help---
> > > +	  Provides a driver for the MBOX regsiters found on Aspeed SOCs
> > > +	  (AST2400 and AST2500). This driver provides a device for aspeed
> > > +	  mbox registers
> > 
> >  endif
> > diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> > index 0be3e742bb7d..99d17f3b9552 100644
> > --- a/drivers/mailbox/Makefile
> > +++ b/drivers/mailbox/Makefile
> > @@ -25,3 +25,6 @@ obj-$(CONFIG_TI_MESSAGE_MANAGER) += ti-msgmgr.o
> >  obj-$(CONFIG_XGENE_SLIMPRO_MBOX) += mailbox-xgene-slimpro.o
> >  
> > >  obj-$(CONFIG_HI6220_MBOX)	+= hi6220-mailbox.o
> > 
> > +
> > > +obj-$(CONFIG_ASPEED_MBOX)		+= aspeed-mbox.o
> > 
> > +
> > diff --git a/drivers/mailbox/aspeed-mbox.c b/drivers/mailbox/aspeed-mbox.c
> > new file mode 100644
> > index 000000000000..a5da7fc0fd23
> > --- /dev/null
> > +++ b/drivers/mailbox/aspeed-mbox.c
> > @@ -0,0 +1,354 @@
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
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/regmap.h>
> > +#include <linux/aspeed-mbox.h>
> > +
> > > +#define DEVICE_NAME	"aspeed-mbox"
> > 
> > +
> > +#define MBOX_NUM_REGS 16
> > +#define MBOX_NUM_DATA_REGS 14
> > +
> > +#define MBOX_DATA_0 0x00
> > +#define MBOX_STATUS_0 0x40
> > +#define MBOX_STATUS_1 0x44
> > +#define MBOX_BMC_CTRL 0x48
> > +#define   MBOX_CTRL_RECV BIT(7)
> > +#define   MBOX_CTRL_MASK BIT(1)
> > +#define   MBOX_CTRL_SEND BIT(0)
> > +#define MBOX_HOST_CTRL 0x4c
> > +#define MBOX_INTERRUPT_0 0x50
> > +#define MBOX_INTERRUPT_1 0x54
> > +
> > +struct mbox {
> > > > +	struct miscdevice	miscdev;
> > > > +	struct regmap		*regmap;
> > > > +	unsigned int		base;
> > > > +	int			irq;
> > > > +	wait_queue_head_t	queue;
> > > > +	struct timer_list	poll_timer;
> > 
> > +};
> > +
> > +static atomic_t mbox_open_count = ATOMIC_INIT(0);
> > +
> > +static u8 mbox_inb(struct mbox *mbox, int reg)
> > +{
> > > +	/*
> > > +	 * The mbox registers are actually only 1 byte but are addressed 4
> > > +	 * bytes appart. The other three bytes are marked 'reserved', they
> > > +	 * *should* be zero but lets not rely on it.
> > > +	 * I am going to rely on the fact we can casually read/write to them...
> > > +	 */
> > > +	unsigned int val = 0xff; /* If regmap throws an error return 0xff */
> > > +	regmap_read(mbox->regmap, mbox->base + reg, &val);
> > 
> > +	return val & 0xff;
> > +}
> > +
> > +static void mbox_outb(struct mbox *mbox, u8 data, int reg)
> > +{
> > +	regmap_write(mbox->regmap, mbox->base + reg, data);
> 
> We could use regmap_update_bits() here, but ultimately it's not going
> to matter. Should we say something if regmap_write() fails (it
> shouldn't, but if it does that's extra concerning)?

regmap_update_bits() to about touching the reserved section? Probs a
good idea.
Yeah I thought about putting a dev_err() in there. I'm not opposed, I
sort of though, we'll you never see them or when you do something
really bad has happened you'll probably notice everything broke...
Still in the incredibly unlikely event that a print proves useful I'm
happy to add it.

> 
> > +}
> > +
> > +static struct mbox *file_mbox(struct file *file)
> > +{
> > > +	return container_of(file->private_data, struct mbox, miscdev);
> > 
> > +}
> > +
> > +static int mbox_open(struct inode *inode, struct file *file)
> > +{
> > > +	struct mbox *mbox = file_mbox(file);
> > 
> > +
> > > +	if (atomic_inc_return(&mbox_open_count) == 1) {
> > > +		/*
> > > +		 * Clear the interrupt status bit if it was left on and unmask
> > > +		 * interrupts.
> > > +		 * MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step
> > > +		 */
> > > +		mbox_outb(mbox, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
> > > +		return 0;
> > > +	}
> > 
> > +
> > > +	atomic_dec(&mbox_open_count);
> > > +	return -EBUSY;
> > 
> > +}
> > +
> > +static ssize_t mbox_read(struct file *file, char __user *buf,
> > > +				size_t count, loff_t *ppos)
> > 
> > +{
> > > +	struct mbox *mbox = file_mbox(file);
> > > +	char __user *p = buf;
> > > +	int i;
> > 
> > +
> > > +	if (!access_ok(VERIFY_WRITE, buf, count))
> > > +		return -EFAULT;
> > 
> > +
> > > +	WARN_ON(*ppos);
> > 
> > +
> > > +	if (wait_event_interruptible(mbox->queue,
> > > +		mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
> > > +		return -ERESTARTSYS;
> > 
> > +
> > > +	for (i = 0; i < MBOX_NUM_DATA_REGS; i++)
> > > +		if (__put_user(mbox_inb(mbox, MBOX_DATA_0 + (i * 4)), p++))
> > > +			return -EFAULT;
> > 
> > +
> > > +	/* MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step */
> > > +	mbox_outb(mbox, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
> > > +	return p - buf;
> > 
> > +}
> > +
> > +static ssize_t mbox_write(struct file *file, const char __user *buf,
> > > +				size_t count, loff_t *ppos)
> > 
> > +{
> > > +	struct mbox *mbox = file_mbox(file);
> > > +	const char __user *p = buf;
> > > +	char c;
> > > +	int i;
> > 
> > +
> > > +	if (!access_ok(VERIFY_READ, buf, count))
> > > +		return -EFAULT;
> > 
> > +
> > > +	WARN_ON(*ppos);
> > 
> > +
> > > +	for (i = 0; i < MBOX_NUM_DATA_REGS; i++) {
> > > +		if (__get_user(c, p))
> > > +			return -EFAULT;
> > 
> > +
> > > +		mbox_outb(mbox, c, MBOX_DATA_0 + (i * 4));
> > > +		p++;
> > > +	}
> > 
> > +
> > > +	mbox_outb(mbox, MBOX_CTRL_SEND, MBOX_BMC_CTRL);
> > 
> > +
> > > +	return p - buf;
> > 
> > +}
> > +
> > +static long mbox_ioctl(struct file *file, unsigned int cmd,
> > > +		unsigned long param)
> > 
> > +{
> > > +	struct aspeed_mbox_atn atn;
> > > +	struct mbox *mbox = file_mbox(file);
> > > +	void __user *p = (void __user *)param;
> > 
> > +
> > > +	switch (cmd) {
> > 
> > +	case ASPEED_MBOX_IOCTL_ATN:
> 
> I think we should rename the IOCTL as what we do below doesn't
> necessarily raise an interrupt.
> 

Agreed, taking unput :). ASPEED_MBOX_IOCTL_WRITE_BYTE ?


Thanks,

Cyril

> > +		if (copy_from_user(&atn, p, sizeof(atn)))
> > > +			return -EFAULT;
> > > +		if (atn.reg > 15)
> > > +			return -EINVAL;
> > 
> > +
> > > +		mbox_outb(mbox, atn.val, atn.reg);
> > > +		return 0;
> > > +	}
> > 
> > +
> > > +	return -EINVAL;
> > 
> > +}
> > +
> > +static unsigned int mbox_poll(struct file *file, poll_table *wait)
> > +{
> > > +	struct mbox *mbox = file_mbox(file);
> > > +	unsigned int mask = 0;
> > 
> > +
> > > +	poll_wait(file, &mbox->queue, wait);
> > 
> > +
> > > +	if (mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV)
> > > +		mask |= POLLIN;
> > 
> > +
> > > +	return mask;
> > 
> > +}
> > +
> > +static int mbox_release(struct inode *inode, struct file *file)
> > +{
> > > +	atomic_dec(&mbox_open_count);
> > > +	return 0;
> > 
> > +}
> > +
> > +static const struct file_operations mbox_fops = {
> > > > +	.owner		= THIS_MODULE,
> > > > +	.open		= mbox_open,
> > > > +	.read		= mbox_read,
> > > > +	.write		= mbox_write,
> > > > +	.release	= mbox_release,
> > > > +	.poll		= mbox_poll,
> > > > +	.unlocked_ioctl	= mbox_ioctl,
> > 
> > +};
> > +
> > +static void poll_timer(unsigned long data)
> > +{
> > > +	struct mbox *mbox = (void *)data;
> > 
> > +
> > > +	mbox->poll_timer.expires += msecs_to_jiffies(500);
> > > +	wake_up(&mbox->queue);
> > > +	add_timer(&mbox->poll_timer);
> > 
> > +}
> > +
> > +static irqreturn_t mbox_irq(int irq, void *arg)
> > +{
> > > +	struct mbox *mbox = arg;
> > 
> > +
> > > +	if (!(mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
> > > +		return IRQ_NONE;
> > 
> > +
> > > +	/*
> > > +	 * Leave the status bit set so that we know the data is for us,
> > > +	 * clear it once it has been read.
> > > +	 */
> > 
> > +
> > > +	/* Mask it off, we'll clear it when we the data gets read */
> > > +	mbox_outb(mbox, MBOX_CTRL_MASK, MBOX_BMC_CTRL);
> > 
> > +
> > > +	wake_up(&mbox->queue);
> > > +	return IRQ_HANDLED;
> > 
> > +}
> > +
> > +static int mbox_config_irq(struct mbox *mbox,
> > > +		struct platform_device *pdev)
> > 
> > +{
> > > +	struct device *dev = &pdev->dev;
> > > +	int rc;
> > 
> > +
> > > +	mbox->irq = irq_of_parse_and_map(dev->of_node, 0);
> > > +	if (!mbox->irq)
> > > +		return -ENODEV;
> > 
> > +
> > > +	rc = devm_request_irq(dev, mbox->irq, mbox_irq, IRQF_SHARED,
> > > +			DEVICE_NAME, mbox);
> > > +	if (rc < 0) {
> > > +		dev_warn(dev, "Unable to request IRQ %d\n", mbox->irq);
> > > +		mbox->irq = 0;
> > > +		return rc;
> > > +	}
> > 
> > +
> > > +	/*
> > > +	 * Disable all register based interrupts, we'll have to change
> > > +	 * this, protocol seemingly will require regs 0 and 15
> > > +	 */
> > > +	mbox_outb(mbox, 0x00, MBOX_INTERRUPT_0); /* regs 0 - 7 */
> > > +	mbox_outb(mbox, 0x00, MBOX_INTERRUPT_1); /* regs 8 - 15 */
> > 
> > +
> > > +	/* W1C */
> > > +	mbox_outb(mbox, 0xff, MBOX_STATUS_0);
> > > +	mbox_outb(mbox, 0xff, MBOX_STATUS_1);
> > 
> > +
> > > +	mbox_outb(mbox, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
> > > +	return 0;
> > 
> > +}
> > +
> > +static int mbox_probe(struct platform_device *pdev)
> > +{
> > > +	struct mbox *mbox;
> > > +	struct device *dev;
> > > +	int rc;
> > 
> > +
> > > +	if (!pdev || !pdev->dev.of_node)
> > > +		return -ENODEV;
> > 
> > +
> > > +	dev = &pdev->dev;
> > > +	dev_info(dev, "Found mbox host device\n");
> > 
> > +
> > > +	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> > > +	if (!mbox)
> > > +		return -ENOMEM;
> > 
> > +
> > > +	dev_set_drvdata(&pdev->dev, mbox);
> > 
> > +
> > > +	rc = of_property_read_u32(dev->of_node, "reg", &mbox->base);
> > > +	if (rc) {
> > > +		dev_err(dev, "Couldn't read reg device-tree property\n");
> > > +		goto out;
> > > +	}
> > 
> > +
> > > +	mbox->regmap = syscon_node_to_regmap(
> > > +			pdev->dev.parent->of_node);
> > > +	if (IS_ERR(mbox->regmap)) {
> > > +		dev_err(dev, "Couldn't get regmap\n");
> > > +		rc = -ENODEV;
> > > +		goto out;
> > > +	}
> > 
> > +
> > > +	init_waitqueue_head(&mbox->queue);
> > 
> > +
> > > +	mbox->miscdev.minor = MISC_DYNAMIC_MINOR;
> > > +	mbox->miscdev.name = DEVICE_NAME;
> > > +	mbox->miscdev.fops = &mbox_fops;
> > > +	mbox->miscdev.parent = dev;
> > > +	rc = misc_register(&mbox->miscdev);
> > > +	if (rc) {
> > > +		dev_err(dev, "Unable to register device\n");
> > > +		goto out;
> > > +	}
> > 
> > +
> > > +	mbox_config_irq(mbox, pdev);
> > 
> > +
> > > +	if (mbox->irq) {
> > > +		dev_info(dev, "Using IRQ %d\n", mbox->irq);
> > > +	} else {
> > > +		dev_info(dev, "No IRQ; using timer\n");
> > > +		setup_timer(&mbox->poll_timer, poll_timer,
> > > +				(unsigned long)mbox);
> > > +		mbox->poll_timer.expires = jiffies + msecs_to_jiffies(10);
> > > +		add_timer(&mbox->poll_timer);
> > > +	}
> > 
> > +
> > +out:
> > > +	return rc;
> > 
> > +
> > +}
> > +
> > +static int mbox_remove(struct platform_device *pdev)
> > +{
> > > +	struct mbox *mbox = dev_get_drvdata(&pdev->dev);
> > 
> > +
> > > +	misc_deregister(&mbox->miscdev);
> > > +	if (!mbox->irq)
> > > +		del_timer_sync(&mbox->poll_timer);
> > > +	mbox = NULL;
> > 
> > +
> > > +	return 0;
> > 
> > +}
> > +
> > +static const struct of_device_id mbox_match[] = {
> > > +	{ .compatible = "aspeed,ast2400-mbox" },
> > > +	{ },
> > 
> > +};
> > +
> > +static struct platform_driver mbox_driver = {
> > > +	.driver = {
> > > > +		.name		= DEVICE_NAME,
> > > 
> > > +		.of_match_table = mbox_match,
> > > +	},
> > > +	.probe = mbox_probe,
> > > +	.remove = mbox_remove,
> > 
> > +};
> > +
> > +module_platform_driver(mbox_driver);
> > +
> > +MODULE_DEVICE_TABLE(of, mbox_match);
> > +MODULE_LICENSE("GPL");
> > > +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> > 
> > +MODULE_DESCRIPTION("Linux device interface to the Aspeed MBOX registers");
> > diff --git a/include/uapi/linux/aspeed-mbox.h b/include/uapi/linux/aspeed-mbox.h
> > new file mode 100644
> > index 000000000000..f4e6a9242fd0
> > --- /dev/null
> > +++ b/include/uapi/linux/aspeed-mbox.h
> > @@ -0,0 +1,23 @@
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
> > +struct aspeed_mbox_atn {
> > > +	uint8_t reg;
> > > +	uint8_t val;
> > 
> > +};
> > +
> > > +#define __ASPEED_MBOX_IOCTL_MAGIC	0xb1
> > > +#define ASPEED_MBOX_IOCTL_ATN	_IOW(__ASPEED_MBOX_IOCTL_MAGIC, 0x00, struct aspeed_mbox_atn)
> > 
> > +
> > +#endif /* _UAPI_LINUX_MBOX_HOST_H */
