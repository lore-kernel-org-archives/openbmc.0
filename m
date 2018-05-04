Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hSJB9fpA"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40cbt72vHmzF155
 for <openbmc@lists.ozlabs.org>; Fri,  4 May 2018 12:43:26 +1000 (AEST)
Received: by mail-pf0-x244.google.com with SMTP id q22so16268080pff.11
 for <openbmc@lists.ozlabs.org>; Thu, 03 May 2018 19:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=u2O2TuObOekSP85Ka9GSB8S4jCMwxvdnOvNsE9KqKvI=;
 b=hSJB9fpAoPI5h5f2WaOw589BQTkjkwjHcMU1QrQ+DDJRRNp69u5n6r0VPMmtVxpPnw
 y2r/Kf95/eBQQwgCpBoOaQqyDOuVhkVJYLzMzCoCCHyAclfvboX7zoSZ6XDhE90YH3Tu
 Txb9smg5UqPg0RXB6BGf09U2/VImh+w3AzVjvC/we5OATxdsbodR0kt26GMsxdtz8Zek
 2cF14UKA+HoCf3wDNIrG8dRxh/QnlCAJ3sc8R8gEVRS+POFOTS5vA5Y09fTe+wQnsrdF
 16+718/Q/LoVW6x9etBHJOADCiEVFkQ3xhlNFSnUwY59/JNBRKgPY842tLdkjpL4/84Q
 LnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=u2O2TuObOekSP85Ka9GSB8S4jCMwxvdnOvNsE9KqKvI=;
 b=IH820Rbn6ENc+G7j+KFRgSFOhnJGUXBAW/UYZZ6X1TJ/m6OQozMkL7K9vN6McKnfal
 LfiK7p8XcGGLtAQ9CA7p+65mJs63mzxgmz1y+iKRXwpEiyRyw0QAQaVmGGjF5q5A2dbc
 sC8xmuSClUPebLwRuwICyofoczO8ooGKK4A3FJ64W0dCVJJrb6BZI3z26KFIfAyzwjq/
 kO4p13Ab87yixD/+Q4e+OCXm0vDl2GqhFXJhO35UF/sjN4Py9pIjaK05wF2H3dl7l+Zi
 TG9nJvi/p7SExGXX+0RqiPb7KO7LwWxiymR6dQvY8XVxHF5r5flB2EWdRUIZBhFYcVym
 NAIg==
X-Gm-Message-State: ALQs6tD1VKwc8xdJXmRSunJCXSsKouFMv4KrqNts4gmWaQlpWMb6+D/w
 ZV9M45aQDdtLYY63zkbzRHnenZNg
X-Google-Smtp-Source: AB8JxZpEQQGd7DBiYukQ7rSbE69kenCIsDJnUklcHONDISrbRJSfeEYs7RgUMVJSoqNWRYOxkBw8lw==
X-Received: by 2002:a17:902:8d8d:: with SMTP id
 v13-v6mr11282319plo.362.1525401804108; 
 Thu, 03 May 2018 19:43:24 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id j74sm31353551pfk.25.2018.05.03.19.43.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 May 2018 19:43:23 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 04 May 2018 12:13:17 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au
Subject: [PATCH linux dev-4.13] ARM: dts: aspeed: Move random number device
Date: Fri,  4 May 2018 12:13:13 +0930
Message-Id: <20180504024313.19645-1-joel@jms.id.au>
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
X-List-Received-Date: Fri, 04 May 2018 02:43:28 -0000

Move the node out from under the syscon/simple-mfd.

Being a child of this node causes the driver to fail to probe, as
platform_get_resource returns NULL due to dev->num_resources being zero.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 12 ++++++------
 arch/arm/boot/dts/aspeed-g5.dtsi | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 3d391b428b25..50bc661b8fff 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -120,13 +120,13 @@
 				pinctrl: pinctrl {
 					compatible = "aspeed,g4-pinctrl";
 				};
+			};
 
-				hwrng@78 {
-					compatible = "timeriomem_rng";
-					reg = <0x78 0x4>;
-					period = <1>;
-					quality = <100>;
-				};
+			rng: hwrng@78 {
+				compatible = "timeriomem_rng";
+				reg = <0x78 0x4>;
+				period = <1>;
+				quality = <100>;
 			};
 
 			adc: adc@1e6e9000 {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 01b66359e6d6..e9e039a6407c 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -161,13 +161,13 @@
 				vga_scratch: scratch {
 					compatible = "aspeed,bmc-misc";
 				};
+			};
 
-				hwrng@78 {
-					compatible = "timeriomem_rng";
-					reg = <0x78 0x4>;
-					period = <1>;
-					quality = <100>;
-				};
+			rng: hwrng@78 {
+				compatible = "timeriomem_rng";
+				reg = <0x78 0x4>;
+				period = <1>;
+				quality = <100>;
 			};
 
 			gfx: display@1e6e6000 {
-- 
2.17.0
