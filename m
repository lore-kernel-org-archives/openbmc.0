Return-Path: <SRS0=oCxL=GQ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6860DC433E6
	for <openbmc@archiver.kernel.org>; Wed, 13 Jan 2021 20:16:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF67D222BB
	for <openbmc@archiver.kernel.org>; Wed, 13 Jan 2021 20:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF67D222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGJcc0fvtzDrpp
	for <openbmc@archiver.kernel.org>; Thu, 14 Jan 2021 07:16:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGJGW05ggzDrSr
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 07:00:50 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10DK0RQB007590;
 Wed, 13 Jan 2021 22:00:27 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 3807663A17; Wed, 13 Jan 2021 22:00:28 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v3 10/12] spi: npcm-pspi: Add full duplex support
Date: Wed, 13 Jan 2021 22:00:08 +0200
Message-Id: <20210113200010.71845-11-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210113200010.71845-1-tmaimon77@gmail.com>
References: <20210113200010.71845-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Modify the IRQ handler in the NPCM PSPI
driver to support SPI full duplex communication.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-pspi.c | 75 +++++++++++++++----------------------
 1 file changed, 30 insertions(+), 45 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index 87cd0233c60b..92fae0b23eb1 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -197,22 +197,22 @@ static void npcm_pspi_setup_transfer(struct spi_device *spi,
 static void npcm_pspi_send(struct npcm_pspi *priv)
 {
 	int wsize;
-	u16 val;
+	u16 val = 0;
 
 	wsize = min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
 	priv->tx_bytes -= wsize;
 
-	if (!priv->tx_buf)
-		return;
-
 	switch (wsize) {
 	case 1:
-		val = *priv->tx_buf++;
+		if (priv->tx_buf)
+			val = *priv->tx_buf++;
 		iowrite8(val, NPCM_PSPI_DATA + priv->base);
 		break;
 	case 2:
-		val = *priv->tx_buf++;
-		val = *priv->tx_buf++ | (val << 8);
+		if (priv->tx_buf) {
+			val = *priv->tx_buf++;
+			val = *priv->tx_buf++ | (val << 8);
+		}
 		iowrite16(val, NPCM_PSPI_DATA + priv->base);
 		break;
 	default:
@@ -224,22 +224,24 @@ static void npcm_pspi_send(struct npcm_pspi *priv)
 static void npcm_pspi_recv(struct npcm_pspi *priv)
 {
 	int rsize;
-	u16 val;
+	u16 val_16;
+	u8  val_8;
 
 	rsize = min(bytes_per_word(priv->bits_per_word), priv->rx_bytes);
 	priv->rx_bytes -= rsize;
 
-	if (!priv->rx_buf)
-		return;
-
 	switch (rsize) {
 	case 1:
-		*priv->rx_buf++ = ioread8(priv->base + NPCM_PSPI_DATA);
+		val_8 = ioread8(priv->base + NPCM_PSPI_DATA);
+		if (priv->rx_buf)
+			*priv->rx_buf++ = val_8;
 		break;
 	case 2:
-		val = ioread16(priv->base + NPCM_PSPI_DATA);
-		*priv->rx_buf++ = (val >> 8);
-		*priv->rx_buf++ = val & 0xff;
+		val_16 = ioread16(priv->base + NPCM_PSPI_DATA);
+		if (priv->rx_buf) {
+			*priv->rx_buf++ = (val_16 >> 8);
+			*priv->rx_buf++ = val_16 & 0xff;
+		}
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -298,43 +300,26 @@ static irqreturn_t npcm_pspi_handler(int irq, void *dev_id)
 	struct npcm_pspi *priv = dev_id;
 	u8 stat;
 
-	stat = ioread8(priv->base + NPCM_PSPI_STAT);
-
 	if (!priv->tx_buf && !priv->rx_buf)
 		return IRQ_NONE;
 
-	if (priv->tx_buf) {
-		if (stat & NPCM_PSPI_STAT_RBF) {
-			ioread8(NPCM_PSPI_DATA + priv->base);
-			if (priv->tx_bytes == 0) {
-				npcm_pspi_disable(priv);
-				complete(&priv->xfer_done);
-				return IRQ_HANDLED;
-			}
-		}
-
-		if ((stat & NPCM_PSPI_STAT_BSY) == 0)
-			if (priv->tx_bytes)
-				npcm_pspi_send(priv);
+	if (priv->tx_bytes == 0 && priv->rx_bytes == 0) {
+		npcm_pspi_disable(priv);
+		complete(&priv->xfer_done);
+		return IRQ_HANDLED;
 	}
 
-	if (priv->rx_buf) {
-		if (stat & NPCM_PSPI_STAT_RBF) {
-			if (!priv->rx_bytes)
-				return IRQ_NONE;
-
-			npcm_pspi_recv(priv);
+	stat = ioread8(priv->base + NPCM_PSPI_STAT);
 
-			if (!priv->rx_bytes) {
-				npcm_pspi_disable(priv);
-				complete(&priv->xfer_done);
-				return IRQ_HANDLED;
-			}
-		}
+	/*
+	 * first we do the read since if we do the write we previous read might
+	 * be lost (indeed low chances)
+	 */
+	if ((stat & NPCM_PSPI_STAT_RBF) && priv->rx_bytes)
+		npcm_pspi_recv(priv);
 
-		if (((stat & NPCM_PSPI_STAT_BSY) == 0) && !priv->tx_buf)
-			iowrite8(0x0, NPCM_PSPI_DATA + priv->base);
-	}
+	if (((stat & NPCM_PSPI_STAT_BSY) == 0) && priv->tx_bytes)
+		npcm_pspi_send(priv);
 
 	return IRQ_HANDLED;
 }
-- 
2.22.0

