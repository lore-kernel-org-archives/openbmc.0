Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xk7N159ZNzDqGZ
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 15:39:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KUxTxVr4"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hBcpirPQ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4271B20DAE;
 Fri,  1 Sep 2017 01:39:10 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 01 Sep 2017 01:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=b/BMCGjmIlP5kjDUEXErgozgSloyxSBB0ojSJcYfI
 vU=; b=KUxTxVr4+NzX9QR6uEgSU9NscPSKwaSpxhTaV6NqZrJnNhFp0l3w1Df7C
 qiqQwjlpw556ggAVNFyhJ7mjP5VRb/33a2iNjsMSC3YKY1m/uhZe5lXUBcvtu8yZ
 6HadWvvxKY6ylZSXHZto7S5VAB2i33ju+BhimLEDWOulMHr4ubm4XrqscZWvMfZz
 18Ky0WdwnPk3S+mqq/ytlM8u/o1x+pjlekN7/EEZJH6zDL0ltC5cR6hx05bXtvrR
 F3+WjPTDhdfdOUOVke/ednrqqumv8e8AL60ljI91LXKfVfm6fSW/Wye65arnuMF5
 n9yWZBMceaqxgNng3fgjddrVZ8JWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=b/BMCGjmIlP5kjDUEX
 ErgozgSloyxSBB0ojSJcYfIvU=; b=hBcpirPQMGopmZ5vQ/G80hajPc40ICfJzy
 o22bsIn+SOg6PCRO0RfPdwhe4G901amJw4P3GsssnMgMRvQZoXHunK18nHaioGfw
 OJCkTtsyl7S5IhfMRsMTVcdpu9TKrLAk1wntqYLRNHX9meTEsvBeQZNAAnor5eZ1
 hL8a3AMuWpOaAx5KaKsVWvZKDR16JaLejaMQweFY1jZI+nVKdIRlHb23sJhxgCv6
 ayblyN1/KigZw0vQE2/wHDgm1ZilZWnPGU7leRkpBdVGMpnPMltP+kFkOHqbSU3J
 Un+T+sYPvroWKnRX6osO6QG/i/9WYpKC7DfYExfcblLleLVnAuZw==
X-ME-Sender: <xms:fvKoWc_QAUagEqLEoCjnoYd09_XENr3pZeTBBhnrEJdQaAaETqhQtw>
X-Sasl-enc: 4G3DUtJPPoFKN4XvhcjQNR9V//6M4O/YBkRJpxwmRmbu 1504244349
Received: from keelia.au.ibm.com (ppp14-2-65-251.bras21.adl6.internode.on.net
 [14.2.65.251])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDAB47E187;
 Fri,  1 Sep 2017 01:39:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-kernel@vger.kernel.org,
 clg@kaod.org, bjwyman@gmail.com, openbmc@lists.ozlabs.org
Subject: [PATCH v2] leds: pca955x: Don't invert requested value in
 pca955x_gpio_set_value()
Date: Fri,  1 Sep 2017 15:08:58 +0930
Message-Id: <20170901053858.10070-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 01 Sep 2017 05:39:15 -0000

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
---

I've rebased on top of "1591caf2d5ea leds: pca955x: check for I2C errors" and
resolved the conflicts.

 drivers/leds/leds-pca955x.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 905729191d3e..6dcd2d7cc6a4 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -61,6 +61,9 @@
 #define PCA955X_LS_BLINK0	0x2	/* Blink at PWM0 rate */
 #define PCA955X_LS_BLINK1	0x3	/* Blink at PWM1 rate */
 
+#define PCA955X_GPIO_HIGH	LED_OFF
+#define PCA955X_GPIO_LOW	LED_FULL
+
 enum pca955x_type {
 	pca9550,
 	pca9551,
@@ -329,9 +332,9 @@ static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
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
-- 
2.11.0
