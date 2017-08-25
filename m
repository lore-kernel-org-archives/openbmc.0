Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdtSc5ts3zDqYR
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 17:43:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="HU0QAAgM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="kOO+yMZK"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A5B920C1B;
 Fri, 25 Aug 2017 03:43:23 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 03:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=L+YSE2AIyS7H65tzDVl22iti3DwG7vynSQGVNdaYk
 ok=; b=HU0QAAgMCK4KgTUmDLXwgYxEbeLDEgpEjCvYEB2ZME9jtQLr0QIIKLw7R
 5hP5bTGJeZyZSgrffayyb+1gZi30YHeTPGuNU8PZlSgyLL6foKvc2FFVZ2+Agpfb
 okggbFu3nXWiblWJ4sNDihTaiV6+sUksdnbZ16peHg1Yk0QbKpcIaavmmgck0TEB
 7mq8WUpLQKiQCxH0U0V2jujUkSy7DKpFrrENNpcvSRavJNNsYZYMmcTHbrRVuT70
 PHj1aSnoTmRTgTkC4L9GAh0kWBdn0mLV+6Li1yLJTElmi4camnX1Xs93+6xyxLkd
 Wzlb535sS7sm3v1/lDRACjWEUh+6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=L+YSE2AIyS7H65tzDV
 l22iti3DwG7vynSQGVNdaYkok=; b=kOO+yMZK/DA8bnkeWm+YXrnQ5uC2QavNjo
 eyz0TMExRSZK/jZms2pmY9/AXxeoiEeY4PGfpErLVG9wgdIGSh9qD4QQ5IPKIfoc
 PF+cvwJNglQhg7EI1TsS62qGB+8SkLVDrX9ZR1xSEjm4CJ7sS7MIsvIyZavIp6vW
 6owFkmJ7cXORcee1AP7iEY71lPL6be8zahoPoCP1rG6Mpo4LAaBJUWGZ6nGmmFfM
 1/eFDK+XGsk9Bg8Bi5nwuocNMo2JFy/Uyt2iJtjcLs+HwOQ/6dl/787SQbIE3JKH
 i7h6nd45DLWfQinvh2uu4HC7gbWyUzhtzhrx8RExPwSuQ02/0/Yw==
X-ME-Sender: <xms:G9WfWcrvz4v8KuWT-1EDR95ze4c5w9QiGzaUHo48lGn0GzID7qRo9Q>
X-Sasl-enc: BrvEgWaJ/W0HL45WOxzvJS0qUUtpc3nKIX9JvU3NnD6Q 1503647002
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 759BF24767;
 Fri, 25 Aug 2017 03:43:20 -0400 (EDT)
Message-ID: <1503646994.32695.3.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 2/5] leds: gpio: Allow LED to retain
 state at shutdown
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, joel@jms.id.au
Cc: vishwa@linux.vnet.ibm.com, bjwyman@gmail.com, geissonator@gmail.com, 
 eajames@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Date: Fri, 25 Aug 2017 17:13:14 +0930
In-Reply-To: <38dac127-c8ac-739b-82ba-806d36355cb9@kaod.org>
References: <20170825065244.488-1-andrew@aj.id.au>
 <20170825065244.488-3-andrew@aj.id.au>
 <38dac127-c8ac-739b-82ba-806d36355cb9@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-QcpWQbhAJNTyaugGqD3h"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 25 Aug 2017 07:43:30 -0000


--=-QcpWQbhAJNTyaugGqD3h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-08-25 at 09:40 +0200, C=C3=A9dric Le Goater wrote:
> On 08/25/2017 08:52 AM, Andrew Jeffery wrote:
> > In some systems, such as BMCs, we want to retain the state of LEDs
> > across a reboot of the BMC whilst the host remains up.
> >=20
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0drivers/leds/leds-gpio.c | 7 ++++++-
> > =C2=A0include/linux/leds.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 3 +++
> > =C2=A02 files changed, 9 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> > index d400dcaf4d29..061ab9220048 100644
> > --- a/drivers/leds/leds-gpio.c
> > +++ b/drivers/leds/leds-gpio.c
> > @@ -134,6 +134,8 @@ static int create_gpio_led(const struct gpio_led *t=
emplate,
> > > > =C2=A0		led_dat->cdev.flags |=3D LED_CORE_SUSPENDRESUME;
> > > > =C2=A0	if (template->panic_indicator)
> > > > =C2=A0		led_dat->cdev.flags |=3D LED_PANIC_INDICATOR;
> > > > +	if (template->retain_state_shutdown)
> > > > +		led_dat->cdev.flags |=3D LED_RETAIN_AT_SHUTDOWN;
> > =C2=A0
> > > > =C2=A0	ret =3D gpiod_direction_output(led_dat->gpiod, state);
> > > > =C2=A0	if (ret < 0)
> > @@ -203,6 +205,8 @@ static struct gpio_leds_priv *gpio_leds_create(stru=
ct platform_device *pdev)
> > =C2=A0
> > > > =C2=A0		if (fwnode_property_present(child, "retain-state-suspended"=
))
> > > > =C2=A0			led.retain_state_suspended =3D 1;
> > > > +		if (fwnode_property_present(child, "retain-state-shutdown"))
> > > > +			led.retain_state_shutdown =3D 1;
> > > > =C2=A0		if (fwnode_property_present(child, "panic-indicator"))
> > > > =C2=A0			led.panic_indicator =3D 1;
> > =C2=A0
> > @@ -265,7 +269,8 @@ static void gpio_led_shutdown(struct platform_devic=
e *pdev)
> > > > =C2=A0	for (i =3D 0; i < priv->num_leds; i++) {
> > > > =C2=A0		struct gpio_led_data *led =3D &priv->leds[i];
> > =C2=A0
> > > > -		gpio_led_set(&led->cdev, LED_OFF);
> > > > +		if (!(led->cdev.flags & LED_RETAIN_AT_SHUTDOWN))
> > > > +			gpio_led_set(&led->cdev, LED_OFF);
> > > > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index 569cb531094c..4d39f767f34a 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -46,6 +46,8 @@ struct led_classdev {
> > > > =C2=A0#define LED_DEV_CAP_FLASH	(1 << 18)
> > > > =C2=A0#define LED_HW_PLUGGABLE	(1 << 19)
> > > > =C2=A0#define LED_PANIC_INDICATOR	(1 << 20)
> > +#define LED_BRIGHT_HW_CHANGED	(1 << 21)
>=20
> where does this come from ? is it used ?

Ah, forgot to comment about that. It comes from upstream. I backported
the changes from on top of v4.13-rc6.

I kept it from the conflict to justify using (1 << 22) below, to remain
compatible with upstream.

Andrew

>=20
> Thanks,
>=20
> C.
>=20
> > > > +#define LED_RETAIN_AT_SHUTDOWN	(1 << 22)
> > =C2=A0
> > > > =C2=A0	/* set_brightness_work / blink_timer flags, atomic, private.=
 */
> > > > > > =C2=A0	unsigned long		work_flags;
> > @@ -378,6 +380,7 @@ struct gpio_led {
> > > > > > =C2=A0	unsigned	retain_state_suspended : 1;
> > > > > > =C2=A0	unsigned	panic_indicator : 1;
> > > > > > =C2=A0	unsigned	default_state : 2;
> > > > > > +	unsigned	retain_state_shutdown : 1;
> > > > =C2=A0	/* default_state should be one of LEDS_GPIO_DEFSTATE_(ON|OFF=
|KEEP) */
> > > > =C2=A0	struct gpio_desc *gpiod;
> > =C2=A0};
> >=20
>=20
>=20
--=-QcpWQbhAJNTyaugGqD3h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZn9USAAoJEJ0dnzgO5LT5ZtgQAKRpa+idOYX8BxkEHQXpRy3s
e8+Oiwx/UQrp8+B9jfg3rrPn5wDRZuO4loauT+vyl/BiVVgNaJ57O7q78iGB3IhH
Sc0Q7qLnSl35SYmpANLOybHX+cFo+oqv5p9L3G92ypgyYV7a4QuNdkzxBuApznQP
T6U8tH/B0a/uoa0kdeEyag33dovmPYt/RYyuTh5ECbZ6+6mQybQdmjUeLhH/bwmJ
gANr2wrw34Ck0h33trLTytvT8JwAfL1Gy12elOqUMFjDTeQOUsJ5GpLWHYk9z9Bp
ATHhirv3whJpWYBbxE0/KC2cNNHV2Al443exz6OrsUIpDx+voqw+acKZij1b4gk3
9VogeFeTkrSBydrypqbR+/QOO5eZRPLu6ucqc3mRwenJeEFh2aRTloOmjVkoJmSC
SYgpuQp7+wSnwJUEfKOWwnpxSX4HIHr5Tr9rsxoL8d6BKVrz31ovOgXrGQO9V2QO
RlbY3YQR0pe1mzgNAXY8TZRdFuFsm/rtnLeRn1fyxSSDJpr0aUk7pXBDJydUVAY7
Jg/G8oRxcxoEVtiNml9dQeQm1FA3OkX1+FhYgG97MQwrrJ5ZBVi8VfltacohD7JP
Xflo7GKQbjVAIRr8V6QGYE6UafpZ25FqLnvA+c/sgPDMTigub2v7EPFBWY9ly9Us
x67CCWjutF8BJz8m51ks
=a81o
-----END PGP SIGNATURE-----

--=-QcpWQbhAJNTyaugGqD3h--
