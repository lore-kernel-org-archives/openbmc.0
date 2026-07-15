Return-Path: <openbmc+bounces-2279-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FC7C44508
	for <openbmc@archiver.kernel.org>; Wed, 15 Jul 2026 12:31:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h0b8t11w4z3bh4;
	Wed, 15 Jul 2026 22:29:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784118589;
	cv=none; b=biUNKRSAnJpWS9f2x78X/SsFeFGk6Aw/QMMS8u2pqzcyWtQkNENv6eP/ByA2PuNb7vrTgIqm6W9ZdaitrORm9mWBp0u5FXwTR4X9xYOTpbGZDiRETiZKYC26FnVRS9ar/kT9xla3g990V36wa0wv2Zvs/UX7LUZRmulOtO1a2WdwSZqWYC+dodpcU4YZ0c2Jv71aXWIpfG5adZdRGtJo+WEWjDd6hbb3lDdn2xHTSeZaO3YRnzq0agCbsXG7rmNbg0Qr/BbkmJVL8RolI5Sk9ZuC1QanILWpDAQVNdYBNMxYXOqCp8MMksveOL2+jxskfOWnpQk8WQCKgCh/Ibt+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784118589; c=relaxed/relaxed;
	bh=UoytU0F027gfAJU2q59F2/SIdHK+cPMMg+f9Ec707W8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cC/6e7/LAdA+6+uMe6XlsSJ8pqoOyHm4EtvkO/r6vYU0jo0OfYZM1RL6q1HMPuXdnUM1hdwhuKc6omycBccF5m5F1NNGis78Vffc/TrSSiBb4sFOUaxBUBjTWaFSF57EQBtjSRq6mkSxZ+8CuYwKGWQ5Yb8kCuYrvhmoyooOhpXuKpPhOhppV05TB1t0rifMu1hqajwBUMX2VfrYN5h4SmjYSxaDJpBTpygMcTWVsRVcUkZO0kCmccmpWOBHPMj8kBhvdcI6OeDBD34B06gdCzmCdZsAMAdfsa9BNC/wOJphKsAtTYdJfubOM8hzd3BOQcZ8rgj/M1THW0z7gfhWvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tElxocuG; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tElxocuG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0b8r6ldPz2ywn
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 22:29:48 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493ba701891so16886285e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2026 05:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118586; x=1784723386; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UoytU0F027gfAJU2q59F2/SIdHK+cPMMg+f9Ec707W8=;
        b=tElxocuGfrH9W2sIXc0o0Ojy8Qn9hk+/MN5G8glki6WO0W1Nv0PMP9QcRc/Jk6hQL+
         QooG8NoYoIcDD6G7KyNIZAnMog7BJ5pH9qaqogbNLypUCEHbhWgkpximU3XNcxetUvqk
         G2vljMwROZwp3eyGRAGnk3yAsEINNI9zD2RTKtOr1+P2lZbgcmAzDJAjA7ja6Oiij2BW
         pPxRSeooqrbvRGWKMLkP8H59EhU9snziLOICsCTK56X6lE9fAach3mArA74E4gQgl6xf
         /wIynctngqCc5kHbd/kSYahpXDrgfEDaPKLFGiL4rXCKHG67wJvAYiF4lvCB1g9z1Fm2
         Gvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118586; x=1784723386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoytU0F027gfAJU2q59F2/SIdHK+cPMMg+f9Ec707W8=;
        b=KpbGbaayuwEVCypbBaCIkiXS5d9wa5pKNhm0mQ/DhCxJWaK4CLV0Z43o5DmjZ37bDv
         YTqUt6fDl4n9TAhnoDlTAkAio0VjMektI1rgWdnUy+0TuKtQKe0DTWwIiy/3p5g9lpnU
         V+CYwK1XQCZi2YMpH4MR2gCwxL+UEDONc+qasB0qJH6jco7CONDcGUmoo7404jWV48Xd
         d6kO+d8yLv5VuyDdT9nrsLQ1hODcl7HUQpP/nh48yHBTS6rZQ3Y5JvvUNnFKNYTbayXx
         W/D+mY8WW+iW3SJJ6kvt6hQYE8w7znFii93iE01WDRNF9ZLFn+v484tUfoEsWulJ0IS8
         NIJA==
X-Gm-Message-State: AOJu0Yyn6fHFzbNRabA1h7tts1vh1ETc7DcNZTdgOmpdqMCNCJ19F7ps
	b+4C0SqFXZtSASIl7qGe35UODI4R5GBENm7hgJJN9ry6P6OlQCGT6SPr
X-Gm-Gg: AfdE7clKWa8mF7z0DgKD9dcBVAuU0bTiSXCNJg3bpwh8Jprtg6IUClOEDODherQRo2Z
	15WoxtspPVqX9RjPsJZc1VfI+aZGpfLHfhMEeF+hAbOuCjrwTjJxsQbL9wjyUGIcVbZ+P7q50yJ
	lpSoV4o4PFYa+v/kbXFmFVgkDpEupU59JX8zk70NlLAWJ0AR6FNqMyBFpX23x+k5VXjaPPsfZEo
	35vAeIYnc48B5I0QNnwofDMw/EiQFV4dhGrqO2cycDDSRwtL5JlFHC2Buv/8CZhfFAO8tPg62Xf
	Aapnbbgb00Qfqixn97iKIk1+Hc13Kh45bs8O1RBhJ9F0MTVl6ooMoLXZZXigSngotOHsYIX6aPJ
	5uRriLCDiIhUJPje7Lc3GSLX+LwVNaXIskgGnNjDEskBpAAWgKhk2kv94899lnzOxVBEjJowYSh
	XW8miokOwuUDqHUFC2nc3ya/4=
X-Received: by 2002:a05:600c:4c13:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-493f8828635mr123345555e9.30.1784118585835;
        Wed, 15 Jul 2026 05:29:45 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:45 -0700 (PDT)
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
Subject: [PATCH v1 7/8] pinctrl: npcm8xx: correct JM1 and SMB7 pin flags
Date: Wed, 15 Jul 2026 15:29:22 +0300
Message-Id: <20260715122923.1938327-8-tmaimon77@gmail.com>
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

Pins 136-140 and 142 are currently advertised as having both drive-
strength and slew-rate controls, while pins 141 and 143 expose no slew
control at all.

According to the hardware description, those pins only support slew-rate
configuration. Update the pin flags accordingly so pinconf exposes the
capabilities that the hardware actually implements.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index e21ccdb5d..f94494b67 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -1465,14 +1465,14 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(133,	smb10, MFSEL4, 13,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(134,	smb11, MFSEL4, 14,	smb23b, MFSEL6, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(135,	smb11, MFSEL4, 14,	smb23b, MFSEL6, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(136,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(137,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(138,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(139,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(140,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(141,	smb7b, I2CSEGSEL, 27,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(142,	smb7d, I2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
-	NPCM8XX_PINCFG(143,	smb7d, I2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(136,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(137,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(138,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(139,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(140,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(141,	smb7b, I2CSEGSEL, 27,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(142,	smb7d, I2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(143,	smb7d, I2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(144,	pwm4, MFSEL2, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
 	NPCM8XX_PINCFG(145,	pwm5, MFSEL2, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
 	NPCM8XX_PINCFG(146,	pwm6, MFSEL2, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
-- 
2.34.1


