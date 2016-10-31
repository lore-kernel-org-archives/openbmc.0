Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6lGm5Z2bzDvXj
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 17:45:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Ufy3Loz4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=ABzK49P6; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 93EB3207C2;
 Mon, 31 Oct 2016 02:45:02 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 31 Oct 2016 02:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version; s=mesmtp; bh=
 iowxgGjTYNY+N/+XWCPmJC8OEPQ=; b=Ufy3Loz4OOpIRfX3GfyNcpI5kQ8fL7HL
 76gKfLAdK3xpdXm2jijqEYb8eHEA2WFI5Fkrp7oImg3obSA4idXRM7nzepXtl+Yg
 Ds6yWE7UbheKXWuZ9hKJF8RLaAmUGVtx250aq7U+j0LVDouR8qkGMfpdcIh8g3cs
 7MTbvOljfa4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:message-id:subject
 :from:to:cc:date:in-reply-to:references:content-type
 :mime-version; s=smtpout; bh=iowxgGjTYNY+N/+XWCPmJC8OEPQ=; b=ABz
 K49P6jfVXbH08BPPuY4Wq6eeOG7dME0QAv+Mwyqp7yMepQf/P38GtPuqK86ty8wM
 /HfUvZBMriOaFmj/lwagHmSm18gdFRMn6Rw/10KsgFl7jV77GZR2Qc+mfioXBygQ
 bbPIkb9TePYkRXVeSiCUiHAqXDkJcKyj/L7KFTKU=
X-ME-Sender: <xms:bugWWM9OY3FGYTENcwmQDj5XPwvl870118xlrCnpUMuWLuyoTPWNeg>
X-Sasl-enc: GV2Cu+a+9BcFkRuv37/RJBcFxCKbTQlaEfsx9PwTt3Zz 1477896298
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 61D76CC07E;
 Mon, 31 Oct 2016 02:44:56 -0400 (EDT)
Message-ID: <1477896287.3551.6.camel@aj.id.au>
Subject: Re: [PATCH linux] pinctrl-aspeed-g5: Never set SCU90[6]
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 31 Oct 2016 17:14:47 +1030
In-Reply-To: <5f847be5-12a9-c8ca-8365-69c92f831ed6@kaod.org>
References: <1477894297-12249-1-git-send-email-andrew@aj.id.au>
 <5f847be5-12a9-c8ca-8365-69c92f831ed6@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-YjzXHrwnl/RWTTtCi6pN"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Mon, 31 Oct 2016 06:45:05 -0000


--=-YjzXHrwnl/RWTTtCi6pN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-31 at 07:31 +0100, C=C3=A9dric Le Goater wrote:
> On 10/31/2016 07:11 AM, Andrew Jeffery wrote:
> >=20
> > The description of SCU90[6] from the datasheet: 'Reserved, must keep at
> > value =E2=80=9D0=E2=80=9D'.
> >=20
> > Switch from the bit-flipping macro to explicitly configuring
> > .enable =3D .disable =3D 0.
> >=20
> > If a pin depending on SCU90[6] is requested for GPIO, the export will
> > succeed but changes to the GPIO's value fail to stick. With the fix the
> > value can be toggled as expected. The patch has been tested on an
> > AST2500 EVB.
> That is an important condition for SP1 also.

Indeed, though in this case the mux is not affected because SPI1 is the
highest priority function for the relevant pins, and SCU90[6]'s default
value is zero. Therefore it won't ever have been (wrongly) toggled by
this bug in the pinmux driver configuration.

> Could that have an impact on=C2=A0
> the spi1debug setting in the witherspoon DTS ?=20

No: The need to configure spi1debug in the devicetree is purely driven
by the value in bits 12 and 13 of the strap register. If we want to use
some other configuration in the devicetree, e.g. spi1master, then we
need to change the strapping register in some way (e.g. hardware or u-
boot). However, Kun Yi was looking at whether we can make this more
flexible.

> Is it still needed ?=C2=A0

Yes, per the above.

>=20
> C.
>=20
> >=20
> > Reported-by: Uma Yadlapati <yadlapat@us.ibm.com>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g5.c
> > index 481e836d12e5..9a3139c13ffc 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> > @@ -26,7 +26,7 @@
> > =C2=A0
> > =C2=A0#define ASPEED_G5_NR_PINS 232
> > =C2=A0
> > -#define COND1		SIG_DESC_BIT(SCU90, 6, 0)
> > +#define COND1		{ SCU90, BIT(6), 0, 0 }
> > =C2=A0#define COND2		{ SCU94, GENMASK(1, 0), 0, 0 }
> > =C2=A0
> > =C2=A0#define LHCR0		SIG_DESC_TO_REG(ASPEED_IP_LPC, 0xA0)
> >=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
--=-YjzXHrwnl/RWTTtCi6pN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYFuhfAAoJEJ0dnzgO5LT5WfoP/1MWSRJPPBkwPnnRJCsZNQUP
uqbk6i+6HwQPDJi9zIsrMjkeRwNxfewW/B/5AliQDYCoiaCCT3Huej6ZFDOafmdE
6dQOTCjb+jLkkXX3tgqU4NDuU9QdDlVfjzygdD+Ht+vzROPDPYGfL3Puln2NT1o1
EqR3uTqpnlUFzEndQrqtvCfZan97C83N7q4yZq148EdFm7/1kP7GWK05yDXAQjE2
TgzzWotgXlHkdMyaIM0BGZJNpuD7EX0/CogKbFFl1iNwUx72HNM5HrPwGowcUljI
ztKaXRUgu8ZcMpPv4pbAH8a7cfeRm77XKu+iNlNXWyvmZhSj6Tq2FLp9MmbrDyAY
1CxDMa2BY7/Wv7XJLiMzX79UuCQyxHCReE+kB9/QMAGSIB0+Z6ZMXCF1QQ3cQlBg
Xqd8cDAwz1a2s985NPPNRlo5Lhx0FzT5x/xcsbUAbZiLeUEDR2rdiCT3y6vHddy5
rgcRVYUPjlhuDf0GXb16f/oO4wLko7fpVS/lpbeHdjUgOGlWuKWawGlcWHMwBhO1
NjoalSQ02PKw8LcKVUBSioiACfW+dlqaD2CYGP2PfHdNUWy5PKh0J4/C4hHr8vW+
DtuCwrRLSUsW7zmsJ3rrufwtn6YpV8FIKuVeV5ohqiBQV5B46mzt2KLC4LjjhXUl
Mdhe5dGdO47QMn5zbekH
=XkyL
-----END PGP SIGNATURE-----

--=-YjzXHrwnl/RWTTtCi6pN--
