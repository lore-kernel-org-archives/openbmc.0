Return-Path: <openbmc+bounces-2351-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C842C55184
	for <openbmc@archiver.kernel.org>; Mon,  3 Aug 2026 11:22:03 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDDlD2HYkz3bpH;
	Mon, 03 Aug 2026 21:21:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785756088;
	cv=none; b=I5b+yiGnStX2Mi9diB7MsM/hJXVNq8K5nCqU0yItjv1HCU12d4zLIC4UTVIoDdnFHohT961qevtNpRD7lXgIHbwWcflBYSKzecUQsFgrVanIL8agIXdFvi/2YpUkGMyoTy7pfP70NlBjRV1AWMjB933aJ53vU2GQP8iw12cf2dwcKr1wVuzQq+/eGdWm05auDvbDEb7LI8pn5DpMMNMPuXXjUJi2eQCQzkA/uoUK664k8AQ0OAhN44mAcjDDsgU3N6n/dMZHhZPiWMAJuw+lsBEhwfvlgm5U1atUSuHElMqroONsSOKQ4pt+AYLSMtNKgkaDNhIZAN9sJer3dWqC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785756088; c=relaxed/relaxed;
	bh=4ogB6BpMOolwSssmz7Py02Mc3pnlrio/s7I0rvFiSHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NOviIVSanFmP0qmsEbthAQVa8jYMG66kfuZlj8nv+eUQ5i8jvOyC4zsNzG+uDhwBpYxX+C6N8Hw1/wXfhnc6F+R1HpSvkOCTyai2eX7c3AIBP3QqtUdSo/+n3UBcAu055QUMd2b7z0iMpaybjov4fuk5WpNwSgLDwhaX9cWkgWNaOK08GZyRNE3DCADNMetIzZ3yHjTF2g8RWBMSH1pecVxvkOO8ynaBb3RFQjyMHCAU41ptr8mvo9E3kqjCqZqbFyG1Qzn87CdXwBo6Iz3yOQU08OcjEo+7KpZ4Zd6jmMckjzW5QDsOzAlr9aJ63U0et4h/1M99o9vXE2C2ZDeFDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PQ37shsb; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PQ37shsb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDDlC2mW8z30F3
	for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 21:21:27 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47fd4ee0b01so2039408f8f.2
        for <openbmc@lists.ozlabs.org>; Mon, 03 Aug 2026 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756084; x=1786360884; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ogB6BpMOolwSssmz7Py02Mc3pnlrio/s7I0rvFiSHw=;
        b=PQ37shsbxWdO/Tha90dfsLbrPuL7a1TrHxWqfxGIwwjr1xJFvogO4quyHb1FncX+wb
         3fV5kZExajXd4l6Gshs2sLO6Q+xSc246rac71P5GL7RdminUJTu52niEuLBxKm5/k2jT
         hKlEFgtUmbKv/EUdr7QGl06OAIjNakLYjEnXZLm8/vFi86VnjCnnL2uIaNGvVZkEiUCr
         xyEHQTL8rOZ8RBxPiknuTPekSilV+Ej0e58XfRkwjs/pM94Z3uwdBDOpUBXo1+PUhWLl
         ECpv2Yz8QipCDifVaZNRvjF6M13B8Rnf23PsUYDY8JKiZyC/LS98wbpRS6uRujv2EvSg
         OI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756084; x=1786360884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ogB6BpMOolwSssmz7Py02Mc3pnlrio/s7I0rvFiSHw=;
        b=UmfwpdM7g44Ll2AcjXCWc+MzlEz/H/NxnQbJUMOBTCKCftKRdL4/rMYLdrNlVE6s+h
         ruU2FCaJB+MMNYGfEbLbjk3r8594mo3WVFbflCoeprRX8LHPZ/g4emowA1kwwOFljcIU
         4JC1y5++4FCaP9O4N8zdftfuVpIGVz3s8HXxxdusWAOmcxAzEDpC8C3svV6L4mPsyBCA
         XKrGT18qWwKlquxSKMLYuj2Gj4tc+57FpvBNhoEDTXFv36cqgyPt/7VRYIf1a6Kd9Sfk
         UgKUlJg1oBH+Y8OBeUNZ8cn9un48/NLYvtFCzBgoQIB1/IywZemFXYNA88fi87ETtRoa
         RBsA==
X-Gm-Message-State: AOJu0YzgF8sigciBtnIgu/dg7yIDj+NEPyK3p9/eZNxt0IQWg8Bo6DJl
	c5jYA9NopDm+FPqkwQRJAzUeRrsL3ASwRp2mcPKqXgQ3cbOLllYHe7/q
X-Gm-Gg: AR+sD120ySGVVTJU1SaIYi3aF/ymQ11qJc8Zu7GjfRh7ZgzQZRKqzb/cDy1asIQGUVL
	6LkxZhAEiDsKlUrD4GCodTXaGPuurIpYGCdb5QsFWh4sbGsNmckQ6H4BfMDVc1yW1lEcK+Mx1OO
	YUuB3HtORAeZf76j5DCVVPh2SsZ2lwiREtMGElF/PGnwqM6lIPQ9UAB1adda67MTfK6dobrmVT/
	Tm7pZps2hzKZr1+kmJsh414OHhxdvod+YX07yYbIFCUehB+tB2S6yJIS/G/FpQ9xdVXGkOoBx6v
	FbLSxzMXTrswsOUo4XIvN6TvJHhQ+XehzWwu8rzl6JCSW3W7CEfG+f/Xse8bxZNoUgL7Q6hZqmF
	A/gGFupJW0gcSjxMJsk6gTAbzW61SI2poMnbT2Dg57xjYOOoVzuP9+0FmShlO7KjZ4jykjL9qMo
	nGl3/9Hj7f4mus1F4yWTsD6xIjkTJBUEqV94fQ9YI4Ewu9H7TQYdHZyNhNsQhrb5yUoK2QyGZ+Q
	81gFozcVRU=
X-Received: by 2002:a05:6000:615:b0:47f:81af:1a3b with SMTP id ffacd0b85a97d-47fd72c4be9mr24887791f8f.22.1785756084073;
        Mon, 03 Aug 2026 04:21:24 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm34154913f8f.27.2026.08.03.04.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:23 -0700 (PDT)
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
Subject: [PATCH v9 2/5] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Mon,  3 Aug 2026 14:19:03 +0300
Message-Id: <20260803111906.1931384-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803111906.1931384-1-tmaimon77@gmail.com>
References: <20260803111906.1931384-1-tmaimon77@gmail.com>
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

