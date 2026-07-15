Return-Path: <openbmc+bounces-2292-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36D5C4451C
	for <openbmc@archiver.kernel.org>; Sat, 18 Jul 2026 04:56:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h2Dxy543Qz3c9w;
	Sat, 18 Jul 2026 14:56:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784125394;
	cv=none; b=OLUnLHGcDQ1R49/Md4QPuKn/Hu0OfcmNWK7UE577Rg6c2czHq0LLiOvzWBCe4t2MKgNw8/wDyxu3zRQlEfEjF5hSbJQ8ayA4rND17lAwicTmR4tgKbdNBkRw7zbV99SftIzN7MXh3dEjuyFwQYQ7LAwtyFR8hTZpBhBaU9WBLK6MNywroUp4s34Gvp7RlWlxhSeED4hqYJnDEV+j5etqG1ro32Bldmp7rqm0Wd8IzK4oaIua9aPszAIOF8aqQtwsBIoyc7d32OuBHX+Y9IGnHMg2hLyi/1kln3d7TpQ6gjHEY91iLMw/9Qged4hZ7+p9sBNmhcFMmRZt2JaYf213wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784125394; c=relaxed/relaxed;
	bh=vqW9/RH3UDRT9Qj8/JqT5f9mnBCAvdontHcYO/WHgd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOL4kxJ+5YO7xNu29J39QWoQHf3BxDd+pyLZqcKlyYAdJnDRwfV8qXBewe517ynHiP0zSeO2OGMt0PVQWCQNHZh9SStRPLKXcx8VcSIGlKxIWFyClhIhmaCac4THsT+jhxVxp2lhWkMbaWIgV5ZQx1VnRugEWyXgWWEapQtzR70OFl7o4xkfH7lrPTjFQWP7C7khh8XjP2FsnhPjbICwcVd2jsevAM05gVE19arZUnDYvmF0JG6p2zzZH7urF31pxTJcyaAIKZsdHWixvbChK3b3KsxjNaJNe9USyMKIEpZMTuFds6eQ7zq7rFwRA3js/TunYPR9PmXyXhGm0fmXnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jCHh+5mS; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jCHh+5mS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0dgj3fFSz2yll
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2026 00:23:13 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2FF7D4E40DEB;
	Wed, 15 Jul 2026 14:23:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 043626035C;
	Wed, 15 Jul 2026 14:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B13B11BD3C48;
	Wed, 15 Jul 2026 16:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125389; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vqW9/RH3UDRT9Qj8/JqT5f9mnBCAvdontHcYO/WHgd0=;
	b=jCHh+5mSqWJGPEMJCW2ZdS+hBNKqYUUIvmvD/r5Z3kKVCIMpFuLVM7LglyXS3hYez0zC7Q
	lgzvKjHzRsoxs1M/J9LHI2G9OASSGx5lZRH5ch/3gt/URR5qdFew7QHX8zTR/q5gUCtA0y
	9OcCIG7xVLbiBzEyJabvO/aIrEpXIpFhlDSU+z2tEu1Z71DBTyWZWckBxBt6DlnFfvlgzV
	ozLJMv0Ex6uWKB374KCz01Laez/H+06iaNu4YYNW5ZpYRGy9sO7TYTNsqrIKTaDXPEkDqc
	3f+OkZLafYTvt/SdD/D9yfqWXLdcPbh/S8sJQIN7pBYSj9vorF620JhRi8qbMQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:23 +0200
Subject: [PATCH v2 6/7] arm64: dts: nuvoton: npcm845-evb: Import optee node
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
Message-Id: <20260715-mathieu-uboot-dts-import-v2-6-bc931417bd0e@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=914;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=IHC3taB/c1hjjbHV78+MpFaKPexGySK661G3gH5QQQ8=;
 b=bgWqx8KohO0XJrnfz+GLlQpVE6GEn8Z93UF4IF2roK3EhSVFxBk37S1KardQDiqfU77GWz0DV
 L/kDBBfUD2jDqGn7tTv+Br97x5FKS88gkcUNYqdJaY2vbbKnW65ABzJ
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


