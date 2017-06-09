Return-Path: <clg@kaod.org>
X-Greylist: delayed 507 seconds by postgrey-1.36 at bilbo;
 Fri, 09 Jun 2017 23:21:25 AEST
Received: from 11.mo6.mail-out.ovh.net (11.mo6.mail-out.ovh.net
 [188.165.38.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkjc52vzwzDqLV
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 23:21:25 +1000 (AEST)
Received: from player787.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id DDA62E321D
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 15:12:51 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id C04466000AC;
 Fri,  9 Jun 2017 15:12:48 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/5] leds: pca955x: add GPIO support
Date: Fri,  9 Jun 2017 15:12:27 +0200
Message-Id: <1497013949-8786-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497013949-8786-1-git-send-email-clg@kaod.org>
References: <1497013949-8786-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11444491078266882818
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrieehgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 09 Jun 2017 13:21:26 -0000

The PCA955x family of chips are I2C LED blinkers whose pins not used
to control LEDs can be used as general purpose I/Os (GPIOs).

The following adds such a support by defining different operation
modes for the pins (See bindings documentation for more details). The
pca955x driver is then extended with a gpio_chip when some of pins are
operating as GPIOs. The default operating mode is to behave as a LED.

The GPIO support is conditioned by CONFIG_LEDS_PCA955X_GPIO.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/leds/Kconfig                    |  11 +++
 drivers/leds/leds-pca955x.c             | 159 +++++++++++++++++++++++++++-----
 include/dt-bindings/leds/leds-pca955x.h |  16 ++++
 3 files changed, 163 insertions(+), 23 deletions(-)
 create mode 100644 include/dt-bindings/leds/leds-pca955x.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index c621cbbb5768..0177a36dab3d 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -352,6 +352,17 @@ config LEDS_PCA955X
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
index 13634a0f6238..92167425192f 100644
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
@@ -296,6 +361,8 @@ pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
 		snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].name),
 			 "%s", name);
 
+		pdata->leds[reg].type = PCA955X_TYPE_LED;
+		of_property_read_u32(child, "type", &pdata->leds[reg].type);
 		of_property_read_string(child, "linux,default-trigger",
 					&pdata->leds[reg].default_trigger);
 	}
@@ -331,6 +398,7 @@ static int pca955x_probe(struct i2c_client *client,
 	struct i2c_adapter *adapter;
 	int i, err;
 	struct pca955x_platform_data *pdata;
+	int ngpios = 0;
 
 	if (id) {
 		chip = &pca955x_chipdefs[id->driver_data];
@@ -390,36 +458,52 @@ static int pca955x_probe(struct i2c_client *client,
 	pca955x->chipdef = chip;
 
 	for (i = 0; i < chip->bits; i++) {
+		struct pca955x_led *pdata_led = &pdata->leds[i];
+
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
 		pca955x_led->pca955x = pca955x;
-
-		/* Platform data can specify LED names and default triggers */
-		if (pdata) {
-			if (pdata->leds[i].name)
+		pca955x_led->type = pdata_led->type;
+
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
+			if (pdata) {
+				if (pdata->leds[i].name)
+					snprintf(pca955x_led->name,
+						 sizeof(pca955x_led->name),
+						 "pca955x:%s",
+						 pdata->leds[i].name);
+				if (pdata->leds[i].default_trigger)
+					pca955x_led->led_cdev.default_trigger =
+						pdata->leds[i].default_trigger;
+			} else {
 				snprintf(pca955x_led->name,
-					sizeof(pca955x_led->name), "pca955x:%s",
-					pdata->leds[i].name);
-			if (pdata->leds[i].default_trigger)
-				pca955x_led->led_cdev.default_trigger =
-					pdata->leds[i].default_trigger;
-		} else {
-			snprintf(pca955x_led->name, sizeof(pca955x_led->name),
-				 "pca955x:%d", i);
-		}
+					 sizeof(pca955x_led->name),
+					 "pca955x:%d", i);
+			}
 
-		pca955x_led->led_cdev.name = pca955x_led->name;
-		pca955x_led->led_cdev.brightness_set_blocking = pca955x_led_set;
+			pca955x_led->led_cdev.name = pca955x_led->name;
+			pca955x_led->led_cdev.brightness_set_blocking =
+				pca955x_led_set;
 
-		err = devm_led_classdev_register(&client->dev,
-					&pca955x_led->led_cdev);
-		if (err)
-			return err;
-	}
+			err = devm_led_classdev_register(&client->dev,
+						 &pca955x_led->led_cdev);
+			if (err)
+				return err;
 
-	/* Turn off LEDs */
-	for (i = 0; i < pca95xx_num_led_regs(chip->bits); i++)
-		pca955x_write_ls(client, i, 0x55);
+			/* Turn off LED */
+			pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
+		}
+	}
 
 	/* PWM0 is used for half brightness or 50% duty cycle */
 	pca955x_write_pwm(client, 0, 255-LED_HALF);
@@ -431,6 +515,35 @@ static int pca955x_probe(struct i2c_client *client,
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
+		} else {
+			dev_info(&client->dev, "gpios %i...%i\n",
+				 pca955x->gpio.base, pca955x->gpio.base +
+				 pca955x->gpio.ngpio - 1);
+		}
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
2.7.4
