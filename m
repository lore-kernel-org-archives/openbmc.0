Return-Path: <openbmc+bounces-2074-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9A5CD8CB9
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 12:19:10 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb4ZB11XVz3bps;
	Wed, 10 Jun 2026 22:18:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781093921;
	cv=none; b=kWCsffH5bhmsjKJRC7ZSwNGA7lDck+iZGuZNlR8jOMW9IDCu9fAFOO7yV+BiHTG/bO3c6hPvWAB08C3Jckb5VgAk9r23Y+xziAxiajq6ooV+XexgG/L7K2WMffpgrwNZImZrI/Xs/KS985jTpa+jeMuVeEt5s2uelT6yR4uOSrXb5Rlx4WKzChxNMqkRBBd25cLB0W+gZXMGTzmoQKwAbjJaUav2JKGd46oLDJIjWGOpGPdgufqR7+gtG5CU4GyQind0MNTmDNWcHKpmumLuJDX6SNwNvPIXxZY6PFwJgW94ue1chUNgPtFmRLMPjA+UiWGu/BTphoGQrwzcy6VhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781093921; c=relaxed/relaxed;
	bh=U7tivorkStwB1FS3/hWit3SBK6zemxB0rzwIUjUwnSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fhYiG00Sxvugmr+Nkg7co/8RgZc+W3XkoXoEuoG7eGzW0AcEd5BmCSkASvQm6xlUMHP9v44e5MTqWfxp0M/vdsQUfoIJTRu0vWQysNl9LKDoV5Gw/Ft5chJpQM7fIi7syGIyRksGYf0ZCqrjxRmwt/bMve6h1JwUvhrdY6knM07FdAgbhsibnltXk99tYs/4syaF1DyggNlzuAY0h79tz2u1NWOCE9W9O/dOrsKrDHokheoEkXXTHX8ENIDJx2bkVkRXPSnDX/0IzIT12jbeljUgLxsua5hAN0eaCuTjSDxuHHz0OAkthfRTnluz0AB7bWF2e0MOYWXJG/LEuhHKuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mk2v2ABW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mk2v2ABW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb4Z86qwtz3bpm
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 22:18:40 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b3e03939so55530595e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 05:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093918; x=1781698718; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7tivorkStwB1FS3/hWit3SBK6zemxB0rzwIUjUwnSE=;
        b=Mk2v2ABWE1X0QNK8dp2xNaN4Axcikk93gRVpiIifU0ZMVzmx2n11MFq53is/KJGJQK
         b3AtB9RsEaVuT2TkxXYdlqtQCAnw/EXV2/mzeji0ioLETHEDukPSLybm8Kf+5qo/UZkb
         DOPdM4O0mzTdMqBKaSNqvIQIqxv7sf7EIj2V3EqyiKlxkgwt1NKVbt3beN+REbYRXmfR
         5P07Yc4IMY+8Y9PZNB5gy3vDoqsCkJYzUOu6GtoJ5npnavV6jRjXKJunq9usX3Z0NNnt
         6O8q9N6a6j5Qww67M8A372g3WKtHh2pBVqBYfNWE1BKdj4FWZwdUdEL8m+8AXum2Ksln
         rBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093918; x=1781698718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U7tivorkStwB1FS3/hWit3SBK6zemxB0rzwIUjUwnSE=;
        b=AHt+CPp8QDJNBdGhHQLBEz0Ilri/WouK3k1jQOnsUR//Aug4ljpVf9vkaHESIQhB++
         75qfsswOoomoNPDNmV2PKfscKr7hxHb86XwlvHHnF9qCPW0/0zCS2wfDBIEZ0JgQs29u
         CYUnlPv/uKfJrUkHrNTtfx4Ylz4WCojBHK6tWy/DN4hRxjTAiTqkE+GZ5pGL98XAf77T
         KAb9wp5Z8diqjUvpM0NgwCYnIrNtEju/fX19n5u1UFIZrXse78PdqQRFj9jxvfMfo7xY
         3Sz9pQ7WqhLhG3II9cG0uElGoGEaV1DearTbX+Wc7dX0jd1D6sF2UGjkLS6dZZ0dP0rF
         yURw==
X-Gm-Message-State: AOJu0YwYUQHSGX2d9MDCED/3qH5IpDleyfGiH+NogvMbhRFIhNPGc9S9
	fcntTYyrhVXeibax9QAhfLxYeXCV3H+mYTBZzc/PncPrKRGSakrVAqzP
X-Gm-Gg: Acq92OEkG9CP2tyHSwA0b8Rsi4mhJW/qTLbtpoznfv6E4X+C0GhhmTCJVUz5Hydsh5F
	X+zg/Ml9BSpsAyUK9O7IgriVVRqFmWUbb3FMFs17A6vu9MPWPGQ+8Rhy/l+g8dtkfLsG5hF4MQD
	GFzZEp8c9IoeTGNBlgPYxJ/xM2kGpBfBVlHLWFFZosFPzEICE1igo1Gq5loX1btTf/q7pWniP03
	fSi8pFfgvhY774ndZq/mCk9JT76fqL9LpFqJ2UnoPKKF1fCGa9vhJI4FEUEv/JhDIxTyjqjFPcZ
	7CW74OPFG4xG1FLKgs766WExUxW8uQ9ztyzxGmeV7FFehnTRMOV7sSohQVC81eZNQOzrsnUtI1I
	K9XIjfN0n72P7Mt3Noi/Ibp/+11KmHXu70ohrLEgG9YJTHAGCLMUb9Ift4u8lhCvCgkTS6r+8fb
	4dM8SndYORLjeO6NkvYyGEyQV6dwQhMrZAVzH9o5gCY3FTyPCGNumdn2c=
X-Received: by 2002:a05:600c:4750:b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-490c2cb81fbmr286119175e9.2.1781093917817;
        Wed, 10 Jun 2026 05:18:37 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm566553095e9.15.2026.06.10.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:18:37 -0700 (PDT)
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
Subject: [PATCH v5 2/3] arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
Date: Wed, 10 Jun 2026 15:18:21 +0300
Message-Id: <20260610121822.2524634-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610121822.2524634-1-tmaimon77@gmail.com>
References: <20260610121822.2524634-1-tmaimon77@gmail.com>
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

The NPCM7xx FIU controller nodes reference a single clock, but their
clock-names properties are not described by the FIU binding. Drop the
undocumented names so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>=0D
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/a=
rm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index a16450abea0e..83cd10b47273 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -193,7 +193,6 @@ fiu0: spi@fb000000 {
 			reg =3D <0xfb000000 0x1000>;
 			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPI0>;
-			clock-names =3D "clk_spi0";
 			status =3D "disabled";
 		};
=20
@@ -204,7 +203,6 @@ fiu3: spi@c0000000 {
 			reg =3D <0xc0000000 0x1000>;
 			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPI3>;
-			clock-names =3D "clk_spi3";
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&spi3_pins>;
 			status =3D "disabled";
@@ -217,7 +215,6 @@ fiux: spi@fb001000 {
 			reg =3D <0xfb001000 0x1000>;
 			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPIX>;
-			clock-names =3D "clk_spix";
 			status =3D "disabled";
 		};
=20
--=20
2.34.1


