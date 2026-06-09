Return-Path: <openbmc+bounces-2059-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23A4CD98C5
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 15:55:13 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZYQ60qpWz3bpp;
	Wed, 10 Jun 2026 01:54:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781020493;
	cv=none; b=IhEg0X56qCx29/6oONAlKROWUtf8UriKnIbtDE2JoaC1IIn6AgcAS8NTlw2iuEEVb+n0tyrzaZhtq52Rt79zQTd4JtfPcrd4GrF5tBGWwUuzSvptQZcC8VF+aQPPNyF0Xf1d2kv4qJ0aCwq4snYCJ1leT9YPgTHLCLh1ZAJhYY4s3t0Orfp8B2Eud5V8Gl6Dr92SwMUdb5quBSaW3HkxH/QX75aAX7j662IJjmygbMuPeNYO3wuR63TDZ+kpyJg6oE5YFWt+ixI6mCQBpLrjWULm9xz4xeKa1DSUcigiY43sFUuAjL07MdyKUIARha4swHuKNDquh3KQ0IP9kp6qkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781020493; c=relaxed/relaxed;
	bh=aWwFGlSUcw639N/YKTjCDkqA0Z4pIkuOoAAVpcehPeE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YSRE4MWxTWSEldpJ1qGP/BcyPp+dwe80C0P1Gt2SRDLNW4wo+Mhp/pPvJiI+kMDhVljQ5c/RcFwZo5ZFlTUIEWzmGxrWdp/QcGQs4zbo5t3liNL2TNN/KJJBdMfmlJmEQ08CPyDcwsMNJgegdq9Vs+1AlOtKoAb8jSveaTupMz9DLur7yBOVONnrhfYD9n1gPkmDU14GHlB+GZHXtUxL8ssB15FhWwoCHZz90Eog+7NxCMV9SOfbD1tMbNWl1SvHkXI1V9M5eBwmLKx7pXfoMysgBfO/aye8RV5Isp/BjYnELN94tXgyTBDCd8SrGDGNW4aqR7a8AmPheGdOUngYdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GseDb3Ov; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GseDb3Ov;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZYQ467jsz2xll
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 01:54:52 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490b64c8311so63973655e9.3
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 08:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781020490; x=1781625290; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWwFGlSUcw639N/YKTjCDkqA0Z4pIkuOoAAVpcehPeE=;
        b=GseDb3OvRLIiNiivY3WdE2Bffiq0pGsMqGu8wxpSsdR6O845X7hO7EbqIaiumKYSkt
         biidjm3alxDy8Wnym4QKxBaxAK4UgXz9PfGfLyGkoGQ9OHO6rcbX2eALo6tN88eV9qwM
         rOZNlQLP8/GMKhRTwv2tZCvxVdzuAFPW+GlkioiZ+nsdYNn24dS55H9fs8o2NnH6QZxT
         wA4L+Tg2wGB7HUl9JxSoIUqMyLkG7C+cQPmVnylUeBdtWE3MtxpQAWQS0KmOMINrC1ew
         mnS3YPUwVRiQJSb+1qZLYCk/OOdRbUWv77F0imRbswOYM4YNgURLPoElXwfnvXoq6RTt
         rPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781020490; x=1781625290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aWwFGlSUcw639N/YKTjCDkqA0Z4pIkuOoAAVpcehPeE=;
        b=oZVn5GV7uLepZmTu2ZRbK1CGwa3iKk7fOBltN7Df5v1LzTZlny2PA9GwYuPJumK3wA
         hZRqFU6KTJFWDpJ4NPZM/975MhHpvVYz4NOTXTJHTMKBR+j9Ryy4JQEy20knYJOGf7RL
         PCeRWTmHxDh0DimqC9opf5ekzAeWwNe5lqfvXmHSeWHMWTm3J++WPHTwZNkhs1/Vzsjz
         o39eerGYmI4W2weOqGCS99jUfoPGf+Byoeorgx+nk1lBhttFwXUCRUIXrWc6nc3qFFIK
         yAmL07nXGT1id05K7apX8mSPd7IwP20LxeYF+V5bQjjiCrZc6PmglbfhtPmvDL8UwsEl
         uPSw==
X-Gm-Message-State: AOJu0YzrgPRZSaDj7xWbc9CFelYIufTVURLgpUQE8RVFs6XqC9W57H6E
	JHF+YhwnSEGqwPiLUvLbNEQWdACE4g2LxiPSWXFc3Nmin/n098VLtngg
X-Gm-Gg: Acq92OFg7Rsn70HkW7LMM79qsxSUywXo1yKCuhaPM/C/qf6milSxBAT3xPTQt1lFcfB
	RetN7lWNVTvwy8kEFVSLYYBLRE5rrb/5k0cEH/4wqVV8FbAnOOoDhzX8fnOUj6q0NZbXXMUPIh5
	MVaAooRYIEmCbJVs7fqp4m4wGBlk60mRC/pcC/zvDogOdMI6sw9UXEezi+qTL7ddzS61O9Yu9mm
	j650eF0Gox3ACKaQvHTe9OQ3YbXVnMrEx3rsUI4rz+iG/VKLmZshU3U3iPSgTKuY7bAdTVnhc0M
	w+jV31VkaS6luk4ZcxjHEOT0oUhUaJP30b8BTS3B777U8cz8GU5QKMPLo4LfKUScG892uhKHHO/
	R9u9YYsu1rQjh+wXxXiwbJk54HzGg86dux0+oueUUW2RSQ4slW2JnJVxzOPCZT/kk1EZer2UUWL
	Nkkbbkjm+uSfuEFLIB9G/DcckW0o/Kw5ZBFS4O2YMdJWoH
X-Received: by 2002:a05:600c:458a:b0:48f:e518:d110 with SMTP id 5b1f17b1804b1-490c2614beemr300545925e9.32.1781020489356;
        Tue, 09 Jun 2026 08:54:49 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm545506645e9.11.2026.06.09.08.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:54:48 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v3 1/2] arm: dts: nuvoton: npcm7xx: Drop bogus FIU reg-names and clock-names
Date: Tue,  9 Jun 2026 18:54:36 +0300
Message-Id: <20260609155437.3285042-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609155437.3285042-1-tmaimon77@gmail.com>
References: <20260609155437.3285042-1-tmaimon77@gmail.com>
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

The NPCM7xx FIU controller nodes only describe the control
register block and reference a single unnamed clock. The
second "memory" name in reg-names is bogus because there is no
matching second reg entry, and the clock-names strings are
redundant because spi-npcm-fiu gets the sole clock with
devm_clk_get_enabled(dev, NULL) rather than a named lookup.

Drop both so the DTS matches the resources actually consumed by
the driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index ab3c3c5713ae..83cd10b47273 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -191,9 +191,8 @@ fiu0: spi@fb000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xfb000000 0x1000>;
-			reg-names = "control", "memory";
+			reg-names = "control";
 			clocks = <&clk NPCM7XX_CLK_SPI0>;
-			clock-names = "clk_spi0";
 			status = "disabled";
 		};
 
@@ -202,9 +201,8 @@ fiu3: spi@c0000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xc0000000 0x1000>;
-			reg-names = "control", "memory";
+			reg-names = "control";
 			clocks = <&clk NPCM7XX_CLK_SPI3>;
-			clock-names = "clk_spi3";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi3_pins>;
 			status = "disabled";
@@ -215,9 +213,8 @@ fiux: spi@fb001000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xfb001000 0x1000>;
-			reg-names = "control", "memory";
+			reg-names = "control";
 			clocks = <&clk NPCM7XX_CLK_SPIX>;
-			clock-names = "clk_spix";
 			status = "disabled";
 		};
 
-- 
2.34.1


