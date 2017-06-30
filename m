Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wznr13sntzDr4m
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jul 2017 06:17:05 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5UKDtgb029508
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 16:17:02 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bdkq080t3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 16:17:01 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 30 Jun 2017 14:17:00 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 30 Jun 2017 14:16:59 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5UKGwcY65142806; Fri, 30 Jun 2017 13:16:58 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64ED313603C;
 Fri, 30 Jun 2017 14:16:58 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.187.182])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id B5CC4136046;
 Fri, 30 Jun 2017 14:16:57 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers/hwmon/occ: Add sysfs_notify on error
Date: Fri, 30 Jun 2017 15:16:55 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17063020-0004-0000-0000-0000127D4821
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007299; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00881009; UDB=6.00439253; IPR=6.00661163; 
 BA=6.00005448; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016026; XFM=3.00000015;
 UTC=2017-06-30 20:16:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17063020-0005-0000-0000-00008005855D
Message-Id: <1498853815-12959-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-30_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706300317
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
X-List-Received-Date: Fri, 30 Jun 2017 20:17:06 -0000

From: "Edward A. James" <eajames@us.ibm.com>

For userspace polling, we need to notify sysfs that the state of our
error entry has changed.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 40 ++++++++++++++++++++++++++++++----------
 drivers/hwmon/occ/common.h |  3 +++
 drivers/hwmon/occ/p8_i2c.c | 28 ++++++++++++++--------------
 drivers/hwmon/occ/p9_sbe.c | 34 ++++++++++++++++------------------
 4 files changed, 63 insertions(+), 42 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 4e3e411..f62cc6d 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -163,9 +163,22 @@ void occ_parse_poll_response(struct occ *occ)
 	}
 }
 
+void occ_set_error(struct occ *occ, int error)
+{
+	occ->error_count++;
+	if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD)
+		occ->error = error;
+}
+
+void occ_reset_error(struct occ *occ)
+{
+	occ->error_count = 0;
+	occ->error = 0;
+}
+
 int occ_poll(struct occ *occ)
 {
-	int rc;
+	int rc, error = occ->error;
 	struct occ_poll_response_header *header;
 	u16 checksum = occ->poll_cmd_data + 1;
 	u8 cmd[8];
@@ -181,7 +194,7 @@ int occ_poll(struct occ *occ)
 
 	rc = occ->send_cmd(occ, cmd);
 	if (rc)
-		return rc;
+		goto done;
 
 	header = (struct occ_poll_response_header *)occ->resp.data;
 
@@ -198,18 +211,25 @@ int occ_poll(struct occ *occ)
 	if (header->status & OCC_STAT_MASTER) {
 		if (hweight8(header->occs_present) !=
 		    atomic_read(&occ_num_occs)) {
-			occ->error = -EXDEV;
 			occ->bad_present_count++;
+
+			if (occ->bad_present_count > OCC_ERROR_COUNT_THRESHOLD)
+				occ->error = -EXDEV;
 		} else
 			occ->bad_present_count = 0;
 	}
 
+done:
+	/* notify userspace if we change error state */
+	if (occ->error != error)
+		sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
+
 	return rc;
 }
 
 int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 {
-	int rc;
+	int rc, error = occ->error;
 	u8 cmd[8];
 	u16 checksum = 0x24;
 	__be16 user_power_cap_be;
@@ -239,6 +259,10 @@ int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 	rc = occ->send_cmd(occ, cmd);
 	mutex_unlock(&occ->lock);
 
+	/* notify userspace if we change error state */
+	if (occ->error != error)
+		sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
+
 	return rc;
 }
 
@@ -260,14 +284,9 @@ int occ_update_response(struct occ *occ)
 static ssize_t occ_show_error(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
-	int error = 0;
 	struct occ *occ = dev_get_drvdata(dev);
 
-	if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD || occ->last_safe ||
-	    occ->bad_present_count > OCC_ERROR_COUNT_THRESHOLD)
-		error = occ->error;
-
-	return snprintf(buf, PAGE_SIZE - 1, "%d\n", error);
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
 }
 
 static ssize_t occ_show_status(struct device *dev,
@@ -1152,6 +1171,7 @@ int occ_create_status_attrs(struct occ *occ)
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_error, 0444,
 							    occ_show_error,
 							    NULL, 0);
+	occ->error_attr_name = occ->status_attrs[7].dev_attr.attr.name;
 
 	for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i) {
 		rc = device_create_file(dev, &occ->status_attrs[i].dev_attr);
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index a5f86c3..3b4bd91 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -116,6 +116,7 @@ struct occ {
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
 	struct sensor_device_attribute *status_attrs;
+	const char *error_attr_name;
 
 	u8 poll_cmd_data;
 	int (*send_cmd)(struct occ *occ, u8 *cmd);
@@ -143,6 +144,8 @@ struct occ {
 extern atomic_t occ_num_occs;
 
 void occ_parse_poll_response(struct occ *occ);
+void occ_reset_error(struct occ *occ);
+void occ_set_error(struct occ *occ, int error);
 int occ_poll(struct occ *occ);
 int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap);
 int occ_update_response(struct occ *occ);
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index 29233b4..a7b1d4c 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -98,7 +98,7 @@ static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
 
 static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
-	int i, rc;
+	int i, rc, error;
 	unsigned long start;
 	u16 data_length;
 	struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
@@ -161,22 +161,18 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 		rc = -EFAULT;
 	}
 
-	occ->error = resp->return_status;
-
 	if (rc < 0) {
-		occ->error_count++;
-		dev_warn(&client->dev, "occ bad response:%d\n",
-			 resp->return_status);
-		return rc;
+		error = resp->return_status;
+		dev_warn(&client->dev, "occ bad response:%d\n", error);
+		goto done;
 	}
 
 	data_length = get_unaligned_be16(&resp->data_length_be);
 	if (data_length > OCC_RESP_DATA_BYTES) {
-		occ->error_count++;
-		occ->error = -EDOM;
+		rc = -EDOM;
 		dev_warn(&client->dev, "occ bad data length:%d\n",
 			 data_length);
-		return occ->error;
+		goto assign;
 	}
 
 	for (i = 8; i < data_length + 7; i += 8) {
@@ -185,13 +181,17 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
 			goto err;
 	}
 
-	occ->error_count = 0;
-	return data_length + 7;
+	occ_reset_error(occ);
+	return 0;
 
 err:
-	occ->error_count++;
-	occ->error = rc;
 	dev_err(&client->dev, "i2c scom op failed rc:%d\n", rc);
+
+assign:
+	error = rc;
+
+done:
+	occ_set_error(occ, error);
 	return rc;
 }
 
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index c85f133..db30a2d 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -25,7 +25,7 @@ struct p9_sbe_occ {
 
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
-	int rc;
+	int rc, error;
 	unsigned long start;
 	struct occ_client *client;
 	struct occ_response *resp = &occ->resp;
@@ -35,9 +35,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 
 retry:
 	client = occ_drv_open(p9_sbe_occ->sbe, 0);
-	if (!client)
-		/* don't increment occ error counter */
-		return -ENODEV;
+	if (!client) {
+		rc = -ENODEV;
+		goto assign;
+	}
 
 	rc = occ_drv_write(client, (const char *)&cmd[1], 7);
 	if (rc < 0)
@@ -62,7 +63,8 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 		}
 		break;
 	case RESP_RETURN_SUCCESS:
-		rc = 0;
+		occ_reset_error(occ);
+		return 0;
 		break;
 	case RESP_RETURN_CMD_INVAL:
 	case RESP_RETURN_CMD_LEN:
@@ -77,23 +79,19 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 		rc = -EFAULT;
 	}
 
-	occ->error = resp->return_status;
-
-	if (rc < 0) {
-		occ->error_count++;
-		dev_warn(occ->bus_dev, "occ bad response:%d\n",
-			 resp->return_status);
-		return rc;
-	}
-
-	occ->error_count = 0;
-	return 0;
+	error = resp->return_status;
+	dev_warn(occ->bus_dev, "occ bad response:%d\n", error);
+	goto done;
 
 err:
-	occ->error_count++;
-	occ->error = rc;
 	occ_drv_release(client);
 	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
+
+assign:
+	error = rc;
+
+done:
+	occ_set_error(occ, error);
 	return rc;
 }
 
-- 
1.8.3.1
