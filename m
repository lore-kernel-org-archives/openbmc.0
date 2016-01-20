Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5A6771A1816
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 10:10:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145333142357961.1733376370554;
 Wed, 20 Jan 2016 15:10:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH openbmc 3/6] linux-obmc: apply the aspeed-spi-nor controller
 patchset
Date: Wed, 20 Jan 2016 17:10:17 -0600
Message-Id: <1453331420-6524-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jan 2016 23:10:29 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Thie applies the apseed-spi-nor driver and patches the dts for
palmetto and barreleye when building the linux image.  It also
enables the config options for the driver and some file systems to
support the overlay filesystem stack used by obmc-phosphor-initfs.

It also applies the rtc month fix patch.
---
 ...-Add-SPI-memory-controllers-for-ASPEED-AS.patch | 686 +++++++++++++++++++++
 .../0001-rtc-aspeed-month-is-off-by-one.patch      |  35 ++
 .../recipes-kernel/linux/linux-obmc/defconfig      |   5 +
 .../linux/linux-obmc/spinor-dts.patch              | 147 +++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   5 +-
 5 files changed, 877 insertions(+), 1 deletion(-)
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-mtd-spi-nor-Add-SPI-memory-controllers-for-ASPEED-AS.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-rtc-aspeed-month-is-off-by-one.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/spinor-dts.patch

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-mtd-spi-nor-Add-SPI-memory-controllers-for-ASPEED-AS.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-mtd-spi-nor-Add-SPI-memory-controllers-for-ASPEED-AS.patch
new file mode 100644
index 0000000..b9a0d0a
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-mtd-spi-nor-Add-SPI-memory-controllers-for-ASPEED-AS.patch
@@ -0,0 +1,686 @@
+From d10437c5fd4ce86722863e8408491355529a0b69 Mon Sep 17 00:00:00 2001
+From: "Milton D. Miller II" <miltonm@us.ibm.com>
+Date: Wed, 9 Dec 2015 16:47:10 -0600
+Subject: [PATCH 1/1] mtd/spi-nor: Add SPI memory controllers for ASPEED
+ AST2400
+
+This driver adds mtd support for spi-nor attached to either or both of
+the Static Memory Controller (new registers) or the SPI Memory Controller.
+
+The static memory controller is the boot soruce for the SOC.  The
+controller supports upto 5 chip selects in any combination of NAND,
+NOR, and SPI.  The memory controller registers were updated in the
+AST2300 and this fmc binding is for the registers in the new mode.
+This driver currently supports only SPI-NOR attached memory, but has
+some consierations to support the others later (including choice of the
+Kconfig symbol).
+
+There is also a similar register set to suport the Static Memory
+Controller in a legacy address mode.   That mode is not currently
+supported because it is expected that the system will run with the
+fmc binding supporting multiple chip selects.
+
+The normal aplication of the SPI memory controller is designated for
+use by the host system either for video bios or system bios and can be
+accessed over either an LPC bus and/or a PCIe bus.  The SOC can also
+access this chip for firmware updates.
+
+This driver has only been tested with the ast2400 SOC.
+
+Signed-off-by: Milton Miller <miltonm@us.ibm.com>
+---
+ .../devicetree/bindings/mtd/aspeed-smc.txt         |  68 +++
+ drivers/mtd/spi-nor/Kconfig                        |   7 +
+ drivers/mtd/spi-nor/Makefile                       |   1 +
+ drivers/mtd/spi-nor/aspeed-smc.c                   | 539 +++++++++++++++++++++
+ 4 files changed, 615 insertions(+)
+ create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
+ create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
+
+diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
+new file mode 100644
+index 0000000..087f9bf
+--- /dev/null
++++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
+@@ -0,0 +1,68 @@
++* Aspeed Static Memory controller in SPI mode
++* Aspeed SPI Flash Controller
++
++Required properties:
++  - compatible : Should be "aspeed,fmc" for Static Memory Controller (AST2400, AST2300?), or
++		 "aspeed,smc" for the SPI flash controller
++  - reg : the first contains the register location and length,
++          the second through nth contains the memory mapping address and length
++	  for the access window for each chips select
++  - interrupts : Should contain the interrupt for the dma device if fmc
++  - clocks : The APB clock input to the controller
++  - #address-cells : must be 1 corresponding to chip select child binding
++  - #size-cells : must be 0 corresponding to chip select child binding
++
++
++Child node required properties:
++  - reg : must contain chip select number in first cell of address, must
++	  be 1 tuple long
++  - compatible : may contain "vendor,part", must include "jedec,spi-nor"
++		(see spi-nor.txt binding).
++
++Child node optional properties:
++  - spi-max-frequency - (optional) max frequency of spi bus (XXX max if missing)
++  - spi-cpol        - (optional) Empty property indicating device requires
++    	 		inverse clock polarity (CPOL) mode (boolean)
++  - spi-cpha        - (optional) Empty property indicating device requires
++    			shifted clock phase (CPHA) mode (boolean)
++  - spi-tx-bus-width - (optional) The bus width(number of data wires) that
++                        used for MOSI. Defaults to 1 if not present.
++  - spi-rx-bus-width - (optional) The bus width(number of data wires) that
++                        used for MOSI. Defaults to 1 if not present.
++
++Child node optional properties:
++ - see mtd/partiton.txt for partitioning bindings and mtd naming
++
++
++Example:
++
++fmc: fmc@1e620000 {
++	compatible = "aspeed,fmc";
++	reg = < 0x1e620000 0x94
++		0x20000000 0x02000000
++		0x22000000 0x02000000 >;
++	#address-cells = <1>;
++	#size-cells = <0>;
++	bmc@0 {
++		reg = < 0 >;
++		compatible = "jedec,spi-nor" ;
++		label = "bmc0";
++		/* spi-max-frequency = <>; */
++		/* m25p,fast-read; */
++		#address-cells = <1>;
++		#size-cells = <1>;
++			bootloader {
++				label = "boot";
++				reg = < 0 0x8000 >
++			}
++	};
++	alt@1 {
++		reg = < 1 >;
++		compatible = "jedec,spi-nor" ;
++		label = "bmc1";
++		/* spi-max-frequency = <>; */
++		status = "fail";
++		/* m25p,fast-read; */
++	};
++};
++
+diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
+index 89bf4c1..5f623f9 100644
+--- a/drivers/mtd/spi-nor/Kconfig
++++ b/drivers/mtd/spi-nor/Kconfig
+@@ -40,4 +40,11 @@ config SPI_NXP_SPIFI
+ 	  Flash. Enable this option if you have a device with a SPIFI
+ 	  controller and want to access the Flash as a mtd device.
+ 
++config ASPEED_FLASH_SPI
++	tristate "Aspeed flash controllers in SPI mode"
++	help
++	  This enables support for the New Static Memory Controller (FMC)
++	  in the AST2400 when attached to SPI nor chips, and support for
++	  the SPI Memory controller (SPI) for the BIOS.
++
+ endif # MTD_SPI_NOR
+diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
+index e53333e..ec28610 100644
+--- a/drivers/mtd/spi-nor/Makefile
++++ b/drivers/mtd/spi-nor/Makefile
+@@ -1,3 +1,4 @@
+ obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
+ obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
++obj-$(CONFIG_ASPEED_FLASH_SPI)	+= aspeed-smc.o
+ obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
+diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
+new file mode 100644
+index 0000000..2497648
+--- /dev/null
++++ b/drivers/mtd/spi-nor/aspeed-smc.c
+@@ -0,0 +1,539 @@
++/* ASPEED Static Memory Controller driver
++ * Copyright 2015
++ * Milton Miller
++ *
++ */
++#define DEBUG
++
++#include <linux/device.h>
++#include <linux/io.h>
++#include <linux/module.h>
++#include <linux/mutex.h>
++#include <linux/mtd/mtd.h>
++#include <linux/mtd/partitions.h>
++#include <linux/mtd/spi-nor.h>
++#include <linux/of.h>
++#include <linux/of_platform.h>
++#include <linux/sysfs.h>
++
++enum smc_controller_type {
++	smc_type_leg,		/* legacy register mode and map */
++	smc_type_fmc,		/* new FMC 5 CEs multiple flash types */
++	smc_type_smc,		/* SPI memory controller for BIOS / host */
++};
++
++enum smc_flash_type {
++	smc_type_nor = 0,	/* controller connected to nor flash */
++	smc_type_nand = 1,	/* controller connected to nand flash */
++	smc_type_spi = 2,	/* controller connected to spi flash */
++};
++
++struct aspeed_smc_info {
++	unsigned long nce : 3;		/* number of chip enables */
++	unsigned long hasdma : 1;	/* has dma engine */
++	unsigned long maxwidth : 3;	/* max width of spi bus */
++	unsigned long we0 : 5;		/* we shift for ce 0 in cfg reg */
++	unsigned long hastype : 1;	/* type shift for ce 0 in cfg reg */
++	u8 ctl0;			/* offset in regs of ctl for ce 0 */
++	u8 cfg;				/* offset in regs of cfg */
++	u8 time;			/* offset in regs of timing */
++};
++
++#define E(_ce, _dma, _w, _ctl, _cfg, _we0, _hastype, _time, _misc) \
++	.nce = _ce, .ctl0 = _ctl, .cfg = 0, .we0 = _we0, .hastype = _hastype, \
++	.hasdma = _dma, .maxwidth = _w, .time = _time
++
++struct aspeed_smc_info aspeed_table[] = {
++	[smc_type_fmc] = { E(5, 1, 4, 0x10, 0x00, 16, 1, 0x54, 0x50) },
++	[smc_type_smc] = { E(1, 0, 2, 0x04, 0x00, 0,  0, 0x14, 0x10) },
++};
++
++#undef E
++
++enum smc_ctl_reg {
++	smc_base,		/* base value without mode for other commands */
++	smc_read,		/* command reg for (maybe fast) reads */
++	smc_write,		/* command reg for writes with timings */
++	smc_num_ctl_reg		/* last value to get count of commands */
++};
++
++struct aspeed_smc_controller;
++
++struct aspeed_smc_chip {
++	struct aspeed_smc_controller *controller;
++	__le32 __iomem *ctl;			/* control register */
++	void __iomem *base;			/* base of chip window */
++	__le32 ctl_val[smc_num_ctl_reg];	/* controls with timing */
++	struct mtd_info mtd;
++	struct spi_nor nor;
++};
++
++struct aspeed_smc_controller {
++	struct mutex mutex;			/* controller access mutex */
++	const struct aspeed_smc_info *info;	/* type info of controller */
++	void __iomem *regs;			/* controller registers */
++	struct aspeed_smc_chip *chips[0];	/* attached chips */
++};
++
++#define CONTROL_SPI_AAF_MODE BIT(31)
++#define CONTROL_SPI_IO_MODE_MASK GENMAASK(30, 28)
++#define CONTROL_SPI_IO_DUAL_DATA BIT(29)
++#define CONTROL_SPI_IO_DUAL_ADDR_DATA (BIT(29) | BIT(28))
++#define CONTROL_SPI_IO_QUAD_DATA BIT(30)
++#define CONTROL_SPI_IO_QUAD_ADDR_DATA (BIT(30) | BIT(28))
++#define CONTROL_SPI_CE_INACTIVE_SHIFT 24
++#define CONTROL_SPI_CE_INACTIVE_MASK GENMASK(27, CONTROL_SPI_CE_INACTIVE_SHIFT)
++/* 0 = 16T ... 15 = 1T   T=HCLK */
++#define CONTROL_SPI_COMMAND_SHIFT 16
++#define CONTROL_SPI_DUMMY_CYCLE_COMMAND_OUTPUT BIT(15)
++#define CONTROL_SPI_IO_DUMMY_CYCLES_HI BIT(14)
++#define CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT (14 - 2)
++#define CONTROL_SPI_IO_ADDRESS_4B BIT(13) /* FMC, LEGACY */
++#define CONTROL_SPI_CLK_DIV4 BIT(13) /* BIOS */
++#define CONTROL_SPI_RW_MERGE BIT(12)
++#define CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT 6
++#define CONTROL_SPI_IO_DUMMY_CYCLES_LO GENMASK(7, CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT)
++#define CONTROL_SPI_IO_DUMMY_CYCLES_MASK (CONTROL_SPI_IO_DUMMY_CYCLES_HI | \
++					  CONTROL_SPI_IO_DUMMY_CYCLES_LO)
++#define CONTROL_SPI_CLOCK_FREQ_SEL_SHIFT 8
++#define CONTROL_SPI_CLOCK_FREQ_SEL_MASK GENMASK(11, CONTROL_SPI_CLOCK_FREQ_SEL_SHIFT)
++#define CONTROL_SPI_LSB_FIRST BIT(5)
++#define CONTROL_SPI_CLOCK_MODE_3 BIT(4)
++#define CONTROL_SPI_IN_DUAL_DATA BIT(3)
++#define CONTROL_SPI_CE_STOP_ACTIVE_CONTROL BIT(2)
++#define CONTROL_SPI_COMMAND_MODE_MASK GENMASK(1, 0)
++#define CONTROL_SPI_COMMAND_MODE_NORMAL (0)
++#define CONTROL_SPI_COMMAND_MODE_FREAD (1)
++#define CONTROL_SPI_COMMAND_MODE_WRITE (2)
++#define CONTROL_SPI_COMMAND_MODE_USER (3)
++
++#define CONTROL_SPI_KEEP_MASK (CONTROL_SPI_AAF_MODE | \
++	CONTROL_SPI_CE_INACTIVE_MASK | CONTROL_SPI_IO_ADDRESS_4B | \
++	CONTROL_SPI_IO_DUMMY_CYCLES_MASK | CONTROL_SPI_CLOCK_FREQ_SEL_MASK | \
++	CONTROL_SPI_LSB_FIRST | CONTROL_SPI_CLOCK_MODE_3)
++
++#define CONTROL_SPI_CLK_DIV4 BIT(13) /* BIOS */
++
++static u32 spi_control_fill_opcode(u8 opcode)
++{
++	return ((u32)(opcode)) << CONTROL_SPI_COMMAND_SHIFT;
++}
++
++#if 0 /* ATTR */
++static u32 spi_control_to_freq_div(u32 control)
++{
++	u32 sel;
++
++	sel = control & CONTROL_SPI_CLOCK_FREQ_SEL_MASK;
++	sel >>= CONTROL_SPI_CLOCK_FREQ_SEL_SHIFT;
++
++	/* 16, 14, 12, 10, 8, 6, 4, 2, 15, 13, 11, 9, 7, 5, 3, 1 */
++	return 16 - (((sel & 7) << 1) + ((sel & 8) >> 1));
++}
++
++static u32 spi_control_to_dummy_bytes(u32 control)
++{
++
++	return ((control & CONTROL_SPI_IO_DUMMY_CYCLES_LO) >>
++			CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT) |
++		((control & CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT) >>
++			CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT);
++}
++
++static size_t show_ctl_div(u32 control, char *buf)
++{
++	return sprintf(buf, "%u\n", spi_control_to_freq_div(control));
++}
++
++static size_t show_ctl_dummy_bytes(u32 control, char *buf)
++{
++	return sprintf(buf, "%u\n", spi_control_to_dummy_bytes(control));
++}
++#endif /* ATTR */
++
++static void aspeed_smc_start_user(struct spi_nor *nor)
++{
++	struct aspeed_smc_chip *chip = nor->priv;
++	u32 ctl = chip->ctl_val[smc_base];
++
++	if (chip->controller)
++		mutex_lock(&chip->controller->mutex);
++
++	ctl |= CONTROL_SPI_COMMAND_MODE_USER |
++		CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
++	writel(ctl, chip->ctl);
++
++	ctl &= ~CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
++	writel(ctl, chip->ctl);
++}
++
++static void aspeed_smc_stop_user(struct spi_nor *nor)
++{
++	struct aspeed_smc_chip *chip = nor->priv;
++
++	u32 ctl = chip->ctl_val[smc_read];
++	u32 ctl2 = ctl | CONTROL_SPI_COMMAND_MODE_USER |
++		CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
++
++	writel(ctl2, chip->ctl);	/* stop user CE control */
++	writel(ctl, chip->ctl);		/* default to fread or read */
++
++	if (chip->controller)
++		mutex_unlock(&chip->controller->mutex);
++}
++
++#if 0 /* memcpy */
++static void aspeed_smc_start_write(struct spi_nor *nor)
++{
++	struct aspeed_smc_chip *chip = nor->priv;
++	u32 ctl = chip->ctl_val[smc_write];
++
++	if (chip->controller)
++		mutex_lock(&chip->controller->mutex);
++
++	writel(ctl | CONTROL_SPI_CE_STOP_ACTIVE_CONTROL,  chip->ctl);
++
++	writel(ctl, chip->ctl);
++}
++
++static void aspeed_smc_stop_write(struct spi_nor *nor)
++{
++	aspeed_smc_stop_user(nor);
++}
++#endif
++
++static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
++{
++	struct aspeed_smc_chip *chip = nor->priv;
++
++	aspeed_smc_start_user(nor);
++	writeb(opcode, chip->base);
++	_memcpy_fromio(buf, chip->base, len);
++	aspeed_smc_stop_user(nor);
++
++	return 0;
++}
++
++static int aspeed_smc_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
++				int len, int write_enable)
++{
++	struct aspeed_smc_chip *chip = nor->priv;
++
++	aspeed_smc_start_user(nor);
++	writeb(opcode, chip->base);
++	_memcpy_toio(chip->base, buf, len);
++	aspeed_smc_stop_user(nor);
++
++	return 0;
++}
++
++static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
++{
++	struct aspeed_smc_chip *chip = nor->priv;
++	__be32 temp;
++	u32 cmdaddr;
++
++	switch (nor->addr_width) {
++	default:
++		WARN_ONCE(1, "Unexpected address width %u, defaulting to 3\n",
++			  nor->addr_width);
++		/* FALLTHROUGH */
++	case 3:
++		cmdaddr = addr & 0xFFFFFF;
++
++		cmdaddr |= (u32)cmd << 24;
++
++		temp = cpu_to_be32(cmdaddr);
++		memcpy_toio(chip->base, &temp, 4);
++		break;
++	case 4:
++		temp = cpu_to_be32(addr);
++		writeb(cmd, chip->base);
++		memcpy_toio(chip->base, &temp, 4);
++		break;
++	}
++}
++
++#if 0 /* memcpy */
++static int aspeed_smc_read_memcpy(struct spi_nor *nor, loff_t from, size_t len,
++				  size_t *retlen, u_char *read_buf)
++{
++	struct aspeed_smc_chip *chip = nor->priv;
++
++	if (chip->controller)
++		mutex_lock(&chip->controller->mutex);
++
++	memcpy_fromio(read_buf, chip->base, len);
++	*retlen += len;
++
++	if (chip->controller)
++		mutex_unlock(&chip->controller->mutex);
++
++	return 0;
++}
++
++static void aspeed_smc_write_memcpy(struct spi_nor *nor, loff_t to, size_t len,
++				    size_t *retlen, const u_char *write_buf)
++{
++	struct aspeed_smc_chip *chip = nor->priv;
++
++	aspeed_smc_start_write(nor);
++	memcpy_toio(chip->base, write_buf, len);
++	*retlen += len;
++	aspeed_smc_stop_write(nor);
++}
++#endif
++
++static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
++				size_t *retlen, u_char *read_buf)
++{
++	struct aspeed_smc_chip *chip = nor->priv;
++
++	aspeed_smc_start_user(nor);
++	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
++	memcpy_fromio(read_buf, chip->base, len);
++	*retlen += len;
++	aspeed_smc_stop_user(nor);
++
++	return 0;
++}
++
++static void aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
++				  size_t *retlen, const u_char *write_buf)
++{
++	struct aspeed_smc_chip *chip = nor->priv;
++
++	aspeed_smc_start_user(nor);
++	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
++	memcpy_toio(chip->base, write_buf, len);
++	*retlen += len;
++	aspeed_smc_stop_user(nor);
++}
++
++static int aspeed_smc_erase(struct spi_nor *nor, loff_t offs)
++{
++	aspeed_smc_start_user(nor);
++	aspeed_smc_send_cmd_addr(nor, nor->erase_opcode, offs);
++	aspeed_smc_stop_user(nor);
++
++	return 0;
++}
++
++static int aspeed_smc_remove(struct platform_device *dev)
++{
++	struct aspeed_smc_chip *chip;
++	struct aspeed_smc_controller *controller = platform_get_drvdata(dev);
++	int n;
++
++	for (n = 0; n < controller->info->nce; n++) {
++		chip = controller->chips[n];
++		if (chip)
++			mtd_device_unregister(&chip->mtd);
++	}
++
++	return 0;
++}
++
++const struct of_device_id aspeed_smc_matches[] = {
++	{ .compatible = "aspeed,fmc", .data = &aspeed_table[smc_type_fmc] },
++	{ .compatible = "aspeed,smc", .data = &aspeed_table[smc_type_smc] },
++	{ }
++};
++MODULE_DEVICE_TABLE(of, aspeed_smc_matches);
++
++
++static struct platform_device *
++of_platform_device_create_or_find(struct device_node *child,
++				  struct device *parent)
++{
++	struct platform_device *cdev;
++
++	cdev = of_platform_device_create(child, NULL, parent);
++	if (!cdev)
++		cdev = of_find_device_by_node(child);
++	return cdev;
++}
++
++static int aspeed_smc_probe(struct platform_device *dev)
++{
++	struct aspeed_smc_controller *controller;
++	const struct of_device_id *match;
++	const struct aspeed_smc_info *info;
++	struct resource *r;
++	void __iomem *regs;
++	struct device_node *child;
++	int err = 0;
++	unsigned int n;
++
++	match = of_match_device(aspeed_smc_matches, &dev->dev);
++	if (!match)
++		return -ENODEV;
++	info = match->data;
++	r = platform_get_resource(dev, IORESOURCE_MEM, 0);
++	regs = devm_ioremap_resource(&dev->dev, r);
++	if (IS_ERR(regs))
++		return PTR_ERR(regs);
++
++	controller = devm_kzalloc(&dev->dev, sizeof(*controller) +
++		info->nce * sizeof(controller->chips[0]), GFP_KERNEL);
++	if (!controller)
++		return -ENOMEM;
++	platform_set_drvdata(dev, controller);
++	controller->regs = regs;
++	controller->info = info;
++	mutex_init(&controller->mutex);
++
++	/* XXX turn off legacy mode if fmc ? */
++	/* XXX handshake to enable access to SMC (bios) controller w/ host? */
++
++	for_each_available_child_of_node(dev->dev.of_node, child) {
++		struct mtd_part_parser_data ppdata;
++		struct platform_device *cdev;
++		struct aspeed_smc_chip *chip;
++		u32 reg;
++
++		if (!of_device_is_compatible(child, "jedec,spi-nor"))
++			continue;	/* XXX consider nand, nor children */
++
++
++		/*
++		 * create a platform device from the of node.
++		 * if the device already was created (eg from
++		 * a prior bind/unbind cycle) use it
++		 *
++		 * XXX The child name will become the default mtd
++		 * name in ioctl and /proc/mtd.  Should we default
++		 * to node->name (without unit)?  The name must be
++		 * unique among all platform devices.  (Name would
++		 * replace NULL in create call below).
++		 * ... Or we can just encourage the label attribute.
++		 *
++		 * The only reason to do the child here is to use it in
++		 * dev_err below for duplicate chip id.  We could use
++		 * the controller dev.
++		 */
++		cdev = of_platform_device_create_or_find(child, &dev->dev);
++		if (!cdev)
++			continue;
++
++		err = of_property_read_u32(child, "reg", &n);
++		if (err == -EINVAL && info->nce == 1)
++			n = 0;
++		else if (err || n >= info->nce)
++			continue;
++		if (controller->chips[n]) {
++			dev_err(&cdev->dev,
++				"chip-id %u already in use in use by %s\n",
++				n, dev_name(controller->chips[n]->nor.dev));
++			continue;
++		}
++		chip = devm_kzalloc(&dev->dev, sizeof(*chip), GFP_KERNEL);
++		if (!chip)
++			continue;
++
++		r = platform_get_resource(dev, IORESOURCE_MEM, n + 1);
++		chip->base = devm_ioremap_resource(&dev->dev, r);
++
++		if (!chip->base)
++			continue;
++		chip->controller = controller;
++		chip->ctl = controller->regs + info->ctl0 + n * 4;
++
++		/*
++		 * Always turn on write enable bit in config register to
++		 * allow opcodes to be sent in user mode.
++		 */
++		mutex_lock(&controller->mutex);
++		reg = readl(controller->regs + info->cfg);
++		dev_dbg(&dev->dev, "flash config was %08x\n", reg);
++		reg |= 1 << (info->we0 + n); /* WEn */
++		writel(reg, controller->regs + info->cfg);
++		mutex_unlock(&controller->mutex);
++
++		/* XXX check resource within fmc CEx Segment Address Register */
++		/* XXX -- see dt vs jedec id vs bootloader */
++		/* check type is ast_smc_spi or set it? */
++		/* XXX check / program clock phase/polarity,  only 0 or 3 */
++
++		/*
++		 * Read the existing control register to get basic values.
++		 *
++		 * XXX probably need more sanitation.
++		 * XXX do we trust the bootloader or the device tree?
++		 * spi-nor.c trusts jtag id over passed ids.
++		 */
++		reg = readl(chip->ctl);
++		chip->ctl_val[smc_base] = reg & CONTROL_SPI_KEEP_MASK;
++
++		if ((reg & CONTROL_SPI_COMMAND_MODE_MASK) ==
++		    CONTROL_SPI_COMMAND_MODE_NORMAL)
++			chip->ctl_val[smc_read] = reg;
++#if 0 /* should we inherit fast read (fread) from boot ?  or id tables?*/
++		else if ((reg & CONTROL_SPI_COMMAND_MODE_MASK) ==
++			 CONTROL_SPI_COMMAND_MODE_FREAD)
++			chip->ctl_val[smc_read] = reg;
++#endif
++		else
++			chip->ctl_val[smc_read] = chip->ctl_val[smc_base] |
++				CONTROL_SPI_COMMAND_MODE_NORMAL;
++
++		chip->nor.dev = &cdev->dev;
++		chip->nor.priv = chip;
++		chip->nor.mtd = &chip->mtd;
++		chip->mtd.priv = &chip->nor; /* should be in spi_nor_scan()!! */
++		chip->nor.erase = aspeed_smc_erase;
++		chip->nor.read = aspeed_smc_read_user;
++		chip->nor.write = aspeed_smc_write_user;
++		chip->nor.read_reg = aspeed_smc_read_reg;
++		chip->nor.write_reg = aspeed_smc_write_reg;
++
++		/*
++		 * XXX use of property and controller info width to choose
++		 * SPI_NOR_QUAD , SPI_NOR_DUAL
++		 */
++		err = spi_nor_scan(&chip->nor, NULL, SPI_NOR_NORMAL);
++		if (err)
++			continue;
++
++		chip->ctl_val[smc_write] = chip->ctl_val[smc_base] |
++			spi_control_fill_opcode(chip->nor.program_opcode) |
++			CONTROL_SPI_COMMAND_MODE_WRITE;
++
++		/* XXX intrepret nor flags into controller settings */
++		/* XXX enable fast read here */
++		/* XXX check if resource size big enough for chip */
++
++		memset(&ppdata, 0, sizeof(ppdata));
++		ppdata.of_node = cdev->dev.of_node;
++		err = mtd_device_parse_register(&chip->mtd, NULL, &ppdata, NULL, 0);
++		if (err)
++			continue;
++		controller->chips[n] = chip;
++	}
++
++	/* did we register any children? */
++	for (n = 0; n < info->nce; n++)
++		if (controller->chips[n])
++			break;
++
++	if (n == info->nce)
++		return -ENODEV;
++
++	return 0;
++}
++
++static struct platform_driver aspeed_smc_driver = {
++	.probe = aspeed_smc_probe,
++	.remove = aspeed_smc_remove,
++	.driver = {
++		.name = KBUILD_MODNAME,
++		.of_match_table = aspeed_smc_matches,
++	}
++};
++
++/* XXX should this be a builtin driver ? */
++module_platform_driver(aspeed_smc_driver);
++
++MODULE_DESCRIPTION("ASPEED Static Memory Controller Driver");
++MODULE_AUTHOR("Milton Miller");
++MODULE_LICENSE("GPL v2");
+-- 
+1.8.2.2
+
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-rtc-aspeed-month-is-off-by-one.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-rtc-aspeed-month-is-off-by-one.patch
new file mode 100644
index 0000000..c3bd491
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-rtc-aspeed-month-is-off-by-one.patch
@@ -0,0 +1,35 @@
+From 6f72f95d593a68f055e8edb46047cb5c0e9906b4 Mon Sep 17 00:00:00 2001
+From: "Milton D. Miller II" <miltonm@us.ibm.com>
+Date: Wed, 13 Jan 2016 08:37:42 -0600
+Subject: [PATCH] rtc: aspeed month is off-by-one
+
+Norm reported hwclock set the date one hour different from what it
+read back.
+
+The mktime64 call takes the month as the 1-based counted month not
+the 0-based months since January like struct rtc_tm and struct tm.
+No adjustment from the harware is needed.  Also mask off a few 0 bits.
+
+Reported-by: Norman James <nkskjames@gmail.com>
+Signed-off-by: Milton Miller <miltonm@us.ibm.com>
+---
+ drivers/rtc/rtc-aspeed.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
+index cfb5ee0..1a5bbd1 100644
+--- a/drivers/rtc/rtc-aspeed.c
++++ b/drivers/rtc/rtc-aspeed.c
+@@ -48,8 +48,7 @@ static int aspeed_rtc_read_time(struct device *dev, struct rtc_time *tm)
+ 	sec  = (reg1 >>  0) & 0x3f;
+ 	cent = (reg2 >> 16) & 0x1f;
+ 	year = (reg2 >>  8) & 0x7f;
+-	/* struct rtc_time counts from 0 to 11, but hardware is 1 to 12 */
+-	mon  = ((reg2 >>  0) & 0x3f) - 1;
++	mon  = (reg2 >>  0) & 0xf;	/* mktime64 and hardware use 1 = Jan */
+ 
+ 	rtc_time64_to_tm(mktime64(cent*100 + year, mon, day, hour, min, sec),
+ 			 tm);
+-- 
+1.8.2.2
+
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
index 64f097d..d42bd34 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/defconfig
@@ -60,6 +60,8 @@ CONFIG_MTD_DATAFLASH=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_GLUEBI=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_ASPEED_FLASH_SPI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=4
@@ -169,12 +171,15 @@ CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
 CONFIG_AUTOFS4_FS=y
+CONFIG_OVERLAY_FS=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_SUMMARY=y
+CONFIG_JFFS2_FS_XATTR=y
 CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_XZ=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/spinor-dts.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/spinor-dts.patch
new file mode 100644
index 0000000..7107383
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/spinor-dts.patch
@@ -0,0 +1,147 @@
+Add spi flash to aspeed dts
+From: Milton Miller II <miltonm@us.ibm.com>
+
+diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+index 4d1a215..34daec6 100644
+--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
++++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+@@ -6,6 +6,67 @@
+ 	model = "Barrelye BMC";
+ 	compatible = "rackspace,barreleye-bmc", "aspeed,ast2400";
+ 	ahb {
++		fmc@1e620000 {
++			reg = < 0x1e620000 0x94
++				0x20000000 0x02000000 >;
++			#address-cells = <1>;
++			#size-cells = <0>;
++			compatible = "aspeed,fmc";
++			bmc {
++				reg = < 0 >;
++				compatible = "jedec,spi-nor" ;
++				label = "bmc";
++				/*
++				 * Possibly required props:
++				 * spi-max-frequency = <>
++				 * spi-tx-bus-width = <>
++				 * spi-rx-bus-width  = <>
++				 * m25p,fast-read
++				 * spi-cpol if inverse clock polarity (CPOL)
++				 * spi-cpha if shifted clock phase (CPHA)
++				 */
++				#address-cells = < 1 >;
++				#size-cells = < 1 >;
++				u-boot {
++					reg = < 0 0x60000 >;
++					label = "u-boot";
++				};
++				u-boot-env {
++					reg = < 0x60000 0x20000 >;
++					label = "u-boot-env";
++				};
++				kernel  {
++					reg = < 0x80000 0x280000 >;
++					label = "kernel";
++				};
++				initramfs {
++					reg = < 0x300000 0x1c0000 >;
++					label = "initramfs";
++				};
++				rofs  {
++					reg = < 0x4c0000 0x1740000 >;
++					label = "rofs";
++				};
++				rwfs  {
++					reg = < 0x1c00000 0x400000 >;
++					label = "rwfs";
++				};
++			};
++		};
++		spi@1e630000 {
++			reg = < 0x1e630000 0x18
++				0x30000000 0x02000000 >;
++			#address-cells = <1>;
++			#size-cells = <0>;
++			compatible = "aspeed,smc";
++			pnor {
++				reg = < 0 >;
++				compatible = "jedec,spi-nor" ;
++				label = "pnor";
++				/* spi-max-frequency = <>; */
++				/* m25p,fast-read; */
++			};
++		};
+ 		apb {
+ 			i2c: i2c@1e78a040 {
+ 				i2c0: i2c-bus@40 {
+diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+index 2c3e824..d864119 100644
+--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
++++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+@@ -7,6 +7,67 @@
+ 	compatible = "tyan,palmetto-bmc", "aspeed,ast2400";
+ 
+ 	ahb {
++		fmc@1e620000 {
++			reg = < 0x1e620000 0x94
++				0x20000000 0x02000000 >;
++			#address-cells = <1>;
++			#size-cells = <0>;
++			compatible = "aspeed,fmc";
++			bmc {
++				reg = < 0 >;
++				compatible = "jedec,spi-nor" ;
++				label = "bmc";
++				/*
++				 * Possibly required props:
++				 * spi-max-frequency = <>
++				 * spi-tx-bus-width = <>
++				 * spi-rx-bus-width  = <>
++				 * m25p,fast-read
++				 * spi-cpol if inverse clock polarity (CPOL)
++				 * spi-cpha if shifted clock phase (CPHA)
++				 */
++				#address-cells = < 1 >;
++				#size-cells = < 1 >;
++				u-boot {
++					reg = < 0 0x60000 >;
++					label = "u-boot";
++				};
++				u-boot-env {
++					reg = < 0x60000 0x20000 >;
++					label = "u-boot-env";
++				};
++				kernel  {
++					reg = < 0x80000 0x280000 >;
++					label = "kernel";
++				};
++				initramfs {
++					reg = < 0x300000 0x1c0000 >;
++					label = "initramfs";
++				};
++				rofs  {
++					reg = < 0x4c0000 0x1740000 >;
++					label = "rofs";
++				};
++				rwfs  {
++					reg = < 0x1c00000 0x400000 >;
++					label = "rwfs";
++				};
++			};
++		};
++		spi@1e630000 {
++			reg = < 0x1e630000 0x18
++				0x30000000 0x02000000 >;
++			#address-cells = <1>;
++			#size-cells = <0>;
++			compatible = "aspeed,smc";
++			pnor {
++				reg = < 0 >;
++				compatible = "jedec,spi-nor" ;
++				label = "pnor";
++				/* spi-max-frequency = <>; */
++				/* m25p,fast-read; */
++			};
++		};
+ 		apb {
+ 			i2c: i2c@1e78a040 {
+ 				i2c0: i2c-bus@40 {
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
index bb6f06c..8439b8b 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -1,2 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-SRC_URI += "file://defconfig file://hwmon.cfg"
+SRC_URI += "file://defconfig file://hwmon.cfg file://spinor-dts.patch"
+SRC_URI += "file://0001-mtd-spi-nor-Add-SPI-memory-controllers-for-ASPEED-AS.patch"
+SRC_URI += "file://0001-rtc-aspeed-month-is-off-by-one.patch"
+
-- 
2.6.4
