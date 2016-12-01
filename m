Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tVBcj3Nh5zDw1v
 for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2016 09:23:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vveJ12yY"; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id n204so28206193qke.2
 for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2016 14:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=1vm+bybnC40FTNsvO9mW5Y3YK4q/uVnntaHVBN5/tBo=;
 b=vveJ12yY3KxR9SB6NLLWkcKSTxra17PA0mczG87nHNmE3ALKFquo1zu99cnU1TKM0M
 UNWn0nL3o8J+NG9f7Q14oMORjC4f3dKFx28M1Rpry2V4GyoWysNl7xwZbKNebOW8R2NY
 QINKZoqDq5IUYiLecb4QPisDX1HOtfdGl9j2XbWKl9xxEL2nRdry0+lM3oJ79wgOcqmy
 KgQfH6crfwo9gyzxeyy8qLPfp0ZYAhArhVTZozLQkxpDOe6xClce1vSN/tlF+eb2/zaB
 OIMOJ09H/lXkoDSmesnm7f22xECukI4hMAFNSkj5vsrU+GvDJk1RaScbQsooxaQI1CcX
 O5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1vm+bybnC40FTNsvO9mW5Y3YK4q/uVnntaHVBN5/tBo=;
 b=PxNj67jjy5kl9DseD3cUpuhY2mDZ5M/WKJKXX7XK6yuNoXKsPyBfHjDtQEE+ye1pJW
 NA+vg7SjadOJWYn3jVLmtylk1gXr/aXJfTUWU55w9Ow+UtimEE7VYJqHEeMstOVfopZd
 04XS9ZHeEEyx+Jzn5AyrPd3R+z0kK/73oRBiKQRMMVfxb7fT63NwvVPKrv6NT/tu4Qb0
 c7Yt2Y4XUqCZl3j4NK9HW52LXdu/0q3XTZC0n0A2wU2zSxjLNVmSja5cxaaA0WFbrzYo
 EwXUbQcsRYlNbDS8q3jvxgPeEt/zJLm1Nupd7sC4QsfW8AMe9edEh4G/mUkSgChUZQMb
 kJHQ==
X-Gm-Message-State: AKaTC02gA2qo8IMDx1jyunpifdcSXou81rFsbqX+pLyJxD1nQq3TQfGvQDtdnfVRwt1cSQ==
X-Received: by 10.55.6.14 with SMTP id 14mr35902253qkg.167.1480630979168;
 Thu, 01 Dec 2016 14:22:59 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.50])
 by smtp.gmail.com with ESMTPSA id p28sm1150053qtb.31.2016.12.01.14.22.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 01 Dec 2016 14:22:58 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux] drivers: fsi: Add SBE client device driver
Date: Thu,  1 Dec 2016 16:22:50 -0600
Message-Id: <1480630970-13319-1-git-send-email-eajames.ibm@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Thu, 01 Dec 2016 22:23:02 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This is a driver stub for the SBE FSI client driver. Just looking for
feedback for driver structuring. SBE doesn't use traditional reads/writes
but instead submits requests and receives replies from the SBE fifo (as
far as I understand it - need to check with Karlo).

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/Kconfig   |   6 ++
 drivers/fsi/Makefile  |   1 +
 drivers/fsi/fsi-sbe.c | 161 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 168 insertions(+)
 create mode 100644 drivers/fsi/fsi-sbe.c

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 5917006a1f..e314f82 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -36,6 +36,12 @@ config FSI_MBX
 	---help---
 	This option enables an FSI based Mailbox device driver.
 
+config FSI_SBE
+	tristate "SBE FSI client device driver"
+	depends on FSI
+	---help---
+	This option enables an FSI based SBE device driver.
+
 endif
 
 endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index 36bcbd8..174c524 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
 obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
 obj-$(CONFIG_FSI_SCOM) += fsi-scom.o
 obj-$(CONFIG_FSI_MBX) += fsi-mbx.o
+obj-$(CONFIG_FSI_SBE) += fsi-sbe.o
diff --git a/drivers/fsi/fsi-sbe.c b/drivers/fsi/fsi-sbe.c
new file mode 100644
index 0000000..e1c7914
--- /dev/null
+++ b/drivers/fsi/fsi-sbe.c
@@ -0,0 +1,161 @@
+/*
+ * SBE FSI Client device driver
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
+#define FSI_ENGID_P9SBE		0x22
+
+#define SBE_IOCTL_SUBMIT	0x01
+#define SBE_IOCTL_REQUEST_RESET	0x02
+#define SBE_IOCTL_RESET		0x03
+
+struct sbe_device {
+	struct list_head link;
+	struct fsi_device *fsi_dev;
+	struct miscdevice mdev;
+	char name[32];
+};
+
+#define to_sbe_dev(x)		container_of((x), struct sbe_device, mdev)
+
+static struct list_head sbe_devices;
+static atomic_t sbe_idx = ATOMIC_INIT(0);
+
+static ssize_t sbe_read(struct file *filep, char __user *buf, size_t len,
+			loff_t *offset)
+{
+	return len;
+}
+
+static ssize_t sbe_write(struct file *filep, const char __user *buf,
+			 size_t len, loff_t *offset)
+{
+	return len;
+}
+
+static int sbe_submit(struct sbe_device *sbe, unsigned long data)
+{
+	int rc = 0;
+
+	return rc;
+}
+
+static int sbe_reset(struct sbe_device *sbe)
+{
+	int rc = 0;
+
+	return rc;
+}
+
+
+static int sbe_request_reset(struct sbe_device *sbe)
+{
+	return 0;
+}
+
+static long sbe_ioctl(struct file *filep, uint32_t cmd, unsigned long data)
+{
+	struct miscdevice *mdev = (struct miscdevice *)filep->private_data;
+	struct sbe_device *sbe = to_sbe_dev(mdev);
+	struct device *dev = &sbe->fsi_dev->dev;
+	ssize_t rc;
+
+	switch (cmd) {
+	case SBE_IOCTL_SUBMIT:
+		rc = sbe_submit(sbe, data);
+		break;
+	case SBE_IOCTL_REQUEST_RESET:
+		rc = sbe_request_reset(sbe);
+		break;
+	case SBE_IOCTL_RESET:
+		rc = sbe_reset(sbe);
+		break;
+	default:
+		dev_info(dev, "Ivalid ioctl command:%d\n", cmd);
+		return -EINVAL;
+	}
+
+	return rc;
+};
+
+static const struct file_operations sbe_fops = {
+	.owner	= THIS_MODULE,
+	.llseek	= no_seek_end_llseek,
+	.read	= sbe_read,
+	.write	= sbe_write,
+	.compat_ioctl = sbe_ioctl
+};
+
+static int sbe_probe(struct device *dev)
+{
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct sbe_device *sbe;
+
+	sbe = devm_kzalloc(dev, sizeof(struct sbe_device), GFP_KERNEL);
+	if (!sbe)
+		return -ENOMEM;
+
+	snprintf(sbe->name, 32, "sbe%d", atomic_inc_return(&sbe_idx));
+	sbe->fsi_dev = fsi_dev;
+
+	sbe->mdev.minor = MISC_DYNAMIC_MINOR;
+	sbe->mdev.fops = &sbe_fops;
+	sbe->mdev.name = sbe->name;
+	sbe->mdev.parent = dev;
+
+	list_add(&sbe->link, &sbe_devices);
+
+	return misc_register(&sbe->mdev);
+}
+
+static struct fsi_device_id sbe_ids[] = {
+	{
+		.engine_type = FSI_ENGID_P9SBE,
+		.version = FSI_VERSION_ANY,
+	},
+	{ 0 }
+};
+
+static struct fsi_driver sbe_drv = {
+	.id_table = sbe_ids,
+	.drv = {
+		.name = "sbe",
+		.bus = &fsi_bus_type,
+		.probe = sbe_probe,
+	}
+};
+
+static int sbe_init(void)
+{
+	INIT_LIST_HEAD(&sbe_devices);
+	return fsi_driver_register(&sbe_drv);
+}
+
+static void sbe_exit(void)
+{
+	fsi_driver_unregister(&sbe_drv);
+}
+
+module_init(sbe_init);
+module_exit(sbe_exit);
+MODULE_LICENSE("GPL");
-- 
1.9.1
