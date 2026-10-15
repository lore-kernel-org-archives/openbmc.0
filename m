Return-Path: <openbmc+bounces-2776-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF20CC6B2D
	for <openbmc@archiver.kernel.org>; Fri, 16 Oct 2026 04:31:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j5X6H35ZHz30Pr;
	Fri, 16 Oct 2026 15:29:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792066804;
	cv=none; b=DnSI6EUFsU7y+/dpWYWH2FZ1BKyQAGHHBooOxpA0CyNRRoqfOCWwuBjDDBGWtaADm2nJgLlHIDFZVi9XrZ9PFENsRmfR0ZNnJX1i8osf3pxmrOMJ3NVWRZo7EnWQ3LlYc3sKQbHUMK5N+qiES5eW0pJKN0S/5XEQVF9rbTzHUPz3I3qnw9tTJr0j5TUrXnY/2r6xvWi8I6mqbBOC2XsVvs8EHNxSs41BNRKsjtHE8pnXwHCSdjqlLmKulRjcvcstmgAgJQPIlv2o8RsD5HxbCG728J/1+9NreRcHIeKW6XpU1qFGIucuH5y2uMonTSBHj8l684ULc8kDp2c/r6iIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792066804; c=relaxed/relaxed;
	bh=dkEV3NU/xjxq6SJuLLAVWiQsTCv0N4E8zuSVpty49hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuOp+FVA+YIhMCSgSM79bKnO2NjUFH8PfiFEFG/9MUjTJZsMtZ+LCCOLex7dvqn7zIuHJAgyR7K1sV6BF0qY8zcGME2yevZRBjmybqPOcntZ2q5lYMDE9G+boYFAju+fmCRMxtYBkejoAoMdvwCL+Y8N8GUPDyxAbSkoURmULUVNFFEESedynhd5tHmw0rM1orGPtaUxLPTf5SKxRrJ7Pjc+Rfy2gYWIzMqB+K/nBVK16xDb3yGZbWo/uiC7aAg+6wbfVgDIMcaJD7TjRAtsb4rIDzTkyz0RJfSmXgpsZsuP59qTM2AZWaRHMfjQPcXLo7G9tsP1YrIljF65XRujdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pvox6FFl; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pvox6FFl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j56b759s0z2xLg
	for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2026 23:20:03 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BD47D4E41246;
	Thu, 15 Oct 2026 12:20:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8622F60360;
	Thu, 15 Oct 2026 12:20:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 897B310328B6D;
	Thu, 15 Oct 2026 14:19:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792066798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dkEV3NU/xjxq6SJuLLAVWiQsTCv0N4E8zuSVpty49hU=;
	b=pvox6FFlT/HyVzfGEgFIicR/y1jOTT9Dzzut1cyjMQxCsekAiOsTdghHIWvQW74j2W07M+
	Hy5tUYuxsTSfbuHLnTfoLruEnI+rJv4b0NezoYksTTZ/pp7frGsquL/u1u8SbfHanFLxGB
	IbUitC2TwcENgfUMUIvaXPp3LISILkAwdc3bu24q7plg/tffUWvEr1FigSXkivydSVc7Vr
	HvPoS4//23x8oFAHJ32uvw0ukU5j3AY8C52HSWTl0dbblGdNWhFtM3O48s96YZXuRaXaf6
	5dXgE/HPRE6gsQuneLrdjAkMAO9iFL77mOezv1bBYDE0J/xVA2SsLpyuNjNKTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 15 Oct 2026 14:19:05 +0200
Subject: [PATCH v9 09/10] arm64: dts: nuvoton: ma35d1: Drop HXT clock
 output name
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
Message-Id: <20261015-perso-ma35d1-upstream-clk-v9-9-1f548fa2002e@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v9-0-1f548fa2002e@bootlin.com>
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


