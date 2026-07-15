Return-Path: <openbmc+bounces-2275-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6F2C44501
	for <openbmc@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h0b8j5F6xz309r;
	Wed, 15 Jul 2026 22:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784118581;
	cv=none; b=PuHLEqjx+qNoUpKGdcj908EiV5IARkGABeJ7Kb83ghY1fQhvq+f81Gf2Pe2cIzkFs6+oP5YR9svPZ4/4rSr/fT7tA6fOmWtZLmFuPN34ODSUvH2bPbwyXTIgDaz2tkM8J+oZSkhWw7efJGzok+zR0/HyHKf0o+ctrMl+zIGhhCKvXSOyPsyrBPb8E4KiABnFjvhFiPviPugyDNxsYcWP1JDToWkDaNznNTS6AXx4HIipWsA7skaK8+VyI+TEPf4uTXo57VSaw/h9Uh/LEYs5l/WyXqfhllz1LXKTGRtkYhQ0vCgsNV7ddjq3r6BVacl+PvZIn4xvpbFX9rdsikFjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784118581; c=relaxed/relaxed;
	bh=+ffpOVmxEgLoaCWkah67vyuTnecgePb6qoQjLtT9PDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YjqXiPiCjviJOmdodYNt5GfeJ4oFB7fjI+MFTog86T7TphHE/InOeGawLaOThd0wS5P7e7tgadPdo1TC+NDoTD8Q52vsAqrmtH4L9QNLMGH8BeC1PHL5/HyABtWfsjADq6/B2MSDgFNXItIqune735w6CdtNwzvuyfwjqKKIDRs1c47TvbhABj9n7NHPq7dp6BiMs67SyUeS44fc49Hif6bko/w8bCniZtZD7rR7YkmEQkAtmbE3UjJ/Hq+3tkcLcH2LdiPUvrsFHUDHhhA0BEQiACp0sC+FRnxmVr01YsPG7GZLghT+WKM7BqnnzGtMN+85UiITXllt+1w0uDZIgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JVs5joI4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JVs5joI4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0b8h4J5Zz2ywn
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 22:29:40 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so12224275e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118578; x=1784723378; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ffpOVmxEgLoaCWkah67vyuTnecgePb6qoQjLtT9PDs=;
        b=JVs5joI4P7y5zHatBVjKwAFwaeU1bUJZKgtnZVjcTia22NWIOfMANqhRZDF3XYoMlm
         eARggFuwequDZ1biiSpt2GcXm+lrcZ+ctlt2QFauvsB9bElkI/TdUcdEbeKt8doXUCL5
         gt9Eipg38NF4rhUgZig3cXgF+PxY58AKYX5CTUg5r1TrkmcGwPBuaWEjUQJwPCwHjDr+
         9btJ5ms4USTwNOYASV/+haBgKjbWPAwItxbub3ZZGxPyLiO0zWpSZQNcUn31885p4iPZ
         9vuUZvP+s06FDy4AUYMQci6PUCM2xlp7pEWuoCqwBNn540ItpsFlhILvw6/CyJEexA6q
         cIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118578; x=1784723378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ffpOVmxEgLoaCWkah67vyuTnecgePb6qoQjLtT9PDs=;
        b=T5InzCJ55C5Z5RVCY3t6u8ADKtbLfdqJePBm+LLfsJNxhLdefEWfgVa3CLGFOcZ24t
         oCFYULN3qfjr/hKazReWOn+k6sr+dHDy24dsMC5e+hxLYHDFz+G4qxTXWdQH3SY/n/+v
         TwW9uN1AP6DkUJSpuZ1WuSWEoJWZOfC/5F40lsFo/rNqm6UrLgPNdsvNGfuAGWz4lukg
         fPxQT6Q4F0vrx7D5jv+wIPPE05Dm2SjOBrqaXNDFM3PBJotej/uRdNPsWHfQzKzU9Muu
         hhSH7q1t4IXlClqXjqi70kX0YnIwIpmYjmbjyqtkQ+YMLlJF+M1AixxkSzA0pipipt0F
         WPoA==
X-Gm-Message-State: AOJu0Ywh4z3Qyg19uXAPMYP/elnA7muwtG1PpiK1eKEJ2LIEdRwbib6W
	mtAYVLWIJRU9+JZ2DhtE652aKLY9J4DjOcMjTLVliXjLuxiW7h0yQZS2
X-Gm-Gg: AfdE7cmGfwjdagCzyKIsodAaIcV5cRWO7mBztQa1ZVyhe0skMZfgHaPfnvben3VYfLc
	MZkvrBETWUJIW6zK0s+C+wVX65UriiPmEm233Itu4k+LmEwfsUyDf5mcDyZG5fhvev/2HNMQwfY
	uvuS8o2xriYAa0AT5k9AY+Mb+L98Kl/24cu2reFjrcT+T0GxrHTnYKxwbuEoK1dtVDKXSm876xK
	fmzpA4ntx768MQydwQ3uGRbqJtrHc4pjWExjixMFuKoVT3Ca899isP4Y9ov2LtE3mQL+3juvODY
	fdeKBjV0h/Z5javZ7vRZjdlL2FXLlurdJR3SChZv8SpE56sLoYOlR5d02O/DF0c4t0Su5kbQtum
	LJmhUyn7p3i9y+tUbIEvfrI3QA6SrSPaAgRasYLSXzWCubn+11Z16nicdRHOwDYj25Fh7d+d5xB
	7xqqsHDL7ANq2sKZfdTD6846w=
X-Received: by 2002:a05:600c:8b65:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-493f8885308mr177231885e9.7.1784118577373;
        Wed, 15 Jul 2026 05:29:37 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:36 -0700 (PDT)
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
Subject: [PATCH v1 3/8] pinctrl: npcm8xx: support RG2 drive strength selection
Date: Wed, 15 Jul 2026 15:29:18 +0300
Message-Id: <20260715122923.1938327-4-tmaimon77@gmail.com>
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

RG2 pins 110-113 and 208-209 do not use the per-bank ODSC bit that the
driver relies on for the rest of the drive-strength handling. Their
strength is encoded in GCR_DSCNT[7:6] and supports four values: 8, 12,
16 and 24mA.

Mark those pins as a dedicated drive-strength class and translate the
pinconf get/set operations to the shared GCR_DSCNT field so the full
hardware range becomes available.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 75 ++++++++++++++++++++---
 1 file changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 1d5b3c648..8d7dfb326 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -82,6 +82,8 @@
 #define NPCM8XX_INTCR4_R1_RMII_EN	BIT(12)
 #define NPCM8XX_INTCR4_R2_RMII_EN	BIT(13)
 #define NPCM8XX_INTCR4_RMII3_EN	BIT(14)
+#define NPCM8XX_GCR_DSCNT_RG2DS_SHIFT	6
+#define NPCM8XX_GCR_DSCNT_RG2DS_MASK	GENMASK(7, 6)
 
 #define NPCM8XX_DEBOUNCE_MAX		4
 #define NPCM8XX_DEBOUNCE_NSEC		40
@@ -1287,6 +1289,7 @@ static struct pinfunction npcm8xx_funcs[] = {
 #define DRIVE_STRENGTH_LO_SHIFT		8
 #define DRIVE_STRENGTH_HI_SHIFT		12
 #define DRIVE_STRENGTH_MASK		GENMASK(15, 8)
+#define DSTR_RG2			BIT(16)
 
 #define DSTR(lo, hi)	(((lo) << DRIVE_STRENGTH_LO_SHIFT) | \
 			 ((hi) << DRIVE_STRENGTH_HI_SHIFT))
@@ -1419,10 +1422,10 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(107,	i3c5, MFSEL3, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(108,	sg1mdio, MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(109,	sg1mdio, MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(110,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(111,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(112,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(113,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(110,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
+	NPCM8XX_PINCFG(111,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
+	NPCM8XX_PINCFG(112,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
+	NPCM8XX_PINCFG(113,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
 	NPCM8XX_PINCFG(114,	smb0, MFSEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(115,	smb0, MFSEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(116,	smb1, MFSEL1, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
@@ -1513,8 +1516,8 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(201,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
 	NPCM8XX_PINCFG(202,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(203,	faninx, MFSEL3, 3,	spi1cs0, MFSEL3, 4,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
-	NPCM8XX_PINCFG(208,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW), /* DSCNT */
-	NPCM8XX_PINCFG(209,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW), /* DSCNT */
+	NPCM8XX_PINCFG(208,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
+	NPCM8XX_PINCFG(209,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR_RG2 | SLEW),
 	NPCM8XX_PINCFG(210,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(211,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(212,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	r3rxer, MFSEL6, 30,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
@@ -1954,6 +1957,56 @@ static int npcm8xx_set_slew_rate(struct npcm8xx_gpio *bank,
 	return 0;
 }
 
+static int npcm8xx_get_rg2_drive_strength(struct npcm8xx_pinctrl *npcm)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read(npcm->gcr_regmap, NPCM8XX_GCR_DSCNT, &val);
+	if (ret)
+		return ret;
+
+	switch ((val & NPCM8XX_GCR_DSCNT_RG2DS_MASK) >>
+		NPCM8XX_GCR_DSCNT_RG2DS_SHIFT) {
+	case 0:
+		return 8;
+	case 1:
+		return 12;
+	case 2:
+		return 16;
+	case 3:
+		return 24;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int npcm8xx_set_rg2_drive_strength(struct npcm8xx_pinctrl *npcm, int nval)
+{
+	u32 val;
+
+	switch (nval) {
+	case 8:
+		val = 0;
+		break;
+	case 12:
+		val = 1;
+		break;
+	case 16:
+		val = 2;
+		break;
+	case 24:
+		val = 3;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return regmap_update_bits(npcm->gcr_regmap, NPCM8XX_GCR_DSCNT,
+				  NPCM8XX_GCR_DSCNT_RG2DS_MASK,
+				  val << NPCM8XX_GCR_DSCNT_RG2DS_SHIFT);
+}
+
 static int npcm8xx_get_drive_strength(struct pinctrl_dev *pctldev,
 				      unsigned int pin)
 {
@@ -1962,10 +2015,13 @@ static int npcm8xx_get_drive_strength(struct pinctrl_dev *pctldev,
 		&npcm->gpio_bank[pin / NPCM8XX_GPIO_PER_BANK];
 	int gpio = pin % bank->chip.gc.ngpio;
 	unsigned long pinmask = BIT(gpio);
-	int flg, val;
-	u32 ds = 0;
+	int flg, ds;
+	u32 val;
 
 	flg = pincfg[pin].flag;
+	if (flg & DSTR_RG2)
+		return npcm8xx_get_rg2_drive_strength(npcm);
+
 	if (!(flg & DRIVE_STRENGTH_MASK))
 		return -EINVAL;
 
@@ -1984,6 +2040,9 @@ static int npcm8xx_set_drive_strength(struct npcm8xx_pinctrl *npcm,
 	int gpio = BIT(pin % bank->chip.gc.ngpio);
 	int v;
 
+	if (pincfg[pin].flag & DSTR_RG2)
+		return npcm8xx_set_rg2_drive_strength(npcm, nval);
+
 	v = pincfg[pin].flag & DRIVE_STRENGTH_MASK;
 
 	if (DSLO(v) == nval)
-- 
2.34.1


