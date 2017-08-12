Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xV8184Df0zDqp7
 for <openbmc@lists.ozlabs.org>; Sun, 13 Aug 2017 03:26:20 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7CHNdC9116056
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 13:26:18 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ca12c1067-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 13:26:18 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Sat, 12 Aug 2017 13:26:16 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 12 Aug 2017 13:26:15 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7CHQEmj24444934; Sat, 12 Aug 2017 17:26:14 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B36D8B2052;
 Sat, 12 Aug 2017 13:23:40 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.3.186])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 38F0BB204D;
 Sat, 12 Aug 2017 13:23:37 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v2] hwmon: (ucd9000) Add syfs access files for
 chip specific faults
Date: Sat, 12 Aug 2017 12:26:07 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17081217-0036-0000-0000-00000257D39B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007532; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00901314; UDB=6.00451307; IPR=6.00681528; 
 BA=6.00005525; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016662; XFM=3.00000015;
 UTC=2017-08-12 17:26:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081217-0037-0000-0000-0000416AA854
Message-Id: <20170812172607.74148-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-12_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708120286
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
X-List-Received-Date: Sat, 12 Aug 2017 17:26:21 -0000

Create sysfs files for mfr specific fault indicators.
Add sysfs files for GPIO configuration access.
Link driver into the gpio device driver.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v2 - Removed clear_faults file - redundant since all other sysfs
     core accesses result in an automatic clear fault.
   - Removed local status_word and status_vout register dumps and
     use the new pmbus core status facilities instead.
   - Rename gpi<x>_fault to gpi<x>_alarm to better match core naming
     conventions.
   - Add full register dump for mfr_status.
   - Add gpio chip to device structure and use gpio interfaces.
---
 drivers/hwmon/pmbus/ucd9000.c | 268 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 266 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 3e3aa95..ecd3e1a 100644
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
@@ -34,6 +37,10 @@
 #define UCD9000_NUM_PAGES		0xd6
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
+#define UCD9000_LOGGED_FAULTS		0xea
+#define UCD9000_MFR_STATUS		0xf3
+#define UCD9000_GPIO_SELECT		0xfa
+#define UCD9000_GPIO_CONFIG		0xfb
 #define UCD9000_DEVICE_ID		0xfd
 
 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
@@ -46,9 +53,14 @@
 
 #define UCD9000_NUM_FAN		4
 
+#define UCD9000_FULL_REG	BIT(8)
+
+#define UCD90160_NUM_GPIOS	26
+
 struct ucd9000_data {
 	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
 	struct pmbus_driver_info info;
+	struct gpio_chip gpio;
 };
 #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
 
@@ -119,6 +131,225 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
 };
 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
 
+static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			int value)
+{
+	struct i2c_client *client  = gpiochip_get_data(gc);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, offset, value);
+	if (ret)
+		dev_err(&client->dev, "Failed to set gpio select %d\n", value);
+}
+
+static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct i2c_client *client  = gpiochip_get_data(gc);
+
+	return i2c_smbus_read_byte_data(client, offset);
+}
+
+static ssize_t ucd9000_clear_logged_faults(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
+	if (ret) {
+		dev_err(&client->dev, "Failed to clear logged faults\n");
+		return ret;
+	}
+
+	return count;
+}
+
+static ssize_t ucd9000_mfr_status(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	bool full_reg = !!(sensor_attr->index & UCD9000_FULL_REG);
+	struct i2c_client *client = to_i2c_client(dev);
+	int nr = sensor_attr->index, ret;
+	u32 block_buffer;
+
+	ret = pmbus_set_page(client, 0);
+	if (ret < 0) {
+		dev_err(&client->dev, "i2c_smbus_write failed. rc:%d\n", ret);
+		return ret;
+	}
+
+	ret = i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
+					(u8 *)&block_buffer);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to read mfr status. rc:%d\n", ret);
+		return ret;
+	}
+
+	if (full_reg)
+		return sprintf(buf, "%08x\n", ret);
+	else
+		return sprintf(buf, "%1d\n", ret & BIT(nr) ? 1 : 0);
+}
+
+static ssize_t ucd9000_gpi_config(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ucd9000_data *data
+		= to_ucd9000_data(pmbus_get_driver_info(client));
+	int nr = (sensor_attr->index & 0xf00) >> 8;
+	int reg = sensor_attr->index & 0xff, ret;
+
+
+	ucd9000_gpio_set(&data->gpio, UCD9000_GPIO_SELECT, reg);
+	ret = ucd9000_gpio_get(&data->gpio, UCD9000_GPIO_CONFIG);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to read gpi%02d config\n", reg);
+	}
+
+	return sprintf(buf, "%1d\n", ret & BIT(nr) ? 1 : 0);
+}
+
+static DEVICE_ATTR(clear_logged_faults, 0200,
+			  NULL, ucd9000_clear_logged_faults);
+
+/* MFR status */
+static SENSOR_DEVICE_ATTR(gpi8_alarm, 0444, ucd9000_mfr_status, NULL, 23);
+static SENSOR_DEVICE_ATTR(gpi7_alarm, 0444, ucd9000_mfr_status, NULL, 22);
+static SENSOR_DEVICE_ATTR(gpi6_alarm, 0444, ucd9000_mfr_status, NULL, 21);
+static SENSOR_DEVICE_ATTR(gpi5_alarm, 0444, ucd9000_mfr_status, NULL, 20);
+static SENSOR_DEVICE_ATTR(gpi4_alarm, 0444, ucd9000_mfr_status, NULL, 19);
+static SENSOR_DEVICE_ATTR(gpi3_alarm, 0444, ucd9000_mfr_status, NULL, 18);
+static SENSOR_DEVICE_ATTR(gpi2_alarm, 0444, ucd9000_mfr_status, NULL, 17);
+static SENSOR_DEVICE_ATTR(gpi1_alarm, 0444, ucd9000_mfr_status, NULL, 16);
+static SENSOR_DEVICE_ATTR(new_logged_fault_detail, 0444,
+			ucd9000_mfr_status, NULL, 12);
+static SENSOR_DEVICE_ATTR(system_watchdog_timeout, 0444,
+			ucd9000_mfr_status, NULL, 11);
+static SENSOR_DEVICE_ATTR(store_default_all_error, 0444,
+			ucd9000_mfr_status, NULL, 10);
+static SENSOR_DEVICE_ATTR(store_default_all_done, 0444,
+			ucd9000_mfr_status, NULL, 9);
+static SENSOR_DEVICE_ATTR(watchdog_timeout, 0444,
+			ucd9000_mfr_status, NULL, 8);
+static SENSOR_DEVICE_ATTR(invalid_logs, 0444,
+			ucd9000_mfr_status, NULL, 7);
+static SENSOR_DEVICE_ATTR(logged_fault_detail, 0444,
+			ucd9000_mfr_status, NULL, 6);
+static SENSOR_DEVICE_ATTR(resequence_error, 0444, ucd9000_mfr_status, NULL, 5);
+static SENSOR_DEVICE_ATTR(pkgid_mismatch, 0444, ucd9000_mfr_status, NULL, 4);
+static SENSOR_DEVICE_ATTR(hardcoded_parms, 0444, ucd9000_mfr_status, NULL, 3);
+static SENSOR_DEVICE_ATTR(seq_off_timeout, 0444, ucd9000_mfr_status, NULL, 2);
+static SENSOR_DEVICE_ATTR(seq_on_timeout, 0444, ucd9000_mfr_status, NULL, 1);
+static SENSOR_DEVICE_ATTR(mfr_status, 0444,
+			ucd9000_mfr_status, NULL, UCD9000_FULL_REG);
+
+/* GPIO config */
+static SENSOR_DEVICE_ATTR(gpio8_enab, 0444, ucd9000_gpi_config, NULL, 8);
+static SENSOR_DEVICE_ATTR(gpio8_out_enab, 0444, ucd9000_gpi_config,
+			NULL, 0x0108);
+static SENSOR_DEVICE_ATTR(gpio8_out_val, 0444, ucd9000_gpi_config,
+			NULL, 0x0208);
+static SENSOR_DEVICE_ATTR(gpio8_stat, 0444, ucd9000_gpi_config,
+			NULL, 0x0308);
+static SENSOR_DEVICE_ATTR(gpio9_enab, 0444, ucd9000_gpi_config, NULL, 9);
+static SENSOR_DEVICE_ATTR(gpio9_out_enab, 0444, ucd9000_gpi_config,
+			NULL, 0x0109);
+static SENSOR_DEVICE_ATTR(gpio9_out_val, 0444, ucd9000_gpi_config,
+			NULL, 0x0209);
+static SENSOR_DEVICE_ATTR(gpio9_stat, 0444, ucd9000_gpi_config,
+			NULL, 0x0309);
+static SENSOR_DEVICE_ATTR(gpio10_enab, 0444, ucd9000_gpi_config, NULL, 10);
+static SENSOR_DEVICE_ATTR(gpio10_out_enab, 0444, ucd9000_gpi_config,
+			NULL, 0x010a);
+static SENSOR_DEVICE_ATTR(gpio10_out_val, 0444, ucd9000_gpi_config,
+			NULL, 0x020a);
+static SENSOR_DEVICE_ATTR(gpio10_stat, 0444, ucd9000_gpi_config,
+			NULL, 0x030a);
+static SENSOR_DEVICE_ATTR(gpio11_enab, 0444, ucd9000_gpi_config, NULL, 11);
+static SENSOR_DEVICE_ATTR(gpio11_out_enab, 0444, ucd9000_gpi_config,
+			NULL, 0x010b);
+static SENSOR_DEVICE_ATTR(gpio11_out_val, 0444, ucd9000_gpi_config,
+			NULL, 0x020b);
+static SENSOR_DEVICE_ATTR(gpio11_stat, 0444, ucd9000_gpi_config,
+			NULL, 0x030b);
+static SENSOR_DEVICE_ATTR(gpio14_enab, 0444, ucd9000_gpi_config, NULL, 14);
+static SENSOR_DEVICE_ATTR(gpio14_out_enab, 0444, ucd9000_gpi_config,
+			NULL, 0x010e);
+static SENSOR_DEVICE_ATTR(gpio14_out_val, 0444, ucd9000_gpi_config,
+			NULL, 0x020e);
+static SENSOR_DEVICE_ATTR(gpio14_stat, 0444, ucd9000_gpi_config,
+			NULL, 0x030e);
+static SENSOR_DEVICE_ATTR(gpio17_enab, 0444, ucd9000_gpi_config, NULL, 17);
+static SENSOR_DEVICE_ATTR(gpio17_out_enab, 0444, ucd9000_gpi_config,
+			NULL, 0x0111);
+static SENSOR_DEVICE_ATTR(gpio17_out_val, 0444, ucd9000_gpi_config,
+			NULL, 0x0211);
+static SENSOR_DEVICE_ATTR(gpio17_stat, 0444, ucd9000_gpi_config,
+			NULL, 0x0311);
+
+
+static struct attribute *ucd9000_attributes[] = {
+	&dev_attr_clear_logged_faults.attr,
+	&sensor_dev_attr_gpi8_alarm.dev_attr.attr,
+	&sensor_dev_attr_gpi7_alarm.dev_attr.attr,
+	&sensor_dev_attr_gpi6_alarm.dev_attr.attr,
+	&sensor_dev_attr_gpi5_alarm.dev_attr.attr,
+	&sensor_dev_attr_gpi4_alarm.dev_attr.attr,
+	&sensor_dev_attr_gpi3_alarm.dev_attr.attr,
+	&sensor_dev_attr_gpi2_alarm.dev_attr.attr,
+	&sensor_dev_attr_gpi1_alarm.dev_attr.attr,
+	&sensor_dev_attr_new_logged_fault_detail.dev_attr.attr,
+	&sensor_dev_attr_system_watchdog_timeout.dev_attr.attr,
+	&sensor_dev_attr_store_default_all_error.dev_attr.attr,
+	&sensor_dev_attr_store_default_all_done.dev_attr.attr,
+	&sensor_dev_attr_watchdog_timeout.dev_attr.attr,
+	&sensor_dev_attr_invalid_logs.dev_attr.attr,
+	&sensor_dev_attr_logged_fault_detail.dev_attr.attr,
+	&sensor_dev_attr_resequence_error.dev_attr.attr,
+	&sensor_dev_attr_pkgid_mismatch.dev_attr.attr,
+	&sensor_dev_attr_hardcoded_parms.dev_attr.attr,
+	&sensor_dev_attr_seq_off_timeout.dev_attr.attr,
+	&sensor_dev_attr_seq_on_timeout.dev_attr.attr,
+	&sensor_dev_attr_mfr_status.dev_attr.attr,
+	&sensor_dev_attr_gpio8_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio8_out_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio8_out_val.dev_attr.attr,
+	&sensor_dev_attr_gpio8_stat.dev_attr.attr,
+	&sensor_dev_attr_gpio9_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio9_out_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio9_out_val.dev_attr.attr,
+	&sensor_dev_attr_gpio9_stat.dev_attr.attr,
+	&sensor_dev_attr_gpio10_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio10_out_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio10_out_val.dev_attr.attr,
+	&sensor_dev_attr_gpio10_stat.dev_attr.attr,
+	&sensor_dev_attr_gpio11_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio11_out_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio11_out_val.dev_attr.attr,
+	&sensor_dev_attr_gpio11_stat.dev_attr.attr,
+	&sensor_dev_attr_gpio14_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio14_out_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio14_out_val.dev_attr.attr,
+	&sensor_dev_attr_gpio14_stat.dev_attr.attr,
+	&sensor_dev_attr_gpio17_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio17_out_enab.dev_attr.attr,
+	&sensor_dev_attr_gpio17_out_val.dev_attr.attr,
+	&sensor_dev_attr_gpio17_stat.dev_attr.attr,
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
@@ -227,7 +458,40 @@ static int ucd9000_probe(struct i2c_client *client,
 		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
 	}
 
-	return pmbus_do_probe(client, mid, info);
+	info->debugfs = true;
+
+	data->gpio.label = "gpio-ucd9000";
+	data->gpio.get = ucd9000_gpio_get;
+	data->gpio.set = ucd9000_gpio_set;
+	data->gpio.can_sleep = 1;
+	data->gpio.base = -1;
+	if (mid->driver_data == ucd90160)
+		data->gpio.ngpio = UCD90160_NUM_GPIOS;
+	data->gpio.parent = &client->dev;
+	data->gpio.owner = THIS_MODULE;
+
+	ret = devm_gpiochip_add_data(&client->dev, &data->gpio, client);
+	if (ret) {
+		/* Use data->gpio.dev as a flag for freeing gpiochip */
+		data->gpio.parent = NULL;
+		dev_warn(&client->dev, "Count not add gpiochip\n");
+		return ret;
+	}
+
+	dev_info(&client->dev, "gpios %i...%i\n", data->gpio.base,
+		data->gpio.base + data->gpio.ngpio - 1);
+
+	ret = sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
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
@@ -236,7 +500,7 @@ static int ucd9000_probe(struct i2c_client *client,
 		.name = "ucd9000",
 	},
 	.probe = ucd9000_probe,
-	.remove = pmbus_do_remove,
+	.remove = ucd9000_remove,
 	.id_table = ucd9000_id,
 };
 
-- 
1.8.2.2
