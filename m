Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y0R2kZDzDqnb
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:31 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9624eML038737
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:29 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddwufesvx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:29 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:06:28 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:27 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9626QPd4260168; Thu, 5 Oct 2017 19:06:26 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C761C6037;
 Thu,  5 Oct 2017 20:06:26 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id BA684C6043;
 Thu,  5 Oct 2017 20:06:25 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 13/31] drivers: fsi: SBEFIFO: Fix probe()
 and remove()
Date: Thu,  5 Oct 2017 21:05:35 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0012-0000-0000-0000151B2803
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927057; UDB=6.00466443; IPR=6.00707312; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0013-0000-0000-00004FC30CDC
Message-Id: <1507255553-13301-14-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 06 Oct 2017 02:06:32 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Probe didn't handle a failed misc device registration properly. Remove
had the potential for hangs. Also, remove the list of SBEFIFOs and
instead just use the device "driver data" pointer.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 111 ++++++++++++++++++++++------------------------
 1 file changed, 53 insertions(+), 58 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index a2acf76..9b560ec 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -58,7 +58,6 @@ struct sbefifo {
 	struct fsi_device *fsi_dev;
 	struct miscdevice mdev;
 	wait_queue_head_t wait;
-	struct list_head link;
 	struct list_head xfrs;
 	struct kref kref;
 	spinlock_t lock;
@@ -96,8 +95,6 @@ struct sbefifo_client {
 	unsigned long f_flags;
 };
 
-static struct list_head sbefifo_fifos;
-
 static DEFINE_IDA(sbefifo_ida);
 
 static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
@@ -267,9 +264,12 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct sbefifo_client *client)
 	struct sbefifo *sbefifo = client->dev;
 	struct sbefifo_xfr *xfr;
 
+	if (READ_ONCE(sbefifo->rc))
+		return ERR_PTR(sbefifo->rc);
+
 	xfr = kzalloc(sizeof(*xfr), GFP_KERNEL);
 	if (!xfr)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	xfr->rbuf = &client->rbuf;
 	xfr->wbuf = &client->wbuf;
@@ -490,7 +490,7 @@ static void sbefifo_poll_timer(unsigned long data)
 	}
 
 	sbefifo_put(sbefifo);
-	wake_up(&sbefifo->wait);
+	wake_up_interruptible(&sbefifo->wait);
 
 out_unlock:
 	spin_unlock(&sbefifo->lock);
@@ -605,7 +605,7 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 		} else {
 			kfree(xfr);
 			list_del(&xfr->client);
-			wake_up(&sbefifo->wait);
+			wake_up_interruptible(&sbefifo->wait);
 		}
 	}
 
@@ -664,9 +664,9 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	}
 
 	xfr = sbefifo_enq_xfr(client);		/* this xfr queued up */
-	if (!xfr) {
+	if (IS_ERR(xfr)) {
 		spin_unlock_irq(&sbefifo->lock);
-		ret = -ENOMEM;
+		ret = PTR_ERR(xfr);
 		goto out;
 	}
 
@@ -769,18 +769,15 @@ static int sbefifo_release(struct inode *inode, struct file *file)
 struct sbefifo_client *sbefifo_drv_open(struct device *dev,
 					unsigned long flags)
 {
-	struct sbefifo_client *client = NULL;
-	struct sbefifo *sbefifo;
-	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+	struct sbefifo_client *client;
+	struct sbefifo *sbefifo = dev_get_drvdata(dev);
 
-	list_for_each_entry(sbefifo, &sbefifo_fifos, link) {
-		if (sbefifo->fsi_dev != fsi_dev)
-			continue;
+	if (!sbefifo)
+		return NULL;
 
-		client = sbefifo_new_client(sbefifo);
-		if (client)
-			client->f_flags = flags;
-	}
+	client = sbefifo_new_client(sbefifo);
+	if (client)
+		client->f_flags = flags;
 
 	return client;
 }
@@ -854,69 +851,68 @@ static int sbefifo_probe(struct device *dev)
 		return -EIO;
 	}
 
-	sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
-	sbefifo->mdev.fops = &sbefifo_fops;
-	sbefifo->mdev.name = sbefifo->name;
-	sbefifo->mdev.parent = dev;
 	spin_lock_init(&sbefifo->lock);
 	kref_init(&sbefifo->kref);
+	init_waitqueue_head(&sbefifo->wait);
+	INIT_LIST_HEAD(&sbefifo->xfrs);
 
 	sbefifo->idx = ida_simple_get(&sbefifo_ida, 1, INT_MAX, GFP_KERNEL);
 	snprintf(sbefifo->name, sizeof(sbefifo->name), "sbefifo%d",
 		 sbefifo->idx);
-	init_waitqueue_head(&sbefifo->wait);
-	INIT_LIST_HEAD(&sbefifo->xfrs);
 
 	/* This bit of silicon doesn't offer any interrupts... */
 	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
 		    (unsigned long)sbefifo);
 
-	if (dev->of_node) {
-		/* create platform devs for dts child nodes (occ, etc) */
-		for_each_child_of_node(dev->of_node, np) {
-			snprintf(child_name, sizeof(child_name), "%s-dev%d",
-				 sbefifo->name, child_idx++);
-			child = of_platform_device_create(np, child_name, dev);
-			if (!child)
-				dev_warn(dev,
-					 "failed to create child node dev\n");
-		}
+	sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
+	sbefifo->mdev.fops = &sbefifo_fops;
+	sbefifo->mdev.name = sbefifo->name;
+	sbefifo->mdev.parent = dev;
+	ret = misc_register(&sbefifo->mdev);
+	if (ret) {
+		dev_err(dev, "failed to register miscdevice: %d\n", ret);
+		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
+		sbefifo_put(sbefifo);
+		return ret;
 	}
 
-	list_add(&sbefifo->link, &sbefifo_fifos);
-	
-	return misc_register(&sbefifo->mdev);
+	/* create platform devs for dts child nodes (occ, etc) */
+	for_each_available_child_of_node(dev->of_node, np) {
+		snprintf(child_name, sizeof(child_name), "%s-dev%d",
+			 sbefifo->name, child_idx++);
+		child = of_platform_device_create(np, child_name, dev);
+		if (!child)
+			dev_warn(dev, "failed to create child %s dev\n",
+				 child_name);
+	}
+
+	dev_set_drvdata(dev, sbefifo);
+
+	return 0;
 }
 
 static int sbefifo_remove(struct device *dev)
 {
-	struct fsi_device *fsi_dev = to_fsi_dev(dev);
-	struct sbefifo *sbefifo, *sbefifo_tmp;
+	struct sbefifo *sbefifo = dev_get_drvdata(dev);
 	struct sbefifo_xfr *xfr;
 
-	list_for_each_entry_safe(sbefifo, sbefifo_tmp, &sbefifo_fifos, link) {
-		if (sbefifo->fsi_dev != fsi_dev)
-			continue;
+	WRITE_ONCE(sbefifo->rc, -ENODEV);
+	wake_up_all(&sbefifo->wait);
 
-		device_for_each_child(dev, NULL, sbefifo_unregister_child);
+	misc_deregister(&sbefifo->mdev);
+	device_for_each_child(dev, NULL, sbefifo_unregister_child);
 
-		misc_deregister(&sbefifo->mdev);
-		list_del(&sbefifo->link);
-		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
-
-		if (del_timer_sync(&sbefifo->poll_timer))
-			sbefifo_put(sbefifo);
+	ida_simple_remove(&sbefifo_ida, sbefifo->idx);
 
-		spin_lock(&sbefifo->lock);
-		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
-			kfree(xfr);
-		spin_unlock(&sbefifo->lock);
+	if (del_timer_sync(&sbefifo->poll_timer))
+		sbefifo_put(sbefifo);
 
-		WRITE_ONCE(sbefifo->rc, -ENODEV);
+	spin_lock(&sbefifo->lock);
+	list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
+		kfree(xfr);
+	spin_unlock(&sbefifo->lock);
 
-		wake_up(&sbefifo->wait);
-		sbefifo_put(sbefifo);
-	}
+	sbefifo_put(sbefifo);
 
 	return 0;
 }
@@ -941,7 +937,6 @@ static int sbefifo_remove(struct device *dev)
 
 static int sbefifo_init(void)
 {
-	INIT_LIST_HEAD(&sbefifo_fifos);
 	return fsi_driver_register(&sbefifo_drv);
 }
 
-- 
1.8.3.1
