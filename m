Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dRZdIck9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YN9RqfpB"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH3xG2z70zF0gV
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 09:45:06 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D0AF20C6E;
 Wed, 10 Jan 2018 17:45:04 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 10 Jan 2018 17:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Vr3buhyuvjIbVlDzy
 FZlWN4Jms/nvbi2hRT10V7LQK0=; b=dRZdIck9tVciotP3jI67Fc71BYRWQbl2I
 i9bsPvPamV6j19R6X9o+Uk/AM0NZJM7jsLKnkNXKETphpg+D0jU8N8ntc2kxxUzN
 TYqT43zXfWHTDlChPfe6On5W+DgoqnCcfs5JLrwVrNYkneOZf1E9LTsxH4ykwUjm
 J8p4WiJEfS9+81XAx7QXGzUgoyyAZ956NSpG/Jfs5aq8FBcaME7g//Dto8kp6ysq
 Uyl8MdgYqPskpm8xcRf24DqNruhsMyGQEvY2ArSYghj6pS+cKbcTI0ofBvQG6QN2
 +DXVNW8MpcGqzZrbdq9S4hFMrJ51G2O1r+SuqIGAHgn7omHgqfhvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Vr3buhyuvjIbVlDzyFZlWN4Jms/nvbi2hRT10V7LQK0=; b=YN9RqfpB
 GMNnbj6zjtX6TWsovXU5a4WII0RWOOxRJKXKxge9tZVRFUssXK4PRxjcnOFWVzQi
 oaP8cFkdNPSrhAajwJOkVFOfC5zyPBkDZ1y2i1GhcO+XzXlUVJju/D3OP7d1W8iV
 xMnIReIzNLItGNzAgOdE5Nbrc0xhwoloM3EI+RIMSlV9kZGqPk5s9FERPjFTgpcy
 NKxMKocRrl2c55le5MJdZJ+eF4Up2MgKPt0NDNLgLhet/jBnEbeLxL+x17Zr8S1a
 Lj9DZZvE9ISEGkzoUEm4ywpFIe0tGrBV0X21E1jjLsplkMXG5Cwc5vp4n7wLIb/S
 JdE8cQrdwdprtA==
X-ME-Sender: <xms:cJdWWqhEhkoKZeCSu9oLJ44NuFCXg8wPiqTjtudiQ0KiZtT_199-rg>
Received: from dave.google.com (unknown [104.133.8.110])
 by mail.messagingengine.com (Postfix) with ESMTPA id 78D8E24805;
 Wed, 10 Jan 2018 17:45:03 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 4/4] gpio: aspeed: Add support for reset
 tolerance
Date: Wed, 10 Jan 2018 14:44:14 -0800
Message-Id: <20180110224414.21516-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180110224414.21516-1-andrew@aj.id.au>
References: <20180110224414.21516-1-andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jan 2018 22:45:08 -0000

Use the new pinconf parameter for state persistence to expose the
associated capability of the Aspeed GPIO controller.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(cherry picked from commit 1b43d26985745901c87e0dca44c9b57896062306)
---
 drivers/gpio/gpio-aspeed.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index ccea609676ee..97e083aadc16 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -60,6 +60,7 @@ struct aspeed_gpio_bank {
 	uint16_t	val_regs;
 	uint16_t	irq_regs;
 	uint16_t	debounce_regs;
+	uint16_t	tolerance_regs;
 	const char	names[4][3];
 };
 
@@ -70,48 +71,56 @@ static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 		.val_regs = 0x0000,
 		.irq_regs = 0x0008,
 		.debounce_regs = 0x0040,
+		.tolerance_regs = 0x001c,
 		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x0020,
 		.irq_regs = 0x0028,
 		.debounce_regs = 0x0048,
+		.tolerance_regs = 0x003c,
 		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0070,
 		.irq_regs = 0x0098,
 		.debounce_regs = 0x00b0,
+		.tolerance_regs = 0x00ac,
 		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0078,
 		.irq_regs = 0x00e8,
 		.debounce_regs = 0x0100,
+		.tolerance_regs = 0x00fc,
 		.names = { "M", "N", "O", "P" },
 	},
 	{
 		.val_regs = 0x0080,
 		.irq_regs = 0x0118,
 		.debounce_regs = 0x0130,
+		.tolerance_regs = 0x012c,
 		.names = { "Q", "R", "S", "T" },
 	},
 	{
 		.val_regs = 0x0088,
 		.irq_regs = 0x0148,
 		.debounce_regs = 0x0160,
+		.tolerance_regs = 0x015c,
 		.names = { "U", "V", "W", "X" },
 	},
 	{
 		.val_regs = 0x01E0,
 		.irq_regs = 0x0178,
 		.debounce_regs = 0x0190,
+		.tolerance_regs = 0x018c,
 		.names = { "Y", "Z", "AA", "AB" },
 	},
 	{
-		.val_regs = 0x01E8,
-		.irq_regs = 0x01A8,
+		.val_regs = 0x01e8,
+		.irq_regs = 0x01a8,
 		.debounce_regs = 0x01c0,
+		.tolerance_regs = 0x01bc,
 		.names = { "AC", "", "", "" },
 	},
 };
@@ -531,6 +540,30 @@ static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
 	return 0;
 }
 
+static int aspeed_gpio_reset_tolerance(struct gpio_chip *chip,
+					unsigned int offset, bool enable)
+{
+	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
+	const struct aspeed_gpio_bank *bank;
+	unsigned long flags;
+	u32 val;
+
+	bank = to_bank(offset);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+	val = readl(gpio->base + bank->tolerance_regs);
+
+	if (enable)
+		val |= GPIO_BIT(offset);
+	else
+		val &= ~GPIO_BIT(offset);
+
+	writel(val, gpio->base + bank->tolerance_regs);
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+
 static int aspeed_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	if (!have_gpio(gpiochip_get_data(chip), offset))
@@ -765,6 +798,8 @@ static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 			param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
 		/* Return -ENOTSUPP to trigger emulation, as per datasheet */
 		return -ENOTSUPP;
+	else if (param == PIN_CONFIG_PERSIST_STATE)
+		return aspeed_gpio_reset_tolerance(chip, offset, arg);
 
 	return -ENOTSUPP;
 }
-- 
2.14.1
