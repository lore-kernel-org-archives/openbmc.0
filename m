Return-Path: <eajames.ibm@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tSzdv3y3rzDvtP
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 10:04:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CTvCu9gs"; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id n34so17535453qtb.3
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 15:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=wUqRaWkXpUGd700f4yitGA+YPDH2KF0s6Fg9wfjpRxQ=;
 b=CTvCu9gszrKDMeX0Yyj7ogUcITZiJWPPGif1TEYoM3W53/CLl4A6p+ls2Q3y1IcWCc
 Ara7s+Tnaq6xSfAw5Dp40AoFihrrzPH4BecymauOxpC4r5XMpEm5SfsFCvVO2Ad4CSaL
 MOsmkrQB7sz0DWhmdB864S5PkUT1BLbNoBI2KDQT4iScQty/CFqOxi+4HlbisRcXxV5j
 aeqV8+Y5GRPG/0wmj/l6Q2IDakCn3s+nwtdfXXdxutF1dFbKRoR7h7t7BA5RKfcsALQH
 jtqUFi7Ss/mKxE0vhrD/O50q4sup+2FEOfpZWUPQ+TEZzIdSt5dP1GzR410eYKKlHVnX
 /JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wUqRaWkXpUGd700f4yitGA+YPDH2KF0s6Fg9wfjpRxQ=;
 b=MyhR5pLCMjeGNDCC5Qtx1x23Cub8ytGujyMKccpH4nzQNftaDbDIbzQDvveBQiyfqj
 0CaJ8YheRxH//Jxk0s2EAcXOL0JO2UBYXtK+oet8cyfLq7sdreaeEma4blfMS4tn/qcA
 xKjZiBhMYQZHk0hsDODodej3Naov3F+xLluixz5zpdQ38FUlaR0iEEyXjuT0MmIJcpnZ
 A7eKwvjXholnPe+5AW05qNUq6ULX8fmryAgDVytYpy9umvMGFhPpUwhjiU8le3KvxHl6
 /jqw6nOsLTfvqAlsCB3kgZwwnIFa+bZ+4qZElGrKH2xrQCOn79oh7k3sXxrU9H+U/5Rd
 FuvQ==
X-Gm-Message-State: AKaTC00OSBJ88+P0s4enCO98OSlVdhNBicR/iJdhKuLCHscHOjpidb9X3hOPdWvef/vfLw==
X-Received: by 10.237.62.153 with SMTP id n25mr30182952qtf.50.1480460689577;
 Tue, 29 Nov 2016 15:04:49 -0800 (PST)
Received: from eajames-austin-w350.austin.ibm.com ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id h47sm32038071qtc.27.2016.11.29.15.04.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 29 Nov 2016 15:04:48 -0800 (PST)
From: eajames.ibm@gmail.com
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au,
	joel@jms.id.au,
	"Edward A. James" <eajames@us.ibm.com>
Subject: [RFC PATCH linux v6 9/9] wip: hwmon: occ: Add sketch of the hwmon
 implementation for the P9 OCC
Date: Tue, 29 Nov 2016 17:04:42 -0600
Message-Id: <1480460682-29072-1-git-send-email-eajames.ibm@gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2016 23:04:52 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/Kconfig      |  9 ++++
 drivers/hwmon/occ/Makefile     |  1 +
 drivers/hwmon/occ/occ_p9_fsi.c | 93 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 drivers/hwmon/occ/occ_p9_fsi.c

diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
index e690001..7e95876 100644
--- a/drivers/hwmon/occ/Kconfig
+++ b/drivers/hwmon/occ/Kconfig
@@ -26,4 +26,13 @@ config SENSORS_PPC_OCC_P8_I2C
 	 This driver can also be built as a module. If so, the module will be
 	 called occ-p8-i2c.
 
+config SENSORS_PPC_OCC_P9_FSI
+	tristate "POWER9 OCC hwmon support"
+	help
+	  Provide a hwmon sysfs interface for the POWER9 On-Chip Controller,
+	  exposing temperature, frequency and power measurements.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called occ-p9-fsi.
+
 endif
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index 05a84e9..77e47e1 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_SENSORS_PPC_OCC) += occ.o occ_sysfs.o
 obj-$(CONFIG_SENSORS_PPC_OCC_P8_I2C) += occ_scom_i2c.o occ_p8.o occ_p8_i2c.o
+obj-$(CONFIG_SENSORS_PPC_OCC_P9_FSI) += occ_p9.o occ_p9_fsi.o
diff --git a/drivers/hwmon/occ/occ_p9_fsi.c b/drivers/hwmon/occ/occ_p9_fsi.c
new file mode 100644
index 0000000..2f651d1
--- /dev/null
+++ b/drivers/hwmon/occ/occ_p9_fsi.c
@@ -0,0 +1,93 @@
+/*
+ * occ_p9_fsi.c - hwmon OCC driver
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
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/kernel.h>
+#include <linux/device.h>
+
+#include "scom.h"
+#include "occ_p9.h"
+#include "occ_sysfs.h"
+
+#define OCC_I2C_NAME	"occ-p9-fsi"
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
+int p9_fsi_getscom(void *bus, u32 address, u8 *data, size_t offset)
+{
+	return -SCOM_READ_ERROR;
+}
+
+int p9_fsi_putscom(void *bus, u32 address, u32 data0, u32 data1)
+{
+	return -SCOM_WRITE_ERROR;
+}
+
+static struct occ_bus_ops p9_bus_ops = {
+	.getscom = p9_fsi_getscom,
+	.putscom = p9_fsi_putscom,
+};
+
+static struct occ_sysfs_config p9_sysfs_config = {
+	.num_caps_fields = ARRAY_SIZE(caps_sensor_names),
+	.caps_names = caps_sensor_names,
+};
+
+int occ_p9_probe(struct device *dev, void *client)
+{
+	struct occ *occ;
+	struct occ_sysfs *hwmon;
+
+	occ = occ_p9_start(dev, client, p9_bus_ops);
+	if (IS_ERR(occ))
+		return PTR_ERR(occ);
+
+	hwmon = occ_sysfs_start(dev, occ, &p9_sysfs_config);
+	if (IS_ERR(hwmon))
+		return PTR_ERR(hwmon);
+
+	return 0;
+}
+
+int occ_p9_remove(void)
+{
+	struct occ *occ = NULL;
+
+	return occ_p9_stop(occ);
+}
+
+/* used by device table */
+static const struct of_device_id occ_of_match[] = {
+	{ .compatible = "ibm,occ-p9-fsi" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, occ_of_match);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC P9 OCC hwmon driver");
+MODULE_LICENSE("GPL");
-- 
1.9.1
