Return-Path: <openbmc+bounces-2051-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C30CD6E79
	for <openbmc@archiver.kernel.org>; Mon,  8 Jun 2026 17:55:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZ06r0Kgwz3bpP;
	Tue, 09 Jun 2026 03:54:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780941283;
	cv=none; b=L52G+snL9ngucktmqfUI0PdwwCyYhkplffibFiUWUvc7ZjBZuVic9ezKiMLtgvFAJ44cXdtqag8JxdqDAi8NVD1i/xJ5XPBq6WqjoL7+RsTKuudm5m/JstA0dMh/R0jdXBwWKYvLdiS7Ss8kP4oKcp6tqr4GI9OcdzMwDjwOWTAsh7Tcxsrp3DAe+kwhJMoaFJdQCF3Mqi3QeOMELccJFt1b54w0KLqLHXOUKzkNacP109GkbAP6/034KmbLtZy0WWpyrF2ZrNjFQtSlgT3YrOR76zzCVf4i6iHZzewaTwWvCo8KjE4d6MLKJ4J8LXJkZUZFfvy1Qdy5Txm6Iygv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780941283; c=relaxed/relaxed;
	bh=mW4LY2YSpBNnXpOBaug9Vu5LiIFIUWmfv77D+R+pYHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nv3HL3y120DFVo5vFrW+hLUk4Vjb8GicKG9Wp5p7EA+EazPCNo83xvj9qO/Ed6/6ogNUxjeUFEXC3bOXGQvcIemUrJa7wOU3MqnJS6pmXDsu9DBqR9LRNWCkqbPrDz4q8+dcqj23RikXf+NU+Z8/oC0trZmHSzqJ/CwlmOqTaJi13HncYr65PWDAyLg6Z51DAu++17YNiWMTu3yIvxq1KsbsrYtD1m3uTtXmsk3SWVj/8IvAvN54O27bJfndNYaer5m2aOkz65B25KWDUoXkK2Q400SD5SmlG/wHW1HZEyXaoOUwJ4gD8CtbBrecI9Jt305pU4OvN6edHSknNGeT+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=geKKA0yN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=geKKA0yN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZ06p5tLhz2yS4
	for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 03:54:42 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b12270b3so28003825e9.1
        for <openbmc@lists.ozlabs.org>; Mon, 08 Jun 2026 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780941280; x=1781546080; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mW4LY2YSpBNnXpOBaug9Vu5LiIFIUWmfv77D+R+pYHs=;
        b=geKKA0yNSapIzsMp4JPEGo+OUbdau4i7E2ihnbhDgtZ6dynkAg4dD1TR+RppjjFz0A
         Nk5bLDVv1GQANJJiZV+eqDjRXqBzjvaTLswe5PJROpAlgWyllsiGrzdriYxC4+FKlKA4
         kcwsA1mMDCd10itN+82Bo4q1xPvSYS8jUqTua2SLFNNrLfxdqFRL2KrssCdVCSCHFl1O
         Yi+u8dpQYlR7Y2nz1406QFkxnhLCt7T//7sBQvxGJEyHGNv3JU4dVXOEwtp7wmREHy1M
         tDeim/95OTGXk0n1FmcLR2moZkI9FxN6bW1ahhgxFaqWnS1xgPXYAxVF8PuSafE9tKgl
         VLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941280; x=1781546080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mW4LY2YSpBNnXpOBaug9Vu5LiIFIUWmfv77D+R+pYHs=;
        b=WGFl1zVkp2OzQY2QpPznhEui8ChwAP3j8ZQpeSSDUINkmd/GXAr5yr5b8NrvO/NqAJ
         4e8T8KWj/dautiRO+mbDL1Ilsxl/fvjv5Nlun+vFkX25770Jz2X3hGptd1Z3nkfutvyP
         v/RMv/1CN6Q2fuTvPsz3ftKIjQ1SySeL/z7/nlEbntYbGIwaaMe1gcKid6pTR4AqoKM0
         Aw/QhVZdSZowLCLmYSja0S8YKsxQ7yPchiyrRZhX6CIswneVgNX27Rcj7beVdo3KY48G
         p2QcvU2mXX2ghcDTRsZPBGFYzfuq1IDvY+b+YZ/vpxLrTPF7KLfIANZdbHKkp1DP3rcg
         Fe0w==
X-Gm-Message-State: AOJu0YxMgTenVSjJO9VDyYS7agjAZfCiKe0U0tzf2Orr8Xgm8OM3aIRr
	eCKqzLDD+Xis1GYcSpx1yRZBGyUUB3IqLiYy6G66HALJ5ooqiBpG8I6U
X-Gm-Gg: Acq92OFCae1z5TI31icDlX6qMvPAKar4BpvteTdFY8YJ8b7NDpMz1Ov2X5sYnw8SQdO
	yFsp58kyNuACZoPZDuEa1x1URk5fBrDDBMrBNreLVq4464BrlrMx8RxfA7GcHTmMxSNL1CzYDFM
	NaQ76DRbFpZDQVmbXafex0ItClQdhNbdwxnABgyawDCoEYaAXe4Cy7P1U7pNGHvCdV0cDhmIT66
	X9fcTSvr0giTXoV4y8WAVRe6IuWHtfy86lOUxgbDNRIvsQ083U89a4z4VgutQvigm04WH91LTMv
	5XoGCXIOaomSVaH2rfwfO4hmvDc8BGS+GB0/74g5eBNvG4kDhc8moeaUjLpTxgpdOGHQBI4OGJQ
	6Bj3sBTtj0IHVv2io8acM1gHm3ljhRPFeAgywz01VrcdzANWjW7Q64MR6nzLonOvIru5kt20zrJ
	ags34S4dyPHkRFhoMOqJOqeesoHAJv43S+ktlr3NN2eUqS
X-Received: by 2002:a05:600d:4453:10b0:490:c2a3:3301 with SMTP id 5b1f17b1804b1-490c2a33392mr188853685e9.34.1780941279609;
        Mon, 08 Jun 2026 10:54:39 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3529e0sm56269275f8f.28.2026.06.08.10.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:54:39 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v2 1/2] arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
Date: Mon,  8 Jun 2026 20:54:17 +0300
Message-Id: <20260608175418.1936892-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608175418.1936892-1-tmaimon77@gmail.com>
References: <20260608175418.1936892-1-tmaimon77@gmail.com>
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

The NPCM7xx FIU controller nodes only describe the control register block,
but they still advertise a second "memory" entry in reg-names. Drop the
bogus name so the DTS matches the resources actually present in each node.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index ab3c3c5713ae..a16450abea0e 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -191,7 +191,7 @@ fiu0: spi@fb000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xfb000000 0x1000>;
-			reg-names = "control", "memory";
+			reg-names = "control";
 			clocks = <&clk NPCM7XX_CLK_SPI0>;
 			clock-names = "clk_spi0";
 			status = "disabled";
@@ -202,7 +202,7 @@ fiu3: spi@c0000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xc0000000 0x1000>;
-			reg-names = "control", "memory";
+			reg-names = "control";
 			clocks = <&clk NPCM7XX_CLK_SPI3>;
 			clock-names = "clk_spi3";
 			pinctrl-names = "default";
@@ -215,7 +215,7 @@ fiux: spi@fb001000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xfb001000 0x1000>;
-			reg-names = "control", "memory";
+			reg-names = "control";
 			clocks = <&clk NPCM7XX_CLK_SPIX>;
 			clock-names = "clk_spix";
 			status = "disabled";
-- 
2.34.1


