Return-Path: <c_mykolak@mellanox.com>
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wccnZ30w9zDq9m
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 01:23:29 +1000 (AEST)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 c?mykolak@mellanox.com)
 with ESMTPS (AES256-SHA encrypted); 30 May 2017 18:23:23 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx
 [10.209.0.190])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id v4UFNNHb031114;
 Tue, 30 May 2017 18:23:23 +0300
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Mykola Kostenok <c_mykolak@mellanox.com>
Subject: [PATCH linux dev-4.10 v4] ARM: aspeed: Add Mellanox MSN machine
 (device tree)
Date: Tue, 30 May 2017 18:22:46 +0300
Message-Id: <20170530152246.108806-1-c_mykolak@mellanox.com>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Tue, 30 May 2017 15:23:31 -0000

Initial introduction of Mellanox switches of MSNXXXX family equipped
with Aspeed 2520 BMC SoC. This adds msn platform device tree file.

Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
---
v1->v2
Fixed issues pointed out by Joel:
- Make commit title shorter.
- Replace flash layout from separate dtsi to dts.
- Change compatible = "mellanox,msnxxxx-bmc" to "mellanox,msn-bmc".
- Remove no-hw-checksum from dts.
- Add comments.
- Remove WD2 disable from aspeed.c
- Add wdt2 to dts.

v2->v3
Fixed issues pointed out by Joel:
- Split v2 patch into three separate.
- Remove unnesesary include in dts.
- Replace flash layout to separate dsti.
- Remove spi2 as it was disabled.
- Add uart1 pinctrl.

v3->v4
Fixed issues pointed by Andrew:
- Make i2c bus aliases instead empty nodes.
---
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 .../dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi  |  32 ++++
 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts      | 162 +++++++++++++++++++++
 4 files changed, 196 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 16d3b5e7f5d1..84601d869a1b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -172,6 +172,7 @@ meas	Measurement Specialties
 mediatek	MediaTek Inc.
 melexis	Melexis N.V.
 melfas	MELFAS Inc.
+mellanox	Mellanox Technologies
 memsic	MEMSIC Inc.
 merrii	Merrii Technology Co., Ltd.
 micrel	Micrel Inc.
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 30fe65627f30..3dba6c633686 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -990,6 +990,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
+	aspeed-bmc-mellanox-msn.dtb \
 	aspeed-ast2500-evb.dtb
 endif
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
new file mode 100644
index 000000000000..cf8ee54f13c2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
@@ -0,0 +1,32 @@
+/* This file is the label for the bmc primary flash and its partitions */
+				label = "bmc";
+				#address-cells = < 1 >;
+				#size-cells = < 1 >;
+				u-boot {
+					reg = < 0 0x60000 >;
+					label = "u-boot";
+				};
+				u-boot-env {
+					reg = < 0x60000 0x10000>;
+					label = "u-boot-env";
+				};
+				kernel  {
+					reg = < 0x70000 0x280000 >;
+					label = "kernel";
+				};
+				dtb  {
+					reg = < 0x2f0000 0x10000 >;
+					label = "dtb";
+				};
+				initramfs {
+					reg = < 0x300000 0x1c0000 >;
+					label = "initramfs";
+				};
+				rofs  {
+					reg = < 0x4c0000 0x1740000 >;
+					label = "rofs";
+				};
+				rwfs  {
+					reg = < 0x1c00000 0x400000 >;
+					label = "rwfs";
+				};
diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
new file mode 100644
index 000000000000..955b90655a56
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
@@ -0,0 +1,162 @@
+/dts-v1/;
+
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include "aspeed-g5.dtsi"
+
+/ {
+	model = "MSN BMC";
+	compatible = "mellanox,msn-bmc", "aspeed,ast2500";
+
+	aliases {
+		serial0 = &uart1;
+		serial4 = &uart5;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c7 = &i2c7;
+		i2c9 = &i2c9;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200n8 earlyprintk";
+	};
+
+	memory {
+		/* 512MiB SDRAM DDR4 @ 0x8000_0000 */
+		reg = <0x80000000 0x20000000>;
+	};
+
+	ahb {
+		bmc_pnor: fmc@1e620000 {
+			reg = < 0x1e620000 0xc4
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,ast2500-fmc";
+			interrupts = <19>;
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+#include "aspeed-bmc-mellanox-msn-flash-layout.dtsi"
+			};
+		};
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+		     &pinctrl_rxd1_default
+		     &pinctrl_nrts1_default
+		     &pinctrl_ndtr1_default
+		     &pinctrl_ndsr1_default
+		     &pinctrl_ncts1_default
+		     &pinctrl_ndcd1_default
+		     &pinctrl_nri1_default>;
+};
+
+&mac0 {
+	status = "okay";
+	use-ncsi;
+};
+
+&i2c5 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+	};
+
+	eeprom@52 {
+		compatible = "atmel,24c32";
+		reg = <0x52>;
+	};
+
+	eeprom@55 {
+		compatible = "atmel,24c32";
+		reg = <0x55>;
+	};
+
+	i2cswitch@71 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	carrier_ambient: lm75@49 {
+		#thermal-sensor-cells = <0>;
+		compatible = "national,lm75";
+		reg = <0x49>;
+	};
+
+	swbrd_ambient: lm75@4a {
+		#thermal-sensor-cells = <0>;
+		compatible = "national,lm75";
+		reg = <0x4a>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+
+	hwmon@41 {
+		compatible = "ti,ucd9224";
+		reg = <0x41>;
+	};
+
+	hwmon@27 {
+		compatible = "ti,ucd9224";
+		reg = <0x27>;
+	};
+
+	adc@6d {
+		compatible = "maxim,max11603";
+		reg = <0x6d>;
+		adc0: iio-device@0 {
+			#io-channel-cells = <1>;
+			io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>,
+				      <&adc0 3>, <&adc0 4>, <&adc0 5>,
+				      <&adc0 6>, <&adc0 7>;
+		};
+	};
+};
+
+&vuart {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
-- 
2.11.0
