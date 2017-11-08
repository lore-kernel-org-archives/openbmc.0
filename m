Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="HZoRymHi"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lqldu/Ns"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWnQX1kH8zDq78
 for <openbmc@lists.ozlabs.org>; Wed,  8 Nov 2017 11:35:47 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 66F5F20E45;
 Tue,  7 Nov 2017 19:35:45 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Tue, 07 Nov 2017 19:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GL8qEbh/O7jPpDMQz2J+z5J3HGYtaUhzXfoEl0HFAZQ=; b=HZoRymHi
 nBHSMAS5k93YJMU4M3jmzMDebEFHMtzfxl4w7y5ZhMXeGVaE1U9rHdYzunK9BBhU
 +sQ6O6RvL5Pz7LIjKg0t3FUiLzhhKRLsY/sJnAdBh7tsJk9pD52ZtiE4A29PM60H
 UMnHUqkZKwDriMcvq6oIyeFpKqgkx5iYrtUN0aoklsUYmi1N55KJoQYhVSGQGvrP
 5Vk897ol+6GuYXtho6fPCDLGCVOKNHlC2xXKHU16kKaevV3BSwMk0UVIhtWyZKMX
 0fWwEKR2nqvERaHpKI0HbsuPwWRMDIpUivpc5tKAbggngAk2lx1hTMvszO9wPPfa
 p6JovghRY1TW4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=GL8qEbh/O7jPpDMQz2J+z5J3HGYtaUhzXfoEl0HFAZQ=; b=lqldu/Ns
 tmQdh/5cAyUz2b+QFTM5PqOYUcvQIhLxu1rX3IJKiZncbDDwd8lAjY6rVoQzNK47
 kwbNcKGAryfD9IkXbzCBuYwGE8NVIx+BeTiQts4hyAACbBdwUly1AHlvcSrpZiEP
 x2o88DOvT/riM8KaHxsx00lmX6tkRix9yQ4k7iWU8fRqNRdJKbwdRPRa+h5AN6fL
 oUJ9wVgJYFjCoTlHR8L8rfEW5UJPjE6aX+lzINkQoE55mGKsa5h6xDT2ltF03Pm5
 YYWFLe5cBSx158EfKeSqXlk2ZzAqOEUjbzlovLwmpVHq7LQmX5/F+ONifWVwAr/i
 mTRcGaIj4Ox/1Q==
X-ME-Sender: <xms:YVECWvyntLjBLhzCJaN9UdaozJMuFXQ98i_Eznf6lql1rtKSxfqK3g>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4EBCC242CF;
 Tue,  7 Nov 2017 19:35:44 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH v2 1/2] net/ncsi: General state debugging
Date: Wed,  8 Nov 2017 11:35:32 +1100
Message-Id: <20171108003533.13248-2-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171108003533.13248-1-sam@mendozajonas.com>
References: <20171108003533.13248-1-sam@mendozajonas.com>
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
X-List-Received-Date: Wed, 08 Nov 2017 00:35:49 -0000

While relatively noisy this helps to debug NCSI state transitions and
the state of channels beyond the existing "down" or "up" messages that
the driver currently has.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/ncsi-aen.c    | 15 ++++++++++++++-
 net/ncsi/ncsi-manage.c | 52 +++++++++++++++++++++++++++++++++++++++++++-------
 net/ncsi/ncsi-rsp.c    | 10 +++++++++-
 3 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index f135938bf781..67e708e98ccf 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -73,6 +73,9 @@ static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
 	ncm->data[2] = data;
 	ncm->data[4] = ntohl(lsc->oem_status);
 
+	netdev_info(ndp->ndev.dev, "NCSI: LSC AEN - channel %u state %s\n",
+		    nc->id, data & 0x1 ? "up" : "down");
+
 	chained = !list_empty(&nc->link);
 	state = nc->state;
 	spin_unlock_irqrestore(&nc->lock, flags);
@@ -145,6 +148,8 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
 	ncm = &nc->modes[NCSI_MODE_LINK];
 	hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
 	ncm->data[3] = ntohl(hncdsc->status);
+	netdev_info(ndp->ndev.dev, "NCSI: HNCDSC AEN - channel %u state %s\n",
+		    nc->id, ncm->data[3] & 0x3 ? "up" : "down");
 	if (!list_empty(&nc->link) ||
 	    nc->state != NCSI_CHANNEL_ACTIVE) {
 		spin_unlock_irqrestore(&nc->lock, flags);
@@ -212,10 +217,18 @@ int ncsi_aen_handler(struct ncsi_dev_priv *ndp, struct sk_buff *skb)
 	}
 
 	ret = ncsi_validate_aen_pkt(h, nah->payload);
-	if (ret)
+	if (ret) {
+		netdev_warn(ndp->ndev.dev,
+			    "NCSI: 'bad' packet ignored for AEN type 0x%x\n",
+			    h->type);
 		goto out;
+	}
 
 	ret = nah->handler(ndp, h);
+	if (ret)
+		netdev_err(ndp->ndev.dev,
+			   "NCSI: Handler for AEN type 0x%x returned %d\n",
+			   h->type, ret);
 out:
 	consume_skb(skb);
 	return ret;
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 8cae2f233272..97b76f26bde7 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -226,6 +226,8 @@ static void ncsi_channel_monitor(unsigned long data)
 	case NCSI_CHANNEL_MONITOR_WAIT ... NCSI_CHANNEL_MONITOR_WAIT_MAX:
 		break;
 	default:
+		netdev_err(ndp->ndev.dev, "NCSI Channel %d timed out!\n",
+			   nc->id);
 		if (!(ndp->flags & NCSI_DEV_HWA)) {
 			ncsi_report_link(ndp, true);
 			ndp->flags |= NCSI_DEV_RESHUFFLE;
@@ -769,8 +771,11 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		nca.package = np->id;
 		nca.channel = NCSI_RESERVED_CHANNEL;
 		ret = ncsi_xmit_cmd(&nca);
-		if (ret)
+		if (ret) {
+			netdev_err(ndp->ndev.dev,
+				   "NCSI: Failed to transmit CMD_SP\n");
 			goto error;
+		}
 
 		nd->state = ncsi_dev_state_config_cis;
 		break;
@@ -782,8 +787,11 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		nca.package = np->id;
 		nca.channel = nc->id;
 		ret = ncsi_xmit_cmd(&nca);
-		if (ret)
+		if (ret) {
+			netdev_err(ndp->ndev.dev,
+				   "NCSI: Failed to transmit CMD_CIS\n");
 			goto error;
+		}
 
 		nd->state = ncsi_dev_state_config_clear_vids;
 		break;
@@ -880,10 +888,16 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		}
 
 		ret = ncsi_xmit_cmd(&nca);
-		if (ret)
+		if (ret) {
+			netdev_err(ndp->ndev.dev,
+				   "NCSI: Failed to transmit CMD %x\n",
+				   nca.type);
 			goto error;
+		}
 		break;
 	case ncsi_dev_state_config_done:
+		netdev_printk(KERN_DEBUG, ndp->ndev.dev,
+			      "NCSI: channel %u config done\n", nc->id);
 		spin_lock_irqsave(&nc->lock, flags);
 		if (nc->reconfigure_needed) {
 			/* This channel's configuration has been updated
@@ -911,6 +925,9 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		} else {
 			hot_nc = NULL;
 			nc->state = NCSI_CHANNEL_INACTIVE;
+			netdev_warn(ndp->ndev.dev,
+				    "NCSI: channel %u link down after config\n",
+				    nc->id);
 		}
 		spin_unlock_irqrestore(&nc->lock, flags);
 
@@ -923,8 +940,8 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		ncsi_process_next_channel(ndp);
 		break;
 	default:
-		netdev_warn(dev, "Wrong NCSI state 0x%x in config\n",
-			    nd->state);
+		netdev_alert(dev, "Wrong NCSI state 0x%x in config\n",
+			     nd->state);
 	}
 
 	return;
@@ -976,10 +993,17 @@ static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 	}
 
 	if (!found) {
+		netdev_warn(ndp->ndev.dev,
+			    "NCSI: No channel found with link\n");
 		ncsi_report_link(ndp, true);
 		return -ENODEV;
 	}
 
+	ncm = &found->modes[NCSI_MODE_LINK];
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev,
+		      "NCSI: Channel %u added to queue (link %s)\n",
+		      found->id, ncm->data[2] & 0x1 ? "up" : "down");
+
 out:
 	spin_lock_irqsave(&ndp->lock, flags);
 	list_add_tail_rcu(&found->link, &ndp->channel_queue);
@@ -1041,6 +1065,8 @@ static int ncsi_enable_hwa(struct ncsi_dev_priv *ndp)
 
 	/* We can have no channels in extremely case */
 	if (list_empty(&ndp->channel_queue)) {
+		netdev_err(ndp->ndev.dev,
+			   "NCSI: No available channels for HWA\n");
 		ncsi_report_link(ndp, false);
 		return -ENOENT;
 	}
@@ -1209,6 +1235,9 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 
 	return;
 error:
+	netdev_err(ndp->ndev.dev,
+		   "NCSI: Failed to transmit cmd 0x%x during probe\n",
+		   nca.type);
 	ncsi_report_link(ndp, true);
 }
 
@@ -1262,10 +1291,14 @@ int ncsi_process_next_channel(struct ncsi_dev_priv *ndp)
 	switch (old_state) {
 	case NCSI_CHANNEL_INACTIVE:
 		ndp->ndev.state = ncsi_dev_state_config;
+		netdev_info(ndp->ndev.dev, "NCSI: configuring channel %u\n",
+			    nc->id);
 		ncsi_configure_channel(ndp);
 		break;
 	case NCSI_CHANNEL_ACTIVE:
 		ndp->ndev.state = ncsi_dev_state_suspend;
+		netdev_info(ndp->ndev.dev, "NCSI: suspending channel %u\n",
+			    nc->id);
 		ncsi_suspend_channel(ndp);
 		break;
 	default:
@@ -1285,6 +1318,8 @@ int ncsi_process_next_channel(struct ncsi_dev_priv *ndp)
 		return ncsi_choose_active_channel(ndp);
 	}
 
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev,
+		      "NCSI: No more channels to process\n");
 	ncsi_report_link(ndp, false);
 	return -ENODEV;
 }
@@ -1566,10 +1601,12 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 		return 0;
 	}
 
-	if (ndp->flags & NCSI_DEV_HWA)
+	if (ndp->flags & NCSI_DEV_HWA) {
+		netdev_info(ndp->ndev.dev, "NCSI: Enabling HWA mode\n");
 		ret = ncsi_enable_hwa(ndp);
-	else
+	} else {
 		ret = ncsi_choose_active_channel(ndp);
+	}
 
 	return ret;
 }
@@ -1600,6 +1637,7 @@ void ncsi_stop_dev(struct ncsi_dev *nd)
 		}
 	}
 
+	netdev_printk(KERN_DEBUG, ndp->ndev.dev, "NCSI: Stopping device\n");
 	ncsi_report_link(ndp, true);
 }
 EXPORT_SYMBOL_GPL(ncsi_stop_dev);
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 927dad4759d1..58186c4102f0 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -1032,11 +1032,19 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
 	if (payload < 0)
 		payload = ntohs(hdr->length);
 	ret = ncsi_validate_rsp_pkt(nr, payload);
-	if (ret)
+	if (ret) {
+		netdev_warn(ndp->ndev.dev,
+			    "NCSI: 'bad' packet ignored for type 0x%x\n",
+			    hdr->type);
 		goto out;
+	}
 
 	/* Process the packet */
 	ret = nrh->handler(nr);
+	if (ret)
+		netdev_err(ndp->ndev.dev,
+			   "NCSI: Handler for packet type 0x%x returned %d\n",
+			   hdr->type, ret);
 out:
 	ncsi_free_request(nr);
 	return ret;
-- 
2.14.3
