Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLycl6RBHzDsS7
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:58:47 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710wdDm046988
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:46 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c2bquggqf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:45 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:58:45 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:58:43 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710wgcA21102822; Tue, 1 Aug 2017 00:58:42 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDA8AAC040;
 Mon, 31 Jul 2017 20:58:56 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 5CED7AC041;
 Mon, 31 Jul 2017 20:58:56 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 06/10] drivers/hwmon/occ: Add non-hwmon
 attributes
Date: Mon, 31 Jul 2017 19:58:23 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080100-0040-0000-0000-00000388A1D9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895763; UDB=6.00448041; IPR=6.00675950; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:58:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-0041-0000-0000-0000077CCB10
Message-Id: <1501549107-22323-7-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708010012
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
X-List-Received-Date: Tue, 01 Aug 2017 00:58:49 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Create device attributes for additional OCC properties that do not
belong as hwmon sensors. These provide additional information as to the
state of the processor and system.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/occ/common.h |  1 +
 drivers/hwmon/occ/p8_i2c.c | 10 ++++++
 drivers/hwmon/occ/p9_sbe.c | 10 ++++++
 4 files changed, 104 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index bad7f4b..2459e12 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -19,6 +19,14 @@
 
 #define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 
+/* OCC status bits */
+#define OCC_STAT_MASTER			0x80
+#define OCC_STAT_ACTIVE			0x01
+#define OCC_EXT_STAT_DVFS_OT		0x80
+#define OCC_EXT_STAT_DVFS_POWER		0x40
+#define OCC_EXT_STAT_MEM_THROTTLE	0x20
+#define OCC_EXT_STAT_QUICK_DROP		0x10
+
 /* OCC sensor type and version definitions */
 
 struct temp_sensor_1 {
@@ -1044,6 +1052,71 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 	return 0;
 }
 
+static ssize_t occ_show_status(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int rc;
+	int val = 0;
+	struct occ *occ = dev_get_drvdata(dev);
+	struct occ_poll_response_header *header;
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+
+	rc = occ_update_response(occ);
+	if (rc)
+		return rc;
+
+	header = (struct occ_poll_response_header *)occ->resp.data;
+
+	switch (sattr->index) {
+	case 0:
+		val = (header->status & OCC_STAT_MASTER) ? 1 : 0;
+		break;
+	case 1:
+		val = (header->status & OCC_STAT_ACTIVE) ? 1 : 0;
+		break;
+	case 2:
+		val = (header->ext_status & OCC_EXT_STAT_DVFS_OT) ? 1 : 0;
+		break;
+	case 3:
+		val = (header->ext_status & OCC_EXT_STAT_DVFS_POWER) ? 1 : 0;
+		break;
+	case 4:
+		val = (header->ext_status & OCC_EXT_STAT_MEM_THROTTLE) ? 1 : 0;
+		break;
+	case 5:
+		val = (header->ext_status & OCC_EXT_STAT_QUICK_DROP) ? 1 : 0;
+		break;
+	case 6:
+		val = header->occ_state;
+		break;
+	}
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", val);
+}
+
+static SENSOR_DEVICE_ATTR(occ_master, 0444, occ_show_status, NULL, 0);
+static SENSOR_DEVICE_ATTR(occ_active, 0444, occ_show_status, NULL, 1);
+static SENSOR_DEVICE_ATTR(occ_dvfs_ot, 0444, occ_show_status, NULL, 2);
+static SENSOR_DEVICE_ATTR(occ_dvfs_power, 0444, occ_show_status, NULL, 3);
+static SENSOR_DEVICE_ATTR(occ_mem_throttle, 0444, occ_show_status, NULL, 4);
+static SENSOR_DEVICE_ATTR(occ_quick_drop, 0444, occ_show_status, NULL, 5);
+static SENSOR_DEVICE_ATTR(occ_status, 0444, occ_show_status, NULL, 6);
+
+static struct attribute *occ_attributes[] = {
+	&sensor_dev_attr_occ_master.dev_attr.attr,
+	&sensor_dev_attr_occ_active.dev_attr.attr,
+	&sensor_dev_attr_occ_dvfs_ot.dev_attr.attr,
+	&sensor_dev_attr_occ_dvfs_power.dev_attr.attr,
+	&sensor_dev_attr_occ_mem_throttle.dev_attr.attr,
+	&sensor_dev_attr_occ_quick_drop.dev_attr.attr,
+	&sensor_dev_attr_occ_status.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group occ_attr_group = {
+	.attrs = occ_attributes,
+};
+
 /* only need to do this once at startup, as OCC won't change sensors on us */
 static void occ_parse_poll_response(struct occ *occ)
 {
@@ -1124,5 +1197,15 @@ int occ_setup(struct occ *occ, const char *name)
 		return rc;
 	}
 
+	rc = sysfs_create_group(&occ->bus_dev->kobj, &occ_attr_group);
+	if (rc)
+		dev_warn(occ->bus_dev, "failed to create status attrs: %d\n",
+			 rc);
+
 	return 0;
 }
+
+void occ_shutdown(struct occ *occ)
+{
+	sysfs_remove_group(&occ->bus_dev->kobj, &occ_attr_group);
+}
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 049c3b4..dc9e06d 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -110,5 +110,6 @@ struct occ {
 };
 
 int occ_setup(struct occ *occ, const char *name);
+void occ_shutdown(struct occ *occ);
 
 #endif /* OCC_COMMON_H */
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 745fb52..ee9cef7 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -229,6 +229,15 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 	return occ_setup(occ, "p8_occ");
 }
 
+static int p8_i2c_occ_remove(struct i2c_client *client)
+{
+	struct occ *occ = dev_get_drvdata(&client->dev);
+
+	occ_shutdown(occ);
+
+	return 0;
+}
+
 static const struct of_device_id p8_i2c_occ_of_match[] = {
 	{ .compatible = "ibm,p8-occ-hwmon" },
 	{}
@@ -242,6 +251,7 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 		.of_match_table = p8_i2c_occ_of_match,
 	},
 	.probe = p8_i2c_occ_probe,
+	.remove = p8_i2c_occ_remove,
 };
 
 module_i2c_driver(p8_i2c_occ_driver);
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 667d190..d36ce0b 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -94,6 +94,15 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	return occ_setup(occ, "p9_occ");
 }
 
+static int p9_sbe_occ_remove(struct platform_device *pdev)
+{
+	struct occ *occ = platform_get_drvdata(pdev);
+
+	occ_shutdown(occ);
+
+	return 0;
+}
+
 static const struct of_device_id p9_sbe_occ_of_match[] = {
 	{ .compatible = "ibm,p9-occ-hwmon" },
 	{ },
@@ -105,6 +114,7 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 		.of_match_table	= p9_sbe_occ_of_match,
 	},
 	.probe	= p9_sbe_occ_probe,
+	.remove = p9_sbe_occ_remove,
 };
 
 module_platform_driver(p9_sbe_occ_driver);
-- 
1.8.3.1
