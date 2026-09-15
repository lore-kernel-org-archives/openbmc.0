Return-Path: <openbmc+bounces-2593-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908E4C88E75
	for <openbmc@archiver.kernel.org>; Tue, 15 Sep 2026 23:38:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hkz3N01B5z2yd7;
	Wed, 16 Sep 2026 09:38:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789450019;
	cv=none; b=aszX3OhcsZvILt/BKVMmi+DOVpCRCie8AIVQxPl2bJPoKooieDtHnLanWAopajIE3ml/rJiarjxRfHXEZagDvJdXCpq+MQhvCNNgrEzrTe/5sRGdELSdNTk+XUtmFHF74giRoNnMNdZzV7M+eO7BKXwQhlW/uaklglinrlxyCr/QCclsNZSMn0zHvAVC026X1btAyDqkAXrT2XGj62nFcXf8yztoZ5ykSxpVpRuiQ2L+4Oz9Om9Zv9z9/FfsaTl2/SXLm1PTq+j1PZ4+4HQoBnkHoF2G5d3ZyilormwjFVviAGjBAcYyUNhfeUnAb+YuZr8aEL0ApcfWgEKedtWFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789450019; c=relaxed/relaxed;
	bh=nzXcc/bISPIYQYl6/fsM+rj6Xe++F8LifpHHvz9Y4Og=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A1m1BlShZIp+0cyDEjQ7kIBm6yDRshgG1x0oKD+gDx1gIwxHUqPvNEacMozPIr8s0HOypjeScQYGx0i7fsjJUh7HCghHGZZVDAMQevYgivTITg0FmbUpp/iQjUDKT7Rj7jDrk2xEZUdn/2OdBdWnO8Y/dgDVxAU8QzbrPOCODAHWJtmxGPP7kptV7V1MzrtFtk/CQR1J2dtP10JlTt6WpA4RM/rsKBBYyVARnailfVYdRQ0roheMX+T0Ibf/Bv9+rSX5+RoXKsgd970v4IfmlGKbYJ5N3IG3BY77Xvt1QfRiaeYZUe1YZLU0HAG53bBSLvO/d0lIsrmfQ8yAD9BLSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=vulab@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=vulab@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 477 seconds by postgrey-1.37 at boromir; Tue, 15 Sep 2026 15:26:58 AEST
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hkVrL4GwVz2y7p
	for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2026 15:26:58 +1000 (AEST)
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADHn_M61ahqqZgJCA--.50750S2;
	Tue, 15 Sep 2026 13:18:50 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: andrew@codeconstruct.com.au
Cc: avifishman70@gmail.com,
	benjaminfair@google.com,
	daniel.lezcano@kernel.org,
	j.neuschaefer@gmx.net,
	joel@jms.id.au,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	tali.perry1@gmail.com,
	tglx@kernel.org,
	tmaimon77@gmail.com,
	venture@google.com,
	yuenn@google.com,
	lkml@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH 3/6] clocksource/drivers/timer-npcm7xx: Fix clock reference leak in npcm7xx_timer_init
Date: Tue, 15 Sep 2026 05:18:21 +0000
Message-Id: <20260915051821.1727787-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowADHn_M61ahqqZgJCA--.50750S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyDtw48uFykGF1kKr1xKrg_yoW8Gw17p3
	93C3yayrn8Z3yIgwsxKa1qyFnYvayxKFy5Gwn5Cas0vwsxGr95JF9xWF9FqF47uF1kC3ZF
	qan5tF43AFyUAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUr6wZDUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwQLA2qowpBDBQAAsd

npcm7xx_timer_init() looks up the optional timer 1 clock with
of_clk_get(), which takes a reference on the clock, and prepares and
enables it. The clock is meant to stay enabled, but the local clk
pointer is lost when the function returns and clk_put() is never
called, leaking the consumer reference on every boot when the timer 1
clock is present in the device tree.

Drop the reference with clk_put() right after the clock has been
prepared and enabled; this keeps the clock running while releasing the
reference.

Fixes: db78539fc95c ("clocksource/drivers/timer-npcm7xx: Enable timer 1 clock before use")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clocksource/timer-npcm7xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index 9af30af5f989..1ac6424fe879 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -203,10 +203,12 @@ static int __init npcm7xx_timer_init(struct device_node *np)
 	/* Enable the clock for timer1, if it exists */
 	clk = of_clk_get(np, 1);
 	if (clk) {
-		if (!IS_ERR(clk))
+		if (!IS_ERR(clk)) {
 			clk_prepare_enable(clk);
-		else
+			clk_put(clk);
+		} else {
 			pr_warn("%pOF: Failed to get clock for timer1: %pe", np, clk);
+		}
 	}
 
 	npcm7xx_clocksource_init();
-- 
2.34.1


