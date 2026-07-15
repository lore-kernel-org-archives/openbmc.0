Return-Path: <openbmc+bounces-2276-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D24C44508
	for <openbmc@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h0b8l5Gj1z30CZ;
	Wed, 15 Jul 2026 22:29:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784118583;
	cv=none; b=hA+LNXsp7EqWMp8JYVZ3lRFnuwNNJ8QZymbfoifpV5oB0WvvId6MBy6BMXlMAFALIuk4cGKr3vMFOP9mzw0cS2TD58CnxpBrX25ndK8cb3014USJD8jWGRergF4ikFG6lESJikcprguQKqH+Dgb8rXW66wsfazEeoG8/TZXP3b4pmMMEBgaNgQpCoYB0DmxbhyJpD6rtZbUXwGa7tFEk/+hd5z28QBe74ItnacbSc1Vvk7tzs+5SSYBac7HIFJEzkjS/uHw1NPHhDEA7BN5WXFJnXuSqiqS8u2YaeXaqFu7XcQjgOpjVDfTp1966BS35+rAmSQmUbu02fLp9ubdncw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784118583; c=relaxed/relaxed;
	bh=PTAx7TYBkRxSJa6QqLMtR87q/GzHDKuudoBFd1PCFdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a5Z5oage7ZwpktCMpBpLuA0FGIbad2hCdcbdXJHDE8HwIW/WzSJhK/IWtl4CyjGQBYknoVuu170otv5tbnEHs1pEctWyBXL2F5z97pSt+4xxtXJrggvN4a4roaRzJ0J0EYHHjXBDfdZ9vcGzEMwCQnTLVEBbHCt3JjA4YsGbrCW/EiLBxhGb92uC99T2eyor3YzyYNpKo4Fd6P3FZ8M+yobcLMBynK4JeWUIm7BrOADrNU6lf6QiCpHjR3fq4VN3glMxT0xok6vf55Sg0LQ9CoyVDPTLq53x4dXjJJLRmzO/4+1DSrfjUgDsKrCVUdLgNEjabq7DvbCXlogsmI4jOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sh9o0p+d; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sh9o0p+d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0b8k5JNbz2ywn
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 22:29:42 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493b27c7451so7622605e9.0
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118580; x=1784723380; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTAx7TYBkRxSJa6QqLMtR87q/GzHDKuudoBFd1PCFdQ=;
        b=sh9o0p+dtjYlbw5Ok5A6O9M9jts1flJx26DL6rnX3pOg7mXxi2qP+19da5ucdvA3Mu
         p4gC5hTFZ+VPFgFPx5h1TwA/fHYQm1xKj+/HEvPwdf7fZH/RcJgP8PsylhbzybHejFM7
         j1rTJu+RS8J/Vzsd2kBgRwCwtcGiQtV466mU2Ouq/OpYi5dIx6hKSWfyaKv8odSM1e1k
         /2uHxsUxEHA69oAtlRGM/PNx7bGzZ3QpnWF2T8PrdpQVTygw/uyoUg3LK8NNzlKHTjYK
         Rq7DGsN+ajVtSOGsZqCxa1kUQE6GbG/WUOsXnWd+EXgngoEfucJzFwDwNWeo7KgPnptK
         157w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118580; x=1784723380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTAx7TYBkRxSJa6QqLMtR87q/GzHDKuudoBFd1PCFdQ=;
        b=Bea+A34PsvkKJweu81Y4Dv6eOhZrJzaJjcFGIC/MDp+bJ4MhsNnpgpwN4k4KYVURV3
         xojvbgV1GrqcFZAt3fSF4VpYK7R8OKWrpAS2BsAVSGPozzKKXMLxkc54bI8CJcdI779/
         TDsxHNs01fCqsWja59nKM/IWJjObe/lc0Lksk17Kvi/ykSgAdIMLFZoesTPbcfklR07L
         MzUMCs71vre7IXymLYco/qn1IVvAY6mxppyhNWbUUD6KMSRyzxHCFLw608l2zlIrENtb
         w0M/YEGM3RNdOprkTPvAg1EV6Z5wo61nLyDMq03H1PaHD8bytfcnufzv/UL5LG09vOXv
         oxUg==
X-Gm-Message-State: AOJu0YxV6ooWdHFeZzI++UyLHYRaQZGLSq7Pkp1XnLbDR7b+s8UPAwtG
	TXFRroxS0r/7DRRvLkMNscUvLlq13xcD7YL+4FJU9rgPrPf2HDUG7+Ot
X-Gm-Gg: AfdE7ckdxHL1lSKT9rgDYTButdJEFWUAo0KmxE+VsB4gEQHfyAMa7geTs6bJButslat
	muO/jSoWCRKOktc3BHbq2r0a/DsS6a04CPIcvfB4e2AIXfC6DrV9hG6h20nMNUscA51R8koCwlL
	V1p52vOCNcfVZIWBXzEVLRvPGlhEfe4q0BCy99vGPD1PiRx93+Mn1PZiO93faAAkgZC6wI69Xkt
	Tl3QjonFpweZcefFKCH19eRefD/FFFmWN2F41xKH6cyEYgBQ0bgS79Xfw8Ju/xbgeaog7mXi9l8
	QVtNnwBL86l/Yw3QtiO7oCeMI8iXTdgccN02Oxzx9FHsX+ekTIfO7InTW/1EsQ7RN7/YVo6U9uN
	ldriizNaoxiW8p2hLoRLNxaL66YiIO50prWPd65V8AZFiEA3NAj2COQFDrm8LUqj6k/rWoTwY5Z
	iTUl0aLqfS5ucTdgmidBKQCP4=
X-Received: by 2002:a05:600c:3b0e:b0:493:f806:fc4d with SMTP id 5b1f17b1804b1-493f88268e9mr161675915e9.0.1784118579463;
        Wed, 15 Jul 2026 05:29:39 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:38 -0700 (PDT)
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
Subject: [PATCH v1 4/8] pinctrl: npcm8xx: clear pending GPIO events during init
Date: Wed, 15 Jul 2026 15:29:19 +0300
Message-Id: <20260715122923.1938327-5-tmaimon77@gmail.com>
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

A bank may retain pending event status across resets of the GPIO block.
If probe leaves the old state in place, the chained IRQ handler can see
spurious events as soon as the irqchip is registered.

Disable event generation and clear EVST before wiring each GPIO bank
into gpiolib so the driver starts from a known state.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 8d7dfb326..5dcb01923 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2471,6 +2471,9 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "Failed to retrieve IRQ for bank %u\n", id);
 
+		iowrite32(0, pctrl->gpio_bank[id].base + NPCM8XX_GP_N_EVEN);
+		iowrite32(0xffffffff, pctrl->gpio_bank[id].base + NPCM8XX_GP_N_EVST);
+
 		pctrl->gpio_bank[id].irq = ret;
 		pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
 		pctrl->gpio_bank[id].irqbase = id * NPCM8XX_GPIO_PER_BANK;
-- 
2.34.1


