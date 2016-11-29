Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzdC4YxLzDvnT
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 10:04:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YjsIQzSG"; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id y205so19653760qkb.1
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 15:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=Uy7OZPqW/2m5Grm8XcPDhX8+Kv+tyvZigxy9jMcF8gY=;
 b=YjsIQzSGg1vVlKoH9MKAyZJgOkDFCuUe3PecmkBUc5AJm9vG/kpyGAojb8BLCca4dr
 nn4E59MOAWtO/WF0AlV73ykPzyYNaJZr0/+T+ppJR3GF7Y5jC6uNklKA9Z8YuemVV3Io
 Zpt67Hj9Yy2tw3G2oPJ5e1iYfMN1wlTJQZc7l9jZhfSj+brkKiCGahMKK4ulYLmJL5Cs
 K/t5eU44maYnTRBohtEQlyfu6xElVVNGG5W1/fleU4LPae5Z4NYuyrdTRzVkesct3krM
 Gvb7Upqfnc59177hutUvFuKtwlQVYRzC1y83qHNN3NQg2h1JG5LZYykoLR/aMbJxAagk
 S2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Uy7OZPqW/2m5Grm8XcPDhX8+Kv+tyvZigxy9jMcF8gY=;
 b=itHa0jx32n4qcdmHyueXvec+sC8FcWPugT4RBPJ2xGn+8/eakyEHgP4edDtax5urSe
 ja7CLU1U+1i9MvTrC21OQG3isRiRC2K4IIEaug5qJtJ/SklbAYS1XG0CB9u/LZLIoVKi
 79I4MDpcCzBR/klPjp5oZy9fT7V3xGROjWgPsTBEO1VKIqfPwvOVRIo6zyHwgDPE16Nb
 Y07B+GvU7Jq9/pFzM+ZHgWrWXzNSZLUD5GUzIEaCUTLen5U7wmyBsr1kLl2+SbXgyWd0
 Ye8OPJi+sbvtx9QNNgFVqZ2l50eXWnwwgoEZ6dSo8+MJGx6k5s3jPg8msNWpAU6tVGTe
 tOzQ==
X-Gm-Message-State: AKaTC02FvNlIez8Z29PgTZrPByNeyywOsRVguwLNGhcRj1C7J5Dnzta5HWsWi7Fot82DKQ==
X-Received: by 10.55.46.132 with SMTP id u126mr26451713qkh.67.1480460653644;
 Tue, 29 Nov 2016 15:04:13 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id b63sm31836555qka.39.2016.11.29.15.04.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Nov 2016 15:04:12 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [RFC PATCH linux v6 6/9] hwmon: occ: Add hwmon implementation for the
 P8 OCC
Date: Tue, 29 Nov 2016 17:04:06 -0600
Message-Id: <1480460646-28877-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 23:04:16 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/Kconfig      |  14 +++++
 drivers/hwmon/occ/Makefile     |   1 +
 drivers/hwmon/occ/occ_p8_i2c.c | 133 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c

diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
index cdb64a7..e690001 100644
--- a/drivers/hwmon/occ/Kconfig
+++ b/drivers/hwmon/occ/Kconfig
@@ -13,3 +13,17 @@ menuconfig SENSORS_PPC_OCC
 
 	  This driver can also be built as a module. If so, the module
 	  will be called occ.
+
+if SENSORS_PPC_OCC
+
+config SENSORS_PPC_OCC_P8_I2C
+	tristate "POWER8 OCC hwmon support"
+	depends on I2C
+	help
+	 Provide a hwmon sysfs interface for the POWER8 On-Chip Controller,
+	 exposing temperature, frequency and power measurements.
+
+	 This driver can also be built as a module. If so, the module will be
+	 called occ-p8-i2c.
+
+endif
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index a6881f9..05a84e9 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o occ_sysfs.o
+obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += occ_scom_i2c.o occ_p8.o occ_p8_i2c.o
diff --git a/drivers/hwmon/occ/occ_p8_i2c.c b/drivers/hwmon/occ/occ_p8_i2c.c
new file mode 100644
index 0000000..54a673e
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p8_i2c.c
@@ -0,0 +1,133 @@
+/*
+ * occ_p8_i2c.c - hwmon OCC driver
+ *
+ * This file contains the i2c layer for accessing the OCC over i2c bus.
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
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/i2c.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include "scom.h"
+#include "occ_scom_i2c.h"
+#include "occ_p8.h"
+#include "occ_sysfs.h"
+
+#define OCC_I2C_NAME   "occ-p8-i2c"
+
+static char *caps_sensor_names[] = {
+       "curr_powercap",
+       "curr_powerreading",
+       "norm_powercap",
+       "max_powercap",
+       "min_powercap",
+       "user_powerlimit"
+};
+
+int p8_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset)
+{
+       /* P8 i2c slave requires address to be shifted by 1 */
+       address = address << 1;
+
+       return occ_i2c_getscom(bus, address, data, offset);
+}
+
+int p8_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
+{
+       /* P8 i2c slave requires address to be shifted by 1 */
+       address = address << 1;
+
+       return occ_i2c_putscom(bus, address, data0, data1);
+}
+
+static struct occ_bus_ops p8_bus_ops = {
+       .getscom = p8_i2c_getscom,
+       .putscom = p8_i2c_putscom,
+};
+
+static struct occ_sysfs_config p8_sysfs_config = {
+       .num_caps_fields = ARRAY_SIZE(caps_sensor_names),
+       .caps_names = caps_sensor_names,
+};
+
+static int occ_p8_probe(struct i2c_client *client,
+                        const struct i2c_device_id *id)
+{
+       struct occ *occ;
+       struct occ_sysfs *hwmon;
+
+       occ = occ_p8_start(&client->dev, client, p8_bus_ops);
+       if (IS_ERR(occ))
+               return PTR_ERR(occ);
+
+       hwmon = occ_sysfs_start(&client->dev, occ, &p8_sysfs_config);
+       if (IS_ERR(hwmon))
+               return PTR_ERR(hwmon);
+
+       i2c_set_clientdata(client, hwmon);
+
+       return 0;
+}
+
+static int occ_p8_remove(struct i2c_client *client)
+{
+       return occ_p8_stop(i2c_get_clientdata(client));
+}
+
+/* used by old-style board info. */
+static const struct i2c_device_id occ_ids[] = {
+       { OCC_I2C_NAME, 0 },
+       {}
+};
+MODULE_DEVICE_TABLE(i2c, occ_ids);
+
+/* used by device table */
+static const struct of_device_id occ_of_match[] = {
+       { .compatible = "ibm,occ-p8-i2c" },
+       {}
+};
+MODULE_DEVICE_TABLE(of, occ_of_match);
+
+/*
+ * i2c-core uses i2c-detect() to detect device in below address list.
+ * If exists, address will be assigned to client.
+ * It is also possible to read address from device table.
+ */
+static const unsigned short normal_i2c[] = {0x50, 0x51, I2C_CLIENT_END };
+
+static struct i2c_driver occ_p8_driver = {
+       .class = I2C_CLASS_HWMON,
+       .driver = {
+               .name = OCC_I2C_NAME,
+               .pm = NULL,
+               .of_match_table = occ_of_match,
+       },
+       .probe = occ_p8_probe,
+       .remove = occ_p8_remove,
+       .id_table = occ_ids,
+       .address_list = normal_i2c,
+};
+
+module_i2c_driver(occ_p8_driver);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC P8 OCC hwmon driver");
+MODULE_LICENSE("GPL");
-- 
1.9.1
