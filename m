Return-Path: <openbmc+bounces-1573-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5FCFF6E9A
	for <openbmc@archiver.kernel.org>; Tue, 17 Mar 2026 22:55:53 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fb6kL3ZtVz2ynT;
	Wed, 18 Mar 2026 09:55:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773733604;
	cv=none; b=kT7phLGpLNjrJaNJXoYz7fdZKKiyRNGUIyZ3nFnxgINl6WqsVBBzuBvBK30aajNQReaNgVXgj2FZXn+jb/aPmGXhUgBlSNCqOUkMRSj4OIa2IrFBd7ElamDJDm/6SVAPGXcIb91u3YscFt4nZa88eC8a+KxFgfX0aI07qk4mED+2Ho+nq3Um7COvTExHWd1zwA5ml02dU1rYWZrXL9U2wjp7NOLqlO6AF5fx3xtjxgJetEnMAK63wTxmBU1IfZfkdY+v4/RRMpMbJ/Xv8M6DLIlWZhhIETfSosTTJIPgEL11ODV5MTIc1zEPh75aOVSDVzFgG0xkiDbOqagMmHe2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773733604; c=relaxed/relaxed;
	bh=HfMKzK/ZHIY538qAxSfIpcFLU1yaTDPjL/48HV+6iRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mbySp1SGPyymr+xDxEFfsO5gKzy3EBT7VFaMlp3k1r+3fERS2VjOEhJeBBaUcy3Fxm+ioggQZd6OIYMLhQooo8mzfI1uyBaAUOSycxtjtOiR36CtWeFKZOZpOx3S4L5jBoJtxb2VTfJqftMonQZPxnr+K1lMqkJA9VS1JEBGDZ2lZF3fe8venDTVcy0WKhVdhcksR+sotQpmxbfYi4+zubjsLYk9+v7VwuNRh2mQXrcG8e020nNWKus0ZLoyad8/v18X4Jo9E4nezfS6pg6oSlCW/meMnar2+Z4MvgtnsDAOBCG/GOaMqVsYdR88IB8U5f5naKOwavmsq79eJrIY+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZkYZ5qgPz2xQD
	for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2026 18:46:16 +1100 (AEDT)
X-UUID: cace313821d411f1a21c59e7364eecb8-20260317
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d2d62c2d-b471-4331-8435-b4acf2f12e91,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:f7636baae2e2008e5d60797e1b96b7d5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cace313821d411f1a21c59e7364eecb8-20260317
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 735953558; Tue, 17 Mar 2026 15:42:04 +0800
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
Subject: [PATCH v3 01/17] spi: axiado: Use helper function devm_clk_get_enabled()
Date: Tue, 17 Mar 2026 15:41:43 +0800
Message-Id: <a78f25f1b15b90121e9723ecb5bd606bbb1868d4.1773733017.git.xiaopei01@kylinos.cn>
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
 drivers/spi/spi-axiado.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
index dc55c55ae63c..b2d1011357f4 100644
--- a/drivers/spi/spi-axiado.c
+++ b/drivers/spi/spi-axiado.c
@@ -768,25 +768,15 @@ static int ax_spi_probe(struct platform_device *pdev)
 	if (IS_ERR(xspi->regs))
 		return PTR_ERR(xspi->regs);
 
-	xspi->pclk = devm_clk_get(&pdev->dev, "pclk");
+	xspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(xspi->pclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(xspi->pclk),
-				     "pclk clock not found.\n");
+				     "Unable to enable APB clock.\n");
 
-	xspi->ref_clk = devm_clk_get(&pdev->dev, "ref");
+	xspi->ref_clk = devm_clk_get_enabled(&pdev->dev, "ref");
 	if (IS_ERR(xspi->ref_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(xspi->ref_clk),
-				     "ref clock not found.\n");
-
-	ret = clk_prepare_enable(xspi->pclk);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Unable to enable APB clock.\n");
-
-	ret = clk_prepare_enable(xspi->ref_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable device clock.\n");
-		goto clk_dis_apb;
-	}
+				     "Unable to enable device clock.\n");
 
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, SPI_AUTOSUSPEND_TIMEOUT);
@@ -815,7 +805,7 @@ static int ax_spi_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0) {
 		ret = -ENXIO;
-		goto clk_dis_all;
+		goto err_disable_pm_runtime;
 	}
 
 	ret = devm_request_irq(&pdev->dev, irq, ax_spi_irq,
@@ -823,7 +813,7 @@ static int ax_spi_probe(struct platform_device *pdev)
 	if (ret != 0) {
 		ret = -ENXIO;
 		dev_err(&pdev->dev, "request_irq failed\n");
-		goto clk_dis_all;
+		goto err_disable_pm_runtime;
 	}
 
 	ctlr->use_gpio_descriptors = true;
@@ -849,17 +839,14 @@ static int ax_spi_probe(struct platform_device *pdev)
 	ret = spi_register_controller(ctlr);
 	if (ret) {
 		dev_err(&pdev->dev, "spi_register_controller failed\n");
-		goto clk_dis_all;
+		goto err_disable_pm_runtime;
 	}
 
 	return ret;
 
-clk_dis_all:
+err_disable_pm_runtime:
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(xspi->ref_clk);
-clk_dis_apb:
-	clk_disable_unprepare(xspi->pclk);
 
 	return ret;
 }
@@ -882,8 +869,6 @@ static void ax_spi_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	clk_disable_unprepare(xspi->ref_clk);
-	clk_disable_unprepare(xspi->pclk);
 }
 
 /**
-- 
2.25.1


