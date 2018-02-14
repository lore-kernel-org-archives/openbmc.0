Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhXfp4CyRzF0xb
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 08:31:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1ELV5KB079583
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 16:31:56 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g4ustjumy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 16:31:55 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 14 Feb 2018 16:31:54 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 14 Feb 2018 16:31:52 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1ELVqwf47579388; Wed, 14 Feb 2018 21:31:52 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1F58B204E;
 Wed, 14 Feb 2018 16:28:14 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 26185B2056;
 Wed, 14 Feb 2018 16:28:14 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, Eddie James <eajames@linux.vnet.ibm.com>, 
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 1/3] drivers: fsi: SBEFIFO: switch to
 workqueue instead of timer
Date: Wed, 14 Feb 2018 15:31:46 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1518643908-13449-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1518643908-13449-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18021421-0008-0000-0000-000002D183CA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008535; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000253; SDB=6.00989770; UDB=6.00502607; IPR=6.00769124; 
 BA=6.00005830; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019556; XFM=3.00000015;
 UTC=2018-02-14 21:31:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021421-0009-0000-0000-00003841C6E4
Message-Id: <1518643908-13449-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-14_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
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

Switch to a workqueue instead of a poll timer so that we can use a mutex
in the work function instead of a spinlock. This allows the use of
Jeremy's FSI scheduling fix.

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
