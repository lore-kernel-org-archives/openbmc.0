Return-Path: <openbmc+bounces-2702-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203EACA5FDD
	for <openbmc@archiver.kernel.org>; Sat,  3 Oct 2026 00:16:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hxR610k3hz30Tp;
	Sat, 03 Oct 2026 10:16:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790953321;
	cv=none; b=HwD2/Sidila3N+N6WpXh0IxQAAuct/Tn0uPgXR/A1UmTl2yDGMv3NqTTitzk61XJjnlRmN1/oNCDtlt/41gnBcXLcStzqTO5n8n09aWzXxiVGUaffXl8G8S3VBHEsczXrZp8lNmFK0DUqA+FCh5/koFPEKvwoM1qK2626KmwIp1Qyj79W2BMoxDYojOaUHtkmH5JP0X8EHMc1cP2UtKWRqEs7qKv2ZITwlpbrmPswFvKmAnuwD1+NOx3At2E0pnhLqMXGpM/hKH4WRPV6O2hVUVQz9tbLoxEstuNLTIROwhuHvPqzux0r3vcXbDL2L9o8H0IJG83KFyGq5qW9QlHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790953321; c=relaxed/relaxed;
	bh=dkEV3NU/xjxq6SJuLLAVWiQsTCv0N4E8zuSVpty49hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RE7zY4WMn3QZ4COPbbzVIRPFdBNRHy4Zy73Mup0Z4NRmzLUgMqJa6GcYbX/yR/xTcVFY+zi3+AZX9L/DOGSGdcXfph0O251ryBESv1swbKVcHE/ARbtc9u4uKuNqM0PfOg7MICn5NAWMfUx4PvUDH2w461QciVBaYmGp/4Bg0MiqSFdW2+G/U/8UAYoOOmm4KDjoWbOu4kV6VarhBq8MUQCd88o+tKz59weL2vqqxOGlRz9fbh4a1i4os4CH5e3OAT9lE2pZ1rMDSys9wDb9RFJMXPzt0642NME3pdlQWwti+sCNd2jZzla37vjs64qOprRN2WHm6j7n8Kebdiiqug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oXcupmIV; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oXcupmIV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hxBp064XCz30B9
	for <openbmc@lists.ozlabs.org>; Sat, 03 Oct 2026 01:02:00 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E55ED1A10EA;
	Fri,  2 Oct 2026 15:01:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B50AF603DC;
	Fri,  2 Oct 2026 15:01:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF25210328272;
	Fri,  2 Oct 2026 17:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790953315; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dkEV3NU/xjxq6SJuLLAVWiQsTCv0N4E8zuSVpty49hU=;
	b=oXcupmIVp937v5JWd4dsarV6ALN6NCkQAnLYJ3SbX2UI3q90aV/SzUJrw/GgLIRTNN5XNy
	rnCvCrg+tzlu4yuoxM/VlEetJDemz8u2PwYknQfBdNPGEUofWj710RhUa7WYYV+VexJrJA
	dm8OV+U38cUYhPdO+2qbmpCjlestzrOjqLv0+dROdB+FW/FeQhxfAF8z4z7P436WWmyz7j
	AicnIzAORDiUMaj52heqvYBy230j9YZ7h7H/wixd6LUuY3Ag4w8Ig5vf0IJCNpm4B2r+5t
	m1k+5CwQ2zR+Qwkr05isekrXnC5GuGPnFGyAK8eddGDkezg5SPrmmOsp93UdzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 17:01:10 +0200
Subject: [PATCH v7 6/7] arm64: dts: nuvoton: ma35d1: Drop HXT clock output
 name
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
Message-Id: <20261002-perso-ma35d1-upstream-clk-v7-6-cbd991fa6270@bootlin.com>
References: <20261002-perso-ma35d1-upstream-clk-v7-0-cbd991fa6270@bootlin.com>
In-Reply-To: <20261002-perso-ma35d1-upstream-clk-v7-0-cbd991fa6270@bootlin.com>
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
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The clock-output-names property is not useful since there is only one
output clock, and the naming of that clock would already be clock-hxt
after the node name if we were not providing that property (so very
similar). Just drop it.

I want to clean this name before introducing another very similar fixed
clock in the DT: LXT

Another solution could have been to rename it "hxt", which would have
been more aligned with the other clock names. Sashiko complained that
this could break DT compatibility with an -EEXIST error because of
the colliding names.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 1 -
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..d7670afb0a63 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -35,7 +35,6 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..8f3cb18d39b6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -35,7 +35,6 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
 	};
 };
 

-- 
2.55.0


