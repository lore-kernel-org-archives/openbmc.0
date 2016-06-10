Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQqN162X7zDq5s
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 14:44:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=MY8TSK9P; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 208A5604076;
 Thu,  9 Jun 2016 21:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 jpB/VRL1WErqP7NkBuwvjugxWcM=; b=MY8TSK9PdDSbTmGUGAOjazIkuOy/+mz/
 ZspxjDg8slVH0oqjL8O7nlhOkO/Z4qpTzzjcWMYSyJrzc9p9npOtxdSA1cjM/0UW
 JAzJvS+hf9o7Fgst7pk/9TBkMhHvY1tIj2eeU1RN4YxhXeOvdqHfZoqsP1Mp8Wdo
 gvzVQoJGQIQ=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id E6C40604061;
 Thu,  9 Jun 2016 21:44:46 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>, Gavin Shan <gwshan@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux 2/4] ftgmac100: Separate rx page storage from rxdesc
Date: Fri, 10 Jun 2016 14:14:27 +0930
Message-Id: <1465533869-3218-3-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 10 Jun 2016 04:44:50 -0000

The ftgmac100 hardware revision in e.g. the Aspeed AST2500 no longer
reserves all bits in RXDES#2 but instead uses the bottom 16 bits to
store MAC frame metadata. Avoid corruption by shifting struct page
pointers out to their own member in struct ftgmac100.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

Joel asked if we could avoid passing both priv and rxdes to the get/set
helpers.  From a quick investigation the answer appears to be no: If we were to
do so we'd need a consistent way to determine the rxdes of interest.
ftgmac100_rxdes_get_page() has two call sites that do not have a common
approach to computing the rxdes of interest. ftgmac100_rxdes_set_page() has one
call site in ftgmac100_alloc_rx_page(), but the rxdes of interest is passed as
an argument to ftgmac100_alloc_rx_page() and so without cross-function analysis
I don't think we claim that there's a consistent means, or would be in the
future.

 drivers/net/ethernet/faraday/ftgmac100.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 28fa52ebff31..f7d61c4703cf 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -60,6 +60,8 @@ struct ftgmac100 {
 	struct ftgmac100_descs *descs;
 	dma_addr_t descs_dma_addr;
 
+	struct page *rx_pages[RX_QUEUE_ENTRIES];
+
 	unsigned int rx_pointer;
 	unsigned int tx_clean_pointer;
 	unsigned int tx_pointer;
@@ -350,18 +352,27 @@ static bool ftgmac100_rxdes_ipcs_err(struct ftgmac100_rxdes *rxdes)
 	return rxdes->rxdes1 & cpu_to_le32(FTGMAC100_RXDES1_IP_CHKSUM_ERR);
 }
 
+static struct page **ftgmac100_rxdes_page_slot(struct ftgmac100 *priv,
+					       struct ftgmac100_rxdes *rxdes)
+{
+	return &priv->rx_pages[rxdes - priv->descs->rxdes];
+}
+
 /*
  * rxdes2 is not used by hardware. We use it to keep track of page.
  * Since hardware does not touch it, we can skip cpu_to_le32()/le32_to_cpu().
  */
-static void ftgmac100_rxdes_set_page(struct ftgmac100_rxdes *rxdes, struct page *page)
+static void ftgmac100_rxdes_set_page(struct ftgmac100 *priv,
+				     struct ftgmac100_rxdes *rxdes,
+				     struct page *page)
 {
-	rxdes->rxdes2 = (unsigned int)page;
+	*ftgmac100_rxdes_page_slot(priv, rxdes) = page;
 }
 
-static struct page *ftgmac100_rxdes_get_page(struct ftgmac100_rxdes *rxdes)
+static struct page *ftgmac100_rxdes_get_page(struct ftgmac100 *priv,
+					     struct ftgmac100_rxdes *rxdes)
 {
-	return (struct page *)rxdes->rxdes2;
+	return *ftgmac100_rxdes_page_slot(priv, rxdes);
 }
 
 /******************************************************************************
@@ -510,7 +521,7 @@ static bool ftgmac100_rx_packet(struct ftgmac100 *priv, int *processed)
 
 	do {
 		dma_addr_t map = ftgmac100_rxdes_get_dma_addr(rxdes);
-		struct page *page = ftgmac100_rxdes_get_page(rxdes);
+		struct page *page = ftgmac100_rxdes_get_page(priv, rxdes);
 		unsigned int size;
 
 		dma_unmap_page(priv->dev, map, RX_BUF_SIZE, DMA_FROM_DEVICE);
@@ -788,7 +799,7 @@ static int ftgmac100_alloc_rx_page(struct ftgmac100 *priv,
 		return -ENOMEM;
 	}
 
-	ftgmac100_rxdes_set_page(rxdes, page);
+	ftgmac100_rxdes_set_page(priv, rxdes, page);
 	ftgmac100_rxdes_set_dma_addr(rxdes, map);
 	ftgmac100_rxdes_set_dma_own(rxdes);
 	return 0;
@@ -800,7 +811,7 @@ static void ftgmac100_free_buffers(struct ftgmac100 *priv)
 
 	for (i = 0; i < RX_QUEUE_ENTRIES; i++) {
 		struct ftgmac100_rxdes *rxdes = &priv->descs->rxdes[i];
-		struct page *page = ftgmac100_rxdes_get_page(rxdes);
+		struct page *page = ftgmac100_rxdes_get_page(priv, rxdes);
 		dma_addr_t map = ftgmac100_rxdes_get_dma_addr(rxdes);
 
 		if (!page)
-- 
2.7.4
