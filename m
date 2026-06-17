Return-Path: <openbmc+bounces-2111-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D71BCD98E2
	for <openbmc@archiver.kernel.org>; Wed, 17 Jun 2026 13:32:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ggPt51vZ9z2xVK;
	Wed, 17 Jun 2026 23:32:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781703148;
	cv=none; b=ApqXoQlDhZkBEUzwlKRsNHiNRTpFPhBnmWuUQ5PB+Q3rrl23mCfVByJi4yLGLStcTLhczNOPGcrjQQ+O4/XZ+qow5n8vMH6kTrO75qwjNDDjjsu2fgazzUKkP1fz4PconHnW1nqhvANZBmHZ/QxsxxJO4liIp3rmaXhILaaxmnRanNrOxEGk+x0a4ZzMDOjmWf8KoEPRT4JogfSM/z8/oEXQLmsLiFyOuceb3RMPIc0HVNPXiDc5WiWwYVKoWUC68sCO9oNCX0KDuPMhzFliq7HeYubOnjjmWAosYoT2iGek+mD4/7bjLQ40K91wdCV+T8I9jvfP3A9jNBsU1ljpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781703148; c=relaxed/relaxed;
	bh=HVsayAMQyYoUASQDp6CaRR3SeM73nxQGt/zbkOc5q+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O3whId7uFS+YGn8CUw2VpywT7MTkEynh7IOr8gY10+OE8D/HDNS7vJJPcLaPoacVnSWjkIPjj3iFAAkyfS5AGf6gXE8SSeUciu7UBcLQFYfy9e53fk8McsSFQP/qSDEAqj8D0WEOJKsDeDYVEe530Pe8RGpBfw4JaSwEPCw2YOtbui/qBMPr8gHlHSF981FaKljVnGy584Yv5x0DqpFbG2kDXUmnJAerKuzsGXdD5yBLh6OexKOGEH5h0oGM6HgL28QOT3zGHZcXCgh9orwjRH1qNwrrOtHmCPueLfILBgWY8skN5Yx5PP5X76bEUB9RXnkXT4/pkFbCIdcczvLqAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pO3bEkYM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pO3bEkYM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ggPt26lYRz2xLq
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2026 23:32:26 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45eeba68948so4288231f8f.1
        for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2026 06:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781703144; x=1782307944; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVsayAMQyYoUASQDp6CaRR3SeM73nxQGt/zbkOc5q+o=;
        b=pO3bEkYMxbKi4C1rZYkXKkud41OplkoncoOLsShttBP5hlHNYILe3CgYzVAY3wzlZM
         Su0Cgv35Sv0WGEMAbbmhexInK9FHNmXgvQthJH9FF8/J9nyViiGrkXnTr263Vp/QvDQN
         A9fHZZEhZ+I5ab/3dwXFPEVA/uRqM6N06S86MEQVZYREf1BksHfPX57ajIC/2dP1eQcE
         Ambpo4kZ62tt8vIuzvi8y0tYp9P+MWYeUoNfBfX3BH6xFlD+BFWf1TtoNHW2Dcgi2sp9
         tolLvoHM4PuPBv0eQcJXpFXAUH6mnJs2p3s8SmlQtivEeBkCA3ZYaOMlZywhGQ7MgoMW
         98TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781703144; x=1782307944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVsayAMQyYoUASQDp6CaRR3SeM73nxQGt/zbkOc5q+o=;
        b=JrFAtVBfWu5w5xotzObkhlBZD5Cav2+BNypj7nVvcgt6zxuYqAZbjbpeGzgKnwHp2t
         AnndmbBux39Jkdd6MI6D5htJHns01LZhYdwZKCT1Ah2+BhbdF6x2cYSQyr8PMwIcvIod
         RoEwQ4pHp44c2aeVZkJQP2q4/zjzE9BSWsYskuamwj4l8ECXGYWCooup2XzgDkjKrUJT
         2X8YiIOru8Lps0h8lkX9XS2nrcbE2Z1PZMYlpa6IwM2hcPIAbVfX5ABLhXGo+uJ7X2c8
         DPokohN+z6Lcmq8QY9TClgPCNdHCgmHOKOhvrvKkHbqMfcyG9getGLaLTjYD9yxZvHBY
         vBHQ==
X-Gm-Message-State: AOJu0YwHZ7+kz39bp21A+qO6/0BHQa8ILfGWTiMJHK3Uiq/bHVJMYHDI
	zRwOEGnFr3v+9h2H+iKAAbcKUg1EK1MdW20GQ1UsYT045FlhhX8aLhBM
X-Gm-Gg: Acq92OEoIyDscN3O5y3NXCWPNtM6a/NZjGR3x935g9WsLXUQDyrJbtjlJ0JfeH4ljzT
	QDZV1mdPPNrVNx0VLZXquQ8By1n9H4xRF8/baGJFSTu32P5SSdS8JpsrH4mjYqb4owKP+lOlx6o
	hHsOvB+isZs+1p17jvwGs5mRT3xogroka6gRDDPdY/jS5i2YuOWwk2CWWVe5XT9OsbfU0V3Q4fN
	nc40wc+k+FkzsGB/gLqAf0mKA8KYUvlkSiOkpTiuoRGKSTvKQEqW18SmCQVcTpro6et599TtvE9
	UdQ3v0wsLpXcomhMe02fGOBVTRvqvlFBWmzIS0MIT0I5hdHL5L+Q71cyEayYOQGUKHKebrmZW8W
	y8unaxgL8dazuZN8fAq4fYbBG06nV6DFcP6EoKD756Ev/IP39ctcnf8YexYPdVXOG5TKNuPTYC7
	yI1GMSq5Zd+r7fpQ+FV1VhnQo=
X-Received: by 2002:a05:600c:8287:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-492333d785dmr70645425e9.25.1781703143318;
        Wed, 17 Jun 2026 06:32:23 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a0e9e4sm147795145e9.0.2026.06.17.06.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:32:22 -0700 (PDT)
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
Subject: [PATCH v6 2/4] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Wed, 17 Jun 2026 16:32:10 +0300
Message-Id: <20260617133212.287768-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260617133212.287768-1-tmaimon77@gmail.com>
References: <20260617133212.287768-1-tmaimon77@gmail.com>
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

Move the timer0 and PECI nodes so the APB children are ordered by
ascending unit address.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 9e4fa2669f4d..0e5feabf2d71 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -59,15 +59,6 @@ apb {
 			ranges = <0x0 0x0 0xf0000000 0x00300000>,
 				<0xfff00000 0x0 0xfff00000 0x00016000>;
 
-			peci: peci-controller@100000 {
-				compatible = "nuvoton,npcm845-peci";
-				reg = <0x100000 0x1000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
-				cmd-timeout-ms = <1000>;
-				status = "disabled";
-			};
-
 			timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
@@ -138,6 +129,13 @@ serial6: serial@6000 {
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
@@ -161,6 +159,15 @@ watchdog2: watchdog@a01c {
 				status = "disabled";
 				clocks = <&refclk>;
 			};
+
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.34.1


