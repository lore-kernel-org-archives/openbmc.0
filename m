Return-Path: <openbmc+bounces-2402-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FC3C5CFCF
	for <openbmc@archiver.kernel.org>; Fri, 14 Aug 2026 01:05:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hLkYR6qfMz2yrW;
	Fri, 14 Aug 2026 11:05:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786605939;
	cv=none; b=gfgi/W/MCsQn3Dwxpv8Rnt5L4AYBM+402zFE8KoXtzz8ilC20BPEV92nVFfWcFg8RpzxWP2d1+br1p7eQoQ2ejvfw8Ljr+pgL80rVofqs6VXxT4pno4oXJdDFb51kjVDqpFGCpUzzRmjW8JyJEAupgJ7sc4LN+aA5/BDSnINP4GA4N2+kh2wmeH/lhH9FkD4VwBxaiXoG5olgiR4Ty8Ar3ILsVc8iTZO/nYKY4QiKAb/BQQdpWMyGLoeK4eIeX2CWhbcGJCNf9f/OjfpdfTYpMcMJYl/1qdmG6t+fKcfd7BDoxF63y0ixAWtBV+xkS466GhwkvWjikauO2l1AjAYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786605939; c=relaxed/relaxed;
	bh=Ae4Y1LKEtrS8HaD4L0HeXkOJ7/FVtmzDxwwoJBX8xFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOYPzzeRGsvDWAIfSwgT7Tq4Mqhhn7NIpZEkbTlpRfW2WksMfZtfO6qxjJj0TYR4qtMlWJFY429tFUvHtQK4n7Ucjg4KLeNl2Ec6913c6tof0OHskfPsdQ6oDr04iZFah1YjScnZ1U11AjoeQ9EPRZRuSB/2NlZ2OR7M9d+/Qxe7RCy80Nr3Y929c6gTiEhaWFwDF5WBfU5sqWMB9V7ypHZoe2Nxz59oiSYz67HJovtOPLFRySvccc+NYJWDzjBk7jEX1BXdYtpac6g75HMdjAK8SQOR/kNfHxwXv/EVdIIu3sR5tD8SFDGlNp4/DYEljX34N7hYQ/G7DOUfGP/b2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0+M/66RM; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0+M/66RM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hLH2V5sQwz2y0B
	for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2026 17:25:38 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0124A1A15ED;
	Thu, 13 Aug 2026 07:25:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8813602B8;
	Thu, 13 Aug 2026 07:25:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 752AD11C4D9FD;
	Thu, 13 Aug 2026 09:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786605930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ae4Y1LKEtrS8HaD4L0HeXkOJ7/FVtmzDxwwoJBX8xFg=;
	b=0+M/66RMB64SC2dFcH8dQZsVj4piKukOs8uPS87RZImBAACr55XDgmyK8BKR97jWKcrEl3
	z5grx77YgnFag0y0TKSO/yytvOeEkuqI6MqrHdGY9cR2RxuLuwUmiCPl+oeRfWabhxkEOV
	XbTOcf03cxkzO8OS1nN54QTkqckL3QpB59shYBj7GGbuld7JxSMa4MRsbSeaqIQ8Zp+iS4
	OAPrzJknT2l71TY2kV9KgAc/UGFa8EkJ9elbhD3tZXGJPrtSuFk2W5kejLVAFTjbst3Dqn
	xr53xWKhRSxu9o4HQUHTaNwbTZ88v2CMdPEQAAECTRN36hW2DZ/L+w7j/cBbdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 09:25:07 +0200
Subject: [PATCH 2/2] arm64: dts: nuvoton: Add NuMaker board
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
Message-Id: <20260813-perso-ma35d1-upstream-dts-v1-2-bb237fd7c3c2@bootlin.com>
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

Nuvoton MA35D SoC is used on the NuMaker SoM, itself plugged onto a
carrier board labelled NuMaker. Create a DTS including the SoM
description. As a first external component, mention the SPI NAND
connected to the Quad SPI controller.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
 arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 37 ++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

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
index 000000000000..01f1f800aef8
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 Bootlin
+ * Author: Miquel Raynal <miquel.raynal@bootlin.com>
+ */
+
+/dts-v1/;
+#include "ma35d1-som-256m.dts"
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


