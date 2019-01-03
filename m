Return-Path: <broonie@sirena.org.uk>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jvjExXLo"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43VqBd5C4qzDqD2
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 00:53:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=YYG9URGBUbh2/d20c8mttBiXArlh+LGZlCPm2QZHmvs=; b=jvjExXLoucRo
 HvrXvflj79UNv/9DR2BtLGvdIglZiMSCcc6YTrj27znbU+GPP3oxTyd90bFhEE/0T6pWxxm6/w+1C
 quWTEBVUPpIcTweaJ0bB14I4WftmSuy1wQaBwk0UP73tZrqmBosrH/pN3CcrA05zv1v3Zv4ohkwxH
 BcxD4=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gf3R2-0005ho-OL; Thu, 03 Jan 2019 13:53:20 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 37957440080; Thu,  3 Jan 2019 13:53:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, openbmc@lists.ozlabs.org,
 linux-spi@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Applied "spi: npcm-pspi: Fix wrong priv pointer" to the spi tree
In-Reply-To: <20190101141053.3792-1-axel.lin@ingics.com>
X-Patchwork-Hint: ignore
Message-Id: <20190103135320.37957440080@finisterre.ee.mobilebroadband>
Date: Thu,  3 Jan 2019 13:53:20 +0000 (GMT)
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
X-List-Received-Date: Thu, 03 Jan 2019 13:53:30 -0000

The patch

   spi: npcm-pspi: Fix wrong priv pointer

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

From 082531444e454bac6f743ec064203bf8812bc9ac Mon Sep 17 00:00:00 2001
From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 1 Jan 2019 22:10:53 +0800
Subject: [PATCH] spi: npcm-pspi: Fix wrong priv pointer

In npcm_pspi_probe(), current code set platform_set_drvdata(pdev, master);
so in npcm_pspi_remove() platform_get_drvdata(pdev) will return pointer to
master rather than priv. Fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-npcm-pspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index e1dca79b9090..734a2b956959 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -465,7 +465,8 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 
 static int npcm_pspi_remove(struct platform_device *pdev)
 {
-	struct npcm_pspi *priv = platform_get_drvdata(pdev);
+	struct spi_master *master = platform_get_drvdata(pdev);
+	struct npcm_pspi *priv = spi_master_get_devdata(master);
 
 	npcm_pspi_reset_hw(priv);
 	clk_disable_unprepare(priv->clk);
-- 
2.20.1
