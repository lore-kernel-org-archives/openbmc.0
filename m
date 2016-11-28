Return-Path: <clg@kaod.org>
X-Greylist: delayed 1014 seconds by postgrey-1.36 at bilbo;
 Mon, 28 Nov 2016 18:36:49 AEDT
Received: from 4.mo4.mail-out.ovh.net (4.mo4.mail-out.ovh.net [178.32.98.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRz5Y367tzDsy6
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 18:36:48 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id E6AAC1F7D7
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 08:19:49 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 3874C18007A;
 Mon, 28 Nov 2016 08:19:45 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.7] ARM: dts: aspeed: restore labels of the flash
 modules
Date: Mon, 28 Nov 2016 08:19:42 +0100
Message-Id: <1480317582-549-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15750495272047774466
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeehgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 28 Nov 2016 07:36:49 -0000

commit e62c7f111755 ("ARM: dts: aspeed: fix flash module device
nodes") removed the 'label' property under the flash module device
nodes because of the lack of support in mainline. This change broke a
number of OpenBMC user space tools. let's revert the label change.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Joel, I will add a proposal patch to extend the 'jedec,spi-nor'
 binding with a 'label' property in the next version of the Aspeed SMC
 controller patchset. 

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
 arch/arm/boot/dts/aspeed-ast2500-evb.dts                | 3 ++-
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts          | 3 ++-
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts          | 3 ++-
 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi      | 1 +
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts           | 3 ++-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts           | 3 ++-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts            | 4 +++-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts        | 4 +++-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts              | 3 ++-
 arch/arm/boot/dts/aspeed-g5.dtsi                        | 4 ++--
 11 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 2c91c03e7eb0..b7cd02a3ebe8 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -65,6 +65,7 @@ Optional properties:
                    all chips and support for it can not be detected at runtime.
                    Refer to your chips' datasheet to check if this is supported
                    by your chip.
+- label : name to assign to mtd. If omitted, the label is the MTD device name.
 
 Example:
 
@@ -75,4 +76,5 @@ Example:
 		reg = <0>;
 		spi-max-frequency = <40000000>;
 		m25p,fast-read;
+		label = "System-firmware";
 	};
diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index fe8fc7a801f6..9d88f3aadbc6 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -33,8 +33,9 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
-	pnor@0 {
+	flash@0 {
 		status = "okay";
+		label = "pnor";
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 802ce9557836..bedff97fb9b9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -40,9 +40,10 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-smc";
-			pnor@0 {
+			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
+				label = "pnor";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 005ff89e0c10..bbe09fc85b1e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -61,9 +61,10 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-smc";
-			pnor@0 {
+			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
+				label = "pnor";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
index 6cfadb42368f..65095a40a203 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
@@ -1,3 +1,4 @@
+		label = "bmc";
 		partitions {
 				#address-cells = < 1 >;
 				#size-cells = < 1 >;
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 92b29d1c665b..7737c09aa20e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -41,9 +41,10 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-smc";
-			pnor@0 {
+			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
+				label = "pnor";
 				/* spi-max-frequency = <>; */
 				/* m25p,fast-read; */
 			};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index ed3c4a9e3d9d..f018074f6bb1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -58,9 +58,10 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-smc";
-			pnor@0 {
+			flash {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
+				label = "pnor";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 9845e6ca0de9..c23627ec5e84 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -29,6 +29,7 @@
 	};
 	flash@1 {
 		status = "okay";
+		label = "alt";
 	};
 };
 
@@ -37,8 +38,9 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
-	pnor@0 {
+	flash@0 {
 		status = "okay";
+		label = "pnor";
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 5c463f4112f6..9badf3e94599 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -29,6 +29,7 @@
 	};
 	flash@1 {
 		status = "okay";
+		label = "alt";
 	};
 };
 
@@ -37,8 +38,9 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
-	pnor@0 {
+	flash@0 {
 		status = "okay";
+		label = "pnor";
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 8ef4ecec17cc..673bab8006e7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -58,8 +58,9 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
-	pnor@0 {
+	flash@0 {
 		status = "okay";
+		label = "pnor";
 	};
 };
 
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 433461bce607..d6ff41ee6c58 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -58,12 +58,12 @@
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-smc";
 			status = "disabled";
-			pnor@0 {
+			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
 				status = "disabled";
 			};
-			pnor@1 {
+			flash@1 {
 				reg = < 1 >;
 				compatible = "jedec,spi-nor";
 				status = "disabled";
-- 
2.7.4
