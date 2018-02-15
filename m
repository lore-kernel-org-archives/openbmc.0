Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fewb+Pt9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iflN7715"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhwlC6vnCzF124
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 23:37:10 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D060020E1C;
 Thu, 15 Feb 2018 07:37:08 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 15 Feb 2018 07:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UF/zwpWN4C4QbZR6e
 56SyVIzWue/W5ZO0LGjp39+umo=; b=fewb+Pt9tqNX78+nRaABwBgPg3NKMurmD
 fT1zV1jda41/VWmglSJ45VJLK5fX1FbyHXA0R++J3lD+T6Q3T3WDJArdFTtgHUYF
 MNa4Edt3EE7E4I6ahnkcIkdOZYWa/4/kHfktYOUvedH9f5luyxnHObuzHkIH9Qyo
 aBz4nhQYT2g4SZ6lYx5ps/uOkOyV5kuMIyDPYIim3OHm4zoP9pWbdxmlpmDrhLcF
 IVPwZyRDlUrnamzE/WHzErNKlc1SdIjIawALivIRAQbGNKAlJ5OIamX/Xr/WxveW
 KkevB2ZRGu37rDNj/5T/aoydAmTdc+n4XLZRUgcNcT7JLIWMl0FfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=UF/zwpWN4C4QbZR6e56SyVIzWue/W5ZO0LGjp39+umo=; b=iflN7715
 +510vHwyue0Qk7cAzFP9TtToemmY0AaeGw4eK1acFzxitExliVYQOh3ah1Hh95V+
 B/jX9ff1fmkl5pr+Y3AMTUEX/pcm5voQlTlChJYv63Ru0WbXU4AsMoF+eYV80fH8
 /EQmmOlXh0NM8b/oyKdZShvptBKWb+pwrtmZd4zZQNpv+1PoMqZdDqlgxcJiTAmP
 pl1l/+Ph1fmQ+70pHARZ/MQMEeHbEKwyiOT/XYwtTAqGK8Sxjgphbdhnrx98kaGK
 KhzYNmAA71qabtEQ6sEFSHUaM+BPooDgNe/CNa6yB+ePs/wYm9RYb3eKHI17BXBI
 IBD/idGblhbbgg==
X-ME-Sender: <xms:9H6FWu8rtUc23B_0NmmmlB8PbXpM1MCVqyPDbvdDXhhS9gepotYOnQ>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6666A7E1DE;
 Thu, 15 Feb 2018 07:37:06 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 12/16] drivers: fsi: occ: switch to irqsave and
 irqrestore
Date: Thu, 15 Feb 2018 23:06:02 +1030
Message-Id: <20180215123606.25777-13-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 15 Feb 2018 12:37:12 -0000

From: Eddie James <eajames@linux.vnet.ibm.com>

Fix spinlocking by storing the interrupt state and restoring that state
when unlocking, instead of blindly disabling and re-enabling all irqs.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/fsi/occ.c | 44 +++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index 2313b6235ba3..3dacc1277680 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -121,18 +121,19 @@ static DEFINE_IDA(occ_ida);
 static int occ_enqueue_xfr(struct occ_xfr *xfr)
 {
 	int empty;
+	unsigned long flags;
 	struct occ_client *client = to_client(xfr);
 	struct occ *occ = client->occ;
 
 	if (occ->cancel)
 		return -ENODEV;
 
-	spin_lock_irq(&occ->list_lock);
+	spin_lock_irqsave(&occ->list_lock, flags);
 
 	empty = list_empty(&occ->xfrs);
 	list_add_tail(&xfr->link, &occ->xfrs);
 
-	spin_unlock_irq(&occ->list_lock);
+	spin_unlock_irqrestore(&occ->list_lock, flags);
 
 	trace_occ_enq_xfer(client, xfr);
 
@@ -206,6 +207,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 	size_t bytes;
 	struct occ_xfr *xfr;
 	struct occ *occ;
+	unsigned long flags;
 
 	if (!client)
 		return -ENODEV;
@@ -217,7 +219,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 	xfr = &client->xfr;
 	occ = client->occ;
 
-	spin_lock_irq(&client->lock);
+	spin_lock_irqsave(&client->lock, flags);
 
 	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
 		/* we just finished reading all data, return 0 */
@@ -237,12 +239,12 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 			goto done;
 		}
 
-		spin_unlock_irq(&client->lock);
+		spin_unlock_irqrestore(&client->lock, flags);
 
 		rc = wait_event_interruptible(client->wait,
 					      occ_read_ready(xfr, occ));
 
-		spin_lock_irq(&client->lock);
+		spin_lock_irqsave(&client->lock, flags);
 
 		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
 			if (occ->cancel || test_bit(XFR_CANCELED, &xfr->flags))
@@ -279,7 +281,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
 	rc = bytes;
 
 done:
-	spin_unlock_irq(&client->lock);
+	spin_unlock_irqrestore(&client->lock, flags);
 	trace_occ_read_complete(client, xfr);
 	occ_put_client(client);
 	return rc;
@@ -299,6 +301,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 {
 	int rc;
 	unsigned int i;
+	unsigned long flags;
 	u16 data_length, checksum = 0;
 	struct occ_xfr *xfr;
 
@@ -312,7 +315,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 	xfr = &client->xfr;
 
 	trace_occ_write_begin(client, xfr);
-	spin_lock_irq(&client->lock);
+	spin_lock_irqsave(&client->lock, flags);
 
 	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
 		rc = -EBUSY;
@@ -360,7 +363,7 @@ static ssize_t occ_write_common(struct occ_client *client,
 	rc = len;
 
 done:
-	spin_unlock_irq(&client->lock);
+	spin_unlock_irqrestore(&client->lock, flags);
 	occ_put_client(client);
 	return rc;
 }
@@ -377,6 +380,7 @@ static int occ_release_common(struct occ_client *client)
 {
 	struct occ *occ;
 	struct occ_xfr *xfr;
+	unsigned long flags;
 
 	if (!client)
 		return -ENODEV;
@@ -384,13 +388,13 @@ static int occ_release_common(struct occ_client *client)
 	xfr = &client->xfr;
 	occ = client->occ;
 
-	spin_lock_irq(&client->lock);
+	spin_lock_irqsave(&client->lock, flags);
 
 	set_bit(XFR_CANCELED, &xfr->flags);
 	if (!test_bit(CLIENT_XFR_PENDING, &client->flags))
 		goto done;
 
-	spin_lock_irq(&occ->list_lock);
+	spin_lock(&occ->list_lock);
 
 	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
 		/* already deleted from list if complete */
@@ -398,12 +402,12 @@ static int occ_release_common(struct occ_client *client)
 			list_del(&xfr->link);
 	}
 
-	spin_unlock_irq(&occ->list_lock);
+	spin_unlock(&occ->list_lock);
 
 	wake_up_all(&client->wait);
 
 done:
-	spin_unlock_irq(&client->lock);
+	spin_unlock_irqrestore(&client->lock, flags);
 
 	occ_put_client(client);
 	return 0;
@@ -613,6 +617,7 @@ static void occ_worker(struct work_struct *work)
 {
 	int rc = 0, empty;
 	u16 resp_data_length;
+	unsigned long flags;
 	unsigned long start;
 	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
 	const long int wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
@@ -626,11 +631,11 @@ static void occ_worker(struct work_struct *work)
 	if (occ->cancel)
 		return;
 
-	spin_lock_irq(&occ->list_lock);
+	spin_lock_irqsave(&occ->list_lock, flags);
 
 	xfr = list_first_entry_or_null(&occ->xfrs, struct occ_xfr, link);
 	if (!xfr) {
-		spin_unlock_irq(&occ->list_lock);
+		spin_unlock_irqrestore(&occ->list_lock, flags);
 		return;
 	}
 
@@ -639,7 +644,7 @@ static void occ_worker(struct work_struct *work)
 	resp = (struct occ_response *)xfr->buf;
 	set_bit(XFR_IN_PROGRESS, &xfr->flags);
 
-	spin_unlock_irq(&occ->list_lock);
+	spin_unlock_irqrestore(&occ->list_lock, flags);
 	trace_occ_worker_xfer_begin(client, xfr);
 	mutex_lock(&occ->occ_lock);
 
@@ -694,13 +699,13 @@ static void occ_worker(struct work_struct *work)
 	xfr->rc = rc;
 	set_bit(XFR_COMPLETE, &xfr->flags);
 
-	spin_lock_irq(&occ->list_lock);
+	spin_lock_irqsave(&occ->list_lock, flags);
 
 	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
 	list_del(&xfr->link);
 	empty = list_empty(&occ->xfrs);
 
-	spin_unlock_irq(&occ->list_lock);
+	spin_unlock_irqrestore(&occ->list_lock, flags);
 
 	wake_up_interruptible(&client->wait);
 	trace_occ_worker_xfer_complete(client, xfr);
@@ -819,15 +824,16 @@ static int occ_remove(struct platform_device *pdev)
 	struct occ *occ = platform_get_drvdata(pdev);
 	struct occ_xfr *xfr;
 	struct occ_client *client;
+	unsigned long flags;
 
 	occ->cancel = true;
 
-	spin_lock_irq(&occ->list_lock);
+	spin_lock_irqsave(&occ->list_lock, flags);
 	list_for_each_entry(xfr, &occ->xfrs, link) {
 		client = to_client(xfr);
 		wake_up_all(&client->wait);
 	}
-	spin_unlock_irq(&occ->list_lock);
+	spin_unlock_irqrestore(&occ->list_lock, flags);
 
 	misc_deregister(&occ->mdev);
 	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
-- 
2.14.1
