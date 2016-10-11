Return-Path: <eajames.ibm@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str7y0c9XzDswn
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:42:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZJX//MSu; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id o19so2511226ito.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=aZ8Y/Nkoerr/62ejaaGPhpw5CysC/oAzjM5Ze/Pa7Co=;
 b=ZJX//MSugVCAhUNNGROFv36HlATx6DAYNLeixqqAx4hdMy03k5+DVYyw5jJcU0ji/H
 O8n5lUqq16Igwu/kkGXu9zjMGL+OKQNx/bxk/Vzpim2fzhhfJ418DV+As+ztFWPCT9Lu
 vI3BEvxS1Bcin2OSNeIlssqjE6xdRoHdSrSvmmo0dkPk5Bhr7NV87z61ICWXjtTGCWkf
 GTCTDVS21DTzbLXw7C5n57UwIZ7o+OFbbkforitpf75GarhEVBeTTRTUgWY1d2liwpJg
 gyZi/XZzXOdWHTkagDPnv9AoIQpu75uvRI1VjAHKIyfrftDWV5+QFfkRvMY5Q6WWHXev
 WGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aZ8Y/Nkoerr/62ejaaGPhpw5CysC/oAzjM5Ze/Pa7Co=;
 b=L7rCt+j3z81HHSEz8T6OQUEAPha65I3tvIZdZRl1utHGC9KdiiKO8dKxXStvrjxBDx
 lE4aLM6pbw7RqLkbBEWpNVy85YPXuCozXIKAuoyen2jbB8ZHJBsf/fLbsroOWE+EXlNf
 QqM6A6ShkBBHvqu7fTOcY+AsH/mzi16NKqO6bxTNJvYnMtMaqp6wqORlmw8svJnvtRa3
 fKlP+0QuBKTUu7djvVpl9j4gnb1FRFMdzJ2IdtLRDqO1rJA3PIcb/o1tix/LT5jAdyZT
 rT4qCtcTzW5sSi0LWZYVzEKN7h9XFTAexKjM9Z+FTryrfH1zCc6aK0op49SG7AoEhZeG
 rZrw==
X-Gm-Message-State: AA6/9RnPGcTp40mn0ep5v3IuExc4Ftk0Y0OtJILJfyYRKH8cBVTqEjUoaL3LC7FTnWtwBg==
X-Received: by 10.107.55.85 with SMTP id e82mr194877ioa.14.1476222171230;
 Tue, 11 Oct 2016 14:42:51 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.53])
 by smtp.gmail.com with ESMTPSA id u6sm9579493itb.3.2016.10.11.14.42.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:42:50 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux v2 2/2] drivers/hwmon: Isolate bus transfer protocol
Date: Tue, 11 Oct 2016 16:42:42 -0500
Message-Id: <1476222162-14541-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:42:54 -0000

From: "Edward A. James" <eajames@us.ibm.com>

- Copy i2c related code into occ_i2c.c and simplify.
- Copy common platform code into occ.c; more functions can be placed here
  later.
- Change core functions to accept OCC driver data parameter instead of
  device pointer.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/Makefile     |   2 +-
 drivers/hwmon/occ/occ.c        | 127 +++++++++++++++
 drivers/hwmon/occ/occ.h        |  47 ++++++
 drivers/hwmon/occ/occ_i2c.c    | 150 ++++++++++++++++++
 drivers/hwmon/occ/power8_occ.c | 343 +++++++++--------------------------------
 drivers/hwmon/occ/power8_occ.h |  25 +++
 6 files changed, 422 insertions(+), 272 deletions(-)
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_i2c.c
 create mode 100644 drivers/hwmon/occ/power8_occ.h

diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index 1322961..05b5031 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_OCC) += power8_occ.o
+obj-$(CONFIG_OCC) += occ.o occ_i2c.o power8_occ.o
diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
new file mode 100644
index 0000000..a0db66c
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
+	struct occ_driver *driver = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", driver->occ_online);
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
index 0000000..06b33e2
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
+	int (*putscom)(void *bus, u32 address, u8 data0, u8 data1);
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
index 0000000..a2b20a4
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
+ * 	  or equal to offset + 8 bytes.
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
+	rc = i2c_master_send(client, &address, sizeof(u32));
+	if (rc != sizeof(u32))
+		return -I2C_WRITE_ERROR;
+
+	rc = i2c_master_recv(client, &buf, sizeof(u64));
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
+	rc = i2c_master_send(client, buf, sizeof(u32) * 3);
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
index 6de0e76..01ed305 100644
--- a/drivers/hwmon/occ/power8_occ.c
+++ b/drivers/hwmon/occ/power8_occ.c
@@ -19,24 +19,14 @@
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
@@ -140,7 +130,7 @@ struct sensor_group {
 
 /* data private to each client */
 struct occ_drv_data {
-	struct i2c_client	*client;
+	struct occ_driver 	*driver;
 	struct device		*hwmon_dev;
 	struct mutex		update_lock;
 	bool			valid;
@@ -177,72 +167,6 @@ static void deinit_occ_resp_buf(struct occ_response *p)
 		p->sensor_block_id[i] = -1;
 }
 
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
-
-	/* P8 i2c slave requires address to be shifted by 1 */
-	address = address << 1;
-
-	buf[0] = address;
-	buf[1] = data1;
-	buf[2] = data0;
-
-	ret = occ_i2c_write(client, buf, sizeof(buf));
-	if (ret != sizeof(buf))
-		return I2C_WRITE_ERROR;
-
-	return 0;
-}
-
 static void *occ_get_sensor_by_type(struct occ_response *resp, enum sensor_t t)
 {
 	void *sensor;
@@ -341,7 +265,7 @@ static inline uint16_t get_occdata_length(uint8_t *data)
 	return be16_to_cpup((const __be16 *)&data[RESP_DATA_LENGTH]);
 }
 
-static int parse_occ_response(struct i2c_client *client,
+static int parse_occ_response(struct device *dev,
 		uint8_t *data, struct occ_response *resp)
 {
 	int b;
@@ -360,7 +284,7 @@ static int parse_occ_response(struct i2c_client *client,
 
 	/* check if the data is valid */
 	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) != 0) {
-		dev_dbg(&client->dev,
+		dev_dbg(dev,
 			"ERROR: no SENSOR String in response\n");
 		ret = -1;
 		goto err;
@@ -368,7 +292,7 @@ static int parse_occ_response(struct i2c_client *client,
 
 	sensor_block_num = data[SENSOR_BLOCK_NUM_OFFSET];
 	if (sensor_block_num == 0) {
-		dev_dbg(&client->dev, "ERROR: SENSOR block num is 0\n");
+		dev_dbg(dev, "ERROR: SENSOR block num is 0\n");
 		ret = -1;
 		goto err;
 	}
@@ -388,7 +312,7 @@ static int parse_occ_response(struct i2c_client *client,
 	resp->header.error_log_length =
 		be16_to_cpu(resp->header.error_log_length);
 
-	dev_dbg(&client->dev, "Reading %d sensor blocks\n",
+	dev_dbg(dev, "Reading %d sensor blocks\n",
 		resp->header.sensor_block_num);
 	for (b = 0; b < sensor_block_num; b++) {
 		/* 8-byte sensor block head */
@@ -398,7 +322,7 @@ static int parse_occ_response(struct i2c_client *client,
 		sensor_num = data[dnum+7];
 		dnum = dnum + 8;
 
-		dev_dbg(&client->dev,
+		dev_dbg(dev,
 			"sensor block[%d]: type: %s, sensor_num: %d\n",
 			b, sensor_type, sensor_num);
 
@@ -416,7 +340,7 @@ static int parse_occ_response(struct i2c_client *client,
 							&data[dnum]);
 				f_sensor->value = be16_to_cpup((const __be16 *)
 							&data[dnum+2]);
-				dev_dbg(&client->dev,
+				dev_dbg(dev,
 					"sensor[%d]-[%d]: id: %u, value: %u\n",
 					b, s, f_sensor->sensor_id,
 					f_sensor->value);
@@ -436,7 +360,7 @@ static int parse_occ_response(struct i2c_client *client,
 							&data[dnum]);
 				t_sensor->value = be16_to_cpup((const __be16 *)
 							&data[dnum+2]);
-				dev_dbg(&client->dev,
+				dev_dbg(dev,
 					"sensor[%d]-[%d]: id: %u, value: %u\n",
 					b, s, t_sensor->sensor_id,
 					t_sensor->value);
@@ -463,7 +387,7 @@ static int parse_occ_response(struct i2c_client *client,
 				p_sensor->value = be16_to_cpup((const __be16 *)
 							&data[dnum+10]);
 
-				dev_dbg(&client->dev,
+				dev_dbg(dev,
 					"sensor[%d]-[%d]: id: %u, value: %u\n",
 					b, s, p_sensor->sensor_id,
 					p_sensor->value);
@@ -499,24 +423,24 @@ static int parse_occ_response(struct i2c_client *client,
 							&data[dnum+10]);
 
 				dnum = dnum + sensor_length;
-				dev_dbg(&client->dev, "CAPS sensor #%d:\n", s);
-				dev_dbg(&client->dev, "curr_powercap is %x\n",
+				dev_dbg(dev, "CAPS sensor #%d:\n", s);
+				dev_dbg(dev, "curr_powercap is %x\n",
 					c_sensor->curr_powercap);
-				dev_dbg(&client->dev,
+				dev_dbg(dev,
 					"curr_powerreading is %x\n",
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
+			dev_dbg(dev,
 				"ERROR: sensor type %s not supported\n",
 				resp->blocks[b].sensor_type);
 			ret = -1;
@@ -539,9 +463,10 @@ err:
 /* Refer to OCC interface document for OCC command format
  * https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Interfaces.pdf
  */
-static uint8_t occ_send_cmd(struct i2c_client *client, uint8_t seq,
+static uint8_t occ_send_cmd(struct occ_driver *driver, uint8_t seq,
 		uint8_t type, uint16_t length, uint8_t *data, uint8_t *resp)
 {
+	struct bus_ops *ops = &driver->bus_ops;
 	uint32_t cmd1, cmd2;
 	uint16_t checksum;
 	int i;
@@ -560,27 +485,31 @@ static uint8_t occ_send_cmd(struct i2c_client *client, uint8_t seq,
 	cmd2 |= checksum << ((2 - length) * 8);
 
 	/* Init OCB */
-	occ_putscom(client, OCB_STATUS_CONTROL_OR,  0x08000000, 0x00000000);
-	occ_putscom(client, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF, 0xFFFFFFFF);
+	ops->putscom(driver->bus, OCB_STATUS_CONTROL_OR,  0x08000000,
+		     0x00000000);
+	ops->putscom(driver->bus, OCB_STATUS_CONTROL_AND, 0xFBFFFFFF,
+		     0xFFFFFFFF);
 
 	/* Send command */
-	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
-	occ_putscom(client, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
-	occ_putscom(client, OCB_DATA, cmd1, cmd2);
+	ops->putscom(driver->bus, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
+	ops->putscom(driver->bus, OCB_ADDRESS, OCC_COMMAND_ADDR, 0x00000000);
+	ops->putscom(driver->bus, OCB_DATA, cmd1, cmd2);
 
 	/* Trigger attention */
-	occ_putscom(client, ATTN_DATA, 0x01010000, 0x00000000);
+	ops->putscom(driver->bus, ATTN_DATA, 0x01010000, 0x00000000);
 
 	/* Get response data */
-	occ_putscom(client, OCB_ADDRESS, OCC_RESPONSE_ADDR, 0x00000000);
-	occ_getscomb(client, OCB_DATA, resp, 0);
+	ops->putscom(driver->bus, OCB_ADDRESS, OCC_RESPONSE_ADDR, 0x00000000);
+	ops->getscomb(driver->bus, OCB_DATA, resp, 0);
 
 	/* return status */
 	return resp[2];
 }
 
-static int occ_get_all(struct i2c_client *client, struct occ_response *occ_resp)
+static int occ_get_all(struct occ_drv_data *data,
+		       struct occ_response *occ_resp)
 {
+	struct device *dev = data->hwmon_dev;
 	uint8_t *occ_data;
 	uint16_t num_bytes;
 	int i;
@@ -593,47 +522,46 @@ static int occ_get_all(struct i2c_client *client, struct occ_response *occ_resp)
 	 * TODO: fetch header, and then allocate the rest of the buffer based
 	 * on the header size. Assuming the OCC has a fixed sized header
 	 */
-	occ_data = devm_kzalloc(&client->dev, OCC_DATA_MAX, GFP_KERNEL);
+	occ_data = devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
 
-	ret = occ_send_cmd(client, 0, 0, 1, &poll_cmd_data, occ_data);
+	ret = occ_send_cmd(data->driver, 0, 0, 1, &poll_cmd_data, occ_data);
 	if (ret) {
-		dev_err(&client->dev, "ERROR: OCC Poll: 0x%x\n", ret);
+		dev_err(dev, "ERROR: OCC Poll: 0x%x\n", ret);
 		ret = -EINVAL;
 		goto out;
 	}
 
 	num_bytes = get_occdata_length(occ_data);
 
-	dev_dbg(&client->dev, "OCC data length: %d\n", num_bytes);
+	dev_dbg(dev, "OCC data length: %d\n", num_bytes);
 
 	if (num_bytes > OCC_DATA_MAX) {
-		dev_dbg(&client->dev, "ERROR: OCC data length must be < 4KB\n");
+		dev_dbg(dev, "ERROR: OCC data length must be < 4KB\n");
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (num_bytes <= 0) {
-		dev_dbg(&client->dev, "ERROR: OCC data length is zero\n");
+		dev_dbg(dev, "ERROR: OCC data length is zero\n");
 		ret = -EINVAL;
 		goto out;
 	}
 
 	/* read remaining data */
 	for (i = 8; i < num_bytes + 8; i = i + 8)
-		occ_getscomb(client, OCB_DATA, occ_data, i);
+		data->driver->bus_ops.getscom(data->driver->bus, OCB_DATA,
+					      occ_data, i);
 
-	ret = parse_occ_response(client, occ_data, occ_resp);
+	ret = parse_occ_response(dev, occ_data, occ_resp);
 
 out:
-	devm_kfree(&client->dev, occ_data);
+	devm_kfree(dev, occ_data);
 	return ret;
 }
 
 
-static int occ_update_device(struct device *dev)
+static int occ_update_device(struct occ_drv_data *data)
 {
-	struct occ_drv_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	int ret = 0;
 
 	mutex_lock(&data->update_lock);
@@ -641,7 +569,7 @@ static int occ_update_device(struct device *dev)
 	if (time_after(jiffies, data->last_updated + data->update_interval)
 	    || !data->valid) {
 		data->valid = 1;
-		ret = occ_get_all(client, &data->occ_resp);
+		ret = occ_get_all(data, &data->occ_resp);
 		if (ret)
 			data->valid = 0;
 		data->last_updated = jiffies;
@@ -652,13 +580,12 @@ static int occ_update_device(struct device *dev)
 }
 
 
-static void *occ_get_sensor(struct device *hwmon_dev, enum sensor_t t)
+static void *occ_get_sensor(struct device *dev, enum sensor_t t)
 {
-	struct device *dev = hwmon_dev->parent;
 	struct occ_drv_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	ret = occ_update_device(dev);
+	ret = occ_update_device(data);
 	if (ret != 0) {
 		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
 		return NULL;
@@ -778,21 +705,19 @@ static ssize_t show_caps(struct device *hwmon_dev,
 	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
 }
 
-static ssize_t show_update_interval(struct device *hwmon_dev,
+static ssize_t show_update_interval(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
-	struct device *dev = hwmon_dev->parent;
 	struct occ_drv_data *data = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE - 1, "%u\n",
 		jiffies_to_msecs(data->update_interval));
 }
 
-static ssize_t set_update_interval(struct device *hwmon_dev,
+static ssize_t set_update_interval(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
 {
-	struct device *dev = hwmon_dev->parent;
 	struct occ_drv_data *data = dev_get_drvdata(dev);
 	unsigned long val;
 	int err;
@@ -814,23 +739,20 @@ static ssize_t show_name(struct device *hwmon_dev,
 }
 static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
 
-static ssize_t show_user_powercap(struct device *hwmon_dev,
+static ssize_t show_user_powercap(struct device *dev,
 				struct device_attribute *attr, char *buf)
 {
-	struct device *dev = hwmon_dev->parent;
 	struct occ_drv_data *data = dev_get_drvdata(dev);
 
 	return snprintf(buf, PAGE_SIZE - 1, "%u\n", data->user_powercap);
 }
 
 
-static ssize_t set_user_powercap(struct device *hwmon_dev,
+static ssize_t set_user_powercap(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
 {
-	struct device *dev = hwmon_dev->parent;
 	struct occ_drv_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	uint16_t val;
 	uint8_t resp[8];
 	int err;
@@ -841,7 +763,7 @@ static ssize_t set_user_powercap(struct device *hwmon_dev,
 
 	dev_dbg(dev, "set user powercap to: %u\n", val);
 	val = cpu_to_le16(val);
-	err = occ_send_cmd(client, 0, 0x22, 2, (uint8_t *)&val, resp);
+	err = occ_send_cmd(data, 0, 0x22, 2, (uint8_t *)&val, resp);
 	if (err != 0) {
 		dev_dbg(dev,
 			"ERROR: Set User Powercap: wrong return status: %x\n",
@@ -872,9 +794,9 @@ static void deinit_sensor_groups(struct device *hwmon_dev,
 	}
 }
 
-static void occ_remove_hwmon_attrs(struct device *hwmon_dev)
+static void occ_remove_hwmon_attrs(struct occ_drv_data *data)
 {
-	struct occ_drv_data *data = dev_get_drvdata(hwmon_dev->parent);
+	struct device *hwmon_dev = data->hwmon_dev;
 	struct sensor_group *sensor_groups = data->sensor_groups;
 	int i;
 
@@ -908,10 +830,10 @@ static void sensor_attr_init(struct sensor_attr_data *sdata,
 }
 
 /* create hwmon sensor sysfs attributes */
-static int create_sensor_group(struct device *hwmon_dev, enum sensor_t type,
+static int create_sensor_group(struct occ_drv_data *data, enum sensor_t type,
 				int sensor_num)
 {
-	struct occ_drv_data *data = dev_get_drvdata(hwmon_dev->parent);
+	struct device *hwmon_dev = data->hwmon_dev;
 	struct sensor_group *sensor_groups = data->sensor_groups;
 	struct sensor_attr_data *sdata;
 	int ret;
@@ -995,9 +917,8 @@ static char *caps_sensor_name[] = {
 	"user_powerlimit",
 };
 
-static int create_caps_sensor_group(struct device *hwmon_dev, int sensor_num)
+static int create_caps_sensor_group(struct occ_drv_data *data, int sensor_num)
 {
-	struct occ_drv_data *data = dev_get_drvdata(hwmon_dev->parent);
 	struct sensor_group *sensor_groups = data->sensor_groups;
 	int field_num = ARRAY_SIZE(caps_sensor_name);
 	struct sensor_attr_data *sdata;
@@ -1043,9 +964,8 @@ err:
 	return ret;
 }
 
-static int occ_create_hwmon_attrs(struct device *dev)
+static int occ_create_hwmon_attrs(struct occ_drv_data *drv_data)
 {
-	struct occ_drv_data *drv_data = dev_get_drvdata(dev);
 	struct device *hwmon_dev = drv_data->hwmon_dev;
 	struct sensor_group *sensor_groups = drv_data->sensor_groups;
 	int i;
@@ -1060,7 +980,7 @@ static int occ_create_hwmon_attrs(struct device *dev)
 		rsp->sensor_block_id[i] = -1;
 
 	/* read sensor data from occ. */
-	ret = occ_update_device(dev);
+	ret = occ_update_device(drv_data);
 	if (ret != 0) {
 		dev_dbg(dev, "ERROR: cannot get occ sensor data: %d\n", ret);
 		return ret;
@@ -1095,9 +1015,9 @@ static int occ_create_hwmon_attrs(struct device *dev)
 		sensor_num =
 			rsp->blocks[rsp->sensor_block_id[t]].sensor_num;
 		if (t == caps)
-			ret = create_caps_sensor_group(hwmon_dev, sensor_num);
+			ret = create_caps_sensor_group(drv_data, sensor_num);
 		else
-			ret = create_sensor_group(hwmon_dev, t, sensor_num);
+			ret = create_sensor_group(drv_data, t, sensor_num);
 		if (ret)
 			goto error;
 	}
@@ -1109,146 +1029,27 @@ error:
 	return ret;
 }
 
-static ssize_t show_occ_online(struct device *dev,
-				struct device_attribute *attr, char *buf)
-{
-	struct occ_drv_data *data = dev_get_drvdata(dev);
-
-	return snprintf(buf, PAGE_SIZE - 1, "%lu\n", data->occ_online);
-}
 
-static ssize_t set_occ_online(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+int occ_init(struct occ_driver *driver)
 {
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
-
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
-}
-
-
-/* device probe and removal */
-
-enum occ_type {
-	occ_id,
-};
-
-static int occ_probe(struct i2c_client *client, const struct i2c_device_id *id)
-{
-	struct device *dev = &client->dev;
-	struct occ_drv_data *data;
-
-	data = devm_kzalloc(dev, sizeof(struct occ_drv_data), GFP_KERNEL);
+	struct device *dev = driver->hwmon;
+	struct occ_drv_data *data =
+		devm_kzalloc(dev, sizeof(struct power_occ_driver),
+			     GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->client = client;
-	i2c_set_clientdata(client, data);
-	mutex_init(&data->update_lock);
-	data->update_interval = HZ;
+	data->driver = driver;
+	data->hwmon_dev = dev;
 
-	occ_create_i2c_sysfs_attr(dev);
+	set_dev_drvdata(dev, data);
 
-	dev_info(dev, "occ i2c driver ready: i2c addr@0x%x\n", client->addr);
-
-	return 0;
+	return occ_create_hwmon_attrs(data);
 }
 
-static int occ_remove(struct i2c_client *client)
+void occ_exit(struct occ_driver *driver)
 {
-	struct occ_drv_data *data = i2c_get_clientdata(client);
-
-	/* free allocated sensor memory */
-	deinit_occ_resp_buf(&data->occ_resp);
-
-	device_remove_file(&client->dev, &dev_attr_online);
-
-	if (!data->hwmon_dev)
-		return 0;
+	struct occ_drv_data *data = dev_get_drvdata(driver->hwmon);
 
-	occ_remove_hwmon_attrs(data->hwmon_dev);
-	hwmon_device_unregister(data->hwmon_dev);
-	return 0;
+	occ_remove_hwmon_attrs(data);
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
