Return-Path: <openbmc+bounces-1623-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750801088E50
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 22:43:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbkP14CyGz2yvB;
	Thu, 19 Mar 2026 09:42:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773801691;
	cv=none; b=mjmGV8HXaJiV7h0byjiiKvchapz2ac0iHH/pJTgm33oebDECqkYw9w016KzGDJVRQWA2evxe47cCHxOT9MjKRgq3zj4xLOeCXqip8RUHzhcZvwUzTzZOuH+/KEWneUdGA19xIBN+JFxwZyClpUi8ohU1Uh4eX1cnT0w8mN1u+6zHP29TPnK0ROs0HsJnNYA6AkOVKf+sk3pIbzQ8K01CdXOMttXo+TlyYu+8AP6RK+EvvhnvBvrzV4kPcb91w+ag2OcwMdjMXA3B26dO1rNJtYoeuhJVxFkCKFxBcmMzsutcW2903CY2aAyhyA5FwSRauUH7LXVq/G9G6avF6z9JSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773801691; c=relaxed/relaxed;
	bh=WfEcXbWidBDubbY0qO5s+3aa6iNxWPJIg3WqJFm8IMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lstJEQUFuZDsyEgNoB52//jjCdC8tCGagLJ+RvAaVf4/kUUIiXXbBL7J0DYPkuFeY5ylXYojtQ7AvB1gjnkupwEsBXuuM9GrkfrDB6msPOcIhWh8CBdA0PZt8a0It94ZcL/9Ch2xy+OQccRmRGds+nDWHXizvEfH5TSEuuuAzJe0QH/vH5uIOcWeDETLu78R8iZXuvt2rweI9M4iizBw2qkxDk87Tw7Suu+svWjT5/jpZawh/XJh5GbcNeirj5Qp2IomKRYkXCAPZhFOcC6+5WAuQs9WrM5ccCAy5V5g+EEeUtcMnsJtQdGM/w53X8MFoV3SsmVvPz/dP6f2ueG+xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbCkx6Txsz2yjs
	for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 13:41:29 +1100 (AEDT)
X-UUID: ca247bee227311f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:db6aecef-6bf7-4efc-a7fe-a597a8f1e5fc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:ed94ccb7dde8ac94044c8db9edffc78e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ca247bee227311f1a21c59e7364eecb8-20260318
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 556156718; Wed, 18 Mar 2026 10:40:13 +0800
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
Subject: [PATCH v4 05/17] spi: imx: Simplify clock handling with devm_clk_get_enabled()
Date: Wed, 18 Mar 2026 10:39:55 +0800
Message-Id: <554b3a088ac453f50df9b040e3506c807efb5dd6.1773801401.git.xiaopei01@kylinos.cn>
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
devm_clk_get_enabled() for both "ipg" and "per" clocks. This reduces
boilerplate code and error handling, as the managed API automatically
disables the clocks when the device is removed or if probe fails.

Remove the now-unnecessary clk_disable_unprepare() calls from the
probe error paths.

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


