Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw43Q1WsGzDt2G
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 08:43:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=y5RW/8GU; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id n189so7199917qke.1
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 14:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=sKoN8qlWD37rXF/zGDU0GIVdwmzdLmyRR0ou28WCZhU=;
 b=y5RW/8GUe4vJGaAUTrtQfcNYsqxqAHSif9f72Mt9HN1YtqZe8vLSQELiXI0bT3OHB4
 /umg3Xrf9aQlIXBqNon4b6wP7aZMNuiB1gC9AYsDYKYjBjbx5iFlMZD2aihrV0MHeX4F
 /GVr+tZHp84vBhsKccX0X/oG/BSSCEbWLh5yMwdpztMtoxm2eqk/upF+njdIKtRKtA+2
 pM2sfvY1+pVyoZlckao8BHSWOPoyeG5WB0M4f+AQo3Cw8lq9wH733Yn8AtnpLK6VWdb1
 YxUbCKUOLuRV1k9+YBbV5izb3GqfmlP2Bo2NSsSULAkfo5TyltX/+cgXqKS4SOWQwhR8
 a4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sKoN8qlWD37rXF/zGDU0GIVdwmzdLmyRR0ou28WCZhU=;
 b=Ny7TE0+ECc46+45C6NzFWwtRogmrBEfBWMwIgeG1FgAmcUzaAFOzjd7e8mrTCs7/oz
 n23myywnPdqgbzsaGc3YvaT15ditflVMYChpljokkWRtFVItMyDg+OB+k6XeNuGCf4Zd
 wGHPK0XaMkfCaQnVouyIO4znP5u4kzVDZSdcFY/x/lW4/EiDzmJ4IvFWf7vDDWLsJf0O
 fOnXNvTN2JgPtTcP921Ol4zLFrHn/POPSp96wLArSwlfrebf+a5QAs8WPyG3Jz8Qm24r
 BZZzio5TTPqpqK/PpZywc42o6KRlcIuOY5THAhPrKYVxpYxwsuIENH9gsdvsUzCXp9SW
 WFkw==
X-Gm-Message-State: AA6/9RngOG+fu77JaeiwbeiCipX/M24mQooEEnoC7DhMUjOaQEpMpGbzgwLzC9k/GrpDKw==
X-Received: by 10.55.10.15 with SMTP id 15mr7954410qkk.99.1476394992317;
 Thu, 13 Oct 2016 14:43:12 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.53])
 by smtp.gmail.com with ESMTPSA id h14sm5848052qth.44.2016.10.13.14.43.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Oct 2016 14:43:11 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux v4 5/6] hwmon: Add OCC sensor groups
Date: Thu, 13 Oct 2016 16:43:01 -0500
Message-Id: <1476394981-17226-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 21:43:14 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add sensor groups for all frequency, temperature, and power sensors on the
OCC. Sysfs attributes for the sensor label and input.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/power8_occ.c | 203 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 202 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/power8_occ.c b/drivers/hwmon/occ/power8_occ.c
index f0f14ec..d264bf5 100644
--- a/drivers/hwmon/occ/power8_occ.c
+++ b/drivers/hwmon/occ/power8_occ.c
@@ -53,6 +53,8 @@
 #define SENSOR_BLOCK_NUM_OFFSET	43
 #define SENSOR_BLOCK_OFFSET	45
 
+#define MAX_SENSOR_ATTR_LEN	32
+
 enum sensor_type {
 	FREQ = 0,
 	TEMP,
@@ -124,6 +126,20 @@ struct occ_response {
 	int sensor_block_id[MAX_OCC_SENSOR_TYPE];
 };
 
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
 struct power8_driver {
 	struct occ_driver *driver;
 	struct device *dev;
@@ -133,6 +149,7 @@ struct power8_driver {
 	struct mutex update_lock;
 	bool valid;
 	struct occ_response occ_response;
+	struct sensor_group sensor_groups[MAX_OCC_SENSOR_TYPE];
 };
 
 static void deinit_occ_resp_buf(struct occ_response *resp)
@@ -560,6 +577,88 @@ static int occ_update_device(struct power8_driver *driver)
 	return rc;
 }
 
+static void *occ_get_sensor(struct power8_driver *driver,
+			    enum sensor_type t)
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
+	return occ_get_sensor_by_type(&driver->occ_response, t);
+}
+
+static int occ_get_sensor_value(struct power8_driver *driver,
+				enum sensor_type t, int index)
+{
+	void *sensor;
+
+	if (t == CAPS)
+		return -1;
+
+	sensor = occ_get_sensor(driver, t);
+	if (!sensor)
+		return -1;
+
+	if (t == POWER)
+		return ((struct power_sensor *)sensor)[index].value;
+
+	return ((struct occ_sensor *)sensor)[index].value;
+}
+
+static int occ_get_sensor_id(struct power8_driver *driver,
+			     enum sensor_type t, int index)
+{
+	void *sensor;
+
+	if (t == CAPS)
+		return -1;
+
+	sensor = occ_get_sensor(driver, t);
+	if (!sensor)
+		return -1;
+
+	if (t == POWER)
+		return ((struct power_sensor *)sensor)[index].sensor_id;
+
+	return ((struct occ_sensor *)sensor)[index].sensor_id;
+}
+
+static ssize_t show_input(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	int val;
+	struct sensor_attr_data *sdata = container_of(attr,
+						      struct sensor_attr_data,
+						      dev_attr);
+	struct power8_driver *driver = dev_get_drvdata(dev);
+
+	val = occ_get_sensor_value(driver, sdata->type,
+				   sdata->hwmon_index - 1);
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
+	struct power8_driver *driver = dev_get_drvdata(dev);
+
+	val = occ_get_sensor_id(driver, sdata->type, sdata->hwmon_index - 1);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
 static ssize_t show_update_interval(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
@@ -639,6 +738,90 @@ static ssize_t store_user_powercap(struct device *dev,
 static DEVICE_ATTR(user_powercap, S_IWUSR | S_IRUGO, show_user_powercap,
 		   store_user_powercap);
 
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
+static int create_sensor_group(struct power8_driver *driver,
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
 static void occ_remove_hwmon_attrs(struct power8_driver *driver)
 {
 	struct device *dev = driver->dev;
@@ -650,8 +833,9 @@ static void occ_remove_hwmon_attrs(struct power8_driver *driver)
 
 static int occ_create_hwmon_attrs(struct power8_driver *driver)
 {
-	int i, rc;
+	int i, rc, id, sensor_num;
 	struct device *dev = driver->dev;
+	struct sensor_group *sensor_groups = driver->sensor_groups;
 	struct occ_response *resp = &driver->occ_response;
 
 	for (i = 0; i < MAX_OCC_SENSOR_TYPE; ++i)
@@ -681,6 +865,23 @@ static int occ_create_hwmon_attrs(struct power8_driver *driver)
 			goto error;
 	}
 
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
+		if (i != CAPS)
+			rc = create_sensor_group(driver, i, sensor_num);
+		if (rc)
+			goto error;
+	}
+
 	return 0;
 
 error:
-- 
1.9.1
