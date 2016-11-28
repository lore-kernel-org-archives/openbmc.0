Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRqqw6hzzzDvjt
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 13:09:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hkwa6U1C"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UJnzLASG"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D220D20821;
 Sun, 27 Nov 2016 21:09:30 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Nov 2016 21:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=4ZkijCxB2rKLALSN+qaGM3RVDFI=; b=hkwa6U
 1CRGkPfpzNVZoUEGlXs/DYpE2VGhwbWJPxrsYYtjGbd+xNC4E6nydTV4M2oA0ulU
 BVeARoQH8ilKIPNqteTzBhQVGDeF6TTfTFZ89g/bDmZe8JFfyOjkkcawYkJctpfd
 e1NBxW2XmF0go6qFs4hTf0sITrm9AZFLmNRJI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=4ZkijCxB2rKLAL
 SN+qaGM3RVDFI=; b=UJnzLASGkmNpI4dQBeGR4FXlR//GqrRpdad2flmuMnOEZE
 fMvVGvfvJysqoo63kfAZJm5zQ3ywimRMnl0u2TbnTFOY3xqaqhdL1HJqxMAk0wp8
 QTAK7rj/TDW2Xn3wvVMwHi8PGbegsUA6zAiylIaEDalLxyBNmR2vs9XLfbVCM=
X-ME-Sender: <xms:2pE7WK_V3jInREfZqvTxnO1Y5XasT5ti_uNZnDmljGNvYyMlq3Oeww>
X-Sasl-enc: Cf9GTsPri8VZER1OutvBIR3531Hnd6DFynJ+6XZEdyrA 1480298970
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B24624312;
 Sun, 27 Nov 2016 21:09:29 -0500 (EST)
Message-ID: <1480298963.2503.73.camel@aj.id.au>
Subject: Re: [PATCH qemu 29/38] aspeed: add a rtc device on I2C bus 0
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 28 Nov 2016 12:39:23 +1030
In-Reply-To: <1480298737.2503.72.camel@aj.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-30-git-send-email-clg@kaod.org>
 <1480298737.2503.72.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-644kDp/bDpLW9wyixZjO"
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
X-List-Received-Date: Mon, 28 Nov 2016 02:09:33 -0000


--=-644kDp/bDpLW9wyixZjO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-11-28 at 12:35 +1030, Andrew Jeffery wrote:
> On Fri, 2016-11-18 at 15:22 +0100, C=C3=A9dric Le Goater wrote:
> > The palmetto platform has a ds3231 RTC device but not qemu. Let's
> > use
> > a ds1338 instead which provides enough basic RTC features. Only
> > alarms
> > will be missing
> >=20
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

With the caveat that we move it to the board file. Evo needs an 'undo
send' option like gmail.

>=20
> > ---
> > =C2=A0hw/arm/aspeed_soc.c | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > index 2aa15d90cc31..d2bc0ba2070d 100644
> > --- a/hw/arm/aspeed_soc.c
> > +++ b/hw/arm/aspeed_soc.c
> > @@ -276,6 +276,10 @@ static void aspeed_soc_realize(DeviceState
> > *dev, Error **errp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(dev), 2000=
0, "temperature2",
> > &err);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(dev), 1100=
00, "temperature3",
> > &err);
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0/* The palmetto platform expects a ds3231 RTC =
but a ds1338 is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* enough to provide basic RTC features. =
Alarms will be
> > missing */
> > +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s-=
>i2c), 0),
> > "ds1338", 0x68);
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* FMC */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fmc_num_cs =3D aspeed_fmc_get_cs(s, &err)=
;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
--=-644kDp/bDpLW9wyixZjO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYO5HUAAoJEJ0dnzgO5LT5KXIQAJqMkg5h1Uoq2CkyoSR2G2np
0voroD5/aPXyE3YJyBlfDDbWNvH2NxdB5RKDYMCZCobpEs/dVqFsamv0Lhxs4VSH
Jw26dNyGjx0C4wUPwgeBhi16aJHymAx7QITs7xlWUU+vNhy/uZLh4FGZJ69FxyR+
amIElt2otmXQlmmqPusseionT5VsCKkDgmeOKZCkmx9d1EGb+bRMI9nqqgUvTMg/
CB1bvfsWGBSIhA+vYclAQpA8lHyyckzZfiaosSvcAeyYddtWb52IjaomVy53XXJu
ut6i6fCGfYBg6eByzIQhudgkziatvMxzvBIJYLbkCmPeyw4QleDtklFk7e/ugJVW
DqKdJVMq6mo4cBgObJPz4enZTyQ9V6NN46N2jhqMPB7CsSPbpk7VyYO2EOKJih/S
3VQLi3zk1Xpw9EL3vXlmO6Wd0wchDEu8GFGYs2hgqTanFmc5sE1Wx1i/mwZ3kwls
KK/1RvhrFS4KbQetJXLj+B6SvVtOioOdhZ1jG5l1WdQ0IU9s5jeXkR38EZ/GnMg2
MNNA4Jvl5tcBsNmqAY5cRGCt9RNkSMDEkj5Vly6MWC849srDJ5Vtel2CMRR6cB7B
9guC3QM6Ti8geVclHoochASEZR91NKrcTDqfwnEV4WUUtUyI7W2D8hHhO0PiF1eW
iMt/LccZIBL5pgbEe26s
=xb6q
-----END PGP SIGNATURE-----

--=-644kDp/bDpLW9wyixZjO--
