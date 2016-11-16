Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJzXk6XRWzDsyx
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 09:32:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Zcuw4LGi"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Tm+S2hT3"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5E29520607;
 Wed, 16 Nov 2016 17:32:36 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 16 Nov 2016 17:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=eUg2saC3Fm6Qgvpr3zAl7EfysVc=; b=Zcuw4L
 GiGEc82+XVqkuRJNw4whCnvDRyQjFQm5Z/NmchdOU0mtcPLGVp/yyo4aqz8Hqg7K
 7LijLQGQwnMvdvU2vou7yXV6DWK+puqs8llmFimQ/+PJBoPVjPf+NItoyAjhBVoU
 Aq63IxP6bAHjGZjiABBmZiBdyeUDkkkMF/LYE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=eUg2saC3Fm6Qgv
 pr3zAl7EfysVc=; b=Tm+S2hT3se414Vm5HqFPZqZIhSw53achgSyIzuUxheVhXQ
 Wa41rPimU2yAnEuI8qFHUZ+d2Alf4ojYfXYjeBU00QFIME/2J/n48E4nBj3KwHah
 ZPWtezqurBi+n3lNC2+6qBZJyGKUuQQmAXCPNXC1AT+8jh1u3bk+U/ZG+Rlxg=
X-ME-Sender: <xms:hN4sWLQgqhIPwexjxU6SVBSupibPbjuDVDlmMnbeFfFpe7OeWRexBQ>
X-Sasl-enc: ZYzTx4PpTaho+dAxzYjc6TPuaR4GzFfv3bxaVYBoz9Zf 1479335555
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id ED42424C4E;
 Wed, 16 Nov 2016 17:32:34 -0500 (EST)
Message-ID: <1479335546.5215.9.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: resurrect PNOR on
 ast2500 evb
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 17 Nov 2016 09:02:26 +1030
In-Reply-To: <1479316169-25297-1-git-send-email-clg@kaod.org>
References: <1479316169-25297-1-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-EC6iz5PYLs8gTqZtU+gV"
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
X-List-Received-Date: Wed, 16 Nov 2016 22:32:40 -0000


--=-EC6iz5PYLs8gTqZtU+gV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-11-16 at 18:09 +0100, C=C3=A9dric Le Goater wrote:
> It had gone to the Tartarus again. Let's bring it back to light.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-ast2500-evb.dts | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> index 3dc472ae10e9..f60c367573f3 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -30,7 +30,10 @@
> =C2=A0
> =C2=A0&spi1 {
> =C2=A0	status =3D "okay";
> -	pnor@0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +pnor@0 {

Whitespace is a bit busted though?

> =C2=A0		status =3D "okay";
> =C2=A0	};
> =C2=A0};
--=-EC6iz5PYLs8gTqZtU+gV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYLN56AAoJEJ0dnzgO5LT56cAQAItC/hfM+ofwJrlId6Yz5vpy
hvplyXPPiEWOyc1XRNgHM7doITS1sikYtlkqAtIZewMgw9/AlQTESoukLoX+NbCQ
95X8zH68GOMezmAsSdQVPwtxQEbrF4VnYYx+Ctc8mfusnkNZU/45k7a3geBXKDoz
kLhrSm/bPE2WUDjC52ZQSKh1w6tCpsJSkY//7OVLjPcc6TNOjEILgoRFe8D59Zi3
QoKGDY68RZO8XRMb1g1TZL88mYJYwxz52e8E3SY2V0a7KOELDgkq8Vh9t3S0Km6I
zUC1PGQhhEe4WglKLcN9uw7TyjWZz1MKZ4sZqya5pMTn//33inQn4uAGCNWrMAM0
Xg+zBHYLbjKuBuiWpSxtjI/516chdNUzHX8lrJd0V+UDcrifux4S79B1sP0M8IjT
Bral7SLRWnfzsPJTewzONVLQ59TvnSWU62Nj68GfRVCZelGj1WBImlzCruEfrepK
0HiVIjFMfdqXEpYcUCqY8HvugiPzObdgqIN1la+DoiKpyyBD5ssz8pmiqMnXpExz
UksNd1JUDnDnZDqSuRXTq+0RTFcj/GPk4QSzAUtnPglwHHEJxNYlgW9c9JJpvV20
L4SCkIOS9ZHqdu2eKreRrhNgpvw8nRDvXaQqP04pXr1GY5/4QGvkMp2zjIf8IVma
mt0VYB94x4pXJGGjxJJR
=4NH6
-----END PGP SIGNATURE-----

--=-EC6iz5PYLs8gTqZtU+gV--
