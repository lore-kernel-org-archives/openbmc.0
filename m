Return-Path: <openbmc+bounces-2064-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA0DCD8CB9
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 16:40:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZZPg4mbqz3bqV;
	Wed, 10 Jun 2026 02:39:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781023175;
	cv=none; b=T/s8WKruGxFTOIuL/KkPIjBTNnZCWD0sN3ZxfZRcNYH0Tf+x0s6WKPJcY/w8KG1GVBROZF/f9EfkeqlSXFwQFmos9fpPR8N0iwhhBsSO4Pln7N0L+043Ugf6upuzui0eM6HY2j9dWcC259LCqNoYZsqtuJqcmSPb2JlsIkyZYGqngFoxYAldSpEUdIQiTNreRAKfbP1ksre6KUmt/c3nJ1foguN4mv6MHcbkbaQ95fpLxF0S/4QyUQ5anOR5HCITpBIf4ZXvMqX5vgJg9WLV+9TPlQC4EEpY9J+lQqJrg5WU4ewx/4kdLZI8xOZjz7BhN3F4so8gpqzTJBWtzM4+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781023175; c=relaxed/relaxed;
	bh=IhKTkY+fAoMNRjsm960hiVmd8n0Q73fNbvw+JMhEZdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R8+Ilh0yDSvxi3cZLtWRavlLlp5azLnf0SdjQaBBh1vn80yRvlNG7SdN7nbBuBL7jJMczCpMaCkMkcxaKiy3IKhsf9QiwhS+dzfEcPCnluFQP3Ra1HJ2Y/efKsTvHFoC050ma2kiNuMPZKMskPse/aaty/JJk88DcvA2KNZ8eyYRPxd4gH1XGKEc0IJXXIx5j3hoXwzUupyd6m/Wsry9CQx0paRcvpu8T1fQ3CU+9zaqI7ACFgnpM7KPscto9Tyw6YhobbM5bLVuIOmM0QfXujr5IyQbwtiSHU7PYCGX/fs+ZmXR/+nYim6C0gslHZnkyl4MBhKDZdjqbFnklbXA+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sDFaTx1i; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sDFaTx1i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZZPf4S3zz2ytV
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 02:39:34 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490a76757e5so37932145e9.2
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 09:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023172; x=1781627972; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhKTkY+fAoMNRjsm960hiVmd8n0Q73fNbvw+JMhEZdQ=;
        b=sDFaTx1isplEbswhIWblcejmaUxlbDPe+Rrq+p893diZRXj52FbEOxzlw5NWsCed2T
         gWbsSVPy2Rr17UXVLqGP/hugSFZOuCVurQGI/ufHhrMS5Ky3QORiWCISY7huMSYD7mj6
         Ke16nrEBh8B9Ay+d1ffqUcje9s5BnZDL25R6PyW/0P+QKFDQhIstf4WBR7b+WVypugXZ
         nm6M68zSnziH8rec/3eElmN8wls2N03FQrpbxn14iNmo6VYfyPOE2R1OxBRmEQgG3rjN
         NZ0kv8TiJYojiqx8Lwyb6zOj/hAj85yQT523KaO9YJSRRNZmP5t9CHTJ7x/jP217HcqG
         Cv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023172; x=1781627972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IhKTkY+fAoMNRjsm960hiVmd8n0Q73fNbvw+JMhEZdQ=;
        b=KaCNQpXwoqUW6i05bb79OrOfvhRsNF4nPTGrRUT+RRoMeJZSVA6uJOPHvpxPwcjr7V
         JQ+843dMJvKP5uc3zPVw5Mk/y9qkymEYg56CHBkxBn2je2KuRDZvfYNKPM8SqbLiRqid
         MuEwO0KjKbb92F1HmkUBcATOQNaOFivR93aJDykAqLfubPatSM+cww1EoE5YSojEbcMk
         gFT6nHPbIa2IeOovkq1A0MEyR+M6Pz9daukeQl1+Z7lLKkxBfxDL2zqQ8NwVpIM3KEdU
         5aDRHFDb6erYdERzWAOpH1QWcB3qBjMBW5+APAL3a1jrXmyMRzfm93/czahdH8g5tsM8
         CdWg==
X-Gm-Message-State: AOJu0Yyb//SrWkziQ0caiuurZAzAMS42zMVWX1Wy9qonolO+Vdn6xehJ
	1vQ9NCoNU45E35NKL+N4jcUrm8YEEZAY4JMFwlpkJQgG2juiaruKpTg1
X-Gm-Gg: Acq92OHXldIyx7LWyi9jO2AFIJaqBR4NSBgbWQtaEI1SETbzZ/fW99xC25G22PaPcw+
	1TvyLBnXsZnLQa6e/EUT5j7vEFLMg9D31xAYThnF9SwdIKAMA6RXcoG3ipyINJBtmJ3kSpCjp6p
	INwyjOaPdOjxyVPONjELDDxs8L6bwzVVc3YAb6W9QqtVROGrC5b4pfmhloNdjz9Dx4+bdegVkzd
	e+Pajym3LjDypamj0uHOIQ5hOR8+7TTEqVn8RMBR3Dp4F3FDkrh5y+02kiD1A1O2oArfFfhZeEy
	e/MaKGakylP1qQV4/isfjfOLl0f7rCW5EMzRa4WIkSJAFQBEQsrkdfiHefI1M+zVScwKK/92qLQ
	tQzKuTYYZgahDowp5+tPC/hcUjdKlrvcxkYqmD6OrmaruUke3CQOK/DF+WEtLzGBNNtTsB+ijIz
	ulM5YAKQiejXHk4f7fk3ZCwgWy58ox1/KFUhS4aHE7n0SD
X-Received: by 2002:a05:600c:354a:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-490c2616e16mr347140765e9.28.1781023171627;
        Tue, 09 Jun 2026 09:39:31 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d2d11asm440860805e9.1.2026.06.09.09.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:39:30 -0700 (PDT)
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
Subject: [PATCH v4 2/3] arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
Date: Tue,  9 Jun 2026 19:39:18 +0300
Message-Id: <20260609163919.3321228-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609163919.3321228-1-tmaimon77@gmail.com>
References: <20260609163919.3321228-1-tmaimon77@gmail.com>
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

The NPCM7xx FIU controller driver gets its single clock with
devm_clk_get_enabled(dev, NULL) and does not perform a named
clock lookup. Drop the redundant clock-names properties from the
FIU controller nodes so the DTS describes only the resources the
driver actually uses.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index a16450abea0e..83cd10b47273 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -193,7 +193,6 @@ fiu0: spi@fb000000 {
 			reg = <0xfb000000 0x1000>;
 			reg-names = "control";
 			clocks = <&clk NPCM7XX_CLK_SPI0>;
-			clock-names = "clk_spi0";
 			status = "disabled";
 		};
 
@@ -204,7 +203,6 @@ fiu3: spi@c0000000 {
 			reg = <0xc0000000 0x1000>;
 			reg-names = "control";
 			clocks = <&clk NPCM7XX_CLK_SPI3>;
-			clock-names = "clk_spi3";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi3_pins>;
 			status = "disabled";
@@ -217,7 +215,6 @@ fiux: spi@fb001000 {
 			reg = <0xfb001000 0x1000>;
 			reg-names = "control";
 			clocks = <&clk NPCM7XX_CLK_SPIX>;
-			clock-names = "clk_spix";
 			status = "disabled";
 		};
 
-- 
2.34.1


