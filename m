Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y81mv2z6jzDqlT
 for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2017 07:43:11 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v96KgNl4026523
 for <openbmc@lists.ozlabs.org>; Fri, 6 Oct 2017 16:43:09 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2defv1u6dy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 06 Oct 2017 16:43:09 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 6 Oct 2017 14:43:08 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 6 Oct 2017 14:43:06 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v96Kh51965142946; Fri, 6 Oct 2017 13:43:05 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17508136043;
 Fri,  6 Oct 2017 14:43:05 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id D7870136048;
 Fri,  6 Oct 2017 14:43:04 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 1/2] drivers: hwmon: occ: Add occs_present
 attribute
Date: Fri,  6 Oct 2017 15:43:00 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100620-0024-0000-0000-0000174D22D0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007851; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927416; UDB=6.00466659; IPR=6.00707674; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017426; XFM=3.00000015;
 UTC=2017-10-06 20:43:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100620-0025-0000-0000-00004D009531
Message-Id: <1507322581-13947-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060289
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 20:43:11 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Remove the error on detecting occs_present mismatch. Add a new sysfs
entry for occs_present field. Add sysfs_notify for this field, if it
changes.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 32 ++++++++++++++++++++------------
 drivers/hwmon/occ/common.h |  3 ---
 drivers/hwmon/occ/p8_i2c.c |  4 ----
 drivers/hwmon/occ/p9_sbe.c |  4 ----
 4 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 34002fb..e8579b6 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -10,7 +10,7 @@
 #include <asm/unaligned.h>
 #include "common.h"
 
-#define OCC_NUM_STATUS_ATTRS		8
+#define OCC_NUM_STATUS_ATTRS		9
 
 #define OCC_STAT_MASTER			0x80
 #define OCC_STAT_ACTIVE			0x01
@@ -19,8 +19,6 @@
 #define OCC_EXT_STAT_MEM_THROTTLE	0x20
 #define OCC_EXT_STAT_QUICK_DROP		0x10
 
-atomic_t occ_num_occs = ATOMIC_INIT(0);
-
 struct temp_sensor_1 {
 	u16 sensor_id;
 	u16 value;
@@ -179,9 +177,11 @@ void occ_reset_error(struct occ *occ)
 int occ_poll(struct occ *occ)
 {
 	int rc, error = occ->error;
-	struct occ_poll_response_header *header;
+	struct occ_poll_response_header *header =
+		(struct occ_poll_response_header *)occ->resp.data;
 	u16 checksum = occ->poll_cmd_data + 1;
 	u8 cmd[8];
+	u8 occs_present = header->occs_present;
 
 	cmd[0] = 0;
 	cmd[1] = 0;
@@ -196,8 +196,6 @@ int occ_poll(struct occ *occ)
 	if (rc)
 		goto done;
 
-	header = (struct occ_poll_response_header *)occ->resp.data;
-
 	if (header->occ_state == OCC_STATE_SAFE) {
 		if (occ->last_safe) {
 			if (time_after(jiffies,
@@ -208,10 +206,10 @@ int occ_poll(struct occ *occ)
 	} else
 		occ->last_safe = 0;
 
-	if (header->status & OCC_STAT_MASTER) {
-		if (hweight8(header->occs_present) !=
-		    atomic_read(&occ_num_occs))
-			occ->error = -ENXIO;
+	if (occs_present != header->occs_present && occ->hwmon &&
+	    (header->status & OCC_STAT_MASTER)) {
+		sysfs_notify(&occ->bus_dev->kobj, NULL,
+			     occ->status_attrs[7].dev_attr.attr.name);
 	}
 
 done:
@@ -321,6 +319,12 @@ static ssize_t occ_show_status(struct device *dev,
 	case 6:
 		val = header->occ_state;
 		break;
+	case 7:
+		if (header->status & OCC_STAT_MASTER)
+			val = hweight8(header->occs_present);
+		else
+			val = 1;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1203,12 +1207,16 @@ int occ_create_status_attrs(struct occ *occ)
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_status, 0444,
 							    occ_show_status,
 							    NULL, 6);
-
 	occ->status_attrs[7] =
+		(struct sensor_device_attribute)SENSOR_ATTR(occs_present, 0444,
+							    occ_show_status,
+							    NULL, 7);
+
+	occ->status_attrs[8] =
 		(struct sensor_device_attribute)SENSOR_ATTR(occ_error, 0444,
 							    occ_show_error,
 							    NULL, 0);
-	occ->error_attr_name = occ->status_attrs[7].dev_attr.attr.name;
+	occ->error_attr_name = occ->status_attrs[8].dev_attr.attr.name;
 
 	for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i) {
 		rc = device_create_file(dev, &occ->status_attrs[i].dev_attr);
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index acb50bc..6670a4b 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -83,7 +83,6 @@ struct occ_sensor {
 	u8 version;
 	void *data;
 };
-
 struct occ_sensors {
 	struct occ_sensor temp;
 	struct occ_sensor freq;
@@ -140,8 +139,6 @@ struct occ {
 	((struct sensor_device_attribute_2)				\
 		SENSOR_ATTR_OCC(_name, _mode, _show, _store, _nr, _index))
 
-extern atomic_t occ_num_occs;
-
 void occ_parse_poll_response(struct occ *occ);
 void occ_reset_error(struct occ *occ);
 void occ_set_error(struct occ *occ, int error);
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index e1c6234..020a53b 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -248,8 +248,6 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 		return rc;
 	}
 
-	atomic_inc(&occ_num_occs);
-
 	return 0;
 }
 
@@ -259,8 +257,6 @@ static int p8_i2c_occ_remove(struct i2c_client *client)
 
 	occ_remove_status_attrs(occ);
 
-	atomic_dec(&occ_num_occs);
-
 	return 0;
 }
 
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 2d50a94..7c17070 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -156,8 +156,6 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
-	atomic_inc(&occ_num_occs);
-
 	return rc;
 }
 
@@ -167,8 +165,6 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
 
 	occ_remove_status_attrs(occ);
 
-	atomic_dec(&occ_num_occs);
-
 	return 0;
 }
 
-- 
1.8.3.1
