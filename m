Return-Path: <openbmc+bounces-1459-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7B2106ACF6
	for <openbmc@archiver.kernel.org>; Thu, 12 Mar 2026 23:06:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fX3Bx0D5Nz3cKm;
	Fri, 13 Mar 2026 10:06:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773308215;
	cv=none; b=PgXkAYQc4t29Q25zUUrVHdAa1zgXodpmEgz4y6osKcJ4xeP9/Z63kna6dh3mt0asD8Nro2sw3sKQdVb9uy6F04q4NrK2emjkBLUT0kpY6b/BkpHOTlfuH8qTTIQpvJ7+1WXj9/uPaCfJ66XGoXc2FPphzhhmXr3Hr8X3esM4cqLTaAZyFt9Y8WvQ36+BC5lIlzdkeJIGmZw3ttiGwfVocNiWfV3TDnh7Zb2SND450vZOEtPUfcN3MVBtJF/dbADffvElD6aQa/AXLpY5wS0MWh4pOfc4ENur1wZjuuvrHFOdfyvaezPfoHE6DlqdoQ5RyCZE8F3scwVwG5ur41YAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773308215; c=relaxed/relaxed;
	bh=gMWaSnU36UoVNSQCRAloMW4v0Fxg0q7Kizt1+9WD16Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nU3KblAn3eCwUnRdVyItg6ZfQz3Z7reczuqnjpNZhd4T6guUpWcnFSPFZGIDggd7SUGcLQcfXgQAJov3v8vx1vpLTahbvMWDSMbBZGOSDtratMFFb8dDQiEocNA9Qvevz68bHqxUe23FacUSzrUHC/xF8Acuq8xLx0B8obVRor+XefhxhpxCm6HBmzUtkLo8dK2V/9FBKQ0ctJdC2ET6BltzOuWsiwJ2Ovra0UqzmzYLjHP9gKxRMlIwhZomNvalo9GuyQDF5PaGkRckl5+4BVrSSdFO0p9u5sQFu9IGXt6EktNTutxomjCEanFAdTVI58jsQiM05KZzPBrPO62BHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fWjF04fj1z3cFN
	for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2026 20:36:52 +1100 (AEDT)
X-UUID: f60949f61df511f1a21c59e7364eecb8-20260312
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:24b8e357-a0f3-444f-95de-e2dd910a74f7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:77fcc3ae681b67b7ce53c0dd2c43748c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f60949f61df511f1a21c59e7364eecb8-20260312
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 59810514; Thu, 12 Mar 2026 17:29:25 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 13/17] spi: stm32: Use helper function devm_clk_get_enabled()
Date: Thu, 12 Mar 2026 17:29:05 +0800
Message-Id: <d239cda51bb3dcc84da4a7194a30f3be82422f70.1773306858.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773306858.git.xiaopei01@kylinos.cn>
References: <cover.1773306858.git.xiaopei01@kylinos.cn>
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
 drivers/spi/spi-stm32.c | 59 +++++++++++++----------------------------
 1 file changed, 19 insertions(+), 40 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 8a7f5a10d4af..b347caeee0dc 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2360,25 +2360,22 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	int ret;
 
 	cfg = of_device_get_match_data(&pdev->dev);
-	if (!cfg) {
-		dev_err(&pdev->dev, "Failed to get match data for platform\n");
-		return -ENODEV;
-	}
+	if (!cfg)
+		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to get
+				     match data for platform\n");
 
 	device_mode = of_property_read_bool(np, "spi-slave");
-	if (!cfg->has_device_mode && device_mode) {
-		dev_err(&pdev->dev, "spi-slave not supported\n");
-		return -EPERM;
-	}
+	if (!cfg->has_device_mode && device_mode)
+		return dev_err_probe(&pdev->dev, -EPERM, "spi-slave not
+				     supported\n");
 
 	if (device_mode)
 		ctrl = devm_spi_alloc_target(&pdev->dev, sizeof(struct stm32_spi));
 	else
 		ctrl = devm_spi_alloc_host(&pdev->dev, sizeof(struct stm32_spi));
-	if (!ctrl) {
-		dev_err(&pdev->dev, "spi controller allocation failed\n");
-		return -ENOMEM;
-	}
+	if (!ctrl)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "spi controller
+				     allocation failed\n");
 	platform_set_drvdata(pdev, ctrl);
 
 	spi = spi_controller_get_devdata(ctrl);
@@ -2409,32 +2406,19 @@ static int stm32_spi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	spi->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(spi->clk)) {
-		ret = PTR_ERR(spi->clk);
-		dev_err(&pdev->dev, "clk get failed: %d\n", ret);
-		return ret;
-	}
+	spi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(spi->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk), "clk get failed: %d\n", ret);
 
-	ret = clk_prepare_enable(spi->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "clk enable failed: %d\n", ret);
-		return ret;
-	}
 	spi->clk_rate = clk_get_rate(spi->clk);
-	if (!spi->clk_rate) {
-		dev_err(&pdev->dev, "clk rate = 0\n");
-		ret = -EINVAL;
-		goto err_clk_disable;
-	}
+	if (!spi->clk_rate)
+		return dev_err_probe(&pdev->dev, -EINVAL, "clk rate = 0\n");
 
 	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
 	if (rst) {
-		if (IS_ERR(rst)) {
+		if (IS_ERR(rst))
 			ret = dev_err_probe(&pdev->dev, PTR_ERR(rst),
 					    "failed to get reset\n");
-			goto err_clk_disable;
-		}
 
 		reset_control_assert(rst);
 		udelay(2);
@@ -2461,11 +2445,9 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	dev_dbg(spi->dev, "one message max size %d\n", spi->t_size_max);
 
 	ret = spi->cfg->config(spi);
-	if (ret) {
-		dev_err(&pdev->dev, "controller configuration failed: %d\n",
-			ret);
-		goto err_clk_disable;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, "controller configuration
+				     failed: %d\n", ret);
 
 	ctrl->auto_runtime_pm = true;
 	ctrl->bus_num = pdev->id;
@@ -2490,8 +2472,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 			dev_info(&pdev->dev, "tx dma disabled\n");
 			spi->dma_tx = NULL;
 		} else {
-			dev_err_probe(&pdev->dev, ret, "failed to request tx dma channel\n");
-			goto err_clk_disable;
+			return dev_err_probe(&pdev->dev, ret, "failed to request tx dma channel\n");
 		}
 	} else {
 		ctrl->dma_tx = spi->dma_tx;
@@ -2579,8 +2560,6 @@ static int stm32_spi_probe(struct platform_device *pdev)
 err_dma_tx_release:
 	if (spi->dma_tx)
 		dma_release_channel(spi->dma_tx);
-err_clk_disable:
-	clk_disable_unprepare(spi->clk);
 
 	return ret;
 }
-- 
2.25.1


