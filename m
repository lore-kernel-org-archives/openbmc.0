Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Tuf3SqXc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JQLz9DPr"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynNqC5XVjzDrpm;
 Thu, 30 Nov 2017 14:55:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C65B020BF0;
 Wed, 29 Nov 2017 22:55:49 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 29 Nov 2017 22:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TaV5FzSn0wbsy82ZT
 GOaRaiYgcDiQpeDvlrYW3Yjy4s=; b=Tuf3SqXc9lKrokwUEg7kOiS9EoWYJuxqL
 rFV72dj2V+D3L1MsMoxeM46J6hq5nEW3ziXZZBekeHSAXuVkAzE/2KK2FOiZjGal
 x9o/X1mfCboEzlg4uCYOVustVzXJLPAgGJ6d3tbfHB+0HD79biLUX2GQEGuUCFEK
 pKnY8dSUv5n2EzeEc7kx48oMrpjFOfvHvE5Q2IHuAkGTcwxVxgQpu4iKEg82tJMl
 wCbEM94qgv6ZPcP35oWLRpJsA0PRSvSdR8WsDSyr44z3w1pGwANKak+sMQr+fkeO
 IkBBeBh+MFbI5KtVl1hPeRuMl/K74cAw5+xPm9JZXF9BF04RZz0Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TaV5FzSn0wbsy82ZTGOaRaiYgcDiQpeDvlrYW3Yjy4s=; b=JQLz9DPr
 L5omyfiPXy7bEkQrLESn6bfFs9lsVvJCz2QqhOrUTae4mx6PYbvxLMGYUXt5v9U4
 IydNA3QcOjc4lWkmnIldpLmDI7jeD6qp3rhjZ0vt3miOw1o0x5yEzKGGbdnhcm+Q
 LU+3GbUlqCWMIC/t+q5cSfilKjtZoRc8RaEbBGmMBa9ItWwBQ0+KwoekZ8JqcONN
 ir0xgNUs6gL2v2QVDGERE4vVAcIRwY2osplCzbFZFWfFqze4JJXs+LVKjp5GmSWl
 RvnTOqChDELB7GLlnTmhSRXnG8sB4X4G4rKxDQlzxvGZvcOoQz4HTgrRP3gq2PcG
 Te94glVHbTAzyA==
X-ME-Sender: <xms:RYEfWiaDMGbAtCsXDt6ASVm781MXIIZvfoHUeV87nFsk2vD_JZKUCQ>
Received: from dave.aj.id.au (ppp14-2-29-107.bras21.adl4.internode.on.net
 [14.2.29.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 208F8243F9;
 Wed, 29 Nov 2017 22:55:44 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
 robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com,
 joel@jms.id.au, ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com,
 ryan_chen@aspeedtech.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH v4 2/2] gpio: aspeed: Add support for reset tolerance
Date: Thu, 30 Nov 2017 14:25:25 +1030
Message-Id: <20171130035525.29653-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171130035525.29653-1-andrew@aj.id.au>
References: <20171130035525.29653-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 30 Nov 2017 03:55:52 -0000

Use the new pinconf parameter for state persistence to expose the
associated capability of the Aspeed GPIO controller.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpio/gpio-aspeed.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 6b3ca6601af2..30bc97b81bec 100644
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
@@ -534,6 +543,30 @@ static int aspeed_gpio_setup_irqs(struct aspeed_gpio *gpio,
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
@@ -771,6 +804,8 @@ static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 			param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
 		/* Return -ENOTSUPP to trigger emulation, as per datasheet */
 		return -ENOTSUPP;
+	else if (param == PIN_CONFIG_PERSIST_STATE)
+		return aspeed_gpio_reset_tolerance(chip, offset, arg);
 
 	return -ENOTSUPP;
 }
-- 
2.14.1
