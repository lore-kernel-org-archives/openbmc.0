Return-Path: <openbmc+bounces-1590-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A49FF6E9C
	for <openbmc@archiver.kernel.org>; Tue, 17 Mar 2026 23:05:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fb6wz3YZYz2yr8;
	Wed, 18 Mar 2026 10:04:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773733418;
	cv=none; b=Lx1BqePbU6Mg3nxGWhLegR8KJ9c66JzYFNjrSULJwnzXQoctGPqPx97kRNEFjhjQKvSL78T7k/USplrYSoXYUSVnmjx03A/2ETlZ/gnP1sTFuPn7HqIuLSL8PlwyCrLF/WqqbrpsJz3hyrGwRaghVUGlAC0GQGg1RnLk0RGxvvVjJljtJpiVfKQtSJTnJ/qjWmETXjwDa/IpZhlRyK5jRRTznC1Y0kXqQF548B/QIagKQHgjqbAO9nxDm3I0KKQsqaA2+Tb0oP+j2YGJkVDw7YA5r+nTFDwf3pHi/ZGis5Zc5KrAaVaqiMNCzeOe1Gqmil5VugFz4tEJMnnTDQeo/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773733418; c=relaxed/relaxed;
	bh=5L/oeA/2YcsmAjGJdXUeO+xFx2wstgeZ0oXrcmVk4HM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gGDakgSnC0BAjVkkrOvL81StQ0/bWMS2MSy+b028Ptcvs1vHIW/opjBmZwCxt8teDBl31bh2N6LLndkn5q+0qW3aWr+TpY1cErNkgLHQAfUs40Idz6xvv2s4St9SBQ4D+byVFyOE9MsU/MUVnN6KxofxO5/RPPp2pgVP+Vu7FPtz/dGFLiVH7MNuMfTYVoLmGYKPl+tnXpQat9N7czHDf7ibrPyQbxZL9u7Z5aadVB1Uxfg2Pf4wQeceDw7JgUjRNCPn0s1erD7aCXS6Xr7Idg46TOPhtevYPT4VO+NBQdqYmU8rCBdDXLbP4Pvn3unOs4+6uJvAfC9QeT9iwq+LNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fZkV00Ldvz2yjV
	for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2026 18:43:35 +1100 (AEDT)
X-UUID: cb0bbaee21d411f1a21c59e7364eecb8-20260317
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:8ed28783-528a-49b8-b422-9e532f0e4568,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:d1496f212eed61f0c89101fc49fc3b6e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cb0bbaee21d411f1a21c59e7364eecb8-20260317
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 209579328; Tue, 17 Mar 2026 15:42:04 +0800
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
Subject: [PATCH v3 02/17] spi: bcm63xx-hsspi: Use helper function devm_clk_get_enabled()
Date: Tue, 17 Mar 2026 15:41:44 +0800
Message-Id: <4edc7f6b63cc8b83b2185c398256234426a3d859.1773733017.git.xiaopei01@kylinos.cn>
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
 drivers/spi/spi-bcm63xx-hsspi.c | 46 +++++++++------------------------
 1 file changed, 12 insertions(+), 34 deletions(-)

diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hsspi.c
index 612f8802e690..266eabd3715b 100644
--- a/drivers/spi/spi-bcm63xx-hsspi.c
+++ b/drivers/spi/spi-bcm63xx-hsspi.c
@@ -758,8 +758,7 @@ static int bcm63xx_hsspi_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	clk = devm_clk_get(dev, "hsspi");
-
+	clk = devm_clk_get_enabled(dev, "hsspi");
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
@@ -767,41 +766,26 @@ static int bcm63xx_hsspi_probe(struct platform_device *pdev)
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
 	ret = reset_control_reset(reset);
-	if (ret) {
-		dev_err(dev, "unable to reset device: %d\n", ret);
-		goto out_disable_clk;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to reset device: %d\n", ret);
 
 	rate = clk_get_rate(clk);
 	if (!rate) {
-		pll_clk = devm_clk_get(dev, "pll");
-
-		if (IS_ERR(pll_clk)) {
-			ret = PTR_ERR(pll_clk);
-			goto out_disable_clk;
-		}
-
-		ret = clk_prepare_enable(pll_clk);
-		if (ret)
-			goto out_disable_clk;
+		pll_clk = devm_clk_get_enabled(dev, "pll");
+		if (IS_ERR(pll_clk))
+			return dev_err_probe(dev, PTR_ERR(pll_clk),
+					     "failed enable pll clk\n");
 
 		rate = clk_get_rate(pll_clk);
-		if (!rate) {
-			ret = -EINVAL;
-			goto out_disable_pll_clk;
-		}
+		if (!rate)
+			return dev_err_probe(dev, -EINVAL,
+					     "failed get pll clk rate\n");
 	}
 
 	host = spi_alloc_host(&pdev->dev, sizeof(*bs));
-	if (!host) {
-		ret = -ENOMEM;
-		goto out_disable_pll_clk;
-	}
+	if (!host)
+		return dev_err_probe(dev, -ENOMEM, "alloc host no mem\n");
 
 	bs = spi_controller_get_devdata(host);
 	bs->pdev = pdev;
@@ -887,10 +871,6 @@ static int bcm63xx_hsspi_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 out_put_host:
 	spi_controller_put(host);
-out_disable_pll_clk:
-	clk_disable_unprepare(pll_clk);
-out_disable_clk:
-	clk_disable_unprepare(clk);
 	return ret;
 }
 
@@ -902,8 +882,6 @@ static void bcm63xx_hsspi_remove(struct platform_device *pdev)
 
 	/* reset the hardware and block queue progress */
 	__raw_writel(0, bs->regs + HSSPI_INT_MASK_REG);
-	clk_disable_unprepare(bs->pll_clk);
-	clk_disable_unprepare(bs->clk);
 	sysfs_remove_group(&pdev->dev.kobj, &bcm63xx_hsspi_group);
 }
 
-- 
2.25.1


