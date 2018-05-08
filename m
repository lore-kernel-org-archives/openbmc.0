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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40g1ZR43cTzF1mw
 for <openbmc@lists.ozlabs.org>; Tue,  8 May 2018 11:08:13 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4816hrO022397;
 Mon, 7 May 2018 20:06:52 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH linux dev-4.13 1/6] gpio/aspeed: Set output latch before
 changing direction
Date: Tue,  8 May 2018 11:06:35 +1000
Message-Id: <20180508010640.14113-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
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
X-List-Received-Date: Tue, 08 May 2018 01:08:19 -0000

In aspeed_gpio_dir_out(), we need to establish the new output
value in the output latch *before* we change the direction
to output in order to avoid a glitch on the output line if
the previous value of the latch was different.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/gpio/gpio-aspeed.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 67f3eae3b550..ac54b9b25f74 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -287,11 +287,10 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
+	__aspeed_gpio_set(gc, offset, val);
 	reg = ioread32(bank_val_reg(gpio, bank, GPIO_DIR));
 	iowrite32(reg | GPIO_BIT(offset), bank_val_reg(gpio, bank, GPIO_DIR));
 
-	__aspeed_gpio_set(gc, offset, val);
-
 	spin_unlock_irqrestore(&gpio->lock, flags);
 
 	return 0;
-- 
2.17.0
