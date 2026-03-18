Return-Path: <openbmc+bounces-1621-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5435C1088E49
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 22:43:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbkNt0N4Cz2ytx;
	Thu, 19 Mar 2026 09:42:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773801695;
	cv=none; b=CKfP3Qx9bOmlvns9Ox6YppsibR/QJq95VQ5nan7o5Jqd2xPZn18+tR9O/8C3UQB+lmrsoF1YUjcqeEwRV8LwnXATGUyD7uOehSJVb5qefneJWwVG0T3VV7duYGvqJ44ukT82UAh/1ciPXnJmok8KSjF0qVGMNv9sfmXPWM9qlxjuiGpDGaE/X5GQB64ZIfVLYAF4338rLeC4v5D0vFlMvRCTqh28mRZ9kt297k67o080oEz8mEDe6UlpKZdfKfmLQQRS4n1RzbrXLP1/nVjiU88apydNsIT+EE5hR0pjbWh5QfKbhErfHxcIkn17NcozsBRxVzulK9NgKmGBbndWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773801695; c=relaxed/relaxed;
	bh=R76hhmJBVe6UNoB4O692Y2jRZcN2IWDNCKgp7GCPJ+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l0H1w1pjh/nwdJWjTrBArU2ItXFunrLWYnTz7e7XNFYrdc2ZcfIet1Tz0ctVt9JBVbuDL/X8bHLox47Li3ILtRS+I3qHw09yha+vD6r1dc2rO5bRVxn3pr+ygu7UlPFTX9Q6P6U0gw+qwjsWAPPQxuf41allFaQYLc8n0m7b/jXeW+C/9lA5mFKqBStrtP5m28fpKdX5PTDk7zGsZRofrcS0/lmEyad5/Vvz2Oszd4g+tpLz+lCWiyctZ0kUOUudMhUfwA1kQRFKolbfs+atXywZuxZElgwgOOqFO3QnPG32Q5s/jkTB+LAJo22KuWPXQdLUaVPRZnAfrW5vGPA0qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbCl24Hsbz2yjm
	for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 13:41:34 +1100 (AEDT)
X-UUID: cad0c962227311f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:c8e9e33f-3f09-404a-a93b-26252d6fa9a0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:d1e408596d18c2aa223fed187124feaf,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cad0c962227311f1a21c59e7364eecb8-20260318
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 867970682; Wed, 18 Mar 2026 10:40:14 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v4 08/17] spi: rockchip-sfc: Simplify clock handling with devm_clk_get_enabled()
Date: Wed, 18 Mar 2026 10:39:58 +0800
Message-Id: <7a246c3e4de6b994d84941e0a6f49bb94f4a7608.1773801401.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773801401.git.xiaopei01@kylinos.cn>
References: <cover.1773801401.git.xiaopei01@kylinos.cn>
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

Replace devm_clk_get() followed by clk_prepare_enable() with
devm_clk_get_enabled() for both the interface clock "clk_sfc" and the
AHB clock "hclk_sfc". This reduces boilerplate code and error handling,
as the managed API automatically disables the clocks when the device is
removed or if probe fails.

Remove the now-unnecessary clk_disable_unprepare() calls from the probe
error paths and the remove callback. Adjust error handling labels
accordingly.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-rockchip-sfc.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 174995042f53..b32b7c015edb 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -635,13 +635,13 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 		return PTR_ERR(sfc->regbase);
 
 	if (!has_acpi_companion(&pdev->dev))
-		sfc->clk = devm_clk_get(&pdev->dev, "clk_sfc");
+		sfc->clk = devm_clk_get_enabled(&pdev->dev, "clk_sfc");
 	if (IS_ERR(sfc->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sfc->clk),
 				     "Failed to get sfc interface clk\n");
 
 	if (!has_acpi_companion(&pdev->dev))
-		sfc->hclk = devm_clk_get(&pdev->dev, "hclk_sfc");
+		sfc->hclk = devm_clk_get_enabled(&pdev->dev, "hclk_sfc");
 	if (IS_ERR(sfc->hclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sfc->hclk),
 				     "Failed to get sfc ahb clk\n");
@@ -657,18 +657,6 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 
 	sfc->use_dma = !of_property_read_bool(sfc->dev->of_node, "rockchip,sfc-no-dma");
 
-	ret = clk_prepare_enable(sfc->hclk);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to enable ahb clk\n");
-		goto err_hclk;
-	}
-
-	ret = clk_prepare_enable(sfc->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to enable interface clk\n");
-		goto err_clk;
-	}
-
 	/* Find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
@@ -730,10 +718,6 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 	pm_runtime_set_suspended(dev);
 	pm_runtime_dont_use_autosuspend(dev);
 err_irq:
-	clk_disable_unprepare(sfc->clk);
-err_clk:
-	clk_disable_unprepare(sfc->hclk);
-err_hclk:
 	return ret;
 }
 
@@ -747,8 +731,6 @@ static void rockchip_sfc_remove(struct platform_device *pdev)
 			 DMA_BIDIRECTIONAL);
 	free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
 
-	clk_disable_unprepare(sfc->clk);
-	clk_disable_unprepare(sfc->hclk);
 }
 
 #ifdef CONFIG_PM
-- 
2.25.1


