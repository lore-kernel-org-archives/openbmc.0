Return-Path: <openbmc+bounces-2238-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69760C43458
	for <openbmc@archiver.kernel.org>; Wed,  8 Jul 2026 12:54:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwJ270cpYz308f;
	Wed, 08 Jul 2026 22:54:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783515246;
	cv=none; b=hHbu9546KQQz9obnAA8PZ0wDGWXBaQ6jIQRVVRKWjmQfkmBndzYXlg/imm+ipgzojwG/VVGnPUTP0w7hE9YoD4rM+UqsIEEfNmauvqhkW0B5aDPqUymtfs6HVk/RsrSLlOfEXx3VznZ++r/Sy+AQCQeMBH5iIapXf5n9nu5I/LqnzoGg/NFftMIp+pvl4bzKJD2IvqYWUIfo4afv38TXFZs182vz3jb4nth1P4JqFZ0wiIbj9P3RWCDpdwtMbMdbpyUX+o4K1uT4aDXTkt2MzKYtEaCS8As66GQUMQkPlfrvFq0QYTFCK95xsObxW/3bAWa9bqtjVtf3P5j1PtBJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783515246; c=relaxed/relaxed;
	bh=6Zs1qpHbMmmZvUssGtVaPy9WYFM8EnjkoIegyOM2GpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IQ7K4iNdWU2HSWVVi+jSh/dv6pvNA09TUQ9+zcD7AcdLVUNFTTriFHxfuha3au9hlORe6BAVrzk6XDg/q8zVzxFVYajcJ0lSxzJ7rD5dHGYEr4ftiJTrgjgq4uSYwSgv5PMt3aW95YlFyd+XNdgMnpW0S2gGf3lT2mSgeg29nX4xeb/QAq05jMT6Z90Sw1OPOP+Z0yDuNHWv5OykGXkz7hFMrA3KPvYIHek7CgQrQZ3zfaIf6lV8qDcltdVJj0cwVVIHewKd4zzdVv+D9E/hSoCWvx1f6qrDGsH8a9pxlmXm5n5dB8XnAx/ZDm2yTkTIwPG/efeCFUYStUjdW1wFvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WVbB/Uco; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WVbB/Uco;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwJ2603ptz3054
	for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 22:54:05 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493e497643fso3364145e9.0
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 05:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515243; x=1784120043; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Zs1qpHbMmmZvUssGtVaPy9WYFM8EnjkoIegyOM2GpY=;
        b=WVbB/UcoKaJKksJoe4R+fi+5A4phjI42KSESEArViuJ1aXbeuHVeRmi1VcZ8qZjHpJ
         YmubmIxvf1Vaq9+Yi701ujrw3+65bWSDX2LGRbIaF6OV+agUwfgSf7Dvm/P3BBvyU3JA
         r7IA42ZNq/g9HexeVdilwh7o1lR1YTb7cpsTkHhinylJJJaBOI7Yc3lcPeJVx7++RtP8
         vSeRyE13EhZX4qhkl3uY0VfZ0OLiE3QwuvMEPBbnBfdMeWJcasnkZHBrDXKPf4EgnafD
         v7E2z8WutM2QVObkR0EnXPB/0pxiRckEjIXkzjkDbpXMgVjN5nwbbKP+QlQFNzNZkqyL
         SRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515243; x=1784120043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Zs1qpHbMmmZvUssGtVaPy9WYFM8EnjkoIegyOM2GpY=;
        b=PVeG6mnTje1QpCe9dRPlc9s08sh10S9Fcm3yaOEUUv8Dpb3S2H0JfUl0wVw0aQ0HMb
         TmnPOLJyRHn1jD/oKeX1kqkuOxzL2X012B4+k8IrnblQJQVRM55076lO6FxBRTWK+QCO
         vlKec21RUtK6BRZqoLtGBMkc22Hrgy66ploRVr9bVschwI/Xru8XERWrxUcy4eDRcYWf
         P9TYCPpuWEUCKWwl8Z7rtUPhzwym0nxqS5TtWGMnfisCtYmlQk2u+9+v9/KuhWY8Xsf9
         GvTVYC1QcPN3jdlt5moL6GMgmegNSOCCe2G2XeDkVfX2URVcfQ0/Ze/XYsgWwLWKpdc2
         +/og==
X-Gm-Message-State: AOJu0YwQnp1oEQA26Qm88exvNYKjsZcuzdB+fEC7A/QCg9PLcmjx5Jx9
	Cdoq5eCjPkVb5rLGovzlDVlQLL6Oehy7k2gx/o7xMCkO4c725dX8g9mh
X-Gm-Gg: AfdE7ckvdy2/kuLOPYaxnSX4xRQPzuoY1mA9V868KsAwvoSLifMTSwXuBoWWgF4Iv7Y
	3jqldtElCebSM19KT9E/ckOZ62XmsQU4ZMprOMq4bdTfvTmi2Zi6zSszd/eq4SEJkDm9B1OZNGW
	3XrhpTAzLCXHRxFZRmAS9htQclnKwv2sR6gawSCvtxlW6kZLpBGJVHlnMocbp8IUVcNAIGfst9v
	rYwHIUjg1tbRh1tcNcFvDS6d9Wr/V+eTgF+sBCuNqJyR85ReTA+gL7cR1qNKKm+1SN+BxEXxQJp
	8+nhWYvKPaPHStsdstju6qjR9Eeyidx4amfq3dNAhnItADOkQPWPFpGTeGfDmGCUpgDOV76aDUU
	BXJ4APs2DCVL3QeO0IrjimWn1CAIq1iDoBPDKNZksUKkdw+OyKMoI0a6YQXtGqHYGjlIeDkaI51
	EncGakFpIREQxbb8VvtOwuK/U=
X-Received: by 2002:a05:600d:6444:10b0:492:490b:a604 with SMTP id 5b1f17b1804b1-493e68dbeadmr19525425e9.37.1783515242624;
        Wed, 08 Jul 2026 05:54:02 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3676dsm143824625e9.5.2026.07.08.05.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:54:02 -0700 (PDT)
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
Subject: [PATCH v7 2/4] arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
Date: Wed,  8 Jul 2026 15:53:50 +0300
Message-Id: <20260708125352.1915040-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708125352.1915040-1-tmaimon77@gmail.com>
References: <20260708125352.1915040-1-tmaimon77@gmail.com>
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
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 9e4fa2669..0e5feabf2 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -59,15 +59,6 @@ apb {
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
 			timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
@@ -138,6 +129,13 @@ serial6: serial@6000 {
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
@@ -161,6 +159,15 @@ watchdog2: watchdog@a01c {
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


