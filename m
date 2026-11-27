Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C0606A31C
	for <openbmc@archiver.kernel.org>; Fri, 27 Nov 2026 14:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WluSVrhM
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jbZwv0JRQz30C6;
	Sat, 28 Nov 2026 01:07:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795788430;
	cv=none; b=bju5xxOnOeS0d3nqMyBcU6+9qRLKZc827eH7T4f14JZhuQ0TnN2jgk5yR5e3Mt3NkArFLmOJJPf7QDgC055vCFnb1j5hHPwQ87SqbVUhk18UtRKPtT47N4I+FkmLNbLq3GNE6tlUn1NrBwoWgdITezNPcmDB0Y7Xt4HYaTuYkZOp5Y7Zcj4zHLpvv/MJgThbK1XV0ZnuuyF7bfHvDMwDbNSczTMhUK8KyiIR9nnv8kdwtPqm2lt6olu9/A0ixUiUwjQdenvk8BS6bE3+ucAfkMePII44PJBaNHtdJMCmbuX4qcWhRx4CKJz+u5hVmVKKINnzBg1xjVbI9cHZdQeHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795788430; c=relaxed/relaxed;
	bh=prqg+9+C9OZ8PzG7e/SKDZecuZaCZLp73YjumQbdiU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THq72xRChVJcBpTMVYgKzSaJcGsNCzndf1updBMCiIXReSWjX2jQkkBCfA+/YJhZqUQmx9is8OpiX+QHlnIjWJf71sKbpbU7V46G7Q0Dr/nf6fWraMDWfj+kq7Xfzb6bkBvYR/eRsTqU+juLo2ey7MNSJS95n+fFHYPaib+vr/Nu9XP0DTx+uVLYha/H6BM2ZdYkIm6KRZp5QayoPnT7oZw8QAQnIisoyIoiKVnD6/Uwa4iyW9ItrrHWPbDS/cSPrdF81vSOcpGihmpvBRuRdqs4T01cDwi9V9EgY9kFYpLSEmaWomuqV6g3Z7P+xDs59/v6uIhVpe/ViFLcFmglyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WluSVrhM; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WluSVrhM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jbZws6Vx6z2yLH
	for <openbmc@lists.ozlabs.org>; Sat, 28 Nov 2026 01:07:09 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 472774244A;
	Fri, 27 Nov 2026 14:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D261F00898;
	Fri, 27 Nov 2026 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788428;
	bh=prqg+9+C9OZ8PzG7e/SKDZecuZaCZLp73YjumQbdiU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WluSVrhM26loZJ82d5WTlntzlSI7z764lstfJsoSo+F67X0TWsat7WFCo2lHSal6q
	 CXZX1TEeoiyJhhS/meskFdEfs72gcw5+UgBEbSaH9phrDN6lcwz7GI4M83T0DtGPyy
	 nMW4BqBFn03tFHvAv74vJN9fiefL+VxiX2+nPlyrazIgTfM/0FnCXghN1mV+agl7Hc
	 9adM7/o3QM+HEtZQtsYKIpJfhrWJk+ygkBD3rVfkDVVO0IqTMcARJ949HDQHGl7rTh
	 L4YL1rZF7kkZCRMq6b3SJ2IElhPX4r0xrinpLo4IiSqe/ZDSePsve0YTcVffpPOfa8
	 pLqApiCKhk3lA==
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
Subject: [PATCH v3 08/12] pinctrl: nuvoton: npcm7xx: Fix fwnode_irq_get() error check in npcm7xx_gpio_of()
Date: Fri, 27 Nov 2026 14:04:56 +0000
Message-ID: <20261127140602.2790001-9-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127140602.2790001-1-lee@kernel.org>
References: <20261127140602.2790001-1-lee@kernel.org>
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
negative error codes are stored in pctrl->gpio_bank[id].irq and passed
as large unsigned IRQ numbers when registering the GPIO chip instead of
aborting or deferring probe.

Check for ret < 0 and propagate the error code, matching the NPCM8XX
driver.

Fixes: 693c9ecd8326 ("pinctrl: nuvoton: Reduce use of OF-specific APIs")
Closes: https://sashiko.dev/#/bug/linux-95c9d7d3-32bb-4f4e-ab7f-84872957de4f
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
v2 => v3:
 - Rebase onto pinctrl/for-next; no functional changes.

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 08eb9aca36b8..ffa2fba023af 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1871,10 +1871,9 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		fwnode_handle_put(args.fwnode);
 
 		ret = fwnode_irq_get(child, 0);
-		if (!ret) {
-			dev_err(dev, "No IRQ for GPIO bank %u\n", id);
-			return -EINVAL;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret,
+					     "No IRQ for GPIO bank %u\n", id);
 		pctrl->gpio_bank[id].irq = ret;
 		pctrl->gpio_bank[id].irqbase = id * NPCM7XX_GPIO_PER_BANK;
 		pctrl->gpio_bank[id].pinctrl_id = args.args[0];
-- 
2.56.1.839.g22a8290db9-goog


