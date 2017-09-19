Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxZ3t4pc9zDqNh
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 06:19:53 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8JKJB1R012997
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 16:19:52 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d35v9feq1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 16:19:51 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 19 Sep 2017 14:19:51 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 19 Sep 2017 14:19:49 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8JKJm6O28573800; Tue, 19 Sep 2017 13:19:48 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65BC7136044;
 Tue, 19 Sep 2017 14:19:48 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 25CFF13603C;
 Tue, 19 Sep 2017 14:19:48 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2] drivers/hwmon/occ: Add reference count and
 switch to non-blocking read
Date: Tue, 19 Sep 2017 15:19:46 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17091920-0016-0000-0000-0000078A557F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007763; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000230; SDB=6.00919421; UDB=6.00461917; IPR=6.00699647; 
 BA=6.00005598; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017215; XFM=3.00000015;
 UTC=2017-09-19 20:19:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17091920-0017-0000-0000-00003B8931D3
Message-Id: <1505852386-4038-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-19_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709190281
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
X-List-Received-Date: Tue, 19 Sep 2017 20:19:55 -0000

From: Eddie James <eajames@us.ibm.com>

It's possible for the sbefifo ops to hang entirely if the system goes
down (checkstop, etc). If a hwmon sysfs operation is hung, then unbind
may hang as it waits for the kernfs mutex to remove hwmon attributes.

This change switches the p9 occ op to use a non-blocking read with a
retry on -EAGAIN. This continues forever until either user cancels or
driver sets the cancel bit in remove(). In addition, we need to switch
our occ structure to be dynamically allocated separate from the device,
as the device resources will be freed immediately after remove(), while
hwmon ops may still be ocurring. This necessitates reference counting so
we can free the occ structure once all users are done.

Signed-off-by: Eddie James <eajames@us.ibm.com>
---
 drivers/hwmon/occ/common.c | 48 +++++++++++++++++++++++++++++++++++++---------
 drivers/hwmon/occ/common.h |  2 ++
 drivers/hwmon/occ/p8_i2c.c | 23 +++++++++++++++++++---
 drivers/hwmon/occ/p9_sbe.c | 37 ++++++++++++++++++++++++++++++-----
 4 files changed, 93 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 34002fb..15f156e 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -118,6 +118,12 @@ struct extended_sensor {
 	u8 data[6];
 } __packed;
 
+/* not available in 4.10 */
+static bool kobject_get_unless_zero(struct kobject *kobj)
+{
+	return kref_get_unless_zero(&kobj->kref);
+}
+
 void occ_parse_poll_response(struct occ *occ)
 {
 	unsigned int i, offset = 0, size = 0;
@@ -216,7 +222,8 @@ int occ_poll(struct occ *occ)
 
 done:
 	/* notify userspace if we change error state and have an error */
-	if (occ->error != error && occ->error && occ->error_attr_name)
+	if (occ->error != error && occ->error && occ->error_attr_name &&
+	    !occ->cancel)
 		sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
 
 	return rc;
@@ -224,19 +231,28 @@ int occ_poll(struct occ *occ)
 
 int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 {
-	int rc, error = occ->error;
+	int rc, error;
 	u8 cmd[8];
 	u16 checksum = 0x24;
 	__be16 user_power_cap_be;
-	struct occ_poll_response_header *header =
-		(struct occ_poll_response_header *)occ->resp.data;
+	struct occ_poll_response_header *header;
 
-	if (!(header->status & OCC_STAT_MASTER))
-		return -EPERM;
+	if (!kobject_get_unless_zero(&occ->kobj))
+		return -ENODEV;
 
-	if (!(header->status & OCC_STAT_ACTIVE))
-		return -EACCES;
+	header = (struct occ_poll_response_header *)occ->resp.data;
 
+	if (!(header->status & OCC_STAT_MASTER)) {
+		rc = -EPERM;
+		goto done;
+	}
+
+	if (!(header->status & OCC_STAT_ACTIVE)) {
+		rc = -EACCES;
+		goto done;
+	}
+
+	error = occ->error;
 	user_power_cap_be = cpu_to_be16(user_power_cap);
 
 	cmd[0] = 0;
@@ -255,9 +271,12 @@ int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
 	mutex_unlock(&occ->lock);
 
 	/* notify userspace if we change error state and have an error*/
-	if (occ->error != error && occ->error && occ->error_attr_name)
+	if (occ->error != error && occ->error && occ->error_attr_name &&
+	    !occ->cancel)
 		sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
 
+done:
+	kobject_put(&occ->kobj);
 	return rc;
 }
 
@@ -265,6 +284,9 @@ int occ_update_response(struct occ *occ)
 {
 	int rc = 0;
 
+	if (!kobject_get_unless_zero(&occ->kobj))
+		return -ENODEV;
+
 	mutex_lock(&occ->lock);
 
 	if (time_after(jiffies, occ->last_update + OCC_UPDATE_FREQUENCY)) {
@@ -272,7 +294,15 @@ int occ_update_response(struct occ *occ)
 		occ->last_update = jiffies;
 	}
 
+	/* 
+	 * Make sure we fail if canceled so we don't access occ structure in
+	 * subsequent functions.
+	 */
+	if (occ->cancel)
+		rc = -ECANCELED;
+
 	mutex_unlock(&occ->lock);
+	kobject_put(&occ->kobj);
 	return rc;
 }
 
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index acb50bc..242d90c 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -98,9 +98,11 @@ struct occ_attribute {
 };
 
 struct occ {
+	struct kobject kobj;
 	struct device *bus_dev;
 	struct device *hwmon;
 
+	bool cancel;
 	int error;
 	unsigned int error_count;
 	unsigned long last_safe;
diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
index e1c6234..6856b2f 100644
--- a/drivers/hwmon/occ/p8_i2c.c
+++ b/drivers/hwmon/occ/p8_i2c.c
@@ -13,6 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 struct p8_i2c_occ {
 	struct occ occ;
@@ -21,6 +22,18 @@ struct p8_i2c_occ {
 
 #define to_p8_i2c_occ(x)	container_of((x), struct p8_i2c_occ, occ)
 
+static void p8_i2c_occ_release(struct kobject *kobj)
+{
+	struct occ *occ = container_of(kobj, struct occ, kobj);
+	struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
+
+	kfree(p8_i2c_occ);
+}
+
+static struct kobj_type p8_i2c_occ_type = {
+	.release = p8_i2c_occ_release,
+};
+
 static int p8_i2c_occ_getscom(struct i2c_client *client, u32 address, u8 *data)
 {
 	ssize_t rc;
@@ -198,15 +211,15 @@ static int p8_i2c_occ_probe(struct i2c_client *client,
 {
 	int rc;
 	struct occ *occ;
-	struct p8_i2c_occ *p8_i2c_occ = devm_kzalloc(&client->dev,
-						     sizeof(*p8_i2c_occ),
-						     GFP_KERNEL);
+	struct p8_i2c_occ *p8_i2c_occ = kzalloc(sizeof(*p8_i2c_occ),
+						GFP_KERNEL);
 	if (!p8_i2c_occ)
 		return -ENOMEM;
 
 	p8_i2c_occ->client = client;
 
 	occ = &p8_i2c_occ->occ;
+	kobject_init(&occ->kobj, &p8_i2c_occ_type);
 	occ->bus_dev = &client->dev;
 	occ->groups[0] = &occ->group;
 	occ->poll_cmd_data = 0x10;
@@ -257,10 +270,14 @@ static int p8_i2c_occ_remove(struct i2c_client *client)
 {
 	struct occ *occ = dev_get_drvdata(&client->dev);
 
+	occ->cancel = true;
+
 	occ_remove_status_attrs(occ);
 
 	atomic_dec(&occ_num_occs);
 
+	kobject_put(&occ->kobj);
+
 	return 0;
 }
 
diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index 2d50a94..99a6415 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -14,8 +14,11 @@
 #include <linux/platform_device.h>
 #include <linux/occ.h>
 #include <linux/sched.h>
+#include <linux/slab.h>
 #include <linux/workqueue.h>
 
+#define OCC_CMD_INCOMPLETE_MS		10
+
 struct p9_sbe_occ {
 	struct occ occ;
 	struct device *sbe;
@@ -23,6 +26,18 @@ struct p9_sbe_occ {
 
 #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
 
+static void p9_sbe_occ_release(struct kobject *kobj)
+{
+	struct occ *occ = container_of(kobj, struct occ, kobj);
+	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
+
+	kfree(p9_sbe_occ);
+}
+
+static struct kobj_type p9_sbe_occ_type = {
+	.release = p9_sbe_occ_release,
+};
+
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 {
 	int rc, error;
@@ -34,7 +49,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	start = jiffies;
 
 retry:
-	client = occ_drv_open(p9_sbe_occ->sbe, 0);
+	client = occ_drv_open(p9_sbe_occ->sbe, O_NONBLOCK);
 	if (!client) {
 		rc = -ENODEV;
 		goto assign;
@@ -44,7 +59,15 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
 	if (rc < 0)
 		goto err;
 
-	rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
+	do {
+		rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
+		if (rc != -EAGAIN)
+			break;
+
+		set_current_state(TASK_INTERRUPTIBLE);
+		schedule_timeout(msecs_to_jiffies(OCC_CMD_INCOMPLETE_MS));
+	} while (!occ->cancel);
+
 	if (rc < 0)
 		goto err;
 
@@ -135,15 +158,15 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
 {
 	int rc;
 	struct occ *occ;
-	struct p9_sbe_occ *p9_sbe_occ = devm_kzalloc(&pdev->dev,
-						     sizeof(*p9_sbe_occ),
-						     GFP_KERNEL);
+	struct p9_sbe_occ *p9_sbe_occ = kzalloc(sizeof(*p9_sbe_occ),
+						GFP_KERNEL);
 	if (!p9_sbe_occ)
 		return -ENOMEM;
 
 	p9_sbe_occ->sbe = pdev->dev.parent;
 
 	occ = &p9_sbe_occ->occ;
+	kobject_init(&occ->kobj, &p9_sbe_occ_type);
 	occ->bus_dev = &pdev->dev;
 	occ->groups[0] = &occ->group;
 	occ->poll_cmd_data = 0x20;
@@ -165,10 +188,14 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
 {
 	struct occ *occ = platform_get_drvdata(pdev);
 
+	occ->cancel = true;
+
 	occ_remove_status_attrs(occ);
 
 	atomic_dec(&occ_num_occs);
 
+	kobject_put(&occ->kobj);
+
 	return 0;
 }
 
-- 
1.8.3.1
