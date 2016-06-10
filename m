Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQqN3238GzDqHY
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 14:44:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=pNORKPVY; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id ACFCD604078;
 Thu,  9 Jun 2016 21:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 xVjv9GZiHQyGWy34bCtdAI9CHvs=; b=pNORKPVYZt+mqpO+caWWNvic9g6mYS1J
 gYklDnXjDohcqCoLwuEl9atQ6KsdcncAWrGy5LsRMVnTpvwZQwqKfUlV2ZmLgOFn
 YR0AmlHHXBHidpMaRi9Xihk5If+Aw6xNX3SJU2SQxACwGgLgLEyZlm+SvJRRtsCK
 kdQhdiRPGtI=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 80498604061;
 Thu,  9 Jun 2016 21:44:48 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>, Gavin Shan <gwshan@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux 3/4] ftgmac100: Add devicetree option for the Aspeed g5
 register interface
Date: Fri, 10 Jun 2016 14:14:28 +0930
Message-Id: <1465533869-3218-4-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
References: <1465533869-3218-1-git-send-email-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 04:44:51 -0000

Amongst other small changes, the g5 SoCs shift the bits used to signal
EDORR/EDOTR states. Abstract over the difference by making the masks
variable and configuring them from the device tree.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

It's likely that Joel's query on passing both priv and rxdes/txdes also applied
to this patch. The functions of interest are:

ftgmac100_txdes_reset():

         We can use ftgmac100_current_clean_txdes() internally iff
         ftgmac100_tx_clean_pointer_advance() is not called before
         ftgmac100_txdes_reset(). It probably won't be, but it feels like a
         dangerous assumption.

ftgmac100_rxdes_set_dma_own():

         Has 3 call-sites, two use the current rxdes pointer, but one call-site
         is unclear; this is again in ftgmac100_alloc_rx_page(), where the
         rxdes of interest is passed in as a parameter.

ftgmac100_rxdes_set_end_of_ring():

         There's only one call-site, where the last descriptor in the array is
         marked as the end-of-ring. Here we could just pass priv.

ftgmac100_txdes_set_end_of_ring():

         There's only one call-site, where the last descriptor in the array is
         marked as the end-of-ring. Here we could just pass priv.

Overall, in some cases we can't accomodate the suggestion, in other cases it's
murky, and sometimes we could. However, for consistency, I think it's best we
take the one explicit approach.

 drivers/net/ethernet/faraday/ftgmac100.c | 51 ++++++++++++++++++++++----------
 drivers/net/ethernet/faraday/ftgmac100.h |  2 --
 2 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index f7d61c4703cf..9f7ca81718fa 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -79,6 +79,9 @@ struct ftgmac100 {
 
 	bool use_ncsi;
 	bool enabled;
+
+	u32 rxdes0_edorr_mask;
+	u32 txdes0_edotr_mask;
 };
 
 static int ftgmac100_alloc_rx_page(struct ftgmac100 *priv,
@@ -268,10 +271,11 @@ static bool ftgmac100_rxdes_packet_ready(struct ftgmac100_rxdes *rxdes)
 	return rxdes->rxdes0 & cpu_to_le32(FTGMAC100_RXDES0_RXPKT_RDY);
 }
 
-static void ftgmac100_rxdes_set_dma_own(struct ftgmac100_rxdes *rxdes)
+static void ftgmac100_rxdes_set_dma_own(const struct ftgmac100 *priv,
+					struct ftgmac100_rxdes *rxdes)
 {
 	/* clear status bits */
-	rxdes->rxdes0 &= cpu_to_le32(FTGMAC100_RXDES0_EDORR);
+	rxdes->rxdes0 &= cpu_to_le32(priv->rxdes0_edorr_mask);
 }
 
 static bool ftgmac100_rxdes_rx_error(struct ftgmac100_rxdes *rxdes)
@@ -309,9 +313,10 @@ static bool ftgmac100_rxdes_multicast(struct ftgmac100_rxdes *rxdes)
 	return rxdes->rxdes0 & cpu_to_le32(FTGMAC100_RXDES0_MULTICAST);
 }
 
-static void ftgmac100_rxdes_set_end_of_ring(struct ftgmac100_rxdes *rxdes)
+static void ftgmac100_rxdes_set_end_of_ring(const struct ftgmac100 *priv,
+					    struct ftgmac100_rxdes *rxdes)
 {
-	rxdes->rxdes0 |= cpu_to_le32(FTGMAC100_RXDES0_EDORR);
+	rxdes->rxdes0 |= cpu_to_le32(priv->rxdes0_edorr_mask);
 }
 
 static void ftgmac100_rxdes_set_dma_addr(struct ftgmac100_rxdes *rxdes,
@@ -402,7 +407,7 @@ ftgmac100_rx_locate_first_segment(struct ftgmac100 *priv)
 		if (ftgmac100_rxdes_first_segment(rxdes))
 			return rxdes;
 
-		ftgmac100_rxdes_set_dma_own(rxdes);
+		ftgmac100_rxdes_set_dma_own(priv, rxdes);
 		ftgmac100_rx_pointer_advance(priv);
 		rxdes = ftgmac100_current_rxdes(priv);
 	}
@@ -473,7 +478,7 @@ static void ftgmac100_rx_drop_packet(struct ftgmac100 *priv)
 		if (ftgmac100_rxdes_last_segment(rxdes))
 			done = true;
 
-		ftgmac100_rxdes_set_dma_own(rxdes);
+		ftgmac100_rxdes_set_dma_own(priv, rxdes);
 		ftgmac100_rx_pointer_advance(priv);
 		rxdes = ftgmac100_current_rxdes(priv);
 	} while (!done && ftgmac100_rxdes_packet_ready(rxdes));
@@ -565,10 +570,11 @@ static bool ftgmac100_rx_packet(struct ftgmac100 *priv, int *processed)
 /******************************************************************************
  * internal functions (transmit descriptor)
  *****************************************************************************/
-static void ftgmac100_txdes_reset(struct ftgmac100_txdes *txdes)
+static void ftgmac100_txdes_reset(const struct ftgmac100 *priv,
+				  struct ftgmac100_txdes *txdes)
 {
 	/* clear all except end of ring bit */
-	txdes->txdes0 &= cpu_to_le32(FTGMAC100_TXDES0_EDOTR);
+	txdes->txdes0 &= cpu_to_le32(priv->txdes0_edotr_mask);
 	txdes->txdes1 = 0;
 	txdes->txdes2 = 0;
 	txdes->txdes3 = 0;
@@ -589,9 +595,10 @@ static void ftgmac100_txdes_set_dma_own(struct ftgmac100_txdes *txdes)
 	txdes->txdes0 |= cpu_to_le32(FTGMAC100_TXDES0_TXDMA_OWN);
 }
 
-static void ftgmac100_txdes_set_end_of_ring(struct ftgmac100_txdes *txdes)
+static void ftgmac100_txdes_set_end_of_ring(const struct ftgmac100 *priv,
+					    struct ftgmac100_txdes *txdes)
 {
-	txdes->txdes0 |= cpu_to_le32(FTGMAC100_TXDES0_EDOTR);
+	txdes->txdes0 |= cpu_to_le32(priv->txdes0_edotr_mask);
 }
 
 static void ftgmac100_txdes_set_first_segment(struct ftgmac100_txdes *txdes)
@@ -710,7 +717,7 @@ static bool ftgmac100_tx_complete_packet(struct ftgmac100 *priv)
 
 	dev_kfree_skb(skb);
 
-	ftgmac100_txdes_reset(txdes);
+	ftgmac100_txdes_reset(priv, txdes);
 
 	ftgmac100_tx_clean_pointer_advance(priv);
 
@@ -801,7 +808,7 @@ static int ftgmac100_alloc_rx_page(struct ftgmac100 *priv,
 
 	ftgmac100_rxdes_set_page(priv, rxdes, page);
 	ftgmac100_rxdes_set_dma_addr(rxdes, map);
-	ftgmac100_rxdes_set_dma_own(rxdes);
+	ftgmac100_rxdes_set_dma_own(priv, rxdes);
 	return 0;
 }
 
@@ -840,6 +847,8 @@ static void ftgmac100_free_buffers(struct ftgmac100 *priv)
 static int ftgmac100_alloc_buffers(struct ftgmac100 *priv)
 {
 	int i;
+	struct ftgmac100_rxdes *rxdes;
+	struct ftgmac100_txdes *txdes;
 
 	priv->descs = dma_zalloc_coherent(priv->dev,
 					  sizeof(struct ftgmac100_descs),
@@ -848,17 +857,19 @@ static int ftgmac100_alloc_buffers(struct ftgmac100 *priv)
 		return -ENOMEM;
 
 	/* initialize RX ring */
-	ftgmac100_rxdes_set_end_of_ring(&priv->descs->rxdes[RX_QUEUE_ENTRIES - 1]);
+	rxdes = &priv->descs->rxdes[RX_QUEUE_ENTRIES - 1];
+	ftgmac100_rxdes_set_end_of_ring(priv, rxdes);
 
 	for (i = 0; i < RX_QUEUE_ENTRIES; i++) {
-		struct ftgmac100_rxdes *rxdes = &priv->descs->rxdes[i];
+		rxdes = &priv->descs->rxdes[i];
 
 		if (ftgmac100_alloc_rx_page(priv, rxdes, GFP_KERNEL))
 			goto err;
 	}
 
 	/* initialize TX ring */
-	ftgmac100_txdes_set_end_of_ring(&priv->descs->txdes[TX_QUEUE_ENTRIES - 1]);
+	txdes = &priv->descs->txdes[TX_QUEUE_ENTRIES - 1];
+	ftgmac100_txdes_set_end_of_ring(priv, txdes);
 	return 0;
 
 err:
@@ -1346,6 +1358,15 @@ static int ftgmac100_probe(struct platform_device *pdev)
 		priv->use_ncsi = false;
 	}
 
+	if (pdev->dev.of_node &&
+	    of_get_property(pdev->dev.of_node, "aspeed-g5-interface", NULL)) {
+		priv->rxdes0_edorr_mask = (1 << 30);
+		priv->txdes0_edotr_mask = (1 << 30);
+	} else {
+		priv->rxdes0_edorr_mask = (1 << 15);
+		priv->txdes0_edotr_mask = (1 << 15);
+	}
+
 	netdev->ethtool_ops = &ftgmac100_ethtool_ops;
 	netdev->netdev_ops = &ftgmac100_netdev_ops;
 	if (pdev->dev.of_node &&
diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
index 13408d448b05..c258586ce4a4 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.h
+++ b/drivers/net/ethernet/faraday/ftgmac100.h
@@ -189,7 +189,6 @@ struct ftgmac100_txdes {
 } __attribute__ ((aligned(16)));
 
 #define FTGMAC100_TXDES0_TXBUF_SIZE(x)	((x) & 0x3fff)
-#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
 #define FTGMAC100_TXDES0_CRC_ERR	(1 << 19)
 #define FTGMAC100_TXDES0_LTS		(1 << 28)
 #define FTGMAC100_TXDES0_FTS		(1 << 29)
@@ -215,7 +214,6 @@ struct ftgmac100_rxdes {
 } __attribute__ ((aligned(16)));
 
 #define FTGMAC100_RXDES0_VDBC		0x3fff
-#define FTGMAC100_RXDES0_EDORR		(1 << 15)
 #define FTGMAC100_RXDES0_MULTICAST	(1 << 16)
 #define FTGMAC100_RXDES0_BROADCAST	(1 << 17)
 #define FTGMAC100_RXDES0_RX_ERR		(1 << 18)
-- 
2.7.4
