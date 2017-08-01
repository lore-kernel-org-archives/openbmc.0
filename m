Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLycb6z1DzDsRG
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:58:39 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710wcIE126454
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:38 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c2dy23k7j-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:37 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:58:34 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:58:33 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710wWHd23527496; Tue, 1 Aug 2017 00:58:32 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2C0AAC041;
 Mon, 31 Jul 2017 20:58:46 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 9185AAC03F;
 Mon, 31 Jul 2017 20:58:46 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 01/10] drivers/hwmon: Add On-Chip Controller
 (OCC) hwmon driver
Date: Mon, 31 Jul 2017 19:58:18 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080100-2213-0000-0000-000002029D9E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895763; UDB=6.00448041; IPR=6.00675950; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:58:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-2214-0000-0000-000057111536
Message-Id: <1501549107-22323-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708010012
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
X-List-Received-Date: Tue, 01 Aug 2017 00:58:40 -0000
X-List-Received-Date: Tue, 01 Aug 2017 00:58:40 -0000

From: "Edward A. James" <eajames@us.ibm.com>

The OCC is a device embedded on a POWER processor that collects and
aggregates sensor data from the processor and system. The OCC can
provide the raw sensor data as well as perform thermal and power
management on the system.

This driver provides a hwmon interface to the OCC from a service
processor (e.g. a BMC). The driver supports both POWER8 and POWER9 OCCs.
Communications with the POWER8 OCC are established over standard I2C
bus. The driver communicates with the POWER9 OCC through the FSI-based
OCC driver, which handles the lower-level communication details.

This patch lays out the structure of the OCC hwmon driver. There are two
platform drivers, one each for P8 and P9 OCCs. These are probed through
the I2C tree and the FSI-based OCC driver, respectively. The patch also
defines the first common structures and methods between the two OCC
versions.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/Kconfig      |  2 ++
 drivers/hwmon/Makefile     |  1 +
 drivers/hwmon/occ/Kconfig  | 28 +++++++++++++++++++
 drivers/hwmon/occ/Makefile | 11 ++++++++
 drivers/hwmon/occ/common.c | 44 +++++++++++++++++++++++++++++
 drivers/hwmon/occ/common.h | 40 +++++++++++++++++++++++++++
 drivers/hwmon/occ/p8_i2c.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/p9_sbe.c | 66 ++++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 261 insertions(+)
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/common.c
 create mode 100644 drivers/hwmon/occ/common.h
 create mode 100644 drivers/hwmon/occ/p8_i2c.c
 create mode 100644 drivers/hwmon/occ/p9_sbe.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5ef2814..08add7b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1250,6 +1250,8 @@ config SENSORS_NSA320
 	  This driver can also be built as a module. If so, the module
 	  will be called nsa320-hwmon.
 
+source drivers/hwmon/occ/Kconfig
+
 config SENSORS_PCF8591
 	tristate "Philips PCF8591 ADC/DAC"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4641a9..0b342d0 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -170,6 +170,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
 
+obj-$(CONFIG_SENSORS_OCC)	+= occ/
 obj-$(CONFIG_PMBUS)		+= pmbus/
 
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
new file mode 100644
index 0000000..0501280
--- /dev/null
+++ b/drivers/hwmon/occ/Kconfig
@@ -0,0 +1,28 @@
+#
+# On-Chip Controller configuration
+#
+
+config SENSORS_OCC
+	tristate "POWER On-Chip Controller"
+	---help---
+	This option enables support for monitoring a variety of system sensors
+	provided by the On-Chip Controller (OCC) on a POWER processor.
+
+	This driver can also be built as a module. If so, the module will be
+	called occ-hwmon.
+
+config SENSORS_OCC_P8_I2C
+	bool "POWER8 OCC through I2C"
+	depends on I2C && SENSORS_OCC
+	---help---
+	This option enables support for monitoring sensors provided by the OCC
+	on a POWER8 processor. Communications with the OCC are established
+	through I2C bus.
+
+config SENSORS_OCC_P9_SBE
+	bool "POWER9 OCC through SBE"
+	depends on OCCFIFO && SENSORS_OCC
+	---help---
+	This option enables support for monitoring sensors provided by the OCC
+	on a POWER9 processor. Communications with the OCC are established
+	through SBE engine on an FSI bus.
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
new file mode 100644
index 0000000..ab5c3e9
--- /dev/null
+++ b/drivers/hwmon/occ/Makefile
@@ -0,0 +1,11 @@
+occ-hwmon-objs := common.o
+
+ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)
+occ-hwmon-objs += p9_sbe.o
+endif
+
+ifeq ($(CONFIG_SENSORS_OCC_P8_I2C), y)
+occ-hwmon-objs += p8_i2c.o
+endif
+
+obj-$(CONFIG_SENSORS_OCC) += occ-hwmon.o
diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
new file mode 100644
index 0000000..92f06ae
--- /dev/null
+++ b/drivers/hwmon/occ/common.c
@@ -0,0 +1,44 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/device.h>
+
+#include "common.h"
+
+static int occ_poll(struct occ *occ)
+{
+	u16 checksum = occ->poll_cmd_data + 1;
+	u8 cmd[8];
+
+	/* big endian */
+	cmd[0] = 0;			/* sequence number */
+	cmd[1] = 0;			/* cmd type */
+	cmd[2] = 0;			/* data length msb */
+	cmd[3] = 1;			/* data length lsb */
+	cmd[4] = occ->poll_cmd_data;	/* data */
+	cmd[5] = checksum >> 8;		/* checksum msb */
+	cmd[6] = checksum & 0xFF;	/* checksum lsb */
+	cmd[7] = 0;
+
+	return occ->send_cmd(occ, cmd);
+}
+
+int occ_setup(struct occ *occ, const char *name)
+{
+	int rc;
+
+	rc = occ_poll(occ);
+	if (rc < 0) {
+		dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
+			rc);
+		return rc;
+	}
+
+	return 0;
+}
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
new file mode 100644
index 0000000..705dfe3
--- /dev/null
+++ b/drivers/hwmon/occ/common.h
@@ -0,0 +1,40 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef OCC_COMMON_H
+#define OCC_COMMON_H
+
+struct device;
+
+#define OCC_RESP_DATA_BYTES		4089
+
+/* Same response format for all OCC versions.
+ * Allocate the largest possible response.
+ */
+struct occ_response {
+	u8 seq_no;
+	u8 cmd_type;
+	u8 return_status;
+	__be16 data_length;
+	u8 data[OCC_RESP_DATA_BYTES];
+	__be16 checksum;
+} __packed;
+
+struct occ {
+	struct device *bus_dev;
+
+	struct occ_response resp;
+
+	u8 poll_cmd_data;		/* to perform OCC poll command */
+	int (*send_cmd)(struct occ *occ, u8 *cmd);
+};
+
+int occ_setup(struct occ *occ, const char *name);
+
+#endif /* OCC_COMMON_H */
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
new file mode 100644
index 0000000..025471f
--- /dev/null
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -0,0 +1,69 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+
+#include "common.h"
+
+struct p8_i2c_occ {
+	struct occ occ;
+	struct i2c_client *client;
+};
+
+#define to_p8_i2c_occ(x)	container_of((x), struct p8_i2c_occ, occ)
+
+static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
+{
+	return -EOPNOTSUPP;
+}
+
+static int p8_i2c_occ_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	struct occ *occ;
+	struct p8_i2c_occ *p8_i2c_occ = devm_kzalloc(&client->dev,
+						     sizeof(*p8_i2c_occ),
+						     GFP_KERNEL);
+	if (!p8_i2c_occ)
+		return -ENOMEM;
+
+	p8_i2c_occ->client = client;
+	occ = &p8_i2c_occ->occ;
+	occ->bus_dev = &client->dev;
+	dev_set_drvdata(&client->dev, occ);
+
+	occ->poll_cmd_data = 0x10;		/* P8 OCC poll data */
+	occ->send_cmd = p8_i2c_occ_send_cmd;
+
+	return occ_setup(occ, "p8_occ");
+}
+
+static const struct of_device_id p8_i2c_occ_of_match[] = {
+	{ .compatible = "ibm,p8-occ-hwmon" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
+
+static struct i2c_driver p8_i2c_occ_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "occ-hwmon",
+		.of_match_table = p8_i2c_occ_of_match,
+	},
+	.probe = p8_i2c_occ_probe,
+};
+
+module_i2c_driver(p8_i2c_occ_driver);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC P8 OCC hwmon driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
new file mode 100644
index 0000000..58c3bb2
--- /dev/null
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -0,0 +1,66 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "common.h"
+
+struct p9_sbe_occ {
+	struct occ occ;
+	struct device *sbe;
+};
+
+#define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
+
+static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
+{
+	return -EOPNOTSUPP;
+}
+
+static int p9_sbe_occ_probe(struct platform_device *pdev)
+{
+	struct occ *occ;
+	struct p9_sbe_occ *p9_sbe_occ = devm_kzalloc(&pdev->dev,
+						     sizeof(*p9_sbe_occ),
+						     GFP_KERNEL);
+	if (!p9_sbe_occ)
+		return -ENOMEM;
+
+	p9_sbe_occ->sbe = pdev->dev.parent;
+	occ = &p9_sbe_occ->occ;
+	occ->bus_dev = &pdev->dev;
+	platform_set_drvdata(pdev, occ);
+
+	occ->poll_cmd_data = 0x20;		/* P9 OCC poll data */
+	occ->send_cmd = p9_sbe_occ_send_cmd;
+
+	return occ_setup(occ, "p9_occ");
+}
+
+static const struct of_device_id p9_sbe_occ_of_match[] = {
+	{ .compatible = "ibm,p9-occ-hwmon" },
+	{ },
+};
+
+static struct platform_driver p9_sbe_occ_driver = {
+	.driver = {
+		.name = "occ-hwmon",
+		.of_match_table	= p9_sbe_occ_of_match,
+	},
+	.probe	= p9_sbe_occ_probe,
+};
+
+module_platform_driver(p9_sbe_occ_driver);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC P9 OCC hwmon driver");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1
