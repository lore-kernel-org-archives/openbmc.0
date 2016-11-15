Return-Path: <clg@kaod.org>
Received: from 17.mo5.mail-out.ovh.net (17.mo5.mail-out.ovh.net
 [46.105.56.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJ3Qd00vszDt1W
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 21:24:08 +1100 (AEDT)
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 5CC224716F
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 11:24:02 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
 (deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
 (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id D305E52007C;
 Tue, 15 Nov 2016 11:23:58 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] ARM: dts: aspeed: fix flash module device nodes
Date: Tue, 15 Nov 2016 11:23:54 +0100
Message-Id: <1479205434-5223-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16303593601680771842
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedruddvgddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 15 Nov 2016 10:24:09 -0000

The "label" property can not be used under the flash module device
nodes. Remove them and use 'pnor' in the device node name to identify
the host pnor flash module from user space. Also introduce a
'partitions' node to describe the bmc layout.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     |  3 +--
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |  3 +--
 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 17 +++++++++--------
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts      |  3 +--
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  3 +--
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |  3 +--
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  3 +--
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |  3 +--
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  4 ++--
 10 files changed, 19 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 37b6793698e0..3dc472ae10e9 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -30,7 +30,7 @@
 
 &spi1 {
 	status = "okay";
-	flash@0 {
+	pnor@0 {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 6ca618bd331d..802ce9557836 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -40,10 +40,9 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-smc";
-			flash {
+			pnor@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
-				label = "pnor";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index e677e9ff00b8..005ff89e0c10 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -61,10 +61,9 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-smc";
-			flash {
+			pnor@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
-				label = "pnor";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
index ca8639b52f6d..6cfadb42368f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
@@ -1,28 +1,29 @@
-/* This file is the label for the bmc primary flash and its partitions */
-				label = "bmc";
+		partitions {
 				#address-cells = < 1 >;
 				#size-cells = < 1 >;
-				u-boot {
+				compatible = "fixed-partitions";
+				u-boot@0 {
 					reg = < 0 0x60000 >;
 					label = "u-boot";
 				};
-				u-boot-env {
+				u-boot-env@60000 {
 					reg = < 0x60000 0x20000 >;
 					label = "u-boot-env";
 				};
-				kernel  {
+				kernel@80000 {
 					reg = < 0x80000 0x280000 >;
 					label = "kernel";
 				};
-				initramfs {
+				initramfs@300000 {
 					reg = < 0x300000 0x1c0000 >;
 					label = "initramfs";
 				};
-				rofs  {
+				rofs@0c0000 {
 					reg = < 0x4c0000 0x1740000 >;
 					label = "rofs";
 				};
-				rwfs  {
+				rwfs@1c00000 {
 					reg = < 0x1c00000 0x400000 >;
 					label = "rwfs";
 				};
+		};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index a4471fb3b36b..92b29d1c665b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -41,10 +41,9 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-smc";
-			flash {
+			pnor@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
-				label = "pnor";
 				/* spi-max-frequency = <>; */
 				/* m25p,fast-read; */
 			};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 0fd60c4eafad..8fe248f4d531 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -58,10 +58,9 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-smc";
-			flash {
+			pnor@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
-				label = "pnor";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 4c4c547fe412..9845e6ca0de9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -29,7 +29,6 @@
 	};
 	flash@1 {
 		status = "okay";
-		label = "alt";
 	};
 };
 
@@ -38,7 +37,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
-	flash@0 {
+	pnor@0 {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 7badbda288d3..c7458ae6efd7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -29,7 +29,6 @@
 	};
 	flash@1 {
 		status = "okay";
-		label = "alt";
 	};
 };
 
@@ -38,7 +37,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
-	flash@0 {
+	pnor@0 {
 		status = "okay";
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 673bab8006e7..8ef4ecec17cc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -58,9 +58,8 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
-	flash@0 {
+	pnor@0 {
 		status = "okay";
-		label = "pnor";
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index be95fd42dbd7..099d0aab87b6 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -58,12 +58,12 @@
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-smc";
 			status = "disabled";
-			flash@0 {
+			pnor@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
 				status = "disabled";
 			};
-			flash@1 {
+			pnor@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
 				status = "disabled";
-- 
2.7.4
