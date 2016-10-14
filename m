Return-Path: <clg@kaod.org>
X-Greylist: delayed 353 seconds by postgrey-1.36 at bilbo;
 Fri, 14 Oct 2016 23:44:27 AEDT
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swS3H5YjnzDt4k
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:44:27 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 8A3B514B65
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:38:26 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 1C16A2A0075;
 Fri, 14 Oct 2016 14:38:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 01/12] mtd: spi-nor: support for Aspeed AST2500
 SoC
Date: Fri, 14 Oct 2016 14:37:53 +0200
Message-Id: <1476448684-6149-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15114643299940010754
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
X-List-Received-Date: Fri, 14 Oct 2016 12:44:28 -0000

From: Milton Miller <miltonm@us.ibm.com>

The SMC controllers on the Aspeed AST2500 SoC are very similar to the
ones found on the AST2400. The differences are on the number of
supported flash modules and their default mappings in the SoC address
space.

The Aspeed AST2500 has one SPI controller for the BMC firmware and two
for the host firmware. All controllers have now the same set of
registers compatible with the AST2400 FMC controller and the legacy
'SMC' controller is fully gone.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
[clg: couple of cleanups ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 .../devicetree/bindings/mtd/aspeed-smc.txt         |  30 ++++--
 drivers/mtd/spi-nor/aspeed-smc.c                   | 112 ++++++++++++---------
 2 files changed, 87 insertions(+), 55 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
index a91496a6e46e..6ef55b5db3dc 100644
--- a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
+++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
@@ -1,15 +1,23 @@
-* Aspeed Static Memory controller in SPI mode
+* Aspeed Static Memory controller
 * Aspeed SPI Flash Controller
 
+The Static memory controller in the ast2400 supports 5 chip selects each
+can be attached to NAND, parallel NOR, or SPI NOR attached flash.  The
+Firmware Memory Controller in the ast2500 supports 3 chip selects, two of
+which are always in SPI-NOR mode and the third can be SPI-NOR or parallel
+flash.  The SPI flash controller in the ast2400 supports one of 2 chip
+selects selected by pinmux.  The two SPI flash controllers in the ast2500
+each support two chip selects.
+
 Required properties:
   - compatible : Should be one of
 	"aspeed,ast2400-fmc" for the AST2400 Static Memory Controller
-	"aspeed,ast2500-fmc" for the AST2500 Static Memory Controller
-	"aspeed,ast2400-smc" for the AST2400 SPI flash controller
-  - reg : the first contains the register location and length,
-          the second through nth contains the memory mapping address and length
-	  for the access window for each chips select
-  - interrupts : Should contain the interrupt for the dma device if fmc
+	"aspeed,ast2400-smc" for the AST2400 SPI Flash Controller
+	"aspeed,ast2500-fmc" for the AST2500 Firmware SPI Memory Controller
+	"aspeed,ast2500-smc" for the AST2500 SPI Flash Controllers
+  - reg : the first contains the control register location and length,
+          the second contains the memory window mapping address and length
+  - interrupts : Should contain the interrupt for the dma device if an fmc
   - clocks : The APB clock input to the controller
   - #address-cells : must be 1 corresponding to chip select child binding
   - #size-cells : must be 0 corresponding to chip select child binding
@@ -19,11 +27,13 @@ Child node required properties:
   - reg : must contain chip select number in first cell of address, must
 	  be 1 tuple long
   - compatible : may contain "vendor,part", must include "jedec,spi-nor"
-		(see spi-nor.txt binding).
+		when attached to SPI flash (see spi-nor.txt binding).
 
 Child node optional properties:
   - label           - (optional) name to assign to mtd, default os assigned
-  - spi-max-frequency - (optional) max frequency of spi bus (XXX max if missing)
+
+Child node optional properties for SPI mode (may be ignored):
+  - spi-max-frequency - (optional) max frequency of spi bus
   - spi-cpol        - (optional) Empty property indicating device requires
     	 		inverse clock polarity (CPOL) mode (boolean)
   - spi-cpha        - (optional) Empty property indicating device requires
@@ -33,7 +43,7 @@ Child node optional properties:
   - spi-rx-bus-width - (optional) The bus width(number of data wires) that
                         used for MOSI. Defaults to 1 if not present.
 
-Child node optional properties:
+Grandchild node optional properties:
  - see mtd/partiton.txt for partitioning bindings and mtd naming
 
 
diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index e61a0d8aa5c0..e8744aef5fdc 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -21,9 +21,9 @@
 #include <linux/sysfs.h>
 
 /*
- * In user mode bytes all data bytes read or written to the chip decode 
- * address range are sent to the SPI bus.  The range is treated as a fifo
- * of arbitratry 1, 2, or 4 byte width but each write has to be aligned
+ * In user mode all data bytes read or written to the chip decode address
+ * range are transferred to or from the SPI bus. The range is treated as a
+ * fifo of arbitratry 1, 2, or 4 byte width but each write has to be aligned
  * to its size.  The address within the multiple 8kB range is ignored when
  * sending bytes to the SPI bus.
  *
@@ -31,9 +31,9 @@
  * memcpy_toio on little endian targets use the optimized memcpy routines
  * that were designed for well behavied memory storage.  These routines
  * have a stutter if the source and destination are not both word aligned,
- * once with a duplicate access to the source after aligning the destination
- * to a word boundary, and once with a duplicate access to the destination
- * when the final byte count is not word aligned.
+ * once with a duplicate access to the source after aligning to the
+ * destination to a word boundary, and again with a duplicate access to
+ * the source when the final byte count is not word aligned.
  *
  * When writing or reading the fifo this stutter discards data or sends
  * too much data to the fifo and can not be used by this driver.
@@ -140,37 +140,56 @@ struct aspeed_smc_info {
 	u8 maxwidth;		/* max width of spi bus */
 	bool hasdma;		/* has dma engine */
 	bool hastype;		/* flash type field exists in cfg reg */
-	u8 we0;			/* we shift for ce 0 in cfg reg */
+	u8 we0;			/* shift for write enable bit for ce 0 */
 	u8 ctl0;		/* offset in regs of ctl for ce 0 */
-	u8 cfg;			/* offset in regs of cfg */
 	u8 time;		/* offset in regs of timing */
 	u8 misc;		/* offset in regs of misc settings */
 };
 
-static struct aspeed_smc_info fmc_info = {
+static struct aspeed_smc_info fmc_2400_info = {
 	.nce = 5,
 	.maxwidth = 4,
 	.hasdma = true,
 	.hastype = true,
 	.we0 = 16,
 	.ctl0 = 0x10,
-	.cfg = 0x00,
-	.time = 0x54,
-	.misc = 0x50,
+	.time = 0x94,
+	.misc = 0x54,
 };
 
-static struct aspeed_smc_info smc_info = {
+static struct aspeed_smc_info smc_2400_info = {
 	.nce = 1,
 	.maxwidth = 2,
 	.hasdma = false,
 	.hastype = false,
 	.we0 = 0,
 	.ctl0 = 0x04,
-	.cfg = 0x00,
 	.time = 0x14,
 	.misc = 0x10,
 };
 
+static struct aspeed_smc_info fmc_2500_info = {
+	.nce = 3,
+	.maxwidth = 2,
+	.hasdma = true,
+	.hastype = true,
+	.we0 = 16,
+	.ctl0 = 0x10,
+	.time = 0x94,
+	.misc = 0x54,
+};
+
+static struct aspeed_smc_info smc_2500_info = {
+	.nce = 2,
+	.maxwidth = 2,
+	.hasdma = false,
+	.hastype = false,
+	.we0 = 16,
+	.ctl0 = 0x10,
+	.time = 0x94,
+	.misc = 0x54,
+};
+
 enum smc_ctl_reg_value {
 	smc_base,		/* base value without mode for other commands */
 	smc_read,		/* command reg for (maybe fast) reads */
@@ -180,7 +199,7 @@ enum smc_ctl_reg_value {
 
 struct aspeed_smc_controller;
 
-struct aspeed_smc_chip {
+struct aspeed_smc_per_chip {
 	struct aspeed_smc_controller *controller;
 	__le32 __iomem *ctl;			/* control register */
 	void __iomem *base;			/* base of chip window */
@@ -193,9 +212,11 @@ struct aspeed_smc_controller {
 	struct mutex mutex;			/* controller access mutex */
 	const struct aspeed_smc_info *info;	/* type info of controller */
 	void __iomem *regs;			/* controller registers */
-	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
+	struct aspeed_smc_per_chip *chips[0];	/* pointers to attached chips */
 };
 
+#define TYPE_SETTING_REG 0x0
+
 #define CONTROL_SPI_AAF_MODE BIT(31)
 #define CONTROL_SPI_IO_MODE_MASK GENMASK(30, 28)
 #define CONTROL_SPI_IO_DUAL_DATA BIT(29)
@@ -209,8 +230,8 @@ struct aspeed_smc_controller {
 #define CONTROL_SPI_DUMMY_CYCLE_COMMAND_OUTPUT BIT(15)
 #define CONTROL_SPI_IO_DUMMY_CYCLES_HI BIT(14)
 #define CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT (14 - 2)
-#define CONTROL_SPI_IO_ADDRESS_4B BIT(13) /* FMC, LEGACY */
-#define CONTROL_SPI_CLK_DIV4 BIT(13) /* BIOS */
+#define CONTROL_SPI_IO_ADDRESS_4B BIT(13) /* 2400-smc */
+#define CONTROL_SPI_CLK_DIV4 BIT(13) /* FMC, 2500 */
 #define CONTROL_SPI_RW_MERGE BIT(12)
 #define CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT 6
 #define CONTROL_SPI_IO_DUMMY_CYCLES_LO GENMASK(7, CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT)
@@ -229,7 +250,7 @@ struct aspeed_smc_controller {
 #define CONTROL_SPI_COMMAND_MODE_USER (3)
 
 #define CONTROL_SPI_KEEP_MASK (CONTROL_SPI_AAF_MODE | \
-	CONTROL_SPI_CE_INACTIVE_MASK | CONTROL_SPI_IO_ADDRESS_4B | \
+	CONTROL_SPI_CE_INACTIVE_MASK | CONTROL_SPI_CLK_DIV4 | \
 	CONTROL_SPI_IO_DUMMY_CYCLES_MASK | CONTROL_SPI_CLOCK_FREQ_SEL_MASK | \
 	CONTROL_SPI_LSB_FIRST | CONTROL_SPI_CLOCK_MODE_3)
 
@@ -241,7 +262,7 @@ static u32 spi_control_fill_opcode(u8 opcode)
 
 static void aspeed_smc_start_user(struct spi_nor *nor)
 {
-	struct aspeed_smc_chip *chip = nor->priv;
+	struct aspeed_smc_per_chip *chip = nor->priv;
 	u32 ctl = chip->ctl_val[smc_base];
 
 	mutex_lock(&chip->controller->mutex);
@@ -256,7 +277,7 @@ static void aspeed_smc_start_user(struct spi_nor *nor)
 
 static void aspeed_smc_stop_user(struct spi_nor *nor)
 {
-	struct aspeed_smc_chip *chip = nor->priv;
+	struct aspeed_smc_per_chip *chip = nor->priv;
 
 	u32 ctl = chip->ctl_val[smc_read];
 	u32 ctl2 = ctl | CONTROL_SPI_COMMAND_MODE_USER |
@@ -270,7 +291,7 @@ static void aspeed_smc_stop_user(struct spi_nor *nor)
 
 static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 {
-	struct aspeed_smc_chip *chip = nor->priv;
+	struct aspeed_smc_per_chip *chip = nor->priv;
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_to_fifo(chip->base, &opcode, 1);
@@ -283,7 +304,7 @@ static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
 				int len)
 {
-	struct aspeed_smc_chip *chip = nor->priv;
+	struct aspeed_smc_per_chip *chip = nor->priv;
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_to_fifo(chip->base, &opcode, 1);
@@ -295,7 +316,7 @@ static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
 
 static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
 {
-	struct aspeed_smc_chip *chip = nor->priv;
+	struct aspeed_smc_per_chip *chip = nor->priv;
 	__be32 temp;
 	u32 cmdaddr;
 
@@ -323,7 +344,7 @@ static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
 static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
 				size_t *retlen, u_char *read_buf)
 {
-	struct aspeed_smc_chip *chip = nor->priv;
+	struct aspeed_smc_per_chip *chip = nor->priv;
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
@@ -337,7 +358,7 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
 static void aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
 				  size_t *retlen, const u_char *write_buf)
 {
-	struct aspeed_smc_chip *chip = nor->priv;
+	struct aspeed_smc_per_chip *chip = nor->priv;
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
@@ -348,7 +369,7 @@ static void aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
 
 static int aspeed_smc_remove(struct platform_device *dev)
 {
-	struct aspeed_smc_chip *chip;
+	struct aspeed_smc_per_chip *chip;
 	struct aspeed_smc_controller *controller = platform_get_drvdata(dev);
 	int n;
 
@@ -362,9 +383,10 @@ static int aspeed_smc_remove(struct platform_device *dev)
 }
 
 const struct of_device_id aspeed_smc_matches[] = {
-	{ .compatible = "aspeed,ast2500-fmc", .data = &fmc_info },
-	{ .compatible = "aspeed,ast2400-fmc", .data = &fmc_info },
-	{ .compatible = "aspeed,ast2400-smc", .data = &smc_info },
+	{ .compatible = "aspeed,ast2400-fmc", .data = &fmc_2400_info },
+	{ .compatible = "aspeed,ast2400-smc", .data = &smc_2400_info },
+	{ .compatible = "aspeed,ast2500-fmc", .data = &fmc_2500_info },
+	{ .compatible = "aspeed,ast2500-smc", .data = &smc_2500_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, aspeed_smc_matches);
@@ -419,7 +441,7 @@ static int aspeed_smc_probe(struct platform_device *dev)
 
 	for_each_available_child_of_node(dev->dev.of_node, child) {
 		struct platform_device *cdev;
-		struct aspeed_smc_chip *chip;
+		struct aspeed_smc_per_chip *chip;
 		u32 reg;
 
 		/* This version does not support nand or nor flash devices. */
@@ -456,36 +478,36 @@ static int aspeed_smc_probe(struct platform_device *dev)
 
 		r = platform_get_resource(dev, IORESOURCE_MEM, n + 1);
 		chip->base = devm_ioremap_resource(&dev->dev, r);
-
 		if (!chip->base)
 			continue;
+
 		chip->controller = controller;
 		chip->ctl = controller->regs + info->ctl0 + n * 4;
 
-		/*
-		 * The device tree said the chip is spi.
-		 * XXX Need to set it in controller if has_type says the
-		 * type is programmable.
-		 */
+		/* The device tree said the chip is spi. */
 		chip->type = smc_type_spi;
 
 		/*
-		 * Always turn on the write enable bit in the config register
-		 * to allow opcodes to be sent in user mode.
+		 * Always turn on the write enable bit in the type and settings
+		 * or flash configuration register to allow opcodes to be sent
+		 * in user mode.  Set the attached chip type for this chip
+		 * select if the bits exist.
 		 */
 		mutex_lock(&controller->mutex);
-		reg = readl(controller->regs + info->cfg);
-		dev_dbg(&dev->dev, "flash config was %08x\n", reg);
+		reg = readl(controller->regs + TYPE_SETTING_REG);
+		dev_dbg(&dev->dev, "flash type and setting was %08x\n", reg);
 		reg |= 1 << (info->we0 + n); /* WEn */
-		writel(reg, controller->regs + info->cfg);
+		if (info->hastype) {
+			reg &= ~(3 << (n * 2));
+			reg |= chip->type << (n * 2);
+		}
+		writel(reg, controller->regs + TYPE_SETTING_REG);
 		mutex_unlock(&controller->mutex);
 
 		/*
 		 * Read the existing control register to get basic values.
 		 *
 		 * XXX This register probably needs more sanitation.
-		 * XXX Do we trust the bootloader or the device tree?
-		 * spi-nor.c trusts jtag id over passed ids.
 		 *
 		 * Do we need support for mode 3 vs mode 0 clock phasing?
 		 */
@@ -531,7 +553,7 @@ static int aspeed_smc_probe(struct platform_device *dev)
 		 * Adjust clocks if fast read and write are supported.
 		 * Interpret spi-nor flags to adjust controller settings.
 		 * Check if resource size big enough for detected chip and
-		 * add support assisted (normal or fast-) read.
+		 * add support assisted (normal or fast-) read and dma.
 		 */
 
 		err = mtd_device_register(&chip->nor.mtd, NULL, 0);
-- 
2.7.4
