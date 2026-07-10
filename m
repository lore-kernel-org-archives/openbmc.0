Return-Path: <openbmc+bounces-2256-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E71DC43458
	for <openbmc@archiver.kernel.org>; Sun, 12 Jul 2026 01:01:57 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gyS254x8cz309r;
	Sun, 12 Jul 2026 11:01:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783697951;
	cv=none; b=LqyFAO7t2qugRkuxqyjmL1YzEvHCvbyfnUgtlD2O1YyoCE6lay/dH+h1QiUtOBGOHa7isjqnfFLkFZO5t1qfKMpkgE9dgbqMzJGcC650PsSGWZu9+sda3rlxKcc3Bcvac6h4aNRxbPddbip6JYtBuqVsky8wfLbmEJkOJ4AOVj8wpRS0vRgDaFnN/LGWmbsvtehucS1D6apTp1eku2SZu4KryKhXTysHZ3FIH6v8djRdo9S+qCGPUw3vXVvd8Gfrv1U8M/sp8mdX0nFXyBM4H37UI+bjnw+nnMkLH8LthNEQmCIyxPrCWqaPYY4RDp8zvjR6sVt7MxTRN4b/l9QZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783697951; c=relaxed/relaxed;
	bh=tijUZy13OY+lpBLDlS9vMkTfAAXJmYkbRtFLhtiaaxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fy8Seuntd/IGbUejv242weVuyiT0gCwCoXEejyd9MN5oBPPo9O6TR+F8H/YsXxlmYa+AlG+qW8Fwonh/dcqPz2tbbf9sIuAQWbR9zQ2xzU81/V0LAjAweCOLc47G6WfENAbFErmxG6EXQninkWB7Nqr/Ijsx9qoHyczemDk1YezvQjXI12BAzwVCMj8Bexg8LiB0axxLawBNs02/JOcVbC88UfXIFfWliCk3yER7G+iO2UddPMxHrxJema6g0Njg7HGA0JeAXvwPGg1HlyYt5uFCcOabPU5oiQO+EDz0yFr9/o25ZF7fM9YjrOd7/dQ6z5AlMTnXsXcWyjftLwTLIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hwAgVCeP; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hwAgVCeP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=mathieu.dubois-briand@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gxbbd2qlxz2yYK
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jul 2026 01:39:07 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AA1651A0F45;
	Fri, 10 Jul 2026 15:32:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7AED560346;
	Fri, 10 Jul 2026 15:32:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4AF511BD1C34;
	Fri, 10 Jul 2026 17:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783697525; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tijUZy13OY+lpBLDlS9vMkTfAAXJmYkbRtFLhtiaaxU=;
	b=hwAgVCePQDdOl38e0eOljEd89vJodZTSjMwAfyub0tBhi8wgL60YINarvPdFNifjqc4Hay
	ceTIpKzHnDfeMeR7wY9RSh8WhGXVm7XIz58C6OL4aDAUCnFSyU48ccp9aha3S0r+NnqWaq
	XJmICvJiAZMcNDUtr7YVoDyC3LMFY3C4C7YnI2erAPvvoc3KC6iL7m/PEgS2Op5y9JKkBH
	2TBm2+HY35tPscFdW+23yUxaS+9c994VCDlpJ1fZx7Z0RaVHIB7nslZMbxewNvHmI6G+yq
	n6baH/qqOlkmwRsFVE91KvPmjOUAwyIVzwY8OHwLM6TN99Eb/DTOV7CpVuFXEA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 10 Jul 2026 17:31:35 +0200
Subject: [PATCH 2/5] arm: dts: st: Import optee node from u-boot device
 trees
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
Message-Id: <20260710-mathieu-uboot-dts-import-v1-2-ffe0210e50c9@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783697511; l=1640;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=BiSi1t1NUOIhyg6vwnL1alqPw0iJySL8ICnheLp+aN0=;
 b=B4vFTHfXQRbCBa4gp7JA6+tDIx0+dgYq3zVpsg/Yp9hnGhSOdseawTAnqzSZuqSmUUGkfkp9Z
 RLTUNtyzpweBZkiGIDn9hSzDhROdWHjROLOt7/ttWZPDtmoqRT6FT7y
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

U-Boot is importing kernel device trees for these platforms, but adding
a firmware node to enable communication with OP-TEE. Importing
changes here will allow to remove these additions in U-Boot.

Also import the corresponding reserved-memory region.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm/boot/dts/st/stm32mp157a-dk1.dts | 17 +++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts | 12 ++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
index 0da3667ab1e0..236da589eb90 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1.dts
@@ -22,4 +22,21 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reserved-memory {
+		bootph-pre-ram;
+
+		optee@de000000 {
+			reg = <0xde000000 0x02000000>;
+			no-map;
+			bootph-pre-ram;
+		};
+	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 49dd555cc228..7da726035086 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -70,6 +70,18 @@ retram: retram@38000000 {
 			reg = <0x38000000 0x10000>;
 			no-map;
 		};
+
+		optee@fe000000 {
+			reg = <0xfe000000 0x02000000>;
+			no-map;
+		};
+	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
 	};
 
 	led {

-- 
2.47.3


