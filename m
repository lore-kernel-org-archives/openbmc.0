Return-Path: <openbmc+bounces-1518-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856F2107BCEF
	for <openbmc@archiver.kernel.org>; Sat, 14 Mar 2026 00:48:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXjNQ394kz3cPQ;
	Sat, 14 Mar 2026 11:46:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773382221;
	cv=none; b=gwKK0uYV4pS7oKubwwwgP4P2GAX7yofBBJmqMUJIPuOFIdWOQjtlJdfzt5dnLgoYHXchJo+pYYxh0+pH+rLfyC+pmBGZMA7lhSN85CZdRWRwNIh/5tf8qrzpxl68z6/VtMQ3lkmzxKzEQMwr6QTu6+s6xOOv3tBm4vSLcL+RYhBccrxrmFqm689eHSHuFo0LFqfDIkCad2swqcOhs2mLJtuIQAqXB/gw7Q+LgQkhMz1IIfzSoL7GEol/I7RAUjvXCFlPsyuClA0Y5Vr5OLJTseNF9X9/FEIFqU3EUGje62QyERC9cvonIPF5TvPvcFENERURHshMJ5mN86ruOllBzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773382221; c=relaxed/relaxed;
	bh=kWr3UpL72gEY0ThjpzFd6EFwY6zHsa+dAASz/B2/zTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QXgT7YiQzc+NrEJq5MwEX52Ikn9EAK0IKIXUnd0mDDQaNKwdKVGAE/6Myg6rVBxp4HD3yZscGETs4QChUWwiFSjEg9dg2QE8/092EYRwuWSM9n9OJh3O1PcldaONJAWfQ1k5z3SKw7j1AzCDUu1GYCq+bFXceb71b72ofjve8RDS4pjvs9aTy0/HN+jCvUPIdKZzqK149RzpBjl+M2JiMGc9c+uCRKQjGNYEgElh0xkuoVy5bKUIBMyS4jQjzSmYmwUuvry/qzDSmqXuaagnQF4kr1H+lwJdMpMEX0ZnFmSzlr44tigqTx7EZYC2YnOpn++pa7BsfNKm4oOfe2809Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXDcC6PRyz3cJy
	for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2026 17:10:19 +1100 (AEDT)
X-UUID: 2025a7e01ea311f1a21c59e7364eecb8-20260313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d89ac4ec-369b-4d47-846d-ed976b4fdb08,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:fd8bf85eeab97c9d96b48752536a9aa3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2025a7e01ea311f1a21c59e7364eecb8-20260313
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1216968440; Fri, 13 Mar 2026 14:08:59 +0800
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
Subject: [PATCH v2 04/17] spi: img-spfi: Use helper function devm_clk_get_enabled()
Date: Fri, 13 Mar 2026 14:08:20 +0800
Message-Id: <8e188ff7513f1a57e6b9b973d231b0eb8f317253.1773381582.git.xiaopei01@kylinos.cn>
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
 drivers/spi/spi-img-spfi.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-img-spfi.c b/drivers/spi/spi-img-spfi.c
index 902fb64815c9..a227cff5da70 100644
--- a/drivers/spi/spi-img-spfi.c
+++ b/drivers/spi/spi-img-spfi.c
@@ -557,24 +557,17 @@ static int img_spfi_probe(struct platform_device *pdev)
 	if (ret)
 		goto put_spi;
 
-	spfi->sys_clk = devm_clk_get(spfi->dev, "sys");
+	spfi->sys_clk = devm_clk_get_enabled(spfi->dev, "sys");
 	if (IS_ERR(spfi->sys_clk)) {
 		ret = PTR_ERR(spfi->sys_clk);
 		goto put_spi;
 	}
-	spfi->spfi_clk = devm_clk_get(spfi->dev, "spfi");
+	spfi->spfi_clk = devm_clk_get_enabled(spfi->dev, "spfi");
 	if (IS_ERR(spfi->spfi_clk)) {
 		ret = PTR_ERR(spfi->spfi_clk);
 		goto put_spi;
 	}
 
-	ret = clk_prepare_enable(spfi->sys_clk);
-	if (ret)
-		goto put_spi;
-	ret = clk_prepare_enable(spfi->spfi_clk);
-	if (ret)
-		goto disable_pclk;
-
 	spfi_reset(spfi);
 	/*
 	 * Only enable the error (IACCESS) interrupt.  In PIO mode we'll
@@ -655,9 +648,6 @@ static int img_spfi_probe(struct platform_device *pdev)
 		dma_release_channel(spfi->rx_ch);
 	if (spfi->tx_ch)
 		dma_release_channel(spfi->tx_ch);
-	clk_disable_unprepare(spfi->spfi_clk);
-disable_pclk:
-	clk_disable_unprepare(spfi->sys_clk);
 put_spi:
 	spi_controller_put(host);
 
-- 
2.25.1


