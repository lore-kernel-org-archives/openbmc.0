Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vF3Zt4yPlzDqBl
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 15:21:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LKf65V16"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nBVCAbkf"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9FDC620A64;
 Thu,  2 Feb 2017 23:21:08 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 02 Feb 2017 23:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Sez
 BTsJndly4zmGGUhUz1qrLBbI=; b=LKf65V16GcOMT+BwVfYSbHCNbrZgR6D4/Ic
 +eau725NSPvG/0XXM4++Zwl3ryA7q1zbj1kzzx/tgAsITBNpcEL/b1eWlpera5gK
 o9F8kOmoCYQoPhKmJmmaYdh3bC1C9gFnm9D5MZGhxV2ryW5a3O/H+Ds3zCDT8UPA
 ZmcJdvKM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=SezBTsJndly4zmGGUhUz1qrLBbI=; b=nBVCA
 bkfx9pXO4yGp+FwxqJI1M+WcS+Fl/UdgOiiKvVw/ST5VlxbOTih5T5nBlVSAXpwA
 lKJfE5Kottxbsfc9Xjpd5xNxgCCz1ti14MWb4X5FKw0N4cPQHioHLCqavBKVDuhe
 8CSqJa1AMdhueqLKp5tWK8ZAQ0Q4bI9+8Tujjw=
X-ME-Sender: <xms:NAWUWIOWwlxBC1DkRf2s8LazyBZ-ipxYp6LezUDqmH1slICRdUSWDw>
X-Sasl-enc: +pU5Z8xG1sgBiADy2hQX1RuhjLcQcXcB/Sjq/Uwm68Ph 1486095667
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A2EB24066;
 Thu,  2 Feb 2017 23:21:06 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.7 05/14] gpio: aspeed: Add banks Y, Z, AA,
 AB and AC
Date: Fri,  3 Feb 2017 14:50:04 +1030
Message-Id: <20170203042013.2719-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170203042013.2719-1-andrew@aj.id.au>
References: <20170203042013.2719-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 04:21:11 -0000

This is less straight-forward than one would hope, as some banks only
have 4 pins rather than 8, others are output only, yet more (W and
X, already supported) are input-only, and in the case of the g4 SoC bank
AC doesn't exist.

Add some structs to describe the varying properties of different banks
and integrate mechanisms to deny requests for unsupported
configurations.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(cherry picked from commit 1736f75d35e47409ad776273133d0f558a4c8253)
[AJ: Drop irq valid code as it's not present in 4.7]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 149 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 135 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 20f6f8ae4671..cb37783ff857 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -15,14 +15,27 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
+#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/pinctrl/consumer.h>
 
+struct aspeed_bank_props {
+	unsigned int bank;
+	u32 input;
+	u32 output;
+};
+
+struct aspeed_gpio_config {
+	unsigned int nr_gpios;
+	const struct aspeed_bank_props *props;
+};
+
 struct aspeed_gpio {
 	struct gpio_chip chip;
 	spinlock_t lock;
 	void __iomem *base;
 	int irq;
+	const struct aspeed_gpio_config *config;
 };
 
 struct aspeed_gpio_bank {
@@ -62,11 +75,16 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.irq_regs = 0x0148,
 		.names = { "U", "V", "W", "X" },
 	},
-	/*
-	 * A bank exists for { 'Y', 'Z', "AA", "AB" }, but is not implemented.
-	 * Only half of GPIOs Y support interrupt configuration, and none of Z,
-	 * AA or AB do as they are output only.
-	 */
+	{
+		.val_regs = 0x01E0,
+		.irq_regs = 0x0178,
+		.names = { "Y", "Z", "AA", "AB" },
+	},
+	{
+		.val_regs = 0x01E8,
+		.irq_regs = 0x01A8,
+		.names = { "AC", "", "", "" },
+	},
 };
 
 #define GPIO_BANK(x)	((x) >> 5)
@@ -90,6 +108,51 @@ static const struct aspeed_gpio_bank *to_bank(unsigned int offset)
 	return &aspeed_gpio_banks[bank];
 }
 
+static inline bool is_bank_props_sentinel(const struct aspeed_bank_props *props)
+{
+	return !(props->input || props->output);
+}
+
+static inline const struct aspeed_bank_props *find_bank_props(
+		struct aspeed_gpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = gpio->config->props;
+
+	while (!is_bank_props_sentinel(props)) {
+		if (props->bank == GPIO_BANK(offset))
+			return props;
+		props++;
+	}
+
+	return NULL;
+}
+
+static inline bool have_gpio(struct aspeed_gpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	unsigned int group = GPIO_OFFSET(offset) / 8;
+
+	return bank->names[group][0] != '\0' &&
+		(!props || ((props->input | props->output) & GPIO_BIT(offset)));
+}
+
+static inline bool have_input(struct aspeed_gpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+
+	return !props || (props->input & GPIO_BIT(offset));
+}
+
+#define have_irq(g, o) have_input((g), (o))
+
+static inline bool have_output(struct aspeed_gpio *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+
+	return !props || (props->output & GPIO_BIT(offset));
+}
+
 static void __iomem *bank_val_reg(struct aspeed_gpio *gpio,
 		const struct aspeed_gpio_bank *bank,
 		unsigned int reg)
@@ -152,6 +215,9 @@ static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 	unsigned long flags;
 	u32 reg;
 
+	if (!have_input(gpio, offset))
+		return -ENOTSUPP;
+
 	spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
@@ -170,6 +236,9 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 	unsigned long flags;
 	u32 reg;
 
+	if (!have_output(gpio, offset))
+		return -ENOTSUPP;
+
 	spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
@@ -189,6 +258,12 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	unsigned long flags;
 	u32 val;
 
+	if (!have_input(gpio, offset))
+		return GPIOF_DIR_OUT;
+
+	if (!have_output(gpio, offset))
+		return GPIOF_DIR_IN;
+
 	spin_lock_irqsave(&gpio->lock, flags);
 
 	val = ioread32(bank_val_reg(gpio, bank, GPIO_DIR)) & GPIO_BIT(offset);
@@ -205,10 +280,17 @@ static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
 		u32 *bit)
 {
 	int offset;
+	struct aspeed_gpio *internal;
 
 	offset = irqd_to_hwirq(d);
 
-	*gpio = irq_data_get_irq_chip_data(d);
+	internal = irq_data_get_irq_chip_data(d);
+
+	/* This might be a bit of a questionable place to check */
+	if (!have_irq(internal, offset))
+		return -ENOTSUPP;
+
+	*gpio = internal;
 	*bank = to_bank(offset);
 	*bit = GPIO_BIT(offset);
 
@@ -390,6 +472,9 @@ static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
 
 static int aspeed_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
+	if (!have_gpio(gpiochip_get_data(chip), offset))
+		return -ENODEV;
+
 	return pinctrl_request_gpio(chip->base + offset);
 }
 
@@ -398,8 +483,46 @@ static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	pinctrl_free_gpio(chip->base + offset);
 }
 
+/*
+ * Any banks not specified in a struct aspeed_bank_props array are assumed to
+ * have the properties:
+ *
+ *     { .input = 0xffffffff, .output = 0xffffffff }
+ */
+
+static const struct aspeed_bank_props ast2400_bank_props[] = {
+	/*     input	  output   */
+	{ 5, 0xffffffff, 0x0000ffff }, /* U/V/W/X */
+	{ 6, 0x0000000f, 0x0fffff0f }, /* Y/Z/AA/AB, two 4-GPIO holes */
+	{ },
+};
+
+static const struct aspeed_gpio_config ast2400_config =
+	/* 220 for simplicity, really 216 with two 4-GPIO holes, four at end */
+	{ .nr_gpios = 220, .props = ast2400_bank_props, };
+
+static const struct aspeed_bank_props ast2500_bank_props[] = {
+	/*     input	  output   */
+	{ 5, 0xffffffff, 0x0000ffff }, /* U/V/W/X */
+	{ 6, 0x0fffffff, 0x0fffffff }, /* Y/Z/AA/AB, 4-GPIO hole */
+	{ 7, 0x000000ff, 0x000000ff }, /* AC */
+	{ },
+};
+
+static const struct aspeed_gpio_config ast2500_config =
+	/* 232 for simplicity, actual number is 228 (4-GPIO hole in GPIOAB) */
+	{ .nr_gpios = 232, .props = ast2500_bank_props, };
+
+static const struct of_device_id aspeed_gpio_of_table[] = {
+	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
+	{ .compatible = "aspeed,ast2500-gpio", .data = &ast2500_config, },
+	{}
+};
+MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
+
 static int __init aspeed_gpio_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *gpio_id;
 	struct aspeed_gpio *gpio;
 	struct resource *res;
 	int rc;
@@ -415,8 +538,13 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&gpio->lock);
 
-	gpio->chip.ngpio = ARRAY_SIZE(aspeed_gpio_banks) * 32;
+	gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
+	if (!gpio_id)
+		return -EINVAL;
 
+	gpio->config = gpio_id->data;
+
+	gpio->chip.ngpio = gpio->config->nr_gpios;
 	gpio->chip.parent = &pdev->dev;
 	gpio->chip.direction_input = aspeed_gpio_dir_in;
 	gpio->chip.direction_output = aspeed_gpio_dir_out;
@@ -435,13 +563,6 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	return aspeed_gpio_setup_irqs(gpio, pdev);
 }
 
-static const struct of_device_id aspeed_gpio_of_table[] = {
-	{ .compatible = "aspeed,ast2400-gpio" },
-	{ .compatible = "aspeed,ast2500-gpio" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
-
 static struct platform_driver aspeed_gpio_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
-- 
2.9.3
