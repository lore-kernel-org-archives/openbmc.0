Return-Path: <eajames.ibm@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCSx148G5zDvTG
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 10:16:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dNFInb15"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id q124so12421287itd.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 15:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=0cS2KA/wfgN5Qxjd3ZmJOwhqssjxcIGPxh8b6/R5i7g=;
 b=dNFInb15/g+23pO4Y9kj+z39v5LKUor8JYlcgWfNwTWsqyyCi0aZUYtapB78NbkWED
 9p5vVXmBDRjPdvxQ09aRhZGnpS8l3asA/na5CAgjpuOrzQOCDT2zP0Hv0cd5vXZ5wwQm
 mIW3+lemSxYUin7oP0hzNZ117txYg8jewwf6CDauUBwgQV5bJcEtZ0p9v4/VuclDV01O
 +JFb8Us2hCoXSGrnwZq6u2ssOVnccAaic8DrAPAXgYZ1efDqGW4MZWbWOkwM9mqtopIl
 6P4gqyh3/1Ssa6OXVDoI8ZZB/5RXZ+PvOBAvHPpSFeoNB0VgWaXl61fMli7IypQYzgHN
 qvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0cS2KA/wfgN5Qxjd3ZmJOwhqssjxcIGPxh8b6/R5i7g=;
 b=cLty7fDANsw30lnkZ1XYlejfUULwY5Z7R8H9pksfvtY+qc20JU2D5pY+VXjWMEpkir
 JQHGDP8ohrxhHBOz0PwIgmhPilGThQys0ThZGdJkLVOTaz+TKiWmzzc/Qid7y/2I6mur
 N8X9d7baWkpV+VwqRv4aCMYZQpLMhMbqSnAi6g9GLgXqXkCluVeGE2JRyyQK10QqRMNu
 K/z37U2V4K6m3heNR2SX4/MnOA7CiBjDXNzQqt77NgdbDgnOreJMnjcCtDD1LIqScwFf
 AkWJABM62zP+MeIzqrAwJuylSq+PhKjr+FmcM78OnRpeJZQboECi8EruXTM68IYvAeDC
 syog==
X-Gm-Message-State: ABUngvfZTP6pIdDkP5eMdd4ouydqBl6sEzVWgfpCoLts86wgx0YbTnkOFRUVP5JAinQV4g==
X-Received: by 10.107.139.74 with SMTP id n71mr11399492iod.166.1478560563808; 
 Mon, 07 Nov 2016 15:16:03 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id h142sm5647841itb.1.2016.11.07.15.16.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 07 Nov 2016 15:16:02 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v5 3/5] drivers: hwmon OCC scom bus operations
Date: Mon,  7 Nov 2016 17:15:54 -0600
Message-Id: <1478560554-24045-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Mon, 07 Nov 2016 23:16:06 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add i2c bus operations to perform scom functions

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/occ.c     | 23 ++++++++++++++-
 drivers/hwmon/occ/occ.h     |  4 ++-
 drivers/hwmon/occ/occ_i2c.c | 72 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/p8.c      |  4 +--
 drivers/hwmon/occ/p8.h      |  4 ++-
 drivers/hwmon/occ/p9.c      |  4 +--
 drivers/hwmon/occ/p9.h      |  4 ++-
 drivers/hwmon/occ/scom.h    | 31 +++++++++++++++++++
 8 files changed, 137 insertions(+), 9 deletions(-)
 create mode 100644 drivers/hwmon/occ/scom.h

diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
index 4969915..733b935c 100644
--- a/drivers/hwmon/occ/occ.c
+++ b/drivers/hwmon/occ/occ.c
@@ -30,13 +30,34 @@
 
 #include "occ.h"
 
-int occ_start(struct device *dev)
+struct occ_driver {
+	void *bus;
+	struct occ_bus_ops bus_ops;
+};
+
+int occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops)
 {
+	struct occ_driver *driver = devm_kzalloc(dev,
+						 sizeof(struct occ_driver),
+						 GFP_KERNEL);
+	if (!driver)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, driver);
+
+	driver->bus = bus;
+	driver->bus_ops = bus_ops;
+
 	return 0;
 }
 
 int occ_stop(struct device *dev)
 {
+	struct occ_driver *driver = dev_get_drvdata(dev);
+
+	if (driver)
+		devm_kfree(dev, driver);
+
 	return 0;
 }
 
diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/occ/occ.h
index 736d3b9..3232251 100644
--- a/drivers/hwmon/occ/occ.h
+++ b/drivers/hwmon/occ/occ.h
@@ -20,9 +20,11 @@
 #ifndef __OCC_H__
 #define __OCC_H__
 
+#include "scom.h"
+
 struct device;
 
-int occ_start(struct device *dev);
+int occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops);
 int occ_stop(struct device *dev);
 
 #endif /* __OCC_H__ */
diff --git a/drivers/hwmon/occ/occ_i2c.c b/drivers/hwmon/occ/occ_i2c.c
index 7659ea1..7c20bc3 100644
--- a/drivers/hwmon/occ/occ_i2c.c
+++ b/drivers/hwmon/occ/occ_i2c.c
@@ -25,14 +25,84 @@
 #include <linux/kernel.h>
 #include <linux/device.h>
 
+#include "scom.h"
 #include "p8.h"
 
 #define OCC_I2C_NAME	"occ-p8-i2c"
 
+#define I2C_READ_ERROR	1
+#define I2C_WRITE_ERROR	2
+
+/*
+ * occ_i2c_getscom - helper function for scom read over i2c to OCC
+ * @bus: handle to slave device
+ * @address: address
+ * @data: where to store data read from slave; buffer size must be greater than
+ * or equal to offset + 8 bytes.
+ * @offset: offset into data pointer
+ *
+ * Returns 0 on success or -1 on read error, -2 on write error
+ */
+int occ_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset)
+{
+	ssize_t rc;
+	u64 buf;
+	struct i2c_client *client = bus;
+
+	/* P8 i2c slave requires address to be shifted by 1 */
+	address = address << 1;
+
+	rc = i2c_master_send(client, (const char *)&address, sizeof(u32));
+	if (rc != sizeof(u32))
+		return -I2C_WRITE_ERROR;
+
+	rc = i2c_master_recv(client, (char *)&buf, sizeof(u64));
+	if (rc != sizeof(u64))
+		return -I2C_READ_ERROR;
+
+	*((u64 *)&data[offset]) = be64_to_cpu(buf);
+
+	return 0;
+}
+
+/*
+ * occ_i2c_putscom - helper function for scom write over i2c to OCC
+ * @bus: handle to slave device
+ * @address: address
+ * @data0: first data byte to write
+ * @data1: second data byte to write
+ *
+ * Returns 0 on success or -2 on error
+ */
+int occ_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
+{
+	u32 buf[3];
+	ssize_t rc;
+	struct i2c_client *client = bus;
+
+	/* P8 i2c slave requires address to be shifted by 1 */
+	address = address << 1;
+
+	buf[0] = address;
+	buf[1] = data1;
+	buf[2] = data0;
+
+	rc = i2c_master_send(client, (const char *)buf, sizeof(u32) * 3);
+	if (rc != sizeof(u32) * 3)
+		return -I2C_WRITE_ERROR;
+
+	return 0;
+}
+
 static int occ_i2c_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
-	return p8_occ_start(&client->dev);
+	struct occ_bus_ops bus_ops;
+
+	bus_ops.getscom = occ_i2c_getscom;
+	bus_ops.putscom = occ_i2c_putscom;
+
+	return p8_occ_start(&client->dev, client, bus_ops);
 }
 
 static int occ_i2c_remove(struct i2c_client *client)
diff --git a/drivers/hwmon/occ/p8.c b/drivers/hwmon/occ/p8.c
index 6d854bc..6ff6764 100644
--- a/drivers/hwmon/occ/p8.c
+++ b/drivers/hwmon/occ/p8.c
@@ -28,9 +28,9 @@
 
 #include "occ.h"
 
-int p8_occ_start(struct device *dev)
+int p8_occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops)
 {
-	return occ_start(dev);
+	return occ_start(dev, bus, bus_ops);
 }
 
 int p8_occ_stop(struct device *dev)
diff --git a/drivers/hwmon/occ/p8.h b/drivers/hwmon/occ/p8.h
index e6941e4..91190d2 100644
--- a/drivers/hwmon/occ/p8.h
+++ b/drivers/hwmon/occ/p8.h
@@ -19,9 +19,11 @@
 #ifndef __P8_H__
 #define __P8_H__
 
+#include "scom.h"
+
 struct device;
 
-int p8_occ_start(struct device *dev);
+int p8_occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops);
 int p8_occ_stop(struct device *dev);
 
 #endif /* __P8_H__ */
diff --git a/drivers/hwmon/occ/p9.c b/drivers/hwmon/occ/p9.c
index 065d9bb..f1aa8ac 100644
--- a/drivers/hwmon/occ/p9.c
+++ b/drivers/hwmon/occ/p9.c
@@ -28,9 +28,9 @@
 
 #include "occ.h"
 
-int p9_occ_start(struct device *dev)
+int p9_occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops)
 {
-	return occ_start(dev);
+	return occ_start(dev, bus, bus_ops);
 }
 
 int p9_occ_stop(struct device *dev)
diff --git a/drivers/hwmon/occ/p9.h b/drivers/hwmon/occ/p9.h
index 62fe95a..0de37fa 100644
--- a/drivers/hwmon/occ/p9.h
+++ b/drivers/hwmon/occ/p9.h
@@ -19,9 +19,11 @@
 #ifndef __P9_H__
 #define __P9_H__
 
+#include "scom.h"
+
 struct device;
 
-int p9_occ_start(struct device *dev);
+int p9_occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops);
 int p9_occ_stop(struct device *dev);
 
 #endif /* __P9_H__ */
diff --git a/drivers/hwmon/occ/scom.h b/drivers/hwmon/occ/scom.h
new file mode 100644
index 0000000..7732c71
--- /dev/null
+++ b/drivers/hwmon/occ/scom.h
@@ -0,0 +1,31 @@
+/*
+ * scom.h - hwmon OCC driver
+ *
+ * This file contains data structures for scom operations to the OCC
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __SCOM_H__
+#define __SCOM_H__
+
+/*
+ * occ_bus_ops - represent the low-level transfer methods to communicate with
+ * the OCC.
+ */
+struct occ_bus_ops {
+	int (*getscom)(void *bus, u32 address, u8 *data, size_t offset);
+	int (*putscom)(void *bus, u32 address, u32 data0, u32 data1);
+};
+
+#endif /* __SCOM_H__ */
-- 
1.9.1
