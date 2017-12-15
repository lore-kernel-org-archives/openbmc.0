Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="JXlxJxsZ"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ngkc7pVs"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yydvt0hQlzDrcm
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 16:16:56 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 833B220B71;
 Fri, 15 Dec 2017 00:16:54 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Fri, 15 Dec 2017 00:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=59almjkkCgieyeYdk
 Kehv9P+N7Oao62qCi/V56dvmAo=; b=JXlxJxsZZ0Clo4W2hhBFA4VWURM0YPZMY
 lOad7+pMEPiOF9vvCb9WrakjaUBv0eFkyAPJre0B1IJe0Vt6G34iV+HoQH1bGiF/
 6Qr9BR95lAcDKSqnU77JPpLPeugzqHtzZw2/+gxe3TMadHoCL2PHxxw/0uI4LLN+
 7bhhk+plAy4npvfJ/NAHdTZr3P9LVgRGZddZZH8IM4upUD6PDf6CoVDqZp2TIwhv
 Ct+8gyeGkTjDWjlxrHDw7M3fUYBBCXGHske+oGaJcSYdapqoFmWgU1th3qrzTDya
 3BJ4xjZsfJjpVVO2pFjAB6gr2kEiWpcmtjyLrizlSBH7u/ODkBI0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=59almjkkCgieyeYdk
 Kehv9P+N7Oao62qCi/V56dvmAo=; b=Ngkc7pVsk2WVm/0AF2LCUw+WbNGRJTcR/
 sAfQuaQ48C5gyx8YLMlaQV3nVDAp3GqRffR+2oehjiNnKOM5qHEgWOvVE/CUCRdl
 mmtzMXULtbKmYDnaFQb2vMuqJ6H+yTwcG3EiXupU1U1MYofvp1xTYVn3nZgdddYV
 WIR+WyPhV1up9TxxzENPLKEqiEh4PiJtapI0cA1TH/VYXaIaGKniRCunqkBDuhvI
 zEsqSIMVI1suRvcpDLIcPie9yDZ6+0a0bPc6t3tJ80z86Lv+z3Bu8py3CLERAetU
 IkJzvLk4v5BYWsasDccdk/m0ZzNUPkmuVGZCjyLfirU5IuFeEZJWQ==
X-ME-Sender: <xms:xlozWgKBs_K_P8Sq70IC4iYYg02TITgvUFKIvngB3iB-h11IrxDMdQ>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id B22E37E2DA;
 Fri, 15 Dec 2017 00:16:52 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: netdev@vger.kernel.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH net-next] net/ncsi: Don't take any action on HNCDSC AEN
Date: Fri, 15 Dec 2017 16:16:40 +1100
Message-Id: <20171215051640.10926-1-sam@mendozajonas.com>
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
X-List-Received-Date: Fri, 15 Dec 2017 05:16:59 -0000

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
