Return-Path: <eajames.ibm@gmail.com>
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tgMWz2QwhzDt1h
 for <openbmc@lists.ozlabs.org>; Sat, 17 Dec 2016 07:35:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J22+zSAX"; 
 dkim-atps=neutral
Received: by mail-io0-x244.google.com with SMTP id b194so13075127ioa.3
 for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2016 12:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BYyvt1BuYOEYdos6zqJ9X93eZyoDDVysO7GoYDM5xLQ=;
 b=J22+zSAXGrW9sgPH9bZt6DYQvPFT3Vysdi2sWTXzRVw2Q+F1/E2KDUfJqdgKuNAFWA
 i9PfBBt585EiE4TquckKTnxNxnXAcG+nWh/v46eMI/4B6xC1i8gmSrCEDhX19IzzKVVM
 XwSDPuuOlwKNubH1UhwmJmEz/thMcmD9aidLwx46mQoA/8YsxQJoGgtsIMHBKuugUwWl
 XZxls3f7Rk+UODQy5iCn84EbV7yP1tSOMbher6p9n5sV36Pu0SCDbTdsxA3IoCe1Yon+
 odqZWwWrSLGFWxtslgrZ2K61/uC2VTbauUtCYjdjHxeBIw+ZEnTG/AI70S4hfuUvfwLJ
 GkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BYyvt1BuYOEYdos6zqJ9X93eZyoDDVysO7GoYDM5xLQ=;
 b=RCW9BJSGunMVOZKpy5q9ckuaWERkS1K1ETj2iMrgtejqIlhKmqztK034F1X/B8IDej
 0+Od3VVK/GcE+dBEYl4NWrtDPqCjvnvGbffLxhiMTkT3n+NKLT1rWVVFnz5faLYgBctA
 rqLoxxpTVUuhdt6G72Xb093rjBFthFP5C6l27qWi4VyUyppv+i/+BW82ftuP5mgpaQ6H
 h+Jg7nC3HvA6H4fFUhQsBkqefiPHFIyE0x7YzLPyvvqFPZxY8aaCY1u41uM8bApgzGjr
 zS1wJ6RdfWiPMg1sNc7Gz3W9kApMOszS2YbHw7+NcjAM+/EWhlAk4KGQy9opoinPN5E5
 5Gtg==
X-Gm-Message-State: AIkVDXK4VnjGAm13+Jt0rJzkPvBtBvDOx9yHgO4Oz6kP99rJqWvzgU0DBj8hiQVGU3aQIw==
X-Received: by 10.107.138.93 with SMTP id m90mr4791329iod.127.1481920541246;
 Fri, 16 Dec 2016 12:35:41 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id e202sm3290526ioe.27.2016.12.16.12.35.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 16 Dec 2016 12:35:40 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux 4/7] hwmon: occ: Add callbacks for parsing P8 OCC
 datastructures
Date: Fri, 16 Dec 2016 14:35:35 -0600
Message-Id: <1481920535-6914-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Fri, 16 Dec 2016 20:35:43 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add functions to parse the data structures that are specific to the OCC on
the POWER8 processor. These are the sensor data structures, including
temperature, frequency, power, and "caps."

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/hwmon/occ    |   9 ++
 drivers/hwmon/occ/occ_p8.c | 217 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_p8.h |  30 +++++++
 3 files changed, 256 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p8.c
 create mode 100644 drivers/hwmon/occ/occ_p8.h

diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
index 1ee8689..a6b3dd6 100644
--- a/Documentation/hwmon/occ
+++ b/Documentation/hwmon/occ
@@ -25,6 +25,15 @@ Currently, all versions of the OCC support four types of sensor data: power,
 temperature, frequency, and "caps," which indicate limits and thresholds used
 internally on the OCC.
 
+The format for the POWER8 OCC sensor data can be found in the P8 OCC
+specification:
+github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Interfaces.pdf
+This document provides the details of the OCC sensors: power, frequency,
+temperature, and caps. These sensor formats are specific to the POWER8 OCC. A
+number of data structures, such as command format, response headers, and the
+like, are also defined in this specification, and are common to both POWER8 and
+POWER9 OCCs.
+
 sysfs Entries
 -------------
 
diff --git a/drivers/hwmon/occ/occ_p8.c b/drivers/hwmon/occ/occ_p8.c
new file mode 100644
index 0000000..812df16
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p8.c
@@ -0,0 +1,217 @@
+/*
+ * occ_p8.c - OCC hwmon driver
+ *
+ * This file contains the Power8-specific methods and data structures for
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
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <asm/unaligned.h>
+
+#include "occ.h"
+#include "occ_p8.h"
+
+/* P8 OCC sensor data format */
+struct p8_occ_sensor {
+	u16 sensor_id;
+	u16 value;
+};
+
+struct p8_power_sensor {
+	u16 sensor_id;
+	u32 update_tag;
+	u32 accumulator;
+	u16 value;
+};
+
+struct p8_caps_sensor {
+	u16 curr_powercap;
+	u16 curr_powerreading;
+	u16 norm_powercap;
+	u16 max_powercap;
+	u16 min_powercap;
+	u16 user_powerlimit;
+};
+
+void p8_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
+		     int snum)
+{
+	switch (sensor_type) {
+	case FREQ:
+	case TEMP:
+	{
+		struct p8_occ_sensor *os =
+			&(((struct p8_occ_sensor *)sensor)[snum]);
+
+		os->sensor_id = be16_to_cpu(get_unaligned((u16 *)&data[off]));
+		os->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 2]));
+	}
+		break;
+	case POWER:
+	{
+		struct p8_power_sensor *ps =
+			&(((struct p8_power_sensor *)sensor)[snum]);
+
+		ps->sensor_id = be16_to_cpu(get_unaligned((u16 *)&data[off]));
+		ps->update_tag =
+			be32_to_cpu(get_unaligned((u32 *)&data[off + 2]));
+		ps->accumulator =
+			be32_to_cpu(get_unaligned((u32 *)&data[off + 6]));
+		ps->value = be16_to_cpu(get_unaligned((u16 *)&data[off + 10]));
+	}
+		break;
+	case CAPS:
+	{
+		struct p8_caps_sensor *cs =
+			&(((struct p8_caps_sensor *)sensor)[snum]);
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
+	}
+		break;
+	};
+}
+
+void *p8_alloc_sensor(int sensor_type, int num_sensors)
+{
+	switch (sensor_type) {
+	case FREQ:
+	case TEMP:
+		return kcalloc(num_sensors, sizeof(struct p8_occ_sensor),
+			       GFP_KERNEL);
+	case POWER:
+		return kcalloc(num_sensors, sizeof(struct p8_power_sensor),
+			       GFP_KERNEL);
+	case CAPS:
+		return kcalloc(num_sensors, sizeof(struct p8_caps_sensor),
+			       GFP_KERNEL);
+	default:
+		return NULL;
+	}
+}
+
+int p8_get_sensor_value(struct occ *driver, int sensor_type, int snum)
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
+	case TEMP:
+		return ((struct p8_occ_sensor *)sensor)[snum].value;
+	case POWER:
+		return ((struct p8_power_sensor *)sensor)[snum].value;
+	default:
+		return -EINVAL;
+	}
+}
+
+int p8_get_sensor_id(struct occ *driver, int sensor_type, int snum)
+{
+	void *sensor;
+	int i = snum;
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
+	case TEMP:
+		return ((struct p8_occ_sensor *)sensor)[i].sensor_id;
+	case POWER:
+		return ((struct p8_power_sensor *)sensor)[i].sensor_id;
+	default:
+		return -EINVAL;
+	}
+}
+
+int p8_get_caps_value(void *sensor, int snum, int caps_field)
+{
+	struct p8_caps_sensor *caps_sensor = sensor;
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
+		return -EINVAL;
+	}
+}
+
+static const struct occ_ops p8_ops = {
+	.parse_sensor = p8_parse_sensor,
+	.alloc_sensor = p8_alloc_sensor,
+	.get_sensor_value = p8_get_sensor_value,
+	.get_sensor_id = p8_get_sensor_id,
+	.get_caps_value = p8_get_caps_value,
+};
+
+static const struct occ_config p8_config = {
+	.command_addr = 0xFFFF6000,
+	.response_addr = 0xFFFF7000,
+};
+
+struct occ *p8_occ_start(struct device *dev, void *bus,
+			 struct occ_bus_ops *bus_ops)
+{
+	return occ_start(dev, bus, bus_ops, &p8_ops, &p8_config);
+}
+EXPORT_SYMBOL(p8_occ_start);
+
+int p8_occ_stop(struct occ *occ)
+{
+	return occ_stop(occ);
+}
+EXPORT_SYMBOL(p8_occ_stop);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("P8 OCC sensors");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_p8.h b/drivers/hwmon/occ/occ_p8.h
new file mode 100644
index 0000000..b44cdd4
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p8.h
@@ -0,0 +1,30 @@
+/*
+ * occ_p8.h - OCC hwmon driver
+ *
+ * This file contains Power8-specific function prototypes
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
+#ifndef __OCC_P8_H__
+#define __OCC_P8_H__
+
+#include "scom.h"
+
+struct device;
+
+struct occ *p8_occ_start(struct device *dev, void *bus,
+			 struct occ_bus_ops *bus_ops);
+int p8_occ_stop(struct occ *occ);
+
+#endif /* __OCC_P8_H__ */
-- 
1.9.1
