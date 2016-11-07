Return-Path: <eajames.ibm@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCSxY3yMHzDvPj
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 10:16:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LpBVsUH/"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id b123so7191876itb.2
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 15:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=tUciZFNhg9CwTxSpMuW701yn4rHdEp3lXW/oN7aiEm4=;
 b=LpBVsUH/oQYP6cVgjSuGueoq+mo+5JZSOj0ErgCa9BVhCpMsjhiOCx026ZUD80uziA
 jfox+wkw+l4q9Uor+gqB696oaD1eMMPMK8IokOe+PDhaeOAYAwA/2E8QtDQKKE4RgO+C
 pS8jVanWux/ysiAGf56BL0WuGa8JJO1cU4Yuz4aL+ycUTbajQa8gpTcrRH5fNC3NcAQZ
 RBjdghkYE+8+kfpbsvkm7+9HCDKvthXT5SHqxrC5OThryz2LEiDts1nihtoDN0SckAFr
 8kV674+wBbErUxb6ZAiy05XhxYgaJKOMe09vkQDTvyRFEerUdEOzye+3yJJgdtlZocqV
 gizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tUciZFNhg9CwTxSpMuW701yn4rHdEp3lXW/oN7aiEm4=;
 b=ZuyerBlMPB1QtEc1j4pLnjkkhcBwYhII3gZxibPYQRZpbr/R7iG/jbK48tOexSPP8k
 hJjQjNi1+lPCerNxABjPScHX5QlB1rJYvJ30ykoTT0wdmTIPhAzoRpczCvV7PlRKediQ
 EoYdn0AO62fmuqGCUzNU5G2pWMl8ubkOHe4ZU/E71LV0cnnp8uGYS+MYV7FKVvqFZ9vG
 hyJjfk1G/UYbe01GG+BdsISUqm0U8P9oqXwcY2SXDY27SOh3evDrud/FkL3PCYLF4++I
 /eGxdQ8ehlVhi91nIAFiJyo4SGUDQ3le3x+2Nf2mKKHbuPlMcQ62L4BUm/pxODEHzSma
 5iPw==
X-Gm-Message-State: ABUngvdrRCpGsP7joSZs7VAiykyraT/RodOnZhULdZtlO8zJ8FyGMnh7VApGBLONfrYpiw==
X-Received: by 10.36.1.79 with SMTP id 76mr8935994itk.123.1478560591620;
 Mon, 07 Nov 2016 15:16:31 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id q19sm11012754ioi.36.2016.11.07.15.16.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 07 Nov 2016 15:16:30 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v5 5/5] drivers: OCC hwmon driver and sysfs
Date: Mon,  7 Nov 2016 17:16:22 -0600
Message-Id: <1478560582-24197-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Mon, 07 Nov 2016 23:16:34 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add functionality to poll OCC and make sensor data available over hwmon
sysfs.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/occ.c | 769 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 766 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
index b0443ea..cbec394 100644
--- a/drivers/hwmon/occ/occ.c
+++ b/drivers/hwmon/occ/occ.c
@@ -30,18 +30,768 @@
 
 #include "occ.h"
 
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
+struct sensor_data_block {
+	u8 sensor_type[4];
+	u8 reserved0;
+	u8 sensor_format;
+	u8 sensor_length;
+	u8 sensor_num;
+	void *sensors;
+};
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
+	struct sensor_data_block *blocks;
+	u16 chk_sum;
+	int sensor_block_id[MAX_OCC_SENSOR_TYPE];
+};
+
+struct sensor_attr_data {
+	enum sensor_type type;
+	u32 hwmon_index;
+	u32 attr_id;
+	char name[MAX_SENSOR_ATTR_LEN];
+	struct device_attribute dev_attr;
+};
+
+struct sensor_group {
+	char *name;
+	struct sensor_attr_data *sattr;
+	struct attribute_group group;
+};
+
 struct occ_driver {
 	void *bus;
 	struct occ_bus_ops bus_ops;
 	struct occ_protocol_ops ops;
 	struct occ_protocol protocol;
 	struct device *dev;
+	unsigned long update_interval;
+	unsigned long last_updated;
+	u16 user_powercap;
+	struct mutex update_lock;
 	bool occ_online;
+	bool valid;
+	struct occ_response occ_response;
+	struct sensor_group sensor_groups[MAX_OCC_SENSOR_TYPE];
 };
 
-void * occ_get_sensor(struct occ_driver *driver, int sensor_type)
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
+static int occ_renew_sensor(struct occ_driver *driver, u8 sensor_length,
+			    u8 sensor_num, enum sensor_type t, int block)
+{
+	void *sensor;
+	int rc;
+	struct occ_response *resp = &driver->occ_response;
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
+static int parse_occ_response(struct occ_driver *driver, u8 *data,
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
+static u8 occ_send_cmd(struct occ_driver *driver, u8 seq, u8 type, u16 length,
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
+				driver->protocol.command_addr, 0x00000000);
+	driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
+				driver->protocol.command_addr, 0x00000000);
+	driver->bus_ops.putscom(driver->bus, OCB_DATA, cmd1, cmd2);
+
+	/* Trigger attention */
+	driver->bus_ops.putscom(driver->bus, ATTN_DATA, 0x01010000,
+				0x00000000);
+
+	/* Get response data */
+	driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
+				driver->protocol.response_addr, 0x00000000);
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
+static int occ_get_all(struct occ_driver *driver)
+{
+	int i = 0, rc;
+	u8 *occ_data;
+	u16 num_bytes;
+	u8 poll_cmd_data = 0x10;
+	struct device *dev = driver->dev;
+	struct occ_response *resp = &driver->occ_response;
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
+static int occ_update_device(struct occ_driver *driver)
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
+void *occ_get_sensor(struct occ_driver *driver, int sensor_type)
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
+	return occ_get_sensor_by_type(&driver->occ_response, sensor_type);
+}
+
+static ssize_t show_input(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	int val;
+	struct sensor_attr_data *sdata = container_of(attr,
+						      struct sensor_attr_data,
+						      dev_attr);
+	struct occ_driver *driver = dev_get_drvdata(dev);
+
+	val = driver->ops.get_sensor_value(driver, sdata->type,
+					   sdata->hwmon_index - 1);
+	if (sdata->type == TEMP)
+		val *= 1000;	/* in millidegree Celsius */
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
+static ssize_t show_label(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	int val;
+	struct sensor_attr_data *sdata = container_of(attr,
+						      struct sensor_attr_data,
+						      dev_attr);
+	struct occ_driver *driver = dev_get_drvdata(dev);
+
+	val = driver->ops.get_sensor_id(driver, sdata->type,
+					sdata->hwmon_index - 1);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
+static ssize_t show_caps(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	int val;
+	struct caps_sensor *sensor;
+	struct sensor_attr_data *sdata = container_of(attr,
+						      struct sensor_attr_data,
+						      dev_attr);
+	struct occ_driver *driver = dev_get_drvdata(dev);
+
+	sensor = occ_get_sensor(driver, CAPS);
+	if (!sensor) {
+		val = -1;
+		return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+	}
+
+	val = driver->ops.get_caps_value(sensor, sdata->hwmon_index -1,
+					 sdata->attr_id);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
+static ssize_t show_update_interval(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct occ_driver *driver = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n",
+			jiffies_to_msecs(driver->update_interval));
+}
+
+static ssize_t store_update_interval(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct occ_driver *driver = dev_get_drvdata(dev);
+	unsigned long val;
+	int rc;
+
+	rc = kstrtoul(buf, 10, &val);
+	if (rc)
+		return rc;
+
+	driver->update_interval = msecs_to_jiffies(val);
+
+	return count;
+}
+
+static DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO, show_update_interval,
+		   store_update_interval);
+
+static ssize_t show_name(struct device *dev,
+			 struct device_attribute *attr, char *buf)
 {
-	return NULL;
+	return snprintf(buf, PAGE_SIZE - 1, "occ\n");
+}
+
+static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+
+static ssize_t show_user_powercap(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct occ_driver *driver = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", driver->user_powercap);
+}
+
+static ssize_t store_user_powercap(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct occ_driver *driver = dev_get_drvdata(dev);
+	u16 val;
+	u8 resp[8];
+	int rc;
+
+	rc = kstrtou16(buf, 10, &val);
+	if (rc)
+		return rc;
+
+	dev_dbg(dev, "set user powercap to: %u\n", val);
+	val = cpu_to_le16(val);
+	rc = occ_send_cmd(driver, 0, 0x22, 2, (u8 *)&val, resp);
+	if (rc != 0) {
+		dev_err(dev,
+			"ERROR: Set User Powercap: wrong return status: %x\n",
+			rc);
+		if (rc == 0x13)
+			dev_info(dev,
+				 "ERROR: set invalid powercap value: %x\n",
+				 val);
+		return -EINVAL;
+	}
+
+	driver->user_powercap = val;
+	return count;
+}
+
+static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO, show_user_powercap,
+		   store_user_powercap);
+
+static void deinit_sensor_groups(struct device *dev,
+				 struct sensor_group *sensor_groups)
+{
+	int cnt;
+
+	for (cnt = 0; cnt < MAX_OCC_SENSOR_TYPE; cnt++) {
+		if (sensor_groups[cnt].group.attrs)
+			devm_kfree(dev, sensor_groups[cnt].group.attrs);
+		if (sensor_groups[cnt].sattr)
+			devm_kfree(dev, sensor_groups[cnt].sattr);
+		sensor_groups[cnt].group.attrs = NULL;
+		sensor_groups[cnt].sattr = NULL;
+	}
+}
+
+static void sensor_attr_init(struct sensor_attr_data *sdata,
+			     char *sensor_group_name,
+			     char *attr_name,
+			     ssize_t (*show)(struct device *dev,
+					     struct device_attribute *attr,
+					     char *buf))
+{
+	sysfs_attr_init(&sdata->dev_attr.attr);
+
+	snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
+		 sensor_group_name, sdata->hwmon_index, attr_name);
+	sdata->dev_attr.attr.name = sdata->name;
+	sdata->dev_attr.attr.mode = S_IRUGO;
+	sdata->dev_attr.show = show;
+}
+
+static int create_sensor_group(struct occ_driver *driver,
+			       enum sensor_type type, int sensor_num)
+{
+	struct device *dev = driver->dev;
+	struct sensor_group *sensor_groups = driver->sensor_groups;
+	struct sensor_attr_data *sdata;
+	int rc, cnt;
+
+	/* each sensor has 'label' and 'input' attributes */
+	sensor_groups[type].group.attrs =
+		devm_kzalloc(dev, sizeof(struct attribute *) *
+			     sensor_num * 2 + 1, GFP_KERNEL);
+	if (!sensor_groups[type].group.attrs) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	sensor_groups[type].sattr =
+		devm_kzalloc(dev, sizeof(struct sensor_attr_data) *
+			     sensor_num * 2, GFP_KERNEL);
+	if (!sensor_groups[type].sattr) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	for (cnt = 0; cnt < sensor_num; cnt++) {
+		sdata = &sensor_groups[type].sattr[cnt];
+		/* hwmon attributes index starts from 1 */
+		sdata->hwmon_index = cnt + 1;
+		sdata->type = type;
+		sensor_attr_init(sdata, sensor_groups[type].name, "input",
+				 show_input);
+		sensor_groups[type].group.attrs[cnt] = &sdata->dev_attr.attr;
+
+		sdata = &sensor_groups[type].sattr[cnt + sensor_num];
+		sdata->hwmon_index = cnt + 1;
+		sdata->type = type;
+		sensor_attr_init(sdata, sensor_groups[type].name, "label",
+				 show_label);
+		sensor_groups[type].group.attrs[cnt + sensor_num] =
+			&sdata->dev_attr.attr;
+	}
+
+	rc = sysfs_create_group(&dev->kobj, &sensor_groups[type].group);
+	if (rc)
+		goto err;
+
+	return 0;
+err:
+	deinit_sensor_groups(dev, sensor_groups);
+	return rc;
+}
+
+static void caps_sensor_attr_init(struct sensor_attr_data *sdata,
+				  char *attr_name, uint32_t hwmon_index,
+				  uint32_t attr_id)
+{
+	sdata->type = CAPS;
+	sdata->hwmon_index = hwmon_index;
+	sdata->attr_id = attr_id;
+
+	snprintf(sdata->name, MAX_SENSOR_ATTR_LEN, "%s%d_%s",
+		 "caps", sdata->hwmon_index, attr_name);
+
+	sysfs_attr_init(&sdata->dev_attr.attr);
+	sdata->dev_attr.attr.name = sdata->name;
+	sdata->dev_attr.attr.mode = S_IRUGO;
+	sdata->dev_attr.show = show_caps;
+}
+
+static int create_caps_sensor_group(struct occ_driver *driver,
+				    int sensor_num)
+{
+	struct device *dev = driver->dev;
+	struct sensor_group *sensor_groups = driver->sensor_groups;
+	int field_num = driver->protocol.num_caps_fields;
+	struct sensor_attr_data *sdata;
+	int i, j, rc;
+
+	sensor_groups[CAPS].group.attrs =
+		devm_kzalloc(dev, sizeof(struct attribute *) * sensor_num *
+			     field_num + 1, GFP_KERNEL);
+	if (!sensor_groups[CAPS].group.attrs) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	sensor_groups[CAPS].sattr =
+		devm_kzalloc(dev, sizeof(struct sensor_attr_data) *
+			     sensor_num * field_num, GFP_KERNEL);
+	if (!sensor_groups[CAPS].sattr) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	for (j = 0; j < sensor_num; ++j) {
+		for (i = 0; i < field_num; ++i) {
+			sdata = &sensor_groups[CAPS].sattr[j * field_num + i];
+			caps_sensor_attr_init(sdata,
+					      driver->protocol.caps_names[i],
+					      j + 1, i);
+			sensor_groups[CAPS].group.attrs[j * field_num + i] =
+				&sdata->dev_attr.attr;
+		}
+	}
+
+	rc = sysfs_create_group(&dev->kobj, &sensor_groups[CAPS].group);
+	if (rc)
+		goto err;
+
+	return rc;
+err:
+	deinit_sensor_groups(dev, sensor_groups);
+	return rc;
+}
+
+static void occ_remove_hwmon_attrs(struct occ_driver *driver)
+{
+	struct device *dev = driver->dev;
+
+	device_remove_file(dev, &dev_attr_user_powercap);
+	device_remove_file(dev, &dev_attr_update_interval);
+	device_remove_file(dev, &dev_attr_name);
+}
+
+static int occ_create_hwmon_attrs(struct occ_driver *driver)
+{
+	int i, rc, id, sensor_num;
+	struct device *dev = driver->dev;
+	struct sensor_group *sensor_groups = driver->sensor_groups;
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
+
+	rc = device_create_file(dev, &dev_attr_name);
+	if (rc)
+		goto error;
+
+	rc = device_create_file(dev, &dev_attr_update_interval);
+	if (rc)
+		goto error;
+
+	if (resp->sensor_block_id[CAPS] >= 0) {
+		/* user powercap: only for master OCC */
+		rc = device_create_file(dev, &dev_attr_user_powercap);
+		if (rc)
+			goto error;
+	}
+
+	sensor_groups[FREQ].name = "freq";
+	sensor_groups[TEMP].name = "temp";
+	sensor_groups[POWER].name = "power";
+	sensor_groups[CAPS].name =  "caps";
+
+	for (i = 0; i < MAX_OCC_SENSOR_TYPE; i++) {
+		id = resp->sensor_block_id[i];
+		if (id < 0)
+			continue;
+
+		sensor_num = resp->blocks[id].sensor_num;
+		if (i == CAPS)
+			rc = create_caps_sensor_group(driver, sensor_num);
+		else
+			rc = create_sensor_group(driver, i, sensor_num);
+		if (rc)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	dev_err(dev, "ERROR: cannot create hwmon attributes: %d\n", rc);
+	occ_remove_hwmon_attrs(driver);
+	return rc;
 }
 
 static ssize_t show_occ_online(struct device *dev,
@@ -73,10 +823,18 @@ static ssize_t store_occ_online(struct device *dev,
 			return PTR_ERR(driver->dev);
 
 		dev_set_drvdata(driver->dev, driver);
+
+		rc = occ_create_hwmon_attrs(driver);
+		if (rc) {
+			hwmon_device_unregister(driver->dev);
+			driver->dev = NULL;
+			return rc;
+		}
 	} else if (val == 0) {
 		if (!driver->occ_online)
 			return count;
 
+		occ_remove_hwmon_attrs(driver);
 		hwmon_device_unregister(driver->dev);
 		driver->dev = NULL;
 	} else
@@ -105,6 +863,9 @@ int occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops,
 	driver->ops = ops;
 	driver->protocol = protocol;
 
+	driver->update_interval = HZ;
+	mutex_init(&driver->update_lock);
+
 	return device_create_file(dev, &dev_attr_online);
 }
 
@@ -115,8 +876,10 @@ int occ_stop(struct device *dev)
 	device_remove_file(dev, &dev_attr_online);
 
 	if (driver) {
-		if (driver->dev)
+		if (driver->dev) {
+			occ_remove_hwmon_attrs(driver);
 			hwmon_device_unregister(driver->dev);
+		}
 
 		devm_kfree(dev, driver);
 	}
-- 
1.9.1
