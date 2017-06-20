Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsgtP59bpzDqhp
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 07:27:57 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5KLNpvE045226
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 17:27:54 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2b6qepcc6t-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 17:27:54 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 20 Jun 2017 17:27:53 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 20 Jun 2017 17:27:52 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5KLRpkB41877750; Tue, 20 Jun 2017 21:27:51 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A8BD124035;
 Tue, 20 Jun 2017 17:25:23 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id B76A7124037;
 Tue, 20 Jun 2017 17:25:22 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2] drivers/hwmon/occ: Add error handling
Date: Tue, 20 Jun 2017 16:27:49 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17062021-2213-0000-0000-000001E2F365
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007263; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877613; UDB=6.00437203; IPR=6.00657751; 
 BA=6.00005432; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015903; XFM=3.00000015;
 UTC=2017-06-20 21:27:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062021-2214-0000-0000-000056949C6C
Message-Id: <1497994069-18223-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-20_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706200369
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
X-List-Received-Date: Tue, 20 Jun 2017 21:27:58 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Create occ_error sysfs attribute to describe occ error state. Add
logic to poll to check for error conditions. Fix set user powercap
endianness.

Resolves: https://github.com/openbmc/openbmc/issues/1802

Changes since v1:
 - Forgot to decrement OCC counter in remove functions.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 85 ++++++++++++++++++++++++++++++++++++++--------
 drivers/hwmon/occ/common.h | 11 ++++++
 drivers/hwmon/occ/p8_i2c.c | 16 +++++++--
 drivers/hwmon/occ/p9_sbe.c | 18 +++++++++-
 4 files changed, 112 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index d3eb6f8..4e3e411 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -10,7 +10,7 @@
 #include <asm/unaligned.h>
 #include "common.h"
 
-#define OCC_NUM_STATUS_ATTRS		7
+#define OCC_NUM_STATUS_ATTRS		8
 
 #define OCC_STAT_MASTER			0x80
 #define OCC_STAT_ACTIVE			0x01
@@ -19,6 +19,8 @@
 #define OCC_EXT_STAT_MEM_THROTTLE	0x20
 #define OCC_EXT_STAT_QUICK_DROP		0x10
 
+atomic_t occ_num_occs = ATOMIC_INIT(0);
+
 struct temp_sensor_1 {
 	u16 sensor_id;
 	u16 value;
@@ -163,6 +165,8 @@ void occ_parse_poll_response(struct occ *occ)
 
 int occ_poll(struct occ *occ)
 {
+	int rc;
+	struct occ_poll_response_header *header;
 	u16 checksum = occ->poll_cmd_data + 1;
 	u8 cmd[8];
 
@@ -175,7 +179,32 @@ int occ_poll(struct occ *occ)
 	cmd[6] = checksum & 0xFF;
 	cmd[7] = 0;
 
-	return occ->send_cmd(occ, cmd);
+	rc = occ->send_cmd(occ, cmd);
+	if (rc)
+		return rc;
+
+	header = (struct occ_poll_response_header *)occ->resp.data;
+
+	if (header->occ_state == OCC_STATE_SAFE) {
+		if (occ->last_safe) {
+			if (time_after(jiffies,
+				       occ->last_safe + OCC_SAFE_TIMEOUT))
+				occ->error = -EHOSTDOWN;
+		} else
+			occ->last_safe = jiffies;
+	} else
+		occ->last_safe = 0;
+
+	if (header->status & OCC_STAT_MASTER) {
+		if (hweight8(header->occs_present) !=
+		    atomic_read(&occ_num_occs)) {
+			occ->error = -EXDEV;
+			occ->bad_present_count++;
+		} else
+			occ->bad_present_count = 0;
+	}
+
+	return rc;
 }
 
 int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
@@ -184,6 +213,14 @@ int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 	u8 cmd[8];
 	u16 checksum = 0x24;
 	__be16 user_power_cap_be;
+	struct occ_poll_response_header *header =
+		(struct occ_poll_response_header *)occ->resp.data;
+
+	if (!(header->status & OCC_STAT_MASTER))
+		return -EPERM;
+
+	if (!(header->status & OCC_STAT_ACTIVE))
+		return -EACCES;
 
 	user_power_cap_be = cpu_to_be16(user_power_cap);
 
@@ -192,7 +229,7 @@ int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 	cmd[2] = 0;
 	cmd[3] = 2;
 
-	memcpy(&cmd[4], &user_power_cap, 2);
+	memcpy(&cmd[4], &user_power_cap_be, 2);
 
 	checksum += cmd[4] + cmd[5];
 	cmd[6] = checksum >> 8;
@@ -220,6 +257,19 @@ int occ_update_response(struct occ *occ)
 	return rc;
 }
 
+static ssize_t occ_show_error(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	int error = 0;
+	struct occ *occ = dev_get_drvdata(dev);
+
+	if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD || occ->last_safe ||
+	    occ->bad_present_count > OCC_ERROR_COUNT_THRESHOLD)
+		error = occ->error;
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", error);
+}
+
 static ssize_t occ_show_status(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
@@ -237,22 +287,22 @@ static ssize_t occ_show_status(struct device *dev,
 
 	switch (sattr->index) {
 	case 0:
-		val = header->status & OCC_STAT_MASTER;
+		val = (header->status & OCC_STAT_MASTER) ? 1 : 0;
 		break;
 	case 1:
-		val = header->status & OCC_STAT_ACTIVE;
+		val = (header->status & OCC_STAT_ACTIVE) ? 1 : 0;
 		break;
 	case 2:
-		val = header->ext_status & OCC_EXT_STAT_DVFS_OT;
+		val = (header->ext_status & OCC_EXT_STAT_DVFS_OT) ? 1 : 0;
 		break;
 	case 3:
-		val = header->ext_status & OCC_EXT_STAT_DVFS_POWER;
+		val = (header->ext_status & OCC_EXT_STAT_DVFS_POWER) ? 1 : 0;
 		break;
 	case 4:
-		val = header->ext_status & OCC_EXT_STAT_MEM_THROTTLE;
+		val = (header->ext_status & OCC_EXT_STAT_MEM_THROTTLE) ? 1 : 0;
 		break;
 	case 5:
-		val = header->ext_status & OCC_EXT_STAT_QUICK_DROP;
+		val = (header->ext_status & OCC_EXT_STAT_QUICK_DROP) ? 1 : 0;
 		break;
 	case 6:
 		val = header->occ_state;
@@ -1073,30 +1123,35 @@ int occ_create_status_attrs(struct occ *occ)
 	occ->status_attrs[1] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_active, 0444,
 							    occ_show_status,
-							    NULL, 0);
+							    NULL, 1);
 	occ->status_attrs[2] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_dvfs_ot, 0444,
 							    occ_show_status,
-							    NULL, 1);
+							    NULL, 2);
 	occ->status_attrs[3] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_dvfs_power,
 							    0444,
 							    occ_show_status,
-							    NULL, 2);
+							    NULL, 3);
 	occ->status_attrs[4] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_mem_throttle,
 							    0444,
 							    occ_show_status,
-							    NULL, 3);
+							    NULL, 4);
 	occ->status_attrs[5] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_quick_drop,
 							    0444,
 							    occ_show_status,
-							    NULL, 4);
+							    NULL, 5);
 	occ->status_attrs[6] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_status, 0444,
 							    occ_show_status,
-							    NULL, 5);
+							    NULL, 6);
+
+	occ->status_attrs[7] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occ_error, 0444,
+							    occ_show_error,
+							    NULL, 0);
 
 	for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i) {
 		rc = device_create_file(dev, &occ->status_attrs[i].dev_attr);
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index a6582a7..a5f86c3 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -13,6 +13,8 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/sysfs.h>
 
+#define OCC_ERROR_COUNT_THRESHOLD	2
+
 #define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 #define OCC_RESP_DATA_BYTES		4089
 
@@ -28,6 +30,9 @@
 #define RESP_RETURN_OCC_ERR		0x15
 #define RESP_RETURN_STATE		0x16
 
+#define OCC_STATE_SAFE			0x4
+#define OCC_SAFE_TIMEOUT		msecs_to_jiffies(60000)
+
 struct occ_response {
 	u8 seq_no;
 	u8 cmd_type;
@@ -96,6 +101,10 @@ struct occ {
 	struct device *bus_dev;
 	struct device *hwmon;
 
+	int error;
+	unsigned int error_count;
+	unsigned int bad_present_count;
+	unsigned long last_safe;
 	unsigned long last_update;
 	struct mutex lock;
 
@@ -131,6 +140,8 @@ struct occ {
 	((struct sensor_device_attribute_2)				\
 		SENSOR_ATTR_OCC(_name, _mode, _show, _store, _nr, _index))
 
+extern atomic_t occ_num_occs;
+
 void occ_parse_poll_response(struct occ *occ);
 int occ_poll(struct occ *occ);
 int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap);
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index a4d9965..29233b4 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -122,12 +122,12 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 	if (rc)
 		goto err;
 
+retry:
 	/* set sram address for response */
 	rc = p8_i2c_occ_putscom_u32(client, 0x6B070, 0xFFFF7000, 0);
 	if (rc)
 		goto err;
 
-retry:
 	rc = p8_i2c_occ_getscom(client, 0x6B075, (u8 *)resp);
 	if (rc)
 		goto err;
@@ -161,7 +161,10 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 		rc = -EFAULT;
 	}
 
+	occ->error = resp->return_status;
+
 	if (rc < 0) {
+		occ->error_count++;
 		dev_warn(&client->dev, "occ bad response:%d\n",
 			 resp->return_status);
 		return rc;
@@ -169,9 +172,11 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 
 	data_length = get_unaligned_be16(&resp->data_length_be);
 	if (data_length > OCC_RESP_DATA_BYTES) {
+		occ->error_count++;
+		occ->error = -EDOM;
 		dev_warn(&client->dev, "occ bad data length:%d\n",
 			 data_length);
-		return -EDOM;
+		return occ->error;
 	}
 
 	for (i = 8; i < data_length + 7; i += 8) {
@@ -180,9 +185,12 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 			goto err;
 	}
 
+	occ->error_count = 0;
 	return data_length + 7;
 
 err:
+	occ->error_count++;
+	occ->error = rc;
 	dev_err(&client->dev, "i2c scom op failed rc:%d\n", rc);
 	return rc;
 }
@@ -242,6 +250,8 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 		return rc;
 	}
 
+	atomic_inc(&occ_num_occs);
+
 	return 0;
 }
 
@@ -251,6 +261,8 @@ static int p8_i2c_occ_remove(struct i2c_client *client)
 
 	occ_remove_status_attrs(occ);
 
+	atomic_dec(&occ_num_occs);
+
 	return 0;
 }
 
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 6226f6f..c85f133 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -36,6 +36,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 retry:
 	client = occ_drv_open(p9_sbe_occ->sbe, 0);
 	if (!client)
+		/* don't increment occ error counter */
 		return -ENODEV;
 
 	rc = occ_drv_write(client, (const char *)&cmd[1], 7);
@@ -76,15 +77,21 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 		rc = -EFAULT;
 	}
 
+	occ->error = resp->return_status;
+
 	if (rc < 0) {
+		occ->error_count++;
 		dev_warn(occ->bus_dev, "occ bad response:%d\n",
 			 resp->return_status);
 		return rc;
 	}
 
+	occ->error_count = 0;
 	return 0;
 
 err:
+	occ->error_count++;
+	occ->error = rc;
 	occ_drv_release(client);
 	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
 	return rc;
@@ -130,6 +137,7 @@ static int p9_sbe_occ_setup(struct p9_sbe_occ *p9_sbe_occ)
 
 static int p9_sbe_occ_probe(struct platform_device *pdev)
 {
+	int rc;
 	struct occ *occ;
 	struct p9_sbe_occ *p9_sbe_occ = devm_kzalloc(&pdev->dev,
 						     sizeof(*p9_sbe_occ),
@@ -148,7 +156,13 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, occ);
 
-	return p9_sbe_occ_setup(p9_sbe_occ);
+	rc = p9_sbe_occ_setup(p9_sbe_occ);
+	if (rc)
+		return rc;
+
+	atomic_inc(&occ_num_occs);
+
+	return rc;
 }
 
 static int p9_sbe_occ_remove(struct platform_device *pdev)
@@ -157,6 +171,8 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
 
 	occ_remove_status_attrs(occ);
 
+	atomic_dec(&occ_num_occs);
+
 	return 0;
 }
 
-- 
1.8.3.1
