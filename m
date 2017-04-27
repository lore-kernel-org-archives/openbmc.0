Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD63N2f30zDqG5
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rr6Xlq/U"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TUhflhXT"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 49D68207DA;
 Thu, 27 Apr 2017 02:09:18 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=Y4jFRF
 ynVJTXh1p1vonypB4YxZ00CS5yZjE6SpOdXLk=; b=rr6Xlq/UBipj/8GdymvSWg
 /8cez6g2FqQRxwKUcaSzbC/TaZMHIcdZpQMi/2d9CSgK+1aNiNkSTxj2+5chOQMj
 EHKxyJ9GRNWvHLdwhUKnPc6++8ewVr6LDrOWsYLmEn1R+B2vNIPxKhdqnKshTLNA
 5QFDvyC58Ber5wG3CrYcUaIBgRwEFpcaWIIV6zN6bRvUhiKFs05n851PpMMrwl5S
 PqBKs3JWd+F1WJqdl3m24egiFsLYmWcz5ZX1O5xFk3rjsji+TEKmuTkSaup7YeJm
 CohsEVrbKYyo6CTmr0dPAesJ1jXmQe3uIV7tx+mV7vTovCHCMTFV0WCBYEl+T4pg
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=Y4jFRFynVJTXh1p1vonypB4YxZ00CS5yZjE6SpOdX
 Lk=; b=TUhflhXTjbbtuAQaA4UnvFlUdczDQketb0gnVkYfFQSugJNLjwdOU9NE5
 /4ZZTEK9fKlWkqUGZ3TR6oeYqaixa8CQ8gZY+mKUtor+/m+3m5a4/DdElXhtsW7Z
 P2IRqzSo3AIvvD6fR0HBKJc7MmV8nNsZOLdG3L2IPT977Zz6AFojNz3qf6O7PUVL
 nc7xqcqH5Lq5pGQxvjsa+yincfqh9u0uJkFcGZf7pTuST8KhxrsTFbuMDIt4V1Od
 K3jZvTNXl0S8PcJIx+v2naeuGt8g50xBg6qSHwVO4pUeGxFRSUcDYMkKP6V5JF8i
 vkFLG4Y/v64tgRTuyIBWnduegFOow==
X-ME-Sender: <xms:DosBWbZt31OmSkDAs6WuQ9Vc_dvUTGXiYIU7c3B6gpEejT-xeX_0Sw>
X-Sasl-enc: N9nfvgIshwDEeqG7XoTZQxwtPQVZ+3mdS9uqtyxMCLmF 1493273357
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id E4F3A241E1;
 Thu, 27 Apr 2017 02:09:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 03/10] aspeed: barreleye: Debounce
 BMC_PWBTN_IN_N through devicetree
Date: Thu, 27 Apr 2017 15:38:16 +0930
Message-Id: <20170427060823.32226-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170427060823.32226-1-andrew@aj.id.au>
References: <20170427060823.32226-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Apr 2017 06:09:21 -0000

This is a breaking change for userspace, as the GPIO is now represented
as a key-code from a GPIO keyboard input.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 11 +++++++++++
 arch/arm/mach-aspeed/aspeed.c                  |  8 --------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index b1a482144370..47a6167b8e6c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -74,6 +74,17 @@
 			gpios = <&gpio ASPEED_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		gpioe0 {
+			gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_LOW>;
+			label = "bmc_pwbtn_in_n";
+			linux,code = <0>;
+			debounce-interval = <20>;
+		};
+	};
 };
 
 &pinctrl {
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index 21084c72aee7..2333670f5c1d 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -73,14 +73,6 @@ static void __init do_barreleye_setup(void)
 	writel(reg, AST_IO(AST_BASE_GPIO | 0x20));
 	writel(0xC738F20A, AST_IO(AST_BASE_GPIO | 0x24));
 	writel(0x0031FFAF, AST_IO(AST_BASE_GPIO | 0x80));
-
-	/* Select TIMER3 as debounce timer */
-	writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x48));
-	writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x4C));
-
-	/* Set debounce timer to 480000 cycles, with a pclk of 48MHz,
-	 * corresponds to 20 ms. This time was found by experimentation */
-	writel(0x000EA600, AST_IO(AST_BASE_GPIO | 0x58));
 }
 
 static void __init do_palmetto_setup(void)
-- 
2.9.3
