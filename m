Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjv0d0BzDt4x
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=HQ+fKlrz; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id i85so4554773pfa.0
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ArdRnZAPC9Zq6Ck/P2aMV5oL/Ip/zVjLYoApSMf4RDQ=;
 b=HQ+fKlrzPcSjshSsFfZh/NtKXA4Vv9YwRsJACx8xAcpjAX2TzVkiBS6ayQL7Cvo85F
 0XjCvHdFhZCfW//91C0B4LH43L3U9WBeSKvoJVvAVGEu3G5jUk4gWG3FoPA93dtAi6zn
 3y2EG8cplqkKteZXtiP32wB1HKcvhXJnKb6xlbE2H9JIsJpG0pf/3U1Q1/7Bji6ksVRj
 c81T6fYk+OLPCGB3S7R8cVyCrS7dlvSIfY7K3sIppPLt12sQrh1t+B5FawpWbls0OnAu
 jP91VTcMtqawTIE/Z0BM/X6vh/1zfCPQ7MDAfYKWzzJRbLDXYSXDYTbw39oleCvQ0epF
 CfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ArdRnZAPC9Zq6Ck/P2aMV5oL/Ip/zVjLYoApSMf4RDQ=;
 b=IPvDa3o5I/JKtrYZd7vt+8hMvd2EoASgtZvEhPyawfT2sSN4QE1EtzzCZ3R+bu8pn0
 56ffmzfzcvnE+aMFmvlfJtLHV2Tp6SHFDQzPlRzD0EFynCU1Tk093jPRBiqGVYyNz1OE
 5jKul5IZeFjrr2W436yIPotx5lPcj9TlTEjq6J1SREhRzpz5RNH8FDc8zqmS5wpFFwQh
 JTlvIDlHIEC2YhrTCMf+EOB8LstucZKvAB6DP9qQIUK9+R+AKCFLoEmL37WV6QosRIoe
 X5OrkcPbaVVEEdVhZJ/lNW7O2rQ9wWV5iICkVH9zcRiKy6hFWNOgf3DMx6ZcP6O/n34k
 3wgw==
X-Gm-Message-State: AA6/9RkAavHOU/nKEXBQYTO2b3i+g9XSOujLR0KhqCc+qgK4QUUTdh8AWvBCATniqrdk8g==
X-Received: by 10.99.110.14 with SMTP id j14mr17847585pgc.135.1476483313359;
 Fri, 14 Oct 2016 15:15:13 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.15.12
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:15:12 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v4 20/20] drivers/fsi: Add SCOM client driver
Date: Fri, 14 Oct 2016 17:14:42 -0500
Message-Id: <1476483282-85971-21-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:15 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Add a bare bones SCOM engine device driver that registers
with the FSI bus.

V4 - Add put_scom and get_scom ops

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/Kconfig    |   6 ++
 drivers/fsi/Makefile   |   1 +
 drivers/fsi/fsi-scom.c | 158 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+)
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
index 0000000..244e450
--- /dev/null
+++ b/drivers/fsi/fsi-scom.c
@@ -0,0 +1,158 @@
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
+static int scom_probe(struct device *dev)
+{
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct scom_device *scom = &scom_dev;
+	int rc;
+	uint64_t data;
+
+	scom->fsi_dev = fsi_dev;
+	scom->cdev = cdev_alloc();
+	if (!scom->cdev)
+		return -ENOMEM;
+
+	scom->cdev->owner = THIS_MODULE;
+
+	/* todo: fill in and register cdev */
+	/* open, read, write, close file ops */
+
+	/* todo: user space linkage to get_scom / put_scom */
+	/*  engine init */
+
+	/* todo: how to enter test values? */
+	rc = get_scom(&data, 0);
+	data = 0;
+	rc = put_scom(data, 0);
+
+	return 0;
+}
+
+static int scom_init(void)
+{
+	return fsidrv_register(&scom_drv);
+}
+
+static void scom_exit(void)
+{
+	fsidrv_unregister(&scom_drv);
+}
+
+module_init(scom_init);
+module_exit(scom_exit);
-- 
1.8.2.2
