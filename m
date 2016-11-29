Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzc56XkhzDvw6
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 10:03:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hsj22wTG"; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id h201so19623549qke.3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 15:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=QqsS7iDuKatTJZZba0jBUFp24UzqJG4hi1e0SEC//NE=;
 b=Hsj22wTGDAhWRWwdQq37I7h3CrN0LLdcacFgjqxH75yPmrq6VPPwmS0x9rYMYxB1kI
 ZKd57L2YLFxgZjtVdf0xV1vy72Q3RcxSAaZWjEnQ5dLEivGOS0kezrUbSasLPaIV01oY
 u7ob35EhTgbxO76WhO0U7cxlfNITddWI/jFCR+RelXzaVTZo2W7tlmsvWmKI1YiegQ5y
 mK08wjXey5CZ0POM7C29aPtS0hOKupbWywYDz5/3V2WFU5dAjX5UYAaU7TCkOBWkM9Vw
 CbQ3K1t94l2GDDOZNFx2lOSo82daZQSIISSvX9mDB/voc6TG4SrkumC+Y9IUHq+2Q3rj
 lutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QqsS7iDuKatTJZZba0jBUFp24UzqJG4hi1e0SEC//NE=;
 b=cCwQuV0EL9dkZuDT/d7j/KkMjo6OkDiYzkcwelLbjEjKAxNuAH5P+sRrvzjRhu3Fzo
 z9GOpZ6oExzlgViI+H7NBNI6kz9cr4jjKykhKtG7abydJK8Q5pf4v4NEmh/jB7Ojf6Lx
 1wbcOnuv/0Wcg+H2Uh+8PLKFmOB8F7AsU9yM7f2rQYxh9hDbVwoeqzwWBgk9vzFvyR9Y
 Sh/21NlOhBGKBIZzBDJJB4RTMKFXwLIdAP+hmUm3XQsjDYPDYMco3mkSEaF9py5vqI9F
 BMmpTrc9DyzzCvXTl3vv+E8H7VZVMaJeQx76HHxlIdge8r5uv666b4CKXUTJrOp+IPDA
 sr1A==
X-Gm-Message-State: AKaTC037jHRdQGdx+HTY6TF0DJM5ny3tdkoSrXLIo38TvP6B6tI3w0nq4Dr6L4hbefHrWA==
X-Received: by 10.55.129.194 with SMTP id c185mr26182959qkd.0.1480460594871;
 Tue, 29 Nov 2016 15:03:14 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id 16sm32042747qtt.38.2016.11.29.15.03.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Nov 2016 15:03:14 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [RFC PATCH linux v6 2/9] hwmon: Add core On-Chip Controller support
 for POWER CPUs
Date: Tue, 29 Nov 2016 17:03:08 -0600
Message-Id: <1480460588-28589-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 23:03:18 -0000

From: "Edward A. James" <eajames@us.ibm.com>

The On-Chip Controller (OCC) exposes frequency and temperature sensor
information along with power draw measurement and capping for POWER
chips. The information is gathered by SCOM reads and writes over a
transport of choice, and structured in a flexible fashion to accomodate
differences in sensors across designs.

Add core support for querying and parsing the data structures provided
by the OCC via SCOMs.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/Kconfig      |   2 +
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/occ/Kconfig  |  15 ++
 drivers/hwmon/occ/Makefile |   1 +
 drivers/hwmon/occ/occ.c    | 495 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ.h    |  79 ++++++++
 drivers/hwmon/occ/scom.h   |  50 +++++
 7 files changed, 643 insertions(+)
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/scom.h

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
index d7ccb02..f6af1a7 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -165,6 +165,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 
 obj-$(CONFIG_PMBUS)		+= pmbus/
+obj-$(CONFIG_SENSORS_PPC_OCC)	+= occ/
 
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
 
diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
new file mode 100644
index 0000000..cdb64a7
--- /dev/null
+++ b/drivers/hwmon/occ/Kconfig
@@ -0,0 +1,15 @@
+#
+# On Chip Controller configuration
+#
+
+menuconfig SENSORS_PPC_OCC
+	bool "PPC On-Chip Controller"
+	help
+	  If you say yes here you get support to monitor Power CPU
+	  sensors via the On-Chip Controller (OCC).
+
+	  Generally this is used by management controllers such as a BMC
+	  on an OpenPower system.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called occ.
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
new file mode 100644
index 0000000..93cb52f
--- /dev/null
+++ b/drivers/hwmon/occ/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o
diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
new file mode 100644
index 0000000..accfc43
--- /dev/null
+++ b/drivers/hwmon/occ/occ.c
@@ -0,0 +1,495 @@
+/*
+ * occ.c - OCC hwmon driver
+ *
+ * This file contains the methods and data structures for the OCC hwmon driver.
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
+#define OCC_DATA_MAX	4096
+
+/* To generate attn to OCC */
+#define ATTN_DATA	0x0006B035
+/* For BMC to read/write SRAM */
+#define OCB_ADDRESS		0x0006B070
+#define OCB_DATA		0x0006B075
+#define OCB_STATUS_CONTROL_AND	0x0006B072
+#define OCB_STATUS_CONTROL_OR	0x0006B073
+
+#define RESP_DATA_LENGTH	3
+#define RESP_HEADER_OFFSET	5
+#define SENSOR_STR_OFFSET	37
+#define SENSOR_BLOCK_NUM_OFFSET	43
+#define SENSOR_BLOCK_OFFSET	45
+
+#define MAX_SENSOR_ATTR_LEN	32
+
+struct occ_poll_header {
+	u8 status;
+	u8 ext_status;
+	u8 occs_present;
+	u8 config;
+	u8 occ_state;
+	u8 mode;
+	u8 ips_status;
+	u8 error_log_id;
+	u32 error_log_addr_start;
+	u16 error_log_length;
+	u8 reserved2;
+	u8 reserved3;
+	u8 occ_code_level[16];
+	u8 sensor_eye_catcher[6];
+	u8 sensor_block_num;
+	u8 sensor_data_version;
+};
+
+struct occ_response {
+	u8 sequence_num;
+	u8 cmd_type;
+	u8 rtn_status;
+	u16 data_length;
+	struct occ_poll_header header;
+	u16 chk_sum;
+	int sensor_block_id[MAX_OCC_SENSOR_TYPE];
+	struct sensor_data_block *blocks;
+};
+
+struct occ {
+	struct device *dev;
+
+	void *bus;
+	struct occ_bus_ops bus_ops;
+	struct occ_ops ops;
+	struct occ_config config;
+	unsigned long update_interval;
+	unsigned long last_updated;
+	struct mutex update_lock;
+	struct occ_response response;
+	bool valid;
+};
+
+static void deinit_occ_resp_buf(struct occ_response *resp)
+{
+	int i;
+
+	if (!resp)
+		return;
+
+	if (!resp->blocks)
+		return;
+
+	for (i = 0; i < resp->header.sensor_block_num; ++i) {
+		kfree(resp->blocks[i].sensors);
+	}
+
+	kfree(resp->blocks);
+
+	memset(resp, 0, sizeof(struct occ_response));
+
+	for (i = 0; i < MAX_OCC_SENSOR_TYPE; ++i)
+		resp->sensor_block_id[i] = -1;
+}
+
+static void *occ_get_sensor_by_type(struct occ_response *resp,
+				    enum sensor_type t)
+{
+	if (!resp->blocks)
+		return NULL;
+
+	if (resp->sensor_block_id[t] == -1)
+		return NULL;
+
+	return resp->blocks[resp->sensor_block_id[t]].sensors;
+}
+
+static int occ_renew_sensor(struct occ *driver, u8 sensor_length,
+			    u8 sensor_num, enum sensor_type t, int block)
+{
+	void *sensor;
+	int rc;
+	struct occ_response *resp = &driver->response;
+
+	sensor = occ_get_sensor_by_type(resp, t);
+
+	/* empty sensor block, release older sensor data */
+	if (sensor_num == 0 || sensor_length == 0) {
+		kfree(sensor);
+		return -1;
+	}
+
+	if (!sensor || sensor_num !=
+	    resp->blocks[resp->sensor_block_id[t]].sensor_num) {
+		kfree(sensor);
+		resp->blocks[block].sensors =
+			driver->ops.alloc_sensor(t, sensor_num);
+		if (!resp->blocks[block].sensors) {
+			rc = -ENOMEM;
+			goto err;
+		}
+	}
+
+	return 0;
+err:
+	deinit_occ_resp_buf(resp);
+	return rc;
+}
+
+static int parse_occ_response(struct occ *driver, u8 *data,
+			      struct occ_response *resp)
+{
+	int b;
+	int s;
+	int rc;
+	int dnum = SENSOR_BLOCK_OFFSET;
+	u8 sensor_block_num;
+	u8 sensor_type[4];
+	u8 sensor_format;
+	u8 sensor_length;
+	u8 sensor_num;
+	struct device *dev = driver->dev;
+	void (*parse_sensor)(u8 *data, void *sensor, int sensor_type, int off,
+			     int snum) = driver->ops.parse_sensor;
+
+	/* check if the data is valid */
+	if (strncmp(&data[SENSOR_STR_OFFSET], "SENSOR", 6) != 0) {
+		dev_dbg(dev, "ERROR: no SENSOR String in response\n");
+		rc = -1;
+		goto err;
+	}
+
+	sensor_block_num = data[SENSOR_BLOCK_NUM_OFFSET];
+	if (sensor_block_num == 0) {
+		dev_dbg(dev, "ERROR: SENSOR block num is 0\n");
+		rc = -1;
+		goto err;
+	}
+
+	/* if sensor block has changed, re-malloc */
+	if (sensor_block_num != resp->header.sensor_block_num) {
+		deinit_occ_resp_buf(resp);
+		resp->blocks = kcalloc(sensor_block_num,
+				       sizeof(struct sensor_data_block),
+				       GFP_KERNEL);
+		if (!resp->blocks)
+			return -ENOMEM;
+	}
+
+	memcpy(&resp->header, &data[RESP_HEADER_OFFSET],
+	       sizeof(struct occ_poll_header));
+	resp->header.error_log_addr_start =
+		be32_to_cpu(resp->header.error_log_addr_start);
+	resp->header.error_log_length =
+		be16_to_cpu(resp->header.error_log_length);
+
+	dev_dbg(dev, "Reading %d sensor blocks\n",
+		resp->header.sensor_block_num);
+	for (b = 0; b < sensor_block_num; b++) {
+		/* 8-byte sensor block head */
+		strncpy(sensor_type, &data[dnum], 4);
+		sensor_format = data[dnum + 5];
+		sensor_length = data[dnum + 6];
+		sensor_num = data[dnum + 7];
+		dnum = dnum + 8;
+
+		dev_dbg(dev, "sensor block[%d]: type: %s, sensor_num: %d\n", b,
+			sensor_type, sensor_num);
+
+		if (strncmp(sensor_type, "FREQ", 4) == 0) {
+			rc = occ_renew_sensor(driver, sensor_length, sensor_num,
+					      FREQ, b);
+			if (rc)
+				continue;
+
+			resp->sensor_block_id[FREQ] = b;
+			for (s = 0; s < sensor_num; s++) {
+				parse_sensor(data, resp->blocks[b].sensors,
+					     FREQ, dnum, s);
+				dnum = dnum + sensor_length;
+			}
+		} else if (strncmp(sensor_type, "TEMP", 4) == 0) {
+			rc = occ_renew_sensor(driver, sensor_length,
+					      sensor_num, TEMP, b);
+			if (rc)
+				continue;
+
+			resp->sensor_block_id[TEMP] = b;
+			for (s = 0; s < sensor_num; s++) {
+				parse_sensor(data, resp->blocks[b].sensors,
+					     TEMP, dnum, s);
+				dnum = dnum + sensor_length;
+			}
+		} else if (strncmp(sensor_type, "POWR", 4) == 0) {
+			rc = occ_renew_sensor(driver, sensor_length,
+				sensor_num, POWER, b);
+			if (rc)
+				continue;
+
+			resp->sensor_block_id[POWER] = b;
+			for (s = 0; s < sensor_num; s++) {
+				parse_sensor(data, resp->blocks[b].sensors,
+					     POWER, dnum, s);
+				dnum = dnum + sensor_length;
+			}
+		} else if (strncmp(sensor_type, "CAPS", 4) == 0) {
+			rc = occ_renew_sensor(driver, sensor_length,
+				sensor_num, CAPS, b);
+			if (rc)
+				continue;
+
+			resp->sensor_block_id[CAPS] = b;
+			for (s = 0; s < sensor_num; s++) {
+				parse_sensor(data, resp->blocks[b].sensors,
+					     CAPS, dnum, s);
+				dnum = dnum + sensor_length;
+			}
+
+		} else {
+			dev_dbg(dev, "ERROR: sensor type %s not supported\n",
+				resp->blocks[b].sensor_type);
+			rc = -1;
+			goto err;
+		}
+
+		strncpy(resp->blocks[b].sensor_type, sensor_type, 4);
+		resp->blocks[b].sensor_format = sensor_format;
+		resp->blocks[b].sensor_length = sensor_length;
+		resp->blocks[b].sensor_num = sensor_num;
+	}
+
+	return 0;
+err:
+	deinit_occ_resp_buf(resp);
+	return rc;
+}
+
+static u8 occ_send_cmd(struct occ *driver, u8 seq, u8 type, u16 length,
+		       u8 *data, u8 *resp)
+{
+	u32 cmd1, cmd2;
+	u16 checksum;
+	int i;
+
+	length = cpu_to_le16(length);
+	cmd1 = (seq << 24) | (type << 16) | length;
+	memcpy(&cmd2, data, length);
+	cmd2 <<= ((4 - length) * 8);
+
+	/* checksum: sum of every bytes of cmd1, cmd2 */
+	checksum = 0;
+	for (i = 0; i < 4; i++)
+		checksum += (cmd1 >> (i * 8)) & 0xFF;
+	for (i = 0; i < 4; i++)
+		checksum += (cmd2 >> (i * 8)) & 0xFF;
+	cmd2 |= checksum << ((2 - length) * 8);
+
+	/* Init OCB */
+	driver->bus_ops.putscom(driver->bus, OCB_STATUS_CONTROL_OR, 0x08000000,
+				0x00000000);
+	driver->bus_ops.putscom(driver->bus, OCB_STATUS_CONTROL_AND,
+				0xFBFFFFFF, 0xFFFFFFFF);
+
+	/* Send command */
+	driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
+				driver->config.command_addr, 0x00000000);
+	driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
+				driver->config.command_addr, 0x00000000);
+	driver->bus_ops.putscom(driver->bus, OCB_DATA, cmd1, cmd2);
+
+	/* Trigger attention */
+	driver->bus_ops.putscom(driver->bus, ATTN_DATA, 0x01010000,
+				0x00000000);
+
+	/* Get response data */
+	driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
+				driver->config.response_addr, 0x00000000);
+	driver->bus_ops.getscom(driver->bus, OCB_DATA, resp, 0);
+
+	/* return status */
+	return resp[2];
+}
+
+static inline u16 get_occdata_length(u8 *data)
+{
+	return be16_to_cpup((const __be16 *)&data[RESP_DATA_LENGTH]);
+}
+
+static int occ_get_all(struct occ *driver)
+{
+	int i = 0, rc;
+	u8 *occ_data;
+	u16 num_bytes;
+	u8 poll_cmd_data = 0x10;
+	struct device *dev = driver->dev;
+	struct occ_response *resp = &driver->response;
+
+	occ_data = devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
+	if (!occ_data)
+		return -ENOMEM;
+
+	rc = occ_send_cmd(driver, 0, 0, 1, &poll_cmd_data, occ_data);
+	if (rc) {
+		dev_err(dev, "ERROR: OCC Poll: 0x%x\n", rc);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	num_bytes = get_occdata_length(occ_data);
+	dev_dbg(dev, "OCC data length: %d\n", num_bytes);
+
+	if (num_bytes > OCC_DATA_MAX) {
+		dev_dbg(dev, "ERROR: OCC data length must be < 4KB\n");
+		rc = -EINVAL;
+		goto out;
+	}
+
+	if (num_bytes <= 0) {
+		dev_dbg(dev, "ERROR: OCC data length is zero\n");
+		rc = -EINVAL;
+		goto out;
+	}
+
+	/* read remaining data */
+	for (i = 8; i < num_bytes + 8; i += 8)
+		driver->bus_ops.getscom(driver->bus, OCB_DATA, occ_data, i);
+
+	rc = parse_occ_response(driver, occ_data, resp);
+
+out:
+	devm_kfree(dev, occ_data);
+	return rc;
+}
+
+int occ_update_device(struct occ *driver)
+{
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
+	}
+
+	mutex_unlock(&driver->update_lock);
+
+	return rc;
+}
+EXPORT_SYMBOL(occ_update_device);
+
+void *occ_get_sensor(struct occ *driver, int sensor_type)
+{
+	int rc;
+
+	rc = occ_update_device(driver);
+	if (rc != 0) {
+		dev_dbg(driver->dev, "ERROR: cannot get occ sensor data: %d\n",
+			rc);
+		return NULL;
+	}
+
+	return occ_get_sensor_by_type(&driver->response, sensor_type);
+}
+EXPORT_SYMBOL(occ_get_sensor);
+
+int occ_get_sensor_value(struct occ *occ, int sensor_type, int snum)
+{
+	return occ->ops.get_sensor_value(occ, sensor_type, snum);
+}
+EXPORT_SYMBOL(occ_get_sensor_value);
+
+int occ_get_sensor_id(struct occ *occ, int sensor_type, int snum)
+{
+	return occ->ops.get_sensor_id(occ, sensor_type, snum);
+}
+EXPORT_SYMBOL(occ_get_sensor_id);
+
+int occ_get_caps_value(struct occ *occ, void *sensor, int snum, int caps_field)
+{
+	return occ->ops.get_caps_value(sensor, snum, caps_field);
+}
+EXPORT_SYMBOL(occ_get_caps_value);
+
+void occ_get_response_blocks(struct occ *occ, struct occ_blocks *blocks)
+{
+	blocks->sensor_block_id = occ->response.sensor_block_id;
+	blocks->blocks = occ->response.blocks;
+}
+EXPORT_SYMBOL(occ_get_response_blocks);
+
+void occ_set_update_interval(struct occ *occ, unsigned long interval)
+{
+	occ->update_interval = msecs_to_jiffies(interval);
+}
+EXPORT_SYMBOL(occ_set_update_interval);
+
+int occ_set_user_powercap(struct occ *occ, u16 cap)
+{
+	u8 resp[8];
+
+	cap = cpu_to_le16(cap);
+
+	return occ_send_cmd(occ, 0, 0x22, 2, (u8 *)&cap, resp);
+}
+EXPORT_SYMBOL(occ_set_user_powercap);
+
+struct occ *occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops,
+	      struct occ_ops ops, struct occ_config config)
+{
+	struct occ *driver = devm_kzalloc(dev, sizeof(struct occ), GFP_KERNEL);
+	if (!driver)
+		return ERR_PTR(-ENOMEM);
+
+	driver->dev = dev;
+	driver->bus = bus;
+	driver->bus_ops = bus_ops;
+	driver->ops = ops;
+	driver->config = config;
+
+	driver->update_interval = HZ;
+	mutex_init(&driver->update_lock);
+
+	return driver;
+}
+EXPORT_SYMBOL(occ_start);
+
+int occ_stop(struct occ *occ)
+{
+	devm_kfree(occ->dev, occ);
+
+	return 0;
+}
+EXPORT_SYMBOL(occ_stop);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("OCC hwmon core driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/occ/occ.h
new file mode 100644
index 0000000..758d011
--- /dev/null
+++ b/drivers/hwmon/occ/occ.h
@@ -0,0 +1,79 @@
+/*
+ * occ.h - hwmon OCC driver
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
+#include "scom.h"
+
+struct device;
+struct occ_driver;
+
+struct sensor_data_block {
+	u8 sensor_type[4];
+	u8 reserved0;
+	u8 sensor_format;
+	u8 sensor_length;
+	u8 sensor_num;
+	void *sensors;
+};
+
+enum sensor_type {
+	FREQ = 0,
+	TEMP,
+	POWER,
+	CAPS,
+	MAX_OCC_SENSOR_TYPE
+};
+
+struct occ;
+
+struct occ_ops {
+	void (*parse_sensor)(u8 *data, void *sensor, int sensor_type, int off,
+			     int snum);
+	void *(*alloc_sensor)(int sensor_type, int num_sensors);
+	int (*get_sensor_value)(struct occ *driver, int sensor_type, int snum);
+	int (*get_sensor_id)(struct occ *driver, int sensor_type, int snum);
+	int (*get_caps_value)(void *sensor, int snum, int caps_field);
+};
+
+struct occ_config {
+	u32 command_addr;
+	u32 response_addr;
+};
+
+struct occ_blocks {
+	int *sensor_block_id;
+	struct sensor_data_block *blocks;
+};
+
+struct occ *occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops,
+	      const struct occ_ops ops, const struct occ_config config);
+int occ_stop(struct occ *occ);
+
+void *occ_get_sensor(struct occ *occ, int sensor_type);
+int occ_get_sensor_value(struct occ *occ, int sensor_type, int snum);
+int occ_get_sensor_id(struct occ *occ, int sensor_type, int snum);
+int occ_get_caps_value(struct occ *occ, void *sensor, int snum, int caps_field);
+void occ_get_response_blocks(struct occ *occ, struct occ_blocks *blocks);
+int occ_update_device(struct occ *driver);
+void occ_set_update_interval(struct occ *occ, unsigned long interval);
+int occ_set_user_powercap(struct occ *occ, u16 cap); 
+
+#endif /* __OCC_H__ */
diff --git a/drivers/hwmon/occ/scom.h b/drivers/hwmon/occ/scom.h
new file mode 100644
index 0000000..ae5ed0a
--- /dev/null
+++ b/drivers/hwmon/occ/scom.h
@@ -0,0 +1,50 @@
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
+#define SCOM_READ_ERROR		1
+#define SCOM_WRITE_ERROR	2
+/*
+ * occ_bus_ops - represent the low-level transfer methods to communicate with
+ * the OCC.
+*
+ * getscom - OCC scom read
+ * @bus: handle to slave device
+ * @address: address
+ * @data: where to store data read from slave; buffer size must be greater than
+ * or equal to offset + 8 bytes.
+ * @offset: offset into data pointer
+ *
+ * Returns 0 on success or one of -SCOM_READ_ERROR, -SCOM_WRITE_ERROR.
+ *
+ * putscom - OCC scom write
+ * @bus: handle to slave device
+ * @address: address
+ * @data0: first data byte to write
+ * @data1: second data byte to write
+ *
+ * Returns 0 on success or -SCOM_WRITE_ERROR on error
+ */
+struct occ_bus_ops {
+	int (*getscom)(void *bus, u32 address, u8 *data, size_t offset);
+	int (*putscom)(void *bus, u32 address, u32 data0, u32 data1);
+};
+
+#endif /* __SCOM_H__ */
-- 
1.9.1
