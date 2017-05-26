Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wZD8r4zLrzDqVL
 for <openbmc@lists.ozlabs.org>; Sat, 27 May 2017 03:46:52 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4QHhvfE094108
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 13:46:47 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2apa6t3pj4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 13:46:46 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 26 May 2017 13:46:46 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 26 May 2017 13:46:44 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4QHki1Z42467380; Fri, 26 May 2017 17:46:44 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD6E411204B;
 Fri, 26 May 2017 13:46:45 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 33C44112034;
 Fri, 26 May 2017 13:46:45 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 3/3] drivers: hwmon: OCC: Add P9 sensors,
 hwmon attributes, and device setup
Date: Fri, 26 May 2017 12:46:33 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1495820793-24205-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1495820793-24205-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17052617-0044-0000-0000-0000033AB6E7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007122; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00865931; UDB=6.00430071; IPR=6.00645792; 
 BA=6.00005375; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015597; XFM=3.00000015;
 UTC=2017-05-26 17:46:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052617-0045-0000-0000-00000768C528
Message-Id: <1495820793-24205-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-26_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705260316
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
X-List-Received-Date: Fri, 26 May 2017 17:46:53 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add P9 sysfs functions, sensor definitions, and hwmon attribute setup.
Add device setup after probe. Use a delay to make sure SBE driver has
finished setting up.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/Makefile |   2 +-
 drivers/hwmon/occ/common.h |  30 ++++
 drivers/hwmon/occ/p9.c     | 350 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/p9.h     |  17 +++
 drivers/hwmon/occ/p9_sbe.c |  53 +++++++
 5 files changed, 451 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwmon/occ/p9.c
 create mode 100644 drivers/hwmon/occ/p9.h

diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index 7eab78f..adc7a9c 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1,7 +1,7 @@
 occ-hwmon-objs := common.o
 
 ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)
-occ-hwmon-objs += p9_sbe.o
+occ-hwmon-objs += p9.o p9_sbe.o
 endif
 
 obj-$(CONFIG_SENSORS_OCC) += occ-hwmon.o
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 8d07878..a3d733a 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -73,8 +73,14 @@ struct occ_sensors {
 	struct occ_sensor caps;
 };
 
+struct occ_attribute {
+	char name[32];
+	struct sensor_device_attribute_2 sensor;
+};
+
 struct occ {
 	struct device *bus_dev;
+	struct device *hwmon;
 
 	unsigned long last_update;
 	struct mutex lock;
@@ -82,10 +88,34 @@ struct occ {
 	struct occ_response resp;
 	struct occ_sensors sensors;
 
+	unsigned int num_attrs;
+	struct occ_attribute *attrs;
+	struct attribute_group group;
+	const struct attribute_group *groups[2];
+
 	u8 poll_cmd_data;
 	int (*send_cmd)(struct occ *occ, u8 *cmd);
 };
 
+#define ATTR_OCC(_name, _mode, _show, _store) {				\
+	.attr	= {							\
+		.name = _name,						\
+		.mode = VERIFY_OCTAL_PERMISSIONS(_mode),		\
+	},								\
+	.show	= _show,						\
+	.store	= _store,						\
+}
+
+#define SENSOR_ATTR_OCC(_name, _mode, _show, _store, _nr, _index) {	\
+	.dev_attr	= ATTR_OCC(_name, _mode, _show, _store),	\
+	.index		= _index,					\
+	.nr		= _nr,						\
+}
+
+#define OCC_INIT_ATTR(_name, _mode, _show, _store, _nr, _index)		\
+	((struct sensor_device_attribute_2)				\
+		SENSOR_ATTR_OCC(_name, _mode, _show, _store, _nr, _index))
+
 void occ_parse_poll_response(struct occ *occ);
 int occ_poll(struct occ *occ);
 int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap);
diff --git a/drivers/hwmon/occ/p9.c b/drivers/hwmon/occ/p9.c
new file mode 100644
index 0000000..832d6ff
--- /dev/null
+++ b/drivers/hwmon/occ/p9.c
@@ -0,0 +1,350 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <asm/unaligned.h>
+#include "common.h"
+
+struct p9_temp_sensor {
+	u32 sensor_id;
+	u8 fru_type;
+	u8 value;
+} __packed;
+
+struct p9_freq_sensor {
+	u32 sensor_id;
+	u16 value;
+} __packed;
+
+struct p9_power_sensor {
+	u32 sensor_id;
+	u8 function_id;
+	u8 apss_channel;
+	u16 reserved;
+	u32 update_tag;
+	u64 accumulator;
+	u16 value;
+} __packed;
+
+struct p9_caps_sensor {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+	u8 user_powerlimit_source;
+} __packed;
+
+static ssize_t p9_occ_show_temp(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	int rc;
+	u32 val = 0;
+	struct p9_temp_sensor *temp;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	temp = ((struct p9_temp_sensor *)sensors->temp.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = be32_to_cpu(get_unaligned(&temp->sensor_id));
+		break;
+	case 1:
+		val = temp->fru_type;
+		break;
+	case 2:
+		/* millidegree */
+		val = temp->value * 1000;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t p9_occ_show_freq(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	int rc;
+	u32 val = 0;
+	struct p9_freq_sensor *freq;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	freq = ((struct p9_freq_sensor *)sensors->freq.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = be32_to_cpu(get_unaligned(&freq->sensor_id));
+		break;
+	case 1:
+		val = be16_to_cpu(get_unaligned(&freq->value));
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t p9_occ_show_power(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	int rc;
+	u64 val = 0;
+	struct p9_power_sensor *power;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	power = ((struct p9_power_sensor *)sensors->power.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = be32_to_cpu(get_unaligned(&power->sensor_id));
+		break;
+	case 1:
+		val = power->function_id;
+		break;
+	case 2:
+		val = power->apss_channel;
+		break;
+	case 3:
+		val = be32_to_cpu(get_unaligned(&power->update_tag));
+		break;
+	case 4:
+		val = be64_to_cpu(get_unaligned(&power->accumulator));
+		break;
+	case 5:
+		val = be16_to_cpu(get_unaligned(&power->value));
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
+}
+
+static ssize_t p9_occ_show_caps(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	int rc;
+	u16 val = 0;
+	struct p9_caps_sensor *caps;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_sensors *sensors = &occ->sensors;
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	caps = ((struct p9_caps_sensor *)sensors->caps.data) + sattr->index;
+
+	switch (sattr->nr) {
+	case 0:
+		val = be16_to_cpu(get_unaligned(&caps->curr_powercap));
+		break;
+	case 1:
+		val = be16_to_cpu(get_unaligned(&caps->curr_powerreading));
+		break;
+	case 2:
+		val = be16_to_cpu(get_unaligned(&caps->norm_powercap));
+		break;
+	case 3:
+		val = be16_to_cpu(get_unaligned(&caps->max_powercap));
+		break;
+	case 4:
+		val = be16_to_cpu(get_unaligned(&caps->min_powercap));
+		break;
+	case 5:
+		val = be16_to_cpu(get_unaligned(&caps->user_powerlimit));
+		break;
+	case 6:
+		val = caps->user_powerlimit_source;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
+}
+
+static ssize_t p9_occ_store_caps_user(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	int rc;
+	u16 user_power_cap;
+	struct occ *occ = dev_get_drvdata(dev);
+
+	rc = kstrtou16(buf, 0, &user_power_cap);
+	if (rc)
+		return rc;
+
+	rc = occ_set_user_power_cap(occ, user_power_cap);
+	if (rc)
+		return rc;
+
+	return count;
+}
+
+int p9_occ_setup_sensor_attrs(struct occ *occ)
+{
+	unsigned int i, s;
+	struct device *dev = occ->bus_dev;
+	struct occ_sensors *sensors = &occ->sensors;
+	struct occ_attribute *attr;
+
+	occ->num_attrs = (sensors->temp.num_sensors * 3);
+	occ->num_attrs += (sensors->freq.num_sensors * 2);
+	occ->num_attrs += (sensors->power.num_sensors * 6);
+	occ->num_attrs += (sensors->caps.num_sensors * 7);
+
+	occ->attrs = devm_kzalloc(dev, sizeof(*occ->attrs) * occ->num_attrs,
+				  GFP_KERNEL);
+	if (!occ->attrs)
+		return -ENOMEM;
+
+	occ->group.attrs = devm_kzalloc(dev, sizeof(*occ->group.attrs) *
+					occ->num_attrs + 1, GFP_KERNEL);
+	if (!occ->group.attrs)
+		return -ENOMEM;
+
+	attr = occ->attrs;
+	for (i = 0; i < sensors->temp.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "temp%d_label", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_temp, NULL, 0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "temp%d_fru_type", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_temp, NULL, 1, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "temp%d_input", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_temp, NULL, 2, i);
+		attr++;
+	}
+
+	for (i = 0; i < sensors->freq.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "freq%d_label", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_freq, NULL, 0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "freq%d_input", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_freq, NULL, 1, i);
+		attr++;
+	}
+
+	for (i = 0; i < sensors->power.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "power%d_label", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_power, NULL, 0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "power%d_function_id",
+			 s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_power, NULL, 1, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name),
+			 "power%d_apss_channel", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_power, NULL, 2, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "power%d_update_tag",
+			 s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_power, NULL, 3, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "power%d_accumulator",
+			 s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_power, NULL, 4, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "power%d_input", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_power, NULL, 5, i);
+		attr++;
+	}
+
+	for (i = 0; i < sensors->caps.num_sensors; ++i) {
+		s = i + 1;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_curr", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_caps, NULL, 0, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_reading", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_caps, NULL, 1, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_norm", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_caps, NULL, 2, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_max", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_caps, NULL, 3, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_min", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_caps, NULL, 4, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_user", s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0644,
+					     p9_occ_show_caps,
+					     p9_occ_store_caps_user, 5, i);
+		attr++;
+
+		snprintf(attr->name, sizeof(attr->name), "caps%d_user_source",
+			 s);
+		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
+					     p9_occ_show_caps, NULL, 6, i);
+		attr++;
+	}
+
+	/* put the sensors in the group */
+	for (i = 0; i < occ->num_attrs; ++i)
+		occ->group.attrs[i] = &occ->attrs[i].sensor.dev_attr.attr;
+
+	return 0;
+}
diff --git a/drivers/hwmon/occ/p9.h b/drivers/hwmon/occ/p9.h
new file mode 100644
index 0000000..12d1bc5
--- /dev/null
+++ b/drivers/hwmon/occ/p9.h
@@ -0,0 +1,17 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __OCC_P9_H__
+#define __OCC_P9_H__
+
+struct occ;
+
+int p9_occ_setup_sensor_attrs(struct occ *occ);
+
+#endif /* __OCC_P9_H__ */
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 889594c..88f71b1 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -15,6 +15,9 @@
 #include <linux/occ.h>
 #include <linux/sched.h>
 #include <linux/workqueue.h>
+#include "p9.h"
+
+#define P9_SBE_OCC_SETUP_DELAY		2500
 
 #define OCC_TIMEOUT_MS			5000
 #define OCC_CMD_IN_PRG_MS		100
@@ -30,6 +33,7 @@
 
 struct p9_sbe_occ {
 	struct occ occ;
+	struct delayed_work setup;
 	struct device *sbe;
 };
 
@@ -101,6 +105,40 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	return rc;
 }
 
+static void p9_sbe_occ_setup(struct work_struct *work)
+{
+	int rc;
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct p9_sbe_occ *p9_sbe_occ = container_of(dwork, struct p9_sbe_occ,
+						     setup);
+	struct occ *occ = &p9_sbe_occ->occ;
+
+	/* no need to lock */
+	rc = occ_poll(occ);
+	if (rc < 0) {
+		dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
+			rc);
+		return;
+	}
+
+	occ_parse_poll_response(occ);
+
+	rc = p9_occ_setup_sensor_attrs(occ);
+	if (rc) {
+		dev_err(occ->bus_dev, "failed to setup p9 attrs: %d\n", rc);
+		return;
+	}
+
+	occ->hwmon = devm_hwmon_device_register_with_groups(occ->bus_dev,
+							    "p9_occ", occ,
+							    occ->groups);
+	if (IS_ERR(occ->hwmon)) {
+		dev_err(occ->bus_dev, "failed to register hwmon device: %ld\n",
+			PTR_ERR(occ->hwmon));
+		return;
+	}
+}
+
 static int p9_sbe_occ_probe(struct platform_device *pdev)
 {
 	struct occ *occ;
@@ -114,11 +152,25 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 
 	occ = &p9_sbe_occ->occ;
 	occ->bus_dev = &pdev->dev;
+	occ->groups[0] = &occ->group;
 	occ->poll_cmd_data = 0x20;
 	occ->send_cmd = p9_sbe_occ_send_cmd;
 	mutex_init(&occ->lock);
+	INIT_DELAYED_WORK(&p9_sbe_occ->setup, p9_sbe_occ_setup);
 	platform_set_drvdata(pdev, p9_sbe_occ);
 
+	schedule_delayed_work(&p9_sbe_occ->setup,
+			      msecs_to_jiffies(P9_SBE_OCC_SETUP_DELAY));
+
+	return 0;
+}
+
+static int p9_sbe_occ_remove(struct platform_device *pdev)
+{
+	struct p9_sbe_occ *p9_sbe_occ = platform_get_drvdata(pdev);
+
+	cancel_delayed_work_sync(&p9_sbe_occ->setup);
+
 	return 0;
 }
 
@@ -133,6 +185,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 		.of_match_table	= p9_sbe_occ_of_match,
 	},
 	.probe	= p9_sbe_occ_probe,
+	.remove = p9_sbe_occ_remove,
 };
 
 module_platform_driver(p9_sbe_occ_driver);
-- 
1.8.3.1
