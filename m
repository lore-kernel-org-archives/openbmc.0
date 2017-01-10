Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyR4t0Jb0zDqHn
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:57 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0A942GH054970
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 04:07:56 -0500
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27vvbxrtj3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 04:07:56 -0500
Received: from localhost
 by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Tue, 10 Jan 2017 19:07:53 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 10 Jan 2017 19:07:50 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 5C0EE3578053
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:50 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0A97oQ130605340
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:50 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0A97oiO024086
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:50 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0A97n0N024083
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:49 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 89958A039C
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 20:07:49 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v3 5/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox driver
Date: Tue, 10 Jan 2017 20:06:40 +1100
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170110090640.12608-1-cyrilbur@gmail.com>
References: <20170110090640.12608-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011009-0052-0000-0000-00000208140E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011009-0053-0000-0000-00000792E05D
Message-Id: <20170110090640.12608-6-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-10_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701100129
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
X-List-Received-Date: Tue, 10 Jan 2017 09:07:58 -0000

This provides access to the mbox registers on the ast2400 and ast2500
boards.

This driver allows arbitrary reads and writes to the 16 data registers as
the other end may have configured the mbox hardware to provide an
interrupt when a specific register gets written to.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/mailbox/Kconfig       |   9 ++
 drivers/mailbox/Makefile      |   3 +
 drivers/mailbox/aspeed-mbox.c | 365 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 377 insertions(+)
 create mode 100644 drivers/mailbox/aspeed-mbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 5305923752d2..b9aebe139b9c 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -123,4 +123,13 @@ config XGENE_SLIMPRO_MBOX
 	  It is used to send short messages between ARM64-bit cores and
 	  the SLIMpro Management Engine, primarily for PM. Say Y here if you
 	  want to use the APM X-Gene SLIMpro IPCM support.
+
+config ASPEED_MBOX
+	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
+	bool "Aspeed ast2400/2500 Mailbox Controller"
+	default "y"
+	---help---
+	  Provides a driver for the MBOX registers found on Aspeed SOCs
+	  (AST2400 and AST2500). This driver provides a device for aspeed
+	  mbox registers
 endif
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 0be3e742bb7d..99d17f3b9552 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -25,3 +25,6 @@ obj-$(CONFIG_TI_MESSAGE_MANAGER) += ti-msgmgr.o
 obj-$(CONFIG_XGENE_SLIMPRO_MBOX) += mailbox-xgene-slimpro.o
 
 obj-$(CONFIG_HI6220_MBOX)	+= hi6220-mailbox.o
+
+obj-$(CONFIG_ASPEED_MBOX)		+= aspeed-mbox.o
+
diff --git a/drivers/mailbox/aspeed-mbox.c b/drivers/mailbox/aspeed-mbox.c
new file mode 100644
index 000000000000..6820f73085db
--- /dev/null
+++ b/drivers/mailbox/aspeed-mbox.c
@@ -0,0 +1,365 @@
+/*
+ * Copyright 2016 IBM Corporation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/mfd/syscon.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/regmap.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/timer.h>
+
+#define DEVICE_NAME	"aspeed-mbox"
+
+#define MBOX_NUM_REGS 16
+
+#define MBOX_DATA_0 0x00
+#define MBOX_STATUS_0 0x40
+#define MBOX_STATUS_1 0x44
+#define MBOX_BMC_CTRL 0x48
+#define   MBOX_CTRL_RECV BIT(7)
+#define   MBOX_CTRL_MASK BIT(1)
+#define   MBOX_CTRL_SEND BIT(0)
+#define MBOX_HOST_CTRL 0x4c
+#define MBOX_INTERRUPT_0 0x50
+#define MBOX_INTERRUPT_1 0x54
+
+struct mbox {
+	struct miscdevice	miscdev;
+	struct regmap		*regmap;
+	unsigned int		base;
+	int			irq;
+	wait_queue_head_t	queue;
+	struct timer_list	poll_timer;
+	struct mutex		mutex;
+};
+
+static atomic_t mbox_open_count = ATOMIC_INIT(0);
+
+static u8 mbox_inb(struct mbox *mbox, int reg)
+{
+	/*
+	 * The mbox registers are actually only one byte but are addressed
+	 * four bytes apart. The other three bytes are marked 'reserved',
+	 * they *should* be zero but lets not rely on it.
+	 * I am going to rely on the fact we can casually read/write to them...
+	 */
+	unsigned int val = 0xff; /* If regmap throws an error return 0xff */
+	int rc = regmap_read(mbox->regmap, mbox->base + reg, &val);
+
+	if (rc)
+		dev_err(mbox->miscdev.parent, "regmap_read() failed with "
+				"%d (reg: 0x%08x)\n", rc, reg);
+
+	return val & 0xff;
+}
+
+static void mbox_outb(struct mbox *mbox, u8 data, int reg)
+{
+	int rc = regmap_write(mbox->regmap, mbox->base + reg, data);
+
+	if (rc)
+		dev_err(mbox->miscdev.parent, "regmap_write() failed with "
+				"%d (data: %u reg: 0x%08x)\n", rc, data, reg);
+}
+
+static struct mbox *file_mbox(struct file *file)
+{
+	return container_of(file->private_data, struct mbox, miscdev);
+}
+
+static int mbox_open(struct inode *inode, struct file *file)
+{
+	struct mbox *mbox = file_mbox(file);
+
+	if (atomic_inc_return(&mbox_open_count) == 1) {
+		/*
+		 * Clear the interrupt status bit if it was left on and unmask
+		 * interrupts.
+		 * MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step
+		 */
+		mbox_outb(mbox, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
+		return 0;
+	}
+
+	atomic_dec(&mbox_open_count);
+	return -EBUSY;
+}
+
+static ssize_t mbox_read(struct file *file, char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	struct mbox *mbox = file_mbox(file);
+	char __user *p = buf;
+	ssize_t ret;
+	int i;
+
+	if (!access_ok(VERIFY_WRITE, buf, count))
+		return -EFAULT;
+
+	if (count + *ppos > MBOX_NUM_REGS)
+		return -EINVAL;
+
+	if ((file->f_flags & O_NONBLOCK) &&
+		!(mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
+			return -EAGAIN;
+	else if (wait_event_interruptible(mbox->queue,
+			 mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
+		return -ERESTARTSYS;
+
+	mutex_lock(&mbox->mutex);
+
+	for (i = *ppos; count > 0 && i < MBOX_NUM_REGS; i++, p++, count--) {
+		if (__put_user(mbox_inb(mbox, MBOX_DATA_0 + (i * 4)), p)) {
+			ret = -EFAULT;
+			goto out_unlock;
+		}
+	}
+
+	/* MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step */
+	mbox_outb(mbox, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
+	ret = p - buf;
+
+out_unlock:
+	mutex_unlock(&mbox->mutex);
+	return ret;
+}
+
+static ssize_t mbox_write(struct file *file, const char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	struct mbox *mbox = file_mbox(file);
+	const char __user *p = buf;
+	ssize_t ret;
+	char c;
+	int i;
+
+	if (!access_ok(VERIFY_READ, buf, count))
+		return -EFAULT;
+
+	if (count + *ppos > MBOX_NUM_REGS)
+		return -EINVAL;
+
+	mutex_lock(&mbox->mutex);
+
+	for (i = *ppos; count > 0 && i < MBOX_NUM_REGS; i++) {
+		if (__get_user(c, p)) {
+			ret = -EFAULT;
+			goto out_unlock;
+		}
+
+		mbox_outb(mbox, c, MBOX_DATA_0 + (i * 4));
+		p++;
+		count--;
+	}
+
+	mbox_outb(mbox, MBOX_CTRL_SEND, MBOX_BMC_CTRL);
+	ret = p - buf;
+
+out_unlock:
+	mutex_unlock(&mbox->mutex);
+	return ret;
+}
+
+static unsigned int mbox_poll(struct file *file, poll_table *wait)
+{
+	struct mbox *mbox = file_mbox(file);
+	unsigned int mask = 0;
+
+	poll_wait(file, &mbox->queue, wait);
+
+	if (mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV)
+		mask |= POLLIN;
+
+	return mask;
+}
+
+static int mbox_release(struct inode *inode, struct file *file)
+{
+	atomic_dec(&mbox_open_count);
+	return 0;
+}
+
+static const struct file_operations mbox_fops = {
+	.owner		= THIS_MODULE,
+	.llseek		= no_seek_end_llseek,
+	.read		= mbox_read,
+	.write		= mbox_write,
+	.open		= mbox_open,
+	.release	= mbox_release,
+	.poll		= mbox_poll,
+};
+
+static void poll_timer(unsigned long data)
+{
+	struct mbox *mbox = (void *)data;
+
+	mbox->poll_timer.expires += msecs_to_jiffies(500);
+	wake_up(&mbox->queue);
+	add_timer(&mbox->poll_timer);
+}
+
+static irqreturn_t mbox_irq(int irq, void *arg)
+{
+	struct mbox *mbox = arg;
+
+	if (!(mbox_inb(mbox, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
+		return IRQ_NONE;
+
+	/*
+	 * Leave the status bit set so that we know the data is for us,
+	 * clear it once it has been read.
+	 */
+
+	/* Mask it off, we'll clear it when we the data gets read */
+	mbox_outb(mbox, MBOX_CTRL_MASK, MBOX_BMC_CTRL);
+
+	wake_up(&mbox->queue);
+	return IRQ_HANDLED;
+}
+
+static int mbox_config_irq(struct mbox *mbox,
+		struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int rc;
+
+	mbox->irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (!mbox->irq)
+		return -ENODEV;
+
+	rc = devm_request_irq(dev, mbox->irq, mbox_irq, IRQF_SHARED,
+			DEVICE_NAME, mbox);
+	if (rc < 0) {
+		dev_warn(dev, "Unable to request IRQ %d\n", mbox->irq);
+		mbox->irq = 0;
+		return rc;
+	}
+
+	/*
+	 * Disable all register based interrupts.
+	 */
+	mbox_outb(mbox, 0x00, MBOX_INTERRUPT_0); /* regs 0 - 7 */
+	mbox_outb(mbox, 0x00, MBOX_INTERRUPT_1); /* regs 8 - 15 */
+
+	/* W1C */
+	mbox_outb(mbox, 0xff, MBOX_STATUS_0);
+	mbox_outb(mbox, 0xff, MBOX_STATUS_1);
+
+	mbox_outb(mbox, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
+	return 0;
+}
+
+static int mbox_probe(struct platform_device *pdev)
+{
+	struct mbox *mbox;
+	struct device *dev;
+	int rc;
+
+	if (!pdev || !pdev->dev.of_node)
+		return -ENODEV;
+
+	dev = &pdev->dev;
+	dev_info(dev, "Found mbox host device\n");
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, mbox);
+
+	rc = of_property_read_u32(dev->of_node, "reg", &mbox->base);
+	if (rc) {
+		dev_err(dev, "Couldn't read reg device-tree property\n");
+		goto out;
+	}
+
+	mbox->regmap = syscon_node_to_regmap(
+			pdev->dev.parent->of_node);
+	if (IS_ERR(mbox->regmap)) {
+		dev_err(dev, "Couldn't get regmap\n");
+		rc = -ENODEV;
+		goto out;
+	}
+
+	mutex_init(&mbox->mutex);
+	init_waitqueue_head(&mbox->queue);
+
+	mbox->miscdev.minor = MISC_DYNAMIC_MINOR;
+	mbox->miscdev.name = DEVICE_NAME;
+	mbox->miscdev.fops = &mbox_fops;
+	mbox->miscdev.parent = dev;
+	rc = misc_register(&mbox->miscdev);
+	if (rc) {
+		dev_err(dev, "Unable to register device\n");
+		goto out;
+	}
+
+	mbox_config_irq(mbox, pdev);
+
+	if (mbox->irq) {
+		dev_info(dev, "Using IRQ %d\n", mbox->irq);
+	} else {
+		dev_info(dev, "No IRQ; using timer\n");
+		setup_timer(&mbox->poll_timer, poll_timer,
+				(unsigned long)mbox);
+		mbox->poll_timer.expires = jiffies + msecs_to_jiffies(10);
+		add_timer(&mbox->poll_timer);
+	}
+
+out:
+	return rc;
+
+}
+
+static int mbox_remove(struct platform_device *pdev)
+{
+	struct mbox *mbox = dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&mbox->miscdev);
+	if (!mbox->irq)
+		del_timer_sync(&mbox->poll_timer);
+	mbox = NULL;
+
+	return 0;
+}
+
+static const struct of_device_id mbox_match[] = {
+	{ .compatible = "aspeed,ast2400-mbox" },
+	{ },
+};
+
+static struct platform_driver mbox_driver = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table = mbox_match,
+	},
+	.probe = mbox_probe,
+	.remove = mbox_remove,
+};
+
+module_platform_driver(mbox_driver);
+
+MODULE_DEVICE_TABLE(of, mbox_match);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
+MODULE_DESCRIPTION("Linux device interface to the Aspeed MBOX registers");
-- 
2.11.0
