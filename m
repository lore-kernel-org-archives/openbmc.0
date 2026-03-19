Return-Path: <openbmc+bounces-1651-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DDC1091929
	for <openbmc@archiver.kernel.org>; Thu, 19 Mar 2026 22:43:02 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcLLj2LBbz2yRl;
	Fri, 20 Mar 2026 09:42:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773885953;
	cv=none; b=ox+L42ftPjRgrTuVM61WSVjZfJfvl7xdbGvV004sRVZcMht6lMm+SCk/b8QrUwCqQIr83FyeXlqYDo3bSHKF68zEjKcZSR39zsY9z8T2en7OOnTZzOoHQo8FNr/OXdcHAmAhgo+OoRrOpYJteXeuBAHhkHNI+hN/rrxdc4q+QMcIoE5+C0jehSYywMUt3H6swP3cZgSYjryyPGQ9iA9X7PGW7+dB9gCy2aSQwxRm8txCToRPkBjotcAueaqDnLWCPctJl9qQzjiojDSLA9Z32XqGjOhSpP5g+e5CJt9UgenScjp2HTav+K9YsfM6mtGm7TDp6xR8a52rHRaXafnzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773885953; c=relaxed/relaxed;
	bh=0GhWVl44PwiDe18JHZZSnTnlkOPvdj29I0lxE7T3ZJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ikd3X1WuXU5uXCow8P3PrC+Tav0nDzcnt2xJrDuiModBazh2HRj3omGbgD0+K1i9hlHHMG4E/U/7BloRN64Zl5PI5wDZ0h3MLroMW1V+AimYBn3GAQpSDvIOC3I5qo27LIxTnWwyup2FmzM5VKc0gXZWIF5ir+KTnbHKJE2LTh+O2ERvQiciBjMMA0/Z722aVijE64Di3dldR/P5+CZ/CcownPymVfuaw1pjeOasQG1MDndxK2rZMJUluQmYJHbF9XDRdf4QVuEmiK7Z9uhGWgJqOjtGM/uL1MzI15hGu6PWG0NWZaNbsmCnU4zIGaaIDzOAt8+l97sZmwD1UxA4Rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbpvM75D0z2xZK
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 13:05:51 +1100 (AEDT)
X-UUID: f4b189dc233711f1a21c59e7364eecb8-20260319
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:10f7c1f4-f24a-426e-b4b5-df917d8a9cb6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:173e02fd34b2c516b8e16ceee670e4ab,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f4b189dc233711f1a21c59e7364eecb8-20260319
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1715651615; Thu, 19 Mar 2026 10:04:26 +0800
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
Subject: [PATCH v5 14/17] spi: sunplus-sp7021: Simplify clock handling with devm_clk_get_enabled()
Date: Thu, 19 Mar 2026 10:04:10 +0800
Message-Id: <fb0bc46107975cfff4eefa9ba96fe7545996ae52.1773885292.git.xiaopei01@kylinos.cn>
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
explicit clock enable/disable calls and the custom cleanup function,
as the managed API automatically handles clock disabling on device
removal or probe failure.

Remove the now-unnecessary sp7021_spi_disable_unprepare() function
and the devm_add_action_or_reset() call.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-sunplus-sp7021.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/spi/spi-sunplus-sp7021.c b/drivers/spi/spi-sunplus-sp7021.c
index 789b092fe8c0..35601212fb78 100644
--- a/drivers/spi/spi-sunplus-sp7021.c
+++ b/drivers/spi/spi-sunplus-sp7021.c
@@ -389,11 +389,6 @@ static int sp7021_spi_target_transfer_one(struct spi_controller *ctlr, struct sp
 	return ret;
 }
 
-static void sp7021_spi_disable_unprepare(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static void sp7021_spi_reset_control_assert(void *data)
 {
 	reset_control_assert(data);
@@ -460,7 +455,7 @@ static int sp7021_spi_controller_probe(struct platform_device *pdev)
 	if (pspim->s_irq < 0)
 		return pspim->s_irq;
 
-	pspim->spi_clk = devm_clk_get(dev, NULL);
+	pspim->spi_clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(pspim->spi_clk))
 		return dev_err_probe(dev, PTR_ERR(pspim->spi_clk), "clk get fail\n");
 
@@ -468,14 +463,6 @@ static int sp7021_spi_controller_probe(struct platform_device *pdev)
 	if (IS_ERR(pspim->rstc))
 		return dev_err_probe(dev, PTR_ERR(pspim->rstc), "rst get fail\n");
 
-	ret = clk_prepare_enable(pspim->spi_clk);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable clk\n");
-
-	ret = devm_add_action_or_reset(dev, sp7021_spi_disable_unprepare, pspim->spi_clk);
-	if (ret)
-		return ret;
-
 	ret = reset_control_deassert(pspim->rstc);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to deassert reset\n");
-- 
2.25.1


