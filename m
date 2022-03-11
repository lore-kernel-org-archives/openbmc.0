Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0508DC433EF
	for <openbmc@archiver.kernel.org>; Fri, 11 Mar 2022 01:44:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF7yX2gWQz3bNr
	for <openbmc@archiver.kernel.org>; Fri, 11 Mar 2022 12:44:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EAl/7Cig;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EAl/7Cig; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF7x770lJz2xgb
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 12:43:07 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id bc27so6216916pgb.4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 17:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GbrYLRy1W5aZewqUJiPpLaSO2PAR7xFlm0KF8fm8mKo=;
 b=EAl/7CigB5SVHJkwiwGkbitrg96A+cEiCSMckdj+NJiAGpCLvf664aUf1rcrLlH3L3
 DnDi7ddD/afc5MvPshGOGYdjCq+lG/xonM/1zH9eSa9ANdfmQ9Ui1BMzRCEclgwkD5Os
 yunus6AH+YVGHAhdZlsqDRh13OHFGRvxE3Zr7YVYbf/cYXsBNLL+M/HCov0/Ez0yo/LP
 S1s5gNKxpSl58YbFpXw6ZJr8aF6MmuOEhDi8a64FCCGznALoxPCdGY2U0faUxqws2Kdl
 pgqWCJid7aQR4+rYNJWTmsMdJlq7S4cak2QDikta7rVBXohwzKlDo9sEFLlNGeW0qVyd
 ijbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GbrYLRy1W5aZewqUJiPpLaSO2PAR7xFlm0KF8fm8mKo=;
 b=3A5JH2zfV4EUk7pwWOpZjtpyNJ23IlvMC1gxurb0zaogSvvf4USGlVnT0FtYVBL5TA
 PxL1C95gXBEWBUKpiuinBPBRnAnBftI1uYd/ll8uo4PNFu9Sd+OEoClANJSiQksid8G6
 r2znYgY6jAvdPEs8XRLhafix1hAP5yuIkxf8IwOFNlZp5nzrNc6nB+diDkIA3+yfgigV
 M/uYgfVysB3Cg5T1rYt+SkxcoB9BFGdhi3p59bZOl68pzP1cMYsp1Xf1TmSkImAYOGCz
 kH3qHY+oBIk48k7P5kIIAuTyrz0DYhtA6R1ieTHqa3OKrdDMzjYy7r8r4p2j5Vx8qFp5
 VEuA==
X-Gm-Message-State: AOAM5316qTRlxp2OtjqzAvjtXI9Z67sFEqZNcq8AsazdWX1LsHIFOx6L
 pIrqiY9FB6K3DWnaSl8AmqI=
X-Google-Smtp-Source: ABdhPJy0EmTMhPr3didLwQHpRflLIwW2lJsX4eanCr6kAJCQf4vaV84UdpC9oN/i/vbCkPKHn3t0Kg==
X-Received: by 2002:a63:4560:0:b0:370:1f21:36b8 with SMTP id
 u32-20020a634560000000b003701f2136b8mr6293000pgk.181.1646962982193; 
 Thu, 10 Mar 2022 17:43:02 -0800 (PST)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090a6b8500b001bf564e624esm7194383pjj.39.2022.03.10.17.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:43:01 -0800 (PST)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v3 1/3] ARM: dts: nuvoton: Add new device node
Date: Fri, 11 Mar 2022 09:42:43 +0800
Message-Id: <20220311014245.4612-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311014245.4612-1-ctcchien@nuvoton.com>
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

 Add NPCM memory controller device node

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..ba542b26941e 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -106,6 +106,13 @@
 		interrupt-parent = <&gic>;
 		ranges;
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm750-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		rstc: rstc@f0801000 {
 			compatible = "nuvoton,npcm750-reset";
 			reg = <0xf0801000 0x70>;
-- 
2.17.1

