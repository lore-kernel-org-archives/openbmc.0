Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40g1ZF5MdjzF1fk
 for <openbmc@lists.ozlabs.org>; Tue,  8 May 2018 11:08:04 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4816hrP022397;
 Mon, 7 May 2018 20:07:07 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH linux dev-4.13 2/6] gpio/aspeed: Use a cache of output data
 registers
Date: Tue,  8 May 2018 11:06:36 +1000
Message-Id: <20180508010640.14113-2-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180508010640.14113-1-benh@kernel.crashing.org>
References: <20180508010640.14113-1-benh@kernel.crashing.org>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 08 May 2018 01:08:09 -0000

The current driver does a read/modify/write of the output
registers when changing a bit in __aspeed_gpio_set().

This is sub-optimal for a couple of reasons:

  - If any of the neighbouring GPIOs (sharing the shared
register) isn't (yet) configured as an output, it will
read the current input value, and then apply it to the
output latch, which may not be what the user expects. There
should be no bug in practice as aspeed_gpio_dir_out() will
establish a new value but it's not great either.

  - The GPIO block in the aspeed chip is clocked rather
slowly (typically 25Mhz). That extra MMIO read halves the maximum
speed at which we can toggle the GPIO.

This provides a significant performance improvement to the GPIO
based FSI master.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/gpio/gpio-aspeed.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index ac54b9b25f74..a62cbf3ed4a8 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -54,6 +54,8 @@ struct aspeed_gpio {
 	u8 *offset_timer;
 	unsigned int timer_users[4];
 	struct clk *clk;
+
+	u32 *dcache;
 };
 
 struct aspeed_gpio_bank {
@@ -231,12 +233,13 @@ static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	u32 reg;
 
 	addr = bank_val_reg(gpio, bank, GPIO_DATA);
-	reg = ioread32(addr);
+	reg = gpio->dcache[GPIO_BANK(offset)];
 
 	if (val)
 		reg |= GPIO_BIT(offset);
 	else
 		reg &= ~GPIO_BIT(offset);
+	gpio->dcache[GPIO_BANK(offset)] = reg;
 
 	iowrite32(reg, addr);
 }
@@ -848,7 +851,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	const struct of_device_id *gpio_id;
 	struct aspeed_gpio *gpio;
 	struct resource *res;
-	int rc;
+	int rc, i, banks;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -889,6 +892,20 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = -1;
 	gpio->chip.irq_need_valid_mask = true;
 
+	/* Allocate a cache of the output registers */
+	banks = gpio->config->nr_gpios >> 5;
+	gpio->dcache = devm_kzalloc(&pdev->dev,
+				    sizeof(u32) * banks, GFP_KERNEL);
+	if (!gpio->dcache)
+		return -ENOMEM;
+
+	/* Populate it with initial values read from the HW */
+	for (i = 0; i < banks; i++) {
+		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
+		gpio->dcache[i] = ioread32(gpio->base + bank->val_regs +
+					   GPIO_DATA);
+	}
+
 	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
 	if (rc < 0)
 		return rc;
-- 
2.17.0
