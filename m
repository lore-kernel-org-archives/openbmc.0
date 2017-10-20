Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DcwdqxDU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FfmcKGSs"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJBND3M2HzDqBc;
 Fri, 20 Oct 2017 14:38:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 636DC20DA7;
 Thu, 19 Oct 2017 23:38:34 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 19 Oct 2017 23:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=44qfK8ueCz4SYWv/d
 gS7FTT6m50rawmWP+xcfKvWNy4=; b=DcwdqxDUYhBSNSz+OAi/1BKfrbarfrsd1
 5/GZ6Wt63T3Zv/ey9XMX40M+HAejtseR9JzvhojtzOGGphfapL8PfMHy5y8OC2ek
 gKUGXI+r/CNKvqAjkwTdwJuZEhjs0iMfVaXDQ2U7fxuekU0qHKNjYpsZUH0rAOy5
 kinnF6TBJtvRC+J6YUS+QWnyvAKfCwmY3WSF0aXPRT4nRRyoQ7J5O8fs290TIPyk
 +oHvQHl8+S4rfxfQA2konqNEPgjsp6/fH8CzEpPCbC+PnAZzf7LRwAcUMGn3a7Vq
 9Dm8ZGl5Q09Zb5a7dhXpDgyfFfp+bnH/Cu31PUbrlgbmaV6BniMrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=44qfK8ueCz4SYWv/dgS7FTT6m50rawmWP+xcfKvWNy4=; b=FfmcKGSs
 VuxJw/VWxQTruHn+P9W1AO0TyfGGryQc1PkrJGYCIDO/PuaffNka/6yS4fUpcoh2
 3FgO/8BhEXjwAyb42NdEeuje0mbOjkgXbN4ipVhtpBNChpjFTEbQd7CrRy9L07Jo
 hdT5xTLsxlZKwje1MYSOEfjIz4pFTQuogCc8nzcuY22mXGgapNZTjd839RqfQcEq
 u0WzMCBNDpb9X2vM+Zk8ZDBD8RwqnSlxTs8b59BsXQW5fZbgkppZO7i33CmKkCUa
 YFzh0hOGt3FBuPrAPM9AFa6XKaL0BcG7+QxeHVXPvaxmHwyqsj4V7bSd/WO6df0h
 JrSMBWzc1d3OYw==
X-ME-Sender: <xms:um_pWWX2Oy_CNxRyyS_3FmJByiUQVAL-__d2ya-jYChBhFZ7vQrmqw>
Received: from keelia.lan (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id DB7FA247AD;
 Thu, 19 Oct 2017 23:38:28 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, corbet@lwn.net,
 joel@jms.id.au, ryan_chen@aspeedtech.com, robh+dt@kernel.org,
 frowand.list@gmail.com, ckeepax@opensource.wolfsonmicro.com,
 ldewangan@nvidia.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [RFC PATCH 1/5] gpio: gpiolib: Add core support for maintaining GPIO
 values on reset
Date: Fri, 20 Oct 2017 14:07:23 +1030
Message-Id: <20171020033727.21557-2-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 20 Oct 2017 03:38:37 -0000

GPIO state reset tolerance is implemented in gpiolib through the
addition of a new pinconf parameter. With that, some renaming of helpers
is done to clarify the scope of the already existing
gpiochip_line_is_persistent(), as it's now ambiguous as to whether that
means on suspend, reset or both. This in-turn impacts gpio-arizona, but
not in any complicated way.

This change lays the groundwork for implementing reset tolerance support
in all of the external interfaces that can influence GPIOs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-arizona.c             |  4 +--
 drivers/gpio/gpiolib.c                  | 55 +++++++++++++++++++++++++++++++--
 drivers/gpio/gpiolib.h                  |  1 +
 include/linux/gpio/consumer.h           |  9 ++++++
 include/linux/gpio/driver.h             |  5 ++-
 include/linux/gpio/machine.h            |  2 ++
 include/linux/pinctrl/pinconf-generic.h |  2 ++
 7 files changed, 73 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index d4e6ba0301bc..d3fe23569811 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -33,7 +33,7 @@ static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
-	bool persistent = gpiochip_line_is_persistent(chip, offset);
+	bool persistent = gpiochip_line_is_persistent_suspend(chip, offset);
 	bool change;
 	int ret;
 
@@ -99,7 +99,7 @@ static int arizona_gpio_direction_out(struct gpio_chip *chip,
 {
 	struct arizona_gpio *arizona_gpio = gpiochip_get_data(chip);
 	struct arizona *arizona = arizona_gpio->arizona;
-	bool persistent = gpiochip_line_is_persistent(chip, offset);
+	bool persistent = gpiochip_line_is_persistent_suspend(chip, offset);
 	unsigned int val;
 	int ret;
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a56b29fd8bb1..d9dc7e588699 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2414,6 +2414,40 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 
 /**
+ * gpiod_set_reset_tolerant - Hold state across controller reset
+ * @desc: descriptor of the GPIO for which to set debounce time
+ * @tolerant: True to hold state across a controller reset, false otherwise
+ *
+ * Returns:
+ * 0 on success, %-ENOTSUPP if the controller doesn't support setting the
+ * reset tolerance or less than zero on other failures.
+ */
+int gpiod_set_reset_tolerant(struct gpio_desc *desc, bool tolerant)
+{
+	struct gpio_chip *chip;
+	unsigned long packed;
+	int rc;
+
+	chip = desc->gdev->chip;
+	if (!chip->set_config)
+		return -ENOTSUPP;
+
+	packed = pinconf_to_config_packed(PIN_CONFIG_RESET_TOLERANT, tolerant);
+
+	rc = chip->set_config(chip, gpio_chip_hwgpio(desc), packed);
+	if (rc < 0)
+		return rc;
+
+	if (tolerant)
+		set_bit(FLAG_RESET_TOLERANT, &desc->flags);
+	else
+		clear_bit(FLAG_RESET_TOLERANT, &desc->flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gpiod_set_reset_tolerant);
+
+/**
  * gpiod_is_active_low - test whether a GPIO is active-low or not
  * @desc: the gpio descriptor to test
  *
@@ -2885,7 +2919,8 @@ bool gpiochip_line_is_open_source(struct gpio_chip *chip, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_open_source);
 
-bool gpiochip_line_is_persistent(struct gpio_chip *chip, unsigned int offset)
+bool gpiochip_line_is_persistent_suspend(struct gpio_chip *chip,
+					 unsigned int offset)
 {
 	if (offset >= chip->ngpio)
 		return false;
@@ -2893,7 +2928,18 @@ bool gpiochip_line_is_persistent(struct gpio_chip *chip, unsigned int offset)
 	return !test_bit(FLAG_SLEEP_MAY_LOSE_VALUE,
 			 &chip->gpiodev->descs[offset].flags);
 }
-EXPORT_SYMBOL_GPL(gpiochip_line_is_persistent);
+EXPORT_SYMBOL_GPL(gpiochip_line_is_persistent_suspend);
+
+bool gpiochip_line_is_persistent_reset(struct gpio_chip *chip,
+				       unsigned int offset)
+{
+	if (offset >= chip->ngpio)
+		return false;
+
+	return test_bit(FLAG_RESET_TOLERANT,
+			&chip->gpiodev->descs[offset].flags);
+}
+EXPORT_SYMBOL_GPL(gpiochip_line_is_persistent_reset);
 
 /**
  * gpiod_get_raw_value_cansleep() - return a gpio's raw value
@@ -3271,6 +3317,11 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 	if (lflags & GPIO_SLEEP_MAY_LOSE_VALUE)
 		set_bit(FLAG_SLEEP_MAY_LOSE_VALUE, &desc->flags);
 
+	status = gpiod_set_reset_tolerant(desc,
+					  !!(lflags & GPIO_RESET_TOLERANT));
+	if (status < 0)
+		return status;
+
 	/* No particular flag request, return here... */
 	if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
 		pr_debug("no flags found for %s\n", con_id);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 799208fc189a..4ce36f14c1ad 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -202,6 +202,7 @@ struct gpio_desc {
 #define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
 #define FLAG_IS_HOGGED	11	/* GPIO is hogged */
 #define FLAG_SLEEP_MAY_LOSE_VALUE 12	/* GPIO may lose value in sleep */
+#define FLAG_RESET_TOLERANT 13	/* GPIO to maintain state at shutdown */
 
 	/* Connection label */
 	const char		*label;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 8f702fcbe485..ee5e125c8fec 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -121,6 +121,7 @@ void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 					int *value_array);
 
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
+int gpiod_set_reset_tolerant(struct gpio_desc *desc, bool tolerant);
 
 int gpiod_is_active_low(const struct gpio_desc *desc);
 int gpiod_cansleep(const struct gpio_desc *desc);
@@ -381,6 +382,14 @@ static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 	return -ENOSYS;
 }
 
+static inline int gpiod_set_reset_tolerant(struct gpio_desc *desc,
+					   bool tolerant)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+	return -ENOSYS;
+}
+
 static inline int gpiod_is_active_low(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c97f8325e8bf..6e9d32bdab55 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -233,7 +233,10 @@ bool gpiochip_line_is_open_drain(struct gpio_chip *chip, unsigned int offset);
 bool gpiochip_line_is_open_source(struct gpio_chip *chip, unsigned int offset);
 
 /* Sleep persistence inquiry for drivers */
-bool gpiochip_line_is_persistent(struct gpio_chip *chip, unsigned int offset);
+bool gpiochip_line_is_persistent_suspend(struct gpio_chip *chip,
+					 unsigned int offset);
+bool gpiochip_line_is_persistent_reset(struct gpio_chip *chip,
+				       unsigned int offset);
 
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *chip);
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index 5e9f294c29eb..11b7209c7ab9 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -11,6 +11,8 @@ enum gpio_lookup_flags {
 	GPIO_OPEN_SOURCE = (1 << 2),
 	GPIO_SLEEP_MAINTAIN_VALUE = (0 << 3),
 	GPIO_SLEEP_MAY_LOSE_VALUE = (1 << 3),
+	GPIO_RESET_INTOLERANT = (0 << 4),
+	GPIO_RESET_TOLERANT = (1 << 4),
 };
 
 /**
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 5d8bc7f21c2a..487cc863cb36 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -90,6 +90,7 @@
  * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
  *	this parameter (on a custom format) tells the driver which alternative
  *	slew rate to use.
+ * @PIN_CONFIG_RESET_TOLERANT: retains the pin state across a system reset
  * @PIN_CONFIG_END: this is the last enumerator for pin configurations, if
  *	you need to pass in custom configurations to the pin controller, use
  *	PIN_CONFIG_END+1 as the base offset.
@@ -117,6 +118,7 @@ enum pin_config_param {
 	PIN_CONFIG_POWER_SOURCE,
 	PIN_CONFIG_SLEEP_HARDWARE_STATE,
 	PIN_CONFIG_SLEW_RATE,
+	PIN_CONFIG_RESET_TOLERANT,
 	PIN_CONFIG_END = 0x7F,
 	PIN_CONFIG_MAX = 0xFF,
 };
-- 
2.11.0
