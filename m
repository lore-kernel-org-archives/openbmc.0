Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLycq5vg0zDsRw
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:58:51 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710we3U037616
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:49 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c2c2sypq1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:58:49 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:58:47 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:58:45 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710wihQ23724134; Tue, 1 Aug 2017 00:58:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6943AC043;
 Mon, 31 Jul 2017 20:58:58 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 556D9AC03A;
 Mon, 31 Jul 2017 20:58:58 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 07/10] drivers/hwmon/occ: Add error handling
Date: Mon, 31 Jul 2017 19:58:24 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501549107-22323-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080100-0044-0000-0000-000003763569
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895763; UDB=6.00448041; IPR=6.00675950; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:58:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-0045-0000-0000-000007A445F8
Message-Id: <1501549107-22323-8-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 01 Aug 2017 00:58:52 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add logic to detect a number of error scenarios on the OCC. Export any
errors through an additional non-hwmon device attribute. The error
counting and state verification are required by the OCC hardware
specification.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 82 ++++++++++++++++++++++++++++++++++++++++++++--
 drivers/hwmon/occ/common.h |  4 +++
 2 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 2459e12..970b31f 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -17,6 +17,11 @@
 
 #include "common.h"
 
+#define OCC_ERROR_COUNT_THRESHOLD	2	/* OCC HW defined */
+
+#define OCC_STATE_SAFE			4
+#define OCC_SAFE_TIMEOUT		msecs_to_jiffies(60000) /* 1 min */
+
 #define OCC_UPDATE_FREQUENCY		msecs_to_jiffies(1000)
 
 /* OCC status bits */
@@ -126,10 +131,33 @@ struct extended_sensor {
 	u8 data[6];
 } __packed;
 
+static atomic_t occs_present = ATOMIC_INIT(0);
+
+static ssize_t occ_show_error(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct occ *occ = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
+}
+
+static DEVICE_ATTR(occ_error, 0444, occ_show_error, NULL);
+
+/* Notify user if we have an error and a change in error state. */
+static void occ_notify_error(struct occ *occ, int old_error)
+{
+	/* check hwmon pointer to verify error attribute has been added */
+	if (occ->error != old_error && occ->error && occ->hwmon)
+		sysfs_notify(&occ->bus_dev->kobj, NULL,
+			     dev_attr_occ_error.attr.name);
+}
+
 static int occ_poll(struct occ *occ)
 {
+	struct occ_poll_response_header *header;
 	u16 checksum = occ->poll_cmd_data + 1;
 	u8 cmd[8];
+	int rc, old_error = occ->error;
 
 	/* big endian */
 	cmd[0] = 0;			/* sequence number */
@@ -142,12 +170,47 @@ static int occ_poll(struct occ *occ)
 	cmd[7] = 0;
 
 	/* mutex should already be locked if necessary */
-	return occ->send_cmd(occ, cmd);
+	rc = occ->send_cmd(occ, cmd);
+	if (rc) {
+		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
+			occ->error = rc;
+
+		goto done;
+	}
+
+	/* clear error since communication was successful */
+	occ->error_count = 0;
+	occ->error = 0;
+
+	header = (struct occ_poll_response_header *)occ->resp.data;
+	/* check for safe state */
+	if (header->occ_state == OCC_STATE_SAFE) {
+		if (occ->last_safe) {
+			if (time_after(jiffies,
+				       occ->last_safe + OCC_SAFE_TIMEOUT))
+				occ->error = -EHOSTDOWN;
+		} else {
+			occ->last_safe = jiffies;
+		}
+	} else {
+		occ->last_safe = 0;
+	}
+
+	if (header->status & OCC_STAT_MASTER) {
+		/* check if we're missing any OCCs */
+		if (hweight8(header->occs_present) !=
+		    atomic_read(&occs_present))
+			occ->error = -ENXIO;
+	}
+
+done:
+	occ_notify_error(occ, old_error);
+	return rc;
 }
 
 static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 {
-	int rc;
+	int rc, old_error = occ->error;
 	u8 cmd[8];
 	u16 checksum = 0x24;
 	__be16 user_power_cap_be = cpu_to_be16(user_power_cap);
@@ -171,6 +234,16 @@ static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 
 	mutex_unlock(&occ->lock);
 
+	if (rc) {
+		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
+			occ->error = rc;
+	} else {
+		/* successful communication so clear the error */
+		occ->error_count = 0;
+		occ->error = 0;
+	}
+
+	occ_notify_error(occ, old_error);
 	return rc;
 }
 
@@ -1110,6 +1183,7 @@ static ssize_t occ_show_status(struct device *dev,
 	&sensor_dev_attr_occ_mem_throttle.dev_attr.attr,
 	&sensor_dev_attr_occ_quick_drop.dev_attr.attr,
 	&sensor_dev_attr_occ_status.dev_attr.attr,
+	&dev_attr_occ_error.attr,
 	NULL
 };
 
@@ -1197,6 +1271,8 @@ int occ_setup(struct occ *occ, const char *name)
 		return rc;
 	}
 
+	atomic_inc(&occs_present);
+
 	rc = sysfs_create_group(&occ->bus_dev->kobj, &occ_attr_group);
 	if (rc)
 		dev_warn(occ->bus_dev, "failed to create status attrs: %d\n",
@@ -1208,4 +1284,6 @@ int occ_setup(struct occ *occ, const char *name)
 void occ_shutdown(struct occ *occ)
 {
 	sysfs_remove_group(&occ->bus_dev->kobj, &occ_attr_group);
+
+	atomic_dec(&occs_present);
 }
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index dc9e06d..cef2174 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -107,6 +107,10 @@ struct occ {
 	struct occ_attribute *attrs;
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
+
+	int error;
+	unsigned int error_count;	/* number of errors observed */
+	unsigned long last_safe;	/* time OCC entered safe state */
 };
 
 int occ_setup(struct occ *occ, const char *name);
-- 
1.8.3.1
