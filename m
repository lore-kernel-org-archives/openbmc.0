Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wZD8q63ctzDqVQ
 for <openbmc@lists.ozlabs.org>; Sat, 27 May 2017 03:46:51 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4QHhsCm015031
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 13:46:43 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ap8vrpvtg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 13:46:43 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 26 May 2017 13:46:41 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 26 May 2017 13:46:39 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4QHkeui45744184; Fri, 26 May 2017 17:46:40 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6D87112040;
 Fri, 26 May 2017 13:46:40 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 4E9C3112034;
 Fri, 26 May 2017 13:46:40 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 1/3] drivers: hwmon: Add P9 OCC driver
Date: Fri, 26 May 2017 12:46:31 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1495820793-24205-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1495820793-24205-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17052617-2213-0000-0000-000001C6A624
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007122; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00865931; UDB=6.00430071; IPR=6.00645792; 
 BA=6.00005375; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015597; XFM=3.00000015;
 UTC=2017-05-26 17:46:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052617-2214-0000-0000-00005643E66E
Message-Id: <1495820793-24205-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-26_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705260316
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
X-List-Received-Date: Fri, 26 May 2017 17:46:52 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add initial probe function and common data structures. The occ-hmwon
device is probed dynamically from the OCC "fifo" driver.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/Kconfig      |  2 ++
 drivers/hwmon/Makefile     |  1 +
 drivers/hwmon/occ/Kconfig  | 24 +++++++++++++
 drivers/hwmon/occ/Makefile |  7 ++++
 drivers/hwmon/occ/common.c | 15 +++++++++
 drivers/hwmon/occ/common.h | 84 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/p9_sbe.c | 60 +++++++++++++++++++++++++++++++++
 7 files changed, 193 insertions(+)
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/common.c
 create mode 100644 drivers/hwmon/occ/common.h
 create mode 100644 drivers/hwmon/occ/p9_sbe.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 190d270..e80ca81 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1240,6 +1240,8 @@ config SENSORS_NSA320
 	  This driver can also be built as a module. If so, the module
 	  will be called nsa320-hwmon.
 
+source drivers/hwmon/occ/Kconfig
+
 config SENSORS_PCF8591
 	tristate "Philips PCF8591 ADC/DAC"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d2cb7e8..f03dd0a 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -170,6 +170,7 @@ obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
 
 obj-$(CONFIG_PMBUS)		+= pmbus/
+obj-$(CONFIG_SENSORS_OCC)	+= occ/
 
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
 
diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
new file mode 100644
index 0000000..34488de
--- /dev/null
+++ b/drivers/hwmon/occ/Kconfig
@@ -0,0 +1,24 @@
+#
+# On-Chip Controller configuration
+#
+
+menuconfig SENSORS_OCC
+	tristate "POWER On-Chip Controller"
+	help
+	  If you say yes here you get support for monitoring the IBM POWER
+	  processor sensors via the On-Chip Controller (OCC).
+
+	  This driver can also be built as a module. If so, the module will be
+	  called occ-hwmon.
+
+if SENSORS_OCC
+
+config SENSORS_OCC_P9_SBE
+	bool "POWER9 OCC via SBE"
+	depends on SBEFIFO_OCC
+	help
+	  If you say yes here you get support for monitoring the POWER9
+	  processor sensors via the OCC, from a service processor, over SBE
+	  engine on FSI bus.
+
+endif
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
new file mode 100644
index 0000000..7eab78f
--- /dev/null
+++ b/drivers/hwmon/occ/Makefile
@@ -0,0 +1,7 @@
+occ-hwmon-objs := common.o
+
+ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)
+occ-hwmon-objs += p9_sbe.o
+endif
+
+obj-$(CONFIG_SENSORS_OCC) += occ-hwmon.o
diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
new file mode 100644
index 0000000..a2fb57b
--- /dev/null
+++ b/drivers/hwmon/occ/common.c
@@ -0,0 +1,15 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include "common.h"
+
+int occ_poll(struct occ *occ)
+{
+	return 0;
+}
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
new file mode 100644
index 0000000..dcb1218
--- /dev/null
+++ b/drivers/hwmon/occ/common.h
@@ -0,0 +1,84 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __OCC_COMMON_H__
+#define __OCC_COMMON_H__
+
+#include <linux/hwmon-sysfs.h>
+#include <linux/sysfs.h>
+
+#define OCC_RESP_DATA_BYTES		4089
+
+struct occ_response {
+	u8 seq_no;
+	u8 cmd_type;
+	u8 return_status;
+	u16 data_length_be;
+	u8 data[OCC_RESP_DATA_BYTES];
+	u16 checksum_be;
+} __packed;
+
+struct occ_sensor_data_block_header {
+	u8 eye_catcher[4];
+	u8 reserved;
+	u8 sensor_format;
+	u8 sensor_length;
+	u8 num_sensors;
+} __packed;
+
+struct occ_sensor_data_block {
+	struct occ_sensor_data_block_header header;
+	u32 data;
+} __packed;
+
+struct occ_poll_response_header {
+	u8 status;
+	u8 ext_status;
+	u8 occs_present;
+	u8 config_data;
+	u8 occ_state;
+	u8 mode;
+	u8 ips_status;
+	u8 error_log_id;
+	u32 error_log_start_address_be;
+	u16 error_log_length_be;
+	u16 reserved;
+	u8 occ_code_level[16];
+	u8 eye_catcher[6];
+	u8 num_sensor_data_blocks;
+	u8 sensor_data_block_header_version;
+} __packed;
+
+struct occ_poll_response {
+	struct occ_poll_response_header header;
+	struct occ_sensor_data_block block;
+} __packed;
+
+struct occ_sensor {
+	u8 num_sensors;
+	void *data;
+};
+
+struct occ_sensors {
+	struct occ_sensor temp;
+	struct occ_sensor freq;
+	struct occ_sensor power;
+	struct occ_sensor caps;
+};
+
+struct occ {
+	struct device *bus_dev;
+
+	struct occ_response resp;
+	struct occ_sensors sensors;
+};
+
+int occ_poll(struct occ *occ);
+
+#endif /* __OCC_COMMON_H__ */
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
new file mode 100644
index 0000000..83eaec3
--- /dev/null
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -0,0 +1,60 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include "common.h"
+#include <linux/hwmon.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/occ.h>
+#include <linux/sched.h>
+#include <linux/workqueue.h>
+
+struct p9_sbe_occ {
+	struct occ occ;
+	struct device *sbe;
+};
+
+#define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
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
+
+	occ = &p9_sbe_occ->occ;
+	occ->bus_dev = &pdev->dev;
+
+	return 0;
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
