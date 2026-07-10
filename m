Return-Path: <openbmc+bounces-2254-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992A2C43458
	for <openbmc@archiver.kernel.org>; Sun, 12 Jul 2026 00:55:00 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gyRtL4HJgz309r;
	Sun, 12 Jul 2026 10:54:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783697952;
	cv=none; b=fSt0Sow8DO0h+DdLdpBTdzFCr2GKjve4bWqLnw94NuZSgZgpFA5C24WDStzOatgc4rzVluXTumWqAolBdU9KHhtP5XUGto/eJW7ciwbEN7Cv5pFyQSJgC38QO7I9F+XLi/X1huUDdkMHnik/O7XZn4Mkc9+b07V0CfmjV/YD+FPWVpijDoGusBLC1B7J6gBfgZP7cAdQU9GT7ETyGEC4W8ZXHJ/yOTb7OFMHuWkFUtXJC6zjNzE9JVQauXsmgkjsngWg5QgMDcGvz6hDa3vtn0+FNJkC+y9xPXCCCUuj6Yzosqw/s/FwRpSGkMPhcprl7BkFsoB1d7JrKLahjrkJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783697952; c=relaxed/relaxed;
	bh=opjT5/t2075ZwXKLhLNRf46iRkyFA1PSM/HbIUktT94=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xq2cPnkJNUZFo2g0ZpfsIRmI8D01enm72B/rCrCWnsVfLnifvHrFtrottCE58qXjhLRRUbgY4FzQ+coVHukUcBNuZTp0aH7acLrNVBIozx1F0pal3mx97vInS7CoEvTFniFDE8Mk6bSZu/8y6DZl9Hyr8f9bxh+VPEIwkBaPYSCfHaBcyqnZXDUJMhxwMpYDDnZtfw9Qv5jTh3RHWgTiw1ayduGbMmLbsjJ22KdGLv2q6DdEx81c7sAKH4NZivJAGQfVcZak63kjBCR+ITeh/W9YotB5CfdbWO2xbm0WGH4OJdaV7AvXB9IBTs+EijAc1LkCmb0L3Umubz3aa/iZNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=So9Q79Yh; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=So9Q79Yh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gxbbd2nHZz2yXj
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jul 2026 01:39:07 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 381971A0F43;
	Fri, 10 Jul 2026 15:32:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D84CC60342;
	Fri, 10 Jul 2026 15:32:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB3C011BD0EF7;
	Fri, 10 Jul 2026 17:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783697518; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=opjT5/t2075ZwXKLhLNRf46iRkyFA1PSM/HbIUktT94=;
	b=So9Q79YhoDHT/FGDeFSSz3t4dbs5QiCYvboGne3BFeM233eBO4h5D92DoMoNc57Mbr41OQ
	9yw9kSjV+hEEz7vp86+bNRHok/osHrUOQDeOS/AvnURhfz+ETg1SVlOhfJ7+SM1dX/8mTg
	zr56j5czUW5Fa3PskU3skwb3RhgGflmv0fTQMRrlijpZNkrQxJLxYkH8HRmmDxQdcDwgzv
	aRRAvSLtNmSNbdVkpRwtV8FOMSJXpEEOOmj/0BGdpVc1Aku5WHBR0uo6YFA84i7kDDIX8f
	4ygK3NCgsmvUbEsvo/65brZKVyV03qr1g8ZmtPtqZ9CNjjoSfIQtlCyr1/m2XQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/5] Import optee node from u-boot device trees
Date: Fri, 10 Jul 2026 17:31:33 +0200
Message-Id: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAFUQUWoC/x3MQQqAIBBA0avIrBvQoKSuEi00p5qFGWoRSHdPW
 r7F/wUSRaYEoygQ6ebE4ahQjYBlN8dGyK4aWtn2UiuJ3uSd6cLLhpDR5YTszxAz9sPaKbvIQTs
 NNT8jrfz862l+3w+Q4xJIagAAAA==
X-Change-ID: 20260710-mathieu-uboot-dts-import-69f51bc097d7
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783697511; l=3294;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=GvF+goMJzkF/uRrgajuo8a2aYORnv/sPr+Q/viHrWb8=;
 b=6FNuUzGqgL00oYjpCi6BVoz145dDiOaDz5uzPPuGqQNHNyEUiD+kRXgMLs7vzR5ZwO86WxY8j
 nHWsJLbnupUCAaPtOHaJiaKJgq4r7J0GvK9kSFtko/5gHJz4AvqLwqu
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

In a recent discussion on the U-Boot mailing list [1], it was found out
that several platforms were adding the OP-TEE device tree-node thanks to
some U-Boot specific dtsi. This was deemed as a bad solution, as this
should instead be added in the DTS files hosted in Linux sources,
particularly for platforms already using the "upstream" (Linux) device
tree.

Most i.MX8 and i.MX9 platforms are already using OF_UPSTREAM
configuration in U-Boot. Some are not, but are fairly new, so we can
expect them to use the Linux device tree once their support is a bit
more stable. So they will benefit from these changes once upstream
device trees are refreshed in U-Boot.

STM32MP157 platforms are using OF_UPSTREAM, with similar consequences.

The two other platforms are using an U-Boot specific device tree, yet
adding these nodes on the kernel side will help to reduce the
differences.

The zynqmp platform was ignored, as a similar change was previously
reverted [2]. I also ignored a few platforms without direct match
between U-Boot and Linux dts files.

Also add the OP-TEE node on the imx93 FRDM platform device tree: while
this is not part of U-Boot code today, it is the change that triggered
the U-Boot discussion.

[1]: https://lore.kernel.org/all/20260706145906.GW749385@bill-the-cat/
[2]: https://lore.kernel.org/all/20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com/

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (5):
      arm64: dts: freescale: Import optee node from u-boot device trees
      arm: dts: st: Import optee node from u-boot device trees
      arm64: dts: hisilicon: hi3798cv200-poplar: Import optee node from u-boot device tree
      arm64: dts: nuvoton: npcm845-evb: Import optee node from u-boot device tree
      arm64: dts: freescale: imx93-frdm: Add OP-TEE device tree node

 arch/arm/boot/dts/st/stm32mp157a-dk1.dts                | 17 +++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts                | 12 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi               |  7 +++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi               |  7 +++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi               |  7 +++++++
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts       |  7 +++++++
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts      |  7 +++++++
 arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts  |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts       |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts      |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts         |  7 +++++++
 .../arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts |  7 +++++++
 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts  |  7 +++++++
 .../arm64/boot/dts/freescale/imx93-var-som-symphony.dts |  7 +++++++
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts    |  7 +++++++
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  7 +++++++
 16 files changed, 127 insertions(+)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260710-mathieu-uboot-dts-import-69f51bc097d7

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


