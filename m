Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vV14w35sqzDqHh
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 17:13:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aMBR1m4z"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dKwJBTlG"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 38C7A20937;
 Fri, 24 Feb 2017 01:13:34 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 24 Feb 2017 01:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=+sdQrfofq4Lb1fVcuNaONevUsoc=; b=aMBR1m
 4zhlqPN1giwr+3VSsAUQdxEFYpm1xYoEOB4MPzhy2nhAQ6uWHzmk8TaR6pPirNQq
 iK1cyMd9myOn3BcytoCeMjZlMeAyy1JwNUFjEEYMCeO2IhM6FH6tm2CDtvvYytzt
 lLyfNDu21ZBqj+EYrivTIzsD6+OQxs1ott2L0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=+sdQrfofq4Lb1f
 VcuNaONevUsoc=; b=dKwJBTlGpD6d/mjH3zv0fJ+Usg6PzLYJ3EpaO1f7DlDxwq
 ESm15Xtxp2tXinidYwRc+1xKLAHNIXrgQUvCdePwOPXlAmkNX3LG/DQWlA6lQK9y
 SeoDZ3EwXQqBo9VIMNqk2D1VTkuoEz48hjYDv3wbEHCEnyPOz/g+IdOrUP7+c=
X-ME-Sender: <xms:Ds-vWChDjgt7rVO-NEnVcuZhL5-3OSwlATJbFgabcMh0zE9_ZpExaw>
X-Sasl-enc: xmUs9by9I3DQsBI3d9VNa7FcrvTYoXgrRzvs1pXbCsIt 1487916813
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 423A27E12E;
 Fri, 24 Feb 2017 01:13:31 -0500 (EST)
Message-ID: <1487916808.755.2.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: Enable FSI for P9 systems
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A . James" <eajames@linux.vnet.ibm.com>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>
Date: Fri, 24 Feb 2017 16:43:28 +1030
In-Reply-To: <20170224061000.7066-1-joel@jms.id.au>
References: <20170224061000.7066-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Tza6oNjWs81g9u7FshBa"
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
X-List-Received-Date: Fri, 24 Feb 2017 06:13:37 -0000


--=-Tza6oNjWs81g9u7FshBa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-02-24 at 16:40 +1030, Joel Stanley wrote:
> The kernel driver is now stable enough to boot the host CPUs in P9
> machines.
>=20
> Note that this grabs control of the FSI mux, so to peform external FSI
> operations eg. to use a Cronus box, the driver must be unbound:
>=20
> =C2=A0echo 1 > /sys/bus/platform/drivers/fsi-master-gpio/unbind
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 2 +-
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| 2 +-
> =C2=A03 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index bef3afa24623..39c0b8f5fb83 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -34,7 +34,7 @@
> > =C2=A0	fsi-master {
> > =C2=A0		compatible =3D "ibm,fsi-master", "ibm,fsi-master-gpio";
> =C2=A0
> > -		status =3D "disabled";
> > +		status =3D "okay";
> =C2=A0
> > =C2=A0		clock-gpios =3D <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> > =C2=A0		data-gpios =3D <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 0769507f1126..4d26d4702a34 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -50,7 +50,7 @@
> > =C2=A0	fsi-master {
> > =C2=A0		compatible =3D "ibm,fsi-master", "ibm,fsi-master-gpio";
> =C2=A0
> > -		status =3D "disabled";
> > +		status =3D "okay";
> =C2=A0
> > =C2=A0		clock-gpios =3D <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> > =C2=A0		data-gpios =3D <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/d=
ts/aspeed-bmc-opp-zaius.dts
> index c2af9ffa89bf..548ef1e939fe 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -78,7 +78,7 @@
> > =C2=A0	fsi-master {
> > =C2=A0		compatible =3D "ibm,fsi-master", "ibm,fsi-master-gpio";
> =C2=A0
> > -		status =3D "disabled";
> > +		status =3D "okay";
> =C2=A0
> > =C2=A0		clock-gpios =3D <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
> > =C2=A0		data-gpios =3D <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
--=-Tza6oNjWs81g9u7FshBa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYr88IAAoJEJ0dnzgO5LT5Z7UQAIQGREi6VjtHjQ2VRpbSMCk8
pmN5ufRkaCJzYQZDimU/WThNu5fO3VNXAgjWlZz4uP3Ipwu3eEjuhsscXHvE1NOu
l2K+MNKzVZIxxCZFbgZbt4nJQ0l5TPCN3GYgAQtoFRGGVbD2tTLgYI5yjCVRwpnF
dMj9d3AO0N0r59f3ke/luuUxEg6SzFJiS+s5P9OftAu0O9GXVWSietivYE6g+Nm2
nq0hnCHdd4KwD5ac5SgBU41cpW2FQtlveCfz3rucEVeYhomYX4P/N4x7sHpSQOKT
y78kIcvGYyKHWk5FtkDE5LaGYjdfrGub4phAysz2oWKe3s7gAnl86DZvSVxq8Lwu
cd2+Rz3XD8RY5hPj/FcIDTGViuDRDfJGlt/5aFU4e01eebclT42I2GR8g1yiKjeE
aCMyYiYGgxBILjwCafa4RixuWVZCZmzAf2DeYVfEIHYnnw+CuvMzA96gypfUfjZ1
NzI6T3y+cMOUMd7HQX6xfq2OKSTVVW0c8V2y+q8gFmh0gFIXMMydXokq9E7DkdRj
xd59JyxapvmtuY8qC96tIJVJ0w6+HsJmiEsb3lD52V0WfB2oYpNCDxflPV8sKdr/
+E9w0EBOGW1RDM6FGiPfnpiHeNmxLUTfn1+0mDDDpbDzIw6Oauw2U3omZrJ78tRb
cABkn4MENOeVRacBFnU3
=4vHj
-----END PGP SIGNATURE-----

--=-Tza6oNjWs81g9u7FshBa--
