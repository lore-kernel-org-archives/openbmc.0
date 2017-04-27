Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD63W3k5BzDqG1
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:09:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="uwt2W7lU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gdJkN43X"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F8D220853;
 Thu, 27 Apr 2017 02:09:25 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=/LtrD/
 kZsv7DrJ1L3OEIBrecGLsDulT9c85shb0+asc=; b=uwt2W7lUEiATeKHwuWUdaG
 aQ9ItrysCcEGKTAyLwlIbXvekr3QxBY8hAWkGGrfRNTtcV7BS0xlR0ukN6iCmPdj
 Wmki6vErQuRb9VwC8LtzdIXebTIBz6/V18u1arS4ra9vO800RlbwnNEpNNaPl2yK
 JcplW2SI/e0CFbuPayVfceNTO0tc0dq3zj/UkbUu/8B8eObhqkn0TrH10ThDCIij
 Ks7dGrHzwIfTlf0k9DaOGbofaxRCCv7OGL+/+8rMqCerSPpn5kf03vNvnjC+aY+r
 gAYi9bYin/KMoHxjx/u8vEqlA2kLrSW1P7WLBg0QrIThJZKWxVSa8GJneWqSLhOA
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=/LtrD/kZsv7DrJ1L3OEIBrecGLsDulT9c85shb0+a
 sc=; b=gdJkN43XpDcmn16rBz8GrXQCHC3p+Sf9y/DtoUHFBeHP7t84307R/cyFo
 yYBkfiBeMzHtRJaGNLpBw51AwywmxZVH9ShRQU1xLQfrFseJtD+Y+shW83qQtHh1
 Ns+ZTPEMghHHMOCeYRPZN3uRCDMPfNez8Jf1K46GfcxdelpyKYhDw/9FVsTyenxS
 Dd0ytkCOTsL63eMuYbXUN/tF8/Gj/7CGxgbrRTk4Yg1ROPFE+lQqwvZZL5vqbiyl
 b8gU32bZu4H+0WKJwPojPNAiJDDzJp9PJ495ueTN5tH2G27dq0N2F9x+hXV7eLow
 YDlaXSs3BE62KXez/vNE3wiVar86A==
X-ME-Sender: <xms:FYsBWY394kWzSFBl9cZbTuqfgSroR4xi_1DHBNjiJ4BF7z54LHo7gw>
X-Sasl-enc: u2LhXL8AjDUrnj9my8+Ii6gV0fe3/kSsUmlr6TT5/7F7 1493273364
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3CB5624765;
 Thu, 27 Apr 2017 02:09:21 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org,
 mine260309@gmail.com, raltherr@google.com, xow@google.com
Subject: [PATCH linux dev-4.10 05/10] aspeed: zaius: Disable GPIO bias via
 devicetree pinconf requests
Date: Thu, 27 Apr 2017 15:38:18 +0930
Message-Id: <20170427060823.32226-6-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 27 Apr 2017 06:09:28 -0000

Given there are fixes presumably present in revisions beyond EVT1, the
special-casing done in the board file is implemented by separate
devicetrees.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/Makefile                      |  1 +
 arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts | 20 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts      | 10 ++++++++++
 arch/arm/mach-aspeed/aspeed.c                   | 11 -----------
 4 files changed, 31 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6127fd94591c..6102e7bd21ae 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -989,6 +989,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-garrison.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
+	aspeed-bmc-opp-zaius-evt1.dtb \
 	aspeed-ast2500-evb.dtb
 endif
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts
new file mode 100644
index 000000000000..21b87a5dbae3
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius-evt1.dts
@@ -0,0 +1,20 @@
+#include "aspeed-bmc-opp-zaius.dts"
+
+&pinctrl {
+	pinctrl_gpiogab_unbiased: gpiogab_unbiased {
+		pins = "A14", "E13", "D13", "C13", "B13", "Y21", "AA22", "U18";
+		bias-disable;
+	};
+
+	pinctrl_gpioi_unbiased: gpioi_unbiased {
+		pins = "C22", "G18", "D19", "C20", "B22", "G19", "C18", "E20";
+		bias-disable;
+	};
+};
+
+&gpio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpioh_unbiased
+			&pinctrl_gpiogab_unbiased
+			&pinctrl_gpioi_unbiased>;
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 73496c8d50f6..c6e58c5b4df1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -359,4 +359,14 @@
 
 &pinctrl {
 	aspeed,external-nodes = <&gfx &lhc>;
+
+	pinctrl_gpioh_unbiased: gpioi_unbiased {
+		pins = "A8", "C7", "B7", "A7", "D7", "B6", "A6", "E7";
+		bias-disable;
+	};
+};
+
+&gpio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpioh_unbiased>;
 };
diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
index b3aba87964bf..f73a72676437 100644
--- a/arch/arm/mach-aspeed/aspeed.c
+++ b/arch/arm/mach-aspeed/aspeed.c
@@ -124,17 +124,6 @@ static void __init do_zaius_setup(void)
 	reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
 	board_rev = (reg >> 3) & 0x1F;
 
-	/* EVT1 hacks */
-	if (board_rev == 0) {
-		/* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
-		reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
-		writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
-	}
-
-	/* Disable GPIO H/AC pulldowns to float 1-wire interface pins */
-	reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
-	writel(reg | BIT(23), AST_IO(AST_BASE_SCU | 0x8C));
-
 	/* Assert MAC2 PHY hardware reset */
 	/* Set pin low */
 	reg = readl(AST_IO(AST_BASE_GPIO | 0x00));
-- 
2.9.3
