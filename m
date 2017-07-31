Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLrGh5lwlzDr6m
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 06:12:44 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6VK9Hj9052262
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:12:42 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c2a1xbwyq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:12:42 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 14:12:41 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 14:12:39 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6VKCdSa3670450; Mon, 31 Jul 2017 13:12:39 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BF87136046;
 Mon, 31 Jul 2017 14:12:39 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.80.232.39])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 204F613603A;
 Mon, 31 Jul 2017 14:12:38 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, mspinler@linux.vnet.ibm.com, bjwyman@gmail.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 1/5] drivers/hwmon/pmbus: Add IBM P17531
 driver
Date: Mon, 31 Jul 2017 15:12:28 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501531952-490-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501531952-490-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17073120-0020-0000-0000-00000C78300E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007460; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895668; UDB=6.00447984; IPR=6.00675855; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016469; XFM=3.00000015;
 UTC=2017-07-31 20:12:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17073120-0021-0000-0000-00005D80E6E6
Message-Id: <1501531952-490-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707310337
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
X-List-Received-Date: Mon, 31 Jul 2017 20:12:45 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add the driver to monitor power supplies with hwmon over pmbus.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/Kconfig  |  10 +++
 drivers/hwmon/pmbus/Makefile |   1 +
 drivers/hwmon/pmbus/p17531.c | 165 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/p17531.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 04f6baa..033aeda 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -135,6 +135,16 @@ config SENSORS_MAX8688
 	  This driver can also be built as a module. If so, the module will
 	  be called max8688.
 
+config SENSORS_P17531
+	tristate "IBM P17531"
+	default n
+	help
+	  If you say yes here you get hardware monitoring support for IBM
+	  P17531 power supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called p17531.
+
 config SENSORS_TPS40422
 	tristate "TI TPS40422"
 	default n
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 663801c..b0625ec 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
 obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
+obj-$(CONFIG_SENSORS_P17531)	+= p17531.o
 obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
diff --git a/drivers/hwmon/pmbus/p17531.c b/drivers/hwmon/pmbus/p17531.c
new file mode 100644
index 0000000..2190f8c
--- /dev/null
+++ b/drivers/hwmon/pmbus/p17531.c
@@ -0,0 +1,165 @@
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
+#define P17531_MFR_FAN_FAULT			BIT(0)
+#define P17531_MFR_THERMAL_FAULT		BIT(1)
+#define P17531_MFR_OV_FAULT			BIT(2)
+#define P17531_MFR_UV_FAULT			BIT(3)
+#define P17531_MFR_PS_KILL			BIT(4)
+#define P17531_MFR_OC_FAULT			BIT(5)
+#define P17531_MFR_VAUX_FAULT			BIT(6)
+#define P17531_MFR_CURRENT_SHARE_WARNING	BIT(7)
+
+static int p17531_read_word_data(struct i2c_client *client, int page, int reg);
+
+static int p17531_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int rc, mfr;
+
+	switch (reg) {
+	case PMBUS_STATUS_BYTE:
+	case PMBUS_STATUS_WORD:
+		rc = p17531_read_word_data(client, page, PMBUS_STATUS_WORD);
+		break;
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
+		if (reg == PMBUS_STATUS_FAN_12) {
+			if (mfr & P17531_MFR_FAN_FAULT)
+				rc |= PB_FAN_FAN1_FAULT;
+		} else if (reg == PMBUS_STATUS_TEMPERATURE) {
+			if (mfr & P17531_MFR_THERMAL_FAULT)
+				rc |= PB_TEMP_OT_FAULT;
+		} else if (reg == PMBUS_STATUS_VOUT) {
+			if (mfr &
+			    (P17531_MFR_OV_FAULT | P17531_MFR_VAUX_FAULT))
+				rc |= PB_VOLTAGE_OV_FAULT;
+			if (mfr & P17531_MFR_UV_FAULT)
+				rc |= PB_VOLTAGE_UV_FAULT;
+		} else if (reg == PMBUS_STATUS_IOUT) {
+			if (mfr & P17531_MFR_OC_FAULT)
+				rc |= PB_IOUT_OC_FAULT;
+			if (mfr & P17531_MFR_CURRENT_SHARE_WARNING)
+				rc |= PB_CURRENT_SHARE_FAULT;
+		}
+		break;
+	default:
+		if (reg >= PMBUS_VIRT_BASE)
+			return -ENXIO;
+
+		rc = pmbus_read_byte_data(client, page, reg);
+		break;
+	}
+
+	return rc;
+}
+
+static int p17531_read_word_data(struct i2c_client *client, int page, int reg)
+{
+	int rc, mfr;
+
+	switch (reg) {
+	case PMBUS_STATUS_BYTE:
+	case PMBUS_STATUS_WORD:
+		rc = pmbus_read_word_data(client, page, PMBUS_STATUS_WORD);
+		if (rc < 0)
+			return rc;
+
+		mfr = pmbus_read_byte_data(client, page,
+					   PMBUS_STATUS_MFR_SPECIFIC);
+		if (mfr < 0)
+			return rc;
+
+		if (mfr & P17531_MFR_PS_KILL)
+			rc |= PB_STATUS_OFF;
+
+		if (mfr)
+			rc |= PB_STATUS_WORD_MFR;
+		break;
+	default:
+		if (reg >= PMBUS_VIRT_BASE)
+			return -ENXIO;
+
+		rc = pmbus_read_word_data(client, page, reg);
+		if (rc < 0)
+			rc = p17531_read_byte_data(client, page, reg);
+		break;
+	}
+
+	return rc;
+}
+
+static struct pmbus_driver_info p17531_info = {
+	.pages = 1,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
+		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
+	.read_byte_data = p17531_read_byte_data,
+	.read_word_data = p17531_read_word_data,
+};
+
+static int p17531_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	return pmbus_do_probe(client, id, &p17531_info);
+}
+
+static int p17531_remove(struct i2c_client *client)
+{
+	return pmbus_do_remove(client);
+}
+
+enum chips { p17531 };
+
+static const struct i2c_device_id p17531_id[] = {
+	{ "p17531", p17531 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, p17531_id);
+
+static const struct of_device_id p17531_of_match[] = {
+	{ .compatible = "ibm,p17531" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
+
+static struct i2c_driver p17531_driver = {
+	.driver = {
+		.name = "p17531",
+		.of_match_table = p17531_of_match,
+	},
+	.probe = p17531_probe,
+	.remove = p17531_remove,
+	.id_table = p17531_id,
+};
+
+module_i2c_driver(p17531_driver);
+
+MODULE_AUTHOR("Eddie James");
+MODULE_DESCRIPTION("PMBus driver for IBM P17531");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1
