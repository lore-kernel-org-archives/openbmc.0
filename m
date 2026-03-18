Return-Path: <openbmc+bounces-1619-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D81D1088E50
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 22:42:40 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbkNb1ZcDz2yqW;
	Thu, 19 Mar 2026 09:42:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773801697;
	cv=none; b=dVwusnh7rSb3W4TVbzNNLUNbDmg9XTBnKQsd9EzBJZGZke4Hel5XxLzk1o0RuSn/WBBTEICdX15vJk8nXo2Q6/Hd4pN+plYXVleRvM+ZGLrEDkyERpVuLC+IDih2k/M2+fujRr7K6EDwnhULDS2ixRqDb1A/kA6ldQz0PAOZcanfM+6rX4n86z68G0+CVz7vTfr8YtwlnsUyc8cHMf8xCoAaltc2pGrf0QTsjB6/yh2glwVjKhRFItL0iAZJu3FDe58c287V0wpKHZwxfoJAF8bL3X5lAPHflE/4538Rl5QvxB0d7Fg8t4rsqq1LosFq9yYrGaSBLWW6KJOTiL592w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773801697; c=relaxed/relaxed;
	bh=caiXZSrvcswuLMsnUoevgcGtjd0NRYuEemTLkYFLTXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vr6zCsz9c/Su+t4Yma0OmX16KgreadMd3Oa/q0itGSht22Aw3u0Q4LFZR3Ho0bBrwKPVaXx2FHmnqOL1dB5qaRv1D96Qx9MHAkj0u8mSi4xqv0W/JRpasDAjID/i4t7nDH9Px1+6FOhqvQQj53Lezdi5whRREe/zs4tzK8TVwASASyoVnjgbEpsrs1pJiU9Mp9fB8+t7njciGFpUXorHcvCvFI0a4eCyiSlECiJX71tdyJ1myduNORBvJ8IvUfer4f0ggvJcI5HBFARuM1q9CfobLWKqj942TYTfH6f5+oh5Zyqq3ArG0EsqFl0OgUgn08xOewZZIeN6QEoARz1vYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbCl448Fbz2xQr
	for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 13:41:36 +1100 (AEDT)
X-UUID: cb44b41c227311f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:0203037e-adaf-4254-8911-c4acc1e35a6e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:d98bf1cde657b2071c1f6fc4533bc0bd,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cb44b41c227311f1a21c59e7364eecb8-20260318
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1294059975; Wed, 18 Mar 2026 10:40:15 +0800
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
Subject: [PATCH v4 10/17] spi: slave-mt27xx: Simplify clock handling with devm_clk_get_enabled()
Date: Wed, 18 Mar 2026 10:40:00 +0800
Message-Id: <a0b2f699f352282ddd17953ae9dbe9c84877dfca.1773801401.git.xiaopei01@kylinos.cn>
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
devm_clk_get_enabled() for the "spi" clock. This reduces boilerplate
code and error handling, as the managed API automatically disables the
clock when the device is removed or if probe fails.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-slave-mt27xx.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/spi/spi-slave-mt27xx.c b/drivers/spi/spi-slave-mt27xx.c
index ce889cb33228..8ec886918165 100644
--- a/drivers/spi/spi-slave-mt27xx.c
+++ b/drivers/spi/spi-slave-mt27xx.c
@@ -438,19 +438,13 @@ static int mtk_spi_slave_probe(struct platform_device *pdev)
 		goto err_put_ctlr;
 	}
 
-	mdata->spi_clk = devm_clk_get(&pdev->dev, "spi");
+	mdata->spi_clk = devm_clk_get_enabled(&pdev->dev, "spi");
 	if (IS_ERR(mdata->spi_clk)) {
 		ret = PTR_ERR(mdata->spi_clk);
 		dev_err(&pdev->dev, "failed to get spi-clk: %d\n", ret);
 		goto err_put_ctlr;
 	}
 
-	ret = clk_prepare_enable(mdata->spi_clk);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to enable spi_clk (%d)\n", ret);
-		goto err_put_ctlr;
-	}
-
 	pm_runtime_enable(&pdev->dev);
 
 	ret = devm_spi_register_controller(&pdev->dev, ctlr);
-- 
2.25.1


