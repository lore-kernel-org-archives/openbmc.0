Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zyf8M1kP8zF1rk
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 07:28:02 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w29KOtk5096830
 for <openbmc@lists.ozlabs.org>; Fri, 9 Mar 2018 15:28:00 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gkw89htke-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Mar 2018 15:28:00 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 9 Mar 2018 13:27:59 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 9 Mar 2018 13:27:57 -0700
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w29KRuLq11338160; Fri, 9 Mar 2018 13:27:56 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 751A96A03C;
 Fri,  9 Mar 2018 13:27:56 -0700 (MST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 0A6736A03B;
 Fri,  9 Mar 2018 13:27:55 -0700 (MST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, mspinler@linux.vnet.ibm.com,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 1/2] hwmon: (ucd9000) Add gpio chip interface
Date: Fri,  9 Mar 2018 14:27:48 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1520627269-23227-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520627269-23227-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18030920-0008-0000-0000-0000097018FF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008642; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01000671; UDB=6.00509014; IPR=6.00780001; 
 MB=3.00019944; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-09 20:27:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030920-0009-0000-0000-00004654733F
Message-Id: <1520627269-23227-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-09_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803090242
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Mar 2018 20:28:03 -0000

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Add a struct gpio_chip and define some methods so that this device's
I/O can be accessed via /sys/class/gpio.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 220 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index b74dbec..e3a507f 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -27,6 +27,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/pmbus.h>
+#include <linux/gpio.h>
 #include "pmbus.h"
 
 enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
@@ -35,8 +36,18 @@
 #define UCD9000_NUM_PAGES		0xd6
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
+#define UCD9000_GPIO_SELECT		0xfa
+#define UCD9000_GPIO_CONFIG		0xfb
 #define UCD9000_DEVICE_ID		0xfd
 
+/* GPIO CONFIG bits */
+#define UCD9000_GPIO_CONFIG_ENABLE	BIT(0)
+#define UCD9000_GPIO_CONFIG_OUT_ENABLE	BIT(1)
+#define UCD9000_GPIO_CONFIG_OUT_VALUE	BIT(2)
+#define UCD9000_GPIO_CONFIG_STATUS	BIT(3)
+#define UCD9000_GPIO_INPUT		0
+#define UCD9000_GPIO_OUTPUT		1
+
 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
 #define UCD9000_MON_PAGE(x)	((x) & 0x0f)
 
@@ -47,9 +58,15 @@
 
 #define UCD9000_NUM_FAN		4
 
+#define UCD9000_GPIO_NAME_LEN	16
+#define UCD9090_NUM_GPIOS	23
+#define UCD901XX_NUM_GPIOS	26
+#define UCD90910_NUM_GPIOS	26
+
 struct ucd9000_data {
 	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
 	struct pmbus_driver_info info;
+	struct gpio_chip gpio;
 };
 #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
 
@@ -149,6 +166,168 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
 };
 MODULE_DEVICE_TABLE(of, ucd9000_of_match);
 
+static int ucd9000_gpio_read_config(struct i2c_client *client,
+				    unsigned int offset)
+{
+	int ret;
+
+	/* No page set required */
+	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_SELECT, offset);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to select GPIO %d: %d\n", offset,
+			ret);
+
+		return ret;
+	}
+
+	return i2c_smbus_read_byte_data(client, UCD9000_GPIO_CONFIG);
+}
+
+static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct i2c_client *client  = gpiochip_get_data(gc);
+	int ret;
+
+	ret = ucd9000_gpio_read_config(client, offset);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
+			offset, ret);
+
+		return ret;
+	}
+
+	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
+}
+
+static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
+{
+	struct i2c_client *client = gpiochip_get_data(gc);
+	int ret;
+
+	ret = ucd9000_gpio_read_config(client, offset);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
+			offset, ret);
+
+		return;
+	}
+
+	if (value) {
+		if (ret & UCD9000_GPIO_CONFIG_STATUS)
+			return;
+
+		ret |= UCD9000_GPIO_CONFIG_STATUS;
+	} else {
+		if (!(ret & UCD9000_GPIO_CONFIG_STATUS))
+			return;
+
+		ret &= ~UCD9000_GPIO_CONFIG_STATUS;
+	}
+
+	ret |= UCD9000_GPIO_CONFIG_ENABLE;
+
+	/* Page set not required */
+	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, ret);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
+			offset, ret);
+
+		return;
+	}
+
+	ret &= ~UCD9000_GPIO_CONFIG_ENABLE;
+
+	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, ret);
+	if (ret < 0)
+		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
+			offset, ret);
+}
+
+static int ucd9000_gpio_get_direction(struct gpio_chip *gc,
+				      unsigned int offset)
+{
+	struct i2c_client *client = gpiochip_get_data(gc);
+	int ret;
+
+	ret = ucd9000_gpio_read_config(client, offset);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
+			offset, ret);
+
+		return ret;
+	}
+
+	return !(ret & UCD9000_GPIO_CONFIG_OUT_ENABLE);
+}
+
+static int ucd9000_gpio_set_direction(struct gpio_chip *gc,
+				      unsigned int offset, bool direction_out,
+				      int requested_out)
+{
+	struct i2c_client *client = gpiochip_get_data(gc);
+	int ret, config, out_val;
+
+	ret = ucd9000_gpio_read_config(client, offset);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read GPIO %d config: %d\n",
+			offset, ret);
+
+		return ret;
+	}
+
+	if (direction_out) {
+		out_val = requested_out ? UCD9000_GPIO_CONFIG_OUT_VALUE : 0;
+
+		if (ret & UCD9000_GPIO_CONFIG_OUT_ENABLE) {
+			if ((ret & UCD9000_GPIO_CONFIG_OUT_VALUE) == out_val)
+				return 0;
+		} else {
+			ret |= UCD9000_GPIO_CONFIG_OUT_ENABLE;
+		}
+
+		if (out_val)
+			ret |= UCD9000_GPIO_CONFIG_OUT_VALUE;
+		else
+			ret &= ~UCD9000_GPIO_CONFIG_OUT_VALUE;
+
+	} else {
+		if (!(ret & UCD9000_GPIO_CONFIG_OUT_ENABLE))
+			return 0;
+
+		ret &= ~UCD9000_GPIO_CONFIG_OUT_ENABLE;
+	}
+
+	ret |= UCD9000_GPIO_CONFIG_ENABLE;
+	config = ret;
+
+	/* Page set not required */
+	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, config);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to write GPIO %d config: %d\n",
+			offset, ret);
+
+		return ret;
+	}
+
+	config &= ~UCD9000_GPIO_CONFIG_ENABLE;
+
+	return i2c_smbus_write_byte_data(client, UCD9000_GPIO_CONFIG, config);
+}
+
+static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
+					unsigned int offset)
+{
+	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_INPUT, 0);
+}
+
+static int ucd9000_gpio_direction_output(struct gpio_chip *gc,
+					 unsigned int offset, int val)
+{
+	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_OUTPUT,
+					  val);
+}
+
 static int ucd9000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -263,6 +442,47 @@ static int ucd9000_probe(struct i2c_client *client,
 		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
 	}
 
+	/*
+	 * Note:
+	 *
+	 * Pinmux support has not been added to the new gpio_chip.
+	 * This support should be added when possible given the mux
+	 * behavior of these IO devices.
+	 */
+	data->gpio.label = (const char *)&client->name;
+	data->gpio.get_direction = ucd9000_gpio_get_direction;
+	data->gpio.direction_input = ucd9000_gpio_direction_input;
+	data->gpio.direction_output = ucd9000_gpio_direction_output;
+	data->gpio.get = ucd9000_gpio_get;
+	data->gpio.set = ucd9000_gpio_set;
+	data->gpio.can_sleep = 1;
+	data->gpio.base = -1;
+
+	/* No default case. No data available for ucd9000. */
+	switch (mid->driver_data) {
+	case ucd9090:
+		data->gpio.ngpio = UCD9090_NUM_GPIOS;
+		break;
+	case ucd90120:
+	case ucd90124:
+	case ucd90160:
+		data->gpio.ngpio = UCD901XX_NUM_GPIOS;
+		break;
+	case ucd90910:
+		data->gpio.ngpio = UCD90910_NUM_GPIOS;
+		break;
+	}
+
+	data->gpio.parent = &client->dev;
+	data->gpio.owner = THIS_MODULE;
+
+	ret = devm_gpiochip_add_data(&client->dev, &data->gpio, client);
+	if (ret) {
+		data->gpio.parent = NULL;
+		dev_warn(&client->dev, "Could not add gpiochip: %d\n", ret);
+		return ret;
+	}
+
 	return pmbus_do_probe(client, mid, info);
 }
 
-- 
1.8.3.1
