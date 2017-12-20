Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="rgFkIijl"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="d/3aQoBi"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1fj06nVNzF07Q
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 14:03:00 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id D1A6E20701
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 22:02:57 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Tue, 19 Dec 2017 22:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=date:from:message-id:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=/vdFq+3Y29hV7edgllEXLZ9g4Djzq
 DE2f5c/ObAzPtI=; b=rgFkIijleaInsjg8/LwU2XrhQzXkcWyg7mVEvmw5rGyc9
 SOEZDntdLMvZ7pM9ozEcZjBVCILNaMxtr1Rx/G5OI6M7PBp77jzS7A129JdFvIU5
 GktslZBln2pRSg2We5XOZk82QZdBEnA8YwaS6MZJKXBqvTc0+yDYedmf8oMOzpdz
 twJy5w1cFJBSUwwIfKb6UtI6QR6tVayfWj6lXY0NvU3OInsqcFN6QraIaSsbNTKy
 Sz2Ve9MpYq9qapu+z0J1C/mXVHk3QoH640416p1qMf56w+dAtli2mhp/znGlmo4W
 hlsXpIQVrJL28Biihjd4B4kf9B1Je2dUMdmKT0P9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/vdFq+3Y29hV7edgl
 lEXLZ9g4DjzqDE2f5c/ObAzPtI=; b=d/3aQoBiQq4YFH02Z9iVVmiITQmnhZ3wk
 Zd5bq3HO5+O9IcysuiCnRxAuK2SzMNbMszqzOUKjBpUs9rwXe0052yXmW5Oic9b+
 re7CueaLfre3/EOkP7L6+XsACGuy2CSTQhfHursxfa8TsP7tyU1nn7NvJy4u92ee
 CO/8TIK3C8PIaUHTNgR7WhAO7pDD45qTc/1bxlEcclVJE1V8TTIrS8ZSPwTLBC41
 jrFjLM8lDVXmyF6qazhYZRa5+jcZ+YKW3rCfL03wTYHyywng1307tpTS9BJCwuz6
 sJlUB9wE2haftW/xWjlr9K6jDYHabNZjS79jNthsAVVpMPdexgSlg==
X-ME-Sender: <xms:4dI5Wg0ziYYGgunjlapomd_QvbccKO6F571oyMuXx9rJ1D_p9zKOlg>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id E74DD7E2F4
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 22:02:56 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13] net/ncsi: Don't take any action on HNCDSC AEN
Date: Wed, 20 Dec 2017 14:02:51 +1100
Message-Id: <20171220030251.19337-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.15.1
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
X-List-Received-Date: Wed, 20 Dec 2017 03:03:02 -0000

The current HNCDSC handler takes the status flag from the AEN packet and
will update or change the current channel based on this flag and the
current channel status.

However the flag from the HNCDSC packet merely represents the host link
state. While the state of the host interface is potentially interesting
information it should not affect the state of the NCSI link. Indeed the
NCSI specification makes no mention of any recommended action related to
the host network controller driver state.

Update the HNCDSC handler to record the host network driver status but
take no other action.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Acked-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
(cherry picked from commit 75e8e15635e08f2598ecd20f4f71f4d043dd6e68)
---
 net/ncsi/ncsi-aen.c | 35 +++--------------------------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index 67e708e98ccf..e7b05de1e6d1 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -143,43 +143,14 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
 	if (!nc)
 		return -ENODEV;
 
-	/* If the channel is active one, we need reconfigure it */
 	spin_lock_irqsave(&nc->lock, flags);
 	ncm = &nc->modes[NCSI_MODE_LINK];
 	hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
 	ncm->data[3] = ntohl(hncdsc->status);
-	netdev_info(ndp->ndev.dev, "NCSI: HNCDSC AEN - channel %u state %s\n",
-		    nc->id, ncm->data[3] & 0x3 ? "up" : "down");
-	if (!list_empty(&nc->link) ||
-	    nc->state != NCSI_CHANNEL_ACTIVE) {
-		spin_unlock_irqrestore(&nc->lock, flags);
-		return 0;
-	}
-
-	spin_unlock_irqrestore(&nc->lock, flags);
-	if (!(ndp->flags & NCSI_DEV_HWA) && !(ncm->data[3] & 0x1))
-		ndp->flags |= NCSI_DEV_RESHUFFLE;
-
-	/* If this channel is the active one and the link doesn't
-	 * work, we have to choose another channel to be active one.
-	 * The logic here is exactly similar to what we do when link
-	 * is down on the active channel.
-	 *
-	 * On the other hand, we need configure it when host driver
-	 * state on the active channel becomes ready.
-	 */
-	ncsi_stop_channel_monitor(nc);
-
-	spin_lock_irqsave(&nc->lock, flags);
-	nc->state = (ncm->data[3] & 0x1) ? NCSI_CHANNEL_INACTIVE :
-					   NCSI_CHANNEL_ACTIVE;
 	spin_unlock_irqrestore(&nc->lock, flags);
-
-	spin_lock_irqsave(&ndp->lock, flags);
-	list_add_tail_rcu(&nc->link, &ndp->channel_queue);
-	spin_unlock_irqrestore(&ndp->lock, flags);
-
-	ncsi_process_next_channel(ndp);
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev,
+		      "NCSI: host driver %srunning on channel %u\n",
+		      ncm->data[3] & 0x1 ? "" : "not ", nc->id);
 
 	return 0;
 }
-- 
2.15.1
