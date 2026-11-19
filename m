Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED4606A903
	for <openbmc@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PV4qyeKo
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVrGx5Fbmz30M6;
	Fri, 20 Nov 2026 07:51:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795121481;
	cv=none; b=BhFfpKYLJIj9BF0eFzXfYxZIzP5kAjj8pwMxAeecKpdoNZ3Y0OJTrEbd8Lvu4q80+Hf5rbJd6gOGG61vOvLul2jGhe5amjAx9OFNqwPlgVd2UTEtyQfOuHq65wUNjzNOCWAYmKfYvYAM0qkHA02zQBt7mTnje6JADf4MBjO5t66DLJsbQaES4PwKmL77aCagxiTR/JsUuuC0cUd0ShN+XOLMX6b1Kia+MXTPMc3du3GwLxfUiZC0LNSdLBCpJvp6ZQ3i0bDvzFPUeRtVeQvjwyz+9NfA9kVhcOP18xI/gpN/1BNu/AHJX0xsnGCpuX3OC4p0yybydrpornho+J6Dhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795121481; c=relaxed/relaxed;
	bh=2/xhsmajeOTWb9TKDJR/qiksAhZWeEjLp5YMMU353/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJtcYuRT36K0l4q9i5lhR3+IisqDwGn6Fn2tdrehd5ibTVz9WIv9oDw6O6EVzrmCFjumuR3tJlwl9AB4+CM9yE4nx9ZrwbUx5TJzOpO5+awa7SWxHOD/DAPRFMvpfxFAAO40c0Q65yGULrnpWhWmxnInzmQCGINMdakHh4kF+Va2zchJfm1sjUnaN6FcOUCl7EgfiRSpOsLJagbldVG5AoJCWdJnrB4ogmHL1t15YzCCawiZEhyWaxgE3bJY7kJHcAY+McBDkFxeNJR5ezh0Rg0PY9AP996gt0o0j/7NVokckGkO9Q/OXQUSK7hDmf4lIhZkDIBS+XP8FeJDMlATaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PV4qyeKo; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PV4qyeKo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jVrGw3kyCz2xmh
	for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2026 07:51:20 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25FE560D80;
	Thu, 19 Nov 2026 20:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF4B1F000C4;
	Thu, 19 Nov 2026 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121477;
	bh=2/xhsmajeOTWb9TKDJR/qiksAhZWeEjLp5YMMU353/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PV4qyeKoMQS3aDNLmBQ/LvHdDXPOF8bb14HpuXjHSb5psK1uBZjKpCjDERXg1bcsQ
	 seMu+5GhBo6NKKAd+YjadpKDSfZSRM1I5L7ljIQLV73v7IyxW1a4VniVmd/nEvYmbo
	 SA1ISzGvchk7LjPXIFEkK/v3tHg/IgPbz5lFNJaDLc+68vsZOIGV2N/ppOV4FiRgt5
	 WR+fqTb4KR2wJwBRNB54E1A2yCeoH0Hay7cm1vLwxQw6a7R/2mqjaAeuxuHRhKijVz
	 sk32dTXv/hHKD3JH6s0X4IqXPMOrPLzBkUd1+gXQadlb+Rl46LplsHsdDMubtlEyFT
	 SIyM0DHosEeOw==
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
	jordan_hargrave@dell.com,
	tomer.maimon@nuvoton.com,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 08/12] pinctrl: nuvoton: npcm7xx: Fix fwnode_irq_get() error check in npcm7xx_gpio_of()
Date: Thu, 19 Nov 2026 20:49:04 +0000
Message-ID: <20261119205013.2563811-9-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119205013.2563811-1-lee@kernel.org>
References: <20261119205013.2563811-1-lee@kernel.org>
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

v1 => v2:
 - Rebase onto pinctrl for-next, dropping manual fwnode_handle_put()
   now handled by __free(fwnode_handle)

 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 3e763a097b91..72480603ce6b 100644
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
2.56.1.750.gf70dc682cf-goog


