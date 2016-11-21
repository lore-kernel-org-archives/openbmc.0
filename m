Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMm1z2N6jzDsyb
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 22:04:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SxsQRg1Q"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="I0svIzDx"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 38A9D207E1;
 Mon, 21 Nov 2016 06:04:05 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 06:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=qDerIBcKT5HEniuqI43m8/JcK2Q=; b=SxsQRg
 1Qa8Uh0p6NHwzh1gh/BbtGXek9KNclf7BHdXn1Ljsa1t+NRTfYGdmWBfjMGKqDnm
 2KoVx62zTs8zY3p1zXxmsBwhz5a36OrJ4CKCBRw5p6Dp/3uSnM4VnqFF7G1ImzPw
 o37MRk7S/2K3t+GrYSVTuvtKBkvCBgwn/GgXM=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=qDerIBcKT5HEni
 uqI43m8/JcK2Q=; b=I0svIzDxbe0LqslDPKiBoXtiWzATWiD5/lCHXpHFkiifLc
 eCJgxM2kVkvrSzzy/K5XHRR13sKF5iTAume/YMggMbNs+j6bSDr8TA2cihyyBUKH
 8X400GB+wrhleXlemJXJjZSN9dmHKG4vTXDXsAzOaHae2JT/ytZrv2qXROIKI=
X-ME-Sender: <xms:pdQyWHl86CqvJFty9LJNZZwhF8GbrbdDU8OA5CyCuNPx3JpiPOCN-Q>
X-Sasl-enc: ybMUYSM2UKaxbX2HIdjwsnbMLtgW5YvndTqBqCM5Ooez 1479726244
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 372FB247E7;
 Mon, 21 Nov 2016 06:04:02 -0500 (EST)
Message-ID: <1479726239.5215.25.camel@aj.id.au>
Subject: Re: [PATCH qemu 03/38] aspeed: attach the second SPI controller
 object to the SoC
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 21 Nov 2016 21:33:59 +1030
In-Reply-To: <1479478938-13267-4-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-4-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Gw5QlmIMk5OKyfz7yZkC"
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
X-List-Received-Date: Mon, 21 Nov 2016 11:04:07 -0000


--=-Gw5QlmIMk5OKyfz7yZkC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed_soc.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index db145e201451..bbbbfd13862c 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -124,7 +124,7 @@ static void aspeed_soc_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < sc->info->spis_num; i++) =
{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&=
s->spi[i], sizeof(s->spi[i]),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0sc->info->spi_typename[i]);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_chil=
d(obj, "spi", OBJECT(&s->spi[i]), NULL);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_chil=
d(obj, "spi[*]", OBJECT(&s->spi[i]), NULL);

Such a curious API. I guess it's effective.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus=
(DEVICE(&s->spi[i]), sysbus_get_default());
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
--=-Gw5QlmIMk5OKyfz7yZkC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMtSfAAoJEJ0dnzgO5LT5038QALcuSBbM28CWqVmjSLo2VUXL
QN3THk3sLsja8Y977MoqlPqgCv2BQltK0iXILiHT+SsfaU+pPVTcTQ13n2tWPUcW
djHz85S3dgH6ik6Ocn/mbK3ABKREVwNIJkmujzz19SPR4VbJeg0Fl7gB9ycM4zOu
8Mxt/Ilm6Ey5N3Y9xg+/t8S6UxM2Oq9SXwcUoaNcsvnAAA04/aT9LggOKsSTpW8D
SK4aXZvBDmi1iPfG2GJ2oMTAdnNUOi0E5jCk5qu3ZY83W9kQ8SWbHNAtDiTIeHRu
NNbrk2TXEje/SP/oewnQPzb+4vTuM2r98+phCtwOA/ikwQlmGUSb038XgLQN27JM
2wj1gKlDSdvL6KRA8OgEqg2Auk5w2akNWSgGLqAhLZTvdPj/KutD9HUJl6basCUe
CNWIj6VXJV7mO3YXVau+dKgYxVTDhBzX9hTCnD5Rg2aYJMDtWdtXCHrMTzWBdZV/
W+kZxtVgzz3ZLqof8urZx1h+Lhf+5RIT4TNnyypSGpjoKwrez1gQxln8fFWfSdQw
Uu9M3e6U/dLAkDVLABxOgIsIATnbvl65+4WDSFmFg7ZUcqF3/UuWa3NZidxOU9QT
0Tmq114Njx2/MEGin5T84QnfHZOSA+rzVtKNSWZofDnRqxzVCpj9k7IK33s6MG2Y
i19I9NevZ3JkSPfWZT6g
=ezEB
-----END PGP SIGNATURE-----

--=-Gw5QlmIMk5OKyfz7yZkC--
