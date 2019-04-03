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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZB276qvqzDq9n
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 03:13:01 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x33Fgls1025905;
 Wed, 3 Apr 2019 18:42:47 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id D09E863002; Wed,  3 Apr 2019 19:12:44 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-5.0 v1 3/4] dts: npcm7xx: add PECI support to NPCM7xx
 device tree
Date: Wed,  3 Apr 2019 19:12:41 +0300
Message-Id: <20190403161242.38159-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190403161242.38159-1-tmaimon77@gmail.com>
References: <20190403161242.38159-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 03 Apr 2019 16:13:04 -0000

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 10 ++++++++++
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index a24a06170660..04e842f460a9 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -341,6 +341,16 @@
 				};
 			};
 
+			peci: peci-bus@100000 {
+				compatible = "nuvoton,npcm750-peci";
+				reg = <0x100000 0x200>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				status = "disabled";
+			};
+
 			spi0: spi@200000 {
 				compatible = "nuvoton,npcm750-pspi";
 				reg = <0x200000 0x1000>;
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index d951ac997872..7728f7b69d13 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -492,6 +492,18 @@
 				};
 			};
 
+			peci: peci-bus@100000 {
+				cmd-timeout-ms = <1000>;
+				pull-down = <0>;
+				host-neg-bit-rate = <15>;
+				status = "okay";
+				intel-peci-dimmtemp@30 {
+					compatible = "intel,peci-client";
+					reg = <0x30>;
+					status = "okay";
+				};
+			};
+
 			spi0: spi@200000 {
 				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
 				status = "okay";
-- 
2.14.1
