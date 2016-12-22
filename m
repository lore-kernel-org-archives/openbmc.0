Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tkgyt50g4zDwYt
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:07:02 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uBM64Xc1126674
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 01:07:00 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27g1v75s2k-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 01:07:00 -0500
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 22 Dec 2016 16:06:57 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 22 Dec 2016 16:06:56 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 5BDD33578052
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:56 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uBM66uDw48824522
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:56 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uBM66uo1009108
 for <openbmc@lists.ozlabs.org>; Thu, 22 Dec 2016 17:06:56 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uBM66txQ009103; Thu, 22 Dec 2016 17:06:55 +1100
Received: from camb691.ibm.com (unknown [9.81.194.196])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F351AA0277;
 Thu, 22 Dec 2016 17:06:54 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Subject: [PATCH v2 5/5] drivers/misc: Add aspeed ast2400/ast2500 lpc
 controlling driver
Date: Thu, 22 Dec 2016 17:06:10 +1100
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161222060610.29695-1-cyrilbur@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16122206-0044-0000-0000-00000214CEA3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16122206-0045-0000-0000-0000063993CB
Message-Id: <20161222060610.29695-6-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-12-22_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1612220102
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
X-List-Received-Date: Thu, 22 Dec 2016 06:07:03 -0000

This driver exposes a reserved chunk of BMC ram to userspace as well as
an ioctl interface to control the BMC<->HOST mapping of the LPC bus.
This allows for a communication channel between the BMC and the host

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/misc/Kconfig                 |   9 ++
 drivers/misc/Makefile                |   1 +
 drivers/misc/aspeed-lpc-ctrl.c       | 292 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/aspeed-lpc-ctrl.h |  25 +++
 4 files changed, 327 insertions(+)
 create mode 100644 drivers/misc/aspeed-lpc-ctrl.c
 create mode 100644 include/uapi/linux/aspeed-lpc-ctrl.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index a216b4667742..f1e1c043d91c 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -804,6 +804,15 @@ config PANEL_BOOT_MESSAGE
 	  An empty message will only clear the display at driver init time. Any other
 	  printf()-formatted message is valid with newline and escape codes.
 
+config ASPEED_LPC_CTRL
+	depends on ARCH_ASPEED || COMPILE_TEST
+	bool "Build a driver to control the BMC to HOST LPC bus"
+	default "y"
+	---help---
+	  Provides a driver to control BMC to HOST LPC mappings through
+	  ioctl()s, the driver aso provides a read/write interface to a BMC ram
+	  region where host LPC can be buffered.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index b2fb6dbffcef..cdcd1af48971 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -57,3 +57,4 @@ obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
+obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
new file mode 100644
index 000000000000..4698d8fa5a4c
--- /dev/null
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -0,0 +1,292 @@
+/*
+ * Copyright 2016 IBM Corporation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/mm.h>
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
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/miscdevice.h>
+#include <linux/mtd/mtd.h>
+#include <linux/timer.h>
+#include <linux/jiffies.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/aspeed-lpc-ctrl.h>
+
+#define DEVICE_NAME	"aspeed-lpc-ctrl"
+
+#define HICR7 0x8
+#define HICR8 0xc
+
+struct lpc_ctrl {
+	struct miscdevice	miscdev;
+	struct regmap		*regmap;
+	phys_addr_t		base;
+	resource_size_t		size;
+	uint32_t		pnor_size;
+	uint32_t		pnor_base;
+};
+
+static atomic_t lpc_ctrl_open_count = ATOMIC_INIT(0);
+
+static struct lpc_ctrl *file_lpc_ctrl(struct file *file)
+{
+	return container_of(file->private_data, struct lpc_ctrl, miscdev);
+}
+
+static int lpc_ctrl_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
+	unsigned long vsize = vma->vm_end - vma->vm_start;
+
+	if (vma->vm_pgoff + vsize > lpc_ctrl->base + lpc_ctrl->size)
+		return -EINVAL;
+
+	/* Other checks? */
+
+	if (remap_pfn_range(vma, vma->vm_start,
+		(lpc_ctrl->base >> PAGE_SHIFT) + vma->vm_pgoff,
+		vsize, vma->vm_page_prot))
+		return -EAGAIN;
+
+	return 0;
+}
+
+static int lpc_ctrl_open(struct inode *inode, struct file *file)
+{
+	if (atomic_inc_return(&lpc_ctrl_open_count) == 1)
+		return 0;
+
+	atomic_dec(&lpc_ctrl_open_count);
+	return -EBUSY;
+}
+
+static ssize_t lpc_ctrl_read(struct file *file, char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	if (!access_ok(VERIFY_WRITE, buf, count))
+		return -EFAULT;
+
+	WARN_ON(*ppos);
+
+	return -EPERM;
+}
+
+static ssize_t lpc_ctrl_write(struct file *file, const char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	if (!access_ok(VERIFY_READ, buf, count))
+		return -EFAULT;
+
+	WARN_ON(*ppos);
+
+	return -EPERM;
+}
+
+static long lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
+		unsigned long param)
+{
+	long rc;
+	struct lpc_mapping map;
+	struct lpc_ctrl *lpc_ctrl = file_lpc_ctrl(file);
+	void __user *p = (void __user *)param;
+
+	switch (cmd) {
+	case LPC_CTRL_IOCTL_SIZE:
+		return copy_to_user(p, &lpc_ctrl->size,
+			sizeof(lpc_ctrl->size)) ? -EFAULT : 0;
+	case LPC_CTRL_IOCTL_MAP:
+		if (copy_from_user(&map, p, sizeof(map)))
+			return -EFAULT;
+
+
+		/*
+		 * The top half of HICR7 is the MSB of the BMC address of the
+		 * mapping.
+		 * The bottom half of HICR7 is the MSB of the HOST LPC
+		 * firmware space address of the mapping.
+		 *
+		 * The 1 bits in the top of half of HICR8 represent the bits
+		 * (in the requested address) that should be ignored and
+		 * replaced with those from the top half of HICR7.
+		 * The 1 bits in the bottom half of HICR8 represent the bits
+		 * (in the requested address) that should be kept and pass
+		 * into the BMC address space.
+		 */
+
+		regmap_write(lpc_ctrl->regmap, HICR7,
+				(lpc_ctrl->base | (map.hostaddr >> 16)));
+		regmap_write(lpc_ctrl->regmap, HICR8,
+			(~(map.size - 1)) | ((map.size >> 16) - 1));
+		return 0;
+	case LPC_CTRL_IOCTL_UNMAP:
+		/*
+		 * The top nibble in host lpc addresses references which
+		 * firmware space, use space zero hence the & 0x0fff
+		 */
+
+		dev_info(lpc_ctrl->miscdev.parent, "Setting HICR7 to 0x%08x\n",
+			lpc_ctrl->pnor_base | (((-lpc_ctrl->pnor_size) >> 16) & 0x0fff));
+		rc = regmap_write(lpc_ctrl->regmap, HICR7,
+			lpc_ctrl->pnor_base | (((-lpc_ctrl->pnor_size) >> 16) & 0x0fff));
+		if (rc)
+			return rc;
+		dev_info(lpc_ctrl->miscdev.parent, "Setting HICR8 to 0x%08x\n",
+			(~(lpc_ctrl->pnor_size - 1)) | ((lpc_ctrl->pnor_size >> 16) - 1));
+		rc = regmap_write(lpc_ctrl->regmap, HICR8,
+			(~(lpc_ctrl->pnor_size - 1)) | ((lpc_ctrl->pnor_size >> 16) - 1));
+		return rc;
+	}
+
+	return -EINVAL;
+}
+
+static int lpc_ctrl_release(struct inode *inode, struct file *file)
+{
+	atomic_dec(&lpc_ctrl_open_count);
+	return 0;
+}
+
+static const struct file_operations lpc_ctrl_fops = {
+	.owner		= THIS_MODULE,
+	.mmap		= lpc_ctrl_mmap,
+	.open		= lpc_ctrl_open,
+	.read		= lpc_ctrl_read,
+	.write		= lpc_ctrl_write,
+	.release	= lpc_ctrl_release,
+	.unlocked_ioctl	= lpc_ctrl_ioctl,
+};
+
+static int lpc_ctrl_probe(struct platform_device *pdev)
+{
+	struct lpc_ctrl *lpc_ctrl;
+	struct device *dev;
+	struct device_node *node;
+	struct resource resm;
+	struct mtd_info *mtd;
+	int rc;
+
+	if (!pdev || !pdev->dev.of_node)
+		return -ENODEV;
+
+	mtd = get_mtd_device_nm("1e630000.spi:pnor@0");
+	if (IS_ERR(mtd)) {
+		dev_err(&pdev->dev, "Couldn't find pnor\n");
+		return -EPROBE_DEFER;
+	}
+
+	dev = &pdev->dev;
+
+	lpc_ctrl = devm_kzalloc(dev, sizeof(*lpc_ctrl), GFP_KERNEL);
+	if (!lpc_ctrl)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, lpc_ctrl);
+
+	node = of_get_parent(mtd_get_of_node(mtd));
+	if (!node) {
+		dev_err(dev, "Couldn't get MTD parent OF node\n");
+		return -ENODEV;
+	}
+	lpc_ctrl->pnor_size = mtd->size;
+	rc = of_property_read_u32_index(node, "reg", 2,
+			&lpc_ctrl->pnor_base);
+	if (rc)
+		return rc;
+
+	dev_info(dev, "Host PNOR base: 0x%08x size: 0x%08x\n",
+		lpc_ctrl->pnor_base, lpc_ctrl->pnor_size);
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!node) {
+		/*
+		 * Should probaby handle this by allocating 4-64k now and
+		 * using that
+		 */
+		dev_err(dev, "Didn't find reserved memory\n");
+		rc = -EINVAL;
+		goto out;
+	}
+
+	rc = of_address_to_resource(node, 0, &resm);
+	of_node_put(node);
+	if (rc) {
+		dev_err(dev, "Could address to resource\n");
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	lpc_ctrl->size = resource_size(&resm);
+	lpc_ctrl->base = resm.start;
+
+	lpc_ctrl->regmap = syscon_node_to_regmap(
+			pdev->dev.parent->of_node);
+	if (IS_ERR(lpc_ctrl->regmap)) {
+		dev_err(dev, "Couldn't get regmap\n");
+		rc = -ENODEV;
+		goto out;
+	}
+
+	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
+	lpc_ctrl->miscdev.name = DEVICE_NAME;
+	lpc_ctrl->miscdev.fops = &lpc_ctrl_fops;
+	lpc_ctrl->miscdev.parent = dev;
+	rc = misc_register(&lpc_ctrl->miscdev);
+	if (rc)
+		dev_err(dev, "Unable to register device\n");
+	else
+		dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
+			lpc_ctrl->base, lpc_ctrl->size);
+
+out:
+	return rc;
+}
+
+static int lpc_ctrl_remove(struct platform_device *pdev)
+{
+	struct lpc_ctrl *lpc_ctrl = dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&lpc_ctrl->miscdev);
+	lpc_ctrl = NULL;
+
+	return 0;
+}
+
+static const struct of_device_id lpc_ctrl_match[] = {
+	{ .compatible = "aspeed,ast2400-lpc-ctrl" },
+	{ },
+};
+
+static struct platform_driver lpc_ctrl_driver = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table = lpc_ctrl_match,
+	},
+	.probe = lpc_ctrl_probe,
+	.remove = lpc_ctrl_remove,
+};
+
+module_platform_driver(lpc_ctrl_driver);
+
+MODULE_DEVICE_TABLE(of, lpc_ctrl_match);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
+MODULE_DESCRIPTION("Linux device interface to control LPC bus");
diff --git a/include/uapi/linux/aspeed-lpc-ctrl.h b/include/uapi/linux/aspeed-lpc-ctrl.h
new file mode 100644
index 000000000000..c5f1caf827ac
--- /dev/null
+++ b/include/uapi/linux/aspeed-lpc-ctrl.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright 2016 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#ifndef _UAPI_LINUX_LPC_CTRL_H
+#define _UAPI_LINUX_LPC_CTRL_H
+
+#include <linux/ioctl.h>
+
+struct lpc_mapping {
+	uint32_t hostaddr;
+	uint32_t size;
+};
+
+#define __LPC_CTRL_IOCTL_MAGIC	0xb2
+#define LPC_CTRL_IOCTL_SIZE	_IOR(__LPC_CTRL_IOCTL_MAGIC, 0x00, uint32_t)
+#define LPC_CTRL_IOCTL_MAP	_IOW(__LPC_CTRL_IOCTL_MAGIC, 0x01, struct lpc_mapping)
+#define LPC_CTRL_IOCTL_UNMAP	_IO(__LPC_CTRL_IOCTL_MAGIC, 0x02)
+
+#endif /* _UAPI_LINUX_LPC_CTRL_H */
-- 
2.11.0
