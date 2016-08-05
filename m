Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s5Qvv05d2zDqCZ
 for <openbmc@lists.ozlabs.org>; Fri,  5 Aug 2016 22:23:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=XJmP2Kga; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=KIxZnVXr; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0E5D620656;
 Fri,  5 Aug 2016 08:23:52 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Fri, 05 Aug 2016 08:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-sasl-enc:x-sasl-enc; s=
 mesmtp; bh=BQx9VFNe7qpcHuJQN+9cafmp1Sk=; b=XJmP2Kga9ZiN+PWInCMbb
 40nASlEWY2ucIdepW5ste/XtNAS7F9PhUOh0ySD779rPTXZTVu+rcMkIpEPD5b+t
 RUNFlP72f0PMxYPo7FJQqnParaLO9SvqwHLWnkcouJIVmkoZ3M09tq+MJCSSfW/D
 jFbZ6cwh/luSRZULvaZBxE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-sasl-enc:x-sasl-enc; s=smtpout; bh=BQx9VFNe7qpcHuJQN+9cafmp1S
 k=; b=KIxZnVXrr03fqLbWveqoz+XRCy3bXof66tqMDJGgQrNhMoSAYlCKlsjNrR
 h3sqylhSdrIxZ1OOncypUxNOh2uL53dnfeimkOUrAtN7ZN6K65N6AaJRr9PBnGnh
 GqW5iWPhlXJOR7kC/RRF639gne4CkjTgPwZugu9yLwA9FnKCs=
X-Sasl-enc: U/n7PGTzQLRaOrfk6maX/5leTLwaFm8H9LCsjnwRUlXz 1470399831
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id E6A4CCCDA7;
 Fri,  5 Aug 2016 08:23:49 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: johnhcwang <hsienchiang@gmail.com>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] gpio-aspeed: Write value on switch to output
Date: Fri,  5 Aug 2016 21:53:36 +0930
Message-Id: <20160805122336.6836-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.2.597.g66765a4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Aug 2016 12:23:56 -0000

[0] notes that the Barreleye beep LED turned off during boot despite
configuring the default-state DT property to "on". The documentation for the
direction_output() callback in struct gpio_chip doesn't make any mention of
setting values[1] but the function prototype takes a value as a formal
parameter. Additionally, other drivers' callback implementations (e.g. the
gemini GPIO driver) write out the provided value.

Make the Aspeed GPIO driver implementation consistent with the expected
behaviour.

[0] https://github.com/openbmc/linux/issues/98
[1] "@direction_output: configures signal "offset" as output, or returns error"

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 2ecaa2b12759..7817b98fe8cd 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -120,23 +120,29 @@ static int aspeed_gpio_get(struct gpio_chip *gc, unsigned int offset)
 			& GPIO_BIT(offset));
 }
 
-static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			    int val)
+static void __aspeed_gpio_set(void __iomem *addr, unsigned int offset, int val)
 {
-	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
-	unsigned long flags;
 	u32 reg;
 
-	spin_lock_irqsave(&gpio->lock, flags);
-
-	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DATA));
+	reg = ioread32(addr);
 	if (val)
 		reg |= GPIO_BIT(offset);
 	else
 		reg &= ~GPIO_BIT(offset);
 
-	iowrite32(reg, bank_val_reg(gpio, bank, GPIO_DATA));
+	iowrite32(reg, addr);
+}
+
+static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int val)
+{
+	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	__aspeed_gpio_set(bank_val_reg(gpio, bank, GPIO_DATA), offset, val);
 
 	spin_unlock_irqrestore(&gpio->lock, flags);
 }
@@ -163,13 +169,16 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 {
 	struct aspeed_gpio *gpio = to_aspeed_gpio(gc);
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	void __iomem *addr = bank_val_reg(gpio, bank, GPIO_DIR);
 	unsigned long flags;
 	u32 reg;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
-	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
-	iowrite32(reg | GPIO_BIT(offset), bank_val_reg(gpio, bank, GPIO_DIR));
+	reg = ioread32(addr);
+	iowrite32(reg | GPIO_BIT(offset), addr);
+
+	__aspeed_gpio_set(addr, offset, val);
 
 	spin_unlock_irqrestore(&gpio->lock, flags);
 
-- 
2.9.2.597.g66765a4
