Return-Path: <openbmc+bounces-1387-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CA7E9A047
	for <openbmc@archiver.kernel.org>; Wed, 18 Feb 2026 18:48:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGQWG2R1Qz2yrn;
	Thu, 19 Feb 2026 05:48:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771440490;
	cv=none; b=M+QAEYDcROChWjIyytCWniDXoFk6bzVSMCNPkIPaQAP1bRB1SisMyTEu9+u4OBtRSTkmyM/6Z4e8sgsQGckPRG2fB4NMH00O0oUB2xKACZX8FyCJY27NQSoZhXsafQo7wzB5mBxDNWtL6Bt2JbSRn0OtYf13mfle0CKVfRMavHmSW5136dfsINd1Hsj6MO0ygKgD3OvWWZrwVADqekLi+uRCntLWb4Vme1mDHyQFMoTZ5RWH998nXZFAPgXCaqow7m30wlnqwXequ5e3gEn+eJ0iY2RAgy/uyt6z+xZ1seFYAVAyFhLFyf8KE9d50CF2iQktGr6SOMpk2xI19K+4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771440490; c=relaxed/relaxed;
	bh=lBeRIT1ZnYSEgc/ip22Oe8Z70VaBVeO7A7faCs3mOuk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Orj7qD0/IJpkfqwhbmYhSaeaLT9lC5jfYeZ8niNimXjLfxDsnA90B2QyGzqsQRE1m/GMqfDfPslEZG5DjJGdse4U+vFWvTLtH21ncnFXGDg6kc/UeWnq5b6pZDgYGAVL/QtQTUI5fBQbJ+VfX7zUUKYsugRXhd/MhMM6FSUM+f6zWqW2ptWgmVF5tTAfMTqi050fgs3FtEIKIKr4YrUyVzLcv8JcWMpbnLmXBDlh/PpX8eb2FUFQLSkM33KCCOyFMjQgaSpGjxECz1wfn0srwxDTFuAaycKxzotOotzcTbN7Y1aX1VXJ7YGpQ2C1v9rvjF52ZSqd6t6ZC4NvtiWb5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=US08wFPu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=US08wFPu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGQWD2h8rz2xLv
	for <openbmc@lists.ozlabs.org>; Thu, 19 Feb 2026 05:48:07 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48372efa020so1236695e9.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Feb 2026 10:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771440484; x=1772045284; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBeRIT1ZnYSEgc/ip22Oe8Z70VaBVeO7A7faCs3mOuk=;
        b=US08wFPuRGDt5CgnoNmVyQtnMl0oZOaHOF4F4pGEc1UqgjyQ1rhqvvpVygnPtQQLWA
         /AyI0kvgbgXBO5AfCQmrvsBYCl8WX/9wxWGPjfOvYmgrWQD8FoccUxYWWpl32GuN3F1J
         h0Q30m6rgxtGD/cebw51i+ANqstu4Zejyoq5stvyEKLWADMgYZKvy8y8u6Y6HiD+1pKw
         ODywB9rvKqWCPA+Nt6Mkaz2XrYQhp3yERVmlkqbpkBDH3U0skkL34N6EAdD6XKidK1SO
         89P8ODpctn27ulv8xIVTsJ3jt6sS2gCTJNHv823si/Xu/WLzGmLFsWvcrHygw6QVJ3yE
         DZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771440484; x=1772045284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBeRIT1ZnYSEgc/ip22Oe8Z70VaBVeO7A7faCs3mOuk=;
        b=C4mcYHelXMfyncmADVV+bfPLMH3mLDJBczfmI1vMsUVgPSnByIxL5dodE6NViUEi2T
         g32uW+apMSOK3Hf1bUdtZkDiIW1RR5a2kpW5LjbA1CesUQPc1LtaVClvEeiYUbSdjUYo
         OKJB1YjDtRsqSQFzoBjgjGQToUd7CDq/isSdGwX10LeoFKHIUtTBqnI2gbsxOv+5VzmR
         5cPJTsL41mmwTO4Tl8qWQZkPDhV0R3on3wrArBlgd9+zjCU2ne8lm+LWxdlj8yavgbw8
         WXwCN+RL9qMHlx7jnI7wxFOybygZ5ZWudsgpo0g51DMLo9QKSR/KDQxJ42DKGTErVj3o
         J+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI5upmoVbxiMnVS94GO5CR2zT9ZVy4ooTNp8jiIeLgKaIIVvKarLdjGPSMRXme/umvlAbszhfd@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzHc6AarbaIG0ytaO9x9vZMO0fQ7RKseHKt+mCQH+IE5pQ1HmCr
	lqgZEDW2+59L1tk/hzZeY37Ekb3V5Be/eKTCAx5rNRxdU/S17lcH/oYe
X-Gm-Gg: AZuq6aJtvgCOEhlI8lMum2KDfJoDonGapU83XVCb0BeOggD7F0N5I6JYNz0iANcn48+
	cKcs6isW/SCbAUMJWPab76GTqGl9/tgbF9l1iUoiKUM7g2KRlsB/oJh3G1YOYEg6D8xTuz9dJAN
	gLm6+F3UIQF/Zn6nNji9Rf7JBc3F41PQMks+NSQCVeRvnAeEL08KJzbCmr/IUuK469BRtCXuxJu
	XRIEpul44Gl7BbJNBDu5YSX02Ql2F4cV6T1/z+CVIJaVL1QqZ6GHbly/ztmw9FOMv94n7X6mtaQ
	T7gUfKGfhMGoJ5BeKiKq0BllXAm0R4Soc2DU+k7fIX9F8mD7jOv5NF9f1cSSYMdKYB3+AOV4lrd
	6mm413AvW8J937VSVIhUXkJ6YYCkpN9NpcIHDD27UH4jFaW5/pauIYiq/0oE3uIGGPMaivnCpX+
	DDrIdPmR/Pu539KkeNY9l5ZK2f2j01ApZA8w==
X-Received: by 2002:a05:600c:6389:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-48379c1f4d3mr290728595e9.31.1771440483441;
        Wed, 18 Feb 2026 10:48:03 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837e565f5esm440990555e9.10.2026.02.18.10.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:48:03 -0800 (PST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au
Cc: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: nuvoton: drop unused syscon property from watchdog node
Date: Wed, 18 Feb 2026 20:48:00 +0200
Message-Id: <20260218184800.2261674-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The NPCM8XX DTSI currently includes a 'syscon' phandle in the watchdog
node, but this property is not used by any upstream driver and is not
documented in the NPCM watchdog binding. Since it was never reviewed and
does not form part of the DT ABI, it can be safely removed.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 24133528b8e9..c781190b42c5 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -145,7 +145,6 @@ watchdog0: watchdog@801c {
 				reg = <0x801c 0x4>;
 				status = "disabled";
 				clocks = <&refclk>;
-				syscon = <&gcr>;
 			};
 
 			watchdog1: watchdog@901c {
@@ -154,7 +153,6 @@ watchdog1: watchdog@901c {
 				reg = <0x901c 0x4>;
 				status = "disabled";
 				clocks = <&refclk>;
-				syscon = <&gcr>;
 			};
 
 			watchdog2: watchdog@a01c {
@@ -163,7 +161,6 @@ watchdog2: watchdog@a01c {
 				reg = <0xa01c 0x4>;
 				status = "disabled";
 				clocks = <&refclk>;
-				syscon = <&gcr>;
 			};
 		};
 	};
-- 
2.34.1


