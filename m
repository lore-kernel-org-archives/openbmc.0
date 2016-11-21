Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMXsp6NJGzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:41:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G9QTzbPB"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id f201so16440116oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SxQIi7nAwzQ39coAnYLuw43+NxczgTdgdB8blJieRjQ=;
 b=G9QTzbPB3FavyKw0rjZkd9lhDv3OvF99vg9Zo1cl0r4N0MxlAcFDTLk1hQ6wNPhh5e
 VGaPZnwKF93F+B32d/wFjZ2v90KUZYNZJqDuSfoltuG5qQ28saySNjgSzVSYKw759aL3
 BgrYkI50ZN1D3lo8+dzgvX+BzOkCwpywjBQ/oTxS7P40PESMjk3SBfNSsjfKGLaiDnco
 seCAbXkdX57DBZ1ht4YMlM04pSR8ZrJffxPW22kDJ3XZwhwQPklEG+iaQMMngmq3/YXp
 lzXF3JutYZR52pdjpIrhLlnWtgkfPKXo2rRoBy7FFneO3f5LnskYwF1LQknv/lFCKdPL
 y8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SxQIi7nAwzQ39coAnYLuw43+NxczgTdgdB8blJieRjQ=;
 b=kY2QLssHG0ZehMc58tARqV1e6GTkBfybgWc8yTlPgi4mloYrJsihXwZ9ykunbXhC2l
 1KlIW6h0h9onr+YgXXmDNh5Ov76tYWkx7FS6TdLdAIe/9oSdLUVK0Qp1udWekK18r6YY
 7nSyjVRiDzB6xg5t8+SLiIVPF6lAN4o3az3KsfKWpAG1YsywRmNga6UTCYwV6a+eRAsy
 jf9nTIubRm9y0/lGHISMSPvYaHFMJQ5HjASUXeD9EWXrtxAAglWxfyDjAZgnmYSBlEPx
 evCwNhAcU/o1TjwBQ3gYsBIM+AQyFkf1iYCemcp4kAuUv1DW8UIt5WgN2cLBsSPhlXrA
 aEcg==
X-Gm-Message-State: AKaTC02SDbVtBGzA0KOG1iPDjA+UjW6BTiRSY41iXrUXgIyBDqV/uZ0vpvPHHn9Dz5Q0GQ==
X-Received: by 10.157.41.155 with SMTP id n27mr6955866otb.158.1479696077126;
 Sun, 20 Nov 2016 18:41:17 -0800 (PST)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id 73sm6432307otf.16.2016.11.20.18.41.15
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 20 Nov 2016 18:41:16 -0800 (PST)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org, gustavo.padovan@collabora.co.uk,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, jthumshirn@suse.de,
 dan.j.williams@intel.com, sre@kernel.org, clg@kaod.org,
 k.kozlowski@samsung.com
Cc: jk@ozlabs.org, joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 benh@kernel.crashing.org, alistair@popple.id.au,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux 18/19] drivers/fsi: Add SCOM FSI client device driver
Date: Sun, 20 Nov 2016 20:40:47 -0600
Message-Id: <1479696048-75851-19-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 21 Nov 2016 02:41:19 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Create a simple SCOM engine device driver that reads and writes
its control registers via an FSI bus.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/Kconfig    |   6 ++
 drivers/fsi/Makefile   |   1 +
 drivers/fsi/fsi-scom.c | 225 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 232 insertions(+)
 create mode 100644 drivers/fsi/fsi-scom.c

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index b21fe3c..8a2e325 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -23,6 +23,12 @@ config FSI_MASTER_GPIO
 	depends on FSI
 	---help---
 	This option enables a FSI master driver using GPIO lines.
+
+config FSI_SCOM
+	tristate "SCOM FSI client device driver"
+	depends on FSI
+	---help---
+	This option enables an FSI based SCOM device driver.
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
index 0000000..c9d69e6
--- /dev/null
+++ b/drivers/fsi/fsi-scom.c
@@ -0,0 +1,225 @@
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
+#include <linux/slab.h>
+#include <linux/miscdevice.h>
+#include <linux/list.h>
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
+struct scom_device {
+	struct list_head link;
+	struct fsi_device *fsi_dev;
+	struct miscdevice mdev;
+	char	name[32];
+};
+
+#define to_scom_dev(x)		container_of((x), struct scom_device, mdev)
+
+static struct list_head scom_devices;
+static atomic_t scom_idx = ATOMIC_INIT(0);
+
+static int put_scom(struct scom_device *scom_dev, uint64_t value,
+			uint32_t addr)
+{
+	int rc;
+	uint32_t data = SCOM_RESET_CMD;
+
+	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_RESET_REG, &data,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	data = (value >> 32) & 0xffffffff;
+	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_DATA0_REG, &data,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	data = value & 0xffffffff;
+	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_DATA1_REG, &data,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	data = SCOM_WRITE_CMD | addr;
+	return fsi_device_write(scom_dev->fsi_dev, SCOM_CMD_REG, &data,
+				sizeof(uint32_t));
+}
+
+static int get_scom(struct scom_device *scom_dev, uint64_t *value,
+			uint32_t addr)
+{
+	uint32_t result, data;
+	int rc;
+
+	data = addr;
+	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_CMD_REG, &data,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	rc = fsi_device_read(scom_dev->fsi_dev, SCOM_DATA0_REG, &result,
+				sizeof(uint32_t));
+	if (rc)
+		return rc;
+
+	*value |= (uint64_t) result << 32;
+	rc = fsi_device_read(scom_dev->fsi_dev, SCOM_DATA1_REG, &result,
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
+	int rc;
+	struct miscdevice *mdev =
+				(struct miscdevice *)filep->private_data;
+	struct scom_device *scom = to_scom_dev(mdev);
+	struct device *dev = &scom->fsi_dev->dev;
+	uint64_t val;
+
+	if (len != sizeof(uint64_t))
+		return -EINVAL;
+
+	rc = get_scom(scom, &val, *offset);
+	if (rc) {
+		dev_dbg(dev, "get_scom fail:%d\n", rc);
+		return rc;
+	}
+
+	rc = copy_to_user(buf, &val, len);
+	if (rc)
+		dev_dbg(dev, "copy to user failed:%d\n", rc);
+
+	return rc ? rc : len;
+}
+
+static ssize_t scom_write(struct file *filep, const char __user *buf,
+			size_t len, loff_t *offset)
+{
+	int rc;
+	struct miscdevice *mdev =
+				(struct miscdevice *)filep->private_data;
+	struct scom_device *scom = to_scom_dev(mdev);
+	struct device *dev = &scom->fsi_dev->dev;
+	uint64_t val;
+
+	if (len != sizeof(uint64_t))
+		return -EINVAL;
+
+	rc = copy_from_user(&val, buf, len);
+	if (rc) {
+		dev_dbg(dev, "copy from user failed:%d\n", rc);
+		return -EINVAL;
+	}
+
+	rc = put_scom(scom, val, *offset);
+	if (rc)
+		dev_dbg(dev, "put_scom failed with:%d\n", rc);
+
+	return rc;
+}
+
+static const struct file_operations scom_fops = {
+	.owner	= THIS_MODULE,
+	.llseek	= no_seek_end_llseek,
+	.read	= scom_read,
+	.write	= scom_write,
+};
+
+static int scom_probe(struct device *dev)
+{
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct scom_device *scom;
+
+	scom = devm_kzalloc(dev, sizeof(*scom), GFP_KERNEL);
+	if (!scom)
+		return -ENOMEM;
+
+	snprintf(scom->name, sizeof(scom->name),
+			"scom%d", atomic_inc_return(&scom_idx));
+	scom->fsi_dev = fsi_dev;
+	scom->mdev.minor = MISC_DYNAMIC_MINOR;
+	scom->mdev.fops = &scom_fops;
+	scom->mdev.name = scom->name;
+	scom->mdev.parent = dev;
+	list_add(&scom->link, &scom_devices);
+
+	return misc_register(&scom->mdev);
+}
+
+static struct fsi_device_id scom_ids[] = {
+	{
+		.engine_type = FSI_ENGID_SCOM,
+		.version = FSI_VERSION_ANY,
+	},
+	{ 0 }
+};
+
+static struct fsi_driver scom_drv = {
+	.id_table = scom_ids,
+	.drv = {
+		.name = "scom",
+		.bus = &fsi_bus_type,
+		.probe = scom_probe,
+	}
+};
+
+static int scom_init(void)
+{
+	INIT_LIST_HEAD(&scom_devices);
+	return fsi_driver_register(&scom_drv);
+}
+
+static void scom_exit(void)
+{
+	struct list_head *pos;
+	struct scom_device *scom;
+
+	list_for_each(pos, &scom_devices) {
+		scom = list_entry(pos, struct scom_device, link);
+		misc_deregister(&scom->mdev);
+		devm_kfree(&scom->fsi_dev->dev, scom);
+	}
+	fsi_driver_unregister(&scom_drv);
+}
+
+module_init(scom_init);
+module_exit(scom_exit);
+MODULE_LICENSE("GPL");
-- 
1.8.2.2
