Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF34450WszDqBY
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 14:57:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PZVOEBBA"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="uYj2aM5f"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A1ABA206DF;
 Thu,  2 Feb 2017 22:57:54 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 22:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=4Fe
 lZ75nzIQLUjzA2RfgnZMx5+I=; b=PZVOEBBAwdG8xB9vW5Na34Gu6j9C3Vfribl
 tPcH5nDCkmARRw3gNQOOppjmTyyy1nDiFYtPwpd133M7UU+GFZIzNIDSnjhKGa85
 EuuWyyL6zB8Ucqxf2peqQDnGu1rz/yJ/i1KO7M66gRFa77++W+IycJmGH/DuYXz3
 bXP51lWg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=4FelZ75nzIQLUjzA2RfgnZMx5+I=; b=uYj2a
 M5fQaSQ7WJnzonkJhbhzi7QJQWi0/4FBnSWgrl43PIP5n/Hu+rF+vbTewcDckv1r
 ujt6EF/3PQHIziuasNf/aNBgykdYWnIyd/XV0Mw2u9zkqVOUZB32fVGiuhPZebaO
 ie7fazf9RyqvnglA+lHb1gxmFxzzRsD+tDyh3o=
X-ME-Sender: <xms:wv-TWCJjXgdYEa0kuweB3cWVJH_KsBGBa5tWWXPLfUT9y1wa9Y2RxA>
X-Sasl-enc: qqPhKnl/LJjRnohmq9ie2HEKMaVapUcLW1lauK30moZb 1486094273
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5B8B24066;
 Thu,  2 Feb 2017 22:57:52 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7 02/14] gpio: aspeed: Reset to mainline
Date: Fri,  3 Feb 2017 14:27:04 +1030
Message-Id: <20170203035716.646-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170203035716.646-1-andrew@aj.id.au>
References: <20170203035716.646-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 03:57:57 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/Kconfig       |  13 +++--
 drivers/gpio/gpio-aspeed.c | 137 ++++++++++++++++++++-------------------------
 2 files changed, 69 insertions(+), 81 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a9c816f795ac..094d3a12d9f6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -128,6 +128,13 @@ config GPIO_AMDPT
 	  driver for GPIO functionality on Promontory IOHub
 	  Require ACPI ASL code to enumerate as a platform device.
 
+config GPIO_ASPEED
+	tristate "Aspeed GPIO support"
+	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
+
 config GPIO_ATH79
 	tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
 	default y if ATH79
@@ -138,12 +145,6 @@ config GPIO_ATH79
 	  Select this option to enable GPIO driver for
 	  Atheros AR71XX/AR724X/AR913X SoC devices.
 
-config GPIO_ASPEED
-	bool "Aspeed GPIO support"
-	depends on (ARCH_ASPEED || COMPILE_TEST) && OF
-	select GENERIC_IRQ_CHIP
-	help
-	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
 
 config GPIO_BCM_KONA
 	bool "Broadcom Kona GPIO"
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index e48bd1ea82d1..03a5925a423c 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -23,8 +23,6 @@ struct aspeed_gpio {
 	spinlock_t lock;
 	void __iomem *base;
 	int irq;
-	struct irq_chip irq_chip;
-	struct irq_domain *irq_domain;
 };
 
 struct aspeed_gpio_bank {
@@ -84,11 +82,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 #define GPIO_IRQ_TYPE2	0x0c
 #define GPIO_IRQ_STATUS	0x10
 
-static inline struct aspeed_gpio *to_aspeed_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct aspeed_gpio, chip);
-}
-
 static const struct aspeed_gpio_bank *to_bank(unsigned int offset)
 {
 	unsigned int bank = GPIO_BANK(offset);
@@ -113,23 +106,24 @@ static void __iomem *bank_irq_reg(struct aspeed_gpio *gpio,
 
 static int aspeed_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
-	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
 
 	return !!(ioread32(bank_val_reg(gpio, bank, GPIO_DATA))
 			& GPIO_BIT(offset));
 }
 
-static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int val)
 {
-	u32 reg;
-	void __iomem *addr;
-	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	void __iomem *addr;
+	u32 reg;
 
 	addr = bank_val_reg(gpio, bank, GPIO_DATA);
-
 	reg = ioread32(addr);
+
 	if (val)
 		reg |= GPIO_BIT(offset);
 	else
@@ -141,7 +135,7 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
 static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			    int val)
 {
-	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&gpio->lock, flags);
@@ -153,7 +147,7 @@ static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 
 static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 {
-	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 	u32 reg;
@@ -171,7 +165,7 @@ static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 			       unsigned int offset, int val)
 {
-	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 	u32 reg;
@@ -188,6 +182,23 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 	return 0;
 }
 
+static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	val = ioread32(bank_val_reg(gpio, bank, GPIO_DIR)) & GPIO_BIT(offset);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return !val;
+
+}
+
 static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
 		struct aspeed_gpio **gpio,
 		const struct aspeed_gpio_bank **bank,
@@ -224,7 +235,7 @@ static void aspeed_gpio_irq_ack(struct irq_data *d)
 	spin_unlock_irqrestore(&gpio->lock, flags);
 }
 
-static void __aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
+static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 {
 	const struct aspeed_gpio_bank *bank;
 	struct aspeed_gpio *gpio;
@@ -253,17 +264,20 @@ static void __aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 
 static void aspeed_gpio_irq_mask(struct irq_data *d)
 {
-	__aspeed_gpio_irq_set_mask(d, false);
+	aspeed_gpio_irq_set_mask(d, false);
 }
 
 static void aspeed_gpio_irq_unmask(struct irq_data *d)
 {
-	__aspeed_gpio_irq_set_mask(d, true);
+	aspeed_gpio_irq_set_mask(d, true);
 }
 
 static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 {
-	u32 type0, type1, type2, bit, reg;
+	u32 type0 = 0;
+	u32 type1 = 0;
+	u32 type2 = 0;
+	u32 bit, reg;
 	const struct aspeed_gpio_bank *bank;
 	irq_flow_handler_t handler;
 	struct aspeed_gpio *gpio;
@@ -275,8 +289,6 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 	if (rc)
 		return -EINVAL;
 
-	type0 = type1 = type2 = 0;
-
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_BOTH:
 		type2 |= bit;
@@ -321,26 +333,27 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 
 static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 {
-	struct aspeed_gpio *gpio = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	struct aspeed_gpio *data = gpiochip_get_data(gc);
 	unsigned int i, p, girq;
 	unsigned long reg;
 
-	chained_irq_enter(chip, desc);
+	chained_irq_enter(ic, desc);
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
 		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
 
-		reg = ioread32(bank_irq_reg(gpio, bank, GPIO_IRQ_STATUS));
+		reg = ioread32(bank_irq_reg(data, bank, GPIO_IRQ_STATUS));
 
 		for_each_set_bit(p, &reg, 32) {
-			girq = irq_find_mapping(gpio->irq_domain, i * 32 + p);
+			girq = irq_find_mapping(gc->irqdomain, i * 32 + p);
 			generic_handle_irq(girq);
 		}
 
 	}
 
-	chained_irq_exit(chip, desc);
+	chained_irq_exit(ic, desc);
 }
 
 static struct irq_chip aspeed_gpio_irqchip = {
@@ -351,39 +364,28 @@ static struct irq_chip aspeed_gpio_irqchip = {
 	.irq_set_type	= aspeed_gpio_set_type,
 };
 
-static int aspeed_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-{
-	struct aspeed_gpio *gpio = to_aspeed_gpio(chip);
-
-	return irq_find_mapping(gpio->irq_domain, offset);
-}
-
-static void aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
+static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
 		struct platform_device *pdev)
 {
-	int i, irq;
+	int rc;
 
-	/* request our upstream IRQ */
-	gpio->irq = platform_get_irq(pdev, 0);
-	if (gpio->irq < 0)
-		return;
+	rc = platform_get_irq(pdev, 0);
+	if (rc < 0)
+		return rc;
 
-	/* establish our irq domain to provide IRQs for each extended bank */
-	gpio->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
-			gpio->chip.ngpio, &irq_domain_simple_ops, NULL);
-	if (!gpio->irq_domain)
-		return;
+	gpio->irq = rc;
 
-	for (i = 0; i < gpio->chip.ngpio; i++) {
-		irq = irq_create_mapping(gpio->irq_domain, i);
-		irq_set_chip_data(irq, gpio);
-		irq_set_chip_and_handler(irq, &aspeed_gpio_irqchip,
-				handle_simple_irq);
-		irq_set_probe(irq);
+	rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_gpio_irqchip,
+			0, handle_bad_irq, IRQ_TYPE_NONE);
+	if (rc) {
+		dev_info(&pdev->dev, "Could not add irqchip\n");
+		return rc;
 	}
 
-	irq_set_chained_handler_and_data(gpio->irq,
-			aspeed_gpio_irq_handler, gpio);
+	gpiochip_set_chained_irqchip(&gpio->chip, &aspeed_gpio_irqchip,
+				     gpio->irq, aspeed_gpio_irq_handler);
+
+	return 0;
 }
 
 static int aspeed_gpio_request(struct gpio_chip *chip, unsigned int offset)
@@ -407,12 +409,9 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENXIO;
-
 	gpio->base = devm_ioremap_resource(&pdev->dev, res);
-	if (!gpio->base)
-		return -ENOMEM;
+	if (IS_ERR(gpio->base))
+		return PTR_ERR(gpio->base);
 
 	spin_lock_init(&gpio->lock);
 
@@ -421,31 +420,19 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.parent = &pdev->dev;
 	gpio->chip.direction_input = aspeed_gpio_dir_in;
 	gpio->chip.direction_output = aspeed_gpio_dir_out;
+	gpio->chip.get_direction = aspeed_gpio_get_direction;
 	gpio->chip.request = aspeed_gpio_request;
 	gpio->chip.free = aspeed_gpio_free;
 	gpio->chip.get = aspeed_gpio_get;
 	gpio->chip.set = aspeed_gpio_set;
-	gpio->chip.to_irq = aspeed_gpio_to_irq;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 
-	platform_set_drvdata(pdev, gpio);
-
-	rc = gpiochip_add(&gpio->chip);
+	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
 	if (rc < 0)
 		return rc;
 
-	aspeed_gpio_setup_irqs(gpio, pdev);
-
-	return 0;
-}
-
-static int aspeed_gpio_remove(struct platform_device *pdev)
-{
-	struct aspeed_gpio *gpio = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&gpio->chip);
-	return 0;
+	return aspeed_gpio_setup_irqs(gpio, pdev);
 }
 
 static const struct of_device_id aspeed_gpio_of_table[] = {
@@ -456,7 +443,6 @@ static const struct of_device_id aspeed_gpio_of_table[] = {
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 
 static struct platform_driver aspeed_gpio_driver = {
-	.remove = aspeed_gpio_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = aspeed_gpio_of_table,
@@ -466,3 +452,4 @@ static struct platform_driver aspeed_gpio_driver = {
 module_platform_driver_probe(aspeed_gpio_driver, aspeed_gpio_probe);
 
 MODULE_DESCRIPTION("Aspeed GPIO Driver");
+MODULE_LICENSE("GPL");
-- 
2.9.3
