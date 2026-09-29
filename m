Return-Path: <openbmc+bounces-2681-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB01FCA5FA7
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2026 22:28:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hvXqd6WDJz30MZ;
	Wed, 30 Sep 2026 08:27:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790693137;
	cv=none; b=dcT+zVQAHbdAbpcq7Fjuhriwg9r7XO1Y600Ce8U0ax1tWqnWazBv9trt9hLoLynbXr/HVkMDetRqAe8c/Af/LArvXK2jsolLVJpf2ldGZvLmBIhWeZvv/dfRR1w8V9RA9C4PCmdjUHpSS1ZL0KfaMa8bcJmnGAUsD7VGfYBvp8a4mcZRC6XQJO//JwSZiYUxMJcVade21s+28HnYp2T/z3dn1NyDwufS3Jig3x3LhqBFZScKZ/2QiigX0AC2mJR+fzNN4yWH007q4btjeGmNhndfw6FU23eleNG/ozcFom+uAwxMHyJrIgtXql90baiQj7ekiFMRm4B6ewI+QY5plQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790693137; c=relaxed/relaxed;
	bh=HnE/nEINBntspdikCM9SocywhfFVbUfdzqo6gj4+tUE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=far/7tDKzArjlJOotCEK4H/EvGYznsL4n6G02m2Ij1jLBw+qDU+kabHwJk/OHUhwPU7j3Fw/Evc6gy/dmTbT31HOjzGktA5VvZebfT9a57XU6DgAl3X6yo0hzPx1Bm2HCd/3oHgfOv+U/YH1kagzcPce8nZhGcXuxhYm0+8HJSFcQgBJiM8A1pgnDp40SFK4hGjPpBFn36i17fNwvTZCcuhdyHVo3rVFc3wb8pAb2eefNJTZeqYL9012Plm26h6Agz/xbszlcoyYbN/+G6+H+wCfzB5UbiQA2dAvMW5fbblGTxxeXyybhpRpGvQRDPVTDPxZi7PsosomCpruH5i5ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LuuB+fBb; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LuuB+fBb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hvLZR5Kh1z30Vy
	for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2026 00:45:33 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8905C1A1064;
	Tue, 29 Sep 2026 14:45:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 56A48601BD;
	Tue, 29 Sep 2026 14:45:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59075103282F2;
	Tue, 29 Sep 2026 16:45:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=HnE/nEINBntspdikCM9SocywhfFVbUfdzqo6gj4+tUE=;
	b=LuuB+fBb3tqUEXEHcLEkKkhrUmC4yd0n7JHXARbMCDuQiFyVNnUxqcKpP61Ain1Paf7zZo
	lCxL7xePLBv9Ju1E/ToZh9iPXvj9x/IVtG0/sRneN+wnaktDri7XALJAJRIE5wjN4BHmKz
	/fTrgcfLCHkHm2doSSaFQdlyMaoi8jP8m3DbzYVCKYuwqrcI3iTNDIYWw6v1CSmOJWFjzF
	m7msFlGAyilmVSQY2Us9yTr3k8PXm4S7gpSPQQljL3tvNa48Hph9Wa38wpPWUueIqs5HMa
	VTDeHt95oglI/aG5X7M20pvVafTgPb8XtIf7y1b1nImePCIjmM/ruPW99MWSbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 0/9] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Date: Tue, 29 Sep 2026 16:44:43 +0200
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQW7DIBCF4atErDsVAwHjrHqPKosxHhrU2FjgW
 K0i3704m7aKFGX5P2m+uYrCOXIRh91VZF5iiWmsYV52wp9o/GCIfW2hpLLSoYaJc0kwkDY9wmU
 qc2YawJ8/wRpPPngkZztR76fMIX7d7Pdj7VMsc8rft1cLbusz6oKAwI1jwxYbxfTWpTSf4/jq0
 yA2d1G/VqvwkaVAgpJt6LUi10l5b+m/lnlk6WqF0BE3LJUkd2/tn7b2m6Vt2xijdYvhv7Wu6w8
 vERdpqAEAAA==
X-Change-ID: 20260813-perso-ma35d1-upstream-clk-65cacfc1a86b
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
 stable@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Jacky Huang <ychuang570808@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

I am in possession of an MA35D1 NuMaker board. The SPI controller has
been contributed, but at this stage it does not work with the current
clock driver.

The clock controller registers its muxes with .fw_name parent data,
which requires every internal clock name to be declared in the DT. As
the DT does not declare them, all parent lookups fail: muxes end up
registered as root clocks and most peripherals read a zero rate.

This conversion exposed a first issue with the WDT/WWDT parents which
were actually missing in the clock driver. I am not using these clocks
myself but it is worth fixing.

The second round of reviews raised another problem with the
crystals. HXT and LXT are external crystal oscillators wired on the
board, while HIRC and LIRC are on-chip RC oscillators. HXT was poorly
described (and incorrectly exposed through the DT) while LXT was not
even documented. The series now also takes the two crystal inputs from
the DT: they get documented in the bindings, described in the boards and
looked up by the driver.

The clock tree now looks much more accurate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v5:
- Fix the bindings wrt HXT and LXT.
- Fix the DT descriptions of HXT and LXT.
- Collect tags.
- Link to v4: https://lore.kernel.org/r/20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com

Changes in v4:
- I forgot to bump the clock counter in the driver after adding the two
  new clocks in the bindings. Sashiko will keep complaining about the
  incoherency though. Since binding and driver changes should be kept
  separated, I cannot do both at the same time.
- Link to v3: https://lore.kernel.org/r/20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com

Changes in v3:
- Drop the number of clocks from the binding, set it in the driver only
- Split the binding/driver patches completely
- Link to v2: https://lore.kernel.org/r/20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com

Changes in v2:
- New patch 1/3: register the missing WDT/WWDT parent clocks
- New patch 3/3: harden the code
- Link to v1: https://lore.kernel.org/r/20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com

---
Miquel Raynal (9):
      clk: nuvoton: ma35d1: Keep the clock count in the driver
      dt-bindings: clock: ma35d1: Document the missing crystal inputs
      dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define
      dt-bindings: clock: ma35d1: Add missing WDT/WWDT parent clocks
      clk: nuvoton: ma35d1: Add missing WDT/WWDT parent clocks
      clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
      clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing
      clk: nuvoton: ma35d1: get HXT/LXT from DT
      arm64: dts: nuvoton: ma35d1: Add LXT crystal and correct HXT name

 .../bindings/clock/nuvoton,ma35d1-clk.yaml         |  16 +-
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts    |   9 +-
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts    |   9 +-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi            |   3 +-
 drivers/clk/nuvoton/clk-ma35d1-divider.c           |   3 +
 drivers/clk/nuvoton/clk-ma35d1-pll.c               |   3 +
 drivers/clk/nuvoton/clk-ma35d1.c                   | 656 +++++++--------------
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h     |   3 +-
 8 files changed, 246 insertions(+), 456 deletions(-)
---
base-commit: c5137d373338693fc18f03824782c7d383bfd57a
change-id: 20260813-perso-ma35d1-upstream-clk-65cacfc1a86b

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


