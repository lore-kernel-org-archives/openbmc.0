Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s75960PHVzDqJ5
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 15:11:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=i0NYXKYg; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=fZEtLgB8; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id ABF9C20160;
 Mon,  8 Aug 2016 01:11:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 08 Aug 2016 01:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=stbe6
 YSkdLf/mQDCRrhOldn54Ys=; b=i0NYXKYgYKHJBThLtQLluEYYsqKaBFyVREH15
 nXjxa162YfhP2zjozdSVGjZSNUcYbR7wh/qWeDEEv90lmqDaboCRL8K90AaaY8vL
 TzES4rFbP2RzK7wHXlNeJfFS/r6cRVW2lUdVtOipnzLUqWQGf/y37XAVcMGt+MSt
 9TE/M8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=stbe6YSkdLf/mQDCRrhOldn54Ys=; b=fZEtL
 gB8TfYjk89I0tJErx8vhpRmmZH8q7c4FkVwzxu/WUjQfsbrpn2bwv01wjLlP/NXX
 468+eTL0yOED+J1CrkI7mTV/5cZSCM6WXDDKuh+ofQ4IrXgEOpRBG9hZWD6YxGNW
 vOzQUtEtWCRKHPc750L9TYsoomdjU9X2E1VR50=
X-Sasl-enc: T0f41nAgLpsz2jc79DBWzYpXH6xBKRnG15W6+D6GEiXB 1470633060
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 025E0F285F;
 Mon,  8 Aug 2016 01:10:59 -0400 (EDT)
Message-ID: <1470633053.27272.5.camel@aj.id.au>
Subject: Re: [PATCH] gpio-aspeed: Write value on switch to output
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: johnhcwang <hsienchiang@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Mon, 08 Aug 2016 14:40:53 +0930
In-Reply-To: <CACPK8XcAX6hkLAd7kmweaF3u8BJWa9PEwV8Hnep4+3W0JjuvAg@mail.gmail.com>
References: <20160805122336.6836-1-andrew@aj.id.au>
 <CACPK8XcAX6hkLAd7kmweaF3u8BJWa9PEwV8Hnep4+3W0JjuvAg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-SxwA5xhjq+svKvdvn5MF"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 05:11:07 -0000


--=-SxwA5xhjq+svKvdvn5MF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-08-08 at 14:36 +0930, Joel Stanley wrote:
> On Fri, Aug 5, 2016 at 9:53 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > [0] notes that the Barreleye beep LED turned off during boot despite
> > configuring the default-state DT property to "on". The documentation fo=
r the
> > direction_output() callback in struct gpio_chip doesn't make any mentio=
n of
> > setting values[1] but the function prototype takes a value as a formal
> > parameter. Additionally, other drivers' callback implementations (e.g. =
the
> > gemini GPIO driver) write out the provided value.
> >=20
> > Make the Aspeed GPIO driver implementation consistent with the expected
> > behaviour.
> >=20
> > [0] https://github.com/openbmc/linux/issues/98
> > [1] "@direction_output: configures signal "offset" as output, or return=
s error"
> Thanks. I applied the version that you intended to send to my
> development tree. I think we want to push this out to dev-4.4 for the
> barreleye stable branch too?

Yes, I think that would allow us to close #98.

Cheers,

Andrew

>=20
> Cheers,
>=20
> Joel
>=20
> >=20
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0drivers/gpio/gpio-aspeed.c | 31 ++++++++++++++++++++-----------
> > =C2=A01 file changed, 20 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> > index 2ecaa2b12759..7817b98fe8cd 100644
> > --- a/drivers/gpio/gpio-aspeed.c
> > +++ b/drivers/gpio/gpio-aspeed.c
> > @@ -120,23 +120,29 @@ static int aspeed_gpio_get(struct gpio_chip *gc, =
unsigned int offset)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
& GPIO_BIT(offset));
> > =C2=A0}
> >=20
> > -static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0int val)
> > +static void __aspeed_gpio_set(void __iomem *addr, unsigned int offset,=
 int val)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct aspeed_gpio *gpio =3D=
 to_aspeed_gpio(gc);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct aspeed_gpio_ban=
k *bank =3D to_bank(offset);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long flags;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 reg;
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irqsave(&gpio->loc=
k, flags);
> > -
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D ioread32(bank_val_re=
g(gpio, bank, GPIO_DATA));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D ioread32(addr);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (val)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0reg |=3D GPIO_BIT(offset);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0reg &=3D ~GPIO_BIT(offset);
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iowrite32(reg, bank_val_reg(=
gpio, bank, GPIO_DATA));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iowrite32(reg, addr);
> > +}
> > +
> > +static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0int val)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct aspeed_gpio *gpio =3D=
 to_aspeed_gpio(gc);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct aspeed_gpio_ban=
k *bank =3D to_bank(offset);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long flags;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irqsave(&gpio->loc=
k, flags);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__aspeed_gpio_set(bank_val_r=
eg(gpio, bank, GPIO_DATA), offset, val);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock_irqrestore(=
&gpio->lock, flags);
> > =C2=A0}
> > @@ -163,13 +169,16 @@ static int aspeed_gpio_dir_out(struct gpio_chip *=
gc,
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct aspeed_gpio *gpi=
o =3D to_aspeed_gpio(gc);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct aspeed_gpi=
o_bank *bank =3D to_bank(offset);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *addr =3D bank_=
val_reg(gpio, bank, GPIO_DIR);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long flags;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32 reg;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irqsave(&gpio=
->lock, flags);
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D ioread32(bank_val_re=
g(gpio, bank, GPIO_DIR));
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iowrite32(reg | GPIO_BIT(off=
set), bank_val_reg(gpio, bank, GPIO_DIR));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D ioread32(addr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0iowrite32(reg | GPIO_BIT(off=
set), addr);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__aspeed_gpio_set(addr, offs=
et, val);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock_irqrestore(=
&gpio->lock, flags);
> >=20
> > --
> > 2.9.2.597.g66765a4
> >=20
--=-SxwA5xhjq+svKvdvn5MF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXqBRdAAoJEJ0dnzgO5LT5zUMQAJw9hqN41+/yFpQf4P05ZhzT
yKJkL2PYCHZJDkFbMis0oSdHBHSV+JQEWVkbKcsrBD5jX1MQUd4rV0lH+bb6a+36
oSk0MFHv1mQsdpbidJ1ySt86288ctpaGjKmFXBV0TNevLX2oxRLLI3feHt/HHTlj
j0GutmNKgUFr//RVgl5VHJSOufxoaAp8Bcrhd6caxyE9fS9pt+wMjB5Ux3g1eaHp
f98g/XjNzGVtfEgb/jp32/4iurbng8czlIxzEJh5HQRsX9FndwiIGHDGOxRce+FX
BWFoFRYUTLK9xKTfEPm2ac+xGDSQ+Ny/7OOlHFn54Z92sMMUrkr2DDls3tGW9Bwh
0zaA0wI/dArvhdjHUykdlG1GA8HDo9eStAl/5K/X8rTOZw6Y77qxSgvKCoo63ziV
js9KUVZ14v85c7hhYWRRx0o+lGkUeKuB8nREdGBre6l1rpallo7KvLKDn8A+edNp
8ty5R/XNnOSDRrv0hKgl+7hcbRKaPOl4WL/CqbG1E277+b4DxjBW6Z7YXUKdZYZt
VqR6/tjw0RcVFEf1BJto+AClhU06aS7MQtuGjO2FFu3hhT5B1humOPb3nPMc0vsf
+Pg4E5nEq9/p4m7G7RD4ffCnQxmY12TzjcoD6IbJYotGcphRZG6CwKdm5c6h7jq/
h6mcK78peOVOg6qZ9qf1
=yHFZ
-----END PGP SIGNATURE-----

--=-SxwA5xhjq+svKvdvn5MF--
