Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS4xb5tNZzDr1B
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 19:01:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="vDRlcwJq"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bKyhZlgk"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8A779A24;
 Wed,  9 Aug 2017 04:55:24 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Wed, 09 Aug 2017 04:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ADqFsYIMBftVn80rUOjBUFVBTOxxhNMAHnOd+kJMP
 /w=; b=vDRlcwJqJ5F8FPVuO0G/5nrnYtBlTY2y5mVjhz8+vkewp+bzwlYZ0qTrW
 cQDri9P0oeCRSLgN1S3IK9WORTJInGe8WwAM2u1yOqtJMFt/ZLExiisBbpVLwdvE
 jzQMFt4lruOkHNASc2ZZGUepCC+2dxsEZ9SFvbl6HmDXzNFMd+RJ2waFaqFyb7r1
 VGPX/3dh/cs5M0CVLQfrS5mCFwYTCvO8YIvm6D+hcfvk9rs9FTXZZXmldEF1HaXR
 XRLEuYsRnjlDHGtdbx3acdwM/u3qIkxQLsjzdKtITPDDwGXcomS552oCOhIQShh3
 LxT081y0E76tLjrJS4gX+q5vmwnsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ADqFsYIMBftVn80rUOjBUFVBTOxxhNMAHnOd+kJMP
 /w=; b=bKyhZlgkDDk3aZtp5zmRNrYVr00NzLRUO5fMI4J0LrwhjQDEK/IE9OvpM
 F0mHUjoBXuyMulLkXcjgxABgnzKpLpKJ/fZqyEzXe7D7bJiI/9SD1vDSX5GPL7AW
 o3dqAO3r7NmQa2CAwF00MoJIkI/yLOJMzGcSzzPCQGhamVsIMraicJ2TZSafs2/T
 J0409MmARLw2oWzvyccT1cFZuOE0D7F31im20WYYPd5ybXAHH6UldAlLXhF9DmIp
 LJxMC+7CMhAgVGnQ/PXfsdc0BEfy1FJ0gTYOiiWGo4widdzoKuRsrRqM9Zhfw2BF
 +sbR/3s/Zvx04stBS09yh8QcCK+pw==
X-ME-Sender: <xms:-82KWbfMLPQvZEt9L27-TgaE3LI1so3whvA73qdlV4DIzrC9fQ_4Lw>
X-Sasl-enc: kiejtXnfYQBmtVGDHEQNO0cuO5OaKO1fvDogoNOQ2yE7 1502268922
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 126FA240A4;
 Wed,  9 Aug 2017 04:55:20 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Ravindra S Rao1 <ravindra.s@in.ibm.com>, Leonard Low <leolow@au1.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ratan K Gupta <ratagupt@in.ibm.com>
Subject: [RFC PATCH 3/3] net/ncsi: Configure VLAN tag filter
Date: Wed,  9 Aug 2017 18:54:43 +1000
Message-Id: <20170809085443.13148-4-sam@mendozajonas.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170809085443.13148-1-sam@mendozajonas.com>
References: <20170809085443.13148-1-sam@mendozajonas.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Aug 2017 09:01:09 -0000

Make use of the ndo_vlan_rx_{add,kill}_vid callbacks to have the NCSI
stack process new VLAN tags and configure the channel VLAN filter
appropriately.
Several VLAN tags can be set and a "Set VLAN Filter" packet must be sent
for each one, meaning the ncsi_dev_state_config_svf state must be
repeated. An internal list of VLAN tags is maintained, and compared
against the current channel's ncsi_channel_filter in order to keep track
within the state. VLAN filters are removed in a similar manner, with the
introduction of the ncsi_dev_state_config_clear_vids state. The maximum
number of VLAN tag filters is determined by the "Get Capabilities"
response from the channel.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c |   2 +
 include/net/ncsi.h                       |   2 +
 net/ncsi/internal.h                      |  11 ++
 net/ncsi/ncsi-manage.c                   | 257 ++++++++++++++++++++++++++++++-
 net/ncsi/ncsi-rsp.c                      |  13 +-
 5 files changed, 281 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 7c4d772287c7..5a3661317026 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1623,6 +1623,8 @@ static const struct net_device_ops ftgmac100_netdev_ops = {
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller	= ftgmac100_poll_controller,
 #endif
+	.ndo_vlan_rx_add_vid	= ncsi_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid	= ncsi_vlan_rx_kill_vid,
 };
 
 static int ftgmac100_setup_mdio(struct net_device *netdev)
diff --git a/include/net/ncsi.h b/include/net/ncsi.h
index 68680baac0fd..1f96af46df49 100644
--- a/include/net/ncsi.h
+++ b/include/net/ncsi.h
@@ -28,6 +28,8 @@ struct ncsi_dev {
 };
 
 #ifdef CONFIG_NET_NCSI
+int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid);
+int ncsi_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid);
 struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 				   void (*notifier)(struct ncsi_dev *nd));
 int ncsi_start_dev(struct ncsi_dev *nd);
diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 1308a56f2591..af3d636534ef 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -180,6 +180,7 @@ struct ncsi_channel {
 #define NCSI_CHANNEL_INACTIVE		1
 #define NCSI_CHANNEL_ACTIVE		2
 #define NCSI_CHANNEL_INVISIBLE		3
+	bool                        reconfigure_needed;
 	spinlock_t                  lock;	/* Protect filters etc */
 	struct ncsi_package         *package;
 	struct ncsi_channel_version version;
@@ -235,6 +236,9 @@ enum {
 	ncsi_dev_state_probe_dp,
 	ncsi_dev_state_config_sp	= 0x0301,
 	ncsi_dev_state_config_cis,
+	ncsi_dev_state_config_clear_vids,
+	ncsi_dev_state_config_svf,
+	ncsi_dev_state_config_ev,
 	ncsi_dev_state_config_sma,
 	ncsi_dev_state_config_ebf,
 #if IS_ENABLED(CONFIG_IPV6)
@@ -253,6 +257,12 @@ enum {
 	ncsi_dev_state_suspend_done
 };
 
+struct vlan_vid {
+	struct list_head list;
+	__be16 proto;
+	u16 vid;
+};
+
 struct ncsi_dev_priv {
 	struct ncsi_dev     ndev;            /* Associated NCSI device     */
 	unsigned int        flags;           /* NCSI device flags          */
@@ -276,6 +286,7 @@ struct ncsi_dev_priv {
 	struct work_struct  work;            /* For channel management     */
 	struct packet_type  ptype;           /* NCSI packet Rx handler     */
 	struct list_head    node;            /* Form NCSI device list      */
+	struct list_head    vlan_vids;       /* List of active VLAN IDs */
 };
 
 struct ncsi_cmd_arg {
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index a3bd5fa8ad09..f45f2a443e34 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -646,9 +646,13 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 	struct ncsi_package *np = ndp->active_package;
 	struct ncsi_channel *nc = ndp->active_channel;
 	struct ncsi_channel *hot_nc = NULL;
+	struct ncsi_channel_filter *ncf;
 	struct ncsi_cmd_arg nca;
+	struct vlan_vid *vlan;
 	unsigned char index;
 	unsigned long flags;
+	int vlan_index;
+	bool clear;
 	int ret;
 
 	nca.ndp = ndp;
@@ -683,8 +687,11 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		if (ret)
 			goto error;
 
-		nd->state = ncsi_dev_state_config_sma;
+		nd->state = ncsi_dev_state_config_clear_vids;
 		break;
+	case ncsi_dev_state_config_clear_vids:
+	case ncsi_dev_state_config_svf:
+	case ncsi_dev_state_config_ev:
 	case ncsi_dev_state_config_sma:
 	case ncsi_dev_state_config_ebf:
 #if IS_ENABLED(CONFIG_IPV6)
@@ -699,11 +706,93 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		nca.package = np->id;
 		nca.channel = nc->id;
 
+		/* Clear any active filters on the channel before setting */
+		if (nd->state == ncsi_dev_state_config_clear_vids) {
+			clear = false;
+			vlan_index = -1;
+			spin_lock_irqsave(&nc->lock, flags);
+			ncf = nc->filters[NCSI_FILTER_VLAN];
+			while ((vlan_index = find_next_bit((void *)&ncf->bitmap, ncf->total, vlan_index + 1))
+			       < ncf->total) {
+				clear = true;
+				// TODO retrieve the vid that was set
+				netdev_printk(KERN_DEBUG, dev, "ncsi: removed vlan tag at index %d\n",
+						vlan_index);
+				ncsi_remove_filter(nc, NCSI_FILTER_VLAN, vlan_index);
+				break;
+			}
+			spin_unlock_irqrestore(&nc->lock, flags);
+
+			if (clear) {
+				nca.type = NCSI_PKT_CMD_SVF;
+				nca.words[1] = 0; // TODO
+				/* HW filter index starts at 1 */
+				nca.bytes[6] = vlan_index + 1;
+				nca.bytes[7] = 0x00;
+				/* Repeat */
+				nd->state = ncsi_dev_state_config_clear_vids;
+			} else {
+				nd->state = ncsi_dev_state_config_svf;
+				schedule_work(&ndp->work);
+				break;
+			}
+		/* Add known VLAN tags to the filter */
+		} else if (nd->state == ncsi_dev_state_config_svf) {
+			vlan = NULL;
+			vlan_index = 0;
+			list_for_each_entry_rcu(vlan, &ndp->vlan_vids, list) {
+				vlan_index = ncsi_find_filter(nc, NCSI_FILTER_VLAN, &vlan->vid);
+				if (vlan_index < 0) {
+					/* New tag to add */
+					netdev_info(dev, "new vlan id to set: %u\n", vlan->vid);
+					break;
+				} else
+					netdev_printk(KERN_DEBUG, dev, "vid %u already at filter pos %d\n",
+							vlan->vid, vlan_index);
+			}
+
+			if (vlan && vlan_index == -ENOENT) {
+				vlan_index = ncsi_add_filter(nc, NCSI_FILTER_VLAN, &vlan->vid);
+				if (vlan_index < 0) {
+					netdev_err(dev, "Failed to add new VLAN tag, error %d%s\n",
+							vlan_index,
+							vlan_index == -ENOSPC ? " (vid limit)" : "");
+					nd->state = ncsi_dev_state_config_ev;
+					schedule_work(&ndp->work);
+					break;
+				}
+
+				netdev_info(dev, "set vid %u in packet, index %u\n",
+						vlan->vid, vlan_index + 1);
+				nca.type = NCSI_PKT_CMD_SVF;
+				nca.words[1] = vlan->vid;
+				/* HW filter index starts at 1 */
+				nca.bytes[6] = vlan_index + 1;
+				nca.bytes[7] = 0x01;
+				/* Repeat */
+				nd->state = ncsi_dev_state_config_clear_vids;
+				nd->state = ncsi_dev_state_config_svf;
+			} else {
+				netdev_printk(KERN_DEBUG, dev, "no vlan ids left to set\n");
+				nd->state = ncsi_dev_state_config_ev;
+				schedule_work(&ndp->work);
+				break;
+			}
+		/* Enable/Disable the VLAN filter */
+		} else if (nd->state == ncsi_dev_state_config_ev) {
+			if (list_empty(&ndp->vlan_vids)) {
+				nca.type = NCSI_PKT_CMD_DV;
+			} else {
+				nca.type = NCSI_PKT_CMD_EV;
+				// TODO Filtering Type - set and forget or make configurable?
+				nca.bytes[3] = NCSI_CAP_VLAN_NO;
+			}
+			nd->state = ncsi_dev_state_config_sma;
+		} else if (nd->state == ncsi_dev_state_config_sma) {
 		/* Use first entry in unicast filter table. Note that
 		 * the MAC filter table starts from entry 1 instead of
 		 * 0.
 		 */
-		if (nd->state == ncsi_dev_state_config_sma) {
 			nca.type = NCSI_PKT_CMD_SMA;
 			for (index = 0; index < 6; index++)
 				nca.bytes[index] = dev->dev_addr[index];
@@ -751,6 +840,26 @@ static void ncsi_configure_channel(struct ncsi_dev_priv *ndp)
 		break;
 	case ncsi_dev_state_config_done:
 		spin_lock_irqsave(&nc->lock, flags);
+		if (nc->reconfigure_needed) {
+			/*
+			 * This channel's configuration has been updated
+			 * part-way during the config state - start the
+			 * channel configuration over
+			 */
+			nc->reconfigure_needed = false;
+			nc->state = NCSI_CHANNEL_INVISIBLE;
+			spin_unlock_irqrestore(&nc->lock, flags);
+
+			spin_lock_irqsave(&ndp->lock, flags);
+			nc->state = NCSI_CHANNEL_INACTIVE;
+			list_add_tail_rcu(&nc->link, &ndp->channel_queue);
+			spin_unlock_irqrestore(&ndp->lock, flags);
+
+			netdev_info(dev, "Dirty NCSI channel state reset\n");
+			ncsi_process_next_channel(ndp);
+			break;
+		}
+
 		if (nc->modes[NCSI_MODE_LINK].data[2] & 0x1) {
 			hot_nc = nc;
 			nc->state = NCSI_CHANNEL_ACTIVE;
@@ -1191,6 +1300,149 @@ static struct notifier_block ncsi_inet6addr_notifier = {
 };
 #endif /* CONFIG_IPV6 */
 
+static int ncsi_kick_channels(struct ncsi_dev_priv *ndp)
+{
+	struct ncsi_dev *nd = &ndp->ndev;
+	struct ncsi_channel *nc;
+	struct ncsi_package *np;
+	unsigned long flags;
+	unsigned int n = 0;
+
+	NCSI_FOR_EACH_PACKAGE(ndp, np) {
+		NCSI_FOR_EACH_CHANNEL(np, nc) {
+			spin_lock_irqsave(&nc->lock, flags);
+
+			/*
+			 * Channels may be busy - mark dirty instead of kicking if
+			 * a) not ACTIVE (configured)
+			 * b) in the channel_queue (to be configured)
+			 * c) it's ndev is in the config state
+			 */
+			if (nc->state != NCSI_CHANNEL_ACTIVE) {
+				if ((ndp->ndev.state & 0xff00) == ncsi_dev_state_config ||
+						!list_empty(&nc->link)) {
+					netdev_info(nd->dev, "nc %p marked dirty\n", nc);
+					nc->reconfigure_needed = true;
+				}
+				spin_unlock_irqrestore(&nc->lock, flags);
+				continue;
+			}
+
+			spin_unlock_irqrestore(&nc->lock, flags);
+
+			ncsi_stop_channel_monitor(nc);
+			spin_lock_irqsave(&nc->lock, flags);
+			nc->state = NCSI_CHANNEL_INVISIBLE;
+			spin_unlock_irqrestore(&nc->lock, flags);
+
+			spin_lock_irqsave(&ndp->lock, flags);
+			nc->state = NCSI_CHANNEL_INACTIVE;
+			list_add_tail_rcu(&nc->link, &ndp->channel_queue);
+			spin_unlock_irqrestore(&ndp->lock, flags);
+
+			spin_unlock_irqrestore(&nc->lock, flags);
+
+			netdev_info(nd->dev, "Kicked channel %p\n", nc);
+			n++;
+		}
+	}
+
+	return n;
+}
+
+int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
+{
+	struct ncsi_channel_filter *ncf;
+	struct ncsi_dev_priv *ndp;
+	unsigned int n_vids = 0;
+	struct vlan_vid *vlan;
+	struct ncsi_dev *nd;
+	bool found = false;
+
+	if (vid == 0) {
+		netdev_info(dev, "Ignoring default vid 0\n");
+		return 0;
+	}
+
+	nd = ncsi_find_dev(dev);
+	if (!nd) {
+		netdev_warn(dev, "No net_device?\n");
+		return 0;
+	}
+
+	ndp = TO_NCSI_DEV_PRIV(nd);
+	ncf = ndp->hot_channel->filters[NCSI_FILTER_VLAN];
+
+	/* Add the VLAN id to our internal list */
+	list_for_each_entry_rcu(vlan, &ndp->vlan_vids, list) {
+		n_vids++;
+		if (vlan->vid == vid) {
+			netdev_info(dev, "vid %u already registered\n", vid);
+			return 0;
+		}
+	}
+
+	if (n_vids >= ncf->total) {
+		netdev_info(dev, "NCSI Channel supports up to %u VLAN tags but %u are already set\n",
+				ncf->total, n_vids);
+		return -EINVAL;
+	}
+
+	vlan = kzalloc(sizeof(struct vlan_vid), GFP_KERNEL);
+	if (!vlan) {
+		netdev_err(dev, "could not alloc vlan_vid struct\n");
+		return -ENOMEM;
+	}
+
+	vlan->proto = proto;
+	vlan->vid = vid;
+	list_add_rcu(&vlan->list, &ndp->vlan_vids);
+
+	netdev_info(dev, "Added new vid %u\n", vid);
+
+	found = ncsi_kick_channels(ndp) != 0;
+
+	return found ? ncsi_process_next_channel(ndp) : 0;
+}
+
+int ncsi_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid)
+{
+	struct vlan_vid *vlan, *tmp;
+	struct ncsi_dev_priv *ndp;
+	struct ncsi_dev *nd;
+	bool found = false;
+
+	if (vid == 0) {
+		netdev_info(dev, "Ignoring default vid 0\n");
+		return 0;
+	}
+
+	nd = ncsi_find_dev(dev);
+	if (!nd) {
+		netdev_warn(dev, "No net_device?\n");
+		return 0;
+	}
+
+	ndp = TO_NCSI_DEV_PRIV(nd);
+
+	/* Remove the VLAN id from our internal list */
+	list_for_each_entry_safe(vlan, tmp, &ndp->vlan_vids, list)
+		if (vlan->vid == vid) {
+			netdev_info(dev, "vid %u found, removing\n", vid);
+			list_del_rcu(&vlan->list);
+			found = true;
+		}
+
+	if (!found) {
+		printk(KERN_ERR "vid %u wasn't registered!\n", vid);
+		return -EINVAL;
+	}
+
+	found = ncsi_kick_channels(ndp) != 0;
+
+	return found ? ncsi_process_next_channel(ndp) : 0;
+}
+
 struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 				   void (*handler)(struct ncsi_dev *ndev))
 {
@@ -1215,6 +1467,7 @@ struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
 	nd->handler = handler;
 	ndp->pending_req_num = 0;
 	INIT_LIST_HEAD(&ndp->channel_queue);
+	INIT_LIST_HEAD(&ndp->vlan_vids);
 	INIT_WORK(&ndp->work, ncsi_dev_work);
 
 	/* Initialize private NCSI device */
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 087db775b3dc..90bb7f57bd86 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -39,8 +39,12 @@ static int ncsi_validate_rsp_pkt(struct ncsi_request *nr,
 
 	/* Check on code and reason */
 	if (ntohs(h->code) != NCSI_PKT_RSP_C_COMPLETED ||
-	    ntohs(h->reason) != NCSI_PKT_RSP_R_NO_ERROR)
+	    ntohs(h->reason) != NCSI_PKT_RSP_R_NO_ERROR) {
+		printk(KERN_ERR "ncsi rsp not valid!\n");
+		printk(KERN_ERR "\tCode: %x\n", ntohs(h->code));
+		printk(KERN_ERR "\tReason: %x\n", ntohs(h->reason));
 		return -EINVAL;
+	}
 
 	/* Validate checksum, which might be zeroes if the
 	 * sender doesn't support checksum according to NCSI
@@ -693,7 +697,12 @@ static int ncsi_rsp_handler_gc(struct ncsi_request *nr)
 
 		ncf->index = i;
 		ncf->total = cnt;
-		ncf->bitmap = 0x0ul;
+		if (i == NCSI_FILTER_VLAN) {
+			/* Set VLAN filters active so they are cleared in config */
+			ncf->bitmap = U64_MAX;
+		} else {
+			ncf->bitmap = 0x0ul;
+		}
 		nc->filters[i] = ncf;
 	}
 
-- 
2.13.3
