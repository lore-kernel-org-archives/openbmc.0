Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tZh431ZvLzDw7h
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:47 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uB95enqL002251
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 00:43:44 -0500
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0a-001b2d01.pphosted.com with ESMTP id 277gu65aay-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Dec 2016 00:43:44 -0500
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Fri, 9 Dec 2016 15:43:41 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 9 Dec 2016 15:43:38 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 9D15F3578053
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:37 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uB95hbK7000456
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:37 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uB95hbkR017456
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:37 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uB95haLE017436
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:36 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 76EE3A032F
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:36 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/3] drivers/misc: Add aspeed mbox driver
Date: Fri,  9 Dec 2016 16:43:22 +1100
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161209054323.7320-1-cyrilbur@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120905-0008-0000-0000-000000EF489C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120905-0009-0000-0000-000008AB1B12
Message-Id: <20161209054323.7320-3-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-09_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=4
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1612090079
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
X-List-Received-Date: Fri, 09 Dec 2016 05:43:47 -0000

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/misc/Kconfig           |   7 +
 drivers/misc/Makefile          |   2 +
 drivers/misc/mbox-host.c       | 326 +++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/mbox-host.h |  18 +++
 4 files changed, 353 insertions(+)
 create mode 100644 drivers/misc/mbox-host.c
 create mode 100644 include/uapi/linux/mbox-host.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index a216b46..44f191d 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -804,6 +804,13 @@ config PANEL_BOOT_MESSAGE
 	  An empty message will only clear the display at driver init time. Any other
 	  printf()-formatted message is valid with newline and escape codes.
 
+config MBOX_HOST
+	depends on ARCH_ASPEED
+	bool "Build MBOX driver for BMC to HOST communication"
+	default "n"
+	---help---
+	  Build the MBOX driver
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index b2fb6dbf..7bcaf30 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -57,3 +57,5 @@ obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
+obj-$(CONFIG_MBOX_HOST)		+= mbox-host.o
+>>>>>>> 6252f95... fixup! drivers/misc: Add aspeed mbox driver
diff --git a/drivers/misc/mbox-host.c b/drivers/misc/mbox-host.c
new file mode 100644
index 0000000..9d11da4
--- /dev/null
+++ b/drivers/misc/mbox-host.c
@@ -0,0 +1,326 @@
+/*
+ * Copyright 2016 IBM Corporation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/errno.h>
+#include <linux/poll.h>
+#include <linux/sched.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/miscdevice.h>
+#include <linux/timer.h>
+#include <linux/jiffies.h>
+#include <linux/mbox-host.h>
+
+#define DEVICE_NAME	"mbox-host"
+
+#define MBOX_NUM_REGS 16
+#define MBOX_NUM_DATA_REGS 14
+
+#define MBOX_DATA_0 0x00
+#define MBOX_STATUS_0 0x40
+#define MBOX_STATUS_1 0x44
+#define MBOX_BMC_CTRL 0x48
+	#define MBOX_CTRL_RECV 0x80
+	#define MBOX_CTRL_MASK 0x02
+	#define MBOX_CTRL_SEND 0x01
+#define MBOX_HOST_CTRL 0x4c
+#define MBOX_INTERRUPT_0 0x50
+#define MBOX_INTERRUPT_1 0x54
+
+struct mbox_host {
+	struct miscdevice	miscdev;
+	void __iomem		*base;
+	int			irq;
+	wait_queue_head_t	queue;
+	struct timer_list	poll_timer;
+};
+
+static u8 mbox_inb(struct mbox_host *mbox_host, int reg)
+{
+	return ioread8(mbox_host->base + reg);
+}
+
+static void mbox_outb(struct mbox_host *mbox_host, u8 data, int reg)
+{
+	iowrite8(data, mbox_host->base + reg);
+}
+
+static struct mbox_host *file_mbox_host(struct file *file)
+{
+	return container_of(file->private_data, struct mbox_host, miscdev);
+}
+
+static int mbox_host_open(struct inode *inode, struct file *file)
+{
+	return 0;
+}
+
+static ssize_t mbox_host_read(struct file *file, char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	struct mbox_host *mbox_host = file_mbox_host(file);
+	char __user *p = buf;
+	int i;
+
+	if (!access_ok(VERIFY_WRITE, buf, count))
+		return -EFAULT;
+
+	WARN_ON(*ppos);
+
+	if (wait_event_interruptible(mbox_host->queue,
+		mbox_inb(mbox_host, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
+		return -ERESTARTSYS;
+
+	for (i = 0; i < MBOX_NUM_DATA_REGS; i++)
+		if (__put_user(mbox_inb(mbox_host, MBOX_DATA_0 + (i * 4)), p++))
+			return -EFAULT;
+
+	/* MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step */
+	mbox_outb(mbox_host, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
+	return p - buf;
+}
+
+static ssize_t mbox_host_write(struct file *file, const char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	struct mbox_host *mbox_host = file_mbox_host(file);
+	const char __user *p = buf;
+	char c;
+	int i;
+
+	if (!access_ok(VERIFY_READ, buf, count))
+		return -EFAULT;
+
+	WARN_ON(*ppos);
+
+	for (i = 0; i < MBOX_NUM_DATA_REGS; i++) {
+		if (__get_user(c, p))
+			return -EFAULT;
+
+		mbox_outb(mbox_host, c, MBOX_DATA_0 + (i * 4));
+		p++;
+	}
+
+	mbox_outb(mbox_host, MBOX_CTRL_SEND, MBOX_BMC_CTRL);
+
+	return p - buf;
+}
+
+static long mbox_host_ioctl(struct file *file, unsigned int cmd,
+		unsigned long param)
+{
+	struct mbox_host *mbox_host = file_mbox_host(file);
+
+	switch (cmd) {
+	case MBOX_HOST_IOCTL_ATN:
+		mbox_outb(mbox_host, param, MBOX_DATA_0 + 15);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int mbox_host_release(struct inode *inode, struct file *file)
+{
+	return 0;
+}
+
+static unsigned int mbox_host_poll(struct file *file, poll_table *wait)
+{
+	struct mbox_host *mbox_host = file_mbox_host(file);
+	unsigned int mask = 0;
+
+	poll_wait(file, &mbox_host->queue, wait);
+
+	if (mbox_inb(mbox_host, MBOX_BMC_CTRL) & MBOX_CTRL_RECV)
+		mask |= POLLIN;
+
+	return mask;
+}
+
+static const struct file_operations mbox_host_fops = {
+	.owner		= THIS_MODULE,
+	.open		= mbox_host_open,
+	.read		= mbox_host_read,
+	.write		= mbox_host_write,
+	.release	= mbox_host_release,
+	.poll		= mbox_host_poll,
+	.unlocked_ioctl	= mbox_host_ioctl,
+};
+
+static void poll_timer(unsigned long data)
+{
+	struct mbox_host *mbox_host = (void *)data;
+
+	mbox_host->poll_timer.expires += msecs_to_jiffies(500);
+	wake_up(&mbox_host->queue);
+	add_timer(&mbox_host->poll_timer);
+}
+
+static irqreturn_t mbox_host_irq(int irq, void *arg)
+{
+	struct mbox_host *mbox_host = arg;
+
+	if (!(mbox_inb(mbox_host, MBOX_BMC_CTRL) & MBOX_CTRL_RECV))
+		return IRQ_NONE;
+
+	/*
+	 * Leave the status bit set so that we know the data is for us,
+	 * clear it once it has been read.
+	 */
+
+	/* Mask it off, we'll clear it when we the data gets read */
+	mbox_outb(mbox_host, MBOX_CTRL_MASK, MBOX_BMC_CTRL);
+
+	wake_up(&mbox_host->queue);
+	return IRQ_HANDLED;
+}
+
+static int mbox_host_config_irq(struct mbox_host *mbox_host,
+		struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int rc;
+
+	mbox_host->irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (!mbox_host->irq)
+		return -ENODEV;
+
+	rc = devm_request_irq(dev, mbox_host->irq, mbox_host_irq, IRQF_SHARED,
+			DEVICE_NAME, mbox_host);
+	if (rc < 0) {
+		dev_warn(dev, "Unable to request IRQ %d\n", mbox_host->irq);
+		mbox_host->irq = 0;
+		return rc;
+	}
+
+	/*
+	 * Disable all register based interrupts, we'll have to change
+	 * this, protocol seemingly will require regs 0 and 15
+	 */
+	mbox_outb(mbox_host, 0x00, MBOX_INTERRUPT_0); /* regs 0 - 7 */
+	mbox_outb(mbox_host, 0x00, MBOX_INTERRUPT_1); /* regs 8 - 15 */
+
+	/* W1C */
+	mbox_outb(mbox_host, 0xff, MBOX_STATUS_0);
+	mbox_outb(mbox_host, 0xff, MBOX_STATUS_1);
+
+	mbox_outb(mbox_host, MBOX_CTRL_RECV, MBOX_BMC_CTRL);
+	return 0;
+}
+
+static int mbox_host_probe(struct platform_device *pdev)
+{
+	struct mbox_host *mbox_host;
+	struct device *dev;
+	struct resource *res;
+	int rc;
+
+	if (!pdev || !pdev->dev.of_node)
+		return -ENODEV;
+
+	dev = &pdev->dev;
+	dev_info(dev, "Found mbox host device\n");
+
+	mbox_host = devm_kzalloc(dev, sizeof(*mbox_host), GFP_KERNEL);
+	if (!mbox_host)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, mbox_host);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "Unable to find resources\n");
+		rc = -ENXIO;
+		goto out_free;
+	}
+
+	mbox_host->base = devm_ioremap_resource(&pdev->dev, res);
+	if (!mbox_host->base) {
+		rc = -ENOMEM;
+		goto out_free;
+	}
+	init_waitqueue_head(&mbox_host->queue);
+
+	mbox_host->miscdev.minor = MISC_DYNAMIC_MINOR;
+	mbox_host->miscdev.name = DEVICE_NAME;
+	mbox_host->miscdev.fops = &mbox_host_fops;
+	mbox_host->miscdev.parent = dev;
+	rc = misc_register(&mbox_host->miscdev);
+	if (rc) {
+		dev_err(dev, "Unable to register device\n");
+		goto out_unmap;
+	}
+
+	mbox_host_config_irq(mbox_host, pdev);
+
+	if (mbox_host->irq) {
+		dev_info(dev, "Using IRQ %d\n", mbox_host->irq);
+	} else {
+		dev_info(dev, "No IRQ; using timer\n");
+		setup_timer(&mbox_host->poll_timer, poll_timer,
+				(unsigned long)mbox_host);
+		mbox_host->poll_timer.expires = jiffies + msecs_to_jiffies(10);
+		add_timer(&mbox_host->poll_timer);
+	}
+	return 0;
+
+out_unmap:
+	devm_iounmap(&pdev->dev, mbox_host->base);
+
+out_free:
+	devm_kfree(dev, mbox_host);
+	return rc;
+
+}
+
+static int mbox_host_remove(struct platform_device *pdev)
+{
+	struct mbox_host *mbox_host = dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&mbox_host->miscdev);
+	if (!mbox_host->irq)
+		del_timer_sync(&mbox_host->poll_timer);
+	devm_iounmap(&pdev->dev, mbox_host->base);
+	devm_kfree(&pdev->dev, mbox_host);
+	mbox_host = NULL;
+
+	return 0;
+}
+
+static const struct of_device_id mbox_host_match[] = {
+	{ .compatible = "aspeed,mbox-host" },
+	{ },
+};
+
+static struct platform_driver mbox_host_driver = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table = mbox_host_match,
+	},
+	.probe = mbox_host_probe,
+	.remove = mbox_host_remove,
+};
+
+module_platform_driver(mbox_host_driver);
+
+MODULE_DEVICE_TABLE(of, mbox_host_match);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
+MODULE_DESCRIPTION("Linux device interface to the MBOX interface");
diff --git a/include/uapi/linux/mbox-host.h b/include/uapi/linux/mbox-host.h
new file mode 100644
index 0000000..3888f43
--- /dev/null
+++ b/include/uapi/linux/mbox-host.h
@@ -0,0 +1,18 @@
+/*
+ * Copyright 2016 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#ifndef _UAPI_LINUX_MBOX_HOST_H
+#define _UAPI_LINUX_MBOX_HOST_H
+
+#include <linux/ioctl.h>
+
+#define __MBOX_HOST_IOCTL_MAGIC	0xb1
+#define MBOX_HOST_IOCTL_ATN	_IOW(__MBOX_HOST_IOCTL_MAGIC, 0x00, uint8_t)
+
+#endif /* _UAPI_LINUX_MBOX_HOST_H */
-- 
2.10.2
