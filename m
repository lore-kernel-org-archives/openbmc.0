Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VA2iM2ii"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FITiM1H4"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH3xG36B3zF0gw
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 09:45:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4741620CA5;
 Wed, 10 Jan 2018 17:45:02 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 10 Jan 2018 17:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=q0k+kndQu52rEQHyu
 F+xsfA5lKZMlQrWUQHvDk90O9A=; b=VA2iM2iiwMvTM7gEnMDWWztqALwJgFsWN
 rqKrcDPeUZoOmE3D/hKHd0SvXw9rtTN81fTUpLjKD6ClqPY8z3nh5DR1AjE7n006
 5lTwh/FdiS20gVNQpnoKS5t8dTI8KT/6lXL0Swhc4L+d0KZ123HTA9v+DVlHhX16
 HEhVQXdDtm9CE51DeDuophJuwIwF6+MghoAeJ5+y1LywMLC8UNj4T5KTOzsnt7ab
 W6WQvv4I3G/nO93BgSoOB5wjUqhHT2W7akdNvpxosnzmxmR2eS1eXDDhRwnHY5DF
 K1o/UptmsXHps5l9mkWv7Q4Fe1wnHeR3r0lH8PEKxtrCp/8Vf7PFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=q0k+kndQu52rEQHyuF+xsfA5lKZMlQrWUQHvDk90O9A=; b=FITiM1H4
 OYJnrgok/WEu5wi+FgJkupCMfXtSne+E0/RVaMb805WjSr7pdXmeqAwbJiahp6MH
 0XNrK1iKmDoCcIbfISu/E/Be2u9unPq9X5eHmiIxRkBYa1TRJ2icrCdx9om0XFe0
 Ac67joC1xNuDfKxlS+b2mWie71TKomQXQvCa7p5MSXaxjvsc+fId8tJgZJ0ZpCXi
 3FjKb8hEzj+/DLvINsfezPkdkHFdKy8dv41ICTXCt3LkSKLUAqWL6gUfHYHjgqCS
 6B4qbRvkkun3ho1Tr1aOuD8FoFM3Tkm+418d7+/MJrkjkq8GyQPBsVwotJBSi8e4
 ZNgCy9nTWmrh1A==
X-ME-Sender: <xms:bpdWWlopQAXVq-2xRmIpkUz4JIpA0BlQhT92NXLCTy9YhqbkUo4ZKw>
Received: from dave.google.com (unknown [104.133.8.110])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4241324235;
 Wed, 10 Jan 2018 17:45:01 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.10 1/4] gpiolib: Convert fwnode_get_named_gpiod()
 to configure GPIO
Date: Wed, 10 Jan 2018 14:44:11 -0800
Message-Id: <20180110224414.21516-2-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 10 Jan 2018 22:45:07 -0000

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Make fwnode_get_named_gpiod() consistent with the rest of
gpiod_get() like API, i.e. configure GPIO pin immediately after
request.

Besides obvious clean up it will help to configure pins based
on firmware provided resources.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(cherry picked from commit a264d10ff45c688293d9112fddd8d29c819e0853)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/devres.c                     |  9 +++++++--
 drivers/gpio/gpiolib.c                    | 20 ++++++++++++++++----
 drivers/input/keyboard/gpio_keys.c        |  9 +--------
 drivers/input/keyboard/gpio_keys_polled.c | 11 ++---------
 drivers/leds/leds-gpio.c                  |  2 +-
 drivers/video/fbdev/amba-clcd-nomadik.c   | 15 +++++----------
 include/linux/gpio/consumer.h             | 19 +++++++++++++------
 7 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
index b760cbbb41d8..5e0b41b5e554 100644
--- a/drivers/gpio/devres.c
+++ b/drivers/gpio/devres.c
@@ -127,13 +127,18 @@ EXPORT_SYMBOL(devm_gpiod_get_index);
  * @dev:	GPIO consumer
  * @con_id:	function within the GPIO consumer
  * @child:	firmware node (child of @dev)
+ * @flags:	GPIO initialization flags
  *
  * GPIO descriptors returned from this function are automatically disposed on
  * driver detach.
+ *
+ * On successfull request the GPIO pin is configured in accordance with
+ * provided @flags.
  */
 struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 					    const char *con_id,
-					    struct fwnode_handle *child)
+					    struct fwnode_handle *child,
+					    enum gpiod_flags flags)
 {
 	static const char * const suffixes[] = { "gpios", "gpio" };
 	char prop_name[32]; /* 32 is max size of property name */
@@ -154,7 +159,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 			snprintf(prop_name, sizeof(prop_name), "%s",
 							       suffixes[i]);
 
-		desc = fwnode_get_named_gpiod(child, prop_name);
+		desc = fwnode_get_named_gpiod(child, prop_name, flags);
 		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
 			break;
 	}
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d0478f1853db..024f3a8bbf3b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3325,6 +3325,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_index);
  * fwnode_get_named_gpiod - obtain a GPIO from firmware node
  * @fwnode:	handle of the firmware node
  * @propname:	name of the firmware property representing the GPIO
+ * @dflags:	GPIO initialization flags
  *
  * This function can be used for drivers that get their configuration
  * from firmware.
@@ -3333,12 +3334,17 @@ EXPORT_SYMBOL_GPL(gpiod_get_index);
  * underlying firmware interface and then makes sure that the GPIO
  * descriptor is requested before it is returned to the caller.
  *
+ * On successfull request the GPIO pin is configured in accordance with
+ * provided @dflags.
+ *
  * In case of error an ERR_PTR() is returned.
  */
 struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
-					 const char *propname)
+					 const char *propname,
+					 enum gpiod_flags dflags)
 {
 	struct gpio_desc *desc = ERR_PTR(-ENODEV);
+	unsigned long lflags = 0;
 	bool active_low = false;
 	bool single_ended = false;
 	int ret;
@@ -3371,13 +3377,19 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 		return ERR_PTR(ret);
 
 	if (active_low)
-		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+		lflags |= GPIO_ACTIVE_LOW;
 
 	if (single_ended) {
 		if (active_low)
-			set_bit(FLAG_OPEN_DRAIN, &desc->flags);
+			lflags |= GPIO_OPEN_DRAIN;
 		else
-			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
+			lflags |= GPIO_OPEN_SOURCE;
+	}
+
+	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
+	if (ret < 0) {
+		gpiod_put(desc);
+		return ERR_PTR(ret);
 	}
 
 	return desc;
diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 582462d0af75..9de4b876100a 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -481,7 +481,7 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 	spin_lock_init(&bdata->lock);
 
 	if (child) {
-		bdata->gpiod = devm_get_gpiod_from_child(dev, NULL, child);
+		bdata->gpiod = devm_get_gpiod_from_child(dev, NULL, child, GPIOD_IN);
 		if (IS_ERR(bdata->gpiod)) {
 			error = PTR_ERR(bdata->gpiod);
 			if (error == -ENOENT) {
@@ -496,13 +496,6 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 						error);
 				return error;
 			}
-		} else {
-			error = gpiod_direction_input(bdata->gpiod);
-			if (error) {
-				dev_err(dev, "Failed to configure GPIO %d as input: %d\n",
-					desc_to_gpio(bdata->gpiod), error);
-				return error;
-			}
 		}
 	} else if (gpio_is_valid(button->gpio)) {
 		/*
diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index bed4f2086158..fd7ab4dad87b 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -304,7 +304,8 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 			}
 
 			bdata->gpiod = devm_get_gpiod_from_child(dev, NULL,
-								 child);
+								 child,
+								 GPIOD_IN);
 			if (IS_ERR(bdata->gpiod)) {
 				error = PTR_ERR(bdata->gpiod);
 				if (error != -EPROBE_DEFER)
@@ -314,14 +315,6 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 				fwnode_handle_put(child);
 				return error;
 			}
-
-			error = gpiod_direction_input(bdata->gpiod);
-			if (error) {
-				dev_err(dev, "Failed to configure GPIO %d as input: %d\n",
-					desc_to_gpio(bdata->gpiod), error);
-				fwnode_handle_put(child);
-				return error;
-			}
 		} else if (gpio_is_valid(button->gpio)) {
 			/*
 			 * Legacy GPIO number so request the GPIO here and
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 061ab9220048..7fcca92b2fcd 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -176,7 +176,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		const char *state = NULL;
 		struct device_node *np = to_of_node(child);
 
-		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child);
+		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child, GPIOD_ASIS);
 		if (IS_ERR(led.gpiod)) {
 			fwnode_handle_put(child);
 			return ERR_CAST(led.gpiod);
diff --git a/drivers/video/fbdev/amba-clcd-nomadik.c b/drivers/video/fbdev/amba-clcd-nomadik.c
index 0c06fcaaa6e8..2e800d70b0e5 100644
--- a/drivers/video/fbdev/amba-clcd-nomadik.c
+++ b/drivers/video/fbdev/amba-clcd-nomadik.c
@@ -184,32 +184,27 @@ static void tpg110_init(struct device *dev, struct device_node *np,
 {
 	dev_info(dev, "TPG110 display init\n");
 
-	grestb = devm_get_gpiod_from_child(dev, "grestb", &np->fwnode);
+	/* This asserts the GRESTB signal, putting the display into reset */
+	grestb = devm_get_gpiod_from_child(dev, "grestb", &np->fwnode, GPIOD_OUT_HIGH);
 	if (IS_ERR(grestb)) {
 		dev_err(dev, "no GRESTB GPIO\n");
 		return;
 	}
-	/* This asserts the GRESTB signal, putting the display into reset */
-	gpiod_direction_output(grestb, 1);
-
-	scen = devm_get_gpiod_from_child(dev, "scen", &np->fwnode);
+	scen = devm_get_gpiod_from_child(dev, "scen", &np->fwnode, GPIOD_OUT_LOW);
 	if (IS_ERR(scen)) {
 		dev_err(dev, "no SCEN GPIO\n");
 		return;
 	}
-	gpiod_direction_output(scen, 0);
-	scl = devm_get_gpiod_from_child(dev, "scl", &np->fwnode);
+	scl = devm_get_gpiod_from_child(dev, "scl", &np->fwnode, GPIOD_OUT_LOW);
 	if (IS_ERR(scl)) {
 		dev_err(dev, "no SCL GPIO\n");
 		return;
 	}
-	gpiod_direction_output(scl, 0);
-	sda = devm_get_gpiod_from_child(dev, "sda", &np->fwnode);
+	sda = devm_get_gpiod_from_child(dev, "sda", &np->fwnode, GPIOD_OUT_LOW);
 	if (IS_ERR(sda)) {
 		dev_err(dev, "no SDA GPIO\n");
 		return;
 	}
-	gpiod_direction_output(sda, 0);
 	board->enable = tpg110_enable;
 	board->disable = tpg110_disable;
 }
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fb0fde686cb1..930d10049d8d 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -135,10 +135,12 @@ int desc_to_gpio(const struct gpio_desc *desc);
 struct fwnode_handle;
 
 struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
-					 const char *propname);
+					 const char *propname,
+					 enum gpiod_flags dflags);
 struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
 					    const char *con_id,
-					    struct fwnode_handle *child);
+					    struct fwnode_handle *child,
+					    enum gpiod_flags flags);
 #else /* CONFIG_GPIOLIB */
 
 static inline int gpiod_count(struct device *dev, const char *con_id)
@@ -411,14 +413,19 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
 /* Child properties interface */
 struct fwnode_handle;
 
-static inline struct gpio_desc *fwnode_get_named_gpiod(
-	struct fwnode_handle *fwnode, const char *propname)
+static inline
+struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
+					 const char *propname,
+					 enum gpiod_flags dflags)
 {
 	return ERR_PTR(-ENOSYS);
 }
 
-static inline struct gpio_desc *devm_get_gpiod_from_child(
-	struct device *dev, const char *con_id, struct fwnode_handle *child)
+static inline
+struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
+					    const char *con_id,
+					    struct fwnode_handle *child,
+					    enum gpiod_flags flags)
 {
 	return ERR_PTR(-ENOSYS);
 }
-- 
2.14.1
