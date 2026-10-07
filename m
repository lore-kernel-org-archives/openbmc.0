Return-Path: <openbmc+bounces-2738-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ED5CA5FF1
	for <openbmc@archiver.kernel.org>; Wed,  7 Oct 2026 07:28:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j04Sn4wJBz3bNr;
	Wed, 07 Oct 2026 18:27:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791358025;
	cv=none; b=SZFW5jNTPclkf+KMrsJ5ZqBy81Bn3dXAP4dJgHfe2CZAzHmjpaN87nZ/sS2FCONkRmfxDBcysepbul3+cbWxtNbKD7wPAtlrh9sgJb6TaKfrV/qMtF1dVSVoNaEOaUK73j0q+7h83eEZvrL+/EQ8z4y5STpb+Mtl5NJD08Hc0C5DGgrEBSAexTptVv4NO/Ayj30HsuhYhyZJplWWpfag0Mbk9Agwo7AHiM5Er0maBK41qW4QhGpUxTzLWR9Zt7P2B+KEAyjIaGINfFQUzKpfPzgHT6Cdk4ogtKgzh1e76tIF8AzHk1dliHWjmiSkMbQ62EnHZ5ZdV7t/gU3fPHkF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791358025; c=relaxed/relaxed;
	bh=N93zwtvuEjpeUV4U8V8Lc96gQHGtAXTfWSzXg5QBVvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GmLv+6WdP9z+JFp31X5cIH0tAsqGQ4qgKrd5ObjX9wt0Pb+yMND47ZSEL0j0VVwuVe32J5MnDHORWxOuI3OPZSF3YPglFiCE1I4VavZoIPxmbDumvnEZ1ISCG+JiwzbNPUovEcN7tlyiD9zRymXyLfNEmbi2Ben1BTkOIHTEgnJSWXzI/MSWZMhdKVtIpN7K0AZ1n7IGYHY9U42eI27EUiJ9Y7t1/s5E7Drw3o5je2NqBk8EozeJXvp7XSC3wnkIu0QK9Fq5riHujgij/q6OUENxSJJvunsfhvkpL7N1OwEEbfSY0ivFK9VEJFBZNeTbeTl4S5QZhZxvXJZUvVsgWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FOSGEwCn; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FOSGEwCn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j04Sm47xhz30VV
	for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 18:27:04 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso12006615e9.0
        for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2026 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791358021; x=1791962821; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N93zwtvuEjpeUV4U8V8Lc96gQHGtAXTfWSzXg5QBVvo=;
        b=FOSGEwCnhnZsmckROZLf2MCxwwcJ5If4Zyuu15rDS7OhH0y30SmSRJN2vbISK0hu5O
         z71kPDEbrOfnzitgpiOunN6b+rpOnNtc5HX5dTpAgByC7ol+0wCBlpIIxQtQICEDzUac
         OJclFoYBMVrO9ZIs8HiaByxOPKrITVlUloUKPcWYTHzY2EFRnTHhUf2MgU2f5lOofhxv
         Mb7MmtCAtAS8a1PfklpT6OhkJVtHr892chAgrhn6XK2YNoD/+Qf0AqURmdW3AOQ+b3CF
         ND+mlA0Yo44PxpjxvDcehCtmB73yvLXqJdqfx2/6RY3ROxcO8Vfpu0sE2fOm2IGYSRN6
         XxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791358021; x=1791962821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N93zwtvuEjpeUV4U8V8Lc96gQHGtAXTfWSzXg5QBVvo=;
        b=LpzE2i2SqdiHysDFzJUeUExjI0w8Y+yr4Z/IxRKw5S/EZvOsphfvLpwOEIL8wnHFJs
         ++NESM07egdMj7dNrBiwOKW594mjTpgRdmRmWudHZRXXcWIUh+ZsM1mnoPz08nd9o2qF
         CxkF0ZV5iAgz5jhOf0taLrqBMwvaXicsHX5mbJu+QMIovZWt5b1WdoWAZ3DFFv5mOpEj
         Qn+CPY5kUzl5u1R7w3i3q8Sq6ugmuNPYbB5ARDhxWFgvVVbdWYK7rFdyRU5KtfbS9cy2
         Q64hRej1ps2gyAt7WBUOcTjPTiaIV4Uy52pJUYPQtJsdfLjFE84QS+9zAtKzWkw/vPGA
         P1jg==
X-Gm-Message-State: AFuF++lC7ANBH3f6bQbYCaJtQwTobm/6j44z4aWTrCoXOBoPK2Gjgp0f
	bWwM9/j99Ea3p8B2ACQkb+lbnORzYG/HgO0On6p3MMsvTqZWlS92ESfm
X-Gm-Gg: AYBFou3hKLSlNBtAQ9NobpNbA0rx1Rd5w4YYJMV5lm3NR4q81fBfQKUl8G2661Xil93
	Qowfvp48HZZj3vvDd5T+dp7V6Xzgul6cXYT+LcVUpVWTN6YejRSRstlWj+Apvqs2/6MtZYJtoKb
	7z27K5S0l1iZX+LEJ0WckuXUULcEI/AqbnsJCK9XAmKS4SN66z4tzFy9mgbLbhrlba+8Qgi9D/C
	Ao5MVy+FbaTqy3Gmeazoky90ygEcVpnUcDtKed+XWKjSaQUciRDDldBcntB3ZlmXIHMSCsfijBx
	nhhL+8hTbCSLa9DDzjtPN0ohfIWbH3d5NTPR/IdK6U2Ur8qxi+xIE6tKPPtpObxLqiA+h1r/de9
	9GO4sVTBzkoMwuxWfn5mFq5d7EHg1TsA47aSFfYNSXxF5+RmdzyBTLUPQnCxDDeqr+8mOV5L9DG
	QlkBTFWhg4mGxWUS8oWMzpdNy4jkgwrGKksT8Zoa+8wawtcYoMCtmUEPwBEjghucMOs4oenPbC4
	AtbMMEntg==
X-Received: by 2002:a05:600c:4fcb:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a180455c5fmr16716805e9.22.1791358021033;
        Wed, 07 Oct 2026 00:27:01 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm29912955e9.4.2026.10.07.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:27:00 -0700 (PDT)
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
Subject: [PATCH RESEND v10 5/6] arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
Date: Wed,  7 Oct 2026 10:26:44 +0300
Message-Id: <20261007072645.1618147-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007072645.1618147-1-tmaimon77@gmail.com>
References: <20261007072645.1618147-1-tmaimon77@gmail.com>
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

Reorder the pre-existing NPCM845 EVB DTS properties so the base board
file follows strict dt-check-style canonical ordering.

Keep this cleanup separate from the peripheral enablement changes so
the functional EVB additions remain focused.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 5edf5d1..2dc1a4f 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -5,8 +5,8 @@
 #include "nuvoton-npcm845.dtsi"
 
 / {
-	model = "Nuvoton npcm845 Development Board (Device Tree)";
 	compatible = "nuvoton,npcm845-evb", "nuvoton,npcm845";
+	model = "Nuvoton npcm845 Development Board (Device Tree)";
 
 	aliases {
 		serial0 = &serial0;
@@ -17,14 +17,14 @@
 	};
 
 	memory@0 {
-		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
+		device_type = "memory";
 	};
 
 	refclk: refclk-25mhz {
 		compatible = "fixed-clock";
-		clock-frequency = <25000000>;
 		#clock-cells = <0>;
+		clock-frequency = <25000000>;
 	};
 };
 
-- 
2.34.1


