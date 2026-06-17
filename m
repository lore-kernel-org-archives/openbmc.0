Return-Path: <openbmc+bounces-2113-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609F5CD98E2
	for <openbmc@archiver.kernel.org>; Wed, 17 Jun 2026 13:33:11 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ggPt739vjz2xll;
	Wed, 17 Jun 2026 23:32:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781703151;
	cv=none; b=K/2RC6DtmkMiKtpPTtNBClPu4sbOue48rIRHKiG8o3ECHfivxGUtVPxT0+mr5LMmwX5tsTdCysueWOy2e1KgJR5Ng4w7ELre2O0qkMkNBOBVVg2j9Mad2vORR+A3N9DAAVPK+eIgfps57pBW5TVDEiJnt2Ga45HN8g04fXVLT3QRwxXuoVOrXuj53OmnwJhN7aXF3IO6Tw9gvThES79E4fHSB5txbcp+t9yzdM78PuuIK9cP/doYjYF9RswaGCWkuFFY4l4YsoAIf5ZCPpRXwq8nHbI8mzq7jxBjpgsXKGg7ttdzQw2Gp8Hjhkii8pMaBWBB8zMjd00PNn13z2HO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781703151; c=relaxed/relaxed;
	bh=/NIxcJIu7VDuVVex0+dWXJoND3UMHyaLtOOKZ21zptM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HpJDNxB8W8WDeqiCpCU0J9jSRldnVRAkugQdbYOO30XttEfKSHdtDaumKIWbFCSMMUKBaHadfi9qF5oPKYVH+eY6+VBIeds1F685yjA5Lm67xgwfbM1EspV8+4TO8pAh6Pg1Q/8bf3hDKz7bcpgZGBTh4tGvO4REp3UCQT+U0NABS8Xm2uIrOsFjhdbEccS7dIlV2tCKGRpsT4IO5XzJzZixyzQ1gj4WiikDYh1oUYE0i8GzMeKNYyzlSoWiBpGZl2In4cNFuqUNfXrtzURpB6QMNjn0aq4fxP3KpmyDobRP64g5Pz1mwJKgLcAlT5CSw9PDFRSVv5FrDdipmaQnew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qrf+3R6O; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qrf+3R6O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ggPt16t91z2xC3
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2026 23:32:25 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490ac10e337so38991495e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2026 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781703141; x=1782307941; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NIxcJIu7VDuVVex0+dWXJoND3UMHyaLtOOKZ21zptM=;
        b=qrf+3R6OdPQqMaiS4PjezTwKqQWUiPeR2aYnWEp2NcpxbvEY6uq/w67Pw/Jk9gAJfs
         wvvJmv3h73SzOtmPhMFv7wPQ507gZyBm4l9oYEsFS/Y+2ekiaZk2u3hJCdlg0zfmk3nE
         HVJr5i3bRdAw8Tw9Qq3cETENi/spK1rP3aj+31RiQgVRZg/64Fgnr9BZDrMmc0X5a+2F
         BlZygi36RTf7W18o0+soXV+YnTNkGNEwmjoaoF0pf9o5jXSHK953G/gMxgLeXeIgSyJ+
         XQIiXja4O8jM3bTzKJd8rELZnCK8F5NhMNrMQkCBmXoZ2DQ9lvl+vdMtKPhJkWY3CqIe
         6BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781703141; x=1782307941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NIxcJIu7VDuVVex0+dWXJoND3UMHyaLtOOKZ21zptM=;
        b=E6Yn1yDeO9HT5728KiauLfbai7Tk90eQ6NmMZdzJaK+YIh3QI/gbOdHVhkh+GCwRHf
         x3CaM0m2lLIIltx6HIbU3FLIUINct5sInqXXKRv7AVfDz1S0SBdkqlAUX5MbKnEbhw2e
         5sHO9gMV2WJa0UqqgZv0sAzPMyUjYm8GuwIMa5M3uE0U6Bewo69nMzMlJWc9qBD07UuW
         LcP/V7PXNT04xUNlRpVSIndeUBDqq0IwMupz6uIAxSkocq5/M1mZls+g5LxRsgRjC1So
         Uw/i2LX16rZVkBLRQvAcZC7adVL0B8K6HWvKj5TyXgI9fv8CEvZg+iPYfKMs3KYpPRDU
         677g==
X-Gm-Message-State: AOJu0Yw9t5mCyGnM5XaZy0Tx8DH2ycqjNAWwxIzLeqprIiuzjtQUz4WJ
	hhxoT4bwTLueWlPodWUPkhnb+5p32ejHOrUBFDqVJNOy7RUyeaP9M0Bh
X-Gm-Gg: Acq92OF9CfXgxjjXK6r0cMHl+ukQAo/wWzKuqMZOwkFmnFBH/nNoEP7wGYpIS5SFzhH
	5QeKRy0BMRsc9Wi7f3VSa1QHdUTOZs5/cbJVnTmiFKGNhHGW/tqbOkRB6RVVlyCsNVF/WKUFkIj
	btc7EGWidGlfTbi7re5ltEM4tZkzM5p5526/y+tJXDOeYtEbpdiJwZkgv28CoqrhEdYhg86NxKR
	zXBamzmR+IwoaJub+nSlhdsS/w/tKfQ6ND6f0nDDdOXVJ1IajjjCt9iPrK+dBztiLoCH3/dl40b
	mkYNIPzZda74No+/W1vgCH4hjVC+qQjOEF+2tW6I46yhN+R32rVOXStXADQUNylCBmoz1PKA3sL
	mlcajwxJbEMU4UXzsvYG/0KGX47s+uCaKWe6Sip8xKag86sj7/YHuTcuiiv5bEXwc8BpRwUpUX7
	QcckU35g+lbUhtTDEy+e2EsEg=
X-Received: by 2002:a05:600d:84ca:20b0:490:c2a2:b1d4 with SMTP id 5b1f17b1804b1-492333f7f68mr50961245e9.35.1781703140793;
        Wed, 17 Jun 2026 06:32:20 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a0e9e4sm147795145e9.0.2026.06.17.06.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:32:20 -0700 (PDT)
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
Subject: [PATCH v6 1/4] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Wed, 17 Jun 2026 16:32:09 +0300
Message-Id: <20260617133212.287768-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260617133212.287768-1-tmaimon77@gmail.com>
References: <20260617133212.287768-1-tmaimon77@gmail.com>
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

The NPCM845 timer0 node references a single clock, but its
clock-names property is not described by the timer binding. Drop the
undocumented name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index c781190b42c5..9e4fa2669f4d 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@ timer0: timer@8000 {
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1


