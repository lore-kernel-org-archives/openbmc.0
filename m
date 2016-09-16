Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZxHz4w5DzDsZP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 10:39:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=d8FvQJyo; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=cNMdL38D; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A43B220686;
 Thu, 15 Sep 2016 20:39:41 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 15 Sep 2016 20:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=n21cB
 SCjkEaK7q0TPjVcVXcHvAA=; b=d8FvQJyoWR3fQ3Dd2fU7fQklGLpkPHT/+58+N
 NfphXSDxK98b7VgwzCr96Tsl0A5PlX+Q4MPFYuDBJ9y0+U905iDVDmuUb5iIc9a1
 P5Axj+n7FnroDlsvMEzcEjx7I0CUBmMuEoLEJ9y9fscrwWAYtiXYH0xOgNLOkoR3
 E2vcyw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=n21cBSCjkEaK7q0TPjVcVXcHvAA=; b=cNMdL
 38DXALZkR+neYgeu2XQKUVyWYW5rKLuEn5Zit4gbVnmi3Xkp2PF1fhbTR0LDvlZV
 YIzhO14wYtdPJEBpZcLt2sOmpoO891rzv4uyoaaC2bQi+1z46cSqb1Fjrweppdha
 VCScR3IPzsJ/eWuacH508UR1lRM/IX/q3l82WI=
X-Sasl-enc: GV2Uqwp04panhHrsb+i25kn+PLybddBoWwvKu25yAhdF 1473986380
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92DF7F29CD;
 Thu, 15 Sep 2016 20:39:39 -0400 (EDT)
Message-ID: <1473986374.13249.5.camel@aj.id.au>
Subject: Re: [linux dev-4.7 3/3] arm: dts: aspeed: Add SPI1 master pinmux
 hog to g5 machines
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Date: Fri, 16 Sep 2016 10:09:34 +0930
In-Reply-To: <20160915111308.31481-3-joel@jms.id.au>
References: <20160915111308.31481-1-joel@jms.id.au>
 <20160915111308.31481-3-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-SB98XjEAnNL83fg7hbP+"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 00:39:44 -0000


--=-SB98XjEAnNL83fg7hbP+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-09-15 at 20:43 +0930, Joel Stanley wrote:
> This is for reuqired for using the PNOR on ast2500 based systems.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Have we sorted out how we're going to deal with the strap register
configuration (given the pinmux driver treats it as read-only)? I don't
see a u-boot issue for it yet.

Cheers,

Andrew

> ---
> =C2=A0arch/arm/boot/dts/aspeed-ast2500-evb.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| 5 +++++
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 5 +++++
> =C2=A02 files changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts=
/aspeed-ast2500-evb.dts
> index d34e6f15a0cb..a517b4a595b8 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -35,6 +35,11 @@
> =C2=A0	};
> =C2=A0};
> =C2=A0
> +&pinctrl {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_master_default>;
> +};
> +
> =C2=A0&uart5 {
> =C2=A0	status =3D "okay";
> =C2=A0};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index fcc880a80ee0..d7db9700172f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -36,6 +36,11 @@
> =C2=A0	};
> =C2=A0};
> =C2=A0
> +&pinctrl {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_spi1_master_default>;
> +};
> +
> =C2=A0&uart5 {
> =C2=A0	status =3D "okay";
> =C2=A0};
--=-SB98XjEAnNL83fg7hbP+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX2z9GAAoJEJ0dnzgO5LT5hWYQAKVP7nqCog2QMgTpXmm7R0Wh
T6RftaLss1fcuk3Qva/4Oxmgv2XLpDWbxOqCy/KAlNiSRZQ3UCxUPE0FkGORtmiV
WPwf3jFKcHa11lKBBBSFrYl96YPW/0PoCtjwhRka/xqwQI9PQST+xnu/pW4ID2Vv
ltDQwVF3KNDQEpL8on3zJbhbO3s2yNeqWHTwqun/ferKSSNcJUChKkuSoU/5F+c7
sdtzVBxdtWGJ/RBiuCzvqUWAxIZL+vbn52ukzd9TnNMyXtZU42XT9Kzx9+UbYCeB
UyzNYTL/WozkjGuVMZf0pfK8+6YfSu4SqxMj6cNDcACvwkLABzX0ZjdZ79cbWrTi
2xkrNpqopNk7PXoWRbmpO9XSRByOnAPQLjuw8uqhlwKd4dWbASic8f5ELfEv254J
jP3gsBQtXHZnej7DAXvwPIO1WhGQkNsoeReLKzYFIUeMGPiNGLcXTopuLAtewWJZ
khD7EhpblMqcw+784STeGW60lQ0GjEEgLn4Y3kOC5kQ03FAB/ZESeNkibxDGUduq
ZeDKkB4k2vtY6FyPkwRJcWl4ACYSG5l7zkpdBF/DMAbqIW3GvnuwidVYbbM3kDoL
3XkHkeZMykHKoSXIgf097F18EsDqLUjXcBuVvk27pSd60dLi5HKDJh6PgaO97tS6
K4k9lOH3D5tXlBFHAbW0
=kPEa
-----END PGP SIGNATURE-----

--=-SB98XjEAnNL83fg7hbP+--
