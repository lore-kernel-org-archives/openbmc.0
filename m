Return-Path: <openbmc+bounces-2736-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E26ECA5FF1
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2026 07:27:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j04Sl1Fvkz30Vv;
	Wed, 07 Oct 2026 18:27:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791358022;
	cv=none; b=PpB+mnRkqmFCvLO8lXx0RMDxi5AQ16iGZ6mVxKk/aAlCit4qpKlrh7+5uCcYx3/+mC0chvkTVaEoiSzKSerl6jC8ZoqB+TI733peHBBhw/2f3XfOKp2yJiqdSgJ3Vhd2eC0cSs0ZiJsOF5aaaqpqyQCDjFWacF7jOnktHgGA2A+nZame97BUy5cmXXJldbwrHCmpL2mlgj4lRLt3k7WUhgIAoJFNmlkj0j9z42q0rsf+naIWBUwttkaW1faJqN48gYbpx6fqQFvNwEHcIsVyymHWg7udxxK6Txb9lBM/uuA2nnlyyLlfNp1n0aEgLnw0ah6TSUhGTrEL1KC5QZ9JnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791358022; c=relaxed/relaxed;
	bh=uizv41/IVC5pvt4ZD4nGKyhTPzmnLZ/+xC43YC2+lGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OeOgr/Qc9qhHJf8jdV5bf0iu/fWxAUFNgNju8oiwBbVFSkQWs8zTABZ6P14fzy237V4guuAakp6AgOhUotUhYyIBPB1o3dCiPREXRZQQhqb5Hl2bpmDzvAJAUTr6MAw0+lFBzsibIrEg22HAUnXFJxgMVGtGuvEYrD35hpqzbIzTikuepCz9m67b9/NXxGR8GLUvA98U8zLgp1AE+6AJ4IZINRJO0NxcNII+mH8F+/59rUa9v1vH2UYScl9ZCeXWe7r57ho7LyV/ggaXOdgKjFleZpbiBYF1jWb7MdPUS3Sojw7+onYjWjs5m0w0qTP7MNyLWtiID4guSoF0UMnnyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UkLut1YX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UkLut1YX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j04Sj5XZmz30VV
	for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 18:27:01 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a17f65ab8bso2622255e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 00:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358018; x=1791962818; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uizv41/IVC5pvt4ZD4nGKyhTPzmnLZ/+xC43YC2+lGc=;
        b=UkLut1YXYrwvkzI7JlP7Fxav4sEWYs6x+lj9Q+seJb/4X7LHqPlkcfwY0XpfV0W30D
         bQT+2wDDkqgUeURKWlZqAwQp/nHiTse+z15/Q16gA7VF+ebsbwRJJd5UmQuyi/Eit9gq
         GYAp2Z46jdZM91bd+F6jrYu5VvCMXUdwI6pNzUMGfMlMau2TMrfp5MuDufeMGcFfjr62
         YZF6+XuydMAWz8mIlUrY97bMfjDtRv2gCE6rQCnry8ptSMXw3XvDCHPG01eABuqppYVH
         A6QFeEXGu5a9Bf1t8BGS4r1sdfu4n4sZGqalYjMdHqPN7uqFwOGKRklbDM3TM2s38B6i
         a3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358018; x=1791962818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uizv41/IVC5pvt4ZD4nGKyhTPzmnLZ/+xC43YC2+lGc=;
        b=bNoB5/3s1VVJHEOep9GTpbzR+1HH2Qmmz2/8DF+Y67/VV9tymGzhdCr39njE/sg+ku
         O7/CfPOCfw06/wzfZm5KixKQjmVO+28VpWxBqDj079h3ftnF8Fz+x7sxTX4GHxY32FEa
         zPc2o1aDmAaIO5Uxran1dj2lfwJFhyCUYxp/N76OyRxnG8Eo9toGt7zu7Pafkb6jHQ17
         RJbJFztnTuKrFEwX7U8yUFg+MMUajy4jLJN/Uh0uFEBKfTcsqR5TniuIeWShhU2R0gS8
         3G7b9qPUyXC/kLW0+8XftrHzzA9vPUMfQrHVBO6FFfb3dopmFtVyymNq9IHypdZG3BHO
         HPFg==
X-Gm-Message-State: AFuF++kohUs+6wQRCeAQrD9Qkw+HYkyPCHipijV8HOpQyrATgIPYwqKU
	3yuaqGwf2P4El7qYJH1rGqpc1ZTT27+MUoYk0bW8qVgPVaCXTltJAPMY
X-Gm-Gg: AYBFou2bqLC6eYl2l6auiDYsM+up4O2EohSyCXWGxbMhv5WCYNyHetDRx+aMPRr309k
	oi3X+OeGQfOylp3jKMU+8HmZ6L0Y8SHGEgYT1BSFREp6MbyQT1mbSeK+CeKXi3hQcvm+pcPbr/N
	u+9hHORGa4+AD1ns3sbywGT3O3EQdouoP4xODNx7ZjO+IUszyrZTKzOh4pq2ji9wHETqxhpSBqi
	WHe7QzEafsJZn0fl0HoL7xV1vDACKyFv7ppCfL0eDlfMavBLBOSsKfjFnTiKLCbWLqvOF9cv7S5
	+nAGPIZC8pXgR8poGYZCuHJ3Xa4S04aw/QRZq+Rs49rOpejDzl435dLU6w+Petd731UXNwE/7w9
	e5gw4SPjWwEyB+7DKU9RUKexJ59Lcg2JuyMU+TntcDlHrON1kqlcG3GzvvqsFoIBmLc8SwLKxfZ
	WUJ/FIDqm4psHzun2D9MR8AnG1AecxxEmttpQ8Rh2t4smoBW8gBrjnS+PlnA6GJU0RC36d18pc4
	NkAUVnx
X-Received: by 2002:a05:600c:674a:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-4a1800cd6c5mr17268485e9.1.1791358017994;
        Wed, 07 Oct 2026 00:26:57 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:26:57 -0700 (PDT)
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
Subject: [PATCH RESEND v10 3/6] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Wed,  7 Oct 2026 10:26:42 +0300
Message-Id: <20261007072645.1618147-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
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


