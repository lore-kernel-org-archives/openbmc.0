Return-Path: <openbmc+bounces-1644-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1EE109192B
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 22:38:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcLFF1x8Dz2yC9;
	Fri, 20 Mar 2026 09:38:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773885946;
	cv=none; b=hctR1fqDTnecokTlOEO1W8jOmgRcvyR6HqWhaQSaE84izBFIrlnSS0mP9j2U0cbnWDhEoMuDu3Cvyd1z5Zkk+kpcjtYQEBGrAjBTkhap6jbl0EnYryVpNzcrNzRbtT84r3Bd8VIi0r1Jq8NCIsIcTKFzLPpiwYVpK9loNX35KD2C8GRYgPxxbcJ3WI75fPUb3rmUg1kt9nY3emeVIks05S0WlJdiiXL+rZiXL4PwvBqn2UNN+qWQrXYaUYOc/lde55xeMCwbszQFYMXAIuwLeMlrSpJti+as1ItWdk+AoXDHl/LuUj3Pgb87dMhOYNJM/DLO32SIAo2mXewuAUJfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773885946; c=relaxed/relaxed;
	bh=Yb8Iio/NDnqYEebuxQUc6olfEqXiKE/NJ9fHxR1UgVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FjPtwchEjtpzSzyBLRO3FClUq3jDuSmH8/ZDYamnFk/vyhxkPPQP+dhrzX4uq2yh7kjlG3aSml6VPlMeNMdL0LzfPwGJAFc9DgR5jqxlDGBrBabF3WL5cGeotVxokEuGnno9P4HJQRkb6VU6drIws5HTNiraUl2VQk+4bte8h8uIyV994O0E6vOeXF0l+Xa/JgIgnp0a7EALRU6XJf2K6+dUD7ef1xArdNWC9jmV7/pdYIXW3wPngpvatssi9NC9oOCZl/7UAmLY+53z51Sm5PDlo6ILdfMyy8mao1e9XbcebKNB5D09/iYuAnED/9QKbhhtglRvJ/jlLJLJZoZnqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbpvF0g9pz2ynh
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 13:05:44 +1100 (AEDT)
X-UUID: f42535fe233711f1a21c59e7364eecb8-20260319
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:14196cfd-c5a2-463a-8f04-4d526262ece3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:d364503d679d4c701aec4d20cdee8480,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f42535fe233711f1a21c59e7364eecb8-20260319
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 502944780; Thu, 19 Mar 2026 10:04:25 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org,
	Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v5 12/17] spi: stm32-qspi: Simplify clock handling with devm_clk_get_enabled()
Date: Thu, 19 Mar 2026 10:04:08 +0800
Message-Id: <333b09950ee5c2fc0e560536281afb33f92288d1.1773885292.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773885292.git.xiaopei01@kylinos.cn>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
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
devm_clk_get_enabled() for the clock. This removes the need for
explicit clock enable and disable calls, as the managed API automatically
handles clock disabling on device removal or probe failure.

Remove the now-unnecessary clk_disable_unprepare() calls from the probe
error path and the remove callback. Adjust error labels accordingly.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-stm32-qspi.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index df1bbacec90a..a8436f70fdfd 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -819,25 +819,19 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 
 	init_completion(&qspi->match_completion);
 
-	qspi->clk = devm_clk_get(dev, NULL);
+	qspi->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(qspi->clk))
-		return PTR_ERR(qspi->clk);
-
+		return dev_err_probe(dev, PTR_ERR(qspi->clk),
+				     "can not enable the clock\n");
 	qspi->clk_rate = clk_get_rate(qspi->clk);
 	if (!qspi->clk_rate)
 		return -EINVAL;
 
-	ret = clk_prepare_enable(qspi->clk);
-	if (ret) {
-		dev_err(dev, "can not enable the clock\n");
-		return ret;
-	}
-
 	rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(rstc)) {
 		ret = PTR_ERR(rstc);
 		if (ret == -EPROBE_DEFER)
-			goto err_clk_disable;
+			goto err_defer;
 	} else {
 		reset_control_assert(rstc);
 		udelay(2);
@@ -886,8 +880,7 @@ static int stm32_qspi_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(qspi->dev);
 err_dma_free:
 	stm32_qspi_dma_free(qspi);
-err_clk_disable:
-	clk_disable_unprepare(qspi->clk);
+err_defer:
 
 	return ret;
 }
@@ -906,7 +899,6 @@ static void stm32_qspi_remove(struct platform_device *pdev)
 	pm_runtime_disable(qspi->dev);
 	pm_runtime_set_suspended(qspi->dev);
 	pm_runtime_dont_use_autosuspend(qspi->dev);
-	clk_disable_unprepare(qspi->clk);
 }
 
 static int stm32_qspi_runtime_suspend(struct device *dev)
-- 
2.25.1


