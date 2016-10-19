Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhs63DYzDvV5
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:10:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=P8Da1KdW; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id k64so3168273itb.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c1jGeNzBdHDW38UxDbkR3Hb+/XtSGKNW2/n79eFCunU=;
 b=P8Da1KdWfcEnMkIVWLtBNfeWVATfg35K2R9ATrXNC04fxavQPuW+LE3B24WZVTMUTf
 ClVHBf86o5z0V2TMR+vIuz6QNReIk1RWmkgwNHr/yk15kl7IqmKJq9bZR2UM7284MSdg
 Q5zxrE+/cvqn4CYQj7Eo13z+0SgyjZ3AC9j7gTf/wwwWWaK61UyR5grRY4LQq0QNTYRf
 oy2Fd3qyzYf1I4zWR8ABgK+wS+AVIno+T6S9w0l0YfPf9i/b5FL7u6f/BO373y3eKDsZ
 2xoJMSc7dS0V2ArfRfd7qN4D2wQnfixAPzLkK4STJar3hj9esbaRPEWx5xD1Bycb/gEH
 L+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=c1jGeNzBdHDW38UxDbkR3Hb+/XtSGKNW2/n79eFCunU=;
 b=R3c7uwSwr7JJwyWOz2SLHlio/2qp4aAIkOd+NRX3x+MnYRD4d733V18lRdHfeYOcBF
 f1uvYC05/NE4BrMJUYmj8h48186aGCmn1zTCLd9yYsZ3i0Up1+IFIlzmnVIy3T+bInRl
 TZxoU8csaUiz3plNFhmxjNhHRVf21BVOInlPcW+ut0dZr/Zt6qSPTa0nop3tU/lqHSwH
 fZi88d0OxhBXiuGTCFC6spWOHrBvjPAKxOg02GLopEyvkfNU/yMDRhYR37dqK/Sg6ZQS
 v1s892svJjqSW4b462leoeWEZ7/8nYiupmgHAQ8jTN50TNKFktLblNQTUfW2Vhmi1wuM
 MWnA==
X-Gm-Message-State: AA6/9RnEGgP5OCVDYZ3XMqL0v0BVTNIqHekGu9etVQqt4WvPOos64QObxgCvS1zyn5D+5Q==
X-Received: by 10.157.62.130 with SMTP id b2mr4576998otc.159.1476918604079;
 Wed, 19 Oct 2016 16:10:04 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.10.03
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:10:03 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v5 17/18] drivers/fsi: Add SCOM FSI client device driver
Date: Wed, 19 Oct 2016 18:09:45 -0500
Message-Id: <1476918586-13475-18-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:10:06 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Create a simple SCOM engine device driver that reads and writes
across an FSI bus.

V4 - Add put_scom and get_scom operations

V5 - Add character device registration and fill in read/write
     syscalls.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/Kconfig    |   6 ++
 drivers/fsi/Makefile   |   1 +
 drivers/fsi/fsi-scom.c | 217 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 224 insertions(+)
 create mode 100644 drivers/fsi/fsi-scom.c

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 69e7ee8..719a217 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -24,6 +24,12 @@ config FSI_MASTER_GPIO
 	select GPIO_DEVRES
 	---help---
 	This option enables a FSI master driver, using GPIO lines directly.
+
+config FSI_SCOM
+	tristate "SCOM FSI client"
+	depends on FSI
+	---help---
+	This option enables the SCOM FSI client device driver.
 endif
 
 endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index 2021ce5..3e31d9a 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_FSI) += fsi-core.o
 obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
 obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
+obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
new file mode 100644
index 0000000..5ee12a9
--- /dev/null
+++ b/drivers/fsi/fsi-scom.c
@@ -0,0 +1,217 @@
+/*
+ * SCOM FSI Client device driver
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
+
+#define FSI_ENGID_SCOM		0x5
+
+#define SCOM_FSI2PIB_DELAY	50
+
+/* SCOM engine register set */
+#define SCOM_DATA0_REG		0x00
+#define SCOM_DATA1_REG		0x04
+#define SCOM_CMD_REG		0x08
+#define SCOM_RESET_REG		0x1C
+
+#define SCOM_RESET_CMD		0x80000000
+#define SCOM_WRITE_CMD		0x80000000
+
+static int scom_probe(struct device *);
+
+struct scom_op {
+	uint64_t	data;
+	uint32_t	addr;
+};
+
+struct scom_device {
+	struct fsi_device *fsi_dev;
+	struct cdev *cdev;
+};
+
+struct scom_device scom_dev;
+
+struct fsi_device_id scom_ids[] = {
+	{
+		.engine_type = FSI_ENGID_SCOM,
+		.version = FSI_VERSION_ANY,
+	},
+	{ 0 }
+};
+
+struct fsi_driver scom_drv = {
+	.id_table = scom_ids,
+	.drv = {
+		.name = "scom",
+		.bus = &fsi_bus_type,
+		.probe = scom_probe,
+	}
+};
+
+static int put_scom(uint64_t value, uint32_t addr)
+{
+	int rc;
+	uint32_t data = SCOM_RESET_CMD;
+	struct scom_device *scom = &scom_dev;
+
+	rc = fsi_device_write(scom->fsi_dev, SCOM_RESET_REG, &data,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	data = (value >> 32) & 0xffffffff;
+	rc = fsi_device_write(scom->fsi_dev, SCOM_DATA0_REG, &data,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	data = value & 0xffffffff;
+	rc = fsi_device_write(scom->fsi_dev, SCOM_DATA1_REG, &data,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	data = SCOM_WRITE_CMD | addr;
+	return fsi_device_write(scom->fsi_dev, SCOM_CMD_REG, &data,
+				sizeof(uint32_t));
+}
+
+
+static int get_scom(uint64_t *value, uint32_t addr)
+{
+	uint32_t result, data;
+	struct scom_device *scom = &scom_dev;
+	int rc;
+
+	udelay(SCOM_FSI2PIB_DELAY);
+
+	data = addr;
+	rc = fsi_device_write(scom->fsi_dev, SCOM_CMD_REG, &data,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	rc = fsi_device_read(scom->fsi_dev, SCOM_DATA0_REG, &result,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	*value |= (uint64_t) result << 32;
+	rc = fsi_device_read(scom->fsi_dev, SCOM_DATA1_REG, &result,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	*value |= result;
+
+	return 0;
+}
+
+static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
+			loff_t *offset)
+{
+	int rc = 0;
+	struct scom_op op;
+	struct scom_device *scom = &scom_dev;
+	struct device *dev = &scom->fsi_dev->dev;
+
+	/* todo: Retrieve device to operate on from filep->private_data */
+
+	if (len != sizeof(struct scom_op))
+		return -EINVAL;
+
+	rc = copy_from_user(&op, buf, len);
+	if (rc) {
+		dev_dbg(dev, "copy from user failed:%d\n", rc);
+		return -EINVAL;
+	}
+
+	rc = get_scom(&op.data, op.addr);
+	if (rc) {
+		dev_dbg(dev, "get_scom failed with:%d\n", rc);
+		return -EINVAL;
+	}
+
+	rc = copy_to_user(buf, &op, sizeof(struct scom_op));
+	if (rc) {
+		dev_dbg(dev, "copy to user failed:%d\n", rc);
+		return -EIO;
+	}
+
+	return len;
+}
+
+static ssize_t scom_write(struct file *filep, const char __user *buf,
+			size_t len, loff_t *offset)
+{
+	int rc = 0;
+	struct scom_op op;
+	struct scom_device *scom = &scom_dev;
+	struct device *dev = &scom->fsi_dev->dev;
+
+	/* todo: Retrieve device to operate on from filep->private_data */
+
+	if (len != sizeof(struct scom_op))
+		return -EINVAL;
+
+	rc = copy_from_user(&op, buf, sizeof(uint64_t));
+	if (rc) {
+		dev_dbg(dev, "copy from user failed:%d\n", rc);
+		return -EINVAL;
+	}
+
+	rc = put_scom(op.data, op.addr);
+	if (rc) {
+		dev_dbg(dev, "put_scom failed with:%d\n", rc);
+		return -EIO;
+	}
+
+	return len;
+}
+
+static const struct file_operations scom_fops = {
+	.owner	= THIS_MODULE,
+	.read	= scom_read,
+	.write	= scom_write,
+};
+
+static int scom_probe(struct device *dev)
+{
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct scom_device *scom = &scom_dev;
+	int rc;
+
+	scom->fsi_dev = fsi_dev;
+	scom->cdev = cdev_alloc();
+	if (!scom->cdev)
+		return -ENOMEM;
+
+	scom->cdev->owner = THIS_MODULE;
+
+	rc = register_chrdev(0, "scom", &scom_fops);
+	if (rc < 0) {
+		dev_dbg(dev, "scom major allocation failed:%d\n", rc);
+		return rc;
+	}
+	dev_dbg(dev, "scom major allocated:%d\n", rc);
+
+	return 0;
+}
+
+module_fsi_driver(scom_drv);
-- 
1.8.2.2
