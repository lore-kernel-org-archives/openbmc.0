Return-Path: <openbmc+bounces-2715-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33277CA5FF0
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 22:49:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hyd4D1bDFz30T9;
	Mon, 05 Oct 2026 09:49:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791146820;
	cv=none; b=VbiwFyKujRl40sX7qkLlx5zAq64Nmw24uQx/cn9fgY6r6DN6i9T5hVjyk3o9tvAT4zVO10kPLq4bAoreIIzf4Hq0/n1aMakzC7PixXoz/HCS2Pov/LIljOBa87no79gpj6UbPN6BuTBkP3jhNImIJFVucThgzsm2ZsnLKq95QV6PRiS0man0qQAg14hArU4KnxgCdQGYpfTRBs/fb8/gIsyA1NtZcVqPc0AwH8WgjmQlvH/NUpagb6d6qdrpPVavXOPRfcYoX/kGuquK+r+68dKxi6j5rYhyo5FRg39CkCzKsfI2OSLCveUKU82zl+QOmItHVbzGoVAE+x/+Q8EFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791146820; c=relaxed/relaxed;
	bh=AbpkMZVsBdBOWRwxjTkLihKxr/UR5S6eo3rRMVyn4ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oXlvU6RdxXfIQBon8sR2OoTATlzYaIBsmrHIn0e0f/JBMYpYvjlhNuTLFa2FGMqDcz7WlizGoODZ9j/n2xx05gKoBLWibOSJMV3BNQ2dy+t6NM2DwtluUCqM4PUc7+cWNUikLAPxVQCMkmPja4nmEV6oG0UgUP5cdqVP+WFbCR3HbPsWVyBcuI7+VsLMTi3mwnq8evS4OsuoYlOLsl0s8pasdLxLjxbYPnDj4nJdC0JWh9ltfkbcuSDkaU3onDU1di/tomjbBFv7ob5/OJhE3XI33IRGfSUoyvjwGTrHSpXXz0yhva8KpnFUbDkTn+m9wnFCAVDkIWuLx6GYQAAHZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A6VOebVN; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A6VOebVN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hyZM80TjWz2xlw
	for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 07:47:00 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0446C4E41168;
	Sun,  4 Oct 2026 20:46:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C58B3604FE;
	Sun,  4 Oct 2026 20:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E6661032820F;
	Sun,  4 Oct 2026 22:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791146815; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AbpkMZVsBdBOWRwxjTkLihKxr/UR5S6eo3rRMVyn4ks=;
	b=A6VOebVNjDlnkxLhmL0E3QTdnjmAbZ1/upC3qI/K+qBTvGg1CDBKmCqWdW03bm9DRqEd+k
	9jl1fMbJxIE9+lmjR2yhoMejcH/YpKYZ6IWH6e/NBD/q00evPj7xVpf/6VULIaDBBKAUy0
	06r7+AQvaxr5xdMUzBp5WiU4vjR4HHKAfVyYKXQxmllN8yhtNTKAhafa+GApsfwTlaiDuA
	Xw/8fnbMdqmshvOt1wpHXCS+XTojvtghdyaNPSPNMFwfh00kH8MSynAeymjDUY7HjmAAEL
	3lPz05kh+LP1wPqsN/zQ3jGd+c3QwT3qCIEDOZBgQPWE4G1O80VAqb6R/m+pRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 22:45:31 +0200
Subject: [PATCH v8 7/7] arm64: dts: nuvoton: ma35d1: Add LXT crystal and
 clock-names
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
Message-Id: <20261004-perso-ma35d1-upstream-clk-v8-7-e1a106a128c0@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
In-Reply-To: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
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
board: HXT and LXT. The LXT crystal is not described at all: add the
fixed clock node for it and reference both inputs from the clock
controller node, with their respective clock-names.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Fixes: b69af0984732 ("arm64: dts: nuvoton: Add initial ma35d1 device tree")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
---
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 6 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 6 ++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi         | 3 ++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index d7670afb0a63..7752e85734ac 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -36,6 +36,12 @@ clk_hxt: clock-hxt {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 	};
+
+	clk_lxt: clock-lxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
 };
 
 &clk {
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index 8f3cb18d39b6..5c65f1fe5da9 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -36,6 +36,12 @@ clk_hxt: clock-hxt {
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
 	};
+
+	clk_lxt: clock-lxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
 };
 
 &clk {
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


