Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svTQb2MxdzDsxq
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:42:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZJcANDmL; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id z190so4580669qkc.3
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=0O4hNT33mzcD3EBfX7hIkyQOkzz1JhrLjeCSNYHDYqE=;
 b=ZJcANDmLMRfma+lRfWoTCmKRK7tJBMyBOyKpi0lEwV9mDL1Cdy4VGGg8GvhlDK32ra
 uUKtCCqUOHEo2afz/antJRXQRbEwN/dNypGGjwO+2vEcZaaU2Sw3IRS0xLAKNxraitNH
 YwOODu/Zzb11rQ45Qj1y34M+jkWNouZ3ltElu6uhZr6ejbZW98Dn577ZL0SavJZcyF8w
 JF1xdYCD3acSW9h1HUvtPujAFWBnENB00bqAkXEeP+p6l4MDNdUsqKtA/JxBf3vv95Um
 WWSMVF/aO0JPfvaGBrm7IxtmuHaqddc7/3aI/VB6jJjgINvkNs9+AVUjQGB67qXVSC2Q
 ZSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0O4hNT33mzcD3EBfX7hIkyQOkzz1JhrLjeCSNYHDYqE=;
 b=ke/P5FtM8SOG5lmT0XbxpJm4HrOjCnEDqc/BBfN7V8TzhUxXYgWClJMVt9vbSmh0w9
 Ebgkf0+fiZc44Fk4NjUlqTJzUmLOSES/qFkj0veFZhm92HxyapoXL0Ncm6oPqs8yHXHL
 H1w4V0o7G09zi/MLsqVLDf6/oVfdcysWuAqnK29KpNUL1+sLn3fPMmIPWBLPtNPkw6VG
 ab9o+y2N9xLO1SR8hygFy86uUcGxEGLqer9fJ53wnHQydA/GjEhK2KXSzcuVVbzYTfcn
 r7lI053JP0m3ntD9gsZ69dEJ3O5zgfcfGah54ToSA8kJRATgiDC2nToG7FnPjZB8c5nT
 b7dA==
X-Gm-Message-State: AA6/9RkTgUR0CeKoJsRU/SpYhSr7moOGd4HIVcOSupRN9E58Qma84k6/OzAQIeaOIPNMmA==
X-Received: by 10.55.31.31 with SMTP id f31mr3525225qkf.245.1476312165122;
 Wed, 12 Oct 2016 15:42:45 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id d192sm3542511qkg.38.2016.10.12.15.42.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 15:42:44 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux v3 2/4] hwmon: Add OCC hwmon driver stub
Date: Wed, 12 Oct 2016 17:42:34 -0500
Message-Id: <1476312154-20130-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 22:42:48 -0000

From: "Edward A. James" <eajames@us.ibm.com>

This change creates the structure for the Power CPU on-chip controller
(OCC) driver.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/Kconfig          |   2 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/occ/Kconfig      |  15 +++++
 drivers/hwmon/occ/Makefile     |   1 +
 drivers/hwmon/occ/occ.c        | 128 +++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ.h        |  47 +++++++++++++
 drivers/hwmon/occ/occ_i2c.c    | 150 +++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/power8_occ.c |  58 ++++++++++++++++
 drivers/hwmon/occ/power8_occ.h |  25 +++++++
 9 files changed, 427 insertions(+)
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_i2c.c
 create mode 100644 drivers/hwmon/occ/power8_occ.c
 create mode 100644 drivers/hwmon/occ/power8_occ.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 367496c..f4b0180 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1226,6 +1226,8 @@ config SENSORS_NSA320
 	  This driver can also be built as a module. If so, the module
 	  will be called nsa320-hwmon.
 
+source drivers/hwmon/occ/Kconfig
+
 config SENSORS_PCF8591
 	tristate "Philips PCF8591 ADC/DAC"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d7ccb02..ab1c121 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -165,6 +165,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 
 obj-$(CONFIG_PMBUS)		+= pmbus/
+obj-$(CONFIG_OCC)		+= occ/
 
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
 
diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
new file mode 100644
index 0000000..628fd6e
--- /dev/null
+++ b/drivers/hwmon/occ/Kconfig
@@ -0,0 +1,15 @@
+#
+# On Chip Controller configuration
+#
+
+config OCC
+	tristate "On Chip Controller driver"
+	help
+	  If you say yes here you get support to monitor Power CPU
+	  sensors via the On Chip Controller (OCC).
+
+	  Generally this is used by management controllers such as a BMC
+	  on an OpenPower system.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called occ.
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
new file mode 100644
index 0000000..05b5031
--- /dev/null
+++ b/drivers/hwmon/occ/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_OCC) += occ.o occ_i2c.o power8_occ.o
diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
new file mode 100644
index 0000000..3ee4d61
--- /dev/null
+++ b/drivers/hwmon/occ/occ.c
@@ -0,0 +1,128 @@
+/*
+ * occ.c - hwmon OCC driver
+ *
+ * This file contains common methods between different host systems and bus
+ * protocols.
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
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+
+#include "occ.h"
+#include "power8_occ.h"
+
+static ssize_t show_occ_online(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct occ_driver *driver = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->occ_online);
+}
+
+static ssize_t store_occ_online(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct occ_driver *driver = dev_get_drvdata(dev);
+	unsigned long val;
+	int rc;
+
+	rc = kstrtoul(buf, 10, &val);
+	if (rc)
+		return rc;
+
+	if (val == 1) {
+		if (driver->occ_online)
+			return count;
+
+		driver->hwmon = hwmon_device_register(dev);
+		if (IS_ERR(driver->hwmon))
+			return PTR_ERR(driver->hwmon);
+
+		rc = occ_init(driver);
+		if (rc) {
+			hwmon_device_unregister(driver->hwmon);
+			driver->hwmon = NULL;
+			return rc;
+		}
+	} else if (val == 0) {
+		if (!driver->occ_online)
+			return count;
+
+		occ_exit(driver);
+		hwmon_device_unregister(driver->hwmon);
+		driver->hwmon = NULL;
+	} else
+		return -EINVAL;
+
+	driver->occ_online = val;
+	return count;
+}
+
+static DEVICE_ATTR(online, S_IWUSR | S_IRUGO, show_occ_online,
+		   store_occ_online);
+
+/*
+ * occ_probe - hardware agnostic initialization method
+ * @dev: device handle for transfer protocol
+ * @bus_ops: transfer methods to communicate with the OCC
+ * @bus: private handle for transfer protocol
+ *
+ * this initializes common aspects of the hwmon driver across bus protocols and
+ * host systems.
+ *
+ * returns negative errno on failure or 0 on success
+ */
+int occ_probe(struct device *dev, struct occ_bus_ops bus_ops, void *bus)
+{
+	struct occ_driver *driver = devm_kzalloc(dev,
+						 sizeof(struct occ_driver),
+						 GFP_KERNEL);
+
+	if (!driver)
+		return -ENOMEM;
+
+	driver->bus = bus;
+	driver->bus_ops = bus_ops;
+
+	dev_set_drvdata(dev, driver);
+
+	return device_create_file(dev, &dev_attr_online);
+}
+
+/*
+ * occ_remove - hardware agnostic exit method
+ * @dev: device handle for transfer protocol
+ *
+ * returns negative errno on failure or 0 on success
+ */
+int occ_remove(struct device *dev)
+{
+	struct occ_driver *driver = dev_get_drvdata(dev);
+
+	device_remove_file(dev, &dev_attr_online);
+
+	if (driver->hwmon) {
+		occ_exit(driver);
+		hwmon_device_unregister(driver->hwmon);
+	}
+
+	return 0;
+}
diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/occ/occ.h
new file mode 100644
index 0000000..fcbef21
--- /dev/null
+++ b/drivers/hwmon/occ/occ.h
@@ -0,0 +1,47 @@
+/*
+ * power_occ.h - hwmon OCC driver
+ *
+ * This file contains data structures and function prototypes for common access
+ * between different bus protocols and host systems.
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
+#ifndef __OCC_H__
+#define __OCC_H__
+
+struct device;
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
+/*
+ * occ_driver - structure to store all global driver data
+ */
+struct occ_driver {
+	void *bus;
+	struct occ_bus_ops bus_ops;
+	struct device *hwmon;
+	bool occ_online;
+};
+
+int occ_probe(struct device *dev, struct occ_bus_ops bus_ops, void *bus);
+int occ_remove(struct device *dev);
+
+#endif /* __OCC_H__ */
diff --git a/drivers/hwmon/occ/occ_i2c.c b/drivers/hwmon/occ/occ_i2c.c
new file mode 100644
index 0000000..40ed75d
--- /dev/null
+++ b/drivers/hwmon/occ/occ_i2c.c
@@ -0,0 +1,150 @@
+/*
+ * occ_i2c.c - hwmon OCC driver
+ *
+ * This file contains the i2c layer for accessing the OCC over i2c bus.
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
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/i2c.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include "occ.h"
+
+#define OCC_I2C_NAME	"occ-i2c"
+
+#define I2C_READ_ERROR	1
+#define I2C_WRITE_ERROR	2
+
+/*
+ * occ_getscom - helper function for scom read over i2c to OCC
+ * @bus: handle to slave device
+ * @address: address
+ * @data: where to store data read from slave; buffer size must be greater than
+ *	  or equal to offset + 8 bytes.
+ * @offset: offset into data pointer
+ *
+ * Returns 0 on success or -1 on read error, -2 on write error
+ */
+int occ_getscom(void *bus, u32 address, u8 *data, size_t offset)
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
+	*((u64 *)data) = le64_to_cpu(buf);
+
+	return 0;
+}
+
+/*
+ * occ_putscom - helper function for scom write over i2c to OCC
+ * @bus: handle to slave device
+ * @address: address
+ * @data0: first data byte to write
+ * @data1: second data byte to write
+ *
+ * Returns 0 on success or -2 on error
+ */
+int occ_putscom(void *bus, u32 address, u32 data0, u32 data1)
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
+static int occ_i2c_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct occ_bus_ops bus_ops;
+
+	bus_ops.getscom = occ_getscom;
+	bus_ops.putscom = occ_putscom;
+
+	return occ_probe(&client->dev, bus_ops, client);
+}
+
+static int occ_i2c_remove(struct i2c_client *client)
+{
+	return occ_remove(&client->dev);
+}
+
+/* used by old-style board info. */
+static const struct i2c_device_id occ_ids[] = {
+	{ OCC_I2C_NAME, 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, occ_ids);
+
+/* used by device table */
+static const struct of_device_id occ_of_match[] = {
+	{ .compatible = "ibm,occ-i2c" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, occ_of_match);
+
+/*
+ * i2c-core uses i2c-detect() to detect device in below address list.
+ * If exists, address will be assigned to client.
+ * It is also possible to read address from device table.
+ */
+static const unsigned short normal_i2c[] = {0x50, 0x51, I2C_CLIENT_END };
+
+static struct i2c_driver occ_i2c_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = OCC_I2C_NAME,
+		.pm = NULL,
+		.of_match_table = occ_of_match,
+	},
+	.probe = occ_i2c_probe,
+	.remove = occ_i2c_remove,
+	.id_table = occ_ids,
+	.address_list = normal_i2c,
+};
+
+module_i2c_driver(occ_i2c_driver);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC OCC hwmon driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/power8_occ.c b/drivers/hwmon/occ/power8_occ.c
new file mode 100644
index 0000000..15d4bde
--- /dev/null
+++ b/drivers/hwmon/occ/power8_occ.c
@@ -0,0 +1,58 @@
+/*
+ * power8_occ.c - Power8 OCC hwmon driver
+ *
+ * This file contains the Power8-specific methods and data structures for
+ * the OCC hwmon driver.
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
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+#include <linux/mutex.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include "occ.h"
+
+struct power8_driver {
+	struct occ_driver *driver;
+	struct device *dev;
+};
+
+int occ_init(struct occ_driver *driver)
+{
+	struct device *dev = driver->hwmon;
+	struct power8_driver *powr = devm_kzalloc(dev,
+						  sizeof(struct power8_driver),
+						  GFP_KERNEL);
+	if (!powr)
+		return -ENOMEM;
+
+	powr->driver = driver;
+	powr->dev = dev;
+
+	dev_set_drvdata(dev, powr);
+
+	return 0;
+}
+
+void occ_exit(struct occ_driver *driver)
+{
+}
diff --git a/drivers/hwmon/occ/power8_occ.h b/drivers/hwmon/occ/power8_occ.h
new file mode 100644
index 0000000..7df6dc1
--- /dev/null
+++ b/drivers/hwmon/occ/power8_occ.h
@@ -0,0 +1,25 @@
+/*
+ * power8_occ.h - Power8 OCC hwmon driver
+ *
+ * This file contains Power8 specific function prototypes
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
+#ifndef __POWER8_OCC_H__
+#define __POWER8_OCC_H__
+
+int occ_init(struct occ_driver *driver);
+void occ_exit(struct occ_driver *driver);
+
+#endif /* __POWER8_OCC_H__ */
-- 
1.9.1
