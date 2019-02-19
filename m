Return-Path: <prvs=946cac0fc=Fran.Hsu@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=946cac0fc=fran.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 669 seconds by postgrey-1.36 at bilbo;
 Wed, 20 Feb 2019 01:21:37 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 443jbP6hhwzDqHF
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 01:21:36 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 19 Feb 2019 22:10:24 +0800
Received: from localhost.localdomain (10.243.91.252) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Tue, 19 Feb
 2019 22:10:21 +0800
From: <fran.hsu@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
CC: <openbmc@lists.ozlabs.org>, <fran.hsu@1uantatw.com>, FranHsu
 <Fran.Hsu@quantatw.com>
Subject: [PATCH dev-4.19 v1] 	Add device tree for Quanta GSJ board.
Date: Tue, 19 Feb 2019 22:10:00 +0800
Message-ID: <20190219141000.18042-1-fran.hsu@quantatw.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx07.quanta.corp (10.243.91.102) To
 mailbx06.quanta.corp (10.243.91.101)
X-TM-AS-Product-Ver: SMEX-12.0.0.1727-8.200.1013-24436.000
X-TM-AS-Result: No--4.659300-0.000000-31
X-TM-AS-MatchedID: 712203-708752-863519-708712-701708-703523-701016-703529-7
 04425-188019-700324-121336-711871-701040-702609-700264-186003-700802-700624
 -780012-700172-702495-711031-700918-703965-704473-121169-700648-702829-1480
 04-148036-42000-42003-63-190014
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
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
X-List-Received-Date: Tue, 19 Feb 2019 14:21:39 -0000

From: FranHsu <Fran.Hsu@quantatw.com>

	Tested: This commit included the first version of Quanta GSJ device tree.
            And it could build successfully with the Nuvoton kernel branch 
            "Poleg-4.19.16-OpenBMC". And it could be booted on EVB.

Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 463 ++++++++++++++++++++++
 1 file changed, 463 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
new file mode 100644
index 000000000000..f5671c9a6bc6
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -0,0 +1,463 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Quanta Computer lnc. Fran.Hsu@quantatw.com
+
+/dts-v1/;
+#include "nuvoton-npcm730.dtsi"
+
+/ {
+	model = "Quanta GSJ Board (Device Tree v1)";
+	compatible = "nuvoton,npcm750";
+
+	aliases {
+		ethernet1 = &gmac0;
+		serial3 = &serial3;
+		udc9 = &udc9;
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
+		spi0 = &spi0;
+		spi1 = &spi1;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+		fiu2 = &fiux;
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
+		gmac0: eth@f0802000 {
+			reg = <0xf0802000 0x2000>;
+			phy-mode = "rgmii-id";
+			status = "okay";
+		};
+
+		ehci1: usb@f0806000 {
+			status = "okay";
+		};
+
+		ohci1: ohci@f0807000 {
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
+		fiu0: fiu@fb000000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0cs1_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-rx-bus-width = <2>;
+				partitions@80000000 {
+						compatible = "fixed-partitions";
+						#address-cells = <1>;
+						#size-cells = <1>;
+						bmc@0{
+							label = "bmc";
+							reg = <0x000000 0x4000000>;
+						};
+						u-boot@0 {
+							label = "u-boot";
+							reg = <0x0000000 0x80000>;
+						};
+						envparam@100000 {
+							label = "env-param";
+							reg = <0x0100000 0x40000>;
+						};
+						kernel@200000 {
+							label = "kernel";
+							reg = <0x0200000 0x580000>;
+						};
+						rofs@C00000 {
+							label = "rofs";
+							reg = <0x0C00000 0x2600000>;
+						};
+						rwfs@3200000 {
+							label = "rwfs";
+							reg = <0x3200000 0xE00000>;
+						};
+				};
+			};
+		};
+
+		fiu3: fiu@c0000000 {
+			pinctrl-0 = <&spi3_pins>;
+			status = "disabled";
+		};
+
+		fiux: fiu@fb001000 {
+			status = "disabled";
+			spix-mode;
+		};
+
+		sdhci0: sdhci@f0842000 {
+			status = "disabled";
+		};
+
+		pcimbox: pcimbox@f0848000 {
+			status = "okay";
+		};
+
+		vcd: vcd@f0810000 {
+			status = "disabled";
+		};
+
+		ece: ece@f0820000 {
+			status = "okay";
+		};
+
+		apb {
+
+			watchdog1: watchdog@901C {
+				status = "okay";
+			};
+
+			rng: rng@b000 {
+				status = "okay";
+			};
+
+			serial0: serial@1000 {
+				status = "okay";
+			};
+
+			serial1: serial@2000 {
+				status = "okay";
+			};
+
+			serial2: serial@3000 {
+				status = "okay";
+			};
+
+			serial3: serial@4000 {
+				status = "okay";
+			};
+
+			adc: adc@c000 {
+				status = "okay";
+			};
+			otp:otp@189000 {
+				status = "okay";
+			};
+
+			i2c0: i2c@80000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@81000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c2: i2c@82000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c3: i2c@83000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c4: i2c@84000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c5: i2c@85000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "disabled";
+			};
+
+			i2c6: i2c@86000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "disabled";
+			};
+
+			i2c7: i2c@87000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "disabled";
+			};
+
+			i2c8: i2c@88000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c9: i2c@89000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				eeprom@55 {
+					compatible = "atmel,24c64";
+					reg = <0x55>;
+				};
+			};
+
+			i2c10: i2c@8a000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				eeprom@55 {
+					compatible = "atmel,24c64";
+					reg = <0x55>;
+				};
+			};
+
+			i2c11: i2c@8b000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+
+				/* P12V Quarter Brick DC/DC Power Module Q54SH12050 @60 */
+				power-brick@60 {
+					compatible = "delta,dps800";
+					reg = <0x60>;
+				};
+			};
+
+			i2c12: i2c@8c000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c13: i2c@8d000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c14: i2c@8e000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c15: i2c@8f000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+
+				i2c-switch@75 {
+					compatible = "nxp,pca9548";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x75>;
+					i2c-mux-idle-disconnect;
+
+					i2c_u20: i2c-bus@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c_u21: i2c-bus@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+
+					i2c_u22: i2c-bus@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c_u23: i2c-bus@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+
+					i2c_u24: i2c-bus@4 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <4>;
+					};
+
+					i2c_u25: i2c-bus@5 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <5>;
+					};
+
+					i2c_u26: i2c-bus@6 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <6>;
+					};
+
+					i2c_u27: i2c-bus@7 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <7>;
+					};
+				};
+			};
+
+			pwm_fan:pwm-fan-controller@103000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <   &pwm0_pins &pwm1_pins &pwm2_pins
+						&fanin0_pins &fanin1_pins
+						&fanin2_pins &fanin3_pins
+						&fanin4_pins &fanin5_pins>;
+				status = "okay";
+				fan@0 {
+					reg = <0x00>;
+					fan-tach-ch = /bits/ 8 <0x00 0x01>;
+					cooling-levels = <127 255>;
+				};
+				fan@1 {
+					reg = <0x01>;
+					fan-tach-ch = /bits/ 8 <0x02 0x03>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@2 {
+					reg = <0x02>;
+					fan-tach-ch = /bits/ 8 <0x04 0x05>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@3 {
+					reg = <0x03>;
+					fan-tach-ch = /bits/ 8 <0x06 0x07>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@4 {
+					reg = <0x04>;
+					fan-tach-ch = /bits/ 8 <0x08 0x09>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@5 {
+					reg = <0x05>;
+					fan-tach-ch = /bits/ 8 <0x0A 0x0B>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+			};
+
+			spi0: spi@200000 {
+				status = "disabled";
+			};
+
+			spi1: spi@201000 {
+				status = "disabled";
+			};
+
+		};
+	};
+
+	pinctrl: pinctrl@f0800000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <
+				&gpio8_pins
+				&gpio9_pins
+				&gpio12_pins
+				&gpio13_pins
+				&gpio15_pins
+				&gpio14_pins
+				&gpio23_pins
+				&gpio91_pins
+				&gpio92_pins
+				&gpio95_pins
+				&gpio141_pins
+				&gpio148_pins
+				&gpio149_pins
+				&gpio136_pins
+				&gpio137_pins
+				&gpio150_pins
+				&gpio151_pins
+				&gpio152_pins
+				&gpio153_pins
+				&gpio154_pins
+				&gpio155_pins
+				&gpio159_pins
+				&gpio161_pins
+				&gpio162_pins
+				&gpio163_pins
+				&gpio164_pins
+				&gpio165_pins
+				&gpio166_pins
+				&gpio167_pins
+				&gpio168_pins
+				&gpio169_pins
+				&gpio170_pins
+				&gpio175_pins
+				&gpio176_pins
+				&gpio177_pins
+				&gpio192_pins
+				&gpio203_pins
+				>;
+	};
+
+
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio143ol_pins>;
+
+		led {
+			label = "led-bmc-live";
+			gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
-- 
2.20.1
