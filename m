Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RpTarJ9q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="LRTozVZ9"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQKTN3KSQzDqmt
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 14:19:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0CEF220A82;
 Sun, 29 Oct 2017 23:19:16 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 29 Oct 2017 23:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hT8KYeo5GMhVCCLiAfyyO+G/7/uRmH9+3KNCoXDJo2E=; b=RpTarJ9q
 ke+2MpgWEndTFxruc+DniDWhRKHvjDZWQnDIIkALa89CnbanfZdoltFVd19RD8Jc
 2Ro0Kt3aZRpk+ywdlAyBT9TdhVWC54CcYjDrO25yhkjuyb9+TKcqGFpKX/Hb7uyP
 AD8peIsSAgNRnB53iNkG+0dF9jHY6cYvxxxLgR/oU+4eKWx45DFs4QTjEjb/YfXl
 LvlM44ToDDMqvTWppyH/kSIva/Mf75j8FqssyuQdkeRcKD3Vm+6WNfSwhWkhfE7u
 LM4/S9yvNUXsSpvgRV25ic/TPjLGqodBzyMgP99+sNpv858QPboIe7XvfY4TS5VD
 hSJvS0+feoPlYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=hT8KYeo5GMhVCCLiAfyyO+G/7/uRm
 H9+3KNCoXDJo2E=; b=LRTozVZ9acsiA/aULqDlPT8KWp/bO/fJFCpdZqLuYzFy3
 DIwK8v5cDfh19CWRFm/wiXKuVQbjZlN73Cq3fGLAAGFqTFTh6rlr4P6bl7fESBja
 yu2jlxPkAraEniEDga4FUc8opy0u6z9LZtIJihIOmaufPb1OKz+pmumt8g3fHsoy
 vPGsjwdC4Tmj3SK5EDNXsfL4VLzJJZA7DbWKjLEi90Npw0ICEJr5uUBdJJYqwu8Z
 /V4ax0P0tCJXwlITDNGJPBqshUvKX13BUYnpOm1ytt9CB4QjJGTdaFh5KaCQgcMy
 4iq+SrxqVKiPrR3Lk83jtRa5/DY6AHN3WUnkFh+og==
X-ME-Sender: <xms:M5r2WTeQ5S9_LMV1CqpYj2dOK_xKdX4HPwVwkdUDWU0sIeLx7gZQjQ>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 62F4B2432A;
 Sun, 29 Oct 2017 23:19:14 -0400 (EDT)
Message-ID: <1509333549.13477.17.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Use new occ-hwmon
 driver for P8 systems
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 30 Oct 2017 13:49:09 +1030
In-Reply-To: <1509081962-21694-1-git-send-email-mine260309@gmail.com>
References: <1509081962-21694-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-vltMXRaK5HRHVJU0zDq/"
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
X-List-Received-Date: Mon, 30 Oct 2017 03:19:23 -0000


--=-vltMXRaK5HRHVJU0zDq/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-27 at 13:26 +0800, Lei YU wrote:
> Use the new occ-hwmon driver and compatible name for
> Barreleye and Garrison.
>=C2=A0
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts |=C2=A0=C2=A08 ++++-=
---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts=C2=A0=C2=A0| 10 +++++=
-----
> =C2=A02 files changed, 9 insertions(+), 9 deletions(-)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-barreleye.dts
> index d37d0ea..6e70ca5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -124,13 +124,13 @@
> =C2=A0&i2c3 {
> =C2=A0	status =3D "okay";
> =C2=A0
> -	occ@50 {
> -		compatible =3D "ibm,occ-i2c";
> +	occ-hwmon@50 {

I tend to disagree with the node name. 'occ-hwmon' reflects the hardware *a=
nd*
a Linux subsystem, which is not what a node name should represent. My
alternative would be 'occ-sensors', and maybe we can bikeshed that. However=
,
the patch is consistent with what we have in other devicetrees. We should f=
ix
what we have, but I think that's a job for another day.

> +		compatible =3D "ibm,p8-occ-hwmon";
> =C2=A0		reg =3D <0x50>;
> =C2=A0	};
> =C2=A0
> -	occ@51 {
> -		compatible =3D "ibm,occ-i2c";
> +	occ-hwmon@51 {
> +		compatible =3D "ibm,p8-occ-hwmon";
> =C2=A0		reg =3D <0x51>;
> =C2=A0	};
> =C2=A0};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-garrison.dts
> index 6b96e36..95552c8 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -156,8 +156,8 @@
> =C2=A0&i2c4 {
> =C2=A0	status =3D "okay";
> =C2=A0
> -	occ@50 {
> -		compatible =3D "ibm,occ-i2c";
> +	occ-hwmon@50 {
> +		compatible =3D "ibm,p8-occ-hwmon";
> =C2=A0		reg =3D <0x50>;
> =C2=A0	};
> =C2=A0};
> @@ -165,9 +165,9 @@
> =C2=A0&i2c5 {
> =C2=A0	status =3D "okay";
> =C2=A0
> -	occ@50 {
> -		compatible =3D "ibm,occ-i2c";
> -		reg =3D <0x50>;
> +	occ-hwmon@51 {
> +		compatible =3D "ibm,p8-occ-hwmon";
> +		reg =3D <0x51>;
> =C2=A0	};
> =C2=A0};
> =C2=A0
--=-vltMXRaK5HRHVJU0zDq/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ9potAAoJEJ0dnzgO5LT5epMQAKtDkmhlbQMs2XSm08fHJw9z
wLZ73maVZgQALrqtVhr2PcqTMtxT3ArkAlQbc68IQA+XcAQwJwBrkUUz/amdAdew
KkeCkQgYKul1G7ZYhmGDd//qIDjn9Bp5GtNBl7ymh06fJUNU8uSGSA84sB4E//hz
bVvve/i5YaJ0xHP77yRGO17+XaaQFcpFaZ4iKgZmr8b31Wom75i4+h/BnGrdEmV+
r5baZaCrsmllrq4dstTWC5pbAAyjDnnj4SOX4pRwW5ykCEISuYDWEV1ur9B5CVE2
G84YbEMxRbYOEu4nu1/C2O6xSc/6ruoxo2HKyM74jFhEoFpVWe6atV3ct1FMNd9T
fVCq/oROrJ1OuZOSHoKUOKeOvY4Xs7dJa8o38GUziKySJx9zJWT6OLM8tQChY3AB
BSMtyt/q/XC3XGdZtdSo5LeoSAPrJ6jLpdzojUAOomEs8Wc9/z6SClfrXUVx44IY
cYZXPCJI9c/M+xFJjRqtLDxdUkzqHMZxXbUQ1H4VY7RZhBGzAy0DoEaly5mAeow+
kimLDnO1xs3FT5QboMbC5OOQSLI3Hlhqr+CafHir2WYljNje1sNcmS+apSV0V6GU
LIWb9mgge3LwhRCbr6nMLBHnGtPHhUeelvIr/EVYUlojCUck4uIFW7iMIxewQh0u
xRXHdsWBM/V24CpGXlxI
=dfls
-----END PGP SIGNATURE-----

--=-vltMXRaK5HRHVJU0zDq/--
