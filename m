Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="peVcOU3i"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XLXIWWXs"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH3xG31P4zF0gj
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 09:45:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D9E0E20BEB;
 Wed, 10 Jan 2018 17:45:02 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 10 Jan 2018 17:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HWRsrV4JjNamzGPAn
 bijFJjS34AOz3wjnqnT4BQiU80=; b=peVcOU3i7TMdi0qUd5CYVV22uPEte/0Z3
 3QNiQuyGLn/D0WffZX/iiBf8EKrAAIOUcQ7Z1gULBRMixpb2rP97MwOyRKZ54MHo
 Z/waKz6pd8CuIwEFaowkqMiUop180TipKLMolFIGRvNEG8iD7QoosfWscnuL8nvm
 JLfcrTeD9n2sE1T7FLUVUi0tV3epdnQpd6mxd5M/Sny62rEfrHJUClO6HeN6eKW7
 hKmolzn1d9wbAnDQhiKB6ayu4SZaOnbd4q8G03iva4S2IVM1TBuG2XuRLWFRgqh/
 WUsJkT733Fw7ul34xZ4iIJEEcPW7dVX3E9dTIYFaop6nAxAoibnQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HWRsrV4JjNamzGPAnbijFJjS34AOz3wjnqnT4BQiU80=; b=XLXIWWXs
 NepRPIqyGfP4Qh6NedyAF2CnCg1cSIyTdXPLmZxZ6JF88X2icy5njrLHjA8nFBob
 Micuzbhb0i594PL9ztbEP0/WNWsuIjhS+xssedkJCmUUb7R0oicZbdv56qR9cbSh
 4ebmKQUsoNF+EJE2RvDGQEi4lkGiXIE1ZSz3dDmNVbTIVldWeB52anTYazsidc19
 b2uWZDlPZ4fjJ2gZmE2I4reXtQPay/0TTX3/w0GCdJt4RJ2URmiGgf8WABdp6cbD
 DYmKmZ0vL0YCA85a45mMg9JsZbYS3wDBxDO72Ug+KH0db79sirHl74Pd+YTe0DqP
 8lLDhUhGGQHcrw==
X-ME-Sender: <xms:bpdWWiCUie7Ik0kLxuE8p4EyvrzGehByy12YbGkz33tGwxOLcRDNWA>
Received: from dave.google.com (unknown [104.133.8.110])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2FCA724802;
 Wed, 10 Jan 2018 17:45:02 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Laxman Dewangan <ldewangan@nvidia.com>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.10 2/4] gpio: core: Decouple open drain/source
 flag with active low/high
Date: Wed, 10 Jan 2018 14:44:12 -0800
Message-Id: <20180110224414.21516-3-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 10 Jan 2018 22:45:07 -0000

From: Laxman Dewangan <ldewangan@nvidia.com>

Currently, the GPIO interface is said to Open Drain if it is Single
Ended and active LOW. Similarly, it is said as Open Source if it is
Single Ended and active HIGH.

The active HIGH/LOW is used in the interface for setting the pin
state to HIGH or LOW when enabling/disabling the interface.

In Open Drain interface, pin is set to HIGH by putting pin in
high impedance and LOW by driving to the LOW.

In Open Source interface, pin is set to HIGH by driving pin to
HIGH and set to LOW by putting pin in high impedance.

With above, the Open Drain/Source is unrelated to the active LOW/HIGH
in interface. There is interface where the enable/disable of interface
is ether active LOW or HIGH but it is Open Drain type.

Hence decouple the Open Drain with Single Ended + Active LOW and
Open Source with Single Ended + Active HIGH.

Adding different flag for the Open Drain/Open Source which is valid
only when Single ended flag is enabled.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(cherry picked from commit 4c0facddb7d88c78c8bd977c16faa647f079ccda)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpiolib-of.c       |  2 +-
 drivers/gpio/gpiolib.c          |  4 +++-
 include/dt-bindings/gpio/gpio.h | 12 ++++++++----
 include/linux/of_gpio.h         |  1 +
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 92b185f19232..ebe82758e768 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -147,7 +147,7 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 		*flags |= GPIO_ACTIVE_LOW;
 
 	if (of_flags & OF_GPIO_SINGLE_ENDED) {
-		if (of_flags & OF_GPIO_ACTIVE_LOW)
+		if (of_flags & OF_GPIO_OPEN_DRAIN)
 			*flags |= GPIO_OPEN_DRAIN;
 		else
 			*flags |= GPIO_OPEN_SOURCE;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 024f3a8bbf3b..e4796fbaeb4b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3347,6 +3347,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 	unsigned long lflags = 0;
 	bool active_low = false;
 	bool single_ended = false;
+	bool open_drain = false;
 	int ret;
 
 	if (!fwnode)
@@ -3360,6 +3361,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 		if (!IS_ERR(desc)) {
 			active_low = flags & OF_GPIO_ACTIVE_LOW;
 			single_ended = flags & OF_GPIO_SINGLE_ENDED;
+			open_drain = flags & OF_GPIO_OPEN_DRAIN;
 		}
 	} else if (is_acpi_node(fwnode)) {
 		struct acpi_gpio_info info;
@@ -3380,7 +3382,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 		lflags |= GPIO_ACTIVE_LOW;
 
 	if (single_ended) {
-		if (active_low)
+		if (open_drain)
 			lflags |= GPIO_OPEN_DRAIN;
 		else
 			lflags |= GPIO_OPEN_SOURCE;
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index c673d2c87c60..b4f54da694eb 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -17,11 +17,15 @@
 #define GPIO_PUSH_PULL 0
 #define GPIO_SINGLE_ENDED 2
 
+/* Bit 2 express Open drain or open source */
+#define GPIO_LINE_OPEN_SOURCE 0
+#define GPIO_LINE_OPEN_DRAIN 4
+
 /*
- * Open Drain/Collector is the combination of single-ended active low,
- * Open Source/Emitter is the combination of single-ended active high.
+ * Open Drain/Collector is the combination of single-ended open drain interface.
+ * Open Source/Emitter is the combination of single-ended open source interface.
  */
-#define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_ACTIVE_LOW)
-#define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_ACTIVE_HIGH)
+#define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
+#define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_SOURCE)
 
 #endif
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 3f87ea5b8bee..1e089d5a182b 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -30,6 +30,7 @@ struct device_node;
 enum of_gpio_flags {
 	OF_GPIO_ACTIVE_LOW = 0x1,
 	OF_GPIO_SINGLE_ENDED = 0x2,
+	OF_GPIO_OPEN_DRAIN = 0x4,
 };
 
 #ifdef CONFIG_OF_GPIO
-- 
2.14.1
