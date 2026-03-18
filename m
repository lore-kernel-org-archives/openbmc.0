Return-Path: <openbmc+bounces-1611-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B065D1088E4C
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 22:39:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbkKP0zCmz2yjN;
	Thu, 19 Mar 2026 09:39:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773862615;
	cv=none; b=BB3gKuflxs/jHCFRFzBmYVAG/fcHiXy6fDLqTovZBTv5GMVrHDNv2nO0QxYcOuwkaPHWb4EIA1dTnh8R+ZI9f8BGW83VZs4gvz0/wWmOo1LMLlvs5msiWSTKRYqU/DIA2a9y4MKs/FV82sn0eXFg9eamYKmoy2rS2t5eW1jVG8rcN+LurRZwbcMrZZ2aYOxVOvch5IcW66C0nwpZ+LKrxhmkRXOVaWo6UKhi0GpI/smMbZGc7sn97H73OK4xzwZ3JDubFMDMsa+6IW36J8RZXAnBFXiP/AQODQ5fXLUgtPbyga6/67j8E94xhOJEzgPK6LxRXAGcCvmJxIeYoOyijA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773862615; c=relaxed/relaxed;
	bh=qhe6Bw5swAXowEnRvu3RMufWPhEQIrULXXpRHTNF+tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKwZbMIjarat4IjqggoZLkDv6/Fe5ldiz93fpXDVuLd4ASqcVw8rvmFI/3O8V3q8Pe8aagOE/FhEHTTuPQ7sjxm3Goo7Iw3no5JWER+IZfabMPEgRTLtt1wLl/GvHDKuoAseXYrE/leRfLNjxK2bCQnoqoYbma4vVS6M/ptnSq46EYHj30e+z22fgL1Z9n4Qugx5UBVQkrCSd+MfI6TqWhJia6g0ay16lR3dyfDxNH3heGGJ16ZFLtfTAzsEHh9PxMhfBwsQUsAwxhGcLyd7kT8nl9l9HyJ8l5QUFb3jzUtdfN4ucioC4uCHmQ4tbyKGyGGaZEjvo78TJcHIsVDgdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lgZLXltM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lgZLXltM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=visitorckw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbfGZ4bq0z2ykf
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 06:36:54 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3591cc98871so163614a91.3
        for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 12:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862612; x=1774467412; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhe6Bw5swAXowEnRvu3RMufWPhEQIrULXXpRHTNF+tE=;
        b=lgZLXltMuUnJID/So+a3OaQwXilwZ6t63w6M+msKyBvG1zP9B4ThLMm2S4gPmM3rCL
         +rLWTMO/uAvpRKIpg9KNMzOlm0GT+JMVlRcC7TUeBVWSatlt5i3WO0xo/cDJEhD6lbiB
         WyTiS/QwjKcMeOfXpBp7A0RxARXvjh52hJL8gSejjnBTRxIzkdWjuxvX8AryZ1xL0Cew
         SeNIRKS9v1lcnNPOBYsJ/kHiwCoBthI92brkjFzC5gcoiiqCvSUZw43ritfSICA2Kaiv
         z8H8V/OsXZe+21zW0duS4vhKlCABfM0rlTwSUgvEXbqRxlg+d/pi+B3Gxn52mRxmt2NT
         SsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862612; x=1774467412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qhe6Bw5swAXowEnRvu3RMufWPhEQIrULXXpRHTNF+tE=;
        b=GWLenB7j0txlGjEgbjliaYkENErg2emob5yuXu6R/FiyIPYvyxb/gZK9BCsu3GPxp5
         hurObZxQfTYVDQjoatC8GGhrjmgxKYlSaIuH5K85KbIi2HD94TAJVa8hjfpcB4HLmEs8
         c+fkkcYtqc1FK2tmzFMYt+GryjQiLoYLVlDGJwZz6YnewTdf87PPFyX42Ix6qLAaAz4/
         d2nwiIQyPOlgM2+HrERnLYEdslAlDo2dh8mLySfVe0v7/TKtwRzSOFjWcgju/LwoQJ02
         KVHWMPPiGHkTvij645XZtrIvF98oo8hGYl7q8Sd/Ev9uL/3txbvOiYnYOs6nW2jCMTKN
         QwJg==
X-Forwarded-Encrypted: i=1; AJvYcCUAONeCRQ17737hie235wbaWKLQi59FA/g4qTpBXggU25W9/brSe3TGTDYKuvV5PVefYjmhFQ5J@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5d7eFMMryZxqxONCtImfe6wwJ04VWH00xymc2B7pAOZ8G41z2
	Ssu6GJ4U8J+bOwCnqbTYI5aPebHCs/eGE2fYDPGn5Vabxl/0CUILeN1S
X-Gm-Gg: ATEYQzxkJrt1SLhZFbFj8d7yDbC0uf6bX7MeC+E5pXy0owUC9e9xpSLHIvzl5WIg0GB
	9iTsCdFhh+qxPC0g9X2U/stpinC/odeQjWu23xdAfu2kBRSQQeBzsgY3sURBRCeo73BB8ChRhQK
	s/WCFbqNzd08JlOwsVA0/KmLeGoja3z0dYZh2vbSV6f3Jo+u4xg0+gkC2o7/nKRoUHtWUY1+kFl
	f6CqS6x4qYYH1BFAcKOFQq0AfMZz/SR79oC07QUL8Wc8QIEgsciqisKOVFjiJupHO+O+k4AqqjW
	1c/VAyzVy6tE6CEegu9ZmlEYWEfdpl8YIOz2Vpx7vNiKWRou++Axx3a9pQGVofHa2itWnyNSkzH
	YBli81uuwq31i24mYvUoRHs7BxjS5vv104fIRh/DTHr6SrcO6yin/g5p83DS0D5Uoi74AqjXrxI
	daOplNZnVYoOuo9YSlfXp2wYvoEeidfV0fjLx9Dn0eRbUGoGMhP3/BBE0lxDaC76leTblMsO36O
	PJuh5/DySnQ9C1aFKjeBHU5btegK+2KHrD9BM4=
X-Received: by 2002:a17:90b:184e:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35bb9e7d24dmr4153966a91.13.1773862612414;
        Wed, 18 Mar 2026 12:36:52 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9ff59a4sm1521664a91.2.2026.03.18.12.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:36:52 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 3/3] ARM: dts: nuvoton: Add OTP nodes for NPCM7xx
Date: Wed, 18 Mar 2026 19:35:38 +0000
Message-ID: <20260318193538.246853-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260318193538.246853-1-visitorckw@gmail.com>
References: <20260318193538.246853-1-visitorckw@gmail.com>
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

Add device tree nodes for the OTP memory controllers found on Nuvoton
NPCM7xx SoCs.

The controllers (Key Storage and Fuse Array) are attached to the
APB bus. Since they are internal SoC components with no board-level
dependencies, they are enabled by default.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index ab3c3c5713ae..8a28b1f8a4fd 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -480,6 +480,16 @@ &fanin12_pins &fanin13_pins
 				status = "disabled";
 			};
 
+			otp1: otp@189000 {
+				compatible = "nuvoton,npcm750-key-storage";
+				reg = <0x189000 0x1000>;
+			};
+
+			otp2: otp@18a000 {
+				compatible = "nuvoton,npcm750-fuse-array";
+				reg = <0x18a000 0x1000>;
+			};
+
 			i2c0: i2c@80000 {
 				reg = <0x80000 0x1000>;
 				compatible = "nuvoton,npcm750-i2c";
-- 
2.53.0.851.ga537e3e6e9-goog


