Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tN9TZ13LhzDw9X
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 14:10:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="V7iT4Zop"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jj+1OtAo"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E338220A85;
 Mon, 21 Nov 2016 22:10:55 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 22:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=xWkYp/y5z3/5morZfqDUWF8GMZk=; b=V7iT4Z
 oppit1ExiRF8xtviAGpGEhMxzjlq6jivyK/xDy/pTQVc/DkIwM9jYbUkA3qphMlU
 HgSPw0BdJ8PX/VSkSB36UfvWBWZr4c90S5+vvJQW/+H54SgEgvsw8xBiGh7njI2/
 uhF4PoH7Qy9KtMgsuR3f0RDrr7wnm60midr6E=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=xWkYp/y5z3/5mo
 rZfqDUWF8GMZk=; b=jj+1OtAoD+Nx8zkMsW90iyOY1jgfKI280/Kwm3d/WGSLFE
 oaHIN5CyXPW4woKpsZ6Bd9w0V2/ysTjDOaGrMQB2cDtNGN4htl3PnLt2PQ+SgUx7
 BRrnPLOqnVYYs9h5SLyv8gVGbcV70pXejPl6VTR6W+AcGs/xcimS0PW77HayU=
X-ME-Sender: <xms:P7czWHr-HibwlthRqIaZMICMhXN2MgeC_oaqFy9vGz1lxQCxxnFYuQ>
X-Sasl-enc: eBHa8C1y5QmrLXDG68hLyIgFiWPYNuWP9BGyIfM2DI63 1479784255
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54B367E449;
 Mon, 21 Nov 2016 22:10:54 -0500 (EST)
Message-ID: <1479784251.2503.18.camel@aj.id.au>
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 22 Nov 2016 13:40:51 +1030
In-Reply-To: <85a1b91c-3efe-5b93-bdbf-91a0741fd853@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
 <1479734036.2503.5.camel@aj.id.au>
 <45ccee63-6edd-9e1a-4214-cb93cb1c0395@kaod.org>
 <1479735302.2503.10.camel@aj.id.au>
 <85a1b91c-3efe-5b93-bdbf-91a0741fd853@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-IvIy1FCAlY2FYd5CCp/X"
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
X-List-Received-Date: Tue, 22 Nov 2016 03:10:58 -0000


--=-IvIy1FCAlY2FYd5CCp/X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-11-21 at 14:47 +0100, C=C3=A9dric Le Goater wrote:
> On 11/21/2016 02:35 PM, Andrew Jeffery wrote:
> > On Mon, 2016-11-21 at 14:29 +0100, C=C3=A9dric Le Goater wrote:
> > > On 11/21/2016 02:13 PM, Andrew Jeffery wrote:
> > > > On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> > > > > If the second watchdog is activated, a second flash module is
> > > > > available. It should be of the same model.
> > > > >=20
> > > > > > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > > > >=20
> > > > > ---
> > > > > =C2=A0hw/arm/aspeed_soc.c | 26 +++++++++++++++++++++++++-
> > > > > =C2=A01 file changed, 25 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > > > > index 503efe0f5f77..fcf029f8c1c2 100644
> > > > > --- a/hw/arm/aspeed_soc.c
> > > > > +++ b/hw/arm/aspeed_soc.c
> > > > > @@ -170,12 +170,30 @@ static void aspeed_soc_init(Object *obj)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"ram-size", &error_abort);
> > > > > =C2=A0}
> > > > > =C2=A0
> > > > > +static int aspeed_fmc_get_cs(AspeedSoCState *s, Error **errp)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0Error *err =3D NULL;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t hw_strap1;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0hw_strap1 =3D object_property_get_int(OB=
JECT(&s->scu), "hw-strap1", errp);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(=
errp, err);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0/*
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* If the second watchdog is activa=
ted, then we have two chips.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0return hw_strap1 & SCU_HW_STRAP_2ND_BOOT=
_WDT ? 2 : 1;
> > > >=20
> > > > Should we instead count the muxed chip selects? We also have FWSPIC=
S2#.
> > > > =C2=A0 We would be looking at:
> > > >=20
> > > > FWSPICS0#: Dedicated pin, no configuration
> > > > FWSPICS1#: SCU88[24]=3D1 & COND2
> > > > FWSPICS2#: SCU88[25]=3D1 & COND2
> > > >=20
> > > > Where COND2 is: SCU94[1:0] =3D 0
> > >=20
> > > Yes I agree. that would be much better for the AST2500 but I don't se=
e=C2=A0
> > > a solution for the AST2400 ?=C2=A0
> > >=20
> >=20
> > Looks like we count ROMCS[1-4]:
> >=20
> > ROMCS1#: SCU88[24]=3D1
> > ROMCS2#: SCU88[25]=3D1
> > ROMCS3#: SCU88[26]=3D1
> > ROMCS4#: SCU88[27]=3D1
> >=20
> > Page 113/114.
>=20
> yes !=C2=A0
>=20
> So we should set or unset these SCU regs when the SoC is created and=C2=
=A0
> derive the wdt2 enablement from them. I suppose that the helper routine=
=C2=A0
> to check for the conditions would be under SCU.=C2=A0
>=20
> or do we start a simple pinctrl model and slowly add the enablement
> of the pins we need ?=C2=A0
>=20

=46rom the discussion on IRC last night between C=C3=A9dric, Joel and myself
we decided to start on a pinmux backend to help manage these issues.

Andrew

> Thanks,
>=20
> C.=C2=A0
--=-IvIy1FCAlY2FYd5CCp/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM7c7AAoJEJ0dnzgO5LT5NpAP/1Emv66hxkTcVklicbW9g/1S
/2pcUDaLb92GgexLRBIeVS8yIN4NnThQOz0UXmI3qwaIeccwlUxa0BtCAo2j/9YH
ZTC0LjW/BwlrQGjXZnfVAv7JW6DDTlOQnmIaHJplnJKoDgysW27cQ0VVbmb004Zv
UrVPGvmp2L4lhEooKBTkj8cS0qzFQjhHIcFXR8BmArBfZvvZ6w8gL8VbGNZuGUqb
1Gqlkeue3+zuAsekp3Vx4fBSYAKp4+ZVDMeBGbhG1UCqWsu124bO6KTErpBTgdk6
fYKs43zCsqOVsJVhfWGt4tzMwUOtXqEFfccJIRNg5DTDkWnAyOQUig2nyoKqHQbW
e+i1cN6K/fz+LMkmdb+JcKNhErGnI9WHAm+fcdL6saVY/U7BAZsbeuyf1XQ3N0w3
n1J4QVRAN7tQjoYViggGOK+ysrQjdSnbMFTcDFwyVMgVNA+2ItLQki2RwQHRGbUy
KhFhubSqH2XIxYTeY8LEbtFMRUU9reaqMNc84adLzeZmxtGoXJMjw2nztd7a5IIa
o9tkaoE2BSqq5aw8eTIyFknsMYFu5Ce7U3k03pkteY2ZdjEVywYMqpKglGNxj6e4
ZabW7ShlHPvZytVVusxWFERgKtuzl1hzy6BMfFaaWsrbRZ+WUo3TM0XRq8kQ2x8F
h/E55dUlOWryNKe1ug4D
=LMWP
-----END PGP SIGNATURE-----

--=-IvIy1FCAlY2FYd5CCp/X--
