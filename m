Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6lM84CZbzDvXj
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 17:48:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=DbO6naDS; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=nBANtlf+; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 92C822068A;
 Mon, 31 Oct 2016 02:48:50 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 31 Oct 2016 02:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version; s=mesmtp; bh=
 r+TLIH0feMlYEBcj/SfH/6wdY4s=; b=DbO6naDSDDqfbdUkXMxCzL2pE2TamkRw
 exJZqGQJDM8KnF61XgVwNiH6EVUBPgkk7W2DhkHrBNRVpOn++M/r5oiR4uHi/+Om
 oRJpUgTpXU4I7CJPbw3DybHqK8SFs72YCPZ2flaZEtHGqSro/25PFEnfXEQZg57H
 WKWcoFm+/5M=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:message-id:subject
 :from:to:cc:date:in-reply-to:references:content-type
 :mime-version; s=smtpout; bh=r+TLIH0feMlYEBcj/SfH/6wdY4s=; b=nBA
 Ntlf+gP8+5YxHXTRu+L8ECocyrf/hAAb2iyjqn9kjr1rv3VM7rDZ7Oq57mYCMjKq
 hv0b0U9Pi8XXpqAKYHEdcuzWIkSXq1+1kS4xA+7JZs7Z6pxTwdQhrGR9XFLYZcUM
 LpFMTs5yEKfveZAp407XpQcoGVr0JvNPt0u5yie8=
X-ME-Sender: <xms:UukWWMCtK-7gJeXbSbTzyMSAQsaWAkmo_D4_KAoPXKc2msqtofEglA>
X-Sasl-enc: dDAPUA8ZO2gs2m6MfGKx0+4HItkMKCHlweBC6k2ermDk 1477896529
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28929F29CB;
 Mon, 31 Oct 2016 02:48:48 -0400 (EDT)
Message-ID: <1477896525.3551.8.camel@aj.id.au>
Subject: Re: [PATCH linux] pinctrl-aspeed-g5: Never set SCU90[6]
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Mon, 31 Oct 2016 17:18:45 +1030
In-Reply-To: <CACPK8XeqaxnSfeyYXy1YC03Yej+2dvPzoSqaaNd=-66n9ZEWcw@mail.gmail.com>
References: <1477894297-12249-1-git-send-email-andrew@aj.id.au>
 <CACPK8XeqaxnSfeyYXy1YC03Yej+2dvPzoSqaaNd=-66n9ZEWcw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-orkphGKUAm5NXpCMh1M5"
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
X-List-Received-Date: Mon, 31 Oct 2016 06:48:53 -0000


--=-orkphGKUAm5NXpCMh1M5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-31 at 17:01 +1030, Joel Stanley wrote:
> Hi Andrew,
>=20
> Thanks for finding a fix so quickly.
>=20
> On Mon, Oct 31, 2016 at 4:41 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
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
> I couldn't follow what the issue was and how you fixed it, so I've
> rewritten it in laymans terms. Let me know what you think:
>=20
> If a pin depending on bit 6 in SCU90 is requested for GPIO, the export
> will succeed but changes to the GPIO's value will not be accepted by
> the hardware. This is because pinmux has misconfigured the SCU by
> writing 1 to the reserved bit.
>=20
> The description of SCU90[6] from the datasheet is 'Reserved, must keep
> at value =E2=80=9D0=E2=80=9D'. The fix is to switch pinmux from the bit-f=
lipping macro
> to explicitly configuring the .enable and .disable values to zero.
>=20
> The patch has been tested on an AST2500 EVB.
>=20

This flows a lot better. I'll send a v2.

Thanks,

Andrew

> Cheers,
>=20
> Joel
>=20
> >=20
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
> >=20
> > =C2=A0#define ASPEED_G5_NR_PINS 232
> >=20
> > -#define COND1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0SIG_DESC_BIT(SCU90, 6, 0)
> > +#define COND1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0{ SCU90, BIT(6), 0, 0 }
> > =C2=A0#define COND2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0{ SCU94, GENMASK(1, 0), 0, 0 }
> >=20
> > =C2=A0#define LHCR0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0SIG_DESC_TO_REG(ASPEED_IP_LPC, 0xA0)
> > --
> > 2.7.4
> >=20
--=-orkphGKUAm5NXpCMh1M5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYFulNAAoJEJ0dnzgO5LT5YzQP/Rf38+m1iFWribyXq8s/bvVt
OoZJXGgeEmPH+gRu8pzbmJuLMbnMUHHAF5qIdmTevAzBqOVQDi/ETfdlVVYVU4C7
IVw81YmpCWQ1Kvp25DDtLLiEHahyLvD/dpEJO3gFyrTXux+AdrSO3ANxac2tgDKC
OjR8ArWCdV7K7eayMVluwpFy8QeUnzkUVEOdTGgmwEoGtsL2gujYCotalNra/bHa
9kL0JwZsnCYOrA8BKZqkIqSHXwl71y+OFsjsK4Ddj1N9YN6mg6cuXU0wrCAnR5yp
2b0g38+lKxJFdJCThfyZpiLcQW28wLQBz74Z5R4qJ6JJ54HZy4tUVGN0oh39TUkQ
FU/VZpuxIwX4AF0zVsCgqLLfILSVvdhD2B8IPrP2SltWb/Y762hBlFhVopyIVOjV
TSIFF9O0R6XFvJNX9C3i3yjRoahB/8ZwbIZEjYy5t5f6VUWC7l0qgZhltFlt7F2t
cN1eg14Y9BIZXaZyhpmX5aejPkANn8/J4RA0f2I6SDeC5V862qvd1B1TE45uUR1o
PPcbYeHwJzjgo1H5YhWCL29y+IFZKdsdy1bmyGUrGfn+T4i2TX3mh3B13XMttfyR
qwWLZZiPjv2GXgkWpSuJUvff7CSJSRz2BI4QwchB74cpL61XlV/VhMoFeUBs2RzI
XSprV+Le6BdVUzBXAS32
=o6NX
-----END PGP SIGNATURE-----

--=-orkphGKUAm5NXpCMh1M5--
