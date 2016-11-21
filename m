Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMpwV1zzHzDvJC
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 00:14:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kBM6poqt"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="b8y4WWA+"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CE4D720230;
 Mon, 21 Nov 2016 08:14:31 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 08:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=Hh7/xYRTh0M8yxwmI2s3/RrmneA=; b=kBM6po
 qt4GK+eB9Q72r7P/AtApseg8X+cvUa66YcC+F2+uZOMImgXPotjsdkwVgJS7NUiY
 JvXIxSSQKG81woTw43DuBeOuWfBB/X7559fdJC3w5lb+cs+780caddcW8n0b2m7h
 veWAAW2l+QmDRsDWeWusgqAFxTgTjntXU5inY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Hh7/xYRTh0M8yx
 wmI2s3/RrmneA=; b=b8y4WWA+mMUXc3xxvWLDztbRdgxepCZjg17QtTFd1M3tuQ
 sV++RQCvTUDR1y/WtigdqAICZODfmo+6+HChGWV5aoxwn2Jpj7IbiAtMX4F6WNEF
 7VTKI7Hh+dVRY/xifUl2MnZ4PpCk8nLjp7uGZeJGKtczwN+uEU+5Xx1NNmKIc=
X-ME-Sender: <xms:N_MyWNqWLWhfm_TeIerJD-utM_jg8TlTnhXBHzlhmaL0Zz5cGBHspA>
X-Sasl-enc: gQOnvwyedwJ8jLRBdz+3hjUyOYN4EeCToekYnfPbU6FH 1479734070
Received: from keelia.aj.id.au (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4FE4C24754;
 Mon, 21 Nov 2016 08:14:30 -0500 (EST)
Message-ID: <1479734036.2503.5.camel@aj.id.au>
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 21 Nov 2016 23:43:56 +1030
In-Reply-To: <1479478938-13267-12-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-x2uOjJlofrJZsaKFMS3+"
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
X-List-Received-Date: Mon, 21 Nov 2016 13:14:35 -0000


--=-x2uOjJlofrJZsaKFMS3+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> If the second watchdog is activated, a second flash module is
> available. It should be of the same model.
>=20
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0hw/arm/aspeed_soc.c | 26 +++++++++++++++++++++++++-
> =C2=A01 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 503efe0f5f77..fcf029f8c1c2 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -170,12 +170,30 @@ static void aspeed_soc_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"ram-size", &error_abort);
> =C2=A0}
> =C2=A0
> +static int aspeed_fmc_get_cs(AspeedSoCState *s, Error **errp)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0Error *err =3D NULL;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t hw_strap1;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0hw_strap1 =3D object_property_get_int(OBJECT(&s-=
>scu), "hw-strap1", errp);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp, er=
r);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* If the second watchdog is activated, the=
n we have two chips.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> +=C2=A0=C2=A0=C2=A0=C2=A0return hw_strap1 & SCU_HW_STRAP_2ND_BOOT_WDT ? 2=
 : 1;

Should we instead count the muxed chip selects? We also have FWSPICS2#.
  We would be looking at:

FWSPICS0#: Dedicated pin, no configuration
FWSPICS1#: SCU88[24]=3D1 & COND2
FWSPICS2#: SCU88[25]=3D1 & COND2

Where COND2 is: SCU94[1:0] =3D 0

> +}
> +
> =C2=A0static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *s =3D ASPEED_SOC(dev);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS=
(s);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Error *err =3D NULL, *local_err =3D NULL;
> +=C2=A0=C2=A0=C2=A0=C2=A0int fmc_num_cs;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* IO space */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memory_region_init_io(&s->iomem, NULL, &asp=
eed_soc_io_ops, NULL,
> @@ -251,7 +269,13 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qde=
v_get_gpio_in(DEVICE(&s->vic), 12));
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* FMC */
> -=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->fmc), 1, "num=
-cs", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0fmc_num_cs =3D aspeed_fmc_get_cs(s, &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(errp, er=
r);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->fmc), fmc_num=
_cs, "num-cs", &err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->fmc), t=
rue, "realized", &local_err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(&err, local_err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
--=-x2uOjJlofrJZsaKFMS3+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMvMUAAoJEJ0dnzgO5LT5bmMP+wQBtEXxRNcJcTH/RSbTnY41
d7tryXPop6rPIirH+qPOXzf3awCE4bXsBhrSwBCNleYVMH/8HBoO1gA2KqJgaZgz
z9fa513nvy5C770+TbexaU9TAgh5bfjxe43fG/V2Bi/j+TKsCLnSU1roRZ084wAz
BIN4CMWBePm/GQWpJeK96S4wusmb+nMTbZxzhhGYXkrZCZVIMxJYr8D2gQlJF6kM
Wja5HtAmD44zoB2b9J8rKEC0c3d0UOb67WZ3xJTAlgqGC0F+QCziItPENe8xewtE
nBghM5thYMXUWNk3uEkPuDgQYWRnOTytmCG5QTegoPFPuD+fs857tKLnDNl9A3JZ
LoGHjaaLD80hfI7rCUaPKdN+om9PH0EomfZIUGk0bQFN0cKnv2hlfMKXayOdFH5O
DGVH0QmaFbHBYJUzPtNaNMoE+Wh2GOwyez0lkd7896GtIf1r3eUTEUJ4so1ixQYU
KK8Ax0Syz7sqK9QeTwlNoFmM4IXwF2G7t3L20wNl0d5ftgFWbiF09n1+ndGBRbVK
XUN+9Z+Zt761nnYmq7KteVqVwYCchrWhsrElwN6ocbjGun6GriVhFhaZgpNifBKQ
tLlfhHcxakIXHurW5tIOe3V/sRkAK/noWAbcYRwC+uKpT+JseMTN1iPVRexvh/WN
De1d1+Ea3d93oDGgNt0q
=9bmq
-----END PGP SIGNATURE-----

--=-x2uOjJlofrJZsaKFMS3+--
