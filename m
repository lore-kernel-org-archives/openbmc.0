Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMqNc4pqBzDvjG
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 00:35:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RUHVdf7J"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="B2iJKAIN"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 69E1F2081B;
 Mon, 21 Nov 2016 08:35:26 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 08:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=PSOI+JG5TPUPirMv6u7EBzBH3GI=; b=RUHVdf
 7JrlERDqaC3KD3/lMQoekzqJM3+1KdcQdaEraUtquG5tLWZSyXdMaXlhNcLB63Rq
 fNo/ZxgfhtY8DIw4T0yRaa/reQsXGPQZwZYTtOot8J8GytprO3wRB1gNt7mPXCad
 RuIawvHTPy7Xw0Bi8CUFDzPKWUxQ/oXvQIYA4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=PSOI+JG5TPUPir
 Mv6u7EBzBH3GI=; b=B2iJKAINTrcW/QwkNxNMbg+tqInIPgv+vHM3mcWnafN0of
 qi/QMplg8hhwBCaOBuxiMkn/c8aRPajeIQUFYAGkCHzL4FHfn0gwo7LN+OCL7j25
 3b4WBJnUxLfzZ+iSuG4QqeNOV8VnF1T9fRouLSE2JPkukmzcgwWEPY1MhLfts=
X-ME-Sender: <xms:HvgyWKrd-9NHz2pB_9P2_EOQrwC_K-rnFThBg5NxDjrMHZOkzezyGA>
X-Sasl-enc: xtAvY6KD2qQjK5x1qw6fvENIslEbwf4Jm4D12At6H/lo 1479735325
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id E9A9B7E7F1;
 Mon, 21 Nov 2016 08:35:24 -0500 (EST)
Message-ID: <1479735302.2503.10.camel@aj.id.au>
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 22 Nov 2016 00:05:02 +1030
In-Reply-To: <45ccee63-6edd-9e1a-4214-cb93cb1c0395@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
 <1479734036.2503.5.camel@aj.id.au>
 <45ccee63-6edd-9e1a-4214-cb93cb1c0395@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Bove7YXdOWvVnYUUZle3"
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
X-List-Received-Date: Mon, 21 Nov 2016 13:35:29 -0000


--=-Bove7YXdOWvVnYUUZle3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-11-21 at 14:29 +0100, C=C3=A9dric Le Goater wrote:
> On 11/21/2016 02:13 PM, Andrew Jeffery wrote:
> > On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> > > If the second watchdog is activated, a second flash module is
> > > available. It should be of the same model.
> > >=20
> > > > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > >=20
> > > ---
> > > =C2=A0hw/arm/aspeed_soc.c | 26 +++++++++++++++++++++++++-
> > > =C2=A01 file changed, 25 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > > index 503efe0f5f77..fcf029f8c1c2 100644
> > > --- a/hw/arm/aspeed_soc.c
> > > +++ b/hw/arm/aspeed_soc.c
> > > @@ -170,12 +170,30 @@ static void aspeed_soc_init(Object *obj)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"ram-size", &error_abort);
> > > =C2=A0}
> > > =C2=A0
> > > +static int aspeed_fmc_get_cs(AspeedSoCState *s, Error **errp)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0Error *err =3D NULL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t hw_strap1;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0hw_strap1 =3D object_property_get_int(OBJECT=
(&s->scu), "hw-strap1", errp);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp=
, err);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0/*
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* If the second watchdog is activated,=
 then we have two chips.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> > > +=C2=A0=C2=A0=C2=A0=C2=A0return hw_strap1 & SCU_HW_STRAP_2ND_BOOT_WDT=
 ? 2 : 1;
> >=20
> > Should we instead count the muxed chip selects? We also have FWSPICS2#.
> > =C2=A0 We would be looking at:
> >=20
> > FWSPICS0#: Dedicated pin, no configuration
> > FWSPICS1#: SCU88[24]=3D1 & COND2
> > FWSPICS2#: SCU88[25]=3D1 & COND2
> >=20
> > Where COND2 is: SCU94[1:0] =3D 0
>=20
> Yes I agree. that would be much better for the AST2500 but I don't see=C2=
=A0
> a solution for the AST2400 ?=C2=A0
>=20

Looks like we count ROMCS[1-4]:

ROMCS1#: SCU88[24]=3D1
ROMCS2#: SCU88[25]=3D1
ROMCS3#: SCU88[26]=3D1
ROMCS4#: SCU88[27]=3D1

Page 113/114.

Andrew

>=20
> C.=C2=A0
>=20
> > > +}
> > > +
> > > =C2=A0static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *s =3D ASPEED_SOC(dev);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCClass *sc =3D ASPEED_SOC_GET_C=
LASS(s);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Error *err =3D NULL, *local_err =3D NUL=
L;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0int fmc_num_cs;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* IO space */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memory_region_init_io(&s->iomem, NULL, =
&aspeed_soc_io_ops, NULL,
> > > @@ -251,7 +269,13 @@ static void aspeed_soc_realize(DeviceState *dev,=
 Error **errp)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
qdev_get_gpio_in(DEVICE(&s->vic), 12));
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* FMC */
> > > -=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->fmc), 1, =
"num-cs", &err);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0fmc_num_cs =3D aspeed_fmc_get_cs(s, &err);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp=
, err);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->fmc), fmc=
_num_cs, "num-cs", &err);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->fmc=
), true, "realized", &local_err);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(&err, local_err);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
>=20
>=20
--=-Bove7YXdOWvVnYUUZle3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMvgGAAoJEJ0dnzgO5LT5VJoQAIq6hTvOpqhuy/Our/5+5aQ2
v5j9tra9lhlcEcsLvC895jV6QYeRfLCkIWYlHveFZKw85Pluv+8OhLaAQLOCiGzL
PtIqEV+u62rlNn3uVramHv6jEyqG7l+PsniPDd2diK/4X3FUpMMZ7SOKq2XbTcOh
b7kes24nMVrbkx02u46s1cTEItXbhZR4+9w3IVa9hL5c877flygFGC4pVDRMRxjb
khWpFsU0SLfviCwvaljteBFOz75VgugJTpviMktwSICdByAaT5rpUZvA4fNM4NPM
yZiC74rhIx+9g6ORRaQRCbO5j1doIj8ZXmBQNffyQCwPEa4JBBBx0VmIWhf4aBry
uvMnGC7J37MIuPzEA4FxqMWv7V4AZ8WAlhOws8C7pvonGkQ+AvfH+uJmx8oQkCf6
wkCLeHN0pxxSjotots89DEziDoH9MJ36LpOHtiep2Hy4dzJBwNv076zp/qsnysKE
Y8jAGkdJ6HeEuB7XrR/Xor0p8abx68Gp8URpLFmYxxdygJ2w+Y84EqVEZn5URyns
wJPnsW8UkaXUIs2JLBBNh5SDojq2vM0QRA4y3MAay1Ag1JOa038Jw4W9xiv51iPi
Ix/TiiW6mSMfLVfCm4XAqgP8kOQoDaR4hOzfMPpuBIo8fyO1vnn6+nnrzsyAtJXI
QmfE+Wv6K46QS34UItbz
=bbuY
-----END PGP SIGNATURE-----

--=-Bove7YXdOWvVnYUUZle3--
