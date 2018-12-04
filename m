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
 by lists.ozlabs.org (Postfix) with ESMTPS id 438NL95FhLzDqcQ
 for <openbmc@lists.ozlabs.org>; Wed,  5 Dec 2018 00:41:02 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wB4DAcSu010699;
 Tue, 4 Dec 2018 15:10:38 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 5D82E62DA6; Tue,  4 Dec 2018 15:40:36 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, brendanhiggins@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Cc: linux-spi@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1] spi: npcm: Modify pspi send function
Date: Tue,  4 Dec 2018 15:40:35 +0200
Message-Id: <20181204134035.124079-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Tue, 04 Dec 2018 13:41:06 -0000

Align pspi send function code with the recieve function
code, Also simplify the code a bit with early return.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-pspi.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index dda91c19af93..e1dca79b9090 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -199,14 +199,22 @@ static void npcm_pspi_send(struct npcm_pspi *priv)
 	wsize = min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
 	priv->tx_bytes -= wsize;
 
-	if (priv->tx_buf) {
-		if (wsize == 1)
-			iowrite8(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
-		if (wsize == 2)
-			iowrite16(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
+	if (!priv->tx_buf)
+		return;
 
-		priv->tx_buf += wsize;
+	switch (wsize) {
+	case 1:
+		iowrite8(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
+		break;
+	case 2:
+		iowrite16(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return;
 	}
+
+	priv->tx_buf += wsize;
 }
 
 static void npcm_pspi_recv(struct npcm_pspi *priv)
-- 
2.14.1
