Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRv2d5Tf0zDqsT
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 11:34:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v791XjRg120922
 for <openbmc@lists.ozlabs.org>; Tue, 8 Aug 2017 21:34:45 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c7rp5gexp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 21:34:45 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 8 Aug 2017 19:34:45 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 Aug 2017 19:34:43 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v791YhBu65667222; Tue, 8 Aug 2017 18:34:43 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1014E13604B;
 Tue,  8 Aug 2017 19:34:43 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.81.217.134])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id DF0C513603A;
 Tue,  8 Aug 2017 19:34:40 -0600 (MDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] hwmon: (ucd9000) Add user space access of
 status and config
Date: Tue,  8 Aug 2017 20:34:36 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17080901-0012-0000-0000-000014CE22B3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007510; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899585; UDB=6.00450286; IPR=6.00679790; 
 BA=6.00005519; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016604; XFM=3.00000015;
 UTC=2017-08-09 01:34:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080901-0013-0000-0000-00004EF8D020
Message-Id: <20170809013436.21050-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-08_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708090022
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
X-List-Received-Date: Wed, 09 Aug 2017 01:34:50 -0000

Create sysfs files to export status_word, status_vout, gpio_config
and other properties of the ucd90160 device.  There are separate
files for each parsed bit.

Note that status_word and ton / toff has not yet been moved
into the pmbus core.  Once the final decision from the community
has been received I'll updating.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 390 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 389 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 3e3aa95..f384a39 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -26,6 +26,8 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/i2c/pmbus.h>
+#include <linux/sysfs.h>
+#include <linux/hwmon-sysfs.h>
 #include "pmbus.h"
 
 enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
@@ -34,6 +36,10 @@
 #define UCD9000_NUM_PAGES		0xd6
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
+#define UCD9000_LOGGED_FAULTS		0xea
+#define UCD9000_MFR_STATUS		0xf3
+#define UCD9000_GPIO_SELECT		0xfa
+#define UCD9000_GPIO_CONFIG		0xfb
 #define UCD9000_DEVICE_ID		0xfd
 
 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
@@ -119,6 +125,378 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
 };
 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
 
+static ssize_t ucd9000_clear_faults(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	pmbus_clear_faults(client);
+
+	return count;
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
+	return sprintf(buf, "%1d\n", ret & BIT(nr) ? 1 : 0);
+}
+
+static ssize_t ucd9000_gpi_config(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct i2c_client *client = to_i2c_client(dev);
+	int nr = (sensor_attr->index & 0xf00) >> 8;
+	int reg = sensor_attr->index & 0xff, ret;
+
+	ret = i2c_smbus_write_byte_data(client, UCD9000_GPIO_SELECT, reg);
+	if (ret) {
+		dev_err(&client->dev, "Failed to set gpio select %d\n", reg);
+		return ret;
+	}
+
+	ret = i2c_smbus_read_byte_data(client, UCD9000_GPIO_CONFIG);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to read gpi%02d config\n", reg);
+	}
+
+	return sprintf(buf, "%1d\n", ret & BIT(nr) ? 1 : 0);
+}
+
+static ssize_t ucd9000_status_vout(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct i2c_client *client = to_i2c_client(dev);
+	int nr = (sensor_attr->index & 0xf00) >> 8;
+	int page = sensor_attr->index & 0xff, ret;
+
+	ret = pmbus_set_page(client, page);
+	if (ret < 0) {
+		dev_err(&client->dev, "i2c_smbus_write failed. page:%d rc:%d\n",
+			page, ret);
+		return ret;
+	}
+
+	ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_VOUT);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to read status_vout(%d) rc:%d\n", page, ret);
+	}
+
+	return sprintf(buf, "%1d", ret & BIT(nr) ? 1 : 0);
+}
+
+static ssize_t ucd9000_status_word(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
+	struct i2c_client *client = to_i2c_client(dev);
+	int nr = sensor_attr->index, ret;
+
+	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"Failed to read number of active pages\n");
+		return ret;
+	}
+
+	return sprintf(buf, "%1d", ret & BIT(nr) ? 1 : 0);
+}
+
+static DEVICE_ATTR(clear_faults, 0200, NULL, ucd9000_clear_faults);
+static DEVICE_ATTR(clear_logged_faults, 0200,
+			  NULL, ucd9000_clear_logged_faults);
+
+/* MFR status */
+static SENSOR_DEVICE_ATTR(gpi8_fault, 0444, ucd9000_mfr_status, NULL, 23);
+static SENSOR_DEVICE_ATTR(gpi7_fault, 0444, ucd9000_mfr_status, NULL, 22);
+static SENSOR_DEVICE_ATTR(gpi6_fault, 0444, ucd9000_mfr_status, NULL, 21);
+static SENSOR_DEVICE_ATTR(gpi5_fault, 0444, ucd9000_mfr_status, NULL, 20);
+static SENSOR_DEVICE_ATTR(gpi4_fault, 0444, ucd9000_mfr_status, NULL, 19);
+static SENSOR_DEVICE_ATTR(gpi3_fault, 0444, ucd9000_mfr_status, NULL, 18);
+static SENSOR_DEVICE_ATTR(gpi2_fault, 0444, ucd9000_mfr_status, NULL, 17);
+static SENSOR_DEVICE_ATTR(gpi1_fault, 0444, ucd9000_mfr_status, NULL, 16);
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
+/* Status VOUT : Should be moved to PMBUS core */
+static SENSOR_DEVICE_ATTR(ton1_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x0201);
+static SENSOR_DEVICE_ATTR(toff1_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x0101);
+static SENSOR_DEVICE_ATTR(ton2_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x0202);
+static SENSOR_DEVICE_ATTR(toff2_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x0102);
+static SENSOR_DEVICE_ATTR(ton3_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x0203);
+static SENSOR_DEVICE_ATTR(toff3_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x0103);
+static SENSOR_DEVICE_ATTR(ton4_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x0204);
+static SENSOR_DEVICE_ATTR(toff4_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x0104);
+static SENSOR_DEVICE_ATTR(ton5_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x0205);
+static SENSOR_DEVICE_ATTR(toff5_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x0105);
+static SENSOR_DEVICE_ATTR(ton6_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x0206);
+static SENSOR_DEVICE_ATTR(toff6_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x0106);
+static SENSOR_DEVICE_ATTR(ton7_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x0207);
+static SENSOR_DEVICE_ATTR(toff7_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x0107);
+static SENSOR_DEVICE_ATTR(ton8_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x0208);
+static SENSOR_DEVICE_ATTR(toff8_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x0108);
+static SENSOR_DEVICE_ATTR(ton9_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x0209);
+static SENSOR_DEVICE_ATTR(toff9_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x0109);
+static SENSOR_DEVICE_ATTR(ton10_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x020a);
+static SENSOR_DEVICE_ATTR(toff10_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x010a);
+static SENSOR_DEVICE_ATTR(ton11_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x020b);
+static SENSOR_DEVICE_ATTR(toff11_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x010b);
+static SENSOR_DEVICE_ATTR(ton12_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x020c);
+static SENSOR_DEVICE_ATTR(toff12_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x010c);
+static SENSOR_DEVICE_ATTR(ton13_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x020d);
+static SENSOR_DEVICE_ATTR(toff13_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x010d);
+static SENSOR_DEVICE_ATTR(ton14_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x020e);
+static SENSOR_DEVICE_ATTR(toff14_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x010e);
+static SENSOR_DEVICE_ATTR(ton15_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x020f);
+static SENSOR_DEVICE_ATTR(toff15_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x010f);
+static SENSOR_DEVICE_ATTR(ton16_max_fault, 0444, ucd9000_status_vout,
+			NULL, 0x0210);
+static SENSOR_DEVICE_ATTR(toff16_max_warning, 0444, ucd9000_status_vout,
+			NULL, 0x0110);
+
+/*
+ * Status Word
+ * Why is this not in the core?  In process of being added to pmbus core
+ * but for the mean time its local for testing purposes
+ */
+static SENSOR_DEVICE_ATTR(misc_alarm, 0444, ucd9000_status_word, NULL, 0);
+static SENSOR_DEVICE_ATTR(cml_alarm, 0444, ucd9000_status_word, NULL, 1);
+static SENSOR_DEVICE_ATTR(vout_crit_alarm, 0444, ucd9000_status_word, NULL, 5);
+static SENSOR_DEVICE_ATTR(off_alarm, 0444, ucd9000_status_word, NULL, 6);
+static SENSOR_DEVICE_ATTR(fans_alarm, 0444, ucd9000_status_word, NULL, 10);
+static SENSOR_DEVICE_ATTR(pgood_alarm, 0444, ucd9000_status_word, NULL, 11);
+static SENSOR_DEVICE_ATTR(mfr_alarm, 0444, ucd9000_status_word, NULL, 12);
+static SENSOR_DEVICE_ATTR(vout_alarm, 0444, ucd9000_status_word, NULL, 15);
+
+static struct attribute *ucd9000_attributes[] = {
+	&dev_attr_clear_faults.attr,
+	&dev_attr_clear_logged_faults.attr,
+	&sensor_dev_attr_misc_alarm.dev_attr.attr,
+	&sensor_dev_attr_cml_alarm.dev_attr.attr,
+	&sensor_dev_attr_vout_crit_alarm.dev_attr.attr,
+	&sensor_dev_attr_off_alarm.dev_attr.attr,
+	&sensor_dev_attr_fans_alarm.dev_attr.attr,
+	&sensor_dev_attr_pgood_alarm.dev_attr.attr,
+	&sensor_dev_attr_mfr_alarm.dev_attr.attr,
+	&sensor_dev_attr_vout_alarm.dev_attr.attr,
+	&sensor_dev_attr_gpi8_fault.dev_attr.attr,
+	&sensor_dev_attr_gpi7_fault.dev_attr.attr,
+	&sensor_dev_attr_gpi6_fault.dev_attr.attr,
+	&sensor_dev_attr_gpi5_fault.dev_attr.attr,
+	&sensor_dev_attr_gpi4_fault.dev_attr.attr,
+	&sensor_dev_attr_gpi3_fault.dev_attr.attr,
+	&sensor_dev_attr_gpi2_fault.dev_attr.attr,
+	&sensor_dev_attr_gpi1_fault.dev_attr.attr,
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
+	&sensor_dev_attr_toff1_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff2_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff3_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff4_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff5_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff6_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff7_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff8_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff9_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff10_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff11_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff12_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff13_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff14_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff15_max_warning.dev_attr.attr,
+	&sensor_dev_attr_toff16_max_warning.dev_attr.attr,
+	&sensor_dev_attr_ton1_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton2_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton3_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton4_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton5_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton6_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton7_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton8_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton9_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton10_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton11_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton12_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton13_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton14_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton15_max_fault.dev_attr.attr,
+	&sensor_dev_attr_ton16_max_fault.dev_attr.attr,
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
@@ -227,16 +605,26 @@ static int ucd9000_probe(struct i2c_client *client,
 		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
 	}
 
+	ret = sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
+	if (ret < 0)
+		return ret;
+
 	return pmbus_do_probe(client, mid, info);
 }
 
+static int ucd9000_remove(struct i2c_client *client)
+{
+	sysfs_remove_group(&client->dev.kobj, &ucd9000_attr_group);
+	return pmbus_do_remove(client);
+}
+
 /* This is the driver that will be inserted */
 static struct i2c_driver ucd9000_driver = {
 	.driver = {
 		.name = "ucd9000",
 	},
 	.probe = ucd9000_probe,
-	.remove = pmbus_do_remove,
+	.remove = ucd9000_remove,
 	.id_table = ucd9000_id,
 };
 
-- 
1.8.2.2
