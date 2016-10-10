Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st8kp4s7qzDskb
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 06:07:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=0E+YJ+J5; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id g49so3710022qtc.2
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 12:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=tgGZmWVi7kmPDckZs9d06a36HxXCGX5gPkWzYyrg/wU=;
 b=0E+YJ+J59h6bQg+mVyuFk/o/pwiHCF3+K48OELw8eUOFDKCXLWPFGyjbpYr0VWu80b
 uzMZGg/H/CzkPBh40YqV0Qzj+crMbdvJyRLVHP9mxZGazm8BC//N/7zSSF2dPvh5ZqJG
 g6KWXKU9toh9tZrTI4iuK15u5l1XvbwZ5b09LcTv51+EXFTow9O8SaZhIGzuCUqGRqJE
 s3KKn8wU8IqJv1Q2WpRAwBxQST9jGjZFHGciIYgvnAPdXy8Ff83+3iCM+olBODh+y/eO
 Uu+Dx1wfIwV+HnIulJ6vCXL7+6dECi6fWZw/pMG1NeJfsgQw/ESgIqiNhCNwelDuufcg
 1gSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tgGZmWVi7kmPDckZs9d06a36HxXCGX5gPkWzYyrg/wU=;
 b=Rb9uj5nPPuc4ll7ncxUVEYpMA4Io+jx0QdA8aag7Ie1BQfmIdGVLEHHT9mmsjGz25D
 UblN0eCaQbvr4RZmEkN+ZacivxjuQldSdPQP8l21m/tuW8Lqdb3BLrIjEdYD7u2cgTRh
 qC2jaUxtlFY5oZmJEYCHI79JVQwjysaXX4969a6+grtLvXBjDjuFQZhvmxca2E2cEaCl
 i75kYNmh+H2EAn0Er29t2zQRjV6OwZbAORautCSfeOXwHn6yXbgJMcWmVpVEt7jNtRWj
 FKq2rIz2v7ScBA+6pQxm50FOz+y3nqpcpsWoC1IpVFqGk6AqvpKFb5xmXWIEZuhaQ9nq
 eI8g==
X-Gm-Message-State: AA6/9RkPpQyzJQ7D3Yrz0YnS554J1PN4TmhQf1XIfQYwOXTifh4ttB1z8mwOU3IpCySdsg==
X-Received: by 10.237.53.84 with SMTP id b20mr33685363qte.92.1476126431593;
 Mon, 10 Oct 2016 12:07:11 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.51])
 by smtp.gmail.com with ESMTPSA id 53sm7726422qtm.31.2016.10.10.12.07.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Oct 2016 12:07:10 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux v1 2/2] drivers: occ hwmon - isolate bus transfer protocol
Date: Mon, 10 Oct 2016 14:07:01 -0500
Message-Id: <1476126421-18039-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Mon, 10 Oct 2016 19:07:15 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/Kconfig          |  13 +-
 drivers/hwmon/Makefile         |   2 +-
 drivers/hwmon/occ/Kconfig      |  15 +
 drivers/hwmon/occ/Makefile     |   1 +
 drivers/hwmon/occ/occ.c        | 127 ++++++
 drivers/hwmon/occ/occ.h        |  50 +++
 drivers/hwmon/occ/occ_i2c.c    | 191 ++++++++
 drivers/hwmon/occ/power8_occ.c | 970 ++++++++++++++++-------------------------
 drivers/hwmon/occ/power8_occ.h |  24 +
 9 files changed, 792 insertions(+), 601 deletions(-)
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_i2c.c
 create mode 100644 drivers/hwmon/occ/power8_occ.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3b34ba9..0ef3690 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1216,18 +1216,7 @@ config SENSORS_NSA320
 	  This driver can also be built as a module. If so, the module
 	  will be called nsa320-hwmon.
 
-config SENSORS_POWER8_OCC_I2C
-	tristate "Power8 On Chip Controller i2c driver"
-	depends on I2C
-	help
-	  If you say yes here you get support to monitor Power8 CPU
-	  sensors via the On Chip Controller (OCC) over the i2c bus.
-
-	  Generally this is used by management controllers such as a BMC
-	  on an OpenPower system.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called power8_occ_i2c.
+source drivers/hwmon/occ/Kconfig
 
 config SENSORS_PCF8591
 	tristate "Philips PCF8591 ADC/DAC"
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index c0f3201..7f61e31 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -127,7 +127,6 @@ obj-$(CONFIG_SENSORS_NCT7802)	+= nct7802.o
 obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
 obj-$(CONFIG_SENSORS_NSA320)	+= nsa320-hwmon.o
 obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+= ntc_thermistor.o
-obj-$(CONFIG_SENSORS_POWER8_OCC_I2C)	+= power8_occ_i2c.o
 obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
 obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
 obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
@@ -165,6 +164,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 
 obj-$(CONFIG_PMBUS)		+= pmbus/
+obj-$(CONFI_OCC)		+= occ/
 
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
index 0000000..9eeacca
--- /dev/null
+++ b/drivers/hwmon/occ/occ.c
@@ -0,0 +1,127 @@
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
+
+#include "occ.h"
+#include "power8_occ.h"
+
+static ssize_t show_occ_online(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct occ_driver *driver = (struct occ_driver *)dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", driver->occ_online);
+}
+
+static ssize_t store_occ_online(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct occ_driver *driver = (struct occ_driver *)dev_get_drvdata(dev);
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
+ * occ_common_probe - hardware agnostic initialization method
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
+ * occ_common_remove - hardware agnostic exit method
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
+		hwmon_device_unregister(driver->hwmon);
+		occ_remove_hwmon_attrs(driver);
+	}
+
+	return 0;
+}
diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/occ/occ.h
new file mode 100644
index 0000000..788339f
--- /dev/null
+++ b/drivers/hwmon/occ/occ.h
@@ -0,0 +1,50 @@
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
+	ssize_t (*read)(void *bus, void *buf, size_t count);
+	ssize_t (*write)(void *bus, void *buf, size_t count);
+	int (*getscom)(void *bus, uint32_t address, uint8_t *data, int offset);
+	int (*putscom)(void *bus, uint32_t address, uint8_t data0,
+		       uint8_t data1);
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
index 0000000..739642b
--- /dev/null
+++ b/drivers/hwmon/occ/occ_i2c.c
@@ -0,0 +1,191 @@
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
+#define OCC_DATA_MAX	4096
+#define I2C_READ_ERROR	1
+#define I2C_WRITE_ERROR	2
+
+/*
+ * occ_i2c_read - wrapper for i2c_master_recv
+ * @bus: handle to slave device
+ * @buf: where to store data read from slave
+ * @count: how many bytes to read
+ *
+ * Returns negative errno or else the number of bytes successfully read
+ */
+ssize_t occ_i2c_read(void *bus, void *buf, size_t count)
+{
+	struct i2c_client *client = bus;
+
+	WARN_ON(count > OCC_DATA_MAX);
+
+	dev_dbg(&client->dev, "i2c_read: reading %zu bytes @0x%x.\n",
+		count, client->addr);
+	return i2c_master_recv(client, buf, count);
+}
+
+/*
+ * occ_i2c_read - wrapper for i2c_master_send
+ * @bus: handle to slave device
+ * @buf: data that will be written to the slave
+ * @count: how many bytes to write
+ *
+ * Returns negative errno or else the number of bytes successfully written
+ */
+ssize_t occ_i2c_write(void *bus, void *buf, size_t count)
+{
+	struct i2c_client *client = bus;
+
+	WARN_ON(count > OCC_DATA_MAX);
+
+	dev_dbg(&client->dev, "i2c_write: writing %zu bytes @0x%x.\n",
+		count, client->addr);
+	return i2c_master_send(client, buf, count);
+}
+
+/*
+ * occ_getscom - helper function for scom read over i2c to OCC
+ * @bus: handle to slave device
+ * @address: address
+ * @data: where to store data read from slave
+ * @offset: offset into data pointer
+ *
+ * Returns 0 on success or -1 on read error, -2 on write error
+ */
+int occ_getscom(void *bus, uint32_t address, uint8_t *data, int offset)
+{
+	ssize_t rc;
+	char buf[8];
+	int i;
+
+	/* P8 i2c slave requires address to be shifted by 1 */
+	address = address << 1;
+
+	rc = occ_i2c_write(client, &address, sizeof(uint32_t));
+
+	if (rc != sizeof(address))
+		return -I2C_WRITE_ERROR;
+
+	rc = occ_i2c_read(bus, buf, sizeof(buf));
+	if (rc != sizeof(buf))
+		return -I2C_READ_ERROR;
+
+	for (i = 0; i < 8; i++)
+		data[offset + i] = buf[7 - i];
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
+int occ_putscom(void *bus, uint32_t address, uint32_t data0, uint32_t data1)
+{
+	uint32_t buf[3];
+	ssize_t rc;
+
+	/* P8 i2c slave requires address to be shifted by 1 */
+	address = address << 1;
+
+	buf[0] = address;
+	buf[1] = data1;
+	buf[2] = data0;
+
+	rc = occ_i2c_write(bus, buf, sizeof(buf));
+	if (rc != sizeof(buf))
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
+	bus_ops.read = occ_i2c_read;
+	bus_ops.write = occ_i2c_write;
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
index 6de0e76..7dec2e7 100644
--- a/drivers/hwmon/occ/power8_occ.c
+++ b/drivers/hwmon/occ/power8_occ.c
@@ -1,8 +1,10 @@
 /*
- * OCC HWMON driver - read IBM Power8 On Chip Controller sensor data via
- * i2c.
+ * power8_occ.c - Power8 OCC hwmon driver
  *
- * Copyright 2015 IBM Corp.
+ * This file contains the Power8-specific methods and data structures for
+ * the OCC hwmon driver.
+ *
+ * Copyright 2016 IBM Corp.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -19,24 +21,14 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
-#include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/device.h>
 
-#define OCC_I2C_ADDR 0x50
-#define OCC_I2C_NAME "occ-i2c"
-
-#define OCC_DATA_MAX	4096 /* 4KB at most */
-/* i2c read and write occ sensors */
-#define I2C_READ_ERROR	1
-#define I2C_WRITE_ERROR	2
-
 /* Defined in POWER8 Processor Registers Specification */
 /* To generate attn to OCC */
 #define ATTN_DATA	0x0006B035
@@ -53,11 +45,11 @@
 
 #define MAX_SENSOR_ATTR_LEN	32
 
-enum sensor_t {
-	freq,
-	temp,
-	power,
-	caps,
+enum sensor_type {
+	FREQ = 0,
+	TEMP,
+	POWER,
+	CAPS,
 	MAX_OCC_SENSOR_TYPE
 };
 
@@ -125,7 +117,7 @@ struct occ_response {
 };
 
 struct sensor_attr_data {
-	enum sensor_t type;
+	enum sensor_type type;
 	uint32_t hwmon_index;
 	uint32_t attr_id;
 	char name[MAX_SENSOR_ATTR_LEN];
@@ -138,112 +130,44 @@ struct sensor_group {
 	struct attribute_group group;
 };
 
-/* data private to each client */
-struct occ_drv_data {
-	struct i2c_client	*client;
-	struct device		*hwmon_dev;
-	struct mutex		update_lock;
-	bool			valid;
-	unsigned long		last_updated;
-	/* Minimum timer interval for sampling In jiffies */
-	unsigned long		update_interval;
-	unsigned long		occ_online;
-	uint16_t		user_powercap;
-	struct occ_response	occ_resp;
-	struct sensor_group	sensor_groups[MAX_OCC_SENSOR_TYPE];
+struct power8_occ_driver {
+	struct occ_driver *driver;
+	struct device *dev;
+	struct mutex update_lock;
+	bool valid;
+	unsigned long last_updated;
+	unsigned long update_interval; /* minimum interval in jiffies */
+	uint16_t user_powercap;
+	struct occ_response response;
+	struct sensor_group sensor_groups[MAX_OCC_SENSOR_TYPE];
 };
 
-static void deinit_occ_resp_buf(struct occ_response *p)
+static void deinit_occ_resp_buf(struct occ_response *resp)
 {
 	int i;
 
-	if (!p)
+	if (!resp)
 		return;
 
-	if (!p->blocks)
+	if (!resp->blocks)
 		return;
 
-	for (i = 0; i < p->header.sensor_block_num; i++) {
-		kfree(p->blocks[i].sensor);
-		kfree(p->blocks[i].power);
-		kfree(p->blocks[i].caps);
+	for (i = 0; i < resp->header.sensor_block_num; ++i) {
+		kfree(resp->blocks[i].sensor);
+		kfree(resp->blocks[i].power);
+		kfree(resp->blocks[i].caps);
 	}
 
-	kfree(p->blocks);
-
-	memset(p, 0, sizeof(*p));
-
-	for (i = 0; i < ARRAY_SIZE(p->sensor_block_id); i++)
-		p->sensor_block_id[i] = -1;
-}
-
-static ssize_t occ_i2c_read(struct i2c_client *client, void *buf, size_t count)
-{
-	WARN_ON(count > OCC_DATA_MAX);
-
-	dev_dbg(&client->dev, "i2c_read: reading %zu bytes @0x%x.\n",
-		count, client->addr);
-	return i2c_master_recv(client, buf, count);
-}
-
-static ssize_t occ_i2c_write(struct i2c_client *client, const void *buf,
-				size_t count)
-{
-	WARN_ON(count > OCC_DATA_MAX);
-
-	dev_dbg(&client->dev, "i2c_write: writing %zu bytes @0x%x.\n",
-		count, client->addr);
-	return i2c_master_send(client, buf, count);
-}
-
-/* read 8-byte value and put into data[offset] */
-static int occ_getscomb(struct i2c_client *client, uint32_t address,
-		uint8_t *data, int offset)
-{
-	uint32_t ret;
-	char buf[8];
-	int i;
-
-	/* P8 i2c slave requires address to be shifted by 1 */
-	address = address << 1;
-
-	ret = occ_i2c_write(client, &address,
-		sizeof(address));
-
-	if (ret != sizeof(address))
-		return -I2C_WRITE_ERROR;
-
-	ret = occ_i2c_read(client, buf, sizeof(buf));
-	if (ret != sizeof(buf))
-		return -I2C_READ_ERROR;
-
-	for (i = 0; i < 8; i++)
-		data[offset + i] = buf[7 - i];
-
-	return 0;
-}
-
-static int occ_putscom(struct i2c_client *client, uint32_t address,
-		uint32_t data0, uint32_t data1)
-{
-	uint32_t buf[3];
-	uint32_t ret;
+	kfree(resp->blocks);
 
-	/* P8 i2c slave requires address to be shifted by 1 */
-	address = address << 1;
+	memset(resp, 0, sizeof(struct occ_response));
 
-	buf[0] = address;
-	buf[1] = data1;
-	buf[2] = data0;
-
-	ret = occ_i2c_write(client, buf, sizeof(buf));
-	if (ret != sizeof(buf))
-		return I2C_WRITE_ERROR;
-
-	return 0;
+	for (i = 0; i < MAX_OCC_SENSOR_TYPE; ++i)
+		resp->sensor_block_id[i] = -1;
 }
 
-static void *occ_get_sensor_by_type(struct occ_response *resp, enum sensor_t t)
+static void *occ_get_sensor_by_type(struct occ_response *resp,
+				    enum sensor_type t)
 {
 	void *sensor;
 
@@ -254,14 +178,14 @@ static void *occ_get_sensor_by_type(struct occ_response *resp, enum sensor_t t)
 		return NULL;
 
 	switch (t) {
-	case temp:
-	case freq:
+	case TEMP:
+	case FREQ:
 		sensor = resp->blocks[resp->sensor_block_id[t]].sensor;
 		break;
-	case power:
+	case POWER:
 		sensor = resp->blocks[resp->sensor_block_id[t]].power;
 		break;
-	case caps:
+	case CAPS:
 		sensor = resp->blocks[resp->sensor_block_id[t]].caps;
 		break;
 	default:
@@ -272,10 +196,10 @@ static void *occ_get_sensor_by_type(struct occ_response *resp, enum sensor_t t)
 }
 
 static int occ_renew_sensor(struct occ_response *resp, uint8_t sensor_length,
-	uint8_t sensor_num, enum sensor_t t, int block)
+			    uint8_t sensor_num, enum sensor_type t, int block)
 {
 	void *sensor;
-	int ret;
+	int rc;
 
 	sensor = occ_get_sensor_by_type(resp, t);
 
@@ -286,40 +210,40 @@ static int occ_renew_sensor(struct occ_response *resp, uint8_t sensor_length,
 	}
 
 	if (!sensor || sensor_num !=
-			resp->blocks[resp->sensor_block_id[t]].sensor_num) {
+	    resp->blocks[resp->sensor_block_id[t]].sensor_num) {
 		kfree(sensor);
 		switch (t) {
-		case temp:
-		case freq:
+		case TEMP:
+		case FREQ:
 			resp->blocks[block].sensor =
-				kcalloc(sensor_num,
-					sizeof(struct occ_sensor), GFP_KERNEL);
+				kcalloc(sensor_num, sizeof(struct occ_sensor),
+					GFP_KERNEL);
 			if (!resp->blocks[block].sensor) {
-				ret = -ENOMEM;
+				rc = -ENOMEM;
 				goto err;
 			}
 			break;
-		case power:
+		case POWER:
 			resp->blocks[block].power =
 				kcalloc(sensor_num,
 					sizeof(struct power_sensor),
 					GFP_KERNEL);
 			if (!resp->blocks[block].power) {
-				ret = -ENOMEM;
+				rc = -ENOMEM;
 				goto err;
 			}
 			break;
-		case caps:
+		case CAPS:
 			resp->blocks[block].caps =
-				kcalloc(sensor_num,
-					sizeof(struct caps_sensor), GFP_KERNEL);
+				kcalloc(sensor_num, sizeof(struct caps_sensor),
+					GFP_KERNEL);
 			if (!resp->blocks[block].caps) {
-				ret = -ENOMEM;
+				rc = -ENOMEM;
 				goto err;
 			}
 			break;
 		default:
-			ret = -ENOMEM;
+			rc = -ENOMEM;
 			goto err;
 		}
 	}
@@ -327,7 +251,7 @@ static int occ_renew_sensor(struct occ_response *resp, uint8_t sensor_length,
 	return 0;
 err:
 	deinit_occ_resp_buf(resp);
-	return ret;
+	return rc;
 }
 
 #define RESP_DATA_LENGTH	3
@@ -341,12 +265,12 @@ static inline uint16_t get_occdata_length(uint8_t *data)
 	return be16_to_cpup((const __be16 *)&data[RESP_DATA_LENGTH]);
 }
 
-static int parse_occ_response(struct i2c_client *client,
-		uint8_t *data, struct occ_response *resp)
+static int parse_occ_response(struct power8_occ_driver *driver, uint8_t *data,
+			      struct occ_response *resp)
 {
 	int b;
 	int s;
-	int ret;
+	int rc;
 	int dnum = SENSOR_BLOCK_OFFSET;
 	struct occ_sensor *f_sensor;
 	struct occ_sensor *t_sensor;
@@ -357,19 +281,19 @@ static int parse_occ_response(struct i2c_client *client,
 	uint8_t sensor_format;
 	uint8_t sensor_length;
 	uint8_t sensor_num;
+	struct device *dev = driver->dev;
 
 	/* check if the data is valid */
 	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) != 0) {
-		dev_dbg(&client->dev,
-			"ERROR: no SENSOR String in response\n");
-		ret = -1;
+		dev_dbg(dev, "ERROR: no SENSOR String in response\n");
+		rc = -1;
 		goto err;
 	}
 
 	sensor_block_num = data[SENSOR_BLOCK_NUM_OFFSET];
 	if (sensor_block_num == 0) {
-		dev_dbg(&client->dev, "ERROR: SENSOR block num is 0\n");
-		ret = -1;
+		dev_dbg(dev, "ERROR: SENSOR block num is 0\n");
+		rc = -1;
 		goto err;
 	}
 
@@ -377,93 +301,94 @@ static int parse_occ_response(struct i2c_client *client,
 	if (sensor_block_num != resp->header.sensor_block_num) {
 		deinit_occ_resp_buf(resp);
 		resp->blocks = kcalloc(sensor_block_num,
-			sizeof(struct sensor_data_block), GFP_KERNEL);
+				       sizeof(struct sensor_data_block),
+				       GFP_KERNEL);
 		if (!resp->blocks)
 			return -ENOMEM;
 	}
 
-	memcpy(&resp->header, &data[RESP_HEADER_OFFSET], sizeof(resp->header));
+	memcpy(&resp->header, &data[RESP_HEADER_OFFSET],
+	       sizeof(struct occ_poll_header));
 	resp->header.error_log_addr_start =
 		be32_to_cpu(resp->header.error_log_addr_start);
 	resp->header.error_log_length =
 		be16_to_cpu(resp->header.error_log_length);
 
-	dev_dbg(&client->dev, "Reading %d sensor blocks\n",
+	dev_dbg(dev, "Reading %d sensor blocks\n",
 		resp->header.sensor_block_num);
 	for (b = 0; b < sensor_block_num; b++) {
 		/* 8-byte sensor block head */
 		strncpy(sensor_type, &data[dnum], 4);
-		sensor_format = data[dnum+5];
-		sensor_length = data[dnum+6];
-		sensor_num = data[dnum+7];
+		sensor_format = data[dnum + 5];
+		sensor_length = data[dnum + 6];
+		sensor_num = data[dnum + 7];
 		dnum = dnum + 8;
 
-		dev_dbg(&client->dev,
-			"sensor block[%d]: type: %s, sensor_num: %d\n",
-			b, sensor_type, sensor_num);
+		dev_dbg(dev, "sensor block[%d]: type: %s, sensor_num: %d\n", b,
+			sensor_type, sensor_num);
 
 		if (strncmp(sensor_type, "FREQ", 4) == 0) {
-			ret = occ_renew_sensor(resp, sensor_length,
-				sensor_num, freq, b);
-			if (ret)
+			rc = occ_renew_sensor(resp, sensor_length, sensor_num,
+					      FREQ, b);
+			if (rc)
 				continue;
 
-			resp->sensor_block_id[freq] = b;
+			resp->sensor_block_id[FREQ] = b;
 			for (s = 0; s < sensor_num; s++) {
 				f_sensor = &resp->blocks[b].sensor[s];
 				f_sensor->sensor_id =
 					be16_to_cpup((const __be16 *)
-							&data[dnum]);
+						     &data[dnum]);
 				f_sensor->value = be16_to_cpup((const __be16 *)
-							&data[dnum+2]);
-				dev_dbg(&client->dev,
+							      &data[dnum + 2]);
+				dev_dbg(dev,
 					"sensor[%d]-[%d]: id: %u, value: %u\n",
 					b, s, f_sensor->sensor_id,
 					f_sensor->value);
 				dnum = dnum + sensor_length;
 			}
 		} else if (strncmp(sensor_type, "TEMP", 4) == 0) {
-			ret = occ_renew_sensor(resp, sensor_length,
-				sensor_num, temp, b);
-			if (ret)
+			rc = occ_renew_sensor(resp, sensor_length,
+				sensor_num, TEMP, b);
+			if (rc)
 				continue;
 
-			resp->sensor_block_id[temp] = b;
+			resp->sensor_block_id[TEMP] = b;
 			for (s = 0; s < sensor_num; s++) {
 				t_sensor = &resp->blocks[b].sensor[s];
 				t_sensor->sensor_id =
 					be16_to_cpup((const __be16 *)
-							&data[dnum]);
+						     &data[dnum]);
 				t_sensor->value = be16_to_cpup((const __be16 *)
-							&data[dnum+2]);
-				dev_dbg(&client->dev,
+							      &data[dnum + 2]);
+				dev_dbg(dev,
 					"sensor[%d]-[%d]: id: %u, value: %u\n",
 					b, s, t_sensor->sensor_id,
 					t_sensor->value);
 				dnum = dnum + sensor_length;
 			}
 		} else if (strncmp(sensor_type, "POWR", 4) == 0) {
-			ret = occ_renew_sensor(resp, sensor_length,
-				sensor_num, power, b);
-			if (ret)
+			rc = occ_renew_sensor(resp, sensor_length,
+				sensor_num, POWER, b);
+			if (rc)
 				continue;
 
-			resp->sensor_block_id[power] = b;
+			resp->sensor_block_id[POWER] = b;
 			for (s = 0; s < sensor_num; s++) {
 				p_sensor = &resp->blocks[b].power[s];
 				p_sensor->sensor_id =
 					be16_to_cpup((const __be16 *)
-							&data[dnum]);
+						     &data[dnum]);
 				p_sensor->update_tag =
 					be32_to_cpup((const __be32 *)
-							&data[dnum+2]);
+						     &data[dnum + 2]);
 				p_sensor->accumulator =
 					be32_to_cpup((const __be32 *)
-							&data[dnum+6]);
+						     &data[dnum + 6]);
 				p_sensor->value = be16_to_cpup((const __be16 *)
-							&data[dnum+10]);
+							     &data[dnum + 10]);
 
-				dev_dbg(&client->dev,
+				dev_dbg(dev,
 					"sensor[%d]-[%d]: id: %u, value: %u\n",
 					b, s, p_sensor->sensor_id,
 					p_sensor->value);
@@ -471,55 +396,53 @@ static int parse_occ_response(struct i2c_client *client,
 				dnum = dnum + sensor_length;
 			}
 		} else if (strncmp(sensor_type, "CAPS", 4) == 0) {
-			ret = occ_renew_sensor(resp, sensor_length,
-				sensor_num, caps, b);
-			if (ret)
+			rc = occ_renew_sensor(resp, sensor_length,
+				sensor_num, CAPS, b);
+			if (rc)
 				continue;
 
-			resp->sensor_block_id[caps] = b;
+			resp->sensor_block_id[CAPS] = b;
 			for (s = 0; s < sensor_num; s++) {
 				c_sensor = &resp->blocks[b].caps[s];
 				c_sensor->curr_powercap =
 					be16_to_cpup((const __be16 *)
-							&data[dnum]);
+						     &data[dnum]);
 				c_sensor->curr_powerreading =
 					be16_to_cpup((const __be16 *)
-							&data[dnum+2]);
+						     &data[dnum + 2]);
 				c_sensor->norm_powercap =
 					be16_to_cpup((const __be16 *)
-							&data[dnum+4]);
+						     &data[dnum + 4]);
 				c_sensor->max_powercap =
 					be16_to_cpup((const __be16 *)
-							&data[dnum+6]);
+						     &data[dnum + 6]);
 				c_sensor->min_powercap =
 					be16_to_cpup((const __be16 *)
-							&data[dnum+8]);
+						     &data[dnum + 8]);
 				c_sensor->user_powerlimit =
 					be16_to_cpup((const __be16 *)
-							&data[dnum+10]);
+						     &data[dnum + 10]);
 
 				dnum = dnum + sensor_length;
-				dev_dbg(&client->dev, "CAPS sensor #%d:\n", s);
-				dev_dbg(&client->dev, "curr_powercap is %x\n",
+				dev_dbg(dev, "CAPS sensor #%d:\n", s);
+				dev_dbg(dev, "curr_powercap is %x\n",
 					c_sensor->curr_powercap);
-				dev_dbg(&client->dev,
-					"curr_powerreading is %x\n",
+				dev_dbg(dev, "curr_powerreading is %x\n",
 					c_sensor->curr_powerreading);
-				dev_dbg(&client->dev, "norm_powercap is %x\n",
+				dev_dbg(dev, "norm_powercap is %x\n",
 					c_sensor->norm_powercap);
-				dev_dbg(&client->dev, "max_powercap is %x\n",
+				dev_dbg(dev, "max_powercap is %x\n",
 					c_sensor->max_powercap);
-				dev_dbg(&client->dev, "min_powercap is %x\n",
+				dev_dbg(dev, "min_powercap is %x\n",
 					c_sensor->min_powercap);
-				dev_dbg(&client->dev, "user_powerlimit is %x\n",
+				dev_dbg(dev, "user_powerlimit is %x\n",
 					c_sensor->user_powerlimit);
 			}
 
 		} else {
-			dev_dbg(&client->dev,
-				"ERROR: sensor type %s not supported\n",
+			dev_dbg(dev, "ERROR: sensor type %s not supported\n",
 				resp->blocks[b].sensor_type);
-			ret = -1;
+			rc = -1;
 			goto err;
 		}
 
@@ -532,15 +455,15 @@ static int parse_occ_response(struct i2c_client *client,
 	return 0;
 err:
 	deinit_occ_resp_buf(resp);
-	return ret;
+	return rc;
 }
 
-
-/* Refer to OCC interface document for OCC command format
+/*
+ * Refer to OCC interface document for OCC command format
  * https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Interfaces.pdf
  */
-static uint8_t occ_send_cmd(struct i2c_client *client, uint8_t seq,
-		uint8_t type, uint16_t length, uint8_t *data, uint8_t *resp)
+static uint8_t occ_send_cmd(struct occ_driver *occ, uint8_t seq, uint8_t type,
+			    uint16_t length, uint8_t *data, uint8_t *resp)
 {
 	uint32_t cmd1, cmd2;
 	uint16_t checksum;
@@ -560,146 +483,152 @@ static uint8_t occ_send_cmd(struct i2c_client *client, uint8_t seq,
 	cmd2 |= checksum << ((2 - length) * 8);
 
 	/* Init OCB */
-	occ_putscom(client, OCB_STATUS_CONTROL_OR,  0x08000000, 0x00000000);
-	occ_putscom(client, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF, 0xFFFFFFFF);
+	occ->bus_ops.putscom(occ->bus, OCB_STATUS_CONTROL_OR,  0x08000000,
+			     0x00000000);
+	occ->bus_ops.putscom(occ->bus, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF,
+			     0xFFFFFFFF);
 
 	/* Send command */
-	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
-	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
-	occ_putscom(client, OCB_DATA, cmd1, cmd2);
+	occ->bus_ops.putscom(occ->bus, OCB_ADDRESS, OCC_COMMAND_ADDR,
+			     0x00000000);
+	occ->bus_ops.putscom(occ->bus, OCB_ADDRESS, OCC_COMMAND_ADDR,
+			     0x00000000);
+	occ->bus_ops.putscom(occ->bus, OCB_DATA, cmd1, cmd2);
 
 	/* Trigger attention */
-	occ_putscom(client, ATTN_DATA, 0x01010000, 0x00000000);
+	occ->bus_ops.putscom(occ->bus, ATTN_DATA, 0x01010000, 0x00000000);
 
 	/* Get response data */
-	occ_putscom(client, OCB_ADDRESS, OCC_RESPONSE_ADDR, 0x00000000);
-	occ_getscomb(client, OCB_DATA, resp, 0);
+	occ->bus_ops.putscom(occ->bus, OCB_ADDRESS, OCC_RESPONSE_ADDR,
+			     0x00000000);
+	occ->bus_ops.getscom(occ->bus, OCB_DATA, resp, 0);
 
 	/* return status */
 	return resp[2];
 }
 
-static int occ_get_all(struct i2c_client *client, struct occ_response *occ_resp)
+static int occ_get_all(struct power8_occ_driver *driver)
 {
+	int i, rc;
 	uint8_t *occ_data;
 	uint16_t num_bytes;
-	int i;
-	int ret;
-	uint8_t poll_cmd_data;
-
-	poll_cmd_data = 0x10;
+	uint8_t poll_cmd_data = 0x10;
+	struct device *dev = driver->dev;
+	struct occ_driver *occ = driver->driver;
+	struct occ_response *response = &driver->response;
 
 	/*
 	 * TODO: fetch header, and then allocate the rest of the buffer based
 	 * on the header size. Assuming the OCC has a fixed sized header
 	 */
-	occ_data = devm_kzalloc(&client->dev, OCC_DATA_MAX, GFP_KERNEL);
+	occ_data = devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
+	if (!occ_data)
+		return -ENOMEM;
 
-	ret = occ_send_cmd(client, 0, 0, 1, &poll_cmd_data, occ_data);
-	if (ret) {
-		dev_err(&client->dev, "ERROR: OCC Poll: 0x%x\n", ret);
-		ret = -EINVAL;
+	rc = occ_send_cmd(occ, 0, 0, 1, &poll_cmd_data, occ_data);
+	if (rc) {
+		dev_err(dev, "ERROR: OCC Poll: 0x%x\n", rc);
+		rc = -EINVAL;
 		goto out;
 	}
 
 	num_bytes = get_occdata_length(occ_data);
 
-	dev_dbg(&client->dev, "OCC data length: %d\n", num_bytes);
+	dev_dbg(dev, "OCC data length: %d\n", num_bytes);
 
 	if (num_bytes > OCC_DATA_MAX) {
-		dev_dbg(&client->dev, "ERROR: OCC data length must be < 4KB\n");
-		ret = -EINVAL;
+		dev_dbg(dev, "ERROR: OCC data length must be < 4KB\n");
+		rc = -EINVAL;
 		goto out;
 	}
 
 	if (num_bytes <= 0) {
-		dev_dbg(&client->dev, "ERROR: OCC data length is zero\n");
-		ret = -EINVAL;
+		dev_dbg(dev, "ERROR: OCC data length is zero\n");
+		rc = -EINVAL;
 		goto out;
 	}
 
 	/* read remaining data */
 	for (i = 8; i < num_bytes + 8; i = i + 8)
-		occ_getscomb(client, OCB_DATA, occ_data, i);
+		occ->bus_ops.getscom(occ->bus, OCB_DATA, occ_data, i);
 
-	ret = parse_occ_response(client, occ_data, occ_resp);
+	rc = parse_occ_response(driver, occ_data, occ_resp);
 
 out:
-	devm_kfree(&client->dev, occ_data);
-	return ret;
+	devm_kfree(dev, occ_data);
+	return rc;
 }
 
 
-static int occ_update_device(struct device *dev)
+static int occ_update_device(struct power8_occ_driver *driver)
 {
-	struct occ_drv_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int ret = 0;
-
-	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + data->update_interval)
-	    || !data->valid) {
-		data->valid = 1;
-		ret = occ_get_all(client, &data->occ_resp);
-		if (ret)
-			data->valid = 0;
-		data->last_updated = jiffies;
+	int rc = 0;
+
+	mutex_lock(&driver->update_lock);
+
+	if (time_after(jiffies, driver->last_updated + driver->update_interval)
+	    || !driver->valid) {
+		driver->valid = 1;
+
+		rc = occ_get_all(driver);
+		if (rc)
+			driver->valid = 0;
+
+		driver->last_updated = jiffies;
 	}
-	mutex_unlock(&data->update_lock);
 
-	return ret;
+	mutex_unlock(&driver->update_lock);
+
+	return rc;
 }
 
 
-static void *occ_get_sensor(struct device *hwmon_dev, enum sensor_t t)
+static void *occ_get_sensor(struct power8_occ_driver *driver,
+			    enum sensor_type t)
 {
-	struct device *dev = hwmon_dev->parent;
-	struct occ_drv_data *data = dev_get_drvdata(dev);
-	int ret;
+	int rc;
 
-	ret = occ_update_device(dev);
-	if (ret != 0) {
-		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
+	rc = occ_update_device(driver);
+	if (rc != 0) {
+		dev_dbg(driver->dev, "ERROR: cannot get occ sensor data: %d\n",
+			rc);
 		return NULL;
 	}
 
-	return occ_get_sensor_by_type(&data->occ_resp, t);
+	return occ_get_sensor_by_type(&driver->response, t);
 }
 
-static int occ_get_sensor_value(struct device *hwmon_dev, enum sensor_t t,
-					int index)
+static int occ_get_sensor_value(struct power8_occ_driver *driver,
+				enum sensor_type t, int index)
 {
 	void *sensor;
 
-	if (t == caps)
+	if (t == CAPS)
 		return -1;
 
-	sensor = occ_get_sensor(hwmon_dev, t);
-
+	sensor = occ_get_sensor(driver, t);
 	if (!sensor)
 		return -1;
 
-	if (t == power)
+	if (t == POWER)
 		return ((struct power_sensor *)sensor)[index].value;
 
 	return ((struct occ_sensor *)sensor)[index].value;
 }
 
-static int occ_get_sensor_id(struct device *hwmon_dev, enum sensor_t t,
-					int index)
+static int occ_get_sensor_id(struct power8_occ_driver *driver,
+			     enum sensor_type t, int index)
 {
 	void *sensor;
 
-	if (t == caps)
+	if (t == CAPS)
 		return -1;
 
-	sensor = occ_get_sensor(hwmon_dev, t);
-
+	sensor = occ_get_sensor(driver, t);
 	if (!sensor)
 		return -1;
 
-	if (t == power)
+	if (t == POWER)
 		return ((struct power_sensor *)sensor)[index].sensor_id;
 
 	return ((struct occ_sensor *)sensor)[index].sensor_id;
@@ -707,52 +636,56 @@ static int occ_get_sensor_id(struct device *hwmon_dev, enum sensor_t t,
 
 /* sysfs attributes for occ hwmon device */
 
-static ssize_t show_input(struct device *hwmon_dev,
-				struct device_attribute *da, char *buf)
+static ssize_t show_input(struct device *dev,
+			  struct device_attribute *attr, char *buf)
 {
-	struct sensor_attr_data *sdata = container_of(da,
-					struct sensor_attr_data, dev_attr);
 	int val;
-
-	val = occ_get_sensor_value(hwmon_dev, sdata->type,
-					sdata->hwmon_index - 1);
-	if (sdata->type == temp)
+	struct sensor_attr_data *sdata = container_of(attr,
+						      struct sensor_attr_data,
+						      dev_attr);
+	struct power8_occ_driver *driver = dev_get_drvdata(dev);
+
+	val = occ_get_sensor_value(driver, sdata->type,
+				   sdata->hwmon_index - 1);
+	if (sdata->type == TEMP)
 		/* in millidegree Celsius */
 		val *= 1000;
 
 	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
 }
 
-static ssize_t show_label(struct device *hwmon_dev,
-			struct device_attribute *da, char *buf)
+static ssize_t show_label(struct device *dev,
+			  struct device_attribute *attr, char *buf)
 {
-	struct sensor_attr_data *sdata = container_of(da,
-					struct sensor_attr_data, dev_attr);
 	int val;
+	struct sensor_attr_data *sdata = container_of(da,
+						      struct sensor_attr_data,
+						      dev_attr);
+	struct power8_occ_driver *driver = dev_get_drvdata(dev);
 
-	val = occ_get_sensor_id(hwmon_dev, sdata->type,
-					sdata->hwmon_index - 1);
+	val = occ_get_sensor_id(driver, sdata->type, sdata->hwmon_index - 1);
 
 	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
 }
 
-static ssize_t show_caps(struct device *hwmon_dev,
-		struct device_attribute *da, char *buf)
+static ssize_t show_caps(struct device *dev,
+			 struct device_attribute *attr, char *buf)
 {
-	struct sensor_attr_data *sdata = container_of(da,
-					struct sensor_attr_data, dev_attr);
-	int nr = sdata->attr_id;
-	int n = sdata->hwmon_index - 1;
-	struct caps_sensor *sensor;
 	int val;
+	struct caps_sensor *sensor;
+	struct sensor_attr_data *sdata = container_of(attr,
+						      struct sensor_attr_data,
+						      dev_attr);
+	struct power8_occ_driver *driver = dev_get_drvdata(dev);
+	int n = sdata->hwmon_index - 1;
 
-	sensor = occ_get_sensor(hwmon_dev, caps);
+	sensor = occ_get_sensor(driver, CAPS);
 	if (!sensor) {
 		val = -1;
 		return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
 	}
 
-	switch (nr) {
+	switch (sdata->attr_id) {
 	case 0:
 		val = sensor[n].curr_powercap;
 		break;
@@ -778,159 +711,139 @@ static ssize_t show_caps(struct device *hwmon_dev,
 	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
 }
 
-static ssize_t show_update_interval(struct device *hwmon_dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t show_update_interval(struct device *dev,
+				    struct device_attribute *attr, char *buf)
 {
-	struct device *dev = hwmon_dev->parent;
-	struct occ_drv_data *data = dev_get_drvdata(dev);
+	struct power8_occ_driver *driver = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE - 1, "%u\n",
-		jiffies_to_msecs(data->update_interval));
+			jiffies_to_msecs(driver->update_interval));
 }
 
-static ssize_t set_update_interval(struct device *hwmon_dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t store_update_interval(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
 {
-	struct device *dev = hwmon_dev->parent;
-	struct occ_drv_data *data = dev_get_drvdata(dev);
+	struct power8_occ_driver *driver = dev_get_drvdata(dev);
 	unsigned long val;
-	int err;
+	int rc;
 
-	err = kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
+	rc = kstrtoul(buf, 10, &val);
+	if (rc)
+		return rc;
+
+	driver->update_interval = msecs_to_jiffies(val);
 
-	data->update_interval = msecs_to_jiffies(val);
 	return count;
 }
-static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO,
-		show_update_interval, set_update_interval);
 
-static ssize_t show_name(struct device *hwmon_dev,
-				struct device_attribute *attr, char *buf)
+static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_update_interval,
+		   store_update_interval);
+
+static ssize_t show_name(struct device *devdev,
+			 struct device_attribute *attr, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE - 1, "%s\n", OCC_I2C_NAME);
 }
+
 static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
 
-static ssize_t show_user_powercap(struct device *hwmon_dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t show_user_powercap(struct device *dev,
+				  struct device_attribute *attr, char *buf)
 {
-	struct device *dev = hwmon_dev->parent;
-	struct occ_drv_data *data = dev_get_drvdata(dev);
+	struct power8_occ_driver *driver = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE - 1, "%u\n", data->user_powercap);
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->user_powercap);
 }
 
-
-static ssize_t set_user_powercap(struct device *hwmon_dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t store_user_powercap(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
 {
-	struct device *dev = hwmon_dev->parent;
-	struct occ_drv_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
+	struct power8_occ_driver *driver = dev_get_drvdata(dev);
 	uint16_t val;
 	uint8_t resp[8];
-	int err;
+	int rc;
 
-	err = kstrtou16(buf, 10, &val);
-	if (err)
-		return err;
+	rc = kstrtou16(buf, 10, &val);
+	if (rc)
+		return rc;
 
 	dev_dbg(dev, "set user powercap to: %u\n", val);
 	val = cpu_to_le16(val);
-	err = occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
-	if (err != 0) {
+	rc = occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
+	if (rc != 0) {
 		dev_dbg(dev,
 			"ERROR: Set User Powercap: wrong return status: %x\n",
-			err);
-		if (err == 0x13)
+			rc);
+		if (rc == 0x13)
 			dev_info(dev,
-				"ERROR: set invalid powercap value: %x\n", val);
+				 "ERROR: set invalid powercap value: %x\n",
+				 val);
 		return -EINVAL;
 	}
-	data->user_powercap = val;
+
+	driver->user_powercap = val;
 	return count;
 }
-static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO,
-		show_user_powercap, set_user_powercap);
 
-static void deinit_sensor_groups(struct device *hwmon_dev,
-					struct sensor_group *sensor_groups)
+static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO, show_user_powercap,
+		   store_user_powercap);
+
+static void deinit_sensor_groups(struct device *dev,
+				 struct sensor_group *sensor_groups)
 {
 	int cnt;
 
 	for (cnt = 0; cnt < MAX_OCC_SENSOR_TYPE; cnt++) {
 		if (sensor_groups[cnt].group.attrs)
-			devm_kfree(hwmon_dev, sensor_groups[cnt].group.attrs);
+			devm_kfree(dev, sensor_groups[cnt].group.attrs);
 		if (sensor_groups[cnt].sattr)
-			devm_kfree(hwmon_dev, sensor_groups[cnt].sattr);
+			devm_kfree(dev, sensor_groups[cnt].sattr);
 		sensor_groups[cnt].group.attrs = NULL;
 		sensor_groups[cnt].sattr = NULL;
 	}
 }
 
-static void occ_remove_hwmon_attrs(struct device *hwmon_dev)
-{
-	struct occ_drv_data *data = dev_get_drvdata(hwmon_dev->parent);
-	struct sensor_group *sensor_groups = data->sensor_groups;
-	int i;
-
-	if (!hwmon_dev)
-		return;
-
-	device_remove_file(hwmon_dev, &dev_attr_update_interval);
-	device_remove_file(hwmon_dev, &dev_attr_name);
-	device_remove_file(hwmon_dev, &dev_attr_user_powercap);
-
-	for (i = 0; i < MAX_OCC_SENSOR_TYPE; i++)
-		sysfs_remove_group(&hwmon_dev->kobj, &sensor_groups[i].group);
-
-	deinit_sensor_groups(hwmon_dev, sensor_groups);
-}
-
 static void sensor_attr_init(struct sensor_attr_data *sdata,
-				char *sensor_group_name,
-				char *attr_name,
-				ssize_t (*show)(struct device *dev,
-						struct device_attribute *attr,
-						char *buf))
+			     char *sensor_group_name,
+			     char *attr_name,
+			     ssize_t (*show)(struct device *dev,
+					     struct device_attribute *attr,
+					     char *buf))
 {
 	sysfs_attr_init(&sdata->dev_attr.attr);
 
 	snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
-		sensor_group_name, sdata->hwmon_index, attr_name);
+		 sensor_group_name, sdata->hwmon_index, attr_name);
 	sdata->dev_attr.attr.name = sdata->name;
 	sdata->dev_attr.attr.mode = S_IRUGO;
 	sdata->dev_attr.show = show;
 }
 
 /* create hwmon sensor sysfs attributes */
-static int create_sensor_group(struct device *hwmon_dev, enum sensor_t type,
-				int sensor_num)
+static int create_sensor_group(struct power8_occ_driver *driver,
+			       enum sensor_type type, int sensor_num)
 {
-	struct occ_drv_data *data = dev_get_drvdata(hwmon_dev->parent);
-	struct sensor_group *sensor_groups = data->sensor_groups;
+	struct device *dev = driver->dev;
+	struct sensor_group *sensor_groups = driver->sensor_groups;
 	struct sensor_attr_data *sdata;
-	int ret;
-	int cnt;
+	int rc, cnt;
 
 	/* each sensor has 'label' and 'input' attributes */
-	sensor_groups[type].group.attrs = devm_kzalloc(hwmon_dev,
-						sizeof(struct attribute *) *
-						sensor_num * 2 + 1, GFP_KERNEL);
+	sensor_groups[type].group.attrs =
+		devm_kzalloc(dev, sizeof(struct attribute *) *
+			     sensor_num * 2 + 1, GFP_KERNEL);
 	if (!sensor_groups[type].group.attrs) {
-		ret = -ENOMEM;
+		rc = -ENOMEM;
 		goto err;
 	}
 
-	sensor_groups[type].sattr = devm_kzalloc(hwmon_dev,
-					sizeof(struct sensor_attr_data) *
-					sensor_num * 2, GFP_KERNEL);
+	sensor_groups[type].sattr =
+		devm_kzalloc(dev, sizeof(struct sensor_attr_data) *
+			     sensor_num * 2, GFP_KERNEL);
 	if (!sensor_groups[type].sattr) {
-		ret = -ENOMEM;
+		rc = -ENOMEM;
 		goto err;
 	}
 
@@ -940,45 +853,38 @@ static int create_sensor_group(struct device *hwmon_dev, enum sensor_t type,
 		sdata->hwmon_index = cnt + 1;
 		sdata->type = type;
 		sensor_attr_init(sdata, sensor_groups[type].name, "input",
-					show_input);
+				 show_input);
 		sensor_groups[type].group.attrs[cnt] = &sdata->dev_attr.attr;
 
 		sdata = &sensor_groups[type].sattr[cnt + sensor_num];
 		sdata->hwmon_index = cnt + 1;
 		sdata->type = type;
 		sensor_attr_init(sdata, sensor_groups[type].name, "label",
-					show_label);
+				 show_label);
 		sensor_groups[type].group.attrs[cnt + sensor_num] =
 			&sdata->dev_attr.attr;
 	}
 
-	ret = sysfs_create_group(&hwmon_dev->kobj, &sensor_groups[type].group);
-	if (ret)
+	rc = sysfs_create_group(&dev->kobj, &sensor_groups[type].group);
+	if (rc)
 		goto err;
 
-	return ret;
+	return rc;
 err:
-	deinit_sensor_groups(hwmon_dev, sensor_groups);
-	return ret;
+	deinit_sensor_groups(dev, sensor_groups);
+	return rc;
 }
 
 static void caps_sensor_attr_init(struct sensor_attr_data *sdata,
-					char *attr_name, uint32_t hwmon_index,
-					uint32_t attr_id)
+				  char *attr_name, uint32_t hwmon_index,
+				  uint32_t attr_id)
 {
-	sdata->type = caps;
+	sdata->type = CAPS;
 	sdata->hwmon_index = hwmon_index;
 	sdata->attr_id = attr_id;
 
-	/* FIXME, to be compatible with user space app, we do not
-	 * generate caps1_* attributes.
-	 */
-	if (sdata->hwmon_index == 1)
-		snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s_%s",
-			"caps", attr_name);
-	else
-		snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
-			"caps", sdata->hwmon_index, attr_name);
+	snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
+		 "caps", sdata->hwmon_index, attr_name);
 
 	sysfs_attr_init(&sdata->dev_attr.attr);
 	sdata->dev_attr.attr.name = sdata->name;
@@ -995,260 +901,148 @@ static char *caps_sensor_name[] = {
 	"user_powerlimit",
 };
 
-static int create_caps_sensor_group(struct device *hwmon_dev, int sensor_num)
+static int create_caps_sensor_group(struct power8_occ_driver *driver,
+				    int sensor_num)
 {
-	struct occ_drv_data *data = dev_get_drvdata(hwmon_dev->parent);
-	struct sensor_group *sensor_groups = data->sensor_groups;
+	struct device *dev = driver->dev;
+	struct sensor_group *sensor_groups = driver->sensor_groups;
 	int field_num = ARRAY_SIZE(caps_sensor_name);
 	struct sensor_attr_data *sdata;
-	int ret;
-	int cnt;
-	int i;
+	int i, j, rc;
 
-	sensor_groups[caps].group.attrs = devm_kzalloc(hwmon_dev,
-						sizeof(struct attribute *) *
-						sensor_num * field_num + 1,
-						GFP_KERNEL);
-	if (!sensor_groups[caps].group.attrs) {
-		ret = -ENOMEM;
+	sensor_groups[CAPS].group.attrs =
+		devm_kzalloc(dev, sizeof(struct attribute *) * sensor_num *
+			     field_num + 1, GFP_KERNEL);
+	if (!sensor_groups[CAPS].group.attrs) {
+		rc = -ENOMEM;
 		goto err;
 	}
 
-	sensor_groups[caps].sattr = devm_kzalloc(hwmon_dev,
-					sizeof(struct sensor_attr_data) *
-					sensor_num * field_num,
-					GFP_KERNEL);
-	if (!sensor_groups[caps].sattr) {
-		ret = -ENOMEM;
+	sensor_groups[CAPS].sattr =
+		devm_kzalloc(hwmon_dev, sizeof(struct sensor_attr_data) *
+			     sensor_num * field_num, GFP_KERNEL);
+	if (!sensor_groups[CAPS].sattr) {
+		rc = -ENOMEM;
 		goto err;
 	}
 
-	for (cnt = 0; cnt < sensor_num; cnt++) {
-		for (i = 0; i < field_num; i++) {
-			sdata = &sensor_groups[caps].sattr[cnt * field_num + i];
+	for (j = 0; j < sensor_num; ++j) {
+		for (i = 0; i < field_num; ++i) {
+			sdata = &sensor_groups[CAPS].sattr[j * field_num + i];
 			caps_sensor_attr_init(sdata, caps_sensor_name[i],
-						cnt + 1, i);
-			sensor_groups[caps].group.attrs[cnt * field_num + i] =
-						&sdata->dev_attr.attr;
+					      j + 1, i);
+			sensor_groups[CAPS].group.attrs[j * field_num + i] =
+				&sdata->dev_attr.attr;
 		}
 	}
 
-	ret = sysfs_create_group(&hwmon_dev->kobj, &sensor_groups[caps].group);
-	if (ret)
+	rc = sysfs_create_group(&dev->kobj, &sensor_groups[CAPS].group);
+	if (rc)
 		goto err;
 
-	return ret;
+	return rc;
 err:
-	deinit_sensor_groups(hwmon_dev, sensor_groups);
-	return ret;
+	deinit_sensor_groups(dev, sensor_groups);
+	return rc;
 }
 
-static int occ_create_hwmon_attrs(struct device *dev)
+static void occ_remove_hwmon_attrs(struct power8_occ_driver *driver)
 {
-	struct occ_drv_data *drv_data = dev_get_drvdata(dev);
-	struct device *hwmon_dev = drv_data->hwmon_dev;
-	struct sensor_group *sensor_groups = drv_data->sensor_groups;
 	int i;
-	int sensor_num;
-	int ret;
-	struct occ_response *rsp;
-	enum sensor_t t;
+	struct device *dev = driver->dev;
+	struct sensor_group *sensor_groups = driver->sensor_groups;
+
+	device_remove_file(dev, &dev_attr_user_powercap);
+	device_remove_file(dev, &dev_attr_update_interval);
+	device_remove_file(dev, &dev_attr_name);
 
-	rsp = &drv_data->occ_resp;
+	for (i = 0; i < MAX_OCC_SENSOR_TYPE; i++)
+		sysfs_remove_group(&dev->kobj, &sensor_groups[i].group);
+
+	deinit_sensor_groups(dev, sensor_groups);
+}
+
+static int occ_create_hwmon_attrs(struct power8_occ_driver *driver)
+{
+	int i, sensor_num, rc, id;
+	struct device *dev = driver->dev;
+	struct sensor_group *sensor_groups = driver->sensor_groups;
+	struct occ_response *response = &driver->response;
 
-	for (i = 0; i < ARRAY_SIZE(rsp->sensor_block_id); i++)
-		rsp->sensor_block_id[i] = -1;
+	for (i = 0; i < MAX_OCC_SENSOR_TYPE; ++i)
+		response->sensor_block_id[i] = -1;
 
 	/* read sensor data from occ. */
-	ret = occ_update_device(dev);
-	if (ret != 0) {
-		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
-		return ret;
+	rc = occ_update_device(driver);
+	if (rc != 0) {
+		dev_err(dev, "ERROR: cannot get occ sensor data: %d\n", rc);
+		return rc;
 	}
-	if (!rsp->blocks)
+	if (!response->blocks)
 		return -1;
 
-	ret = device_create_file(hwmon_dev, &dev_attr_name);
-	if (ret)
+	rc = device_create_file(dev, &dev_attr_name);
+	if (rc)
 		goto error;
 
-	ret = device_create_file(hwmon_dev, &dev_attr_update_interval);
-	if (ret)
+	rc = device_create_file(dev, &dev_attr_update_interval);
+	if (rc)
 		goto error;
 
-	if (rsp->sensor_block_id[caps] >= 0) {
+	if (response->sensor_block_id[CAPS] >= 0) {
 		/* user powercap: only for master OCC */
-		ret = device_create_file(hwmon_dev, &dev_attr_user_powercap);
-		if (ret)
+		rc = device_create_file(dev, &dev_attr_user_powercap);
+		if (rc)
 			goto error;
 	}
 
-	sensor_groups[freq].name = "freq";
-	sensor_groups[temp].name = "temp";
-	sensor_groups[power].name = "power";
-	sensor_groups[caps].name =  "caps";
+	sensor_groups[FREQ].name = "freq";
+	sensor_groups[TEMP].name = "temp";
+	sensor_groups[POWER].name = "power";
+	sensor_groups[CAPS].name =  "caps";
 
-	for (t = 0; t < MAX_OCC_SENSOR_TYPE; t++) {
-		if (rsp->sensor_block_id[t] < 0)
+	for (i = 0; i < MAX_OCC_SENSOR_TYPE; i++) {
+		id = response->sensor_block_id[i];
+		if (id < 0)
 			continue;
 
-		sensor_num =
-			rsp->blocks[rsp->sensor_block_id[t]].sensor_num;
-		if (t == caps)
-			ret = create_caps_sensor_group(hwmon_dev, sensor_num);
+		sensor_num = response->blocks[id].sensor_num;
+		if (i == CAPS)
+			rc = create_caps_sensor_group(dev, sensor_num);
 		else
-			ret = create_sensor_group(hwmon_dev, t, sensor_num);
-		if (ret)
+			rc = create_sensor_group(dev, i, sensor_num);
+		if (rc)
 			goto error;
 	}
 
 	return 0;
-error:
-	dev_err(dev, "ERROR: cannot create hwmon attributes\n");
-	occ_remove_hwmon_attrs(drv_data->hwmon_dev);
-	return ret;
-}
-
-static ssize_t show_occ_online(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	struct occ_drv_data *data = dev_get_drvdata(dev);
-
-	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", data->occ_online);
-}
-
-static ssize_t set_occ_online(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
-{
-	struct occ_drv_data *data = dev_get_drvdata(dev);
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-
-	if (val == 1) {
-		if (data->occ_online == 1)
-			return count;
 
-		/* populate hwmon sysfs attr using sensor data */
-		dev_dbg(dev, "occ register hwmon @0x%x\n", data->client->addr);
-
-		data->hwmon_dev = hwmon_device_register(dev);
-		if (IS_ERR(data->hwmon_dev))
-			return PTR_ERR(data->hwmon_dev);
-
-		err = occ_create_hwmon_attrs(dev);
-		if (err) {
-			hwmon_device_unregister(data->hwmon_dev);
-			return err;
-		}
-		data->hwmon_dev->parent = dev;
-	} else if (val == 0) {
-		if (data->occ_online == 0)
-			return count;
-
-		occ_remove_hwmon_attrs(data->hwmon_dev);
-		hwmon_device_unregister(data->hwmon_dev);
-		data->hwmon_dev = NULL;
-	} else
-		return -EINVAL;
-
-	data->occ_online = val;
-	return count;
-}
-
-static DEVICE_ATTR(online, S_IWUSR | S_IRUGO,
-		show_occ_online, set_occ_online);
-
-static int occ_create_i2c_sysfs_attr(struct device *dev)
-{
-	/* create an i2c sysfs attribute, to indicate whether OCC is active */
-	return device_create_file(dev, &dev_attr_online);
+error:
+	dev_err(dev, "ERROR: cannot create hwmon attributes: %d\n", rc);
+	occ_remove_hwmon_attrs(driver);
+	return rc;
 }
 
-
-/* device probe and removal */
-
-enum occ_type {
-	occ_id,
-};
-
-static int occ_probe(struct i2c_client *client, const struct i2c_device_id *id)
+int occ_init(struct occ_driver *driver)
 {
-	struct device *dev = &client->dev;
-	struct occ_drv_data *data;
-
-	data = devm_kzalloc(dev, sizeof(struct occ_drv_data), GFP_KERNEL);
-	if (!data)
+	struct device *dev = driver->hwmon;
+	struct power8_occ_driver *power =
+		devm_kzalloc(dev, sizeof(struct power_occ_driver),
+			     GFP_KERNEL);
+	if (!power)
 		return -ENOMEM;
 
-	data->client = client;
-	i2c_set_clientdata(client, data);
-	mutex_init(&data->update_lock);
-	data->update_interval = HZ;
+	power->driver = driver;
+	power->dev = dev;
 
-	occ_create_i2c_sysfs_attr(dev);
+	set_dev_drvdata(dev, power);
 
-	dev_info(dev, "occ i2c driver ready: i2c addr@0x%x\n", client->addr);
-
-	return 0;
+	return occ_create_hwmon_attrs(driver);
 }
 
-static int occ_remove(struct i2c_client *client)
+void occ_exit(occ_driver *driver)
 {
-	struct occ_drv_data *data = i2c_get_clientdata(client);
-
-	/* free allocated sensor memory */
-	deinit_occ_resp_buf(&data->occ_resp);
-
-	device_remove_file(&client->dev, &dev_attr_online);
+	struct power8_occ_driver *power = dev_get_drvdata(driver->hwmon);
 
-	if (!data->hwmon_dev)
-		return 0;
-
-	occ_remove_hwmon_attrs(data->hwmon_dev);
-	hwmon_device_unregister(data->hwmon_dev);
-	return 0;
+	occ_remove_hwmon_attrs(power);
 }
-
-/* used by old-style board info. */
-static const struct i2c_device_id occ_ids[] = {
-	{ OCC_I2C_NAME, occ_id, },
-	{ /* LIST END */ }
-};
-MODULE_DEVICE_TABLE(i2c, occ_ids);
-
-/* use by device table */
-static const struct of_device_id i2c_occ_of_match[] = {
-	{.compatible = "ibm,occ-i2c"},
-	{},
-};
-MODULE_DEVICE_TABLE(of, i2c_occ_of_match);
-
-/* i2c-core uses i2c-detect() to detect device in bellow address list.
- *  If exists, address will be assigned to client.
- * It is also possible to read address from device table.
- */
-static const unsigned short normal_i2c[] = {0x50, 0x51, I2C_CLIENT_END };
-
-static struct i2c_driver occ_driver = {
-	.class		= I2C_CLASS_HWMON,
-	.driver = {
-		.name	= OCC_I2C_NAME,
-		.pm	= NULL,
-		.of_match_table = i2c_occ_of_match,
-	},
-	.probe		= occ_probe,
-	.remove		= occ_remove,
-	.id_table       = occ_ids,
-	.address_list	= normal_i2c,
-};
-
-module_i2c_driver(occ_driver);
-
-MODULE_AUTHOR("Li Yi <shliyi@cn.ibm.com>");
-MODULE_DESCRIPTION("BMC OCC hwmon driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/power8_occ.h b/drivers/hwmon/occ/power8_occ.h
new file mode 100644
index 0000000..3f23d95
--- /dev/null
+++ b/drivers/hwmon/occ/power8_occ.h
@@ -0,0 +1,24 @@
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
+
+#endif /* __POWER8_OCC_H__ */
-- 
1.9.1
