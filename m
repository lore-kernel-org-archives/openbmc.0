Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="I6M84KM0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ng8nucGI"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLjK5xnKzDrKt
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:32:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 89F8D20C89;
 Tue,  7 Nov 2017 02:32:03 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=skxkTMycnMXhI9X+kLywW7smQG0Wu
 6Kk6zotF964zeI=; b=I6M84KM0eGgyz4OWhSHpbkRW2Mu60hJKTHSMsUDLh3sfq
 uL0teqCrkCiLMEqb88C0ofxhqP5xPGrbgJH8tHMBGyNs+ZPObbpeXDTJAZ0uceME
 VrCPr3VTq59lDbapl5h1UdM72fDcJnsezwAr0x7SQ65mNIDD4pYJ7CylvLm/BEZV
 Hvh/gVNQPx3jyUoSJg2xxSva9C0xCI3opy/z2Gt6XPb1jMjnNLKUGe1n0KHOzjUD
 RwdsZYtgLUy6qWtdRJu+HQazdzwMHaJNnoMnG0olokf/1iYoMfNZ3qgMs5hBJ10r
 fjbv6zr3Ne87pRa2zHXU/Q0E1CItDaYU/VOWGgCkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=skxkTM
 ycnMXhI9X+kLywW7smQG0Wu6Kk6zotF964zeI=; b=ng8nucGId50T/YzhlLFSmg
 aNK5QoPMSis3u+DFeeFw0ZqIHTomXT/zMTJu0xuXU2I7/RbIKQdBCw10cdwPqDaR
 0Dow50qs6LW1ReYCm91Mf/MR3NSgfL9nYqDs4A80SDXJE9ufRgL84G6dUfZ4fX93
 M9CRZAeOzvc6fHBrVHjKVAJbjXss414s9pspH0ZbXHSBo2DfsJIzbm+EcwBOja1/
 tHj8pNmlEvsI+YyGEzLZ+WnYRnsxDZMYaP6Lg3QVfbIpXz5xywc0rV59CCCoqI7O
 CIhdk3WVZbc7cdQ9bUlKotMBx4HIlL4vp3pXXyQ0z86H66ZNCdGDcdmV1qnNBtLw
 ==
X-ME-Sender: <xms:c2EBWhAmrcD7IbrUEK4n55cX9e3MTXgnE1VnQzk8hvECwYMOw8RFbQ>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B72724108;
 Tue,  7 Nov 2017 02:32:01 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.13 17/23] leds: pca955x: add GPIO support
Date: Tue,  7 Nov 2017 18:00:40 +1030
Message-Id: <20171107073046.13319-18-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171107073046.13319-1-andrew@aj.id.au>
References: <20171107073046.13319-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 07 Nov 2017 07:32:06 -0000

From: Cédric Le Goater <clg@kaod.org>

The PCA955x family of chips are I2C LED blinkers whose pins not used
to control LEDs can be used as general purpose I/Os (GPIOs).

The following adds such a support by defining different operation
modes for the pins (See bindings documentation for more details). The
pca955x driver is then extended with a gpio_chip when some of pins are
operating as GPIOs. The default operating mode is to behave as a LED.

The GPIO support is conditioned by CONFIG_LEDS_PCA955X_GPIO.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
(cherry picked from commit 561099a1a2e992a482a8318c0c9c5af26222e5cd)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/Kconfig                    |  11 +++
 drivers/leds/leds-pca955x.c             | 137 ++++++++++++++++++++++++++++----
 include/dt-bindings/leds/leds-pca955x.h |  16 ++++
 3 files changed, 147 insertions(+), 17 deletions(-)
 create mode 100644 include/dt-bindings/leds/leds-pca955x.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 594b24d410c3..3013cd35c65e 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -377,6 +377,17 @@ config LEDS_PCA955X
 	  LED driver chips accessed via the I2C bus.  Supported
 	  devices include PCA9550, PCA9551, PCA9552, and PCA9553.
 
+config LEDS_PCA955X_GPIO
+	bool "Enable GPIO support for PCA955X"
+	depends on LEDS_PCA955X
+	depends on GPIOLIB
+	help
+	  Allow unused pins on PCA955X to be used as gpio.
+
+	  To use a pin as gpio the pin type should be set to
+	  PCA955X_TYPE_GPIO in the device tree.
+
+
 config LEDS_PCA963X
 	tristate "LED support for PCA963x I2C chip"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 5a5d3765cfd3..f062d1e7640f 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -53,6 +53,8 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#include <dt-bindings/leds/leds-pca955x.h>
+
 /* LED select registers determine the source that drives LED outputs */
 #define PCA955X_LS_LED_ON	0x0	/* Output LOW */
 #define PCA955X_LS_LED_OFF	0x1	/* Output HI-Z */
@@ -118,6 +120,9 @@ struct pca955x {
 	struct pca955x_led *leds;
 	struct pca955x_chipdef	*chipdef;
 	struct i2c_client	*client;
+#ifdef CONFIG_LEDS_PCA955X_GPIO
+	struct gpio_chip gpio;
+#endif
 };
 
 struct pca955x_led {
@@ -125,6 +130,7 @@ struct pca955x_led {
 	struct led_classdev	led_cdev;
 	int			led_num;	/* 0 .. 15 potentially */
 	char			name[32];
+	u32			type;
 	const char		*default_trigger;
 };
 
@@ -259,6 +265,65 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+#ifdef CONFIG_LEDS_PCA955X_GPIO
+/*
+ * Read the INPUT register, which contains the state of LEDs.
+ */
+static u8 pca955x_read_input(struct i2c_client *client, int n)
+{
+	return (u8)i2c_smbus_read_byte_data(client, n);
+}
+
+static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+	struct pca955x_led *led = &pca955x->leds[offset];
+
+	if (led->type == PCA955X_TYPE_GPIO)
+		return 0;
+
+	return -EBUSY;
+}
+
+static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				   int val)
+{
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+	struct pca955x_led *led = &pca955x->leds[offset];
+
+	if (val)
+		pca955x_led_set(&led->led_cdev, LED_FULL);
+	else
+		pca955x_led_set(&led->led_cdev, LED_OFF);
+}
+
+static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+	struct pca955x_led *led = &pca955x->leds[offset];
+	u8 reg = pca955x_read_input(pca955x->client, led->led_num / 8);
+
+	return !!(reg & (1 << (led->led_num % 8)));
+}
+
+static int pca955x_gpio_direction_input(struct gpio_chip *gc,
+					unsigned int offset)
+{
+	/* To use as input ensure pin is not driven */
+	pca955x_gpio_set_value(gc, offset, 0);
+
+	return 0;
+}
+
+static int pca955x_gpio_direction_output(struct gpio_chip *gc,
+					 unsigned int offset, int val)
+{
+	pca955x_gpio_set_value(gc, offset, val);
+
+	return 0;
+}
+#endif /* CONFIG_LEDS_PCA955X_GPIO */
+
 #if IS_ENABLED(CONFIG_OF)
 static struct pca955x_platform_data *
 pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
@@ -297,6 +362,8 @@ pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
 		snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].name),
 			 "%s", name);
 
+		pdata->leds[reg].type = PCA955X_TYPE_LED;
+		of_property_read_u32(child, "type", &pdata->leds[reg].type);
 		of_property_read_string(child, "linux,default-trigger",
 					&pdata->leds[reg].default_trigger);
 	}
@@ -332,6 +399,7 @@ static int pca955x_probe(struct i2c_client *client,
 	struct i2c_adapter *adapter;
 	int i, err;
 	struct pca955x_platform_data *pdata;
+	int ngpios = 0;
 
 	if (id) {
 		chip = &pca955x_chipdefs[id->driver_data];
@@ -392,9 +460,19 @@ static int pca955x_probe(struct i2c_client *client,
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
 		pca955x_led->pca955x = pca955x;
+		pca955x_led->type = pdata->leds[i].type;
 
-		/* Platform data can specify LED names and default triggers */
-		if (pdata) {
+		switch (pca955x_led->type) {
+		case PCA955X_TYPE_NONE:
+			break;
+		case PCA955X_TYPE_GPIO:
+			ngpios++;
+			break;
+		case PCA955X_TYPE_LED:
+			/*
+			 * Platform data can specify LED names and
+			 * default triggers
+			 */
 			if (pdata->leds[i].name)
 				snprintf(pca955x_led->name,
 					sizeof(pca955x_led->name), "pca955x:%s",
@@ -402,24 +480,21 @@ static int pca955x_probe(struct i2c_client *client,
 			if (pdata->leds[i].default_trigger)
 				pca955x_led->led_cdev.default_trigger =
 					pdata->leds[i].default_trigger;
-		} else {
-			snprintf(pca955x_led->name, sizeof(pca955x_led->name),
-				 "pca955x:%d", i);
+
+			pca955x_led->led_cdev.name = pca955x_led->name;
+			pca955x_led->led_cdev.brightness_set_blocking =
+				pca955x_led_set;
+
+			err = devm_led_classdev_register(&client->dev,
+							&pca955x_led->led_cdev);
+			if (err)
+				return err;
+
+			/* Turn off LED */
+			pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
 		}
-
-		pca955x_led->led_cdev.name = pca955x_led->name;
-		pca955x_led->led_cdev.brightness_set_blocking = pca955x_led_set;
-
-		err = devm_led_classdev_register(&client->dev,
-						 &pca955x_led->led_cdev);
-		if (err)
-			return err;
 	}
 
-	/* Turn off LEDs */
-	for (i = 0; i < pca95xx_num_led_regs(chip->bits); i++)
-		pca955x_write_ls(client, i, 0x55);
-
 	/* PWM0 is used for half brightness or 50% duty cycle */
 	pca955x_write_pwm(client, 0, 255-LED_HALF);
 
@@ -430,6 +505,34 @@ static int pca955x_probe(struct i2c_client *client,
 	pca955x_write_psc(client, 0, 0);
 	pca955x_write_psc(client, 1, 0);
 
+#ifdef CONFIG_LEDS_PCA955X_GPIO
+	if (ngpios) {
+		pca955x->gpio.label = "gpio-pca955x";
+		pca955x->gpio.direction_input = pca955x_gpio_direction_input;
+		pca955x->gpio.direction_output = pca955x_gpio_direction_output;
+		pca955x->gpio.set = pca955x_gpio_set_value;
+		pca955x->gpio.get = pca955x_gpio_get_value;
+		pca955x->gpio.request = pca955x_gpio_request_pin;
+		pca955x->gpio.can_sleep = 1;
+		pca955x->gpio.base = -1;
+		pca955x->gpio.ngpio = ngpios;
+		pca955x->gpio.parent = &client->dev;
+		pca955x->gpio.owner = THIS_MODULE;
+
+		err = devm_gpiochip_add_data(&client->dev, &pca955x->gpio,
+					     pca955x);
+		if (err) {
+			/* Use data->gpio.dev as a flag for freeing gpiochip */
+			pca955x->gpio.parent = NULL;
+			dev_warn(&client->dev, "could not add gpiochip\n");
+			return err;
+		}
+		dev_info(&client->dev, "gpios %i...%i\n",
+			 pca955x->gpio.base, pca955x->gpio.base +
+			 pca955x->gpio.ngpio - 1);
+	}
+#endif
+
 	return 0;
 }
 
diff --git a/include/dt-bindings/leds/leds-pca955x.h b/include/dt-bindings/leds/leds-pca955x.h
new file mode 100644
index 000000000000..78cb7e979de7
--- /dev/null
+++ b/include/dt-bindings/leds/leds-pca955x.h
@@ -0,0 +1,16 @@
+/*
+ * This header provides constants for pca955x LED bindings.
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#ifndef _DT_BINDINGS_LEDS_PCA955X_H
+#define _DT_BINDINGS_LEDS_PCA955X_H
+
+#define PCA955X_TYPE_NONE         0
+#define PCA955X_TYPE_LED          1
+#define PCA955X_TYPE_GPIO         2
+
+#endif /* _DT_BINDINGS_LEDS_PCA955X_H */
-- 
2.11.0
