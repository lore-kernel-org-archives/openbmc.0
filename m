Return-Path: <openbmc+bounces-2558-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D844C624D6
	for <openbmc@archiver.kernel.org>; Sat,  5 Sep 2026 06:27:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hcNfg1y3cz2yv4;
	Sat, 05 Sep 2026 16:27:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788526996;
	cv=none; b=ea1PDiGYlGgjijuJPehvryR8+xAMfZ4ltftkal2K8uWt9TxU6wyGaP1SGhLg0SuRy2DZ8QOQik6q1AqJ4kU4qm0xM9exuziGCm3YMuFma+uoFOVx39a00r/Lc+DTKnWv8Jl2mq+8t6Exmk1V++1p1s6RKK4wTj8vwHUemhuRJOfL4T0mrdNmL/SWn798LAi7UUeYuctNX+r7A+uaEvA2AAa+kh1LEA2tfwiqs0bGQdqDRMS9k1krc5+6qGEP/YaMN0vP0huq1hSfCPjs2ICEypHEy4p+Yp7mPI4jRnFLl9jCTMyy05RlWCkHieKC5fs3FSvhP3gHlIJc6HHrRU0/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788526996; c=relaxed/relaxed;
	bh=lpzfCBoqh5Lrgy66VhQjiUMxbdjVzKhjhFHiN3Fbspw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbE2kZMFIbFR+GOy/rX5lH8C0zTeelIaxJ53Dj9js6ZUhmlcLwph19JOfGMQ4hPUPDozNgzYtgg9EloVlvXpw0+spxX09RAHxh64yWOQgLe7bBjGU6pgIv2xok1tU72PVuJQWyhGe7xK/TqnMyIcF/daSEkpZ4kA7ETHEY7l6tq8OPh8B1BSO2V695y0j9GRRY7JVYzmYIAw9Wbs30pb8l/UY7jTidAfkQX4pGXPM/uBdS60A3owIHu75cqqoB6G7LD0mqtmYAVllT1hm/+h/SZ94XNVzEN+euacx7PH95rSvS7oQ/zpEV+jJUCNekUpfYhlMnABwZZJQ8hi2u7Exw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Lnoi88sE; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Lnoi88sE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbxTt5S7bz2yr2
	for <openbmc@lists.ozlabs.org>; Fri, 04 Sep 2026 23:03:14 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C83E24E4150C;
	Fri,  4 Sep 2026 13:03:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B96F6057F;
	Fri,  4 Sep 2026 13:03:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A178F11C7AE94;
	Fri,  4 Sep 2026 15:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788526989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lpzfCBoqh5Lrgy66VhQjiUMxbdjVzKhjhFHiN3Fbspw=;
	b=Lnoi88sEb0A6TD870U4z9+BTIX6iwzgoROcFBsgoM+el1xv0bD3XfrG3+zX7BcXSHLOt4B
	75h6eqvCqTP0ApKYsdL9h2qhXUT8RwUyKuBnYamsl1pwYApRFwjUuY5htL9exUrpsoKBiI
	t8ro0xhtzQB+U+fLCBxelVq5mQHavxAUp229yqgb900B0Twcw24h2QpdmAHVXaV8kQl9wE
	4QcLRmS2ip/ruSQGsP4DAieKSKs1RCBrIj4CcsvKGJsVehilbFLodcWxIR0Fq6AOJeW9qX
	I9Nsp7w4QiXhSRYDH+aOznNvPLeTkSACkqYWwI/eP5AKJcKLA945nb9jND80eA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 15:02:37 +0200
Subject: [PATCH v2 2/3] arm64: dts: nuvoton: Add QSPI0 node
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
Message-Id: <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Describe the quad-SPI controller available on Nuvoton MA35D1. Bindings
for it have already been contributed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..9eec44128d28 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -431,5 +431,16 @@ mdio1: mdio {
 				#size-cells = <0>;
 			};
 		};
+
+		qspi0: spi@40680000 {
+			compatible = "nuvoton,ma35d1-qspi";
+			reg = <0x0 0x40680000 0x0 0x100>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk QSPI0_GATE>;
+			resets = <&sys MA35D1_RESET_QSPI0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.54.0


