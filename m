Return-Path: <openbmc+bounces-1507-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840C6107BCD1
	for <openbmc@archiver.kernel.org>; Sat, 14 Mar 2026 00:39:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXjCJ23fBz3cN6;
	Sat, 14 Mar 2026 11:38:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773382219;
	cv=none; b=GOvXscFiVbKHo8fktqdStxsRX1bND0wDIgGjXSRaHrAXB9x3y2IzrtryC5Klxfo9mQoyGrsuO8c1xCQ90ck8WJjl1UXxomJoWloOq1D7a7X9clSHB+CUzaYYd+klaCKmNq5477/vW4EjlAoV+deCl2GzpsZUJF0SymNFOQGuoiStjGsgmuV8T4CV0hZDHqWZbZzr0b6++rrO1M9VYrnJXFeeYs+LqALasACJ9YeE6NCRYq/jk33L06LK7Z48MV4qI/MC45RKZtttItZuztJz1ROZrpZN2/17lMFhsHyOPFKDDAQMQCricx8YHwpDNkeAeKTnS8NX7wLbVD9ndwj7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773382219; c=relaxed/relaxed;
	bh=F2Ps6gKNEbR3uP13jdRbIPy3SrrxHiyDRagAOb4BNMY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BzdrU8EDuYrl+r+lPS8NDGuXXxeRj3ghz82qlgYpgwjHTcPA7l91nddozyuL88DUqJKwtXiy+dmG7MUucwqWf6CGNba7AZ/h6y8qv4XFCvzt/+12yNto9Bk9em52JXu0dRogFMvKC9FiTFBmOLZQmKQZysNeu1Q3A6DRa55uvqttiidDOX/+S5sonb3MDdjbgbhPazdTMH5CIEFZ6Fk80uL3DP2I6PUGBZuCx2bYhX7OtuTaN6AwhWDl4q/ahJIoxR3SU4PS1FPZ214ZZK5A9WuDBH4ZvDoiYO36ewUiwOg/111xMlBg8Ukd7rYUphihmk7Hs2cmBHE901G1YexcMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXDc85Mmxz30Sv
	for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2026 17:10:16 +1100 (AEDT)
X-UUID: 206223be1ea311f1a21c59e7364eecb8-20260313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d641a8e1-4d46-4a38-b51e-095e6e7e6688,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:30c7a324fc08eca76d7b7e49697a0fd7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 206223be1ea311f1a21c59e7364eecb8-20260313
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 806233997; Fri, 13 Mar 2026 14:08:59 +0800
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
Subject: [PATCH v2 05/17] spi: imx: Use helper function devm_clk_get_enabled()
Date: Fri, 13 Mar 2026 14:08:21 +0800
Message-Id: <1e68b5b54a9ba46c307f18c1f0cbf0d34b9af06a.1773381582.git.xiaopei01@kylinos.cn>
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
 drivers/spi/spi-imx.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 64c6c09e1e7b..a01c466818de 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -2323,26 +2323,18 @@ static int spi_imx_probe(struct platform_device *pdev)
 		goto out_controller_put;
 	}
 
-	spi_imx->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
+	spi_imx->clk_ipg = devm_clk_get_enabled(&pdev->dev, "ipg");
 	if (IS_ERR(spi_imx->clk_ipg)) {
 		ret = PTR_ERR(spi_imx->clk_ipg);
 		goto out_controller_put;
 	}
 
-	spi_imx->clk_per = devm_clk_get(&pdev->dev, "per");
+	spi_imx->clk_per = devm_clk_get_enabled(&pdev->dev, "per");
 	if (IS_ERR(spi_imx->clk_per)) {
 		ret = PTR_ERR(spi_imx->clk_per);
 		goto out_controller_put;
 	}
 
-	ret = clk_prepare_enable(spi_imx->clk_per);
-	if (ret)
-		goto out_controller_put;
-
-	ret = clk_prepare_enable(spi_imx->clk_ipg);
-	if (ret)
-		goto out_put_per;
-
 	pm_runtime_set_autosuspend_delay(spi_imx->dev, MXC_RPM_TIMEOUT);
 	pm_runtime_use_autosuspend(spi_imx->dev);
 	pm_runtime_get_noresume(spi_imx->dev);
@@ -2386,9 +2378,6 @@ static int spi_imx_probe(struct platform_device *pdev)
 	pm_runtime_disable(spi_imx->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 
-	clk_disable_unprepare(spi_imx->clk_ipg);
-out_put_per:
-	clk_disable_unprepare(spi_imx->clk_per);
 out_controller_put:
 	spi_controller_put(controller);
 
-- 
2.25.1


