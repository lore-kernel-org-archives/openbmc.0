Return-Path: <clg@kaod.org>
Received: from 6.mo1.mail-out.ovh.net (6.mo1.mail-out.ovh.net [46.105.43.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swRwz0RHLzDt6Z
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 23:38:59 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 44E2214BA7
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 14:38:56 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 054052A006D;
 Fri, 14 Oct 2016 14:38:51 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 08/12] mtd: spi-nor: aspeed: introduce a device
 under aspeed_smc_controller
Date: Fri, 14 Oct 2016 14:38:00 +0200
Message-Id: <1476448684-6149-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476448684-6149-1-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15123087550954638082
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
X-List-Received-Date: Fri, 14 Oct 2016 12:38:59 -0000

This will be useful for readability and also logging.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index b22e07d3ef32..86a9ec60fd7a 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -214,6 +214,8 @@ struct aspeed_smc_per_chip {
 };
 
 struct aspeed_smc_controller {
+	struct device *dev;
+
 	struct mutex mutex;			/* controller access mutex */
 	const struct aspeed_smc_info *info;	/* type info of controller */
 	void __iomem *regs;			/* controller registers */
@@ -436,7 +438,7 @@ static void __iomem *window_start(struct aspeed_smc_controller *controller,
 	return controller->windows + offset;
 }
 
-static int aspeed_smc_probe(struct platform_device *dev)
+static int aspeed_smc_probe(struct platform_device *pdev)
 {
 	struct aspeed_smc_controller *controller;
 	const struct of_device_id *match;
@@ -446,29 +448,31 @@ static int aspeed_smc_probe(struct platform_device *dev)
 	int err = 0;
 	unsigned int n;
 
-	match = of_match_device(aspeed_smc_matches, &dev->dev);
+	match = of_match_device(aspeed_smc_matches, &pdev->dev);
 	if (!match || !match->data)
 		return -ENODEV;
 	info = match->data;
 
-	controller = devm_kzalloc(&dev->dev, sizeof(*controller) +
+	controller = devm_kzalloc(&pdev->dev, sizeof(*controller) +
 		info->nce * sizeof(controller->chips[0]), GFP_KERNEL);
 	if (!controller)
 		return -ENOMEM;
 	controller->info = info;
 	mutex_init(&controller->mutex);
-	platform_set_drvdata(dev, controller);
+	platform_set_drvdata(pdev, controller);
 
-	r = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	controller->regs = devm_ioremap_resource(&dev->dev, r);
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	controller->regs = devm_ioremap_resource(&pdev->dev, r);
 	if (IS_ERR(controller->regs))
 		return PTR_ERR(controller->regs);
 
-	r = platform_get_resource(dev, IORESOURCE_MEM, 1);
-	controller->windows = devm_ioremap_resource(&dev->dev, r);
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	controller->windows = devm_ioremap_resource(&pdev->dev, r);
 	if (IS_ERR(controller->windows))
 		return PTR_ERR(controller->windows);
 
+	controller->dev = &pdev->dev;
+
 	/* The pinmux or bootloader will disable legacy mode. */
 
 	/*
@@ -476,7 +480,7 @@ static int aspeed_smc_probe(struct platform_device *dev)
 	 * is shared by the host.
 	 */
 
-	for_each_available_child_of_node(dev->dev.of_node, child) {
+	for_each_available_child_of_node(controller->dev->of_node, child) {
 		struct platform_device *cdev;
 		struct aspeed_smc_per_chip *chip;
 		u32 reg;
@@ -494,7 +498,8 @@ static int aspeed_smc_probe(struct platform_device *dev)
 		 * The creating the device node for the child here allows its
 		 * use for error reporting via dev_err below.
 		 */
-		cdev = of_platform_device_create_or_find(child, &dev->dev);
+		cdev = of_platform_device_create_or_find(child,
+							 controller->dev);
 		if (!cdev)
 			continue;
 
@@ -509,7 +514,7 @@ static int aspeed_smc_probe(struct platform_device *dev)
 				n, dev_name(controller->chips[n]->nor.dev));
 			continue;
 		}
-		chip = devm_kzalloc(&dev->dev, sizeof(*chip), GFP_KERNEL);
+		chip = devm_kzalloc(controller->dev, sizeof(*chip), GFP_KERNEL);
 		if (!chip)
 			continue;
 
@@ -533,7 +538,8 @@ static int aspeed_smc_probe(struct platform_device *dev)
 		 */
 		mutex_lock(&controller->mutex);
 		reg = readl(controller->regs + TYPE_SETTING_REG);
-		dev_dbg(&dev->dev, "flash type and setting was %08x\n", reg);
+		dev_dbg(controller->dev, "flash type and setting was %08x\n",
+			reg);
 		reg |= 1 << (info->we0 + n); /* WEn */
 		if (info->hastype) {
 			reg &= ~(3 << (n * 2));
-- 
2.7.4
