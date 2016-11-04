Return-Path: <clg@kaod.org>
Received: from 2.mo1.mail-out.ovh.net (2.mo1.mail-out.ovh.net [178.32.119.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9Sm30RxMzDvZG
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 04:01:22 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id AAEA11610B
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 18:01:16 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 6D5D63C0085;
 Fri,  4 Nov 2016 18:01:13 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 2/8] mtd: spi-nor: aspeed: improve 4 bytes mode
Date: Fri,  4 Nov 2016 18:00:41 +0100
Message-Id: <1478278847-9164-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478278847-9164-1-git-send-email-clg@kaod.org>
References: <1478278847-9164-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13752867362238139138
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeelgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 04 Nov 2016 17:01:23 -0000

The AST2400 SPI flash uses the CE0 control register to set 4Byte mode
and the AST2500 FMC and AST2400 FMC flash controllers use the CE
Control register for this purpose or they are strapped by hardware.

Currently, the setting of the CE0 control register is done for all,
which is incorrect, so fix that to keep only the AST2400 SPI. Luckily,
the bogus setting has no impact on operations as bit 13 defines a SPI
clock divisor.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 51 +++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 75ba73ef0660..763f3c604140 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -751,6 +751,33 @@ static void aspeed_smc_chip_set_type(struct aspeed_smc_chip *chip, int type)
 	writel(reg, controller->regs + CONFIG_REG);
 }
 
+static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
+{
+	struct aspeed_smc_controller *controller = chip->controller;
+	u32 reg;
+
+	/*
+	 * The AST2400 SPI flash controller does not have a CE Control
+	 * register. It uses the CE0 control register to set 4Byte
+	 * mode at the controller level.
+	 */
+	if (chip->controller->info == &smc_2400_info) {
+		chip->ctl_val[smc_base] |= CONTROL_SPI_IO_ADDRESS_4B;
+		chip->ctl_val[smc_read] |= CONTROL_SPI_IO_ADDRESS_4B;
+	}
+
+	/*
+	 * The AST2500 FMC and AST2400 FMC flash controllers should be
+	 * strapped by hardware, or autodetected, but the AST2500 SPI
+	 * flash needs to be set.
+	 */
+	if (chip->controller->info == &smc_2500_info) {
+		reg = readl(controller->regs + CE_CONTROL_REG);
+		reg |= 1 << chip->cs;
+		writel(reg, controller->regs + CE_CONTROL_REG);
+	}
+}
+
 static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 				      struct resource *r)
 {
@@ -814,28 +841,8 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 
 static void aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 {
-	struct aspeed_smc_controller *controller = chip->controller;
-	u32 reg;
-
-	/*
-	 * Set 4 byte mode in the chip controller register and also in
-	 * controller config register. The BMC flash controller is
-	 * strapped by hardware, or autodetected, but the SPI flash
-	 * controller of the AST2500 still needs to be set.
-	 */
-	if (chip->nor.mtd.size > SZ_16M) {
-		chip->ctl_val[smc_base] |= CONTROL_SPI_IO_ADDRESS_4B;
-
-		/*
-		 * The SPI flash controller of the AST2400 does not
-		 * have such a setting.
-		 */
-		if (chip->controller->info == &smc_2500_info) {
-			reg = readl(controller->regs + CE_CONTROL_REG);
-			reg |= 1 << chip->cs;
-			writel(reg, controller->regs + CE_CONTROL_REG);
-		}
-	}
+	if (chip->nor.mtd.size > SZ_16M)
+		aspeed_smc_chip_set_4b(chip);
 
 	chip->ctl_val[smc_write] = chip->ctl_val[smc_base] |
 		spi_control_fill_opcode(chip->nor.program_opcode) |
-- 
2.7.4
