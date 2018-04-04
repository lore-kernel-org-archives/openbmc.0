Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40GNZY3qXmzF1qc
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 21:11:43 +1000 (AEST)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w34AqXfk020802;
 Wed, 4 Apr 2018 13:52:33 +0300
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id 8625F5AA39; Wed,  4 Apr 2018 14:11:06 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, avifishman70@gmail.com,
 brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 2/6] arm: dts: modify UART compatible name in NPCM750
 device tree
Date: Wed,  4 Apr 2018 14:10:58 +0300
Message-Id: <1522840262-21635-3-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1522840262-21635-1-git-send-email-tmaimon77@gmail.com>
References: <1522840262-21635-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 04 Apr 2018 11:11:50 -0000

Modify UART compatible name in a common device tree for all Nuvoton
NPCM750 BMCs.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-npcm750.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
index cacd0fde5914..286f139fdc7c 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
@@ -150,7 +150,7 @@
 			};
 
 			serial0: serial@1000 {
-				compatible = "ns16550a";
+				compatible = "nuvoton,npcm750-uart";
 				reg = <0x1000 0x1000>;
 				clocks = <&clk 14>;
 				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
@@ -159,7 +159,7 @@
 			};
 
 			serial1: serial@2000 {
-				compatible = "ns16550a";
+				compatible = "nuvoton,npcm750-uart";
 				reg = <0x2000 0x1000>;
 				clocks = <&clk 14>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
@@ -168,7 +168,7 @@
 			};
 
 			serial2: serial@3000 {
-				compatible = "ns16550a";
+				compatible = "nuvoton,npcm750-uart";
 				reg = <0x3000 0x1000>;
 				clocks = <&clk 14>;
 				interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
@@ -177,7 +177,7 @@
 			};
 
 			serial3: serial@4000 {
-				compatible = "ns16550a";
+				compatible = "nuvoton,npcm750-uart";
 				reg = <0x4000 0x1000>;
 				clocks = <&clk 14>;
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.14.1
