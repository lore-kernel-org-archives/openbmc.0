Return-Path: <openbmc+bounces-2063-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DDACD8CB2
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 16:39:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZZPd1N2yz3bpm;
	Wed, 10 Jun 2026 02:39:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781023172;
	cv=none; b=VZ2mc1awHx8EZWhWHiukvoN2ooNugKpASkQSxrBjuNaSEsyv05bK+gL3QpDHAN32+V7XyPHJutIF1Y4s0zKt0K/y0fyE4Av8WS8qdddCu00znGAP72O1I5WSvVO1LEP0lg3SHK3iE4emL1BbZQzJCvA8FGOPzwi+X5L7UrPbWLIXbvwF32U+o4eIeD62JSoU3ipwlBi/r+ERxJ7SknJZ2WD9XRskPtwRsdEXhMOLGI9X6m+fghOI7ECYotgMZAt8spzwxLcDCMH8O+M1QUhO/MJlFXDgrO41sq/x087lYZ2b37XFGShm0rdS3PftD9dfBOLT5M5Vg+jgpB5WHnb48A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781023172; c=relaxed/relaxed;
	bh=NPfdSQj9vTm35G3KAdx9EH2tKkR1Y8xAGyUsxKN7pqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kySbNmSX1jyDKmaewJ4AKh96NUYGoIdsTHshtqsp93c5ftYK8YaHKvv4iDxhqhsjvMBxkwW+6Xp1aOx4acvJZh0ji2S7vXBxg+tvQ08SmvXGA9vWYZvfBHhSiai4XnHYRq21vw84z8KPtEunit2WErK/PzF5XOUg8kK2ttcssPZ1AxtGNpooKxhumwczDBay8c/HVjs2wh8Y9qP2MC/zvbjKbKhBCTR6Y7AofU/o0+2A+fpMNeLUIcyZXMb3g4nKqBg1oy2qxsKCOpbNLlrWrU33qOOTIbq+hnuPYONX1+hKgYcEV7BPclCeskYxS/oR2ZoxCjdozsrMrMBdPDAV0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cgZOUSs8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cgZOUSs8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZZPb6jmzz2ytV
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 02:39:31 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso45841865e9.0
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023169; x=1781627969; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPfdSQj9vTm35G3KAdx9EH2tKkR1Y8xAGyUsxKN7pqw=;
        b=cgZOUSs8KdgUr6LHwcImxTrbBWYawkxMTWiHxeSkqu6EaDS73y6eImFUgqDfIAmW3u
         Dy+21MvioAEOWJ7n81guIv3LO4pDYoIWnW18qEaFgCQwylNN7+byjzu1o3xK7S/j0Vhh
         Yy6BnItC0i5ShbCjIuK70dmf2biPV/H1ihGcK1Sy2pmYDHon57qYqR+AqKjzmZWiGwKA
         SfLSjGna6bFLYChnw0zOba9o4J1TyODvqmKJkj7WfYwsXQKputWuJg1V6WbQ/tPxT2lC
         YgyV3n4W4cA8FxF4uauHckDj10DRyXkaeQffWPs+UpgLlN0kkxi+oKdyjTp51em3Yuhu
         ub0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023169; x=1781627969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NPfdSQj9vTm35G3KAdx9EH2tKkR1Y8xAGyUsxKN7pqw=;
        b=dNXB8qcM3GgBkyomDPGfwWUoFGVxaVUQKI9ft+EttpIom1HowYjToSyjIa+FxDkOmt
         2OXNwktgEm+/bFfEZKGpqWR5WTM4SIVPb/CTv2yDYv9PunWg89rXqhP8rF/enRHZVfgE
         HjMC+pk/gj1pP9kjNl3sOTDdR3B23vB7z+8nzKJ+njsdvkoYVyS1Ycfr9x6swM/CcZrm
         LqjFjc3AbmjKCgHWBC1L2sSYlJ3jJEb/U+rF5P/WY+nzh+YrxPQKf8bxozRiUrOZO0lG
         +uRKSK67cN/BBksBmezBrjPtvGYoKojI2RmWrdIz452GFRo+Y72IBXZJZN6ikuhyGJ2i
         VK5w==
X-Gm-Message-State: AOJu0YyKrgPIH6DJvfnofcoFX7Ida0wHIaWryo6oi2zkWfFm//C/wPO7
	1hZL4NPAFbHQqTMDggFcNKVJtAEucJiLwSD9Sk0qA3jhtnldG3gbnaOP
X-Gm-Gg: Acq92OH4fMHafu7civd7kG49AM8VgP6lUQZ6uAGpPoo2926zzgGvNOjLN1VO7j7UeDk
	dOY6diK50Qli+BISLarAGBmHzUe9O19CcrZxQpEKOtRgtGk7fTeVp+rE14IAviEKqSeOnbi7Piw
	s7mbPfgW12tzoQvpx/FnMlZ6LAv5MJvQ4zfa8dvBUZbO5Ezv17pZWUBfpkyXxAYOL/pItMLrMyB
	yXaIllsLTmWtL1YRMq0A+oqVCEk0+gsRLUsAyR4FW33izP0lg5PaE0ljxArFpwUwevc8WSnc4P+
	ooRsEg3QDhj7r7oH1d+U2Ren1Id4fEtrIBqVwITVSNq+9+u404gPFWddDGNwBD4xrkdxEdd6lQ/
	kgqxtUTzuq8WDSxXUtfU6Y4+grc5dfg+ElIv97Gv7VSJEGPkRMMhBnVWCn0vGuMhntzoDHf6myi
	672dbkMKJk8LGKNTalIalWpHIshZqHXSB9cZAGH7PjCwAdaBgpqTt+HIE=
X-Received: by 2002:a05:600c:3b04:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490c2cdd2bemr288823845e9.7.1781023168694;
        Tue, 09 Jun 2026 09:39:28 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d2d11asm440860805e9.1.2026.06.09.09.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:39:27 -0700 (PDT)
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
	benjaminfair@google.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
Date: Tue,  9 Jun 2026 19:39:17 +0300
Message-Id: <20260609163919.3321228-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609163919.3321228-1-tmaimon77@gmail.com>
References: <20260609163919.3321228-1-tmaimon77@gmail.com>
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
Content-Transfer-Encoding: quoted-printable

The NPCM7xx FIU controller nodes only describe the control register block,
but they still advertise a second "memory" entry in reg-names. Drop the
bogus name so the DTS matches the resources actually present in each node.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>=0D
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/a=
rm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index ab3c3c5713ae..a16450abea0e 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -191,7 +191,7 @@ fiu0: spi@fb000000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <0xfb000000 0x1000>;
-			reg-names =3D "control", "memory";
+			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPI0>;
 			clock-names =3D "clk_spi0";
 			status =3D "disabled";
@@ -202,7 +202,7 @@ fiu3: spi@c0000000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <0xc0000000 0x1000>;
-			reg-names =3D "control", "memory";
+			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPI3>;
 			clock-names =3D "clk_spi3";
 			pinctrl-names =3D "default";
@@ -215,7 +215,7 @@ fiux: spi@fb001000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <0xfb001000 0x1000>;
-			reg-names =3D "control", "memory";
+			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPIX>;
 			clock-names =3D "clk_spix";
 			status =3D "disabled";
--=20
2.34.1


