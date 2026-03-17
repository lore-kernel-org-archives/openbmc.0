Return-Path: <openbmc+bounces-1580-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FC6FF6E9B
	for <openbmc@archiver.kernel.org>; Tue, 17 Mar 2026 22:57:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fb6lX3Hjqz2yv0;
	Wed, 18 Mar 2026 09:56:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773733420;
	cv=none; b=Ey6SQfrBOs6e7rkmob2Wpdu6L0azUDrHsnr1I+iqlVRcvYg0PXKy6LvU1tR5BdQ2UOCjAVYehw0WIxjDy4I1RMiUnDXAIXpLNIjyV6UvsgWGkEqoGl5vTTVApjGUWnFX2fEti8HwGsnw0GXXVoNB3073/MRXP7jgxOa3Ko8U4WxixaBPuyz7Ste/qz60Jmo+JOfWWKv9qS81bA6LPWC1vOr4o2Ma03uWfp7rb9qQJ+G8m8ti7XtpgFw27CA1SLaoqM4iMY86bPvnP3D3sv55zJV8V3XK4lor8Vtban/OVhOan2zJXGUmkO6brIp7CeAI5qsLfep2phwh4w10PirG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773733420; c=relaxed/relaxed;
	bh=LyH4iOAeQH8EWbjoYLYGD7a5wAzC7BaTeFBzpJMLPrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xsx4PfJ3xZFhIhUnnVcvztQ7b8Y+QxwX5YGKZVU9s40TZFa+BbKKc9/d2Zg5//qBh+HgC328DYXoKye21K5toEdY9pXs/nLBUIiYwsXKfmMtW1oDYYyEkkLuv+qOpdtJ5ZAzsdnynsYu0eGXw5pYr0DAqfdqVTPAptY4rzjW793p1gqTTgZwSNcKke0qJiTGYh9KEL9mYM0XkYWAVrGKLuBxG081pIbpZOZPVFPg+eh/tD63W05to2RDCv8tgKwLlTDzRZRmSoQE4W8HR94Udk6bE8O5BGdAmVUwN1TUYsECMiwPGWLxTu2E9GU1ka2eBMBjVV+Zl7PRfgmBoEdDVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZkV33VKjz2ynC
	for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2026 18:43:38 +1100 (AEDT)
X-UUID: ce0a1df821d411f1a21c59e7364eecb8-20260317
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d614da68-762f-4f7e-b095-7610947a431a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:01be61a981189ef1a2ec29b5dd8f6ce4,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ce0a1df821d411f1a21c59e7364eecb8-20260317
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1731831529; Tue, 17 Mar 2026 15:42:09 +0800
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
Subject: [PATCH v3 13/17] spi: stm32: Use helper function devm_clk_get_enabled()
Date: Tue, 17 Mar 2026 15:41:55 +0800
Message-Id: <67c9ada7b1f3b697c6fbc4eddd88efef8fa75ec6.1773733017.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773733017.git.xiaopei01@kylinos.cn>
References: <cover.1773733017.git.xiaopei01@kylinos.cn>
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
 drivers/spi/spi-stm32.c | 61 ++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 43 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 8a7f5a10d4af..ee5092bc5956 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2360,25 +2360,21 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	int ret;
 
 	cfg = of_device_get_match_data(&pdev->dev);
-	if (!cfg) {
-		dev_err(&pdev->dev, "Failed to get match data for platform\n");
-		return -ENODEV;
-	}
+	if (!cfg)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Failed to get match data for platform\n");
 
 	device_mode = of_property_read_bool(np, "spi-slave");
-	if (!cfg->has_device_mode && device_mode) {
-		dev_err(&pdev->dev, "spi-slave not supported\n");
-		return -EPERM;
-	}
+	if (!cfg->has_device_mode && device_mode)
+		return dev_err_probe(&pdev->dev, -EPERM, "spi-slave not supported\n");
 
 	if (device_mode)
 		ctrl = devm_spi_alloc_target(&pdev->dev, sizeof(struct stm32_spi));
 	else
 		ctrl = devm_spi_alloc_host(&pdev->dev, sizeof(struct stm32_spi));
-	if (!ctrl) {
-		dev_err(&pdev->dev, "spi controller allocation failed\n");
-		return -ENOMEM;
-	}
+	if (!ctrl)
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "spi controller allocation failed\n");
 	platform_set_drvdata(pdev, ctrl);
 
 	spi = spi_controller_get_devdata(ctrl);
@@ -2409,32 +2405,19 @@ static int stm32_spi_probe(struct platform_device *pdev)
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
+		return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk), "clk enabled failed\n");
 
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
@@ -2461,11 +2444,9 @@ static int stm32_spi_probe(struct platform_device *pdev)
 	dev_dbg(spi->dev, "one message max size %d\n", spi->t_size_max);
 
 	ret = spi->cfg->config(spi);
-	if (ret) {
-		dev_err(&pdev->dev, "controller configuration failed: %d\n",
-			ret);
-		goto err_clk_disable;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "controller configuration failed: %d\n", ret);
 
 	ctrl->auto_runtime_pm = true;
 	ctrl->bus_num = pdev->id;
@@ -2490,8 +2471,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
 			dev_info(&pdev->dev, "tx dma disabled\n");
 			spi->dma_tx = NULL;
 		} else {
-			dev_err_probe(&pdev->dev, ret, "failed to request tx dma channel\n");
-			goto err_clk_disable;
+			return dev_err_probe(&pdev->dev, ret, "failed to request tx dma channel\n");
 		}
 	} else {
 		ctrl->dma_tx = spi->dma_tx;
@@ -2579,8 +2559,6 @@ static int stm32_spi_probe(struct platform_device *pdev)
 err_dma_tx_release:
 	if (spi->dma_tx)
 		dma_release_channel(spi->dma_tx);
-err_clk_disable:
-	clk_disable_unprepare(spi->clk);
 
 	return ret;
 }
@@ -2610,9 +2588,6 @@ static void stm32_spi_remove(struct platform_device *pdev)
 		gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
 			      spi->sram_rx_buf_size);
 
-	clk_disable_unprepare(spi->clk);
-
-
 	pinctrl_pm_select_sleep_state(&pdev->dev);
 }
 
-- 
2.25.1


