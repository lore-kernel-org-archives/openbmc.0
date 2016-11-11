Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFRNv203ZzDvpC
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 15:13:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GRvJb4bX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LRIiWosE"; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 41D1820D1A;
 Thu, 10 Nov 2016 23:13:33 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute5.internal (MEProxy); Thu, 10 Nov 2016 23:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=VBzKW5imzbzbu4j33vQ7pzSsopU=; b=GRvJb4
 bX5YmVaeAvqQmugzmWnvRwAfB/Q6ZyYczPZD2FWw67P1jro4nLQsZAg/uJPJytwn
 IwVHak4Yw8lD9RIGXNlJePOQtyo58suDlN9LctVPO5upxQBreG8fNMxCQ2kzDNXa
 ySrQAtByw4pCMWpHLKmrRxHwvPNtmfq2mwpAU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=VBzKW5imzbzbu4
 j33vQ7pzSsopU=; b=LRIiWosEAT2iyU+LdtpKhv1dCbQa69XH/WttKI9bNR0ofJ
 mv0OgOxadBanRRspiQK1Or4SwiYRiHhVGky8HmyZr5bkc9HRfSAId6bOyWDq+kMN
 XTLZi627HlNV+nRJ03Fik629OtEvJILTVF7VNoZPG3mwHmyP0nVq6OxFO9F+c=
X-ME-Sender: <xms:bUUlWMLuRF4I-aeUdD6eUhAcYMwAYBoR8QDxF-AeOXb8viWedW0x2g>
X-Sasl-enc: UWzmpyY3FqkEAMnaHOerZ1URYgj/ONk5E60wkq9mwTWp 1478837612
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D99257F07C;
 Thu, 10 Nov 2016 23:13:30 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com,
	Joel Stanley <joel@jms.id.au>
Cc: "Edward A . James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH linux 5/9] hwmon: occ: Add callbacks for parsing P8 OCC
 datastructures
Date: Fri, 11 Nov 2016 14:42:12 +1030
Message-Id: <e3143572b50874c516e9c18da5f189b255526bf1.1478835488.git.andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1478835488.git.andrew@aj.id.au>
References: <cover.1478835488.git.andrew@aj.id.au>
In-Reply-To: <cover.1478835488.git.andrew@aj.id.au>
References: <1478560512-23791-1-git-send-email-eajames.ibm@gmail.com>
 <cover.1478835488.git.andrew@aj.id.au>
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
X-List-Received-Date: Fri, 11 Nov 2016 04:13:35 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/occ_p8.c | 219 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_p8.h |  30 +++++++
 2 files changed, 249 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p8.c
 create mode 100644 drivers/hwmon/occ/occ_p8.h

diff --git a/drivers/hwmon/occ/occ_p8.c b/drivers/hwmon/occ/occ_p8.c
new file mode 100644
index 000000000000..b2fa0cb6eb28
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p8.c
@@ -0,0 +1,219 @@
+/*
+ * p8.c - OCC hwmon driver
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
+
+#include "occ.h"
+#include "occ_p8.h"
+
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
+int p8_get_sensor_value(struct occ *driver, int sensor_type, int snum)
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
+int p8_get_sensor_id(struct occ *driver, int sensor_type, int snum)
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
+struct occ *occ_p8_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops)
+{
+	return occ_start(dev, bus, bus_ops, p8_ops, p8_config);
+}
+EXPORT_SYMBOL(occ_p8_start);
+
+int occ_p8_stop(struct occ *occ)
+{
+	return occ_stop(occ);
+}
+EXPORT_SYMBOL(occ_p8_stop);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("P8 OCC sensors");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_p8.h b/drivers/hwmon/occ/occ_p8.h
new file mode 100644
index 000000000000..acae34323a6b
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p8.h
@@ -0,0 +1,30 @@
+/*
+ * p8.h - OCC hwmon driver
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
+#ifndef __P8_H__
+#define __P8_H__
+
+#include "scom.h"
+
+struct device;
+
+struct occ *occ_p8_start(struct device *dev, void *bus,
+			 struct occ_bus_ops bus_ops);
+int occ_p8_stop(struct occ *occ);
+
+#endif /* __P8_H__ */
-- 
2.9.3
