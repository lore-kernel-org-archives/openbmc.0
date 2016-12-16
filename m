Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tgMY0690TzDqgj
 for <openbmc@lists.ozlabs.org>; Sat, 17 Dec 2016 07:36:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OKO7acsE"; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id n204so13066106qke.2
 for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2016 12:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sMmFFQ0fFLE2/FP0hsx/kTU6oF5wNY6EVyyAw2h1M/g=;
 b=OKO7acsEn75UIUvID9JR2hjIj4fV0nzHZ68BrlksQIQfWR3C7+7uNHnZMbyo0/atuy
 6/Si4TY3Flw7wqkW1uxPx03l/AzH2Rx6wcIM2mGveS5dfmWGExIjWJu2jrACHpqyQTgy
 nyaqV31cJXRsQe8NJhrCoX7zkfwomDoC4199WBxNY60v0AgVAflVI/Ja97AFzRyz2yni
 Zh2Ff5HWIXgJyJenwMKFpCU6pc/Z9ldKGnBNwNalHop40DE5Fn3tpfW9l7daTLBzhhb5
 HUVWdtx0VUcxxb9mS0JZh41ZTlggryXhDJbyy2+AsJG7Ia9A8hyXtylsXYbnejppbH+5
 gJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sMmFFQ0fFLE2/FP0hsx/kTU6oF5wNY6EVyyAw2h1M/g=;
 b=B5P2xCYfge9AdPPidXWuarXO0Yv9Tb/Itn2DQPWrI1mrGG5fGYOLIpQLp02sQidy/p
 jBh3ZOfHwySvEa9EYW+oULqHydT7jgtbGx0Q2hmXt26k/E4XWQy04FH90h8xh1pqC8ge
 trMcezfOqHMpMZYy0csiOyBNioiA+LJf9h+mD1FhRFeMGsRgNYi0mED/nIKRrsZ9OlV1
 lMfPWS4FJjnAWiT5vu1+ZC1oOq8uC1z1zwTuP3yzxJeSlVcFjWoyILWtof7f82SNWxpf
 2cRrjPNFAsqs3eRR0JXTix2cXyoi9mhvvuFnRUYlPaepoUvHOX15N4eEBtShnRLDkGgp
 wUCQ==
X-Gm-Message-State: AIkVDXKbPNJ44HQg9KkkYvdbzbTbSBi49fXu+OvqTziUr60VCz5Sd/SwsO3K0zVt10hwXA==
X-Received: by 10.55.153.4 with SMTP id b4mr2824687qke.163.1481920594505;
 Fri, 16 Dec 2016 12:36:34 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id p35sm4520486qta.43.2016.12.16.12.36.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 16 Dec 2016 12:36:33 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux 7/7] hwmon: occ: Add callbacks for parsing P9 OCC
 datastructures
Date: Fri, 16 Dec 2016 14:36:26 -0600
Message-Id: <1481920586-7165-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Fri, 16 Dec 2016 20:36:37 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add functions to parse the data structures that are specific to the OCC on
the POWER9 processor. These are the sensor data structures, including
temperature, frequency, power, and "caps."

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/hwmon/occ    |   3 +
 drivers/hwmon/occ/occ_p9.c | 243 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_p9.h |  30 ++++++
 3 files changed, 276 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p9.c
 create mode 100644 drivers/hwmon/occ/occ_p9.h

diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
index a6b3dd6..0f17c2f 100644
--- a/Documentation/hwmon/occ
+++ b/Documentation/hwmon/occ
@@ -34,6 +34,9 @@ number of data structures, such as command format, response headers, and the
 like, are also defined in this specification, and are common to both POWER8 and
 POWER9 OCCs.
 
+There is currently no public P9 OCC specification, and the data structures
+defined in the POWER9 OCC driver are subject to change.
+
 sysfs Entries
 -------------
 
diff --git a/drivers/hwmon/occ/occ_p9.c b/drivers/hwmon/occ/occ_p9.c
new file mode 100644
index 0000000..98fd729
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p9.c
@@ -0,0 +1,243 @@
+/*
+ * p9.c - OCC hwmon driver
+ *
+ * This file contains the Power9-specific methods and data structures for
+ * the OCC hwmon driver.
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
+#include <asm/unaligned.h>
+
+#include "occ.h"
+#include "occ_p9.h"
+
+/* P9 OCC sensor data format */
+struct p9_temp_sensor {
+	u32 sensor_id;
+	u8 fru_type;
+	u8 value;
+};
+
+struct p8_freq_sensor {
+	u32 sensor_id;
+	u16 value;
+};
+
+struct p9_power_sensor {
+	u32 sensor_id;
+	u8 function_id;
+	u8 apss_channel;
+	u16 reserved;
+	u32 update_tag;
+	u64 accumulator;
+	u16 value;
+};
+
+struct p9_caps_sensor {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+	u8 user_powerlimit_source;
+};
+
+void p9_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
+		     int snum)
+{
+	switch (sensor_type) {
+	case FREQ:
+	{
+		struct p8_freq_sensor *fs =
+			&(((struct p8_freq_sensor *)sensor)[snum]);
+
+		fs->sensor_id = be32_to_cpu(get_unaligned((u32 *)&data[off]));
+		fs->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 4]));
+	}
+		break;
+	case TEMP:
+	{
+		struct p9_temp_sensor *ts =
+			&(((struct p9_temp_sensor *)sensor)[snum]);
+
+		ts->sensor_id = be32_to_cpu(get_unaligned((u32 *)&data[off]));
+		fs->fru_type = data[off + 4];
+		fs->value = data[off + 5];
+	}
+		break;
+	case POWER:
+	{
+		struct p9_power_sensor *ps =
+			&(((struct p9_power_sensor *)sensor)[snum]);
+
+		ps->sensor_id = be32_to_cpu(get_unaligned((u32 *)&data[off]));
+		ps->function_id = data[off + 4];
+		ps->apss_channel = data[off + 5];
+		ps->update_tag =
+			be32_to_cpu(get_unaligned((u32 *)&data[off + 8]));
+		ps->accumulator =
+			be64_to_cpu(get_unaligned((u64 *)&data[off + 12]));
+		ps->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 20]));
+	}
+		break;
+	case CAPS:
+	{
+		struct p9_caps_sensor *cs =
+			&(((struct p9_caps_sensor *)sensor)[snum]);
+
+		cs->curr_powercap =
+			be16_to_cpu(get_unaligned((u16 *)&data[off]));
+		cs->curr_powerreading =
+			be16_to_cpu(get_unaligned((u16 *)&data[off + 2]));
+		cs->norm_powercap =
+			be16_to_cpu(get_unaligned((u16 *)&data[off + 4]));
+		cs->max_powercap =
+			be16_to_cpu(get_unaligned((u16 *)&data[off + 6]));
+		cs->min_powercap =
+			be16_to_cpu(get_unaligned((u16 *)&data[off + 8]));
+		cs->user_powerlimit =
+			be16_to_cpu(get_unaligned((u16 *)&data[off + 10]));
+		cs->user_powerlimit_source = data[off + 12];
+	}
+		break;
+	};
+}
+
+void *p9_alloc_sensor(int sensor_type, int num_sensors)
+{
+	switch (sensor_type) {
+	case FREQ:
+		return kcalloc(num_sensors, sizeof(struct p8_freq_sensor),
+			       GFP_KERNEL);
+	case TEMP:
+		return kcalloc(num_sensors, sizeof(struct p9_temp_sensor),
+			       GFP_KERNEL);
+	case POWER:
+		return kcalloc(num_sensors, sizeof(struct p9_power_sensor),
+			       GFP_KERNEL);
+	case CAPS:
+		return kcalloc(num_sensors, sizeof(struct p9_caps_sensor),
+			       GFP_KERNEL);
+	default:
+		return NULL;
+	}
+}
+
+int p9_get_sensor_value(struct occ *driver, int sensor_type, int snum)
+{
+	void *sensor;
+
+	if (sensor_type == CAPS)
+		return -EINVAL;
+
+	sensor = occ_get_sensor(driver, sensor_type);
+	if (!sensor)
+		return -ENODEV;
+
+	switch (sensor_type) {
+	case FREQ:
+		return ((struct p8_freq_sensor *)sensor)[snum].value;
+	case TEMP:
+		return ((struct p9_temp_sensor *)sensor)[snum].value;
+	case POWER:
+		return ((struct p9_power_sensor *)sensor)[snum].value;
+	default:
+		return -EINVAL;
+	}
+}
+
+int p9_get_sensor_id(struct occ *driver, int sensor_type, int snum)
+{
+	void *sensor;
+
+	if (sensor_type == CAPS)
+		return -EINVAL;
+
+	sensor = occ_get_sensor(driver, sensor_type);
+	if (!sensor)
+		return -ENODEV;
+
+	switch (sensor_type) {
+	case FREQ:
+		return ((struct p8_freq_sensor *)sensor)[snum].sensor_id;
+	case TEMP:
+		return ((struct p9_temp_sensor *)sensor)[snum].sensor_id;
+	case POWER:
+		return ((struct p9_power_sensor *)sensor)[snum].sensor_id;
+	default:
+		return -EINVAL;
+	}
+}
+
+int p9_get_caps_value(void *sensor, int snum, int caps_field)
+{
+	struct p9_caps_sensor *caps_sensor = sensor;
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
+		return -EINVAL;
+	}
+}
+static const struct occ_ops p9_ops = {
+	.parse_sensor = p9_parse_sensor,
+	.alloc_sensor = p9_alloc_sensor,
+	.get_sensor_value = p9_get_sensor_value,
+	.get_sensor_id = p9_get_sensor_id,
+	.get_caps_value = p9_get_caps_value,
+};
+
+static const struct occ_config p9_config = {
+	.command_addr = 0xFFFBE000,
+	.response_addr = 0xFFFBF000,
+};
+
+struct occ *p9_occ_start(struct device *dev, void *bus,
+			 struct occ_bus_ops *bus_ops)
+{
+	return occ_start(dev, bus, bus_ops, &p9_ops, &p9_config);
+}
+EXPORT_SYMBOL(occ_p9_start);
+
+int p9_occ_stop(struct occ *occ)
+{
+	return occ_stop(occ);
+}
+EXPORT_SYMBOL(occ_p9_stop);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("P9 OCC sensors");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_p9.h b/drivers/hwmon/occ/occ_p9.h
new file mode 100644
index 0000000..8130873
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p9.h
@@ -0,0 +1,30 @@
+/*
+ * occ_p9.h - OCC hwmon driver
+ *
+ * This file contains Power9-specific function prototypes
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
+#ifndef __OCC_P9_H__
+#define __OCC_P9_H__
+
+#include "scom.h"
+
+struct device;
+
+struct occ *p9_occ_start(struct device *dev, void *bus,
+			 struct occ_bus_ops *bus_ops);
+int p9_occ_stop(struct occ *occ);
+
+#endif /* __OCC_P9_H__ */
-- 
1.9.1
