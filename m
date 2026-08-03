Return-Path: <openbmc+bounces-2350-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59253C55179
	for <openbmc@archiver.kernel.org>; Mon,  3 Aug 2026 11:21:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDDlB45FDz3bSw;
	Mon, 03 Aug 2026 21:21:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785756086;
	cv=none; b=ju0KP9QBhTEb0gDnc/IxLImr37YQ0psRyHIfcVQsigLvd+RvLKUybyQfiKIxaoHG7P4c+gkJUuEJ+QpbNP4H21DKd48WsmiEeu6RaREv5uu2XA19m/1Rwrz2fRVDi0xVn0ftlSDwv0mxzipLUcIhfzrPxenhjvyuhyVnu0jl40Rlis+qgpRdkX55DkeoDLdVsNl8kVXlyxEcb15akfwlSCCeNORvdXBAk9AUFuZnpAjhc66w5MAM2oyIZq0YlKgJT6UWPVdY8KllNkv2+Ea5LMmPODPOD32+vDHlbP4rSPyEq8cZ2tfKqTKUXt+T3H6hpH3enhI33EMzaJ4W9/C8eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785756086; c=relaxed/relaxed;
	bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qjq+d2AF04/vdfRR0bvVfqwmUlaQwO0bmj4uCAJcszpBPhVoztpSnE5KBh2nJ4HxGhPkYtOGvpNqWEpoqT365Kv/RmCF24rk5r9OIb0G+It18ouHvdahmdLRmvJsSn37OXtTm7vFh5hFkhXEmIt8feEzoEWfz9qYfsebXav/NU6F2NlH1KHXiuI5m3/efhUcd8QSF376/k5pLpez2wM5Lb8ZfXfbJjHq94NZUz8wUlM48wxB3kqvKtAL74BVO99dq+KaTGVPAfZ3C+qj+nHDqv1weakTcYLUllqIWFH2mNLSxYa+h3zySYUl58k60N2fWfL+/d9uIlmvfZcbDduRzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I7x1QPLf; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I7x1QPLf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDDl92Yk6z30F3
	for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 21:21:25 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47fdd674e17so754070f8f.1
        for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756082; x=1786360882; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
        b=I7x1QPLfjKPxMeIZnd0BELkIE9HGNeHik+avqTom7Cph5ejX+86z+OTV1dwtMVzlW1
         DVcdE2d6JazJAyO64tv0IrTCg1/2HFrk7gUUmsWGwQNPGykuMr+Fzz6RyrxxO4NIpzvY
         0ZFh5evd6iGs25L2JjvO1o0d41NfSDpUeSpLEsk/QRKRagP9moh4Y3pQlWOxln9A3Vb3
         bZhwYhwHXEgoFBinEkE3XveORVWD/a87hynTCeF5jMQlz5rF+Sedl5z+oHhJ2zzyFwc8
         fpk4GeZDTwbbuwSwcMFde1p5iF1jVgC5xyfSN+FDGWh2ono5x/LZ/tZqnExkw+8TQg92
         qNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756082; x=1786360882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
        b=lfksvvEamsjNa6P2kC+9VggRAafaBbsAh6rPfZ2EHcN+a4d6yZPuPWfzP4/5ZAFX0d
         4r8nvUEQt75Cc+J2YHuaDrJ9Ja0sdj+b0kdwwXFv5D5C1AltyEJbKByUPaTx+y4Qxp9z
         d+okgJOtxH7FLv78fmyyIz1Pn/kh5ya/VNk61Gff4v+mDR4WeAHAx8YCcOXb8wrPTzAs
         AkV8XBFfWSEvq0HcHYebCqOn662nA2v0Wjdf374PF95rT+6t/siDw74u9CKyhdnGCeuZ
         xOlPxsxc/YTh4cOtPkM0vHyr2hXZpqCTJ7UEytp8LVdxZFTf6I+2SWTNvL2lFo55Fb8N
         ZxjQ==
X-Gm-Message-State: AOJu0YzgXt1JXgXI8y2eHV93blsgBWTL0B0OKDTo9LHmOTZtBG+Ay/1M
	GxamPavjjMyo+oEK7eoRhYvK/WmgPM7srZylkprrLmN9LCI8aVz/YY1e
X-Gm-Gg: AR+sD12kDRlD/tSfa9kLGmleCkdkoDdnofd6v1pHKZl+ZRpDTPZH2AbeU0Qfj24y95I
	eCRbmhkk0FfATp7klCCNelj1WsK5zUXar7/iRMXqPZHyPdiSrMJ6S97L4zV2tjMl+Z+5f+/LcCC
	H6q3LfgbB1dN65rBTCcNNg/mP/JQj5WrnlbgI/EU45/7nXlQ/J0eKVDliOsd6ZzYEIwHZE0wEP5
	7vVA0L9SC/NZ1yL1tJh+VxiApz7hoGMkVM7EocKZZ1OJWf1NAcfe8aOjeiEUYQku5xk9emQph0V
	DFgDLkb3Hzr7GXokSA/HT0KYRgEGLtyJHSGFJ0k7HzdAilipoSczGKiYF3UbBlZgy7uwhdzMrUD
	oZVSVQ5K/V2tIX1X5FmBG7SqbROktPFw+ekwr0h9Tyey/sxDmpOwswhFeJZPGHQLzqKViTQFNZs
	a/7NXu1VgRgM0WXJYpBreFH19S0owbe1tlvjNtyx8B4NkpZaH8qkWFFtVt+C+ll/0EsXXku7U=
X-Received: by 2002:a05:6000:430c:b0:47f:81fe:12f8 with SMTP id ffacd0b85a97d-47fd72c722fmr25304247f8f.1.1785756082026;
        Mon, 03 Aug 2026 04:21:22 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm34154913f8f.27.2026.08.03.04.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:21 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v9 1/5] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Mon,  3 Aug 2026 14:19:02 +0300
Message-Id: <20260803111906.1931384-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803111906.1931384-1-tmaimon77@gmail.com>
References: <20260803111906.1931384-1-tmaimon77@gmail.com>
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

The NPCM845 timer0 node references a single clock, but its
clock-names property is not described by the timer binding. Drop the
undocumented name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index c781190b4..9e4fa2669 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@ timer0: timer@8000 {
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1

