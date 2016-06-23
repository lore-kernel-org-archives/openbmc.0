Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZpWS72ZrzDqhc
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 14:33:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=kBdMZWV1; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=IMKPD609; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7823B1A6;
 Thu, 23 Jun 2016 00:33:54 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute5.internal (MEProxy); Thu, 23 Jun 2016 00:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=/7exo
 PFXzuYJ9OmxolDyUe5eZs8=; b=kBdMZWV1tx9Cm9fzBTJgJalGMY/WU2wfpobVN
 S5JSP/eD42h3+9QblQz/ZStknUvAQi+1x8SjVQLwOHGDbMkE5k6JNqTdE/FKtdh+
 xWHDslyN0CRPjb0JdPNfbopZhJMI+pCSMFBQDoAdbPpiiadIEcrc1INCgStltu98
 LgfXm0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=/7exoPFXzuYJ9OmxolDyUe5eZs8=; b=IMKPD
 609SfrBRRsvcjkvROhGz3TsDucwMJJzQklWn7ahgtc7sZwuioBA5T+dkyVTZZ1V0
 IZPolnXnXGYdPt7ZzilDunGLIjTS9vWp+jeDG+ttwSt05binemrJZ8qvs6Nhuv5o
 y4SiiFCoyTUnaTrT5kU9Y6MaiaaHP/iwx7hcQI=
X-Sasl-enc: ZV9Y5c7oj/KYtiGUZ9pnuEPU1yjoo1rOCefw6B7f3ab4 1466656433
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id ECDB8CCD34;
 Thu, 23 Jun 2016 00:33:51 -0400 (EDT)
Message-ID: <1466656427.23740.41.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 05/18] initfs: Fix recipe, remove unnecessary
 class
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 14:03:47 +0930
In-Reply-To: <20160623003038.2361-6-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-6-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-A4L552CDZG6HqkowOsYl"
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
X-List-Received-Date: Thu, 23 Jun 2016 04:33:57 -0000


--=-A4L552CDZG6HqkowOsYl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>=20
> Because the recipe was named with trailing part init instead
> of initfs, the package didn't match the package name requiring
> PROVIDES, RPROVIDES and other bitbake workarounds.=C2=A0=C2=A0Fix the rec=
ipe
> name to match the package removing the overly verbose packaging.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0meta-phosphor/classes/obmc-phosphor-initfs.bbclass=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 4 ----
> =C2=A0.../{obmc-phosphor-init.bb =3D> obmc-phosphor-initfs.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 1 -
> =C2=A02 files changed, 5 deletions(-)
> =C2=A0delete mode 100644 meta-phosphor/classes/obmc-phosphor-initfs.bbcla=
ss
> =C2=A0rename meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/{=
obmc-phosphor-init.bb =3D> obmc-phosphor-initfs.bb} (96%)
>=20
> diff --git a/meta-phosphor/classes/obmc-phosphor-initfs.bbclass b/meta-ph=
osphor/classes/obmc-phosphor-initfs.bbclass
> deleted file mode 100644
> index de7923e..0000000
> --- a/meta-phosphor/classes/obmc-phosphor-initfs.bbclass
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Common code for recipes that implement Phosphor OpenBMC filesystem
> -
> -RPROVIDES_${PN} +=3D "obmc-phosphor-initfs"
> -PROVIDES +=3D "obmc-phosphor-initfs"
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/o=
bmc-phosphor-init.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-=
initfs/obmc-phosphor-initfs.bb
> similarity index 96%
> rename from meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/ob=
mc-phosphor-init.bb
> rename to meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc=
-phosphor-initfs.bb
> index 3fa88c9..f81e21d 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-pho=
sphor-init.bb
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-pho=
sphor-initfs.bb
> @@ -3,7 +3,6 @@ DESCRIPTION =3D "Phosphor OpenBMC filesytem mount referen=
ce implementation."
> =C2=A0PR =3D "r1"
> =C2=A0
> =C2=A0inherit obmc-phosphor-license
> -inherit obmc-phosphor-initfs
> =C2=A0
> =C2=A0S =3D "${WORKDIR}"
> =C2=A0SRC_URI +=3D "file://obmc-init.sh"

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
--=-A4L552CDZG6HqkowOsYl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa2asAAoJEJ0dnzgO5LT5bF0QAJroFOn33mSm+R8CQNUG+Pw0
oAa+EW5nbpYa1MZotyx4GXhI++dY0O9SV5tx3X+1NmtOoAAhbTulp/+jlma5Qwch
aDmskF86P/IceJOSU/sA2W0jLTPyF5OXmB+be8Pt5RdRRdsWObjRPTDZma7dTGTT
5RvLWbyum/toRVZbJUagj4e+ONZwRnO73kdfcaOu7nZSv7PbwpMyzqZ/uvxRHupN
jodzihiJA9vfU5mux1urCqg7PqDETVdr63Tzheds2DAW9gKLtEmw99M6VLnaaGbr
2D35bMd+BckW5C9jRdETTYtfnBAonRGZjGnkkvo2P2PsQrtdxOEC1HxiBi3IqJq1
Cn0zB9Qqvh/KRKp14F+hCKwXKtH/9+L4cUjQ6VoOoLDQqjPJQCsDJ40K4vRAmBAR
e0on7OJGZ2IBv+dzdgeDFhU3RMZL/6K6j+Bd0/MTmfd8WMy69EJohZFD2Hcuh90e
iqlrvRbcFN6J27RsyCgDmfVe6H0O7gAfRF9cmarmWDegdTq9N2tLtQlny2i9xMjh
xZCm1MNQQIUHai+unjyQW+fWUgtVgPdqnjYfUB3Foge5Pz4jXFlXMTF8BwSNex1U
DUEFBq5ZBudbbPRgxoZiE11XxSnV8N6Q5CCRdcZC7heIWCTWVRwkEFX1DxZZx2fj
HrLmGrGJXBAgJoraq8ct
=lqo4
-----END PGP SIGNATURE-----

--=-A4L552CDZG6HqkowOsYl--
