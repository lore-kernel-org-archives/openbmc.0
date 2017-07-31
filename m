Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLrGl5f0szDrKx
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 06:12:47 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6VK9ApB008019
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:12:45 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c26dsxsn1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 16:12:45 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 14:12:44 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 14:12:42 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6VKCf502097574; Mon, 31 Jul 2017 13:12:41 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D255B13603A;
 Mon, 31 Jul 2017 14:12:41 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.80.232.39])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 1268113604D;
 Mon, 31 Jul 2017 14:12:40 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, mspinler@linux.vnet.ibm.com, bjwyman@gmail.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 2/5] drivers/hwmon/pmbus: p17531: Add
 non-hwmon attributes
Date: Mon, 31 Jul 2017 15:12:29 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501531952-490-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501531952-490-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17073120-0004-0000-0000-000012AE27D7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007460; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895667; UDB=6.00447984; IPR=6.00675855; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016469; XFM=3.00000015;
 UTC=2017-07-31 20:12:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17073120-0005-0000-0000-0000807D02E0
Message-Id: <1501531952-490-3-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 31 Jul 2017 20:12:48 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add sysfs entries to dump out PS registers and clear faults.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/pmbus/p17531.c | 80 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/hwmon/pmbus/p17531.c b/drivers/hwmon/pmbus/p17531.c
index 2190f8c..4b2d7e1 100644
--- a/drivers/hwmon/pmbus/p17531.c
+++ b/drivers/hwmon/pmbus/p17531.c
@@ -9,8 +9,10 @@
 
 #include <linux/device.h>
 #include <linux/i2c.h>
+#include <linux/hwmon-sysfs.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
+#include <linux/sysfs.h>
 
 #include "pmbus.h"
 
@@ -123,14 +125,92 @@ static int p17531_read_word_data(struct i2c_client *client, int page, int reg)
 	.read_word_data = p17531_read_word_data,
 };
 
+static ssize_t p17531_clear_faults(struct device *dev,
+				   struct device_attribute *dev_attr,
+				   const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	pmbus_clear_faults(client);
+
+	return count;
+}
+static DEVICE_ATTR(clear_faults, 0200, NULL, p17531_clear_faults);
+
+static ssize_t p17531_show_status_word(struct device *dev,
+				       struct device_attribute *dev_attr,
+				       char *buf)
+{
+	int rc;
+	struct i2c_client *client = to_i2c_client(dev);
+
+	rc = pmbus_read_word_data(client, 0, PMBUS_STATUS_WORD);
+	if (rc < 0)
+		return rc;
+
+	return snprintf(buf, PAGE_SIZE - 1, "%04x\n", rc);
+}
+static DEVICE_ATTR(status_word, 0444, p17531_show_status_word, NULL);
+
+static ssize_t p17531_show_status_byte(struct device *dev,
+				       struct device_attribute *dev_attr,
+				       char *buf)
+{
+	int rc;
+	struct i2c_client *client = to_i2c_client(dev);
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(dev_attr);
+
+	rc = pmbus_read_byte_data(client, 0, PMBUS_STATUS_VOUT + sattr->index);
+	if (rc < 0)
+		return rc;
+
+	return snprintf(buf, PAGE_SIZE - 1, "%02x\n", rc);
+}
+
+static SENSOR_DEVICE_ATTR(status_vout, 0444, p17531_show_status_byte, NULL, 0);
+static SENSOR_DEVICE_ATTR(status_iout, 0444, p17531_show_status_byte, NULL, 1);
+static SENSOR_DEVICE_ATTR(status_input, 0444, p17531_show_status_byte, NULL,
+			  2);
+static SENSOR_DEVICE_ATTR(status_temp, 0444, p17531_show_status_byte, NULL, 3);
+static SENSOR_DEVICE_ATTR(status_cml, 0444, p17531_show_status_byte, NULL, 4);
+static SENSOR_DEVICE_ATTR(status_other, 0444, p17531_show_status_byte, NULL,
+			  5);
+static SENSOR_DEVICE_ATTR(status_mfr, 0444, p17531_show_status_byte, NULL, 6);
+static SENSOR_DEVICE_ATTR(status_fan, 0444, p17531_show_status_byte, NULL, 7);
+
+static struct attribute *p17531_attributes[] = {
+	&dev_attr_clear_faults.attr,
+	&dev_attr_status_word.attr,
+	&sensor_dev_attr_status_vout.dev_attr.attr,
+	&sensor_dev_attr_status_iout.dev_attr.attr,
+	&sensor_dev_attr_status_input.dev_attr.attr,
+	&sensor_dev_attr_status_temp.dev_attr.attr,
+	&sensor_dev_attr_status_cml.dev_attr.attr,
+	&sensor_dev_attr_status_other.dev_attr.attr,
+	&sensor_dev_attr_status_mfr.dev_attr.attr,
+	&sensor_dev_attr_status_fan.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group p17531_attribute_group = {
+	.attrs = p17531_attributes,
+};
+
 static int p17531_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
+	int rc = sysfs_create_group(&client->dev.kobj,
+				    &p17531_attribute_group);
+	if (rc)
+		return rc;
+
 	return pmbus_do_probe(client, id, &p17531_info);
 }
 
 static int p17531_remove(struct i2c_client *client)
 {
+	sysfs_remove_group(&client->dev.kobj, &p17531_attribute_group);
+
 	return pmbus_do_remove(client);
 }
 
-- 
1.8.3.1
