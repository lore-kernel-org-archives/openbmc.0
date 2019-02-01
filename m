Return-Path: <prvs=9281b6405=Samuel.Jiang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=9281b6405=samuel.jiang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 43rVtV4qltzDqfS
 for <openbmc@lists.ozlabs.org>; Fri,  1 Feb 2019 19:40:50 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 01 Feb 2019 16:40:43 +0800
Received: from samueljiang-System-Product-Name.dhcpserver.local
 (10.243.91.252) by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1531.3; Fri, 1 Feb 2019 16:40:41 +0800
From: <Samuel.Jiang@quantatw.com>
To: <KWLIU@nuvoton.com>, <joel@jms.id.au>, <tomer.maimon@nuvoton.com>,
 <fran.hsu@quantatw.com>
CC: <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 1/6] Add device tree for Nuvoton RunBMC Module board
Date: Fri, 1 Feb 2019 16:40:22 +0800
Message-ID: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx07.quanta.corp (10.243.91.102) To
 mailbx06.quanta.corp (10.243.91.101)
X-TM-AS-Product-Ver: SMEX-12.0.0.1727-8.200.1013-24402.003
X-TM-AS-Result: No--2.553000-0.000000-31
X-TM-AS-MatchedID: 708712-700918-711871-702495-701016-703529-704425-188019-7
 00324-121336-702796-701040-702609-700264-186003-700802-700624-703523-780012
 -700172-121169-148004-148036-42000-42003-63
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
X-List-Received-Date: Fri, 01 Feb 2019 08:40:51 -0000

From: Samuel Jiang <Samuel.Jiang@quantatw.com>

Initial device tree for Nuvoton RunBMC Module based on Nuvoton EVB board

Including features:
1. image partitions
2. pwm fan controller
3. lpc and kcs
4. usb
5. serial port
6. spi
7. fiu
8. watchdog

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 343 +++++++++++++++++++
 1 file changed, 343 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
new file mode 100644
index 000000000000..7ab03add7f9c
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
+// Copyright 2018 Google, Inc.
+
+/dts-v1/;
+#include "nuvoton-npcm750.dtsi"
+
+/ {
+	model = "Nuvoton npcm750 RunBMC Module";
+	compatible = "nuvoton,npcm750";
+
+	aliases {
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
+
+		ehci1: usb@f0806000 {
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
+							reg = <0x0000000 0x2000000>;
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
+						rofs@780000 {
+							label = "rofs";
+							reg = <0x0780000 0x1680000>;
+						};
+						rwfs@1e00000 {
+							label = "rwfs";
+							reg = <0x1e00000 0x200000>;
+						};
+				};
+			};
+			spi-nor@1 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <1>;
+				npcm,fiu-rx-bus-width = <2>;
+				partitions@88000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spare1@0 {
+						label = "spi0-cs1-spare1";
+						reg = <0x0 0x800000>;
+					};
+					spare2@800000 {
+						label = "spi0-cs1-spare2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+
+		fiu3: fiu@c0000000 {
+			pinctrl-0 = <&spi3_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-rx-bus-width = <2>;
+				partitions@A0000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					system1@0 {
+						label = "spi3-system1";
+						reg = <0x0 0x800000>;
+					};
+					system2@800000 {
+						label = "spi3-system2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+
+		fiux: fiu@fb001000 {
+			status = "disabled";
+			spix-mode;
+		};
+
+		sdhci0: sdhci@f0842000 {
+			status = "okay";
+		};
+
+		pcimbox: pcimbox@f0848000 {
+			status = "okay";
+		};
+
+		vcd: vcd@f0810000 {
+			status = "okay";
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
+			lpc_kcs: lpc_kcs@7000 {
+				kcs1: kcs1@0 {
+					status = "okay";
+				};
+
+				kcs2: kcs2@0 {
+					status = "okay";
+				};
+
+				kcs3: kcs3@0 {
+					status = "okay";
+				};
+			};
+
+			lpc_host: lpc_host@7000 {
+				lpc_bpc: lpc_bpc@40 {
+					monitor-ports = <0x80>;
+					status = "okay";
+				};
+			};
+
+			pwm_fan:pwm-fan-controller@103000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <   &pwm0_pins &pwm1_pins
+								&fanin0_pins &fanin1_pins
+								&fanin2_pins &fanin3_pins
+								&fanin4_pins &fanin5_pins
+								&fanin6_pins &fanin7_pins
+								&fanin8_pins &fanin9_pins
+								&fanin10_pins &fanin11_pins>;
+						status = "okay";
+
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
+				fan@6 {
+					reg = <0x06>;
+					fan-tach-ch = /bits/ 8 <0x0C 0x0D>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@7 {
+					reg = <0x07>;
+					fan-tach-ch = /bits/ 8 <0x0E 0x0F>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+			};
+
+			spi0: spi@200000 {
+				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+				status = "okay";
+			};
+
+			spi1: spi@201000 {
+				status = "okay";
+			};
+
+		};
+	};
+
+	pinctrl: pinctrl@f0800000 {
+		pinctrl-names = "default";
+
+	};
+
+};
+
+&gcr {
+	serial_port_mux: mux-controller {
+		compatible = "mmio-mux";
+		#mux-control-cells = <1>;
+
+		mux-reg-masks = <0x38 0x07>;
+		idle-states = <6>; /* Serial port mode 7 (takeover) */
+	};
+};
-- 
2.17.1
