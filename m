Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C0C7A1A08EC
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 00:13:54 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445951605778177.88017655992144;
 Tue, 27 Oct 2015 06:13:25 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 2/3] gpio/aspeed: Expose entire bank as one gpio chip
Date: Tue, 27 Oct 2015 08:13:19 -0500
Message-Id: <1445951600-17505-3-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 13:13:55 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |  29 +------
 drivers/gpio/gpio-aspeed.c                    | 106 +++++++++++++++++++++++---
 2 files changed, 98 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index d90e4ba..e63ddb9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -145,34 +145,9 @@
 				clocks = <&clk_apb>;
 			};
 
-			gpio0: gpio@1e780000 {
+			gpio: gpio@1e780000 {
 			       compatible = "aspeed,ast2400-gpio";
-			       reg = <0x1e780000 0x20>;
-			};
-
-			gpio1: gpio@1e780020 {
-			       compatible = "aspeed,ast2400-gpio";
-			       reg = <0x1e780020 0x20>;
-			};
-
-			gpio2: gpio@1e780070 {
-			       compatible = "aspeed,ast2400-gpio";
-			       reg = <0x1e780070 0x8>;
-			};
-
-			gpio3: gpio@1e780078 {
-			       compatible = "aspeed,ast2400-gpio";
-			       reg = <0x1e780078 0x8>;
-			};
-
-			gpio4: gpio@1e780080 {
-			       compatible = "aspeed,ast2400-gpio";
-			       reg = <0x1e780080 0x8>;
-			};
-
-			gpio5: gpio@1e780088 {
-			       compatible = "aspeed,ast2400-gpio";
-			       reg = <0x1e780088 0x8>;
+			       reg = <0x1e780000 0x1000>;
 			};
 
 			uart1: serial@1e783000 {
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index f347260..8295371 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -23,6 +23,42 @@ struct aspeed_gpio {
 	void __iomem *base;
 };
 
+struct aspeed_gpio_bank {
+	uint16_t	val_regs;
+	char		names[4];
+};
+
+static struct aspeed_gpio_bank aspeed_gpio_banks[] = {
+	{
+		.val_regs = 0x0000,
+		.names = { 'A', 'B', 'C', 'D' },
+	},
+	{
+		.val_regs = 0x0020,
+		.names = { 'E', 'F', 'G', 'H' },
+	},
+	{
+		.val_regs = 0x0070,
+		.names = { 'I', 'J', 'K', 'L' },
+	},
+	{
+		.val_regs = 0x0078,
+		.names = { 'M', 'N', 'O', 'P' },
+	},
+	{
+		.val_regs = 0x0080,
+		.names = { 'Q', 'R', 'S', 'T' },
+	},
+	{
+		.val_regs = 0x0088,
+		.names = { 'U', 'V', 'W', 'X' },
+	},
+};
+
+#define GPIO_BANK(x)	((x) >> 5)
+#define GPIO_OFFSET(x)	((x) & 0x1f)
+#define GPIO_BIT(x)	BIT(GPIO_OFFSET(x))
+
 #define GPIO_DATA	0x00
 #define GPIO_DIR	0x04
 
@@ -31,29 +67,46 @@ static inline struct aspeed_gpio *to_aspeed_gpio(struct gpio_chip *chip)
 	return container_of(chip, struct aspeed_gpio, chip);
 }
 
+static struct aspeed_gpio_bank *to_bank(unsigned int offset)
+{
+	unsigned int bank = GPIO_BANK(offset);
+	WARN_ON(bank > ARRAY_SIZE(aspeed_gpio_banks));
+	return &aspeed_gpio_banks[bank];
+}
+
+static void *bank_val_reg(struct aspeed_gpio *gpio,
+		struct aspeed_gpio_bank *bank,
+		unsigned int reg)
+{
+	return gpio->base + bank->val_regs + reg;
+}
+
 static int aspeed_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
+	struct aspeed_gpio_bank *bank = to_bank(offset);
 
-	return !!(ioread32(gpio->base + GPIO_DATA) & BIT(offset));
+	return !!(ioread32(bank_val_reg(gpio, bank, GPIO_DATA))
+			& GPIO_BIT(offset));
 }
 
 static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			    int val)
 {
 	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
+	struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 	u32 reg;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
-	reg = ioread32(gpio->base + GPIO_DATA);
+	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DATA));
 	if (val)
-		reg |= BIT(offset);
+		reg |= GPIO_BIT(offset);
 	else
-		reg &= ~BIT(offset);
+		reg &= ~GPIO_BIT(offset);
 
-	iowrite32(reg, gpio->base + GPIO_DATA);
+	iowrite32(reg, bank_val_reg(gpio, bank, GPIO_DATA));
 
 	spin_unlock_irqrestore(&gpio->lock, flags);
 }
@@ -61,13 +114,14 @@ static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
+	struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 	u32 reg;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
-	reg = ioread32(gpio->base + GPIO_DIR);
-	iowrite32(reg & ~BIT(offset), gpio->base + GPIO_DIR);
+	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
+	iowrite32(reg & ~GPIO_BIT(offset), bank_val_reg(gpio, bank, GPIO_DIR));
 
 	spin_unlock_irqrestore(&gpio->lock, flags);
 
@@ -78,19 +132,49 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 			       unsigned int offset, int val)
 {
 	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
+	struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 	u32 reg;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
-	reg = ioread32(gpio->base + GPIO_DIR);
-	iowrite32(reg | BIT(offset), gpio->base + GPIO_DIR);
+	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
+	iowrite32(reg | GPIO_BIT(offset), bank_val_reg(gpio, bank, GPIO_DIR));
 
 	spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
 }
 
+static void aspeed_gpio_set_names(struct aspeed_gpio *gpio)
+{
+	const char format[] = "GPIOXn";
+	char *namebuf, **names;
+	unsigned int i;
+
+	/* our buffer of name pointers */
+	names = devm_kmalloc_array(gpio->chip.dev, gpio->chip.ngpio,
+			sizeof(char *), GFP_KERNEL);
+
+	/* and one contiguous buffer for the names themselves */
+	namebuf = devm_kmalloc_array(gpio->chip.dev, gpio->chip.ngpio,
+			sizeof(format), GFP_KERNEL);
+
+	for (i = 0; i < gpio->chip.ngpio; i++) {
+		struct aspeed_gpio_bank *bank = to_bank(i);
+		char *name = namebuf + (i * sizeof(format));
+		int bit = GPIO_OFFSET(i);
+
+		memcpy(name, format, 4);
+		name[4] = bank->names[bit >> 3];
+		name[5] = '0' + (bit % 8);
+		name[6] = '\0';
+		names[i] = name;
+	}
+
+	gpio->chip.names = (const char * const *)names;
+}
+
 static int __init aspeed_gpio_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -110,7 +194,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&gpio->lock);
 
-	gpio->chip.ngpio = 32;
+	gpio->chip.ngpio = ARRAY_SIZE(aspeed_gpio_banks) * 32;
 
 	gpio->chip.dev = &pdev->dev;
 	gpio->chip.direction_input = aspeed_gpio_dir_in;
@@ -120,6 +204,8 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 
+	aspeed_gpio_set_names(gpio);
+
 	platform_set_drvdata(pdev, gpio);
 
 	return gpiochip_add(&gpio->chip);
-- 
2.6.0
