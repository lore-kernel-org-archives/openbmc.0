Return-Path: <openbmc+bounces-2289-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4908C4451C
	for <openbmc@archiver.kernel.org>; Sat, 18 Jul 2026 04:51:50 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h2DrD3XFLz3c9T;
	Sat, 18 Jul 2026 14:51:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784125396;
	cv=none; b=DNyp23BdsFIZN0tAobFVv/0839y+OYEYV4pYGDXA/mrnTGueOaxYeg5x7FCIMlULoUBVXUjhq19iKJ/88fLpzQCQPLX/CuJi6tOMRJDnuHWqcKfOkZnzhid3RJfME3dpcligjxsV3qobIwXF/kIKB7VuqLlyOP+CuOg5izFzrCFhKP1RMfv6sxkZFZM3rcctz1Mt07zEbDkVwLhTLCab7jNxwwY1eTlLfw/uqTA+8KkMMVAwjawt1cCnIa1bUCoeXb/y3rPwAzV1S6dU9NHwpcpishYEWLtm4FGVZ1QrSZzA2JlYDnFCb+Fmqn66GEAwgCxnFN1x/Mv5E/0Kn0Fu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784125396; c=relaxed/relaxed;
	bh=IL51/pID62YlF9u7PwGo05/ugBph7LsRcUIyFPiTV3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V07bJWEyZWrKTDo7o0O7wbBQGoX+8bpiuFVw5jUCYm13sEZA4Q8lurScX2W6wyJggaPii2y9eWuIDIOvzF1xP5kzIhBySfxypE2WAnmtEt9QGwpoKC5i4WU+jwRasCc2iBbb8Gc6HKB8LMyjKOE3HWIgsu7HDwen42gU3FE64GI8JRBovY8OB8FRV6P9wfbPmEwujd06PhML2d+qeG3rMdr7o5T5s8MpVS1EHj+lpB26/2cVzjWUR72x1RuDJ7cqOjfv/6USnygsjZxXh3VjjesAEvqlGO81dHAaavCxauTCL42qIQknf+iWlWEzRgWuRpzcz8xFuZoA8IP8O8FiOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=veErst9B; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=veErst9B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0dgl4Mybz2yll
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2026 00:23:15 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29A49C2B9DB;
	Wed, 15 Jul 2026 14:23:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 361936035C;
	Wed, 15 Jul 2026 14:23:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D5C111BD3C42;
	Wed, 15 Jul 2026 16:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IL51/pID62YlF9u7PwGo05/ugBph7LsRcUIyFPiTV3Y=;
	b=veErst9B4b3J/mqHoJcplPPXQFEMeFAJLVVzbyfMUFfwzUtgN0unKKwWwQbwctJvHu8Pr1
	TdMcllObh4tiIFiMV5hy6Ofxz4loafFjY28Le4VqEtsUTw6mgA83lIDH4I1qLg9zIbOKbU
	DG96JuuP29S1WA2JFVr1YxohblAXcIPuyRxK3r7MP4os8BAN3YwT63HwKmE4mA/Zn1siS/
	V42CF+4dv6ww9tLFWzmq6nO3XVoJMTlxLEl1qfCart30qQ4CeWwTThBPbOjXCYqUigOWu6
	jTsEWgV8D5OATUfMLro4NMWQPhPbdPUPT6P2U/Ym51j3EM6Y5JUuAqwAOvN/jA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:24 +0200
Subject: [PATCH v2 7/7] arm64: dts: freescale: imx93-frdm: Add OP-TEE
 device tree node
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
Message-Id: <20260715-mathieu-uboot-dts-import-v2-7-bc931417bd0e@bootlin.com>
References: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
In-Reply-To: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=820;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=+pXpwbDFKXObiXFKtLc8N/VwCyU4CpbIpalQxRbGp0U=;
 b=lN2ZaiqEbAX/cIN0f3L0Arvnqur1xdhLKFEORJrLS7m5rMoK8eUkYlNss2SDzJZXtdUaNm9eC
 +vb4GEG30dIADPfINOUyWvwrI7PzM7/yQauEI0+LIp74yd7D7fo3u8f
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

Add missing firmware/optee node, so the kernel can communicate with the
OP-TEE firmware.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index bd14ba28690c..8aba7ed4c535 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -121,6 +121,13 @@ vdevbuffer: vdevbuffer@a4020000 {
 		};
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	sound-mqs {
 		compatible = "fsl,imx-audio-mqs";
 		model = "mqs-audio";

-- 
2.47.3


