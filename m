Return-Path: <openbmc+bounces-1798-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10D7F45A12
	for <openbmc@archiver.kernel.org>; Sat, 11 Apr 2026 02:51:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fsyq26RcSz2ygf;
	Sat, 11 Apr 2026 12:51:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775736508;
	cv=none; b=hkRM7l/zp2cA1Ib1cWw1e4MYm7BSZFaECy0GFYEEseOXM5gEUvUowC9GOEnxoTbZ1X9O+b6ni9Pk1ZKg0QV1GMqS/2IThlgTfFXmBbs/CdTwqp8jsZd0bC5lcJpzZyc9Vmi+1N7I36+gUgHx8h/E2VGFeqVKdXD8cgBJIeQmWFAS2zhvNr9R5+ASkQAv4XYH53XnPl2eQO101/OhkfrnKidA5rwuUCCYEpf82avGaICUwYsqhTglIFce+be8F7UAOvqy2cV7XGxcteA1HVuOpc7pHq1Q7EAfn+PM8ojlvbO6ChweN6UIsMof1QfvCSe34SVYqPPG3B5J8syxP5EDIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775736508; c=relaxed/relaxed;
	bh=aab8UGf9JZMOZHN1yGFVnXYCssupOng9LbfVxtfByl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SI+S34k2m+oANBGYkG1yB8X5icHoa/SAsLGsDhlyoRITcIDbuUQhpOvJVkgMflzcZBsNhFzSWtCiolaTO57/serqzacUbZ+JzZnA+8d7PRnFHh4C0Ix24wcHmTF0iW5gk74sNVJ82in4aTLKUR5Dd4He1LM7V+SRnZ2UwGErnyTAct7CoXsRxzZYR5tgTna+xBU2eiZr5uNOH6fbD+aRgwyYAU536CDJDVssKazfLTJUZqFjJhkO5nhfrJlU1qVj4HJpuCfHsORSKEyoEpe1Wy6ZtVnm+YWGVdHHoZOmb5VElHSY/rsIol87om2/9sk0ajT58RPTKUhXuzWsbjBT2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gcfQRfVF; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gcfQRfVF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4frzGz3G4Tz2xpn
	for <openbmc@lists.ozlabs.org>; Thu, 09 Apr 2026 22:08:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 799EF600CB;
	Thu,  9 Apr 2026 12:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8E6C4CEF7;
	Thu,  9 Apr 2026 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775736503;
	bh=+HFbq/McqKsBlEzOXrGqru6axxh8Ao4WdsBJ0a6HujI=;
	h=From:To:Cc:Subject:Date:From;
	b=gcfQRfVF0SE8cFHLjbyOU4MhJHMVxiq3wi0gsApJQ1w59DG8Jkp16goMIDTZZqANQ
	 y/GgxVwEMHb55J89UYNqBHNsZA7GJ+l+Ucz6qjD+2bFcrULyRaB7KXlqcnBWvAK4M/
	 k/1WNELbIeH1kML7fX8J9Az5Zzu/5OyL26u96WrQ/BMYSf+/BWVFJEWOQE5AToFoPQ
	 qVDcDtpPlVCok20S5aUfgRsMIU/W5YlJIakPJVs7yQ3cT5WSkTe9XgrEjyh0EQTr6a
	 rE38JbLba4N1jrro/vWrAYG5pyx6tvdfiuBIAM7vPcPQn7GkEYWj0HwEwevewQwdXq
	 JCAqPiRoh2Dcw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wAoBI-00000001dB1-3mEs;
	Thu, 09 Apr 2026 14:08:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] spi: npcm-fiu: drop unused remove callback
Date: Thu,  9 Apr 2026 14:08:10 +0200
Message-ID: <20260409120810.388909-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the remove callback which is unused since commit 82c4fadb0b95
("spi: npcm-fiu: Use helper function devm_clk_get_enabled()").

The above mentioned commit also removed the last user of the platform
driver data which no longer needs to be set (twice).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/spi/spi-npcm-fiu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index 3961b0ccdb4b..6617751009c3 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -715,7 +715,6 @@ static int npcm_fiu_probe(struct platform_device *pdev)
 
 	fiu->info = &fiu_data_match->npcm_fiu_data_info[id];
 
-	platform_set_drvdata(pdev, fiu);
 	fiu->dev = dev;
 
 	regbase = devm_platform_ioremap_resource_byname(pdev, "control");
@@ -738,8 +737,6 @@ static int npcm_fiu_probe(struct platform_device *pdev)
 	fiu->spix_mode = of_property_read_bool(dev->of_node,
 					       "nuvoton,spix-mode");
 
-	platform_set_drvdata(pdev, fiu);
-
 	ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD
 		| SPI_TX_DUAL | SPI_TX_QUAD;
 	ctrl->setup = npcm_fiu_setup;
@@ -750,10 +747,6 @@ static int npcm_fiu_probe(struct platform_device *pdev)
 	return devm_spi_register_controller(dev, ctrl);
 }
 
-static void npcm_fiu_remove(struct platform_device *pdev)
-{
-}
-
 MODULE_DEVICE_TABLE(of, npcm_fiu_dt_ids);
 
 static struct platform_driver npcm_fiu_driver = {
@@ -763,7 +756,6 @@ static struct platform_driver npcm_fiu_driver = {
 		.of_match_table = npcm_fiu_dt_ids,
 	},
 	.probe = npcm_fiu_probe,
-	.remove = npcm_fiu_remove,
 };
 module_platform_driver(npcm_fiu_driver);
 
-- 
2.52.0


