Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnyp04ZDKzDqL3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 06:26:16 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5EKNkow106850
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 16:26:14 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b33gfc6hp-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 16:26:14 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 14 Jun 2017 16:26:12 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 14 Jun 2017 16:26:10 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5EKQ9Nm1835286; Wed, 14 Jun 2017 20:26:09 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D14922803E;
 Wed, 14 Jun 2017 16:26:03 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 88D8D28046;
 Wed, 14 Jun 2017 16:26:03 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers: hwmon: occ: Add "master" attribute
 and remove status files
Date: Wed, 14 Jun 2017 15:26:06 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17061420-0024-0000-0000-0000029317C2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007232; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00874801; UDB=6.00435490; IPR=6.00654892; 
 BA=6.00005421; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015827; XFM=3.00000015;
 UTC=2017-06-14 20:26:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061420-0025-0000-0000-00004463141C
Message-Id: <1497471966-6420-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-14_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706140340
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
X-List-Received-Date: Wed, 14 Jun 2017 20:26:17 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Driver did not remove status device attributes when the device was
unloaded.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 39 ++++++++++++++++++++++++++++-----------
 drivers/hwmon/occ/common.h |  1 +
 drivers/hwmon/occ/p8_i2c.c | 10 ++++++++++
 drivers/hwmon/occ/p9_sbe.c | 10 ++++++++++
 4 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index bee64cd..f34b400 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -10,8 +10,9 @@
 #include <asm/unaligned.h>
 #include "common.h"
 
-#define OCC_NUM_STATUS_ATTRS		6
+#define OCC_NUM_STATUS_ATTRS		7
 
+#define OCC_STAT_MASTER			0x80
 #define OCC_STAT_ACTIVE			0x01
 #define OCC_EXT_STAT_DVFS_OT		0x80
 #define OCC_EXT_STAT_DVFS_POWER		0x40
@@ -236,21 +237,24 @@ static ssize_t occ_show_status(struct device *dev,
 
 	switch (sattr->index) {
 	case 0:
-		val = header->status & OCC_STAT_ACTIVE;
+		val = header->status & OCC_STAT_MASTER;
 		break;
 	case 1:
-		val = header->ext_status & OCC_EXT_STAT_DVFS_OT;
+		val = header->status & OCC_STAT_ACTIVE;
 		break;
 	case 2:
-		val = header->ext_status & OCC_EXT_STAT_DVFS_POWER;
+		val = header->ext_status & OCC_EXT_STAT_DVFS_OT;
 		break;
 	case 3:
-		val = header->ext_status & OCC_EXT_STAT_MEM_THROTTLE;
+		val = header->ext_status & OCC_EXT_STAT_DVFS_POWER;
 		break;
 	case 4:
-		val = header->ext_status & OCC_EXT_STAT_QUICK_DROP;
+		val = header->ext_status & OCC_EXT_STAT_MEM_THROTTLE;
 		break;
 	case 5:
+		val = header->ext_status & OCC_EXT_STAT_QUICK_DROP;
+		break;
+	case 6:
 		val = header->occ_state;
 		break;
 	}
@@ -1061,29 +1065,33 @@ int occ_create_status_attrs(struct occ *occ)
 		return -ENOMEM;
 
 	occ->status_attrs[0] =
-		(struct sensor_device_attribute)SENSOR_ATTR(occ_active, 0444,
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_master, 0444,
 							    occ_show_status,
 							    NULL, 0);
 	occ->status_attrs[1] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_active, 0444,
+							    occ_show_status,
+							    NULL, 0);
+	occ->status_attrs[2] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_dvfs_ot, 0444,
 							    occ_show_status,
 							    NULL, 1);
-	occ->status_attrs[2] =
+	occ->status_attrs[3] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_dvfs_power,
 							    0444,
 							    occ_show_status,
 							    NULL, 2);
-	occ->status_attrs[3] =
+	occ->status_attrs[4] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_mem_throttle,
 							    0444,
 							    occ_show_status,
 							    NULL, 3);
-	occ->status_attrs[4] =
+	occ->status_attrs[5] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_quick_drop,
 							    0444,
 							    occ_show_status,
 							    NULL, 4);
-	occ->status_attrs[5] =
+	occ->status_attrs[6] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_status, 0444,
 							    occ_show_status,
 							    NULL, 5);
@@ -1097,3 +1105,12 @@ int occ_create_status_attrs(struct occ *occ)
 
 	return 0;
 }
+
+void occ_remove_status_attrs(struct occ *occ)
+{
+	int i;
+
+	for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i)
+		device_remove_file(occ->bus_dev,
+				   &occ->status_attrs[i].dev_attr);
+}
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index ad21538..a6582a7 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -137,5 +137,6 @@ struct occ {
 int occ_update_response(struct occ *occ);
 int occ_setup_sensor_attrs(struct occ *occ);
 int occ_create_status_attrs(struct occ *occ);
+void occ_remove_status_attrs(struct occ *occ);
 
 #endif /* __OCC_COMMON_H__ */
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index a2f10ea..a4d9965 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -245,6 +245,15 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 	return 0;
 }
 
+static int p8_i2c_occ_remove(struct i2c_client *client)
+{
+	struct occ *occ = dev_get_drvdata(&client->dev);
+
+	occ_remove_status_attrs(occ);
+
+	return 0;
+}
+
 static const struct of_device_id p8_i2c_occ_of_match[] = {
 	{ .compatible = "ibm,p8-occ-hwmon" },
 	{}
@@ -260,6 +269,7 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 		.of_match_table = p8_i2c_occ_of_match,
 	},
 	.probe = p8_i2c_occ_probe,
+	.remove = p8_i2c_occ_remove,
 	.address_list = p8_i2c_occ_addr,
 };
 
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index c70858d..6226f6f 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -151,6 +151,15 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	return p9_sbe_occ_setup(p9_sbe_occ);
 }
 
+static int p9_sbe_occ_remove(struct platform_device *pdev)
+{
+	struct occ *occ = platform_get_drvdata(pdev);
+
+	occ_remove_status_attrs(occ);
+
+	return 0;
+}
+
 static const struct of_device_id p9_sbe_occ_of_match[] = {
 	{ .compatible = "ibm,p9-occ-hwmon" },
 	{ },
@@ -162,6 +171,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 		.of_match_table	= p9_sbe_occ_of_match,
 	},
 	.probe	= p9_sbe_occ_probe,
+	.remove = p9_sbe_occ_remove,
 };
 
 module_platform_driver(p9_sbe_occ_driver);
-- 
1.8.3.1
