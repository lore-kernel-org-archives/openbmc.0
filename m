Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw43d1BdXzDt20
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 08:43:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=lcd0aoCZ; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id z190so7187166qkc.3
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 14:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=VKXbPJ172paqEnhpC8Dx0Grm3q88/jN0dwM1xFJD+8k=;
 b=lcd0aoCZspaRz87nAuj4DwVZGKr5tXVf6wPCAhDpXn4Dq5HAQ1xpKbsOGIq8kglIf+
 I81OmnzCvlGIpvK1RwsFu0ibbYdRzorVOVmw17TciDqrkZMoUy01KXEhOP02/2j9A8V9
 Hx8yCPfCYMaPYESn83Nid0WQIjtDj3KbE+1cXGHVWTD3QGd3yYwI/2qJrVVZT+Re6Wyp
 7jlNzsCMfjr5wk22pwtga/GRNI1dxbGGezIoEVLehj7oVeQYITylulD+PVgDFyOeCcG8
 HjHDfYeBXg1Nky89QLA3lxWA6OrWXU+Bj3PZGiM/tfPJPCEN3pkfoJ8GNhuO0D40qu82
 i1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VKXbPJ172paqEnhpC8Dx0Grm3q88/jN0dwM1xFJD+8k=;
 b=W02yrlxNq0TPnTlQC4nVDmMtcklR6lySrbeeNbNSPSj6ubv7DJkJUjbwaSvHvatI26
 YwsrK6cKhMEawRFHjAaMf5eMkMN0AJUuF0Qr9Iu8svRUmCbpn1qD5jcF7Kg5iGB+rQn6
 iuzWhlgJJVa+HWXsy8TW2Ac5ODedUD1JI2P7gPS6KEQj7N6N+sAa2xCx2ChdmmZ4XXVT
 gvvS1BvbRzWncz2PE/puLtiJfdBNMt7VbCk4iUfjqDwvp0nKouLU3j0PCYvExBWSxO5p
 bL7yKtY0MRROfAhSHg+4CUJzn5Eu0r7454F03HcOPCtWS+ko2R5dJapp1HpPSUgmSqUR
 w3Ng==
X-Gm-Message-State: AA6/9RkOadGSXHK574opDB0pgWVHw8qMZktLf+F/WK2L3nJtZy/bhe/DlGF/ciO+1ueQzw==
X-Received: by 10.55.184.2 with SMTP id i2mr9871537qkf.47.1476395003055;
 Thu, 13 Oct 2016 14:43:23 -0700 (PDT)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.53])
 by smtp.gmail.com with ESMTPSA id l6sm5851798qkd.41.2016.10.13.14.43.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Oct 2016 14:43:22 -0700 (PDT)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux v4 6/6] hwmon: Add OCC CAPS sensors
Date: Thu, 13 Oct 2016 16:43:13 -0500
Message-Id: <1476394993-17295-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 21:43:25 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add CAPS sensors to sysfs.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/power8_occ.c | 118 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/power8_occ.c b/drivers/hwmon/occ/power8_occ.c
index d264bf5..1a85fa0 100644
--- a/drivers/hwmon/occ/power8_occ.c
+++ b/drivers/hwmon/occ/power8_occ.c
@@ -659,6 +659,49 @@ static ssize_t show_label(struct device *dev,
 	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
 }
 
+static ssize_t show_caps(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	int val;
+	struct caps_sensor *sensor;
+	struct sensor_attr_data *sdata = container_of(attr,
+						      struct sensor_attr_data,
+						      dev_attr);
+	struct power8_driver *driver = dev_get_drvdata(dev);
+	int n = sdata->hwmon_index - 1;
+
+	sensor = occ_get_sensor(driver, CAPS);
+	if (!sensor) {
+		val = -1;
+		return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+	}
+
+	switch (sdata->attr_id) {
+	case 0:
+		val = sensor[n].curr_powercap;
+		break;
+	case 1:
+		val = sensor[n].curr_powerreading;
+		break;
+	case 2:
+		val = sensor[n].norm_powercap;
+		break;
+	case 3:
+		val = sensor[n].max_powercap;
+		break;
+	case 4:
+		val = sensor[n].min_powercap;
+		break;
+	case 5:
+		val = sensor[n].user_powerlimit;
+		break;
+	default:
+		val = -1;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
 static ssize_t show_update_interval(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
@@ -822,6 +865,77 @@ err:
 	return rc;
 }
 
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
+static char *caps_sensor_name[] = {
+	"curr_powercap",
+	"curr_powerreading",
+	"norm_powercap",
+	"max_powercap",
+	"min_powercap",
+	"user_powerlimit",
+};
+
+static int create_caps_sensor_group(struct power8_driver *driver,
+				    int sensor_num)
+{
+	struct device *dev = driver->dev;
+	struct sensor_group *sensor_groups = driver->sensor_groups;
+	int field_num = ARRAY_SIZE(caps_sensor_name);
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
+			caps_sensor_attr_init(sdata, caps_sensor_name[i],
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
 static void occ_remove_hwmon_attrs(struct power8_driver *driver)
 {
 	struct device *dev = driver->dev;
@@ -876,7 +990,9 @@ static int occ_create_hwmon_attrs(struct power8_driver *driver)
 			continue;
 
 		sensor_num = resp->blocks[id].sensor_num;
-		if (i != CAPS)
+		if (i == CAPS)
+			rc = create_caps_sensor_group(driver, sensor_num);
+		else
 			rc = create_sensor_group(driver, i, sensor_num);
 		if (rc)
 			goto error;
-- 
1.9.1
