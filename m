Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::241; helo=mail-pl0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UUtxluFK"; 
 dkim-atps=neutral
Received: from mail-pl0-x241.google.com (mail-pl0-x241.google.com
 [IPv6:2607:f8b0:400e:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQnG0NlzzF21J
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:22:25 +1000 (AEST)
Received: by mail-pl0-x241.google.com with SMTP id 59-v6so2434702plc.13
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 21:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=v2/D8rWjbzrWs2db401i5ok+2HPWrxJU9HMoSMK0wAw=;
 b=UUtxluFKOjLLDk8Ombsu8vxq1mZeDSEQa6QhpC5Cc1ZOpENKp42qKb/rx01g1Nzya1
 jvYbE1ebSfXy8uNOb1swtBnMCnBmJLacDsA7qw+ApqTNFzy4rqurjtEbmh4I7obcIg/m
 5/YmlU0FIOrMeRG1iw5bsEVkevGxdLDmLAEPiSn0B03oXUpxdwK+znm5GN9hUg6xhq5i
 qyRGzxAVJ1VJdaxCI+WOMrIMJIR2rkCeoqti9r9mUJJykDND0AecFJNm8TnahGWk/yVl
 lsolE5Axx4RITIGYIHhtcTkF5e1OcomT18PmPul0ZO3sxfpcq0NEDsWu1IBfNNKI4PMs
 2klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=v2/D8rWjbzrWs2db401i5ok+2HPWrxJU9HMoSMK0wAw=;
 b=sBQcn2+DB7gSr6Fa+VGLVU1d105shaBJ71SSjmUAuXzZ5nMGvI3u5DFFOCYwfyiCer
 YiMshsqQDWY7gXWBsD5Lx/dYrZ3DwHqp9nsNFRshKC3smNcpatqLm0UcmCUoobIgA6tX
 dK3AP5LxnQ3lLbOlMCUvfFHEdaIB4RcuSugXpISLo2oI4EboKON51SYc9N6BM1DsNHHu
 fYIL/og4jolINOB7S/yxOF7PTXhbCcm2NoYX1WlCDqExwlZDrThwrBCaUTLffTvN6O6q
 7JsTdmNOKFNyRSyNNkjyf0tEcZf5N0vrNW9bVWNctYdpZdcC3za/SkBzHWk6hwR8oRJ1
 ZWHA==
X-Gm-Message-State: ALQs6tBuZDK4hHKu1JPoIxR/HbEt6aJdR9hgtwgRSMnf71fdvzmaHs26
 BcWVmN/Zh+/UdHoBboYXD2EhPxsB
X-Google-Smtp-Source: AIpwx4/HQZVnNAy+aGnFMh3ZMhVMfsDNvhuynICNUImgOSbvGRT2swqca+IuTJ4LIk3hGvTfmcRBDQ==
X-Received: by 2002:a17:902:da4:: with SMTP id
 33-v6mr4591807plv.52.1524111743740; 
 Wed, 18 Apr 2018 21:22:23 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id m3sm5017830pff.150.2018.04.18.21.22.21
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Apr 2018 21:22:23 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 19 Apr 2018 13:52:18 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 3/5] ARM: dts: aspeed-g5: Add resets and clocks
 to GFX node
Date: Thu, 19 Apr 2018 13:50:02 +0930
Message-Id: <20180419042004.25168-4-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180419042004.25168-1-joel@jms.id.au>
References: <20180419042004.25168-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 04:22:26 -0000

The ast2500 has a reset for the CRT device that must be deasserted
before it can be used. Similarly it has a clock gate for a clock called
D1CLK that must be set to running.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 25a88dd44d91..4ca4bc463347 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -175,6 +175,10 @@
 				compatible = "aspeed,ast2500-gfx", "syscon";
 				reg = <0x1e6e6000 0x1000>;
 				reg-io-width = <4>;
+				clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
+				resets = <&syscon ASPEED_RESET_CRT1>;
+				status = "disabled";
+				interrupts = <0x19>;
 			};
 
 			adc: adc@1e6e9000 {
-- 
2.17.0
