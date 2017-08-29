Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xhfpF3ZzrzDqF9
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 06:08:20 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7TK6Hr9046999
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 16:08:18 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cna46fce0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 16:08:17 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 29 Aug 2017 16:08:16 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 29 Aug 2017 16:08:15 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7TK8FOi23396556; Tue, 29 Aug 2017 20:08:15 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E91928048;
 Tue, 29 Aug 2017 16:08:08 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id EE9F128050;
 Tue, 29 Aug 2017 16:08:07 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v5 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
Date: Tue, 29 Aug 2017 15:08:12 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170829200813.66010-1-cbostic@linux.vnet.ibm.com>
References: <20170829200813.66010-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17082920-0044-0000-0000-00000384DDB7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007633; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00909392; UDB=6.00456087; IPR=6.00689676; 
 BA=6.00005560; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016921; XFM=3.00000015;
 UTC=2017-08-29 20:08:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17082920-0045-0000-0000-000007B2F636
Message-Id: <20170829200813.66010-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-29_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708290304
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
X-List-Received-Date: Tue, 29 Aug 2017 20:08:22 -0000

Add a struct gpio_chip and define some methods so that this device's
I/O can be accessed via /sys/class/gpio.

Present requirements only call for retrieving current state of pin
values and their direction.  No requirement at this time to switch
modes between output and input within the device driver.

Add capability to clear logged faults via sysfs.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v5 - Clean up remaining branch return statements to !! non
     branching method.
   - Clean up white space issues.
   - Add return codes to error messages.
   - Add comments describing assumptions of ucd90160 type.
   - Define gpio direction set methods.
   - Add unique id for each ucd9000 in system for gpio chip.
v4 - Change status check from branch to a !! non branching method
   - Remove usage comments on libgpiod for the struct gpio_chip
     methods.
   - Clean up some text formatting.
v3 - Correct bug in gpio_chip get method.  Wasn't retrieving
     gpio config information correctly.
   - Remove old debugfs flag from previous pmbus core changes.
   - Remove all sysfs files for mfr_status command.
   - Add comments on direct i2c_smbus calls to clarify that no page
     set is required.
v2 - Remove clear_faults file - redundant since all other sysfs
     core accesses result in an automatic clear fault.
   - Removed local status_word and status_vout register dumps and
     use the new pmbus core status facilities instead.
   - Rename gpi<x>_fault to gpi<x>_alarm to better match core naming
     conventions.
   - Add full register dump for mfr_status.
   - Add gpio chip to device structure and use gpio interfaces.
---
 drivers/hwmon/pmbus/ucd9000.c | 250 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 248 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 3e3aa95..cfd7703 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -26,6 +26,9 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/i2c/pmbus.h>
+#include <linux/sysfs.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/gpio.h>
 #include "pmbus.h"
 
 enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
@@ -34,8 +37,19 @@
 #define UCD9000_NUM_PAGES		0xd6
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
+#define UCD9000_LOGGED_FAULTS		0xea
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
 
@@ -46,9 +60,13 @@
 
 #define UCD9000_NUM_FAN		4
 
+#define UCD9000_GPIO_NAME_LEN	16
+#define UCD90160_NUM_GPIOS	26
+
 struct ucd9000_data {
 	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
 	struct pmbus_driver_info info;
+	struct gpio_chip gpio;
 };
 #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
 
@@ -119,6 +137,197 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
 };
 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
 
+static int ucd9000_gpio_read_config(struct i2c_client *client,
+				unsigned int offset)
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
+			int value)
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
+					unsigned int offset)
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
+	return ~(!!(ret & UCD9000_GPIO_CONFIG_OUT_ENABLE));
+}
+
+static int ucd9000_gpio_set_direction(struct gpio_chip *gc, unsigned int offset,
+					bool direction_out, int requested_out)
+{
+	struct i2c_client *client = gpiochip_get_data(gc);
+	int ret, config, out_val;
+
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
+		} else
+			ret |= UCD9000_GPIO_CONFIG_OUT_ENABLE;
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
+					unsigned int offset, int val)
+{
+	return ucd9000_gpio_set_direction(gc, offset, UCD9000_GPIO_OUTPUT, val);
+}
+
+static ssize_t ucd9000_clear_logged_faults(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	/* No page set required */
+	ret = i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
+	if (ret) {
+		dev_err(&client->dev, "Failed to clear logged faults: %d\n",
+			ret);
+
+		return ret;
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
+		ucd9000_clear_logged_faults);
+
+static struct attribute *ucd9000_attributes[] = {
+	&dev_attr_clear_logged_faults.attr,
+	NULL
+};
+
+static const struct attribute_group ucd9000_attr_group = {
+	.attrs = ucd9000_attributes,
+};
+
 static int ucd9000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -227,7 +436,44 @@ static int ucd9000_probe(struct i2c_client *client,
 		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
 	}
 
-	return pmbus_do_probe(client, mid, info);
+	data->gpio.label = (const char *)&client->name;
+	data->gpio.get_direction = ucd9000_gpio_get_direction;
+	data->gpio.direction_input = ucd9000_gpio_direction_input;
+	data->gpio.direction_output = ucd9000_gpio_direction_output;
+	data->gpio.get = ucd9000_gpio_get;
+	data->gpio.set = ucd9000_gpio_set;
+	data->gpio.can_sleep = 1;
+	data->gpio.base = -1;
+
+	/*
+	 * TODO: set ngpio for ucd9000 devs that aren't 90160 type
+	 */
+	if (mid->driver_data == ucd90160)
+		data->gpio.ngpio = UCD90160_NUM_GPIOS;
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
+	ret = sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
+	if (ret < 0) {
+		dev_warn(&client->dev, "Failed to add sysfs files: %d\n", ret);
+
+		return ret;
+	}
+
+	return  pmbus_do_probe(client, mid, info);
+}
+
+static int ucd9000_remove(struct i2c_client *client)
+{
+	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
+	return pmbus_do_remove(client);
 }
 
 /* This is the driver that will be inserted */
@@ -236,7 +482,7 @@ static int ucd9000_probe(struct i2c_client *client,
 		.name = "ucd9000",
 	},
 	.probe = ucd9000_probe,
-	.remove = pmbus_do_remove,
+	.remove = ucd9000_remove,
 	.id_table = ucd9000_id,
 };
 
-- 
1.8.2.2
