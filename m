Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFRNz4ZZ9zDvp5
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 15:13:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KOXeoR38"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AWWHysAN"; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 02CDA20B3B;
 Thu, 10 Nov 2016 23:13:37 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute5.internal (MEProxy); Thu, 10 Nov 2016 23:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:in-reply-to:message-id:references
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=fXq1Q53+0RZ31q8jleJcNCi0lzA=; b=KOXeoR
 38vzhoDg8kt7J0M/m8ihMPOZPAKeNDZEc1ny1u1vdxTQrsBonNTg/hdhXiAep5F5
 YjWhpmwTs9MIHD4/EoqsM3m0OkmyQLTUthN2GEdvM0/Fzi37RnzIt5s/GWbckQkP
 orI727PcxLoYrioUYs4foB0ENBeb7dMlR18Uk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:in-reply-to
 :message-id:references:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=fXq1Q53+0RZ31q
 8jleJcNCi0lzA=; b=AWWHysANrRU3sZ8NXt2nzueFY84I5inwfncz8xAFhcD4cP
 6T1AWJBIFp1el0adxMpiypnkHdUUcP0atH4HhHRfYb80JuBGadum4cLREQgrBqhn
 VN+qMl6K77htEJd1adixATXwPAXH0PIguaaa6D7tNBUSwZZCsgKt72xjMPGT0=
X-ME-Sender: <xms:cEUlWPOyggGB4uQ7ftdiP6E3hnXfjtTo4bGDCxj3lL-ugdatFOSNSw>
X-Sasl-enc: Mufm1x8PjqIeBwrLAs++bnOErmNOwKb5pEUW4dEEWWd/ 1478837615
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A84BF7F07A;
 Thu, 10 Nov 2016 23:13:33 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com,
	Joel Stanley <joel@jms.id.au>
Cc: "Edward A . James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH linux 6/9] hwmon: occ: Add hwmon implementation for the P8
 OCC
Date: Fri, 11 Nov 2016 14:42:13 +1030
Message-Id: <a8d6f13b45861401ffc6ea5b2e1d89519301483a.1478835488.git.andrew@aj.id.au>
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
X-List-Received-Date: Fri, 11 Nov 2016 04:13:40 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/occ/Kconfig      |  14 +++++
 drivers/hwmon/occ/Makefile     |   1 +
 drivers/hwmon/occ/occ_p8_i2c.c | 133 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p8_i2c.c

diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
index cdb64a71af6e..085e1f370c42 100644
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
+	  Provide a hwmon sysfs interface for the POWER8 On-Chip Controller,
+	  exposing temperature, frequency and power measurements.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called occ-p8-i2c.
+
+endif
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index a6881f93067c..05a84e987127 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o occ_sysfs.o
+obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += occ_scom_i2c.o occ_p8.o occ_p8_i2c.o
diff --git a/drivers/hwmon/occ/occ_p8_i2c.c b/drivers/hwmon/occ/occ_p8_i2c.c
new file mode 100644
index 000000000000..1b66f302fe16
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
+#define OCC_I2C_NAME	"occ-p8-i2c"
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
+int p8_i2c_getscom(void *bus, u32 address, u8 *data, size_t offset)
+{
+	/* P8 i2c slave requires address to be shifted by 1 */
+	address = address << 1;
+
+	return occ_i2c_getscom(bus, address, data, offset);
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
+static int occ_p8_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct occ *occ;
+	struct occ_sysfs *hwmon;
+
+	occ = occ_p8_start(&client->dev, client, p8_bus_ops);
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
+static int occ_p8_remove(struct i2c_client *client)
+{
+	return occ_p8_stop(i2c_get_clientdata(client));
+}
+
+/* used by old-style board info. */
+static const struct i2c_device_id occ_ids[] = {
+	{ OCC_I2C_NAME, 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, occ_ids);
+
+/* used by device table */
+static const struct of_device_id occ_of_match[] = {
+	{ .compatible = "ibm,occ-p8-i2c" },
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
+static struct i2c_driver occ_p8_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = OCC_I2C_NAME,
+		.pm = NULL,
+		.of_match_table = occ_of_match,
+	},
+	.probe = occ_p8_probe,
+	.remove = occ_p8_remove,
+	.id_table = occ_ids,
+	.address_list = normal_i2c,
+};
+
+module_i2c_driver(occ_p8_driver);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC P8 OCC hwmon driver");
+MODULE_LICENSE("GPL");
-- 
2.9.3
