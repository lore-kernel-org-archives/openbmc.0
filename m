Return-Path: <openbmc+bounces-2297-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85D9C4451C
	for <openbmc@archiver.kernel.org>; Sat, 18 Jul 2026 04:57:23 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h2Dy25h5rz3cGt;
	Sat, 18 Jul 2026 14:56:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784125390;
	cv=none; b=P801OOXnSSZnWuWcCgFrpRJoMsChoH2bHXCrXDtvhnQgXfXbjPr6qi0ITe5yFmrrzvZi7WcOpVxHrn3ZC38LdUz4/CAngY9TSF5WGETdu3tr0qxU8IJ6HDTO9ps+YtZN7MP8UaIqiKxh12f0e25RZ5VSMEt7ZHM+WRM3Rz4JvkifnYk5Gd00+WCOi+z3rRs6pbS5hYLLmrUqpJhZ7/+8rbWJ3DOm9+vmK9WITsJ+qbFE6LHxb6ccEBAcOBgTuAlLc/KtETDTGUBfjFbD+yojPa0qGXawvNFgvt2YiKwEXkvvjard2vjHvQVlN98A7k7fn336ZKyXgUiCWW/hs0FITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784125390; c=relaxed/relaxed;
	bh=yoILlpMIdQMG0h6z5e/h8NeegbfAs8+0w/UxB1yV3ZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTeI1ebwuXaj8yE7BN4hNJMclBoJ+sOzjWNws57Jud/WN2F+hjwIOZgcSywVUc0vsvmMOrnBPjkFESgBrPEO3XtWZMbUhOlOiZO1WEndV8Cs+CDfrN0qbIMNFdLWlQhM0bfbA7qD2QowikxWXoDd3SRNfyjqgbDSN1HcRLFvQLVhkM1oSijVQwBBOZeA9I/4snwJBaTLdjFco/eH9QienNIhIoh6ESwWBxWBjqStwbOu0tSYHGcj7JUg029mR/eaq/opRq8KUCwiKcV6gCNNGfSYOZLBh7NAklQrN4qwxb0/k7vB796K0eMdrzrge9xNRSTjYAWM10QgSPoKeJTiQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LBtXZzTq; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LBtXZzTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h0dgd2LkMz2yl0
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2026 00:23:08 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F1A944E40DCF;
	Wed, 15 Jul 2026 14:23:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFC056035C;
	Wed, 15 Jul 2026 14:23:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6556911BD3BF5;
	Wed, 15 Jul 2026 16:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125383; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yoILlpMIdQMG0h6z5e/h8NeegbfAs8+0w/UxB1yV3ZQ=;
	b=LBtXZzTqPsjY8076vvHsITNenZZhN3Ct1xGoOb4tKz94haxgx+p1EqHsM3Wht2WS6eCzeO
	W68OJBOcMBnh+iBIbTsSUCmw6agoaLFewyzwW5PVCSIC5zWuRoGD4LTMMJM3IimEB1j+bm
	SK4L8s7IFcfUZGtlK9sVg/sfMuSawx1Ww/tkUr3EX8oHFJwfmwfUUG91rtWRRITcs3vVXK
	zwgga9nsGKSxEb5HDLo6fHIfWvwS5ThqeiZR6nKM0Jh3I0ir74wObv20Uu+ypYe0b0WJ/6
	svnIx1LBPcYhyXLPnU6h+9dBcBPJeAUwedifWPCAAeNfQrgtxq7IAmNfdF7tMg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:21 +0200
Subject: [PATCH v2 4/7] arm: dts: st: stm32mp157c-ed1: Add bootph-pre-ram
 tag on optee reserved memory
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
Message-Id: <20260715-mathieu-uboot-dts-import-v2-4-bc931417bd0e@bootlin.com>
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
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=997;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=HOom1bxrDO/GHwXqY0qD5lhaVaSjF0F+dciyfNclTPE=;
 b=mAiPNP5DfX7wuIjQ0yqQikVNtsTgizsMceV5ShTy0brhE9vMlpuKroXPZBEr+g5pkuR/8K/S/
 SgNqYCMvu6FC8ySLhZY2pTwuzzquK0XVLdITpKUPiycOJreSa+OMdqB
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

Add bootph-pre-ram property to bind optee reserved-memory during the SPL
phase.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com?part=2
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 7da726035086..827480e9bf7d 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -34,6 +34,7 @@ reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
+		bootph-pre-ram;
 
 		mcuram2: mcuram2@10000000 {
 			compatible = "shared-dma-pool";
@@ -74,6 +75,7 @@ retram: retram@38000000 {
 		optee@fe000000 {
 			reg = <0xfe000000 0x02000000>;
 			no-map;
+			bootph-pre-ram;
 		};
 	};
 

-- 
2.47.3


