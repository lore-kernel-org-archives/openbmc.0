Return-Path: <openbmc+bounces-2708-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25659CA5FEF
	for <openbmc@archiver.kernel.org>; Sun,  4 Oct 2026 16:12:28 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hySGG14CMz30Tm;
	Mon, 05 Oct 2026 03:12:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:30::f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791130341;
	cv=none; b=MPhHgWqAw76Y76cTfKRA+wku9p5fZNIAIjl0Cdi+FxdEnPjnfisab+bvGNVOLsp5PdcQNeoR1LqaFd86pVFeCL2A1fvcKdmPEQWDaW75PpiFgi8/kpoRmxzIdD6ZNqf/fT3z5MwS6jbWO/I6j3sdxCZBktThab+dTWb4CF68C31vRed0z+gC/cUBaQD4887clnO75smxPMKMZxhv8yJjisTnSqewPt9DNwZ1xKX4g5fGSF4iV+mD9iumm1GjPiWlXJP4b/z/or2FNhIzDBbiFbQoXou4sdrimTnDEwTNamI/1P+j4KdqzFyqGjTcOBwvLEgyO9AJ+WjQvP0uRk5eKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791130341; c=relaxed/relaxed;
	bh=LHAtp8jh3tg8sZgSTrZofD//NCXqUDMaM03E6Cj5aZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tfv/AN73c7NhSOcVwNWs3oKrfKy2AvVE6tvzQBwk3qHvoAFvX6fSkiXTnfvMusTWsWtQNE+XmkefT/WAY1EburyFRPJtYQ1UOcqhmB/crBhvMsa94FFM/TmRo6UpPhpdmykTIqhl/wo++n25WZs9xIHdnr3ERNDljuvus+rP5y91qdRBokIZ+0kKtzs90o8M33HqJ60KEKh9lHMN/wls8/UWSPJtYPQCco7+t6ijIy7hC1oVlYoCKmkTwByDabKTO5NQPxqddhOuUc3tHvAr5iNlLNZcQCEkP014QYafREufReg8qop6C0AevGVB36dPsWHqK3h69PQH7YJab3+T3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dy8hmetY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:30::f; helo=mail-wr2-x0f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dy8hmetY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:30::f; helo=mail-wr2-x0f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com [IPv6:2a00:1450:4864:30::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hySGD6K5Bz2y2K
	for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 03:12:20 +1100 (AEDT)
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4887840c529so281571f8f.1
        for <openbmc@lists.ozlabs.org>; Sun, 04 Oct 2026 09:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130338; x=1791735138; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHAtp8jh3tg8sZgSTrZofD//NCXqUDMaM03E6Cj5aZA=;
        b=dy8hmetYW3Dig5mWaIPvnjCtS8gd1gtN34PD+LxVszkRapeHUzq6FHOWnymThjl5RB
         vS3Bp+667CCB4i4DXKnvxE3Ccgx2TlK2Zv8QACyLKICHiTcAZarpGuEnxsCnDdftcC3V
         6TY4llVkkkww3M5AyhmIeZGGvrfNVE/hDqoJeZpDqum6HuZP+nbKbq27HnAIVYAUXW8V
         71UfAuglLn8Tod/x3hhW7lmNGY9WKZ6EJXxjZf1w/fXZkP131/H0oc4IQNnw0GL8Y8Ew
         q9WJ/vxQQHsOwl120zfIPkhQe/oQqoDf4D+RvK8yANdbTfnnZ8zN77K1F3bF8dJIqJew
         YF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130338; x=1791735138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHAtp8jh3tg8sZgSTrZofD//NCXqUDMaM03E6Cj5aZA=;
        b=p8o3k/I0TCJqoLlGbh6eiLVJ7bNCdV0gnVsdp4BDvJ1ekIAdj6mfpmEacM9c6l38+U
         AN0bcJPgTXRhdj+q9p1PF321hrN714Uvj0XC3pBAf5NNDn12M1pHSHWQS5k3cBOH3eAj
         R1mO4/h7fe98slXpwqf9qirw/MCgfwPCrLXASbVC3FCMHFfVo6I2H7E+XSV+0r4hhXl/
         b7FEN6NG/1RmneC5IBdLR8da/nGia28Ec0CAp5g1FxwltHoAy1pe9J3/+pcb+F5FJnQv
         lTsgAOI6RCENdLxzhk2bIb7W54t1N2soZ2QjfC/CtProZpHCsVnC0oNMZ1ZZ7WKI2qf9
         t8zA==
X-Gm-Message-State: AFuF++nXiNalx1YeIMNtRGcquv88OK2lvPcgKuPdBkZkP+0yq+/ZqMNd
	seJGRpLp2HX5zcdNzonvpy0+t7B8b6U9/FU2SpvBb9R3q0cReh3yxtz6
X-Gm-Gg: AYBFou3LLd2dKYvrJzD/55fpccb7JIn1k1PZMq75fyB8Un/vLykvxorkldDpMZOWbL1
	IIW5BIWPUQFNeRT1/mas5zdwLsTiQrIjIXLWM4YFfMqYhC0b07C+WEOqVufmexFPC6O4stHGw+L
	niAzHrxemQ8JyPdY5NeT8R3P+nJxR0aJSb1niOfcEwC1PHMlbQMHwP65/pJ+M43SXQ4plygBgCs
	/CHq7lgc1R42p3fdROZrl1d02K2jdbzzwZeBoortKHzLeTWXJdHGjablmu5JX9zWoILT68YkE3L
	vCaaNzjs0/wMYzu1ezVqji7sb5LQZKRfJJsveJ/13Qe8mZkn3/J4iWhtq4NSIyWAyJixml85ezI
	1cPUHvjM7KDSk30EP1ubCJdUwrQJZZQpwwPIwxoCRbuZST1h400B4ZBBUbiaYEeblpMrljznLO+
	2oeTrXAw9lInHSNucs9eqYkteGT0tJxiXp9XsP2p3twUhdv+UvfZmptijm1UfDlvHOEoHyjPF1R
	j2CvE3xRO+OYQcjSbXoFXlSh8wOV+1+LpgrrQ==
X-Received: by 2002:a05:600c:474e:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a0275758a2mr164184985e9.17.1791130337513;
        Sun, 04 Oct 2026 09:12:17 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:12:17 -0700 (PDT)
From: IS20 Tomer Maimon <tmaimon77@gmail.com>
X-Google-Original-From: IS20 Tomer Maimon <tomer.maimon+nuvoton@nuvoton.com>
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
Subject: [PATCH v10 1/6] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Sun,  4 Oct 2026 19:11:46 +0300
Message-Id: <20261004161151.803563-2-tomer.maimon+nuvoton@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
References: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
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

From: Tomer Maimon <tmaimon77@gmail.com>

The NPCM845 timer0 node references a single clock, but its clock-names
property is not described by the timer binding. Drop the undocumented
name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 35fa206..ab8a01c 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1


