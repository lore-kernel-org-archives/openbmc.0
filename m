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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43SsyX2HJ4zDqDW
 for <openbmc@lists.ozlabs.org>; Mon, 31 Dec 2018 20:51:15 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id wBV9L33g000538;
 Mon, 31 Dec 2018 11:21:03 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 7275962DA4; Mon, 31 Dec 2018 11:51:01 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Subject: [linux dev-4.19 v1 3/4] dts: npcm7xx: Modify NPCM7xx device tree
Date: Mon, 31 Dec 2018 11:50:55 +0200
Message-Id: <20181231095056.86234-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20181231095056.86234-1-tmaimon77@gmail.com>
References: <20181231095056.86234-1-tmaimon77@gmail.com>
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
X-List-Received-Date: Mon, 31 Dec 2018 09:51:17 -0000

Modify NPCM7xx device tree FIU, ADC, RST, VCD and SPI nodes
Add regulator and HGPIO pins nodes.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 182 +++++++++++++++++---------
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     | 157 ++++++++++++++++------
 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi   |   4 +-
 arch/arm/boot/dts/nuvoton-npcm750.dtsi        |   1 +
 4 files changed, 240 insertions(+), 104 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index afe0d3cb516d..73ec9649204b 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -5,6 +5,7 @@
 #include "skeleton.dtsi"
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	#address-cells = <1>;
@@ -74,7 +75,7 @@
 		rst: rst@f0801000 {
 			compatible = "nuvoton,npcm750-rst", "syscon",
 			"simple-mfd";
-			reg = <0x801000 0x1000>;
+			reg = <0x801000 0x6C>;
 		};
 
 		scu: scu@3fe000 {
@@ -144,6 +145,7 @@
 			pinctrl-0 = <&r1_pins
 			             &r1err_pins
 				     &r1md_pins>;
+			status = "disabled";
 		};
 
 		ehci1:usb@f0806000 {
@@ -213,39 +215,39 @@
 			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		spi0: spi@fb000000 {
-			compatible = "nuvoton,npcm750-spi";
+		fiu0: fiu@fb000000 {
+			compatible = "nuvoton,npcm750-fiu";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
 			reg-names = "control", "memory";
-			chip-max-address-map = <0x8000000>;
 			clocks = <&clk NPCM7XX_CLK_AHB>;
 			clock-names = "clk_ahb";
-			spi-nor@0 {
-					compatible = "jedec,spi-nor";
-					#address-cells = <1>;
-					#size-cells = <1>;
-					reg = <0>;
-			};
+			status = "disabled";
 		};
-		spi3: spi@c0000000 {
-			compatible = "nuvoton,npcm750-spi";
+
+		fiu3: fiu@c0000000 {
+			compatible = "nuvoton,npcm750-fiu";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xc0000000 0x1000>, <0xA0000000 0x20000000>;
 			reg-names = "control", "memory";
-			chip-max-address-map = <0x8000000>;
 			clocks = <&clk NPCM7XX_CLK_AHB>;
 			clock-names = "clk_ahb";
 			pinctrl-names = "default";
-			pinctrl-0 = <&spi3_pins &spi3quad_pins>;
-			spi-nor@0 {
-					compatible = "jedec,spi-nor";
-					#address-cells = <1>;
-					#size-cells = <1>;
-					reg = <0>;
-			};
+			pinctrl-0 = <&spi3_pins>;
+			status = "disabled";
+		};
+
+		fiux: fiu@fb001000 {
+			compatible = "nuvoton,npcm750-fiu";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xfb001000 0x1000>, <0xf8000000 0x2000000>;
+			reg-names = "control", "memory";
+			clocks = <&clk NPCM7XX_CLK_AHB>;
+			clock-names = "clk_ahb";
+			status = "disabled";
 		};
 
 		pci_rc: axi-pcie@e1000000 {
@@ -271,17 +273,18 @@
 		vcd: vcd@f0810000 {
 			compatible = "nuvoton,npcm750-vcd";
 			reg = <0xf0810000 0x10000>;
-			phy-memory = <0x3e200000 0x600000>;
-			de-mode = /bits/ 8 <1>;
-			interrupts = <0 22 4>;
+			mem-addr = <0x3e200000>;
+			mem-size = <0x600000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
 		ece: ece@f0820000 {
 			compatible = "nuvoton,npcm750-ece";
 			reg = <0xf0820000 0x2000>;
-			phy-memory = <0x3e800000 0x600000>;
-			interrupts = <0 24 4>;
+			mem-addr = <0x3e800000>;
+			mem-size = <0x600000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -352,13 +355,30 @@
 				};
 			};
 
-			pspi: pspi@0 {
+			spi0: spi@200000 {
+				compatible = "nuvoton,npcm750-pspi";
+				reg = <0x200000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pspi1_pins>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM7XX_CLK_APB5>;
+				clock-names = "clk_apb5";
+				status = "disabled";
+			};
+
+			spi1: spi@201000 {
 				compatible = "nuvoton,npcm750-pspi";
-				reg = <0x200000 0x2000>;
-				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
-						<GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x201000 0x1000>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pspi2_pins>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk NPCM7XX_CLK_APB5>;
 				clock-names = "clk_apb5";
+				status = "disabled";
 			};
 
 			timer0: timer@8000 {
@@ -438,10 +458,10 @@
 
 			adc: adc@c000 {
 				compatible = "nuvoton,npcm750-adc";
-				reg = <0xc000 0x1000>;
+				reg = <0xc000 0x8>;
+				interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk NPCM7XX_CLK_ADC>;
-				clock-names = "clk_adc";
-				vref = <2048>;
+				status = "disabled";
 			};
 
 			otp:otp@189000 {
@@ -453,7 +473,7 @@
 				clock-names = "clk_apb4";
 			};
 
-			pwm_fan:pwm-fan-controller@103000 {	
+			pwm_fan:pwm-fan-controller@103000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "nuvoton,npcm750-pwm-fan";
@@ -487,9 +507,9 @@
 				status = "disabled";
 			};
 
-			i2c0: i2c-bus@80000 {
+			i2c0: i2c@80000 {
 				reg = <0x80000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
@@ -498,9 +518,9 @@
 				status = "disabled";
 			};
 
-			i2c1: i2c-bus@81000 {
+			i2c1: i2c@81000 {
 				reg = <0x81000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
@@ -509,9 +529,9 @@
 				status = "disabled";
 			};
 
-			i2c2: i2c-bus@82000 {
+			i2c2: i2c@82000 {
 				reg = <0x82000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
@@ -520,9 +540,9 @@
 				status = "disabled";
 			};
 
-			i2c3: i2c-bus@83000 {
+			i2c3: i2c@83000 {
 				reg = <0x83000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
@@ -531,9 +551,9 @@
 				status = "disabled";
 			};
 
-			i2c4: i2c-bus@84000 {
+			i2c4: i2c@84000 {
 				reg = <0x84000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
@@ -542,9 +562,9 @@
 				status = "disabled";
 			};
 
-			i2c5: i2c-bus@85000 {
+			i2c5: i2c@85000 {
 				reg = <0x85000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
@@ -553,9 +573,9 @@
 				status = "disabled";
 			};
 
-			i2c6: i2c-bus@86000 {
+			i2c6: i2c@86000 {
 				reg = <0x86000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
@@ -564,9 +584,9 @@
 				status = "disabled";
 			};
 
-			i2c7: i2c-bus@87000 {
+			i2c7: i2c@87000 {
 				reg = <0x87000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
@@ -575,9 +595,9 @@
 				status = "disabled";
 			};
 
-			i2c8: i2c-bus@88000 {
+			i2c8: i2c@88000 {
 				reg = <0x88000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
@@ -586,9 +606,9 @@
 				status = "disabled";
 			};
 
-			i2c9: i2c-bus@89000 {
+			i2c9: i2c@89000 {
 				reg = <0x89000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -597,9 +617,9 @@
 				status = "disabled";
 			};
 
-			i2c10: i2c-bus@8a000 {
+			i2c10: i2c@8a000 {
 				reg = <0x8a000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
@@ -608,9 +628,9 @@
 				status = "disabled";
 			};
 
-			i2c11: i2c-bus@8b000 {
+			i2c11: i2c@8b000 {
 				reg = <0x8b000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -619,9 +639,9 @@
 				status = "disabled";
 			};
 
-			i2c12: i2c-bus@8c000 {
+			i2c12: i2c@8c000 {
 				reg = <0x8c000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
@@ -630,9 +650,9 @@
 				status = "disabled";
 			};
 
-			i2c13: i2c-bus@8d000 {
+			i2c13: i2c@8d000 {
 				reg = <0x8d000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
@@ -641,9 +661,9 @@
 				status = "disabled";
 			};
 
-			i2c14: i2c-bus@8e000 {
+			i2c14: i2c@8e000 {
 				reg = <0x8e000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
@@ -652,9 +672,9 @@
 				status = "disabled";
 			};
 
-			i2c15: i2c-bus@8f000 {
+			i2c15: i2c@8f000 {
 				reg = <0x8f000 0x1000>;
-				compatible = "nuvoton,npcm750-i2c-bus";
+				compatible = "nuvoton,npcm750-i2c";
 				clocks = <&clk NPCM7XX_CLK_APB2>;
 				bus-frequency = <100000>;
 				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
@@ -1202,5 +1222,37 @@
 			groups = "clkreq";
 			function = "clkreq";
 		};
+		hgpio0_pins: hgpio0-pins {
+			groups = "hgpio0";
+			function = "hgpio0";
+		};
+		hgpio1_pins: hgpio1-pins {
+			groups = "hgpio1";
+			function = "hgpio1";
+		};
+		hgpio2_pins: hgpio2-pins {
+			groups = "hgpio2";
+			function = "hgpio2";
+		};
+		hgpio3_pins: hgpio3-pins {
+			groups = "hgpio3";
+			function = "hgpio3";
+		};
+		hgpio4_pins: hgpio4-pins {
+			groups = "hgpio4";
+			function = "hgpio4";
+		};
+		hgpio5_pins: hgpio5-pins {
+			groups = "hgpio5";
+			function = "hgpio5";
+		};
+		hgpio6_pins: hgpio6-pins {
+			groups = "hgpio6";
+			function = "hgpio6";
+		};
+		hgpio7_pins: hgpio7-pins {
+			groups = "hgpio7";
+			function = "hgpio7";
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index 8c568b380706..f135f9ba9b2b 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -46,6 +46,11 @@
 		i2c13 = &i2c13;
 		i2c14 = &i2c14;
 		i2c15 = &i2c15;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+		fiu2 = &fiux;
 	};
 
 	chosen {
@@ -56,6 +61,27 @@
 		reg = <0 0x40000000>;
 	};
 
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg_vref1_2: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "vref_1_2v";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		reg_vref3_3: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "vref_3_3v";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+	};
+
 	ahb {
 	        gmac0: eth@f0802000 {
 			phy-mode = "rgmii-id";
@@ -135,8 +161,14 @@
 			status = "okay";
 		};
 
-		spi0: spi@fb000000 {
+		fiu0: fiu@fb000000 {
+			status = "okay";
 			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				spi-rx-bus-width = <2>;
+				reg = <0>;
 				partitions@80000000 {
 					compatible = "fixed-partitions";
 					#address-cells = <1>;
@@ -188,8 +220,15 @@
 			};
 		};
 
-		spi3: spi@c0000000 {
-				spi-nor@0 {
+		fiu3: fiu@c0000000 {
+			pinctrl-0 = <&spi3_pins>, <&spi3quad_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				spi-rx-bus-width = <2>;
+				reg = <0>;
 				partitions@A0000000 {
 					compatible = "fixed-partitions";
 					#address-cells = <1>;
@@ -206,6 +245,17 @@
 			};
 		};
 
+		fiux: fiu@fb001000 {
+			status = "okay";
+			spix-mode;
+			spi-nor@0 {
+				compatible = "m25p80-nonjedec";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+			};
+		};
+
 		sdhci0: sdhci@f0842000 {
 			status = "okay";
 		};
@@ -252,6 +302,10 @@
 				status = "okay";
 			};
 
+			adc: adc@c000 {
+				status = "okay";
+			};
+
 			otp:otp@189000 {
 				status = "okay";
 			};
@@ -278,7 +332,7 @@
 			};
 
 			/* lm75 on SVB */
-			i2c0: i2c-bus@80000 {
+			i2c0: i2c@80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
@@ -292,7 +346,7 @@
 			};
 
 			/* lm75 on EB */
-			i2c1: i2c-bus@81000 {
+			i2c1: i2c@81000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
@@ -306,7 +360,7 @@
 			};
 
 			/* tmp100 on EB */
-			i2c2: i2c-bus@82000 {
+			i2c2: i2c@82000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
@@ -320,7 +374,7 @@
 			};
 
 			/* tmp100 on SVB */
-			i2c6: i2c-bus@86000 {
+			i2c6: i2c@86000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
@@ -332,70 +386,70 @@
 					status = "okay";
 				};
 			};
-			i2c3: i2c-bus@83000 {
+			i2c3: i2c@83000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
 				status = "okay";
 			};
 
-			i2c4: i2c-bus@84000 {
+			i2c4: i2c@84000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
 				status = "disabled";
 			};
 
-			i2c5: i2c-bus@85000 {
+			i2c5: i2c@85000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
-				status = "disabled";
+				status = "okay";
 			};
 
-			i2c7: i2c-bus@87000 {
+			i2c7: i2c@87000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
-				status = "disabled";
+				status = "okay";
 			};
 
-			i2c8: i2c-bus@88000 {
+			i2c8: i2c@88000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
-				status = "disabled";
+				status = "okay";
 			};
 
-			i2c9: i2c-bus@89000 {
+			i2c9: i2c@89000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
-				status = "disabled";
+				status = "okay";
 			};
 
-			i2c10: i2c-bus@8a000 {
+			i2c10: i2c@8a000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
-				status = "disabled";
+				status = "okay";
 			};
 
-			i2c11: i2c-bus@8b000 {
+			i2c11: i2c@8b000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
-				status = "disabled";
+				status = "okay";
 			};
 
-			i2c14: i2c-bus@8e000 {
+			i2c14: i2c@8e000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
-				status = "disabled";
+				status = "okay";
 			};
 
-			i2c15: i2c-bus@8f000 {
+			i2c15: i2c@8f000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				bus-frequency = <100000>;
@@ -446,16 +500,45 @@
 				};
 			};
 
-			/* example for future pspi binding */
-			/*
-			pspi: pspi@0 {
-				pinctrl-names = "default";
-				pinctrl-0 = <&pspi1_pins &pspi2_pins 
-					&gpio20o_pins &gpio203o_pins>;
-				cs-gpios = <&gpio 20 1>, <&gpio 203 1>;
+			spi0: spi@200000 {
+				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
 				status = "okay";
+				Flash@0 {
+					compatible = "winbond,w25q128", "jedec,spi-nor";
+					reg = <0x0>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spi-max-frequency = <5000000>;
+					partition@0 {
+						label = "spi_spare1";
+						reg = <0x0000000 0x800000>;
+					};
+					partition@1 {
+						label = "spi_spare2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+
+			spi1: spi@201000 {
+				cs-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+				status = "okay";
+				Flash@0 {
+					compatible = "winbond,w25q128fw", "jedec,spi-nor";
+					reg = <0x0>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spi-max-frequency = <5000000>;
+					partition@0 {
+						label = "spi_spare1";
+						reg = <0x0000000 0x800000>;
+					};
+					partition@1 {
+						label = "spi_spare2";
+						reg = <0x800000 0x0>;
+					};
+				};
 			};
-			*/
 		};
 	};
 
@@ -480,7 +563,7 @@
 				&gpio82_pins
 				&gpio83_pins
 				&lpc_pins
-				&gpio132o_pins
+				&gpio132_pins
 				&gpio133_pins
 				&gpio134_pins
 				&gpio135_pins
@@ -514,10 +597,10 @@
 
 &gcr {
 	serial_port_mux: mux-controller {
-	compatible = "mmio-mux";
-	#mux-control-cells = <1>;
+		compatible = "mmio-mux";
+		#mux-control-cells = <1>;
 
-	mux-reg-masks = <0x38 0x07>;
-	idle-states = <2>; /* Serial port mode 3 (takeover) */
+		mux-reg-masks = <0x38 0x07>;
+		idle-states = <2>; /* Serial port mode 3 (takeover) */
 	};
 };
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
index b9675fbce4e6..abe6a3402a59 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
@@ -1107,10 +1107,10 @@
 			bias-disable;
 			input-enable;
 		};
-		gpio132o_pins: gpio132o-pins {
+		gpio132_pins: gpio132-pins {
 			pins = "GPIO132/SMB10SCL";
 			bias-disable;
-			output-high;
+			input-enable;
 		};
 		gpio133_pins: gpio133-pins {
 			pins = "GPIO133/SMB10SDA";
diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
index 421a4ed54bad..4ce748f14763 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
@@ -73,6 +73,7 @@
 			pinctrl-0 = <&r2_pins
 			             &r2err_pins
 				     &r2md_pins>;
+			status = "disabled";
 		};
 
 		udc0:udc@f0830000 {
-- 
2.14.1
