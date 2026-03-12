Return-Path: <openbmc+bounces-1458-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9624D106ACF4
	for <openbmc@archiver.kernel.org>; Thu, 12 Mar 2026 23:06:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fX3Bv6whgz3cJr;
	Fri, 13 Mar 2026 10:06:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773308208;
	cv=none; b=MVIoJYhJeBASNa8CrpUvvZn8+twuSuGigOhnr4LmfRSCU4VdiqV2ATv0dmjN1Dc25wuWWI1npaHcFOlDakhGb8RmrbJ7o5iBhwSeROLfnZ7f/hivVSxb/eqAiPUMxnbmVHiuCHqZPF5uRa0mYCt5o0gVzvkSS5bWBh7OzjJvMfkdgzbcFtlORtRqNgRZR+6cfKJwNhckHP7ZT8PtqSd/cP4crePJ6tVRWzT6t+mkfEkUw1YvIyc89D3nQbvk2DPZfcZY8XTGx74I4m2nqobkIxcimtCXpt7peMqGY451Ffy/NsFZbSFLYUfgeyYmp+7Yjz0hod4x/xzCC0rt0jwfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773308208; c=relaxed/relaxed;
	bh=wIuhPV5XI8V33LptvvioGcjJyoSG63ONYpXJUzmp4o4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IbfaDU0+Nluwyry6afZ84M4+98r8VllD41FYMCwP4POPdOvjSO9s85fPlXjEhqbWhuuN1jfQ3xD76m75C2a9YrzqcxUHK7IhD7F5Nin48dH9vfh3eWJLvZPmX2U5MaINDuEfGjUPXPJTQUedt3o5YN+i+ZpBTpGfWNBhbbX7gNsz0dInK4ZFeIUsV/93ezXTByA/D8vWUbYFg7QzhhMMkxivzIyDQjPezkOYpfOrLbh7VsVCU28xGH3K4XPz/Kc3B6YiuLvhYdBt32ZmJozN4HHZoPxRIXoNoxpuDtM87kvPgWriM5DPmFjdPdvfZm8zdaBY2A5HauLdwe/wak0YrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fWjDv4hHxz3cFm
	for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2026 20:36:47 +1100 (AEDT)
X-UUID: f5cc12a21df511f1a21c59e7364eecb8-20260312
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:a2b8a1a1-cefa-402b-b829-8dd8840d76ed,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:93f75e2a15091fd5248aa60a82459e3d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f5cc12a21df511f1a21c59e7364eecb8-20260312
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 306095963; Thu, 12 Mar 2026 17:29:25 +0800
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
Subject: [PATCH 12/17] spi: stm32-qspi: Use helper function devm_clk_get_enabled()
Date: Thu, 12 Mar 2026 17:29:04 +0800
Message-Id: <e0eda5a2e18031aa9a73c43cee35b02bc622e989.1773306858.git.xiaopei01@kylinos.cn>
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
 drivers/spi/spi-stm32-qspi.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index df1bbacec90a..9ff9975edef4 100644
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
-- 
2.25.1


