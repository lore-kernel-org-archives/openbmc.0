Return-Path: <sam@mendozajonas.com>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xghRw3p2jzDq8X
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 16:19:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="Lp3EIILM"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qH2frM7g"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D53420D67;
 Mon, 28 Aug 2017 02:19:06 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Mon, 28 Aug 2017 02:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hdE5PM7QBp1MLw5ohR2v7nakMGVbl29QPM1LdsLct
 KY=; b=Lp3EIILMj86vNzSIZHpWCZ0JIvy7iqwaR+4WJzE7Yj3/Fq1Rq9DNGpr5u
 y8CW9uxd0cYX39oh73akyU2n7ZkWFb2tMfRKwTdphCbu4zzK+toTMHWufIGDAs77
 otb1poyjHyzrQadckJZMYDEnPJGEdZfKsu5Qc2x/WyYwic22DoZHUhNAO1kWR4ta
 B8jtg6a5TpaZDVMz3VY0XOuplUTikGBGxhg6OSn+guP0wAw1M1fpbCiEP2FLp3+b
 YrVghHjSUScv8cHfnmeMtfxGEfqCdbuAaoFlevR2KK3mc7bVHOvmv/fEBlwg5hB9
 a6geMaP05BNLezkhuAA71nkaUju7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=hdE5PM7QBp1MLw5ohR2v7nakMGVbl29QPM1LdsLct
 KY=; b=qH2frM7gdPWlCEfkjyPTOLpNJORhmQOLLHQY1fgB9Hxij0Fm61uj1cj1P
 IoPvADZ89SpIf5DrJYoPNxKe1roZh8z4xMkH0HIZ+FY8yrKhd53NF79VPu2lyXZz
 Lna3+i3Qi4d84MpQve178YGhrrEoPvqc624PR/BOmgfZSLYFy+kCCkZcM000FblD
 PBkNWVPZPxdkCu/IM41wkPjyVBos+hJ1QT2GYgMuv6EqkvzsR4Udo48eOF1DdtrD
 eCg6invVGKfEMrJBCkXue6lAB3RA4LA+4rE+tAPg9935aGe7HmKWktfaeG+CQv3o
 oXwcZT7zVaACbCsuzojNqh2OzkjSA==
X-ME-Sender: <xms:2rWjWX7cMJeAEukv_c6bwsobJKuj1jElD_pJA90oIeHWCuyg8HT9Sw>
X-Sasl-enc: O8KL7lzj6IsMyJXY9fRq36URg7ptdGUmNOpGdpGYwelR 1503901145
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 829857E271;
 Mon, 28 Aug 2017 02:19:03 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, ratagupt@in.ibm.com
Subject: [PATCH net-next v3 3/3] ftgmac100: Support NCSI VLAN filtering when
 available
Date: Mon, 28 Aug 2017 16:18:43 +1000
Message-Id: <20170828061843.24349-4-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170828061843.24349-1-sam@mendozajonas.com>
References: <20170828061843.24349-1-sam@mendozajonas.com>
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
X-List-Received-Date: Mon, 28 Aug 2017 06:19:09 -0000

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
