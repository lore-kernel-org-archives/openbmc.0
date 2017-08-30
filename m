Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjF8P5LXwzDqNc
 for <openbmc@lists.ozlabs.org>; Thu, 31 Aug 2017 04:56:05 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7UIsY8H070023
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 14:56:03 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cp0gjgfmp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2017 14:56:03 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 30 Aug 2017 14:56:03 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 30 Aug 2017 14:55:59 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7UItw4Q2883854; Wed, 30 Aug 2017 18:55:58 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03B23AE03B;
 Wed, 30 Aug 2017 14:56:23 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.1.36])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id A453DAE04B;
 Wed, 30 Aug 2017 14:56:18 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] hwmon: (ucd9000) Add sysfs attribute to clear logged
 faults
Date: Wed, 30 Aug 2017 13:55:36 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
References: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17083018-0056-0000-0000-000003BECF98
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007637; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00909848; UDB=6.00456361; IPR=6.00690132; 
 BA=6.00005562; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016931; XFM=3.00000015;
 UTC=2017-08-30 18:56:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17083018-0057-0000-0000-000007F500A1
Message-Id: <20170830185536.71307-3-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708300288
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
X-List-Received-Date: Wed, 30 Aug 2017 18:56:06 -0000

Add ability to clear logged faults via sysfs.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 45 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index b74dbec..8bd8cb1 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -27,6 +27,8 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/pmbus.h>
+#include <linux/sysfs.h>
+#include <linux/hwmon-sysfs.h>
 #include "pmbus.h"
 
 enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
@@ -35,6 +37,7 @@
 #define UCD9000_NUM_PAGES		0xd6
 #define UCD9000_FAN_CONFIG_INDEX	0xe7
 #define UCD9000_FAN_CONFIG		0xe8
+#define UCD9000_LOGGED_FAULTS		0xea
 #define UCD9000_DEVICE_ID		0xfd
 
 #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
@@ -109,6 +112,36 @@ static int ucd9000_read_byte_data(struct i2c_client *client, int page, int reg)
 	return ret;
 }
 
+static ssize_t ucd9000_clear_logged_faults(struct device *dev,
+			struct device_attribute *attr, const char *buf,
+			size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+
+	/* No page set required */
+	ret = i2c_smbus_write_byte_data(client, UCD9000_LOGGED_FAULTS, 0);
+	if (ret) {
+		dev_err(&client->dev, "Failed to clear logged faults: %d\n",
+			ret);
+		return ret;
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR(clear_logged_faults, 0200, NULL,
+			ucd9000_clear_logged_faults);
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
 static const struct i2c_device_id ucd9000_id[] = {
 	{"ucd9000", ucd9000},
 	{"ucd90120", ucd90120},
@@ -263,9 +296,19 @@ static int ucd9000_probe(struct i2c_client *client,
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
@@ -273,7 +316,7 @@ static int ucd9000_probe(struct i2c_client *client,
 		.of_match_table = of_match_ptr(ucd9000_of_match),
 	},
 	.probe = ucd9000_probe,
-	.remove = pmbus_do_remove,
+	.remove = ucd9000_remove,
 	.id_table = ucd9000_id,
 };
 
-- 
1.8.2.2
