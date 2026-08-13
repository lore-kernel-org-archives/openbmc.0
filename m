Return-Path: <openbmc+bounces-2404-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114EEC5CFCF
	for <openbmc@archiver.kernel.org>; Fri, 14 Aug 2026 01:11:27 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hLkh44y9Gz2yvB;
	Fri, 14 Aug 2026 11:11:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786606276;
	cv=none; b=XzhqvGaZ7RhfY+n9+c6Cs7DQS4yRspMVK88za0MKQ2PO2gRx1Ngn3iH/vlmq2H3jEB8Ox1eOwBz5qDOFkGeppknTTBG8JtHPNOisBFQUHybqM0D4VbHAY4J4bxNSun+H5cvak2FI6oA6PbnD1Vu/0w/k+c00EFdteEL40MNdkCvwZFGAF4QwR+8rgJygaU5Ax+7lacz/w1U/CPnZoplYby2xS0Qo/bWHUYF08TeDl3wPW5pCwvOXKlTwj2ioivQWyrnPWfywe4otTcYVkeb/67nwKyMtY5ic839OhKVt3S3Y18Wp7EJZyRmCMkT9m8KaJMu4GB+LnmIk//ZR6hlsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786606276; c=relaxed/relaxed;
	bh=lpzfCBoqh5Lrgy66VhQjiUMxbdjVzKhjhFHiN3Fbspw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FA54M2gejlIOTc2lp1rK92y+5VM17OMU2B7ExYZ2hNNunfxM9h0Aq2rCrV+3oWQkqGSrsHc+8mGMzLajlnDEzRn1bQfVqGhD/7f5RRYSvBn6xXMYvR6KbO3bOpTJz8meb3lj7Nueebi+ODXWlhIOGgKNHl6CZ2Vtmbi6k1fp33Z+sXnk2ZrgIU5ZlNeuiVHgp4QvSsEX6fZDQJVTFsO6OjOAeqq2k439G9Pe/eJhzvo4YOULq8GOBDQHfY2mHA/SiDVR2ibJL/bAGqtAXHRbXQBtfbRILkKqeX7CtvZJvjlx4RLhtQQ0Y6SroI+uldvmH2lrcdBRH7R0o0AZFdykJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KTtQ1w1O; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KTtQ1w1O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 341 seconds by postgrey-1.37 at boromir; Thu, 13 Aug 2026 17:31:15 AEST
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hLH8z0yshz2yKD
	for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2026 17:31:13 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6DA194E411E0;
	Thu, 13 Aug 2026 07:25:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39EF5602B8;
	Thu, 13 Aug 2026 07:25:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A6A711C4DA19;
	Thu, 13 Aug 2026 09:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786605924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lpzfCBoqh5Lrgy66VhQjiUMxbdjVzKhjhFHiN3Fbspw=;
	b=KTtQ1w1O4+fwwHoye5Cm3V72y5n24pNWTmuCLGSk3u85cxfy0gt3ipQLAa7fqSg+i/w0bE
	+v8Gti00xAJcBH/8TOXkCfSuhZ/MaZhY3ilmrn4dfIqibQhk+kxIlMu93FpVb1t+Iu0ufq
	kmoOcWkuZGEHCc+2YX6vTVbGYvp/d0c5eKqLCfW+DiL//K+im/08LT7MgMNe7J0UlVg4zs
	CXY6LX/WbtAaqqGueNW07yfJUBjHCQr7fpNg96Gev3WXvlO1nuozPe08IOApxuYd6+JXNC
	iwpZ/MhhoQ1rqm4XakjYR+6nfJJM0ZUmJVBeIWz222pzyTuWVaSfcqmSXo1/sg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 09:25:06 +0200
Subject: [PATCH 1/2] arm64: dts: nuvoton: Add QSPI0 node
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
Message-Id: <20260813-perso-ma35d1-upstream-dts-v1-1-bb237fd7c3c2@bootlin.com>
References: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
In-Reply-To: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
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


