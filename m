Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8348F606E29C
	for <openbmc@archiver.kernel.org>; Wed, 11 Nov 2026 22:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R7Gl/93D
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jPzCd2Cr6z3bcy;
	Thu, 12 Nov 2026 09:46:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794434033;
	cv=none; b=NPslj3sabIsGskwqAcPkTHRNQpkTHW5DyNiN+PbmU0+fol8cS75nQmzTBwvjqtqF1HHBV0Yw26yA5DVM2jqT+YHS/B1mNTdeR/qKkWGRWmetq6shHhOkVXruRQECE3ybbBnNIQOxAmg3b8opASnAXvIMX1EsIJbhV9eTS/YEveJU+uJogcl9+Ffpia7ee5gXKQIyzb3HPM303Tktfdg6oBRVyiQroZdlD4y4a5Ey20ruURAS/KhGVHu09IBCzgxX7BqOlLmPWb749snZXMTEV2RD217Qv08mCGzCQAsX2hTG1UCnHDSPOUK2+o1QB36BMLdOOUTwp+ULf+VkXG9qBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794434033; c=relaxed/relaxed;
	bh=gbExqfingQo1Ed8SYTNsBzSSp4PBA3Al9x/EZXvEVK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4XiVegXt5is2rk9/T6NYPDHFlENFrAWjKUZrkfE82+2QvrOl5CXoHXj40OHatqdCce2cQt+y1NRQNu8S5/zYKiF3T0BxSp1LhgzyBJ0hrPF3Q3ptBY7GuGhnOPzBPsfGCfT1BHDcGtm4aIzWJjpIaZqWN7eAguNqm4BXQsGkS3xaUa7veIosw8EkiIC7TuMURn1RrU15d9yycSpZToP849R47G3q3QBEQKDMM33Ka9KyAoZlt0gSJtK81F9+HPcVfqQtFo2uCMsppwZBoY0AiIl7uhoaKD9zdKe497q6VWFVEQY7rIRWTffuieBk7xNheNrJtJD++Qs/ilp7VY0Sw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R7Gl/93D; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R7Gl/93D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jPy2m5MSlz2xmh
	for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2026 08:53:52 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8473A634A1;
	Wed, 11 Nov 2026 21:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2111F00A05;
	Wed, 11 Nov 2026 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434029;
	bh=gbExqfingQo1Ed8SYTNsBzSSp4PBA3Al9x/EZXvEVK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R7Gl/93DTvmW4Vr/YYv/SyBz3EDvlwIQTwzaAZpE+dRhu+A7AQqSJSc2tn106VLB0
	 vPcrhouNDXj8yW9embSr1SKu+p9ANmKUAZTVrsc/yth6YgKKA59TUDZHIjWGIfX+7X
	 vFkjUWsDsM/IBOO3IOgX8hCHx5u2TFB1UB0i5UaMGhaiAr9JIpr2Opu9v0IhvR+dlx
	 eQEW+VkHGYasXkub/rckft0+WwaDeh3X5opsNNkqWHAsywPxte8W+0GT9QG0KGXo90
	 ZcJFUVAtg2IZOBOXT+mU0hoJQYqPJAssu1GS54y2oC4+f8GVjVyVukaOcanf/47HF1
	 8rEZi5HSNyk1w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linusw@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	jordan_hargrave@dell.com,
	tomer.maimon@nuvoton.com,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 06/10] pinctrl: nuvoton: npcm7xx: Fix fwnode_irq_get() error check in npcm7xx_gpio_of()
Date: Wed, 11 Nov 2026 21:51:51 +0000
Message-ID: <20261111215256.1982044-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215256.1982044-1-lee@kernel.org>
References: <20261111215256.1982044-1-lee@kernel.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 693c9ecd8326 ("pinctrl: nuvoton: Reduce use of OF-specific APIs")
replaced irq_of_parse_and_map(), which returns 0 on failure, with
fwnode_irq_get(), which returns a negative errno on failure (including
-EPROBE_DEFER), while leaving the !ret check unchanged.  As a result,
negative error codes are stored in pctrl->gpio_bank[id].irq as large
unsigned values instead of aborting or deferring probe.

Check for ret < 0 and propagate the error code, matching the NPCM8XX
driver.

Fixes: 693c9ecd8326 ("pinctrl: nuvoton: Reduce use of OF-specific APIs")
Closes: https://sashiko.dev/#/bug/linux-95c9d7d3-32bb-4f4e-ab7f-84872957de4f
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index e051ff141d6c..47cc3ef8ddfd 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1856,9 +1856,10 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		}
 
 		ret = fwnode_irq_get(child, 0);
-		if (!ret) {
-			dev_err(dev, "No IRQ for GPIO bank %u\n", id);
-			return -EINVAL;
+		if (ret < 0) {
+			fwnode_handle_put(child);
+			return dev_err_probe(dev, ret,
+					     "No IRQ for GPIO bank %u\n", id);
 		}
 		pctrl->gpio_bank[id].irq = ret;
 		pctrl->gpio_bank[id].irqbase = id * NPCM7XX_GPIO_PER_BANK;
-- 
2.56.0.567.gdb80ae8cd5-goog


