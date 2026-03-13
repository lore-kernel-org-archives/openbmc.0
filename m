Return-Path: <openbmc+bounces-1514-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D89107BCEE
	for <openbmc@archiver.kernel.org>; Sat, 14 Mar 2026 00:47:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fXjNM6hZKz3cN3;
	Sat, 14 Mar 2026 11:46:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773382222;
	cv=none; b=fxAl4A/lO0Z0Vd1xKrpmSFYSMreu5PKuQMMmcEWiWFRv5/X75R+11mXYFL8DL0zVz+XGgIvUTlzrRoOOOuhhL4izRPZeKBcfo5thKdAGyLoLGolDXi7nu7yIVH1YzlbyDuDhJNrj04YrNlaoghy4Wp6XTDbKz7moO+b1rpSEwL+NiYtHBF6uWb0yMqMpHOC1WOx1u0t6MV8RKaz0yDq3Q0AF16W447dsUeqgiThFnXzh2dh0KjtqrS8aw2FxU4t6YskRdSruvvgfIG3YjVdJ0s2dVpfWXNSSyfDvvNBRQcLP3uDPOnct87zQk2q6zAy471tzz6OFcj55cEzTsvwE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773382222; c=relaxed/relaxed;
	bh=BiV3LADvi5pM2oKmhwBDqTfbsM7UL9kVHKK2vEID0HM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j/u0meJgWlMoW1ANRvhkBoR+BSkFgtZKEIlfj1IbBwJhERblZV8QUOjLmUG0y5/Qhbein90F9EDfNn6teCXyQEXZdk5AmeN0S6/l81s3UwquVMlTVHmnE+FS3xZI0utJXmJkNvxGOMHmAEtlhTHBroGEoKaw/klqmd6dqOZ07eu0bziqfOZcGBODdst4TwPM4koVpAo9BdEbrrfEsO6p+JrmQt/3yGy+ftdc6c3GcSmpuE83dIM0rVrbIVDuUjthunupILjJPtA/NvyWmJkxZSbnyrTGlTMWiPZ3n8agT1eSHa4HhGj9BcYNCFrnDqHMyd8vTFCpec2S+oQCsPqKgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fXDcF1B10z3cKQ
	for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2026 17:10:20 +1100 (AEDT)
X-UUID: 23a4b17c1ea311f1a21c59e7364eecb8-20260313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:41213b50-5fad-4287-9a3d-985e8d8526bd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:3f41b8fc19ffd5ee287bcea0c95ffcde,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 23a4b17c1ea311f1a21c59e7364eecb8-20260313
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 568887747; Fri, 13 Mar 2026 14:09:05 +0800
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
Subject: [PATCH v2 17/17] spi: zynqmp-gqspi: Use helper function devm_clk_get_enabled()
Date: Fri, 13 Mar 2026 14:08:33 +0800
Message-Id: <aff326978cb080cb8671e5f7581fee4aa3e90e05.1773381582.git.xiaopei01@kylinos.cn>
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
 drivers/spi/spi-zynqmp-gqspi.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 502fd5eccc83..a88b07956c33 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1244,26 +1244,16 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	if (IS_ERR(xqspi->regs))
 		return PTR_ERR(xqspi->regs);
 
-	xqspi->pclk = devm_clk_get(&pdev->dev, "pclk");
+	xqspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(xqspi->pclk))
 		return dev_err_probe(dev, PTR_ERR(xqspi->pclk),
 				     "pclk clock not found.\n");
 
-	xqspi->refclk = devm_clk_get(&pdev->dev, "ref_clk");
+	xqspi->refclk = devm_clk_get_enabled(&pdev->dev, "ref_clk");
 	if (IS_ERR(xqspi->refclk))
 		return dev_err_probe(dev, PTR_ERR(xqspi->refclk),
 				     "ref_clk clock not found.\n");
 
-	ret = clk_prepare_enable(xqspi->pclk);
-	if (ret)
-		return dev_err_probe(dev, ret, "Unable to enable APB clock.\n");
-
-	ret = clk_prepare_enable(xqspi->refclk);
-	if (ret) {
-		dev_err(dev, "Unable to enable device clock.\n");
-		goto clk_dis_pclk;
-	}
-
 	init_completion(&xqspi->data_completion);
 
 	mutex_init(&xqspi->op_lock);
@@ -1339,9 +1329,6 @@ static int zynqmp_qspi_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-	clk_disable_unprepare(xqspi->refclk);
-clk_dis_pclk:
-	clk_disable_unprepare(xqspi->pclk);
 
 	return ret;
 }
-- 
2.25.1


