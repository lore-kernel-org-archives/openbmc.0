Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ksrBvkV8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="P317mRn3"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGLCz6Hp0zDrD6
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 14:25:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F0ED6207B0;
 Mon, 16 Oct 2017 23:24:59 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 16 Oct 2017 23:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=tiO4CAFxCVijaYurVChdLd8O+tJSCWep2RjDUngPsbU=; b=ksrBvkV8
 PAFr4bPN4XQ+mVzpGb2TCcQij36sYWJVATwEaBWzanxxmOdzVxwnls8elmus4l2Z
 nkgosnTPFWtMo3NS4R+yut5hNqZRmHuDQtRQwJzzajE7KS4aHyurhTfeaFiyDU6u
 aaFZ1s/jvbzEQOuJBTIyxHkOLJ9yc07bW7JdGEwMnMngt15MB9cuZWglU10HsM7K
 QfWHYI/AFXQPcij1HDdaL+1fB2w2i2FjzThKzk3KWXNRNVpJ/Da7rsZfSSA3F3YV
 3cXxPHiZfxP0e8V0qQijTCwuom/i3k4p7OZzE82ECr8P31ubgeeUEOyCsTJs5EHA
 CgliCjiBHYC/VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=tiO4CAFxCVijaYurVChdLd8O+tJSC
 Wep2RjDUngPsbU=; b=P317mRn3xxelkiPtQbsaMoSiPYDHrUgZpeFPMNcyC1D6U
 FYAW59d11cnyjo9tywDAg4InRZSSZrgmEIgaQ7rfRTIgdxi5X8F4UzMWSVzmvcdH
 JgotbyzoR3FNoAtVl/otJopNFw9/xQp/zgvkf+7Lr+Ya1WR37Z3p55Wb3gUK+xCq
 fH/tBYCxPozYqhyQo0lfE9o4ZHVegEjzDad6cHbEerkCnk4ltND2IIgZL+YBRVZw
 cDvdEkLYqqi5B1Sjnm6AV3bGtQtGUzKIh7vkFm7olh648W/80cj3z0bfmOMf5PPC
 Wd+mzsbBp8LfhypnryIvOiKfBsOp1OCstQ6UK0WBQ==
X-ME-Sender: <xms:C3jlWa8dGd_ILngmptKryFs1N3CVBMsBwXZWhjq3VeiO7PEl6sO39Q>
Received: from keelia26 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id F08A77E237;
 Mon, 16 Oct 2017 23:24:57 -0400 (EDT)
Message-ID: <1508210694.24322.13.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: g4 & bmc-quanta-q71l:
 Add aspeed-lpc-snoop
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Venture <venture@google.com>, joel@jms.id.au
Cc: raltherr@google.com, OpenBMC <openbmc@lists.ozlabs.org>
Date: Tue, 17 Oct 2017 13:54:54 +1030
In-Reply-To: <20171016194353.171692-1-venture@google.com>
References: <20171016194353.171692-1-venture@google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-9zAZD3Be6XtTDln8R7xo"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2017 03:25:05 -0000


--=-9zAZD3Be6XtTDln8R7xo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-16 at 12:43 -0700, Patrick Venture wrote:
> Signed-off-by: Patrick Venture <venture@google.com>

Thanks, applied to dev-4.10. As a note you forgot to Cc the list
initially, so I've added it here.

Andrew

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 5 +++++
> =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 7 +++++++
> =C2=A02 files changed, 12 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 0ff3af7ed871..7ed3a773b2d5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -129,6 +129,11 @@
> =C2=A0			&pinctrl_ddcclk_default
> &pinctrl_ddcdat_default>;
> =C2=A0};
> =C2=A0
> +&lpc_snoop {
> +	status =3D "okay";
> +	snoop-ports =3D <0x80>;
> +};
> +
> =C2=A0&mac0 {
> =C2=A0	status =3D "okay";
> =C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
> b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 6151704aa87e..6505062ac6c7 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -117,6 +117,13 @@
> =C2=A0					status =3D "disabled";
> =C2=A0				};
> =C2=A0
> +				lpc_snoop: lpc-snoop@0 {
> +					compatible =3D
> "aspeed,ast2400-lpc-snoop";
> +					reg =3D <0x0 0x80>;
> +					interrupts =3D <8>;
> +					status =3D "disabled";
> +				};
> +
> =C2=A0				mbox: mbox@180 {
> =C2=A0					compatible =3D
> "aspeed,ast2400-mbox";
> =C2=A0					reg =3D <0x180 0x5c>;
--=-9zAZD3Be6XtTDln8R7xo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ5XgGAAoJEJ0dnzgO5LT59J8QAKPQPEOCyZzi1ww5BJqNR9o/
MHuS9W6bswpCsEkLqLEdHHordbZijLsV/9tu0HNMlPXJEOdmj1sEotoQ+UPKp4ck
LKnRwXZYtzsKtNCy98gL+81JVMgJqeGU2dxHOZe+4fS7x+duPbTblNZVBQKYbU8b
GlVqPxpV/YSXR7diF6hMi5napqHLhRrRUQbp71rin/jeIqQ706OXxIuOxbTIOyrW
XM9TwS+gGto/HfwHwTwleJGjZjqNBGLkA8FwhoBQnZ7HimB8w0xBHgyAqEJBklyy
OtOOOQcZHe9AfwRTixDIrtUZdVdSVa/w71AzHAQmcRMghOdNlIWbecJcxGAZUHXD
0E30stqZhjgM2ztFQTFH1X44+D3pkfT36E/Z8tAQIZRzJdpSlIxK6ZiqCE27ObLS
bU9UonIQa9nOomZkdkXZK7mw0Wz/1ioi4CKkWmNSxYeSzBYli+me/NGhleJIoqJl
G7U4C3iNGHnxNiYgYXa4Rt3osI3kT8g82roAYLZNQ04IB5VQDjzFkJLpByhMdMhf
iLNLG8KADjWYPl/JnNxklQKuUk66V3PWc58Y3jkYEvaFnbub2aUvpQrwEZxOp90l
WPGeBw0+18PkiMy+Gx+QjACXupURoDgAPuBLrS0+yrfooA832zmGY2GwBctNH7p2
+OeowxQfN+LX66c6ezD0
=9EEq
-----END PGP SIGNATURE-----

--=-9zAZD3Be6XtTDln8R7xo--
