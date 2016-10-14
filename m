Return-Path: <clg@kaod.org>
Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net
 [178.33.253.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swRx35cmwzDt7N
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:39:03 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id A860814BA4
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:39:00 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 43EF62A007E;
 Fri, 14 Oct 2016 14:38:56 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 09/12] mtd: spi-nor: aspeed: add DMA support to
 smc controller
Date: Fri, 14 Oct 2016 14:38:01 +0200
Message-Id: <1476448684-6149-10-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15124213451371875074
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
X-List-Received-Date: Fri, 14 Oct 2016 12:39:04 -0000

The Aspeed FMC controller can handle transfers to the flash modules
using DMAs. A couple of registers first need to be programmed with the
DRAM and flash addresses and the length of the transfer. The transfer
is then initiated using a DMA control register and an interrupt
notifies the completion.

Such transfers can replace the current IO mode in the read/write ops
when some conditions are met on the size and the alignment. In case of
failure, a timeout for instance, the operation is restarted using the
IO mode.

DMA support does not seem to be that efficient. So we provide some
sysfs files for tuning and to switch it on and off (default is off)

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 246 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 243 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 86a9ec60fd7a..104d14422560 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -19,6 +19,23 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/sysfs.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+
+#define DEVICE_NAME	"aspeed-smc"
+
+/*
+ * DMAs do not seem to be that fast, so disable by default
+ */
+static bool use_dma;
+module_param(use_dma, bool, 0644);
+
+static unsigned int min_dma_size = 256;
+module_param(min_dma_size, uint, 0644);
+
+/* with 100ms we had a couple of timeouts */
+static unsigned int dma_timeout = 200;
+module_param(dma_timeout, uint, 0644);
 
 /*
  * In user mode all data bytes read or written to the chip decode address
@@ -209,6 +226,7 @@ struct aspeed_smc_per_chip {
 	__le32 __iomem *ctl;			/* control register */
 	void __iomem *base;			/* base of chip window */
 	__le32 ctl_val[smc_num_ctl_reg_values];	/* controls with timing */
+	unsigned long phys_base;
 	enum smc_flash_type type;		/* what type of flash */
 	struct spi_nor nor;
 };
@@ -220,6 +238,19 @@ struct aspeed_smc_controller {
 	const struct aspeed_smc_info *info;	/* type info of controller */
 	void __iomem *regs;			/* controller registers */
 	void __iomem *windows;			/* per-chip windows resource */
+
+	/* interrupt handling */
+	int irq;
+
+	/* dma */
+	bool has_dma;
+	struct completion dma_done;
+
+	/* dma logging */
+	size_t dma_length;
+	dma_addr_t dma_addr;			/* bus address of buffer */
+	dma_addr_t flash_addr;			/* flash address */
+
 	struct aspeed_smc_per_chip *chips[0];	/* pointers to attached chips */
 };
 
@@ -267,6 +298,116 @@ struct aspeed_smc_controller {
 	CONTROL_SPI_IO_DUMMY_CYCLES_MASK | CONTROL_SPI_CLOCK_FREQ_SEL_MASK | \
 	CONTROL_SPI_LSB_FIRST | CONTROL_SPI_CLOCK_MODE_3)
 
+/* Interrupt Control and Status Register */
+#define INTERRUPT_STATUS_REG		0x08
+#define     INTERRUPT_DMA_ENABLE	    BIT(3)
+#define     INTERRUPT_DMA_STATUS	    BIT(11)
+
+/* DMA Registers */
+#define DMA_CONTROL_REG			0x80
+#define     DMA_ENABLE			    BIT(0)
+#define     DMA_WRITE			    BIT(1)
+
+#define DMA_FLASH_BASE_REG		0x84
+#define DMA_DRAM_BASE_REG		0x88
+#define DMA_LENGTH_REG			0x8c
+
+static void aspeed_smc_dma_done(struct aspeed_smc_controller *controller)
+{
+	writel(0, controller->regs + INTERRUPT_STATUS_REG);
+	writel(0, controller->regs + DMA_CONTROL_REG);
+}
+
+static int aspeed_smc_dma_wait(struct aspeed_smc_per_chip *chip)
+{
+	struct aspeed_smc_controller *controller = chip->controller;
+
+	if (!wait_for_completion_timeout(&controller->dma_done,
+					 msecs_to_jiffies(dma_timeout))) {
+		dev_err(chip->nor.dev, "timeout waiting for DMA interrupt "
+			"addr@%.8x faddr@%.8x size=%x "
+			"dram@%.8x flash@%.8x done=%x\n",
+			controller->dma_addr,
+			controller->flash_addr,
+			controller->dma_length,
+			readl(controller->regs + DMA_DRAM_BASE_REG),
+			readl(controller->regs + DMA_FLASH_BASE_REG),
+			readl(controller->regs + DMA_LENGTH_REG));
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+#define DMA_LENGTH(x) (((x) - 4) & ~0xFE000003)
+#define DMA_ADDR(x) ((x) & ~0xE0000003)
+
+static inline void aspeed_smc_chip_configure(struct aspeed_smc_per_chip *chip,
+					     u32 ctl)
+{
+	ctl |= CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
+	writel(ctl, chip->ctl);
+
+	ctl &= ~CONTROL_SPI_CE_STOP_ACTIVE_CONTROL;
+	writel(ctl, chip->ctl);
+}
+
+/*
+ * TODO: configure FREAD mode
+ */
+static int aspeed_smc_dma_start(struct aspeed_smc_per_chip *chip,
+				u32 offset, void *buf, size_t length,
+				int is_write)
+{
+	struct aspeed_smc_controller *controller = chip->controller;
+	dma_addr_t dma_addr, flash_addr;
+	int ret;
+
+	aspeed_smc_chip_configure(chip, is_write ? chip->ctl_val[smc_write] :
+		chip->ctl_val[smc_base]);
+
+	dev_dbg(chip->nor.dev, "DMA %s to=0x%08x len=0x%08x\n",
+		is_write ? "write" : "read", offset, length);
+
+	dma_addr = dma_map_single(chip->nor.dev, buf, length,
+				  (is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE));
+
+	if (unlikely(dma_mapping_error(chip->nor.dev, dma_addr))) {
+		dev_err(chip->nor.dev, "Failed to dma_map_single()\n");
+		ret = -ENOMEM;
+		goto out;
+	}
+	flash_addr = chip->phys_base + offset;
+
+	controller->dma_length = length;
+	controller->dma_addr = dma_addr;
+	controller->flash_addr = flash_addr;
+
+	reinit_completion(&controller->dma_done);
+
+	writel(0, controller->regs + DMA_CONTROL_REG);
+	writel(DMA_ADDR(flash_addr), controller->regs +
+	       DMA_FLASH_BASE_REG);
+	writel(DMA_ADDR(dma_addr), controller->regs + DMA_DRAM_BASE_REG);
+	writel(DMA_LENGTH(length), controller->regs + DMA_LENGTH_REG);
+
+	writel(INTERRUPT_DMA_ENABLE,
+	       controller->regs + INTERRUPT_STATUS_REG);
+
+	writel(DMA_ENABLE | (is_write << 1),
+	       controller->regs + DMA_CONTROL_REG);
+
+	ret = aspeed_smc_dma_wait(chip);
+	if (ret)
+		aspeed_smc_dma_done(controller);
+
+	dma_unmap_single(chip->nor.dev,
+			 controller->dma_addr, controller->dma_length,
+			 (is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE));
+out:
+	aspeed_smc_chip_configure(chip, chip->ctl_val[smc_base]);
+	return ret;
+}
 
 static u32 spi_control_fill_opcode(u8 opcode)
 {
@@ -362,13 +503,30 @@ static int aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
 				size_t *retlen, u_char *read_buf)
 {
 	struct aspeed_smc_per_chip *chip = nor->priv;
+	int ret;
+
+	mutex_lock(&chip->controller->mutex);
+
+	/*
+	 * Try DMA transfer when size and alignment are correct. In case
+	 * of failure, just restart using the IO mode.
+	 */
+	if (!(from & 0x3) && !(len & 0x3) && (len >= min_dma_size) &&
+	    chip->controller->has_dma && use_dma) {
+		ret = aspeed_smc_dma_start(chip, from, read_buf, len, 0);
+		if (!ret)
+			goto out;
+		dev_err(chip->nor.dev, "DMA read failed: %d", ret);
+	}
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
 	aspeed_smc_from_fifo(read_buf, chip->base, len);
-	*retlen += len;
 	aspeed_smc_stop_user(nor);
 
+out:
+	mutex_unlock(&chip->controller->mutex);
+	*retlen += len;
 	return 0;
 }
 
@@ -376,12 +534,30 @@ static void aspeed_smc_write_user(struct spi_nor *nor, loff_t to, size_t len,
 				  size_t *retlen, const u_char *write_buf)
 {
 	struct aspeed_smc_per_chip *chip = nor->priv;
+	int ret;
+
+	mutex_lock(&chip->controller->mutex);
+
+	/*
+	 * Try DMA transfer when size and alignment are correct. In case
+	 * of failure, just restart using the IO mode.
+	 */
+	if (!(to & 0x3) && !(len & 0x3) && (len >= min_dma_size) &&
+	    chip->controller->has_dma && use_dma) {
+		ret = aspeed_smc_dma_start(chip, to, (void *)write_buf,
+					   len, 1);
+		if (!ret)
+			goto out;
+		dev_err(chip->nor.dev, "DMA write failed: %d", ret);
+	}
 
 	aspeed_smc_start_user(nor);
 	aspeed_smc_send_cmd_addr(nor, nor->program_opcode, to);
 	aspeed_smc_to_fifo(chip->base, write_buf, len);
-	*retlen += len;
 	aspeed_smc_stop_user(nor);
+out:
+	mutex_unlock(&chip->controller->mutex);
+	*retlen += len;
 }
 
 static int aspeed_smc_remove(struct platform_device *dev)
@@ -438,6 +614,57 @@ static void __iomem *window_start(struct aspeed_smc_controller *controller,
 	return controller->windows + offset;
 }
 
+static irqreturn_t aspeed_smc_irq(int irq, void *arg)
+{
+	struct aspeed_smc_controller *controller = arg;
+	struct device *dev = controller->dev;
+	irqreturn_t ret = IRQ_NONE;
+	u32 dma_ctl = readl(controller->regs + DMA_CONTROL_REG);
+	u32 status = readl(controller->regs + INTERRUPT_STATUS_REG);
+
+	dev_dbg(dev, "received IRQ. status: %x", status);
+
+	if (!(status & INTERRUPT_DMA_ENABLE) || !(dma_ctl & DMA_ENABLE)) {
+		dev_err(dev, "No DMA. bad IRQ status: %x", status);
+		goto out;
+	}
+
+	if (!(status & INTERRUPT_DMA_STATUS)) {
+		dev_err(dev, "DMA still in progress. length %d\n",
+			readl(controller->regs + DMA_LENGTH_REG));
+		goto out;
+	}
+
+	ret = IRQ_HANDLED;
+	aspeed_smc_dma_done(controller);
+	complete(&controller->dma_done);
+
+out:
+	return ret;
+}
+
+static int aspeed_smc_config_irq(struct aspeed_smc_controller *controller,
+				 struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int rc;
+
+	controller->irq = platform_get_irq(pdev, 0);
+	if (!controller->irq)
+		return -ENODEV;
+
+	rc = devm_request_irq(dev, controller->irq, aspeed_smc_irq, IRQF_SHARED,
+			      DEVICE_NAME, controller);
+	if (rc < 0) {
+		dev_warn(dev, "Unable to request IRQ %d\n", controller->irq);
+		controller->irq = 0;
+		return rc;
+	}
+
+	dev_info(dev, "Using IRQ %d\n", controller->irq);
+	return 0;
+}
+
 static int aspeed_smc_probe(struct platform_device *pdev)
 {
 	struct aspeed_smc_controller *controller;
@@ -473,6 +700,18 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 
 	controller->dev = &pdev->dev;
 
+	init_completion(&controller->dma_done);
+
+	controller->has_dma = false;
+	if (info->hasdma)
+		controller->has_dma = !aspeed_smc_config_irq(controller, pdev);
+
+	if (controller->has_dma)
+		dev_info(controller->dev, "DMA support %sactivated.\n",
+			 use_dma ? "" : "de");
+	else
+		dev_info(controller->dev, "no DMA support.\n");
+
 	/* The pinmux or bootloader will disable legacy mode. */
 
 	/*
@@ -530,6 +769,7 @@ static int aspeed_smc_probe(struct platform_device *pdev)
 			continue;
 		}
 
+		chip->phys_base = r->start;
 		/*
 		 * Always turn on the write enable bit in the type and settings
 		 * or flash configuration register to allow opcodes to be sent
@@ -621,7 +861,7 @@ static struct platform_driver aspeed_smc_driver = {
 	.probe = aspeed_smc_probe,
 	.remove = aspeed_smc_remove,
 	.driver = {
-		.name = KBUILD_MODNAME,
+		.name = DEVICE_NAME,
 		.of_match_table = aspeed_smc_matches,
 	}
 };
-- 
2.7.4
