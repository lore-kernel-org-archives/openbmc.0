Return-Path: <clg@kaod.org>
Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net
 [178.33.253.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swRx74tgHzDt7D
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:39:07 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id DB3DE14AA6
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:39:04 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id A71D12A0068;
 Fri, 14 Oct 2016 14:39:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 10/12] ARM: dts: aspeed: update SMC controller
 nodes supporting DMAs
Date: Fri, 14 Oct 2016 14:38:02 +0200
Message-Id: <1476448684-6149-11-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15125339348905921282
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeeigdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 14 Oct 2016 12:39:08 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 Documentation/devicetree/bindings/mtd/aspeed-smc.txt | 4 +++-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts        | 2 ++
 arch/arm/boot/dts/aspeed-g5.dtsi                     | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
index 6ef55b5db3dc..9154d2a2e66c 100644
--- a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
+++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
@@ -17,11 +17,13 @@ Required properties:
 	"aspeed,ast2500-smc" for the AST2500 SPI Flash Controllers
   - reg : the first contains the control register location and length,
           the second contains the memory window mapping address and length
-  - interrupts : Should contain the interrupt for the dma device if an fmc
   - clocks : The APB clock input to the controller
   - #address-cells : must be 1 corresponding to chip select child binding
   - #size-cells : must be 0 corresponding to chip select child binding
 
+Optional properties:
+  - aspeed,fmc-has-dma : controller supports DMA transfers
+  - interrupts : Should contain the interrupt for the dma device if an fmc
 
 Child node required properties:
   - reg : must contain chip select number in first cell of address, must
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 5c689613e5bd..a6ebab1bfe2b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -43,6 +43,8 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-fmc";
+			aspeed,fmc-has-dma;
+			interrupts = <19>;
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index eeeb5d1505f1..3f64ba212faf 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -31,6 +31,8 @@
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-fmc";
 			status = "disabled";
+			aspeed,fmc-has-dma;
+			interrupts = <19>;
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
-- 
2.7.4
