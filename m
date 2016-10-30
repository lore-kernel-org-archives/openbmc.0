Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6Ws40w2yzDvXx
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 09:10:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=cuUGAyfU; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id 128so1109103oih.3
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 15:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3I11Z4zn6kiZF7H+YU9fNvm7/WN2aKfmHrSQlfyvJfw=;
 b=cuUGAyfU3j7hX1cxYbIPrTt6k+HxQtrouNWSIqjKc35vDulMhCsuC+hWAVJbygBxOg
 mWBWSWVFqKppuVdxGA/cD6shEsiYPWHnQ1dw9ObsJtLek7gTdDpEFUN+CWrORONvBSc4
 meVOs5+4aCXGXbZpU3wxjQG21GHcE6lXHCEWIstpzHCsmPxK1eugbbUAlomN/nALmQ2e
 rudjxA0CB+NCvAJcaB2pewVZeGy0UKd/MaGKRelXBd1gu6L9kLJPtW8z8LCa9JJ5v2xl
 zWrkfhivzHFFEvgPUcYOrZGwxAiXTjzyK3Hd7V/Y4pYGYR+Iwoad3FSIQ5TpxWG3gPid
 WgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3I11Z4zn6kiZF7H+YU9fNvm7/WN2aKfmHrSQlfyvJfw=;
 b=mh4J8NdWa+C6RZz5CFmSRBeE3hs7rg8+5mIK/Ne5RnZm2lDoXP1bO8CLVtsqoGHcz5
 xZaPZH6+/LjWnz3PLTdHCw7fULJhOW5lvv750Q7Y9j6cywezYnAXcBF7/ulPLUE0T7V5
 hGGNcoKzNclW36FE1oKi4YFUl0bKqOyL3XViSfQrRAqbhfl6G55nv/GlEYvTFyTBppsf
 t9FW+DqPSacS29n9MlLRysoqpNgAZnfYZU3teCEpHJl+AOFXmUOPHbyx2ofPphNNX9Km
 WylkWy/+RdRl7nWBs+CSopWBxdPQWvlRQtNL0PjqYL7ffUyiy5B2zHeRgqSNCqPS4QQx
 iHFA==
X-Gm-Message-State: ABUngvdU1W2HaeVL4N3bxH90lfKkTpP13su6/iBoqX4kjztdi/5RTw3YrNEoiQZVb3sBvw==
X-Received: by 10.202.3.193 with SMTP id 184mr24538430oid.177.1477865430055;
 Sun, 30 Oct 2016 15:10:30 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id q59sm7585484ota.20.2016.10.30.15.10.28
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 30 Oct 2016 15:10:29 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v6 18/18] drivers/fsi: Add SCOM FSI client device driver
Date: Sun, 30 Oct 2016 17:09:39 -0500
Message-Id: <1477865379-11566-38-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 22:10:32 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Create a simple SCOM engine device driver that reads and writes
across an FSI bus.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>

---

V4 - Add put_scom and get_scom operations

V5 - Add character device registration and fill in read/write
     syscalls.

V6 - Add multi scom engine support. Add list of devices.
     Use file private data to store and hand off scom structures.

   - Add lseek, open, close

   - Remove data/address structure to pass from user space to
     kernel.  Use offset provided by read/write and pass data

   - Added list setup in init and so did not add the macro
     module_fsi_driver

   - Global structs made static where possible.

   - Change from char dev to use misc device api as shown
     in examples from Jeremy Kere.
---
 drivers/fsi/Kconfig    |   6 ++
 drivers/fsi/Makefile   |   1 +
 drivers/fsi/fsi-scom.c | 238 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 245 insertions(+)
 create mode 100644 drivers/fsi/fsi-scom.c

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index b21fe3c..1fa9bc0 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -23,6 +23,12 @@ config FSI_MASTER_GPIO
 	depends on FSI
 	---help---
 	This option enables a FSI master driver using GPIO lines.
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
index 0000000..27be082
--- /dev/null
+++ b/drivers/fsi/fsi-scom.c
@@ -0,0 +1,238 @@
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
+static int scom_probe(struct device *);
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
+	udelay(SCOM_FSI2PIB_DELAY);
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
+static loff_t scom_llseek(struct file *filep, loff_t offset, int whence)
+{
+	if (whence != 0)  /* SEEK_SET */
+		return -EINVAL;
+
+	filep->f_pos = offset;
+	return offset;
+}
+
+static ssize_t scom_read(struct file *filep, char __user *buf, size_t len,
+			loff_t *offset)
+{
+	int rc = 0;
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
+	int rc = 0;
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
+
+	return rc ? rc : len;
+}
+
+static const struct file_operations scom_fops = {
+	.owner	= THIS_MODULE,
+	.llseek	= scom_llseek,
+	.read	= scom_read,
+	.write	= scom_write,
+};
+
+static int scom_probe(struct device *dev)
+{
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct scom_device *scom = NULL;
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
+	struct scom_device *scom = NULL;
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
