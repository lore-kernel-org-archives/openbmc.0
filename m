Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str523ZFrzDsww
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=sW+zAK28; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id d132so2259987oib.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=67QGmhyFxi/SF3zACel7TkTQdYonZPpHLk114XJ6WK0=;
 b=sW+zAK28fpGdtwbfF/LskkgyLDxyYQ5t4yTmfbPBNxtpPmCTyitwD3g1IWd5c1nR3i
 hzkDRkJn3RnLXty0uTvJtvA0UgTcxEBac+DA07HwQ2PyeYjFzkGZbP5vmQurBtGsHJKI
 GnjN6QcfaaUyklz3uUtATQZ47PLwXFNGqYEN4bY8jE4B9BwSs+uKKFpmlW9/dhEXyled
 gVaytFMDSn4I8qfd1xp/5BPx+CyXumNvXrxO8cV58XZvDyW7N0F2oEVwhLxsEe2CT/2u
 glfyAoBVO3ZDY7McTfqhZlDHXweGZSZ3X2Z/qwXqazhBSHpZThXQCgqys03eL9amCOhR
 0Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=67QGmhyFxi/SF3zACel7TkTQdYonZPpHLk114XJ6WK0=;
 b=lhVuz5/+GPkb6U0Jpo7WrvdGIqQU5E8CbkXtuSQNWA8XR24HT0NUPgpnJFHwVrY2WK
 5lfbpm/VGbDx2Ej01aqXbJsbCFOalqLt/Hsa2HyiJlH4/21dOJOJUpngkqQqcLbnOskG
 GzszxstiWbtBt2fr49KJXb3negvCdfZcqWWP8tSXkLRwBiRV2wPkdRc4hNix1jYK9xQ+
 trCLZODcCVF8oFwJQZIsRTBNdOMyJDP2P86Zv6iHnYiGl4otpxXsdvUsSXqHcFkIurY1
 UypeEaxKmq8rFfoRH+HFlOeFanCQnRdjMpW2K3CKvsAaPuUEgrxjjlZ5DypoP28WWTw+
 ZUgw==
X-Gm-Message-State: AA6/9Rn2wuxoNRzSz/67oMrOyOOs799wX9OQLrTBjydnbiilbi+2GEwNCygB7S5FNWaL7A==
X-Received: by 10.157.54.153 with SMTP id h25mr2978407otc.81.1476222020793;
 Tue, 11 Oct 2016 14:40:20 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.20
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:20 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v3 18/18] drivers/fsi: Add SCOM FSI client device driver
Date: Tue, 11 Oct 2016 16:40:03 -0500
Message-Id: <1476222003-99697-19-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:23 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Create a bare bones FSI client device driver that registers
with the FSI core.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/Kconfig    |  7 ++++++
 drivers/fsi/Makefile   |  1 +
 drivers/fsi/fsi-core.c | 21 +++++++++++++++++
 drivers/fsi/fsi-scom.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fsi.h    |  3 +++
 5 files changed, 94 insertions(+)
 create mode 100644 drivers/fsi/fsi-scom.c

diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index 69e7ee8..35a8e12 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -24,6 +24,13 @@ config FSI_MASTER_GPIO
 	select GPIO_DEVRES
 	---help---
 	This option enables a FSI master driver, using GPIO lines directly.
+
+config FSI_SCOM
+	tristate "SCOM FSI client"
+	depends on FSI
+	---help---
+	This option enables the SCOM FSI client device driver.
+
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
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index c5e7441..15d8635 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -391,6 +391,27 @@ static int fsi_bus_match(struct device *dev, struct device_driver *drv)
 	return 0;
 }
 
+int fsidrv_register(struct fsi_driver *fsi_drv)
+{
+	int rc = 0;
+
+	if (!fsi_drv)
+		return -EINVAL;
+	if (!fsi_drv->id_table)
+		return -EINVAL;
+
+	rc = driver_register(&fsi_drv->drv);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(fsidrv_register);
+
+void fsidrv_unregister(struct fsi_driver *fsi_drv)
+{
+	driver_unregister(&fsi_drv->drv);
+}
+EXPORT_SYMBOL_GPL(fsidrv_unregister);
+
 struct bus_type fsi_bus_type = {
 	.name		= "fsi",
 	.match		= fsi_bus_match,
diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
new file mode 100644
index 0000000..1600f3b
--- /dev/null
+++ b/drivers/fsi/fsi-scom.c
@@ -0,0 +1,62 @@
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
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/fsi.h>
+#include <linux/module.h>
+
+#define FSI_ENGID_SCOM		5
+
+static int scom_probe(struct device *);
+
+struct fsi_device_id scom_ids[] = {
+	{
+		.engine_type = FSI_ENGID_SCOM,
+		.version = FSI_VERSION_ANY,
+	},
+	{
+		.engine_type = 0,
+	}
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
+static int scom_probe(struct device *dev)
+{
+	return 0;
+}
+
+static int scom_init(void)
+{
+	int rc;
+
+	rc = fsidrv_register(&scom_drv);
+
+	return rc;
+}
+
+static void scom_exit(void)
+{
+	fsidrv_unregister(&scom_drv);
+}
+
+module_init(scom_init);
+module_exit(scom_exit);
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 47af0af..09670b7 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -55,6 +55,9 @@ struct fsi_driver {
 #define to_fsi_dev(devp) container_of(devp, struct fsi_device, dev)
 #define to_fsi_drv(drvp) container_of(drvp, struct fsi_driver, drv)
 
+extern int fsidrv_register(struct fsi_driver *);
+extern void fsidrv_unregister(struct fsi_driver *);
+
 extern struct bus_type fsi_bus_type;
 
 #endif /* LINUX_FSI_H */
-- 
1.8.2.2
