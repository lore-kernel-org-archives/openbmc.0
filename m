Return-Path: <openbmc+bounces-2241-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C44C43458
	for <openbmc@archiver.kernel.org>; Wed,  8 Jul 2026 16:59:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwPTb2rHvz307v;
	Thu, 09 Jul 2026 02:59:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783529987;
	cv=none; b=BimzvNvCnCqbDAbuQ2dQRhHKCo2KpHV6HCPkJUpy7Qs3k2AMTeAQzdNwh2xNwva/ZOstSGvFKr+xqerPhLBLIK7grMCo/n2RVDZPhYNqy4T0zm+Y+FScTjUHG5UVvJVUs3iMZphG6a1RpzFICb9Q35bPBMHulqiaDBMuPLSHZyfWbjotTx51KNG9vurr0yL8R0w5UZKbnwbc5jd2ICPSwrFBJJ6VhEeos7k8PqdXKB48Yg4G1O+HdFNapGIJ+j5VwrCiqyVqVRF/HyKpk+oIkGVgCtkMvmus7vrblcAZAjCKsDReWsMhaduEKJ9hL7SRo9XZj4ZjaKAKKIuTkSCrpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783529987; c=relaxed/relaxed;
	bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OHom/NCzlXj06ULP+26zEVgCAfnY8FNgACfElxa5vES9NpS8WpC7pINACyqMb+v2KIFXWhNgXPueoBR0t0VU/lM3fccRvyhq2GfroZIWgIeIJv/MXAZY0GHcOPGY4LFFHHMMTTZg9oZRUjwd8cMvFUt4aP3XId9pNBo9skca/Q7fwbE9sGAz3QoNNpInWaltBT2+b8/JyD52Cv0/sV/Ly57XVMSMmWz20h/tAE5IaaAYIRYjTRDAtbvYDxp8r0LNvqjBdoR/eznF6j/w9ta5aEgImt0jENy2BV1PxHynwPeJutvb2xNKVEQ2ryI8EYKAKrX0UjRPo0fr4v5NaJgsig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RMwZk4kk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RMwZk4kk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwPTY15TMz2xll
	for <openbmc@lists.ozlabs.org>; Thu, 09 Jul 2026 02:59:44 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493c59f740cso6899805e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2026 09:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529981; x=1784134781; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
        b=RMwZk4kk1Qccs6XekvPaHZGxCLZZZcM8pO+YErXCvH1kYES+BK4TE9szgR77sBWglV
         B7/D8n+qVM3uB6pPw1O4CjBKfoCI+VULFrKm8eMce9eibGxOpfAGz+68PYKQtp6lJ4i2
         JDCVQ9rA53IvLHVzTg6I3s+ni1QfGe+blyGuJ1Zf9EdCeJZc02iPUZKFn/C4Vkp+LJhD
         hT1yQpOxyXw0dcrv6ugXjJlXtg7DKgY9uB3II+KWgWigRuZm+r9GNOk7/v1yUPIn8K6J
         TKstlw8238ULGD7Be3BpLO1mqorxDAkQg+GneWaL2Btnf/JURmCLxgRofru+Z9WK4pa/
         B1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529981; x=1784134781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
        b=GLx+4xtH47leixeood8T0aJIqZ+Va+8QncrmbidHx3wlRuTnjKn/xWkozxlO2R9v+N
         aWWbbMaAwQ6mGhBMw9uGctQpwkEpdU/8UWns0orNSYsU3ZKg7QrvGgUqz4AoYUV4QU8I
         x6gQU4J62/lNh+bp9eP2lxAuYil84q70liGTq7dUDCkMZ5CylDO5HeTcA9eemOz1mlsi
         GXEKTIt6AtXtsxhn/HS9lN9UIW2Lx+hI1XfTlzfcEZxOEwWeKeq/2RuXTa69XS7E1JDD
         uEy3yinSviEtQ59gSV2dlwM+pnH7kQMA1zD7iNw1yjHJhn1PjuEdLdH5EnAbPKjWynoR
         /wqQ==
X-Gm-Message-State: AOJu0YwzIlJ/werHDeadR4Mq5SZZPl2Wu8IamE0xv+onxNU2Fs+iaEKs
	uyvUKwryiSiS99xWvzwDOuWi8HUDa0EOBVuf8BDUT6Umqn62vzgp2gUa
X-Gm-Gg: AfdE7cnHEaV/7Xwq2EwpYkwSBo4FcETqtlbD8ciiMzF6WHuwtr4GbdKnsbj5O1OPnf+
	w+hnMOmGuFhhXCk/IiornWXOi3urqNszWsqKD38MjcCpmvdjALTK9JnlL5S7M+pDTz7WMGTIriW
	cPM2CxGoaAGVRNzKE9MdSQsQL4oH8ckQmJCYPWG7HfHLy8R3L6n06c6C3srKFniCTUNdZfs3465
	xgRQ1nUtHdIeBO26uhC2mnU5fmmozBCY2hWgazucjcyxy1Wv+OYxpiGw12TgSssTtgYQiDQLLx8
	Y0MnTnQO89S5itfAnoCYnC2E9NGHv5vlqEPH19IpPbn8Brat681bP1uWqVjWXLgnoaDDW7Otrd5
	FgvjRtItah1FZHV6OU1okB1owB44yAAyRKzIngCaF0gHrc5xkcyT02F6ye8iqaGHU9XYIPCHh0F
	FHDoTGvGXchN6FTHPuuq+WxAtYgGkAX2CMGg==
X-Received: by 2002:a05:600c:c1c8:10b0:493:c3c9:218c with SMTP id 5b1f17b1804b1-493e68cebf6mr29135245e9.30.1783529981380;
        Wed, 08 Jul 2026 09:59:41 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faed92sm141201035e9.9.2026.07.08.09.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:59:40 -0700 (PDT)
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
Subject: [PATCH v8 1/4] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Wed,  8 Jul 2026 19:59:26 +0300
Message-Id: <20260708165929.2233934-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708165929.2233934-1-tmaimon77@gmail.com>
References: <20260708165929.2233934-1-tmaimon77@gmail.com>
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
index c781190b4..9e4fa2669 100644
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


