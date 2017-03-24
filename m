Return-Path: <clg@kaod.org>
Received: from 12.mo7.mail-out.ovh.net (12.mo7.mail-out.ovh.net
 [178.33.107.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqR6L5GcWzDqZX
 for <openbmc@lists.ozlabs.org>; Sat, 25 Mar 2017 01:45:14 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 13DFC467E1
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 15:45:12 +0100 (CET)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id E7563180096;
 Fri, 24 Mar 2017 15:45:08 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10 5/6] mtd: spi-nor: aspeed: link controller with
 the ahb clock
Date: Fri, 24 Mar 2017 15:44:42 +0100
Message-Id: <1490366683-23401-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490366683-23401-1-git-send-email-clg@kaod.org>
References: <1490366683-23401-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3528570312035306242
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrjeehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 24 Mar 2017 14:45:15 -0000

We will need the AHB frequency to set the HCLK settings in the SMC
controller to optimize the reads.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 4 ++++
 arch/arm/boot/dts/aspeed-g5.dtsi              | 6 ++++++
 drivers/mtd/spi-nor/aspeed-smc.c              | 7 +++++++
 3 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 140b5919748e..d5472b5ba409 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -56,6 +56,8 @@
 			compatible = "aspeed,ast2400-fmc";
 			aspeed,fmc-has-dma;
 			interrupts = <19>;
+			clocks = <&clk_ahb>;
+			clock-names = "ahb";
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
@@ -70,6 +72,8 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-spi";
+			clocks = <&clk_ahb>;
+			clock-names = "ahb";
 			flash {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor" ;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index bc5e00e72eba..77e3daaecd03 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -33,6 +33,8 @@
 			status = "disabled";
 			aspeed,fmc-has-dma;
 			interrupts = <19>;
+			clocks = <&clk_ahb>;
+			clock-names = "ahb";
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
@@ -58,6 +60,8 @@
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-spi";
 			status = "disabled";
+			clocks = <&clk_ahb>;
+			clock-names = "ahb";
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
@@ -77,6 +81,8 @@
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-spi";
 			status = "disabled";
+			clocks = <&clk_ahb>;
+			clock-names = "ahb";
 			flash@0 {
 				reg = < 0 >;
 				compatible = "jedec,spi-nor";
diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 3c004dfaf873..1b398303f039 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bug.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -119,6 +120,8 @@ struct aspeed_smc_controller {
 	void __iomem *regs;			/* controller registers */
 	void __iomem *ahb_base;			/* per-chip windows resource */
 
+	struct clk *ahb_clk;
+
 	/* interrupt handling */
 	int irq;
 
@@ -1107,6 +1110,10 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 	if (IS_ERR(controller->ahb_base))
 		return PTR_ERR(controller->ahb_base);
 
+	controller->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
+	if (IS_ERR(controller->ahb_clk))
+		return PTR_ERR(controller->ahb_clk);
+
 	aspeed_smc_dma_setup(controller, pdev);
 
 	ret = aspeed_smc_setup_flash(controller, np, res);
-- 
2.7.4
