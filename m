Return-Path: <3You4XAcKB0c4nw230npxxpun.lxvxynwkvlur121.x8ujk1.x0p@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::749; helo=mail-qk1-x749.google.com;
 envelope-from=3you4xackb0c4nw230npxxpun.lxvxynwkvlur121.x8ujk1.x0p@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="g9Ezh24i"; 
 dkim-atps=neutral
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lM9h6f2jzDqPG
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 00:36:21 +1000 (AEST)
Received: by mail-qk1-x749.google.com with SMTP id f196so1893045qke.4
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=MiZNqRZtGoJwmS7EKgIPf4gB7YbObKyCWvCAoHnMSwg=;
 b=g9Ezh24iBm4rfXkQeHHe23o8/vbrXQmSn22UMWcd/wBuFF9zslmsZRK8u90ETyVPfI
 Rppvp7jCRumZauQf7hj9zjng0Zov/eHPPcdULhW76EmeKpK59smjduaaxWY+DpKzTgVf
 wH4OJbPpu5pL+j6PabSDwTNdFd2J82OCuXOTNBAv8qNQzpHYpohZMFE5xp95UldeZ1KA
 Ke83p/b3jOhIrMXDS0GbhUVbHGo2fPZwmk3Br7bgs+Uqnso0rgyYolS/twzDp9kuqDhd
 jgzXFGogszYigMg66i5HAJOLKJx12o/pcKcRVl5yBRhWmbqB9FkwL2IqtU7cRcv7VYIt
 Bgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=MiZNqRZtGoJwmS7EKgIPf4gB7YbObKyCWvCAoHnMSwg=;
 b=Ghv661lub0TCOvjs81ewrWKTGkGonfR57V5PF1C+7by2SLONx6NWnbxzo9EevrTadV
 RGIjzVcH5Is5yuX3a2EVVW28/WNL//eZBwZYwAgID7Y0NtvhaHEZq1wrgjyOcqdEXLvS
 5B2W1nQv8+pktts5XCMX55aCBm25u8cKKZpQc5ddh+tj2y6yxq5NFDSe+e30CfU8utBH
 GoKnQsXtRwNnaihHm1/CZCmZFWyh5fWlyFG27+d3e7VoESM07urMs5ozCdIzSQHlYSTe
 47u+niDyrf65NeQSvMc7fzz33kKk5Q2OPst1LKR+AsZkizas6kHNmoRkbZnGlGdLpBOj
 hClQ==
X-Gm-Message-State: APjAAAWaksKPNqZo4TY5bZTZHwSh4c9vsrsG/YaMud+SHbOD57kInJfS
 uFu2FgiEl2vHs04xkk2Xx7qIQeNOqhvH
X-Google-Smtp-Source: APXvYqy5kyqw5mQb/wcRdeBpF+6J1KEbbgv2FrgqkPRvIbN+1tUdBqw0Fz3sFB82hQqRdcqNl69BvA+bT/mD
X-Received: by 2002:a0c:d04b:: with SMTP id d11mr77501283qvh.63.1555598178889; 
 Thu, 18 Apr 2019 07:36:18 -0700 (PDT)
Date: Thu, 18 Apr 2019 07:36:13 -0700
Message-Id: <20190418143613.28516-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH dev-5.0 2/2] fixup! hwmon: (pmbus/isl68137): Add driver for
 Intersil ISL68137 PWM Controller
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2019 14:36:25 -0000

Apply differences from hwmon review to bring the driver code to the same
point.  There were some key differences regarding attribute placement
from the review, beyond the normal cleanup.

Signed-off-by: Patrick Venture <venture@google.com>
---
 Documentation/hwmon/isl68137   |  72 +++++++++++++
 drivers/hwmon/pmbus/isl68137.c | 188 ++++++++++++++-------------------
 2 files changed, 149 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/hwmon/isl68137

diff --git a/Documentation/hwmon/isl68137 b/Documentation/hwmon/isl68137
new file mode 100644
index 000000000000..92e5c5fc5b77
--- /dev/null
+++ b/Documentation/hwmon/isl68137
@@ -0,0 +1,72 @@
+Kernel driver isl68137
+======================
+
+Supported chips:
+  * Intersil ISL68137
+    Prefix: 'isl68137'
+    Addresses scanned: -
+    Datasheet: Publicly available at the Intersil website
+      https://www.intersil.com/content/dam/Intersil/documents/isl6/isl68137.pdf
+
+Authors:
+        Maxim Sloyko <maxims@google.com>
+        Robert Lippert <rlippert@google.com>
+        Patrick Venture <venture@google.com>
+
+Description
+-----------
+
+Intersil ISL68137 is a digital output 7-phase configurable PWM
+controller with an AVSBus interface.
+
+Usage Notes
+-----------
+
+This driver does not probe for PMBus devices. You will have to instantiate
+devices explicitly.
+
+The ISL68137 AVS operation mode must be enabled/disabled at runtime.
+
+Beyond the normal sysfs pmbus attributes, the driver exposes a control attribute.
+
+Additional Sysfs attributes
+---------------------------
+
+avs(0|1)_enable		Controls the AVS state of each rail.
+
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_crit		Critical maximum current
+curr1_crit_alarm	Current critical high alarm
+
+curr[2-3]_label		"iout[1-2]"
+curr[2-3]_input		Measured output current
+curr[2-3]_crit		Critical maximum current
+curr[2-3]_crit_alarm	Current critical high alarm
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_lcrit		Critical minimum input voltage
+in1_lcrit_alarm		Input voltage critical low alarm
+in1_crit		Critical maximum input voltage
+in1_crit_alarm		Input voltage critical high alarm
+
+in[2-3]_label		"vout[1-2]"
+in[2-3]_input		Measured output voltage
+in[2-3]_lcrit		Critical minimum output voltage
+in[2-3]_lcrit_alarm	Output voltage critical low alarm
+in[2-3]_crit		Critical maximum output voltage
+in[2-3]_crit_alarm	Output voltage critical high alarm
+
+power1_label		"pin"
+power1_input		Measured input power
+power1_alarm		Input power high alarm
+
+power[2-3]_label	"pout[1-2]"
+power[2-3]_input	Measured output power
+
+temp[1-3]_input		Measured temperature
+temp[1-3]_crit		Critical high temperature
+temp[1-3]_crit_alarm	Chip temperature critical high alarm
+temp[1-3]_max		Maximum temperature
+temp[1-3]_max_alarm	Chip temperature high alarm
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index ccac14bdb985..515596c92fe1 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -4,61 +4,19 @@
  *
  * Copyright (c) 2017 Google Inc
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
  */
 
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
 #include <linux/err.h>
-#include <linux/i2c.h>
 #include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
 #include "pmbus.h"
 
-#define ISL68137_VOUT_AVS 0x30
-
-static struct pmbus_driver_info isl68137_info = {
-	.pages = 2,
-	.format[PSC_VOLTAGE_IN] = direct,
-	.format[PSC_VOLTAGE_OUT] = direct,
-	.format[PSC_CURRENT_IN] = direct,
-	.format[PSC_CURRENT_OUT] = direct,
-	.format[PSC_POWER] = direct,
-	.format[PSC_TEMPERATURE] = direct,
-	.m[PSC_VOLTAGE_IN] = 1,
-	.b[PSC_VOLTAGE_IN] = 0,
-	.R[PSC_VOLTAGE_IN] = 3,
-	.m[PSC_VOLTAGE_OUT] = 1,
-	.b[PSC_VOLTAGE_OUT] = 0,
-	.R[PSC_VOLTAGE_OUT] = 3,
-	.m[PSC_CURRENT_IN] = 1,
-	.b[PSC_CURRENT_IN] = 0,
-	.R[PSC_CURRENT_IN] = 2,
-	.m[PSC_CURRENT_OUT] = 1,
-	.b[PSC_CURRENT_OUT] = 0,
-	.R[PSC_CURRENT_OUT] = 1,
-	.m[PSC_POWER] = 1,
-	.b[PSC_POWER] = 0,
-	.R[PSC_POWER] = 0,
-	.m[PSC_TEMPERATURE] = 1,
-	.b[PSC_TEMPERATURE] = 0,
-	.R[PSC_TEMPERATURE] = 0,
-	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
-	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
-	    | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_TEMP
-	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
-	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
-	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
-	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
-};
+#define ISL68137_VOUT_AVS	0x30
 
 static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
 					     int page,
@@ -75,23 +33,13 @@ static ssize_t isl68137_avs_enable_store_page(struct i2c_client *client,
 					      const char *buf, size_t count)
 {
 	int rc, op_val;
+	bool result;
 
-	if (count < 1) {
-		rc = -EINVAL;
-		goto out;
-	}
+	rc = kstrtobool(buf, &result);
+	if (rc)
+		return rc;
 
-	switch (buf[0]) {
-	case '0':
-		op_val = 0;
-		break;
-	case '1':
-		op_val = ISL68137_VOUT_AVS;
-		break;
-	default:
-		rc = -EINVAL;
-		goto out;
-	}
+	op_val = result ? ISL68137_VOUT_AVS : 0;
 
 	/*
 	 * Writes to VOUT setpoint over AVSBus will persist after the VRM is
@@ -101,27 +49,28 @@ static ssize_t isl68137_avs_enable_store_page(struct i2c_client *client,
 	 * enabling AVS control is the workaround.
 	 */
 	if (op_val == ISL68137_VOUT_AVS) {
-		int vout_command = pmbus_read_word_data(client, page,
-							PMBUS_VOUT_COMMAND);
+		rc = pmbus_read_word_data(client, page, PMBUS_VOUT_COMMAND);
+		if (rc < 0)
+			return rc;
+
 		rc = pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
-					   vout_command);
-		if (rc)
-			goto out;
+					   rc);
+		if (rc < 0)
+			return rc;
 	}
 
 	rc = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
 				    ISL68137_VOUT_AVS, op_val);
 
-out:
-	return rc < 0 ? rc : count;
+	return (rc < 0) ? rc : count;
 }
 
 static ssize_t isl68137_avs_enable_show(struct device *dev,
 					struct device_attribute *devattr,
 					char *buf)
 {
-	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
-	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
 	return isl68137_avs_enable_show_page(client, attr->index, buf);
 }
@@ -130,53 +79,70 @@ static ssize_t isl68137_avs_enable_store(struct device *dev,
 				struct device_attribute *devattr,
 				const char *buf, size_t count)
 {
-	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
-	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
 	return isl68137_avs_enable_store_page(client, attr->index, buf, count);
 }
 
-static SENSOR_DEVICE_ATTR_2(avs0_enabled, 0644,
-			    isl68137_avs_enable_show, isl68137_avs_enable_store,
-			    0, 0);
-static SENSOR_DEVICE_ATTR_2(avs1_enabled, 0644,
-			    isl68137_avs_enable_show, isl68137_avs_enable_store,
-			    0, 1);
+static SENSOR_DEVICE_ATTR_RW(avs0_enable, isl68137_avs_enable, 0);
+static SENSOR_DEVICE_ATTR_RW(avs1_enable, isl68137_avs_enable, 1);
 
-static int isl68137_remove(struct i2c_client *client);
-
-static int isl68137_probe(struct i2c_client *client,
-			  const struct i2c_device_id *id)
-{
-	int rc;
-
-	rc = pmbus_do_probe(client, id, &isl68137_info);
-	if (rc)
-		return rc;
+static struct attribute *enable_attrs[] = {
+	&sensor_dev_attr_avs0_enable.dev_attr.attr,
+	&sensor_dev_attr_avs1_enable.dev_attr.attr,
+	NULL,
+};
 
-	rc = device_create_file(&client->dev,
-				&sensor_dev_attr_avs0_enabled.dev_attr);
-	if (rc)
-		goto out_fail;
-	rc = device_create_file(&client->dev,
-				&sensor_dev_attr_avs1_enabled.dev_attr);
-	if (rc)
-		goto out_fail;
+static const struct attribute_group enable_group = {
+	.attrs = enable_attrs,
+};
 
-	return rc;
+static const struct attribute_group *attribute_groups[] = {
+	&enable_group,
+	NULL,
+};
 
-out_fail:
-	isl68137_remove(client);
-	return rc;
-}
+static struct pmbus_driver_info isl68137_info = {
+	.pages = 2,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 1,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 3,
+	.m[PSC_VOLTAGE_OUT] = 1,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 3,
+	.m[PSC_CURRENT_IN] = 1,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = 2,
+	.m[PSC_CURRENT_OUT] = 1,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 1,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 0,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
+	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
+	    | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_TEMP
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
+	.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
+	.groups = attribute_groups,
+};
 
-static int isl68137_remove(struct i2c_client *client)
+static int isl68137_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
 {
-	device_remove_file(&client->dev,
-			   &sensor_dev_attr_avs1_enabled.dev_attr);
-	device_remove_file(&client->dev,
-			   &sensor_dev_attr_avs0_enabled.dev_attr);
-	return pmbus_do_remove(client);
+	return pmbus_do_probe(client, id, &isl68137_info);
 }
 
 static const struct i2c_device_id isl68137_id[] = {
@@ -192,7 +158,7 @@ static struct i2c_driver isl68137_driver = {
 		   .name = "isl68137",
 		   },
 	.probe = isl68137_probe,
-	.remove = isl68137_remove,
+	.remove = pmbus_do_remove,
 	.id_table = isl68137_id,
 };
 
-- 
2.21.0.593.g511ec345e18-goog
