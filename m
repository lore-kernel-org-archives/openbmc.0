Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OXxmVBUz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="neRYyd+D"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnTB0VDczF0fs
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:58 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4108820BF9;
 Mon, 19 Feb 2018 23:19:55 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uV+xVhohMy4lJWjVQ
 oTo3gluXQT3/sRNONscaB7l69Q=; b=OXxmVBUz7mPIutO15SpJbOt4bYQabPkxU
 AqV22NeVinARKPKVxHdu5U8hVlXtVn6pMezh4xCst0npdyRv1xpcUCjMRpUPT4zi
 gj38cNR2rLwW230UtBfqD3qo9W4uxORSnNWJBG5Kz6MAdZMizTJGR9LqNDJyWlEj
 0OGROLpB8HWOuKSkuZyR33qExZz4cpEeFFwiymMUjvR2DD+CkS9UrRpsaCFHt7z0
 tiXcBiPPqCCvY86riFQ1X/29JA6jIXT+F5Kot4jzUSQWFEPLBDykWMpiExHYQcow
 bfS6EGMtTbogmJ82JZd7i5LEJmhFoad+IuVqvNgVYZCf6VG/2/n9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uV+xVhohMy4lJWjVQoTo3gluXQT3/sRNONscaB7l69Q=; b=neRYyd+D
 RPjxKsahGoDDWBzlW+gDvNX2JJj9Y64eMywdslDvZ1fye9AgrXjlv4ODsD6bnfji
 CdNAbcplzX3H5E/35FXpiEoA57UGdct3xYNV13KOx+434tnDof99CUVlLBtN4Mcf
 S8KRt4eSZITqAKWS7FRT8eYZ4D4WdVkjW736Nc/jTel7AkGBijyakjIKVqSv2+iN
 ob9PJLA5l8Ksg+Am809pgsCZKS78Xc8qOnyHw+5OxyD5yV+ZtM37G/MUkCn/PAEJ
 Ye0vS+Ycn2xm7cXS2ZojvNFAdWuOSyqbIvhGV1PzG0JbbQ6ILyMZ5ouEV5QcDr4g
 tetJUzWjr6onfA==
X-ME-Sender: <xms:66GLWoWFVYJLBVVbhUytPe1fFlct32E_TmsQ7JpQu0z-LczhvFYeXw>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3EE517E0DA;
 Mon, 19 Feb 2018 23:19:51 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org, "Edward A . James" <eajames@us.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.13 12/16] fsi: sbefifo: Avoid using a timer to
 drive FIFO transfers
Date: Tue, 20 Feb 2018 14:48:40 +1030
Message-Id: <20180220041844.13228-13-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180220041844.13228-1-andrew@aj.id.au>
References: <20180220041844.13228-1-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:58 -0000

From: Eddie James <eajames@linux.vnet.ibm.com>

The timer subsystem appears to misbehave when requesting an immediate expiry
via `mod_timer(..., jiffies)`. The SBEFIFO driver uses this pattern for
scheduling work when it either adds a new transfer to an empty queue or the
timer callback finds the transfer queue is not empty. In both cases work should
be scheduled immediately, however the current approach is not optimal:

The comment [0] outlines an issue where OCC sensor polling on the BMC can come
at remarkable cost. Delays of up to and above 10 seconds can be experienced
when reading an OCC attribute.

Tracing of the subsystems involved (FSI, the SBEFIFO, the OCC, the scheduler
and the timer subsystems) showed that the SBEFIFO timer callbacks had a
saw-tooth pattern of execution latency in jiffies relative to their scheduled
expiry time. In the measurements the typical latency of an immediate reschedule
was 15 jiffies, though this could be as few as 1 or greater than 100 in the
pathological case. Surprisingly, these delays coincided in length with system
idle time between the SBEFIFO transfers - it appears timer subsystem is not
properly accounting for the immediacy of the request[1].

Querying sensors on the OCC incurs multiple SBEFIFO transfers, each with its
own (increasing) expiry latency, which leads to the poor responsiveness
observed above.

Stop misusing the timer infrastructure for work queue management and incurring
associated penalties (even if they appear to be a bug in the timer core).
Instead, use a workqueue and use queue_work() and queue_delayed_work() as
required. With this change, reading an OCC sensor typically takes ~0.5 seconds
wall-clock in the un-cached case and rarely exceeds 1 second. In the cached
case the read completes in around 0.01 seconds.

Finally, using a workqueue enables the use of mutexes in place of spinlocks,
making way for future changes down the stack in the FSI core.

[0] https://github.com/openbmc/openbmc/issues/2696#issuecomment-351207046
[1] It seems scheduling a timer with `mod_timer(..., jiffies)` is a
    pathological case: Changing all such call-sites in the SBEFIFO driver to
    use `mod_timer(..., jiffies + 1)` yielded a similar improvement in
    performance to the workqueue strategy.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
[arj: Rework the commit message]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 54 ++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 041704806ae4..645ae00cc6ac 100644
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
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/sbefifo.h>
@@ -60,7 +60,7 @@
 #define SBEFIFO_MAX_RESCHDULE	msecs_to_jiffies(5000)
 
 struct sbefifo {
-	struct timer_list poll_timer;
+	struct delayed_work work;
 	struct fsi_device *fsi_dev;
 	struct miscdevice mdev;
 	wait_queue_head_t wait;
@@ -102,6 +102,8 @@ struct sbefifo_client {
 	unsigned long f_flags;
 };
 
+static struct workqueue_struct *sbefifo_wq;
+
 static DEFINE_IDA(sbefifo_ida);
 
 static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
@@ -344,7 +346,7 @@ static void sbefifo_release_client(struct kref *kref)
 			 */
 			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
 			sbefifo_get(sbefifo);
-			if (mod_timer(&client->dev->poll_timer, jiffies))
+			if (!queue_work(sbefifo_wq, &sbefifo->work.work))
 				sbefifo_put(sbefifo);
 		}
 	}
@@ -382,10 +384,11 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
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
@@ -403,6 +406,7 @@ static void sbefifo_poll_timer(unsigned long data)
 
 	trace_sbefifo_begin_xfer(xfr);
 
+again:
 	rbuf = xfr->rbuf;
 	wbuf = xfr->wbuf;
 
@@ -424,9 +428,8 @@ static void sbefifo_poll_timer(unsigned long data)
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
 
@@ -478,9 +481,8 @@ static void sbefifo_poll_timer(unsigned long data)
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
@@ -528,10 +530,12 @@ static void sbefifo_poll_timer(unsigned long data)
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
@@ -652,7 +656,7 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
 			/* Fill the read buffer back up. */
 			sbefifo_get(sbefifo);
-			if (mod_timer(&client->dev->poll_timer, jiffies))
+			if (!queue_work(sbefifo_wq, &sbefifo->work.work))
 				sbefifo_put(sbefifo);
 		} else {
 			list_del(&xfr->client);
@@ -738,7 +742,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 								 &n))) {
 			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
 			sbefifo_get(sbefifo);
-			if (mod_timer(&sbefifo->poll_timer, jiffies))
+			if (!queue_work(sbefifo_wq, &sbefifo->work.work))
 				sbefifo_put(sbefifo);
 
 			ret = -ERESTARTSYS;
@@ -758,7 +762,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 			    n)) {
 				set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
 				sbefifo_get(sbefifo);
-				if (mod_timer(&sbefifo->poll_timer, jiffies))
+				if (!queue_work(sbefifo_wq,
+						&sbefifo->work.work))
 					sbefifo_put(sbefifo);
 				ret = -EFAULT;
 				goto out;
@@ -783,7 +788,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 
 		/* Drain the write buffer. */
 		sbefifo_get(sbefifo);
-		if (mod_timer(&client->dev->poll_timer, jiffies))
+		if (!queue_work(sbefifo_wq, &sbefifo->work.work))
 			sbefifo_put(sbefifo);
 	}
 
@@ -943,8 +948,7 @@ static int sbefifo_probe(struct device *dev)
 		 sbefifo->idx);
 
 	/* This bit of silicon doesn't offer any interrupts... */
-	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
-		    (unsigned long)sbefifo);
+	INIT_DELAYED_WORK(&sbefifo->work, sbefifo_worker);
 
 	sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
 	sbefifo->mdev.fops = &sbefifo_fops;
@@ -997,7 +1001,7 @@ static int sbefifo_remove(struct device *dev)
 
 	ida_simple_remove(&sbefifo_ida, sbefifo->idx);
 
-	if (del_timer_sync(&sbefifo->poll_timer))
+	if (cancel_delayed_work_sync(&sbefifo->work))
 		sbefifo_put(sbefifo);
 
 	sbefifo_put(sbefifo);
@@ -1025,11 +1029,17 @@ static struct fsi_driver sbefifo_drv = {
 
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
2.14.1
