Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="vF95dW6a"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="lBq5YAo7"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yVd1Z75QYzDr8P
 for <openbmc@lists.ozlabs.org>; Mon,  6 Nov 2017 14:13:38 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 4C95920BBB;
 Sun,  5 Nov 2017 22:13:36 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Sun, 05 Nov 2017 22:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VYu7BRENvLXhy5Qw96mWpmj5L6caEYHPPgx7j2nCuuI=; b=vF95dW6a
 5bf/rItpqwq/3SZJRKINA078viVwfqWC5AUp+aA8HmaldBglP3SaxVMGJwZSzR/B
 sv0bUYpWcNp+pPgx2J5piMJ8ZZWK1qDAiB/rxMxLJLWyZBg0PPMFKRriLM2RUbxU
 5PSyh1rxAaMqlyJWNVvpZQ5PMD6scLCybAsMHfvjChFm5BZhseKkInsLLLoc5DA0
 YV039UuzeDb5MCvKotdAU3xwMEZgL8VJTTZNdvG2C20wSVVO1Y6GcbrvTK65i9f/
 NPCxUkXFRNXDWnop6I29LVlcYOSrzc06wPtbuZsTMmIKfcn+PVt0gsg+uSaAj5M4
 oTROJvK9ZRLaDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=VYu7BRENvLXhy5Qw96mWpmj5L6caEYHPPgx7j2nCuuI=; b=lBq5YAo7
 vhnE0796FHFaGaZPafnvecQYV5hCdfszcYrGz0ersJ22pgoMvp1HO3AHkix8O+1Z
 fIgbYFvegRlizc/WosSe+0/gRPoGEyYSNQfgM/JrHIA9myvDncBTX5OvYDqNN28N
 cfeYm2d/8OeMZz/BSLLvuSrTzHviMP6cDszPjelIUfsatvDeiB2G9Xp/W8CXr1RH
 NBZAO861ppDEtAUyeZgj30kzMhi6ka4OL1tjald8hF2E+ShEr9jFXiy4rvmwvZv4
 AjUiA7tFbwSOqmRASiJ81842airC1agz3Pi/4AM1p826D9aSrNSiBJp9mnmqLjQo
 bpZ87rhq7j32WQ==
X-ME-Sender: <xms:YNP_WWVKPkkk9kEaYzrx7INeeqP5Y46WVpjazvEWtQsbNPJ3YmBE6Q>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id F254D7F8DD;
 Sun,  5 Nov 2017 22:13:34 -0500 (EST)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH 1/2] net/ncsi: General state debugging
Date: Mon,  6 Nov 2017 14:13:22 +1100
Message-Id: <20171106031323.21519-2-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171106031323.21519-1-sam@mendozajonas.com>
References: <20171106031323.21519-1-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 06 Nov 2017 03:13:41 -0000

While relatively noisy this helps to debug NCSI state transitions and
the state of channels beyond the existing "down" or "up" messages that
the driver currently has.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 net/ncsi/ncsi-aen.c    | 34 +++++++++++++++++++---
 net/ncsi/ncsi-manage.c | 79 +++++++++++++++++++++++++++++++++++++++++++-------
 net/ncsi/ncsi-rsp.c    | 10 ++++++-
 3 files changed, 107 insertions(+), 16 deletions(-)

diff --git a/net/ncsi/ncsi-aen.c b/net/ncsi/ncsi-aen.c
index f135938bf781..7600db88fa95 100644
--- a/net/ncsi/ncsi-aen.c
+++ b/net/ncsi/ncsi-aen.c
@@ -60,8 +60,10 @@ static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
 
 	/* Find the NCSI channel */
 	ncsi_find_package_and_channel(ndp, h->common.channel, NULL, &nc);
-	if (!nc)
+	if (!nc) {
+		netdev_err(ndp->ndev.dev, "NCSI: LSC - no channel!\n");
 		return -ENODEV;
+	}
 
 	/* Update the link status */
 	lsc = (struct ncsi_aen_lsc_pkt *)h;
@@ -73,6 +75,9 @@ static int ncsi_aen_handler_lsc(struct ncsi_dev_priv *ndp,
 	ncm->data[2] = data;
 	ncm->data[4] = ntohl(lsc->oem_status);
 
+	netdev_info(ndp->ndev.dev, "NCSI: LSC - channel %u state %s\n",
+		    nc->id, data & 0x1 ? "up" : "down");
+
 	chained = !list_empty(&nc->link);
 	state = nc->state;
 	spin_unlock_irqrestore(&nc->lock, flags);
@@ -103,12 +108,17 @@ static int ncsi_aen_handler_cr(struct ncsi_dev_priv *ndp,
 
 	/* Find the NCSI channel */
 	ncsi_find_package_and_channel(ndp, h->common.channel, NULL, &nc);
-	if (!nc)
+	if (!nc) {
+		netdev_err(ndp->ndev.dev, "NCSI: CR - no channel!\n");
 		return -ENODEV;
+	}
 
 	spin_lock_irqsave(&nc->lock, flags);
 	if (!list_empty(&nc->link) ||
 	    nc->state != NCSI_CHANNEL_ACTIVE) {
+		netdev_info(ndp->ndev.dev,
+			    "NCSI: CR - channel %u queued or not ACTIVE\n",
+			    nc->id);
 		spin_unlock_irqrestore(&nc->lock, flags);
 		return 0;
 	}
@@ -137,16 +147,23 @@ static int ncsi_aen_handler_hncdsc(struct ncsi_dev_priv *ndp,
 
 	/* Find the NCSI channel */
 	ncsi_find_package_and_channel(ndp, h->common.channel, NULL, &nc);
-	if (!nc)
+	if (!nc) {
+		netdev_err(ndp->ndev.dev, "NCSI: HNCDSC - no channel!\n");
 		return -ENODEV;
+	}
 
 	/* If the channel is active one, we need reconfigure it */
 	spin_lock_irqsave(&nc->lock, flags);
 	ncm = &nc->modes[NCSI_MODE_LINK];
 	hncdsc = (struct ncsi_aen_hncdsc_pkt *)h;
 	ncm->data[3] = ntohl(hncdsc->status);
+	netdev_info(ndp->ndev.dev, "NCSI: HNCDSC - channel %u state %s\n",
+		    nc->id, ncm->data[3] & 0x3 ? "up" : "down");
 	if (!list_empty(&nc->link) ||
 	    nc->state != NCSI_CHANNEL_ACTIVE) {
+		netdev_info(ndp->ndev.dev,
+			    "NCSI: HNCDSC - channel %u queued or not ACTIVE\n",
+			    nc->id);
 		spin_unlock_irqrestore(&nc->lock, flags);
 		return 0;
 	}
@@ -198,6 +215,7 @@ int ncsi_aen_handler(struct ncsi_dev_priv *ndp, struct sk_buff *skb)
 
 	/* Find the handler */
 	h = (struct ncsi_aen_pkt_hdr *)skb_network_header(skb);
+	netdev_info(ndp->ndev.dev, "NCSI: %s - type %u\n", __func__, h->type);
 	for (i = 0; i < ARRAY_SIZE(ncsi_aen_handlers); i++) {
 		if (ncsi_aen_handlers[i].type == h->type) {
 			nah = &ncsi_aen_handlers[i];
@@ -212,10 +230,18 @@ int ncsi_aen_handler(struct ncsi_dev_priv *ndp, struct sk_buff *skb)
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
index 8cae2f233272..6fd90415b2a2 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -226,7 +226,10 @@ static void ncsi_channel_monitor(unsigned long data)
 	case NCSI_CHANNEL_MONITOR_WAIT ... NCSI_CHANNEL_MONITOR_WAIT_MAX:
 		break;
 	default:
+		netdev_err(ndp->ndev.dev, "NCSI Channel %d timed out!\n",
+			   nc->id);
 		if (!(ndp->flags & NCSI_DEV_HWA)) {
+			netdev_err(ndp->ndev.dev, "NCSI reshuffle\n");
 			ncsi_report_link(ndp, true);
 			ndp->flags |= NCSI_DEV_RESHUFFLE;
 		}
@@ -545,6 +548,7 @@ static void ncsi_request_timeout(unsigned long data)
 	ncsi_free_request(nr);
 }
 
+// This does get called, on active channel LSC
 static void ncsi_suspend_channel(struct ncsi_dev_priv *ndp)
 {
 	struct ncsi_dev *nd = &ndp->ndev;
@@ -769,8 +773,11 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
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
@@ -782,8 +789,11 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
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
@@ -880,10 +890,16 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
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
+		netdev_info(ndp->ndev.dev, "NCSI: channel %u config done\n",
+			    nc->id);
 		spin_lock_irqsave(&nc->lock, flags);
 		if (nc->reconfigure_needed) {
 			/* This channel's configuration has been updated
@@ -908,23 +924,33 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1) {
 			hot_nc = nc;
 			nc->state = NCSI_CHANNEL_ACTIVE;
+			netdev_info(ndp->ndev.dev, "NCSI: channel %u set ACTIVE after config\n",
+				    nc->id);
 		} else {
 			hot_nc = NULL;
 			nc->state = NCSI_CHANNEL_INACTIVE;
+			netdev_err(ndp->ndev.dev, "NCSI: channel %u set INACTIVE after config\n",
+				   nc->id);
 		}
 		spin_unlock_irqrestore(&nc->lock, flags);
 
 		/* Update the hot channel */
 		spin_lock_irqsave(&ndp->lock, flags);
 		ndp->hot_channel = hot_nc;
+		if (hot_nc)
+			netdev_info(ndp->ndev.dev, "NCSI: %s - hot channel %u\n",
+				    __func__, hot_nc->id);
+		else
+			netdev_err(ndp->ndev.dev, "NCSI: %s - hot channel NULL\n",
+				   __func__);
 		spin_unlock_irqrestore(&ndp->lock, flags);
 
 		ncsi_start_channel_monitor(nc);
 		ncsi_process_next_channel(ndp);
 		break;
 	default:
-		netdev_warn(dev, "Wrong NCSI state 0x%x in config\n",
-			    nd->state);
+		netdev_alert(dev, "Wrong NCSI state 0x%x in config\n",
+			     nd->state);
 	}
 
 	return;
@@ -958,14 +984,24 @@ static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 				continue;
 			}
 
-			if (!found)
+			if (!found) {
+				netdev_info(ndp->ndev.dev,
+					    "NCSI: channel %u chosen as first\n",
+					    nc->id);
 				found = nc;
+			}
 
-			if (nc == hot_nc)
+			if (nc == hot_nc) {
+				netdev_info(ndp->ndev.dev,
+					    "NCSI: hot channel %u chosen\n",
+					    nc->id);
 				found = nc;
+			}
 
 			ncm = &nc->modes[NCSI_MODE_LINK];
 			if (ncm->data[2] & 0x1) {
+				netdev_info(ndp->ndev.dev, "NCSI: channel %u chosen with link up\n",
+					    nc->id);
 				spin_unlock_irqrestore(&nc->lock, flags);
 				found = nc;
 				goto out;
@@ -976,6 +1012,7 @@ static int ncsi_choose_active_channel(struct ncsi_dev_priv *ndp)
 	}
 
 	if (!found) {
+		netdev_err(ndp->ndev.dev, "NCSI: No channel found with link\n");
 		ncsi_report_link(ndp, true);
 		return -ENODEV;
 	}
@@ -1041,6 +1078,8 @@ static int ncsi_enable_hwa(struct ncsi_dev_priv *ndp)
 
 	/* We can have no channels in extremely case */
 	if (list_empty(&ndp->channel_queue)) {
+		netdev_err(ndp->ndev.dev,
+			   "NCSI: HWA, no available channels!\n");
 		ncsi_report_link(ndp, false);
 		return -ENOENT;
 	}
@@ -1125,10 +1164,15 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 		 */
 		if (!ndp->active_package) {
 			ndp->flags |= NCSI_DEV_PROBED;
-			if (ncsi_check_hwa(ndp))
+			if (ncsi_check_hwa(ndp)) {
+				netdev_info(ndp->ndev.dev,
+					    "NCSI probe: enable HWA..\n");
 				ncsi_enable_hwa(ndp);
-			else
+			} else {
 				ncsi_choose_active_channel(ndp);
+				netdev_info(ndp->ndev.dev,
+					    "NCSI probe: choose active..\n");
+			}
 			return;
 		}
 
@@ -1209,6 +1253,8 @@ static void ncsi_probe_channel(struct ncsi_dev_priv *ndp)
 
 	return;
 error:
+	netdev_err(ndp->ndev.dev,
+		   "NCSI: Failed to transmit CMD %u during probe\n", nca.type);
 	ncsi_report_link(ndp, true);
 }
 
@@ -1262,10 +1308,14 @@ int ncsi_process_next_channel(struct ncsi_dev_priv *ndp)
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
@@ -1282,9 +1332,12 @@ int ncsi_process_next_channel(struct ncsi_dev_priv *ndp)
 	ndp->active_package = NULL;
 	if (ndp->flags & NCSI_DEV_RESHUFFLE) {
 		ndp->flags &= ~NCSI_DEV_RESHUFFLE;
+		netdev_info(ndp->ndev.dev,
+			    "NCSI: No channel to process; reshuffle\n");
 		return ncsi_choose_active_channel(ndp);
 	}
 
+	netdev_err(ndp->ndev.dev, "NCSI: No more channels to process\n");
 	ncsi_report_link(ndp, false);
 	return -ENODEV;
 }
@@ -1566,10 +1619,13 @@ int ncsi_start_dev(struct ncsi_dev *nd)
 		return 0;
 	}
 
-	if (ndp->flags & NCSI_DEV_HWA)
+	if (ndp->flags & NCSI_DEV_HWA) {
+		netdev_info(ndp->ndev.dev, "NCSI start_dev: enable HWA\n");
 		ret = ncsi_enable_hwa(ndp);
-	else
+	} else {
+		netdev_info(ndp->ndev.dev, "NCSI start dev: choose active\n");
 		ret = ncsi_choose_active_channel(ndp);
+	}
 
 	return ret;
 }
@@ -1600,6 +1656,7 @@ void ncsi_stop_dev(struct ncsi_dev *nd)
 		}
 	}
 
+	netdev_info(ndp->ndev.dev, "NCSI: Stopping\n");
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
