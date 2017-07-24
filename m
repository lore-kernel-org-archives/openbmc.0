Return-Path: <clg@kaod.org>
X-Greylist: delayed 485 seconds by postgrey-1.36 at bilbo;
 Mon, 24 Jul 2017 19:48:26 AEST
Received: from 4.mo177.mail-out.ovh.net (4.mo177.mail-out.ovh.net
 [46.105.37.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGGlZ3r8fzDrGr
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 19:48:25 +1000 (AEST)
Received: from player792.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id D2E1472956
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 11:40:16 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 2F75DA00B3;
 Mon, 24 Jul 2017 11:40:14 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH linux dev-4.10] mtd: spi-nor: aspeed: set 4B setting for all
 chips
Date: Mon, 24 Jul 2017 11:40:06 +0200
Message-Id: <1500889206-25863-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13871086854996069122
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrheefgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 24 Jul 2017 09:48:26 -0000

The driver made the wrong assumption that the 4B setting was
autodetected for all chips of the AST2500 FMC flash controller. This
is only the case for the CS0.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 To be noted that the speed setting of CS1 is quite low because the
 HCLK/16 divider is used. It can be improved.
 
 drivers/mtd/spi-nor/aspeed-smc.c |   13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

Index: linux-openbmc-4.10.git/drivers/mtd/spi-nor/aspeed-smc.c
===================================================================
--- linux-openbmc-4.10.git.orig/drivers/mtd/spi-nor/aspeed-smc.c
+++ linux-openbmc-4.10.git/drivers/mtd/spi-nor/aspeed-smc.c
@@ -794,19 +794,18 @@ static void aspeed_smc_chip_set_type(str
 }
 
 /*
- * The AST2500 FMC flash controller should be strapped by hardware, or
- * autodetected, but the AST2500 SPI flash needs to be set.
+ * The first chip of the AST2500 FMC flash controller is strapped by
+ * hardware, or autodetected, but other chips need to be set. Enforce
+ * the 4B setting for all chips.
  */
 static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
 	u32 reg;
 
-	if (chip->controller->info == &spi_2500_info) {
-		reg = readl(controller->regs + CE_CONTROL_REG);
-		reg |= 1 << chip->cs;
-		writel(reg, controller->regs + CE_CONTROL_REG);
-	}
+	reg = readl(controller->regs + CE_CONTROL_REG);
+	reg |= 1 << chip->cs;
+	writel(reg, controller->regs + CE_CONTROL_REG);
 }
 
 /*
