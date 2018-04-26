Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xp6bs7pT"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WgWz0Dl8zDqyL
 for <openbmc@lists.ozlabs.org>; Thu, 26 Apr 2018 12:10:38 +1000 (AEST)
Received: by mail-pf0-x244.google.com with SMTP id p12so883187pff.13
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 19:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=5MVCVcpbT000Yge8/C11s7284dCM9lIFHbbLbPaZHUw=;
 b=Xp6bs7pTNyiDRJTcGA2aYG0j/k5cGJ+EMLDvF81BVXH1/X25qIktC+48JVj2VEWDEs
 jfkWkrCXNtxY8diVEFnOkgcnjUnPUdcIz8mSM8qjtrwwG6AWqda/nxCF8jv072dn0HPL
 Mt8VUpFEUvNaKHFW3l4rpr6IZaWsAWhu+LDg7dDj89Q9XQXQGumy93M2Cj/bqukUpvV4
 GTabETG+2D+AKv/fwtfrWuooEZTyZ3KNrRwG9yLx3iHsKHQIceZuiEL1amYql0OTxMdj
 7So6SavpYDYS/hqpQ1PnAH7aCByHP6c4hY1PGDsw2+FcZ1xFoB/JgMAmsCV173tPIRQj
 5egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=5MVCVcpbT000Yge8/C11s7284dCM9lIFHbbLbPaZHUw=;
 b=s4+pqND1U0msonpbe4FRQgbjVvoBQzNRffS24Tjnp++IpftqkkovDkW80JGWtXkKSi
 R3jkP9YCdixoxU0dwhDuYujoge3yv2ahdBcH0vIrn915wPukh6ObQGrF5RnMhGc2K9zG
 rjYDGzkOA8EvnUZFr4ZA/KjPM5oK43tVSd1PShJI56Wkuy5gsdKsyR4BNa7eF7m6uNIB
 BZwAEiBG+2RWRd7r9Ji5aRhi77jKDHjm6Q8RzSiweY38V8GMYZ8IK1K07nNovUyvI6KB
 VPcVAhrCmfGAzittARJqpF+ocl77U3Y3OivQmWuLprGiPpOxgeooxd0mkybIjZk26she
 6lDQ==
X-Gm-Message-State: ALQs6tDh3zZl0GkKgrxd9cb6YGUPClKChKs8TLnOcLFmWTprN3Z+q/e1
 ELeuZIBsng1Gy7TzLX3WRGnRbiKc
X-Google-Smtp-Source: AIpwx495Vaz4Flh9jR60sRrhWPfZmtuCYo2ssgIJ/2DMAsQPPVgghHncqN/ERsJjIl4ENosJo6lpsQ==
X-Received: by 10.98.12.202 with SMTP id 71mr30043035pfm.61.1524708636226;
 Wed, 25 Apr 2018 19:10:36 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id h2sm37021373pfd.119.2018.04.25.19.10.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Apr 2018 19:10:35 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 26 Apr 2018 11:40:30 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 v2] ARM: dts: romulus: Enable the GFX IP
Date: Thu, 26 Apr 2018 11:40:26 +0930
Message-Id: <20180426021026.12548-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
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
X-List-Received-Date: Thu, 26 Apr 2018 02:10:39 -0000

The GFX controller is the internal graphics device used by the SoC
(opposed to the one connected via the PCIe device and used by the host).

This configures it with a framebuffer region and enables the GFX node.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix the commit message, as we do not output bmc kenrel messages to
the VGA device with this change

 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 00812a2fecf0..d746e562e8fd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -30,6 +30,13 @@
 			no-map;
 			reg = <0x98000000 0x04000000>; /* 64M */
 		};
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
 	};
 
 	leds {
@@ -280,3 +287,8 @@
 &ibt {
 	status = "okay";
 };
+
+&gfx {
+     status = "okay";
+     memory-region = <&gfx_memory>;
+};
-- 
2.17.0
