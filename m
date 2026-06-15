Return-Path: <openbmc+bounces-2097-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048FCCD98C5
	for <openbmc@archiver.kernel.org>; Mon, 15 Jun 2026 14:26:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gfC8p6KLWz3c4C;
	Tue, 16 Jun 2026 00:26:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781533562;
	cv=none; b=eKaQYd8x1NwLUpWxh0aTuhXunm6hM7TEN6uNcTa3dLBM4jCDRvmbQLAsXzG5F+bXSyOQJMIuBR/Z8+BRk9FpUn9l9eAPlEYNPXhLOIlTWc59i9/OcdLLAbk5j2rgJ9Jr+ioGSC20RiebrtkgP25az5Rf79+4Ep7sGEFMm2oSkGQ7WJFxYAXe1Nk1DjiV+XHxoz52+75IV1atkMW7AWpvKKIXySCcPNdqvMyuQQIwODDpvwCP1C8fhM43pYUzldt4EIhm507+VGMDKtGhs9JxlboNoWdiFd/8IJm7zGwCCUuYUbxTGwE8Y+vji5S1qhoKbhKTi3kpmf0bBNCwOlq5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781533562; c=relaxed/relaxed;
	bh=HVsayAMQyYoUASQDp6CaRR3SeM73nxQGt/zbkOc5q+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oVRPFzvuxmso+E1n/H+GfpbtrHfVhL1JA8Av5sXBfI+IEN79VGjdFrCX0/HHmz80zSNExOIhtwFJ3hm4r1RBCMyxGXMBxSqOgCzRGCcsV+va0a02DT1Hx3wEpmXZA6rMJpJyIyhnyLBBl8cJRY96oCcWuk6tNuZ4g/Gwx+2e5QBzvgffDgtB/8bgDhuk+zHpfH5hjzV7JbwAwfHlent/3b8Gilr9ZKZsajWQBnOevw3AH/9zSIK5rl3ShI0JF+HnvdGCzmns+yUVVVq572B2d+5ZoRigzXKUSdgHxtBErKPyj8IqcmYW9F5vLs276x+zbyrtSI+xG3PG3fpddwu3EQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PZWUkhIZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PZWUkhIZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gfC8n5qBLz3c3s
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2026 00:26:01 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso18853665e9.0
        for <openbmc@lists.ozlabs.org>; Mon, 15 Jun 2026 07:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533559; x=1782138359; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVsayAMQyYoUASQDp6CaRR3SeM73nxQGt/zbkOc5q+o=;
        b=PZWUkhIZf2HXdQ8AUdCWrVE7+vX4LX/WQEk/EXAHO2QdGfMjT+sk0Q2rnvPV+ipOMl
         dTqjTokrTx2HaFezqCt14veeAUxrFbrp3WWcQrjnPrDmPPpQ5Y/jgB6f7ro/DqmmXaW5
         8T61AX67mfyhpg9u0VOjZ1/VCGSZHbewC0OXfX2zAtX756wjGUlxVnsWMz0LjTRTapVi
         HMuQBwwtlWAA79KuqNUca5wT3wkVBGEC/ltj8nuSH2fHQ4HfTxDWeJRFnlx0PI/KT5xr
         04umQk13bD9We0UFl8BReeYKIjd2hdcaA1HvDT3lO28mCd4mw702wF6MzwUPAmv2hky0
         eNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533559; x=1782138359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVsayAMQyYoUASQDp6CaRR3SeM73nxQGt/zbkOc5q+o=;
        b=Vsl73qVfQPFZCie3Oq/qu8+iXl4DOw+XTnnlqKnrNsuxvM8ZaFRdgA8drXbhjtRNrN
         fCx/8GtK4ASiK7UZ4+xPVHcMtTb0RDV4ZgTtnOfu/Ublh9T9jPIjhaCX/nWOQ79UdUFi
         6pSDayutePXTwvzUSX5YICWALCiKbEZ19Vy6Mag27b1063eOfiVjWM6M6mqcDWp0BsXz
         1Li/OrO0kW21zJRrIGeW/228EhpA3WeX2aYP0m9HYjLQoyollCkE/1ti/er75cNp0H2b
         tYUGBnfclL76JEzYOX2y0siF+2QHwA3b/HVq2HBNmcQ6Jl/DMpq9mGnIuRdIWyK81voY
         bBAQ==
X-Gm-Message-State: AOJu0YypZWunwhuXTEZJU7cIVZOaZT4DAZiHyoNz/D/j/GJPc7WYVCCK
	ogm1rvuMGCzxdm+bBUWfdjQ9ci9DKp7eZCydXd+iUZKH1yo7yR+gdyiP
X-Gm-Gg: Acq92OGNg6oShaXQA4H1Aa55GX6cgBb873dEeijBINkgK0QFMPAwZAG9wYp/9UPg+gp
	5ACND+VysPIlv+y2nh8q+CChyGOvvbCQ4WLY6QRKD/CVLXtpXm+XyjziCjyPxAPsJ+7S4xVnThF
	xFHCOTv7tXgl1RTeVdcYQ/JjT9Drk4SBwa+wYutgThUB5HLcb2uutggfiuSdJcrz1UVxOCtMetA
	9ExF9M+2MTXlb7mCbWj/WZMPfNfI8wGG8gl6vZWvlQlY5OcHXYL1KiuvtT6VdzkG2I6xrWetCdg
	Rz+9LAqGx4CB11Cc/EuoYBYw5nno+hqxR2NpkovZgb0YFX+/xgsD/gclC0sDIrcgao6eOqR2VTh
	HuAimDJURQWtDbagmGcOP0zAiJAdUAf41GCX4FGgf0+P+hKa/BRamS0U3qIMDuSdwCVd/yrE1nL
	t6C3PDlP1ZqnBbJyX2yu6L3g2QUrbFa3U6fg==
X-Received: by 2002:a05:600c:3542:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-490ec480e65mr161474915e9.4.1781533558821;
        Mon, 15 Jun 2026 07:25:58 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm273333205e9.2.2026.06.15.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:25:58 -0700 (PDT)
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
Subject: [PATCH v5 2/4] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Mon, 15 Jun 2026 17:25:46 +0300
Message-Id: <20260615142548.1373799-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615142548.1373799-1-tmaimon77@gmail.com>
References: <20260615142548.1373799-1-tmaimon77@gmail.com>
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


