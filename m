Return-Path: <eajames.ibm@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tgMXK1LR2zDqcx
 for <openbmc@lists.ozlabs.org>; Sat, 17 Dec 2016 07:36:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OS/8Wbj9"; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id c20so3869300itb.0
 for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2016 12:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8Moc0HizAJiANO1eElLF6+ZSNqFTXW6pAK8n1npLFf8=;
 b=OS/8Wbj9XYT6oGCt78SI5MZ0cpNuM7uzr1pbnxXIlH/yWoeKR3zmXGTKjM8/Jg/q0n
 mJ6fi8xIUlCPhOgiyZhrKaa1lSGa3ySMBOaY1oVC/Sez6m6H2n9J+bEhav8/6F4PMMAp
 hqXkYqUcXRCj40T1oOwHnk8kgYahkXlnBfBLBJo+pramMf99uUcYyhXAkN0rqUOwT4Hk
 XdaL2N4I3r6s5dPgP9zjapmLMeNGUOvRaBkW/Nzlbnsc+G0pgT/SAuX+py2NIOf+IhEQ
 HcRVJSAHHijnp0HBy+1PueN6HLu4fidE+maEBfIfoBTQzvNPseCa8Mx4el2ZS+cCvvQA
 vm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8Moc0HizAJiANO1eElLF6+ZSNqFTXW6pAK8n1npLFf8=;
 b=Dq4MIJtrILcu0CvT6Uln3SRgvvUjtZmmU1/5wcUg0jkPw2RovgJlac88TCvQjMqoIP
 KZCeFW31UFlVPhECbtSK7lstzCqtu+Ps5+I6fWYja3kybiYNismOSUx9GFKLheL4Oxp3
 jlGe7DKMirL4Ie3CbdOLtElx6rGOYXw0YNab/4PG31EprKMyNwuFyxd8sYY4/NSHKXQR
 cAPyh5lG0hImJQwON+2CtFRGKnWjuJGBHzWaNn1MgAWmM/roc1HO8yzQsfMM59u+D6Gk
 HOgp02XKynJvLNxoZb5XEClw4Dav5nkTkjBE5Kaz/nMmeL747HV4Yb2Qv+PpBYPUQIur
 MOFw==
X-Gm-Message-State: AKaTC03vMxYxBGGF81CyA4+25o0Z+u3gjX2BnAL3tWFbOEYj4JhU7T+Bl+4bubCDsy2+4w==
X-Received: by 10.36.55.202 with SMTP id r193mr4964115itr.89.1481920559413;
 Fri, 16 Dec 2016 12:35:59 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.57])
 by smtp.gmail.com with ESMTPSA id 130sm1926467ity.5.2016.12.16.12.35.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 16 Dec 2016 12:35:58 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux 5/7] hwmon: occ: Add hwmon implementation for the P8 OCC
Date: Fri, 16 Dec 2016 14:35:52 -0600
Message-Id: <1481920552-6995-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Fri, 16 Dec 2016 20:36:01 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add code to tie the hwmon sysfs code and the POWER8 OCC code together, as
well as probe the entire driver from the I2C bus. I2C is the communication
method between the BMC and the P8 OCC.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../devicetree/bindings/i2c/i2c-ibm-occ.txt        |  13 ++
 drivers/hwmon/occ/Kconfig                          |  14 ++
 drivers/hwmon/occ/Makefile                         |   1 +
 drivers/hwmon/occ/occ_p8_i2c.c                     | 141 +++++++++++++++++++++
 4 files changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
 create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt b/Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
new file mode 100644
index 0000000..b0d2b36
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-ibm-occ.txt
@@ -0,0 +1,13 @@
+HWMON I2C driver for IBM POWER CPU OCC (On Chip Controller)
+
+Required properties:
+ - compatible: must be "ibm,p8-occ-i2c"
+ - reg: physical address
+
+Example:
+i2c3: i2c-bus@100 {
+	occ@50 {
+		compatible = "ibm,p8-occ-i2c";
+		reg = <0x50>;
+	};
+};
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
index 0000000..a151b3a
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p8_i2c.c
@@ -0,0 +1,141 @@
+/*
+ * occ_p8_i2c.c - hwmon OCC driver
+ *
+ * This file contains the i2c layer for accessing the P8 OCC over i2c bus.
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
+#define P8_OCC_I2C_NAME	"p8-occ-i2c"
+
+static char *caps_sensor_names[] = {
+	"curr_powercap",
+	"curr_powerreading",
+	"norm_powercap",
+	"max_powercap",
+	"min_powercap",
+	"user_powerlimit"
+};
+
+int p8_i2c_getscom(void *bus, u32 address, u8 *data)
+{
+	/* P8 i2c slave requires address to be shifted by 1 */
+	address = address << 1;
+
+	return occ_i2c_getscom(bus, address, data);
+}
+
+int p8_i2c_putscom(void *bus, u32 address, u32 data0, u32 data1)
+{
+	/* P8 i2c slave requires address to be shifted by 1 */
+	address = address << 1;
+
+	return occ_i2c_putscom(bus, address, data0, data1);
+}
+
+static struct occ_bus_ops p8_bus_ops = {
+	.getscom = p8_i2c_getscom,
+	.putscom = p8_i2c_putscom,
+};
+
+static struct occ_sysfs_config p8_sysfs_config = {
+	.num_caps_fields = ARRAY_SIZE(caps_sensor_names),
+	.caps_names = caps_sensor_names,
+};
+
+static int p8_occ_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct occ *occ;
+	struct occ_sysfs *hwmon;
+
+	occ = p8_occ_start(&client->dev, client, &p8_bus_ops);
+	if (IS_ERR(occ))
+		return PTR_ERR(occ);
+
+	hwmon = occ_sysfs_start(&client->dev, occ, &p8_sysfs_config);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	i2c_set_clientdata(client, hwmon);
+
+	return 0;
+}
+
+static int p8_occ_remove(struct i2c_client *client)
+{
+	int rc;
+	struct occ_sysfs *hwmon = i2c_get_clientdata(client);
+	struct occ *occ = hwmon->occ;
+
+	rc = occ_sysfs_stop(&client->dev, hwmon);
+
+	rc = rc || p8_occ_stop(occ);
+
+	return rc;
+}
+
+/* used by old-style board info. */
+static const struct i2c_device_id occ_ids[] = {
+	{ P8_OCC_I2C_NAME, 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, occ_ids);
+
+/* used by device table */
+static const struct of_device_id occ_of_match[] = {
+	{ .compatible = "ibm,p8-occ-i2c" },
+	{}
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
+static struct i2c_driver p8_occ_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = P8_OCC_I2C_NAME,
+		.pm = NULL,
+		.of_match_table = occ_of_match,
+	},
+	.probe = p8_occ_probe,
+	.remove = p8_occ_remove,
+	.id_table = occ_ids,
+	.address_list = normal_i2c,
+};
+
+module_i2c_driver(p8_occ_driver);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC P8 OCC hwmon driver");
+MODULE_LICENSE("GPL");
-- 
1.9.1
