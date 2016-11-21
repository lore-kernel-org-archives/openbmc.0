Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMpyl4kzBzDvJC
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 00:16:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hzqBUS/Z"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="T/Vnj6W5"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8CD1B200E6;
 Mon, 21 Nov 2016 08:16:29 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 08:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=wXWoE/5fMuNmZ5K2Z3wRdTsNcIg=; b=hzqBUS
 /ZnB7Np/MKxceQ958Z/iHGfO+mW1Vv9lNUXJ+cHM80/Kt+DdvsiS7GYRMw+1WSsI
 jRGKA8L4wTXsV6Wxi69T/bWzmhsgDDX6zNpfVPcMdwK5Soc+uXomwEFcpfFCflEp
 DKtyaiw6MMCctGpg1vxc8zECK5ced+EhLzCCU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=wXWoE/5fMuNmZ5
 K2Z3wRdTsNcIg=; b=T/Vnj6W5zJThnN8+P0zJI5AwdlYcjVW/JMkvZaPGrZxqbi
 1KY6xKFJsdIRfSNpuklO97g1XzD6MNRc9LTXqA491RQxM83F11CRtx3Y9FTyQPOa
 yVJax3vGlC7StE1betWs5AB4QQGQsWUrnsmtvDPOOi72bQFaKN5w/SqTlGBqU=
X-ME-Sender: <xms:rfMyWHB1irW2Iy15yfQZHZQTHcrf2oi5UxRqe7LWGp7S5QbFBP6wkg>
X-Sasl-enc: V10BqGVAwGbXK0N69KnnLKUj+2teLX6Immsp9PcM9a8N 1479734188
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1EDDF7E9B2;
 Mon, 21 Nov 2016 08:16:27 -0500 (EST)
Message-ID: <1479734168.2503.6.camel@aj.id.au>
Subject: Re: [PATCH qemu 08/38] aspeed: change SoC revision of the
 palmetto-bmc machine
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 21 Nov 2016 23:46:08 +1030
In-Reply-To: <1479478938-13267-9-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-9-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9b8kaLIl273PPwebWLq9"
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
X-List-Received-Date: Mon, 21 Nov 2016 13:16:32 -0000


--=-9b8kaLIl273PPwebWLq9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-18 at 15:21 +0100, C=C3=A9dric Le Goater wrote:
> The palmetto BMC machine uses a AST2400 revision A1 SoC.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Verified on palm5 here in Aus. Not sure how I concluded A0 initially,
unless it was a typo.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index aea73f79d92c..5e35d4562de0 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -82,7 +82,7 @@ enum {
> =C2=A0
> =C2=A0static const AspeedBoardConfig aspeed_boards[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[PALMETTO_BMC] =3D {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.soc_name=C2=A0=C2=A0=3D=
 "ast2400-a0",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.soc_name=C2=A0=C2=A0=3D=
 "ast2400-a1",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hw_strap1 =3D PALM=
ETTO_BMC_HW_STRAP1,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fmc_model =3D "n25=
q256a",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =3D "mx2=
5l25635e",
--=-9b8kaLIl273PPwebWLq9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMvOYAAoJEJ0dnzgO5LT5J1cQAKfCvtF1wO1CnLnm8IbnXmNg
G69q+4mLi0+iT1DfgGg0lx0NP7qDEk61zKsfrpdfS0a7lr5nglh9zQPFw6th0Jet
fAo3dMyosg1svM9CxGrr6QJw0MxFlMemufz6tSIGkJOAsW5VPBpUS/wXuSKQsW3p
EkfqZacysuo9Bw3otBgymgofVDKqJmAwzrJPT0foB3iEcsVT1k68DvtJjMxjoodJ
ANYM256OCo9T0B16F+x+NYKAZOeYSufDDTK4GejtilyDZDLI4f3B55TLGOoMEChX
H3qopnGj4Km+BLBYzA1VtR+qZLiz/lAIBL5XNAjSdQlOsWEVnYjMbNtTIpBXS52x
BWYs5kffrp1vEkvHUi16aJr6GHkBNfgGN8c3eKaP3u2r5QB2PSEdH7jWRSBGZJKR
4NP995XuOEIvlh5FoHi394WRSfrPk8gGIvtDET2HgwJ/QI30vuO54fWRUPaAissz
Rm+GABUIu4evYPxUChSlbYP9O69+dzPJcml0ZwASK4lzqXrGgkIKKR21znBQU9g3
ptMa++h5k0BEDMPv2bv6EbwpkA0Fl+2EMs0u2J5HhoKbQoQMp3hh6WDkfNbpqJ58
CWEzWyV12efHPE0hCsmb5QzRdxmIudUkQqK2CFPFYVpZNcc2oY9flx8ed2yrviYz
zKZk9SE3VYtM2AJN1xxm
=D512
-----END PGP SIGNATURE-----

--=-9b8kaLIl273PPwebWLq9--
