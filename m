Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DyfbKVEg"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fizwn+wx"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH3xG331NzF0gs
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 09:45:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FD3620BA8;
 Wed, 10 Jan 2018 17:45:03 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 10 Jan 2018 17:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NARjfowiMRHp47xsF
 QKlnIaQqkkL+Ys0ZlSkT0v0/tQ=; b=DyfbKVEg02qLbzj7LwrKZnuyCkjHDl/el
 qq4T7ndVQX4gXv0Q8Dvchh/bpgev7j/+Gw8oJsbAjlcynOqz+o9JSC7H54Px66ut
 wXKq6YkXwAP3qBpNxDqHwzMcmcJXe6VidewutLRKPObHzY4moPXpbBwK5mmWPz57
 ynR0EgAln9nzyqwH0RcEME8IMq8IllPr4d7s8uR9sx7koDg635Vyv6GmfJdWurIa
 Who2LHc2syJRRRgI0noXlTmu0Q7TSwl8Obl6FHeRmhohQfJbwIlpKUU91ursUMam
 FRjNIX2fa/HGGO0ZbLVRDWjI4T5e9qDm2R9qYOyyYnYiPDV+2G12A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=NARjfowiMRHp47xsFQKlnIaQqkkL+Ys0ZlSkT0v0/tQ=; b=fizwn+wx
 4iOmj+ICQHoGM1/lQgfgJ9BUZgvHcpeATUk1t+eQyLXtYw0yywU2PsObbuHVVT7V
 TlOaRF/2c4MCkEp8bKMprB8HjXdf2SfGiOfL4UuYdLVgec5julrK7wCDq+fRM6vq
 ziqB8Kf+2SPw488tfKeeAE3TVuuh3wm5JOa2eLRaZWN2nKS9/A5ueynlx2QY/Hk0
 OPqBI+aWVFFx2Min+Cq5DVMFAHoFMbBXgJDlNqUXNXsPnWQ1go169Dxd0fRe7tU0
 LY78kdgt0Qm5fggSZ2IRtXeNwQKDb0Yq5DMeH5PVbJQFjIXtuXvo6oIXrONutZ72
 IurnySF+x5qeCw==
X-ME-Sender: <xms:b5dWWguFDV0z-Agb4lXd5_Yv6EufRGvOoEsACbu66ar5qo1eld9Q2Q>
Received: from dave.google.com (unknown [104.133.8.110])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFC99246CA;
 Wed, 10 Jan 2018 17:45:02 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 3/4] gpio: gpiolib: Generalise state
 persistence beyond sleep
Date: Wed, 10 Jan 2018 14:44:13 -0800
Message-Id: <20180110224414.21516-4-andrew@aj.id.au>
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

General support for state persistence is added to gpiolib with the
introduction of a new pinconf parameter to propagate the request to
hardware. The existing persistence support for sleep is adapted to
include hardware support if the GPIO driver provides it. Persistence
continues to be enabled by default; in-kernel consumers can opt out, but
userspace (currently) does not have a choice.

The *_SLEEP_MAY_LOSE_VALUE and *_SLEEP_MAINTAIN_VALUE symbols are
renamed, dropping the SLEEP prefix to reflect that the concept is no
longer sleep-specific.  I feel that renaming to just *_MAY_LOSE_VALUE
could initially be misinterpreted, so I've further changed the symbols
to *_TRANSITORY and *_PERSISTENT to address this.

The sysfs interface is modified only to keep consistency with the
chardev interface in enforcing persistence for userspace exports.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(cherry picked from commit e10f72bf4b3e8885c1915a119141481e7fc45ca8)
---
 drivers/gpio/gpiolib-of.c               |  5 +++
 drivers/gpio/gpiolib-sysfs.c            | 14 ++++---
 drivers/gpio/gpiolib.c                  | 65 +++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.h                  |  1 +
 include/dt-bindings/gpio/gpio.h         |  4 ++
 include/linux/gpio/consumer.h           |  8 ++++
 include/linux/gpio/machine.h            |  2 +
 include/linux/of_gpio.h                 |  1 +
 include/linux/pinctrl/pinconf-generic.h | 10 ++++-
 9 files changed, 104 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ebe82758e768..86836dbba284 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -153,6 +153,9 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			*flags |= GPIO_OPEN_SOURCE;
 	}
 
+	if (of_flags & OF_GPIO_TRANSITORY)
+		*flags |= GPIO_TRANSITORY;
+
 	return desc;
 }
 
@@ -206,6 +209,8 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 
 	if (xlate_flags & OF_GPIO_ACTIVE_LOW)
 		*lflags |= GPIO_ACTIVE_LOW;
+	if (xlate_flags & OF_GPIO_TRANSITORY)
+		*lflags |= GPIO_TRANSITORY;
 
 	if (of_property_read_bool(np, "input"))
 		*dflags |= GPIOD_IN;
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 4b44dd97c07f..9df5db82035a 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -468,11 +468,15 @@ static ssize_t export_store(struct class *class,
 			status = -ENODEV;
 		goto done;
 	}
-	status = gpiod_export(desc, true);
-	if (status < 0)
-		gpiod_free(desc);
-	else
-		set_bit(FLAG_SYSFS, &desc->flags);
+
+	status = gpiod_set_transitory(desc, false);
+	if (!status) {
+		status = gpiod_export(desc, true);
+		if (status < 0)
+			gpiod_free(desc);
+		else
+			set_bit(FLAG_SYSFS, &desc->flags);
+	}
 
 done:
 	if (status)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e4796fbaeb4b..81af68ce66dd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -479,6 +479,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
 
+		ret = gpiod_set_transitory(desc, false);
+		if (ret < 0)
+			goto out_free_descs;
+
 		/*
 		 * Lines have to be requested explicitly for input
 		 * or output, else the line will be treated "as is".
@@ -2406,6 +2410,49 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 }
 EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 
+/**
+ * gpiod_set_transitory - Lose or retain GPIO state on suspend or reset
+ * @desc: descriptor of the GPIO for which to configure persistence
+ * @transitory: True to lose state on suspend or reset, false for persistence
+ *
+ * Returns:
+ * 0 on success, otherwise a negative error code.
+ */
+int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
+{
+	struct gpio_chip *chip;
+	unsigned long packed;
+	int gpio;
+	int rc;
+
+	/*
+	 * Handle FLAG_TRANSITORY first, enabling queries to gpiolib for
+	 * persistence state.
+	 */
+	if (transitory)
+		set_bit(FLAG_TRANSITORY, &desc->flags);
+	else
+		clear_bit(FLAG_TRANSITORY, &desc->flags);
+
+	/* If the driver supports it, set the persistence state now */
+	chip = desc->gdev->chip;
+	if (!chip->set_config)
+		return 0;
+
+	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
+					  !transitory);
+	gpio = gpio_chip_hwgpio(desc);
+	rc = chip->set_config(chip, gpio, packed);
+	if (rc == -ENOTSUPP) {
+		dev_dbg(&desc->gdev->dev, "Persistence not supported for GPIO %d\n",
+				gpio);
+		return 0;
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(gpiod_set_transitory);
+
 /**
  * gpiod_is_active_low - test whether a GPIO is active-low or not
  * @desc: the gpio descriptor to test
@@ -2885,6 +2932,15 @@ bool gpiochip_line_is_open_source(struct gpio_chip *chip, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_open_source);
 
+bool gpiochip_line_is_persistent(struct gpio_chip *chip, unsigned int offset)
+{
+	if (offset >= chip->ngpio)
+		return false;
+
+	return !test_bit(FLAG_TRANSITORY, &chip->gpiodev->descs[offset].flags);
+}
+EXPORT_SYMBOL_GPL(gpiochip_line_is_persistent);
+
 /**
  * gpiod_get_raw_value_cansleep() - return a gpio's raw value
  * @desc: gpio whose value will be returned
@@ -3240,6 +3296,10 @@ static int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 	if (lflags & GPIO_OPEN_SOURCE)
 		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
 
+	status = gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY));
+	if (status < 0)
+		return status;
+
 	/* No particular flag request, return here... */
 	if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
 		pr_debug("no flags found for %s\n", con_id);
@@ -3348,6 +3408,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 	bool active_low = false;
 	bool single_ended = false;
 	bool open_drain = false;
+	bool transitory = false;
 	int ret;
 
 	if (!fwnode)
@@ -3362,6 +3423,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 			active_low = flags & OF_GPIO_ACTIVE_LOW;
 			single_ended = flags & OF_GPIO_SINGLE_ENDED;
 			open_drain = flags & OF_GPIO_OPEN_DRAIN;
+			transitory = flags & OF_GPIO_TRANSITORY;
 		}
 	} else if (is_acpi_node(fwnode)) {
 		struct acpi_gpio_info info;
@@ -3388,6 +3450,9 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 			lflags |= GPIO_OPEN_SOURCE;
 	}
 
+	if (transitory)
+		lflags |= GPIO_TRANSITORY;
+
 	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
 	if (ret < 0) {
 		gpiod_put(desc);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index d10eaf520860..263359bca527 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -189,6 +189,7 @@ struct gpio_desc {
 #define FLAG_OPEN_SOURCE 8	/* Gpio is open source type */
 #define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
 #define FLAG_IS_HOGGED	11	/* GPIO is hogged */
+#define FLAG_TRANSITORY 12	/* GPIO may lose value in sleep or reset */
 
 	/* Connection label */
 	const char		*label;
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index b4f54da694eb..43dc230d3921 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -28,4 +28,8 @@
 #define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
 #define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_SOURCE)
 
+/* Bit 3 express GPIO suspend/resume and reset persistence */
+#define GPIO_PERSISTENT 0
+#define GPIO_TRANSITORY 8
+
 #endif
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 930d10049d8d..f10d51433fbf 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -121,6 +121,7 @@ void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 					int *value_array);
 
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
+int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 
 int gpiod_is_active_low(const struct gpio_desc *desc);
 int gpiod_cansleep(const struct gpio_desc *desc);
@@ -378,6 +379,13 @@ static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 	return -ENOSYS;
 }
 
+static inline int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(1);
+	return -ENOSYS;
+}
+
 static inline int gpiod_is_active_low(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index c0d712d22b07..f617fd163e1f 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -9,6 +9,8 @@ enum gpio_lookup_flags {
 	GPIO_ACTIVE_LOW = (1 << 0),
 	GPIO_OPEN_DRAIN = (1 << 1),
 	GPIO_OPEN_SOURCE = (1 << 2),
+	GPIO_PERSISTENT = (0 << 3),
+	GPIO_TRANSITORY = (1 << 3),
 };
 
 /**
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 1e089d5a182b..18a7f03e1182 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -31,6 +31,7 @@ enum of_gpio_flags {
 	OF_GPIO_ACTIVE_LOW = 0x1,
 	OF_GPIO_SINGLE_ENDED = 0x2,
 	OF_GPIO_OPEN_DRAIN = 0x4,
+	OF_GPIO_TRANSITORY = 0x8,
 };
 
 #ifdef CONFIG_OF_GPIO
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 763dcd68e66b..e00bd58b3dd2 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -83,6 +83,11 @@
  * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
  *	this parameter (on a custom format) tells the driver which alternative
  *	slew rate to use.
+ * @PIN_CONFIG_SKEW_DELAY: if the pin has programmable skew rate (on inputs)
+ *	or latch delay (on outputs) this parameter (in a custom format)
+ *	specifies the clock skew or latch delay. It typically controls how
+ *	many double inverters are put in front of the line.
+ * @PIN_CONFIG_PERSIST_STATE: retain pin state across sleep or controller reset
  * @PIN_CONFIG_END: this is the last enumerator for pin configurations, if
  *	you need to pass in custom configurations to the pin controller, use
  *	PIN_CONFIG_END+1 as the base offset.
@@ -106,7 +111,10 @@ enum pin_config_param {
 	PIN_CONFIG_OUTPUT,
 	PIN_CONFIG_POWER_SOURCE,
 	PIN_CONFIG_SLEW_RATE,
-	PIN_CONFIG_END = 0x7FFF,
+	PIN_CONFIG_SKEW_DELAY,
+	PIN_CONFIG_PERSIST_STATE,
+	PIN_CONFIG_END = 0x7F,
+	PIN_CONFIG_MAX = 0xFF,
 };
 
 /*
-- 
2.14.1
