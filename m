Return-Path: <openbmc+bounces-2295-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F524C4450A
	for <openbmc@archiver.kernel.org>; Sat, 18 Jul 2026 04:57:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h2Dy15XQtz3cF1;
	Sat, 18 Jul 2026 14:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784125383;
	cv=none; b=llsFTTdn6f7Bc5AMX2HyS18sPrrqA7WMt7Dse3g3Od+53q2KwBfD7F7z5LG9QJTdZtVsCwjLaP58zGRBeFBBPeru6RN7VVpbpZQVvZAyBbD5Qg0YYYLjMoQvOyENo3akkkRKBViEFjBRtsSqmV3hM+M6pJ9T9wYUpxNHDyUSrlPveAyYQ/bXsDLOjHKsgm12tnt9mUe+6XQ5KCNxVpFKMqw8Inbb60KlQmhc1z2+bMVSlG7zC/HgZt/Qa4kSZT6hIFZBG4yLlAS6x/vl+eCfaA9gmLRgEelyRgkdtepkzPLMvq9Tl0MLOeAJA3EbpjxviqwMKCxxF2mcRT5fo4jSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784125383; c=relaxed/relaxed;
	bh=wiubH//rJuJlxM1kqna80QmfZD6ocMKvI3ND2MAvDYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dK/bAUsZMKcPibMADCb8vRQIjPRkSWrDQijp94ni4HSqDxFfADCkjdL1h6NzlFFjsloSsHAB+HGlfJtaB6d7ZvOYchIo95IqvcJ8CNmh9LeCa2K2APeRChp6KHvKhWkamnn2GZOUpfDK7sXK3sBJs+t4uqrpe5OkytymKjgnGj6pROGhsWG03vkDjK6C1UajMwaFd4zcDVnXkAz3/LqVk/qb5ZjIMdaRB6rhnTypstjt3db0tOZAd5fddlvFmjxjC5o6qFDPZ+rZJcA1VuBup2fE16W08LlAp7mvs+aGmKvzKHhD84WUvrgbx1nusDasrJbXQQolBDQbY4Zepp9RkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dzjOa4dc; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dzjOa4dc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0dgW2Rf1z2yl0
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2026 00:23:02 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 73E1D1A101E;
	Wed, 15 Jul 2026 14:22:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FC846035C;
	Wed, 15 Jul 2026 14:22:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84BBB11BD3B3E;
	Wed, 15 Jul 2026 16:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125377; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wiubH//rJuJlxM1kqna80QmfZD6ocMKvI3ND2MAvDYc=;
	b=dzjOa4dc0JCXRPUwBfSLPLHOk22H9cIBhoFR0pAD4AfcUtrxtnMIna2gYShjqkToGJ1aHI
	7DvFXGSzgG5nIX5qgCgADwx9Iks8FcjU3vjhloB5vKxjiLUG1icPiqXWL3DXfKT9r3SsMa
	Zx0r7y5Eloe+MJ//paW3DDoFVzmQpjce/9J/TyS1z17rSq6FNuI6KO7Rm/M/yRBwAg+G4V
	HHRt69LYaQKw7r2/B82ZxvtLenrvk9ZcxqpmfBJpuuBwQx3utl2Pn0xtDKWMYWOoHCCgv3
	Kg41o0VNdV6nu5kbZd6T4VlfidI/dJ9JP6/rsQYI34Rf+2JcHP9ZLjIq9H7NHw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:19 +0200
Subject: [PATCH v2 2/7] arm64: dts: freescale: Import optee node from
 u-boot i.MX8 device trees
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
Message-Id: <20260715-mathieu-uboot-dts-import-v2-2-bc931417bd0e@bootlin.com>
References: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
In-Reply-To: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Wei Xu <xuwei5@hisilicon.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, 
 Tom Rini <trini@konsulko.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=2010;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=SDm0SYsN8Y1Zsp1HeVyZPRmleGAzxiCMbONHPuFrQZk=;
 b=/AuygC48k+sPLQzR+8mJoNMphtn+6lb0dxScAfm8jP5DINF4GocGVrL4//3bpxHttvulAVXsp
 NCZgiyai7rxAC0obTj/2Bax1jZBlM7C5mrQgI6I5OF2eXydjkcSivJ2
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

U-Boot is importing kernel device trees for these platforms, but adding
a firmware node to enable communication with OP-TEE. Importing
changes here will allow to remove these additions in U-Boot.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 5cf2998d396d..4a55464e8a6f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -233,6 +233,13 @@ timer {
 		arm,no-tick-in-suspend;
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	thermal_zones: thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <250>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 79b169b07c4f..c3b4560ec9b4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -265,6 +265,13 @@ timer {
 		arm,no-tick-in-suspend;
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "fsl,imx8mn-soc", "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 5ce2825182fd..285b98384255 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -404,6 +404,13 @@ timer {
 		arm,no-tick-in-suspend;
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "fsl,imx8mp-soc", "simple-bus";
 		#address-cells = <1>;

-- 
2.47.3


