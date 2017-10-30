Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ui969zp+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YabXIjkn"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQKsG2f71zDqmt
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 14:36:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C91B2209A5;
 Sun, 29 Oct 2017 23:36:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 29 Oct 2017 23:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=O8ZjQ5oITOAiZRw0Gy7zi7UV2aWn+ilOuXRwxThwte8=; b=Ui969zp+
 OvE76J3oySRlkdObuvZlUi7CZkNpN9Xfatq5GlPk822IojLASPlbUQhIDuwJGyqT
 zTcaYBvCDqMIQv18doHo3fcUamGWrV2X/YcHwnZ+rGVMQJ7rICHahbFPT58eVRZQ
 xbZXqRpIlPI4U4BQXSnptLXSAkwsDJ95R8eNI9YFEfxWPUXTOsiJniRVmaaAADd+
 NcEXSd6X/6MV0P9Ck8fB5D1mpxq7MxjqjpCCJ54KyzPRw3YU6f7ZHFXzy5FcT2et
 01HUTj0RoGS1gSsoGZDoH3c2CM1uSay+jeM+t8pK48Cfy3B2PTUIsMXY9OBfiKVa
 5WDSBseJccHkgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=O8ZjQ5oITOAiZRw0Gy7zi7UV2aWn+
 ilOuXRwxThwte8=; b=YabXIjknx88ncTaa7QMFkSsU0zloTAuoXtSTP85EK2BX3
 u9V/a2CNaqFKxPgUqqEeJU6s0ZrucAzH92hGFP3B5rRwKKZLdhmapcItgAoJDfVK
 S29D7oHTewmjELJPsX3BnVv6ZuqCMG1xs8UjpHjipQ/n0y+PFTve7ZFCszSgh8T7
 6hbYZLll2BKJSJ+mM/nRTqSAGjHAIWnVXkX+7OobHsSEkyVwxFSaRfp0n6RNBgCB
 c8H/IfwtRcJ1WN2BEwOCm9FFzI/Wp/Y7TXGHP3yZ3LnZ6js2oXeZHavf2vcnXRF/
 mgXSjNJLRF16uqiIIPkXCnnjZhBiR3dyDgELKDINw==
X-ME-Sender: <xms:PZ72WRsmaG6bRm5ChYaqBiEWRckqeB1srA9sQcOOS3aG8beFSamwtg>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 721E324009;
 Sun, 29 Oct 2017 23:36:28 -0400 (EDT)
Message-ID: <1509334585.13477.18.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Use new occ-hwmon
 driver for P8 systems
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Mon, 30 Oct 2017 14:06:25 +1030
In-Reply-To: <1509081962-21694-1-git-send-email-mine260309@gmail.com>
References: <1509081962-21694-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-YndQkHxGGiA8/aed9qzi"
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
X-List-Received-Date: Mon, 30 Oct 2017 03:36:35 -0000


--=-YndQkHxGGiA8/aed9qzi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-10-27 at 13:26 +0800, Lei YU wrote:
> Use the new occ-hwmon driver and compatible name for
> Barreleye and Garrison.
>=20
> Signed-off-by: Lei YU <mine260309@gmail.com>

Thanks, applied to dev-4.10.

Andrew

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts |=C2=A0=C2=A08 ++++-=
---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts=C2=A0=C2=A0| 10 +++++=
-----
> =C2=A02 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
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
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
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
--=-YndQkHxGGiA8/aed9qzi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ9p45AAoJEJ0dnzgO5LT5KWwP/3tuBDCyPRMYcqB/NcNKuPQG
oGryBMwy0lkkntELWCrcL9sczZQz4MpGW4/EMXDGdzGfmbByaC/wN4uFXa0MmxNv
C5SMPAMne9g8SOksYz4rGIC9PoRYNWYf5+NyCDqUi/CkhtMTewKVcN7WboIsGot1
OOOka2Kx7hvkNQEUMqkwbsf7QZhUs70Vmxj7Tfi/sg3lOQC3uhrUyy75CGgoNzIm
G84gGLyWz/7a3EJ4ETjlDrwumAJrEUemdKuBBeoS4AJ1ga2tuc7OG+paxc5VEzRg
w3fbaC+smD8k1yWyotr8617gV+AeAEo3mMUm/gTNQunjQWevudtnRScRsh+znr2Q
tTWCHdm4AODHAvDGCzSq5pvxpwKhzEZxl0Lof6mcgEsVgEtfU9W76tEdUYfcqMe5
93BTjvH2zk9MNrtDCyQ1WdmZGIkXcSh0g3qhGp4zj2Nzl1P3EB9cPjn35J/KyQ2u
iJC13behfYxcZdoJ0GiWt80IWD20m//RYBGflS+ON20xiplRFNbn+ghu5ytUJ5XQ
fCo49W62R7S6QzMBy1oxO98n2uxmsThV6W1UwiOc9b3r3ELQ8QNGMvu2yVzJcW28
kvtmmN3cYwwY8+bEx4aLJ4sRW+xTEUpmn7Dx03DsiHnAQTHsJGE30PRawDq+59Qk
F/l6/gENPAUwIjWrh3BE
=aKLz
-----END PGP SIGNATURE-----

--=-YndQkHxGGiA8/aed9qzi--
