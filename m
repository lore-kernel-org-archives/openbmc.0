Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WHybv31l"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FL+y/R8S"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnTD240BzF0WY
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:20:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 529D220DCD;
 Mon, 19 Feb 2018 23:19:58 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=k8l+k8ziehxBpx7+P
 pqVzPInVsZIM0taToo3QxJgcp8=; b=WHybv31lUZHQQw0wpOLtmWf8Tchu44gq+
 llPq344qtNFJKyQ3JfZ1VUwuUxiOQILCWRxG9F3nFoYAwrYqS5h6c+e1EYvga8hz
 +Bet7OYuZkPyPPJD9ygsKJUJfLq+Fa+f/6hzUsoX0QuJ3LtAAKQvrir4bM7kJBJ5
 /4KbF+AyZQYXdPUEnwDewR4qmd3ab2yDUG/RGkShadWwAkCTdCA8wUTY8kO98HHN
 6uG8JAkLF3VQZqxiCtCFeRnPiU3oN+FnZNGmqqwz7RLGgwllhF8LIf7hvA+7iSfh
 rHbifj3WUMS0Y8wBIWs/OKzzzq+hC+tdIHDcDonaycPH8NC4SG54Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=k8l+k8ziehxBpx7+PpqVzPInVsZIM0taToo3QxJgcp8=; b=FL+y/R8S
 prtfkbk2Dy/Q0TsMeYXmLP2U1Imxv8FbeECI/w8NSlAHn15FqAqfWHYdg2nMTZzN
 dqVj/I5N89OlQAdB6+ONlXeXDvj/dLIMTAsBIzKZ2s1+VyMfxc2YvMp36uDDdJTp
 I0GX00WZsGqreyjw5IYkM4sbzayDsHOm8lEQwt67tY8Vd3AL8+LZ2SWglY8bYahU
 WPSko/Ma/G3t6geVC9FQmTW4RHTCXUgPsZXtmPxY1GryALRIVoc7FN+tJRPiMEwj
 h5Ru6KWlwCtIMq+RBLbX9sEJsnJZ1V3BebIeWUnbY1lMi3ivmZhnMNrP3MuQLSrU
 K37dhlKbp3Gtag==
X-ME-Sender: <xms:7qGLWiDVb1NUl1_uh_pi3l_OjfiBtVCFJmsG30HySPlNftJPXxQsRA>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8C8FD7E0DA;
 Mon, 19 Feb 2018 23:19:55 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.13 13/16] fsi: sbefifo: Switch to mutex in work
 function
Date: Tue, 20 Feb 2018 14:48:41 +1030
Message-Id: <20180220041844.13228-14-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 20 Feb 2018 04:20:00 -0000

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
index 645ae00cc6ac..5b12eec2602b 100644
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
@@ -700,6 +715,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	struct sbefifo_xfr *xfr;
 	ssize_t ret = 0;
 	size_t n;
+	unsigned long flags;
 
 	if ((len >> 2) << 2 != len)
 		return -EINVAL;
@@ -710,26 +726,26 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
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
@@ -938,7 +954,8 @@ static int sbefifo_probe(struct device *dev)
 		}
 	}
 
-	spin_lock_init(&sbefifo->lock);
+	spin_lock_init(&sbefifo->list_lock);
+	mutex_init(&sbefifo->sbefifo_lock);
 	kref_init(&sbefifo->kref);
 	init_waitqueue_head(&sbefifo->wait);
 	INIT_LIST_HEAD(&sbefifo->xfrs);
@@ -981,8 +998,11 @@ static int sbefifo_remove(struct device *dev)
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
@@ -992,7 +1012,8 @@ static int sbefifo_remove(struct device *dev)
 
 	INIT_LIST_HEAD(&sbefifo->xfrs);
 
-	spin_unlock(&sbefifo->lock);
+	spin_unlock_irqrestore(&sbefifo->list_lock, flags);
+	mutex_unlock(&sbefifo->sbefifo_lock);
 
 	wake_up_all(&sbefifo->wait);
 
-- 
2.14.1
