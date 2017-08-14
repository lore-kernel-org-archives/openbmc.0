Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xVyjR1LpRzDqms
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 11:30:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="ZyF9FpWi"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EJ9XbxdK"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id C90A92E3E;
 Sun, 13 Aug 2017 21:30:32 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Sun, 13 Aug 2017 21:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hdE5PM7QBp1MLw5ohR2v7nakMGVbl29QPM1LdsLct
 KY=; b=ZyF9FpWiek1rqZfOwT8O+VCzhmfrd068kEgugQ7d4UzV0A4XhAe60ukpF
 eubxJ79WvWia1fsG8MWlDnb5HodCiE6zqzAurnoq7bHO7p1iE0u2OpfjxwvIjhAT
 7+KLeAUlf/WAatIritpAjHwX+178RBgpUweWjZOj65nQUMkJz2nd4uAXhINT2+rh
 8mH0hfJ7xxwHfcJR/xCYis+eCLll5i6uL6X8W2WVtfB7YYRMh+JP1VD3P402Sxcs
 5KUtV/gy9cm/RDmx+PUAVttr1/Q+A80qeNWEWG07tu92J70uNmz1AaMLjAfZGbam
 z2reFujOvkbMpZ0QO+0rq4QULeRjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hdE5PM7QBp1MLw5ohR2v7nakMGVbl29QPM1LdsLct
 KY=; b=EJ9XbxdK0oQ3uLeha8brlZlnCmHjbywiqkf2JtJJAetQB3ylPqmwiSFzu
 4o++ChNmxLc79ba4w6Kegdta1hagwsPCF71nb99u7ZpkPU9W/CgsRfJkjWnrMtM3
 sEPD2lXX5Hw3CqdBAhYoSe8FTerkFAM0ogsOIPzudc484tRIxi33c9z7k7vGHTtC
 btznQ1J2fjTP58aoDbfaP5lxWUC7pNbzP0TGtEgnwerQhWXiybiYmWL4po/Vm+ml
 ElKS8M5VQVnY3gFw7biiYEVAmARI+LEBVZtivpj+roLESkhHGwE+qLvyWyAf9/7+
 X+QbEJy87khlh/vGjpdqEdgy5Ezdw==
X-ME-Sender: <xms:OP2QWV2gOSeo12yqP_6BsP9doIx4ksoCmCbhmbUUCJnSKipoc9alzg>
X-Sasl-enc: UDjQssIMD2kOv4cna8DQ5n2Wt2mB/KOscFSkhJ0Mf5lH 1502674231
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id D71637FA67;
 Sun, 13 Aug 2017 21:30:29 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, ratagupt@in.ibm.com
Subject: [PATCH net-next v2 3/3] ftgmac100: Support NCSI VLAN filtering when
 available
Date: Mon, 14 Aug 2017 11:29:52 +1000
Message-Id: <20170814012952.13740-4-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170814012952.13740-1-sam@mendozajonas.com>
References: <20170814012952.13740-1-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 14 Aug 2017 01:30:35 -0000

Register the ndo_vlan_rx_{add,kill}_vid callbacks and set the
NETIF_F_HW_VLAN_CTAG_FILTER if NCSI is available.
This allows the VLAN core to notify the NCSI driver when changes occur
so that the remote NCSI channel can be properly configured to filter on
the set VLAN tags.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
v2: Moved ftgmac100 change into same patch and reordered

 drivers/net/ethernet/faraday/ftgmac100.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 34dae51effd4..05fe7123d5ae 100644
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
@@ -1837,6 +1839,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		NETIF_F_GRO | NETIF_F_SG | NETIF_F_HW_VLAN_CTAG_RX |
 		NETIF_F_HW_VLAN_CTAG_TX;
 
+	if (priv->use_ncsi)
+		netdev->hw_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+
 	/* AST2400  doesn't have working HW checksum generation */
 	if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac")))
 		netdev->hw_features &= ~NETIF_F_HW_CSUM;
-- 
2.14.0
