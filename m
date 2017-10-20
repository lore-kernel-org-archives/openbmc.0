Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="muVfYOw0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rXmEXnC+"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJBNg4JcCzDqRQ;
 Fri, 20 Oct 2017 14:38:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7520E20BF1;
 Thu, 19 Oct 2017 23:38:57 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 19 Oct 2017 23:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yoh1CaMONAFLRi9+P
 fS7AYrUFtUqN1k3CcqjucPe+oE=; b=muVfYOw0VJMaksowju739fQcrv/zSnELc
 mFrJzveWv65I1ek8uFXSAUZd/+iQqrEtF87x8hLd+JMP5EMLTJ5MRECqrWT8UR+T
 oOn7GR7M/tC5OlrzgH2JBs61PcvKYg2krVzXUQdyHjmIK7InX/nMrwBnSVMjb7mc
 CdaYHOo4jKmu1qDF9L/tUbksqgroCVEYJ33gnbdb9PTzo4XwpKrTS9rxfEt45w5/
 41Hps95q05Gl8CzBpxuQIYK+JXkHyb9w7ZT4N01HRgjAmEX3SJKFqg35yqwLX5Tg
 a79tlYrE/O6XWac8u0LYRgS4xxSFma078DwoOKo7ogFWeQlgQVk9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=yoh1CaMONAFLRi9+PfS7AYrUFtUqN1k3CcqjucPe+oE=; b=rXmEXnC+
 dbOQTLIZWBov0WKudlp3a9cXmumZubDe18806lEMg9SfejtJ+WLcTGtjcqgkK27T
 vvA4jzTnNTg6HEw0vOuXKFPqt9A8hNijIxaUJFc+J2UH+42Vfpi2LbY0RkYdVX7W
 a2Gc/KDeWRa843Oyv7enQI0bygPIRIPs2uMVPSD6Xo1wFGhR2NQQay/VUeSdAIpR
 vxXFi/1Q/xUJG9nk9RcxxP6OHGUQ+UPIbIoCQeSOnO3vW4LOy86rvYxEX2Mcyasz
 MQv9CWjSHcijSIBuFwk24HQx4WrC7vZhvrIOO2aMbVTNjfj1Culo4evNqZcvZKza
 KKMDhK5UqKom9Q==
X-ME-Sender: <xms:0W_pWcqclTvcDKfC1LTssIA85VROm4Bev7hqi_HNRfO5tx6Zhx1p6w>
Received: from keelia.lan (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0ADBA2489B;
 Thu, 19 Oct 2017 23:38:51 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, corbet@lwn.net,
 joel@jms.id.au, ryan_chen@aspeedtech.com, robh+dt@kernel.org,
 frowand.list@gmail.com, ckeepax@opensource.wolfsonmicro.com,
 ldewangan@nvidia.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [RFC PATCH 5/5] gpio: aspeed: Add support for reset tolerance
Date: Fri, 20 Oct 2017 14:07:27 +1030
Message-Id: <20171020033727.21557-6-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171020033727.21557-1-andrew@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 20 Oct 2017 03:39:00 -0000

Use the new pinconf parameter for reset tolerance to expose the
associated capability of the Aspeed GPIO controller.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index bfc53995064a..0492cd917178 100644
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
@@ -768,6 +801,8 @@ static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 			param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
 		/* Return -ENOTSUPP to trigger emulation, as per datasheet */
 		return -ENOTSUPP;
+	else if (param == PIN_CONFIG_RESET_TOLERANT)
+		return aspeed_gpio_reset_tolerance(chip, offset, arg);
 
 	return -ENOTSUPP;
 }
-- 
2.11.0
