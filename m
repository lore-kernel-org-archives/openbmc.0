Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tZh432FHwzDw7j
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:47 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uB95eKFO113603
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 00:43:44 -0500
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0b-001b2d01.pphosted.com with ESMTP id 277gu6598g-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Dec 2016 00:43:44 -0500
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Fri, 9 Dec 2016 15:43:41 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 9 Dec 2016 15:43:38 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 1D8643578057
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:37 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uB95hbEa52101296
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:37 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uB95haJX014777
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:36 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uB95ha5b014768
 for <openbmc@lists.ozlabs.org>; Fri, 9 Dec 2016 16:43:36 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 84C95A0330
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 16:43:36 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 3/3] drivers/misc: Add aspeed lpc controlling driver
Date: Fri,  9 Dec 2016 16:43:23 +1100
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161209054323.7320-1-cyrilbur@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120905-0012-0000-0000-000001F53D28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120905-0013-0000-0000-00000699E7AA
Message-Id: <20161209054323.7320-4-cyrilbur@gmail.com>
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

This driver exposes a reserved chunk of BMC ram to userspace as well as
an ioctl interface to control the BMC<->HOST mapping of the LPC bus.
This allows for a communication channel between the BMC and the host

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/misc/Kconfig          |   7 ++
 drivers/misc/Makefile         |   2 +-
 drivers/misc/lpc-ctrl.c       | 251 ++++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/lpc-ctrl.h |  25 +++++
 4 files changed, 284 insertions(+), 1 deletion(-)
 create mode 100644 drivers/misc/lpc-ctrl.c
 create mode 100644 include/uapi/linux/lpc-ctrl.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 44f191d..2bd3f92 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -811,6 +811,13 @@ config MBOX_HOST
 	---help---
 	  Build the MBOX driver
 
+config LPC_CTRL
+	depends on ARCH_ASPEED
+	bool "Build a driver to control the BMC to HOST LPC bus"
+	default "n"
+	---help---
+	  This will also use a BMC ram region defined in the device tree
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 7bcaf30..e8502de 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -58,4 +58,4 @@ obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
 obj-$(CONFIG_MBOX_HOST)		+= mbox-host.o
->>>>>>> 6252f95... fixup! drivers/misc: Add aspeed mbox driver
+obj-$(CONFIG_LPC_CTRL)		+= lpc-ctrl.o
diff --git a/drivers/misc/lpc-ctrl.c b/drivers/misc/lpc-ctrl.c
new file mode 100644
index 0000000..f72f44f
--- /dev/null
+++ b/drivers/misc/lpc-ctrl.c
@@ -0,0 +1,251 @@
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
+#include <linux/timer.h>
+#include <linux/jiffies.h>
+#include <linux/lpc-ctrl.h>
+
+#define DEVICE_NAME	"lpc-ctrl"
+
+#define LPC_HICR7 0x88
+#define LPC_HICR8 0x8c
+
+struct lpc_ctrl {
+	struct miscdevice	miscdev;
+	void __iomem		*ctrl;
+	phys_addr_t			base;
+	resource_size_t		size;
+};
+
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
+	return 0;
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
+		iowrite32(lpc_ctrl->base | (map.hostaddr >> 16),
+				lpc_ctrl->ctrl + LPC_HICR7);
+		iowrite32((~(map.size - 1)) | ((map.size >> 16) - 1),
+				lpc_ctrl->ctrl + LPC_HICR8);
+		return 0;
+	case LPC_CTRL_IOCTL_UNMAP:
+		if (copy_from_user(&map, p, sizeof(map)))
+			return -EFAULT;
+
+		iowrite32((0x3000 << 16) | (0x0e00),
+				lpc_ctrl->ctrl + LPC_HICR7);
+		iowrite32(((~(0x0200 - 1)) << 16) | ((0x0200) - 1),
+				lpc_ctrl->ctrl + LPC_HICR8);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int lpc_ctrl_release(struct inode *inode, struct file *file)
+{
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
+	struct resource *res;
+	struct resource resm;
+	int rc;
+
+	if (!pdev || !pdev->dev.of_node)
+		return -ENODEV;
+
+	dev = &pdev->dev;
+
+	lpc_ctrl = devm_kzalloc(dev, sizeof(*lpc_ctrl), GFP_KERNEL);
+	if (!lpc_ctrl)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, lpc_ctrl);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "Unable to find resources\n");
+		rc = -ENXIO;
+		goto out_free;
+	}
+
+	/* Todo unmap this on fail cases and exit */
+	lpc_ctrl->ctrl = devm_ioremap_resource(&pdev->dev, res);
+	if (!lpc_ctrl->ctrl) {
+		rc = -ENOMEM;
+		goto out_free;
+	}
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
+	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
+	lpc_ctrl->miscdev.name = DEVICE_NAME;
+	lpc_ctrl->miscdev.fops = &lpc_ctrl_fops;
+	lpc_ctrl->miscdev.parent = dev;
+	rc = misc_register(&lpc_ctrl->miscdev);
+	if (rc) {
+		dev_err(dev, "Unable to register device\n");
+		goto out;
+	}
+
+	dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
+			lpc_ctrl->base, lpc_ctrl->size);
+	return 0;
+
+out:
+	devm_iounmap(&pdev->dev, lpc_ctrl->ctrl);
+out_free:
+	devm_kfree(dev, lpc_ctrl);
+	return rc;
+}
+
+static int lpc_ctrl_remove(struct platform_device *pdev)
+{
+	struct lpc_ctrl *lpc_ctrl = dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&lpc_ctrl->miscdev);
+	devm_iounmap(&pdev->dev, lpc_ctrl->ctrl);
+	devm_kfree(&pdev->dev, lpc_ctrl);
+	lpc_ctrl = NULL;
+
+	return 0;
+}
+
+static const struct of_device_id lpc_ctrl_match[] = {
+	{ .compatible = "aspeed,lpc-ctrl" },
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
diff --git a/include/uapi/linux/lpc-ctrl.h b/include/uapi/linux/lpc-ctrl.h
new file mode 100644
index 0000000..c5f1caf
--- /dev/null
+++ b/include/uapi/linux/lpc-ctrl.h
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
2.10.2
