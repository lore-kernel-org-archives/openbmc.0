Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsr0rY8zDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tO+MjB6g"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id f201so16440155oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q9ap40mlTPHM+xc4gl+4iWpYHTqYpV1PMSLnLZrrj3w=;
 b=tO+MjB6gPEsk6klsCQr54qC1KIA4Swpwb1xeWPrs8I/H/pUcuiT+Jz15q+5Ur33v8L
 q/sSuX9dhw/1HlWA1m+/sUpSmjKAKgo+v6N65/IzJG+0LgCvoHxtJC8xOu+a9//yAiMn
 wYaKfJ0TFl2C4U0QX/Sk7uUBhnRSFTPOGDIO8jovAboHtAR7JJ8gF0rRMhgt+HY/MgVG
 wDbsew7xDOi18lonbprLUSw8K1Y6yAl4sjVSxYJEzLfxgy3uoJjnv1HJfI80nPlajW8K
 9Wc0WGHE1vgYJO6nZLmZBdseoS84t7Lu2+kakXSStgAfRsJWJKhi3dOblgXQdVKif7NS
 qF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q9ap40mlTPHM+xc4gl+4iWpYHTqYpV1PMSLnLZrrj3w=;
 b=S27rxH+vD61Cx9uzA+LUryCNSjf3bfjhWsE1l1AuODaScoP0nBZkHLCgJKAln5csj+
 wYrJ5xmn36WMmYUN08Nr8STqkk4kMCrFPuUWdLjk5YNgtgw0T4c8nuJP1l/Pfwaylmit
 VgGcOPJOSIDZ0379NgJZeTsudF2Eh+R3QDW06XGl4X/EhgH3x0SPugJMtK8Tdx1BuLri
 7KsArITGxJAPqkHv8fcgdplBObvlkzdAY5e1hw1ENhUkT6KMEya9kZwu/9D7u25Hh3YI
 xy4WqR6IEzinRVfDgUBBm4O+2NwwZnB6yWtQDVBmiNJq8YWSDG5cXIgIDscIukn9QQEz
 wfEQ==
X-Gm-Message-State: AKaTC00VTZcV5CI8bo8r+Lqxdh37/hj9jo62q79mWnvPpNFdILxVkNOzfOLM6l1VwQWEPA==
X-Received: by 10.157.51.104 with SMTP id u37mr7691778otd.9.1479696078353;
 Sun, 20 Nov 2016 18:41:18 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.17
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:18 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 19/19] drivers/fsi: Add Mailbox FSI client device driver
Date: Sun, 20 Nov 2016 20:40:48 -0600
Message-Id: <1479696048-75851-20-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailman-Approved-At: Mon, 21 Nov 2016 13:57:37 +1100
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:20 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Create a simple mailbox engine device driver that can access
its registers across an FSI bus.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/Kconfig   |   7 ++
 drivers/fsi/Makefile  |   1 +
 drivers/fsi/fsi-mbx.c | 196 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/fsi/fsi-mbx.c

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 8a2e325..5917006a1f 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -29,6 +29,13 @@ config FSI_SCOM
 	depends on FSI
 	---help---
 	This option enables an FSI based SCOM device driver.
+
+config FSI_MBX
+	tristate "Mailbox FSI client device driver"
+	depends on FSI
+	---help---
+	This option enables an FSI based Mailbox device driver.
+
 endif
 
 endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index 3e31d9a..36bcbd8 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_FSI) += fsi-core.o
 obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
 obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
 obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
+obj-$(CONFIG_FSI_MBX) += fsi-mbx.o
diff --git a/drivers/fsi/fsi-mbx.c b/drivers/fsi/fsi-mbx.c
new file mode 100644
index 0000000..66ac3f1
--- /dev/null
+++ b/drivers/fsi/fsi-mbx.c
@@ -0,0 +1,196 @@
+/*
+ * Mailbox (MBX) FSI Client device driver
+ *
+ * Copyright (C) IBM Corporation 2016
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/fsi.h>
+#include <linux/module.h>
+#include <linux/cdev.h>
+#include <linux/delay.h>
+#include <linux/fs.h>
+#include <linux/uaccess.h>
+#include <linux/slab.h>
+#include <linux/miscdevice.h>
+#include <linux/list.h>
+
+#define FSI_ENGID_P9MBX		0x20
+#define MBX_REG_MAX		0x1FC
+#define MBX_IOCTL_READ_REG	0x01
+#define MBX_IOCTL_WRITE_REG	0x02
+
+struct mbx_device {
+	struct list_head link;
+	struct fsi_device *fsi_dev;
+	struct miscdevice mdev;
+	char	name[32];
+};
+
+#define to_mbx_dev(x)		container_of((x), struct mbx_device, mdev)
+
+struct mbx_reg_data {
+	uint32_t offset;	/* What address */
+	uint32_t value;		/* value at address */
+};
+
+static struct list_head mbx_devices;
+static atomic_t mbx_idx = ATOMIC_INIT(0);
+static int mbx_probe(struct device *);
+
+static ssize_t mbx_read(struct file *filep, char __user *buf, size_t len,
+			loff_t *offset)
+{
+	int rc = 0;
+
+	return rc ? rc : len;
+}
+
+static ssize_t mbx_write(struct file *filep, const char __user *buf,
+			size_t len, loff_t *offset)
+{
+	int rc = 0;
+
+	return rc ? rc : len;
+}
+
+static bool mbx_offset_valid(uint32_t offset)
+{
+	return (offset >= 0 && offset <= MBX_REG_MAX);
+}
+
+static long mbx_ioctl(struct file *filep, uint32_t cmd, unsigned long data)
+{
+	struct miscdevice *mdev =
+				(struct miscdevice *)filep->private_data;
+	struct mbx_device *mbx = to_mbx_dev(mdev);
+	struct device *dev = &mbx->fsi_dev->dev;
+	ssize_t rc;
+	struct mbx_reg_data reg;
+
+	switch (cmd) {
+	case MBX_IOCTL_WRITE_REG:
+
+		if (!data) {
+			dev_info(dev, "Empty ioctl data\n");
+			return -EINVAL;
+		}
+		rc = copy_from_user(&reg, (void *)data, sizeof(reg));
+		if (rc) {
+			dev_info(dev, "Failed to copy from user\n");
+			return -EFAULT;
+		}
+		if (mbx_offset_valid(reg.offset))
+			rc = fsi_device_write(mbx->fsi_dev, reg.offset,
+					&reg.value, sizeof(reg.value));
+		else
+			return -EINVAL;
+		break;
+
+	case MBX_IOCTL_READ_REG:
+
+		if (!data) {
+			dev_info(dev, "Empty ioctl data\n");
+			return -EINVAL;
+		}
+		rc = copy_from_user(&reg, (void *)data, sizeof(reg));
+		if (rc) {
+			dev_info(dev, "Failed to copy from user\n");
+			return -EFAULT;
+		}
+		if (mbx_offset_valid(reg.offset)) {
+			rc = fsi_device_read(mbx->fsi_dev, reg.offset,
+					&reg.value, sizeof(reg.value));
+			if (rc)
+				return rc;
+			rc = copy_to_user((void *)data, &reg, sizeof(reg));
+			if (rc) {
+				dev_info(dev, "copy to user failed\n");
+				return -EFAULT;
+			}
+		} else
+			return -EINVAL;
+		break;
+	default:
+		dev_info(dev, "Ivalid ioctl command:%d\n", cmd);
+		return -EINVAL;
+	}
+	return rc;
+};
+
+static const struct file_operations mbx_fops = {
+	.owner	= THIS_MODULE,
+	.llseek	= no_seek_end_llseek,
+	.read	= mbx_read,
+	.write	= mbx_write,
+	.compat_ioctl  = mbx_ioctl,
+};
+
+static int mbx_probe(struct device *dev)
+{
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct mbx_device *mbx;
+
+	mbx = devm_kzalloc(dev, sizeof(*mbx), GFP_KERNEL);
+	if (!mbx)
+		return -ENOMEM;
+
+	snprintf(mbx->name, sizeof(mbx->name),
+			"mbx%d", atomic_inc_return(&mbx_idx));
+	mbx->fsi_dev = fsi_dev;
+	mbx->mdev.minor = MISC_DYNAMIC_MINOR;
+	mbx->mdev.fops = &mbx_fops;
+	mbx->mdev.name = mbx->name;
+	mbx->mdev.parent = dev;
+	list_add(&mbx->link, &mbx_devices);
+
+	return misc_register(&mbx->mdev);
+}
+
+static struct fsi_device_id mbx_ids[] = {
+	{
+		.engine_type = FSI_ENGID_P9MBX,
+		.version = FSI_VERSION_ANY,
+	},
+	{ 0 }
+};
+
+static struct fsi_driver mbx_drv = {
+	.id_table = mbx_ids,
+	.drv = {
+		.name = "mbx",
+		.bus = &fsi_bus_type,
+		.probe = mbx_probe,
+	}
+};
+
+static int mbx_init(void)
+{
+	INIT_LIST_HEAD(&mbx_devices);
+	return fsi_driver_register(&mbx_drv);
+}
+
+static void mbx_exit(void)
+{
+	struct list_head *pos;
+	struct mbx_device *mbx;
+
+	list_for_each(pos, &mbx_devices) {
+		mbx = list_entry(pos, struct mbx_device, link);
+		misc_deregister(&mbx->mdev);
+		devm_kfree(&mbx->fsi_dev->dev, mbx);
+	}
+	fsi_driver_unregister(&mbx_drv);
+}
+
+module_init(mbx_init);
+module_exit(mbx_exit);
+MODULE_LICENSE("GPL");
-- 
1.8.2.2
