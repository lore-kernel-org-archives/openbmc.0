Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t98G5354YzDvXx
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 15:37:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NxS28OxF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="uXZ2MSp2"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B791A206B9;
 Fri,  4 Nov 2016 00:37:46 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Fri, 04 Nov 2016 00:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=r6m0ocfM85iZNMtv49jK55R/c2c=; b=NxS28O
 xFMFguTHDaAeIseccREo/1SPddKWJ5iPs5tOjuR2Qf6kX8x4sgPpjbosuMdKZLZ0
 cVd5uhMqw6cpakKRBAYFIczV8hUBtsY6/CJ8ejO20H/goqopvqfz2i1ymHvTMtWz
 o+m2nAb/qMUE2TA8J79mR4zO2sqUdmqW8BtyE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=r6m0ocfM85iZNM
 tv49jK55R/c2c=; b=uXZ2MSp29sMmucGSyUYcnJJ0Ccok8+FuQeuwOrKlFrcVxl
 vaVXb2+i4FB2MX4MlDRg81Ahs9uxrC6VDq6IouR5hXuldKdCnwBqRdhidnYCiBOq
 LrXN8bECXENamkETWpiYA7yNK8FYkH9n1H3PK4QeeKG47FYQV6B6U6fR9N3RE=
X-ME-Sender: <xms:mhAcWII-lV_ZDNOqlSW58hiurAxqEQOJoxe8KfFCOi7qgYx7ueuVgA>
X-Sasl-enc: jz0HaBr8z5A9RqOqFVJU13AlOYBvfT5rCJ+iVdFaeQnz 1478234265
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8F4B7CC08D;
 Fri,  4 Nov 2016 00:37:44 -0400 (EDT)
Message-ID: <1478234260.27396.86.camel@aj.id.au>
Subject: Re: [PATCH 1/2] arm: dts: aspeed: Set SPI1 mode to master
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Fri, 04 Nov 2016 15:07:40 +1030
In-Reply-To: <20161104033042.32562-1-joel@jms.id.au>
References: <20161104033042.32562-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-JY4+ahzyW/L1ZknTiFua"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Fri, 04 Nov 2016 04:37:50 -0000


--=-JY4+ahzyW/L1ZknTiFua
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-11-04 at 14:00 +1030, Joel Stanley wrote:
> Now that we can modify the strapping with pinmux, select the mode we
> wish the flash to be in with the device tree.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Also opened an issue[1] to fix g4 platforms.

Andrew

[1]=C2=A0https://github.com/openbmc/linux/issues/110

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 2 +-
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index e1be7b0c5484..4c4c547fe412 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -36,7 +36,7 @@
> =C2=A0&spi1 {
> =C2=A0	status =3D "okay";
> =C2=A0	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_spi1debug_default>;
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> =C2=A0
> =C2=A0	flash@0 {
> =C2=A0		status =3D "okay";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 9ff2412eef67..5c93139ad200 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -36,7 +36,7 @@
> =C2=A0&spi1 {
> =C2=A0	status =3D "okay";
> =C2=A0	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_spi1debug_default>;
> +	pinctrl-0 =3D <&pinctrl_spi1_default>;
> =C2=A0
> =C2=A0	flash@0 {
> =C2=A0		status =3D "okay";
--=-JY4+ahzyW/L1ZknTiFua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYHBCUAAoJEJ0dnzgO5LT5pysQAI8QZBtQc+vKHggruRGYxno8
yh4k0Bb68IoB6zpOeWWEhmDb5Ueor8FPitLpGfX41BbR3nqhXT8a01CXHvOoTSQS
u0x7wScqSt31cZqrAYiZ2wxVkpex+yHxbn5F5DD+0KacxWPIr07FqAn+Dgya9GN2
iff+iZ5v2AqGtY9nq3HIMuF591YizJz7rMMXUFowr5IUYs6cHs92yEaPETKXU8R3
a9rWBvAhs5R2Yb9fR6j1iCIr76KrqMlW6G1xguSNBkXwOKC/KSKUw/7GsC43uG3k
VRMRxoKvhU8QTDX8wxGmtjdj41+GJmWqLSFU7wrYFA2HoTUAdnCiYkZEG4vFZwdB
bZvaftyZlizjWLsryI7ef5gFfuh+aD6OxKWQPaAAVRj+mC1zH6y/9e4jMxwN2GBG
kEPNJP0tWqsZQKsFs+s8q9cpZcGPSKha6gDQT9JuGS34L9gkFwcJ2KgH3hG7Jiv6
duQPav2+HRpzonJw7quNH7ffxz3Ot8TPGXZnuG3r9NpTKOjBwALmohHxTZEXzqfL
xbeeISLuvjnaRDL3p2WMm5WwGrxq64pxG8z1iNDhf/eHYdEM32hv188Te2/s/qCc
S7360GUGtR65Fy8FA0T6Pg8rfdberAuEObAceaozl769VFPMYP78g4AtePr3GzoP
iZwlw3tfmv688iCH3qim
=WYPX
-----END PGP SIGNATURE-----

--=-JY4+ahzyW/L1ZknTiFua--
