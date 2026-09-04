Return-Path: <openbmc+bounces-2560-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FB5C624D6
	for <openbmc@archiver.kernel.org>; Sat,  5 Sep 2026 06:28:09 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hcNfw4Bjrz2yvR;
	Sat, 05 Sep 2026 16:27:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788526997;
	cv=none; b=jjWVQo6klU++EOYiOiFILBZnI+T422Xwlj9QeD13843vAN8PFydyRTUGkLTw0B+cZP+lTEcsq2S1Sj/9cgJcnx42X/Egv4vweI4QKuyODqJQ2rEJIJWcTC/XTXrFj/qUMtWG8pym4IagqNDzMBA3WoNBRPer4AEu5hExcazVxDk2tVG+MpWHxKLstfRck+dOqSGVTgfZpv1dhyhYhDFMImiOmQ6FO8Bhmhehk2EjUF2Pp3HL9LQ2Ht4q2ByyM7pKGYBApVczbUHQNyssqP2EKCuvdKhwTl0j5rH7W+LVmvH9bXZrpyyEjIEjEqqeHXYVJipYemBiBWlqMHcBm4KOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788526997; c=relaxed/relaxed;
	bh=MvH12Wkw5GNJa7jFREGOQOlrScLWslkzq25GVdQ6L8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dUoSgjpf+8BCvaMrgA92mwn6Oyl+NudpbkfsSOoV3QrwxI32zW/oSMN4e7pCqFHmswf+OXl6XvimGAnKCZLusoQ8qYYy36ofVXlGspIsprMZUPcljd6ZkQxrM6K0d1tbEtOJxks7fUtE2jSvSRoFNUF3FTUjqJ8RTjerMufwfh0FYJd/M7yXtXnSLjNj8Zanw2mdaKktfENZbRwcC/xUdTFcT67SN08OUV1nRmSWAP2V49knM4OYnk1QQR5SaskvlFb7vRHQiJBN/SfDVsmoBmddrRTQpuNdefkVkp0QpR+z2BxbWAniUuQVUnuYB/UoO/PAOb86sol1xRAw0EDw2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=otStiFrD; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=otStiFrD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hbxTw0bHZz2yrT
	for <openbmc@lists.ozlabs.org>; Fri, 04 Sep 2026 23:03:15 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 011B54E41509;
	Fri,  4 Sep 2026 13:03:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C876B6057F;
	Fri,  4 Sep 2026 13:03:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF8FF11C7ACEC;
	Fri,  4 Sep 2026 15:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788526991; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MvH12Wkw5GNJa7jFREGOQOlrScLWslkzq25GVdQ6L8Y=;
	b=otStiFrDyfPjzH77zPPk2PHbXzCyuymGxP4JVUHXhAN86C1JuHH+TJxgXVK/EhcEgSoNeS
	o/cG8UkTROYFR1eci80hxh8Xz+e4zW+B2C8Ogu9CrnAFCCPTrml/Mg89tRQQ0UTrnhtrLR
	Hc62o/0BvlDJWU+x+RWMa1AnXcHcCuAqW1HcqTKKExmzKZ5LLDNA2mJQY0SfMxirkLHI/u
	sxR+4xXNPNIUiP7/2bFUxuNxnk7VkVOsdvYhxG9bzTLAejwzwg6wrceAfinGhKNyse4SAT
	1T1NjFuWMGMDCGIH7/WoTIPVeqwcIngyGXqZo8zhSgrARNHxWFShf+WHVAjPhw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 15:02:38 +0200
Subject: [PATCH v2 3/3] arm64: dts: nuvoton: Add NuMaker board
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
Message-Id: <20260904-perso-ma35d1-upstream-dts-v2-3-30ce255a401f@bootlin.com>
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

Nuvoton MA35D SoC is used on the NuMaker SoM, itself plugged onto a
carrier board labelled NuMaker. Create a DTS including the SoM
description. As a first external component, mention the SPI NAND
connected to the Quad SPI controller.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
 arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 42 ++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
index 3bc9787801a5..4c82109c885a 100644
--- a/arch/arm64/boot/dts/nuvoton/Makefile
+++ b/arch/arm64/boot/dts/nuvoton/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MA35) += ma35d1-iot-512m.dtb
+dtb-$(CONFIG_ARCH_MA35) += ma35d1-numaker.dtb
 dtb-$(CONFIG_ARCH_MA35) += ma35d1-som-256m.dtb
 dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-evb.dtb
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
new file mode 100644
index 000000000000..16c003998d3b
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 Bootlin
+ * Author: Miquel Raynal <miquel.raynal@bootlin.com>
+ */
+
+/dts-v1/;
+#include "ma35d1-som-256m.dts"
+
+/ {
+	model = "Nuvoton MA35D1 NuMaker";
+	compatible = "nuvoton,ma35d1-numaker", "nuvoton,ma35d1-som", "nuvoton,ma35d1";
+};
+
+&pinctrl {
+	spi-grp {
+		pinctrl_qspi0: qspi0-pins {
+			nuvoton,pins = <3 0 5>,
+				       <3 1 5>,
+				       <3 2 5>,
+				       <3 3 5>,
+				       <3 4 5>,
+				       <3 5 5>;
+			bias-disable;
+			power-source = <1>;
+		};
+	};
+};
+
+&qspi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi0>;
+	status = "okay";
+
+	flash: flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <30000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};

-- 
2.54.0


