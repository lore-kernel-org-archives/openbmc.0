Return-Path: <openbmc+bounces-2280-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5154C44501
	for <openbmc@archiver.kernel.org>; Wed, 15 Jul 2026 12:31:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h0b8v6MHJz3bqV;
	Wed, 15 Jul 2026 22:29:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784118591;
	cv=none; b=Jfkw9wvzhJN3N86uM7xuwSTCzpemb3AYDZP5wYKu6mCvR/f00PcB9JEPIwKj+hhgLn2CU+zHvPCf0HiNxFDT6dDJgrjn9ZBA/Gxrg5GrMovt7QMC/Z6TdavOOqNNfIUzSKdqMdWne3eDJZDbBdZtSkyo1ayjk2T1IGDqirj0f8tPAb7Kj5cH2s+iqmbPlOiuUfZfXNhIuAZfKVWVKdXtV+yme3IS2px7RWOtEpEpKD+/h8AjgUVizJLFFULy/ecI9zs64rPrLvTF/vonMbRVBflTh/cdEj4o/kHVvoncYrkEDJEFQqnAWKvalrNFuIgkS4cgh0qUCYOCcyxrzQncyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784118591; c=relaxed/relaxed;
	bh=wOCtAIRvCDRCzbr/NHWJUu3GPBu0x+R/AFbuRiWrlMg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kfqnf3RFVchRRe7+z+P4nl5UzXRLfT8jl3LFpMQfxNHTtxklKQfEYcbthLCcBsyXUDojlotygqNlojVhBooxhYjtAQZmdd12jgVvrxD/TXg/GPWqAr7y8aEouMNp+dLVw6bTuxbzeO53zHZ4gA6siwge4AkdeOVKABWT9eXYUg6tKNR8QFqvFbmniOaJhp2ssDiPxvUkRFMSSFrursm5UeTN6Ju7Djgqc4khvHB7ssdtr6BjoChOZKOVbEFN+commZpFikR1HrJHJTh/tBHVoEV/TrxMQM4t9+H0YUiiE1QxjaojWiOOkPAJp9ycXVanZCnuiFp8qjvCRIZiNJIyWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C4d/qKhW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C4d/qKhW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0b8t5yYWz2ywn
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 22:29:50 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso38123055e9.0
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118588; x=1784723388; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOCtAIRvCDRCzbr/NHWJUu3GPBu0x+R/AFbuRiWrlMg=;
        b=C4d/qKhW1nhO4sgEr/1E7UibjnbJK2kLJuclBmXrcZChGaT4Yg9ORw/qy03I4kXX4R
         FHkCdD+2Yba1pJOoh6R9gm9XPmp5F5ITF+F2+CxQWz0JI4i5zxdYqiT8udB6r09Ja3yV
         TzpwPbYBCQooVLlgf0WAuAiR1n5L5wBW7rF0TK3koPktefVtcqZCOOIsv2beiHha9MbY
         AfTLRVdeyrLf28xnKGsLa+cjQPrnrGeEtGfEHF+YLjtcTNABI7zYVZ1LPcebvyNU1yTB
         pP502cgVX4vSNThiMKUs+hX4mMcsL59cwiF7E/zbxtBzBIbPEUvuVYhHpc1e7TVQN5fk
         9gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118588; x=1784723388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOCtAIRvCDRCzbr/NHWJUu3GPBu0x+R/AFbuRiWrlMg=;
        b=FhV1WupIxWmnCcdZEv5d48Cj3OqAGl0ByarpzumdchXTgdiY+j1alIfPd9R4VGzL/P
         mTSe03X8ObFL2elRNEE+6VPHf3dQBxbdWZVWUN005PtASTvJBCIs7MhlsKUtMvy0Ndj3
         DPddgp87cfejf0PQ1dJjuryGhfravvpoS3C/sKh45T4h1/9BJurbyGOBPtqbI1WqtPUg
         H/yKjkIzy+EDq/9YGza7DoZWzIznj75N4j+eaC5gz1Kt5F4I5XQa2L8K9hxNxlMqcQPq
         KlrUHJZSvmTb7hOetgBGaDzCBEMIYdKObdhy+V6RzmP//G9bOlg9WqW+hILf+nVm0foB
         LngQ==
X-Gm-Message-State: AOJu0Yw6ImkhVFVatAy6qh7UpxExT8LLFSRGONR1dQIefZ8Ix40R3a/x
	dl8YFNwohlpU0+Q0SKKrjdwCa1cKHoW5h22KimaHoV1pgWPls62JjYje
X-Gm-Gg: AfdE7cnfiilhDWBLwVg2lqT01qa1kFTjy9zGkBDEDHhTlELJo4uWa5aPDBoEV2V3Pwf
	Ah5PAvzC/s4p8jjmJIJibUA/+FGIR/iAU4cVZP3yweEHSqs9sutvM3hkmHZjT7rUdHLgq//NU5U
	FvBb9CAducSGA7hxwc7tB3MBEDDccXmzPLvt4U+fthbZ/pW2yXIcmRW9MXPIORI6w7FvxJ+dKhx
	L3liP/IlU2pFxWoVKgCSuILqDIML+HnTj+DS3atZlAMuJ53HUV77cjl3dRiWqPuan03XdSmuwkT
	Pet+pUXkRiWRLYcBXFXhdL3RmKg15nuiCouXlN4qPao2KV5l1u4lc4+G+ZPBv6Az7+gYVQLklKm
	VPp6cLHetwZgxKwTmMCLqMFbVb5bYM82IpLWV8d2vTiEuzNfNtCJ6Bv9W4yKtNTKj8/U57RWH1h
	PMIqMVsCMEHBlXCZBi1MoDqIs=
X-Received: by 2002:a05:600d:6443:10b0:493:f762:45d4 with SMTP id 5b1f17b1804b1-495158c693bmr70101095e9.2.1784118587669;
        Wed, 15 Jul 2026 05:29:47 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:47 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 8/8] pinctrl: npcm8xx: fix debounce register selection
Date: Wed, 15 Jul 2026 15:29:23 +0300
Message-Id: <20260715122923.1938327-9-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
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

Each DBNCS register programs debounce source selection for 16 GPIOs.
The current offset calculation advances the register address every four
GPIOs, so offsets 4-15 and 20-31 end up touching the wrong selector
register.

Advance the DBNCS offset per 16 GPIOs so each line uses the debounce
selector bank that matches the hardware layout.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index f94494b67..f9107f819 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2211,7 +2211,8 @@ static const struct pinmux_ops npcm8xx_pinmux_ops = {
 static int debounce_timing_setting(struct npcm8xx_gpio *bank, u32 gpio,
 				   u32 nanosecs)
 {
-	void __iomem *DBNCS_offset = bank->base + NPCM8XX_GP_N_DBNCS0 + (gpio / 4);
+	void __iomem *DBNCS_offset = bank->base + NPCM8XX_GP_N_DBNCS0 +
+				     (gpio / 16) * 4;
 	int gpio_debounce = (gpio % 16) * 2, debounce_select, i;
 	u32 dbncp_val, dbncp_val_mod;
 
-- 
2.34.1


