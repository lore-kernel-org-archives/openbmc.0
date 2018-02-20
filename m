Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mmxise5Q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VpDxa2tv"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnTH4HHxzDrdq
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:20:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D1E020BD2;
 Mon, 19 Feb 2018 23:20:01 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=f0OsY3YRVQTvoV9L2
 +bckla1WJt3st/HPEIhOF3/WkA=; b=mmxise5QjYUnVJf10rCc+/1JmwGsVEYTr
 L+HgNFXyoci3t8DDJPXf2O0MloSe8/CN1z/KrxepSpqcwoaaQI0z8Q4ZyXNgeMjx
 Wb5kWoBSiY9pxoM9QswwJVObEAdkgM/waNzuchu1ZA7qOScL6gxLfRUvAVlrQ6MN
 yYhT77UC3jwQbr5ZlEWf49lATYLzowbT45pFQf8X+E7cS9Eoef+PXbLzky7pyw14
 GEBJYxCkupedw4i0Msg55cYyFvNGHQjwvmNHp9hWS6ZhxbwZMqpd9XcEw/tk30lo
 jPRNxGqCBr1e+IhKQN1/B7pR09slOjtVykEy9FLWG6oCXAEmslmcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=f0OsY3YRVQTvoV9L2+bckla1WJt3st/HPEIhOF3/WkA=; b=VpDxa2tv
 76B6dn57fhUNMXtSKWfhf0r9/CIniPCaxRLiU03a2ax4HaxrIYDpYHxDQMTm3SA5
 Tkxwr+xJvkRIbnyWvR65OZh7D0a/HJVPM3WhO/RUN2u8ecHHC6AlX4v3VDMV2UFc
 3FU7zek0Vmc8yedmOQ6ZGTYqTSkgP7eiKKNXHqMdfAeYMIG7Zv++l+yzmuRQOA/o
 HNZpY6gisc08hnmAE6eAgWmTBM9j2PoH3FRUEo5yhTpLArQwXBGWDd4kZa1LOFQb
 8OdEN+d9/Qmrnz3QBqtAKbOSnUPofSesA0g1pCyHUG2GvlVaZLsQMiNQY0zWxcVo
 CMli6NFTDpQKBg==
X-ME-Sender: <xms:8aGLWjJSXcDUcDNm0xjx8-0XNEgfyrL39EDd8mWIWigGKZynuumw0Q>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id ACC1E7E371;
 Mon, 19 Feb 2018 23:19:58 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 14/16] fsi: sbefifo: Switch list_lock from
 spinlock to mutex
Date: Tue, 20 Feb 2018 14:48:42 +1030
Message-Id: <20180220041844.13228-15-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:20:04 -0000

We allocate GFP_KERNEL memory for a list element in sbefifo_enq_xfr() (elided
from the stack trace presumably by inlining) but do so under list_lock, which
was previously a spin lock. Enabling lock debugging gives the following
warning:

[  188.830000] BUG: sleeping function called from invalid context at mm/slab.h:408
[  188.830000] in_atomic(): 1, irqs_disabled(): 128, pid: 110, name: kworker/u2:9
[  188.830000] INFO: lockdep is turned off.
[  188.830000] irq event stamp: 9002
[  188.830000] hardirqs last  enabled at (9001): [<801105bc>] kmem_cache_alloc_trace+0x8c/0x284
[  188.830000] hardirqs last disabled at (9002): [<8049458c>] _raw_spin_lock_irqsave+0x2c/0xa0
[  188.830000] softirqs last  enabled at (5370): [<8000987c>] __do_softirq+0x38c/0x510
[  188.830000] softirqs last disabled at (5363): [<8001f154>] irq_exit+0x120/0x16c
[  188.830000] CPU: 0 PID: 110 Comm: kworker/u2:9 Tainted: G        W       4.10.17-00534-gb846201e7a2d #2277
[  188.830000] Hardware name: ASpeed SoC
[  188.830000] Workqueue: occ occ_worker
[  188.830000] [<800108f8>] (unwind_backtrace) from [<8000e02c>] (show_stack+0x20/0x24)
[  188.830000] [<8000e02c>] (show_stack) from [<8022d1c0>] (dump_stack+0x20/0x28)
[  188.830000] [<8022d1c0>] (dump_stack) from [<80048bf8>] (___might_sleep+0x174/0x2ac)
[  188.830000] [<80048bf8>] (___might_sleep) from [<80048da0>] (__might_sleep+0x70/0xb0)
[  188.830000] [<80048da0>] (__might_sleep) from [<801106f8>] (kmem_cache_alloc_trace+0x1c8/0x284)
[  188.830000] [<801106f8>] (kmem_cache_alloc_trace) from [<803330e8>] (sbefifo_write_common+0x228/0x4b4)
[  188.830000] [<803330e8>] (sbefifo_write_common) from [<80333740>] (sbefifo_drv_write+0x24/0x28)
[  188.830000] [<80333740>] (sbefifo_drv_write) from [<80333b58>] (occ_write_sbefifo+0x44/0x60)
[  188.830000] [<80333b58>] (occ_write_sbefifo) from [<80334530>] (occ_worker+0x38/0x4a0)
[  188.830000] [<80334530>] (occ_worker) from [<80034a2c>] (process_one_work+0x23c/0x6d4)
[  188.830000] [<80034a2c>] (process_one_work) from [<80034f08>] (worker_thread+0x44/0x528)
[  188.830000] [<80034f08>] (worker_thread) from [<8003c8c0>] (kthread+0x160/0x17c)
[  188.830000] [<8003c8c0>] (kthread) from [<8000a888>] (ret_from_fork+0x14/0x2c)

Avoid the warning (or using GFP_ATOMIC memory) by switching to a mutex, as we
only require mutual exclusion, not pre-emption be disabled (occ_worker() is
executed on a workqueue). This should also reduce the latency impact of calling
into the OCC.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 5b12eec2602b..cc9b9e36ac72 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -67,7 +67,7 @@ struct sbefifo {
 	wait_queue_head_t wait;
 	struct list_head xfrs;
 	struct kref kref;
-	spinlock_t list_lock;		/* lock access to the xfrs list */
+	struct mutex list_lock;		/* lock access to the xfrs list */
 	struct mutex sbefifo_lock;	/* lock access to the hardware */
 	char name[32];
 	int idx;
@@ -399,12 +399,11 @@ static void sbefifo_worker(struct work_struct *work)
 	int ret = 0;
 	u32 sts;
 	int i;
-	unsigned long flags;
 
-	spin_lock_irqsave(&sbefifo->list_lock, flags);
+	mutex_lock(&sbefifo->list_lock);
 	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
 				       xfrs);
-	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+	mutex_unlock(&sbefifo->list_lock);
 	if (!xfr)
 		return;
 
@@ -516,9 +515,9 @@ static void sbefifo_worker(struct work_struct *work)
 
 			set_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags);
 
-			spin_lock_irqsave(&sbefifo->list_lock, flags);
+			mutex_lock(&sbefifo->list_lock);
 			list_del(&xfr->xfrs);
-			spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+			mutex_unlock(&sbefifo->list_lock);
 
 			if (unlikely(test_bit(SBEFIFO_XFR_CANCEL,
 					      &xfr->flags)))
@@ -535,17 +534,17 @@ static void sbefifo_worker(struct work_struct *work)
 		dev_err(&sbefifo->fsi_dev->dev,
 			"Fatal bus access failure: %d\n", ret);
 
-		spin_lock_irqsave(&sbefifo->list_lock, flags);
+		mutex_lock(&sbefifo->list_lock);
 		list_for_each_entry_safe(xfr, tmp, &sbefifo->xfrs, xfrs) {
 			list_del(&xfr->xfrs);
 			kfree(xfr);
 		}
 		INIT_LIST_HEAD(&sbefifo->xfrs);
-		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+		mutex_unlock(&sbefifo->list_lock);
 	} else if (eot) {
-		spin_lock_irqsave(&sbefifo->list_lock, flags);
+		mutex_lock(&sbefifo->list_lock);
 		xfr = sbefifo_next_xfr(sbefifo);
-		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+		mutex_unlock(&sbefifo->list_lock);
 
 		if (xfr) {
 			wake_up_interruptible(&sbefifo->wait);
@@ -715,7 +714,6 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	struct sbefifo_xfr *xfr;
 	ssize_t ret = 0;
 	size_t n;
-	unsigned long flags;
 
 	if ((len >> 2) << 2 != len)
 		return -EINVAL;
@@ -726,26 +724,26 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	sbefifo_get_client(client);
 	n = sbefifo_buf_nbwriteable(&client->wbuf);
 
-	spin_lock_irqsave(&sbefifo->list_lock, flags);
+	mutex_lock(&sbefifo->list_lock);
  
 	/* next xfr to be executed */
 	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
 				       xfrs);
 
 	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
-		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+		mutex_unlock(&sbefifo->list_lock);
 		ret = -EAGAIN;
 		goto out;
 	}
 
 	xfr = sbefifo_enq_xfr(client);		/* this xfr queued up */
 	if (IS_ERR(xfr)) {
-		spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+		mutex_unlock(&sbefifo->list_lock);
 		ret = PTR_ERR(xfr);
 		goto out;
 	}
 
-	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+	mutex_unlock(&sbefifo->list_lock);
 
 	/*
 	 * Partial writes are not really allowed in that EOT is sent exactly
@@ -954,7 +952,7 @@ static int sbefifo_probe(struct device *dev)
 		}
 	}
 
-	spin_lock_init(&sbefifo->list_lock);
+	mutex_init(&sbefifo->list_lock);
 	mutex_init(&sbefifo->sbefifo_lock);
 	kref_init(&sbefifo->kref);
 	init_waitqueue_head(&sbefifo->wait);
@@ -998,11 +996,10 @@ static int sbefifo_remove(struct device *dev)
 {
 	struct sbefifo *sbefifo = dev_get_drvdata(dev);
 	struct sbefifo_xfr *xfr, *tmp;
-	unsigned long flags;
 
 	/* lock the sbefifo so to prevent deleting an ongoing xfr */
 	mutex_lock(&sbefifo->sbefifo_lock);
-	spin_lock_irqsave(&sbefifo->list_lock, flags);
+	mutex_lock(&sbefifo->list_lock);
 
 	WRITE_ONCE(sbefifo->rc, -ENODEV);
 	list_for_each_entry_safe(xfr, tmp, &sbefifo->xfrs, xfrs) {
@@ -1012,7 +1009,7 @@ static int sbefifo_remove(struct device *dev)
 
 	INIT_LIST_HEAD(&sbefifo->xfrs);
 
-	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+	mutex_unlock(&sbefifo->list_lock);
 	mutex_unlock(&sbefifo->sbefifo_lock);
 
 	wake_up_all(&sbefifo->wait);
-- 
2.14.1
