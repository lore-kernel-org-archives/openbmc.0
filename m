Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkH4X6XfNzDqVP
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 06:26:04 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v58KNlOf117555
 for <openbmc@lists.ozlabs.org>; Thu, 8 Jun 2017 16:26:02 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2aydbx0k0k-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jun 2017 16:26:02 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 8 Jun 2017 14:26:01 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 8 Jun 2017 14:25:59 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v58KPx2d19857526; Thu, 8 Jun 2017 13:25:59 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA9EFBE03B;
 Thu,  8 Jun 2017 14:25:58 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 97781BE039;
 Thu,  8 Jun 2017 14:25:58 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 2/2] drivers: hwmon: occ: Add P8 OCC access
Date: Thu,  8 Jun 2017 15:25:51 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1496953551-27567-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1496953551-27567-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17060820-0012-0000-0000-0000146AF41E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007196; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872030; UDB=6.00433795; IPR=6.00652040; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015750; XFM=3.00000015;
 UTC=2017-06-08 20:26:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060820-0013-0000-0000-00004E0B5841
Message-Id: <1496953551-27567-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706080358
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
X-List-Received-Date: Thu, 08 Jun 2017 20:26:05 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Access the P8 OCC over I2C bus.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/Makefile     |   2 +-
 drivers/hwmon/occ/Kconfig  |  19 ++-
 drivers/hwmon/occ/Makefile |  12 +-
 drivers/hwmon/occ/p8_i2c.c | 282 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 312 insertions(+), 3 deletions(-)
 create mode 100644 drivers/hwmon/occ/p8_i2c.c

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 73d79bc..4b7c15f 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -47,7 +47,6 @@ obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
 obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
 obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
-obj-$(CONFIG_SENSORS_OCC_P9_SBE) += occ/
 obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
 obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
 obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
@@ -172,6 +171,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
 
+obj-$(CONFIG_SENSORS_OCC)	+= occ/
 obj-$(CONFIG_PMBUS)		+= pmbus/
 
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
index 8196b50..4024dc0 100644
--- a/drivers/hwmon/occ/Kconfig
+++ b/drivers/hwmon/occ/Kconfig
@@ -2,9 +2,26 @@
 # On-Chip Controller configuration
 #
 
+config SENSORS_OCC
+	tristate "POWER On-Chip Controller"
+	help
+	  If you say yes here you get support for monitoring the IBM POWER
+	  processor sensors via the On-Chip Controller (OCC).
+
+	  This driver can also be built as a module. If so, the module will be
+	  called occ-hwmon.
+
+config SENSORS_OCC_P8_I2C
+	bool "POWER8 OCC via I2C"
+	depends on I2C && SENSORS_OCC
+	help
+	  If you say yes here you get support for monitoring the POWER8
+	  processor sensors via the OCC, from a service processor, over I2C
+	  bus.
+
 config SENSORS_OCC_P9_SBE
 	bool "POWER9 OCC via SBE"
-	depends on OCCFIFO
+	depends on OCCFIFO && SENSORS_OCC
 	help
 	  If you say yes here you get support for monitoring the POWER9
 	  processor sensors via the OCC, from a service processor, over SBE
diff --git a/drivers/hwmon/occ/Makefile b/drivers/hwmon/occ/Makefile
index 6245c25..ab5c3e9 100644
--- a/drivers/hwmon/occ/Makefile
+++ b/drivers/hwmon/occ/Makefile
@@ -1 +1,11 @@
-obj-y += p9_sbe.o common.o
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
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
new file mode 100644
index 0000000..a15467a
--- /dev/null
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -0,0 +1,282 @@
+/*
+ * Copyright 2017 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <asm/unaligned.h>
+#include "common.h"
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/module.h>
+
+#define OCC_TIMEOUT_MS			5000
+#define OCC_CMD_IN_PRG_MS		100
+
+#define RESP_RETURN_CMD_IN_PRG		0xFF
+#define RESP_RETURN_SUCCESS		0
+#define RESP_RETURN_CMD_INVAL		0x11
+#define RESP_RETURN_CMD_LEN		0x12
+#define RESP_RETURN_DATA_INVAL		0x13
+#define RESP_RETURN_CHKSUM		0x14
+#define RESP_RETURN_OCC_ERR		0x15
+#define RESP_RETURN_STATE		0x16
+
+struct p8_i2c_occ {
+	struct occ occ;
+	struct i2c_client *client;
+};
+
+#define to_p8_i2c_occ(x)	container_of((x), struct p8_i2c_occ, occ)
+
+static int p8_i2c_occ_getscom(struct i2c_client *client, u32 address, u8 *data)
+{
+	ssize_t rc;
+	__be64 buf_be;
+	u64 buf;
+	struct i2c_msg msgs[2];
+
+	address <<= 1;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = client->flags & I2C_M_TEN;
+	msgs[0].len = sizeof(u32);
+	msgs[0].buf = (char *)&address;
+
+
+	msgs[1].addr = client->addr;
+	msgs[1].flags = (client->flags & I2C_M_TEN) | I2C_M_RD;
+	msgs[1].len = sizeof(u64);
+	msgs[1].buf = (char *)&buf_be;
+
+	rc = i2c_transfer(client->adapter, msgs, 2);
+	if (rc < 0)
+		return rc;
+
+	buf = be64_to_cpu(buf_be);
+	memcpy(data, &buf, sizeof(u64));
+
+	return 0;
+}
+
+static int p8_i2c_occ_putscom(struct i2c_client *client, u32 address, u8 *data)
+{
+	u32 buf[3];
+	ssize_t rc;
+
+	address <<= 1;
+
+	buf[0] = address;
+	memcpy(&buf[1], &data[4], sizeof(u32));
+	memcpy(&buf[2], data, sizeof(u32));
+
+	rc = i2c_master_send(client, (const char *)buf, sizeof(buf));
+	if (rc < 0)
+		return rc;
+	else if (rc != sizeof(buf))
+		return -EIO;
+
+	return 0;
+}
+
+static int p8_i2c_occ_putscom_u32(struct i2c_client *client, u32 address,
+				  u32 data0, u32 data1)
+{
+	u8 buf[8];
+
+	memcpy(buf, &data0, 4);
+	memcpy(buf + 4, &data1, 4);
+
+	return p8_i2c_occ_putscom(client, address, buf);
+}
+
+static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
+				 u8 *data)
+{
+	unsigned int i;
+	u8 buf[8];
+
+	for (i = 0; i < 4; ++i) {
+		buf[i] = data[3 - i];
+		buf[i + 4] = data[7 - i];
+	}
+
+	return p8_i2c_occ_putscom(client, address, buf);
+}
+
+static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
+{
+	int i, rc;
+	unsigned long start;
+	u16 data_length;
+	struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
+	struct i2c_client *client = p8_i2c_occ->client;
+	struct occ_response *resp = &occ->resp;
+
+	start = jiffies;
+
+	/* set sram address for command */
+	rc = p8_i2c_occ_putscom_u32(client, 0x6B070, 0xFFFF6000, 0);
+	if (rc)
+		goto err;
+
+	/* write command (already be), i2c expects le */
+	rc = p8_i2c_occ_putscom_be(client, 0x6B075, cmd);
+	if (rc)
+		goto err;
+
+	/* trigger OCC attention */
+	rc = p8_i2c_occ_putscom_u32(client, 0x6B035, 0x20010000, 0);
+	if (rc)
+		goto err;
+
+	/* set sram address for response */
+	rc = p8_i2c_occ_putscom_u32(client, 0x6B070, 0xFFFF7000, 0);
+	if (rc)
+		goto err;
+
+retry:
+	rc = p8_i2c_occ_getscom(client, 0x6B075, (u8 *)resp);
+	if (rc)
+		goto err;
+
+	/* check the occ response */
+	switch (resp->return_status) {
+	case RESP_RETURN_CMD_IN_PRG:
+		if (time_after(jiffies,
+			       start + msecs_to_jiffies(OCC_TIMEOUT_MS)))
+			rc = -EALREADY;
+		else {
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule_timeout(msecs_to_jiffies(OCC_CMD_IN_PRG_MS));
+
+			goto retry;
+		}
+		break;
+	case RESP_RETURN_SUCCESS:
+		rc = 0;
+		break;
+	case RESP_RETURN_CMD_INVAL:
+	case RESP_RETURN_CMD_LEN:
+	case RESP_RETURN_DATA_INVAL:
+	case RESP_RETURN_CHKSUM:
+		rc = -EINVAL;
+		break;
+	case RESP_RETURN_OCC_ERR:
+		rc = -EREMOTE;
+		break;
+	default:
+		rc = -EFAULT;
+	}
+
+	if (rc < 0) {
+		dev_warn(&client->dev, "occ bad response:%d\n",
+			 resp->return_status);
+		return rc;
+	}
+
+	data_length = get_unaligned_be16(&resp->data_length_be);
+	if (data_length > OCC_RESP_DATA_BYTES) {
+		dev_warn(&client->dev, "occ bad data length:%d\n",
+			 data_length);
+		return -EDOM;
+	}
+
+	for (i = 8; i < data_length + 7; i += 8) {
+		rc = p8_i2c_occ_getscom(client, 0x6B075, ((u8 *)resp) + i);
+		if (rc)
+			goto err;
+	}
+
+	return data_length + 7;
+
+err:
+	dev_err(&client->dev, "i2c scom op failed rc:%d\n", rc);
+	return rc;
+}
+
+static int p8_i2c_occ_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	int rc;
+	struct occ *occ;
+	struct p8_i2c_occ *p8_i2c_occ = devm_kzalloc(&client->dev,
+						     sizeof(*p8_i2c_occ),
+						     GFP_KERNEL);
+	if (!p8_i2c_occ)
+		return -ENOMEM;
+
+	p8_i2c_occ->client = client;
+
+	occ = &p8_i2c_occ->occ;
+	occ->bus_dev = &client->dev;
+	occ->groups[0] = &occ->group;
+	occ->poll_cmd_data = 0x10;
+	occ->send_cmd = p8_i2c_occ_send_cmd;
+	mutex_init(&occ->lock);
+
+	dev_set_drvdata(&client->dev, occ);
+
+	/* no need to lock yet */
+	rc = occ_poll(occ);
+	if (rc < 0) {
+		dev_err(occ->bus_dev, "failed to get OCC poll response: %d\n",
+			rc);
+		return rc;
+	}
+
+	occ_parse_poll_response(occ);
+
+	rc = occ_setup_sensor_attrs(occ);
+	if (rc) {
+		dev_err(occ->bus_dev, "failed to setup p8 attrs: %d\n", rc);
+		return rc;
+	}
+
+	occ->hwmon = devm_hwmon_device_register_with_groups(occ->bus_dev,
+							    "p8_occ", occ,
+							    occ->groups);
+	if (IS_ERR(occ->hwmon)) {
+		rc = PTR_ERR(occ->hwmon);
+		dev_err(occ->bus_dev, "failed to register hwmon device: %d\n",
+			rc);
+		return rc;
+	}
+
+	rc = occ_create_status_attrs(occ);
+	if (rc) {
+		dev_err(occ->bus_dev, "failed to setup p8 status attrs: %d\n",
+			rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id p8_i2c_occ_of_match[] = {
+	{ .compatible = "ibm,p8-occ-hwmon" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, p8_i2c_occ_of_match);
+
+static const unsigned short p8_i2c_occ_addr[] = { 0x50, 0x51, I2C_CLIENT_END };
+
+static struct i2c_driver p8_i2c_occ_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "occ-hwmon",
+		.of_match_table = p8_i2c_occ_of_match,
+	},
+	.probe = p8_i2c_occ_probe,
+	.address_list = p8_i2c_occ_addr,
+};
+
+module_i2c_driver(p8_i2c_occ_driver);
+
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("BMC P8 OCC hwmon driver");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1
