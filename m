Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzcy10VqzDvvy
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 10:04:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RXqYLRY8"; 
 dkim-atps=neutral
Received: by mail-qt0-x243.google.com with SMTP id m48so17515037qta.2
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 15:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=Vauq+jqwvaeYWgPPQK2qb+cSsm7cYma3in7Nly3kwrA=;
 b=RXqYLRY8hiaEYLojCjaa1WzNO9alDPRgKT6imZ/92jyyZYQtgXox544IYCymP6kzgU
 HAwAwNTZVbAWenLhlTt3xIqbk3xO6ZaKh3bhZYT+MJZbwQ3qrLW/UUQ0MokYkaxSdzTw
 5VeK5oXZT3DTx+YeMFBMe7EXJ/jnbmGXh+LvWi6m4/oAA9tTaJJLTPkXBFwqJ/H9MFZw
 uIL+P8X5UQ//FAdpYYmlanRE7tcjspGCOIkp0Z3gJlVzjbeJkKYR0bCvivqhF2ISPgfh
 1cR7wzeKbUIhUHPj4JcRKT64T4OSupHDAZbZZ4VXo17npqvK0EKpuX5v3mYoUimDv7L2
 0Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Vauq+jqwvaeYWgPPQK2qb+cSsm7cYma3in7Nly3kwrA=;
 b=FUHKW4yVM6daCzdZnVv+5l1HE8ZR2cYdqzi8Vb5xTVceC9KKeopI6Gt3Xw5CulOj+V
 jmtHStAT2g96pLJB5wz3BsTYxj5e95L5gXiBmx9BZZflyVkXHWxxH/v/6/xLC/U35eQV
 loZ/BLWu18WvZG4J8WrLsQzvycIO1IYgF6pK/vjIO4BeXSv29+e/c4i/MR+ciQ6z21Cb
 cjgujQ+6G6xA1vvxRXxQe/9621NMKQKNAXeebRsV1n5X3rc3JcQKQ8fDvqobkf90PB2X
 BpSO1HAR7UeCCyktoHlATSO2xfvjcRkcmYBDhbl4TH1PrIIughSeyTviQWjC67KWuLFd
 yhkw==
X-Gm-Message-State: AKaTC034w5XK6Dz3nVb4i73CeBLrXbLoPYjMbR+RoXxAqBABZJRjstcf41reYg10e0u2lQ==
X-Received: by 10.200.48.120 with SMTP id g53mr29427521qte.113.1480460639798; 
 Tue, 29 Nov 2016 15:03:59 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id x13sm32038791qkb.45.2016.11.29.15.03.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Nov 2016 15:03:59 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [RFC PATCH linux v6 5/9] hwmon: occ: Add callbacks for parsing P8 OCC
 datastructures
Date: Tue, 29 Nov 2016 17:03:52 -0600
Message-Id: <1480460632-28805-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 23:04:02 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/occ_p8.c | 219 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_p8.h |  30 +++++++
 2 files changed, 249 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p8.c
 create mode 100644 drivers/hwmon/occ/occ_p8.h

diff --git a/drivers/hwmon/occ/occ_p8.c b/drivers/hwmon/occ/occ_p8.c
new file mode 100644
index 0000000..0335a15
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
+       u16 sensor_id;
+       u16 value;
+};
+
+struct power_sensor_p8 {
+       u16 sensor_id;
+       u32 update_tag;
+       u32 accumulator;
+       u16 value;
+};
+
+struct caps_sensor_p8 {
+       u16 curr_powercap;
+       u16 curr_powerreading;
+       u16 norm_powercap;
+       u16 max_powercap;
+       u16 min_powercap;
+       u16 user_powerlimit;
+};
+
+void p8_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
+                    int snum)
+{
+       switch (sensor_type) {
+               case FREQ:
+               case TEMP:
+               {
+                       struct occ_sensor_p8 *os =
+                               &(((struct occ_sensor_p8 *)sensor)[snum]);
+                       os->sensor_id =
+                               be16_to_cpup((const __be16 *)&data[off]);
+                       os->value =
+                               be16_to_cpup((const __be16 *)&data[off + 2]);
+               }
+                       break;
+               case POWER:
+               {
+                       struct power_sensor_p8 *ps =
+                               &(((struct power_sensor_p8 *)sensor)[snum]);
+                       ps->sensor_id =
+                               be16_to_cpup((const __be16 *)&data[off]);
+                       ps->update_tag =
+                               be32_to_cpup((const __be32 *)&data[off + 2]);
+                       ps->accumulator =
+                               be32_to_cpup((const __be32 *)&data[off + 6]);
+                       ps->value =
+                               be16_to_cpup((const __be16 *)&data[off + 10]);
+               }
+                       break;
+               case CAPS:
+               {
+                       struct caps_sensor_p8 *cs =
+                               &(((struct caps_sensor_p8 *)sensor)[snum]);
+                       cs->curr_powercap =
+                               be16_to_cpup((const __be16 *)&data[off]);
+                       cs->curr_powerreading =
+                               be16_to_cpup((const __be16 *)&data[off + 2]);
+                       cs->norm_powercap =
+                               be16_to_cpup((const __be16 *)&data[off + 4]);
+                       cs->max_powercap =
+                               be16_to_cpup((const __be16 *)&data[off + 6]);
+                       cs->min_powercap =
+                               be16_to_cpup((const __be16 *)&data[off + 8]);
+                       cs->user_powerlimit =
+                               be16_to_cpup((const __be16 *)&data[off + 10]);
+               }
+                       break;
+       };
+}
+
+void * p8_alloc_sensor(int sensor_type, int num_sensors)
+{
+       switch (sensor_type) {
+               case FREQ:
+               case TEMP:
+                       return kcalloc(num_sensors,
+                                      sizeof(struct occ_sensor_p8),
+                                      GFP_KERNEL);
+               case POWER:
+                       return kcalloc(num_sensors,
+                                      sizeof(struct power_sensor_p8),
+                                      GFP_KERNEL);
+               case CAPS:
+                       return kcalloc(num_sensors,
+                                      sizeof(struct caps_sensor_p8),
+                                      GFP_KERNEL);
+               default:
+                       return NULL;
+       }
+}
+
+int p8_get_sensor_value(struct occ *driver, int sensor_type, int snum)
+{
+       void *sensor;
+
+       if (sensor_type == CAPS)
+               return -1;
+
+       sensor = occ_get_sensor(driver, sensor_type);
+       if (!sensor)
+               return -1;
+
+       switch (sensor_type) {
+               case FREQ:
+               case TEMP:
+                       return ((struct occ_sensor_p8 *)sensor)[snum].value;
+               case POWER:
+                       return ((struct power_sensor_p8 *)sensor)[snum].value;
+               default:
+                       return -1;
+       }
+}
+
+int p8_get_sensor_id(struct occ *driver, int sensor_type, int snum)
+{
+       void *sensor;
+       int i = snum;
+
+       if (sensor_type == CAPS)
+               return -1;
+
+       sensor = occ_get_sensor(driver, sensor_type);
+       if (!sensor)
+               return -1;
+
+       switch (sensor_type) {
+               case FREQ:
+               case TEMP:
+                       return ((struct occ_sensor_p8 *)sensor)[i].sensor_id;
+               case POWER:
+                       return ((struct power_sensor_p8 *)sensor)[i].sensor_id;
+               default:
+                       return -1;
+       }
+}
+
+int p8_get_caps_value(void *sensor, int snum, int caps_field)
+{
+       struct caps_sensor_p8 *caps_sensor = sensor;
+
+       switch (caps_field) {
+       case 0:
+               return caps_sensor[snum].curr_powercap;
+       case 1:
+               return caps_sensor[snum].curr_powerreading;
+       case 2:
+               return caps_sensor[snum].norm_powercap;
+       case 3:
+               return caps_sensor[snum].max_powercap;
+       case 4:
+               return caps_sensor[snum].min_powercap;
+       case 5:
+               return caps_sensor[snum].user_powerlimit;
+       default:
+               return -1;
+       }
+}
+
+static const struct occ_ops p8_ops = {
+       .parse_sensor = p8_parse_sensor,
+       .alloc_sensor = p8_alloc_sensor,
+       .get_sensor_value = p8_get_sensor_value,
+       .get_sensor_id = p8_get_sensor_id,
+       .get_caps_value = p8_get_caps_value,
+};
+
+static const struct occ_config p8_config = {
+       .command_addr = 0xFFFF6000,
+       .response_addr = 0xFFFF7000,
+};
+
+struct occ *occ_p8_start(struct device *dev, void *bus, struct occ_bus_ops bus_ops)
+{
+       return occ_start(dev, bus, bus_ops, p8_ops, p8_config);
+}
+EXPORT_SYMBOL(occ_p8_start);
+
+int occ_p8_stop(struct occ *occ)
+{
+       return occ_stop(occ);
+}
+EXPORT_SYMBOL(occ_p8_stop);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("P8 OCC sensors");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_p8.h b/drivers/hwmon/occ/occ_p8.h
new file mode 100644
index 0000000..848d564
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
+                        struct occ_bus_ops bus_ops);
+int occ_p8_stop(struct occ *occ);
+
+#endif /* __P8_H__ */
-- 
1.9.1
