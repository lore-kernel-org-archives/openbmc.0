Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w005x6s1HzDqK1
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 22:59:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="P3o82gm6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KdnkB1vc"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DDB1D209AD;
 Fri,  7 Apr 2017 08:59:31 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 07 Apr 2017 08:59:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=b0L0vX
 lJrrDNs3GpA4wPukKKa5mYUK27IqiEY90fbaQ=; b=P3o82gm68C8ijn+yVgocYj
 rceKMZNOH4zxgsHTZkGHBgnlQ5pTQxhqbzRdloji1W5J+vTORuMlSceDkg7s3rYQ
 E7atqtK0m/lqrkJkwU1UIyw4IWLtukki7Gj1VjOURmxq3XkUr81POA5vGoPWp1/Z
 gspXGYpvk/nuhYvjC6CjlbXW0ZuNVNMQxJrIvlyq7LlYFLMJpj71CNcUyem2aON0
 cdkstkX0+W2hucZB7kk2Ew7UXAB7q26XQvTp3laFEoSZps2C/NinBDEWcZh+CKMV
 aIoO4x3Li3K8t3Xg4sg5qnJjieBxf120d8NP+pj7a6B1kwVlE12E1N9ZDz2Vrosw
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=b0L0vXlJrrDNs3GpA4wPukKKa5mYUK27IqiEY90fb
 aQ=; b=KdnkB1vcVhx9Ps1C0gnj0WZFsCM0QNyWBqJbZsOLqnaFaPdrtWmX4swbb
 iawq2ASP+9FzJuy2W+bR2GsHnz5K5bCQDqflEaiSC6Rx2VTyJPBl1x4MIvPMi79c
 2c7/ruHTXt9OKwiJ177NVgcoPw/4bdJt9wpaqvQlJ+lDAu1P6BIGfpwprlelkMc/
 dCxfdlyPqqN8nvbCHBOqdJNadHKSjp6Bs/UIxRyth92vQgnPuPi7sze0c836JZr/
 CwOo/5iWU/lV/7OEMqQE9+E6xow6NELE4lw1nTXVkgLqU2qMeqiSjkbbxeVl1l31
 y78hRwijheqjF67Qahh2HzBrqM+gg==
X-ME-Sender: <xms:M43nWCjYTp01iMcTBRZEWiTzf3Upor-wxLOg5v3Vw54zUVo8Db-wYw>
X-Sasl-enc: byXebp1sMU+vXERGVm28vtKId74ddyEQ4xecc4+igY4j 1491569970
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8FB2A7E78C;
 Fri,  7 Apr 2017 08:59:27 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2 3/4] gpio: aspeed: Add debounce support
Date: Fri,  7 Apr 2017 22:29:01 +0930
Message-Id: <20170407125902.15960-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170407125902.15960-1-andrew@aj.id.au>
References: <20170407125902.15960-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 07 Apr 2017 12:59:34 -0000

Each GPIO in the Aspeed GPIO controller can choose one of four input
debounce states: to disable debouncing for an input, or select from one
of three programmable debounce timer values. Each GPIO in a
four-bank-set is assigned one bit in each of two debounce configuration
registers dedicated to the set, and selects a debounce state by
configuring the two bits to select one of the four options.

The limitation on debounce timer values is managed by mapping offsets
onto a configured timer value and keeping count of the number of users
a timer has. Timer values are configured on a first-come-first-served
basis.

A small twist in the hardware design is that the debounce configuration
register numbering is reversed with respect to the binary representation
of the debounce timer of interest (i.e. debounce register 1 represents
bit 1, and debounce register 2 represents bit 0 of the timer numbering).

Tested on an AST2500EVB with additional inspection under QEMU's
romulus-bmc machine.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 281 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 276 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index fb16cc771c0d..3327a48df862 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -9,14 +9,18 @@
  * 2 of the License, or (at your option) any later version.
  */
 
-#include <linux/module.h>
-#include <linux/kernel.h>
+#include <asm/div64.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/hashtable.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
-#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
 
 struct aspeed_bank_props {
 	unsigned int bank;
@@ -29,59 +33,85 @@ struct aspeed_gpio_config {
 	const struct aspeed_bank_props *props;
 };
 
+/*
+ * @offset_timer: Maps an offset to an @timer_users index, or zero if disabled
+ * @timer_users: Tracks the number of users for each timer
+ *
+ * The @timer_users has four elements but the first element is unused. This is
+ * to simplify accounting and indexing, as a zero value in @offset_timer
+ * represents disabled debouncing for the GPIO. Any other value for an element
+ * of @offset_timer is used as an index into @timer_users. This behaviour of
+ * the zero value aligns with the behaviour of zero built from the timer
+ * configuration registers (i.e. debouncing is disabled).
+ */
 struct aspeed_gpio {
 	struct gpio_chip chip;
 	spinlock_t lock;
 	void __iomem *base;
 	int irq;
 	const struct aspeed_gpio_config *config;
+
+	u8 *offset_timer;
+	unsigned int timer_users[4];
+	struct clk *clk;
 };
 
 struct aspeed_gpio_bank {
 	uint16_t	val_regs;
 	uint16_t	irq_regs;
+	uint16_t	debounce_regs;
 	const char	names[4][3];
 };
 
+static const int debounce_timers[4] = { 0x00, 0x50, 0x54, 0x58 };
+
 static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 	{
 		.val_regs = 0x0000,
 		.irq_regs = 0x0008,
+		.debounce_regs = 0x0040,
 		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x0020,
 		.irq_regs = 0x0028,
+		.debounce_regs = 0x0048,
 		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0070,
 		.irq_regs = 0x0098,
+		.debounce_regs = 0x00b0,
 		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0078,
 		.irq_regs = 0x00e8,
+		.debounce_regs = 0x0100,
 		.names = { "M", "N", "O", "P" },
 	},
 	{
 		.val_regs = 0x0080,
 		.irq_regs = 0x0118,
+		.debounce_regs = 0x0130,
 		.names = { "Q", "R", "S", "T" },
 	},
 	{
 		.val_regs = 0x0088,
 		.irq_regs = 0x0148,
+		.debounce_regs = 0x0160,
 		.names = { "U", "V", "W", "X" },
 	},
 	{
 		.val_regs = 0x01E0,
 		.irq_regs = 0x0178,
+		.debounce_regs = 0x0190,
 		.names = { "Y", "Z", "AA", "AB" },
 	},
 	{
 		.val_regs = 0x01E8,
 		.irq_regs = 0x01A8,
+		.debounce_regs = 0x01c0,
 		.names = { "AC", "", "", "" },
 	},
 };
@@ -99,6 +129,13 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 #define GPIO_IRQ_TYPE2	0x0c
 #define GPIO_IRQ_STATUS	0x10
 
+#define GPIO_DEBOUNCE_SEL1 0x00
+#define GPIO_DEBOUNCE_SEL2 0x04
+
+#define _GPIO_SET_DEBOUNCE(t, o, i) ((!!((t) & BIT(i))) << GPIO_OFFSET(o))
+#define GPIO_SET_DEBOUNCE1(t, o) _GPIO_SET_DEBOUNCE(t, o, 1)
+#define GPIO_SET_DEBOUNCE2(t, o) _GPIO_SET_DEBOUNCE(t, o, 0)
+
 static const struct aspeed_gpio_bank *to_bank(unsigned int offset)
 {
 	unsigned int bank = GPIO_BANK(offset);
@@ -144,6 +181,7 @@ static inline bool have_input(struct aspeed_gpio *gpio, unsigned int offset)
 }
 
 #define have_irq(g, o) have_input((g), (o))
+#define have_debounce(g, o) have_input((g), (o))
 
 static inline bool have_output(struct aspeed_gpio *gpio, unsigned int offset)
 {
@@ -506,6 +544,227 @@ static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	pinctrl_free_gpio(chip->base + offset);
 }
 
+static inline void __iomem *bank_debounce_reg(struct aspeed_gpio *gpio,
+		const struct aspeed_gpio_bank *bank,
+		unsigned int reg)
+{
+	return gpio->base + bank->debounce_regs + reg;
+}
+
+static int usecs_to_cycles(struct aspeed_gpio *gpio, unsigned long usecs,
+		u32 *cycles)
+{
+	u64 rate;
+	u64 n;
+	u32 r;
+
+	rate = clk_get_rate(gpio->clk);
+	if (!rate)
+		return -ENOTSUPP;
+
+	n = rate * usecs;
+	r = do_div(n, 1000000);
+
+	if (n >= U32_MAX)
+		return -ERANGE;
+
+	/* At least as long as the requested time */
+	*cycles = n + (!!r);
+
+	return 0;
+}
+
+/* Call under gpio->lock */
+static int register_allocated_timer(struct aspeed_gpio *gpio,
+		unsigned int offset, unsigned int timer)
+{
+	if (WARN(gpio->offset_timer[offset] != 0,
+				"Offset %d already allocated timer %d\n",
+				offset, gpio->offset_timer[offset]))
+		return -EINVAL;
+
+	if (WARN(gpio->timer_users[timer] == UINT_MAX,
+				"Timer user count would overflow\n"))
+		return -EPERM;
+
+	gpio->offset_timer[offset] = timer;
+	gpio->timer_users[timer]++;
+
+	return 0;
+}
+
+/* Call under gpio->lock */
+static int unregister_allocated_timer(struct aspeed_gpio *gpio,
+		unsigned int offset)
+{
+	if (WARN(gpio->offset_timer[offset] == 0,
+				"No timer allocated to offset %d\n", offset))
+		return -EINVAL;
+
+	if (WARN(gpio->timer_users[gpio->offset_timer[offset]] == 0,
+				"No users recorded for timer %d\n",
+				gpio->offset_timer[offset]))
+		return -EINVAL;
+
+	gpio->timer_users[gpio->offset_timer[offset]]--;
+	gpio->offset_timer[offset] = 0;
+
+	return 0;
+}
+
+/* Call under gpio->lock */
+static inline bool timer_allocation_registered(struct aspeed_gpio *gpio,
+		unsigned int offset)
+{
+	return gpio->offset_timer[offset] > 0;
+}
+
+/* Call under gpio->lock */
+static void configure_timer(struct aspeed_gpio *gpio, unsigned int offset,
+		unsigned int timer)
+{
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	const u32 mask = GPIO_BIT(offset);
+	void __iomem *addr;
+	u32 val;
+
+	addr = bank_debounce_reg(gpio, bank, GPIO_DEBOUNCE_SEL1);
+	val = ioread32(addr);
+	iowrite32((val & ~mask) | GPIO_SET_DEBOUNCE1(timer, offset), addr);
+
+	addr = bank_debounce_reg(gpio, bank, GPIO_DEBOUNCE_SEL2);
+	val = ioread32(addr);
+	iowrite32((val & ~mask) | GPIO_SET_DEBOUNCE2(timer, offset), addr);
+}
+
+static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
+				    unsigned long usecs)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
+	u32 requested_cycles;
+	unsigned long flags;
+	int rc;
+	int i;
+
+	rc = usecs_to_cycles(gpio, usecs, &requested_cycles);
+	if (rc < 0) {
+		dev_warn(chip->parent, "Failed to convert %luus to cycles at %luHz: %d\n",
+				usecs, clk_get_rate(gpio->clk), rc);
+		return rc;
+	}
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	if (timer_allocation_registered(gpio, offset)) {
+		rc = unregister_allocated_timer(gpio, offset);
+		if (rc < 0)
+			goto out;
+	}
+
+	/* Try to find a timer already configured for the debounce period */
+	for (i = 1; i < ARRAY_SIZE(debounce_timers); i++) {
+		u32 cycles;
+
+		cycles = ioread32(gpio->base + debounce_timers[i]);
+		if (requested_cycles == cycles)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(debounce_timers)) {
+		int j;
+
+		/*
+		 * As there are no timers configured for the requested debounce
+		 * period, find an unused timer instead
+		 */
+		for (j = 1; j < ARRAY_SIZE(gpio->timer_users); j++) {
+			if (gpio->timer_users[j] == 0)
+				break;
+		}
+
+		if (j == ARRAY_SIZE(gpio->timer_users)) {
+			dev_warn(chip->parent,
+					"Debounce timers exhausted, cannot debounce for period %luus\n",
+					usecs);
+
+			rc = -EPERM;
+
+			/*
+			 * We already adjusted the accounting to remove @offset
+			 * as a user of its previous timer, so also configure
+			 * the hardware so @offset has timers disabled for
+			 * consistency.
+			 */
+			configure_timer(gpio, offset, 0);
+			goto out;
+		}
+
+		i = j;
+
+		iowrite32(requested_cycles, gpio->base + debounce_timers[i]);
+	}
+
+	if (WARN(i == 0, "Cannot register index of disabled timer\n")) {
+		rc = -EINVAL;
+		goto out;
+	}
+
+	register_allocated_timer(gpio, offset, i);
+	configure_timer(gpio, offset, i);
+
+out:
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return rc;
+}
+
+static int disable_debounce(struct gpio_chip *chip, unsigned int offset)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	rc = unregister_allocated_timer(gpio, offset);
+	if (!rc)
+		configure_timer(gpio, offset, 0);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return rc;
+}
+
+static int set_debounce(struct gpio_chip *chip, unsigned int offset,
+				    unsigned long usecs)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
+
+	if (!have_debounce(gpio, offset))
+		return -ENOTSUPP;
+
+	if (usecs)
+		return enable_debounce(chip, offset, usecs);
+
+	return disable_debounce(chip, offset);
+}
+
+static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				  unsigned long config)
+{
+	unsigned long param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
+
+	if (param == PIN_CONFIG_INPUT_DEBOUNCE)
+		return set_debounce(chip, offset, arg);
+	else if (param == PIN_CONFIG_BIAS_DISABLE ||
+			param == PIN_CONFIG_BIAS_PULL_DOWN ||
+			param == PIN_CONFIG_DRIVE_STRENGTH)
+		return pinctrl_gpio_set_config(offset, config);
+
+	return -ENOTSUPP;
+}
+
 /*
  * Any banks not specified in a struct aspeed_bank_props array are assumed to
  * have the properties:
@@ -565,8 +824,16 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	if (!gpio_id)
 		return -EINVAL;
 
+	gpio->clk = of_clk_get(pdev->dev.of_node, 0);
+	if (IS_ERR(gpio->clk)) {
+		dev_warn(&pdev->dev,
+				"No HPLL clock phandle provided, debouncing disabled\n");
+		gpio->clk = NULL;
+	}
+
 	gpio->config = gpio_id->data;
 
+	gpio->chip.parent = &pdev->dev;
 	gpio->chip.ngpio = gpio->config->nr_gpios;
 	gpio->chip.parent = &pdev->dev;
 	gpio->chip.direction_input = aspeed_gpio_dir_in;
@@ -576,6 +843,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.free = aspeed_gpio_free;
 	gpio->chip.get = aspeed_gpio_get;
 	gpio->chip.set = aspeed_gpio_set;
+	gpio->chip.set_config = aspeed_gpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 	gpio->chip.irq_need_valid_mask = true;
@@ -584,6 +852,9 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	if (rc < 0)
 		return rc;
 
+	gpio->offset_timer =
+		devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
+
 	return aspeed_gpio_setup_irqs(gpio, pdev);
 }
 
-- 
2.9.3
