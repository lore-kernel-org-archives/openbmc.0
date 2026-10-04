Return-Path: <openbmc+bounces-2710-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205F2CA5FCE
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 16:12:53 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hySGL4z4mz30VT;
	Mon, 05 Oct 2026 03:12:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791130346;
	cv=none; b=RY5Zg7vBG3xCUgt/iOi+3SaKZ95/Dt5wlU1bKLY5pYDmvEc1NSB6vl8upor6yAl4HBb2E7wVA+jRv1xVCM6WkRCBPDDZ997jHJrxpv4OF/eFJpKnMUzgExo3ClD71VJFqqTPwEx815rvHeb+76qMXQ2x6NtK55O0CwVOvynixe1UUs6UJwq13lv8kWz2zAdJDzN9j8w4/cW4Ef8Wd52zlcxZMss7OgoEQzxuc+0fzxh/Ij7Y/jEsu+wwhu1MdeKOxiHtNbVYqje/NNqVFCoMtlijkCvlw5WnMRCjX8ym25gU4Gj766eVS/ivWq6BsC3wSUvrdKxaSiW13aU322ziGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791130346; c=relaxed/relaxed;
	bh=4Ta+kiTYB3jF6AJ+xesMAUOcOgFo1sUTMQNfw2Twlgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bmhsDam4s3eVJ/x0nAPyOZIBlMpNEpYwBMdcWb4DFMJH0J4dIT4Cd6mThIZQDoDuYiky/vCo5iYgRYjTDJWn3at0dwsDJnwDjlA7PDmvaonStGF9FeSZf+whFgt9aEWewnB8I73NaR2Rb0nxrD3UeeMYPh946y9VLYqG08efMRtF+iYUKz+rZtaJTdNZOTb3WWaZmYfIx+Ef/p8tZAZ/0lozLjgIs34/FfFAcWWtK+plkKjpy83FAL6KBkSSSSmLABUnjSF6/J3NCGfjI5sa1GA5yQy2GszYIopmQ2BYcbeE7DwzQplCfGqPTxcBi7J6Auwrn1RqY9LjuSzB2ANU3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m80V1BZ3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m80V1BZ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com [IPv6:2a00:1450:4864:31::11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hySGK3v4tz2y2K
	for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 03:12:25 +1100 (AEDT)
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so6256895e9.2
        for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2026 09:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130342; x=1791735142; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Ta+kiTYB3jF6AJ+xesMAUOcOgFo1sUTMQNfw2Twlgo=;
        b=m80V1BZ3u6HA++t88SaBrhxn10FRX4ZYHL+4n77+RK1PQvO8IFAthkENwpEdwdykkV
         t/ZgOmBIDfurGyKKRDyDuTM708vWU8tGNEpAS1XwgbiQjjmSiA31ptY2vdGbvm44gXVN
         enTftXeoosE0wJUjt3uYJS6L/lxSxbAN6dP6monZ84GmLT53e65iO0vDWwn3rsj7EeCl
         zruHungoDmIWDIiGD62wKlmiAhRj1tbdnCaXNzLSa3WYD/pz8NfcXWl/Kzp1sY1tPjLA
         T3LbxXMpZAOUah/xA1nMNVlVcSbZFDUh3mfMZxjQFB6JoUhHJVqeNlsMrBepIMaRBEMj
         wczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130342; x=1791735142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Ta+kiTYB3jF6AJ+xesMAUOcOgFo1sUTMQNfw2Twlgo=;
        b=oVB1ymZ4CnPsHNxZoI2VQSFES2kOiRCqyR4h/QhehZPW5NKJhJ/qES7zbjn7INyJzK
         iI3XbPViFZ+7fUgM0n7D11l37qU6Ayr17lLQOh9BZi5TCxTz1JRXyYEqMMwE/UOP5VA0
         dtlhcrNEE5gJNhcNch2523kN00Uac0RoB2i4UF3x0iYoT3keo5XvGTggY+9hNhR+IysF
         rRRSyR08D51ASvFMySuXkWvljHlV/WYC0EBJ4gS+Dztt+lCiADEJUjoJBjx8k3qJvvIK
         2RQp/+0U8RnCguF7a7V+MOWF4g3TCMh/4PSeqTBVYX6Um1sU/PeqN+mTZE7VZB2ASPcZ
         Ul4g==
X-Gm-Message-State: AFuF++kUWqbbE6gZkK0Z/T+IkaQqGU9fPpKz72n6GHMQ6KdnA0RGA8Pv
	h/sCksEV9pjPub77AX1oeXIYNAdnxl+UXfk1eDAJbCgo6OCpc7Ttrg6JlhQMjQ==
X-Gm-Gg: AYBFou1QFPGeAHZYW4qg6xM+Halde47DpwbPjVk0BDFPK1G7jlMEU4OVtr9KPpcn3C9
	PvNxkk0sxoJPVpppfmWJhD/PpVPsl6FdsKmNn3cF/HTjRA8anHVH9laKvJzb8LkSUhrKNhR2ywI
	o9bakcrnV8aXcF2z9Kwh5WIAXPV3sBEzj25cZ8Ly5lGbWYTqUO+70JyyHCTvJdwXs5PnJl1r3zU
	nuMVOtkEEidZ9iHE1GSCG/2ow+wPJ2wG3asrxmPp1oGZjhOQ0pHyT3b+bVcauKC6k53I5MqjPTW
	/oLRHyIskgGo0/h3+a6QwV5oIaVzM/uS165D3Zn9TIuxrhivGUV87x3g1KoGNWQz1lVgFVMq3Fo
	4lI+/KY6XYL/ItKebn3Aga36xyP5V2EgWuIM4U18LxTVLQ7W4G7B41CPVLcSNBJuYr+UdZcX+6S
	0LCv1OwzYHC+VA9EL+h4vb7MgPH7GxfapYrEl6UMSNxTovGCCo9OYuCrkcvKQbvtSCfHp8ThtZQ
	zSh3lriY+wDqtFtkxbXSedZTJI=
X-Received: by 2002:a05:600c:8b81:b0:4a0:136d:f721 with SMTP id 5b1f17b1804b1-4a02759b013mr132352105e9.17.1791130342155;
        Sun, 04 Oct 2026 09:12:22 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:12:21 -0700 (PDT)
From: IS20 Tomer Maimon <tmaimon77@gmail.com>
X-Google-Original-From: IS20 Tomer Maimon <tomer.maimon+nuvoton@nuvoton.com>
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
Subject: [PATCH v10 3/6] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Sun,  4 Oct 2026 19:11:48 +0300
Message-Id: <20261004161151.803563-4-tomer.maimon+nuvoton@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
References: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
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

From: Tomer Maimon <tmaimon77@gmail.com>

Move the timer0 and PECI nodes so the APB children are ordered by
ascending unit address.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index a92fbd3..542f27e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -58,22 +58,6 @@
 			interrupt-parent = <&gic>;
 			ranges = <0x0 0x0 0xf0000000 0x00300000>;
 
-			peci: peci-controller@100000 {
-				compatible = "nuvoton,npcm845-peci";
-				reg = <0x100000 0x1000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
-				cmd-timeout-ms = <1000>;
-				status = "disabled";
-			};
-
-			timer0: timer@8000 {
-				compatible = "nuvoton,npcm845-timer";
-				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x8000 0x1C>;
-				clocks = <&refclk>;
-			};
-
 			serial0: serial@0 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x0 0x1000>;
@@ -137,6 +121,13 @@
 				status = "disabled";
 			};
 
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks = <&refclk>;
+			};
+
 			watchdog0: watchdog@801c {
 				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -161,6 +152,15 @@
 				clocks = <&refclk>;
 			};
 
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 		};
 
 		apb@fff00000 {
-- 
2.34.1


