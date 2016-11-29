Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzdk14j8zDvtP
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 10:04:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SxKvAyUx"; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id y205so19654965qkb.1
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 15:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=o5Gss79K7+T8sDXZXGNUV8ZLxunmDAQJ/M53V4ZP1DI=;
 b=SxKvAyUx5P3F4qUxNW8tnT1kZcOSEK1eue/2cg35yAIbyjn67vCRAfXuA0AdlP+MeN
 7Z9IRk8EsnAiP6oGYyGqMPZHKlifmDqn+Nleb15I7fgeycqS+gy1dktutBnvYhuL2cyT
 rlOKi0fkz4wPOJBamI8nPQ7CLGB9+y+vjOrxklNd/6JXZhhqMs/RGIiykRJquZUTrmOm
 BvKVss9eLuq9mKfwU0iF+5wTfzEiT01cZCj1y9imTV1rKEzH6cdteuXTdNPMvLYLoDqG
 vXklZ9tIGdAdcNLFJStgqAYqA56l6r6iVPwZFQ5yv1GHdOfDmjcXr7V26lg0lP3SYlgo
 Eqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=o5Gss79K7+T8sDXZXGNUV8ZLxunmDAQJ/M53V4ZP1DI=;
 b=IoGl5YL4x5iYq0xWb5SSU8PxwqUV8PTjYTY0AdJxhODBq+eOnKxP0wM3BrAI/Xed4d
 QnmMtr8iABR2rF95vzoC2yr81YlwD2+k7+kY8Xx6rbmgsocJiD75ASt1CaPMAyAiNfWu
 mvvVo8gyDQaZLXXYCmVy8Hg4FYbSLqdTALbvPM8SbSjI+mg1pxnrS9Z3R06C2ZojkzOi
 8Agr4PvLJzFnabhPTpa2BcQB8PZnCghQjOM9Jh/+i1tPqgXEtmT5lsSIn0Wf1nHjjk3P
 A+WPVSW+rA8mNDfJ6kpHbSOpyALSkFns2ACn3F/KE989YUrrKTtuxXnIiONdHTKS6rx8
 LDew==
X-Gm-Message-State: AKaTC011X1stxckJ/4ZUxvwRGl7IZPPAU1HY7G0+1arSd94Qrdy6V2ouvRz673bGivZppg==
X-Received: by 10.55.33.2 with SMTP id h2mr26495865qkh.230.1480460677083;
 Tue, 29 Nov 2016 15:04:37 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id u13sm32005795qtc.37.2016.11.29.15.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Nov 2016 15:04:36 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [RFC PATCH linux v6 8/9] hwmon: occ: Add callbacks for parsing P9 OCC
 datastructures
Date: Tue, 29 Nov 2016 17:04:30 -0600
Message-Id: <1480460670-29012-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 23:04:42 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/occ_p9.c | 261 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/occ_p9.h |  30 ++++++
 2 files changed, 291 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p9.c
 create mode 100644 drivers/hwmon/occ/occ_p9.h

diff --git a/drivers/hwmon/occ/occ_p9.c b/drivers/hwmon/occ/occ_p9.c
new file mode 100644
index 0000000..1109ab4
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
+       u32 sensor_id;
+       u8 fru_type;
+       u8 value;
+};
+
+struct freq_sensor_p9 {
+       u32 sensor_id;
+       u16 value;
+};
+
+struct power_sensor_p9 {
+       u32 sensor_id;
+       u8 function_id;
+       u8 apss_channel;
+       u16 reserved;
+       u32 update_tag;
+       u64 accumulator;
+       u16 value;
+};
+
+struct caps_sensor_p9 {
+       u16 curr_powercap;
+       u16 curr_powerreading;
+       u16 norm_powercap;
+       u16 max_powercap;
+       u16 min_powercap;
+       u16 user_powerlimit;
+       u8 user_powerlimit_source;
+};
+
+/*
+static char *caps_sensor_names[] = {
+       "curr_powercap",
+       "curr_powerreading",
+       "norm_powercap",
+       "max_powercap",
+       "min_powercap",
+       "user_powerlimit",
+       "user_powerlimit_source"
+};
+*/
+
+void p9_parse_sensor(u8 *data, void *sensor, int sensor_type, int off,
+                    int snum)
+{
+       switch (sensor_type) {
+               case FREQ:
+               {
+                       struct freq_sensor_p9 *fs =
+                               &(((struct freq_sensor_p9 *)sensor)[snum]);
+                       fs->sensor_id =
+                               be32_to_cpup((const __be32 *)&data[off]);
+                       fs->value =
+                               be16_to_cpup((const __be16 *)&data[off + 4]);
+               }
+                       break;
+               case TEMP:
+               {
+                       struct temp_sensor_p9 *ts =
+                               &(((struct temp_sensor_p9 *)sensor)[snum]);
+                       ts->sensor_id =
+                               be32_to_cpup((const __be32 *)&data[off]);
+                       ts->fru_type = data[off + 4];
+                       ts->value = data[off + 5];
+               }
+                       break;
+               case POWER:
+               {
+                       struct power_sensor_p9 *ps =
+                               &(((struct power_sensor_p9 *)sensor)[snum]);
+                       ps->sensor_id =
+                               be32_to_cpup((const __be32 *)&data[off]);
+                       ps->function_id = data[off + 4];
+                       ps->apss_channel = data[off + 5];
+                       /* two bytes reserved */
+                       ps->update_tag =
+                               be32_to_cpup((const __be32 *)&data[off + 8]);
+                       ps->accumulator =
+                               be64_to_cpup((const __be64 *)&data[off + 12]);
+                       ps->value =
+                               be16_to_cpup((const __be16 *)&data[off + 20]);
+               }
+                       break;
+               case CAPS:
+               {
+                       struct caps_sensor_p9 *cs =
+                               &(((struct caps_sensor_p9 *)sensor)[snum]);
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
+                       cs->user_powerlimit_source = data[off + 12];
+               }
+                       break;
+       };
+}
+
+void * p9_alloc_sensor(int sensor_type, int num_sensors)
+{
+       switch (sensor_type) {
+               case FREQ:
+                       return kcalloc(num_sensors,
+                                      sizeof(struct freq_sensor_p9),
+                                      GFP_KERNEL);
+               case TEMP:
+                       return kcalloc(num_sensors,
+                                      sizeof(struct temp_sensor_p9),
+                                      GFP_KERNEL);
+               case POWER:
+                       return kcalloc(num_sensors,
+                                      sizeof(struct power_sensor_p9),
+                                      GFP_KERNEL);
+               case CAPS:
+                       return kcalloc(num_sensors,
+                                      sizeof(struct caps_sensor_p9),
+                                      GFP_KERNEL);
+               default:
+                       return NULL;
+       }
+}
+
+int p9_get_sensor_value(struct occ *driver, int sensor_type, int snum)
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
+                       return ((struct freq_sensor_p9 *)sensor)[snum].value;
+               case TEMP:
+                       return ((struct temp_sensor_p9 *)sensor)[snum].value;
+               case POWER:
+                       return ((struct power_sensor_p9 *)sensor)[snum].value;
+               default:
+                       return -1;
+       }
+}
+
+int p9_get_sensor_id(struct occ *driver, int sensor_type, int snum)
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
+                       return ((struct freq_sensor_p9 *)sensor)[i].sensor_id;
+               case TEMP:
+                       return ((struct temp_sensor_p9 *)sensor)[i].sensor_id;
+               case POWER:
+                       return ((struct power_sensor_p9 *)sensor)[i].sensor_id;
+               default:
+                       return -1;
+       }
+}
+
+int p9_get_caps_value(void *sensor, int snum, int caps_field)
+{
+       struct caps_sensor_p9 *caps_sensor = sensor;
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
+       case 6:
+               return caps_sensor[snum].user_powerlimit_source;
+       default:
+               return -1;
+       }
+}
+static const struct occ_ops p9_ops = {
+       .parse_sensor = p9_parse_sensor,
+       .alloc_sensor = p9_alloc_sensor,
+       .get_sensor_value = p9_get_sensor_value,
+       .get_sensor_id = p9_get_sensor_id,
+       .get_caps_value = p9_get_caps_value,
+};
+
+static const struct occ_config p9_config = {
+       .command_addr = 0xFFFBE000,
+       .response_addr = 0xFFFBF000,
+};
+
+struct occ *occ_p9_start(struct device *dev, void *bus,
+                        struct occ_bus_ops bus_ops)
+{
+       return occ_start(dev, bus, bus_ops, p9_ops, p9_config);
+}
+EXPORT_SYMBOL(occ_p9_start);
+
+int occ_p9_stop(struct occ *occ)
+{
+       return occ_stop(occ);
+}
+EXPORT_SYMBOL(occ_p9_stop);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("P9 OCC sensors");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/occ_p9.h b/drivers/hwmon/occ/occ_p9.h
new file mode 100644
index 0000000..52b3827
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
1.9.1
