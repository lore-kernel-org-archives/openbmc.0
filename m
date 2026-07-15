Return-Path: <openbmc+bounces-2298-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08233C4451C
	for <openbmc@archiver.kernel.org>; Sat, 18 Jul 2026 04:57:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h2Dy30LTTz3cH2;
	Sat, 18 Jul 2026 14:56:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784125390;
	cv=none; b=OPzBEVnWLkL04o3/4capsT1nJFAo1c3J9zk5nzBEhvylpqsQZztqI8NIEolkno7N1LIJ8/0jNNk5+S06mFUmJd2rYCRRRtswmAsA5lXKVlQwedcgBSiLlp6QLru5cJnOcoRELGHF31HTw25naMZBm2YZrn0nS8FlGRWZabEetTmTu27QEswkSOO0WpG43RC9uIN30miy8N2wY2opLrFNeub728Rk1IuNPWgQIZ8JOxmqfWMtdmDKBT3z+XJYG3d+s+sP6JAQPxam1uyaqOs5OeGtXm6QkpvA36mCmksg/jd6Wgd8ygCh8JbzpJaS2atGH1JiYtALIyZxsfqCqGHEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784125390; c=relaxed/relaxed;
	bh=a9IuIIWMF3nn6MhJn3nVioRG/vLkyDShB0IZOzPkMNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRZaGmN6FTL18mm30YkKywystm0k+qGJgBpDeLbgGGhfAFhXEl3BUb/+3l22J8ZVIz2OeupoBsopDAvepJtQkfj9neuPy2CKk1jooN67WsMSO0i/LcDj2aOGTWblG7mXKB2vEhdotn2l8irPrZAbuhkvQmCafLR2bDi336WXl5YG9DxrYqu+Vh53krlNP+aWfQ+P//CmOOgqd/ggqXtCT40e5kmR80vIPG/5RMRa2c2ICdNIiezrVF9J5LuscwY4zuY3g9vh/c4EjIjKxL+BFuTx5vdWPTBNA9U2BuhUWKlpTVe7aYMwwrVsF7D27qRGkwtgP69c7zErvr8OweBkWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bpyJVEVD; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bpyJVEVD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0dgd5jDfz2yll
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2026 00:23:09 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 69CF2C2B9DB;
	Wed, 15 Jul 2026 14:23:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 769566035C;
	Wed, 15 Jul 2026 14:23:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A18FE11BD3C2A;
	Wed, 15 Jul 2026 16:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a9IuIIWMF3nn6MhJn3nVioRG/vLkyDShB0IZOzPkMNg=;
	b=bpyJVEVDRQcCuY7bgy4f1zEOx/PzX9swqY44GNzAO/Rxye/iPSn+R+3b3uiK3rKEaJ6NGP
	qqzBZn4hRodDBJYjRSRimupCI/zbro/5gVwCmaZQ2g/RAgARWEJSzVE9+x3iRS7sZ4XCQ8
	p0u2SFv+rk1zx0AK/4FoJnkfjJmWjeFnaDcmcXGj9fEY2Ku6Gsj5kXUEIqIq7wihHQl6fj
	CfzPV0qJUxvj85lAkoP6bKJYkwyricp2NjajB0I4KydKRxT5fFnYk5x9MS4y9Wbbmo0zFG
	Sc/mdVU3WiPS6tHV2Svbpm1V2p+867kBJiwsm7/Ae/QlZmhSn0lfPuU7GVnKIQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:22 +0200
Subject: [PATCH v2 5/7] arm64: dts: hisilicon: hi3798cv200-poplar: Import
 optee node from u-boot device tree
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
Message-Id: <20260715-mathieu-uboot-dts-import-v2-5-bc931417bd0e@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=911;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=bQvA7RaITKm0leFu4CsMz36juYaBIh9nm8WiAQHba6s=;
 b=Y2p/yYf552wB6F+3f88xBut8s30oCKUbtMj+A0QRzGsASLKbwSWWM+CqICzmC5KCUiWnWdGsv
 /IdpeHYxmBtBv4IFWFix7v9Twjws8P3Xd31cSw4WySJ9C9N/ahMDCWi
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

U-Boot is defining its own device tree for this platform. Among all
differences, a firmware node to enable communication with OP-TEE is
added. Importing this node here will reduce these differences.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
index 579d55daa7d0..f20fbfc1c954 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200-poplar.dts
@@ -70,6 +70,13 @@ reg_pcie: regulator-pcie {
 		gpio = <&gpio6 7 0>;
 		enable-active-high;
 	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
 
 &ehci {

-- 
2.47.3


