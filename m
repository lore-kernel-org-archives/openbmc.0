Return-Path: <openbmc+bounces-2259-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736C9C44506
	for <openbmc@archiver.kernel.org>; Sun, 12 Jul 2026 01:02:33 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gyS282VPVz3brN;
	Sun, 12 Jul 2026 11:01:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783697951;
	cv=none; b=CdJnRxAOaiZeHS3NflS9j6jK4PimRVIxrQ5AconC1gS88dg1kxffncrQTazh9L9wk3SFLzGKySLrkyQys9m9ZTW7QLeq5JJLwH1ijcwYR7k3E6D5UuHwWTfHcHACa0tY9XfVyOE8eWsUYzKHxigopT8uSvp+BcGZZotKdPYBncRFTr0X3NDW9vTf0AujYoOG37oM/Tr4QninD0hCe7h7G4JZB5CkIUN0KIZqpXQCCdHTSfRSgBBtkXmEe2aHUIbCH1X+H06KUgTPhftFsDHgs0VdOiqELb9FYLvY0YAr4QtOEGCLyMvHcpTlb6YYQiI+oFTL7vs9kZd2+abvBa1n2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783697951; c=relaxed/relaxed;
	bh=IL51/pID62YlF9u7PwGo05/ugBph7LsRcUIyFPiTV3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUSiZx02ULsMHSasHw+a4nvJv81UUqtDM9PDG4Z8odVf0FmvkKN/P2MqYa6thILqs48m+E/REfb8MBYzzlwXFeNavOBAr5dMLoyekAhGYGhANPEr5f9WPBGju/XyVtldP4dT4WoL6Pnm3JgYN3oCLJHRmlXi0IrI4ZM1TozI/WFjvrqEfCfhg3R/Q7xXu+S3gL2r+o7Eg0F0lNP+gMCxEjigAbyDHhuqAPpXWa+tsJSUTfSi0+Y50IrWF/nTssWnUld1Fh9B6Mw0qkBHDrzEubGD1IEI0Q5bheQasktLniPGf6GJltWSADgEj9SM2RKUPZq760uUdTL/SIzgqFnZBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HF0LEBeq; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HF0LEBeq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 421 seconds by postgrey-1.37 at boromir; Sat, 11 Jul 2026 01:39:09 AEST
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gxbbd2Pq6z2ySg
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jul 2026 01:39:07 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 974D21A0F44;
	Fri, 10 Jul 2026 15:32:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6222360342;
	Fri, 10 Jul 2026 15:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFD6D11BD1C3B;
	Fri, 10 Jul 2026 17:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783697535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IL51/pID62YlF9u7PwGo05/ugBph7LsRcUIyFPiTV3Y=;
	b=HF0LEBeqbFPwdtQ2ye2HvoFuOANtYuL992/K1lVV9mhigt+dOmn45Vhczz23W+oDCmgjlb
	PGgY+LspJ3g8M7KusB2KT9+1VKQ5y4Q8j5PZhNswAAPNXJimdqZQA5KlJe3QL10lgCj1jD
	Rxe8wvM63OLLSe+eJIwsmDsfoZtfxzv0q4JVNvPNypRbW9MII57zrtZdjzF59oPkONTvwk
	mVgyg6roCmS+v84dL0z4ZpngyPHHjEwtsD0gyHmuLa44J+uQn8h5NIu6Ln/ptYoTAJLeZs
	0PVhrTicjvIaSvpAkC4JAl3w0lSMaGRA/9GRCdOKWHYwm0YeiTQdyXesIqbfiw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 10 Jul 2026 17:31:38 +0200
Subject: [PATCH 5/5] arm64: dts: freescale: imx93-frdm: Add OP-TEE device
 tree node
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
Message-Id: <20260710-mathieu-uboot-dts-import-v1-5-ffe0210e50c9@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783697511; l=820;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=+pXpwbDFKXObiXFKtLc8N/VwCyU4CpbIpalQxRbGp0U=;
 b=1/aCHPW/Jxnr4fVcgBIrsm2LS4ppfg9dk8CeOs8EuDYNNcADF9K3pjB8EnrT5KEOu8io8/+LD
 v7p+XTXWhztA84Hgl1oENLu1H21x1JfaHfmiAVFQaxuQAQwCA8peoPP
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


