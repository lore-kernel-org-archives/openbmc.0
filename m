Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0sgM19bjzDsRC
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 07:13:50 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBIKDmYM121827
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 15:13:48 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2exkmsj806-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 15:13:47 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 18 Dec 2017 15:13:40 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 18 Dec 2017 15:13:38 -0500
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBIKDbug52035588; Mon, 18 Dec 2017 20:13:37 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D7EAAC040;
 Mon, 18 Dec 2017 15:14:41 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id E65D8AC03A;
 Mon, 18 Dec 2017 15:14:40 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers: fsi: SBEFIFO: switch to workqueue
 instead of timer
Date: Mon, 18 Dec 2017 14:13:34 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17121820-0024-0000-0000-000003039B1D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008223; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00962152; UDB=6.00486648; IPR=6.00742147; 
 BA=6.00005750; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018610; XFM=3.00000015;
 UTC=2017-12-18 20:13:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121820-0025-0000-0000-0000465A7ABF
Message-Id: <1513628014-16656-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-18_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712180269
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
X-List-Received-Date: Mon, 18 Dec 2017 20:13:51 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Some systems are experiencing scheduling problems; mod_timer can take up
to several seconds before the timer_function is executed, even if passed
the current jiffies.

Work around this by using sbefifo's own workqueue.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 54 ++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 0697a10..7b6842a 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -29,9 +29,9 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/timer.h>
 #include <linux/uaccess.h>
 #include <linux/wait.h>
+#include <linux/workqueue.h>
 
 /*
  * The SBEFIFO is a pipe-like FSI device for communicating with
@@ -57,7 +57,7 @@
 #define SBEFIFO_MAX_RESCHDULE	msecs_to_jiffies(5000)
 
 struct sbefifo {
-	struct timer_list poll_timer;
+	struct delayed_work work;
 	struct fsi_device *fsi_dev;
 	struct miscdevice mdev;
 	wait_queue_head_t wait;
@@ -99,6 +99,8 @@ struct sbefifo_client {
 	unsigned long f_flags;
 };
 
+static struct workqueue_struct *sbefifo_wq;
+
 static DEFINE_IDA(sbefifo_ida);
 
 static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
@@ -337,7 +339,7 @@ static void sbefifo_client_release(struct kref *kref)
 			 */
 			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
 			sbefifo_get(sbefifo);
-			if (mod_timer(&client->dev->poll_timer, jiffies))
+			if (!queue_work(sbefifo_wq, &sbefifo->work.work))
 				sbefifo_put(sbefifo);
 		}
 	}
@@ -374,10 +376,11 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
 	return NULL;
 }
 
-static void sbefifo_poll_timer(unsigned long data)
+static void sbefifo_worker(struct work_struct *work)
 {
 	static const unsigned long EOT_MASK = 0x000000ff;
-	struct sbefifo *sbefifo = (void *)data;
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct sbefifo *sbefifo = container_of(dwork, struct sbefifo, work);
 	struct sbefifo_buf *rbuf, *wbuf;
 	struct sbefifo_xfr *xfr, *tmp;
 	struct sbefifo_buf drain;
@@ -393,6 +396,7 @@ static void sbefifo_poll_timer(unsigned long data)
 	if (!xfr)
 		goto out_unlock;
 
+again:
 	rbuf = xfr->rbuf;
 	wbuf = xfr->wbuf;
 
@@ -414,9 +418,8 @@ static void sbefifo_poll_timer(unsigned long data)
 		devn = sbefifo_dev_nwwriteable(sts);
 		if (devn == 0) {
 			/* No open slot for write.  Reschedule. */
-			sbefifo->poll_timer.expires = jiffies +
-				SBEFIFO_RESCHEDULE;
-			add_timer(&sbefifo->poll_timer);
+			queue_delayed_work(sbefifo_wq, &sbefifo->work,
+					   SBEFIFO_RESCHEDULE);
 			goto out_unlock;
 		}
 
@@ -468,9 +471,8 @@ static void sbefifo_poll_timer(unsigned long data)
 			}
 
 			/* No data yet.  Reschedule. */
-			sbefifo->poll_timer.expires = jiffies +
-				SBEFIFO_RESCHEDULE;
-			add_timer(&sbefifo->poll_timer);
+			queue_delayed_work(sbefifo_wq, &sbefifo->work,
+					   SBEFIFO_RESCHEDULE);
 			goto out_unlock;
 		} else {
 			xfr->wait_data_timeout = 0;
@@ -516,10 +518,12 @@ static void sbefifo_poll_timer(unsigned long data)
 		}
 		INIT_LIST_HEAD(&sbefifo->xfrs);
 
-	} else if (eot && sbefifo_next_xfr(sbefifo)) {
-		sbefifo_get(sbefifo);
-		sbefifo->poll_timer.expires = jiffies;
-		add_timer(&sbefifo->poll_timer);
+	} else if (eot) {
+		xfr = sbefifo_next_xfr(sbefifo);
+		if (xfr) {
+			wake_up_interruptible(&sbefifo->wait);
+			goto again;
+		}
 	}
 
 	sbefifo_put(sbefifo);
@@ -638,7 +642,7 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 			 * Fill the read buffer back up.
 			 */
 			sbefifo_get(sbefifo);
-			if (mod_timer(&client->dev->poll_timer, jiffies))
+			if (!queue_work(sbefifo_wq, &sbefifo->work.work))
 				sbefifo_put(sbefifo);
 		} else {
 			list_del(&xfr->client);
@@ -721,7 +725,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 								 &n))) {
 			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
 			sbefifo_get(sbefifo);
-			if (mod_timer(&sbefifo->poll_timer, jiffies))
+			if (!queue_work(sbefifo_wq, &sbefifo->work.work))
 				sbefifo_put(sbefifo);
 
 			ret = -ERESTARTSYS;
@@ -741,7 +745,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 			    n)) {
 				set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
 				sbefifo_get(sbefifo);
-				if (mod_timer(&sbefifo->poll_timer, jiffies))
+				if (!queue_work(sbefifo_wq,
+						&sbefifo->work.work))
 					sbefifo_put(sbefifo);
 				ret = -EFAULT;
 				goto out;
@@ -768,7 +773,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 		 * Drain the write buffer.
 		 */
 		sbefifo_get(sbefifo);
-		if (mod_timer(&client->dev->poll_timer, jiffies))
+		if (!queue_work(sbefifo_wq, &sbefifo->work.work))
 			sbefifo_put(sbefifo);
 	}
 
@@ -928,8 +933,7 @@ static int sbefifo_probe(struct device *dev)
 		 sbefifo->idx);
 
 	/* This bit of silicon doesn't offer any interrupts... */
-	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
-		    (unsigned long)sbefifo);
+	INIT_DELAYED_WORK(&sbefifo->work, sbefifo_worker);
 
 	sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
 	sbefifo->mdev.fops = &sbefifo_fops;
@@ -982,7 +986,7 @@ static int sbefifo_remove(struct device *dev)
 
 	ida_simple_remove(&sbefifo_ida, sbefifo->idx);
 
-	if (del_timer_sync(&sbefifo->poll_timer))
+	if (cancel_delayed_work_sync(&sbefifo->work))
 		sbefifo_put(sbefifo);
 
 	sbefifo_put(sbefifo);
@@ -1010,11 +1014,17 @@ static int sbefifo_remove(struct device *dev)
 
 static int sbefifo_init(void)
 {
+	sbefifo_wq = create_singlethread_workqueue("sbefifo");
+	if (!sbefifo_wq)
+		return -ENOMEM;
+
 	return fsi_driver_register(&sbefifo_drv);
 }
 
 static void sbefifo_exit(void)
 {
+	destroy_workqueue(sbefifo_wq);
+
 	fsi_driver_unregister(&sbefifo_drv);
 
 	ida_destroy(&sbefifo_ida);
-- 
1.8.3.1
