Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sNWnf16bbzDrh4
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 11:55:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=kxCJAgAC; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=F3NaPoK1; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id F2D7820369;
 Mon, 29 Aug 2016 21:55:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 29 Aug 2016 21:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=rtoU2
 szVjRUKuP/Gr0Hh3hmJjiI=; b=kxCJAgACjIKKW2JKpMdyX7g0WKzPV0HP9dGiD
 1Q6TgJoEikepV+6vQBz4Au13vxKkk77DbdH06AyrFqJYFsu3VC53rHN+5fKPmybN
 uP7nOtD0K/Fb28CQqTEAm3wzxyLXtAzc1qKOKSbeZzXSU2Gi5CGvRLWQqHWZk5Zb
 H+zkVo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=rtoU2szVjRUKuP/Gr0Hh3hmJjiI=; b=F3NaP
 oK1gm84fkkh7VLNGoZFJXuJLINYqArPb0MJ8VDm04yV5pf0ZkLadhCBryAdRr2Ux
 xGG8WxEOo3+VyxpP3AL4z9hSu1OxjTo/aeCa3bz4EEdntwe6tyOqFYcr63Tz8rvp
 VWFtfoIxeXB2aMPIAyg6dIDPN2DIZD25YQ8Unk=
X-Sasl-enc: ZpuusNVrU0an7w3R0S2rL01kTSvgvTqvFkt46NHp7hbW 1472522147
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 725F3CCDCC;
 Mon, 29 Aug 2016 21:55:46 -0400 (EDT)
Message-ID: <1472522143.5707.102.camel@aj.id.au>
Subject: Re: [PATCH] arm/dts/aspeed: Alias vuart as ttyS5
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Tue, 30 Aug 2016 11:25:43 +0930
In-Reply-To: <20160830014318.26711-1-joel@jms.id.au>
References: <20160830014318.26711-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ifcMwBImD8/nuNJwP5Lc"
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
X-List-Received-Date: Tue, 30 Aug 2016 01:55:50 -0000


--=-ifcMwBImD8/nuNJwP5Lc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-08-30 at 11:13 +0930, Joel Stanley wrote:
> OpenBMC userspace expects the vuart to be at /dev/ttyS5. The userspace
> will soon use udev to correctly identify the vuart, however for now we
> will un-break existing images by adding the alias.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

NAK, as userspace no-longer expects the vuart to be at ttyS5:

https://gerrit.openbmc-project.xyz/#/c/293/

Andrew

> ---
>=20
> Boot tested in qemu as the witherspoon platform. The alias appears to wor=
k:
>=20
> =C2=A01e787000.vuart: ttyS5 at MMIO 0x1e787000 (irq =3D 19, base_baud =3D=
 1500000) is a 16550A
>=20
> Needs verification on a real system.
>=20
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts=C2=A0=C2=A0=C2=A0| 1=
 +
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts=C2=A0=C2=A0=C2=A0| 1=
 +
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts=C2=A0=C2=A0=C2=A0=C2=
=A0| 1 +
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts=C2=A0=C2=A0=C2=A0=C2=
=A0| 1 +
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 1 +
> =C2=A05 files changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-barreleye.dts
> index 6ca618bd331d..af1ad2810f84 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -9,6 +9,7 @@
> =C2=A0
> =C2=A0	aliases {
> =C2=A0		serial4 =3D &uart5;
> +		serial5 =3D &vuart;
> =C2=A0	};
> =C2=A0
> =C2=A0	chosen {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-firestone.dts
> index 2ec9e4450515..321ab1127843 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -8,6 +8,7 @@
> =C2=A0
> =C2=A0	aliases {
> =C2=A0		serial4 =3D &uart5;
> +		serial5 =3D &vuart;
> =C2=A0	};
> =C2=A0
> =C2=A0	chosen {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-garrison.dts
> index a4471fb3b36b..5a1abf550961 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -9,6 +9,7 @@
> =C2=A0
> =C2=A0	aliases {
> =C2=A0		serial4 =3D &uart5;
> +		serial5 =3D &vuart;
> =C2=A0	};
> =C2=A0
> =C2=A0	chosen {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index 21619fd8cd8d..f705847625e7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -9,6 +9,7 @@
> =C2=A0
> =C2=A0	aliases {
> =C2=A0		serial4 =3D &uart5;
> +		serial5 =3D &vuart;
> =C2=A0	};
> =C2=A0
> =C2=A0	chosen {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index fcc880a80ee0..ab205596c6ff 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -9,6 +9,7 @@
> =C2=A0
> =C2=A0	aliases {
> =C2=A0		serial4 =3D &uart5;
> +		serial5 =3D &vuart;
> =C2=A0	};
> =C2=A0
> =C2=A0	chosen {
--=-ifcMwBImD8/nuNJwP5Lc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXxOefAAoJEJ0dnzgO5LT5R2EP/01Fm/ik2T86ssVj9QiLwvNR
Zvv8ECFO9KVV4G3GKvtkqLwCgBQdMsWYyEdR2EeSiDRUeHwiI5azOv1F9kFCWdN6
Z3zSPkx5JzCcNyfiwwnpbeJjp8unEkBxMKmHAvRDhpEnZKO0nIGt+qRSbVyBrjgt
VixzikmkwRul/SSry8ebK42kfxndsra/AiYJuTAKGoJEWh3E06f9yTPlQZ93Pm7O
N8oJ6WFYMiP3ZKsJcgUf3z+BP3d/BnNnCifxcmvgPuu83ZsBoZbgzXPT9gKdseqm
Wvc2wrp8OEyZ8Nyc1HSBd0GgtIs+tAnu6jHJabQQa/BaoEOXncgaznkJz1HbMApR
rfe6p2KSPRvyVQPSwCU/NKBTgvD9uQ6LDwFBEl8Moi5NTtwcdd5g5GafmyoHv0Vz
vLV/tfBQPxOXJG51Bb5w5DXco+7jqLgqyEftLyVLLLrVYjuygQf/6E05pLmp8qDA
e/yLU1NYz8FjvxxgEzY15min46N+zFWm7BVLNMoxTz+pAODcF/tqWPSaddvl3kUW
1gk+OYXLmqtwZbonTAXbOS23fm5OKgbTYR2SovqA9Fk+8adv8+l5bnDO2ai9eoO8
WkQhVk3oVzHA4S8uA1q/KAk4LZ8dDc1ZQIpZCPa+Jh96NV5mw5BifgmQO9RsGUqI
Hcexdltp+UkBEpqwtXOf
=s0js
-----END PGP SIGNATURE-----

--=-ifcMwBImD8/nuNJwP5Lc--
