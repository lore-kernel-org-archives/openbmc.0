Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTXky4355zDr2m
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 03:56:58 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7BHrhNF020332
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 13:56:55 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c9c4prd3j-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 13:56:55 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 11 Aug 2017 13:56:55 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 11 Aug 2017 13:56:52 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7BHupJH56885482; Fri, 11 Aug 2017 17:56:51 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BC22B2046;
 Fri, 11 Aug 2017 13:54:18 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 950C8B2050;
 Fri, 11 Aug 2017 13:54:17 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bjwyman@gmail.com, mspinler@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v5 2/4] hwmon: (pmbus): Add IBM Common Form
 Factor (CFF) power supply driver
Date: Fri, 11 Aug 2017 12:56:43 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081117-0040-0000-0000-0000038E5925
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007526; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00900858; UDB=6.00451050; IPR=6.00681062; 
 BA=6.00005523; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016647; XFM=3.00000015;
 UTC=2017-08-11 17:56:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081117-0041-0000-0000-00000782876B
Message-Id: <1502474205-1557-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708110279
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
X-List-Received-Date: Fri, 11 Aug 2017 17:57:01 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add the driver to monitor IBM CFF power supplies with hwmon over
pmbus.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/Kconfig     |  10 +++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/ibm-cffps.c | 151 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/ibm-cffps.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 04f6baa..c05b264 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -37,6 +37,16 @@ config SENSORS_ADM1275
 	  This driver can also be built as a module. If so, the module will
 	  be called adm1275.
 
+config SENSORS_IBM_CFFPS
+	tristate "IBM Common Form Factor Power Supply"
+	default n
+	help
+	  If you say yes here you get hardware monitoring support for the IBM
+	  Common Form Factor power supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ibm-cffps.
+
 config SENSORS_IR35221
 	tristate "Infineon IR35221"
 	default n
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 663801c..d3d0b2e 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -5,6 +5,7 @@
 obj-$(CONFIG_PMBUS)		+= pmbus_core.o
 obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
+obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
new file mode 100644
index 0000000..1a6294c
--- /dev/null
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -0,0 +1,151 @@
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
+#define CFFPS_MFR_FAN_FAULT			BIT(0)
+#define CFFPS_MFR_THERMAL_FAULT			BIT(1)
+#define CFFPS_MFR_OV_FAULT			BIT(2)
+#define CFFPS_MFR_UV_FAULT			BIT(3)
+#define CFFPS_MFR_PS_KILL			BIT(4)
+#define CFFPS_MFR_OC_FAULT			BIT(5)
+#define CFFPS_MFR_VAUX_FAULT			BIT(6)
+#define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
+
+static int ibm_cffps_read_byte_data(struct i2c_client *client, int page,
+				    int reg)
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
+			/*
+			 * Return the status register instead of an error,
+			 * since we successfully read status.
+			 */
+			return rc;
+
+		/* Add MFR_SPECIFIC bits to the standard pmbus status regs. */
+		if (reg == PMBUS_STATUS_FAN_12) {
+			if (mfr & CFFPS_MFR_FAN_FAULT)
+				rc |= PB_FAN_FAN1_FAULT;
+		} else if (reg == PMBUS_STATUS_TEMPERATURE) {
+			if (mfr & CFFPS_MFR_THERMAL_FAULT)
+				rc |= PB_TEMP_OT_FAULT;
+		} else if (reg == PMBUS_STATUS_VOUT) {
+			if (mfr & (CFFPS_MFR_OV_FAULT | CFFPS_MFR_VAUX_FAULT))
+				rc |= PB_VOLTAGE_OV_FAULT;
+			if (mfr & CFFPS_MFR_UV_FAULT)
+				rc |= PB_VOLTAGE_UV_FAULT;
+		} else if (reg == PMBUS_STATUS_IOUT) {
+			if (mfr & CFFPS_MFR_OC_FAULT)
+				rc |= PB_IOUT_OC_FAULT;
+			if (mfr & CFFPS_MFR_CURRENT_SHARE_WARNING)
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
+static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
+				    int reg)
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
+			/*
+			 * Return the status register instead of an error,
+			 * since we successfully read status.
+			 */
+			return rc;
+
+		if (mfr & CFFPS_MFR_PS_KILL)
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
+static struct pmbus_driver_info ibm_cffps_info = {
+	.pages = 1,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
+		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
+	.read_byte_data = ibm_cffps_read_byte_data,
+	.read_word_data = ibm_cffps_read_word_data,
+};
+
+static int ibm_cffps_probe(struct i2c_client *client,
+			   const struct i2c_device_id *id)
+{
+	return pmbus_do_probe(client, id, &ibm_cffps_info);
+}
+
+static const struct i2c_device_id ibm_cffps_id[] = {
+	{ "ibm_cffps1", 1 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
+
+static const struct of_device_id ibm_cffps_of_match[] = {
+	{ .compatible = "ibm,cffps1" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ibm_cffps_of_match);
+
+static struct i2c_driver ibm_cffps_driver = {
+	.driver = {
+		.name = "ibm-cffps",
+		.of_match_table = ibm_cffps_of_match,
+	},
+	.probe = ibm_cffps_probe,
+	.remove = pmbus_do_remove,
+	.id_table = ibm_cffps_id,
+};
+
+module_i2c_driver(ibm_cffps_driver);
+
+MODULE_AUTHOR("Eddie James");
+MODULE_DESCRIPTION("PMBus driver for IBM Common Form Factor power supplies");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1
