Return-Path: <bjwyman@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xh4NT5JrpzDqD0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 07:16:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G32c1X+o"; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id e2so1481357qta.3
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 14:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HsK+yYFu4rrRZed77mAtJUf4iDtqA+P5e+cmSroyvrU=;
 b=G32c1X+o1fLfPJU8iuzFjprnPDzk/LczQ+9N3zvZCOlZHVAfdeW6HA9grE5jsC0u6+
 EnFTTbRJhCFHM3SXWeyVNmJ2MrKcXhakkj/PcqnWdKz7DdzS23a0ezyRamb2ZcEmRpWN
 r2MY4SGGY7j+6lFjiz2t2+ctNddPAjwyRqr//DWxX/o65k/pIAQTeQqSuQ+1PbrgtcAI
 lRWUzQHFZmmHpVxeudi4SI+Vf6T4HEo9RiViFHKFyxccJiIVFhU0q+/4CzOmKVxWJmK+
 Mk2Je+RLjJ9eSsqCRGeopllTrfJ77WOaz8JwZl+VZfLXPoITjJ9cvc2ncwGfq1njeYa2
 sybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HsK+yYFu4rrRZed77mAtJUf4iDtqA+P5e+cmSroyvrU=;
 b=SehxwDn1qfV3BZ14wRe1WJ3IrMzT1yniHLDhIs9kHYEmpZdIptaUMfPcUyFWBs4NJ2
 RAYRxYZrTEALhpfbehS4XsNRvZY6Ra+9vDdTMqp2d86NxumM003B0PquQab+DLYd/LAa
 CtSrs2XrzotdciNZdGGsOpEpr/PcJ2kS+DIkChaf2cyS5gkcqtoCE9iNyrCZyTRizWbb
 sTGXJkXH3+mW5CSM85k89j+ReQsGwEOD8xjvQglu3sCZU0E30jLcaP2nXDolQDu9t0t7
 pQXbg1rvwRcHi+QZE7Br+2Xl8sOeroxt/m+1apxU5xkjv8PHSAKw4QwQC78wWBAay/im
 u7zA==
X-Gm-Message-State: AHYfb5iVZjmBL6+qP1mgo3TYYum6Zx9vhd+lvoEJlZ5bkMLbvMkkHZH+
 BkjKiz5vtkEKhGjHfhwfCqcsGeebRw==
X-Received: by 10.200.55.5 with SMTP id o5mr2964251qtb.228.1503954978655; Mon,
 28 Aug 2017 14:16:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.82.232 with HTTP; Mon, 28 Aug 2017 14:16:18 -0700 (PDT)
In-Reply-To: <1503897371.32695.16.camel@aj.id.au>
References: <20170825065244.488-1-andrew@aj.id.au>
 <20170825065244.488-4-andrew@aj.id.au>
 <503ada3f-cabe-0f73-1907-f1b62470c5ed@kaod.org>
 <1503897371.32695.16.camel@aj.id.au>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Mon, 28 Aug 2017 16:16:18 -0500
Message-ID: <CAK_vbW1-1Epk=eD017Lc=r6EMMdH9PKLpDYgBwePG8AQr65UUw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 3/5] leds: pca955x: Don't invert requested
 value in pca955x_gpio_set_value()
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, vishwa@linux.vnet.ibm.com, geissonator@gmail.com,
 Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 28 Aug 2017 21:17:50 -0000

On Mon, Aug 28, 2017 at 12:16 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Sun, 2017-08-27 at 09:03 +0200, C=C3=A9dric Le Goater wrote:
>> On 08/25/2017 08:52 AM, Andrew Jeffery wrote:
>> > The PCA9552 lines can be used either for driving LEDs or as GPIOs. The
>> > manual states that for LEDs, the operation is open-drain:
>> >
>> >          The LSn LED select registers determine the source of the LED =
data.
>> >
>> >            00 =3D output is set LOW (LED on)
>> >            01 =3D output is set high-impedance (LED off; default)
>> >            10 =3D output blinks at PWM0 rate
>> >            11 =3D output blinks at PWM1 rate
>> >
>> > For GPIOs it suggests a pull-up so that the open-case drives the line
>> > high:
>> >
>> >          For use as output, connect external pull-up resistor to the p=
in
>> >          and size it according to the DC recommended operating
>> >          characteristics.  LED output pin is HIGH when the output is
>> >          programmed as high-impedance, and LOW when the output is
>> >          programmed LOW through the =E2=80=98LED selector=E2=80=99 reg=
ister.  The output
>> >          can be pulse-width controlled when PWM0 or PWM1 are used.
>> >
>> > Now, I have a hardware design that uses the LED controller to control
>> > LEDs. However, for $reasons, we're using the leds-gpio driver to drive
>> > the LEDs which means wending our way through the gpiochip abstractions=
.
>> > So with that in mind we need to describe an active-low GPIO
>> > configuration to drive the LEDs as though they were GPIOs.
>> >
>> > The set() gpiochip callback in leds-pca955x does the following:
>> >
>> >          ...
>> >          if (val)
>> >                 pca955x_led_set(&led->led_cdev, LED_FULL);
>> >          else
>> >                 pca955x_led_set(&led->led_cdev, LED_OFF);
>> >          ...
>> >
>> > Where LED_FULL =3D 255. pca955x_led_set() in turn does:
>> >
>> >          ...
>> >          switch (value) {
>> >          case LED_FULL:
>> >                 ls =3D pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
>> >                 break;
>> >          ...
>> >
>> > Where PCA955X_LS_LED_ON is defined as:
>> >
>> > > > > >          #define PCA955X_LS_LED_ON  0x0     /* Output LOW */
>> >
>> > So here we have some type confusion: We've crossed domains from GPIO
>> > behaviour to LED behaviour without accounting for possible inversions
>> > in the process.
>> >
>> > Stepping back to leds-gpio for a moment, during probe() we call
>> > create_gpio_led(), which eventually executes:
>> >
>> >          if (template->default_state =3D=3D LEDS_GPIO_DEFSTATE_KEEP) {
>> >                 state =3D gpiod_get_value_cansleep(led_dat->gpiod);
>> >                 if (state < 0)
>> >                         return state;
>> >          } else {
>> >                 state =3D (template->default_state =3D=3D LEDS_GPIO_DE=
FSTATE_ON);
>> >          }
>> >          ...
>> >          ret =3D gpiod_direction_output(led_dat->gpiod, state);
>> >
>> > In the devicetree the GPIO is annotated as active-low, and
>> > gpiod_get_value_cansleep() handles this for us:
>> >
>> >          int gpiod_get_value_cansleep(const struct gpio_desc *desc)
>> >          {
>> >                  int value;
>> >
>> >                  might_sleep_if(extra_checks);
>> >                  VALIDATE_DESC(desc);
>> >                  value =3D _gpiod_get_raw_value(desc);
>> >                  if (value < 0)
>> >                          return value;
>> >
>> >                  if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
>> >                          value =3D !value;
>> >
>> >                  return value;
>> >          }
>> >
>> > _gpiod_get_raw_value() in turn calls through the get() callback for th=
e
>> > gpiochip implementation, so returning to our get() implementation in
>> > leds-pca955x we find we extract the raw value from hardware:
>> >
>> >          static int pca955x_gpio_get_value(struct gpio_chip *gc, unsig=
ned int offset)
>> >          {
>> >                  struct pca955x *pca955x =3D gpiochip_get_data(gc);
>> >                  struct pca955x_led *led =3D &pca955x->leds[offset];
>> >                  u8 reg =3D pca955x_read_input(pca955x->client, led->l=
ed_num / 8);
>> >
>> >                  return !!(reg & (1 << (led->led_num % 8)));
>> >          }
>> >
>> > This behaviour is not symmetric with that of set(), where the val is
>> > inverted by the driver.
>> >
>> > Closing the loop on the GPIO_ACTIVE_LOW inversions,
>> > gpiod_direction_output(), like gpiod_get_value_cansleep, handles it fo=
r
>> > us:
>> >
>> >          int gpiod_direction_output(struct gpio_desc *desc, int value)
>> >          {
>> >                   VALIDATE_DESC(desc);
>> >                   if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
>> >                            value =3D !value;
>> >                   else
>> >                            value =3D !!value;
>> >                   return _gpiod_direction_output_raw(desc, value);
>> >          }
>> >
>> > All-in-all, with a value of 'keep' for default-state property in the
>> > gpio-leds child node, the current state of the hardware will in-fact b=
e
>> > inverted; precisely the opposite of what was intended.
>> >
>> > Rework leds-pca955x so that we avoid the incorrect inversion and clari=
fy
>> > the semantics with respect to GPIO.
>>
>> I suppose this is correct. Have we made some tests on the pins directly
>> driven as GPIOs ?
>
> Well, nothing besides an LED. But is an LED not a satisfactory use-
> case? It's still a GPIO. As for active-high/active-low, well they're
> pretty thoroughly tested by the GPIO subsystem.
>
> Brandon Wyman has eyeballed the LEDs on a Witherspoon and confirms the
> problem is resolved (with a caveat)[1].
>
> I've rebased on top of the leds tree without issue. I'll send this
> patch upstream to get some feedback.
>
> Cheers,
>
> Andrew
>
> [1] https://github.com/openbmc/openbmc/issues/2156#issuecomment-325035185
>
>>
>> Thanks,
>>
>> C.
>>
>> >
>> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > ---
>> >  drivers/leds/leds-pca955x.c | 7 +++++--
>> >  1 file changed, 5 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>> > index 0217bac2f47b..a02c1fd5dee9 100644
>> > --- a/drivers/leds/leds-pca955x.c
>> > +++ b/drivers/leds/leds-pca955x.c
>> > @@ -61,6 +61,9 @@
>> > > > > >  #define PCA955X_LS_BLINK0  0x2     /* Blink at PWM0 rate */
>> > > > > >  #define PCA955X_LS_BLINK1  0x3     /* Blink at PWM1 rate */
>> >
>> > > > +#define PCA955X_GPIO_HIGH      LED_OFF
>> > > > +#define PCA955X_GPIO_LOW       LED_FULL
>> > +
>> >  enum pca955x_type {
>> > > >         pca9550,
>> > > >         pca9551,
>> > @@ -292,9 +295,9 @@ static void pca955x_gpio_set_value(struct gpio_chi=
p *gc, unsigned int offset,
>> > > >         struct pca955x_led *led =3D &pca955x->leds[offset];
>> >
>> > > >         if (val)
>> > > > -               pca955x_led_set(&led->led_cdev, LED_FULL);
>> > > > +               pca955x_led_set(&led->led_cdev, PCA955X_GPIO_HIGH)=
;
>> > > >         else
>> > > > -               pca955x_led_set(&led->led_cdev, LED_OFF);
>> > > > +               pca955x_led_set(&led->led_cdev, PCA955X_GPIO_LOW);
>> >  }
>> >
>> >  static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int =
offset)
>> >
>>
>>

Tested-by: Brandon Wyman <bjwyman@gmail.com>
