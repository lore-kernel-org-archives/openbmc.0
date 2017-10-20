Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mjIwLowF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Q6NJwZmh"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJBNL1gbYzDqBc;
 Fri, 20 Oct 2017 14:38:42 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 389A520F98;
 Thu, 19 Oct 2017 23:38:40 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 19 Oct 2017 23:38:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+/U+i58U0yt6M3/Wv
 4Mvsf8+TWrJQfxSm+GG6W2R0Qc=; b=mjIwLowF0qaOFSLIAjBfRj10cdsz6Myp3
 gUILfTN7wR309mS3EIW3PXVVhaC2b6mp5vVl772AzuZLBM3y44h+2DXsvSqerSPW
 BFhOAOWKCD2KyiUkqoOsGqdl0f3Ga4xc/c9ZMpJ/cZzrHu77jN+NR/xJ4iHP18nl
 CYJ9crgtbQoIUsryv+Y4BbPAFvJL5fv1RxQiyyDOtA3wfUTwlLavxWpgHx8P6DJ+
 1BUQMOr44ttUgGohlH2CfeF/EU38sQrJjNUjFe5fAYR0vzDF6bDq73ngsO6Rlgdt
 uNpaMJXW2bMyFYZOfpFWvV8eUhz7nnN2EO8xRBbjVk5p8rGguQkqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+/U+i58U0yt6M3/Wv4Mvsf8+TWrJQfxSm+GG6W2R0Qc=; b=Q6NJwZmh
 tRJ5aF0b4R8+b1gj7RWobU8ZeqvoqAJHv3kGo0BfdHzcISKuSIboJRF6GXzYKBbI
 gq3AVtbNXX/yM/sYkVX7gf0i3NFV2hET+ZWe1im2B9VGUA+Dq2UwFh3zPj1u7idm
 zAvdn0bQWe2Qx8PbaprYdU67czHtb61AW9xBiRQguMw/5HXsSts8thSd95USIpTz
 tEGy+Q0IERw98O0/Ollphl6vY4B82jDFBLCdf9Cjv/oVYtpOR/4KFOlb0oSUbB8H
 Jg3YkVLqouaHI/DpHsDazmhxFdjvs1RN5wwt3Um7tzeznlTrTc/97/uTPlHAxY1n
 6JLYCK1CZnLT/w==
X-ME-Sender: <xms:wG_pWREL9GttJ1Ey5Xv-Yo4oZMyaWAFIxwW_W57UxbyZMsEY88ND5A>
Received: from keelia.lan (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id B43132489B;
 Thu, 19 Oct 2017 23:38:34 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, corbet@lwn.net,
 joel@jms.id.au, ryan_chen@aspeedtech.com, robh+dt@kernel.org,
 frowand.list@gmail.com, ckeepax@opensource.wolfsonmicro.com,
 ldewangan@nvidia.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [RFC PATCH 2/5] gpio: gpiolib: Add OF support for maintaining GPIO
 values on reset
Date: Fri, 20 Oct 2017 14:07:24 +1030
Message-Id: <20171020033727.21557-3-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 20 Oct 2017 03:38:42 -0000

Add flags and the associated flag mappings between interfaces to enable
GPIO reset tolerance to be specified via devicetree.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpiolib-of.c       | 2 ++
 drivers/gpio/gpiolib.c          | 5 +++++
 include/dt-bindings/gpio/gpio.h | 4 ++++
 include/linux/of_gpio.h         | 1 +
 4 files changed, 12 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index e0d59e61b52f..4a268ba52998 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -155,6 +155,8 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 
 	if (of_flags & OF_GPIO_SLEEP_MAY_LOSE_VALUE)
 		*flags |= GPIO_SLEEP_MAY_LOSE_VALUE;
+	if (of_flags & OF_GPIO_RESET_TOLERANT)
+		*flags |= GPIO_RESET_TOLERANT;
 
 	return desc;
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d9dc7e588699..6b4c5df10e84 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3434,6 +3434,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 	bool active_low = false;
 	bool single_ended = false;
 	bool open_drain = false;
+	bool reset_tolerant = false;
 	int ret;
 
 	if (!fwnode)
@@ -3448,6 +3449,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 			active_low = flags & OF_GPIO_ACTIVE_LOW;
 			single_ended = flags & OF_GPIO_SINGLE_ENDED;
 			open_drain = flags & OF_GPIO_OPEN_DRAIN;
+			reset_tolerant = flags & OF_GPIO_RESET_TOLERANT;
 		}
 	} else if (is_acpi_node(fwnode)) {
 		struct acpi_gpio_info info;
@@ -3478,6 +3480,9 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 			lflags |= GPIO_OPEN_SOURCE;
 	}
 
+	if (reset_tolerant)
+		lflags |= GPIO_RESET_TOLERANT;
+
 	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
 	if (ret < 0) {
 		gpiod_put(desc);
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index 70de5b7a6c9b..01c75d9e308e 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -32,4 +32,8 @@
 #define GPIO_SLEEP_MAINTAIN_VALUE 0
 #define GPIO_SLEEP_MAY_LOSE_VALUE 8
 
+/* Bit 4 express GPIO persistence on reset */
+#define GPIO_RESET_INTOLERANT 0
+#define GPIO_RESET_TOLERANT 16
+
 #endif
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 1fe205582111..9b34737706a7 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -32,6 +32,7 @@ enum of_gpio_flags {
 	OF_GPIO_SINGLE_ENDED = 0x2,
 	OF_GPIO_OPEN_DRAIN = 0x4,
 	OF_GPIO_SLEEP_MAY_LOSE_VALUE = 0x8,
+	OF_GPIO_RESET_TOLERANT = 0x16,
 };
 
 #ifdef CONFIG_OF_GPIO
-- 
2.11.0
