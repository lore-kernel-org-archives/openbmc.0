Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhXfq2QzZzF0xb
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 08:32:00 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1ELTZmH124722
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 16:31:57 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g4tva537a-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 16:31:57 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 14 Feb 2018 16:31:56 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 14 Feb 2018 16:31:54 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1ELVsDM53870820; Wed, 14 Feb 2018 21:31:54 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A50B5B2056;
 Wed, 14 Feb 2018 16:28:16 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 3BE05B204D;
 Wed, 14 Feb 2018 16:28:16 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.10 v2 2/3] drivers: fsi: sbefifo: switch to mutex
 in work function
Date: Wed, 14 Feb 2018 15:31:47 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1518643908-13449-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1518643908-13449-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18021421-0044-0000-0000-000003E415A0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008535; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000253; SDB=6.00989770; UDB=6.00502607; IPR=6.00769124; 
 MB=3.00019556; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-14 21:31:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021421-0045-0000-0000-0000081415C7
Message-Id: <1518643908-13449-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-14_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802140252
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Feb 2018 21:32:03 -0000

Use a mutex instead of a spinlock to prevent locking up the bmc while
waiting on FSI operations. This can then be used in conjunction with
Jeremy's FSI spinlock fix.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 45 +++++++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 7b6842a..35d0d5e 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -22,6 +22,7 @@
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
@@ -63,7 +64,8 @@ struct sbefifo {
 	wait_queue_head_t wait;
 	struct list_head xfrs;
 	struct kref kref;
-	spinlock_t lock;
+	spinlock_t list_lock;		/* lock access to the xfrs list */
+	struct mutex sbefifo_lock;	/* lock access to the hardware */
 	char name[32];
 	int idx;
 	int rc;
@@ -389,12 +391,16 @@ static void sbefifo_worker(struct work_struct *work)
 	int ret = 0;
 	u32 sts;
 	int i;
+	unsigned long flags;
 
-	spin_lock(&sbefifo->lock);
+	spin_lock_irqsave(&sbefifo->list_lock, flags);
 	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
 				       xfrs);
+	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
 	if (!xfr)
-		goto out_unlock;
+		return;
+
+	mutex_lock(&sbefifo->sbefifo_lock);
 
 again:
 	rbuf = xfr->rbuf;
@@ -499,7 +505,11 @@ static void sbefifo_worker(struct work_struct *work)
 				goto out;
 
 			set_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags);
+
+			spin_lock_irqsave(&sbefifo->list_lock, flags);
 			list_del(&xfr->xfrs);
+			spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+
 			if (unlikely(test_bit(SBEFIFO_XFR_CANCEL,
 					      &xfr->flags)))
 				kfree(xfr);
@@ -512,14 +522,19 @@ static void sbefifo_worker(struct work_struct *work)
 		sbefifo->rc = ret;
 		dev_err(&sbefifo->fsi_dev->dev,
 			"Fatal bus access failure: %d\n", ret);
+
+		spin_lock_irqsave(&sbefifo->list_lock, flags);
 		list_for_each_entry_safe(xfr, tmp, &sbefifo->xfrs, xfrs) {
 			list_del(&xfr->xfrs);
 			kfree(xfr);
 		}
 		INIT_LIST_HEAD(&sbefifo->xfrs);
-
+		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
 	} else if (eot) {
+		spin_lock_irqsave(&sbefifo->list_lock, flags);
 		xfr = sbefifo_next_xfr(sbefifo);
+		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+
 		if (xfr) {
 			wake_up_interruptible(&sbefifo->wait);
 			goto again;
@@ -530,7 +545,7 @@ static void sbefifo_worker(struct work_struct *work)
 	wake_up_interruptible(&sbefifo->wait);
 
 out_unlock:
-	spin_unlock(&sbefifo->lock);
+	mutex_unlock(&sbefifo->sbefifo_lock);
 }
 
 static int sbefifo_open(struct inode *inode, struct file *file)
@@ -686,6 +701,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	struct sbefifo_xfr *xfr;
 	ssize_t ret = 0;
 	size_t n;
+	unsigned long flags;
 
 	if ((len >> 2) << 2 != len)
 		return -EINVAL;
@@ -696,23 +712,23 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	sbefifo_get_client(client);
 	n = sbefifo_buf_nbwriteable(&client->wbuf);
 
-	spin_lock_irq(&sbefifo->lock);
+	spin_lock_irqsave(&sbefifo->list_lock, flags);
 	xfr = sbefifo_next_xfr(sbefifo);	/* next xfr to be executed */
 
 	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
-		spin_unlock_irq(&sbefifo->lock);
+		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
 		ret = -EAGAIN;
 		goto out;
 	}
 
 	xfr = sbefifo_enq_xfr(client);		/* this xfr queued up */
 	if (IS_ERR(xfr)) {
-		spin_unlock_irq(&sbefifo->lock);
+		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
 		ret = PTR_ERR(xfr);
 		goto out;
 	}
 
-	spin_unlock_irq(&sbefifo->lock);
+	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
 
 	/*
 	 * Partial writes are not really allowed in that EOT is sent exactly
@@ -923,7 +939,8 @@ static int sbefifo_probe(struct device *dev)
 		}
 	}
 
-	spin_lock_init(&sbefifo->lock);
+	spin_lock_init(&sbefifo->list_lock);
+	mutex_init(&sbefifo->sbefifo_lock);
 	kref_init(&sbefifo->kref);
 	init_waitqueue_head(&sbefifo->wait);
 	INIT_LIST_HEAD(&sbefifo->xfrs);
@@ -966,8 +983,11 @@ static int sbefifo_remove(struct device *dev)
 {
 	struct sbefifo *sbefifo = dev_get_drvdata(dev);
 	struct sbefifo_xfr *xfr, *tmp;
+	unsigned long flags;
 
-	spin_lock(&sbefifo->lock);
+	/* lock the sbefifo so to prevent deleting an ongoing xfr */
+	mutex_lock(&sbefifo->sbefifo_lock);
+	spin_lock_irqsave(&sbefifo->list_lock, flags);
 
 	WRITE_ONCE(sbefifo->rc, -ENODEV);
 	list_for_each_entry_safe(xfr, tmp, &sbefifo->xfrs, xfrs) {
@@ -977,7 +997,8 @@ static int sbefifo_remove(struct device *dev)
 
 	INIT_LIST_HEAD(&sbefifo->xfrs);
 
-	spin_unlock(&sbefifo->lock);
+	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+	mutex_unlock(&sbefifo->sbefifo_lock);
 
 	wake_up_all(&sbefifo->wait);
 
-- 
1.8.3.1
