Return-Path: <prvs=9281b6405=Samuel.Jiang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=9281b6405=samuel.jiang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 43rVtX3F6szDqfS
 for <openbmc@lists.ozlabs.org>; Fri,  1 Feb 2019 19:40:52 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 01 Feb 2019 16:40:49 +0800
Received: from samueljiang-System-Product-Name.dhcpserver.local
 (10.243.91.252) by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1531.3; Fri, 1 Feb 2019 16:40:42 +0800
From: <Samuel.Jiang@quantatw.com>
To: <KWLIU@nuvoton.com>, <joel@jms.id.au>, <tomer.maimon@nuvoton.com>,
 <fran.hsu@quantatw.com>
CC: <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 5/6] ARM: dts: nuvoton: nuvoton-npcm750-runbmc: define
 gpios inside Module
Date: Fri, 1 Feb 2019 16:40:26 +0800
Message-ID: <20190201084027.19501-5-Samuel.Jiang@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
References: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx07.quanta.corp (10.243.91.102) To
 mailbx06.quanta.corp (10.243.91.101)
X-TM-AS-Product-Ver: SMEX-12.0.0.1727-8.200.1013-24402.003
X-TM-AS-Result: No-0.154800-0.000000-31
X-TM-AS-MatchedID: 704421-700918-701016-700016-700270-188019-780011-700383-7
 02898-702609-188198-148004-148036-42000-42003-63
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
X-List-Received-Date: Fri, 01 Feb 2019 08:40:53 -0000

From: Samuel Jiang <Samuel.Jiang@quantatw.com>

Add gpios define on dtsi, define gpio lists which inside RunBMC Module

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi  | 35 ++++++++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 35 +++++++++++++++++++-
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
index a912910bc7ec..68cd3d817cec 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
@@ -8,11 +8,21 @@
 			bias-disable;
 			output-high;
 		};
+		gpio0ol_pins: gpio0ol-pins {
+			pins = "GPIO0/IOX1DI";
+			bias-disable;
+			output-low;
+		};
 		gpio1_pins: gpio1-pins {
 			pins = "GPIO1/IOX1LD";
 			bias-disable;
 			input-enable;
 		};
+		gpio1ol_pins: gpio1ol-pins {
+			pins = "GPIO1/IOX1LD";
+			bias-disable;
+			output-low;
+		};
 		gpio2_pins: gpio2-pins {
 			pins = "GPIO2/IOX1CK";
 			bias-disable;
@@ -23,6 +33,11 @@
 			bias-disable;
 			output_high;
 		};
+		gpio2ol_pins: gpio2ol-pins {
+			pins = "GPIO2/IOX1CK";
+			bias-disable;
+			output-low;
+		};
 		gpio3_pins: gpio3-pins {
 			pins = "GPIO3/IOX1D0";
 			bias-disable;
@@ -33,6 +48,11 @@
 			bias-disable;
 			output-high;
 		};
+		gpio3ol_pins: gpio3ol-pins {
+			pins = "GPIO3/IOX1D0";
+			bias-disable;
+			output-low;
+		};
 		gpio4_pins: gpio4-pins {
 			pins = "GPIO4/IOX2DI/SMB1DSDA";
 			bias-disable;
@@ -78,6 +98,11 @@
 			bias-disable;
 			input-enable;
 		};
+		gpio8o_pins: gpio8o-pins {
+			pins = "GPIO8/LKGPO1";
+			bias-disable;
+			output-high;
+		};
 		gpio8ol_pins: gpio8ol-pins {
 			pins = "GPIO8/LKGPO1";
 			bias-disable;
@@ -168,6 +193,11 @@
 			bias-disable;
 			output-high;
 		};
+		gpio15ol_pins: gpio15ol-pins {
+			pins = "GPIO15/GSPICS/SMB5CSDA";
+			bias-disable;
+			output-low;
+		};
 		gpio16_pins: gpio16-pins {
 			pins = "GPIO16/LKGPO0";
 			bias-disable;
@@ -842,6 +872,11 @@
 			bias-disable;
 			output-high;
 		};
+		gpio94ol_pins: gpio94ol-pins {
+			pins = "GPIO94/nKBRST/SMB5DSDA";
+			bias-disable;
+			output-low;
+		};
 		gpio95_pins: gpio95-pins {
 			pins = "GPIO95/nLRESET/nESPIRST";
 			bias-disable;
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index a90c66ea2e17..b589e3982584 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -38,6 +38,7 @@
     i2c11 = &i2c11;
     i2c12 = &i2c12;
 		i2c13 = &i2c13;
+		gpio0o_pins = &gpio0o_pins;
 		spi0 = &spi0;
 		spi1 = &spi1;
 		fiu0 = &fiu0;
@@ -944,7 +945,39 @@
 
 	pinctrl: pinctrl@f0800000 {
 		pinctrl-names = "default";
-
+		pinctrl-0 = <
+				&gpio0o_pins        /* Note Used */        /******* RunBMC inside Module pins *******/
+				&gpio1ol_pins        /* Note Used */
+				&gpio2ol_pins        /* Note Used */
+				&gpio3ol_pins        /* Note Used */
+				&gpio8o_pins
+				&gpio9ol_pins        /* Note Used */
+				&gpio12ol_pins       /* Note Used */
+				&gpio13ol_pins       /* Note Used */
+				&gpio14ol_pins       /* Note Used */
+				&gpio15ol_pins       /* Note Used */
+				&gpio37ol_pins
+				&gpio38_pins
+				&gpio39_pins
+				&hgpio7_pins
+				&gpio94ol_pins
+			    /*&lpc_pins*/         /* Handled by BB */
+				&gpio108ol_pins       /* Note Used */
+				&gpio109ol_pins       /* Note Used */
+				&gpio111ol_pins
+				&gpio112ol_pins
+				&gpio113ol_pins
+				&gpio208_pins
+				&gpio209ol_pins       /* Note Used */
+				&gpio210ol_pins       /* Note Used */
+				&gpio211ol_pins       /* Note Used */
+				&gpio212ol_pins       /* Note Used */
+				&gpio213ol_pins       /* Note Used */
+				&gpio214ol_pins       /* Note Used */
+				&gpio215ol_pins       /* Note Used */
+				&gpio216ol_pins       /* Note Used */
+				&gpio217ol_pins       /* Note Used */
+				>;
 	};
 	
 	jtag {
-- 
2.17.1
