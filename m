Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="wt0YPLzv"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HCJPsPk8"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ygvnL61wHzDrTt
 for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2017 16:50:14 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 479BA20D39;
 Tue, 21 Nov 2017 00:50:11 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Tue, 21 Nov 2017 00:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wlVi2x6uw4LHY8HJM
 zsETlrHFlYaweeNJAhZ9dWBEDw=; b=wt0YPLzvZ/WrwOXYZuuAlZ5lhKnNJxrw5
 T56NbcUmb+SJLPtZGg5Tw76EqMeOL2YaUz0i6KUfDodSLRNLZJ9/R72HLIpXpmcU
 GkWoUJz6+QQJeX2Hdh3bFg9mmU9inZap6QQqUsXGev7f34I2gWDEkHbSSxhEwVol
 EEsDE6zI1Zph4P8CIJH8yG1ePP0OaIrKGYvbH3gAhEcC+auAvaAx9f+sNECqkZWX
 P5GT+sCqT8Um1a3/Wruz8kBpFZkGNQElfj/U8FQwGA+gX05v7WZfzenayncoViKD
 kDeb1EzSZLM/QngTGdlEL5CGlmYIytl5MRuPjJZdiADw4HLi8hIGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wlVi2x6uw4LHY8HJM
 zsETlrHFlYaweeNJAhZ9dWBEDw=; b=HCJPsPk8YPU7C1Hkl2JNkxaUJSLkSW4Pe
 a3PNo6CZcP8FKODKK0CJQEThksNeQPBrge5MQyPlFBA9XQq0meJnlHG7LaRD46GP
 2qAMNY6dThko93QfRe6zrUebV/eWFvdMMN+8m2IgweaQTRqbPgBGicWoJlSIw1rH
 voEg1ELBT6k+edmQUQ7dhyHLW9kBPGN8jeyVkfvCtWO8QYeqY+tsXOkd5nmI0gZq
 a1xGDhQ985ir9lhuX/6gkvJe8s1iT/NstR+2ci5ji7J8MxGHHwUlcSsruq1W9mKD
 AjdY6Twn8mqqSPr/YLxTOxOLAh0hPmczsSWCZbLKXA9jEfYmnxaLQ==
X-ME-Sender: <xms:k74TWjYw5FNk9cvRA_qP2UTw9Ll1GVgO_jhyTjChv7sJxem22pF50Q>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20A9424254;
 Tue, 21 Nov 2017 00:50:09 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [RFC PATCH] net/ncsi: Reset state if no channels are available
Date: Tue, 21 Nov 2017 16:50:03 +1100
Message-Id: <20171121055003.22039-1-sam@mendozajonas.com>
X-Mailer: git-send-email 2.15.0
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
X-List-Received-Date: Tue, 21 Nov 2017 05:50:16 -0000

A number of times a machine has been found in a state where the NCSI
interface never comes up because no channels are available. Once this
state is reached however it is impossible to leave it as the NCSI driver
never re-checks link or topology.
If this state is recognised reset the driver to a pre-probed state so
next time ncsi_start_dev() is called it will interrogate the remote NCSI
interface again.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
This is RFC at the moment mostly due to difficulty testing - this is
specifically aimed at BMCs that fail to bring network up, eg:

[   35.960000] ftgmac100 1e660000.ethernet eth0: NCSI: No channel found with link
[   35.970000] ftgmac100 1e660000.ethernet eth0: NCSI interface down

We don't have a solid way to recreate that problem, however
ncsi_reset_dev() which this implements only triggers in the odd case
where we have no channels. I'll continue to try and recreate with this
patch.

 include/net/ncsi.h     |  5 +++++
 net/ncsi/ncsi-manage.c | 39 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/include/net/ncsi.h b/include/net/ncsi.h
index fbefe80361ee..33ac21008680 100644
--- a/include/net/ncsi.h
+++ b/include/net/ncsi.h
@@ -34,6 +34,7 @@ int ncsi_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid);
 struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 				   void (*notifier)(struct ncsi_dev *nd));
 int ncsi_start_dev(struct ncsi_dev *nd);
+void ncsi_reset_dev(struct ncsi_dev *nd);
 void ncsi_stop_dev(struct ncsi_dev *nd);
 void ncsi_unregister_dev(struct ncsi_dev *nd);
 #else /* !CONFIG_NET_NCSI */
@@ -58,6 +59,10 @@ static inline int ncsi_start_dev(struct ncsi_dev *nd)
 	return -ENOTTY;
 }
 
+static void ncsi_reset_dev(struct ncsi_dev *nd)
+{
+}
+
 static void ncsi_stop_dev(struct ncsi_dev *nd)
 {
 }
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 0fcf5f3fa9f9..df227a1a9b48 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -356,6 +356,9 @@ static void ncsi_remove_channel(struct ncsi_channel *nc)
 	}
 
 	nc->state = NCSI_CHANNEL_INACTIVE;
+	/* Make sure this channel is not in the channel queue */
+	if (!list_empty(&nc->link))
+		list_del_init(&nc->link);
 	spin_unlock_irqrestore(&nc->lock, flags);
 	ncsi_stop_channel_monitor(nc);
 
@@ -984,11 +987,18 @@ static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 	hot_nc = ndp->hot_channel;
 	spin_unlock_irqrestore(&ndp->lock, flags);
 
+	if (ndp->package_num == 0)
+		netdev_warn(ndp->ndev.dev, "NCSI: No available packages!\n");
+
 	/* The search is done once an inactive channel with up
 	 * link is found.
 	 */
 	found = NULL;
 	NCSI_FOR_EACH_PACKAGE(ndp, np) {
+		if (np->channel_num == 0)
+			netdev_warn(ndp->ndev.dev,
+				    "NCSI: Package %u has no available channels!\n",
+				    np->id);
 		NCSI_FOR_EACH_CHANNEL(np, nc) {
 			spin_lock_irqsave(&nc->lock, flags);
 
@@ -1016,9 +1026,13 @@ static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 	}
 
 	if (!found) {
-		netdev_warn(ndp->ndev.dev,
-			    "NCSI: No channel found with link\n");
-		ncsi_report_link(ndp, true);
+		/* No free channels were found. NCSI can't do anything right
+		 * now, but switch off NCSI_DEV_PROBED in case we haven't found
+		 * any channels yet - NCSI will re-probe the NCSI topology next
+		 * time the interface is brought up
+		 */
+		netdev_warn(ndp->ndev.dev, "NCSI: No free channels found!\n");
+		ncsi_reset_dev(&ndp->ndev);
 		return -ENODEV;
 	}
 
@@ -1666,6 +1680,25 @@ void ncsi_stop_dev(struct ncsi_dev *nd)
 }
 EXPORT_SYMBOL_GPL(ncsi_stop_dev);
 
+/* Drop all packages and channels and reset NCSI to a pre-probed state */
+void ncsi_reset_dev(struct ncsi_dev *nd)
+{
+	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
+	struct ncsi_package *np, *tmp;
+	unsigned long flags;
+
+	cancel_work_sync(&ndp->work);
+	ncsi_stop_dev(nd);
+
+	list_for_each_entry_safe(np, tmp, &ndp->packages, node)
+		ncsi_remove_package(np);
+
+	spin_lock_irqsave(&ndp->lock, flags);
+	ndp->flags &= !NCSI_DEV_PROBED;
+	spin_unlock_irqrestore(&ndp->lock, flags);
+}
+EXPORT_SYMBOL_GPL(ncsi_reset_dev);
+
 void ncsi_unregister_dev(struct ncsi_dev *nd)
 {
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
-- 
2.15.0
