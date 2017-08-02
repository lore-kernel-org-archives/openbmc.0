Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xN4Sl2nSKzDqxC
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 06:25:43 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v72KNvcj089456
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 16:25:40 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c3j09b0v9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 16:25:40 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 2 Aug 2017 14:25:40 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Aug 2017 14:25:38 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v72KPbYB65470560; Wed, 2 Aug 2017 13:25:37 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E52196A03B;
 Wed,  2 Aug 2017 14:25:37 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 9EB646A03C;
 Wed,  2 Aug 2017 14:25:37 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bjwyman@gmail.com, mspinler@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 1/5] drivers/hwmon/pmbus: Add IBM power
 supply hwmon driver
Date: Wed,  2 Aug 2017 15:25:30 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501705534-27606-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080220-0028-0000-0000-00000821197C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007472; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00896632; UDB=6.00448562; IPR=6.00676819; 
 BA=6.00005506; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016502; XFM=3.00000015;
 UTC=2017-08-02 20:25:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080220-0029-0000-0000-000036F5D975
Message-Id: <1501705534-27606-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708020329
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
X-List-Received-Date: Wed, 02 Aug 2017 20:25:44 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add the driver to monitor power supplies with hwmon over pmbus.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/Kconfig  |  10 +++
 drivers/hwmon/pmbus/Makefile |   1 +
 drivers/hwmon/pmbus/ibmps.c  | 164 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/ibmps.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 04f6baa..079a087 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -37,6 +37,16 @@ config SENSORS_ADM1275
 	  This driver can also be built as a module. If so, the module will
 	  be called adm1275.
 
+config SENSORS_IBMPS
+	tristate "IBM Power Supply"
+	default n
+	help
+	  If you say yes here you get hardware monitoring support for IBM
+	  power supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ibmps.
+
 config SENSORS_IR35221
 	tristate "Infineon IR35221"
 	default n
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 663801c..76d77e0 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -5,6 +5,7 @@
 obj-$(CONFIG_PMBUS)		+= pmbus_core.o
 obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
+obj-$(CONFIG_SENSORS_IBMPS)	+= ibmps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
diff --git a/drivers/hwmon/pmbus/ibmps.c b/drivers/hwmon/pmbus/ibmps.c
new file mode 100644
index 0000000..1928dd9
--- /dev/null
+++ b/drivers/hwmon/pmbus/ibmps.c
@@ -0,0 +1,164 @@
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
+#define IBMPS_MFR_FAN_FAULT			BIT(0)
+#define IBMPS_MFR_THERMAL_FAULT			BIT(1)
+#define IBMPS_MFR_OV_FAULT			BIT(2)
+#define IBMPS_MFR_UV_FAULT			BIT(3)
+#define IBMPS_MFR_PS_KILL			BIT(4)
+#define IBMPS_MFR_OC_FAULT			BIT(5)
+#define IBMPS_MFR_VAUX_FAULT			BIT(6)
+#define IBMPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
+
+static int ibmps_read_word_data(struct i2c_client *client, int page, int reg);
+
+static int ibmps_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int rc, mfr;
+
+	switch (reg) {
+	case PMBUS_STATUS_BYTE:
+	case PMBUS_STATUS_WORD:
+		rc = ibmps_read_word_data(client, page, PMBUS_STATUS_WORD);
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
+			if (mfr & IBMPS_MFR_FAN_FAULT)
+				rc |= PB_FAN_FAN1_FAULT;
+		} else if (reg == PMBUS_STATUS_TEMPERATURE) {
+			if (mfr & IBMPS_MFR_THERMAL_FAULT)
+				rc |= PB_TEMP_OT_FAULT;
+		} else if (reg == PMBUS_STATUS_VOUT) {
+			if (mfr & (IBMPS_MFR_OV_FAULT | IBMPS_MFR_VAUX_FAULT))
+				rc |= PB_VOLTAGE_OV_FAULT;
+			if (mfr & IBMPS_MFR_UV_FAULT)
+				rc |= PB_VOLTAGE_UV_FAULT;
+		} else if (reg == PMBUS_STATUS_IOUT) {
+			if (mfr & IBMPS_MFR_OC_FAULT)
+				rc |= PB_IOUT_OC_FAULT;
+			if (mfr & IBMPS_MFR_CURRENT_SHARE_WARNING)
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
+static int ibmps_read_word_data(struct i2c_client *client, int page, int reg)
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
+		if (mfr & IBMPS_MFR_PS_KILL)
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
+			rc = ibmps_read_byte_data(client, page, reg);
+		break;
+	}
+
+	return rc;
+}
+
+static struct pmbus_driver_info ibmps_info = {
+	.pages = 1,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
+		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
+	.read_byte_data = ibmps_read_byte_data,
+	.read_word_data = ibmps_read_word_data,
+};
+
+static int ibmps_probe(struct i2c_client *client,
+		       const struct i2c_device_id *id)
+{
+	return pmbus_do_probe(client, id, &ibmps_info);
+}
+
+static int ibmps_remove(struct i2c_client *client)
+{
+	return pmbus_do_remove(client);
+}
+
+enum chips { witherspoon };
+
+static const struct i2c_device_id ibmps_id[] = {
+	{ "witherspoon", witherspoon },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ibmps_id);
+
+static const struct of_device_id ibmps_of_match[] = {
+	{ .compatible = "ibm,ibmps" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
+
+static struct i2c_driver ibmps_driver = {
+	.driver = {
+		.name = "ibmps",
+		.of_match_table = ibmps_of_match,
+	},
+	.probe = ibmps_probe,
+	.remove = ibmps_remove,
+	.id_table = ibmps_id,
+};
+
+module_i2c_driver(ibmps_driver);
+
+MODULE_AUTHOR("Eddie James");
+MODULE_DESCRIPTION("PMBus driver for IBM power supply");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1
