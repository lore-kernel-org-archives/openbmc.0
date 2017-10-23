Return-Path: <sam@mendozajonas.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="f5JwvnOb"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DV+uI7wA"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yL5436hS1zDqXj
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 16:46:11 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id D679B20BC7
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:08 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 23 Oct 2017 01:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=date:from:in-reply-to:message-id:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HrBFuz
 7oCy1mk950kQQF6036dEHWIuPWOHreh7I/mXQ=; b=f5JwvnObXcZSCzic0c/KfQ
 ETaKGXTXbdhzNJK7pIfPmnMSgNnHuAgCvvpcYOBbH+NIRfWicBFBGddjzQbsKd1H
 RqtoBUkTU7qXs9hiYCwPDGTP2LPFddazmde/FOuJ7uwQW4BzIEipcMN/qdzhrUcU
 nGbaiyOOGNPoPjGD7zPv0c4Vb4wZP5hHLIvXrnD/J1XzluaqEVil/W2BC7OZfi9T
 yC/5rUbFCVmUki/yjp8XjOksHLrIzMeq1eDrWf8jc8mnQrLieiD+6fc2b4cuRlGD
 gK08+4+K1C6CQYNa6R5r057A/fNPoxp3hCKBe/LjzAsUMraUw/BsjO10IvQ4Hplw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HrBFuz7oCy1mk950kQQF6036dEHWIuPWOHreh7I/mXQ=; b=DV+uI7wA
 gY4s/CJ4+ZYAwWxTZSKc7MVN/5jTsiF8vNR/0+ZM/eeDZ76ABI5xOjfzFll6SFNf
 1mZxw5nCxrQZpIEoysN/m3/Ni2YLDTt35oCNqnyTJvoHlYqYPCXuPDNYKlvEuMSN
 rPcJic4Bqco/KgIOeZqNfMpnPexHTQJmeVA+piC8dy7pnAA8TLMwOVU2DYy8gUgn
 t99B2fwx9QPAPyGIa/i+RkRC1KwH8psjqDkvEV9RCuBvQHpLYVqDZRcm+aTv38Vw
 zr91QQgG3jXCVtbOBfLWbvMljsQrXl4GLRN+rw7Bn+XHuUIC0keFvcvXsbcDsOL1
 5oHFMbL3A3g53w==
X-ME-Sender: <xms:IILtWULuv55tDxGe94rzfihfvJUWBO5l9v2Ht6NrS-2r-Fpg_2dD_Q>
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id EBA547F919
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 01:46:07 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/7] net/ncsi: Don't limit vids based on hot_channel
Date: Mon, 23 Oct 2017 16:45:52 +1100
Message-Id: <20171023054557.29013-3-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171023054557.29013-1-sam@mendozajonas.com>
References: <20171023054557.29013-1-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 23 Oct 2017 05:46:12 -0000

Currently we drop any new VLAN ids if there are more than the current
(or last used) channel can support. Most importantly this is a problem
if no channel has been selected yet, resulting in a segfault.

Secondly this does not necessarily reflect the capabilities of any other
channels. Instead only drop a new VLAN id if we are already tracking the
maximum allowed by the NCSI specification. Per-channel limits are
already handled by ncsi_add_filter(), but add a message to set_one_vid()
to make it obvious that the channel can not support any more VLAN ids.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
(cherry picked from commit 6e9c0075409d4ec1bc63558ee5a93916a6d7d16f)
---
 net/ncsi/internal.h    |  1 +
 net/ncsi/ncsi-manage.c | 17 +++++++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index af3d636534ef..d30f7bd741d0 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -286,6 +286,7 @@ struct ncsi_dev_priv {
 	struct work_struct  work;            /* For channel management     */
 	struct packet_type  ptype;           /* NCSI packet Rx handler     */
 	struct list_head    node;            /* Form NCSI device list      */
+#define NCSI_MAX_VLAN_VIDS	15
 	struct list_head    vlan_vids;       /* List of active VLAN IDs */
 };
 
diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 3cbd4328f142..24bf3f100d48 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -717,6 +717,10 @@ static int set_one_vid(struct ncsi_dev_priv *ndp, struct ncsi_channel *nc,
 	if (index < 0) {
 		netdev_err(ndp->ndev.dev,
 			   "Failed to add new VLAN tag, error %d\n", index);
+		if (index == -ENOSPC)
+			netdev_err(ndp->ndev.dev,
+				   "Channel %u already has all VLAN filters set\n",
+				   nc->id);
 		return -1;
 	}
 
@@ -1390,7 +1394,6 @@ static int ncsi_kick_channels(struct ncsi_dev_priv *ndp)
 
 int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
 {
-	struct ncsi_channel_filter *ncf;
 	struct ncsi_dev_priv *ndp;
 	unsigned int n_vids = 0;
 	struct vlan_vid *vlan;
@@ -1407,7 +1410,6 @@ int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
 	}
 
 	ndp = TO_NCSI_DEV_PRIV(nd);
-	ncf = ndp->hot_channel->filters[NCSI_FILTER_VLAN];
 
 	/* Add the VLAN id to our internal list */
 	list_for_each_entry_rcu(vlan, &ndp->vlan_vids, list) {
@@ -1418,12 +1420,11 @@ int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
 			return 0;
 		}
 	}
-
-	if (n_vids >= ncf->total) {
-		netdev_info(dev,
-			    "NCSI Channel supports up to %u VLAN tags but %u are already set\n",
-			    ncf->total, n_vids);
-		return -EINVAL;
+	if (n_vids >= NCSI_MAX_VLAN_VIDS) {
+		netdev_warn(dev,
+			    "tried to add vlan id %u but NCSI max already registered (%u)\n",
+			    vid, NCSI_MAX_VLAN_VIDS);
+		return -ENOSPC;
 	}
 
 	vlan = kzalloc(sizeof(*vlan), GFP_KERNEL);
-- 
2.14.2
