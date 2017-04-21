Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8H0Q43BGzDqKp
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 10:38:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iiAOCt/3"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C1P+pJSE"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F7AD209F6;
 Thu, 20 Apr 2017 20:38:28 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 20 Apr 2017 20:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=mbOpKNcxtywyrt9uyzWFzCg8ax3ABg9RxnpMT/rxn
 QM=; b=iiAOCt/3osZiGBBKvz4GrZhBI8bGS3C6O1mea7wugGqbf3pwZCwf2E9Ig
 AlgniB9RKQwp9OPZqY2oX8Iko4jZz8xLCn5lsZ98Jju07QlOv8q3nqIv1qZfGSJn
 rvmvIXSr0rAllZZXUH1o+RL+GVM8XFXZedgO4PuyBeOqvcgLpSGMbkZHknIySy4G
 KwMmIbmIRDDGFRsliBI5MiK1ATqRIyH+Vpfj9l27SoSdDMNW1PkqfPYAPI2dGsvI
 UwiybP53n3Y2o+aTchjIeqz4IJ6+fFpn6LY4DiEnytFKD4NR4jdr08MoovBrjXYT
 tdsXkTj3fQ2mfTIoTHiDqAQMDnG8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=mbOpKNcxtywyrt9uyz
 WFzCg8ax3ABg9RxnpMT/rxnQM=; b=C1P+pJSEgugqou43B7OIwu3GqUL4DoZ9nu
 JmrtSQqCffNTW+n0TwNsHY+E2hDA79Olw/H1C3yWTNwXvnHeshFT9NbvEMA2Ipib
 v1j0cQ1eR5CAiNupSNNR8pD8wpXFbgDJBis6u5TUc6hfsP6/YTc64CiwYTm3MnPh
 vdLqaSF50faeuDKeO7a8wDiqfYn/5mvnvRjR5iL+gqKJjzmzOouavs+4idOwfsQz
 wfYhxdrAZenR0lhMf9jb/5uIYTKtOqs7o3vLVgj3X2bPuHON3MZbSbrPJ6OFYPIy
 PdwPYdwfRH6Xezq4sY2xTa7ViB/VALHott8mY1kV8y/3Y0L0k/Fw==
X-ME-Sender: <xms:hFT5WHjsUgCjWTUZN1408k4UgXU-o8EP_APYV_ZZJBRjRjf41RR5hw>
X-Sasl-enc: LqfeIjS+yn34WBZK0Jp8UfLzBZ5VkuPQ4Ag8eRY5L8BF 1492735107
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDA0224370;
 Thu, 20 Apr 2017 20:38:26 -0400 (EDT)
Message-ID: <1492735103.1011.12.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v4 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org, 
 joel@jms.id.au
Date: Fri, 21 Apr 2017 10:08:23 +0930
In-Reply-To: <1492630922-26202-3-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1492630922-26202-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1492630922-26202-3-git-send-email-bradleyb@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-eVwysII9LzFLgE81Hl2k"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Fri, 21 Apr 2017 00:38:31 -0000


--=-eVwysII9LzFLgE81Hl2k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-04-19 at 15:42 -0400, Brad Bishop wrote:
> Enable gpio-keys events for the checkstop and water/air cooled
> gpios for use by applications on the Witherspoon system.
>=20
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 20 +++++++++++++=
+++++++
> =C2=A01 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index e3a7b77..750420b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -31,6 +31,26 @@
> > =C2=A0		};
> > =C2=A0	};
> =C2=A0
> > +	air-water {
> > +		compatible =3D "gpio-keys";
> +
> > +		air-water {
> > +			label =3D "air-water";
> > +			gpios =3D <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <ASPEED_GPIO(B, 5)>;
> > +		};
> > +	};
> +
> > +	checkstop {
> > +		compatible =3D "gpio-keys";
> +
> > +		checkstop {
> > +			label =3D "checkstop";
> > +			gpios =3D <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
> > +			linux,code =3D <ASPEED_GPIO(J, 2)>;
> > +		};
> > +	};
> +
> > =C2=A0	leds {
> > =C2=A0		compatible =3D "gpio-leds";
> =C2=A0
--=-eVwysII9LzFLgE81Hl2k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY+VR/AAoJEJ0dnzgO5LT5QEAQAKc8ztb4b9xIDS5hTEkH9uhT
yf6C1O+U5h1rIGZr0TqCW84HEZB6/kGKsnhc+e374US19koabINi9X7pWvSvHVNn
mVnc5O1BB/rdE5pels3Jaa4L+C6/mo9+F8Ekauror2tTPuzQ+vrqHbOF6YH8FR2q
GBdK08JgSM6g+1c/1vj2uDZuBVMw4QgaB3bDER9WASPBYn+M34P0pFFMQm0OWeZ8
DZpGmhnNmMH4a4ptsGoawrQbJCt3OLEwlO7wN9mcfE/vDiFErZ38OgPtMcMrhiFn
hoNlFK2XocOOHcZUGlNb8TGYDN+16JBilw0p6u3ll3rCM4fGlDAtCz0+VZw5H/Z9
cQDWaM9eNhkK+3uWsf3F6f0+SKNIJrAruSO1wpgktYTx0HUH5lqYCKhPq+kVuoMe
pQtXyKRUbK2G3Gs+fUk+c3ZhyvvI3Ok7i1wLli67aoc7FYG9ifEML0GA/qQfkiLr
KG1Z7yfk5yavCXPj21aZgP5CctPyCQViLqzttYc0sJUavCJjHy8jwPSAqA/KhB0x
62HdrFqF80vEsKAdS4RnFdv588L3ya9lIgd/i4prgFRiMyK1gAoy3FYcnQQ4xcFO
qY3Wuf0fK8hD9YhLqMiAFXH2kpo/7n33aOPsqdKYAIR/mE8uWtyIWDR4THtl802P
nXmAX7l+QXFMlUO5CgbC
=stjK
-----END PGP SIGNATURE-----

--=-eVwysII9LzFLgE81Hl2k--
