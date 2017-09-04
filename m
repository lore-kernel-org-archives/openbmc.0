Return-Path: <cyrilbur@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::242; helo=mail-io0-x242.google.com;
 envelope-from=cyrilbur@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I7DTraek"; 
 dkim-atps=neutral
Received: from mail-io0-x242.google.com (mail-io0-x242.google.com
 [IPv6:2607:f8b0:4001:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xm1Qc18T2zDqRM
 for <openbmc@lists.ozlabs.org>; Mon,  4 Sep 2017 17:17:58 +1000 (AEST)
Received: by mail-io0-x242.google.com with SMTP id n74so3274927ioe.2
 for <openbmc@lists.ozlabs.org>; Mon, 04 Sep 2017 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qEBn/7oRgsuPhcvznPq906kQIL7kiGSo8npAAkc7dlw=;
 b=I7DTraekIazDGrCthphj870JdaLc+hXMe4j7DvNflACmh+KPAhz8yBetqikeO+f3J5
 SxP0GQ9U6vj+fwS3K2gPKf7stTbl+IoB78uyavoVNtE5uTUz2Sixb9wMfYqXSVNpx+ec
 u7ZGRLQwcaKVrdEGJfo5PWuwJDvgbzgo+1LlB64N+G4ZqMxyj1JnO5JXO3b3YxRuk/Ha
 DJohi421GmWxP+ns34axEzwmYHAizhazdtfV8/x+1RwBriYKxGYFJUd4FuRp5BmAHOQA
 jMgcm8G7xwcC5Df9DTPs3kaH+IqcbWFN40bVVR4Lp4DYoHxPQEj6zptA8GuzIIsP215o
 pRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qEBn/7oRgsuPhcvznPq906kQIL7kiGSo8npAAkc7dlw=;
 b=BJz8NKcziUwtovp5q6xTlJOYWQLlUD/SNBmX2GB4yXAqQACFn4Pn4Ts5anGOWTnUBg
 KnDyeXbwfVh6j7AxCEn0iZUzzxdQ87UKdQM7I8Ekpxa5xw4dUFwiEH8/pmckoSx7eDjs
 EOvj1uSv6JA8Hb12qVlkzcsbQXH3OmiBP47fAfFNnP5oTGjbL7y08VBKCQb4tTVzjIDx
 BsH6CTUl8pVLSxohOMxOWeqE8oJdsPBMAJoPAhkxLCpWytHcinrV2jkGxFO8qd3l/Nxe
 F7S0wt5QwNBsivpPKTei4LsntUO7PW1eqJ72kBOomNSb6dsiPN2m75XEBlc37UD9X4n4
 SUoA==
X-Gm-Message-State: AHPjjUjwgDSruT7SDlblqD8EJC803Fd3SA7DupHfyrl1JcsnmCR/rqvP
 zqKWyDqTkX3PWA==
X-Google-Smtp-Source: ADKCNb5GorO2bCfMCFR2xrn1RLo03Fj6o/nNigwroMXl5AxqLakwLxVu4G6NbAt2FcUqY85WIl8nDQ==
X-Received: by 10.107.46.199 with SMTP id u68mr7890367iou.88.1504509475915;
 Mon, 04 Sep 2017 00:17:55 -0700 (PDT)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id 23sm3110052itj.24.2017.09.04.00.17.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Sep 2017 00:17:55 -0700 (PDT)
Message-ID: <1504509469.4080.6.camel@gmail.com>
Subject: Re: [PATCH v2] drivers/mailbox: Add Aspeed mailbox driver
From: Cyril Bur <cyrilbur@gmail.com>
To: jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel.stan@gmail.com>, Greg KH
 <greg@kroah.com>
Date: Mon, 04 Sep 2017 17:17:49 +1000
In-Reply-To: <20170207233623.18737-1-cyrilbur@gmail.com>
References: <20170207233623.18737-1-cyrilbur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 04 Sep 2017 07:18:01 -0000

Hi,

I haven't heard anything about this driver. I'm trying to interpret if
the silence is because there is something fundamentally wrong with the
driver or is it because it doesn't use any of the mailbox
infrastructure it is being ignored.

Either way I'm happy to address the problems - in the event of there
being something wrong, I'm more than happy to take feedback and address
problems. If you would prefer to see it moved somewhere into char/misc,
this is also something I can do. Moving into char/misc is my preferred
option, I had a look at the mailbox infrastructure and it seems a bit
heavyweight for what this ultimately very simple driver is doing.

If you would be so kind as to let me know which direction to take.

Thanks,

Cyril

On Wed, 2017-02-08 at 10:36 +1100, Cyril Bur wrote:
> This provides access to the mbox registers on the ast2400 and ast2500
> SoCs.
> 
> This driver allows arbitrary reads and writes to the 16 data registers as
> the other end may have configured the mbox hardware to provide an
> interrupt when a specific register gets written to.
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> V2:
>    s/ASpeed/Aspeed/
>    Reword Kconfig options
>    Use tristate for config symbol
> 
>  drivers/mailbox/Kconfig       |   8 +
>  drivers/mailbox/Makefile      |   2 +
>  drivers/mailbox/aspeed-mbox.c | 334 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 344 insertions(+)
>  create mode 100644 drivers/mailbox/aspeed-mbox.c
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index ceff415f201c..e24044d5c219 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -152,4 +152,12 @@ config BCM_PDC_MBOX
>  	  Mailbox implementation for the Broadcom PDC ring manager,
>  	  which provides access to various offload engines on Broadcom
>  	  SoCs. Say Y here if you want to use the Broadcom PDC.
> +
> +config ASPEED_LPC_MBOX
> +	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> +	tristate "Aspeed LPC Mailbox Controller"
> +	---help---
> +	  Provides a driver for the MBOX registers found on Aspeed SOCs
> +	  (AST2400 and AST2500). This driver provides a device for aspeed
> +	  mbox registers
>  endif
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 7dde4f609ae8..73165a79b517 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -31,3 +31,5 @@ obj-$(CONFIG_HI6220_MBOX)	+= hi6220-mailbox.o
>  obj-$(CONFIG_BCM_PDC_MBOX)	+= bcm-pdc-mailbox.o
>  
>  obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
> +
> +obj-$(CONFIG_ASPEED_LPC_MBOX)	+= aspeed-mbox.o
> diff --git a/drivers/mailbox/aspeed-mbox.c b/drivers/mailbox/aspeed-mbox.c
> new file mode 100644
> index 000000000000..0f0c711bafee
> --- /dev/null
> +++ b/drivers/mailbox/aspeed-mbox.c
> @@ -0,0 +1,334 @@
> +/*
> + * Copyright 2017 IBM Corporation
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
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
> +#define DEVICE_NAME	"aspeed-mbox"
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
> +	struct miscdevice	miscdev;
> +	struct regmap		*regmap;
> +	unsigned int		base;
> +	wait_queue_head_t	queue;
> +	struct mutex		mutex;
> +};
> +
> +static atomic_t aspeed_mbox_open_count = ATOMIC_INIT(0);
> +
> +static u8 aspeed_mbox_inb(struct aspeed_mbox *mbox, int reg)
> +{
> +	/*
> +	 * The mbox registers are actually only one byte but are addressed
> +	 * four bytes apart. The other three bytes are marked 'reserved',
> +	 * they *should* be zero but lets not rely on it.
> +	 * I am going to rely on the fact we can casually read/write to them...
> +	 */
> +	unsigned int val = 0xff; /* If regmap throws an error return 0xff */
> +	int rc = regmap_read(mbox->regmap, mbox->base + reg, &val);
> +
> +	if (rc)
> +		dev_err(mbox->miscdev.parent, "regmap_read() failed with "
> +				"%d (reg: 0x%08x)\n", rc, reg);
> +
> +	return val & 0xff;
> +}
> +
> +static void aspeed_mbox_outb(struct aspeed_mbox *mbox, u8 data, int reg)
> +{
> +	int rc = regmap_write(mbox->regmap, mbox->base + reg, data);
> +
> +	if (rc)
> +		dev_err(mbox->miscdev.parent, "regmap_write() failed with "
> +				"%d (data: %u reg: 0x%08x)\n", rc, data, reg);
> +}
> +
> +static struct aspeed_mbox *file_mbox(struct file *file)
> +{
> +	return container_of(file->private_data, struct aspeed_mbox, miscdev);
> +}
> +
> +static int aspeed_mbox_open(struct inode *inode, struct file *file)
> +{
> +	struct aspeed_mbox *mbox = file_mbox(file);
> +
> +	if (atomic_inc_return(&aspeed_mbox_open_count) == 1) {
> +		/*
> +		 * Clear the interrupt status bit if it was left on and unmask
> +		 * interrupts.
> +		 * ASPEED_MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step
> +		 */
> +		aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV, ASPEED_MBOX_BMC_CTRL);
> +		return 0;
> +	}
> +
> +	atomic_dec(&aspeed_mbox_open_count);
> +	return -EBUSY;
> +}
> +
> +static ssize_t aspeed_mbox_read(struct file *file, char __user *buf,
> +				size_t count, loff_t *ppos)
> +{
> +	struct aspeed_mbox *mbox = file_mbox(file);
> +	char __user *p = buf;
> +	ssize_t ret;
> +	int i;
> +
> +	if (!access_ok(VERIFY_WRITE, buf, count))
> +		return -EFAULT;
> +
> +	if (count + *ppos > ASPEED_MBOX_NUM_REGS)
> +		return -EINVAL;
> +
> +	if (file->f_flags & O_NONBLOCK) {
> +		if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> +				ASPEED_MBOX_CTRL_RECV))
> +			return -EAGAIN;
> +	} else if (wait_event_interruptible(mbox->queue,
> +				aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> +				ASPEED_MBOX_CTRL_RECV)) {
> +		return -ERESTARTSYS;
> +	}
> +
> +	mutex_lock(&mbox->mutex);
> +
> +	for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
> +		uint8_t reg = aspeed_mbox_inb(mbox, ASPEED_MBOX_DATA_0 + (i * 4));
> +
> +		ret = __put_user(reg, p);
> +		if (ret)
> +			goto out_unlock;
> +
> +		p++;
> +		count--;
> +	}
> +
> +	/* ASPEED_MBOX_CTRL_RECV bit is write to clear, this also unmasks in 1 step */
> +	aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV, ASPEED_MBOX_BMC_CTRL);
> +	ret = p - buf;
> +
> +out_unlock:
> +	mutex_unlock(&mbox->mutex);
> +	return ret;
> +}
> +
> +static ssize_t aspeed_mbox_write(struct file *file, const char __user *buf,
> +				size_t count, loff_t *ppos)
> +{
> +	struct aspeed_mbox *mbox = file_mbox(file);
> +	const char __user *p = buf;
> +	ssize_t ret;
> +	char c;
> +	int i;
> +
> +	if (!access_ok(VERIFY_READ, buf, count))
> +		return -EFAULT;
> +
> +	if (count + *ppos > ASPEED_MBOX_NUM_REGS)
> +		return -EINVAL;
> +
> +	mutex_lock(&mbox->mutex);
> +
> +	for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
> +		ret = __get_user(c, p);
> +		if (ret)
> +			goto out_unlock;
> +
> +		aspeed_mbox_outb(mbox, c, ASPEED_MBOX_DATA_0 + (i * 4));
> +		p++;
> +		count--;
> +	}
> +
> +	aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_SEND, ASPEED_MBOX_BMC_CTRL);
> +	ret = p - buf;
> +
> +out_unlock:
> +	mutex_unlock(&mbox->mutex);
> +	return ret;
> +}
> +
> +static unsigned int aspeed_mbox_poll(struct file *file, poll_table *wait)
> +{
> +	struct aspeed_mbox *mbox = file_mbox(file);
> +	unsigned int mask = 0;
> +
> +	poll_wait(file, &mbox->queue, wait);
> +
> +	if (aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) & ASPEED_MBOX_CTRL_RECV)
> +		mask |= POLLIN;
> +
> +	return mask;
> +}
> +
> +static int aspeed_mbox_release(struct inode *inode, struct file *file)
> +{
> +	atomic_dec(&aspeed_mbox_open_count);
> +	return 0;
> +}
> +
> +static const struct file_operations aspeed_mbox_fops = {
> +	.owner		= THIS_MODULE,
> +	.llseek		= no_seek_end_llseek,
> +	.read		= aspeed_mbox_read,
> +	.write		= aspeed_mbox_write,
> +	.open		= aspeed_mbox_open,
> +	.release	= aspeed_mbox_release,
> +	.poll		= aspeed_mbox_poll,
> +};
> +
> +static irqreturn_t aspeed_mbox_irq(int irq, void *arg)
> +{
> +	struct aspeed_mbox *mbox = arg;
> +
> +	if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) & ASPEED_MBOX_CTRL_RECV))
> +		return IRQ_NONE;
> +
> +	/*
> +	 * Leave the status bit set so that we know the data is for us,
> +	 * clear it once it has been read.
> +	 */
> +
> +	/* Mask it off, we'll clear it when we the data gets read */
> +	aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_MASK, ASPEED_MBOX_BMC_CTRL);
> +
> +	wake_up(&mbox->queue);
> +	return IRQ_HANDLED;
> +}
> +
> +static int aspeed_mbox_config_irq(struct aspeed_mbox *mbox,
> +		struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int rc, irq;
> +
> +	irq = irq_of_parse_and_map(dev->of_node, 0);
> +	if (!irq)
> +		return -ENODEV;
> +
> +	rc = devm_request_irq(dev, irq, aspeed_mbox_irq,
> +			IRQF_SHARED, DEVICE_NAME, mbox);
> +	if (rc < 0) {
> +		dev_err(dev, "Unable to request IRQ %d\n", irq);
> +		return rc;
> +	}
> +
> +	/*
> +	 * Disable all register based interrupts.
> +	 */
> +	aspeed_mbox_outb(mbox, 0x00, ASPEED_MBOX_INTERRUPT_0); /* regs 0 - 7 */
> +	aspeed_mbox_outb(mbox, 0x00, ASPEED_MBOX_INTERRUPT_1); /* regs 8 - 15 */
> +
> +	/* These registers are write one to clear. Clear them. */
> +	aspeed_mbox_outb(mbox, 0xff, ASPEED_MBOX_STATUS_0);
> +	aspeed_mbox_outb(mbox, 0xff, ASPEED_MBOX_STATUS_1);
> +
> +	aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV, ASPEED_MBOX_BMC_CTRL);
> +	return 0;
> +}
> +
> +static int aspeed_mbox_probe(struct platform_device *pdev)
> +{
> +	struct aspeed_mbox *mbox;
> +	struct device *dev;
> +	int rc;
> +
> +	dev = &pdev->dev;
> +
> +	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&pdev->dev, mbox);
> +
> +	rc = of_property_read_u32(dev->of_node, "reg", &mbox->base);
> +	if (rc) {
> +		dev_err(dev, "Couldn't read reg device-tree property\n");
> +		return rc;
> +	}
> +
> +	mbox->regmap = syscon_node_to_regmap(
> +			pdev->dev.parent->of_node);
> +	if (IS_ERR(mbox->regmap)) {
> +		dev_err(dev, "Couldn't get regmap\n");
> +		return -ENODEV;
> +	}
> +
> +	mutex_init(&mbox->mutex);
> +	init_waitqueue_head(&mbox->queue);
> +
> +	mbox->miscdev.minor = MISC_DYNAMIC_MINOR;
> +	mbox->miscdev.name = DEVICE_NAME;
> +	mbox->miscdev.fops = &aspeed_mbox_fops;
> +	mbox->miscdev.parent = dev;
> +	rc = misc_register(&mbox->miscdev);
> +	if (rc) {
> +		dev_err(dev, "Unable to register device\n");
> +		return rc;
> +	}
> +
> +	rc = aspeed_mbox_config_irq(mbox, pdev);
> +	if (rc) {
> +		dev_err(dev, "Failed to configure IRQ\n");
> +		misc_deregister(&mbox->miscdev);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int aspeed_mbox_remove(struct platform_device *pdev)
> +{
> +	struct aspeed_mbox *mbox = dev_get_drvdata(&pdev->dev);
> +
> +	misc_deregister(&mbox->miscdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id aspeed_mbox_match[] = {
> +	{ .compatible = "aspeed,ast2400-mbox" },
> +	{ .compatible = "aspeed,ast2500-mbox" },
> +	{ },
> +};
> +
> +static struct platform_driver aspeed_mbox_driver = {
> +	.driver = {
> +		.name		= DEVICE_NAME,
> +		.of_match_table = aspeed_mbox_match,
> +	},
> +	.probe = aspeed_mbox_probe,
> +	.remove = aspeed_mbox_remove,
> +};
> +
> +module_platform_driver(aspeed_mbox_driver);
> +
> +MODULE_DEVICE_TABLE(of, aspeed_mbox_match);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
> +MODULE_DESCRIPTION("Aspeed mailbox device driver");
