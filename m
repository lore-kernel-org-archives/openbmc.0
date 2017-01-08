Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3txWsG6FPzzDqDy
 for <openbmc@lists.ozlabs.org>; Mon,  9 Jan 2017 08:39:46 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v08LdaXi013588;
 Sun, 8 Jan 2017 15:39:37 -0600
Message-ID: <1483911578.15843.59.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Sun, 08 Jan 2017 15:39:38 -0600
In-Reply-To: <20161222060610.29695-5-cyrilbur@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
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
X-List-Received-Date: Sun, 08 Jan 2017 21:39:47 -0000

On Thu, 2016-12-22 at 17:06 +1100, Cyril Bur wrote:

> +
> +static ssize_t mbox_read(struct file *file, char __user *buf,
> > +				size_t count, loff_t *ppos)
> +{
> > +	struct mbox *mbox = file_mbox(file);
> > +	char __user *p = buf;
> > +	int i;
> +
> > +	if (!access_ok(VERIFY_WRITE, buf, count))
> > +		return -EFAULT;
> +
> > +	WARN_ON(*ppos);

Why the above ? Isn't that a user-triggerable WARN_ON ?

> +	if (wait_event_interruptible(mbox->queue,
> > +		mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
> > +		return -ERESTARTSYS;
> +
> > +	for (i = 0; i < MBOX_NUM_DATA_REGS; i++)
> > +		if (__put_user(mbox_inb(mbox, MBOX_DATA_0 + (i * 4)), p++))
> > +			return -EFAULT;
> +
> > +	/* MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step */
> > +	mbox_outb(mbox, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
> > +	return p - buf;
> +}

Not a huge deal, but concurrent reads by 2 processes are doing
to do weird stuff. Ideally you also want to support the
O_NONBLOCK case in case the user daemon want to "poll":

	if (file->f_flags & O_NONBLOCK) {
		if (!(mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV)))
			return -EAGAIN;
	} else if (wait_event....)


> +static ssize_t mbox_write(struct file *file, const char __user *buf,
> > +				size_t count, loff_t *ppos)
> +{
> > +	struct mbox *mbox = file_mbox(file);
> > +	const char __user *p = buf;
> > +	char c;
> > +	int i;
> +
> > +	if (!access_ok(VERIFY_READ, buf, count))
> > +		return -EFAULT;
> +
> > +	WARN_ON(*ppos);
> +
> > +	for (i = 0; i < MBOX_NUM_DATA_REGS; i++) {
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

Do you want to block til the previous one was consumed ?

> +static long mbox_ioctl(struct file *file, unsigned int cmd,
> > +		unsigned long param)
> +{
> > +	struct aspeed_mbox_atn atn;
> > +	struct mbox *mbox = file_mbox(file);
> > +	void __user *p = (void __user *)param;
> +
> > +	switch (cmd) {
> > +	case ASPEED_MBOX_IOCTL_ATN:
> > +		if (copy_from_user(&atn, p, sizeof(atn)))
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
> > +	struct mbox *mbox = file_mbox(file);
> > +	unsigned int mask = 0;
> +
> > +	poll_wait(file, &mbox->queue, wait);
> +
> > +	if (mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV)
> > +		mask |= POLLIN;
> +
> > +	return mask;
> +}

What about a POLLOUT too in order to know that the write is consumed ?
(MBOX_CTRL_SEND is clear)

> +static int mbox_release(struct inode *inode, struct file *file)
> +{
> > +	atomic_dec(&mbox_open_count);
> > +	return 0;
> +}
> +
> +static const struct file_operations mbox_fops = {
> > > +	.owner		= THIS_MODULE,
> > > +	.open		= mbox_open,
> > > +	.read		= mbox_read,
> > > +	.write		= mbox_write,
> > > +	.release	= mbox_release,
> > > +	.poll		= mbox_poll,
> > > +	.unlocked_ioctl	= mbox_ioctl,
> +};
> +
> +static void poll_timer(unsigned long data)
> +{
> > +	struct mbox *mbox = (void *)data;
> +
> > +	mbox->poll_timer.expires += msecs_to_jiffies(500);
> > +	wake_up(&mbox->queue);
> > +	add_timer(&mbox->poll_timer);
> +}
> +
> +static irqreturn_t mbox_irq(int irq, void *arg)
> +{
> > +	struct mbox *mbox = arg;
> +
> > +	if (!(mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
> > +		return IRQ_NONE;
> +
> > +	/*
> > +	 * Leave the status bit set so that we know the data is for us,
> > +	 * clear it once it has been read.
> > +	 */
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
> > +	struct device *dev = &pdev->dev;
> > +	int rc;
> +
> > +	mbox->irq = irq_of_parse_and_map(dev->of_node, 0);
> > +	if (!mbox->irq)
> > +		return -ENODEV;
> +
> > +	rc = devm_request_irq(dev, mbox->irq, mbox_irq, IRQF_SHARED,
> > +			DEVICE_NAME, mbox);
> > +	if (rc < 0) {
> > +		dev_warn(dev, "Unable to request IRQ %d\n", mbox->irq);
> > +		mbox->irq = 0;
> > +		return rc;
> > +	}
> +
> > +	/*
> > +	 * Disable all register based interrupts, we'll have to change
> > +	 * this, protocol seemingly will require regs 0 and 15
> > +	 */
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
> > +	dev = &pdev->dev;
> > +	dev_info(dev, "Found mbox host device\n");
> +
> > +	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> > +	if (!mbox)
> > +		return -ENOMEM;
> +
> > +	dev_set_drvdata(&pdev->dev, mbox);
> +
> > +	rc = of_property_read_u32(dev->of_node, "reg", &mbox->base);
> > +	if (rc) {
> > +		dev_err(dev, "Couldn't read reg device-tree property\n");
> > +		goto out;
> > +	}
> +
> > +	mbox->regmap = syscon_node_to_regmap(
> > +			pdev->dev.parent->of_node);
> > +	if (IS_ERR(mbox->regmap)) {
> > +		dev_err(dev, "Couldn't get regmap\n");
> > +		rc = -ENODEV;
> > +		goto out;
> > +	}
> +
> > +	init_waitqueue_head(&mbox->queue);
> +
> > +	mbox->miscdev.minor = MISC_DYNAMIC_MINOR;
> > +	mbox->miscdev.name = DEVICE_NAME;
> > +	mbox->miscdev.fops = &mbox_fops;
> > +	mbox->miscdev.parent = dev;
> > +	rc = misc_register(&mbox->miscdev);
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
> > +		mbox->poll_timer.expires = jiffies + msecs_to_jiffies(10);
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
> > +	struct mbox *mbox = dev_get_drvdata(&pdev->dev);
> +
> > +	misc_deregister(&mbox->miscdev);
> > +	if (!mbox->irq)
> > +		del_timer_sync(&mbox->poll_timer);
> > +	mbox = NULL;
> +
> > +	return 0;
> +}
> +
> +static const struct of_device_id mbox_match[] = {
> > +	{ .compatible = "aspeed,ast2400-mbox" },
> > +	{ },
> +};
> +
> +static struct platform_driver mbox_driver = {
> > +	.driver = {
> > > +		.name		= DEVICE_NAME,
> > +		.of_match_table = mbox_match,
> > +	},
> > +	.probe = mbox_probe,
> > +	.remove = mbox_remove,
> +};
> +
> +module_platform_driver(mbox_driver);
> +
> +MODULE_DEVICE_TABLE(of, mbox_match);
> +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> +MODULE_DESCRIPTION("Linux device interface to the Aspeed MBOX registers");
> diff --git a/include/uapi/linux/aspeed-mbox.h b/include/uapi/linux/aspeed-mbox.h
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
> > +#define ASPEED_MBOX_IOCTL_ATN	_IOW(__ASPEED_MBOX_IOCTL_MAGIC, 0x00, struct aspeed_mbox_atn)
> +
> +#endif /* _UAPI_LINUX_MBOX_HOST_H */
