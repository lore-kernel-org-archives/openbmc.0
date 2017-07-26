Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHpS95JQ1zDqmc
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 07:40:25 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6QLcp4P071550
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 17:40:23 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bxxvgmhnp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 17:40:23 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 26 Jul 2017 17:40:22 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 26 Jul 2017 17:40:19 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6QLeIUV20054210; Wed, 26 Jul 2017 21:40:18 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6843AC051;
 Wed, 26 Jul 2017 17:40:30 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 8E113AC03A;
 Wed, 26 Jul 2017 17:40:30 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, mspinler@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers/hwmon/pmbus: Add IBM P178531 driver
Date: Wed, 26 Jul 2017 16:40:13 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17072621-0040-0000-0000-000003860FDF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007431; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00893331; UDB=6.00446597; IPR=6.00673495; 
 BA=6.00005492; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016395; XFM=3.00000015;
 UTC=2017-07-26 21:40:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072621-0041-0000-0000-0000077A2F2A
Message-Id: <1501105213-13881-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707260317
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
X-List-Received-Date: Wed, 26 Jul 2017 21:40:26 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add the driver to monitor power supply with hwmon.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/Kconfig  | 10 ++++++
 drivers/hwmon/pmbus/Makefile |  1 +
 drivers/hwmon/pmbus/p17531.c | 81 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/p17531.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 68d717a..808ef2f 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -125,6 +125,16 @@ config SENSORS_MAX8688
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
index 75bb7ca..f43628f 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
 obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
 obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
+obj-$(CONFIG_SENSORS_P17531)	+= p17531.o
 obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
diff --git a/drivers/hwmon/pmbus/p17531.c b/drivers/hwmon/pmbus/p17531.c
new file mode 100644
index 0000000..ae6a19f
--- /dev/null
+++ b/drivers/hwmon/pmbus/p17531.c
@@ -0,0 +1,81 @@
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
+static struct pmbus_driver_info p17531_info = {
+	.pages = 1,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_TEMP |
+		PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT |
+		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_FAN12,
+};
+
+static ssize_t p17531_clear_fault(struct device *dev,
+				  struct device_attribute *dev_attr,
+				  const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	pmbus_clear_faults(client);
+
+	return count;
+}
+
+static DEVICE_ATTR(clear_fault, 0200, NULL, p17531_clear_fault);
+
+static int p17531_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	int rc;
+
+	rc = pmbus_do_probe(client, id, &p17531_info);
+	if (rc < 0)
+		return rc;
+
+	rc = device_create_file(&client->dev, &dev_attr_clear_fault);
+
+	return rc;
+}
+
+static int p17531_remove(struct i2c_client *client)
+{
+	device_remove_file(&client->dev, &dev_attr_clear_fault);
+
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
+static struct i2c_driver p17531_driver = {
+	.driver = {
+		.name = "p17531",
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
