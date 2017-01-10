Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyCbJ22w7zDqM6
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 11:30:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="L/lJdKlc"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Fv90zizn"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0724A20A7B;
 Mon,  9 Jan 2017 19:30:02 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 09 Jan 2017 19:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=33bpCyNtjkcq26mPGSkhydECZ/Y=; b=L/lJdK
 lc/bhn7AgaO5J4Uh9ekpA9BFeOAiWWZqugVP+x8fOAcsHhrHBHF0TpgbFuDEhVX5
 aHsB4jUH8KpSxHeH3tLaJbJlQGesuGGwugRc2Up5l019aVtjsQVJUdFxOrJuIe5A
 AtqolkrBs/I4SW4ApVExdE5V1pePRaaFSkyUk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=33bpCyNtjkcq26
 mPGSkhydECZ/Y=; b=Fv90ziznBKdrH13lQRQ+Q3qQsx7k1aIpVYTaP7I+FiyuZZ
 Pm/J4CRSxrJmbToH9Iu0XeBVpTF0mjLipTfEQMJblS2NyKe2DwgeSy6slUJevoY0
 PJMjPWWoy8s85i0uFOwMiD9fSBMaDBK//Txs1o7m9UZtYoFoemlUzqMnuK62M=
X-ME-Sender: <xms:CSt0WLA1I7KYzseHZ9xClnwyvBIUkjuZ80Xozt97fPVmoUAf10BL-Q>
X-Sasl-enc: SetIU6gCoqZG6iV35cxoISqGhGSmYDmv5cjUT7qTESty 1484008201
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 297EC7E057;
 Mon,  9 Jan 2017 19:29:59 -0500 (EST)
Message-ID: <1484008194.12800.9.camel@aj.id.au>
Subject: Re: [PATCH 2/2] gpio: aspeed: Support banks Y, Z, AA and BB
From: Andrew Jeffery <andrew@aj.id.au>
To: Xo Wang <xow@google.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 10 Jan 2017 10:59:54 +1030
In-Reply-To: <CAPH-5w44UDvrpkma6k6HN0ZZ7OHt-apPOhT7-S4DhJ676Sz_dg@mail.gmail.com>
References: <20161212040639.24467-1-joel@jms.id.au>
 <20161212040639.24467-2-joel@jms.id.au>
 <CAPH-5w44UDvrpkma6k6HN0ZZ7OHt-apPOhT7-S4DhJ676Sz_dg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-eBmP5Kt2j47o6W5T60Xz"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Tue, 10 Jan 2017 00:30:04 -0000


--=-eBmP5Kt2j47o6W5T60Xz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xo,

On Mon, 2017-01-09 at 16:24 -0800, Xo Wang wrote:
> Hi Joel,
>=20
> > On Sun, Dec 11, 2016 at 8:06 PM, Joel Stanley <joel@jms.id.au> wrote:
> > These banks have extra limitations compared to those currently
> > implemented. We must detect when these unique banks are being used and
> > special case their IRQ and input state.
> >
> > TODO: Do what it says on the label
> >
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >=C2=A0 drivers/gpio/gpio-aspeed.c | 15 ++++++++++++++-
> >=C2=A0 1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> > index d7198536de13..c4d87a2a489f 100644
> > --- a/drivers/gpio/gpio-aspeed.c
> > +++ b/drivers/gpio/gpio-aspeed.c
> > @@ -65,10 +65,14 @@ static const struct aspeed_gpio_bank aspeed_gpio_ba=
nks[] =3D {
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 .names =3D { "U", "V", "W", "X" },
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * A bank exists for { 'Y', =
'Z', "AA", "AB" }, but is not implemented.
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Only half of GP=
IOs Y support interrupt configuration, and none of Z,
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * AA or AB do as =
they are output only.
>=20
> Is this comment accurate? I don't see anything in the AST2500
> datasheet about GPIOs Z, AA, and AB being output only.

These banks are output-only on the AST2400. The comment is not accurate
for the 2500 as far as I can see. Again this was a patch that needed
some improvement, we just haven't got around to cleaning it up.

Cheers,

Andrew
--=-eBmP5Kt2j47o6W5T60Xz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYdCsCAAoJEJ0dnzgO5LT50z8P+wcY0XlBevuR1eEo+rgd++tE
SQcq8inN3QmVwCRKdPjRkGnL0YuTAjyf7kkii/6HSzqGYqp3JzasZIiowNShc/P/
9St8DBuU8ocd2s3gzyY6e1MpmbJCfxsxWdbbhCurVGURU/oWvykOqiPn+1OM/qyq
5hBvdxJrmORPpvV2drzUwPaqPS1Pm2bJiXin/eCdoaoiyf2QgDaSYXAJNpuV8yX6
wDzQhR9Wc/L6iibRgaeVOm8tGu+PgH4kHcsxXVRxlJ7IZaxZhKrujgJ00IR4oart
tghKSIO7zH6id9PQixXW5btlIbuFJF1LvCnUBkIxu/KraahIyMFeoLyTWBY5K0KJ
gGP6dpUs1nsVvp7xuR3F5bdm2pcaEmwJ7YaLYBI2Mms+8sJT+b/zidekNVtpyrQ9
ft1g95LVPzIMadL2jH527magvSf050JCIfV6gUoPXuoiqrcYg6ilVQ9LB8yQnuO8
/FvsxAdhQh9tgHsnnB8TVszd5K7tUXwzd/OvPzs96iCCM66BGVfH0k2nCbq/XLlO
WjV8n6n43To2ZDZGqcOWL6I3Gxkq9+QVZ3QShzrf+L0Vf6NfOOVNTk0j9gkokX8L
VtQZWzsFfXxx0LsoGIVaCnWcUsgvzXHdAfoNVArHmEqY3xo8KoyWbhkrcyznez6a
cKbh6m+iZFVuhInZ3Vcz
=pcaY
-----END PGP SIGNATURE-----

--=-eBmP5Kt2j47o6W5T60Xz--
