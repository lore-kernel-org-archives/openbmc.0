Return-Path: <3dAyuXAcKBzEiRagheRTbbTYR.PbZbcRaOZPYVfgf.bmYNOf.beT@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com;
 envelope-from=3dayuxackbzeiraghertbbtyr.pbzbcraozpyvfgf.bmynof.bet@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kX0UbyVl"; 
 dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44fSnq6S2pzDqM6
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 01:32:07 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id gn10so1565395plb.23
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+LdTQ8rh0EmP7IYJFaiv1yDsWLnIRF8+kHL5851/cdc=;
 b=kX0UbyVlPVuLCQmkr6dXZNoYeJq6nNl2SmVDrvY7xAB8Zvg9MEZl3KlWZCyTmK0c58
 WANer4jgI2qherfQNLo5Q0JvKZSDPMEfuHXDZpJiu705ALQw72fR1nxVx4ugud94NWZ8
 Tu1sKkwu4s6qJ5C6eQ1DI0qzu8mVqvkctJxdBnAJ1sN8YmhCufYJfRqhqKKy2O23whuR
 ceoO8IeRmqR/XKb2DKgoAASmN6a7LWhvmJGy0x1rNFkT8QToP4BFFlw8OVY9q7UJlmw6
 7GtPkxNENm/CqEvuLGGZouqKUKiVexVeoaoPycafyxFhEfMsnGO+6zwUkeKgcXIESHsd
 bclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+LdTQ8rh0EmP7IYJFaiv1yDsWLnIRF8+kHL5851/cdc=;
 b=LBxJPAEJ5jaA17QSbytbB2LA/rcQxe56jQpfSRsUGG/DR1y8beKR6f9b8jtmGjCQ9s
 ZcbOVS8/44mhPasMiOqYkgbwllJC7x5YDmAG8kTJIYni4b+NKNQYCwQZP2C5ZXoIXnn7
 T4W9T1FL/sCmi3NVWgnWo90tBK45c+b8oOKmAe/2Y6LTMpIbo6GoMshPJilplumYlDTg
 QVfUH+njFrj+YswiIRHaTPio56VoWPhRx2PFVBfNH5xgYzEEuRlv1/8g7KpUjrZZnprc
 b9COxaatOPEg7faMD4qCx3KNnG87CIQ+usWIbCqHnI7hZOrNuoHc3aVSW/ZRk4ydsJpp
 lXlQ==
X-Gm-Message-State: APjAAAW7WaVauyO3/gMpeCrsbReT3YFTwPlRc9PVeTPBh36xVBZnbdT/
 DFlSmRCj8fpgX45yxxFKJwNC+g1UjULR
X-Google-Smtp-Source: APXvYqyKaj22Rs/Lj8nqejuEkhPkx5fj8z2U2/nCMTNSvaOdLpE0YZVkC04FdOSXIlAKO9gRZJMBEMkYx18B
X-Received: by 2002:a62:1782:: with SMTP id 124mr1068478pfx.29.1554910324167; 
 Wed, 10 Apr 2019 08:32:04 -0700 (PDT)
Date: Wed, 10 Apr 2019 08:31:58 -0700
Message-Id: <20190410153158.152020-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH dev-5.0] hwmon: (pmbus/isl68137): Add driver for Intersil
 ISL68137 PWM Controller
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au
Cc: Maxim Sloyko <maxims@google.com>, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 Robert Lippert <rlippert@google.com>
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
X-List-Received-Date: Wed, 10 Apr 2019 15:32:16 -0000

From: Maxim Sloyko <maxims@google.com>

Adds the pmbus driver for the Intersil ISL68137 PWM Controller.

Signed-off-by: Maxim Sloyko <maxims@google.com>
Signed-off-by: Robert Lippert <rlippert@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 drivers/hwmon/pmbus/Kconfig    |  10 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/isl68137.c | 203 +++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/isl68137.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 629cb45f8557..15c197f1c4c4 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -54,6 +54,16 @@ config SENSORS_IR35221
 	  This driver can also be built as a module. If so, the module will
 	  be called ir35521.
 
+config SENSORS_ISL68137
+	tristate "Intersil ISL68137"
+	default y
+	help
+	  If you say yes here you get hardware monitoring support for Intersil
+	  ISL68137.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called isl68137.
+
 config SENSORS_LM25066
 	tristate "National Semiconductor LM25066 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index ea0e39518c21..0684b35216da 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
+obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
new file mode 100644
index 000000000000..ccac14bdb985
--- /dev/null
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Intersil ISL68137
+ *
+ * Copyright (c) 2017 Google Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/hwmon-sysfs.h>
+#include "pmbus.h"
+
+#define ISL68137_VOUT_AVS 0x30
+
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
+};
+
+static ssize_t isl68137_avs_enable_show_page(struct i2c_client *client,
+					     int page,
+					     char *buf)
+{
+	int val = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
+
+	return sprintf(buf, "%d\n",
+		       (val & ISL68137_VOUT_AVS) == ISL68137_VOUT_AVS ? 1 : 0);
+}
+
+static ssize_t isl68137_avs_enable_store_page(struct i2c_client *client,
+					      int page,
+					      const char *buf, size_t count)
+{
+	int rc, op_val;
+
+	if (count < 1) {
+		rc = -EINVAL;
+		goto out;
+	}
+
+	switch (buf[0]) {
+	case '0':
+		op_val = 0;
+		break;
+	case '1':
+		op_val = ISL68137_VOUT_AVS;
+		break;
+	default:
+		rc = -EINVAL;
+		goto out;
+	}
+
+	/*
+	 * Writes to VOUT setpoint over AVSBus will persist after the VRM is
+	 * switched to PMBus control. Switching back to AVSBus control
+	 * restores this persisted setpoint rather than re-initializing to
+	 * PMBus VOUT_COMMAND. Writing VOUT_COMMAND first over PMBus before
+	 * enabling AVS control is the workaround.
+	 */
+	if (op_val == ISL68137_VOUT_AVS) {
+		int vout_command = pmbus_read_word_data(client, page,
+							PMBUS_VOUT_COMMAND);
+		rc = pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
+					   vout_command);
+		if (rc)
+			goto out;
+	}
+
+	rc = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
+				    ISL68137_VOUT_AVS, op_val);
+
+out:
+	return rc < 0 ? rc : count;
+}
+
+static ssize_t isl68137_avs_enable_show(struct device *dev,
+					struct device_attribute *devattr,
+					char *buf)
+{
+	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
+	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
+
+	return isl68137_avs_enable_show_page(client, attr->index, buf);
+}
+
+static ssize_t isl68137_avs_enable_store(struct device *dev,
+				struct device_attribute *devattr,
+				const char *buf, size_t count)
+{
+	struct i2c_client *client = kobj_to_i2c_client(&dev->kobj);
+	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
+
+	return isl68137_avs_enable_store_page(client, attr->index, buf, count);
+}
+
+static SENSOR_DEVICE_ATTR_2(avs0_enabled, 0644,
+			    isl68137_avs_enable_show, isl68137_avs_enable_store,
+			    0, 0);
+static SENSOR_DEVICE_ATTR_2(avs1_enabled, 0644,
+			    isl68137_avs_enable_show, isl68137_avs_enable_store,
+			    0, 1);
+
+static int isl68137_remove(struct i2c_client *client);
+
+static int isl68137_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	int rc;
+
+	rc = pmbus_do_probe(client, id, &isl68137_info);
+	if (rc)
+		return rc;
+
+	rc = device_create_file(&client->dev,
+				&sensor_dev_attr_avs0_enabled.dev_attr);
+	if (rc)
+		goto out_fail;
+	rc = device_create_file(&client->dev,
+				&sensor_dev_attr_avs1_enabled.dev_attr);
+	if (rc)
+		goto out_fail;
+
+	return rc;
+
+out_fail:
+	isl68137_remove(client);
+	return rc;
+}
+
+static int isl68137_remove(struct i2c_client *client)
+{
+	device_remove_file(&client->dev,
+			   &sensor_dev_attr_avs1_enabled.dev_attr);
+	device_remove_file(&client->dev,
+			   &sensor_dev_attr_avs0_enabled.dev_attr);
+	return pmbus_do_remove(client);
+}
+
+static const struct i2c_device_id isl68137_id[] = {
+	{"isl68137", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, isl68137_id);
+
+/* This is the driver that will be inserted */
+static struct i2c_driver isl68137_driver = {
+	.driver = {
+		   .name = "isl68137",
+		   },
+	.probe = isl68137_probe,
+	.remove = isl68137_remove,
+	.id_table = isl68137_id,
+};
+
+module_i2c_driver(isl68137_driver);
+
+MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
+MODULE_DESCRIPTION("PMBus driver for Intersil ISL68137");
+MODULE_LICENSE("GPL");
-- 
2.21.0.392.gf8f6787159e-goog
