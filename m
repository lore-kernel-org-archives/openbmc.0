Return-Path: <openbmc+bounces-2274-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F69C44508
	for <openbmc@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h0b8g2SMDz308f;
	Wed, 15 Jul 2026 22:29:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784118579;
	cv=none; b=iIOYbJ2UZ6kkpf1AiN/EdoRQgoZK3mRxN/qrumP6EHX1rdl7DBhn+GH0zNwGlIY2P/c1eKRpgNR2TeYDoueqVu1PCkto9D7/VqOzYE2giScugknmE7HriHi2+rlsceCBrTi3eAWU2Ru9zrm214muadS/gh6KOZ7TNgjolwBy13jMl47h/wohyGIoYbFirLvtykVhx+lQH0ASZag+UDD7y/fdIMtrkOoHG78iY1+MWdT2aTzn+7/Z4lpKULuPdQkqcT3/vrreRsFDvUj0narecI0SH+gmZvy4itQU+b9GWT7dRVuOlO4PTTwAciq5rRDwIVZ+7dbLNrqBgTNsi93WIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784118579; c=relaxed/relaxed;
	bh=hGjJScr/bxpJuGG5Tma4ac3F09jinueH/67kipY/w2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jFxsXm6Wc4x4KfeIUnC4HLOECVbpRD2EqNqZsa+nZYvMugUgfDxPrtho2nW/132QKBlC5AuMdtc72vdxGMCQpZE+JLyOb6t+PaJMhmXe/WLMSVMSNw98+DolPpPlZfm7GXaWQhaJHCpSbtrba8TeJOafha2HYXpRlYUmSwUkdCUcG/ofdVXlFL1b54nSlGZh9tYQiPSBCwPxkfJQ2JQ+9WNLRbOGyLBmRpCVqNmAlqhoDnrUqQLLAdxP0gWgEX4sviACRr++TLTVLMBB9SlcSe+A7tVI3L9QwO0NivGx/B2gsKqZMJhLOVWFsgRpJVzMAKUUboI1sIM825q+m9oFEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JvKSD0kr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JvKSD0kr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0b8f1G4bz2ywn
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 22:29:38 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493c19bad03so48086335e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 05:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118575; x=1784723375; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGjJScr/bxpJuGG5Tma4ac3F09jinueH/67kipY/w2k=;
        b=JvKSD0kr7uk4AI4M3HexpSIcjALeJMmxZVz1lTro4dxabm3Rtj/3oUCeRs/Di5fW4I
         o+k6qs+uBhQzbn/U6X8dAp/mi8TOgG5WgVq9zIU4RnVZKPpcD+PKPByjbCAKdmfadqNV
         uf4UVhNxBEYAqpUB3a5CbMaNFAGRvtlnAT2HR3P3/TO8ItM3d4uo0hwiVxLXjBc7Epis
         HnMi8uxIsMxs+GFE81kDm/vKQCutDW8OyH0SyOJkBBvMssKYG7JA4dtuMw8IuatrX21e
         n0TE0GB9a6hiT10R8RSoxRm9APAgAyLXSoDTLM2hXBTViNNA82yG4TZ77ZLQIDVdVdSj
         2iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118575; x=1784723375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGjJScr/bxpJuGG5Tma4ac3F09jinueH/67kipY/w2k=;
        b=QzjkXINSTTh3BbL/2LW0uEY1EL/41a8ZUEYZ7pIcfWHqI0dd0jf4jThvmA7lYbjBKh
         cjZstJZrYWiE8Qq6YSx1pELIaee19EybptuXq0kii2lsfPrrak/PkuFWLdMNWcTbDTS0
         rsyfZU5UTT1u9C/qX9VYFVpIz4yD5okkjJxeafB+ejfI0jcEOSFOngaWPf+8Oa/Vru0V
         jJRSjWHTWq6Y5rc6lUBFthtqRhg+WSw0gdVZgi0zhWBlcGP4NXSS1yxX+ISwqmEV0xLw
         2OhjVoQWEQuljmhhWp8lq/9tAxoeWez1vRboxyMap2t6LGLxbANgvtZb6pb8O4DYPbMi
         OMZg==
X-Gm-Message-State: AOJu0YzxU7AGNTzkp7HGbs/CokkxelHyz5Lo7m8k3R5jSCyNIh1fdfpZ
	AoHGbAoh5yAPBuIGoFRpbIxJdhDJpOlBtd6gV8jbCwxD7gdqbkDPx4BI
X-Gm-Gg: AfdE7cmEjw1EBlwe/NevM+rZwI8666KYlnlIOqLmkl+ppWAg2FVZEBA0oNqeGwJDbvs
	J0acQnv5eEWKherDKzAlCM4RoVCl7IK3ynVQx2vN0AhQEV0/nzDkrnKHioPZiaf2jrKtOEj4Dco
	Vtn/O+j6ZcY04XxCVnOBBBMncYTUiyVLe3EOyfESVT6k1YMppgB62f4egvdz5Bz87tx56UgtHOH
	+X9CZDwlYHXB7ZJim1FYLy6nD+Wev7bokEbZqEFxu0P4nKF/GlcoX9kjwf7mSfMJmRdZd9GUoup
	8jGFiSnRPYyh+to/E7tsBJzGFCNESAnlTWalMJ4g07FMsSlAFLxyMjTVjFqFPOJuhdKZfy5X6eY
	/01bgB7J4QptyH+JiIDo7qcy4VFU62k3hJPfJO21P7Dh3S2jfx/99/LOSmKjMnjdNQc3AwajJ2b
	3KTplgVHuYrIa04OVKbvUNe7iUJYW/BGPRiQ==
X-Received: by 2002:a05:600c:3b20:b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4953c168d09mr28802015e9.16.1784118574883;
        Wed, 15 Jul 2026 05:29:34 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:33 -0700 (PDT)
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
Subject: [PATCH v1 2/8] pinctrl: npcm8xx: enable RMII outputs from RMII groups
Date: Wed, 15 Jul 2026 15:29:17 +0300
Message-Id: <20260715122923.1938327-3-tmaimon77@gmail.com>
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

NPCM8xx uses GCR_INTCR4 bits to release the R1, R2 and RMII3
transmit outputs from Hi-Z.

Those bits need to follow the mandatory r1, r2 and rmii3 pin
groups. The R1_OEn, R2_OEn and R3_OEn side groups are optional and
should not be required just to enable RMII transmit outputs.

Program the INTCR4 bits when the corresponding RMII groups are
selected and clear them again when those pins switch back to GPIO or
another shared function.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 61 +++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index c859dca4b..1d5b3c648 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -26,6 +26,7 @@
 #define NPCM8XX_GCR_SRCNT	0x068
 #define NPCM8XX_GCR_FLOCKR1	0x074
 #define NPCM8XX_GCR_DSCNT	0x078
+#define NPCM8XX_GCR_INTCR4	0x0c0
 #define NPCM8XX_GCR_I2CSEGSEL	0x0e0
 #define NPCM8XX_GCR_MFSEL1	0x260
 #define NPCM8XX_GCR_MFSEL2	0x264
@@ -78,6 +79,9 @@
 #define NPCM8XX_GPIO_PER_BANK	32
 #define NPCM8XX_GPIO_BANK_NUM	8
 #define NPCM8XX_GCR_NONE	0
+#define NPCM8XX_INTCR4_R1_RMII_EN	BIT(12)
+#define NPCM8XX_INTCR4_R2_RMII_EN	BIT(13)
+#define NPCM8XX_INTCR4_RMII3_EN	BIT(14)
 
 #define NPCM8XX_DEBOUNCE_MAX		4
 #define NPCM8XX_DEBOUNCE_NSEC		40
@@ -1796,6 +1800,61 @@ static const struct pinctrl_pin_desc npcm8xx_pins[] = {
 	PINCTRL_PIN(251, "JM2/CP1_GPIO"),
 	};
 
+static u32 npcm8xx_rmii_output_enable_mask(unsigned int pin)
+{
+	switch (pin) {
+	case 178:
+	case 179:
+	case 180:
+	case 181:
+	case 182:
+	case 193:
+	case 201:
+		return NPCM8XX_INTCR4_R1_RMII_EN;
+	case 84:
+	case 85:
+	case 86:
+	case 87:
+	case 88:
+	case 89:
+	case 200:
+		return NPCM8XX_INTCR4_R2_RMII_EN;
+	case 110:
+	case 111:
+	case 209:
+	case 210:
+	case 211:
+	case 214:
+	case 215:
+		return NPCM8XX_INTCR4_RMII3_EN;
+	default:
+		return 0;
+	}
+}
+
+static void npcm8xx_set_rmii_output_enable(struct regmap *gcr_regmap,
+					   const unsigned int *pin,
+					   int pin_number, int mode)
+{
+	u32 mask = 0;
+	u32 val = 0;
+	u32 bit;
+	int i;
+
+	for (i = 0; i < pin_number; i++) {
+		bit = npcm8xx_rmii_output_enable_mask(pin[i]);
+		mask |= bit;
+
+		if ((mode == fn_r1 && bit == NPCM8XX_INTCR4_R1_RMII_EN) ||
+		    (mode == fn_r2 && bit == NPCM8XX_INTCR4_R2_RMII_EN) ||
+		    (mode == fn_rmii3 && bit == NPCM8XX_INTCR4_RMII3_EN))
+			val |= bit;
+	}
+
+	if (mask)
+		regmap_update_bits(gcr_regmap, NPCM8XX_GCR_INTCR4, mask, val);
+}
+
 /* Enable mode in pin group */
 static void npcm8xx_setfunc(struct regmap *gcr_regmap, const unsigned int *pin,
 			    int pin_number, int mode)
@@ -1834,6 +1893,8 @@ static void npcm8xx_setfunc(struct regmap *gcr_regmap, const unsigned int *pin,
 						   BIT(cfg->bit4) : 0);
 		}
 	}
+
+	npcm8xx_set_rmii_output_enable(gcr_regmap, pin, pin_number, mode);
 }
 
 static int npcm8xx_get_slew_rate(struct npcm8xx_gpio *bank,
-- 
2.34.1


