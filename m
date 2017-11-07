Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TCR2duGK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ckvpkf+F"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLjN13dTzDrKr
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:32:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 07BB620D6E;
 Tue,  7 Nov 2017 02:32:06 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=s9F8DJpmiTjyjsMumqVCqJYGRB5+T
 mFWIHbYC/D7wIs=; b=TCR2duGKD8GecWt6Z7RHZtPUVFRo6EJWChiaKq26mbJGK
 0w6rK7MfFLNhgzDitwIg6BiCWR5xqDU9lHY7KCuOCYfsr4L1pB+LL6BAAblu319L
 6YrZxkWEsyLj/k5miuocjqBHrpWwQ6B+S+Uo26SJXalV+aNQ79aj2fF3FTqR8uAt
 jxOjWy7wYq5KiYdRKcE3xPa8D+n6lP+kfbXfXV7CmyRnp/u9YIPavlQwjAQHgIEP
 hD4IO597GeVoj8Al26DpNBIWN94NK93tcZEtznBvt279U/ZDIFiLJ6uDh6ZNJVrI
 ho2+n1izIZxJQa3WTg4CkSh5Mfdfsj43pQo1XGwYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=s9F8DJ
 pmiTjyjsMumqVCqJYGRB5+TmFWIHbYC/D7wIs=; b=ckvpkf+FY0dRq1bUVt9sfL
 6ZBp3XVCSQl+EZwJWNoT1duuyuUYHhh3eeYEbWRVPuFKUq8FNWT/UMD9vpNtUMy0
 jgVj95cv4Ig1pydMEE0yOmeuCwAzc2hzBM5aGzJEYgeHxIykH15Y36mxeIE3Egi3
 YuOXqhDSqSO5y6lQArYmzhnWLlGU3ttMsKymMMzSkKFG9iS8kqbXTzcvJuqLkaSL
 CsiQ7JZ8L95Ajq0rKXoZpHOf3rJvQubCqjkV9bDFdBV3R4lByiyDAqGufYycv+dv
 qvPR8nmGWPW83wPEAyrCPnUOoGeHrqfgpKqQOL9S7boLuuHG/JSuS0tfB6CRETdQ
 ==
X-ME-Sender: <xms:dWEBWmRyoLqfUepBZ3BH8jEnAZRqzg2hYPOOmybfsayOfWTLXf58Iw>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id ED43B242CF;
 Tue,  7 Nov 2017 02:32:03 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-4.13 18/23] leds: pca955x: check for I2C errors
Date: Tue,  7 Nov 2017 18:00:41 +1030
Message-Id: <20171107073046.13319-19-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:32:08 -0000

From: Cédric Le Goater <clg@kaod.org>

This should also allow probing to fail when a pca955x chip is not
found on a I2C bus.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
(cherry picked from commit 1591caf2d5eafdfb3b300691f8f99e5bb97d5406)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-pca955x.c | 114 ++++++++++++++++++++++++++++++++------------
 1 file changed, 83 insertions(+), 31 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index f062d1e7640f..0569ac8973fe 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -165,13 +165,18 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
  * Write to frequency prescaler register, used to program the
  * period of the PWM output.  period = (PSCx + 1) / 38
  */
-static void pca955x_write_psc(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	int ret;
 
-	i2c_smbus_write_byte_data(client,
+	ret = i2c_smbus_write_byte_data(client,
 		pca95xx_num_input_regs(pca955x->chipdef->bits) + 2*n,
 		val);
+	if (ret < 0)
+		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
+			__func__, n, val, ret);
+	return ret;
 }
 
 /*
@@ -181,38 +186,56 @@ static void pca955x_write_psc(struct i2c_client *client, int n, u8 val)
  *
  * Duty cycle is (256 - PWMx) / 256
  */
-static void pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	int ret;
 
-	i2c_smbus_write_byte_data(client,
+	ret = i2c_smbus_write_byte_data(client,
 		pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + 2*n,
 		val);
+	if (ret < 0)
+		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
+			__func__, n, val, ret);
+	return ret;
 }
 
 /*
  * Write to LED selector register, which determines the source that
  * drives the LED output.
  */
-static void pca955x_write_ls(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	int ret;
 
-	i2c_smbus_write_byte_data(client,
+	ret = i2c_smbus_write_byte_data(client,
 		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n,
 		val);
+	if (ret < 0)
+		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
+			__func__, n, val, ret);
+	return ret;
 }
 
 /*
  * Read the LED selector register, which determines the source that
  * drives the LED output.
  */
-static u8 pca955x_read_ls(struct i2c_client *client, int n)
+static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	int ret;
 
-	return (u8) i2c_smbus_read_byte_data(client,
+	ret = i2c_smbus_read_byte_data(client,
 		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
+			__func__, n, ret);
+		return ret;
+	}
+	*val = (u8)ret;
+	return 0;
 }
 
 static int pca955x_led_set(struct led_classdev *led_cdev,
@@ -223,6 +246,7 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	u8 ls;
 	int chip_ls;	/* which LSx to use (0-3 potentially) */
 	int ls_led;	/* which set of bits within LSx to use (0-3) */
+	int ret;
 
 	pca955x_led = container_of(led_cdev, struct pca955x_led, led_cdev);
 	pca955x = pca955x_led->pca955x;
@@ -232,7 +256,9 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 
 	mutex_lock(&pca955x->lock);
 
-	ls = pca955x_read_ls(pca955x->client, chip_ls);
+	ret = pca955x_read_ls(pca955x->client, chip_ls, &ls);
+	if (ret)
+		goto out;
 
 	switch (value) {
 	case LED_FULL:
@@ -252,26 +278,37 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 		 * OFF, HALF, or FULL.  But, this is probably better than
 		 * just turning off for all other values.
 		 */
-		pca955x_write_pwm(pca955x->client, 1,
-				255 - value);
+		ret = pca955x_write_pwm(pca955x->client, 1, 255 - value);
+		if (ret)
+			goto out;
 		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK1);
 		break;
 	}
 
-	pca955x_write_ls(pca955x->client, chip_ls, ls);
+	ret = pca955x_write_ls(pca955x->client, chip_ls, ls);
 
+out:
 	mutex_unlock(&pca955x->lock);
 
-	return 0;
+	return ret;
 }
 
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 /*
  * Read the INPUT register, which contains the state of LEDs.
  */
-static u8 pca955x_read_input(struct i2c_client *client, int n)
+static int pca955x_read_input(struct i2c_client *client, int n, u8 *val)
 {
-	return (u8)i2c_smbus_read_byte_data(client, n);
+	int ret = i2c_smbus_read_byte_data(client, n);
+
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
+			__func__, n, ret);
+		return ret;
+	}
+	*val = (u8)ret;
+	return 0;
+
 }
 
 static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
@@ -285,23 +322,32 @@ static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
 	return -EBUSY;
 }
 
-static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
-				   int val)
+static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
+			     int val)
 {
 	struct pca955x *pca955x = gpiochip_get_data(gc);
 	struct pca955x_led *led = &pca955x->leds[offset];
 
 	if (val)
-		pca955x_led_set(&led->led_cdev, LED_FULL);
+		return pca955x_led_set(&led->led_cdev, LED_FULL);
 	else
-		pca955x_led_set(&led->led_cdev, LED_OFF);
+		return pca955x_led_set(&led->led_cdev, LED_OFF);
+}
+
+static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				   int val)
+{
+	pca955x_set_value(gc, offset, val);
 }
 
 static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pca955x *pca955x = gpiochip_get_data(gc);
 	struct pca955x_led *led = &pca955x->leds[offset];
-	u8 reg = pca955x_read_input(pca955x->client, led->led_num / 8);
+	u8 reg = 0;
+
+	/* There is nothing we can do about errors */
+	pca955x_read_input(pca955x->client, led->led_num / 8, &reg);
 
 	return !!(reg & (1 << (led->led_num % 8)));
 }
@@ -310,17 +356,13 @@ static int pca955x_gpio_direction_input(struct gpio_chip *gc,
 					unsigned int offset)
 {
 	/* To use as input ensure pin is not driven */
-	pca955x_gpio_set_value(gc, offset, 0);
-
-	return 0;
+	return pca955x_set_value(gc, offset, 0);
 }
 
 static int pca955x_gpio_direction_output(struct gpio_chip *gc,
 					 unsigned int offset, int val)
 {
-	pca955x_gpio_set_value(gc, offset, val);
-
-	return 0;
+	return pca955x_set_value(gc, offset, val);
 }
 #endif /* CONFIG_LEDS_PCA955X_GPIO */
 
@@ -491,19 +533,29 @@ static int pca955x_probe(struct i2c_client *client,
 				return err;
 
 			/* Turn off LED */
-			pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
+			err = pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
+			if (err)
+				return err;
 		}
 	}
 
 	/* PWM0 is used for half brightness or 50% duty cycle */
-	pca955x_write_pwm(client, 0, 255-LED_HALF);
+	err = pca955x_write_pwm(client, 0, 255 - LED_HALF);
+	if (err)
+		return err;
 
 	/* PWM1 is used for variable brightness, default to OFF */
-	pca955x_write_pwm(client, 1, 0);
+	err = pca955x_write_pwm(client, 1, 0);
+	if (err)
+		return err;
 
 	/* Set to fast frequency so we do not see flashing */
-	pca955x_write_psc(client, 0, 0);
-	pca955x_write_psc(client, 1, 0);
+	err = pca955x_write_psc(client, 0, 0);
+	if (err)
+		return err;
+	err = pca955x_write_psc(client, 1, 0);
+	if (err)
+		return err;
 
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 	if (ngpios) {
-- 
2.11.0
