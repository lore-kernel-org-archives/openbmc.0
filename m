Return-Path: <clg@kaod.org>
X-Greylist: delayed 580 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Nov 2016 19:25:59 AEDT
Received: from 7.mo1.mail-out.ovh.net (7.mo1.mail-out.ovh.net [87.98.158.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDK530xNlzDvbn
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 19:25:59 +1100 (AEDT)
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id BC5E416DB3
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 09:15:58 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 7FC02260086;
 Wed,  9 Nov 2016 09:15:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 linux dev-4.7 2/7] mtd: spi-nor: aspeed: improve 4 bytes
 mode
Date: Wed,  9 Nov 2016 09:15:38 +0100
Message-Id: <1478679343-25354-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478679343-25354-1-git-send-email-clg@kaod.org>
References: <1478679343-25354-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15798064543896341250
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrleekgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 09 Nov 2016 08:25:59 -0000

The AST2400 SPI flash uses the CE0 control register to set 4Byte mode
and the AST2500 FMC and AST2400 FMC flash controllers use the CE
Control register for this purpose or they are strapped by hardware.

Currently, the setting of the CE0 control register is done for all,
which is incorrect, so fix that to keep only the AST2400 SPI. Luckily,
the bogus setting has no impact on operations as bit 13 defines a SPI
clock divisor.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Changes since v1 :

 - added a set_4b() ops
 - removed the use of SZ_16M

 drivers/mtd/spi-nor/aspeed-smc.c | 62 +++++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 75ba73ef0660..ecc38752c2c3 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -151,6 +151,8 @@ enum smc_flash_type {
 	smc_type_spi = 2,	/* controller connected to spi flash */
 };
 
+struct aspeed_smc_chip;
+
 struct aspeed_smc_info {
 	u32 maxsize;		/* maximum size of 1 chip window */
 	u8 nce;			/* number of chip enables */
@@ -160,8 +162,13 @@ struct aspeed_smc_info {
 	u8 ctl0;		/* offset in regs of ctl for ce 0 */
 	u8 time;		/* offset in regs of timing */
 	u8 misc;		/* offset in regs of misc settings */
+
+	void (*set_4b)(struct aspeed_smc_chip *chip);
 };
 
+static void aspeed_smc_chip_set_4b_smc_2400(struct aspeed_smc_chip *chip);
+static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
+
 static const struct aspeed_smc_info fmc_2400_info = {
 	.maxsize = 64 * 1024 * 1024,
 	.nce = 5,
@@ -171,6 +178,7 @@ static const struct aspeed_smc_info fmc_2400_info = {
 	.ctl0 = 0x10,
 	.time = 0x94,
 	.misc = 0x54,
+	.set_4b = aspeed_smc_chip_set_4b,
 };
 
 static const struct aspeed_smc_info smc_2400_info = {
@@ -182,6 +190,7 @@ static const struct aspeed_smc_info smc_2400_info = {
 	.ctl0 = 0x04,
 	.time = 0x14,
 	.misc = 0x10,
+	.set_4b = aspeed_smc_chip_set_4b_smc_2400,
 };
 
 static const struct aspeed_smc_info fmc_2500_info = {
@@ -193,6 +202,7 @@ static const struct aspeed_smc_info fmc_2500_info = {
 	.ctl0 = 0x10,
 	.time = 0x94,
 	.misc = 0x54,
+	.set_4b = aspeed_smc_chip_set_4b,
 };
 
 static const struct aspeed_smc_info smc_2500_info = {
@@ -204,6 +214,7 @@ static const struct aspeed_smc_info smc_2500_info = {
 	.ctl0 = 0x10,
 	.time = 0x94,
 	.misc = 0x54,
+	.set_4b = aspeed_smc_chip_set_4b,
 };
 
 enum smc_ctl_reg_value {
@@ -751,6 +762,34 @@ static void aspeed_smc_chip_set_type(struct aspeed_smc_chip *chip, int type)
 	writel(reg, controller->regs + CONFIG_REG);
 }
 
+/*
+ * The AST2500 FMC and AST2400 FMC flash controllers should be
+ * strapped by hardware, or autodetected, but the AST2500 SPI flash
+ * needs to be set.
+ */
+static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip)
+{
+	struct aspeed_smc_controller *controller = chip->controller;
+	u32 reg;
+
+	if (chip->controller->info == &smc_2500_info) {
+		reg = readl(controller->regs + CE_CONTROL_REG);
+		reg |= 1 << chip->cs;
+		writel(reg, controller->regs + CE_CONTROL_REG);
+	}
+}
+
+/*
+ * The AST2400 SPI flash controller does not have a CE Control
+ * register. It uses the CE0 control register to set 4Byte mode at the
+ * controller level.
+ */
+static void aspeed_smc_chip_set_4b_smc_2400(struct aspeed_smc_chip *chip)
+{
+	chip->ctl_val[smc_base] |= CONTROL_SPI_IO_ADDRESS_4B;
+	chip->ctl_val[smc_read] |= CONTROL_SPI_IO_ADDRESS_4B;
+}
+
 static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 				      struct resource *r)
 {
@@ -815,27 +854,10 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
 static void aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
 {
 	struct aspeed_smc_controller *controller = chip->controller;
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
+	const struct aspeed_smc_info *info = controller->info;
 
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
+	if (chip->nor.addr_width == 4 && info->set_4b)
+		info->set_4b(chip);
 
 	chip->ctl_val[smc_write] = chip->ctl_val[smc_base] |
 		spi_control_fill_opcode(chip->nor.program_opcode) |
-- 
2.7.4
