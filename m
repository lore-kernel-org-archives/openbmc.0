Return-Path: <broonie@sirena.org.uk>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iwN8kmXP"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 439nF033vszDrNH
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 07:26:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DLRlTiuMZBjUlVcIoi5M3mznlf7ZF6F+8wxYhmvyBVA=; b=iwN8kmXP9W+a
 1ESY3eWzU9A3GEZakxutiq1xESVCw0vI1l+jHFpzxEIeieJsRBNlrrVqeMAkP7dZmW/ithpe59Cpj
 XEga1+BgpMlcFoi2Z8WjS7hve1XsqXp+9z0/9OO0p88PTSWOQFqF4TiI/qvNuDci/i89jjoo/bGt8
 AP1Jc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gV0E3-0001iK-J7; Thu, 06 Dec 2018 20:26:23 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 45BB811252F7; Thu,  6 Dec 2018 20:26:23 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, broonie@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, yuenn@google.com, venture@google.com,
 brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au,
 linux-spi@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Applied "spi: npcm: Modify pspi send function" to the spi tree
In-Reply-To: <20181204134035.124079-1-tmaimon77@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20181206202623.45BB811252F7@debutante.sirena.org.uk>
Date: Thu,  6 Dec 2018 20:26:23 +0000 (GMT)
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
X-List-Received-Date: Thu, 06 Dec 2018 20:26:28 -0000

The patch

   spi: npcm: Modify pspi send function

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 1fa33be36cfc8908be951ed56113906f422add50 Mon Sep 17 00:00:00 2001
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 4 Dec 2018 15:40:35 +0200
Subject: [PATCH] spi: npcm: Modify pspi send function

Align pspi send function code with the recieve function
code, Also simplify the code a bit with early return.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.19.0.rc2
