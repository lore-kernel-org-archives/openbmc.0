Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="q3WTz7Hh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aEX+EO7f"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwl50gKdzF1Fl
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:37:04 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C562920E3F;
 Thu, 15 Feb 2018 07:37:02 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=scbyJMamUkWn01u4c
 JMq+azegZS18OIo1s6BbLAg1tg=; b=q3WTz7HhRMWGGpk1FE1UPWeabt0pJ46Nr
 2JuGTILAUziDSO7Hs/A4p6iyH9FZSyVxLOd18+T9bskBsBqjSxwaAfrjwFOzjpbf
 MgaFd5MDZ4/edApToNhyrRFM2tV1zORSUpzFSmSYP7b9+udL1g+nHVdIsqcqRw0X
 nFJurl4EgwWyYW9/oiHKaRRw3i2SZV+vBmVQgHP4M5MAq1FEMX7JheRKi+vF+xkh
 tETL5pe70820+qFMrDyZN+WtOtGsMBX/J+bKgkGXOV932Baet6UvKTKzvfB47dCd
 8M5AIIzZB7ve7mrm4d/lWnbP0ATilFw95XR2a3gfeBJs09wn8cCew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=scbyJMamUkWn01u4cJMq+azegZS18OIo1s6BbLAg1tg=; b=aEX+EO7f
 6b8AAHanJIOaPAKVUtbWnLoxqjs7M6Fc3EiOHOGF4zP4F4uRtfqOhy1lqDaveDqg
 GSu3l8OU0N3SrwvAeUcSuYz2v5m9nGD32F3vuqkdV2Ypd7bTH7vvVvct5sFKMMnA
 Fn8tqSlIBlufeTj6m2jnOoEVd+UCitCAhbmZmWsrres5HQkhq2tybuPwPOIB+HTv
 RFeDTRezp5pO33wsrsVL58x6pxUM0g282ucFIkp5IJE2p02WCvFLe9qpX0bvf3iR
 dCiHnXMFzDnIEPrrcT6MpA2P2A/vlYNWg9YTcL0tkiaQrOgf9GvdHRARLysiGryM
 vlXK7jC3tpLWkA==
X-ME-Sender: <xms:7n6FWta_TdmtesK1RAGa5PT0mm9vaXN6bR-GoFLO5WhzXfqMndGZeQ>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 097457E1DE;
 Thu, 15 Feb 2018 07:36:59 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.10 10/16] fsi: sbefifo: Switch to mutex in work
 function
Date: Thu, 15 Feb 2018 23:06:00 +1030
Message-Id: <20180215123606.25777-11-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180215123606.25777-1-andrew@aj.id.au>
References: <20180215123606.25777-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:37:07 -0000

From: Eddie James <eajames@linux.vnet.ibm.com>

Use a mutex instead of a spinlock to improve system latency while waiting on
FSI operations. This enables similar changes to be done down the stack in the
FSI core.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
[arj: Rework the commit message]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 45 +++++++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index e4b35b7ec83b..7b3c7a22b4a2 100644
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
@@ -66,7 +67,8 @@ struct sbefifo {
 	wait_queue_head_t wait;
 	struct list_head xfrs;
 	struct kref kref;
-	spinlock_t lock;
+	spinlock_t list_lock;		/* lock access to the xfrs list */
+	struct mutex sbefifo_lock;	/* lock access to the hardware */
 	char name[32];
 	int idx;
 	int rc;
@@ -397,12 +399,16 @@ static void sbefifo_worker(struct work_struct *work)
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
 
 	trace_sbefifo_begin_xfer(xfr);
 
@@ -509,7 +515,11 @@ static void sbefifo_worker(struct work_struct *work)
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
@@ -524,14 +534,19 @@ static void sbefifo_worker(struct work_struct *work)
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
@@ -542,7 +557,7 @@ static void sbefifo_worker(struct work_struct *work)
 	wake_up_interruptible(&sbefifo->wait);
 
 out_unlock:
-	spin_unlock(&sbefifo->lock);
+	mutex_unlock(&sbefifo->sbefifo_lock);
 }
 
 static int sbefifo_open(struct inode *inode, struct file *file)
@@ -702,6 +717,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	struct sbefifo_xfr *xfr;
 	ssize_t ret = 0;
 	size_t n;
+	unsigned long flags;
 
 	if ((len >> 2) << 2 != len)
 		return -EINVAL;
@@ -712,26 +728,26 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	sbefifo_get_client(client);
 	n = sbefifo_buf_nbwriteable(&client->wbuf);
 
-	spin_lock_irq(&sbefifo->lock);
+	spin_lock_irqsave(&sbefifo->list_lock, flags);
  
 	/* next xfr to be executed */
 	xfr = list_first_entry_or_null(&sbefifo->xfrs, struct sbefifo_xfr,
 				       xfrs);
 
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
@@ -942,7 +958,8 @@ static int sbefifo_probe(struct device *dev)
 		}
 	}
 
-	spin_lock_init(&sbefifo->lock);
+	spin_lock_init(&sbefifo->list_lock);
+	mutex_init(&sbefifo->sbefifo_lock);
 	kref_init(&sbefifo->kref);
 	init_waitqueue_head(&sbefifo->wait);
 	INIT_LIST_HEAD(&sbefifo->xfrs);
@@ -985,8 +1002,11 @@ static int sbefifo_remove(struct device *dev)
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
@@ -996,7 +1016,8 @@ static int sbefifo_remove(struct device *dev)
 
 	INIT_LIST_HEAD(&sbefifo->xfrs);
 
-	spin_unlock(&sbefifo->lock);
+	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+	mutex_unlock(&sbefifo->sbefifo_lock);
 
 	wake_up_all(&sbefifo->wait);
 
-- 
2.14.1
