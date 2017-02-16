Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vNyzV6jtDzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 12:21:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZqXV1eRd"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="d23ngYsa"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D882A20989;
 Wed, 15 Feb 2017 20:21:24 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 15 Feb 2017 20:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=E5SQYWRMA6aakXZNRwcUcwSHESQ=; b=ZqXV1e
 RdlBfGUhq6tr+ljVFFX4MK6NckDMi15XILtXBFI70vIoLJ+pMkfFMEkbz+xpeXhL
 eDHarc2kuDy7Ev5aSU1CUKwwhVh/dDm5Em6U6iDoJaDtb5dy6ZQCEEPV3rNdFtYK
 7vX8L3vY5CmlqzRuUgPrl/VHx1rPyG3WPeU+Y=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=E5SQYWRMA6aakX
 ZNRwcUcwSHESQ=; b=d23ngYsaql5BBl5hE22av6SNo8PBMqSxyvbW1pVvL4WxgF
 sy+KeraMrOX3KH0IQpKHCym2TMG+Bzy+ORBuNn4tLhzi9W+MNZ8touOw7bsTWrUk
 Sv2+b6aDgmsme/McIBAdhiVbOB2Xwi57junWno95U3fUQHo0HbGPFbUvaj7lM=
X-ME-Sender: <xms:lP6kWMgM5moaBUp8sFvuszbheXFPMjM88eRlNE3hM-6MDn1KU1K8DA>
X-Sasl-enc: QZyk8ss5aJu1RBXWIPrp7Z9erN78yiWiPHYuvwuKQcM7 1487208084
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E82C7E033;
 Wed, 15 Feb 2017 20:21:22 -0500 (EST)
Message-ID: <1487208079.3661.32.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 2/3] ARM: dts: aspeed: romulus: Add
 fsi-master GPIO bindings
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 16 Feb 2017 11:51:19 +1030
In-Reply-To: <1487057409-19872-1-git-send-email-mine260309@gmail.com>
References: <1487057409-19872-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-jkf7K+MeU4ogFtNR3GZ5"
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
X-List-Received-Date: Thu, 16 Feb 2017 01:21:27 -0000


--=-jkf7K+MeU4ogFtNR3GZ5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lei,

On Tue, 2017-02-14 at 15:30 +0800, Lei YU wrote:
> Define the pins used on Romulus by the FSI GPIO master.
>=20
> > Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 13 ++++++++++++-
> =C2=A01 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index f47eb63..bc13ad9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -1,7 +1,7 @@
> =C2=A0/dts-v1/;
> =C2=A0
> =C2=A0#include "aspeed-g5.dtsi"
> -#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> =C2=A0
> =C2=A0/ {
> > =C2=A0	model =3D "Romulus BMC";
> @@ -31,6 +31,17 @@
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0
> > +	fsi-master {
> > +		compatible =3D "ibm,fsi-master", "ibm,fsi-master-gpio";
> +
> > +		status =3D "disabled";
> +
> +		clock-gpios =3D <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;

This looks okay

> +		data-gpios =3D <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;

According to my Romulus datasheet, FSI_SOFT_DAT is GPIOE0 and GPIOAA2
doesn't appear to be connected. Am I looking at an out-of-date
datasheet? Did something change here?

> +		mux-gpios =3D <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
> > +		enable-gpios =3D <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> +		trans-gpios =3D <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;

These three also look okay to me.

Andrew

> +	};
> =C2=A0};
> =C2=A0
> =C2=A0&fmc {
--=-jkf7K+MeU4ogFtNR3GZ5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYpP6PAAoJEJ0dnzgO5LT5dGoP/1sOfKkuFn3632IKn+Uu9Evc
RNA/GWu3KrV9Ituqa6xR6OJPwUDo/I0LLl8VRyjWnzdwVm+NBXzHlU3BKg6LEJn5
uUZCEcwJCuRb0vH6nThy1f6SujSqMCVnKx6XN+eScvUmoFq4L+e4BowDdh5WYSV2
znWOclwWXeYqevd2KKRmsZDJezwJe/uu0IpETmN+4wRh2lox4hv1agAVxdvieW3W
eUuHyR78VbLSS0B2AUMozDwLZVbSWO6y8h3rQ29CKb37nIDdt/DdTBfDMVzgLiS+
24oEhBM3PQfMOS11L0Chmsbt7arsvIHqN2pUwxV0WHiQpaTLRiQzb3R3JAfQ1sLa
sH4rKrFu15yM/MU49XciYjRw42nDKUqELcuHPf5MkzRATx+h+J3I9TYvloiuibuy
FC96hb7rC/0V98qHSh5fen4Kv137LAn7tfNrkN51dNa1HGfxgIr8bH8nSNTT6Yk4
9DIIVxmH0XuKDZ3JjTf+qfGJB4t32WRGD9Nhmuwmc8H55yn471J2ucE2EUP9q6EJ
+8v0flAXIcRarInaj3a7fSKxwi6W1d9FKNq4Qr0qRTFNVwPkKSKgMYkBqQAqFIL+
tbh0CjU3uZRF4xZIGTvHed2fqirOKX85oMQvMgz5W9IMtx2kSz3sIaCDA0r8dO4l
3Q1zPlemN155qD6ytWBl
=xf4s
-----END PGP SIGNATURE-----

--=-jkf7K+MeU4ogFtNR3GZ5--
