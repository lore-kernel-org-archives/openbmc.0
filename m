Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dYfV5Tm6zDqVL
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 00:07:29 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x0ECbJME018999;
 Mon, 14 Jan 2019 14:37:19 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 49B8862DA4; Mon, 14 Jan 2019 15:07:17 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 09/15] misc: mbox: add npcm7xx pci mailbox driver
Date: Mon, 14 Jan 2019 15:07:04 +0200
Message-Id: <20190114130710.427600-10-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190114130710.427600-1-tmaimon77@gmail.com>
References: <20190114130710.427600-1-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2019 13:07:32 -0000

Add Nuvoton BMC NPCM7XX PCI Mailbox driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/misc/Kconfig            |   7 +
 drivers/misc/Makefile           |   1 +
 drivers/misc/npcm7xx-pci-mbox.c | 288 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 296 insertions(+)
 create mode 100644 drivers/misc/npcm7xx-pci-mbox.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index c0cbd68238cf..00d1c547ece7 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -528,6 +528,13 @@ config NPCM7XX_LPC_BPC
 	  interface which allows the BMC to monitoring and save
 	  the data written by the host to an arbitrary LPC I/O port.
 
+config NPCM7XX_PCI_MBOX
+	tristate "NPCM7xx PCI Mailbox Controller"
+	depends on (ARCH_NPCM7XX || COMPILE_TEST) && REGMAP && MFD_SYSCON
+	help
+	  Expose the NPCM750/730/715/705 PCI MBOX registers found on
+	  Nuvoton SOCs to userspace.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 2dc74726e3b0..768278b059c3 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -60,3 +60,4 @@ obj-$(CONFIG_PCI_ENDPOINT_TEST)	+= pci_endpoint_test.o
 obj-$(CONFIG_OCXL)		+= ocxl/
 obj-$(CONFIG_MISC_RTSX)		+= cardreader/
 obj-$(CONFIG_NPCM7XX_LPC_BPC)	+= npcm7xx-lpc-bpc.o
+obj-$(CONFIG_NPCM7XX_PCI_MBOX)	+= npcm7xx-pci-mbox.o
diff --git a/drivers/misc/npcm7xx-pci-mbox.c b/drivers/misc/npcm7xx-pci-mbox.c
new file mode 100644
index 000000000000..df7f18fef1e4
--- /dev/null
+++ b/drivers/misc/npcm7xx-pci-mbox.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2014-2018 Nuvoton Technology corporation.
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
+#define DEVICE_NAME	"npcm7xx-pci-mbox"
+
+#define NPCM7XX_MBOX_BMBXSTAT	0x0
+#define NPCM7XX_MBOX_BMBXCTL	0x4
+#define NPCM7XX_MBOX_BMBXCMD	0x8
+
+#define NPCM7XX_MBOX_CIF_0	BIT(0)
+#define NPCM7XX_MBOX_CIE_0	BIT(0)
+#define NPCM7XX_MBOX_HIF_0	BIT(0)
+
+#define NPCM7XX_MBOX_ALL_CIF	GENMASK(7, 0)
+#define NPCM7XX_MBOX_ALL_CIE	GENMASK(7, 0)
+#define NPCM7XX_MBOX_ALL_HIF	GENMASK(7, 0)
+
+struct npcm7xx_mbox {
+	struct miscdevice	miscdev;
+	struct regmap		*regmap;
+	void __iomem		*memory;
+	wait_queue_head_t	queue;
+	spinlock_t		lock;	/* mbox access mutex */
+	bool			cif0;
+	u32			max_buf_size;
+};
+
+static atomic_t npcm7xx_mbox_open_count = ATOMIC_INIT(0);
+
+static struct npcm7xx_mbox *file_mbox(struct file *file)
+{
+	return container_of(file->private_data, struct npcm7xx_mbox, miscdev);
+}
+
+static int npcm7xx_mbox_open(struct inode *inode, struct file *file)
+{
+	struct npcm7xx_mbox *mbox = file_mbox(file);
+
+	if (atomic_inc_return(&npcm7xx_mbox_open_count) == 1) {
+		/* enable mailbox interrupt */
+		regmap_update_bits(mbox->regmap, NPCM7XX_MBOX_BMBXCTL,
+				   NPCM7XX_MBOX_ALL_CIE, NPCM7XX_MBOX_CIE_0);
+		return 0;
+	}
+
+	atomic_dec(&npcm7xx_mbox_open_count);
+	return -EBUSY;
+}
+
+static ssize_t npcm7xx_mbox_read(struct file *file, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct npcm7xx_mbox *mbox = file_mbox(file);
+	unsigned long flags;
+
+	if (!access_ok(VERIFY_WRITE, buf, count))
+		return -EFAULT;
+
+	if ((*ppos + count) > mbox->max_buf_size)
+		return -EINVAL;
+
+	if (file->f_flags & O_NONBLOCK) {
+		if (!mbox->cif0)
+			return -EAGAIN;
+	} else if (wait_event_interruptible(mbox->queue, mbox->cif0)) {
+		return -ERESTARTSYS;
+	}
+
+	spin_lock_irqsave(&mbox->lock, flags);
+
+	if (copy_to_user((void __user *)buf,
+			 (const void *)(mbox->memory + *ppos), count)) {
+		spin_unlock_irqrestore(&mbox->lock, flags);
+		return -EFAULT;
+	}
+
+	mbox->cif0 = false;
+	spin_unlock_irqrestore(&mbox->lock, flags);
+	return count;
+}
+
+static ssize_t npcm7xx_mbox_write(struct file *file, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct npcm7xx_mbox *mbox = file_mbox(file);
+	unsigned long flags;
+
+	if (!access_ok(VERIFY_READ, buf, count))
+		return -EFAULT;
+
+	if ((*ppos + count) > mbox->max_buf_size)
+		return -EINVAL;
+
+	spin_lock_irqsave(&mbox->lock, flags);
+
+	if (copy_from_user((void *)(mbox->memory + *ppos),
+			   (void __user *)buf, count)) {
+		spin_unlock_irqrestore(&mbox->lock, flags);
+		return -EFAULT;
+	}
+
+	regmap_update_bits(mbox->regmap, NPCM7XX_MBOX_BMBXCMD,
+			   NPCM7XX_MBOX_ALL_HIF, NPCM7XX_MBOX_HIF_0);
+
+	spin_unlock_irqrestore(&mbox->lock, flags);
+	return count;
+}
+
+static unsigned int npcm7xx_mbox_poll(struct file *file, poll_table *wait)
+{
+	struct npcm7xx_mbox *mbox = file_mbox(file);
+	unsigned int mask = 0;
+
+	poll_wait(file, &mbox->queue, wait);
+	if (mbox->cif0)
+		mask |= POLLIN;
+
+	return mask;
+}
+
+static int npcm7xx_mbox_release(struct inode *inode, struct file *file)
+{
+	atomic_dec(&npcm7xx_mbox_open_count);
+	return 0;
+}
+
+static const struct file_operations npcm7xx_mbox_fops = {
+	.owner		= THIS_MODULE,
+	.llseek		= no_seek_end_llseek,
+	.read		= npcm7xx_mbox_read,
+	.write		= npcm7xx_mbox_write,
+	.open		= npcm7xx_mbox_open,
+	.release	= npcm7xx_mbox_release,
+	.poll		= npcm7xx_mbox_poll,
+};
+
+static irqreturn_t npcm7xx_mbox_irq(int irq, void *arg)
+{
+	struct npcm7xx_mbox *mbox = arg;
+	u32 val;
+
+	regmap_read(mbox->regmap, NPCM7XX_MBOX_BMBXSTAT, &val);
+	if ((val & NPCM7XX_MBOX_CIF_0) != NPCM7XX_MBOX_CIF_0)
+		return IRQ_NONE;
+
+	/*
+	 * Leave the status bit set so that we know the data is for us,
+	 * clear it once it has been read.
+	 */
+	mbox->cif0 = true;
+
+	/* Mask it off, we'll clear it when we the data gets read */
+	regmap_write_bits(mbox->regmap, NPCM7XX_MBOX_BMBXSTAT,
+			  NPCM7XX_MBOX_ALL_CIF, NPCM7XX_MBOX_CIF_0);
+
+	wake_up(&mbox->queue);
+
+	return IRQ_HANDLED;
+}
+
+static int npcm7xx_mbox_config_irq(struct npcm7xx_mbox *mbox,
+				   struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int rc, irq;
+	u32 val;
+
+	/* Disable all register based interrupts */
+	regmap_update_bits(mbox->regmap, NPCM7XX_MBOX_BMBXCTL,
+			   NPCM7XX_MBOX_ALL_CIE, 0);
+/*
+ * These registers are write one to clear. Clear them.
+ * Per spec, cleared bits should not be re-cleared.
+ * Need to read and clear needed bits only, instead of blindly clearing all.
+ */
+	regmap_read(mbox->regmap, NPCM7XX_MBOX_BMBXSTAT, &val);
+	val &= NPCM7XX_MBOX_ALL_CIF;
+
+	/* If any bit is set, write back to clear */
+	if (val)
+		regmap_write_bits(mbox->regmap, NPCM7XX_MBOX_BMBXSTAT,
+				  NPCM7XX_MBOX_ALL_CIF, val);
+
+	irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (!irq)
+		return -ENODEV;
+
+	rc = devm_request_irq(dev, irq, npcm7xx_mbox_irq, 0, DEVICE_NAME, mbox);
+	if (rc < 0) {
+		dev_err(dev, "Unable to request IRQ %d\n", irq);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int npcm7xx_mbox_probe(struct platform_device *pdev)
+{
+	struct npcm7xx_mbox *mbox;
+	struct device *dev;
+	struct resource *res;
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
+	mbox->regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(mbox->regmap)) {
+		dev_err(dev, "Couldn't get regmap\n");
+		return -ENODEV;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	mbox->memory = devm_ioremap_resource(dev, res);
+	if (IS_ERR(mbox->memory))
+		return PTR_ERR(mbox->memory);
+	mbox->max_buf_size = resource_size(res);
+
+	spin_lock_init(&mbox->lock);
+	init_waitqueue_head(&mbox->queue);
+
+	mbox->miscdev.minor = MISC_DYNAMIC_MINOR;
+	mbox->miscdev.name = DEVICE_NAME;
+	mbox->miscdev.fops = &npcm7xx_mbox_fops;
+	mbox->miscdev.parent = dev;
+	mbox->cif0 = false;
+	rc = misc_register(&mbox->miscdev);
+	if (rc) {
+		dev_err(dev, "Unable to register device\n");
+		return rc;
+	}
+
+	rc = npcm7xx_mbox_config_irq(mbox, pdev);
+	if (rc) {
+		dev_err(dev, "Failed to configure IRQ\n");
+		misc_deregister(&mbox->miscdev);
+		return rc;
+	}
+
+	pr_info("NPCM7xx PCI Mailbox probed\n");
+
+	return 0;
+}
+
+static int npcm7xx_mbox_remove(struct platform_device *pdev)
+{
+	struct npcm7xx_mbox *mbox = dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&mbox->miscdev);
+
+	return 0;
+}
+
+static const struct of_device_id npcm7xx_mbox_match[] = {
+	{ .compatible = "nuvoton,npcm750-pci-mbox" },
+	{ },
+};
+
+static struct platform_driver npcm7xx_mbox_driver = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table = npcm7xx_mbox_match,
+	},
+	.probe = npcm7xx_mbox_probe,
+	.remove = npcm7xx_mbox_remove,
+};
+
+module_platform_driver(npcm7xx_mbox_driver);
+
+MODULE_DEVICE_TABLE(of, npcm7xx_mbox_match);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
+MODULE_DESCRIPTION("NPCM7XX mailbox device driver");
-- 
2.14.1
