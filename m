Return-Path: <openbmc+bounces-2096-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962FCCD98C5
	for <openbmc@archiver.kernel.org>; Mon, 15 Jun 2026 14:26:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gfC8m49xqz3c44;
	Tue, 16 Jun 2026 00:26:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781533560;
	cv=none; b=ir1b5PIqq5xyrZ9pAB+g7SbQq7O2BSohjRXJW1mFTKem23qMJb6PhKbn1JWBOlUVrcOgYr4QTtCsYSsCtNgtRFz2G89KiNg6jiYDqqJwJgW/aIOkBGZ9IjJpGfIzDAD9Eu/JcUlgqBZlW+Tkub+a1/sWWYFW271vbwfPZFgkunLm68luaKY8t7UiZ5Ucny7CSUKLWTlA2E+fzMkngVis93N/Folovdw54kMxbd1D2Et/WNFc8yoxW4RB6g7wcyzxw7KQxKJSt61liHb3iJGM9ycF5fYcvCFLQuIv7gJMgwHhsvvGoqTgCJ+4MC4JZVipzMCC+kx6+PZ9JOnbPYH8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781533560; c=relaxed/relaxed;
	bh=/NIxcJIu7VDuVVex0+dWXJoND3UMHyaLtOOKZ21zptM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tcvhamc+6vb9xUQZXibMX4ZmI7E+AAFYMBJj9SwMAYmDJipi/uhfxvpPFGxpPvp3cuePMGrZ6ZJ1gYnI15Vad+ZtGQTtYWASNAzrJWh1Zg+epDIC5jZjsQm0ODAV5jsTd4lHNAWA94cWbZ84zEsEItumY6//ucp/dhQeJRyrPulf7G5BxRSsJgXXJzVLVOEdTF/GULpdHaVMBArcAzfhH2DHE7j2gIiW5xwi6RII+0qTUucJOMA6GRAMI1cNEnvW6u/qoHtYE7K25MN0pP+c5Fk1GarVaXAdv8Xdx0CeyeDX/O3/uX/y9EBCWKOUHCyULdFq9fI17BPprkmxB2SYTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rW/mfxuA; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rW/mfxuA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gfC8l465Tz3c3s
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2026 00:25:59 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49222fb062bso24444015e9.1
        for <openbmc@lists.ozlabs.org>; Mon, 15 Jun 2026 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533556; x=1782138356; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NIxcJIu7VDuVVex0+dWXJoND3UMHyaLtOOKZ21zptM=;
        b=rW/mfxuAPoCS8mYgzBBCSQ4E/2SEu3ts7Z3wnKU73j1sxbzs0PW0QVu1Nfk2f7Y7CD
         AdBENfSiwmvGUpgQXwwP1Q8AZF85/HAHAqNuJxvYyGM7HeyXYNRqlgW4z+l4M9Q8YP/+
         tP84Vxdkhu8HPBWAKBQe/axjbH8/EqJ0rxsWjghuFN6viyX/ug76RmAQISL4rlPuUcdE
         46e16BnPP7Vp2O+wBZm48cjb9VuFOL0NmrbpH/O6WbEjfFJBA98uEwgkEdtAf7whDss3
         X9hB3x61btndO7YIIirKJfIltH8uu+wyv8lSxB+O7O+ZhfRcfn358IkXQ37GMz/CwyT1
         TfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533556; x=1782138356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NIxcJIu7VDuVVex0+dWXJoND3UMHyaLtOOKZ21zptM=;
        b=E2tT1SUXdLNT7RjaiJRoc4LqIIBxq4wTv5mJ2pOo3zyFXyXdr0QMzAb5iUFSnUpQK5
         z0Pm8ncO9sG5/zbqq1QDbemJg8P1feJhBsydScW9BZ3BCk0xMY8u28QXA4MuNtsjhLS4
         LjKvN518HsEvtQ5Zw2sEnqMjhsJMzaSH+3Xl32BISQ9cu66X0k2ig7kswaxvUtu+WmGj
         2Gfvu7dkzOMtozCdtV5ylCvxqwXTaWlCh79aXoeOPN1ZCrQkbOIf+ctXgTrdhxdBoym5
         4mhH/Adpzfzkr91+BBcdP3+NnZVDfTaiB5y/lWqpG2AUPdOsacHv/FMqVeFqfVPP930I
         G9gw==
X-Gm-Message-State: AOJu0YysB7AZxJpUVdbByBSXcRIqYEvM/Lonn1Hkl3ohYfbtq6QBj2WW
	68coVW1TBvRS6lYyq0ir9HHiu8Blq4ZvSQTTFLDqpQUqb3nZ9o4rP/e3
X-Gm-Gg: Acq92OHa3n1zLGjuepHVLsCaqSobUtIkDuTTi/KXADkCry4oowuRZh85D9FVld9U7tP
	2dWbZ4kbL4+7Mpw5+Ulicgb9ZZE6TRiDNf+LcM/dVwPe/YC9o3UdUyyW6P2ytPdRlcUVavbGfsG
	jxAWk9BK5OyheqEQdPcJMkGbDRG6XQ0mqIq0nmFZ+9L3fS17HyY/YMlP28h5sqqOML+Px/6Dh0K
	UvD8QTS6FTJJUBqeD5TIkhNIq6ss5sIhdvRHsr+tX0eSXnXhjYFwt0/kSJxb0Dp0t2/Ue7sGn/6
	a9OQ0uKjsFEiypr606dZoP67qS3WtdvDHjehCNT+hyVn+jXe3SgxvXqdp2y/GYN7yly8doQww2D
	Qz3HH2OkIet/XDb+96ZPrzXPm0gZONpfmubrKD+u4pJYVEYtxtlQkN8JgQRzdJsYP5XR53mVsfA
	P8Cq7EWinlDvq6vKyfbfzae5l2RRUAAZxH8g==
X-Received: by 2002:a05:600c:314a:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-490ec502f82mr160252005e9.29.1781533556289;
        Mon, 15 Jun 2026 07:25:56 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm273333205e9.2.2026.06.15.07.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:25:55 -0700 (PDT)
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
Subject: [PATCH v5 1/4] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Mon, 15 Jun 2026 17:25:45 +0300
Message-Id: <20260615142548.1373799-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615142548.1373799-1-tmaimon77@gmail.com>
References: <20260615142548.1373799-1-tmaimon77@gmail.com>
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


