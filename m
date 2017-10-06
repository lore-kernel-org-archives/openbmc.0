Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y174PRpzDqnQ
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:07:07 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9624stA128313
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:07:05 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddrndpn14-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:07:04 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:07:04 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:07:02 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v96272OS65142996; Thu, 5 Oct 2017 19:07:02 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 222EBC6042;
 Thu,  5 Oct 2017 20:07:02 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 3D2CEC6037;
 Thu,  5 Oct 2017 20:07:01 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 28/31] drivers: fsi: occ: Add cancel to
 remove() and fix probe()
Date: Thu,  5 Oct 2017 21:05:50 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0020-0000-0000-00000CCF2A10
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927058; UDB=6.00466443; IPR=6.00707312; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:07:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0021-0000-0000-00005E670D28
Message-Id: <1507255553-13301-29-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060029
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
X-List-Received-Date: Fri, 06 Oct 2017 02:07:08 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Need some data to indicate to clients and the rest of the driver when
the device is being removed, so add a cancel boolean. Fix up both the
probe and remove functions to properly handle failures and prevent
deadlocks.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/occ.c | 71 +++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 21 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index bd0ad98..ec42fc0 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -46,6 +46,7 @@ struct occ {
 	spinlock_t list_lock;		/* lock access to the xfrs list */
 	struct mutex occ_lock;		/* lock access to the hardware */
 	struct work_struct work;
+	bool cancel;
 };
 
 #define to_occ(x)	container_of((x), struct occ, mdev)
@@ -117,12 +118,15 @@ struct occ_client {
 
 static DEFINE_IDA(occ_ida);
 
-static void occ_enqueue_xfr(struct occ_xfr *xfr)
+static int occ_enqueue_xfr(struct occ_xfr *xfr)
 {
 	int empty;
 	struct occ_client *client = to_client(xfr);
 	struct occ *occ = client->occ;
 
+	if (occ->cancel)
+		return -ECANCELED;
+
 	spin_lock_irq(&occ->list_lock);
 
 	empty = list_empty(&occ->xfrs);
@@ -132,6 +136,8 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
 
 	if (empty)
 		queue_work(occ_wq, &occ->work);
+
+	return 0;
 }
 
 static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
@@ -166,10 +172,10 @@ static int occ_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static inline bool occ_read_ready(struct occ_xfr *xfr)
+static inline bool occ_read_ready(struct occ_xfr *xfr, struct occ *occ)
 {
 	return test_bit(XFR_COMPLETE, &xfr->flags) ||
-		test_bit(XFR_CANCELED, &xfr->flags);
+		test_bit(XFR_CANCELED, &xfr->flags) || occ->cancel;
 }
 
 static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
@@ -178,6 +184,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 	int rc;
 	size_t bytes;
 	struct occ_xfr *xfr;
+	struct occ *occ;
 
 	if (!client)
 		return -ENODEV;
@@ -186,6 +193,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 		return -EINVAL;
 
 	xfr = &client->xfr;
+	occ = client->occ;
 
 	spin_lock_irq(&client->lock);
 
@@ -212,7 +220,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 		spin_unlock_irq(&client->lock);
 
 		rc = wait_event_interruptible(client->wait,
-					      occ_read_ready(xfr));
+					      occ_read_ready(xfr, occ));
 
 		spin_lock_irq(&client->lock);
 
@@ -285,7 +293,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 
 	spin_lock_irq(&client->lock);
 
-	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
+	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
 		rc = -EBUSY;
 		goto done;
 	}
@@ -323,8 +331,11 @@ static ssize_t occ_write_common(struct occ_client *client,
 	xfr->cmd_data_length = data_length + 6;
 	client->read_offset = 0;
 
-	occ_enqueue_xfr(xfr);
+	rc = occ_enqueue_xfr(xfr);
+	if (rc)
+		goto done;
 
+	set_bit(CLIENT_XFR_PENDING, &client->flags);
 	rc = len;
 
 done:
@@ -602,6 +613,9 @@ static void occ_worker(struct work_struct *work)
 	struct device *sbefifo = occ->sbefifo;
 
 again:
+	if (occ->cancel)
+		return;
+
 	spin_lock_irq(&occ->list_lock);
 
 	xfr = list_first_entry_or_null(&occ->xfrs, struct occ_xfr, link);
@@ -762,23 +776,13 @@ static int occ_probe(struct platform_device *pdev)
 			if (occ->idx < 0)
 				occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
 							  GFP_KERNEL);
-		} else
+		} else {
 			occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX,
 						  GFP_KERNEL);
-
-		/* create platform devs for dts child nodes (hwmon, etc) */
-		for_each_child_of_node(dev->of_node, np) {
-			snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
-				 occ->idx, child_idx++);
-			child = of_platform_device_create(np, child_name, dev);
-			if (!child)
-				dev_warn(dev,
-					 "failed to create child node dev\n");
 		}
-	} else
+	} else {
 		occ->idx = ida_simple_get(&occ_ida, 1, INT_MAX, GFP_KERNEL);
-
-	platform_set_drvdata(pdev, occ);
+	}
 
 	snprintf(occ->name, sizeof(occ->name), "occ%d", occ->idx);
 	occ->mdev.fops = &occ_fops;
@@ -788,20 +792,45 @@ static int occ_probe(struct platform_device *pdev)
 
 	rc = misc_register(&occ->mdev);
 	if (rc) {
-		dev_err(dev, "failed to register miscdevice\n");
+		dev_err(dev, "failed to register miscdevice: %d\n", rc);
+		ida_simple_remove(&occ_ida, occ->idx);
 		return rc;
 	}
 
+	/* create platform devs for dts child nodes (hwmon, etc) */
+	for_each_available_child_of_node(dev->of_node, np) {
+		snprintf(child_name, sizeof(child_name), "occ%d-dev%d",
+			 occ->idx, child_idx++);
+		child = of_platform_device_create(np, child_name, dev);
+		if (!child)
+			dev_warn(dev, "failed to create child node dev\n");
+	}
+
+	platform_set_drvdata(pdev, occ);
+
 	return 0;
 }
 
 static int occ_remove(struct platform_device *pdev)
 {
 	struct occ *occ = platform_get_drvdata(pdev);
+	struct occ_xfr *xfr;
+	struct occ_client *client;
+
+	occ->cancel = true;
+
+	spin_lock_irq(&occ->list_lock);
+	list_for_each_entry(xfr, &occ->xfrs, link) {
+		client = to_client(xfr);
+		wake_up_all(&client->wait);
+	}
+	spin_unlock_irq(&occ->list_lock);
 
-	flush_work(&occ->work);
 	misc_deregister(&occ->mdev);
 	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
+
+	cancel_work_sync(&occ->work);
+
 	ida_simple_remove(&occ_ida, occ->idx);
 
 	return 0;
-- 
1.8.3.1
