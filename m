Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0937B1A045F
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 00:13:49 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445951607458529.0764898513953;
 Tue, 27 Oct 2015 06:13:27 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 3/3] gpio/aspeed: Implement interrupts for GPIO banks
Date: Tue, 27 Oct 2015 08:13:20 -0500
Message-Id: <1445951600-17505-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445951600-17505-1-git-send-email-patches@stwcx.xyz>
References: <1445951600-17505-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 13:13:50 -0000

From: Jeremy Kerr <jk@ozlabs.org>

We have a set of interrupt registers in each bank; this change
adds a gpio irqchip to hook them up to the GPIO code.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |   1 +
 drivers/gpio/gpio-aspeed.c                    | 233 +++++++++++++++++++++++++-
 2 files changed, 232 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index e63ddb9..8f70030 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -148,6 +148,7 @@
 			gpio: gpio@1e780000 {
 			       compatible = "aspeed,ast2400-gpio";
 			       reg = <0x1e780000 0x1000>;
+			       interrupts = <20>;
 			};
 
 			uart1: serial@1e783000 {
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 8295371..a06515f 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -21,36 +21,46 @@ struct aspeed_gpio {
 	struct gpio_chip chip;
 	spinlock_t lock;
 	void __iomem *base;
+	int irq;
+	struct irq_chip irq_chip;
+	struct irq_domain *irq_domain;
 };
 
 struct aspeed_gpio_bank {
 	uint16_t	val_regs;
+	uint16_t	irq_regs;
 	char		names[4];
 };
 
 static struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 	{
 		.val_regs = 0x0000,
+		.irq_regs = 0x0008,
 		.names = { 'A', 'B', 'C', 'D' },
 	},
 	{
 		.val_regs = 0x0020,
+		.irq_regs = 0x0028,
 		.names = { 'E', 'F', 'G', 'H' },
 	},
 	{
 		.val_regs = 0x0070,
+		.irq_regs = 0x0098,
 		.names = { 'I', 'J', 'K', 'L' },
 	},
 	{
 		.val_regs = 0x0078,
+		.irq_regs = 0x00e8,
 		.names = { 'M', 'N', 'O', 'P' },
 	},
 	{
 		.val_regs = 0x0080,
+		.irq_regs = 0x0118,
 		.names = { 'Q', 'R', 'S', 'T' },
 	},
 	{
 		.val_regs = 0x0088,
+		.irq_regs = 0x0148,
 		.names = { 'U', 'V', 'W', 'X' },
 	},
 };
@@ -62,6 +72,12 @@ static struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 #define GPIO_DATA	0x00
 #define GPIO_DIR	0x04
 
+#define GPIO_IRQ_ENABLE	0x00
+#define GPIO_IRQ_TYPE0	0x04
+#define GPIO_IRQ_TYPE1	0x08
+#define GPIO_IRQ_TYPE2	0x0c
+#define GPIO_IRQ_STATUS	0x10
+
 static inline struct aspeed_gpio *to_aspeed_gpio(struct gpio_chip *chip)
 {
 	return container_of(chip, struct aspeed_gpio, chip);
@@ -81,6 +97,13 @@ static void *bank_val_reg(struct aspeed_gpio *gpio,
 	return gpio->base + bank->val_regs + reg;
 }
 
+static void *bank_irq_reg(struct aspeed_gpio *gpio,
+		struct aspeed_gpio_bank *bank,
+		unsigned int reg)
+{
+	return gpio->base + bank->irq_regs + reg;
+}
+
 static int aspeed_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
@@ -146,6 +169,169 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 	return 0;
 }
 
+static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
+		struct aspeed_gpio **gpio,
+		struct aspeed_gpio_bank **bank,
+		u32 *bit)
+{
+	int offset;
+
+	offset = irqd_to_hwirq(d);
+
+	*gpio = irq_data_get_irq_chip_data(d);
+	*bank = to_bank(offset);
+	*bit = GPIO_BIT(offset);
+
+	return 0;
+}
+
+static void aspeed_gpio_irq_ack(struct irq_data *d)
+{
+	struct aspeed_gpio_bank *bank;
+	struct aspeed_gpio *gpio;
+	unsigned long flags;
+	void *status_addr;
+	u32 bit;
+	int rc;
+
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit);
+	if (rc)
+		return;
+
+	status_addr = bank_irq_reg(gpio, bank, GPIO_IRQ_STATUS);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+	iowrite32(bit, status_addr);
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void __aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
+{
+	struct aspeed_gpio_bank *bank;
+	struct aspeed_gpio *gpio;
+	unsigned long flags;
+	u32 reg, bit;
+	void *addr;
+	int rc;
+
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit);
+	if (rc)
+		return;
+
+	addr = bank_irq_reg(gpio, bank, GPIO_IRQ_ENABLE);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	reg = ioread32(addr);
+	if (set)
+		reg |= bit;
+	else
+		reg &= bit;
+	iowrite32(reg, addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void aspeed_gpio_irq_mask(struct irq_data *d)
+{
+	__aspeed_gpio_irq_set_mask(d, false);
+}
+
+static void aspeed_gpio_irq_unmask(struct irq_data *d)
+{
+	__aspeed_gpio_irq_set_mask(d, true);
+}
+
+static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
+{
+	u32 type0, type1, type2, bit, reg;
+	struct aspeed_gpio_bank *bank;
+	irq_flow_handler_t handler;
+	struct aspeed_gpio *gpio;
+	unsigned long flags;
+	void *addr;
+	int rc;
+
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit);
+	if (rc)
+		return -EINVAL;
+
+	type0 = type1 = type2 = 0;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_BOTH:
+		type2 |= bit;
+	case IRQ_TYPE_EDGE_RISING:
+		type0 |= bit;
+	case IRQ_TYPE_EDGE_FALLING:
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		type0 |= bit;
+	case IRQ_TYPE_LEVEL_LOW:
+		type1 |= bit;
+		handler = handle_level_irq;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	addr = bank_irq_reg(gpio, bank, GPIO_IRQ_TYPE0);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type0;
+	iowrite32(reg, addr);
+
+	addr = bank_irq_reg(gpio, bank, GPIO_IRQ_TYPE1);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type1;
+	iowrite32(reg, addr);
+
+	addr = bank_irq_reg(gpio, bank, GPIO_IRQ_TYPE2);
+	reg = ioread32(addr);
+	reg = (reg & ~bit) | type2;
+	iowrite32(reg, addr);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	__irq_set_handler_locked(d->irq, handler);
+
+	return 0;
+}
+
+static void aspeed_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
+{
+	struct aspeed_gpio *gpio = irq_get_handler_data(irq);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int i, p, girq;
+	unsigned long reg;
+
+	chained_irq_enter(chip, desc);
+
+	for (i = 0; i < ARRAY_SIZE(aspeed_gpio_banks); i++) {
+		struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
+
+		reg = ioread32(bank_irq_reg(gpio, bank, GPIO_IRQ_STATUS));
+
+		for_each_set_bit(p, &reg, 32) {
+			girq = irq_find_mapping(gpio->irq_domain, i * 32 + p);
+			generic_handle_irq(girq);
+		}
+
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static struct irq_chip aspeed_gpio_irqchip = {
+	.name		= "aspeed-gpio",
+	.irq_ack	= aspeed_gpio_irq_ack,
+	.irq_mask	= aspeed_gpio_irq_mask,
+	.irq_unmask	= aspeed_gpio_irq_unmask,
+	.irq_set_type	= aspeed_gpio_set_type,
+};
+
 static void aspeed_gpio_set_names(struct aspeed_gpio *gpio)
 {
 	const char format[] = "GPIOXn";
@@ -175,10 +361,46 @@ static void aspeed_gpio_set_names(struct aspeed_gpio *gpio)
 	gpio->chip.names = (const char * const *)names;
 }
 
+static int aspeed_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+{
+	struct aspeed_gpio *gpio = to_aspeed_gpio(chip);
+	return irq_find_mapping(gpio->irq_domain, offset);
+}
+
+static void aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
+		struct platform_device *pdev)
+{
+	int i, irq;
+
+	/* request our upstream IRQ */
+	gpio->irq = platform_get_irq(pdev, 0);
+	if (gpio->irq < 0)
+		return;
+
+	/* establish our irq domain to provide IRQs for each extended bank */
+	gpio->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
+			gpio->chip.ngpio, &irq_domain_simple_ops, NULL);
+	if (!gpio->irq_domain)
+		return;
+
+	for (i = 0; i < gpio->chip.ngpio; i++) {
+		irq = irq_create_mapping(gpio->irq_domain, i);
+		irq_set_chip_data(irq, gpio);
+		irq_set_chip_and_handler(irq, &aspeed_gpio_irqchip,
+				handle_simple_irq);
+		set_irq_flags(irq, IRQF_VALID);
+	}
+
+	irq_set_chained_handler_and_data(gpio->irq,
+			aspeed_gpio_irq_handler, gpio);
+}
+
+
 static int __init aspeed_gpio_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct aspeed_gpio *gpio;
+	struct resource *res;
+	int rc;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -201,6 +423,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.direction_output = aspeed_gpio_dir_out;
 	gpio->chip.get = aspeed_gpio_get;
 	gpio->chip.set = aspeed_gpio_set;
+	gpio->chip.to_irq = aspeed_gpio_to_irq;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 
@@ -208,7 +431,13 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpio);
 
-	return gpiochip_add(&gpio->chip);
+	rc = gpiochip_add(&gpio->chip);
+	if (rc < 0)
+		return rc;
+
+	aspeed_gpio_setup_irqs(gpio, pdev);
+
+	return 0;
 }
 
 static int aspeed_gpio_remove(struct platform_device *pdev)
-- 
2.6.0
