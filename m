Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT3310DLrzDr2q
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 08:39:08 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7AMY8JG043311
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:39:06 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c8ssk2jam-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:39:06 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 10 Aug 2017 18:39:05 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 10 Aug 2017 18:39:04 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7AMd3iF21037236; Thu, 10 Aug 2017 22:39:03 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC8E0AE04B;
 Thu, 10 Aug 2017 18:39:20 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 258D8AE03C;
 Thu, 10 Aug 2017 18:39:20 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com, bjwyman@gmail.com,
 mspinler@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 2/4] hwmon: (pmbus): Add POWER system power
 supply driver
Date: Thu, 10 Aug 2017 17:38:54 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502404736-23655-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502404736-23655-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081022-0048-0000-0000-000001D1FB1C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007521; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000219; SDB=6.00900486; UDB=6.00450828; IPR=6.00680687; 
 BA=6.00005522; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016634; XFM=3.00000015;
 UTC=2017-08-10 22:39:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081022-0049-0000-0000-00004230E98D
Message-Id: <1502404736-23655-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708100352
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
X-List-Received-Date: Thu, 10 Aug 2017 22:39:09 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add the driver to monitor POWER system power supplies with hwmon over
pmbus.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/Kconfig   |  10 +++
 drivers/hwmon/pmbus/Makefile  |   1 +
 drivers/hwmon/pmbus/powerps.c | 144 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/powerps.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 04f6baa..7074f8d 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -135,6 +135,16 @@ config SENSORS_MAX8688
 	  This driver can also be built as a module. If so, the module will
 	  be called max8688.
 
+config SENSORS_POWERPS
+	tristate "IBM POWER System Power Supply"
+	default n
+	help
+	  If you say yes here you get hardware monitoring support for the IBM
+	  POWER system power supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called powerps.
+
 config SENSORS_TPS40422
 	tristate "TI TPS40422"
 	default n
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 663801c..009aefa 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
+obj-$(CONFIG_SENSORS_POWERPS)	+= powerps.o
 obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
diff --git a/drivers/hwmon/pmbus/powerps.c b/drivers/hwmon/pmbus/powerps.c
new file mode 100644
index 0000000..dbc6612
--- /dev/null
+++ b/drivers/hwmon/pmbus/powerps.c
@@ -0,0 +1,144 @@
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
+#include <linux/i2c.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+
+#include "pmbus.h"
+
+/* STATUS_MFR_SPECIFIC bits */
+#define POWERPS_MFR_FAN_FAULT			BIT(0)
+#define POWERPS_MFR_THERMAL_FAULT		BIT(1)
+#define POWERPS_MFR_OV_FAULT			BIT(2)
+#define POWERPS_MFR_UV_FAULT			BIT(3)
+#define POWERPS_MFR_PS_KILL			BIT(4)
+#define POWERPS_MFR_OC_FAULT			BIT(5)
+#define POWERPS_MFR_VAUX_FAULT			BIT(6)
+#define POWERPS_MFR_CURRENT_SHARE_WARNING	BIT(7)
+
+static int powerps_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int rc, mfr;
+
+	switch (reg) {
+	case PMBUS_STATUS_VOUT:
+	case PMBUS_STATUS_IOUT:
+	case PMBUS_STATUS_TEMPERATURE:
+	case PMBUS_STATUS_FAN_12:
+		rc = pmbus_read_byte_data(client, page, reg);
+		if (rc < 0)
+			return rc;
+
+		mfr = pmbus_read_byte_data(client, page,
+					   PMBUS_STATUS_MFR_SPECIFIC);
+		if (mfr < 0)
+			return rc;
+
+		/* Add MFR_SPECIFIC bits to the standard pmbus status regs. */
+		if (reg == PMBUS_STATUS_FAN_12) {
+			if (mfr & POWERPS_MFR_FAN_FAULT)
+				rc |= PB_FAN_FAN1_FAULT;
+		} else if (reg == PMBUS_STATUS_TEMPERATURE) {
+			if (mfr & POWERPS_MFR_THERMAL_FAULT)
+				rc |= PB_TEMP_OT_FAULT;
+		} else if (reg == PMBUS_STATUS_VOUT) {
+			if (mfr &
+			    (POWERPS_MFR_OV_FAULT | POWERPS_MFR_VAUX_FAULT))
+				rc |= PB_VOLTAGE_OV_FAULT;
+			if (mfr & POWERPS_MFR_UV_FAULT)
+				rc |= PB_VOLTAGE_UV_FAULT;
+		} else if (reg == PMBUS_STATUS_IOUT) {
+			if (mfr & POWERPS_MFR_OC_FAULT)
+				rc |= PB_IOUT_OC_FAULT;
+			if (mfr & POWERPS_MFR_CURRENT_SHARE_WARNING)
+				rc |= PB_CURRENT_SHARE_FAULT;
+		}
+		break;
+	default:
+		rc = -ENODATA;
+		break;
+	}
+
+	return rc;
+}
+
+static int powerps_read_word_data(struct i2c_client *client, int page, int reg)
+{
+	int rc, mfr;
+
+	switch (reg) {
+	case PMBUS_STATUS_WORD:
+		rc = pmbus_read_word_data(client, page, reg);
+		if (rc < 0)
+			return rc;
+
+		mfr = pmbus_read_byte_data(client, page,
+					   PMBUS_STATUS_MFR_SPECIFIC);
+		if (mfr < 0)
+			return rc;
+
+		if (mfr & POWERPS_MFR_PS_KILL)
+			rc |= PB_STATUS_OFF;
+		break;
+	default:
+		rc = -ENODATA;
+		break;
+	}
+
+	return rc;
+}
+
+static struct pmbus_driver_info powerps_info = {
+	.pages = 1,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
+		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
+	.read_byte_data = powerps_read_byte_data,
+	.read_word_data = powerps_read_word_data,
+	.debugfs = true,
+};
+
+static int powerps_probe(struct i2c_client *client,
+		       const struct i2c_device_id *id)
+{
+	return pmbus_do_probe(client, id, &powerps_info);
+}
+
+static const struct i2c_device_id powerps_id[] = {
+	{ "power_ps", 1 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, powerps_id);
+
+/* IBM provides many compatible power supplies; use a generic name. */
+static const struct of_device_id powerps_of_match[] = {
+	{ .compatible = "ibm,power-ps" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, powerps_of_match);
+
+static struct i2c_driver powerps_driver = {
+	.driver = {
+		.name = "powerps",
+		.of_match_table = powerps_of_match,
+	},
+	.probe = powerps_probe,
+	.remove = pmbus_do_remove,
+	.id_table = powerps_id,
+};
+
+module_i2c_driver(powerps_driver);
+
+MODULE_AUTHOR("Eddie James");
+MODULE_DESCRIPTION("PMBus driver for POWER system power supplies");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1
