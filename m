Return-Path: <cyrilbur@gmail.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0cl12nqQzDqCC
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:29:17 +1000 (AEST)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 5 May 2016 11:29:16 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 5 May 2016 11:29:14 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: cyrilbur@gmail.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 072EC2CE805C
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:29:13 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u451T3jV55836776
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:29:12 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u451SdrC023152
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:28:39 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u451Sc7A022690; Thu, 5 May 2016 11:28:38 +1000
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1EB89A0306;
 Thu,  5 May 2016 11:27:40 +1000 (AEST)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: gwshan@linux.vnet.ibm.com
Subject: [PATCH 3/6] arm/dts: Add Firestone BMC board
Date: Thu,  5 May 2016 11:27:13 +1000
Message-Id: <1462411636-7225-4-git-send-email-cyrilbur@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050501-0025-0000-0000-0000048887C1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 May 2016 01:29:17 -0000

From: Joel Stanley <joel@jms.id.au>

The Firestone is an IBM made OpenPower machine that uses the ast2400
BMC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 133 +++++++++++++++++++++++++
 arch/arm/boot/dts/ast2400.dtsi                 |   4 +
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
new file mode 100644
index 0000000..2b988e7
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -0,0 +1,133 @@
+/dts-v1/;
+
+#include "ast2400.dtsi"
+
+/ {
+	model = "Firestone BMC";
+	compatible = "ibm,firestone-bmc", "aspeed,ast2400";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,38400";
+	};
+
+	memory {
+		reg = < 0x40000000 0x20000000 >;
+	};
+
+	ahb {
+		fmc@1e620000 {
+			reg = < 0x1e620000 0x94
+				0x20000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,fmc";
+			flash@0 {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				/*
+				 * Possibly required props:
+				 * spi-max-frequency = <>
+				 * spi-tx-bus-width = <>
+				 * spi-rx-bus-width  = <>
+				 * m25p,fast-read
+				 * spi-cpol if inverse clock polarity (CPOL)
+				 * spi-cpha if shifted clock phase (CPHA)
+				 */
+#include "aspeed-bmc-opp-flash-layout.dtsi"
+			};
+		};
+		spi@1e630000 {
+			reg = < 0x1e630000 0x18
+				0x30000000 0x02000000 >;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "aspeed,smc";
+			flash {
+				reg = < 0 >;
+				compatible = "jedec,spi-nor" ;
+				label = "pnor";
+				/* spi-max-frequency = <>; */
+				/* m25p,fast-read; */
+			};
+		};
+		apb {
+			i2c: i2c@1e78a040 {
+				i2c0: i2c-bus@40 {
+					// grounded
+				};
+				i2c1: i2c-bus@80 {
+					// grounded
+				};
+				i2c2: i2c-bus@c0 {
+					// i2c mux
+				};
+				i2c3: i2c-bus@100 {
+					// i2c hub PCA9516A
+				};
+				i2c4: i2c-bus@140 {
+					// turismo
+				};
+				i2c5: i2c-bus@180 {
+					tmp423@98 {
+						compatible = "ti,tmp423";
+						reg = <0x98>;
+					};
+				};
+				i2c6: i2c-bus@1c0 {
+					// nc
+				};
+				i2c7: i2c-bus@300 {
+					// nc
+				};
+				i2c8: i2c-bus@340 {
+					// FSI
+					status = "disabled";
+				};
+				i2c9: i2c-bus@380 {
+					// 4 way mux
+				};
+				i2c10: i2c-bus@3c0 {
+					// 4 way mux
+				};
+				i2c11: i2c-bus@400 {
+					status = "okay";
+					leds@c0 {
+						compatible = "pca,pca9552led";
+						reg = <0xc0>;
+						// led9 - led_fault_n
+						// led10 - pwr_led_n
+						// led11 - rear_id_led_n
+					};
+					rtc@d0 {
+						compatible = "dallas,ds3231";
+						reg = <0xd0>;
+					};
+					si5338a@e2 {
+						// SiLabs clock generator
+						reg =<0xe2>;
+					};
+
+					idt@d6 {
+						// IDT 9DBV0641 clock buffer
+						reg = <0xd6>;
+					};
+
+					tpm@a3 {
+						reg = <0xa3>;
+					};
+				};
+				i2c12: i2c-bus@440 {
+					// i2c hub PCA9516A
+				};
+				i2c13: i2c-bus@480 {
+					// i2c hub PCA9516A
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/ast2400.dtsi b/arch/arm/boot/dts/ast2400.dtsi
index e1100f0..62fab71 100644
--- a/arch/arm/boot/dts/ast2400.dtsi
+++ b/arch/arm/boot/dts/ast2400.dtsi
@@ -213,6 +213,8 @@
 				};
 
 				i2c10: i2c-bus@3c0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0x380 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
 					bus = <10>;
@@ -222,6 +224,8 @@
 				};
 
 				i2c11: i2c-bus@400 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0x400 0x40>;
 					compatible = "aspeed,ast2400-i2c-bus";
 					bus = <11>;
-- 
2.8.2
