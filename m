Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh7Dq0RCzzDq5j
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 18:25:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SQPITP6m"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Y5H3vYDL"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 52B0F20B4B;
 Mon,  5 Jun 2017 04:25:44 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 05 Jun 2017 04:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=GlyZWC/vVPFKP16eWRHJyEo2uvRTz3KdlBHwr4TcK
 +I=; b=SQPITP6mMYWZRM+bYe5J3BYud7Q5DGq6j+he1vMQ/TTu77gmDJoxR3pKm
 fK1UI06OkRQHoWuCQyabyR0WoJhDIKeCVObPFXRFNBrWobezNObwg6XlVyawNl/L
 ksvh8GUUL7bj4+xJgGXfQ/DpHnx63RKMxhbbsA2de47TWE1NaS0u3M71RgiPLEIv
 gcDtEOmyLQ5ZgEhkoX7/DVvQRccyirTdkYkissQc6dZDyzockNJ8NXzT9JNafhgp
 yCyDZ1Tba/eVd/GISLWQV4u3ySF9RVq8XK+ksN+WyKo01dpcdV4VYlLvGdI/Lza1
 gEKlGPhiQEXxaUxpGStCLLvnnDZhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=GlyZWC/vVPFKP16eWR
 HJyEo2uvRTz3KdlBHwr4TcK+I=; b=Y5H3vYDLCNZmMMFg2gaVo1g1FP8OG2iU9c
 wqmwNFrUZ75PnKbwD//eZYLdapmFHy9POLStaY6dmvYVcYBjZuROEg4V2A3DFRgL
 8rhoowNv4yfKRjvUzaI5M3Zo3v3n4a2HgSq9IZRwc8tMt0CxugMeJ6ivJTOKrskW
 NLRU/a9L+c+WYRjPWm6pjmRMGuBK3lO6DZEPKfQtmMShaBAmRfModnRLFZIcMNa1
 Rt8Q5Sjtn05AYugFcsOLz4FlM8CLBIBxQdZAWENeAaak/ayKzZSyx2uQ4011iSFx
 h/r4h5pYoezbDCzarj4GZUV0SI1QGwOhyGaspbvNWuUm8mrpUZCw==
X-ME-Sender: <xms:iBU1WcLsUyTRvIzbnyYvFn4M9lLZXgugfmzkiXa_uepKgIdclojEpA>
X-Sasl-enc: OlDgrUTsW3T6jT2FeGgedBP1VDayzZLrvVOw3wjS+sAj 1496651143
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 71E157E814;
 Mon,  5 Jun 2017 04:25:42 -0400 (EDT)
Message-ID: <1496651139.8159.29.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add devices under FSI
 CFAM
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 05 Jun 2017 17:55:39 +0930
In-Reply-To: <20170605074301.11310-1-joel@jms.id.au>
References: <20170605074301.11310-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BOklv5u+ToyqF1+DKeWF"
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
X-List-Received-Date: Mon, 05 Jun 2017 08:25:47 -0000


--=-BOklv5u+ToyqF1+DKeWF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-06-05 at 17:13 +0930, Joel Stanley wrote:
> This describes the SBE FIFO and OCC device that are attached via the FSI
> bus.
>=20
> As this layout is common to all existing p9 machines, we add them via a
> dtsi.=C2=A0=C2=A0This dtsi requires the 'fsi' label be present.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

There are a number of ways we can lay out the nodes in the dtsi, but
I'll save the bikeshedding. What you have looks good to me.

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0|=C2=A0=C2=A08 +++--
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |=C2=A0=C2=A08 +++=
--
> =C2=A0arch/arm/boot/dts/ibm-power9-cfam.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 45 ++++++++++++++++++++++++
> =C2=A03 files changed, 55 insertions(+), 6 deletions(-)
> =C2=A0create mode 100644 arch/arm/boot/dts/ibm-power9-cfam.dtsi
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index 03cde39189c5..dd01dfaa8509 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -47,10 +47,10 @@
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0
> > -	gpio-fsi {
> > +	fsi: gpio-fsi {
> > =C2=A0		compatible =3D "fsi-master-gpio", "fsi-master";
> -
> > -		status =3D "okay";
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <0>;
> =C2=A0
> > =C2=A0		clock-gpios =3D <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> > =C2=A0		data-gpios =3D <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> @@ -70,6 +70,8 @@
> > =C2=A0	};
> =C2=A0};
> =C2=A0
> +#include "ibm-power9-cfam.dtsi"
> +
> =C2=A0&fmc {
> > =C2=A0	status =3D "okay";
> > =C2=A0	flash@0 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 3001597d42d9..42b70a5d57aa 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -63,10 +63,10 @@
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0
> > -	gpio-fsi {
> > +	fsi: gpio-fsi {
> > =C2=A0		compatible =3D "fsi-master-gpio", "fsi-master";
> -
> > -		status =3D "okay";
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <0>;
> =C2=A0
> > =C2=A0		clock-gpios =3D <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> > =C2=A0		data-gpios =3D <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> @@ -81,6 +81,8 @@
> > =C2=A0	};
> =C2=A0};
> =C2=A0
> +#include "ibm-power9-cfam.dtsi"
> +
> =C2=A0&fmc {
> > =C2=A0	status =3D "okay";
> > =C2=A0	flash@0 {
> diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/i=
bm-power9-cfam.dtsi
> new file mode 100644
> index 000000000000..5beb978f9f31
> --- /dev/null
> +++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
> @@ -0,0 +1,45 @@
> +&fsi {
> > +	cfam@0,0 {
> > +		reg =3D <0 0>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> +
> > +		sbefifo@2400 {
> > +			compatible =3D "ibm,p9-sbefifo";
> > +			reg =3D <0x2400 0x400>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> +
> > +			occ@1 {
> > +				compatible =3D "ibm,p9-occ";
> > +				reg =3D <1>;
> > +			};
> > +		};
> +
> > +		hub@3400 {
> > +			compatible =3D "fsi-master-hub";
> > +			reg =3D <0x3400 0x400>;
> > +			#address-cells =3D <2>;
> > +			#size-cells =3D <0>;
> +
> > +			cfam@1,0 {
> > +				reg =3D <1 0>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <1>;
> +
> > +				sbefifo@2400 {
> > +					compatible =3D "ibm,p9-sbefifo";
> > +					reg =3D <0x2400 0x400>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> +
> > +					occ@2 {
> > +						compatible =3D
> > +							"ibm,p9-occ";
> > +						reg =3D <2>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
> +};
--=-BOklv5u+ToyqF1+DKeWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZNRWDAAoJEJ0dnzgO5LT5AVYP/i2lVG7PfpBFMyzXWSz+vEZC
KsGhxRqeepQgMoxBJ+qxJbTE06YfqvbBQi4IRH0GAQsGv4Msx91nwDzkdaiARrhp
kw1FNe7BPJiVJ+D1N9VBqnRB76zLV+CPkH0RpmkuZaTeREc9gLJwBfOcYeC6QBm6
rX0+/ytnFKwHVQZwXZ/VwIKt8xoQumL6LwkrZSvh6M5PIcdeO2pwk2QQNycGwfI/
2vPnuB+ZY/XhK9mw6HXH5aB/6p1d38NRJhd6ZrvKaJarU8/1qra9YfMrOLZXwVPs
/Tyh4jN1OjAoyR4z1IFAYOoE7lD0vPFQDognAEz0LOmlHHd7E8zt5HNOjlsKAON8
+DZndisKatVfoDkgu8A4dYOOPj+jYlUdHWKglceCgMNyUb/t0IvRsebU8MEcT8Or
hQuIwl1slSz/w79r/tLoQ0/zEr2h2reP51fuCF6/uCuHqDIC1XzUJP17w3oB278k
AL8HRTXQKkU87X/8leffao9/HjQfoxNBApWNBkuzf2D0aG0+ruM0M0HxR1617snZ
fTPTLkVuEpo4cf0/PJcWz4bWCocHnBp8m2uyWHNRtC2HZm1cSo46C1VggKfDscI9
ipWNrh6pSsdrVfHhvlJNQq+TlytFED7VqZt8zJhqPnacGwZp7fAcWVw04HyphRZh
iJYAHuuigNzP5KDOOCRL
=yMQ3
-----END PGP SIGNATURE-----

--=-BOklv5u+ToyqF1+DKeWF--
