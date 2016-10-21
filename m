Return-Path: <clg@kaod.org>
Received: from 6.mo69.mail-out.ovh.net (6.mo69.mail-out.ovh.net
 [46.105.50.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0ZYQ2fwXzDsxZ
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 16:51:22 +1100 (AEDT)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 455647BB0
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 07:45:03 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id A8930540069;
 Fri, 21 Oct 2016 07:44:59 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev4.7 v2 1/9] Revert "mtd/spi-nor: Add SPI memory
 controllers for Aspeed SoCs"
Date: Fri, 21 Oct 2016 07:44:42 +0200
Message-Id: <1477028690-27239-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477028690-27239-1-git-send-email-clg@kaod.org>
References: <1477028690-27239-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12348588706119453442
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrheelgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 21 Oct 2016 05:51:23 -0000

This reverts commit 94a6b4df012964167a502cf2ffb4adfff5d40b2e.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 .../devicetree/bindings/mtd/aspeed-smc.txt         |  75 ---
 drivers/mtd/spi-nor/Kconfig                        |  11 -
 drivers/mtd/spi-nor/Makefile                       |   1 -
 drivers/mtd/spi-nor/aspeed-smc.c                   | 567 ---------------------
 4 files changed, 654 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
 delete mode 100644 drivers/mtd/spi-nor/aspeed-smc.c

diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
deleted file mode 100644
index a91496a6e46e..000000000000
--- a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-* Aspeed Static Memory controller in SPI mode
-* Aspeed SPI Flash Controller
-
-Required properties:
-  - compatible : Should be one of
-	"aspeed,ast2400-fmc" for the AST2400 Static Memory Controller
-	"aspeed,ast2500-fmc" for the AST2500 Static Memory Controller
-	"aspeed,ast2400-smc" for the AST2400 SPI flash controller
-  - reg : the first contains the register location and length,
-          the second through nth contains the memory mapping address and length
-	  for the access window for each chips select
-  - interrupts : Should contain the interrupt for the dma device if fmc
-  - clocks : The APB clock input to the controller
-  - #address-cells : must be 1 corresponding to chip select child binding
-  - #size-cells : must be 0 corresponding to chip select child binding
-
-
-Child node required properties:
-  - reg : must contain chip select number in first cell of address, must
-	  be 1 tuple long
-  - compatible : may contain "vendor,part", must include "jedec,spi-nor"
-		(see spi-nor.txt binding).
-
-Child node optional properties:
-  - label           - (optional) name to assign to mtd, default os assigned
-  - spi-max-frequency - (optional) max frequency of spi bus (XXX max if missing)
-  - spi-cpol        - (optional) Empty property indicating device requires
-    	 		inverse clock polarity (CPOL) mode (boolean)
-  - spi-cpha        - (optional) Empty property indicating device requires
-    			shifted clock phase (CPHA) mode (boolean)
-  - spi-tx-bus-width - (optional) The bus width(number of data wires) that
-                        used for MOSI. Defaults to 1 if not present.
-  - spi-rx-bus-width - (optional) The bus width(number of data wires) that
-                        used for MOSI. Defaults to 1 if not present.
-
-Child node optional properties:
- - see mtd/partiton.txt for partitioning bindings and mtd naming
-
-
-Example:
-
-fmc: fmc@1e620000 {
-	compatible = "aspeed,ast2400-fmc";
-	reg = < 0x1e620000 0x94
-		0x20000000 0x02000000
-		0x22000000 0x02000000 >;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	flash@0 {
-		reg = < 0 >;
-		compatible = "jedec,spi-nor" ;
-		label = "bmc";
-		/* spi-max-frequency = <>; */
-		/* m25p,fast-read; */
-		#address-cells = <1>;
-		#size-cells = <1>;
-		boot@0 {
-			label = "boot-loader";
-			reg = < 0 0x8000 >
-		}
-		image@8000 {
-			label = "kernel-image";
-			reg = < 0x8000 0x1f8000 >
-		}
-	};
-	flash@1 {
-		reg = < 1 >;
-		compatible = "jedec,spi-nor" ;
-		label = "alt";
-		/* spi-max-frequency = <>; */
-		status = "fail";
-		/* m25p,fast-read; */
-	};
-};
-
diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index fe336e25f8e2..d42c98e1f581 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -49,15 +49,4 @@ config SPI_NXP_SPIFI
 	  Flash. Enable this option if you have a device with a SPIFI
 	  controller and want to access the Flash as a mtd device.
 
-config ASPEED_FLASH_SPI
-	tristate "Aspeed flash controllers in SPI mode"
-	depends on HAS_IOMEM && OF
-	depends on ARCH_ASPEED || COMPILE_TEST
-	# IO_SPACE_LIMIT must be equivalent to (~0UL)
-	depends on !NEED_MACH_IO_H
-	help
-	  This enables support for the New Static Memory Controller (FMC)
-	  in the AST2400 when attached to SPI nor chips, and support for
-	  the SPI Memory controller (SPI) for the BIOS.
-
 endif # MTD_SPI_NOR
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index a20dd35877b0..0bf3a7f81675 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -1,5 +1,4 @@
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
 obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
 obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
-obj-$(CONFIG_ASPEED_FLASH_SPI)	+= aspeed-smc.o
 obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
deleted file mode 100644
index e61a0d8aa5c0..000000000000
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ /dev/null
@@ -1,567 +0,0 @@
-/*
- * ASPEED Static Memory Controller driver
- * Copyright 2016 IBM Corporation
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  published by the Free Software Foundation.
- *
- */
-
-#include <linux/bug.h>
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-#include <linux/mtd/spi-nor.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/sysfs.h>
-
-/*
- * In user mode bytes all data bytes read or written to the chip decode 
- * address range are sent to the SPI bus.  The range is treated as a fifo
- * of arbitratry 1, 2, or 4 byte width but each write has to be aligned
- * to its size.  The address within the multiple 8kB range is ignored when
- * sending bytes to the SPI bus.
- *
- * On the arm architecture, as of Linux version 4.3, memcpy_fromio and
- * memcpy_toio on little endian targets use the optimized memcpy routines
- * that were designed for well behavied memory storage.  These routines
- * have a stutter if the source and destination are not both word aligned,
- * once with a duplicate access to the source after aligning the destination
- * to a word boundary, and once with a duplicate access to the destination
- * when the final byte count is not word aligned.
- *
- * When writing or reading the fifo this stutter discards data or sends
- * too much data to the fifo and can not be used by this driver.
- *
- * While the low level io string routines that implement the insl family do
- * the desired accesses and memory increments, the cross architecture io
- * macros make them essentially impossible to use on a memory mapped address
- * instead of a a token from the call to iomap of an io port.
- *
- * These fifo routines use readl and friends to a constant io port and update
- * the memory buffer pointer and count via explict code.  The final updates
- * to len are optimistically suppressed.
- */
-
-static void aspeed_smc_from_fifo(void *buf, const void __iomem *iop, size_t len)
-{
-	if (!len)
-		return;
-
-	/* Expect a 4 byte input port.  Otherwise just read bytes. */
-	if (unlikely((unsigned long)iop & 3)) {
-		while (len--) {
-			*(u8 *)buf = readb(iop);
-			buf++;
-		}
-	}
-
-	/* Align target to word: first byte then half word */
-	if ((unsigned long)buf & 1) {
-		*(u8 *)buf = readb(iop);
-		buf++;
-		len--;
-	}
-	if (((unsigned long)buf & 2) && (len >= 2)) {
-		*(u16 *)buf = readw(iop);
-		buf += 2;
-		len -= 2;
-	}
-
-	/* Transfer words, then remaining halfword and remaining byte */
-	while (len >= 4) {
-		*(u32 *)buf = readl(iop);
-		buf += 4;
-		len -= 4;
-	}
-	if (len & 2) {
-		*(u16 *)buf = readw(iop);
-		buf += 2;
-	}
-	if (len & 1) {
-		*(u8 *)buf = readb(iop);
-	}
-}
-
-static void aspeed_smc_to_fifo(void __iomem *iop, const void *buf, size_t len)
-{
-	if (!len)
-		return;
-
-	/* Expect a 4 byte output port.  Otherwise just write bytes. */
-	if ((unsigned long)iop & 3) {
-		while (len--) {
-			writeb(*(u8 *)buf, iop);
-			buf++;
-		}
-		return;
-	}
-
-	/* Align target to word: first byte then half word */
-	if ((unsigned long)buf & 1) {
-		writeb(*(u8 *)buf, iop);
-		buf++;
-		len--;
-	}
-	if (((unsigned long)buf & 2) && (len >= 2)) {
-		writew(*(u16 *)buf, iop);
-		buf += 2;
-		len -= 2;
-	}
-
-	/* Transfer words, then remaining halfword and remaining byte */
-	while (len >= 4) {
-		writel(*(u32 *)buf, iop);
-		buf += 4;
-		len -= 4;
-	}
-	if (len & 2) {
-		writew(*(u16 *)buf, iop);
-		buf += 2;
-	}
-	if (len & 1) {
-		writeb(*(u8 *)buf, iop);
-	}
-}
-
-enum smc_flash_type {
-	smc_type_nor = 0,	/* controller connected to nor flash */
-	smc_type_nand = 1,	/* controller connected to nand flash */
-	smc_type_spi = 2,	/* controller connected to spi flash */
-};
-
-struct aspeed_smc_info {
-	u8 nce;			/* number of chip enables */
-	u8 maxwidth;		/* max width of spi bus */
-	bool hasdma;		/* has dma engine */
-	bool hastype;		/* flash type field exists in cfg reg */
-	u8 we0;			/* we shift for ce 0 in cfg reg */
-	u8 ctl0;		/* offset in regs of ctl for ce 0 */
-	u8 cfg;			/* offset in regs of cfg */
-	u8 time;		/* offset in regs of timing */
-	u8 misc;		/* offset in regs of misc settings */
-};
-
-static struct aspeed_smc_info fmc_info = {
-	.nce = 5,
-	.maxwidth = 4,
-	.hasdma = true,
-	.hastype = true,
-	.we0 = 16,
-	.ctl0 = 0x10,
-	.cfg = 0x00,
-	.time = 0x54,
-	.misc = 0x50,
-};
-
-static struct aspeed_smc_info smc_info = {
-	.nce = 1,
-	.maxwidth = 2,
-	.hasdma = false,
-	.hastype = false,
-	.we0 = 0,
-	.ctl0 = 0x04,
-	.cfg = 0x00,
-	.time = 0x14,
-	.misc = 0x10,
-};
-
-enum smc_ctl_reg_value {
-	smc_base,		/* base value without mode for other commands */
-	smc_read,		/* command reg for (maybe fast) reads */
-	smc_write,		/* command reg for writes with timings */
-	smc_num_ctl_reg_values	/* last value to get count of commands */
-};
-
-struct aspeed_smc_controller;
-
-struct aspeed_smc_chip {
-	struct aspeed_smc_controller *controller;
-	__le32 __iomem *ctl;			/* control register */
-	void __iomem *base;			/* base of chip window */
-	__le32 ctl_val[smc_num_ctl_reg_values];	/* controls with timing */
-	enum smc_flash_type type;		/* what type of flash */
-	struct spi_nor nor;
-};
-
-struct aspeed_smc_controller {
-	struct mutex mutex;			/* controller access mutex */
-	const struct aspeed_smc_info *info;	/* type info of controller */
-	void __iomem *regs;			/* controller registers */
-	struct aspeed_smc_chip *chips[0];	/* pointers to attached chips */
-};
-
-#define CONTROL_SPI_AAF_MODE BIT(31)
-#define CONTROL_SPI_IO_MODE_MASK GENMASK(30, 28)
-#define CONTROL_SPI_IO_DUAL_DATA BIT(29)
-#define CONTROL_SPI_IO_DUAL_ADDR_DATA (BIT(29) | BIT(28))
-#define CONTROL_SPI_IO_QUAD_DATA BIT(30)
-#define CONTROL_SPI_IO_QUAD_ADDR_DATA (BIT(30) | BIT(28))
-#define CONTROL_SPI_CE_INACTIVE_SHIFT 24
-#define CONTROL_SPI_CE_INACTIVE_MASK GENMASK(27, CONTROL_SPI_CE_INACTIVE_SHIFT)
-/* 0 = 16T ... 15 = 1T   T=HCLK */
-#define CONTROL_SPI_COMMAND_SHIFT 16
-#define CONTROL_SPI_DUMMY_CYCLE_COMMAND_OUTPUT BIT(15)
-#define CONTROL_SPI_IO_DUMMY_CYCLES_HI BIT(14)
-#define CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT (14 - 2)
-#define CONTROL_SPI_IO_ADDRESS_4B BIT(13) /* FMC, LEGACY */
-#define CONTROL_SPI_CLK_DIV4 BIT(13) /* BIOS */
-#define CONTROL_SPI_RW_MERGE BIT(12)
-#define CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT 6
-#define CONTROL_SPI_IO_DUMMY_CYCLES_LO GENMASK(7, CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT)
-#define CONTROL_SPI_IO_DUMMY_CYCLES_MASK (CONTROL_SPI_IO_DUMMY_CYCLES_HI | \
-					  CONTROL_SPI_IO_DUMMY_CYCLES_LO)
-#define CONTROL_SPI_CLOCK_FREQ_SEL_SHIFT 8
-#define CONTROL_SPI_CLOCK_FREQ_SEL_MASK GENMASK(11, CONTROL_SPI_CLOCK_FREQ_SEL_SHIFT)
-#define CONTROL_SPI_LSB_FIRST BIT(5)
-#define CONTROL_SPI_CLOCK_MODE_3 BIT(4)
-#define CONTROL_SPI_IN_DUAL_DATA BIT(3)
-#define CONTROL_SPI_CE_STOP_ACTIVE_CONTROL BIT(2)
-#define CONTROL_SPI_COMMAND_MODE_MASK GENMASK(1, 0)
-#define CONTROL_SPI_COMMAND_MODE_NORMAL (0)
-#define CONTROL_SPI_COMMAND_MODE_FREAD (1)
-#define CONTROL_SPI_COMMAND_MODE_WRITE (2)
-#define CONTROL_SPI_COMMAND_MODE_USER (3)
-
-#define CONTROL_SPI_KEEP_MASK (CONTROL_SPI_AAF_MODE | \
-	CONTROL_SPI_CE_INACTIVE_MASK | CONTROL_SPI_IO_ADDRESS_4B | \
-	CONTROL_SPI_IO_DUMMY_CYCLES_MASK | CONTROL_SPI_CLOCK_FREQ_SEL_MASK | \
-	CONTROL_SPI_LSB_FIRST | CONTROL_SPI_CLOCK_MODE_3)
-
-
-static u32 spi_control_fill_opcode(u8 opcode)
-{
-	return ((u32)(opcode)) << CONTROL_SPI_COMMAND_SHIFT;
-}
-
-static void aspeed_smc_start_user(struct spi_nor *nor)
-{
-	struct aspeed_smc_chip *chip = nor->priv;
-	u32 ctl = chip->ctl_val[smc_base];
-
-	mutex_lock(&chip->controller->mutex);
-
-	ctl |= CONTROL_SPI_COMMAND_MODE_USER |
-		CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
-	writel(ctl, chip->ctl);
-
-	ctl &= ~CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
-	writel(ctl, chip->ctl);
-}
-
-static void aspeed_smc_stop_user(struct spi_nor *nor)
-{
-	struct aspeed_smc_chip *chip = nor->priv;
-
-	u32 ctl = chip->ctl_val[smc_read];
-	u32 ctl2 = ctl | CONTROL_SPI_COMMAND_MODE_USER |
-		CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
-
-	writel(ctl2, chip->ctl);	/* stop user CE control */
-	writel(ctl, chip->ctl);		/* default to fread or read */
-
-	mutex_unlock(&chip->controller->mutex);
-}
-
-static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
-{
-	struct aspeed_smc_chip *chip = nor->priv;
-
-	aspeed_smc_start_user(nor);
-	aspeed_smc_to_fifo(chip->base, &opcode, 1);
-	aspeed_smc_from_fifo(buf, chip->base, len);
-	aspeed_smc_stop_user(nor);
-
-	return 0;
-}
-
-static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
-				int len)
-{
-	struct aspeed_smc_chip *chip = nor->priv;
-
-	aspeed_smc_start_user(nor);
-	aspeed_smc_to_fifo(chip->base, &opcode, 1);
-	aspeed_smc_to_fifo(chip->base, buf, len);
-	aspeed_smc_stop_user(nor);
-
-	return 0;
-}
-
-static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
-{
-	struct aspeed_smc_chip *chip = nor->priv;
-	__be32 temp;
-	u32 cmdaddr;
-
-	switch (nor->addr_width) {
-	default:
-		WARN_ONCE(1, "Unexpected address width %u, defaulting to 3\n",
-			  nor->addr_width);
-		/* FALLTHROUGH */
-	case 3:
-		cmdaddr = addr & 0xFFFFFF;
-
-		cmdaddr |= (u32)cmd << 24;
-
-		temp = cpu_to_be32(cmdaddr);
-		aspeed_smc_to_fifo(chip->base, &temp, 4);
-		break;
-	case 4:
-		temp = cpu_to_be32(addr);
-		aspeed_smc_to_fifo(chip->base, &cmd, 1);
-		aspeed_smc_to_fifo(chip->base, &temp, 4);
-		break;
-	}
-}
-
-static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
-				size_t *retlen, u_char *read_buf)
-{
-	struct aspeed_smc_chip *chip = nor->priv;
-
-	aspeed_smc_start_user(nor);
-	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
-	aspeed_smc_from_fifo(read_buf, chip->base, len);
-	*retlen += len;
-	aspeed_smc_stop_user(nor);
-
-	return 0;
-}
-
-static void aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
-				  size_t *retlen, const u_char *write_buf)
-{
-	struct aspeed_smc_chip *chip = nor->priv;
-
-	aspeed_smc_start_user(nor);
-	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
-	aspeed_smc_to_fifo(chip->base, write_buf, len);
-	*retlen += len;
-	aspeed_smc_stop_user(nor);
-}
-
-static int aspeed_smc_remove(struct platform_device *dev)
-{
-	struct aspeed_smc_chip *chip;
-	struct aspeed_smc_controller *controller = platform_get_drvdata(dev);
-	int n;
-
-	for (n = 0; n < controller->info->nce; n++) {
-		chip = controller->chips[n];
-		if (chip)
-			mtd_device_unregister(&chip->nor.mtd);
-	}
-
-	return 0;
-}
-
-const struct of_device_id aspeed_smc_matches[] = {
-	{ .compatible = "aspeed,ast2500-fmc", .data = &fmc_info },
-	{ .compatible = "aspeed,ast2400-fmc", .data = &fmc_info },
-	{ .compatible = "aspeed,ast2400-smc", .data = &smc_info },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, aspeed_smc_matches);
-
-static struct platform_device *
-of_platform_device_create_or_find(struct device_node *child,
-				  struct device *parent)
-{
-	struct platform_device *cdev;
-
-	cdev = of_platform_device_create(child, NULL, parent);
-	if (!cdev)
-		cdev = of_find_device_by_node(child);
-	return cdev;
-}
-
-static int aspeed_smc_probe(struct platform_device *dev)
-{
-	struct aspeed_smc_controller *controller;
-	const struct of_device_id *match;
-	const struct aspeed_smc_info *info;
-	struct resource *r;
-	void __iomem *regs;
-	struct device_node *child;
-	int err = 0;
-	unsigned int n;
-
-	match = of_match_device(aspeed_smc_matches, &dev->dev);
-	if (!match || !match->data)
-		return -ENODEV;
-	info = match->data;
-	r = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(&dev->dev, r);
-	if (IS_ERR(regs))
-		return PTR_ERR(regs);
-
-	controller = devm_kzalloc(&dev->dev, sizeof(*controller) +
-		info->nce * sizeof(controller->chips[0]), GFP_KERNEL);
-	if (!controller)
-		return -ENOMEM;
-	platform_set_drvdata(dev, controller);
-	controller->regs = regs;
-	controller->info = info;
-	mutex_init(&controller->mutex);
-
-	/* The pinmux or bootloader will disable legacy mode. */
-
-	/*
-	 * XXX Need to add arbitration to the SMC (BIOS) controller if access
-	 * is shared by the host.
-	 */
-
-	for_each_available_child_of_node(dev->dev.of_node, child) {
-		struct platform_device *cdev;
-		struct aspeed_smc_chip *chip;
-		u32 reg;
-
-		/* This version does not support nand or nor flash devices. */
-		if (!of_device_is_compatible(child, "jedec,spi-nor"))
-			continue;
-
-
-		/*
-		 * create a platform device from the of node.  If the device
-		 * already was created (eg from a prior bind/unbind cycle)
-		 * reuse it.
-		 *
-		 * The creating the device node for the child here allows its
-		 * use for error reporting via dev_err below.
-		 */
-		cdev = of_platform_device_create_or_find(child, &dev->dev);
-		if (!cdev)
-			continue;
-
-		err = of_property_read_u32(child, "reg", &n);
-		if (err == -EINVAL && info->nce == 1)
-			n = 0;
-		else if (err || n >= info->nce)
-			continue;
-		if (controller->chips[n]) {
-			dev_err(&cdev->dev,
-				"chip-id %u already in use in use by %s\n",
-				n, dev_name(controller->chips[n]->nor.dev));
-			continue;
-		}
-		chip = devm_kzalloc(&dev->dev, sizeof(*chip), GFP_KERNEL);
-		if (!chip)
-			continue;
-
-		r = platform_get_resource(dev, IORESOURCE_MEM, n + 1);
-		chip->base = devm_ioremap_resource(&dev->dev, r);
-
-		if (!chip->base)
-			continue;
-		chip->controller = controller;
-		chip->ctl = controller->regs + info->ctl0 + n * 4;
-
-		/*
-		 * The device tree said the chip is spi.
-		 * XXX Need to set it in controller if has_type says the
-		 * type is programmable.
-		 */
-		chip->type = smc_type_spi;
-
-		/*
-		 * Always turn on the write enable bit in the config register
-		 * to allow opcodes to be sent in user mode.
-		 */
-		mutex_lock(&controller->mutex);
-		reg = readl(controller->regs + info->cfg);
-		dev_dbg(&dev->dev, "flash config was %08x\n", reg);
-		reg |= 1 << (info->we0 + n); /* WEn */
-		writel(reg, controller->regs + info->cfg);
-		mutex_unlock(&controller->mutex);
-
-		/*
-		 * Read the existing control register to get basic values.
-		 *
-		 * XXX This register probably needs more sanitation.
-		 * XXX Do we trust the bootloader or the device tree?
-		 * spi-nor.c trusts jtag id over passed ids.
-		 *
-		 * Do we need support for mode 3 vs mode 0 clock phasing?
-		 */
-		reg = readl(chip->ctl);
-		chip->ctl_val[smc_base] = reg & CONTROL_SPI_KEEP_MASK;
-
-		/*
-		 * Retain the prior value of the control register as the
-		 * default if it was normal access mode.  Otherwise start
-		 * with the sanitized base value set to read mode.
-		 */
-		if ((reg & CONTROL_SPI_COMMAND_MODE_MASK) ==
-		     CONTROL_SPI_COMMAND_MODE_NORMAL)
-			chip->ctl_val[smc_read] = reg;
-		else
-			chip->ctl_val[smc_read] = chip->ctl_val[smc_base] |
-				CONTROL_SPI_COMMAND_MODE_NORMAL;
-
-		chip->nor.dev = &cdev->dev;
-		chip->nor.priv = chip;
-		spi_nor_set_flash_node(&chip->nor, child);
-		chip->nor.mtd.name = of_get_property(child, "label", NULL);
-		chip->nor.read = aspeed_smc_read_user;
-		chip->nor.write = aspeed_smc_write_user;
-		chip->nor.read_reg = aspeed_smc_read_reg;
-		chip->nor.write_reg = aspeed_smc_write_reg;
-
-		/*
-		 * XXX Add support for SPI_NOR_QUAD and SPI_NOR_DUAL attach
-		 * when board support is present as determined by of property.
-		 */
-		err = spi_nor_scan(&chip->nor, NULL, SPI_NOR_NORMAL);
-		if (err)
-			continue;
-
-		chip->ctl_val[smc_write] = chip->ctl_val[smc_base] |
-			spi_control_fill_opcode(chip->nor.program_opcode) |
-			CONTROL_SPI_COMMAND_MODE_WRITE;
-
-		/*
-		 * XXX TODO
-		 * Enable fast read mode as required here.
-		 * Adjust clocks if fast read and write are supported.
-		 * Interpret spi-nor flags to adjust controller settings.
-		 * Check if resource size big enough for detected chip and
-		 * add support assisted (normal or fast-) read.
-		 */
-
-		err = mtd_device_register(&chip->nor.mtd, NULL, 0);
-		if (err)
-			continue;
-		controller->chips[n] = chip;
-	}
-
-	/* Were any children registered? */
-	for (n = 0; n < info->nce; n++)
-		if (controller->chips[n])
-			break;
-
-	if (n == info->nce)
-		return -ENODEV;
-
-	return 0;
-}
-
-static struct platform_driver aspeed_smc_driver = {
-	.probe = aspeed_smc_probe,
-	.remove = aspeed_smc_remove,
-	.driver = {
-		.name = KBUILD_MODNAME,
-		.of_match_table = aspeed_smc_matches,
-	}
-};
-
-module_platform_driver(aspeed_smc_driver);
-
-MODULE_DESCRIPTION("ASPEED Static Memory Controller Driver");
-MODULE_AUTHOR("Milton Miller");
-MODULE_LICENSE("GPL v2");
-- 
2.7.4
