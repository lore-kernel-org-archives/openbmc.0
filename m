Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BEE7E1A0018
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 16:40:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 79ABA140B9C;
 Thu, 21 Jan 2016 16:40:53 +1100 (AEDT)
Subject: Re: [PATCH openbmc 3/6] linux-obmc: apply the aspeed-spi-nor
 controller patchset
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
References: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453331420-6524-4-git-send-email-openbmc-patches@stwcx.xyz>
From: Jeremy Kerr <jk@ozlabs.org>
X-Enigmail-Draft-Status: N1110
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Message-ID: <56A06F64.8050501@ozlabs.org>
Date: Thu, 21 Jan 2016 13:40:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453331420-6524-4-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 21 Jan 2016 05:40:54 -0000

Hi Milton,

> Thie applies the apseed-spi-nor driver and patches the dts for
> palmetto and barreleye when building the linux image.  It also
> enables the config options for the driver and some file systems to
> support the overlay filesystem stack used by obmc-phosphor-initfs.
> 
> It also applies the rtc month fix patch.

OK, these should be separate.

However, I'd prefer we apply the patches directly to our kernel repo.
Can you post a patch for that, then this change should just be an
updated kernel reference.

Some minor comments on the kernel patch though:

> +diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> +new file mode 100644
> +index 0000000..2497648
> +--- /dev/null
> ++++ b/drivers/mtd/spi-nor/aspeed-smc.c
> +@@ -0,0 +1,539 @@
> ++/* ASPEED Static Memory Controller driver
> ++ * Copyright 2015
> ++ * Milton Miller
> ++ *
> ++ */

Make sure you have the right copyright headers on this one.

> ++#define DEBUG

Remove on the final version; we have dynamic debug enabled in the
OpenBMC kernels.

> ++
> ++#include <linux/device.h>
> ++#include <linux/io.h>
> ++#include <linux/module.h>
> ++#include <linux/mutex.h>
> ++#include <linux/mtd/mtd.h>
> ++#include <linux/mtd/partitions.h>
> ++#include <linux/mtd/spi-nor.h>
> ++#include <linux/of.h>
> ++#include <linux/of_platform.h>
> ++#include <linux/sysfs.h>
> ++
> ++enum smc_controller_type {
> ++	smc_type_leg,		/* legacy register mode and map */
> ++	smc_type_fmc,		/* new FMC 5 CEs multiple flash types */
> ++	smc_type_smc,		/* SPI memory controller for BIOS / host */
> ++};
> ++
> ++enum smc_flash_type {
> ++	smc_type_nor = 0,	/* controller connected to nor flash */
> ++	smc_type_nand = 1,	/* controller connected to nand flash */
> ++	smc_type_spi = 2,	/* controller connected to spi flash */
> ++};
> ++
> ++struct aspeed_smc_info {
> ++	unsigned long nce : 3;		/* number of chip enables */
> ++	unsigned long hasdma : 1;	/* has dma engine */
> ++	unsigned long maxwidth : 3;	/* max width of spi bus */
> ++	unsigned long we0 : 5;		/* we shift for ce 0 in cfg reg */
> ++	unsigned long hastype : 1;	/* type shift for ce 0 in cfg reg */
> ++	u8 ctl0;			/* offset in regs of ctl for ce 0 */
> ++	u8 cfg;				/* offset in regs of cfg */
> ++	u8 time;			/* offset in regs of timing */
> ++};

I wouldn't worry about bitfields here.

> ++
> ++#define E(_ce, _dma, _w, _ctl, _cfg, _we0, _hastype, _time, _misc) \
> ++	.nce = _ce, .ctl0 = _ctl, .cfg = 0, .we0 = _we0, .hastype = _hastype, \
> ++	.hasdma = _dma, .maxwidth = _w, .time = _time
> ++
> ++struct aspeed_smc_info aspeed_table[] = {
> ++	[smc_type_fmc] = { E(5, 1, 4, 0x10, 0x00, 16, 1, 0x54, 0x50) },
> ++	[smc_type_smc] = { E(1, 0, 2, 0x04, 0x00, 0,  0, 0x14, 0x10) },
> ++};

And it'll be a little more readable to expand this:

struct aspeed_smc_info aspeed_table[] = {
	[smc_type_fmc] = {
		.nce = 5,
		.hasdma = 1,
		.maxwidth = 0x10,
		/* ... etc */
	},
};

> ++#if 0 /* ATTR */
> ++static u32 spi_control_to_freq_div(u32 control)
> ++{
> ++	u32 sel;
> ++
> ++	sel = control & CONTROL_SPI_CLOCK_FREQ_SEL_MASK;
> ++	sel >>= CONTROL_SPI_CLOCK_FREQ_SEL_SHIFT;
> ++
> ++	/* 16, 14, 12, 10, 8, 6, 4, 2, 15, 13, 11, 9, 7, 5, 3, 1 */
> ++	return 16 - (((sel & 7) << 1) + ((sel & 8) >> 1));
> ++}
> ++
> ++static u32 spi_control_to_dummy_bytes(u32 control)
> ++{
> ++
> ++	return ((control & CONTROL_SPI_IO_DUMMY_CYCLES_LO) >>
> ++			CONTROL_SPI_IO_DUMMY_CYCLES_LO_SHIFT) |
> ++		((control & CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT) >>
> ++			CONTROL_SPI_IO_DUMMY_CYCLES_HI_SHIFT);
> ++}
> ++
> ++static size_t show_ctl_div(u32 control, char *buf)
> ++{
> ++	return sprintf(buf, "%u\n", spi_control_to_freq_div(control));
> ++}
> ++
> ++static size_t show_ctl_dummy_bytes(u32 control, char *buf)
> ++{
> ++	return sprintf(buf, "%u\n", spi_control_to_dummy_bytes(control));
> ++}
> ++#endif /* ATTR */

There are a couple of `#if 0`-ed blocks in this patch. Was this just for
development, or something we want to keep?

> ++
> ++static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
> ++				size_t *retlen, u_char *read_buf)
> ++{
> ++	struct aspeed_smc_chip *chip = nor->priv;
> ++
> ++	aspeed_smc_start_user(nor);
> ++	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
> ++	memcpy_fromio(read_buf, chip->base, len);
> ++	*retlen += len;
> ++	aspeed_smc_stop_user(nor);
> ++
> ++	return 0;
> ++}
> ++
> ++static void aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
> ++				  size_t *retlen, const u_char *write_buf)
> ++{
> ++	struct aspeed_smc_chip *chip = nor->priv;
> ++
> ++	aspeed_smc_start_user(nor);
> ++	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
> ++	memcpy_toio(chip->base, write_buf, len);
> ++	*retlen += len;
> ++	aspeed_smc_stop_user(nor);
> ++}
> ++
> ++static int aspeed_smc_erase(struct spi_nor *nor, loff_t offs)
> ++{
> ++	aspeed_smc_start_user(nor);
> ++	aspeed_smc_send_cmd_addr(nor, nor->erase_opcode, offs);
> ++	aspeed_smc_stop_user(nor);
> ++
> ++	return 0;
> ++}
> ++
> ++static int aspeed_smc_remove(struct platform_device *dev)
> ++{
> ++	struct aspeed_smc_chip *chip;
> ++	struct aspeed_smc_controller *controller = platform_get_drvdata(dev);
> ++	int n;
> ++
> ++	for (n = 0; n < controller->info->nce; n++) {
> ++		chip = controller->chips[n];
> ++		if (chip)
> ++			mtd_device_unregister(&chip->mtd);
> ++	}
> ++
> ++	return 0;
> ++}
> ++
> ++const struct of_device_id aspeed_smc_matches[] = {
> ++	{ .compatible = "aspeed,fmc", .data = &aspeed_table[smc_type_fmc] },
> ++	{ .compatible = "aspeed,smc", .data = &aspeed_table[smc_type_smc] },
> ++	{ }
> ++};
> ++MODULE_DEVICE_TABLE(of, aspeed_smc_matches);

I'd suggest grouping this with the platform_device definition below.

But in general, all looks good to me. Ben - any thoughts about the
smc controller implementation?

Cheers,


Jeremy
