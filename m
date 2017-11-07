Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kPhIG/11"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="r5muVojJ"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWLjQ41WzzDrKv
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 18:32:10 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 63C1120C5C;
 Tue,  7 Nov 2017 02:32:08 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 07 Nov 2017 02:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=8GUZIb0L9y4TQFXcxEiKwmp0SHMkH
 UaPA6H8Db7r5GQ=; b=kPhIG/11N+ZnKi/PJn4VX7zZ9X6bEnQOW6QJCb4Rf4Ozb
 wIAjmezJIoZ0vD+Znw+ffuTT5reAWwo4DO9hy6masxkRMhLP0GUSEurXMN65RAbx
 y9cPMgmynQHHw1nAoj6K8KaH/FuzzpGJX3XymW92Gxpqc7IczfdfgEVYVrFaCGQk
 nmNCTN491wVB2k+0MIZ6gVab2KCEQQUuXX5spuqZylod4yC7DPMCTMURsLBK4bxT
 Jdl087l5yMsNy6Y3svVoSv7e/7cKgHGbsNDHBXfzZuYQ4NYzORaF9dXufQXeCbAB
 CuV19elGN0+iS5tO09VMiayN76xq5c0olo5l6CErw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8GUZIb
 0L9y4TQFXcxEiKwmp0SHMkHUaPA6H8Db7r5GQ=; b=r5muVojJ7rM65OUKG7qdCZ
 p2y2PDhYZakXWb1g6bsXtzyPYYazY0mZLtZNKShrxZE8NXP3/bKMLx5D5AEwuWxP
 DtezgRXGHaNGowmMhOmnaXdgtGTwU6x96yEOGPSj+xx+ilnyeSeP4Qzuf/ICYR8O
 VLnfbVHtGDPimqMhaIV4op0GJiuJe1x3cHZQVV0oyex/rEk4KVRCppFFa59KB/W2
 SjvI+VoAHU51BAiBoOzssCpzMqxtywydvLw1ciMuZ5QlD9ReWMcKHhCXkDK7V/s0
 RSuMxbg2jZnPekQPbpSsb31YFrNmjtcs6JceLyv2Lz36AKCZqN4U8Ldsf+T8SKJw
 ==
X-ME-Sender: <xms:eGEBWk13aN8Z-iAqLgG0OZ66-_ZmS_Gzmv6B_tJPIEBNmmBwQ_hJrw>
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74CA9242CF;
 Tue,  7 Nov 2017 02:32:06 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 19/23] leds: pca955x: Don't invert requested
 value in pca955x_gpio_set_value()
Date: Tue,  7 Nov 2017 18:00:42 +1030
Message-Id: <20171107073046.13319-20-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 07 Nov 2017 07:32:12 -0000

The PCA9552 lines can be used either for driving LEDs or as GPIOs. The
manual states that for LEDs, the operation is open-drain:

         The LSn LED select registers determine the source of the LED data.

           00 = output is set LOW (LED on)
           01 = output is set high-impedance (LED off; default)
           10 = output blinks at PWM0 rate
           11 = output blinks at PWM1 rate

For GPIOs it suggests a pull-up so that the open-case drives the line
high:

         For use as output, connect external pull-up resistor to the pin
         and size it according to the DC recommended operating
         characteristics.  LED output pin is HIGH when the output is
         programmed as high-impedance, and LOW when the output is
         programmed LOW through the ‘LED selector’ register.  The output
         can be pulse-width controlled when PWM0 or PWM1 are used.

Now, I have a hardware design that uses the LED controller to control
LEDs. However, for $reasons, we're using the leds-gpio driver to drive
the them. The reasons are here are a tangent but lead to the discovery
of the inversion, which manifested as the LEDs being set to full
brightness at boot when we expected them to be off.

As we're driving the LEDs through leds-gpio, this means wending our way
through the gpiochip abstractions. So with that in mind we need to
describe an active-low GPIO configuration to drive the LEDs as though
they were GPIOs.

The set() gpiochip callback in leds-pca955x does the following:

         ...
         if (val)
                pca955x_led_set(&led->led_cdev, LED_FULL);
         else
                pca955x_led_set(&led->led_cdev, LED_OFF);
         ...

Where LED_FULL = 255. pca955x_led_set() in turn does:

         ...
         switch (value) {
         case LED_FULL:
                ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
                break;
         ...

Where PCA955X_LS_LED_ON is defined as:

         #define PCA955X_LS_LED_ON	0x0	/* Output LOW */

So here we have some type confusion: We've crossed domains from GPIO
behaviour to LED behaviour without accounting for possible inversions
in the process.

Stepping back to leds-gpio for a moment, during probe() we call
create_gpio_led(), which eventually executes:

         if (template->default_state == LEDS_GPIO_DEFSTATE_KEEP) {
                state = gpiod_get_value_cansleep(led_dat->gpiod);
                if (state < 0)
                        return state;
         } else {
                state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
         }
         ...
         ret = gpiod_direction_output(led_dat->gpiod, state);

In the devicetree the GPIO is annotated as active-low, and
gpiod_get_value_cansleep() handles this for us:

         int gpiod_get_value_cansleep(const struct gpio_desc *desc)
         {
                 int value;

                 might_sleep_if(extra_checks);
                 VALIDATE_DESC(desc);
                 value = _gpiod_get_raw_value(desc);
                 if (value < 0)
                         return value;

                 if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
                         value = !value;

                 return value;
         }

_gpiod_get_raw_value() in turn calls through the get() callback for the
gpiochip implementation, so returning to our get() implementation in
leds-pca955x we find we extract the raw value from hardware:

         static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
         {
                 struct pca955x *pca955x = gpiochip_get_data(gc);
                 struct pca955x_led *led = &pca955x->leds[offset];
                 u8 reg = pca955x_read_input(pca955x->client, led->led_num / 8);

                 return !!(reg & (1 << (led->led_num % 8)));
         }

This behaviour is not symmetric with that of set(), where the val is
inverted by the driver.

Closing the loop on the GPIO_ACTIVE_LOW inversions,
gpiod_direction_output(), like gpiod_get_value_cansleep(), handles it
for us:

         int gpiod_direction_output(struct gpio_desc *desc, int value)
         {
                  VALIDATE_DESC(desc);
                  if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
                           value = !value;
                  else
                           value = !!value;
                  return _gpiod_direction_output_raw(desc, value);
         }

All-in-all, with a value of 'keep' for default-state property in a
leds-gpio child node, the current state of the hardware will in-fact be
inverted; precisely the opposite of what was intended.

Rework leds-pca955x so that we avoid the incorrect inversion and clarify
the semantics with respect to GPIO.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Joel Stanley <joel@jms.id.au>
Tested-by: Matt Spinler <mspinler@linux.vnet.ibm.com>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
(cherry picked from commit 52ca7d0f7bdad832b291ed979146443533ee79c0)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-pca955x.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 0569ac8973fe..9b41f25607c5 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -61,6 +61,10 @@
 #define PCA955X_LS_BLINK0	0x2	/* Blink at PWM0 rate */
 #define PCA955X_LS_BLINK1	0x3	/* Blink at PWM1 rate */
 
+#define PCA955X_GPIO_INPUT	LED_OFF
+#define PCA955X_GPIO_HIGH	LED_OFF
+#define PCA955X_GPIO_LOW	LED_FULL
+
 enum pca955x_type {
 	pca9550,
 	pca9551,
@@ -329,9 +333,9 @@ static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
 	struct pca955x_led *led = &pca955x->leds[offset];
 
 	if (val)
-		return pca955x_led_set(&led->led_cdev, LED_FULL);
-	else
-		return pca955x_led_set(&led->led_cdev, LED_OFF);
+		return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_HIGH);
+
+	return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_LOW);
 }
 
 static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
@@ -355,8 +359,11 @@ static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 static int pca955x_gpio_direction_input(struct gpio_chip *gc,
 					unsigned int offset)
 {
-	/* To use as input ensure pin is not driven */
-	return pca955x_set_value(gc, offset, 0);
+	struct pca955x *pca955x = gpiochip_get_data(gc);
+	struct pca955x_led *led = &pca955x->leds[offset];
+
+	/* To use as input ensure pin is not driven. */
+	return pca955x_led_set(&led->led_cdev, PCA955X_GPIO_INPUT);
 }
 
 static int pca955x_gpio_direction_output(struct gpio_chip *gc,
-- 
2.11.0
