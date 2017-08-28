Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xggjy53fszDqF0
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 15:46:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nv/6PIY7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CbUUUkwY"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A3834210DC;
 Mon, 28 Aug 2017 01:46:11 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 28 Aug 2017 01:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=XYRzJ5bfS3XZdTVW5SbLHwh9NPkOc7TkjtxOdz6Va
 w8=; b=nv/6PIY7gmEK3RV1aZUZk1p5Xv+nbqwS3BO+l8UCUUKWpsAbDWCoCiRMs
 6uAi5RZyyvN1TQtbJGyWrF6mTpRGHwcwbifldalVeMZ+hE016c97PPvNMeofWK3n
 XR8Sr1E4M5cA/30jIM80CjMPB9GrtDTHvhNAdeoLlVaSD2uONtsXM72RfYXe8hb9
 lOLtdWcOnYwjoiDu4thRWQ5xUGGJYv4gaZpxc7tfrnnYvD3A+5d2X1wZ0X6TmxWQ
 y+4tPCp2BZijaYNlXIGS7OkFmeuj2HL9EukcenwbU2vXIe/LFSjgY6tE+NdPK443
 rbOB21X8kLSs48Uq8g75VPeAsGBuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=XYRzJ5bfS3XZdTVW5S
 bLHwh9NPkOc7TkjtxOdz6Vaw8=; b=CbUUUkwY1ne/J2bAsjCWO+s9yLKmHE+LJn
 L/1MgJ7psZNwtLseKJaxBG0usJklT26QipZ0OenIuVqzAg2Ud8U8mhCV4OSFrb2S
 Tvr3Tp9HkUz8B5jhjR73FL1n/Smsx1Fp7RlIsxnRtq7T8OnIWSwpqjtXyPnvLC1x
 1ZiCXc/J4zzXGAkYDYOPzceq/rrs/nwwitI+xNRuIF2s0C/4S2V71p3+6Jk8EKPy
 z/SH0hj4mySVNI/1ZT1CValKmUU/KQdBmuFp89XdBZs7hwQJCIXZl9mCkYNGXpRX
 pg7Sfu+YhEGjp1HZtnyRFm7G4WrBzH0Z/jVp6y5gaVO9PGX6uMwg==
X-ME-Sender: <xms:I66jWQi0QZuXnS2SFIMl3cpfJ5Z3dV_Y_LqzN_uXQy2bFcAwseu4zg>
X-Sasl-enc: 2iBgbuwM06Z7acIVEFBCX2GDA8jGMalCBTaLQbRJxyPb 1503899170
Received: from keelia.aj.id.au (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2117A24605;
 Mon, 28 Aug 2017 01:46:07 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-leds@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, linux-kernel@vger.kernel.org,
 clg@kaod.org, bjwyman@gmail.com, openbmc@lists.ozlabs.org
Subject: [PATCH] leds: pca955x: Don't invert requested value in
 pca955x_gpio_set_value()
Date: Mon, 28 Aug 2017 15:15:59 +0930
Message-Id: <20170828054559.16654-1-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 28 Aug 2017 05:46:15 -0000

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
 drivers/leds/leds-pca955x.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 09303fd1fdc6..8b8f81cf10cb 100644
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
