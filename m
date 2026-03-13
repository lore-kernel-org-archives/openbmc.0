Return-Path: <openbmc+bounces-1503-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C397107BCD1
	for <openbmc@archiver.kernel.org>; Sat, 14 Mar 2026 00:38:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXjBn3Yqdz3cM7;
	Sat, 14 Mar 2026 11:38:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773382226;
	cv=none; b=O7gevYXi8czwKTjv8yWIlWQZd3uX0l+d+kN2K8i5ALkBpAMglLp1pbvIbuYJtdklhanVTXgRj18wwF/pB7exZCTDDT9Z5oYa6YT4BvHhBaLL19/LtVgonq+QdHsH7kAxSTITl9mLIEpso0KsNb/nUmJypEdFBS1Od+w8EJ2c6Frv/KGwuV73TgB8neu669yjkcFrOBhUb76jpE6jbNhmqQ7SueKyeMWZ4saJfmWMgsqghlEoR/l1xZmCKr0EevG6P9/c1bfrLwbpqTViJYEKGAeT39FktilD95/n7E70q1iBvTzziy5EMeXFCYFE+RJK8gm1JPQUKxsN59DJNzIuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773382226; c=relaxed/relaxed;
	bh=bzZNFqShnLrIISmRIkMaGsk+Q4Sdcy9fc2OC25X5ZkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GdwNuAIuOawm3NDKyVdbJ1OC7rVUJLGmQsL1tcaXvNzU33UR89PfuxNLV7E92srmReihI1ecwf731p9jub73vMTLeRS6lV2ym0+/QvPloA1EdV/5ZrwM54+d5PY5R/o0DghKuVY/yQNWHBL7htsYIlOCCRNf6O3YoW67jvIUBPgIgLThWA4hmeXWA0giB3YVkEGdwQkih/BNN+/1L0YG+v9DsVmH3QcoECts1ifX4k8fkct6l5fBXs2Tb/4RKRdorBacQC2SpSBnknp3xzCWinHpaISOp41PKop+MD0CO3BAID559Wlz8yJK47CHg6sBDDyZf4SkuVve38syjrL+jQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXDcK03jvz3cKQ
	for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2026 17:10:24 +1100 (AEDT)
X-UUID: 2153ff861ea311f1a21c59e7364eecb8-20260313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:1e88ab2e-8ab0-4d31-b1f4-bce00a1dcc05,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:0cf5d1f34091593f18efacf21598dcd7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2153ff861ea311f1a21c59e7364eecb8-20260313
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2127724665; Fri, 13 Mar 2026 14:09:01 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 09/17] spi: sifive: Use helper function devm_clk_get_enabled()
Date: Fri, 13 Mar 2026 14:08:25 +0800
Message-Id: <10f23e10d8cb481f9ede02bbd6f73b8866ebd81d.1773381582.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773381582.git.xiaopei01@kylinos.cn>
References: <cover.1773381582.git.xiaopei01@kylinos.cn>
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

devm_clk_get() and clk_prepare_enable() can now be replaced by
devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
longer necessary to unprepare and disable the clocks explicitly.
Simplify code.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-sifive.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index 6c7aba8befa0..3d45105f2e41 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -312,7 +312,8 @@ static int sifive_spi_probe(struct platform_device *pdev)
 		goto put_host;
 	}
 
-	spi->clk = devm_clk_get(&pdev->dev, NULL);
+	/* Spin up the bus clock before hitting registers */
+	spi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(spi->clk)) {
 		dev_err(&pdev->dev, "Unable to find bus clock\n");
 		ret = PTR_ERR(spi->clk);
@@ -342,13 +343,6 @@ static int sifive_spi_probe(struct platform_device *pdev)
 		goto put_host;
 	}
 
-	/* Spin up the bus clock before hitting registers */
-	ret = clk_prepare_enable(spi->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable bus clock\n");
-		goto put_host;
-	}
-
 	/* probe the number of CS lines */
 	spi->cs_inactive = sifive_spi_read(spi, SIFIVE_SPI_REG_CSDEF);
 	sifive_spi_write(spi, SIFIVE_SPI_REG_CSDEF, 0xffffffffU);
@@ -357,14 +351,14 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	if (!cs_bits) {
 		dev_err(&pdev->dev, "Could not auto probe CS lines\n");
 		ret = -EINVAL;
-		goto disable_clk;
+		goto put_host;
 	}
 
 	num_cs = ilog2(cs_bits) + 1;
 	if (num_cs > SIFIVE_SPI_MAX_CS) {
 		dev_err(&pdev->dev, "Invalid number of spi targets\n");
 		ret = -EINVAL;
-		goto disable_clk;
+		goto put_host;
 	}
 
 	/* Define our host */
@@ -392,7 +386,7 @@ static int sifive_spi_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), spi);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to bind to interrupt\n");
-		goto disable_clk;
+		goto put_host;
 	}
 
 	dev_info(&pdev->dev, "mapped; irq=%d, cs=%d\n",
@@ -401,13 +395,11 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	ret = devm_spi_register_controller(&pdev->dev, host);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "spi_register_host failed\n");
-		goto disable_clk;
+		goto put_host;
 	}
 
 	return 0;
 
-disable_clk:
-	clk_disable_unprepare(spi->clk);
 put_host:
 	spi_controller_put(host);
 
-- 
2.25.1


