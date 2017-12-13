Return-Path: <Tomer.Maimon@nuvoton.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yxdvG38hszDrd2
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 01:12:57 +1100 (AEDT)
Received: from talu34.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id vBDDRtEC029628;
 Wed, 13 Dec 2017 15:27:55 +0200
Received: by talu34.nuvoton.co.il (Postfix, from userid 10070)
 id EB42E5A918; Wed, 13 Dec 2017 15:45:30 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Wed, 13 Dec 2017 15:45:27 +0200
Message-Id: <1513172728-20998-3-git-send-email-tmaimon77@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1513172728-20998-1-git-send-email-tmaimon77@gmail.com>
References: <1513172728-20998-1-git-send-email-tmaimon77@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Dec 2017 14:13:00 -0000

Add full device tree for all Nuvoton NPCM750 BMCs and a board
specific device tree for the NPCM750 (Poleg) evaluation board.

Based on [v8,2/3] arm: dts: add Nuvoton NPCM750 device tree patch:
Brendan Higgins : - https://patchwork.kernel.org/patch/10063497/

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts   |  468 +++++++++++
 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi |  877 ++++++++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi      | 1189 +++++++++++++++++++++++++++
 3 files changed, 2534 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-evb.dts
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750.dtsi

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
new file mode 100644
index 000000000000..211909e1075e
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -0,0 +1,468 @@
+/*
+ * DTS file for all NPCM750 SoCs
+ *
+ * Copyright (c) 2017 Nuvoton Technology corporation.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+#include "nuvoton-npcm750.dtsi"
+#include "nuvoton-npcm750-gpio.dtsi"
+
+/ {
+	model = "Nuvoton npcm750 Development Board (Device Tree)";
+	compatible = "nuvoton,npcm750";
+
+	aliases {
+		ethernet0 = &emc0;
+		ethernet1 = &emc1;
+		ethernet2 = &gmac0;
+		ethernet3 = &gmac1;
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+		udc0 = &udc0;
+		udc1 = &udc1;
+		udc2 = &udc2;
+		udc3 = &udc3;
+		udc4 = &udc4;
+		udc5 = &udc5;
+		udc6 = &udc6;
+		udc7 = &udc7;
+		udc8 = &udc8;
+		udc9 = &udc9;
+		emmc0 = &sdhci0;
+		emmc1 = &sdhci1;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+	};
+
+	chosen {
+		stdout-path = &serial3;
+	};
+
+	memory {
+		reg = <0 0x40000000>;
+	};
+
+	ahb {
+	gmac0: eth@f0802000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&rg1_pins
+						 &rg1mdio_pins>;
+			phy-mode = "rgmii-id";
+			status = "okay";
+		};
+
+		gmac1: eth@f0804000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&rg2_pins
+						 &rg2mdio_pins>;
+			phy-mode = "rgmii-id";
+			status = "okay";
+		};
+
+		emc0: eth@f0825000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&r1_pins
+						 &r1err_pins
+						 &r1md_pins>;
+			phy-mode = "rmii";
+			status = "okay";
+		};
+
+		emc1: eth@f0826000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&r2_pins
+						 &r2err_pins
+						 &r2md_pins>;
+			phy-mode = "rmii";
+			status = "okay";
+		};
+
+		ehci1: ehci@f0806000 {
+			status = "okay";
+		};
+
+		ohci1: ohci@f0807000 {
+			status = "okay";
+		};
+
+		udc0:udc@f0830000 {
+			status = "okay";
+		};
+
+		udc1:udc@f0831000 {
+			status = "okay";
+		};
+
+		udc2:udc@f0832000 {
+			status = "okay";
+		};
+
+		udc3:udc@f0833000 {
+			status = "okay";
+		};
+
+		udc4:udc@f0834000 {
+			status = "okay";
+		};
+
+		udc5:udc@f0835000 {
+			status = "okay";
+		};
+
+		udc6:udc@f0836000 {
+			status = "okay";
+		};
+
+		udc7:udc@f0837000 {
+			status = "okay";
+		};
+
+		udc8:udc@f0838000 {
+			status = "okay";
+		};
+
+		udc9:udc@f0839000 {
+			status = "okay";
+		};
+
+		aes:aes@f0858000 {
+			status = "okay";
+		};
+
+		sha:sha@f085a000 {
+			status = "okay";
+		};
+
+		spi0: spi@fb000000 {
+			spi-nor@0 {
+				partitions@80000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					bbuboot1@0 {
+						label = "bb-uboot-1";
+						reg = <0x0000000 0x80000>;
+						read-only;
+						};
+					bbuboot2@80000 {
+						label = "bb-uboot-2";
+						reg = <0x0080000 0x80000>;
+						read-only;
+						};
+					envparam@100000 {
+						label = "env-param";
+						reg = <0x0100000 0x40000>;
+						read-only;
+						};
+					spare@140000 {
+						label = "spare";
+						reg = <0x0140000 0xC0000>;
+						};
+					kernel@200000 {
+						label = "kernel";
+						reg = <0x0200000 0x400000>;
+						};
+					rootfs@600000 {
+						label = "rootfs";
+						reg = <0x0600000 0x700000>;
+						};
+					spare1@D00000 {
+						label = "spare1";
+						reg = <0x0D00000 0x200000>;
+						};
+					spare2@0F00000 {
+						label = "spare2";
+						reg = <0x0F00000 0x200000>;
+						};
+					spare3@1100000 {
+						label = "spare3";
+						reg = <0x1100000 0x200000>;
+						};
+					spare4@1300000 {
+						label = "spare4";
+						reg = <0x1300000 0x0>;
+					};
+				};
+			};
+		};
+
+		spi3: spi@c0000000 {
+				spi-nor@0 {
+				partitions@A0000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spare@0 {
+						label = "spare-1";
+						reg = <0x0 0x0>;
+					};
+				};
+			};
+		};
+
+		sdhci0: sdhci@f0840000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&sd1_pins>;
+			status = "okay";
+		};
+
+		sdhci1: sdhci@f0842000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc8_pins
+				     &mmc_pins>;
+			status = "okay";
+		};
+
+	};
+	apb {
+
+		watchdog1: watchdog@f0009000 {
+			status = "okay";
+		};
+
+		rng: rng@f000b000 {
+			status = "okay";
+		};
+
+		serial0: serial0@f0001000 {
+			status = "okay";
+		};
+
+		serial1: serial1@f0002000 {
+			status = "okay";
+		};
+
+		serial2: serial2@f0003000 {
+			status = "okay";
+		};
+
+		serial3: serial3@f0004000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_pins>;
+			status = "okay";
+		};
+
+		otp:otp@f0189000 {
+			status = "okay";
+		};
+
+		/* lm75 on SVB */
+		i2c0: i2c-bus@f0080000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+
+			lm75@48 {
+				compatible = "lm75";
+				reg = <0x48>;
+				status = "okay";
+			};
+		};
+
+		/* lm75 on EB */
+		i2c1: i2c-bus@f0081000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+
+			lm75@48 {
+				compatible = "lm75";
+				reg = <0x48>;
+				status = "okay";
+			};
+		};
+
+		/* tmp100 on EB */
+		i2c2: i2c-bus@f0082000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+
+			tmp100@48 {
+				compatible = "tmp100";
+				reg = <0x48>;
+				status = "okay";
+			};
+		};
+
+		/* tmp100 on SVB */
+		i2c6: i2c-bus@f0086000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+
+			tmp100@48 {
+				compatible = "tmp100";
+				reg = <0x48>;
+				status = "okay";
+			};
+		};
+
+		i2c3: i2c-bus@f0083000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		i2c4: i2c-bus@f0084000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		i2c5: i2c-bus@f0085000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		i2c7: i2c-bus@f0087000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		i2c8: i2c-bus@f0088000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		i2c9: i2c-bus@f0089000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		i2c10: i2c-bus@f008a000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		i2c11: i2c-bus@f008b000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		i2c14: i2c-bus@f008e000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		i2c15: i2c-bus@f008f000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		mft: mft@0 {
+			pinctrl-names = "default";
+			pinctrl-0 = <	&fanin0_pins
+					&fanin1_pins
+					&fanin2_pins
+					&fanin3_pins
+					&fanin4_pins
+					&fanin5_pins
+					&fanin6_pins
+					&fanin7_pins
+					&fanin8_pins
+					&fanin9_pins
+					&fanin10_pins
+					&fanin11_pins
+					&fanin12_pins
+					&fanin13_pins
+					&fanin14_pins
+					&fanin15_pins>;
+			status = "okay";
+			};
+		};
+
+		pinctrl: pinctrl@0 {
+			pinctrl-names = "default";
+			pinctrl-0 = <	&gpio0o_pins
+					&gpio1_pins
+					&gpio2o_pins
+					&gpio3_pins
+					&gpio8_pins
+					&gpio9o_pins
+					&gpio10_pins
+					&gpio11o_pins
+					&gpio16_pins
+					&gpio17_pins
+					&gpio24o_pins
+					&gpio25ol_pins
+					&gpio32o_pins
+					&spi0quad_pins
+					&jtag2_pins
+					&gpio61o_pins
+					&gpio62o_pins
+					&gpio63o_pins
+					&gpio80_pins
+					&gpio81_pins
+					&gpio82_pins
+					&gpio83_pins
+					&lpc_pins
+					&gpio132o_pins
+					&gpio133_pins
+					&gpio134_pins
+					&gpio135_pins
+					&gpio144_pins
+					&gpio145_pins
+					&gpio146_pins
+					&gpio147_pins
+					&gpio160_pins
+					&gpio162_pins
+					&gpio168_pins
+					&gpio169_pins
+					&gpio170_pins
+					&gpio175_pins
+					&gpio176_pins
+					&gpio177o_pins
+					&spi3_pins
+					&gpio187o_pins
+					&spi3quad_pins
+					&gpio190_pins
+					&gpio191o_pins
+					&gpio192o_pins
+					&gpio197ol_pins
+					&gpio203o_pins
+					&ddc_pins
+					&gpio218_pins
+					&gpio219ol_pins
+					&gpio220ol_pins
+					&gpio221o_pins
+					&gpio222_pins
+					&gpio223ol_pins
+					&spix_pins
+					&gpio228ol_pins
+					&gpio231o_pins
+					&gpio255_pins>;
+		};
+};
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
new file mode 100644
index 000000000000..b6214bcca07f
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
@@ -0,0 +1,877 @@
+/*
+ * DTSi file for the NPCM750 pin controller
+ *
+ * Copyright (c) 2017 Nuvoton Technology corporation.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/ {
+	pinctrl: pinctrl@0 {
+		gpio0o_pins: gpio0o_pins {
+			pins = "GPIO0/IOX1DI";
+			output-high;
+		};
+		gpio1_pins: gpio1_pins {
+			pins = "GPIO1/IOX1LD";
+			input-enable;
+		};
+		gpio2_pins: gpio2_pins {
+			pins = "GPIO2/IOX1CK";
+			input-enable;
+		};
+		gpio2o_pins: gpio2o_pins {
+			pins = "GPIO2/IOX1CK";
+			output_high;
+		};
+		gpio3_pins: gpio3_pins {
+			pins = "GPIO3/IOX1D0";
+			input-enable;
+		};
+		gpio3o_pins: gpio3o_pins {
+			pins = "GPIO3/IOX1D0";
+			output-high;
+		};
+		gpio6_pins: gpio6_pins {
+			pins = "GPIO6/IOX2CK/SMB2DSDA";
+			input-enable;
+		};
+		gpio6ol_pins: gpio6ol_pins {
+			pins = "GPIO6/IOX2CK/SMB2DSDA";
+			output-low;
+		};
+		gpio7_pins: gpio7_pins {
+			pins = "GPIO7/IOX2D0/SMB2DSCL";
+			input-enable;
+		};
+		gpio7ol_pins: gpio7ol_pins {
+			pins = "GPIO7/IOX2D0/SMB2DSCL";
+			output-low;
+		};
+		gpio8_pins: gpio8_pins {
+			pins = "GPIO8/LKGPO1";
+			input-enable;
+		};
+		gpio9o_pins: gpio9o_pins {
+			pins = "GPIO9/LKGPO2";
+			output-high;
+		};
+		gpio10_pins: gpio10_pins {
+			pins = "GPIO10/IOXHLD";
+			input-enable;
+		};
+		gpio11_pins: gpio11_pins {
+			pins = "GPIO11/IOXHCK";
+			input-enable;
+		};
+		gpio11o_pins: gpio11o_pins {
+			pins = "GPIO11/IOXHCK";
+			output-high;
+		};
+		gpio12_pins: gpio12_pins {
+			pins = "GPIO12/GSPICK/SMB5BSCL";
+			input-enable;
+		};
+		gpio13_pins: gpio13_pins {
+			pins = "GPIO13/GSPIDO/SMB5BSDA";
+			input-enable;
+		};
+		gpio14_pins: gpio14_pins {
+			pins = "GPIO14/GSPIDI/SMB5CSCL";
+			input-enable;
+		};
+		gpio15_pins: gpio15_pins {
+			pins = "GPIO15/GSPICS/SMB5CSDA";
+			input-enable;
+		};
+		gpio16_pins: gpio16_pins {
+			pins = "GPIO16/LKGPO0";
+			input-enable;
+		};
+		gpio17_pins: gpio17_pins {
+			pins = "GPIO17/PSPI2DI/SMB4DEN";
+			input-enable;
+		};
+		gpio18_pins: gpio18_pins {
+			pins = "GPIO18/PSPI2D0/SMB4BSDA";
+			input-enable;
+		};
+		gpio19_pins: gpio19_pins {
+			pins = "GPIO19/PSPI2CK/SMB4BSCL";
+			input-enable;
+		};
+		gpio20_pins: gpio20_pins {
+			pins = "GPIO20/SMB4CSDA/SMB15SDA";
+			input-enable;
+		};
+		gpio21_pins: gpio21_pins {
+			pins = "GPIO21/SMB4CSCL/SMB15SCL";
+			input-enable;
+		};
+		gpio22_pins: gpio22_pins {
+			pins = "GPIO22/SMB4DSDA/SMB14SDA";
+			input-enable;
+		};
+		gpio23_pins: gpio23_pins {
+			pins = "GPIO23/SMB4DSCL/SMB14SCL";
+			input-enable;
+		};
+		gpio24o_pins: gpio24o_pins {
+			pins = "GPIO24/IOXHDO";
+			output-high;
+		};
+		gpio25_pins: gpio25_pins {
+			pins = "GPIO25/IOXHDI";
+			input-enable;
+		};
+		gpio25o_pins: gpio25o_pins {
+			pins = "GPIO25/IOXHDI";
+			output-high;
+		};
+		gpio25ol_pins: gpio25ol_pins {
+			pins = "GPIO25/IOXHDI";
+			output-low;
+		};
+		gpio32_pins: gpio32_pins {
+			pins = "GPIO32/nSPI0CS1";
+			input-enable;
+		};
+		gpio32o_pins: gpio32o_pins {
+			pins = "GPIO32/nSPI0CS1";
+			output-high;
+		};
+		gpio37_pins: gpio37_pins {
+			pins = "GPIO37/SMB3CSDA";
+			input-enable;
+		};
+		gpio38_pins: gpio38_pins {
+			pins = "GPIO38/SMB3CSCL";
+			input-enable;
+		};
+		gpio39_pins: gpio39_pins {
+			pins = "GPIO39/SMB3BSDA";
+			input-enable;
+		};
+		gpio40_pins: gpio40_pins {
+			pins = "GPIO40/SMB3BSCL";
+			input-enable;
+		};
+		gpio41_pins: gpio41_pins {
+			pins = "GPIO41/BSPRXD";
+			input-enable;
+		};
+		gpio42_pins: gpio42_pins {
+			pins = "GPO42/BSPTXD/STRAP11";
+			input-enable;
+		};
+		gpio43_pins: gpio43_pins {
+			pins = "GPIO43/RXD1/JTMS2/BU1RXD";
+			input-enable;
+		};
+		gpio44_pins: gpio44_pins {
+			pins = "GPIO44/nCTS1/JTDI2/BU1CTS";
+			input-enable;
+		};
+		gpio45_pins: gpio45_pins {
+			pins = "GPIO45/nDCD1/JTDO2";
+			input-enable;
+		};
+		gpio46_pins: gpio46_pins {
+			pins = "GPIO46/nDSR1/JTCK2";
+			input-enable;
+		};
+		gpio47_pins: gpio47_pins {
+			pins = "GPIO47/nRI1/JCP_RDY2";
+			input-enable;
+		};
+		gpio48_pins: gpio48_pins {
+			pins = "GPIO48/TXD2/BSPTXD";
+			input-enable;
+		};
+		gpio49_pins: gpio49_pins {
+			pins = "GPIO49/RXD2/BSPRXD";
+			input-enable;
+		};
+		gpio50_pins: gpio50_pins {
+			pins = "GPIO50/nCTS2";
+			input-enable;
+		};
+		gpio51_pins: gpio51_pins {
+			pins = "GPO51/nRTS2/STRAP2";
+			input-enable;
+		};
+		gpio52_pins: gpio52_pins {
+			pins = "GPIO52/nDCD2";
+			input-enable;
+		};
+		gpio53_pins: gpio53_pins {
+			pins = "GPIO53/nDTR2_BOUT2/STRAP1";
+			input-enable;
+		};
+		gpio54_pins: gpio54_pins {
+			pins = "GPIO54/nDSR2";
+			input-enable;
+		};
+		gpio55_pins: gpio55_pins {
+			pins = "GPIO55/nRI2";
+			input-enable;
+		};
+		gpio57_pins: gpio57_pins {
+			pins = "GPIO57/R1MDC";
+			input-enable;
+		};
+		gpio58_pins: gpio58_pins {
+			pins = "GPIO58/R1MDIO";
+			input-enable;
+		};
+		gpio59_pins: gpio59_pins {
+			pins = "GPIO59/SMB3DSDA";
+			input-enable;
+		};
+		gpio59o_pins: gpio59o_pins {
+			pins = "GPIO59/SMB3DSDA";
+			output-high;
+		};
+		gpio60_pins: gpio60_pins {
+			pins = "GPIO60/SMB3DSCL";
+			input-enable;
+		};
+		gpio60o_pins: gpio60o_pins {
+			pins = "GPIO60/SMB3DSCL";
+			output-high;
+		};
+		gpio61o_pins: gpio61o_pins {
+			pins = "GPO61/nDTR1_BOUT1/STRAP6";
+			output-high;
+		};
+		gpio62o_pins: gpio62o_pins {
+			pins = "GPO62/nRTST1/STRAP5";
+			output-high;
+		};
+		gpio63o_pins: gpio63o_pins {
+			pins = "GPO63/TXD1/STRAP4";
+			output-high;
+		};
+		gpio64_pins: gpio64_pins {
+			pins = "GPIO64/FANIN0";
+			input-enable;
+		};
+		gpio65_pins: gpio65_pins {
+			pins = "GPIO65/FANIN1";
+			input-enable;
+		};
+		gpio66_pins: gpio66_pins {
+			pins = "GPIO66/FANIN2";
+			input-enable;
+		};
+		gpio67_pins: gpio67_pins {
+			pins = "GPIO67/FANIN3";
+			input-enable;
+		};
+		gpio68_pins: gpio68_pins {
+			pins = "GPIO68/FANIN4";
+			input-enable;
+		};
+		gpio69_pins: gpio69_pins {
+			pins = "GPIO69/FANIN5";
+			input-enable;
+		};
+		gpio69ol_pins: gpio69ol_pins {
+			pins = "GPIO69/FANIN5";
+			output-low;
+		};
+		gpio70_pins: gpio70_pins {
+			pins = "GPIO70/FANIN6";
+			input-enable;
+		};
+		gpio71_pins: gpio71_pins {
+			pins = "GPIO71/FANIN7";
+			input-enable;
+		};
+		gpio72_pins: gpio72_pins {
+			pins = "GPIO72/FANIN8";
+			input-enable;
+		};
+		gpio73_pins: gpio73_pins {
+			pins = "GPIO73/FANIN9";
+			input-enable;
+		};
+		gpio74_pins: gpio74_pins {
+			pins = "GPIO74/FANIN10";
+			input-enable;
+		};
+		gpio75_pins: gpio75_pins {
+			pins = "GPIO75/FANIN11";
+			input-enable;
+		};
+		gpio76_pins: gpio76_pins {
+			pins = "GPIO76/FANIN12";
+			input-enable;
+		};
+		gpio77_pins: gpio77_pins {
+			pins = "GPIO77/FANIN13";
+			input-enable;
+		};
+		gpio78_pins: gpio78_pins {
+			pins = "GPIO78/FANIN14";
+			input-enable;
+		};
+		gpio79_pins: gpio79_pins {
+			pins = "GPIO79/FANIN15";
+			input-enable;
+		};
+		gpio80_pins: gpio80_pins {
+			pins = "GPIO80/PWM0";
+			input-enable;
+		};
+		gpio81_pins: gpio81_pins {
+			pins = "GPIO81/PWM1";
+			input-enable;
+		};
+		gpio82_pins: gpio82_pins {
+			pins = "GPIO82/PWM2";
+			input-enable;
+		};
+		gpio83_pins: gpio83_pins {
+			pins = "GPIO83/PWM3";
+			input-enable;
+		};
+		gpio84_pins: gpio84_pins {
+			pins = "GPIO84/R2TXD0";
+			input-enable;
+		};
+		gpio85_pins: gpio85_pins {
+			pins = "GPIO85/R2TXD1";
+			input-enable;
+		};
+		gpio86_pins: gpio86_pins {
+			pins = "GPIO86/R2TXEN";
+			input-enable;
+		};
+		gpio87_pins: gpio87_pins {
+			pins = "GPIO87/R2RXD0";
+			input-enable;
+		};
+		gpio88_pins: gpio88_pins {
+			pins = "GPIO88/R2RXD1";
+			input-enable;
+		};
+		gpio89_pins: gpio89_pins {
+			pins = "GPIO89/R2CRSDV";
+			input-enable;
+		};
+		gpio90_pins: gpio90_pins {
+			pins = "GPIO90/R2RXERR";
+			input-enable;
+		};
+		gpio90o_pins: gpio90o0_pins {
+			pins = "GPIO90/R2RXERR";
+			output-high;
+		};
+		gpio91_pins: gpio91_pins {
+			pins = "GPIO91/R2MDC";
+			input-enable;
+		};
+		gpio91o_pins: gpio91o_pins {
+			pins = "GPIO91/R2MDC";
+			output-high;
+		};
+		gpio92_pins: gpio92_pins {
+			pins = "GPIO92/R2MDIO";
+			input-enable;
+		};
+		gpio92o_pins: gpio92o_pins {
+			pins = "GPIO92/R2MDIO";
+			output-high;
+		};
+		gpio93_pins: gpio93_pins {
+			pins = "GPIO93/GA20/SMB5DSCL";
+			input-enable;
+		};
+		gpio94_pins: gpio94_pins {
+			pins = "GPIO94/nKBRST/SMB5DSDA";
+			input-enable;
+		};
+		gpio95_pins: gpio95_pins {
+			pins = "GPIO95/nLRESET/nESPIRST";
+			input-enable;
+		};
+		gpio96_pins: gpio96_pins {
+			pins = "GPIO96/RG1TXD0";
+			input-enable;
+		};
+		gpio97_pins: gpio97_pins {
+			pins = "GPIO97/RG1TXD1";
+			input-enable;
+		};
+		gpio98_pins: gpio98_pins {
+			pins = "GPIO98/RG1TXD2";
+			input-enable;
+		};
+		gpio99_pins: gpio99_pins {
+			pins = "GPIO99/RG1TXD3";
+			input-enable;
+		};
+		gpio100_pins: gpio100_pins {
+			pins = "GPIO100/RG1TXC";
+			input-enable;
+		};
+		gpio101_pins: gpio101_pins {
+			pins = "GPIO101/RG1TXCTL";
+			input-enable;
+		};
+		gpio102_pins: gpio102_pins {
+			pins = "GPIO102/RG1RXD0";
+			input-enable;
+		};
+		gpio103_pins: gpio103_pins {
+			pins = "GPIO103/RG1RXD1";
+			input-enable;
+		};
+		gpio104_pins: gpio104_pins {
+			pins = "GPIO104/RG1RXD2";
+			input-enable;
+		};
+		gpio105_pins: gpio105_pins {
+			pins = "GPIO105/RG1RXD3";
+			input-enable;
+		};
+		gpio106_pins: gpio106_pins {
+			pins = "GPIO106/RG1RXC";
+			input-enable;
+		};
+		gpio107_pins: gpio107_pins {
+			pins = "GPIO107/RG1RXCTL";
+			input-enable;
+		};
+		gpio108_pins: gpio108_pins {
+			pins = "GPIO108/RG1MDC";
+			input-enable;
+		};
+		gpio109_pins: gpio109_pins {
+			pins = "GPIO109/RG1MDIO";
+			input-enable;
+		};
+		gpio110_pins: gpio110_pins {
+			pins = "GPIO110/RG2TXD0/DDRV0";
+			input-enable;
+		};
+		gpio111_pins: gpio111_pins {
+			pins = "GPIO111/RG2TXD1/DDRV1";
+			input-enable;
+		};
+		gpio112_pins: gpio112_pins {
+			pins = "GPIO112/RG2TXD2/DDRV2";
+			input-enable;
+		};
+		gpio113_pins: gpio113_pins {
+			pins = "GPIO113/RG2TXD3/DDRV3";
+			input-enable;
+		};
+		gpio118_pins: gpio118_pins {
+			pins = "GPIO118/SMB2SCL";
+			input-enable;
+		};
+		gpio119_pins: gpio119_pins {
+			pins = "GPIO119/SMB2SDA";
+			input-enable;
+		};
+		gpio120_pins: gpio120_pins {
+			pins = "GPIO120/SMB2CSDA";
+			input-enable;
+		};
+		gpio121_pins: gpio121_pins {
+			pins = "GPIO121/SMB2CSCL";
+			input-enable;
+		};
+		gpio122_pins: gpio122_pins {
+			pins = "GPIO122/SMB2BSDA";
+			input-enable;
+		};
+		gpio123_pins: gpio123_pins {
+			pins = "GPIO123/SMB2BSCL";
+			input-enable;
+		};
+		gpio130_pins: gpio130_pins {
+			pins = "GPIO130/SMB9SCL";
+			input-enable;
+		};
+		gpio131_pins: gpio131_pins {
+			pins = "GPIO131/SMB9SDA";
+			input-enable;
+		};
+		gpio132o_pins: gpio132o_pins {
+			pins = "GPIO132/SMB10SCL";
+			output-high;
+		};
+		gpio133_pins: gpio133_pins {
+			pins = "GPIO133/SMB10SDA";
+			input-enable;
+		};
+		gpio134_pins: gpio134_pins {
+			pins = "GPIO134/SMB11SCL";
+			input-enable;
+		};
+		gpio135_pins: gpio135_pins {
+			pins = "GPIO135/SMB11SDA";
+			input-enable;
+		};
+		gpio136o_pins: gpio136o_pins {
+			pins = "GPIO136/SD1DT0";
+			output-high;
+		};
+		gpio137o_pins: gpio137o_pins {
+			pins = "GPIO137/SD1DT1";
+			output-high;
+		};
+		gpio138o_pins: gpio138o_pins {
+			pins = "GPIO138/SD1DT2";
+			output-high;
+		};
+		gpio139o_pins: gpio139o_pins {
+			pins = "GPIO139/SD1DT3";
+			output-high;
+		};
+		gpio140o_pins: gpio140o_pins {
+			pins = "GPIO140/SD1CLK";
+			output-high;
+		};
+		gpio141o_pins: gpio141o_pins {
+			pins = "GPIO141/SD1WP";
+			output-high;
+		};
+		gpio142o_pins: gpio142o_pins {
+			pins = "GPIO142/SD1CMD";
+			output-high;
+		};
+		gpio143o_pins: gpio143o_pins {
+			pins = "GPIO143/SD1CD/SD1PWR";
+			output-high;
+		};
+		gpio144_pins: gpio144_pins {
+			pins = "GPIO144/PWM4";
+			input-enable;
+		};
+		gpio145_pins: gpio145_pins {
+			pins = "GPIO145/PWM5";
+			input-enable;
+		};
+		gpio146_pins: gpio146_pins {
+			pins = "GPIO146/PWM6";
+			input-enable;
+		};
+		gpio147_pins: gpio147_pins {
+			pins = "GPIO147/PWM7";
+			input-enable;
+		};
+		gpio148_pins: gpio148_pins {
+			pins = "GPIO148/MMCDT4";
+			input-enable;
+		};
+		gpio149_pins: gpio149_pins {
+			pins = "GPIO149/MMCDT5";
+			input-enable;
+		};
+		gpio150_pins: gpio150_pins {
+			pins = "GPIO150/MMCDT6";
+			input-enable;
+		};
+		gpio151_pins: gpio151_pins {
+			pins = "GPIO151/MMCDT7";
+			input-enable;
+		};
+		gpio152_pins: gpio152_pins {
+			pins = "GPIO152/MMCCLK";
+			input-enable;
+		};
+		gpio153_pins: gpio153_pins {
+			pins = "GPIO153/MMCWP";
+			input-enable;
+		};
+		gpio154_pins: gpio154_pins {
+			pins = "GPIO154/MMCCMD";
+			input-enable;
+		};
+		gpio155_pins: gpio155_pins {
+			pins = "GPIO155/nMMCCD/nMMCRST";
+			input-enable;
+		};
+		gpio156_pins: gpio156_pins {
+			pins = "GPIO156/MMCDT0";
+			input-enable;
+		};
+		gpio157_pins: gpio157_pins {
+			pins = "GPIO157/MMCDT1";
+			input-enable;
+		};
+		gpio158_pins: gpio158_pins {
+			pins = "GPIO158/MMCDT2";
+			input-enable;
+		};
+		gpio159_pins: gpio159_pins {
+			pins = "GPIO159/MMCDT3";
+			input-enable;
+		};
+		gpio160_pins: gpio160_pins {
+			pins = "GPIO160/CLKOUT/RNGOSCOUT";
+			input-enable;
+		};
+		gpio161_pins: gpio161_pins {
+			pins = "GPIO161/nLFRAME/nESPICS";
+			input-enable;
+		};
+		gpio162_pins: gpio162_pins {
+			pins = "GPIO162/SERIRQ";
+			input-enable;
+		};
+		gpio163_pins: gpio163_pins {
+			pins = "GPIO163/LCLK/ESPICLK";
+			input-enable;
+		};
+		gpio164_pins: gpio164_pins {
+			pins = "GPIO164/LAD0/ESPI_IO0";
+			input-enable;
+		};
+		gpio165_pins: gpio165_pins {
+			pins = "GPIO165/LAD1/ESPI_IO1";
+			input-enable;
+		};
+		gpio166_pins: gpio166_pins {
+			pins = "GPIO166/LAD2/ESPI_IO2";
+			input-enable;
+		};
+		gpio167_pins: gpio167_pins {
+			pins = "GPIO167/LAD3/ESPI_IO3";
+			input-enable;
+		};
+		gpio168_pins: gpio168_pins {
+			pins = "GPIO168/nCLKRUN/nESPIALERT";
+			input-enable;
+		};
+		gpio169_pins: gpio169_pins {
+			pins = "GPIO169/nSCIPME";
+			input-enable;
+		};
+		gpio170_pins: gpio170_pins {
+			pins = "GPIO170/nSMI";
+			input-enable;
+		};
+		gpio175_pins: gpio175_pins {
+			pins = "GPIO175/PSPI1CK/FANIN19";
+			input-enable;
+		};
+		gpio176_pins: gpio176_pins {
+			pins = "GPIO176/PSPI1DO/FANIN18";
+			input-enable;
+		};
+		gpio177_pins: gpio177_pins {
+			pins = "GPIO177/PSPI1DI/FANIN17";
+			input-enable;
+		};
+		gpio177o_pins: gpio177o_pins {
+			pins = "GPIO177/PSPI1DI/FANIN17";
+			output-high;
+		};
+		gpio187_pins: gpio187_pins {
+			pins = "GPIO187/nSPI3CS1";
+			input-enable;
+		};
+		gpio187o_pins: gpio187o_pins {
+			pins = "GPIO187/nSPI3CS1";
+			output-high;
+		};
+		gpio188_pins: gpio188_pins {
+			pins = "GPIO188/SPI3D2/nSPI3CS2";
+			input-enable;
+		};
+		gpio189o_pins: gpio189o_pins {
+			pins = "GPIO189/SPI3D3/nSPI3CS3";
+			output-high;
+		};
+		gpio190_pins: gpio190_pins {
+			pins = "GPIO190/nPRD_SMI";
+			input-enable;
+		};
+		gpio190o_pins: gpio190o_pins {
+			pins = "GPIO190/nPRD_SMI";
+			output-high;
+		};
+		gpio191o_pins: gpio191o_pins {
+			pins = "GPIO191";
+			output-high;
+		};
+		gpio192_pins: gpio192_pins {
+			pins = "GPIO192/PSPI1CS2";
+			input-enable;
+		};
+		gpio192o_pins: gpio192o_pins {
+			pins = "GPIO192/PSPI1CS2";
+			output-high;
+		};
+		gpio197_pins: gpio197_pins {
+			pins = "GPIO197/SMB0DEN";
+			input-enable;
+		};
+		gpio197o_pins: gpio197o_pins {
+			pins = "GPIO197/SMB0DEN";
+			output-high;
+		};
+		gpio197ol_pins: gpio197ol_pins {
+			pins = "GPIO197/SMB0DEN";
+			output-low;
+		};
+		gpio200_pins: gpio200_pins {
+			pins = "GPIO200/R2CK";
+			input-enable;
+		};
+		gpio203_pins: gpio203_pins {
+			pins = "GPIO203/FANIN16";
+			input-enable;
+		};
+		gpio203o_pins: gpio203o_pins {
+			pins = "GPIO203/FANIN16";
+			output-high;
+		};
+		gpio204_pins: gpio204_pins {
+			pins = "GPIO204/DDC2SCL";
+			input-enable;
+		};
+		gpio205_pins: gpio205_pins {
+			pins = "GPIO205/DDC2SDA";
+			input-enable;
+		};
+		gpio206_pins: gpio206_pins {
+			pins = "GPIO206/HSYNC2";
+			input-enable;
+		};
+		gpio207_pins: gpio207_pins {
+			pins = "GPIO207/VSYNC2";
+			input-enable;
+		};
+		gpio208_pins: gpio208_pins {
+			pins = "GPIO208/RG2TXC/DVCK";
+			input-enable;
+		};
+		gpio209_pins: gpio209_pins {
+			pins = "GPIO209/RG2TXCTL/DDRV4";
+			input-enable;
+		};
+		gpio210_pins: gpio210_pins {
+			pins = "GPIO210/RG2RXD0/DDRV5";
+			input-enable;
+		};
+		gpio211_pins: gpio211_pins {
+			pins = "GPIO211/RG2RXD1/DDRV6";
+			input-enable;
+		};
+		gpio212_pins: gpio212_pins {
+			pins = "GPIO212/RG2RXD2/DDRV7";
+			input-enable;
+		};
+		gpio213_pins: gpio213_pins {
+			pins = "GPIO213/RG2RXD3/DDRV8";
+			input-enable;
+		};
+		gpio214_pins: gpio214_pins {
+			pins = "GPIO214/RG2RXC/DDRV9";
+			input-enable;
+		};
+		gpio215_pins: gpio215_pins {
+			pins = "GPIO215/RG2RXCTL/DDRV10";
+			input-enable;
+		};
+		gpio216_pins: gpio216_pins {
+			pins = "GPIO216/RG2MDC/DDRV11";
+			input-enable;
+		};
+		gpio217_pins: gpio217_pins {
+			pins = "GPIO217/RG2MDIO/DVHSYNC";
+			input-enable;
+		};
+		gpio218_pins: gpio218_pins {
+			pins = "GPIO218/nWDO1";
+			input-enable;
+		};
+		gpio219_pins: gpio219_pins {
+			pins = "GPIO219/nWDO2";
+			input-enable;
+		};
+		gpio219ol_pins: gpio219ol_pins {
+			pins = "GPIO219/nWDO2";
+			output-low;
+		};
+		gpio220ol_pins: gpio220ol_pins {
+			pins = "GPIO220/SMB12SCL";
+			output-low;
+		};
+		gpio221o_pins: gpio221o_pins {
+			pins = "GPIO221/SMB12SDA";
+			output-high;
+		};
+		gpio222_pins: gpio222_pins {
+			pins = "GPIO222/SMB13SCL";
+			input-enable;
+		};
+		gpio222o_pins: gpio222o_pins {
+			pins = "GPIO222/SMB13SCL";
+			output-high;
+		};
+		gpio223_pins: gpio223_pins {
+			pins = "GPIO223/SMB13SDA";
+			input-enable;
+		};
+		gpio223ol_pins: gpio223ol_pins {
+			pins = "GPIO223/SMB13SDA";
+			output-low;
+		};
+		gpio224_pins: gpio224_pins {
+			pins = "GPIO224/SPIXCK";
+			input-enable;
+		};
+		gpio225_pins: gpio225_pins {
+			pins = "GPO225/SPIXD0/STRAP12";
+			input-enable;
+		};
+		gpio226_pins: gpio226_pins {
+			pins = "GPO226/SPIXD1/STRAP13";
+			input-enable;
+		};
+		gpio227_pins: gpio227_pins {
+			pins = "GPIO227/nSPIXCS0";
+			input-enable;
+		};
+		gpio228_pins: gpio228_pins {
+			pins = "GPIO228/nSPIXCS1";
+			input-enable;
+		};
+		gpio228ol_pins: gpio228ol_pins {
+			pins = "GPIO228/nSPIXCS1";
+			output-low;
+		};
+		gpio229_pins: gpio229_pins {
+			pins = "GPIO229/SPIXD2/STRAP3";
+			input-enable;
+		};
+		gpio230_pins: gpio230_pins {
+			pins = "GPIO230/SPIXD3";
+			input-enable;
+		};
+		gpio231_pins: gpio231_pins {
+			pins = "GPIO231/nCLKREQ";
+			input-enable;
+		};
+		gpio231o_pins: gpio231o_pins {
+			pins = "GPIO231/nCLKREQ";
+			output-high;
+		};
+		gpio255_pins: gpio255_pins {
+			pins = "GPI255/DACOSEL";
+			input-enable;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
new file mode 100644
index 000000000000..99e40eb18041
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
@@ -0,0 +1,1189 @@
+/*
+ * DTSi file for the NPCM750 SoC
+ *
+ * Copyright (c) 2017 Nuvoton Technology corporation.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include "skeleton.dtsi"
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/nuvoton,npcm7xx-clks.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "nuvoton,npcm7xx-smp";
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk NPCM7XX_CLK_CPU>;
+			clock-names = "clk_cpu";
+			reg = <0>;
+			next-level-cache = <&l2>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			clocks = <&clk NPCM7XX_CLK_CPU>;
+			clock-names = "clk_cpu";
+			reg = <1>;
+			next-level-cache = <&l2>;
+		};
+	};
+
+	gcr: gcr@f0800000 {
+		compatible = "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
+		reg = <0xf0800000 0x1000>;
+	};
+
+	rst: rst@f0801000 {
+		compatible = "nuvoton,npcm750-rst", "syscon", "simple-mfd";
+		reg = <0xf0801000 0x1000>;
+	};
+
+	scu: scu@f03fe000 {
+		compatible = "arm,cortex-a9-scu";
+		reg = <0xf03fe000 0x1000>;
+	};
+
+	l2: cache-controller@f03fc000 {
+		compatible = "arm,pl310-cache";
+		reg = <0xf03fc000 0x1000>;
+		interrupts = <0 21 4>;
+		cache-unified;
+		arm,shared-override;
+		cache-level = <2>;
+		clocks = <&clk NPCM7XX_CLK_AXI>;
+	};
+
+	gic: interrupt-controller@f03ff000 {
+		compatible = "arm,cortex-a9-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0xf03ff000 0x1000>,
+		    <0xf03fe100 0x100>;
+	};
+
+	timer@f03fe600 {
+		compatible = "arm,cortex-a9-twd-timer";
+		reg = <0xf03fe600 0x20>;
+		interrupts = <1 13 0x304>;
+		clocks = <&clk NPCM7XX_CLK_AHB>;
+		clock-names = "clk_ahb";
+	};
+
+	ahb {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges = <0x80000000 0x80000000 0x40000000
+			  0xc0000000 0xc0000000 0x00002000
+			  0xc0008000 0xc0008000 0x00001000
+			  0xe0800000 0xe0800000 0x00001000
+			  0xe1000000 0xe1000000 0x00001000
+			  0xe8000000 0xe8000000 0x08000000
+			  /* APB start */
+			  0xf0000000 0xf0000000 0x00005000
+			  0xf0007000 0xf0007000 0x00005000
+			  0xf0010000 0xf0010000 0x00008000
+			  0xf0080000 0xf0080000 0x00010000
+			  0xf009f000 0xf009f000 0x00001000
+			  0xf0100000 0xf0100000 0x00005000
+			  0xf0180000 0xf0180000 0x0000b000
+			  0xf0200000 0xf0200000 0x00002000
+			  /* APB end */
+			  0xf0800000 0xf0800000 0x000fc000
+			  0xf8000000 0xf8000000 0x02000000
+			  0xfb000000 0xfb000000 0x00002000
+			  0xfffd0000 0xfffd0000 0x00005000>;
+
+		clk: clock-controller@f0801000 {
+			compatible = "nuvoton,npcm750-clk";
+			#clock-cells = <1>;
+			reg = <0xf0801000 0x1000>;
+				status = "okay";
+		};
+
+		/* external clock signal rg1refck, supplied by the phy */
+		clk_rg1refck: clk_rg1refck {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+			clock-output-names = "clk_rg1refck";
+		};
+
+		/* external clock signal rg2refck, supplied by the phy */
+		clk_rg2refck: clk_rg2refck {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <125000000>;
+			clock-output-names = "clk_rg2refck";
+		};
+
+		clk_xin: clk_xin {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <50000000>;
+			clock-output-names = "clk_xin";
+		};
+
+		gmac0: eth@f0802000 {
+			device_type = "network";
+			compatible = "nuvoton,npcm750-gmac";
+			reg = <0xf0802000 0x2000>;
+			interrupts = <0 14 4>;
+			interrupt-names = "macirq";
+			ethernet = <0>;
+			clocks	= <&clk_rg1refck>, <&clk NPCM7XX_CLK_GMAC>;
+			clock-names = "stmmaceth", "clk_gmac";
+			status = "disabled";
+		};
+
+		gmac1: eth@f0804000 {
+			device_type = "network";
+			compatible = "nuvoton,npcm750-gmac";
+			reg = <0xf0804000 0x2000>;
+			interrupts = <0 17 4>;
+			interrupt-names = "macirq";
+			ethernet = <1>;
+			clocks	= <&clk_rg2refck>, <&clk NPCM7XX_CLK_GMAC>;
+			clock-names = "stmmaceth", "clk_gmac";
+			status = "disabled";
+		};
+
+		emc0: eth@f0825000 {
+			device_type = "network";
+			compatible = "nuvoton,npcm750-emc";
+			reg = <0xf0825000 0x1000>;
+			interrupts = <0 16 4>, <0 15 4>;
+			clocks = <&clk NPCM7XX_CLK_EMC>;
+			clock-names = "clk_emc";
+		};
+
+		emc1: eth@f0826000 {
+			device_type = "network";
+			compatible = "nuvoton,npcm750-emc";
+			reg = <0xf0826000 0x1000>;
+			interrupts = <0 115 4>, <0 114 4>;
+			clocks = <&clk NPCM7XX_CLK_EMC>;
+			clock-names = "clk_emc";
+		};
+
+		sdhci0: sdhci@f0840000 {
+			compatible = "nuvoton,npcm750-sdhci";
+			status = "disabled";
+			reg = <0xf0840000 0x200>;
+			interrupts = <0 27 4>;
+			clocks =  <&clk NPCM7XX_CLK_SDHC>;	/*<&clk_xin>*/
+			clock-names = "clk_sdhc";		/*"clk_xin"*/
+		};
+
+		sdhci1: sdhci@f0842000 {
+			compatible = "nuvoton,npcm750-sdhci";
+			status = "disabled";
+			reg = <0xf0842000 0x200>;
+			interrupts = <0 26 4>;
+			clocks =  <&clk NPCM7XX_CLK_MMC>;	/*<&clk_xin>*/
+			clock-names = "clk_mmc";		/*"clk_xin"*/
+		};
+
+		ehci1:ehci@f0806000 {
+			compatible = "nuvoton,npcm750-ehci";
+			reg = <0xf0806000 0x1000>;
+			interrupts = <0 61 4>;
+			status = "disabled";
+		};
+
+		ohci1: ohci@f0807000 {
+			compatible = "nuvoton,npcm750-ohci";
+			reg = <0xf0807000 0x1000>;
+			interrupts = <0 62 4>;
+			status = "disabled";
+		};
+
+		udc0:udc@f0830000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0830000 0x1000
+			       0xfffd0000 0x800>;
+			interrupts = <0 51 4>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_USB_BRIDGE>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc1:udc@f0831000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0831000 0x1000
+			       0xfffd0800 0x800>;
+			interrupts = <0 52 4>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_USB_BRIDGE>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc2:udc@f0832000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0832000 0x1000
+			       0xfffd1000 0x800>;
+			interrupts = <0 53 4>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_USB_BRIDGE>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc3:udc@f0833000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0833000 0x1000
+			       0xfffd1800 0x800>;
+			interrupts = <0 54 4>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_USB_BRIDGE>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc4:udc@f0834000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0834000 0x1000
+			       0xfffd2000 0x800>;
+			interrupts = <0 55 4>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_USB_BRIDGE>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc5:udc@f0835000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0835000 0x1000
+			       0xfffd2800 0x800>;
+			interrupts = <0 56 4>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_USB_BRIDGE>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc6:udc@f0836000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0836000 0x1000
+			       0xfffd3000 0x800>;
+			interrupts = <0 57 4>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_USB_BRIDGE>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc7:udc@f0837000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0837000 0x1000
+			       0xfffd3800 0x800>;
+			interrupts = <0 58 4>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_USB_BRIDGE>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc8:udc@f0838000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0838000 0x1000
+			       0xfffd4000 0x800>;
+			interrupts = <0 59 4>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_USB_BRIDGE>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		udc9:udc@f0839000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0839000 0x1000
+			       0xfffd4800 0x800>;
+			interrupts = <0 60 4>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_USB_BRIDGE>;
+			clock-names = "clk_usb_bridge";
+		};
+
+		aes:aes@f0858000 {
+			compatible = "nuvoton,npcm750-aes";
+			reg = <0xf0858000 0x1000>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_AHB>;
+			clock-names = "clk_ahb";
+		};
+
+		sha:sha@f085a000 {
+			compatible = "nuvoton,npcm750-sha";
+			reg = <0xf085a000 0x1000>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_AHB>;
+			clock-names = "clk_ahb";
+		};
+
+		copr: copr@0 {
+			compatible = "nuvoton,npcm750-copr";
+			interrupts = <0 1 4>;
+			clocks = <&clk NPCM7XX_CLK_AHB>;
+			clock-names = "clk_ahb";
+		};
+
+		vdma: vdma@e0800000 {
+			compatible = "nuvoton,npcm750-vdm";
+			reg = <0xe0800000 0x1000
+				   0xf0822000 0x1000>;
+			interrupts = <0 29 4>;
+		};
+
+		spi0: spi@fb000000 {
+			compatible = "nuvoton,npcm750-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
+			reg-names = "control", "memory";
+			chip-max-address-map = <0x8000000>;
+			clocks = <&clk NPCM7XX_CLK_AHB>;
+			clock-names = "clk_ahb";
+			spi-nor@0 {
+					compatible = "jedec,spi-nor";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					reg = <0>;
+			};
+		};
+		spi3: spi@c0000000 {
+			compatible = "nuvoton,npcm750-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xc0000000 0x1000>, <0xA0000000 0x20000000>;
+			reg-names = "control", "memory";
+			chip-max-address-map = <0x8000000>;
+			clocks = <&clk NPCM7XX_CLK_AHB>;
+			clock-names = "clk_ahb";
+			spi-nor@0 {
+					compatible = "jedec,spi-nor";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					reg = <0>;
+			};
+		};
+
+		pci_rc: axi-pcie@E1000000 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			compatible = "nuvoton,npcm750-pcirc";
+			reg = < 0xE1000000 0x1000 >;
+			device_type = "pci";
+			interrupts = < 0 127 4 >;
+			bus-range = <0x00 0xff>;
+			ranges = <0x02000000 0 0xEA000000 0xEA000000 0 0x02000000>;
+			status = "disabled";
+		};
+
+		dvc: dvc@f0808000 {
+			compatible = "nuvoton,npcm750-dvc";
+			reg = <0xf0808000 0x1000>;
+			interrupts = <0 23 4>;
+		};
+
+		vcd: vcd@0 {
+			compatible = "nuvoton,npcm750-vcd";
+			reg = <0xf0810000 0x10000
+			       0xf0820000 0x2000>;
+			interrupts = <0 22 4>, <0 24 4>;
+		};
+
+		pcimbx: pcimbx@f0848000 {
+			compatible = "nuvoton,npcm750-pcimbx";
+			reg = <0xf0848000 0x10000>;
+			interrupts = <0 8 4>;
+		};
+	};
+
+	apb {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+			ranges = <0xf0000000 0xf0000000 0x00005000
+				  0xf0007000 0xf0007000 0x00009000
+				  0xf0010000 0xf0010000 0x00008000
+				  0xf0080000 0xf0080000 0x00010000
+				  0xf009f000 0xf009f000 0x00001000
+				  0xf0100000 0xf0100000 0x00005000
+				  0xf0180000 0xf0180000 0x0000b000
+				  0xf0200000 0xf0200000 0x00002000>;
+
+		kcs: kcs@f0007000 {
+			compatible = "nuvoton,npcm750-kcs";
+			reg = <0xf0007000 0x1000>;
+			interrupts = <0 9 4>;
+		};
+
+		pspi: pspi@0 {
+			compatible = "nuvoton,npcm750-pspi";
+			reg = <0xf0200000 0x2000>;
+			interrupts = <0 31 4>, <0 28 4>;
+			clocks = <&clk NPCM7XX_CLK_APB5>;
+			clock-names = "clk_apb5";
+		};
+
+		mft: mft@0 {
+			compatible = "nuvoton,npcm750-fan";
+			reg = <0xf0180000 0x8000>;
+			interrupts = <0 96 4>, <0 97 4>, <0 98 4>, <0 99 4>,
+				<0 100 4>, <0 101 4>, <0 102 4>, <0 103 4>;
+			clocks = <&clk NPCM7XX_CLK_APB4>;
+			clock-names = "clk_apb4";
+		};
+
+		gpio: gpio@f0010000 {
+			compatible = "nuvoton,npcm750-gpio";
+			reg = <0xf0010000 0x8000>;
+			interrupts = <0 116 4>, <0 117 4>, <0 118 4>, <0 119 4>,
+				<0 120 4>, <0 121 4>, <0 122 4>, <0 123 4>;
+			clocks = <&clk NPCM7XX_CLK_APB1>;
+			clock-names = "clk_apb1";
+		};
+
+		timer0: timer@f0008000 {
+			compatible = "nuvoton,npcm750-timer";
+			interrupts = <0 32 4>;
+			reg = <0xf0008000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_TIMER>;
+		};
+
+		watchdog0: watchdog@f0008000 {
+			compatible = "nuvoton,npcm750-wdt";
+			interrupts = <0 47 4>;
+			reg = <0xf0008000 0x1000>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_TIMER>;
+		};
+
+		watchdog1: watchdog@f0009000 {
+			compatible = "nuvoton,npcm750-wdt";
+			interrupts = <0 48 4>;
+			reg = <0xf0009000 0x1000>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_TIMER>;
+		};
+
+		watchdog2: watchdog@f000a000 {
+			compatible = "nuvoton,npcm750-wdt";
+			interrupts = <0 49 4>;
+			reg = <0xf000a000 0x1000>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_TIMER>;
+		};
+
+		serial0: serial0@f0001000 {
+			compatible = "nuvoton,npcm750-uart";
+			reg = <0xf0001000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+			interrupts = <0 2 4>;
+			status = "disabled";
+		};
+
+		serial1: serial1@f0002000 {
+			compatible = "nuvoton,npcm750-uart";
+			reg = <0xf0002000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+			interrupts = <0 3 4>;
+			status = "disabled";
+		};
+
+		serial2: serial2@f0003000 {
+			compatible = "nuvoton,npcm750-uart";
+			reg = <0xf0003000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+			interrupts = <0 4 4>;
+			status = "disabled";
+		};
+
+		serial3: serial3@f0004000 {
+			compatible = "nuvoton,npcm750-uart";
+			reg = <0xf0004000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_UART_CORE>;
+			interrupts = <0 5 4>;
+			status = "disabled";
+		};
+
+		rng: rng@f000b000 {
+			compatible = "nuvoton,npcm750-rng";
+			reg = <0xf000b000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_APB1>;
+			clock-names = "clk_apb1";
+			status = "disabled";
+		};
+
+		adc: adc@f000c000 {
+			compatible = "nuvoton,npcm750-adc";
+			reg = <0xf000c000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_ADC>;
+			clock-names = "clk_adc";
+			vref = <2048>;
+		};
+
+		otp:otp@f0189000 {
+			compatible = "nuvoton,npcm750-otp";
+			reg = <0xf0189000 0x1000
+				   0xf018a000 0x1000>;
+			status = "disabled";
+			clocks = <&clk NPCM7XX_CLK_APB4>;
+			clock-names = "clk_apb4";
+		};
+
+		pwm:pwm@f0103000 {
+			compatible = "nuvoton,npcm750-pwm";
+			reg = <0xf0103000 0x1000
+				   0xf0104000 0x1000>;
+			clocks = <&clk NPCM7XX_CLK_APB3>;
+			clock-names = "clk_apb3";
+		};
+
+		i2c0: i2c-bus@f0080000 {
+			reg = <0xf0080000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 64 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb0_pins>;
+			status = "disabled";
+		};
+		i2c1: i2c-bus@f0081000 {
+			reg = <0xf0081000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 65 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb1_pins>;
+			status = "disabled";
+		};
+		i2c2: i2c-bus@f0082000 {
+			reg = <0xf0082000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 66 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb2_pins>;
+			status = "disabled";
+		};
+		i2c3: i2c-bus@f0083000 {
+			reg = <0xf0083000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 67 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb3_pins>;
+			status = "disabled";
+		};
+		i2c4: i2c-bus@f0084000 {
+			reg = <0xf0084000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 68 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb4_pins>;
+			status = "disabled";
+		};
+		i2c5: i2c-bus@f0085000 {
+			reg = <0xf0085000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 69 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb5_pins>;
+			status = "disabled";
+		};
+		i2c6: i2c-bus@f0086000 {
+			reg = <0xf0086000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 70 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb6_pins>;
+			status = "disabled";
+		};
+		i2c7: i2c-bus@f0087000 {
+			reg = <0xf0087000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 71 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb7_pins>;
+			status = "disabled";
+		};
+		i2c8: i2c-bus@f0088000 {
+			reg = <0xf0088000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 72 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb8_pins>;
+			status = "disabled";
+		};
+		i2c9: i2c-bus@f0089000 {
+			reg = <0xf0089000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 73 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb9_pins>;
+			status = "disabled";
+		};
+		i2c10: i2c-bus@f008a000 {
+			reg = <0xf008a000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 74 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb10_pins>;
+			status = "disabled";
+		};
+		i2c11: i2c-bus@f008b000 {
+			reg = <0xf008b000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 75 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb11_pins>;
+			status = "disabled";
+		};
+		i2c12: i2c-bus@f008c000 {
+			reg = <0xf008c000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 76 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb12_pins>;
+			status = "disabled";
+		};
+		i2c13: i2c-bus@f008d000 {
+			reg = <0xf008d000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 77 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb13_pins>;
+			status = "disabled";
+		};
+		i2c14: i2c-bus@f008e000 {
+			reg = <0xf008e000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 78 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb14_pins>;
+			status = "disabled";
+		};
+		i2c15: i2c-bus@f008f000 {
+			reg = <0xf008f000 0x1000>;
+			compatible = "nuvoton,npcm750-i2c-bus";
+			clocks = <&clk NPCM7XX_CLK_APB2>;
+			bus-frequency = <100000>;
+			interrupts = <0 79 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&smb15_pins>;
+			status = "disabled";
+		};
+	};
+	pinctrl: pinctrl@0 {
+		compatible = "nuvoton,npcmx50-pinctrl";
+		status = "okay";
+		iox1_pins: iox1_pins {
+			groups = "iox1";
+			function = "iox1";
+		};
+		iox2_pins: iox2_pins {
+			groups = "iox2";
+			function = "iox2";
+		};
+		smb1d_pins: smb1d_pins {
+			groups = "smb1d";
+			function = "smb1d";
+		};
+		smb2d_pins: smb2d_pins {
+			groups = "smb2d";
+			function = "smb2d";
+		};
+		lkgpo1_pins: lkgpo1_pins {
+			groups = "lkgpo1";
+			function = "lkgpo1";
+		};
+		lkgpo2_pins: lkgpo2_pins {
+			groups = "lkgpo2";
+			function = "lkgpo2";
+		};
+		ioxh_pins: ioxh_pins {
+			groups = "ioxh";
+			function = "ioxh";
+		};
+		gspi_pins: gspi_pins {
+			groups = "gspi";
+			function = "gspi";
+		};
+		smb5b_pins: smb5b_pins {
+			groups = "smb5b";
+			function = "smb5b";
+		};
+		smb5c_pins: smb5c_pins {
+			groups = "smb5c";
+			function = "smb5c";
+		};
+		lkgpo0_pins: lkgpo0_pins {
+			groups = "lkgpo0";
+			function = "lkgpo0";
+		};
+		pspi2_pins: pspi2_pins {
+			groups = "pspi2";
+			function = "pspi2";
+		};
+		smb4den_pins: smb4den_pins {
+			groups = "smb4den";
+			function = "smb4den";
+		};
+		smb4b_pins: smb4b_pins {
+			groups = "smb4b";
+			function = "smb4b";
+		};
+		smb4c_pins: smb4c_pins {
+			groups = "smb4c";
+			function = "smb4c";
+		};
+		smb15_pins: smb15_pins {
+			groups = "smb15";
+			function = "smb15";
+		};
+		smb4d_pins: smb4d_pins {
+			groups = "smb4d";
+			function = "smb4d";
+		};
+		smb14_pins: smb14_pins {
+			groups = "smb14";
+			function = "smb14";
+		};
+		smb5_pins: smb5_pins {
+			groups = "smb5";
+			function = "smb5";
+		};
+		smb4_pins: smb4_pins {
+			groups = "smb4";
+			function = "smb4";
+		};
+		smb3_pins: smb3_pins {
+			groups = "smb3";
+			function = "smb3";
+		};
+		spi0cs1_pins: spi0cs1_pins {
+			groups = "spi0cs1";
+			function = "spi0cs1";
+		};
+		spi0quad_pins: spi0quad_pins {
+			groups = "spi0quad";
+			function = "spi0quad";
+		};
+		spi0cs2_pins: spi0cs2_pins {
+			groups = "spi0cs2";
+			function = "spi0cs2";
+		};
+		spi0cs3_pins: spi0cs3_pins {
+			groups = "spi0cs3";
+			function = "spi0cs3";
+		};
+		smb3c_pins: smb3c_pins {
+			groups = "smb3c";
+			function = "smb3c";
+		};
+		smb3b_pins: smb3b_pins {
+			groups = "smb3b";
+			function = "smb3b";
+		};
+		bmcuart0a_pins: bmcuart0a_pins {
+			groups = "bmcuart0a";
+			function = "bmcuart0a";
+		};
+		uart1_pins: uart1_pins {
+			groups = "uart1";
+			function = "uart1";
+		};
+		jtag2_pins: jtag2_pins {
+			groups = "jtag2";
+			function = "jtag2";
+		};
+		bmcuart1_pins: bmcuart1_pins {
+			groups = "bmcuart1";
+			function = "bmcuart1";
+		};
+		uart2_pins: uart2_pins {
+			groups = "uart2";
+			function = "uart2";
+		};
+		bmcuart0b_pins: bmcuart0b_pins {
+			groups = "bmcuart0b";
+			function = "bmcuart0b";
+		};
+		r1err_pins: r1err_pins {
+			groups = "r1err";
+			function = "r1err";
+		};
+		r1md_pins: r1md_pins {
+			groups = "r1md";
+			function = "r1md";
+		};
+		smb3d_pins: smb3d_pins {
+			groups = "smb3d";
+			function = "smb3d";
+		};
+		fanin0_pins: fanin0_pins {
+			groups = "fanin0";
+			function = "fanin0";
+		};
+		fanin1_pins: fanin1_pins {
+			groups = "fanin1";
+			function = "fanin1";
+		};
+		fanin2_pins: fanin2_pins {
+			groups = "fanin2";
+			function = "fanin2";
+		};
+		fanin3_pins: fanin3_pins {
+			groups = "fanin3";
+			function = "fanin3";
+		};
+		fanin4_pins: fanin4_pins {
+			groups = "fanin4";
+			function = "fanin4";
+		};
+		fanin5_pins: fanin5_pins {
+			groups = "fanin5";
+			function = "fanin5";
+		};
+		fanin6_pins: fanin6_pins {
+			groups = "fanin6";
+			function = "fanin6";
+		};
+		fanin7_pins: fanin7_pins {
+			groups = "fanin7";
+			function = "fanin7";
+		};
+		fanin8_pins: fanin8_pins {
+			groups = "fanin8";
+			function = "fanin8";
+		};
+		fanin9_pins: fanin9_pins {
+			groups = "fanin9";
+			function = "fanin9";
+		};
+		fanin10_pins: fanin10_pins {
+			groups = "fanin10";
+			function = "fanin10";
+		};
+		fanin11_pins: fanin11_pins {
+			groups = "fanin11";
+			function = "fanin11";
+		};
+		fanin12_pins: fanin12_pins {
+			groups = "fanin12";
+			function = "fanin12";
+		};
+		fanin13_pins: fanin13_pins {
+			groups = "fanin13";
+			function = "fanin13";
+		};
+		fanin14_pins: fanin14_pins {
+			groups = "fanin14";
+			function = "fanin14";
+		};
+		fanin15_pins: fanin15_pins {
+			groups = "fanin15";
+			function = "fanin15";
+		};
+		pwm0_pins: pwm0_pins {
+			groups = "pwm0";
+			function = "pwm0";
+		};
+		pwm1_pins: pwm1_pins {
+			groups = "pwm1";
+			function = "pwm1";
+		};
+		pwm2_pins: pwm2_pins {
+			groups = "pwm2";
+			function = "pwm2";
+		};
+		pwm3_pins: pwm3_pins {
+			groups = "pwm3";
+			function = "pwm3";
+		};
+		r2_pins: r2_pins {
+			groups = "r2";
+			function = "r2";
+		};
+		r2err_pins: r2err_pins {
+			groups = "r2err";
+			function = "r2err";
+		};
+		r2md_pins: r2md_pins {
+			groups = "r2md";
+			function = "r2md";
+		};
+		ga20kbc_pins: ga20kbc_pins {
+			groups = "ga20kbc";
+			function = "ga20kbc";
+		};
+		smb5d_pins: smb5d_pins {
+			groups = "smb5d";
+			function = "smb5d";
+		};
+		lpc_pins: lpc_pins {
+			groups = "lpc";
+			function = "lpc";
+		};
+		espi_pins: espi_pins {
+			groups = "espi";
+			function = "espi";
+		};
+		rg1_pins: rg1_pins {
+			groups = "rg1";
+			function = "rg1";
+		};
+		rg1mdio_pins: rg1mdio_pins {
+			groups = "rg1mdio";
+			function = "rg1mdio";
+		};
+		rg2_pins: rg2_pins {
+			groups = "rg2";
+			function = "rg2";
+		};
+		ddr_pins: ddr_pins {
+			groups = "ddr";
+			function = "ddr";
+		};
+		smb0_pins: smb0_pins {
+			groups = "smb0";
+			function = "smb0";
+		};
+		smb1_pins: smb1_pins {
+			groups = "smb1";
+			function = "smb1";
+		};
+		smb2_pins: smb2_pins {
+			groups = "smb2";
+			function = "smb2";
+		};
+		smb2c_pins: smb2c_pins {
+			groups = "smb2c";
+			function = "smb2c";
+		};
+		smb2b_pins: smb2b_pins {
+			groups = "smb2b";
+			function = "smb2b";
+		};
+		smb1c_pins: smb1c_pins {
+			groups = "smb1c";
+			function = "smb1c";
+		};
+		smb1b_pins: smb1b_pins {
+			groups = "smb1b";
+			function = "smb1b";
+		};
+		smb8_pins: smb8_pins {
+			groups = "smb8";
+			function = "smb8";
+		};
+		smb9_pins: smb9_pins {
+			groups = "smb9";
+			function = "smb9";
+		};
+		smb10_pins: smb10_pins {
+			groups = "smb10";
+			function = "smb10";
+		};
+		smb11_pins: smb11_pins {
+			groups = "smb11";
+			function = "smb11";
+		};
+		sd1_pins: sd1_pins {
+			groups = "sd1";
+			function = "sd1";
+		};
+		sd1pwr_pins: sd1pwr_pins {
+			groups = "sd1pwr";
+			function = "sd1pwr";
+		};
+		pwm4_pins: pwm4_pins {
+			groups = "pwm4";
+			function = "pwm4";
+		};
+		pwm5_pins: pwm5_pins {
+			groups = "pwm5";
+			function = "pwm5";
+		};
+		pwm6_pins: pwm6_pins {
+			groups = "pwm6";
+			function = "pwm6";
+		};
+		pwm7_pins: pwm7_pins {
+			groups = "pwm7";
+			function = "pwm7";
+		};
+		mmc8_pins: mmc8_pins {
+			groups = "mmc8";
+			function = "mmc8";
+		};
+		mmc_pins: mmc_pins {
+			groups = "mmc";
+			function = "mmc";
+		};
+		mmcwp_pins: mmcwp_pins {
+			groups = "mmcwp";
+			function = "mmcwp";
+		};
+		mmccd_pins: mmccd_pins {
+			groups = "mmccd";
+			function = "mmccd";
+		};
+		mmcrst_pins: mmcrst_pins {
+			groups = "mmcrst";
+			function = "mmcrst";
+		};
+		clkout_pins: clkout_pins {
+			groups = "clkout";
+			function = "clkout";
+		};
+		serirq_pins: serirq_pins {
+			groups = "serirq";
+			function = "serirq";
+		};
+		scipme_pins: scipme_pins {
+			groups = "scipme";
+			function = "scipme";
+		};
+		sci_pins: sci_pins {
+			groups = "sci";
+			function = "sci";
+		};
+		smb6_pins: smb6_pins {
+			groups = "smb6";
+			function = "smb6";
+		};
+		smb7_pins: smb7_pins {
+			groups = "smb7";
+			function = "smb7";
+		};
+		pspi1_pins: pspi1_pins {
+			groups = "pspi1";
+			function = "pspi1";
+		};
+		faninx_pins: faninx_pins {
+			groups = "faninx";
+			function = "faninx";
+		};
+		r1_pins: r1_pins {
+			groups = "r1";
+			function = "r1";
+		};
+		spi3_pins: spi3_pins {
+			groups = "spi3";
+			function = "spi3";
+		};
+		spi3cs1_pins: spi3cs1_pins {
+			groups = "spi3cs1";
+			function = "spi3cs1";
+		};
+		spi3quad_pins: spi3quad_pins {
+			groups = "spi3quad";
+			function = "spi3quad";
+		};
+		spi3cs2_pins: spi3cs2_pins {
+			groups = "spi3cs2";
+			function = "spi3cs2";
+		};
+		spi3cs3_pins: spi3cs3_pins {
+			groups = "spi3cs3";
+			function = "spi3cs3";
+		};
+		nprd_smi_pins: nprd_smi_pins {
+			groups = "nprd_smi";
+			function = "nprd_smi";
+		};
+		smb0b_pins: smb0b_pins {
+			groups = "smb0b";
+			function = "smb0b";
+		};
+		smb0c_pins: smb0c_pins {
+			groups = "smb0c";
+			function = "smb0c";
+		};
+		smb0den_pins: smb0den_pins {
+			groups = "smb0den";
+			function = "smb0den";
+		};
+		smb0d_pins: smb0d_pins {
+			groups = "smb0d";
+			function = "smb0d";
+		};
+		ddc_pins: ddc_pins {
+			groups = "ddc";
+			function = "ddc";
+		};
+		rg2mdio_pins: rg2mdio_pins {
+			groups = "rg2mdio";
+			function = "rg2mdio";
+		};
+		wdog1_pins: wdog1_pins {
+			groups = "wdog1";
+			function = "wdog1";
+		};
+		wdog2_pins: wdog2_pins {
+			groups = "wdog2";
+			function = "wdog2";
+		};
+		smb12_pins: smb12_pins {
+			groups = "smb12";
+			function = "smb12";
+		};
+		smb13_pins: smb13_pins {
+			groups = "smb13";
+			function = "smb13";
+		};
+		spix_pins: spix_pins {
+			groups = "spix";
+			function = "spix";
+		};
+		spixcs1_pins: spixcs1_pins {
+			groups = "spixcs1";
+			function = "spixcs1";
+		};
+		clkreq_pins: clkreq_pins {
+			groups = "clkreq";
+			function = "clkreq";
+		};
+	};
+};
-- 
2.14.1
