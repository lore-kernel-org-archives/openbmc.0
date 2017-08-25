Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdsMB2Cx7zDrKs
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 16:53:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bhU5Wrfz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="i5MyM5TP"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C9CF20DE9;
 Fri, 25 Aug 2017 02:53:40 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 02:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=RqXDlNpgaSZrmEkaJV
 jsiOzdVZc+khWjLDfRhic6flw=; b=bhU5WrfzSsBYK9N+1Y/M3BgnoQvEwbwYQA
 rdw0PkfPK3YOeNUoszwNXupuxIireGT8U5d2mDMNTsIm1Wm7lLSaKsN4YBN9+2LM
 d08txQ24H2hw6b+WwLQdhXV+7PSGauDbcWJtLXB2tzpDtJQ0eF6CGpiwFiyt8p93
 n+SuU2Bp+JlppJJRORIe/BCmAVv6O4AHg8zu8UVLEcnE9Gn2Hm2hDCFApF/XrnlF
 Li2YIeMNaGXb4nSq9h8+3/6jNipE0YdrgRFzDmRy32Ndpa3DMbkVeny+NJEQwgw/
 7qjbLwqgZpQo8RqyIlWAPz+usj8LBT0CBn2RatWs+P5wKU93EGZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=RqXDlNpgaSZrmEkaJVjsiOzdVZc+khWjLDfRhic6flw=; b=i5MyM5TP
 2IVwPG5x7fUUYOR2EEnqAksvzj/VW6SncxdnSQy1AmVfdZqni9gHiRs0BZFlemmq
 JgGoJweU0easjQqtsg4dyLFVMv5BCCBcXsTECjILnDC1PfgXzwL1BdFyG7RDObeF
 kfhBKu4DW6nCetadDGgDATGBbNDV4qUnY4EC8bwTlPssxNagaDnh5ygsHiOEMCKx
 8LZ793PHTqpYaeKAvKW6RrOgyMEFUOkfWxqMNL64Hq6kcRF707ynr/OPYvFtV4vt
 o6JmljT+tugD5UBOt8B+U0h/nMReunJ8SIZymlCEncvP13SRsliz7v1GWCyhzyEU
 Ww9JH8ajNdccSw==
X-ME-Sender: <xms:dMmfWUGaIFmiShawYNdWDRhDnjMBkVGg-kygOND1kcYP76PR5Z6tzg>
X-Sasl-enc: tHb1aOe2CD1hxfSl7omIIPTLuRlesD2R8b0qZIFCiZTA 1503644019
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id E110A240B1;
 Fri, 25 Aug 2017 02:53:36 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, clg@kaod.org, vishwa@linux.vnet.ibm.com,
 bjwyman@gmail.com, geissonator@gmail.com, eajames@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 3/5] leds: pca955x: Don't invert requested
 value in pca955x_gpio_set_value()
Date: Fri, 25 Aug 2017 16:22:42 +0930
Message-Id: <20170825065244.488-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170825065244.488-1-andrew@aj.id.au>
References: <20170825065244.488-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 25 Aug 2017 06:53:42 -0000

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
the LEDs which means wending our way through the gpiochip abstractions.
So with that in mind we need to describe an active-low GPIO
configuration to drive the LEDs as though they were GPIOs.

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
gpiod_direction_output(), like gpiod_get_value_cansleep, handles it for
us:

         int gpiod_direction_output(struct gpio_desc *desc, int value)
         {
                  VALIDATE_DESC(desc);
                  if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
                           value = !value;
                  else
                           value = !!value;
                  return _gpiod_direction_output_raw(desc, value);
         }

All-in-all, with a value of 'keep' for default-state property in the
gpio-leds child node, the current state of the hardware will in-fact be
inverted; precisely the opposite of what was intended.

Rework leds-pca955x so that we avoid the incorrect inversion and clarify
the semantics with respect to GPIO.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/leds/leds-pca955x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 0217bac2f47b..a02c1fd5dee9 100644
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
@@ -292,9 +295,9 @@ static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	struct pca955x_led *led = &pca955x->leds[offset];
 
 	if (val)
-		pca955x_led_set(&led->led_cdev, LED_FULL);
+		pca955x_led_set(&led->led_cdev, PCA955X_GPIO_HIGH);
 	else
-		pca955x_led_set(&led->led_cdev, LED_OFF);
+		pca955x_led_set(&led->led_cdev, PCA955X_GPIO_LOW);
 }
 
 static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
-- 
2.11.0
