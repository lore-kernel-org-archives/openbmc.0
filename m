Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8m131DP2zDq98
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 15:25:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="N8Z7AdiK"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fZHZqX2H"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CAACC20B32;
 Thu, 26 Jan 2017 23:25:24 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 26 Jan 2017 23:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=vhCVx6gJEZJSU/ueViXGXS/Nn8o
 =; b=N8Z7AdiKejV0gN6jME3g2ePAI+oPbwgajLYdO4dMHBjSfITezij5t/PIubP
 mwWgKTX00c8hqk3POTZ1Yc0iUnLCFv+9E3qaZTSP8okbeDcimXIIFQvGCSyQCos+
 LlBmPAf2FGOArtsWn69jWfcmTBskWyA6DsM+rQZKkufGcJs0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=vh
 CVx6gJEZJSU/ueViXGXS/Nn8o=; b=fZHZqX2HEgEAccUWl7aGSivZT20uzSmfLG
 bstvPfvDw7pXKAKmvWMG3sdF68DvK0pdIxQcp9LPiINCPu63cwExOwVlTLI7/Ott
 3A12YF2Xpkg08zDDs919Pl5Kx3c4RzP10Tor0fTHRnX6uUOsIs/bMKQmc06pJrpa
 w8fyB7V00=
X-ME-Sender: <xms:tMuKWB_lqmJssdUFwb1AL9dpqcCsdrC9d_8vfsO-8uIroGIRXcz47w>
X-Sasl-enc: pJxq2zEk6khuQqNsFXIE6XfunRqbrCjbx6eSZ5l7Vk5Y 1485491123
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF5DC24066;
 Thu, 26 Jan 2017 23:25:21 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v3] gpio: aspeed: Add banks Y, Z, AA, AB and AC
Date: Fri, 27 Jan 2017 14:54:42 +1030
Message-Id: <20170127042442.28994-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Fri, 27 Jan 2017 04:25:28 -0000

This is less straight-forward than one would hope, as some banks only
have 4 pins rather than 8, others are output only, yet more (W and
X, already supported) are input-only, and in the case of the g4 SoC bank
AC doesn't exist.

Add some structs to describe the varying properties of different banks
and integrate mechanisms to deny requests for unsupported
configurations.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

Since v2:

Drop linux/gpio.h include and change away from using GPIOF_* macros

Since v1:

Fix types for for_each_clear_bit() iteration

 drivers/gpio/gpio-aspeed.c | 173 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 159 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 20f6f8ae4671..fb16cc771c0d 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -18,11 +18,23 @@
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
@@ -62,11 +74,16 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
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
@@ -90,6 +107,51 @@ static const struct aspeed_gpio_bank *to_bank(unsigned int offset)
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
@@ -152,6 +214,9 @@ static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 	unsigned long flags;
 	u32 reg;
 
+	if (!have_input(gpio, offset))
+		return -ENOTSUPP;
+
 	spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
@@ -170,6 +235,9 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 	unsigned long flags;
 	u32 reg;
 
+	if (!have_output(gpio, offset))
+		return -ENOTSUPP;
+
 	spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
@@ -189,6 +257,12 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	unsigned long flags;
 	u32 val;
 
+	if (!have_input(gpio, offset))
+		return 0;
+
+	if (!have_output(gpio, offset))
+		return 1;
+
 	spin_lock_irqsave(&gpio->lock, flags);
 
 	val = ioread32(bank_val_reg(gpio, bank, GPIO_DIR)) & GPIO_BIT(offset);
@@ -205,10 +279,17 @@ static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
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
 
@@ -364,6 +445,28 @@ static struct irq_chip aspeed_gpio_irqchip = {
 	.irq_set_type	= aspeed_gpio_set_type,
 };
 
+static void set_irq_valid_mask(struct aspeed_gpio *gpio)
+{
+	const struct aspeed_bank_props *props = gpio->config->props;
+
+	while (!is_bank_props_sentinel(props)) {
+		unsigned int offset;
+		const unsigned long int input = props->input;
+
+		/* Pretty crummy approach, but similar to GPIO core */
+		for_each_clear_bit(offset, &input, 32) {
+			unsigned int i = props->bank * 32 + offset;
+
+			if (i >= gpio->config->nr_gpios)
+				break;
+
+			clear_bit(i, gpio->chip.irq_valid_mask);
+		}
+
+		props++;
+	}
+}
+
 static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
 		struct platform_device *pdev)
 {
@@ -375,6 +478,8 @@ static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
 
 	gpio->irq = rc;
 
+	set_irq_valid_mask(gpio);
+
 	rc = gpiochip_irqchip_add(&gpio->chip, &aspeed_gpio_irqchip,
 			0, handle_bad_irq, IRQ_TYPE_NONE);
 	if (rc) {
@@ -390,6 +495,9 @@ static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
 
 static int aspeed_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
+	if (!have_gpio(gpiochip_get_data(chip), offset))
+		return -ENODEV;
+
 	return pinctrl_request_gpio(chip->base + offset);
 }
 
@@ -398,8 +506,46 @@ static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offset)
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
@@ -415,8 +561,13 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 
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
@@ -427,6 +578,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.set = aspeed_gpio_set;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
+	gpio->chip.irq_need_valid_mask = true;
 
 	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
 	if (rc < 0)
@@ -435,13 +587,6 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
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
