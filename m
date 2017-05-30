Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wcGs40ql8zDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 11:55:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lrKOWk3r"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DWIBJ/t7"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7AF1B207F8;
 Mon, 29 May 2017 21:55:17 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 29 May 2017 21:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=28WpU4NLAsXN4MMLcDJHsN7IailirbFBUX5yu5Nqd
 C8=; b=lrKOWk3rfBWRtnXMDxx7nMpU+NuTrHuDMlGF0jfEHMRXsnuaQrXJ57bIT
 EF3EuOG3CsEbDLSPygQKweowU8ni/P2LzeiCQ+++4D6YBh0U9g4uiAnIJzMLBrxf
 gUyVh17XV+pUTKRWz5EkGRD14LTC1C4XMat8716tKXeto/YalZGIpDDCGri3r/9J
 +18FIRqd8BmDJXl7/r6ywEENCQeAxltVh2jv3p77gG8jOULrXMNLOWikL5I6IJFU
 2BgTewjpMZLXw2mINltjVzOCyURR2EqVW3kyrvfTn3VcpREhgQA5hSsS1uxVpYdT
 EsTYKmuCslq7gkXBKRk5nmtsjziTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=28WpU4NLAsXN4MMLcD
 JHsN7IailirbFBUX5yu5NqdC8=; b=DWIBJ/t7hqU6JGVP60pJfOAxyAyOWmR2fA
 UnzeaaWMbowZmkMh0PAQeoJlHISWPTMyoUDDzdY0Q8ovvoZtOh4OmWN5whmboF62
 jHIyccFkSkqSzuEaOKd+Z3Jk3GU7geW+S+qegLWrRx5EmDPJbOUy6NLU0CGfGlku
 2cWsVZI09qKLntmOFS4zQJ+ajRYLukzxvwHdudFNSUVmPTGtFiDUyzt9iDJRN403
 GY6DndpUQzn4/09l+ry2WYp/a747J/jEjDi4/F8hOC/sQdiZiiaEJQd3D5OXi0Lx
 dTdFlmMYf5iV8zXW/LQZnTSoLgVWzfHiLmHiVdQofKUh6tQNF6bw==
X-ME-Sender: <xms:BdEsWYiuNl_q71fo6JRoitJQARfeqOqPO_c5_n2aY2-GLt6P13UYbg>
X-Sasl-enc: ZarY1Oa+A0K3r/fwpRnDamaC20dlA+7c2ZWvUHa5w/EP 1496109316
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB13E241E0;
 Mon, 29 May 2017 21:55:15 -0400 (EDT)
Message-ID: <1496109312.8159.3.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: aspeed: Add Mellanox MSN machine
 (defconfig)
From: Andrew Jeffery <andrew@aj.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Date: Tue, 30 May 2017 11:25:12 +0930
In-Reply-To: <20170529091615.54310-1-c_mykolak@mellanox.com>
References: <20170529091615.54310-1-c_mykolak@mellanox.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-azBGlTbOcb4X40EIaxbq"
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
X-List-Received-Date: Tue, 30 May 2017 01:55:20 -0000


--=-azBGlTbOcb4X40EIaxbq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-05-29 at 12:16 +0300, Mykola Kostenok wrote:
> Initial introduction of Mellanox switches of MSNXXXX family equipped
> with Aspeed 2520 BMC SoC. This adds defconfig changes.
>=20
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> v1->v2
> Fixed issues pointed out by Joel:
> - Make commit title shorter.
> - Replace flash layout from separate dtsi to dts.
> - Change compatible =3D "mellanox,msnxxxx-bmc" to "mellanox,msn-bmc".
> - Remove no-hw-checksum from dts.
> - Add comments.
> - Remove WD2 disable from aspeed.c
> - Add wdt2 to dts.
>=20
> v2->v3
> - Split v2 patch into three separate.
> ---
> =C2=A0arch/arm/configs/aspeed_g5_defconfig | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/configs/aspeed_g5_defconfig
> b/arch/arm/configs/aspeed_g5_defconfig
> index 25332b07d887..3fc3eb0e8867 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -141,6 +141,7 @@ CONFIG_SENSORS_ADM1275=3Dy
> =C2=A0CONFIG_SENSORS_IR35221=3Dy
> =C2=A0CONFIG_SENSORS_LM25066=3Dy
> =C2=A0CONFIG_SENSORS_UCD9000=3Dy
> +CONFIG_SENSORS_UCD9200=3Dy
> =C2=A0CONFIG_SENSORS_TMP421=3Dy
> =C2=A0CONFIG_USB=3Dy
> =C2=A0CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> @@ -165,6 +166,7 @@ CONFIG_MAILBOX=3Dy
> =C2=A0CONFIG_ASPEED_LPC_MBOX=3Dy
> =C2=A0# CONFIG_IOMMU_SUPPORT is not set
> =C2=A0CONFIG_IIO=3Dy
> +CONFIG_MAX1363=3Dy
> =C2=A0CONFIG_ASPEED_ADC=3Dy
> =C2=A0CONFIG_BMP280=3Dy
> =C2=A0CONFIG_FSI=3Dy
--=-azBGlTbOcb4X40EIaxbq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZLNEAAAoJEJ0dnzgO5LT5xcgP/jtcdn1xztp4FwZhp2ooItWC
Vhvf03nCxd5UBRA/CyVOdYEgUlWEDdGC0d7vQcEbQgyTbfb0kPRlFIK24zItA67/
LC87UoFXKCkBYeNy2GoIZgm9KKSpes/SoBBzEfOzJOLpJZ0mqvdsLzgfuGpPEQHW
EGQJKp/ZVWQwRqjiavk7Kzd3nzuCSt6kqBUZ8HG+WFkOO3+ZdUHZAyTXd3oH5vjy
/SDbG1jM0M6ZijrcOLo5GB4xep18yxKAaxbFCL5riyqCdo03rvdRKkBFsp1qxlND
mK1qncEnPtjcuKpVXM5djqlUfq/wusGVLRX4kaGCGlbBbXrDUfhaXwCTsz6Qqex8
Ynp5NhnhFU5A+o774ZB72EdzlWUfq66aPn9tBBBfg6aZFgpbqhFFWbRg/ikBi3eu
Zf0KplJsFCTOiU2VksxCLjR2grP+1u4S9jNbGfRKmsGJ3vY7HJOCDPTgxzXnEFGg
E9YOV6ND0wEN/jYdVpHvNCpAUnyjjv3BG9YvFDc6MpENc93s+yz7xYvVFsu+5/v3
qD0djELrSv85BG8IMp3w/25Ryj1PGVqHSODFQWExMx3bSXBrEK8bFX04S6v81F1d
MUABsq5We3XVuVSqgA6RqLkEpEv4YoJU4SWAUEO5pQcSeWu6sTIOBTIiMANDK6+D
bnqjnY+FPUzwuAQuKziy
=Xpu0
-----END PGP SIGNATURE-----

--=-azBGlTbOcb4X40EIaxbq--
