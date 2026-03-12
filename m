Return-Path: <openbmc+bounces-1462-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FB6106ACF4
	for <openbmc@archiver.kernel.org>; Thu, 12 Mar 2026 23:07:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fX3Bz1Jf1z3cM8;
	Fri, 13 Mar 2026 10:06:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773308203;
	cv=none; b=bEcodtYdEcxNgx1maTSZsWD1pkdDyT6lJfS4E7cKCeGg+HdpGDSGO9V8YdTUA7/jbill3vWZMV4aVsr00MrNT+dEhjjWvm1TQ3r87fDHfqa5V8ACtvAGh241kQAgfNokGTSvBVhsDAryA5kv9Kab79PkBoA0ZJUN4d0TGNjf7NkQ4hqSRfvH1qWsCo41y1sE/y+VPZMnRKkkeVstxSElad7BNgXdiczYnOeDPLt3nqx9QIxilO5PuiKOiJA08atyr6YsKA90o2JVy+gf0XlP/vyfGaHlqBrZdEBITg1f6S6zR53pDg72HHfEx/y3WDP/7BTdwSCsmQdosiFD1YSCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773308203; c=relaxed/relaxed;
	bh=qvIfLIlhkZhlYIJn5vZtWz1t5Yxngxbwk8cGTO9H1pM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xt2yPThBOVrI9NEPz4pTB67jkJ+AgyGfXY23c2RASmKlo37XqAFHzkRATMQAKfTcHCX3xy84JDVO9MM69k4t20tysn1qWXoAzqMT1E2fc6nMUbpmGDOyUkVclNhB3Y/0+cDOJtubgBvYVmFFMNfWO5vcudGZxZZqiQbVDZXOdi+4YdYXCvdlh7pt5QeN9xADypEupi5Vh3R/w/+s8pAWPMHKuWz6tsLeJ7XS1f17U/P29Rsn8/UVa2V4y6t/sjfKEm8R0ndjzSj9RKzOQo+gB0MZrCTnmgPQKf2T9oPhVBOo61DsnBiAk3TjKoLRY/Ur8HTN6u86fiA0u46usm6jUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fWjDp0zhrz3cG9
	for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2026 20:36:41 +1100 (AEDT)
X-UUID: f45f256c1df511f1a21c59e7364eecb8-20260312
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:4c02d704-ca6f-4871-95b2-ea056b94ca06,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:a07c265c81ec8ea205be13609e15f68e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f45f256c1df511f1a21c59e7364eecb8-20260312
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1485123681; Thu, 12 Mar 2026 17:29:22 +0800
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
Subject: [PATCH 06/17] spi: npcm-pspi: Use helper function devm_clk_get_enabled()
Date: Thu, 12 Mar 2026 17:28:58 +0800
Message-Id: <b9499692634a1cb6fe1244264c88aab733f4ae61.1773306858.git.xiaopei01@kylinos.cn>
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
 drivers/spi/spi-npcm-pspi.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index e60b3cc398ec..99fa866f4efc 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -361,27 +361,23 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 		goto out_host_put;
 	}
 
-	priv->clk = devm_clk_get(&pdev->dev, NULL);
+	priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(priv->clk)) {
-		dev_err(&pdev->dev, "failed to get clock\n");
+		dev_err(&pdev->dev, "failed to enable clock\n");
 		ret = PTR_ERR(priv->clk);
 		goto out_host_put;
 	}
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		goto out_host_put;
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto out_disable_clk;
+		goto out_host_put;
 	}
 
 	priv->reset = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->reset)) {
 		ret = PTR_ERR(priv->reset);
-		goto out_disable_clk;
+		goto out_host_put;
 	}
 
 	/* reset SPI-HW block */
@@ -391,7 +387,7 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 			       "npcm-pspi", priv);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request IRQ\n");
-		goto out_disable_clk;
+		goto out_host_put;
 	}
 
 	init_completion(&priv->xfer_done);
@@ -415,15 +411,12 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 
 	ret = devm_spi_register_controller(&pdev->dev, host);
 	if (ret)
-		goto out_disable_clk;
+		goto out_host_put;
 
 	pr_info("NPCM Peripheral SPI %d probed\n", host->bus_num);
 
 	return 0;
 
-out_disable_clk:
-	clk_disable_unprepare(priv->clk);
-
 out_host_put:
 	spi_controller_put(host);
 	return ret;
-- 
2.25.1


