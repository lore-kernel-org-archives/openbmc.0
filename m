Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFRP51Vl5zDvp2
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 15:13:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AiLxIAdg"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IHls++KC"; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 317D2214F5;
 Thu, 10 Nov 2016 23:13:43 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute5.internal (MEProxy); Thu, 10 Nov 2016 23:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=oYaOGYyWUViqt/xPCPI7LwRJIx0=; b=AiLxIA
 dgAie/wQks7vtriM1MGSRX9CXz+uzdSfkIXrGXXQ07gukI3Z982DBZcwVmhPua6a
 RLgo1x5NIZDt8VkI30lTynkAHGxFZYQA5JNPLx8ae7cqltuATwvV3eUs0zCtpjTW
 GLtYzdFQvBMrE29D5mTUsmHLfj5Rro3vWrChs=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=oYaOGYyWUViqt/
 xPCPI7LwRJIx0=; b=IHls++KCJgDyQvniqG3darQEE1ih1LyOdjPT/MUlGQg/VQ
 7Wi0EAMxLkYKVjfZmxQ32oSDgDx3dV3ZjrcCRzNTF6fo6TYfPHQGDkLtUsB/18PF
 INOKt/pAoq/V6WCEBlMlqYCOCtR60W6yPEw7apjgqspUJJ12Iy7y0TZ1+X/ok=
X-ME-Sender: <xms:d0UlWFHcqTwWMhLJaRLI4qcogeMMUz4wJck2CmpAPaCbfMWpSOFQGg>
X-Sasl-enc: dgeRg+lWL9roYfkRXJyiVRupt7j/F2EweFLEuZtrsREU 1478837622
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9AD577F06F;
 Thu, 10 Nov 2016 23:13:40 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com,
	Joel Stanley <joel@jms.id.au>
Cc: "Edward A . James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH linux 8/9] hwmon: occ: Add callbacks for parsing P9 OCC
 datastructures
Date: Fri, 11 Nov 2016 14:42:15 +1030
Message-Id: <e9231e9451e3058c130efd8f164b959e375e6366.1478835488.git.andrew@aj.id.au>
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
X-List-Received-Date: Fri, 11 Nov 2016 04:13:45 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/occ_p9.c | 261 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_p9.h |  30 ++++++
 2 files changed, 291 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p9.c
 create mode 100644 drivers/hwmon/occ/occ_p9.h

diff --git a/drivers/hwmon/occ/occ_p9.c b/drivers/hwmon/occ/occ_p9.c
new file mode 100644
index 000000000000..b8986290948b
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p9.c
@@ -0,0 +1,261 @@
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
+
+#include "occ.h"
+#include "occ_p9.h"
+
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
+/*
+static char *caps_sensor_names[] = {
+	"curr_powercap",
+	"curr_powerreading",
+	"norm_powercap",
+	"max_powercap",
+	"min_powercap",
+	"user_powerlimit",
+	"user_powerlimit_source"
+};
+*/
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
+int p9_get_sensor_value(struct occ *driver, int sensor_type, int snum)
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
+int p9_get_sensor_id(struct occ *driver, int sensor_type, int snum)
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
+struct occ *occ_p9_start(struct device *dev, void *bus,
+			 struct occ_bus_ops bus_ops)
+{
+	return occ_start(dev, bus, bus_ops, p9_ops, p9_config);
+}
+EXPORT_SYMBOL(occ_p9_start);
+
+int occ_p9_stop(struct occ *occ)
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
index 000000000000..52b38278238b
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p9.h
@@ -0,0 +1,30 @@
+/*
+ * p9.h - OCC hwmon driver
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
+#ifndef __P9_H__
+#define __P9_H__
+
+#include "scom.h"
+#include "occ.h"
+
+struct device;
+
+struct occ *occ_p9_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops);
+int occ_p9_stop(struct occ *occ);
+
+#endif /* __P9_H__ */
-- 
2.9.3
