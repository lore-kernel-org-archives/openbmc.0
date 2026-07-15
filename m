Return-Path: <openbmc+bounces-2294-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B6FC4451C
	for <openbmc@archiver.kernel.org>; Sat, 18 Jul 2026 04:56:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h2Dy04G9Mz3cCt;
	Sat, 18 Jul 2026 14:56:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784125382;
	cv=none; b=BEuvmTZIk2YND+IdW1pqX/E5UMP4ICxcLKOI90l1w93PrAL0pwIitC4eC7n/Z+NAubFWBGpP7YdgVIDl4tfHJDpWCWYEK4NfCD6n/1p05iGSuJCOTBT70sVjtTx4gXtr863JW0vPBFh5WHeNsQKOcm7Cj57UC29fpKVUFR/SOm8gMA76dvGlv+Ws+Ug/RUWOq85Bhhnfv7kAhh5AaHxrUGMWG2EZcJPLPlTQ08qRhWIxJnDM3nCRtCpIu7kFY1W/viUjlCyz2qzRozqOn+dT1Sy32JAJjEg0/dMlI0NimVIkGFihqenfVgDo0EhWi2Rux2PcSas3xmCZt9gxHLkDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784125382; c=relaxed/relaxed;
	bh=RwP0ZAU4rBRQaNpLFK3/bZIxH1qsqU+jxMuUyxinPB0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gvoMPTwTn87D7yfJwtlYvtX68bpjOIRS74NdLVsDIJajjIvV6ji6w4+uuoDUHTl6gT1+joKpqLDxI87bITj+i6IkWCaExs9PCg1Jt6PborOpjAi8yxtCKRadmG89po8kE1oQeW/xewE+gpS9NxxBabb8gy3i2u+Z8DCB1ExwWjl8O8ksOHPssA9VPyqNqwgGV9l1vO/9xtAsonoIeJWZaYJ1W8cQwsNt/rtwP/mqHEJ43igYH4pacyMt+mmLAQh5QnENeCImfMOeehS53gzkOEYPdst3rrEaSv4apq+nItBur7p0xeCee85oNPCHecFuWw1Gi3KEmiMVFsaUYIPMdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vi7sLQpZ; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vi7sLQpZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0dgS6ZHdz2yll
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2026 00:23:00 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1786AC2B9D6;
	Wed, 15 Jul 2026 14:23:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 123226035C;
	Wed, 15 Jul 2026 14:22:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D19811BD3AD3;
	Wed, 15 Jul 2026 16:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125371; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RwP0ZAU4rBRQaNpLFK3/bZIxH1qsqU+jxMuUyxinPB0=;
	b=vi7sLQpZuudQiX1SS3mKEYirXjnBJHqT4qtaNazFTYSoCRaimT8hMIhu/CGlrDb30TFse9
	+0BQNIB5pxOLwfpf7EjmYlG7kXvN98+fWzpbZY/2ILThs+3x0dMdMvWGjzBs8bIs09Wxvu
	KDY3nzURxcmCi6usVeHyw0v/Ni61b50q7u28mJEEaEI8p7/ydZsiWK5SiHBDU3bXxWK0sM
	QTRNQObFO7U8ASBphMf8XxSr/n1Wjh8zurI67ZEMria4FZOogCN2VKsxkdKJYNuXn7OSUy
	48C5J6sutChw4zBEkS0dZ0H5qPOgE4q4egNSdX/3Y900eLlJUhQ6ZMhegmeq1A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v2 0/7] Import optee node from u-boot device trees
Date: Wed, 15 Jul 2026 16:22:17 +0200
Message-Id: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAJmXV2oC/42NQQqDMBBFryKz7pRJQMWueo/iQuOkDlQjSQwW8
 e6NnqDL9/n//R0Ce+EAj2IHz0mCuDmDvhVgxm5+M8qQGTTpimpFOHVxFF5x7Z2LOMSAMi3OR6w
 aW6reUFMPNeT54tnKdqlfbeZRQnT+ez0ldaZ/SJNCQmuZtCIuyTTPs/GR+W7cBO1xHD8xm1Azw
 gAAAA==
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
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=3745;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=5cjITBf1lX11tV96k9LlFBTJvsIywNAVIH+Qi4KvIOQ=;
 b=x1XMbnxl5+7T+kpMxjng4W0jVssHHk/XXgC+3FCBDIp9aBO4U6Y7Ng6zXBHEs8ysV+qiN3+XC
 nGl30mK/YPaA10RTdL3bsGkE22oTyMW70FRiNPlN85GEJUhVk5+ncKy
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
Changes in v2:
- Splitting i.MX8 SoC changes in a separate commit.
- Adding bootph-pre-ram on stm32mp157c-ed1 reserved memory.
- Rebased on v7.2-rc3.
- Link to v1: https://lore.kernel.org/r/20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com

---
Mathieu Dubois-Briand (7):
      arm64: dts: freescale: Import optee node from u-boot i.MX91 and i.MX93 device trees
      arm64: dts: freescale: Import optee node from u-boot i.MX8 device trees
      arm: dts: st: Import optee node from u-boot device trees
      arm: dts: st: stm32mp157c-ed1: Add bootph-pre-ram tag on optee reserved memory
      arm64: dts: hisilicon: hi3798cv200-poplar: Import optee node from u-boot device tree
      arm64: dts: nuvoton: npcm845-evb: Import optee node from u-boot device tree
      arm64: dts: freescale: imx93-frdm: Add OP-TEE device tree node

 arch/arm/boot/dts/st/stm32mp157a-dk1.dts                | 17 +++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts                | 14 ++++++++++++++
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
 16 files changed, 129 insertions(+)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260710-mathieu-uboot-dts-import-69f51bc097d7

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


