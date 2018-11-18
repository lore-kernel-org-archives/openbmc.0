Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42yWf229FWzF3B2
 for <openbmc@lists.ozlabs.org>; Sun, 18 Nov 2018 23:35:33 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wAIC58Dg005945;
 Sun, 18 Nov 2018 14:05:08 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id D4270630C7; Sun, 18 Nov 2018 14:35:06 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Cc: linux-spi@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 1/1] spi: npcm: fix uninitialized 'val' warning in receive
 function
Date: Sun, 18 Nov 2018 14:35:04 +0200
Message-Id: <20181118123504.83082-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20181118123504.83082-1-tmaimon77@gmail.com>
References: <20181118123504.83082-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Sun, 18 Nov 2018 12:35:39 -0000

Fix uninitialized 'val' warning receive function, send function
has been modify to be aligned with the receive function.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-pspi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index 6dae91091143..f75df49ab84e 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -199,11 +199,11 @@ static void npcm_pspi_send(struct npcm_pspi *priv)
 	wsize = min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
 	priv->tx_bytes -= wsize;
 
-	if (priv->tx_buf) {
-		if (wsize == 1)
-			iowrite8(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
+	if (priv->tx_buf && wsize) {
 		if (wsize == 2)
 			iowrite16(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
+		else
+			iowrite8(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
 
 		priv->tx_buf += wsize;
 	}
@@ -217,11 +217,11 @@ static void npcm_pspi_recv(struct npcm_pspi *priv)
 	rsize = min(bytes_per_word(priv->bits_per_word), priv->rx_bytes);
 	priv->rx_bytes -= rsize;
 
-	if (priv->rx_buf) {
-		if (rsize == 1)
-			val = ioread8(priv->base + NPCM_PSPI_DATA);
+	if (priv->rx_buf && rsize) {
 		if (rsize == 2)
 			val = ioread16(priv->base + NPCM_PSPI_DATA);
+		else
+			val = ioread8(priv->base + NPCM_PSPI_DATA);
 
 		*priv->rx_buf = val;
 		priv->rx_buf += rsize;
-- 
2.14.1
