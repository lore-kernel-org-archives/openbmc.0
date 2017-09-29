Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y3mkj4h2wzDqhb
 for <openbmc@lists.ozlabs.org>; Sat, 30 Sep 2017 08:41:33 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8TMdTRE063450
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 18:41:31 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d9y30g8ey-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 18:41:31 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 29 Sep 2017 16:41:30 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 29 Sep 2017 16:41:28 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8TMfRL03146200; Fri, 29 Sep 2017 15:41:27 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEB176A03B;
 Fri, 29 Sep 2017 16:41:27 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.183.77])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id E38B56A03C;
 Fri, 29 Sep 2017 16:41:26 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 6/9] drivers: fsi: occ: Add cancel to
 remove() and fix probe()
Date: Fri, 29 Sep 2017 17:41:05 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17092922-0024-0000-0000-000017452340
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007813; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000233; SDB=6.00924260; UDB=6.00464728; IPR=6.00704398; 
 BA=6.00005613; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017330; XFM=3.00000015;
 UTC=2017-09-29 22:41:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17092922-0025-0000-0000-00004CEAABB5
Message-Id: <1506724868-13010-7-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709290322
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
X-List-Received-Date: Fri, 29 Sep 2017 22:41:34 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Need some data to indicate to clients and the rest of the driver when
the device is being removed, so add a cancel boolean. Fix up both the
probe and remove functions to properly handle failures and prevent
deadlocks.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/occ.c | 86 +++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 24 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index a554550..550ae11 100644
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
@@ -132,14 +136,20 @@ static void occ_enqueue_xfr(struct occ_xfr *xfr)
 
 	if (empty)
 		queue_work(occ_wq, &occ->work);
+
+	return 0;
 }
 
 static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
 {
-	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
+	struct occ_client *client;
+
+	if (occ->cancel)
+		return ERR_PTR(-ECANCELED);
 
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
 	if (!client)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	client->occ = occ;
 	spin_lock_init(&client->lock);
@@ -158,8 +168,8 @@ static int occ_open(struct inode *inode, struct file *file)
 	struct occ *occ = to_occ(mdev);
 
 	client = occ_open_common(occ, file->f_flags);
-	if (!client)
-		return -ENOMEM;
+	if (IS_ERR(client))
+		return PTR_ERR(client);
 
 	file->private_data = client;
 
@@ -172,6 +182,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 	int rc;
 	size_t bytes;
 	struct occ_xfr *xfr = &client->xfr;
+	struct occ *occ = client->occ;
 
 	if (len > OCC_SRAM_BYTES)
 		return -EINVAL;
@@ -204,7 +215,8 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 					      test_bit(XFR_COMPLETE,
 						       &xfr->flags) ||
 					      test_bit(XFR_CANCELED,
-						       &xfr->flags));
+						       &xfr->flags) ||
+					      occ->cancel);
 
 		spin_lock_irq(&client->lock);
 
@@ -272,7 +284,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 
 	spin_lock_irq(&client->lock);
 
-	if (test_and_set_bit(CLIENT_XFR_PENDING, &client->flags)) {
+	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
 		rc = -EBUSY;
 		goto done;
 	}
@@ -309,8 +321,11 @@ static ssize_t occ_write_common(struct occ_client *client,
 	xfr->cmd_data_length = data_length + 6;
 	client->read_offset = 0;
 
-	occ_enqueue_xfr(xfr);
+	rc = occ_enqueue_xfr(xfr);
+	if (rc)
+		goto done;
 
+	set_bit(CLIENT_XFR_PENDING, &client->flags);
 	rc = len;
 
 done:
@@ -579,6 +594,9 @@ static void occ_worker(struct work_struct *work)
 	struct device *sbefifo = occ->sbefifo;
 
 again:
+	if (occ->cancel)
+		return;
+
 	spin_lock_irq(&occ->list_lock);
 
 	xfr = list_first_entry_or_null(&occ->xfrs, struct occ_xfr, link);
@@ -672,12 +690,17 @@ static void occ_worker(struct work_struct *work)
 
 struct occ_client *occ_drv_open(struct device *dev, unsigned long flags)
 {
+	struct occ_client *client;
 	struct occ *occ = dev_get_drvdata(dev);
 
 	if (!occ)
 		return NULL;
 
-	return occ_open_common(occ, flags);
+	client = occ_open_common(occ, flags);
+	if (IS_ERR(client))
+		return NULL;
+
+	return client;
 }
 EXPORT_SYMBOL_GPL(occ_drv_open);
 
@@ -748,23 +771,13 @@ static int occ_probe(struct platform_device *pdev)
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
@@ -774,20 +787,45 @@ static int occ_probe(struct platform_device *pdev)
 
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
+		wake_up_interruptible(&client->wait);
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
