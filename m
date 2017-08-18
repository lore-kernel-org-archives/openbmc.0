Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xYQdY6KJfzDrJh
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 11:35:45 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7I1XqMI152986
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 21:35:43 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cdmac6ue0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 21:35:42 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 17 Aug 2017 21:35:42 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 17 Aug 2017 21:35:39 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7I1ZbAA26214614; Fri, 18 Aug 2017 01:35:39 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49348112040;
 Thu, 17 Aug 2017 21:35:28 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.3.230])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 0A97D11204B;
 Thu, 17 Aug 2017 21:35:25 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v3 1/2] hwmon: (ucd9000) Add gpio chip
 interface and clear logged faults
Date: Thu, 17 Aug 2017 20:35:25 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170818013526.35678-1-cbostic@linux.vnet.ibm.com>
References: <20170818013526.35678-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17081801-0040-0000-0000-00000391606A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007564; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000222; SDB=6.00903875; UDB=6.00452837; IPR=6.00684087; 
 BA=6.00005538; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016748; XFM=3.00000015;
 UTC=2017-08-18 01:35:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081801-0041-0000-0000-000007858FC2
Message-Id: <20170818013526.35678-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-17_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708180021
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
X-List-Received-Date: Fri, 18 Aug 2017 01:35:46 -0000

Add a struct gpio_chip and define some methods so that this device's
I/O can be accessed via /sys/class/gpio.

Add capability to clear logged faults via sysfs.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
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
 drivers/hwmon/pmbus/ucd9000.c | 136 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 134 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 3e3aa95..af44c1e 100644
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
@@ -34,8 +37,16 @@
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
+#define UCD9000_GPIO_CONFIG_STATUS	BIT(3)
+
 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
 #define UCD9000_MON_PAGE(x)	((x) & 0x0f)
 
@@ -46,9 +57,12 @@
 
 #define UCD9000_NUM_FAN		4
 
+#define UCD90160_NUM_GPIOS	26
+
 struct ucd9000_data {
 	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
 	struct pmbus_driver_info info;
+	struct gpio_chip gpio;
 };
 #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
 
@@ -119,6 +133,92 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
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
+		dev_err(&client->dev,
+			"Failed to read pin ID %d\n", offset);
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
+		dev_err(&client->dev,
+			"failed to read GPIO config\n");
+		return ret;
+	}
+
+	return ret & UCD9000_GPIO_CONFIG_STATUS ? 1 : 0;
+}
+
+static int ucd9000_gpio_get_direction(struct gpio_chip *gc,
+					unsigned int offset)
+{
+	struct i2c_client *client  = gpiochip_get_data(gc);
+	int ret;
+
+	ret = ucd9000_gpio_read_config(client, offset);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"failed to read GPIO config\n");
+		return ret;
+	}
+
+	return ret & UCD9000_GPIO_CONFIG_OUT_ENABLE ? 0 : 1;
+}
+
+/*
+ * Defined so that libgpiod tool can access pin states.  No plan to actually
+ * change pin direction within this driver.
+ */
+static int ucd9000_gpio_direction_input(struct gpio_chip *gc,
+					unsigned int offset)
+{
+	return 0;
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
+		dev_err(&client->dev, "Failed to clear logged faults\n");
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
@@ -227,7 +327,39 @@ static int ucd9000_probe(struct i2c_client *client,
 		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
 	}
 
-	return pmbus_do_probe(client, mid, info);
+	data->gpio.label = "gpio-ucd9000";
+	data->gpio.get_direction = ucd9000_gpio_get_direction;
+	data->gpio.direction_input = ucd9000_gpio_direction_input;
+	data->gpio.get = ucd9000_gpio_get;
+	data->gpio.can_sleep = 1;
+	data->gpio.base = -1;
+	if (mid->driver_data == ucd90160)
+		data->gpio.ngpio = UCD90160_NUM_GPIOS;
+	data->gpio.parent = &client->dev;
+	data->gpio.owner = THIS_MODULE;
+
+	ret = devm_gpiochip_add_data(&client->dev, &data->gpio, client);
+	if (ret) {
+		data->gpio.parent = NULL;
+		dev_warn(&client->dev, "Count not add gpiochip\n");
+		return ret;
+	}
+
+	dev_info(&client->dev, "gpios %i...%i\n", data->gpio.base,
+		data->gpio.base + data->gpio.ngpio - 1);
+
+	ret = sysfs_create_group(&client->dev.kobj,
+				&ucd9000_attr_group);
+	if (ret < 0)
+		return ret;
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
@@ -236,7 +368,7 @@ static int ucd9000_probe(struct i2c_client *client,
 		.name = "ucd9000",
 	},
 	.probe = ucd9000_probe,
-	.remove = pmbus_do_remove,
+	.remove = ucd9000_remove,
 	.id_table = ucd9000_id,
 };
 
-- 
1.8.2.2
