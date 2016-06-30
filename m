Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgG3915Z3zDqmQ
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:20 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5UANaxO026825
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:19 -0400
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23uuhuuw08-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:19 -0400
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 30 Jun 2016 20:28:16 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 30 Jun 2016 20:28:14 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 388313578052
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:14 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5UASEp522151376
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:14 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5UASDHs008730
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:14 +1000
Received: from gwshan ([9.192.205.20])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u5UASATo008555; Thu, 30 Jun 2016 20:28:13 +1000
Received: by gwshan (Postfix, from userid 1000)
 id 5426894348E; Thu, 30 Jun 2016 20:28:07 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: benh@kernel.crashing.org, joel@jms.id.au, gwshan@linux.vnet.ibm.com
Subject: [PATCH 10/10] net/farady: Mask PHY interrupt with NCSI mode
Date: Thu, 30 Jun 2016 20:27:51 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16063010-0044-0000-0000-000001BBEF80
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16063010-0045-0000-0000-000005096E50
Message-Id: <1467282471-16560-11-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606300099
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
X-List-Received-Date: Thu, 30 Jun 2016 10:28:21 -0000

Bogus PHY interrupts are observed. This masks the PHY interrupt
when the interface works in NCSI mode as there is no attached
PHY under the circumstance.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 23e27f1..6642071 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -74,6 +74,7 @@ struct ftgmac100 {
 
 	struct mii_bus *mii_bus;
 	int old_speed;
+	int int_mask_all;
 	bool use_ncsi;
 	bool enabled;
 };
@@ -84,14 +85,6 @@ static int ftgmac100_alloc_rx_page(struct ftgmac100 *priv,
 /******************************************************************************
  * internal functions (hardware register access)
  *****************************************************************************/
-#define INT_MASK_ALL_ENABLED	(FTGMAC100_INT_RPKT_LOST	| \
-				 FTGMAC100_INT_XPKT_ETH		| \
-				 FTGMAC100_INT_XPKT_LOST	| \
-				 FTGMAC100_INT_AHB_ERR		| \
-				 FTGMAC100_INT_PHYSTS_CHG	| \
-				 FTGMAC100_INT_RPKT_BUF		| \
-				 FTGMAC100_INT_NO_RXBUF)
-
 static void ftgmac100_set_rx_ring_base(struct ftgmac100 *priv, dma_addr_t addr)
 {
 	iowrite32(addr, priv->base + FTGMAC100_OFFSET_RXR_BADR);
@@ -1061,8 +1054,9 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
 		ftgmac100_tx_complete(priv);
 	}
 
-	if (status & (FTGMAC100_INT_NO_RXBUF | FTGMAC100_INT_RPKT_LOST |
-		      FTGMAC100_INT_AHB_ERR | FTGMAC100_INT_PHYSTS_CHG)) {
+	if (status & priv->int_mask_all & (FTGMAC100_INT_NO_RXBUF |
+			FTGMAC100_INT_RPKT_LOST | FTGMAC100_INT_AHB_ERR |
+			FTGMAC100_INT_PHYSTS_CHG)) {
 		if (net_ratelimit())
 			netdev_info(netdev, "[ISR] = 0x%x: %s%s%s%s\n", status,
 				    status & FTGMAC100_INT_NO_RXBUF ? "NO_RXBUF " : "",
@@ -1085,7 +1079,7 @@ static int ftgmac100_poll(struct napi_struct *napi, int budget)
 		napi_complete(napi);
 
 		/* enable all interrupts */
-		iowrite32(INT_MASK_ALL_ENABLED, priv->base + FTGMAC100_OFFSET_IER);
+		iowrite32(priv->int_mask_all, priv->base + FTGMAC100_OFFSET_IER);
 	}
 
 	return rx;
@@ -1131,7 +1125,7 @@ static int ftgmac100_open(struct net_device *netdev)
 	netif_start_queue(netdev);
 
 	/* enable all interrupts */
-	iowrite32(INT_MASK_ALL_ENABLED, priv->base + FTGMAC100_OFFSET_IER);
+	iowrite32(priv->int_mask_all, priv->base + FTGMAC100_OFFSET_IER);
 
 	/* Start the NCSI device */
 	if (priv->use_ncsi) {
@@ -1363,10 +1357,19 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	/* MAC address from chip or random one */
 	ftgmac100_setup_mac(priv);
 
+	priv->int_mask_all = (FTGMAC100_INT_RPKT_LOST |
+			      FTGMAC100_INT_XPKT_ETH |
+			      FTGMAC100_INT_XPKT_LOST |
+			      FTGMAC100_INT_AHB_ERR |
+			      FTGMAC100_INT_PHYSTS_CHG |
+			      FTGMAC100_INT_RPKT_BUF |
+			      FTGMAC100_INT_NO_RXBUF);
 	if (pdev->dev.of_node &&
 	    (of_get_property(pdev->dev.of_node, "use-nc-si", NULL) ||
 	    of_get_property(pdev->dev.of_node, "use-ncsi", NULL))) {
 		dev_info(&pdev->dev, "Using NCSI interface\n");
+
+		priv->int_mask_all &= ~FTGMAC100_INT_PHYSTS_CHG;
 		priv->use_ncsi = true;
 		priv->ndev = ncsi_register_dev(netdev, ftgmac100_ncsi_handler);
 		if (!priv->ndev)
-- 
2.1.0
