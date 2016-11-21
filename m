Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMnCb5Qz7zDvjZ
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 22:57:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="TbMU1Mgx"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gNXY+iV6"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AC3CE20620;
 Mon, 21 Nov 2016 06:57:28 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 06:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=BIs0/QDlaMp6X/j6/tQFA4009bc=; b=TbMU1M
 gxxgBInD3OZATeHJHSTFMwFB4MBYCbsp0MsTJaD85rsdwZXL+vv/NCia/nRkwUlL
 SMNRLVMZ5Pf6bsuN6kTsdmgFWErp9P5WxOmBp9z5qNcbXxJ3KaBjgELXGsNjZ0yV
 xz2W5YcDnrwPaQuvoexJW1+VUTJ0MptEgDmI4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=BIs0/QDlaMp6X/
 j6/tQFA4009bc=; b=gNXY+iV672TtvQC2g6Do5mfohXaUbmxkBr4PiAigzUdju3
 Cozn9MbH/8y3/x4t2lp+T+8AU+xdXJOhItThICoKCDPzk/EpKHQ7YbkRiORtelY2
 KxrYmyLFEe+lEvVDIwYmhaI23rTSPJaXS+dsfGx8Evm+zDRemakeVgn8jFuUY=
X-ME-Sender: <xms:KOEyWCSXqREDiYYMu7l3igauD51HK47sJco76s3KcogDGX18YXVgvg>
X-Sasl-enc: Gmxgg1TGdOvc2lp29v7tyLHxPgihfwP775ZHAPNYl55X 1479729447
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id E1FFD25041;
 Mon, 21 Nov 2016 06:57:26 -0500 (EST)
Message-ID: <1479729439.5215.30.camel@aj.id.au>
Subject: Re: [PATCH qemu 03/38] aspeed: attach the second SPI controller
 object to the SoC
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Mon, 21 Nov 2016 22:27:19 +1030
In-Reply-To: <CACPK8XeHeUW3-8ewULup=19umJLkavos5_VMWqL=VPnKJTNSEw@mail.gmail.com>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-4-git-send-email-clg@kaod.org>
 <1479726239.5215.25.camel@aj.id.au>
 <CACPK8XeHeUW3-8ewULup=19umJLkavos5_VMWqL=VPnKJTNSEw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-848WbldTGOn6N8pNvIln"
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
X-List-Received-Date: Mon, 21 Nov 2016 11:57:32 -0000


--=-848WbldTGOn6N8pNvIln
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-11-21 at 22:12 +1030, Joel Stanley wrote:
> > On Mon, Nov 21, 2016 at 9:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> > On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> > > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >=20
> > > > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> >=20
> > > ---
> > > =C2=A0hw/arm/aspeed_soc.c | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > > index db145e201451..bbbbfd13862c 100644
> > > --- a/hw/arm/aspeed_soc.c
> > > +++ b/hw/arm/aspeed_soc.c
> > > @@ -124,7 +124,7 @@ static void aspeed_soc_init(Object *obj)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < sc->info->spis_num; i=
++) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initiali=
ze(&s->spi[i], sizeof(s->spi[i]),
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0sc->info->spi_typename[i]);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_=
child(obj, "spi", OBJECT(&s->spi[i]), NULL);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_=
child(obj, "spi[*]", OBJECT(&s->spi[i]), NULL);
> >=20
> > Such a curious API. I guess it's effective.
>=20
> I didn't review this one because wtf is with that *?

According the code it means "keep incrementing a counter until you
generate a unique object name and successfully register the object".
AKA the 'i' we already use here, just the API doesn't provide an
argument to pass it.

>=20
> Cheers,
>=20
> Joel
--=-848WbldTGOn6N8pNvIln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMuEgAAoJEJ0dnzgO5LT5moQP/0LxGaFxYBlr+qcGpU+K/GAL
rLBC+AsbusFEVfnmGrhRH5Xfa+Lclcc2oRG2foVrdw4DF0IKMD8J3HirlqgG1+Vo
CRAgl6RYFHXp7zNybEYi2SpfUByR0ZlDWAJLy8bLjr0Z2umf8OX9qENuV7phrp8j
t166c+GaK5EXv0L1lIHf/7EpUxmB6t918/9GPjUDgyFPwLXFbmwmm8KN2SlPxQEV
lcuwq0+neq3CYeyUDbzUVwjcWPIrkYX6Ixq1qVB3kCPsv4zRLdcU4o8raw5lzNlY
iyIm33rv7ZUUJPxp3drTQOzoHbJPnhMCy/UVB99zN7hjlrN5jM8KJIhBzz29ClpN
kG1Bv61wTQvPrUIfcoYQXREzqzRYTRJoObG0I34OlsBsJeyVYzNBPwY3DGb2GNZ+
Lrx1xcPSeFbCryko/MzmOdgD95OvHOrT8ksyuiTl1QIEDHRsBGvQ5Q7a5MAxdR3J
ch8m1mZPAgRCd7vxMdUIc2r8jNzMK/zYjl4AwIklzvibQnIOnUY27+7iH3r7YJmZ
G2zKGZQqY1pT1TrWtPR/C/Gdg2UPgT314fRZs7RATMhiCI2qbRfxtFmWpcdfXnhK
BleE/HW0EziAK2g9sMYk8yO3FQhj2Y1ILUXg3+6StW+BQKfqvyQaUc8wqbSE7p00
UoNFfdpYktEUusBLoyRk
=CiJo
-----END PGP SIGNATURE-----

--=-848WbldTGOn6N8pNvIln--
