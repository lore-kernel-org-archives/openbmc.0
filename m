Return-Path: <openbmc+bounces-1506-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CE8107BCEA
	for <openbmc@archiver.kernel.org>; Sat, 14 Mar 2026 00:39:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXjCD1XzDz3cLd;
	Sat, 14 Mar 2026 11:38:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773382221;
	cv=none; b=Blxu57f4ovlcXprHWXnAdBQgNKfj77RmEVXQR4HWHUOVNuylfmjmSWM0hh0O8iu/Ir57abkyDqqYvd4gI70BUdq24kpU60ZImOSUH+BtDVxccIiuWUfM7C9pTeKnZcwBc3RpFZfSAW6OPW3T0OemsUgqXuxNtrANF/GvBfb60nlAp3hG/Vq3tsTzHNMpmITvmBhbhSsC22+kCZipJWdGch8mVF37R9VP4RxX0MPGH1OFzBz2zJvSRVr3F+WJX9NynmHmRhSsJdp3Az99CYD2XUQvbjyCritMOFe70GRjLFdABEiHD8FqyiMjyz4CnNuqCtdtw9i+JWzvLQMYRfVzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773382221; c=relaxed/relaxed;
	bh=s/FCZeltX/qKr6GNdjxI19Y84PtQDkIvce6pBjCzkr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZvjcDJPFqJPwmH23s0WBFGBGt6PZ35r6FCJjiQcsGZVmpPMwX6X2iI4jU26dRlhyC1cJkRXrlXRjJA4acxsWsKhkT2CBOsNa5SpvsZoRLtg3LcAwwhd02pVRqODL2ur7j+NILzirYJ9Jm5wwiIxbqh8tqAUmxqj1HevOqj530SbDrzbXbCTH/CyHZg1ZHaLpMHK2OcEq7vjRLUfepMXGJhANKYGphcmuU/v8cpB5kCvubF2NbjSQGQ4W2Q8aaqMQcjL2ZgApor4pvKU+vD6RB9T9k69UjM7ZuhfLCVJMWPsPDAAb7lu39liYsyJBOS0mdKjJ0ui14ElZ5NpWrvCOIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXDcD4Qnkz30Sv
	for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2026 17:10:20 +1100 (AEDT)
X-UUID: 2190644e1ea311f1a21c59e7364eecb8-20260313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:2dce6073-afbb-40fa-a7c6-e217d91942ab,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:d6f4f524624260088cf5148d48e65faf,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2190644e1ea311f1a21c59e7364eecb8-20260313
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1077191760; Fri, 13 Mar 2026 14:09:01 +0800
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
Subject: [PATCH v2 10/17] spi: slave-mt27xx: Use helper function devm_clk_get_enabled()
Date: Fri, 13 Mar 2026 14:08:26 +0800
Message-Id: <091c27de9d70a9e74bfb30612e9d2b1ce71d1faf.1773381582.git.xiaopei01@kylinos.cn>
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


