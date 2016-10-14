Return-Path: <clg@kaod.org>
Received: from 3.mo1.mail-out.ovh.net (3.mo1.mail-out.ovh.net [46.105.60.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swSGq5S7nzDt3T
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:54:27 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id D474914B5D
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:38:30 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 8BFFB2A008B;
 Fri, 14 Oct 2016 14:38:26 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 02/12] mtd: spi-nor: aspeed: Manage the segment
 address registers
Date: Fri, 14 Oct 2016 14:37:54 +0200
Message-Id: <1476448684-6149-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15115769202746231554
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
X-List-Received-Date: Fri, 14 Oct 2016 12:54:28 -0000

From: Milton Miller <miltonm@us.ibm.com>

This changes the aspeed mtd driver to use the segment address
registers from the driver, this eliminating a source of mismatch and
placing the kernel in control using its knowledge instead of relying
on hardware defaults or bootloaders to choose good values for the
windows based on the attached chips.

The initial commit factors out discovering the current window in which
the flash module is mapped by the controller. The intent is to adjust
the windows to the required size of the attached flash.  Also planned
is to enable direct memory mapped access and dma access, at least for
read accesses when the flash size is supported by the hardware.

The spi-nor layer already trusts its database of jedec ids over any
information in the device tree, this continues that philosophy
by using the knowledge to optimize the programming of the hardware.
The device tree may be used in the future to limit the choices,
for example specifying a max clock rate based on board wiring.

This does not have any locking around sanitizing the segments
or copying the new addresses back to the per-chip base address.
In the present code registers are updated before the devices
are probed.

We may want to cache the offsets in the per-chip structure to
when we support DMA.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
[clg : removed the calculation on the segment registers to check
       overlaps and kept only the reading of the segment base address.
       It needs more work ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 58 +++++++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index e8744aef5fdc..a47eecfdfda2 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -136,6 +136,7 @@ enum smc_flash_type {
 };
 
 struct aspeed_smc_info {
+	u32 maxsize;		/* maximum size of 1 chip window */
 	u8 nce;			/* number of chip enables */
 	u8 maxwidth;		/* max width of spi bus */
 	bool hasdma;		/* has dma engine */
@@ -147,6 +148,7 @@ struct aspeed_smc_info {
 };
 
 static struct aspeed_smc_info fmc_2400_info = {
+	.maxsize = 64 * 1024 * 1024,
 	.nce = 5,
 	.maxwidth = 4,
 	.hasdma = true,
@@ -158,6 +160,7 @@ static struct aspeed_smc_info fmc_2400_info = {
 };
 
 static struct aspeed_smc_info smc_2400_info = {
+	.maxsize = 64 * 1024 * 1024,
 	.nce = 1,
 	.maxwidth = 2,
 	.hasdma = false,
@@ -169,6 +172,7 @@ static struct aspeed_smc_info smc_2400_info = {
 };
 
 static struct aspeed_smc_info fmc_2500_info = {
+	.maxsize = 256 * 1024 * 1024,
 	.nce = 3,
 	.maxwidth = 2,
 	.hasdma = true,
@@ -180,6 +184,7 @@ static struct aspeed_smc_info fmc_2500_info = {
 };
 
 static struct aspeed_smc_info smc_2500_info = {
+	.maxsize = 128 * 1024 * 1024,
 	.nce = 2,
 	.maxwidth = 2,
 	.hasdma = false,
@@ -212,11 +217,17 @@ struct aspeed_smc_controller {
 	struct mutex mutex;			/* controller access mutex */
 	const struct aspeed_smc_info *info;	/* type info of controller */
 	void __iomem *regs;			/* controller registers */
+	void __iomem *windows;			/* per-chip windows resource */
 	struct aspeed_smc_per_chip *chips[0];	/* pointers to attached chips */
 };
 
 #define TYPE_SETTING_REG 0x0
 
+#define LOG_8MB (23)	/* log(2)(8 * 1024 * 1024) */
+#define SEGMENT_ADDR_REG0 0x30
+#define         SEGMENT_ADDR_START(_r) ((((_r) >> 16) & 0xFF) << LOG_8MB)
+#define         SEGMENT_ADDR_END(_r) ((((_r) >> 24) & 0xFF) << LOG_8MB)
+
 #define CONTROL_SPI_AAF_MODE BIT(31)
 #define CONTROL_SPI_IO_MODE_MASK GENMASK(30, 28)
 #define CONTROL_SPI_IO_DUAL_DATA BIT(29)
@@ -403,13 +414,30 @@ of_platform_device_create_or_find(struct device_node *child,
 	return cdev;
 }
 
+static void __iomem *window_start(struct aspeed_smc_controller *controller,
+				  struct resource *r, unsigned int n)
+{
+	u32 offset = 0;
+	u32 reg;
+
+	if (controller->info->nce > 1) {
+		reg = readl(controller->regs + SEGMENT_ADDR_REG0 + n * 4);
+
+		if (SEGMENT_ADDR_START(reg) >= SEGMENT_ADDR_END(reg))
+			return NULL;
+
+		offset = SEGMENT_ADDR_START(reg) - r->start;
+	}
+
+	return controller->windows + offset;
+}
+
 static int aspeed_smc_probe(struct platform_device *dev)
 {
 	struct aspeed_smc_controller *controller;
 	const struct of_device_id *match;
 	const struct aspeed_smc_info *info;
 	struct resource *r;
-	void __iomem *regs;
 	struct device_node *child;
 	int err = 0;
 	unsigned int n;
@@ -418,19 +446,24 @@ static int aspeed_smc_probe(struct platform_device *dev)
 	if (!match || !match->data)
 		return -ENODEV;
 	info = match->data;
-	r = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(&dev->dev, r);
-	if (IS_ERR(regs))
-		return PTR_ERR(regs);
 
 	controller = devm_kzalloc(&dev->dev, sizeof(*controller) +
 		info->nce * sizeof(controller->chips[0]), GFP_KERNEL);
 	if (!controller)
 		return -ENOMEM;
-	platform_set_drvdata(dev, controller);
-	controller->regs = regs;
 	controller->info = info;
 	mutex_init(&controller->mutex);
+	platform_set_drvdata(dev, controller);
+
+	r = platform_get_resource(dev, IORESOURCE_MEM, 0);
+	controller->regs = devm_ioremap_resource(&dev->dev, r);
+	if (IS_ERR(controller->regs))
+		return PTR_ERR(controller->regs);
+
+	r = platform_get_resource(dev, IORESOURCE_MEM, 1);
+	controller->windows = devm_ioremap_resource(&dev->dev, r);
+	if (IS_ERR(controller->windows))
+		return PTR_ERR(controller->windows);
 
 	/* The pinmux or bootloader will disable legacy mode. */
 
@@ -476,17 +509,18 @@ static int aspeed_smc_probe(struct platform_device *dev)
 		if (!chip)
 			continue;
 
-		r = platform_get_resource(dev, IORESOURCE_MEM, n + 1);
-		chip->base = devm_ioremap_resource(&dev->dev, r);
-		if (!chip->base)
-			continue;
-
 		chip->controller = controller;
 		chip->ctl = controller->regs + info->ctl0 + n * 4;
 
 		/* The device tree said the chip is spi. */
 		chip->type = smc_type_spi;
 
+		chip->base = window_start(controller, r, n);
+		if (!chip->base) {
+			dev_warn(&cdev->dev, "CE segment window closed.\n");
+			continue;
+		}
+
 		/*
 		 * Always turn on the write enable bit in the type and settings
 		 * or flash configuration register to allow opcodes to be sent
-- 
2.7.4
