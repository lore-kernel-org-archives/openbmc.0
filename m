Return-Path: <clg@kaod.org>
Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net
 [178.33.253.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9PX61kc9zDvYq
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 01:35:49 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 2070219316
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 15:35:45 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id D51963C006A;
 Fri,  4 Nov 2016 15:35:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] clk: add a ahb clock for aspeed g4 
Date: Fri,  4 Nov 2016 15:35:23 +0100
Message-Id: <1478270123-20809-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11295027867937573634
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeelgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 04 Nov 2016 14:35:50 -0000

and fix g5 ahb clock which has a 3bits ratio. 

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-g4.dtsi |    7 +++++
 drivers/clk/aspeed/clk-g4.c      |   48 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/aspeed/clk-g5.c      |    4 ++-
 3 files changed, 58 insertions(+), 1 deletion(-)

Index: linux-openbmc-4.7.git/arch/arm/boot/dts/aspeed-g4.dtsi
===================================================================
--- linux-openbmc-4.7.git.orig/arch/arm/boot/dts/aspeed-g4.dtsi
+++ linux-openbmc-4.7.git/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -820,6 +820,13 @@
 				};
 			};
 
+			clk_ahb: clk_ahb@1e6e2070 {
+				#clock-cells = <0>;
+				compatible = "aspeed,g4-ahb-clock";
+				reg = <0x1e6e2070 0x4>;
+				clocks = <&clk_hpll>;
+			};
+
 			clk_apb: clk_apb@1e6e2008 {
 				#clock-cells = <0>;
 				compatible = "aspeed,g4-apb-clock";
Index: linux-openbmc-4.7.git/drivers/clk/aspeed/clk-g4.c
===================================================================
--- linux-openbmc-4.7.git.orig/drivers/clk/aspeed/clk-g4.c
+++ linux-openbmc-4.7.git/drivers/clk/aspeed/clk-g4.c
@@ -68,6 +68,54 @@ static void __init aspeed_of_hpll_clk_in
 CLK_OF_DECLARE(aspeed_hpll_clock, "aspeed,g4-hpll-clock",
 	       aspeed_of_hpll_clk_init);
 
+static void __init aspeed_of_ahb_clk_init(struct device_node *node)
+{
+	struct clk *clk, *hpll_clk;
+	void __iomem *base;
+	int reg, rate, hpll;
+	const char *name = node->name;
+	const char *parent_name;
+
+	of_property_read_string(node, "clock-output-names", &name);
+	parent_name = of_clk_get_parent_name(node, 0);
+
+	/* Strap register SCU70 */
+	base = of_iomap(node, 0);
+	if (!base) {
+		pr_err("%s: of_iomap failed\n", node->full_name);
+		return;
+	}
+
+	/* bits 11:10 define the CPU/AHB clock frequency ratio */
+	reg = (readl(base) >> 10) & 0x03;
+	iounmap(base);
+
+	/* A value of zero is undefined */
+	WARN_ON(reg == 0);
+
+	hpll_clk = of_clk_get(node, 0);
+	if (IS_ERR(hpll_clk)) {
+		pr_err("%s: of_clk_get failed\n", node->full_name);
+		return;
+	}
+
+	hpll = clk_get_rate(hpll_clk);
+
+	rate = hpll / (reg + 1);
+
+	clk = clk_register_fixed_rate(NULL, name, parent_name, 0, rate);
+	if (IS_ERR(clk)) {
+		pr_err("%s: failed to register clock\n", node->full_name);
+		return;
+	}
+
+	clk_register_clkdev(clk, NULL, name);
+	of_clk_add_provider(node, of_clk_src_simple_get, clk);
+}
+CLK_OF_DECLARE(aspeed_ahb_clock, "aspeed,g4-ahb-clock",
+	       aspeed_of_ahb_clk_init);
+
+
 static void __init aspeed_of_apb_clk_init(struct device_node *node)
 {
 	struct clk *clk, *hpll_clk;
Index: linux-openbmc-4.7.git/drivers/clk/aspeed/clk-g5.c
===================================================================
--- linux-openbmc-4.7.git.orig/drivers/clk/aspeed/clk-g5.c
+++ linux-openbmc-4.7.git/drivers/clk/aspeed/clk-g5.c
@@ -119,7 +119,9 @@ static void __init aspeed_of_ahb_clk_ini
 		pr_err("%s: of_iomap failed\n", node->full_name);
 		return;
 	}
-	reg = (readl(base) >> 9) & 0x03;
+
+	/* bits 11:9 define the AXI/AHB clock frequency ratio */
+	reg = (readl(base) >> 9) & 0x07;
 	iounmap(base);
 
 	/* A value of zero is undefined */
