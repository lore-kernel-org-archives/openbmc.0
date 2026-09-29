Return-Path: <openbmc+bounces-2673-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB661CA5FA7
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 22:27:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvXpr3kblz2yFQ;
	Wed, 30 Sep 2026 08:27:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790693168;
	cv=none; b=RJT7lfd2i9GcZHN5PlG87l4QEVTiFWmgeomZX/iu8ZF8fFcUIcrcuHO6E/hEqiXQuqkrpHpvbM1z7cz80ZwgF2HoQz+U3l4Tsu+vZOBiSMPHlg67xsG2UxJ88WGCnQGPWx1PSin16uOXmp87nNXc1rS7xilJ+KXXcWWYqhPgCjJiwlDahfqw4a3JmqbpYkFqw5RDRBdoXCpY9PexvBZb0vM72RAta6RMhIDdK/Xtso8unNYsqK7tfjbGxAO6Sr3NBdSE4IpgrkisfdUc9rA4CaM6SaACIsVZdv7hv6LlHNoImSF5JjI6tM4gl8sfX4xaQ6nFkVyciHjhY+6abHSn5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790693168; c=relaxed/relaxed;
	bh=C8e30UgkiHDTjA8f5l8oWUq2Z/wD9LYb6yYMdtqEA+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GNNpLsiNfIrwURjSHAK6j5msk5duuRdEU1cKY9DOL+cd1/QdUBtVDaJpD/Eb/XZq0qNh7xaGPXxMF/MWt611Izc1hYJbfQlaS3wZeJUhsPCfVdYYzoAYJ2SWyre+dRhnI9bYeZvG+sBGvO5P+QVI1L42tkRoOENCjazsmVP0XtevL5DWYrr4qCqkM0Uh3dpbW9+nRb5l4S5Wu93SmqXZZUbD1SQtOwSwQXk5KtWyljL34heue6jYN2ZAI3F3n3KJl4wNo/b6Q5dt0TQniVCMwb75hPSLI0p3a5s5Zq4KXNzQ+thbNWHBI8TYLV9Lt+jtl7PF+3Io3LUzuYohm0d0cQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J2c+ibLU; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J2c+ibLU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvLb40Rxxz30Vv
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:46:08 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1DD234E410B8;
	Tue, 29 Sep 2026 14:46:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEE9F601BD;
	Tue, 29 Sep 2026 14:46:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07FBC10329812;
	Tue, 29 Sep 2026 16:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693163; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C8e30UgkiHDTjA8f5l8oWUq2Z/wD9LYb6yYMdtqEA+w=;
	b=J2c+ibLUY1FOIFVnNoAWOoDflzjCbqMpskEKFBx+sFfXN2MfCH4oC+8KN6AkHk0UfpTK1z
	4Gj5smJuhutqIUZ8oHoB+ZWOBdbK12AtKY9ZKdSaWSrDvmw8J1cbAuQFaUn3lWj3t/bN7L
	CwRXBnxP/Qi254kj08eMoeHthumHMAlSxAMoa9J4BO70KowRaXmwPJvuKKRmH3LCmMFNBu
	AF0JyG1gZnMiDGOI+jYydYQ69t8bOOpbb2hJQRm1E9D0LPzPP8xx+IUXQEMbZ9bGRNGwAg
	pr7cwcEa0gH1J0GKXocGuIIdbyEx9X2ZNnaGrvViMRqbcxIE8uWCnsC0k9mfcw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:52 +0200
Subject: [PATCH v5 9/9] arm64: dts: nuvoton: ma35d1: Add LXT crystal and
 correct HXT name
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-9-68533e935ee4@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chi-Fang Li <cfli0@nuvoton.com>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The clock controller takes its two crystal oscillator inputs from the
board: HXT and LXT. The current description of these crystals is wrong:
- HXT is described but not named correctly, which leads to two clocks
  being created without any relationship: hxt and clk_hxt. Fix this by
  exposing a correct name for hxt.
- LXT is not even described. Add the fixed clock node for it and
  reference it from the clock controller node.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Fixes: b69af0984732 ("arm64: dts: nuvoton: Add initial ma35d1 device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Without this patch, but with the previous patches applied:
* the platform correctly boots
* the peripherals are usable (the spi controller clock gets a correct rate)
* the HXT and LXT frequencies are guessed by the clock driver
* a spurious clk_hxt clock appears in the clk_summary (but is harmless)
---
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 9 ++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 9 ++++++++-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi         | 3 ++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..cb7d6f9ee297 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -35,7 +35,14 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
+		clock-output-names = "hxt";
+	};
+
+	clk_lxt: clock-lxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "lxt";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..992104289c81 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -35,7 +35,14 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
+		clock-output-names = "hxt";
+	};
+
+	clk_lxt: clock-lxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "lxt";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..9a341c2b1397 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -92,7 +92,8 @@ clk: clock-controller@40460200 {
 			compatible = "nuvoton,ma35d1-clk";
 			reg = <0x00000000 0x40460200 0x0 0x100>;
 			#clock-cells = <1>;
-			clocks = <&clk_hxt>;
+			clocks = <&clk_hxt>, <&clk_lxt>;
+			clock-names = "hxt", "lxt";
 		};
 
 		pinctrl: pinctrl@40040000 {

-- 
2.55.0


