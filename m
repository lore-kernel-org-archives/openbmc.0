Return-Path: <openbmc+bounces-2243-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D00C43458
	for <openbmc@archiver.kernel.org>; Wed,  8 Jul 2026 17:00:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwPTc74PVz309p;
	Thu, 09 Jul 2026 02:59:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783529988;
	cv=none; b=K0YfmMPu6PHNcT+XEcaefiCNV4EO+RADIO5KL9Mdo0+6t/7mB90pwrKr2bT3atV+A3ZF6+czq/HxjvY+Rte5Mvx3qK7F+OpczhfU3rs+PpRcUkvvDMNpUoxmWdIZCagcCXr/dSli4ZqGSUsQeGcJSPA8Wmc5iikgeBn5Wx1Pwg1+l5IMAnI/T5klrj/rLpv9/ZHZ1skJJC0k5o6Y0q7cs/TLOSDEd86H5Kc69eYynhK+4Nm1tph9GhFtXkbOEPIDaQpna47LsIVw6LERYltuQVNeCYbuuCdr7iiyfqtdC3faJG/MNRmzqb2+0VNeCvJXYIPdrqtC1H+SBWs8dyWlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783529988; c=relaxed/relaxed;
	bh=4ogB6BpMOolwSssmz7Py02Mc3pnlrio/s7I0rvFiSHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WnzIMIYJ0yMHIcoBaGCEgdwPfQRPPjiQjiXSFTGhDJuJTxSd+aYB1IfTm7QTntJK8Asv01K7kFx4pbh01eUtTlBwBpx9Hr1oDoLeIhX3QHOFNRSFc4jjlaC5qI180HLgcxIYcv2iZ0h1vAiNjeuYp9kNCn2qmYy8gHe+FWo9pUD9Qx8xCyf8LOED1UQPHRt2lVct5aFC+UH8BRvL7T7BJFNPd2VOTkyUO/TrLEURDHf7IPIK4404ttBDBNxzzxh88fmcXExI4vtAO5bxeja8rTdz01gwWbWrSfhy5THW6CT2gzNVf0YGMVkj97/5+D/nLw/vZu+sbloOnGxU4xjdug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NG22z0bV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NG22z0bV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwPTb05qHz3054
	for <openbmc@lists.ozlabs.org>; Thu, 09 Jul 2026 02:59:46 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so7432145e9.1
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529984; x=1784134784; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ogB6BpMOolwSssmz7Py02Mc3pnlrio/s7I0rvFiSHw=;
        b=NG22z0bV+HTWWe97IOGFrhuCXPOIrbJGZkQSFLKic/W9QviblmUPocakF9Ag46lAHe
         GMtdt+VjB0Fi31UXCnEMV4xFu4vDdpnSZxrQkt0x3S4nWlGgnRmI3ZLUCGz6uhSUPF8U
         JoUUW3oWa5mOEpFosqIfxICojbLNPuSjc62ptya7knEg06zgp3XRMsx7zu/nHJXd6zUa
         oe+szC9Y3RwpFzAaHeYwibEu+Om9eAbh6S0LbdCuUmrVgQjCNbaYSwKYAHA+QQs9IK6H
         nEGYNZPlPaxM1TBnQlvCvBnVkHnU+rstGVOi/G7vnVtbeMcfCc9DU0Uk24Jv4rjBlQIO
         0UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529984; x=1784134784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ogB6BpMOolwSssmz7Py02Mc3pnlrio/s7I0rvFiSHw=;
        b=mdtxthtq+ER8xywisRYeeS80xh1kQFrXTSG9Tu3jG4jHJgfKfkmk10W3diMIppSLt/
         +V8aeyelXeXFmX0dHPRmM75+uyom/J1fbaGcN0e3uSJNZcWks47hDLvWkP9CgB6PxYF7
         4zb2BpKEnpelTRd8ZYZFrt+1ILOEHD6Ng9GjNgF0nmK2wr7W3zVWIl9Z9QuYhDT1iCt1
         uEu4xEqeErYJYYUYq86WtZyd1jdAQvGQV/Rjh/H0qGDpBTsG4LYqh/mv0W0ipCkCQnjO
         xhTEmOm2ImHuq7xbQRTH4OuHuNX2Ns3xVUTN8QW7tvGdX4amePQOxVQcgBo71eZnEXW5
         SJgw==
X-Gm-Message-State: AOJu0Yy2fMAgPOhgYKH3FyJq4lXSSc+JsmTfMmRLKWAm87idlYNIRbHv
	2JcgotLSyzyvldnATWJvjE4jiOPGlHCAARUDOcpVME0aFmXaD9Vv4klA
X-Gm-Gg: AfdE7ck6JJ725VLZqQ3GNa8Yq74PkCS61I0XwxvWRHx6bz17CaDhX0+yLPp+d5qO3XB
	FfF8Q7sLRkq0zBn+ytJXZdlf7NzAscfW0Sc0SJk4NHdrE+xMsCLi8TAEDYzbYS3qcmaZs6Y39sD
	GxneZb/bMo/Fxv25rknzjn81dC+MZeChaWIUF2bswqpvNS9YT4uhcIkiO7COuLwmJPa3dU0Y1fa
	3wCdw5mSmCew45upLzS80bIC3OgQia8QIlK7g9s8zBXLNUsgCCYOq2OBXItw9iKTMgLvsFwYLbR
	F10FipwSWFENIpt1MJOMd/soCC59u7jDJP5OWXrN5u+p4E/9ObcU7NosT3lMhqvKmc2X8fCbH/M
	eXaML15SmrJn5FLdIz3iAG0Ws8VG72x4Tdf8iAcH4EAMRIfoXsomnCpZsg40V311dWpAmL52kpM
	nGGb+EBeDaBEpmpWUzFkmL3Qc=
X-Received: by 2002:a05:600c:3491:b0:493:c59c:94f1 with SMTP id 5b1f17b1804b1-493e7e82e10mr28566825e9.2.1783529983903;
        Wed, 08 Jul 2026 09:59:43 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faed92sm141201035e9.9.2026.07.08.09.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:59:43 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v8 2/4] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Wed,  8 Jul 2026 19:59:27 +0300
Message-Id: <20260708165929.2233934-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708165929.2233934-1-tmaimon77@gmail.com>
References: <20260708165929.2233934-1-tmaimon77@gmail.com>
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
Content-Transfer-Encoding: 8bit

Move the timer0 and PECI nodes so the APB children are ordered by
ascending unit address.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 9e4fa2669..545034ac1 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -59,22 +59,6 @@ apb {
 			ranges = <0x0 0x0 0xf0000000 0x00300000>,
 				<0xfff00000 0x0 0xfff00000 0x00016000>;
 
-			peci: peci-controller@100000 {
-				compatible = "nuvoton,npcm845-peci";
-				reg = <0x100000 0x1000>;
-				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk NPCM8XX_CLK_APB3>;
-				cmd-timeout-ms = <1000>;
-				status = "disabled";
-			};
-
-			timer0: timer@8000 {
-				compatible = "nuvoton,npcm845-timer";
-				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0x8000 0x1C>;
-				clocks = <&refclk>;
-			};
-
 			serial0: serial@0 {
 				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
 				reg = <0x0 0x1000>;
@@ -138,6 +122,13 @@ serial6: serial@6000 {
 				status = "disabled";
 			};
 
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks = <&refclk>;
+			};
+
 			watchdog0: watchdog@801c {
 				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
@@ -161,6 +152,15 @@ watchdog2: watchdog@a01c {
 				status = "disabled";
 				clocks = <&refclk>;
 			};
+
+			peci: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
 		};
 	};
 
-- 
2.34.1


