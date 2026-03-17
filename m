Return-Path: <openbmc+bounces-1593-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D084DFF6E97
	for <openbmc@archiver.kernel.org>; Tue, 17 Mar 2026 23:05:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fb6x04F0Yz2yrm;
	Wed, 18 Mar 2026 10:04:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773733419;
	cv=none; b=grUhXAsKOUR04B2NuvQCzzvz+ASyAzmk646+RLPb7l230evS06rrtRN/XjhMOpfGp9zxSmnG2IrY0emcoQcpZN1EGuQ16MWYjA9ZpYF0iDm9uwAcqaGbzY18gFqczo/8/RdGj9FFyg3r6hvMg6ue6xcZXj1vIRHge/v5BZDUrE0iqCMjgDVWPNrpUK4M6tJIchvGlJBEHjywo2MMSy6nUnPtkyyAZHpbrD9BBdjkelHYFkHTujqLa1ALf9t2gYmgmQKlMvc+tWCz2Ii/ZkxoLbAB0RgPUCOnZpVdYsy0VDJlcrf8llD3wi+mERBhSQw4S+RFTvla9ktObqbql6oymg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773733419; c=relaxed/relaxed;
	bh=6dayMvsXK4IzLpYEcluOC3lgrPxQD/EDZ7QncX0OpcM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cVNVqSoiUHMdNwsTcEC/G1gAH1bQ299IS4dj6oxiGtCKO16SEozxaUdsgC84Ga0/zfsPqZGqIRgjuY4x3MBqyoBPyMT2H6YqrYZ3R7+yg/yUJpiUPjyllD7+zgNCK10je/+MOjRjdclJePRhATvN2A8A75JH75azbZUzYx2zHYEN6K05Bn5tVC+RYvkY4CEuzCbxeyrpEhfbhiXlFK+Y3XeGdFV2Sfnav5n4bROwvfoKVMMgjUoEVXdxlP2nVoPuVCM5w9iyvcsb60a49qXsFabCR85wJry6C/BFf1CvXHE8hdknbLn6cDhFNKHw5+fc0kGLVzrpIeroYEd7ZMtreg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZkV20mvGz2yks
	for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2026 18:43:27 +1100 (AEDT)
X-UUID: cb484aae21d411f1a21c59e7364eecb8-20260317
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:1f22bc00-7df3-490a-80ca-18eebf4007e9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:8930ebb8831d9ba6b3689687f66dd749,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cb484aae21d411f1a21c59e7364eecb8-20260317
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 460964528; Tue, 17 Mar 2026 15:42:05 +0800
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
Subject: [PATCH v3 03/17] spi: bcmbca-hsspi: Use helper function devm_clk_get_enabled()
Date: Tue, 17 Mar 2026 15:41:45 +0800
Message-Id: <729e01297d5d04aae823cddab97450dfad729232.1773733017.git.xiaopei01@kylinos.cn>
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
 drivers/spi/spi-bcmbca-hsspi.c | 49 +++++++++++-----------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/spi/spi-bcmbca-hsspi.c b/drivers/spi/spi-bcmbca-hsspi.c
index ece22260f570..2e22345115fd 100644
--- a/drivers/spi/spi-bcmbca-hsspi.c
+++ b/drivers/spi/spi-bcmbca-hsspi.c
@@ -452,39 +452,30 @@ static int bcmbca_hsspi_probe(struct platform_device *pdev)
 	if (IS_ERR(spim_ctrl))
 		return PTR_ERR(spim_ctrl);
 
-	clk = devm_clk_get(dev, "hsspi");
+	clk = devm_clk_get_enabled(dev, "hsspi");
 	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Failed to get hsspi clock\n");
 
 	rate = clk_get_rate(clk);
 	if (!rate) {
-		pll_clk = devm_clk_get(dev, "pll");
+		pll_clk = devm_clk_get_enabled(dev, "pll");
 
 		if (IS_ERR(pll_clk)) {
-			ret = PTR_ERR(pll_clk);
-			goto out_disable_clk;
+			return dev_err_probe(dev, PTR_ERR(pll_clk),
+					     "Failed to get pll clock\n");
 		}
 
-		ret = clk_prepare_enable(pll_clk);
-		if (ret)
-			goto out_disable_clk;
-
 		rate = clk_get_rate(pll_clk);
-		if (!rate) {
-			ret = -EINVAL;
-			goto out_disable_pll_clk;
-		}
+		if (!rate)
+			return dev_err_probe(dev, -EINVAL,
+					     "Failed to get pll clock rate\n");
 	}
 
 	host = devm_spi_alloc_host(&pdev->dev, sizeof(*bs));
-	if (!host) {
-		ret = -ENOMEM;
-		goto out_disable_pll_clk;
-	}
+	if (!host)
+		return dev_err_probe(dev, -ENOMEM,
+				     "Failed alloc spi host\n");
 
 	bs = spi_controller_get_devdata(host);
 	bs->pdev = pdev;
@@ -535,18 +526,16 @@ static int bcmbca_hsspi_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, irq, bcmbca_hsspi_interrupt, IRQF_SHARED,
 			       pdev->name, bs);
 		if (ret)
-			goto out_disable_pll_clk;
+			return dev_err_probe(dev, ret, "Failed request irq\n");
 	}
 
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
-		goto out_disable_pll_clk;
+		return dev_err_probe(dev, ret, "Failed pm runtime enable\n");
 
 	ret = sysfs_create_group(&pdev->dev.kobj, &bcmbca_hsspi_group);
-	if (ret) {
-		dev_err(&pdev->dev, "couldn't register sysfs group\n");
-		goto out_disable_pll_clk;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "couldn't register sysfs group\n");
 
 	/* register and we are done */
 	ret = devm_spi_register_controller(dev, host);
@@ -559,10 +548,6 @@ static int bcmbca_hsspi_probe(struct platform_device *pdev)
 
 out_sysgroup_disable:
 	sysfs_remove_group(&pdev->dev.kobj, &bcmbca_hsspi_group);
-out_disable_pll_clk:
-	clk_disable_unprepare(pll_clk);
-out_disable_clk:
-	clk_disable_unprepare(clk);
 	return ret;
 }
 
@@ -573,8 +558,6 @@ static void bcmbca_hsspi_remove(struct platform_device *pdev)
 
 	/* reset the hardware and block queue progress */
 	__raw_writel(0, bs->regs + HSSPI_INT_MASK_REG);
-	clk_disable_unprepare(bs->pll_clk);
-	clk_disable_unprepare(bs->clk);
 	sysfs_remove_group(&pdev->dev.kobj, &bcmbca_hsspi_group);
 }
 
-- 
2.25.1


