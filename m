Return-Path: <cyrilbur@gmail.com>
Authentication-Results: ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cyrilbur@gmail.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmNHw0WCjzF1Dw
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 14:28:59 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1L3OdFh118403
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 22:28:57 -0500
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2g901gsjrb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 22:28:57 -0500
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Wed, 21 Feb 2018 03:28:55 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 21 Feb 2018 03:28:52 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1L3SqYT49217746
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 03:28:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56E2C4C04E
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 03:22:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0CDE4C040
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 03:22:28 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 03:22:28 +0000 (GMT)
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A835AA0135
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 14:28:49 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/2] drivers/misc: Add Aspeed LPC mbox register driver
Date: Wed, 21 Feb 2018 14:25:54 +1100
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180221032554.9852-1-cyrilbur@gmail.com>
References: <20180221032554.9852-1-cyrilbur@gmail.com>
X-TM-AS-GCONF: 00
x-cbid: 18022103-0016-0000-0000-00000527D93F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022103-0017-0000-0000-00002863EB86
Message-Id: <20180221032554.9852-2-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-20_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802210041
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2018 03:29:00 -0000

This provides access to the LPC mbox registers on the ast2400 and
ast2500 SoCs.

This driver allows arbitrary reads and writes to the 16 mbox data registers
on the Aspeed SoC LPC bus. These Aspeed chips are often used in BMC
systems. This access allows for an inband communication channel with its
host.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/misc/Kconfig           |   8 +
 drivers/misc/Makefile          |   1 +
 drivers/misc/aspeed-lpc-mbox.c | 343 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 352 insertions(+)
 create mode 100644 drivers/misc/aspeed-lpc-mbox.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 03605f8fc0dc..ea1a723d0db3 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -488,6 +488,14 @@ config ASPEED_LPC_SNOOP
 	  allows the BMC to listen on and save the data written by
 	  the host to an arbitrary LPC I/O port.
 
+config ASPEED_LPC_MBOX
+	tristate "Aspeed ast2400/2500 LPC MBOX Controller"
+	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
+	help
+	  Provides a driver for the LPC attached MBOX registers on Aspeed
+	  SoCs (ast2400/2500). This allows for interrupt driven
+	  communication between a HOST and BMC.
+
 config PCI_ENDPOINT_TEST
 	depends on PCI
 	select CRC32
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index c3c8624f4d95..32b1db960f33 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -54,6 +54,7 @@ obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
 obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
+obj-$(CONFIG_ASPEED_LPC_MBOX)	+= aspeed-lpc-mbox.o
 obj-$(CONFIG_PCI_ENDPOINT_TEST)	+= pci_endpoint_test.o
 obj-$(CONFIG_OCXL)		+= ocxl/
 obj-$(CONFIG_MISC_RTSX)		+= cardreader/
diff --git a/drivers/misc/aspeed-lpc-mbox.c b/drivers/misc/aspeed-lpc-mbox.c
new file mode 100644
index 000000000000..c4e468ab3524
--- /dev/null
+++ b/drivers/misc/aspeed-lpc-mbox.c
@@ -0,0 +1,343 @@
+/*
+ * Copyright 2018 IBM Corporation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define DEVICE_NAME	"aspeed-mbox"
+
+#define ASPEED_MBOX_NUM_REGS 16
+
+#define ASPEED_MBOX_DATA_0 0x00
+#define ASPEED_MBOX_STATUS_0 0x40
+#define ASPEED_MBOX_STATUS_1 0x44
+#define ASPEED_MBOX_BMC_CTRL 0x48
+#define   ASPEED_MBOX_CTRL_RECV BIT(7)
+#define   ASPEED_MBOX_CTRL_MASK BIT(1)
+#define   ASPEED_MBOX_CTRL_SEND BIT(0)
+#define ASPEED_MBOX_HOST_CTRL 0x4c
+#define ASPEED_MBOX_INTERRUPT_0 0x50
+#define ASPEED_MBOX_INTERRUPT_1 0x54
+
+struct aspeed_mbox {
+	struct miscdevice	miscdev;
+	struct regmap		*regmap;
+	unsigned int		base;
+	wait_queue_head_t	queue;
+	struct mutex		mutex;
+};
+
+static atomic_t aspeed_mbox_open_count = ATOMIC_INIT(0);
+
+static u8 aspeed_mbox_inb(struct aspeed_mbox *mbox, int reg)
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
+		dev_err(mbox->miscdev.parent,
+			"regmap_read() failed with %d (reg: 0x%08x)\n",
+			rc, reg);
+
+	return val & 0xff;
+}
+
+static void aspeed_mbox_outb(struct aspeed_mbox *mbox, u8 data, int reg)
+{
+	int rc = regmap_write(mbox->regmap, mbox->base + reg, data);
+
+	if (rc)
+		dev_err(mbox->miscdev.parent,
+			"regmap_write() failed with %d (data: %u reg: 0x%08x)\n",
+			rc, data, reg);
+}
+
+static struct aspeed_mbox *file_mbox(struct file *file)
+{
+	return container_of(file->private_data, struct aspeed_mbox, miscdev);
+}
+
+static int aspeed_mbox_open(struct inode *inode, struct file *file)
+{
+	struct aspeed_mbox *mbox = file_mbox(file);
+
+	if (atomic_inc_return(&aspeed_mbox_open_count) == 1) {
+		/*
+		 * Clear the interrupt status bit if it was left on and unmask
+		 * interrupts.
+		 * ASPEED_MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step
+		 */
+		aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV,
+				ASPEED_MBOX_BMC_CTRL);
+		return 0;
+	}
+
+	atomic_dec(&aspeed_mbox_open_count);
+	return -EBUSY;
+}
+
+static ssize_t aspeed_mbox_read(struct file *file, char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	struct aspeed_mbox *mbox = file_mbox(file);
+	char __user *p = buf;
+	ssize_t ret;
+	int i;
+
+	if (!access_ok(VERIFY_WRITE, buf, count))
+		return -EFAULT;
+
+	if (count + *ppos > ASPEED_MBOX_NUM_REGS)
+		return -EINVAL;
+
+	if (file->f_flags & O_NONBLOCK) {
+		if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
+			ASPEED_MBOX_CTRL_RECV))
+			return -EAGAIN;
+	} else if (wait_event_interruptible(mbox->queue,
+			aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
+			ASPEED_MBOX_CTRL_RECV)) {
+		return -ERESTARTSYS;
+	}
+
+	mutex_lock(&mbox->mutex);
+
+	for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
+		uint8_t reg = aspeed_mbox_inb(mbox,
+				ASPEED_MBOX_DATA_0 + (i * 4));
+
+		ret = __put_user(reg, p);
+		if (ret)
+			goto out_unlock;
+
+		p++;
+		count--;
+	}
+
+	/*
+	 * ASPEED_MBOX_CTRL_RECV bit is write to clear
+	 * also unmasks in 1 step
+	 */
+	aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV,
+			ASPEED_MBOX_BMC_CTRL);
+	ret = p - buf;
+
+out_unlock:
+	mutex_unlock(&mbox->mutex);
+	return ret;
+}
+
+static ssize_t aspeed_mbox_write(struct file *file, const char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	struct aspeed_mbox *mbox = file_mbox(file);
+	const char __user *p = buf;
+	ssize_t ret;
+	char c;
+	int i;
+
+	if (!access_ok(VERIFY_READ, buf, count))
+		return -EFAULT;
+
+	if (count + *ppos > ASPEED_MBOX_NUM_REGS)
+		return -EINVAL;
+
+	mutex_lock(&mbox->mutex);
+
+	for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
+		ret = __get_user(c, p);
+		if (ret)
+			goto out_unlock;
+
+		aspeed_mbox_outb(mbox, c, ASPEED_MBOX_DATA_0 + (i * 4));
+		p++;
+		count--;
+	}
+
+	aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_SEND, ASPEED_MBOX_BMC_CTRL);
+	ret = p - buf;
+
+out_unlock:
+	mutex_unlock(&mbox->mutex);
+	return ret;
+}
+
+static unsigned int aspeed_mbox_poll(struct file *file, poll_table *wait)
+{
+	struct aspeed_mbox *mbox = file_mbox(file);
+	unsigned int mask = 0;
+
+	poll_wait(file, &mbox->queue, wait);
+
+	if (aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) & ASPEED_MBOX_CTRL_RECV)
+		mask |= POLLIN;
+
+	return mask;
+}
+
+static int aspeed_mbox_release(struct inode *inode, struct file *file)
+{
+	atomic_dec(&aspeed_mbox_open_count);
+	return 0;
+}
+
+static const struct file_operations aspeed_mbox_fops = {
+	.owner		= THIS_MODULE,
+	.llseek		= no_seek_end_llseek,
+	.read		= aspeed_mbox_read,
+	.write		= aspeed_mbox_write,
+	.open		= aspeed_mbox_open,
+	.release	= aspeed_mbox_release,
+	.poll		= aspeed_mbox_poll,
+};
+
+static irqreturn_t aspeed_mbox_irq(int irq, void *arg)
+{
+	struct aspeed_mbox *mbox = arg;
+
+	if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL)
+				& ASPEED_MBOX_CTRL_RECV))
+		return IRQ_NONE;
+
+	/*
+	 * Leave the status bit set so that we know the data is for us,
+	 * clear it once it has been read.
+	 */
+
+	/* Mask it off, we'll clear it when we the data gets read */
+	aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_MASK, ASPEED_MBOX_BMC_CTRL);
+
+	wake_up(&mbox->queue);
+	return IRQ_HANDLED;
+}
+
+static int aspeed_mbox_config_irq(struct aspeed_mbox *mbox,
+		struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int rc, irq;
+
+	irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (!irq)
+		return -ENODEV;
+
+	rc = devm_request_irq(dev, irq, aspeed_mbox_irq,
+			IRQF_SHARED, DEVICE_NAME, mbox);
+	if (rc < 0) {
+		dev_err(dev, "Unable to request IRQ %d\n", irq);
+		return rc;
+	}
+
+	/*
+	 * Disable all register based interrupts.
+	 */
+	aspeed_mbox_outb(mbox, 0x00, ASPEED_MBOX_INTERRUPT_0); /* regs 0 - 7 */
+	aspeed_mbox_outb(mbox, 0x00, ASPEED_MBOX_INTERRUPT_1); /* regs 8 - 15 */
+
+	/* These registers are write one to clear. Clear them. */
+	aspeed_mbox_outb(mbox, 0xff, ASPEED_MBOX_STATUS_0);
+	aspeed_mbox_outb(mbox, 0xff, ASPEED_MBOX_STATUS_1);
+
+	aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV, ASPEED_MBOX_BMC_CTRL);
+	return 0;
+}
+
+static int aspeed_mbox_probe(struct platform_device *pdev)
+{
+	struct aspeed_mbox *mbox;
+	struct device *dev;
+	int rc;
+
+	dev = &pdev->dev;
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
+		return rc;
+	}
+
+	mbox->regmap = syscon_node_to_regmap(
+			pdev->dev.parent->of_node);
+	if (IS_ERR(mbox->regmap)) {
+		dev_err(dev, "Couldn't get regmap\n");
+		return -ENODEV;
+	}
+
+	mutex_init(&mbox->mutex);
+	init_waitqueue_head(&mbox->queue);
+
+	mbox->miscdev.minor = MISC_DYNAMIC_MINOR;
+	mbox->miscdev.name = DEVICE_NAME;
+	mbox->miscdev.fops = &aspeed_mbox_fops;
+	mbox->miscdev.parent = dev;
+	rc = misc_register(&mbox->miscdev);
+	if (rc) {
+		dev_err(dev, "Unable to register device\n");
+		return rc;
+	}
+
+	rc = aspeed_mbox_config_irq(mbox, pdev);
+	if (rc) {
+		dev_err(dev, "Failed to configure IRQ\n");
+		misc_deregister(&mbox->miscdev);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int aspeed_mbox_remove(struct platform_device *pdev)
+{
+	struct aspeed_mbox *mbox = dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&mbox->miscdev);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_mbox_match[] = {
+	{ .compatible = "aspeed,ast2400-mbox" },
+	{ .compatible = "aspeed,ast2500-mbox" },
+	{ },
+};
+
+static struct platform_driver aspeed_mbox_driver = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table = aspeed_mbox_match,
+	},
+	.probe = aspeed_mbox_probe,
+	.remove = aspeed_mbox_remove,
+};
+
+module_platform_driver(aspeed_mbox_driver);
+
+MODULE_DEVICE_TABLE(of, aspeed_mbox_match);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
+MODULE_DESCRIPTION("Aspeed LPC MBOX reg device driver");
-- 
2.16.2
