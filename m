Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td4fS56BXzDvjw
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 14:18:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jnzV+1st"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="tvUM3v9b"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 506FA20881;
 Mon, 12 Dec 2016 22:18:22 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 12 Dec 2016 22:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=VRHyUqye31+GrIOIA0seSwO5YRQ=; b=jnzV+1
 st/hO164UEz/c9edh/mBfmjZkMR50I4xHhwpiD0bzn1Qpg9yZLiD8WUMuaNVGcA2
 GuCaXqM5tAA+52sAWo3N9SIf8lFShw1e9uaZP/EBDsiF4d0r++Rzsd61kZ29uX+A
 qBksvGRoLylZ6ydOvvNLvxu70f280rfmSyoOU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=VRHyUqye31+GrI
 OIA0seSwO5YRQ=; b=tvUM3v9bjy5fFZmg+pSYAAgpBaZBSXAEP3863KWPii/569
 eeDqFfnuvF6/hTycxMEUr++5/rQQ3OUIZoVsCmzwWXHkJI5DbiM6Ome4zbjIJbVc
 0pA7OBRRsH3ZMTjI8CVQc51Zk01k5IakR8c6SXRhVDvB6io3CmQLFkcuA92ig=
X-ME-Sender: <xms:fmhPWNw8zr8LdYpS427Gvh6sR_lhqfDYaS-tsbLl7cWabHXGeCbdnw>
X-Sasl-enc: XS0hLi+UFCddAZLF1NlnxAyUPYWRemKMQe0ZWgmTGA2i 1481599101
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21B3C2478B;
 Mon, 12 Dec 2016 22:18:19 -0500 (EST)
Message-ID: <1481599096.3112.24.camel@aj.id.au>
Subject: Re: [RFC PATCH linux v6 7/9] arm: aspeed: dts: Fix OCC compatible
 strings
From: Andrew Jeffery <andrew@aj.id.au>
To: eajames.ibm@gmail.com, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Date: Tue, 13 Dec 2016 13:48:16 +1030
In-Reply-To: <1480460658-28945-1-git-send-email-eajames.ibm@gmail.com>
References: <1480460658-28945-1-git-send-email-eajames.ibm@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-l511bM5NbNjsQNR3G4m6"
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
X-List-Received-Date: Tue, 13 Dec 2016 03:18:25 -0000


--=-l511bM5NbNjsQNR3G4m6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-11-29 at 17:04 -0600, eajames.ibm@gmail.com wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=20
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 4 ++--
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 4 ++--
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts=C2=A0=C2=A0| 4 ++--
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts=C2=A0=C2=A0| 2 +-
> =C2=A04 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-barreleye.dts
> index bedff97..42f734e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -110,12 +110,12 @@
> > =C2=A0	status =3D "okay";
> =C2=A0
> > =C2=A0	occ@50 {
> > -		compatible =3D "ibm,occ-i2c";
> +		compatible =3D "ibm,occ-p8-i2c";

We will need to give this some thought with respect to the naming
consistency mentioned in previous patches.

Also, this patch should be re-worked so it's relevant for upstream
which doesn't have the existing OCC driver.

Other than that I think this is fine.

Andrew

> =C2=A0		reg =3D <0x50>;
> > =C2=A0	};
> =C2=A0
> > =C2=A0	occ@51 {
> > -		compatible =3D "ibm,occ-i2c";
> > +		compatible =3D "ibm,occ-p8-i2c";
> > =C2=A0		reg =3D <0x51>;
> > =C2=A0	};
> =C2=A0};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-firestone.dts
> index bbe09fc..df12e6b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -122,7 +122,7 @@
> =C2=A0
> > =C2=A0	// turismo
> > =C2=A0	occ@50 {
> > -		compatible =3D "ibm,occ-i2c";
> > +		compatible =3D "ibm,occ-p8-i2c";
> > =C2=A0		reg =3D <0x50>;
> > =C2=A0	};
> =C2=A0
> @@ -137,7 +137,7 @@
> =C2=A0
> > =C2=A0	// turismo
> > =C2=A0	occ@50 {
> > -		compatible =3D "ibm,occ-i2c";
> > +		compatible =3D "ibm,occ-p8-i2c";
> > =C2=A0		reg =3D <0x50>;
> > =C2=A0	};
> =C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-garrison.dts
> index 7737c09..38d51bf 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -63,7 +63,7 @@
> > =C2=A0	status =3D "okay";
> =C2=A0
> > =C2=A0	occ@50 {
> > -		compatible =3D "ibm,occ-i2c";
> > +		compatible =3D "ibm,occ-p8-i2c";
> > =C2=A0		reg =3D <0x50>;
> > =C2=A0	};
> =C2=A0};
> @@ -72,7 +72,7 @@
> > =C2=A0	status =3D "okay";
> =C2=A0
> > =C2=A0	occ@50 {
> > -		compatible =3D "ibm,occ-i2c";
> > +		compatible =3D "ibm,occ-p8-i2c";
> > =C2=A0		reg =3D <0x50>;
> > =C2=A0	};
> =C2=A0};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index e17158f..8d9aaa3 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -120,7 +120,7 @@
> > =C2=A0	status =3D "okay";
> =C2=A0
> > =C2=A0	occ@50 {
> > -		compatible =3D "ibm,occ-i2c";
> > +		compatible =3D "ibm,occ-p8-i2c";
> > =C2=A0		reg =3D <0x50>;
> > =C2=A0	};
> =C2=A0};
--=-l511bM5NbNjsQNR3G4m6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYT2h4AAoJEJ0dnzgO5LT5TAUQALDr4WRSSC3WJqRbXVP8cMt2
pPBegf1PZbPwRybPKIi9wpp/+Js0s2UpS+UfU1z4TL3FI0YkjBEvMS0vkNdZao3X
DfkWl32xNI+iSiyAgvGdf79WMlYWpzsnv0mItMat1bgFb5z5dVr3ROLj93eZ1r3s
tqjsQlFB/j8plgj/a6S2UFtIFjZO1FjFwgyP8YBH1wrK09DTK37GUVkJEB4/D01p
SKkOtoHL/5YHir4cX/Dr6/4ikAW7l0voFGkYE2bE5bgBHvg9KHn1VKC/44YyDpJE
5phebrJXkjWxgB2SR/Bcy/97hDUXujR8zYpZdJhunWmmxreheT69bVUYkKtLGOpX
ndwH+XizmLYlR8B/HrVk9KPDQTvpTcYuLlJtx0LFKHQx8weAjh5yetJAu5S/RwiT
6sF32LX686It70PhwOcQhmcWPYmdd6bVW0QzHSzQ7z/jd5kCuN39xk7e7ER2UpKx
2fzsWXdslnBeiLTNK4N8d5wR9Cizf2OLdUycmiIEMkgxlG92hCAyoGDdUw1l/HIL
aWkocO3V9YHFFxNjqMl+LAY6buIbfsViZirxJ1HmK4Jpc2wVZnWdif0EKBsqEan2
95dLOGI+KBhtrz9mxYK9iRR3B1YsmiU43lRQ+AC5d/SeqZgfWqcpNOcPA2ZyuZOY
781/PwlbFdBt1pqeQgmf
=a6BQ
-----END PGP SIGNATURE-----

--=-l511bM5NbNjsQNR3G4m6--
