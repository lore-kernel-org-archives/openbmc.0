Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw4385S1gzDsxk
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 08:43:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=fegXBbqS; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id z190so7186538qkc.3
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 14:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=YLi42I8P0/3SIuOCkpoAP3agMCk7zufZSVexYYsmhck=;
 b=fegXBbqSIjZ6Zn81ysdPMr+nsId7l5YEUGscygbGWYXiZOD8wnRjCd8c+6tn8QWbCO
 cCluN1ceyAxxEq6mRN5JJTOtSs/lJEEcIWGVwJ5AT2FVObBgh1TfRcJgPJq0G9V0vDwQ
 utDJbe41nNVA0l3YZQ9VZvUiNYrx2+jjAfezEJWoj8Li2KbozCKz3QGn7uJGxNP+TiT8
 ejiv1ETi5NCwoFYYIXdajrJetgRjoXXew+JRHBW4gtiw5jWXaP9c2hjFFLRhCQDVsrU4
 ERB4jHyCRL9iH/Z8RG4fFJdttn1vvXMJFG1MME8ua8FRCco81WwcK2DLne/dzyy1A1+0
 dOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YLi42I8P0/3SIuOCkpoAP3agMCk7zufZSVexYYsmhck=;
 b=TN0UzuDM4vmDIHqxAu8KVWP2fEmQQxvtcWrNdP3ag4oOz6PuZtjzDTIufaZwG7kzLB
 6SnKdnGwRQpNxqgrWuM9G8pIzv2mPBrwRZA4eIy50bCiOE4psIgM/7uu7ItIkQZNhLPO
 8lErwqqBBui8fKtgVx1zwfvVahn9I7i6TSOhxE4Uxi/n8zjh7Vf2xtVLl+SYAqDtVjj7
 zcKZdkk3kbtIyqaA2pwNA7e9f5d6yFSmHYKiGHsKs7YzpiNV7karQQgKT3Nl4sOZxF4U
 NA9DCDL/SA0pjvP40oCRRB/vMqyJspw4OBHusN7Z//BosLJIMEnjP503gdPPkZhHXoGd
 h5XQ==
X-Gm-Message-State: AA6/9Rnej9+kDANxkRfDvY+bcZJ3PmmAl6vmK+CiPKwAl9/2Hn6sSH9D0lGQFXbHqxIrBQ==
X-Received: by 10.55.26.17 with SMTP id a17mr7924809qka.250.1476394978479;
 Thu, 13 Oct 2016 14:42:58 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.53])
 by smtp.gmail.com with ESMTPSA id d9sm1401874qkj.25.2016.10.13.14.42.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Oct 2016 14:42:57 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux v4 4/6] hwmon: Add OCC driver polling and parse response
Date: Thu, 13 Oct 2016 16:42:39 -0500
Message-Id: <1476394959-17131-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 21:43:01 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add code to poll the OCC and parse the response. Add all the necessary
structures for the P8 OCC.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/occ_i2c.c    |   1 +
 drivers/hwmon/occ/power8_occ.c | 492 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 487 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/occ/occ_i2c.c b/drivers/hwmon/occ/occ_i2c.c
index e9680eb..2e44527 100644
--- a/drivers/hwmon/occ/occ_i2c.c
+++ b/drivers/hwmon/occ/occ_i2c.c
@@ -59,6 +59,7 @@ int occ_getscom(void *bus, u32 address, u8 *data, size_t offset)
 	if (rc != sizeof(u64))
 		return -I2C_READ_ERROR;
 
+	/* TODO: is OCC be or le? */
 	*((u64 *)data) = le64_to_cpu(buf);
 
 	return 0;
diff --git a/drivers/hwmon/occ/power8_occ.c b/drivers/hwmon/occ/power8_occ.c
index a42fb30..f0f14ec 100644
--- a/drivers/hwmon/occ/power8_occ.c
+++ b/drivers/hwmon/occ/power8_occ.c
@@ -31,6 +31,8 @@
 
 #include "occ.h"
 
+#define OCC_DATA_MAX	4096
+
 /* Defined in POWER8 Processor Registers Specification */
 /* To generate attn to OCC */
 #define ATTN_DATA	0x0006B035
@@ -45,15 +47,401 @@
 #define OCC_COMMAND_ADDR	0xFFFF6000
 #define OCC_RESPONSE_ADDR	0xFFFF7000
 
+#define RESP_DATA_LENGTH	3
+#define RESP_HEADER_OFFSET	5
+#define SENSOR_STR_OFFSET	37
+#define SENSOR_BLOCK_NUM_OFFSET	43
+#define SENSOR_BLOCK_OFFSET	45
+
+enum sensor_type {
+	FREQ = 0,
+	TEMP,
+	POWER,
+	CAPS,
+	MAX_OCC_SENSOR_TYPE
+};
+
+/* OCC sensor data format */
+struct occ_sensor {
+	u16 sensor_id;
+	u16 value;
+};
+
+struct power_sensor {
+	u16 sensor_id;
+	u32 update_tag;
+	u32 accumulator;
+	u16 value;
+};
+
+struct caps_sensor {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+};
+
+struct sensor_data_block {
+	u8 sensor_type[4];
+	u8 reserved0;
+	u8 sensor_format;
+	u8 sensor_length;
+	u8 sensor_num;
+	struct occ_sensor *sensor;
+	struct power_sensor *power;
+	struct caps_sensor *caps;
+};
+
+struct occ_poll_header {
+	u8 status;
+	u8 ext_status;
+	u8 occs_present;
+	u8 config;
+	u8 occ_state;
+	u8 reserved0;
+	u8 reserved1;
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
+	struct sensor_data_block *blocks;
+	u16 chk_sum;
+	int sensor_block_id[MAX_OCC_SENSOR_TYPE];
+};
+
 struct power8_driver {
 	struct occ_driver *driver;
 	struct device *dev;
 	unsigned long update_interval;
+	unsigned long last_updated;
 	u16 user_powercap;
+	struct mutex update_lock;
+	bool valid;
+	struct occ_response occ_response;
 };
 
-static u8 occ_send_cmd(struct occ_driver *occ, u8 seq, u8 type,
-			    u16 length, u8 *data, u8 *resp)
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
+		kfree(resp->blocks[i].sensor);
+		kfree(resp->blocks[i].power);
+		kfree(resp->blocks[i].caps);
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
+	void *sensor;
+
+	if (!resp->blocks)
+		return NULL;
+
+	if (resp->sensor_block_id[t] == -1)
+		return NULL;
+
+	switch (t) {
+	case TEMP:
+	case FREQ:
+		sensor = resp->blocks[resp->sensor_block_id[t]].sensor;
+		break;
+	case POWER:
+		sensor = resp->blocks[resp->sensor_block_id[t]].power;
+		break;
+	case CAPS:
+		sensor = resp->blocks[resp->sensor_block_id[t]].caps;
+		break;
+	default:
+		sensor = NULL;
+	}
+
+	return sensor;
+}
+
+static int occ_renew_sensor(struct occ_response *resp, u8 sensor_length,
+			    u8 sensor_num, enum sensor_type t, int block)
+{
+	void *sensor;
+	int rc;
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
+		switch (t) {
+		case TEMP:
+		case FREQ:
+			resp->blocks[block].sensor =
+				kcalloc(sensor_num, sizeof(struct occ_sensor),
+					GFP_KERNEL);
+			if (!resp->blocks[block].sensor) {
+				rc = -ENOMEM;
+				goto err;
+			}
+			break;
+		case POWER:
+			resp->blocks[block].power =
+				kcalloc(sensor_num,
+					sizeof(struct power_sensor),
+					GFP_KERNEL);
+			if (!resp->blocks[block].power) {
+				rc = -ENOMEM;
+				goto err;
+			}
+			break;
+		case CAPS:
+			resp->blocks[block].caps =
+				kcalloc(sensor_num, sizeof(struct caps_sensor),
+					GFP_KERNEL);
+			if (!resp->blocks[block].caps) {
+				rc = -ENOMEM;
+				goto err;
+			}
+			break;
+		default:
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
+static int parse_occ_response(struct power8_driver *driver, u8 *data,
+			      struct occ_response *resp)
+{
+	int b;
+	int s;
+	int rc;
+	int dnum = SENSOR_BLOCK_OFFSET;
+	struct occ_sensor *f_sensor;
+	struct occ_sensor *t_sensor;
+	struct power_sensor *p_sensor;
+	struct caps_sensor *c_sensor;
+	u8 sensor_block_num;
+	u8 sensor_type[4];
+	u8 sensor_format;
+	u8 sensor_length;
+	u8 sensor_num;
+	struct device *dev = driver->dev;
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
+			rc = occ_renew_sensor(resp, sensor_length, sensor_num,
+					      FREQ, b);
+			if (rc)
+				continue;
+
+			resp->sensor_block_id[FREQ] = b;
+			for (s = 0; s < sensor_num; s++) {
+				f_sensor = &resp->blocks[b].sensor[s];
+				f_sensor->sensor_id =
+					be16_to_cpup((const __be16 *)
+						     &data[dnum]);
+				f_sensor->value = be16_to_cpup((const __be16 *)
+							      &data[dnum + 2]);
+				dev_dbg(dev,
+					"sensor[%d]-[%d]: id: %u, value: %u\n",
+					b, s, f_sensor->sensor_id,
+					f_sensor->value);
+				dnum = dnum + sensor_length;
+			}
+		} else if (strncmp(sensor_type, "TEMP", 4) == 0) {
+			rc = occ_renew_sensor(resp, sensor_length,
+					      sensor_num, TEMP, b);
+			if (rc)
+				continue;
+
+			resp->sensor_block_id[TEMP] = b;
+			for (s = 0; s < sensor_num; s++) {
+				t_sensor = &resp->blocks[b].sensor[s];
+				t_sensor->sensor_id =
+					be16_to_cpup((const __be16 *)
+						     &data[dnum]);
+				t_sensor->value = be16_to_cpup((const __be16 *)
+							      &data[dnum + 2]);
+				dev_dbg(dev,
+					"sensor[%d]-[%d]: id: %u, value: %u\n",
+					b, s, t_sensor->sensor_id,
+					t_sensor->value);
+				dnum = dnum + sensor_length;
+			}
+		} else if (strncmp(sensor_type, "POWR", 4) == 0) {
+			rc = occ_renew_sensor(resp, sensor_length,
+				sensor_num, POWER, b);
+			if (rc)
+				continue;
+
+			resp->sensor_block_id[POWER] = b;
+			for (s = 0; s < sensor_num; s++) {
+				p_sensor = &resp->blocks[b].power[s];
+				p_sensor->sensor_id =
+					be16_to_cpup((const __be16 *)
+						     &data[dnum]);
+				p_sensor->update_tag =
+					be32_to_cpup((const __be32 *)
+						     &data[dnum + 2]);
+				p_sensor->accumulator =
+					be32_to_cpup((const __be32 *)
+						     &data[dnum + 6]);
+				p_sensor->value = be16_to_cpup((const __be16 *)
+							     &data[dnum + 10]);
+
+				dev_dbg(dev,
+					"sensor[%d]-[%d]: id: %u, value: %u\n",
+					b, s, p_sensor->sensor_id,
+					p_sensor->value);
+
+				dnum = dnum + sensor_length;
+			}
+		} else if (strncmp(sensor_type, "CAPS", 4) == 0) {
+			rc = occ_renew_sensor(resp, sensor_length,
+				sensor_num, CAPS, b);
+			if (rc)
+				continue;
+
+			resp->sensor_block_id[CAPS] = b;
+			for (s = 0; s < sensor_num; s++) {
+				c_sensor = &resp->blocks[b].caps[s];
+				c_sensor->curr_powercap =
+					be16_to_cpup((const __be16 *)
+						     &data[dnum]);
+				c_sensor->curr_powerreading =
+					be16_to_cpup((const __be16 *)
+						     &data[dnum + 2]);
+				c_sensor->norm_powercap =
+					be16_to_cpup((const __be16 *)
+						     &data[dnum + 4]);
+				c_sensor->max_powercap =
+					be16_to_cpup((const __be16 *)
+						     &data[dnum + 6]);
+				c_sensor->min_powercap =
+					be16_to_cpup((const __be16 *)
+						     &data[dnum + 8]);
+				c_sensor->user_powerlimit =
+					be16_to_cpup((const __be16 *)
+						     &data[dnum + 10]);
+
+				dnum = dnum + sensor_length;
+				dev_dbg(dev, "CAPS sensor #%d:\n", s);
+				dev_dbg(dev, "curr_powercap is %x\n",
+					c_sensor->curr_powercap);
+				dev_dbg(dev, "curr_powerreading is %x\n",
+					c_sensor->curr_powerreading);
+				dev_dbg(dev, "norm_powercap is %x\n",
+					c_sensor->norm_powercap);
+				dev_dbg(dev, "max_powercap is %x\n",
+					c_sensor->max_powercap);
+				dev_dbg(dev, "min_powercap is %x\n",
+					c_sensor->min_powercap);
+				dev_dbg(dev, "user_powerlimit is %x\n",
+					c_sensor->user_powerlimit);
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
+static u8 occ_send_cmd(struct occ_driver *occ, u8 seq, u8 type, u16 length,
+		       u8 *data, u8 *resp)
 {
 	u32 cmd1, cmd2;
 	u16 checksum;
@@ -97,6 +485,81 @@ static u8 occ_send_cmd(struct occ_driver *occ, u8 seq, u8 type,
 	return resp[2];
 }
 
+static inline u16 get_occdata_length(u8 *data)
+{
+	return be16_to_cpup((const __be16 *)&data[RESP_DATA_LENGTH]);
+}
+
+static int occ_get_all(struct power8_driver *driver)
+{
+	int i, rc;
+	u8 *occ_data;
+	u16 num_bytes;
+	u8 poll_cmd_data = 0x10;
+	struct device *dev = driver->dev;
+	struct occ_driver *occ = driver->driver;
+	struct occ_response *resp = &driver->occ_response;
+
+	occ_data = devm_kzalloc(dev, OCC_DATA_MAX, GFP_KERNEL);
+	if (!occ_data)
+		return -ENOMEM;
+
+	rc = occ_send_cmd(occ, 0, 0, 1, &poll_cmd_data, occ_data);
+	if (rc) {
+		dev_err(dev, "ERROR: OCC Poll: 0x%x\n", rc);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	num_bytes = get_occdata_length(occ_data);
+
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
+		occ->bus_ops.getscom(occ->bus, OCB_DATA, occ_data, i);
+
+	rc = parse_occ_response(driver, occ_data, resp);
+
+out:
+	devm_kfree(dev, occ_data);
+	return rc;
+}
+
+static int occ_update_device(struct power8_driver *driver)
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
+
 static ssize_t show_update_interval(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
@@ -180,14 +643,28 @@ static void occ_remove_hwmon_attrs(struct power8_driver *driver)
 {
 	struct device *dev = driver->dev;
 
+	device_remove_file(dev, &dev_attr_user_powercap);
 	device_remove_file(dev, &dev_attr_update_interval);
 	device_remove_file(dev, &dev_attr_name);
 }
 
 static int occ_create_hwmon_attrs(struct power8_driver *driver)
 {
-	int rc;
+	int i, rc;
 	struct device *dev = driver->dev;
+	struct occ_response *resp = &driver->occ_response;
+
+	for (i = 0; i < MAX_OCC_SENSOR_TYPE; ++i)
+		resp->sensor_block_id[i] = -1;
+
+	/* read sensor data from occ. */
+	rc = occ_update_device(driver);
+	if (rc != 0) {
+		dev_err(dev, "ERROR: cannot get occ sensor data: %d\n", rc);
+		return rc;
+	}
+	if (!resp->blocks)
+		return -1;
 
 	rc = device_create_file(dev, &dev_attr_name);
 	if (rc)
@@ -197,9 +674,12 @@ static int occ_create_hwmon_attrs(struct power8_driver *driver)
 	if (rc)
 		goto error;
 
-	/* skip powercap for now; we need to determine if CAPS response id
-	 * is present first, which requires polling the OCC
-	 */
+	if (resp->sensor_block_id[CAPS] >= 0) {
+		/* user powercap: only for master OCC */
+		rc = device_create_file(dev, &dev_attr_user_powercap);
+		if (rc)
+			goto error;
+	}
 
 	return 0;
 
-- 
1.9.1
