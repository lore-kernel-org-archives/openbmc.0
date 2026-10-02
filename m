Return-Path: <openbmc+bounces-2695-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D67CA5FDD
	for <openbmc@archiver.kernel.org>; Sat,  3 Oct 2026 00:06:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hxQtS41Rkz30TP;
	Sat, 03 Oct 2026 10:06:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790953292;
	cv=none; b=PqVIUWGzB8s/hptgJzEE2HxDYgFUrnTqXo95WIkd5G8tuLwdF3Ks9HBMQgWvuscAvtyfxoCs+m27+DsnuOyE52gm63RIA2RoJDHoBKKo35YVf97gwbRJzFmkRbmARf6yE1u8nkg7ZwWCJ88sO9vNChreEzG6b44g33L2lpwTZAN3j506E45UWbQhRhWd2T+9qqgKIDx0K8vD542lyAXugpiKuu19fFKA/WAQp5CnBli21ouQN4ICzzWC+veaf6H1eNrZkyZhSTONGtlGlQ5wtcYRvV/yT62UFnpppDHPsmmOXmOQVzBRp7YasdpPyJZ/YhK/x/djj+5A7uHrra0LLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790953292; c=relaxed/relaxed;
	bh=t9aBlN3dQdjhZj/Rg/p1QzqBO0eCn4FFiX6tAiOVuJc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aT04reGr7CB++c8abQubjRJ1+1QQX2/QdnVof3EL+38nSKncB/jq2LvnNYMJ0f4rAx/rHGX8JaOoXjTweIlqQOl4jYiAX3j29s7/YX++feVKZCqjzFtA1AB7wFcjfYEnMC0eFP5uPwV9GnhKq83duJyS1S8z/J6L6ZkL13xunI7LZLgkcWVuB4wZI3ouriDAKnCRbEgTLPlN/jjLuMkIS0X7SQoni49jBNXuRwKWWSORaPe8qSnkJjAV/D8JeCxLya93zx0wbIjagcQ1/s6vQmAkZwYJnc+KGRvMQC+8CrOnP3qUgOqM5aIM/OMPn5ga7PSMOoBQbKlm8BHQ4PpPow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=d6IPFMo5; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=d6IPFMo5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hxBnP6pJWz30B9
	for <openbmc@lists.ozlabs.org>; Sat, 03 Oct 2026 01:01:27 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9FF184E41111;
	Fri,  2 Oct 2026 15:01:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FD2D603DC;
	Fri,  2 Oct 2026 15:01:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31B98103281F4;
	Fri,  2 Oct 2026 17:01:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790953279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=t9aBlN3dQdjhZj/Rg/p1QzqBO0eCn4FFiX6tAiOVuJc=;
	b=d6IPFMo5IR7moUJPvHQ6n79+ZOMUDmwEeNcWP7mM9oybwLI6ObRQZDWz4vpm6Q4XNxfpQA
	VF38AdcBTkf+muokbDAlrfP/zLy5ZtZT81s0sXS5tZZEmew5rYgGUd/8SApes4nfSAe5EE
	st+Wgd+cfAIzAAb0Yy4oGl3CVKOnqEe5JLFXcfz0zKcL3Ep5QU/srNkhOLfEVqDGkHmyOO
	ek0qBDLt+f2zpVQi9ReNunm8vablr1ASUXo4NfccDnKlP3bJY5n24VhooCwg18i2aTY9Ou
	0VXAXQg2F4vI/bB90YTmYfcMaRwK0yAf0c+VT6qHSYigezAPIrzuy1kXhNiWkw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v7 0/7] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Date: Fri, 02 Oct 2026 17:01:04 +0200
Message-Id: <20261002-perso-ma35d1-upstream-clk-v7-0-cbd991fa6270@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Qz07EIBAG8FfZcBYDTPnnyfcwHoAOLnG3NFAbz
 abvLl0P1jRpPH6TzG++zI1ULAkreTrdSME51ZSHFvTDiYSzG96Qpr5lIphQzHCgI5aa6dWB7Dn
 9GOtU0F1puLxTJYMLMXBnlCdtfywY0+fdfnlt+ZzqlMvX/dQs1+mPaoU9UGdJGVVGAqAFidg9+
 5ynSxoeQ76S1Z35r3XccOaUU9QGJSquBbq9Jba9+JElWi/BbOxBOOMZ21uwteSRBc2K0TvUyAR
 zZm91/7a61QJltWw/szzuLbWxgB1ZqlmdsaARVbDe/7WWZfkGKMgNFEACAAA=
X-Change-ID: 20260813-perso-ma35d1-upstream-clk-65cacfc1a86b
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
board, while HIRC and LIRC are on-chip RC oscillators. HXT was described
whereas LXT was not. The series now also takes the two crystal inputs
from the DT: they get documented in the bindings, described in the
boards and looked up by the driver (with a fallback for backward
compatibility).

Finally, I was still unsatisfied by the clock tree because there were
too many root clocks. Many "gates" were wrongly set aside from the
downstream clocks they would gate, and SYSPLL was simply not parented at
all (?).

The clock tree now looks much more accurate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v7:
- Avoid opencoding core helpers, replace them with existing helpers
  (mentioned by Jerome)
- Rebased on top of clk-next since the first patches have been applied
- Link to v6: https://lore.kernel.org/r/20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com

Changes in v6:
- Drop the clock output names entirely, they are not relevant.
- Error out when the crystal providers defer probing.
- Make sure gates are correctly parented.
- Make sure SYSPLL is parented.
- Link to v5: https://lore.kernel.org/r/20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com

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
Miquel Raynal (7):
      clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
      clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing
      clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT when possible
      clk: nuvoton: ma35d1: Reparent the gates correctly
      clk: nuvoton: ma35d1: Reparent SYSPLL correctly
      arm64: dts: nuvoton: ma35d1: Drop HXT clock output name
      arm64: dts: nuvoton: ma35d1: Add LXT crystal and clock-names

 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts |   7 +-
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts |   7 +-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi         |   3 +-
 drivers/clk/nuvoton/clk-ma35d1-divider.c        |   3 +
 drivers/clk/nuvoton/clk-ma35d1-pll.c            |   3 +
 drivers/clk/nuvoton/clk-ma35d1.c                | 707 ++++++++----------------
 6 files changed, 264 insertions(+), 466 deletions(-)
---
base-commit: 6b78cda327cc2dbcd0e60f411ae014997a684b55
change-id: 20260813-perso-ma35d1-upstream-clk-65cacfc1a86b

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


