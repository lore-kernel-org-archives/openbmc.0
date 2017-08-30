Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjK1J2n15zDqNY
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 07:50:12 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7ULo4DH127551
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 17:50:09 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cny3cey0t-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 17:50:09 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 30 Aug 2017 17:50:08 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 30 Aug 2017 17:50:06 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7ULo5pX25231466; Wed, 30 Aug 2017 21:50:05 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2C68AE052;
 Wed, 30 Aug 2017 17:50:29 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.1.36])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id AE359AE03C;
 Wed, 30 Aug 2017 17:50:27 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 v6 1/3] hwmon: (ucd9000) Add interface to clear
 logged faults.
Date: Wed, 30 Aug 2017 16:49:51 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170830214953.73327-1-cbostic@linux.vnet.ibm.com>
References: <20170830214953.73327-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17083021-0052-0000-0000-000002583F19
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007638; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00909906; UDB=6.00456395; IPR=6.00690190; 
 BA=6.00005562; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016932; XFM=3.00000015;
 UTC=2017-08-30 21:50:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17083021-0053-0000-0000-000051D70B4F
Message-Id: <20170830214953.73327-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708300333
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
X-List-Received-Date: Wed, 30 Aug 2017 21:50:12 -0000

Provide a means for user space to clear out any logged faults
on these types of devices.  Ability to do so allows user to
start with a clean slate at system poweron which can be done
multiple times after this driver loads.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 49 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 3e3aa95..c401e5b 100644
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
@@ -34,6 +36,7 @@
 #define UCD9000_NUM_PAGES		0xd6
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
+#define UCD9000_LOGGED_FAULTS		0xea
 #define UCD9000_DEVICE_ID		0xfd
 
 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
@@ -119,6 +122,37 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
 };
 MODULE_DEVICE_TABLE(i2c, ucd9000_id);
 
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
@@ -227,16 +261,29 @@ static int ucd9000_probe(struct i2c_client *client,
 		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
 	}
 
+	ret = sysfs_create_group(&client->dev.kobj, &ucd9000_attr_group);
+	if (ret < 0) {
+		dev_warn(&client->dev, "Failed to add sysfs files: %d\n", ret);
+
+		return ret;
+	}
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
