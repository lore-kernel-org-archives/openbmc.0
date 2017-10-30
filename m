Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rdM0xxNI"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VWQ8ybCG"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQPYY06W0zDqmt;
 Mon, 30 Oct 2017 17:23:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E045F20AC6;
 Mon, 30 Oct 2017 02:23:10 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 30 Oct 2017 02:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=58HqDnp6dZel/vEGf
 PRV7h1qU+58728FVg7DwrrNM3k=; b=rdM0xxNI5XsWffFdcV+nUyvLaKYqFFrKI
 He2Zm4nKTRMwTHk0iGgGoZo5V+wpK4cDSoqUqMIoP6NMEeaPp2hUItZm9uMuD38V
 NXDmndQS741hs0hdKM3Yp14C6JX0YeB8ygZt20gczPHqetnvI5G85CO928vRr7Jn
 uYQPT5IdQXuw0BH2klQY65paBR2aflXppeItrgIQ7ZK0a2zwhrsUHsHVIPieIzaR
 iCmNLG3hayVOFXIdVPvAeC77fc7sNNJ8Q68rhKSPDBRjpnfr0a+smPBfjM4jiSlC
 O+TgkL+b4xklDwyKk3mxZmypy6C6BIkIfFFdbtdlHIUr+9CtyqyVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=58HqDnp6dZel/vEGfPRV7h1qU+58728FVg7DwrrNM3k=; b=VWQ8ybCG
 yYGrki9MN/08G3+bm7hvnjX9qUYl2hvk+WSVGVviO0sd3eJjfNwKo9rbBCnSfzkd
 GXKPMbrgvcHLwG3CEfCUspmRym6ydWpNmksH9x9wOq0y1YI34g9xCsNOKSZkRZlc
 XaoVVDNHZRXogo33OJ5ifDjpQUYUoAuViyW29cCPVIKmXt2ObDul4aQYIA8xzlFU
 ElRfQwKQYsYQjjWSOn1wZAGWk3uavbualTRlmZBhN4s9dt+/xI9CMOSFMZbsN2CZ
 kMA1eGjzZn0gRQVkJJGxDkAfvCFO3s4XHZiGJgUJ//s64asETbaVqUQ+NcjNcJbp
 kB4dcvi0yK4kvA==
X-ME-Sender: <xms:TsX2Wa0lpQ0_OTxou93UEx_V4Njtlw5TL8VcaZb4vFrEIVDKgNYavg>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id D80AD247F0;
 Mon, 30 Oct 2017 02:23:05 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org,
 robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com,
 joel@jms.id.au, ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com,
 ryan_chen@aspeedtech.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 1/2] gpio: gpiolib: Generalise state persistence beyond
 sleep
Date: Mon, 30 Oct 2017 16:52:17 +1030
Message-Id: <20171030062218.27005-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171030062218.27005-1-andrew@aj.id.au>
References: <20171030062218.27005-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 30 Oct 2017 06:23:14 -0000

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
---
 drivers/gpio/gpiolib-of.c               |  6 ++--
 drivers/gpio/gpiolib-sysfs.c            | 14 +++++---
 drivers/gpio/gpiolib.c                  | 58 ++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h                  |  2 +-
 include/dt-bindings/gpio/gpio.h         |  6 ++--
 include/linux/gpio/consumer.h           |  8 +++++
 include/linux/gpio/machine.h            |  4 +--
 include/linux/of_gpio.h                 |  2 +-
 include/linux/pinctrl/pinconf-generic.h |  2 ++
 9 files changed, 84 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index e0d59e61b52f..4a2b8d3397c7 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -153,8 +153,8 @@ struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 			*flags |= GPIO_OPEN_SOURCE;
 	}
 
-	if (of_flags & OF_GPIO_SLEEP_MAY_LOSE_VALUE)
-		*flags |= GPIO_SLEEP_MAY_LOSE_VALUE;
+	if (of_flags & OF_GPIO_TRANSITORY)
+		*flags |= GPIO_TRANSITORY;
 
 	return desc;
 }
@@ -214,6 +214,8 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 
 	if (xlate_flags & OF_GPIO_ACTIVE_LOW)
 		*lflags |= GPIO_ACTIVE_LOW;
+	if (xlate_flags & OF_GPIO_TRANSITORY)
+		*lflags |= GPIO_TRANSITORY;
 
 	if (of_property_read_bool(np, "input"))
 		*dflags |= GPIOD_IN;
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 3f454eaf2101..0bd472ffb072 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -474,11 +474,15 @@ static ssize_t export_store(struct class *class,
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
index 3827f0767101..0d0ab5744f46 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -503,6 +503,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 		if (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)
 			set_bit(FLAG_OPEN_SOURCE, &desc->flags);
 
+		ret = gpiod_set_transitory(desc, false);
+		if (ret < 0)
+			goto out_free_descs;
+
 		/*
 		 * Lines have to be requested explicitly for input
 		 * or output, else the line will be treated "as is".
@@ -2424,6 +2428,46 @@ int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 
 /**
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
+	/* Handle FLAG_TRANSITORY first for suspend case */
+	if (transitory)
+		set_bit(FLAG_TRANSITORY, &desc->flags);
+	else
+		clear_bit(FLAG_TRANSITORY, &desc->flags);
+
+	/* Configure reset persistence if the controller supports it */
+	chip = desc->gdev->chip;
+	if (!chip->set_config)
+		return 0;
+
+	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE,
+					  !transitory);
+	gpio = gpio_chip_hwgpio(desc);
+	rc = chip->set_config(chip, gpio, packed);
+	if (rc == -ENOTSUPP) {
+		dev_dbg(&desc->gdev->dev, "Reset tolerance not supported for GPIO %d\n",
+				gpio);
+		return 0;
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(gpiod_set_transitory);
+
+/**
  * gpiod_is_active_low - test whether a GPIO is active-low or not
  * @desc: the gpio descriptor to test
  *
@@ -3010,8 +3054,7 @@ bool gpiochip_line_is_persistent(struct gpio_chip *chip, unsigned int offset)
 	if (offset >= chip->ngpio)
 		return false;
 
-	return !test_bit(FLAG_SLEEP_MAY_LOSE_VALUE,
-			 &chip->gpiodev->descs[offset].flags);
+	return !test_bit(FLAG_TRANSITORY, &chip->gpiodev->descs[offset].flags);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_persistent);
 
@@ -3435,8 +3478,10 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
 	if (lflags & GPIO_OPEN_SOURCE)
 		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
-	if (lflags & GPIO_SLEEP_MAY_LOSE_VALUE)
-		set_bit(FLAG_SLEEP_MAY_LOSE_VALUE, &desc->flags);
+
+	status = gpiod_set_transitory(desc, (lflags & GPIO_TRANSITORY));
+	if (status < 0)
+		return status;
 
 	/* No particular flag request, return here... */
 	if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
@@ -3550,6 +3595,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 	bool active_low = false;
 	bool single_ended = false;
 	bool open_drain = false;
+	bool transitory = false;
 	int ret;
 
 	if (!fwnode)
@@ -3564,6 +3610,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 			active_low = flags & OF_GPIO_ACTIVE_LOW;
 			single_ended = flags & OF_GPIO_SINGLE_ENDED;
 			open_drain = flags & OF_GPIO_OPEN_DRAIN;
+			transitory = flags & OF_GPIO_TRANSITORY;
 		}
 	} else if (is_acpi_node(fwnode)) {
 		struct acpi_gpio_info info;
@@ -3594,6 +3641,9 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 			lflags |= GPIO_OPEN_SOURCE;
 	}
 
+	if (transitory)
+		lflags |= GPIO_TRANSITORY;
+
 	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
 	if (ret < 0) {
 		gpiod_put(desc);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index af48322839c3..736b189d1bb5 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -205,7 +205,7 @@ struct gpio_desc {
 #define FLAG_OPEN_SOURCE 8	/* Gpio is open source type */
 #define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
 #define FLAG_IS_HOGGED	11	/* GPIO is hogged */
-#define FLAG_SLEEP_MAY_LOSE_VALUE 12	/* GPIO may lose value in sleep */
+#define FLAG_TRANSITORY 12	/* GPIO may lose value in sleep or reset */
 
 	/* Connection label */
 	const char		*label;
diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/gpio.h
index 70de5b7a6c9b..43dc230d3921 100644
--- a/include/dt-bindings/gpio/gpio.h
+++ b/include/dt-bindings/gpio/gpio.h
@@ -28,8 +28,8 @@
 #define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
 #define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_SOURCE)
 
-/* Bit 3 express GPIO suspend/resume persistence */
-#define GPIO_SLEEP_MAINTAIN_VALUE 0
-#define GPIO_SLEEP_MAY_LOSE_VALUE 8
+/* Bit 3 express GPIO suspend/resume and reset persistence */
+#define GPIO_PERSISTENT 0
+#define GPIO_TRANSITORY 8
 
 #endif
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index d4920ec1f1da..d77e88c96f38 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -132,6 +132,7 @@ void gpiod_set_raw_array_value_cansleep(unsigned int array_size,
 					int *value_array);
 
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce);
+int gpiod_set_transitory(struct gpio_desc *desc, bool transitory);
 
 int gpiod_is_active_low(const struct gpio_desc *desc);
 int gpiod_cansleep(const struct gpio_desc *desc);
@@ -424,6 +425,13 @@ static inline int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
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
index 5e9f294c29eb..33a97ede6404 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -9,8 +9,8 @@ enum gpio_lookup_flags {
 	GPIO_ACTIVE_LOW = (1 << 0),
 	GPIO_OPEN_DRAIN = (1 << 1),
 	GPIO_OPEN_SOURCE = (1 << 2),
-	GPIO_SLEEP_MAINTAIN_VALUE = (0 << 3),
-	GPIO_SLEEP_MAY_LOSE_VALUE = (1 << 3),
+	GPIO_PERSISTENT = (0 << 3),
+	GPIO_TRANSITORY = (1 << 3),
 };
 
 /**
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 1fe205582111..18a7f03e1182 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -31,7 +31,7 @@ enum of_gpio_flags {
 	OF_GPIO_ACTIVE_LOW = 0x1,
 	OF_GPIO_SINGLE_ENDED = 0x2,
 	OF_GPIO_OPEN_DRAIN = 0x4,
-	OF_GPIO_SLEEP_MAY_LOSE_VALUE = 0x8,
+	OF_GPIO_TRANSITORY = 0x8,
 };
 
 #ifdef CONFIG_OF_GPIO
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 5d8bc7f21c2a..824094f39ad2 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -90,6 +90,7 @@
  * @PIN_CONFIG_SLEW_RATE: if the pin can select slew rate, the argument to
  *	this parameter (on a custom format) tells the driver which alternative
  *	slew rate to use.
+ * @PIN_CONFIG_PERSIST_STATE: retain pin state across sleep or controller reset
  * @PIN_CONFIG_END: this is the last enumerator for pin configurations, if
  *	you need to pass in custom configurations to the pin controller, use
  *	PIN_CONFIG_END+1 as the base offset.
@@ -117,6 +118,7 @@ enum pin_config_param {
 	PIN_CONFIG_POWER_SOURCE,
 	PIN_CONFIG_SLEEP_HARDWARE_STATE,
 	PIN_CONFIG_SLEW_RATE,
+	PIN_CONFIG_PERSIST_STATE,
 	PIN_CONFIG_END = 0x7F,
 	PIN_CONFIG_MAX = 0xFF,
 };
-- 
2.11.0
