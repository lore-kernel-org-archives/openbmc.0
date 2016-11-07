Return-Path: <eajames.ibm@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCSxK0ff2zDvQ9
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 10:16:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rd0D+arU"; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id q124so12422581itd.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Nov 2016 15:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=EAauRgXhsIjk8K7AHpoNHRyTXqTZSbmW/keiqp/ue1c=;
 b=rd0D+arUcMXa9eSWBJNB9mfvPpnKzjeahgzSC1D7+sOCw9XsOeDlcmLJjKvOskSxpX
 MNz2TRlKGXc3CpfTzb9n6d70y2WSAwsmw2zYnHCY3ZzcyWciBGKld4pjfxWeLTs4lxc1
 uAJ4Jv/XO3DTCioXp3OpWf/AugwGh1o+EkV4jZSek+DmPJP8XuGNErijNjFsEyNYIE2h
 lbFeC300sa7nKp5XndDZ2Ca7nN+q72+n6CE+q0lKunykecqFkdMBCWuHlJC0QhPaBWJ+
 nHtRxvoGV/WgGF/dpZkm9qO4PvI8i15cBeGhrJoRiV3hbyBrbmtWKhVBMamuih6goO3F
 1+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EAauRgXhsIjk8K7AHpoNHRyTXqTZSbmW/keiqp/ue1c=;
 b=OUWAuFFOkWoPQU6DPFbdjTePzg9se1sXshUDluPhIk7U82jhGAhQ4EY2a2j36vOwyS
 BCTu3IK/xZ1tPNWvfpPXszYZqfZB0GW8JTVHaS4SlsaR7t99UrfFTd47uAoJdSb4wvHa
 W2E1Aq4z6SAgTJE7EF008YfqjuelDmn6s10+sZ53dzW7SpfXtQLEidHYnZgE/ZghaHn+
 JbjTlYkGX4icct7d8NOMM9MztUDFDyb5lDCq3ICD4NKjErc2/udxpiuMAwJ3KaxvkugD
 P4tJMilDP+hR2Jzp80SEGYYMpGVh63IWhurRFOiZknf+KE1pDWjH+60ATgGATvMbItoj
 qzRw==
X-Gm-Message-State: ABUngvf3KX1B3sP+ynIDqEVxLsqHEHyUETrv3rRDr7fzc/wgOGrKqGXmqA+DZeeuKBLeYQ==
X-Received: by 10.107.59.88 with SMTP id i85mr10216512ioa.198.1478560579269;
 Mon, 07 Nov 2016 15:16:19 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id w192sm5025773itw.3.2016.11.07.15.16.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 07 Nov 2016 15:16:18 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v5 4/5] drivers: Add hwmon OCC version specific functions
Date: Mon,  7 Nov 2016 17:16:10 -0600
Message-Id: <1478560570-24129-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Mon, 07 Nov 2016 23:16:21 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Added functions for the P8 OCC and P9 OCC, as well as interfacing to hook
into common code.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/occ.c |  69 +++++++++++++++-
 drivers/hwmon/occ/occ.h |  30 ++++++-
 drivers/hwmon/occ/p8.c  | 185 ++++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/occ/p9.c  | 216 +++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 494 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/occ/occ.c b/drivers/hwmon/occ/occ.c
index 733b935c..b0443ea 100644
--- a/drivers/hwmon/occ/occ.c
+++ b/drivers/hwmon/occ/occ.c
@@ -33,9 +33,64 @@
 struct occ_driver {
 	void *bus;
 	struct occ_bus_ops bus_ops;
+	struct occ_protocol_ops ops;
+	struct occ_protocol protocol;
+	struct device *dev;
+	bool occ_online;
 };
 
-int occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops)
+void * occ_get_sensor(struct occ_driver *driver, int sensor_type)
+{
+	return NULL;
+}
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
+		driver->dev = hwmon_device_register(dev);
+		if (IS_ERR(driver->dev))
+			return PTR_ERR(driver->dev);
+
+		dev_set_drvdata(driver->dev, driver);
+	} else if (val == 0) {
+		if (!driver->occ_online)
+			return count;
+
+		hwmon_device_unregister(driver->dev);
+		driver->dev = NULL;
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
+int occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops,
+	      struct occ_protocol_ops ops, struct occ_protocol protocol)
 {
 	struct occ_driver *driver = devm_kzalloc(dev,
 						 sizeof(struct occ_driver),
@@ -47,16 +102,24 @@ int occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops)
 
 	driver->bus = bus;
 	driver->bus_ops = bus_ops;
+	driver->ops = ops;
+	driver->protocol = protocol;
 
-	return 0;
+	return device_create_file(dev, &dev_attr_online);
 }
 
 int occ_stop(struct device *dev)
 {
 	struct occ_driver *driver = dev_get_drvdata(dev);
 
-	if (driver)
+	device_remove_file(dev, &dev_attr_online);
+
+	if (driver) {
+		if (driver->dev)
+			hwmon_device_unregister(driver->dev);
+
 		devm_kfree(dev, driver);
+	}
 
 	return 0;
 }
diff --git a/drivers/hwmon/occ/occ.h b/drivers/hwmon/occ/occ.h
index 3232251..1d6f130 100644
--- a/drivers/hwmon/occ/occ.h
+++ b/drivers/hwmon/occ/occ.h
@@ -23,8 +23,36 @@
 #include "scom.h"
 
 struct device;
+struct occ_driver;
 
-int occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops);
+enum sensor_type {
+	FREQ = 0,
+	TEMP,
+	POWER,
+	CAPS,
+	MAX_OCC_SENSOR_TYPE
+};
+
+struct occ_protocol_ops {
+	void (*parse_sensor)(u8 *data, void *sensor, int sensor_type, int off,
+			     int snum);
+	void *(*alloc_sensor)(int sensor_type, int num_sensors);
+	int (*get_sensor_value)(void *driver, int sensor_type, int snum);
+	int (*get_sensor_id)(void *driver, int sensor_type, int snum);
+	int (*get_caps_value)(void *sensor, int snum, int caps_field);
+};
+
+struct occ_protocol {
+	unsigned int num_caps_fields;
+	char **caps_names;
+	u32 command_addr;
+	u32 response_addr;
+};
+
+int occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops,
+	      struct occ_protocol_ops ops, struct occ_protocol protocol);
 int occ_stop(struct device *dev);
 
+void *occ_get_sensor(struct occ_driver *driver, int sensor_type);
+
 #endif /* __OCC_H__ */
diff --git a/drivers/hwmon/occ/p8.c b/drivers/hwmon/occ/p8.c
index 6ff6764..e8d8d98 100644
--- a/drivers/hwmon/occ/p8.c
+++ b/drivers/hwmon/occ/p8.c
@@ -28,9 +28,192 @@
 
 #include "occ.h"
 
+/* P8 OCC sensor data format */
+struct occ_sensor_p8 {
+	u16 sensor_id;
+	u16 value;
+};
+
+struct power_sensor_p8 {
+	u16 sensor_id;
+	u32 update_tag;
+	u32 accumulator;
+	u16 value;
+};
+
+struct caps_sensor_p8 {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+};
+
+static char *caps_sensor_names[] = {
+	"curr_powercap",
+	"curr_powerreading",
+	"norm_powercap",
+	"max_powercap",
+	"min_powercap",
+	"user_powerlimit"
+};
+
+void p8_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
+		     int snum)
+{
+	switch (sensor_type) {
+		case FREQ:
+		case TEMP:
+		{
+			struct occ_sensor_p8 *os =
+				&(((struct occ_sensor_p8 *)sensor)[snum]);
+			os->sensor_id =
+				be16_to_cpup((const __be16 *)&data[off]);
+			os->value =
+				be16_to_cpup((const __be16 *)&data[off + 2]);
+		}
+			break;
+		case POWER:
+		{
+			struct power_sensor_p8 *ps =
+				&(((struct power_sensor_p8 *)sensor)[snum]);
+			ps->sensor_id =
+				be16_to_cpup((const __be16 *)&data[off]);
+			ps->update_tag =
+				be32_to_cpup((const __be32 *)&data[off + 2]);
+			ps->accumulator =
+				be32_to_cpup((const __be32 *)&data[off + 6]);
+			ps->value =
+				be16_to_cpup((const __be16 *)&data[off + 10]);
+		}
+			break;
+		case CAPS:
+		{
+			struct caps_sensor_p8 *cs =
+				&(((struct caps_sensor_p8 *)sensor)[snum]);
+			cs->curr_powercap =
+				be16_to_cpup((const __be16 *)&data[off]);
+			cs->curr_powerreading =
+				be16_to_cpup((const __be16 *)&data[off + 2]);
+			cs->norm_powercap =
+				be16_to_cpup((const __be16 *)&data[off + 4]);
+			cs->max_powercap =
+				be16_to_cpup((const __be16 *)&data[off + 6]);
+			cs->min_powercap =
+				be16_to_cpup((const __be16 *)&data[off + 8]);
+			cs->user_powerlimit =
+				be16_to_cpup((const __be16 *)&data[off + 10]);
+		}
+			break;
+	};
+}
+
+void * p8_alloc_sensor(int sensor_type, int num_sensors)
+{
+	switch (sensor_type) {
+		case FREQ:
+		case TEMP:
+			return kcalloc(num_sensors,
+				       sizeof(struct occ_sensor_p8),
+				       GFP_KERNEL);
+		case POWER:
+			return kcalloc(num_sensors,
+				       sizeof(struct power_sensor_p8),
+				       GFP_KERNEL);
+		case CAPS:
+			return kcalloc(num_sensors,
+				       sizeof(struct caps_sensor_p8),
+				       GFP_KERNEL);
+		default:
+			return NULL;
+	}
+}
+
+int p8_get_sensor_value(void *driver, int sensor_type, int snum)
+{
+	void *sensor;
+
+	if (sensor_type == CAPS)
+		return -1;
+
+	sensor = occ_get_sensor(driver, sensor_type);
+	if (!sensor)
+		return -1;
+
+	switch (sensor_type) {
+		case FREQ:
+		case TEMP:
+			return ((struct occ_sensor_p8 *)sensor)[snum].value;
+		case POWER:
+			return ((struct power_sensor_p8 *)sensor)[snum].value;
+		default:
+			return -1;
+	}
+}
+
+int p8_get_sensor_id(void *driver, int sensor_type, int snum)
+{
+	void *sensor;
+	int i = snum;
+
+	if (sensor_type == CAPS)
+		return -1;
+
+	sensor = occ_get_sensor(driver, sensor_type);
+	if (!sensor)
+		return -1;
+
+	switch (sensor_type) {
+		case FREQ:
+		case TEMP:
+			return ((struct occ_sensor_p8 *)sensor)[i].sensor_id;
+		case POWER:
+			return ((struct power_sensor_p8 *)sensor)[i].sensor_id;
+		default:
+			return -1;
+	}
+}
+
+int p8_get_caps_value(void *sensor, int snum, int caps_field)
+{
+	struct caps_sensor_p8 *caps_sensor = sensor;
+
+	switch (caps_field) {
+	case 0:
+		return caps_sensor[snum].curr_powercap;
+	case 1:
+		return caps_sensor[snum].curr_powerreading;
+	case 2:
+		return caps_sensor[snum].norm_powercap;
+	case 3:
+		return caps_sensor[snum].max_powercap;
+	case 4:
+		return caps_sensor[snum].min_powercap;
+	case 5:
+		return caps_sensor[snum].user_powerlimit;
+	default:
+		return -1;
+	}
+}
+
 int p8_occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops)
 {
-	return occ_start(dev, bus, bus_ops);
+	struct occ_protocol_ops protocol_ops;
+	struct occ_protocol protocol;
+
+	protocol_ops.parse_sensor = p8_parse_sensor;
+	protocol_ops.alloc_sensor = p8_alloc_sensor;
+	protocol_ops.get_sensor_value = p8_get_sensor_value;
+	protocol_ops.get_sensor_id = p8_get_sensor_id;
+	protocol_ops.get_caps_value = p8_get_caps_value;
+
+	protocol.num_caps_fields = 6;
+	protocol.caps_names = caps_sensor_names;
+	protocol.command_addr = 0xFFFF6000;
+	protocol.response_addr = 0xFFFF7000;
+
+	return occ_start(dev, bus, bus_ops, protocol_ops, protocol);
 }
 
 int p8_occ_stop(struct device *dev)
diff --git a/drivers/hwmon/occ/p9.c b/drivers/hwmon/occ/p9.c
index f1aa8ac..907bc11 100644
--- a/drivers/hwmon/occ/p9.c
+++ b/drivers/hwmon/occ/p9.c
@@ -28,9 +28,223 @@
 
 #include "occ.h"
 
+/* P9 OCC sensor data format */
+struct temp_sensor_p9 {
+	u32 sensor_id;
+	u8 fru_type;
+	u8 value;
+};
+
+struct freq_sensor_p9 {
+	u32 sensor_id;
+	u16 value;
+};
+
+struct power_sensor_p9 {
+	u32 sensor_id;
+	u8 function_id;
+	u8 apss_channel;
+	u16 reserved;
+	u32 update_tag;
+	u64 accumulator;
+	u16 value;
+};
+
+struct caps_sensor_p9 {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+	u8 user_powerlimit_source;
+};
+
+static char *caps_sensor_names[] = {
+	"curr_powercap",
+	"curr_powerreading",
+	"norm_powercap",
+	"max_powercap",
+	"min_powercap",
+	"user_powerlimit",
+	"user_powerlimit_source"
+};
+
+void p9_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
+		     int snum)
+{
+	switch (sensor_type) {
+		case FREQ:
+		{
+			struct freq_sensor_p9 *fs =
+				&(((struct freq_sensor_p9 *)sensor)[snum]);
+			fs->sensor_id =
+				be32_to_cpup((const __be32 *)&data[off]);
+			fs->value =
+				be16_to_cpup((const __be16 *)&data[off + 4]);
+		}
+			break;
+		case TEMP:
+		{
+			struct temp_sensor_p9 *ts =
+				&(((struct temp_sensor_p9 *)sensor)[snum]);
+			ts->sensor_id =
+				be32_to_cpup((const __be32 *)&data[off]);
+			ts->fru_type = data[off + 4];
+			ts->value = data[off + 5];
+		}
+			break;
+		case POWER:
+		{
+			struct power_sensor_p9 *ps =
+				&(((struct power_sensor_p9 *)sensor)[snum]);
+			ps->sensor_id =
+				be32_to_cpup((const __be32 *)&data[off]);
+			ps->function_id = data[off + 4];
+			ps->apss_channel = data[off + 5];
+			/* two bytes reserved */
+			ps->update_tag =
+				be32_to_cpup((const __be32 *)&data[off + 8]);
+			ps->accumulator =
+				be64_to_cpup((const __be64 *)&data[off + 12]);
+			ps->value =
+				be16_to_cpup((const __be16 *)&data[off + 20]);
+		}
+			break;
+		case CAPS:
+		{
+			struct caps_sensor_p9 *cs =
+				&(((struct caps_sensor_p9 *)sensor)[snum]);
+			cs->curr_powercap =
+				be16_to_cpup((const __be16 *)&data[off]);
+			cs->curr_powerreading =
+				be16_to_cpup((const __be16 *)&data[off + 2]);
+			cs->norm_powercap =
+				be16_to_cpup((const __be16 *)&data[off + 4]);
+			cs->max_powercap =
+				be16_to_cpup((const __be16 *)&data[off + 6]);
+			cs->min_powercap =
+				be16_to_cpup((const __be16 *)&data[off + 8]);
+			cs->user_powerlimit =
+				be16_to_cpup((const __be16 *)&data[off + 10]);
+			cs->user_powerlimit_source = data[off + 12];
+		}
+			break;
+	};
+}
+
+void * p9_alloc_sensor(int sensor_type, int num_sensors)
+{
+	switch (sensor_type) {
+		case FREQ:
+			return kcalloc(num_sensors,
+				       sizeof(struct freq_sensor_p9),
+				       GFP_KERNEL);
+		case TEMP:
+			return kcalloc(num_sensors,
+				       sizeof(struct temp_sensor_p9),
+				       GFP_KERNEL);
+		case POWER:
+			return kcalloc(num_sensors,
+				       sizeof(struct power_sensor_p9),
+				       GFP_KERNEL);
+		case CAPS:
+			return kcalloc(num_sensors,
+				       sizeof(struct caps_sensor_p9),
+				       GFP_KERNEL);
+		default:
+			return NULL;
+	}
+}
+
+int p9_get_sensor_value(void *driver, int sensor_type, int snum)
+{
+	void *sensor;
+
+	if (sensor_type == CAPS)
+		return -1;
+
+	sensor = occ_get_sensor(driver, sensor_type);
+	if (!sensor)
+		return -1;
+
+	switch (sensor_type) {
+		case FREQ:
+			return ((struct freq_sensor_p9 *)sensor)[snum].value; 
+		case TEMP:
+			return ((struct temp_sensor_p9 *)sensor)[snum].value;
+		case POWER:
+			return ((struct power_sensor_p9 *)sensor)[snum].value;
+		default:
+			return -1;
+	}
+}
+
+int p9_get_sensor_id(void *driver, int sensor_type, int snum)
+{
+	void *sensor;
+	int i = snum;
+
+	if (sensor_type == CAPS)
+		return -1;
+
+	sensor = occ_get_sensor(driver, sensor_type);
+	if (!sensor)
+		return -1;
+
+	switch (sensor_type) {
+		case FREQ:
+			return ((struct freq_sensor_p9 *)sensor)[i].sensor_id;
+		case TEMP:
+			return ((struct temp_sensor_p9 *)sensor)[i].sensor_id;
+		case POWER:
+			return ((struct power_sensor_p9 *)sensor)[i].sensor_id;
+		default:
+			return -1;
+	}
+}
+
+int p9_get_caps_value(void *sensor, int snum, int caps_field)
+{
+	struct caps_sensor_p9 *caps_sensor = sensor;
+
+	switch (caps_field) {
+	case 0:
+		return caps_sensor[snum].curr_powercap;
+	case 1:
+		return caps_sensor[snum].curr_powerreading;
+	case 2:
+		return caps_sensor[snum].norm_powercap;
+	case 3:
+		return caps_sensor[snum].max_powercap;
+	case 4:
+		return caps_sensor[snum].min_powercap;
+	case 5:
+		return caps_sensor[snum].user_powerlimit;
+	case 6:
+		return caps_sensor[snum].user_powerlimit_source;
+	default:
+		return -1;
+	}
+}
+
 int p9_occ_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops)
 {
-	return occ_start(dev, bus, bus_ops);
+	struct occ_protocol_ops protocol_ops;
+	struct occ_protocol protocol;
+
+	protocol_ops.parse_sensor = p9_parse_sensor;
+	protocol_ops.alloc_sensor = p9_alloc_sensor;
+	protocol_ops.get_sensor_value = p9_get_sensor_value;
+	protocol_ops.get_sensor_id = p9_get_sensor_id;
+	protocol_ops.get_caps_value = p9_get_caps_value;
+
+	protocol.num_caps_fields = 7;
+	protocol.caps_names = caps_sensor_names;
+	protocol.command_addr = 0xFFFBE000;
+	protocol.response_addr = 0xFFFBF000;
+
+	return occ_start(dev, bus, bus_ops, protocol_ops, protocol);
 }
 
 int p9_occ_stop(struct device *dev)
-- 
1.9.1
