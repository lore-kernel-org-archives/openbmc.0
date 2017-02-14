Return-Path: <cyrilbur@gmail.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMszv6sv7zDqJg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 17:32:59 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1E6T2Bs114677
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 01:32:57 -0500
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28kfdtphc1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 01:32:57 -0500
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Tue, 14 Feb 2017 16:32:53 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 14 Feb 2017 16:32:52 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 8559C3578058
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 17:32:51 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1E6Whov25165866
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 17:32:51 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v1E6WIXH010845
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 17:32:19 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v1E6WIPX010129; Tue, 14 Feb 2017 17:32:18 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E0ABBA020E;
 Tue, 14 Feb 2017 17:31:53 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, benh@kernel.crashing.org, mikey@neuling.org, 
 joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v5] drivers/misc: Add Aspeed LPC control driver
Date: Tue, 14 Feb 2017 17:30:00 +1100
X-Mailer: git-send-email 2.11.1
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021406-0048-0000-0000-0000020536F2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021406-0049-0000-0000-0000478729D1
Message-Id: <20170214063000.23692-1-cyrilbur@gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-14_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702140068
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
X-List-Received-Date: Tue, 14 Feb 2017 06:33:00 -0000

In order to manage server systems, there is typically another processor
known as a BMC (Baseboard Management Controller) which is responsible
for powering the server and other various elements, sometimes fans,
often the system flash.

The Aspeed BMC family which is what is used on OpenPOWER machines and a
number of x86 as well is typically connected to the host via an LPC
(Low Pin Count) bus (among others).

The LPC bus is an ISA bus on steroids. It's generally used by the
BMC chip to provide the host with access to the system flash (via MEM/FW
cycles) that contains the BIOS or other host firmware along with a
number of SuperIO-style IOs (via IO space) such as UARTs, IPMI
controllers.

On the BMC chip side, this is all configured via a bunch of registers
whose content is related to a given policy of what devices are exposed
at a per system level, which is system/vendor specific, so we don't want
to bolt that into the BMC kernel. This started with a need to provide
something nicer than /dev/mem for user space to configure these things.

One important aspect of the configuration is how the MEM/FW space is
exposed to the host (ie, the x86 or POWER). Some registers in that
bridge can define a window remapping all or portion of the LPC MEM/FW
space to a portion of the BMC internal bus, with no specific limits
imposed in HW.

I think it makes sense to ensure that this window is configured by a
kernel driver that can apply some serious sanity checks on what it is
configured to map.

In practice, user space wants to control this by flipping the mapping
between essentially two types of portions of the BMC address space:

   - The flash space. This is a region of the BMC MMIO space that
more/less directly maps the system flash (at least for reads, writes
are somewhat more complicated).

   - One (or more) reserved area(s) of the BMC physical memory.

The latter is needed for a number of things, such as avoiding letting
the host manipulate the innards of the BMC flash controller via some
evil backdoor, we want to do flash updates by routing the window to a
portion of memory (under control of a mailbox protocol via some
separate set of registers) which the host can use to write new data in
bulk and then request the BMC to flash it. There are other uses, such
as allowing the host to boot from an in-memory flash image rather than
the one in flash (very handy for continuous integration and test, the
BMC can just download new images).

It is important to note that due to the way the Aspeed chip lets the
kernel configure the mapping between host LPC addresses and BMC ram
addresses the offset within the window must be a multiple of size.
Not doing so will fragment the accessible space rather than simply
moving 'zero' upwards. This is caused by the nature of HICR8 being a
mask and the way host LPC addresses are translated.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
v2:
   Removed unused functions
   Removed use of access_ok()
   All input is evil
   Reworked the interface as per Benjamin Herrenschmidts vision
v3:
   Removed 'default y' from Kconfig
   Reordered ioctl() struct fields
   Reworeded some comments
v4:
   Reorder ioctl() struct fields (again)
v5:
   Style cleanups
   Use of_address_to_resource()
   Document ioctl structure fields


 drivers/misc/Kconfig                 |   8 ++
 drivers/misc/Makefile                |   1 +
 drivers/misc/aspeed-lpc-ctrl.c       | 264 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/aspeed-lpc-ctrl.h |  60 ++++++++
 4 files changed, 333 insertions(+)
 create mode 100644 drivers/misc/aspeed-lpc-ctrl.c
 create mode 100644 include/uapi/linux/aspeed-lpc-ctrl.h

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 64971baf11fa..7dc4c369012f 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -766,6 +766,14 @@ config PANEL_BOOT_MESSAGE
 	  An empty message will only clear the display at driver init time. Any other
 	  printf()-formatted message is valid with newline and escape codes.
 
+config ASPEED_LPC_CTRL
+	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
+	tristate "Aspeed ast2400/2500 HOST LPC to BMC bridge control"
+	---help---
+	  Control Aspeed ast2400/2500 HOST LPC to BMC mappings through
+	  ioctl()s, the driver also provides a read/write interface to a BMC ram
+	  region where the host LPC read/write region can be buffered.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 31983366090a..de1925a9c80b 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
 obj-$(CONFIG_CXL_BASE)		+= cxl/
 obj-$(CONFIG_PANEL)             += panel.o
+obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
 
 lkdtm-$(CONFIG_LKDTM)		+= lkdtm_core.o
 lkdtm-$(CONFIG_LKDTM)		+= lkdtm_bugs.o
diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
new file mode 100644
index 000000000000..9b51548e9d81
--- /dev/null
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -0,0 +1,264 @@
+/*
+ * Copyright 2017 IBM Corporation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/miscdevice.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/regmap.h>
+
+#include <linux/aspeed-lpc-ctrl.h>
+
+#define DEVICE_NAME	"aspeed-lpc-ctrl"
+
+#define HICR7 0x8
+#define HICR8 0xc
+
+struct aspeed_lpc_ctrl {
+	struct miscdevice	miscdev;
+	struct regmap		*regmap;
+	phys_addr_t		mem_base;
+	resource_size_t		mem_size;
+	u32		pnor_size;
+	u32		pnor_base;
+};
+
+static struct aspeed_lpc_ctrl *file_aspeed_lpc_ctrl(struct file *file)
+{
+	return container_of(file->private_data, struct aspeed_lpc_ctrl,
+			miscdev);
+}
+
+static int aspeed_lpc_ctrl_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct aspeed_lpc_ctrl *lpc_ctrl = file_aspeed_lpc_ctrl(file);
+	unsigned long vsize = vma->vm_end - vma->vm_start;
+	pgprot_t prot = vma->vm_page_prot;
+
+	if (vma->vm_pgoff + vsize > lpc_ctrl->mem_base + lpc_ctrl->mem_size)
+		return -EINVAL;
+
+	/* ast2400/2500 AHB accesses are not cache coherent */
+	prot = pgprot_dmacoherent(prot);
+
+	if (remap_pfn_range(vma, vma->vm_start,
+		(lpc_ctrl->mem_base >> PAGE_SHIFT) + vma->vm_pgoff,
+		vsize, prot))
+		return -EAGAIN;
+
+	return 0;
+}
+
+static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
+		unsigned long param)
+{
+	struct aspeed_lpc_ctrl *lpc_ctrl = file_aspeed_lpc_ctrl(file);
+	void __user *p = (void __user *)param;
+	struct aspeed_lpc_ctrl_mapping map;
+	u32 addr;
+	u32 size;
+	long rc;
+
+	if (copy_from_user(&map, p, sizeof(map)))
+		return -EFAULT;
+
+	switch (cmd) {
+	case ASPEED_LPC_CTRL_IOCTL_GET_SIZE:
+		/* The flash windows don't report their size */
+		if (map.window_type != ASPEED_LPC_CTRL_WINDOW_MEMORY)
+			return -EINVAL;
+
+		/* Support more than one window id in the future */
+		if (map.window_id != 0)
+			return -EINVAL;
+
+		map.size = lpc_ctrl->mem_size;
+
+		return copy_to_user(p, &map, sizeof(map)) ? -EFAULT : 0;
+	case ASPEED_LPC_CTRL_IOCTL_MAP:
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
+		/*
+		 * It doesn't make sense to talk about a size or offset with
+		 * low 16 bits set. Both HICR7 and HICR8 talk about the top 16
+		 * bits of addresses and sizes.
+		 */
+
+		if ((map.size & 0x0000ffff) || (map.offset & 0x0000ffff))
+			return -EINVAL;
+
+		/*
+		 * Because of the way the masks work in HICR8 offset has to
+		 * be a multiple of size.
+		 */
+		if (map.offset & (map.size - 1))
+			return -EINVAL;
+
+		if (map.window_type == ASPEED_LPC_CTRL_WINDOW_FLASH) {
+			addr = lpc_ctrl->pnor_base;
+			size = lpc_ctrl->pnor_size;
+		} else if (map.window_type == ASPEED_LPC_CTRL_WINDOW_MEMORY) {
+			addr = lpc_ctrl->mem_base;
+			size = lpc_ctrl->mem_size;
+		} else {
+			return -EINVAL;
+		}
+
+		/* Check overflow first! */
+		if (map.offset + map.size < map.offset ||
+			map.offset + map.size > size)
+			return -EINVAL;
+
+		if (map.size == 0 || map.size > size)
+			return -EINVAL;
+
+		addr += map.offset;
+
+		/*
+		 * addr (host lpc address) is safe regardless of values. This
+		 * simply changes the address the host has to request on its
+		 * side of the LPC bus. This cannot impact the hosts own
+		 * memory space by surprise as LPC specific accessors are
+		 * required. The only strange thing that could be done is
+		 * setting the lower 16 bits but the shift takes care of that.
+		 */
+
+		rc = regmap_write(lpc_ctrl->regmap, HICR7,
+				(addr | (map.addr >> 16)));
+		if (rc)
+			return rc;
+
+		return regmap_write(lpc_ctrl->regmap, HICR8,
+			(~(map.size - 1)) | ((map.size >> 16) - 1));
+	}
+
+	return -EINVAL;
+}
+
+static const struct file_operations aspeed_lpc_ctrl_fops = {
+	.owner		= THIS_MODULE,
+	.mmap		= aspeed_lpc_ctrl_mmap,
+	.unlocked_ioctl	= aspeed_lpc_ctrl_ioctl,
+};
+
+static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
+{
+	struct aspeed_lpc_ctrl *lpc_ctrl;
+	struct device_node *node;
+	struct resource resm;
+	struct device *dev;
+	int rc;
+
+	dev = &pdev->dev;
+
+	lpc_ctrl = devm_kzalloc(dev, sizeof(*lpc_ctrl), GFP_KERNEL);
+	if (!lpc_ctrl)
+		return -ENOMEM;
+
+	node = of_parse_phandle(dev->of_node, "flash", 0);
+	if (!node) {
+		dev_err(dev, "Didn't find host pnor flash node\n");
+		return -ENODEV;
+	}
+
+	rc = of_address_to_resource(node, 1, &resm);
+	of_node_put(node);
+	if (rc) {
+		dev_err(dev, "Couldn't address to resource for flash\n");
+		return rc;
+	}
+
+	lpc_ctrl->pnor_size = resource_size(&resm);
+	lpc_ctrl->pnor_base = resm.start;
+
+	dev_set_drvdata(&pdev->dev, lpc_ctrl);
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!node) {
+		dev_err(dev, "Didn't find reserved memory\n");
+		return -EINVAL;
+	}
+
+	rc = of_address_to_resource(node, 0, &resm);
+	of_node_put(node);
+	if (rc) {
+		dev_err(dev, "Couldn't address to resource for reserved memory\n");
+		return -ENOMEM;
+	}
+
+	lpc_ctrl->mem_size = resource_size(&resm);
+	lpc_ctrl->mem_base = resm.start;
+
+	lpc_ctrl->regmap = syscon_node_to_regmap(
+			pdev->dev.parent->of_node);
+	if (IS_ERR(lpc_ctrl->regmap)) {
+		dev_err(dev, "Couldn't get regmap\n");
+		return -ENODEV;
+	}
+
+	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
+	lpc_ctrl->miscdev.name = DEVICE_NAME;
+	lpc_ctrl->miscdev.fops = &aspeed_lpc_ctrl_fops;
+	lpc_ctrl->miscdev.parent = dev;
+	rc = misc_register(&lpc_ctrl->miscdev);
+	if (rc)
+		dev_err(dev, "Unable to register device\n");
+	else
+		dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
+			lpc_ctrl->mem_base, lpc_ctrl->mem_size);
+
+	return rc;
+}
+
+static int aspeed_lpc_ctrl_remove(struct platform_device *pdev)
+{
+	struct aspeed_lpc_ctrl *lpc_ctrl = dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&lpc_ctrl->miscdev);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_lpc_ctrl_match[] = {
+	{ .compatible = "aspeed,ast2400-lpc-ctrl" },
+	{ .compatible = "aspeed,ast2500-lpc-ctrl" },
+	{ },
+};
+
+static struct platform_driver aspeed_lpc_ctrl_driver = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table = aspeed_lpc_ctrl_match,
+	},
+	.probe = aspeed_lpc_ctrl_probe,
+	.remove = aspeed_lpc_ctrl_remove,
+};
+
+module_platform_driver(aspeed_lpc_ctrl_driver);
+
+MODULE_DEVICE_TABLE(of, aspeed_lpc_ctrl_match);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
+MODULE_DESCRIPTION("Control for aspeed 2400/2500 LPC HOST to BMC mappings");
diff --git a/include/uapi/linux/aspeed-lpc-ctrl.h b/include/uapi/linux/aspeed-lpc-ctrl.h
new file mode 100644
index 000000000000..f96fa995a3f0
--- /dev/null
+++ b/include/uapi/linux/aspeed-lpc-ctrl.h
@@ -0,0 +1,60 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#ifndef _UAPI_LINUX_ASPEED_LPC_CTRL_H
+#define _UAPI_LINUX_ASPEED_LPC_CTRL_H
+
+#include <linux/ioctl.h>
+
+/* Window types */
+#define ASPEED_LPC_CTRL_WINDOW_FLASH	1
+#define ASPEED_LPC_CTRL_WINDOW_MEMORY	2
+
+/*
+ * This driver provides a window for the host to access a BMC resource
+ * across the BMC <-> Host LPC bus.
+ *
+ * window_type: The BMC resource that the host will access through the
+ * window. BMC flash and BMC RAM.
+ *
+ * window_id: For each window type there may be multiple windows,
+ * these are referenced by ID.
+ *
+ * flags: Reserved for future use, this field is expected to be
+ * zeroed.
+ *
+ * addr: Address on the host LPC bus that the specified window should
+ * be mapped. This address must be power of two aligned.
+ *
+ * offset: Offset into the BMC window that should be mapped to the
+ * host (at addr). This must be a multiple of size.
+ *
+ * size: The size of the mapping. The smallest possible size is 64K.
+ * This must be power of two aligned.
+ *
+ */
+
+struct aspeed_lpc_ctrl_mapping {
+	__u8	window_type;
+	__u8	window_id;
+	__u16	flags;
+	__u32	addr;
+	__u32	offset;
+	__u32	size;
+};
+
+#define __ASPEED_LPC_CTRL_IOCTL_MAGIC	0xb2
+
+#define ASPEED_LPC_CTRL_IOCTL_GET_SIZE	_IOWR(__ASPEED_LPC_CTRL_IOCTL_MAGIC, \
+		0x00, struct aspeed_lpc_ctrl_mapping)
+
+#define ASPEED_LPC_CTRL_IOCTL_MAP	_IOW(__ASPEED_LPC_CTRL_IOCTL_MAGIC, \
+		0x01, struct aspeed_lpc_ctrl_mapping)
+
+#endif /* _UAPI_LINUX_ASPEED_LPC_CTRL_H */
-- 
2.11.1
