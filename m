Return-Path: <prvs=9281b6405=Samuel.Jiang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=9281b6405=samuel.jiang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 43rVtV099BzDqfL
 for <openbmc@lists.ozlabs.org>; Fri,  1 Feb 2019 19:40:46 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 01 Feb 2019 16:40:43 +0800
Received: from samueljiang-System-Product-Name.dhcpserver.local
 (10.243.91.252) by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1531.3; Fri, 1 Feb 2019 16:40:42 +0800
From: <Samuel.Jiang@quantatw.com>
To: <KWLIU@nuvoton.com>, <joel@jms.id.au>, <tomer.maimon@nuvoton.com>,
 <fran.hsu@quantatw.com>
CC: <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 6/6] ARM: dts: nuvoton: nuvoton-npcm750-runbmc: define
 gpios outside Module
Date: Fri, 1 Feb 2019 16:40:27 +0800
Message-ID: <20190201084027.19501-6-Samuel.Jiang@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
References: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx07.quanta.corp (10.243.91.102) To
 mailbx06.quanta.corp (10.243.91.101)
X-TM-AS-Product-Ver: SMEX-12.0.0.1727-8.200.1013-24402.003
X-TM-AS-Result: No-0.489300-0.000000-31
X-TM-AS-MatchedID: 704421-700918-701016-700016-700270-188019-780011-700383-7
 02898-148004-148036-42000-42003-63
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
X-List-Received-Date: Fri, 01 Feb 2019 08:40:51 -0000
X-List-Received-Date: Fri, 01 Feb 2019 08:40:51 -0000

From: Samuel Jiang <Samuel.Jiang@quantatw.com>

add gpios define on dtsi, define gpio lists which outside RunBMC Module

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi  | 70 ++++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 84 +++++++++++++++++++-
 2 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
index 68cd3d817cec..337000212db4 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
@@ -278,6 +278,11 @@
 			bias-disable;
 			input-enable;
 		};
+		gpio22o_pins: gpio22o-pins {
+			pins = "GPIO22/SMB4DSDA/SMB14SDA";
+			bias-disable;
+			output-high;
+		};
 		gpio22ol_pins: gpio22ol-pins {
 			pins = "GPIO22/SMB4DSDA/SMB14SDA";
 			bias-disable;
@@ -333,6 +338,16 @@
 			bias-disable;
 			input-enable;
 		};
+		gpio30_pins: gpio27-pins {
+			pins = "GPIO30/SMB3SDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio31_pins: gpio27-pins {
+			pins = "GPIO31/SMB3SCL";
+			bias-disable;
+			input-enable;
+		};
 		gpio32_pins: gpio32-pins {
 			pins = "GPIO32/nSPI0CS1";
 			bias-disable;
@@ -712,6 +727,11 @@
 			bias-disable;
 			input-enable;
 		};
+		gpio78o_pins: gpio78o-pins {
+			pins = "GPIO78/FANIN14";
+			bias-disable;
+			output-high;
+		};
 		gpio78ol_pins: gpio78ol-pins {
 			pins = "GPIO78/FANIN14";
 			bias-disable;
@@ -777,6 +797,11 @@
 			bias-disable;
 			output-high;
 		};
+		gpio86ol_pins: gpio86ol-pins {
+			pins = "GPIO86/R2TXEN";
+			bias-disable;
+			output-low;
+		};
 		gpio87_pins: gpio87-pins {
 			pins = "GPIO87/R2RXD0";
 			bias-disable;
@@ -1062,6 +1087,16 @@
 			bias-disable;
 			output-low;
 		};
+		gpio114o_pins: gpio114o-pins {
+			pins = "GPIO114/SMB0SCL";
+			bias-disable;
+			output-high;
+		};
+		gpio115_pins: gpio115-pins {
+			pins = "GPIO115/SMB0SDA";
+			bias-disable;
+			input-enable;
+		};
 		gpio118_pins: gpio118-pins {
 			pins = "GPIO118/SMB2SCL";
 			bias-disable;
@@ -1117,6 +1152,11 @@
 			bias-disable;
 			input-enable;
 		};
+		gpio127o_pins: gpio127o-pins {
+			pins = "GPIO127/SMB1BSCL";
+			bias-disable;
+			output-high;
+		};
 		gpio128o_pins: gpio128o-pins {
 			pins = "GPIO128/SMB8SCL";
 			bias-disable;
@@ -1337,6 +1377,11 @@
 			bias-disable;
 			input-enable;
 		};
+		gpio153o_pins: gpio153o-pins {
+			pins = "GPIO153/MMCWP";
+			bias-disable;
+			output-high;
+		};
 		gpio153ol_pins: gpio153ol-pins {
 			pins = "GPIO153/MMCWP";
 			bias-disable;
@@ -1587,6 +1632,11 @@
 			bias-disable;
 			output-high;
 		};
+		gpio189_pins: gpio189o-pins {
+			pins = "GPIO189/SPI3D3/nSPI3CS3";
+			bias-disable;
+			input-enable;
+		};
 		gpio189o_pins: gpio189o-pins {
 			pins = "GPIO189/SPI3D3/nSPI3CS3";
 			bias-disable;
@@ -1682,6 +1732,11 @@
 			bias-disable;
 			input-enable;
 		};
+		gpio199o_pins: gpio199o-pins {
+			pins = "GPIO199/SMB0DSCL";
+			bias-disable;
+			output-high;
+		};
 		gpio200_pins: gpio200-pins {
 			pins = "GPIO200/R2CK";
 			input-enable;
@@ -1977,6 +2032,11 @@
 			bias-disable;
 			output-high;
 		};
+		gpio225ol_pins: gpio225ol-pins {
+			pins = "GPO225/SPIXD0/STRAP12";
+			bias-disable;
+			output-low;
+		};
 		gpio226_pins: gpio226-pins {
 			pins = "GPO226/SPIXD1/STRAP13";
 			bias-disable;
@@ -1987,6 +2047,11 @@
 			bias-disable;
 			output-high;
 		};
+		gpio226ol_pins: gpio226ol-pins {
+			pins = "GPO226/SPIXD1/STRAP13";
+			bias-disable;
+			output-low;
+		};
 		gpio227_pins: gpio227-pins {
 			pins = "GPIO227/nSPIXCS0";
 			bias-disable;
@@ -2007,6 +2072,11 @@
 			bias-disable;
 			input-enable;
 		};
+		gpio228o_pins: gpio228o-pins {
+			pins = "GPIO228/nSPIXCS1";
+			bias-disable;
+			output-high;
+		};
 		gpio228ol_pins: gpio228ol-pins {
 			pins = "GPIO228/nSPIXCS1";
 			bias-disable;
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index b589e3982584..a9aa3ac81ff9 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -38,7 +38,6 @@
     i2c11 = &i2c11;
     i2c12 = &i2c12;
 		i2c13 = &i2c13;
-		gpio0o_pins = &gpio0o_pins;
 		spi0 = &spi0;
 		spi1 = &spi1;
 		fiu0 = &fiu0;
@@ -977,6 +976,89 @@
 				&gpio215ol_pins       /* Note Used */
 				&gpio216ol_pins       /* Note Used */
 				&gpio217ol_pins       /* Note Used */
+						&gpio5_pins                                   /******* RunBMC outside Connector pins *******/
+				&gpio6_pins
+				&gpio7_pins
+			/*	&bmcuart0a_pins  */      /* UART0 BSP */
+			/*	&uart1_pins      */      /* UART1 SI1 */
+			/*	&uart2_pins      */      /* UART2 SI2 */
+				&gpio10_pins
+				&gpio11_pins
+				&gpio24_pins
+				&gpio25_pins
+				&gpio82_pins
+				&gpio144_pins
+				&gpio146_pins
+				&gpio83_pins
+				&gpio145_pins
+				&gpio147_pins
+				&gpio76_pins
+				&gpio77_pins
+				&gpio78o_pins
+				&gpio79_pins
+				&gpio30_pins
+				&gpio31_pins
+				&gpio23_pins
+				&gpio22o_pins
+				&gpio21_pins
+				&gpio20_pins
+				&gpio114o_pins
+				&gpio115_pins
+				&ddc_pins
+				&gpio203o_pins
+				&gpio84_pins
+				&gpio85o_pins
+				&gpio86ol_pins
+				&gpio87_pins
+				&gpio88_pins
+				&gpio89_pins
+				&gpio90_pins
+				&gpio200_pins
+				&gpio136_pins
+				&gpio137_pins
+				&gpio138_pins
+				&gpio139_pins
+				&gpio140_pins
+				&gpio141_pins
+				&gpio142_pins
+				&gpio143_pins
+				&gpio188o_pins
+				&gpio189_pins
+				&gpio225ol_pins
+				&gpio226ol_pins
+				&gpio227ol_pins
+				&gpio228o_pins
+				&gpio229o_pins
+				&gpio230_pins
+				&gpio224_pins
+			/*	&gpio192_pins         pspi jtag */
+			/*	&gpio17_pins          pspi jtag */
+			/*	&gpio18_pins          pspi jtag */
+			/*	&gpio19_pins          pspi jtag */
+			/*	&gpio16_pins          pspi jtag */
+				&gpio199o_pins
+				&gpio202_pins
+				&gpio127o_pins
+				&gpio198o_pins
+				&gpio124_pins
+				&gpio125_pins
+				&gpio126_pins
+				&gpio93_pins
+				&wdog2_pins
+				&wdog1_pins
+				&gpio160o_pins
+				&gpio169o_pins
+				&gpio231o_pins
+				&gpio196_pins
+				&gpio197_pins
+				&gpio155_pins
+				&gpio153o_pins
+				&gpio59_pins
+				&gpio40o_pins
+				&gpio122_pins
+				&gpio121_pins
+				&gpio120_pins
+				&gpio123_pins
 				>;
 	};
 	
-- 
2.17.1
