Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zC9NH13bbzDqnt
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jan 2018 01:36:27 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w04EITt1003011;
 Thu, 4 Jan 2018 16:18:30 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 54A875A951; Thu,  4 Jan 2018 16:36:16 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH linux dev-4.13 v1] net: stmmac: bypass for lpi eee hang issue
Date: Thu,  4 Jan 2018 16:36:13 +0200
Message-Id: <1515076573-6732-1-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
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
X-List-Received-Date: Thu, 04 Jan 2018 14:36:32 -0000

Bypass for lpi eee hang issue in the
STMicroelectronics 10/100/1000 Ethernet driver

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 27 +++++++++++++++++------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index a916e13624eb..c19bec963e28 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -136,6 +136,7 @@ struct stmmac_priv {
 	int use_riwt;
 	int irq_wake;
 	spinlock_t ptp_lock;
+	spinlock_t lpi_lock;
 	void __iomem *mmcaddr;
 	void __iomem *ptpaddr;
 	u32 mss;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1763e48c84e2..4c8c7a463f40 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -333,9 +333,13 @@ static void stmmac_enable_eee_mode(struct stmmac_priv *priv)
  */
 void stmmac_disable_eee_mode(struct stmmac_priv *priv)
 {
+	unsigned long flags;
+
 	priv->hw->mac->reset_eee_mode(priv->hw);
 	del_timer_sync(&priv->eee_ctrl_timer);
+	spin_lock_irqsave(&priv->lpi_lock, flags);
 	priv->tx_path_in_lpi_mode = false;
+	spin_unlock_irqrestore(&priv->lpi_lock, flags);
 }
 
 /**
@@ -1872,6 +1876,7 @@ static void stmmac_tx_clean(struct stmmac_priv *priv, u32 queue)
 
 	netdev_tx_completed_queue(netdev_get_tx_queue(priv->dev, queue),
 				  pkts_compl, bytes_compl);
+	netif_tx_unlock(priv->dev);
 
 	if (unlikely(netif_tx_queue_stopped(netdev_get_tx_queue(priv->dev,
 								queue))) &&
@@ -1882,11 +1887,16 @@ static void stmmac_tx_clean(struct stmmac_priv *priv, u32 queue)
 		netif_tx_wake_queue(netdev_get_tx_queue(priv->dev, queue));
 	}
 
-	if ((priv->eee_enabled) && (!priv->tx_path_in_lpi_mode)) {
-		stmmac_enable_eee_mode(priv);
-		mod_timer(&priv->eee_ctrl_timer, STMMAC_LPI_T(eee_timer));
+	if (priv->eee_enabled) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&priv->lpi_lock, flags);
+		if (!priv->tx_path_in_lpi_mode)
+			mod_timer(&priv->eee_ctrl_timer,
+				  STMMAC_LPI_T(eee_timer));
+
+		spin_unlock_irqrestore(&priv->lpi_lock, flags);
 	}
-	netif_tx_unlock(priv->dev);
 }
 
 static inline void stmmac_enable_dma_irq(struct stmmac_priv *priv, u32 chan)
@@ -2968,6 +2978,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	unsigned int enh_desc;
 	unsigned int des;
 
+	if (priv->tx_path_in_lpi_mode)
+		stmmac_disable_eee_mode(priv);
+
 	tx_q = &priv->tx_queue[queue];
 
 	/* Manage oversized TCP frames for GMAC4 device */
@@ -2988,9 +3001,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 		return NETDEV_TX_BUSY;
 	}
 
-	if (priv->tx_path_in_lpi_mode)
-		stmmac_disable_eee_mode(priv);
-
 	entry = tx_q->cur_tx;
 	first_entry = entry;
 
@@ -3638,11 +3648,13 @@ static irqreturn_t stmmac_interrupt(int irq, void *dev_id)
 							    &priv->xstats);
 
 		if (unlikely(status)) {
+			spin_lock(&priv->lpi_lock);
 			/* For LPI we need to save the tx status */
 			if (status & CORE_IRQ_TX_PATH_IN_LPI_MODE)
 				priv->tx_path_in_lpi_mode = true;
 			if (status & CORE_IRQ_TX_PATH_EXIT_LPI_MODE)
 				priv->tx_path_in_lpi_mode = false;
+			spin_unlock(&priv->lpi_lock);
 		}
 
 		if (priv->synopsys_id >= DWMAC_CORE_4_00) {
@@ -4196,6 +4208,7 @@ int stmmac_dvr_probe(struct device *device,
 	}
 
 	spin_lock_init(&priv->lock);
+	spin_lock_init(&priv->lpi_lock);
 
 	/* If a specific clk_csr value is passed from the platform
 	 * this means that the CSR Clock Range selection cannot be
-- 
2.14.1
