Return-Path: <broonie@sirena.org.uk>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YLxH9KyW"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 431dc90bWZzDqWd
 for <openbmc@lists.ozlabs.org>; Sat, 24 Nov 2018 01:14:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=xxg1+/NPfr1Hpktfm40YHdgWHtUgWsjBM9wzBRwmRhk=; b=YLxH9KyWISMR
 t7FeaCrujKCLTp7VBufCah/kzStA4lvXrKmAnNESSBfCf5NECAs+RcMLaSNh+p56M6MWm4s6N4+tY
 USBSRlSp2tYJyaGlecXwZRBEou8yC0OQfovj79e67q4L9sldpatJZPha+pKXJrEwmODQnp2aHIxIe
 yh/Ds=;
Received: from [176.12.107.140] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gQCEC-00019v-0i; Fri, 23 Nov 2018 14:14:40 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 8D3DD440078; Fri, 23 Nov 2018 14:14:38 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>,
 Mark Brown <broonie@kernel.org>, openbmc@lists.ozlabs.org,
 linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Applied "spi: npcm: Fix an error code in the probe function" to the
 spi tree
In-Reply-To: <20181123072024.5vtjzta4rcmqtyph@kili.mountain>
Message-Id: <20181123141438.8D3DD440078@finisterre.ee.mobilebroadband>
Date: Fri, 23 Nov 2018 14:14:38 +0000 (GMT)
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
X-List-Received-Date: Fri, 23 Nov 2018 14:14:49 -0000

The patch

   spi: npcm: Fix an error code in the probe function

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

From 428f977a6a6b43154928571b01fa8415c11a9244 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Nov 2018 10:20:24 +0300
Subject: [PATCH] spi: npcm: Fix an error code in the probe function

There is an IS_ERR() vs PTR_ERR() typo here.  The current code returns 1
but we want to return the negative error code.

Fixes: 2a22f1b30cee ("spi: npcm: add NPCM PSPI controller driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-npcm-pspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index 342178e282bc..fed05b02007c 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -381,7 +381,7 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 		syscon_regmap_lookup_by_compatible("nuvoton,npcm750-rst");
 	if (IS_ERR(priv->rst_regmap)) {
 		dev_err(&pdev->dev, "failed to find nuvoton,npcm750-rst\n");
-		return IS_ERR(priv->rst_regmap);
+		return PTR_ERR(priv->rst_regmap);
 	}
 
 	/* reset SPI-HW block */
-- 
2.19.1
