Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDRpk0gmFzDqGH
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 15:29:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SJSYc3vM"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JJnXjZ9A"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 40467209C5;
 Wed,  1 Feb 2017 23:29:15 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 01 Feb 2017 23:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc:x-sasl-enc; s=mesmtp; bh=H29JDo+1H3cRUmnXSNfJq/F38R8
 =; b=SJSYc3vMNJvrVDLrzVrbCldZ9l5hQSbE3mGD2LnkFMi+sDlYZ1xmPhsbdNZ
 RG7mMUywru4qIe6wmu9/NS04uzm6aa+maS2EcI62RpOIPO2dymOIIUTiELl6MA64
 Mk/GYFiFmY1gxM/qN/8nznsrkMCBa3FH2TqY7uFoU9bns5a8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=H2
 9JDo+1H3cRUmnXSNfJq/F38R8=; b=JJnXjZ9Awrf0tGIRo4EUqLndo0xjh9l46P
 8I1M6/fqHdelA+MxLo0DtN02D/8rafGkIeQxSPaYT09T1VE9aOUTYPqKiXHbZrdi
 t1FtqsxDQVvLUhkCdqIWLew06dwI87+3eiIqBudMFdxxV/YWpa1qwUo7/7/+NsZH
 zd5DbF4mw=
X-ME-Sender: <xms:m7WSWIetbdwLUPu34rUrxBknkiApEW93167DC1vmv2upTQNvZjNb1w>
X-Sasl-enc: 8i+BPFgVHNL9IIJ2UQFYyl2g/qNHQcPDbZSwmXRY96pn 1486009754
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB3B6245E2;
 Wed,  1 Feb 2017 23:29:12 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH] gpio: aspeed: Remove dependence on GPIOF_* macros
Date: Thu,  2 Feb 2017 14:58:17 +1030
Message-Id: <20170202042817.8033-1-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 02 Feb 2017 04:29:18 -0000

1736f75d35e47409ad776273133d0f558a4c8253 is a (v2) patch which had
unresolved review comments[1]. Address the comments by removing the use
of macros from the consumer header (this patch represents the diff
between v2 and v3[2]).

[1] https://lkml.org/lkml/2017/1/26/337
[2] https://lkml.org/lkml/2017/1/26/786

Fixes: 1736f75d35e4 ("gpio: aspeed: Add banks Y, Z, AA, AB and AC")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

Note: This should be applied to pinctrl/devel where the linked GPIO patches
have landed. See discussion at https://lkml.org/lkml/2017/2/1/390

 drivers/gpio/gpio-aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 6e4b278a82f1..fb16cc771c0d 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -15,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/pinctrl/consumer.h>
 
@@ -259,10 +258,10 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	u32 val;
 
 	if (!have_input(gpio, offset))
-		return GPIOF_DIR_OUT;
+		return 0;
 
 	if (!have_output(gpio, offset))
-		return GPIOF_DIR_IN;
+		return 1;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
-- 
2.9.3
