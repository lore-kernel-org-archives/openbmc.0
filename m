Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTFCS5YgSzDr4K
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 16:17:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="w98nioBF"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gppEmzuD"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8222455CC;
 Fri, 11 Aug 2017 02:17:06 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute2.internal (MEProxy); Fri, 11 Aug 2017 02:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=COHl/MQOa1oW66w0FBX9DyOacjlbDXLzhd/34JsuS
 UM=; b=w98nioBF+6mDtorKAQ9i/NwcP47+3eb8LKA406ZbVnP3Vmc7SYdDvtla+
 VY1Difzx1htn8Bbi3TJ1izT3rrQdZRqclN++TmW0foSGqDZc3vs3DAbDyKUtoEUI
 xFfhs7+JmM1HvcsMXvgtr0bV6sYXMy8PhS834mLAMqgwY99CI/vX8lcE4Oluvo2e
 T/Uac8I+Vc7fVpDYg4cF1OkAKyM8MyUW6DhW/1wQLObk3uZfIrQQWYWyrJ4vg5XD
 0fUnMYr4VyV80kyWAoVhPB/Gy/kAJ9FDIlh3nL0xnE7PoHQreq7rmSI7qAjFnTjz
 3y8bQFPqElcEozYiOZGLoIJazzXsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=COHl/MQOa1oW66w0FBX9DyOacjlbDXLzhd/34JsuS
 UM=; b=gppEmzuDEUcR0h+ArqOTBzrNqdVSQ68AaX4aR+QvHSjOZPzkeLW2nH/bR
 vOw1f+Bhf24bRKpHZYojCCRpFJFzkjSqQ0qafu7Gn5L4rbpPdh2VdxXHLfmLSO6l
 dJ6UXsONqQje/cuNA73l2mPQLwIUJ/ojFyBRNUsPqS51jYCNJCJ2ntW6jM2WNp5R
 WK0dzoQTEkHRaRtu9vyCETQmJJnBQtoNYm/MMXUiR6Z0AcgjFDSurS5z5KpsTsv4
 EL18B2Q5xoUefCyd2ZJG4aHrAjXphGvv9VOhGw94zX4BRAD1ZK1zY5co+cxpwTBl
 EwhDwDAZlihUklYzO4g3SSdR15hGQ==
X-ME-Sender: <xms:4kuNWdd2Cg1_SZx68iXlETsEVJwAn-rVXM3vLMP6XBRff3s9oyhG-A>
X-Sasl-enc: y1cmsfXuUYcAF1wYcgTqPHS5/tHga2bd1tOtiF5ALfam 1502432225
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 85A502478C;
 Fri, 11 Aug 2017 02:17:03 -0400 (EDT)
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, ratagupt@in.ibm.com
Subject: [PATCH 1/3] ftgmac: Include NETIF_F_HW_VLAN_CTAG_FILTER in features
Date: Fri, 11 Aug 2017 16:16:46 +1000
Message-Id: <20170811061648.19661-2-sam@mendozajonas.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170811061648.19661-1-sam@mendozajonas.com>
References: <20170811061648.19661-1-sam@mendozajonas.com>
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
X-List-Received-Date: Fri, 11 Aug 2017 06:17:09 -0000

This is required for the VLAN core to call the add/kill callback for
VLAN IDs. 'ftgmac100' already supports VLAN tagging but this flag lets
the network stack know that we want to be notified of VLAN tags being
added or removed when we have NCSI support.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 33b5c8eb9961..7c4d772287c7 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1837,6 +1837,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
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
