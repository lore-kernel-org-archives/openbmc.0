Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xf1fc38WxzDrVs
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 23:07:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZcNtHjnH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iOTy9PAT"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 252B1209D7;
 Fri, 25 Aug 2017 09:07:34 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 25 Aug 2017 09:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=eldwlp/k8f7rj3E4SHUr39j24UdtCVAVmelW6duuH
 pk=; b=ZcNtHjnHuykZjCc3rou3eoE0VmmpeCUCB/VDqj1cv8E4jzx/Ajp4W6HrM
 fx5NXc8emP5IkOVS7ROMMGL8dbRCF/fCYLKRHIYo5n6657SZyOy915cVPZfyl/B/
 F/jhdZFfFcvysKeOnr2Ox4NXcTDp061hoNDDguTEYNzzrimUbzb154cAbBxiKGc9
 JvD8vHQL1oEtNOL/L98kR0X9R3NSJtP5+5bDELUfhHcY0NsfLZdwYFumIQjgdSlb
 cS+Z4383odv3w4lApJXW8jJg4r4k2qwi6zw8GRx8Ssl4vAldRML/KXy4iAadUVDS
 48o2Qp0tf3PlYNLLbGI8vQ8NUEwRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=eldwlp/k8f7rj3E4SH
 Ur39j24UdtCVAVmelW6duuHpk=; b=iOTy9PATBWaaeKZf02ZUKiJl/1eA9tEkDb
 HSaXGl6jHoMpxCzLZlAkdjdc/afUGX2LOPc7autXNA8ZmBlo0dddC0kdipOCKYN7
 Cd8Bqn1RUSvZfeMa6phRp9P7b6FUWuSMoH4wuE+yuUe45fx3iEkQ6HAf9EoLjKq5
 Jdi7zaL9o1LjgJ6R8spTyNV9r2uXl1IHAGKCc5cle/9C55oRQt7JHwNGXkR9u/XX
 eoRrFO4DM0yhy/p9yp0Jl8iwKAMgfXj+PuJA9Qtbs/eMC+yPrcdanhHsvz/WwDAc
 BFJ7La/3ikVljcO0pf/tWXZZaBAHzVRqWx/Kh0EbXAQzgpNQs78g==
X-ME-Sender: <xms:FiGgWeCrNP6-I_VXiaOmJlk4aPk9bOikksKFFPQvAjf7fnlx5SIdsA>
X-Sasl-enc: Ym892LRGd0YJZcTM/qcjGpH2KJ4WCQHirh87Fr298f3C 1503666453
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5ECD07FA7C;
 Fri, 25 Aug 2017 09:07:32 -0400 (EDT)
Message-ID: <1503666445.32695.6.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Assign vuart to serial5
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Fri, 25 Aug 2017 22:37:25 +0930
In-Reply-To: <1503564992-11194-1-git-send-email-mine260309@gmail.com>
References: <1503564992-11194-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-RNvFnZTdtFJgKwBdjpV3"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Fri, 25 Aug 2017 13:07:38 -0000


--=-RNvFnZTdtFJgKwBdjpV3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-08-24 at 16:56 +0800, Lei YU wrote:
> vuart may be initialized earlier than uart1 and occupies ttyS0, and
> causes uart1 to be ttyS1, while uart1 is expected to be ttyS0.
> Add alias of serial5 for vuart, so it is guaranteed to be ttyS5 and does
> not conflict with other uarts.
>=20
> Signed-off-by: Lei YU <mine260309@gmail.com>

Applied to dev-4.10.

Thanks,

Andrew

> ---
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
> =C2=A02 files changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 1525932..a83b6a8 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -38,6 +38,7 @@
> > =C2=A0		serial2 =3D &uart3;
> > =C2=A0		serial3 =3D &uart4;
> > =C2=A0		serial4 =3D &uart5;
> > +		serial5 =3D &vuart;
> > =C2=A0	};
> =C2=A0
> > =C2=A0	clocks {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 72b6638..cdea4f4 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -38,6 +38,7 @@
> > =C2=A0		serial2 =3D &uart3;
> > =C2=A0		serial3 =3D &uart4;
> > =C2=A0		serial4 =3D &uart5;
> > +		serial5 =3D &vuart;
> > =C2=A0	};
> =C2=A0
> > =C2=A0	ahb {
--=-RNvFnZTdtFJgKwBdjpV3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZoCENAAoJEJ0dnzgO5LT5uz4P/0nYWA5dzxjWtlJ4Oigivy0k
KYBchUfalMvzHwi7dy5g7UEQLkRoReex0wwUMXZxeGbEPB9L9GqPqsAD3hfvbPKL
Mcsy97WdlEBdA0paLvVhb8sm9iBNnEYd05zfYMaxdeleNrOBYjgREaWt2fTWSlTA
nlGdSmwYSQBrTAGgKRKuu6Vtplkz7H5KU9C/k3Luwn+tbUu84PQryS/hwPqTjmht
42b4XrRnu7epaxHn+0X0IyVCraG4ySCO9PjmWFkTbHo8XL8tTEpNuOE1qNQb7fAq
FkYSQZWPEQTb3vQuutUG9ZRQpZsfxOxbFMFBcXBqexO/GQfHBC7KgNEmx0YX03Wq
tQQLzuochkDrKogmv/om6sx/P99A6d1CDqQzA4R9BVPo/HsjF1CSlMlHFlX4pMS9
Ru+4IxrIw6rsP3/pfq5I9VjeIsMOOsdLs59HI2sAXDnmqTb5Kib8JPIASExkCH6U
DKjqOaskWIGlO0yMKDHE0+uOBBTX5IQw6VCmJBsMo83tfp+9N0qTUGenYZRRbQu8
JUar27FZNbNOmkWi/jjAD2AcCByxlhAuUpAqIczb1jtiWfaAgB1MFi1F6wSdmjBt
d+rrazmRCttZvLQ/EkkUBby1xlGNzaWgxNkZ2uXGm3AAzX5slFnH+pX8sCpW5rb3
99abUU1nNqkCfDkk00eV
=TeVR
-----END PGP SIGNATURE-----

--=-RNvFnZTdtFJgKwBdjpV3--
