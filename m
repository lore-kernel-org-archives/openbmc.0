Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41R3n35QwHzF35c;
 Thu, 12 Jul 2018 15:06:15 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w6C552bL023038;
 Thu, 12 Jul 2018 00:05:03 -0500
Message-ID: <1d5c1d9b3ad5fe030e7ef6363e69e56dcba7c5bc.camel@kernel.crashing.org>
Subject: [PATCH] usb: gadget: aspeed: Workaround memory ordering issue
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, Ryan Chen <ryanchen.aspeed@gmail.com>,
 linux-aspeed@lists.ozlabs.org
Date: Thu, 12 Jul 2018 15:05:02 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 05:06:16 -0000

The Aspeed SoC has a memory ordering issue that (thankfully)
only affects the USB gadget device. A read back is necessary
after writing to memory and before letting the device DMA
from it.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c  |  2 ++
 drivers/usb/gadget/udc/aspeed-vhub/epn.c  | 14 +++++++---
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h | 33 +++++++++++++++++++++++
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
index 44f2b3b53b2f..e2927fb083cf 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
@@ -219,6 +219,8 @@ static void ast_vhub_ep0_do_send(struct ast_vhub_ep *ep,
 	if (chunk && req->req.buf)
 		memcpy(ep->buf, req->req.buf + req->req.actual, chunk);
 
+	vhub_dma_workaround(ep->buf);
+
 	/* Remember chunk size and trigger send */
 	reg = VHUB_EP0_SET_TX_LEN(chunk);
 	writel(reg, ep->ep0.ctlstat);
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
index 80c9feac5147..5939eb1e97f2 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
@@ -66,11 +66,16 @@ static void ast_vhub_epn_kick(struct ast_vhub_ep *ep, struct ast_vhub_req *req)
 	if (!req->req.dma) {
 
 		/* For IN transfers, copy data over first */
-		if (ep->epn.is_in)
+		if (ep->epn.is_in) {
 			memcpy(ep->buf, req->req.buf + act, chunk);
+			vhub_dma_workaround(ep->buf);
+		}
 		writel(ep->buf_dma, ep->epn.regs + AST_VHUB_EP_DESC_BASE);
-	} else
+	} else {
+		if (ep->epn.is_in)
+			vhub_dma_workaround(req->req.buf);
 		writel(req->req.dma + act, ep->epn.regs + AST_VHUB_EP_DESC_BASE);
+	}
 
 	/* Start DMA */
 	req->active = true;
@@ -161,6 +166,7 @@ static inline unsigned int ast_vhub_count_free_descs(struct ast_vhub_ep *ep)
 static void ast_vhub_epn_kick_desc(struct ast_vhub_ep *ep,
 				   struct ast_vhub_req *req)
 {
+	struct ast_vhub_desc *desc = NULL;
 	unsigned int act = req->act_count;
 	unsigned int len = req->req.length;
 	unsigned int chunk;
@@ -177,7 +183,6 @@ static void ast_vhub_epn_kick_desc(struct ast_vhub_ep *ep,
 
 	/* While we can create descriptors */
 	while (ast_vhub_count_free_descs(ep) && req->last_desc < 0) {
-		struct ast_vhub_desc *desc;
 		unsigned int d_num;
 
 		/* Grab next free descriptor */
@@ -227,6 +232,9 @@ static void ast_vhub_epn_kick_desc(struct ast_vhub_ep *ep,
 		req->act_count = act = act + chunk;
 	}
 
+	if (likely(desc))
+		vhub_dma_workaround(desc);
+
 	/* Tell HW about new descriptors */
 	writel(VHUB_EP_DMA_SET_CPU_WPTR(ep->epn.d_next),
 	       ep->epn.regs + AST_VHUB_EP_DESC_STATUS);
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
index 2b040257bc1f..4ed03d33a5a9 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
+++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
@@ -462,6 +462,39 @@ enum std_req_rc {
 #define DDBG(d, fmt, ...)	do { } while(0)
 #endif
 
+static inline void vhub_dma_workaround(void *addr)
+{
+	/*
+	 * This works around a confirmed HW issue with the Aspeed chip.
+	 *
+	 * The core uses a different bus to memory than the AHB going to
+	 * the USB device controller. Due to the latter having a higher
+	 * priority than the core for arbitration on that bus, it's
+	 * possible for an MMIO to the device, followed by a DMA by the
+	 * device from memory to all be performed and services before
+	 * a previous store to memory gets completed.
+	 *
+	 * This the following scenario can happen:
+	 *
+	 *    - Driver writes to a DMA descriptor (Mbus)
+	 *    - Driver writes to the MMIO register to start the DMA (AHB)
+	 *    - The gadget sees the second write and sends a read of the
+	 *      descriptor to the memory controller (Mbus)
+	 *    - The gadget hits memory before the descriptor write
+	 *      causing it to read an obsolete value.
+	 *
+	 * Thankfully the problem is limited to the USB gadget device, other
+	 * masters in the SoC all have a lower priority than the core, thus
+	 * ensuring that the store by the core arrives first.
+	 *
+	 * The workaround consists of using a dummy read of the memory before
+	 * doing the MMIO writes. This will ensure that the previous writes
+	 * have been "pushed out".
+	 */
+	mb();
+	(void)__raw_readl((void __iomem *)addr);
+}
+
 /* core.c */
 void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
 		   int status);
