Return-Path: <openbmc+bounces-2257-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB0CC43458
	for <openbmc@archiver.kernel.org>; Sun, 12 Jul 2026 01:02:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gyS2738WSz30FB;
	Sun, 12 Jul 2026 11:01:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783698115;
	cv=none; b=od0lMqysM9rgPfym1G1rM2ARG4UmlYBG3LJOhXL5kxpoqJU4k8ISKJyJgOET+B/RUOop18hLxByZCXR/djDsKBqIRdtkAEGyG2pYeUqpND6wCwvJr1h/stNe5EGrdZ3f1t9EDt8dr2HcwYpzIKCOtxZtZ9D8Q06ZmvGfhVV2Dj5ejSSSNunaJblpBGGXESxF0xcNrpQ/Ylu2oK8hCA0182KSgAnUGVvg2YQ/15zd2N6N23Q2KJWpjyMMromh9NYQ3Kd9F5eui3eToGeKsrmtIARf14C6U8tFhtp3TFTN22cJTy4Av92leyAEwc7taRMWL3Yufs8AvslXA7IB3jV9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783698115; c=relaxed/relaxed;
	bh=vqW9/RH3UDRT9Qj8/JqT5f9mnBCAvdontHcYO/WHgd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bdeJuf/8JFY+zlPsoHBQVrKM+qDn09i3jWBgUzeI1gzhFpMfw1dif+YF1oQ/EIQIJ0IaVgBfw8M/PuSUnlbo7Y3pNKPiWlaJEDObRQcffZb2sqvqoPOxEkO/M7Bwq+N+Iqb97I437aSop193xqJbQGtXO1UdLODhbykcCro7EIsVPdAQYsBDbgB9dhZYWTMBmF3R4Ylfv7V7UCiA3LLnS9yfHzc2PSle7/hd8Lu0FpTe2cKKsXzcJX+poempxP5DAvri4VYkn4TrRjDWNNzawTwTuxY+ByOniVKL30mgw3BhZUhEh+cFa22j1DR1ICVTvHaZKNXSO7G3a+yPiNiMYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KQ7TB6i6; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KQ7TB6i6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gxbfn6q31z2yYK
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jul 2026 01:41:53 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C52B8C2C64D;
	Fri, 10 Jul 2026 15:32:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 360AF60342;
	Fri, 10 Jul 2026 15:32:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 757B411BD1C39;
	Fri, 10 Jul 2026 17:32:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783697532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vqW9/RH3UDRT9Qj8/JqT5f9mnBCAvdontHcYO/WHgd0=;
	b=KQ7TB6i6xoEyqyf8PatcXCiYct4jjrpYwKZjqvtUmp49z3BDY+YgsogTLYjCYQD2nzV6Cp
	jzA62MZcQtwyMXcq/JgDW8xvjmDJZr+Jyvp/4BAVR57gJcE8rUNKQ20QTSwl9rcdT9qqZj
	18NbSmGo0CO70zoqJ1lsz/SOKSLbOiMi2JDKV16qWSDkT9yifaDrOegRslu0oFesFMGGE9
	dfnjNcr8/aofwu4uJPk/M81a6HX1UNnVuaQO9YPJGM0BaQQPLfmt8Zkh6MSLenljl6Vwbh
	litX4zOu6p9ZsZwJtZnu5JrapXohtrwPCGWNU7pjGoeQmgF/GMS9mMVaEe6l1g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 10 Jul 2026 17:31:37 +0200
Subject: [PATCH 4/5] arm64: dts: nuvoton: npcm845-evb: Import optee node
 from u-boot device tree
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
Message-Id: <20260710-mathieu-uboot-dts-import-v1-4-ffe0210e50c9@bootlin.com>
References: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com>
In-Reply-To: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783697511; l=914;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=IHC3taB/c1hjjbHV78+MpFaKPexGySK661G3gH5QQQ8=;
 b=YskH4XXITgrh4BDy7rh0C6CaVOqf90OiQ1uWiaAX0EZCYFl1sya1haf7eiT+PGVrxz6VH/5dW
 a7FkqvpzAQNBiehXRDDXPhkjxZYE5L5SFgYVNqmshnsrG0QXePXT5YN
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

U-Boot is defining its own device tree for this platform. Among all
differences, a firmware node to enable communication with OP-TEE is
added. Importing this node here will reduce these differences.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d13342d..6be771e581df 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -26,6 +26,13 @@ refclk: refclk-25mhz {
 		clock-frequency = <25000000>;
 		#clock-cells = <0>;
 	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
 
 &serial0 {

-- 
2.47.3


