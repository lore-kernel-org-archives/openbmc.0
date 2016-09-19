Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3scnlW29kwzDsTW
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 11:06:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=P1NCmMr0; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=OORtZnkj; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 42770203AC;
 Sun, 18 Sep 2016 21:06:29 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Sun, 18 Sep 2016 21:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=feXKe
 pGBJT/XBtwDfW0Rv057pBQ=; b=P1NCmMr00XtOPn7arWIsNiTgLBDSNmM3MbVbB
 cNCJz5mKuEoLz74fXGLKyuXoY6f+M7RJaXL6V0inQZxTOeh1l+mV4iNUi0JjdzFq
 yH7zKQNCAJ0HwK2bqJEbCiVsaPSKqjK950NyyXJ0YIUzFGH6qy9UZdUZFlrvKujD
 2OvEx0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=feXKepGBJT/XBtwDfW0Rv057pBQ=; b=OORtZ
 nkjxH4kwKyMlFqlQZVQtSAYiahRj+GdtjKlBXpn9nrkV7oI9DyTkMBCUNG4uNydV
 JgnoZ1+7g4XKMoLgPmgksjBATyLkWoaN5Lv6gPVO7OdoucIJWapH5hwPtL9QSVdI
 Kl8iBlg1syFBop6n98Pg87OaXNKe0q2jzvBlZc=
X-Sasl-enc: K5zasyU2mhIm0Bi0uNabPjw3b7tUPLt+/Mvduz4ZhcFR 1474247188
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75669F29CC;
 Sun, 18 Sep 2016 21:06:27 -0400 (EDT)
Message-ID: <1474247183.13249.54.camel@aj.id.au>
Subject: Re: [PATCH 07/17] pinctrl-aspeed-g4: Add definition for GPIO pins
 J2 and O2
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, 
 openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Sep 2016 10:36:23 +0930
In-Reply-To: <1474058133-27363-8-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-8-git-send-email-tpearson@raptorengineering.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-U8oJjjQvY1Fxqzy9tFI+"
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
X-List-Received-Date: Mon, 19 Sep 2016 01:06:31 -0000


--=-U8oJjjQvY1Fxqzy9tFI+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-09-16 at 15:35 -0500, Timothy Pearson wrote:
> This is required for Firestone to boot.
>=20
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

As mentioned I will integrate this with my patches to add the rest of
the pins, but regardless:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c |=C2=A0=C2=A0=C2=A015 ++=
+++++++++++--
> =C2=A01 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g4.c
> index e356619..610ab48 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> @@ -499,6 +499,9 @@ MS_PIN_DECL(E7, GPIOH7, ROMD15, RXD6);
> =C2=A0
> =C2=A0FUNC_GROUP_DECL(UART6, A8, C7, B7, A7, D7, B6, A6, E7);
> =C2=A0
> +#define K5 74
> +SSSF_PIN_DECL(K5, GPIOJ2, SGPMO, SIG_DESC_SET(SCU84, 10));
> +
> =C2=A0#define J3 75
> =C2=A0SSSF_PIN_DECL(J3, GPIOJ3, SGPMI, SIG_DESC_SET(SCU84, 11));
> =C2=A0
> @@ -727,10 +730,14 @@ SS_PIN_DECL(V6, GPIOO0, VPIG8);
> =C2=A0SIG_EXPR_LIST_DECL_SINGLE(VPIG9, VPI24, VPI24_DESC, SIG_DESC_SET(SC=
U88, 9));
> =C2=A0SS_PIN_DECL(Y5, GPIOO1, VPIG9);
> =C2=A0
> +#define AA4 114
> +SIG_EXPR_LIST_DECL_SINGLE(VPIR0, VPI30, VPI30_DESC, SIG_DESC_SET(SCU88, =
10));
> +SS_PIN_DECL(AA4, GPIOO2, VPIR0);
> +
> =C2=A0FUNC_GROUP_DECL(VPI18, T5, U3, V1, U4, V2, AA22, W5, Y4, AA3, AB2);
> =C2=A0FUNC_GROUP_DECL(VPI24, T5, U3, V1, U4, V2, AA22, W5, Y4, AA3, AB2, =
V6, Y5);
> -FUNC_GROUP_DECL(VPI30, T5, U3, V1, U4, V2, W1, U5, W4, Y3, AA22, W5, Y4,=
 AA3,
> -		AB2);
> +FUNC_GROUP_DECL(VPI30, T5, U3, V1, U4, V2, W1, U5, W4, Y3, AA4, AA22, W5=
, Y4,
> +		AA3, AB2);
> =C2=A0
> =C2=A0#define Y7 125
> =C2=A0SIG_EXPR_LIST_DECL_SINGLE(GPIOP5, GPIOP5);
> @@ -1154,6 +1161,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEE=
D_G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(J20),
> =C2=A0	ASPEED_PINCTRL_PIN(J21),
> =C2=A0	ASPEED_PINCTRL_PIN(J3),
> +	ASPEED_PINCTRL_PIN(K5),
> =C2=A0	ASPEED_PINCTRL_PIN(K18),
> =C2=A0	ASPEED_PINCTRL_PIN(L22),
> =C2=A0	ASPEED_PINCTRL_PIN(N21),
> @@ -1189,6 +1197,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEE=
D_G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(Y4),
> =C2=A0	ASPEED_PINCTRL_PIN(Y5),
> =C2=A0	ASPEED_PINCTRL_PIN(Y7),
> +	ASPEED_PINCTRL_PIN(AA4),

We just use sort(1) across the members rather than define them in
datasheet order.

Joel: If you apply this patch can you please sort(1) this list?

> =C2=A0};
> =C2=A0
> =C2=A0static const struct aspeed_pin_group aspeed_g4_groups[] =3D {
> @@ -1231,6 +1240,7 @@ static const struct aspeed_pin_group aspeed_g4_grou=
ps[] =3D {
> =C2=A0	ASPEED_PINCTRL_GROUP(FLBUSY),
> =C2=A0	ASPEED_PINCTRL_GROUP(FLWP),
> =C2=A0	ASPEED_PINCTRL_GROUP(UART6),
> +	ASPEED_PINCTRL_GROUP(SGPMO),
> =C2=A0	ASPEED_PINCTRL_GROUP(SGPMI),
> =C2=A0	ASPEED_PINCTRL_GROUP(VGAHS),
> =C2=A0	ASPEED_PINCTRL_GROUP(VGAVS),
> @@ -1341,6 +1351,7 @@ static const struct aspeed_pin_function aspeed_g4_f=
unctions[] =3D {
> =C2=A0	ASPEED_PINCTRL_FUNC(FLBUSY),
> =C2=A0	ASPEED_PINCTRL_FUNC(FLWP),
> =C2=A0	ASPEED_PINCTRL_FUNC(UART6),
> +	ASPEED_PINCTRL_FUNC(SGPMO),
> =C2=A0	ASPEED_PINCTRL_FUNC(SGPMI),
> =C2=A0	ASPEED_PINCTRL_FUNC(VGAHS),
> =C2=A0	ASPEED_PINCTRL_FUNC(VGAVS),

Similarly these should be sort(1):ed as well, but I'm not sure we did
that before applying the patches...
--=-U8oJjjQvY1Fxqzy9tFI+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX3zoPAAoJEJ0dnzgO5LT5w4oP/Rm2dCxlQL3kJ9+QGiM7UYOO
HtfDae+3X20qB62nARyiAOOsAgA6TEHyIL7tkbFSVvuFR/UwhoxIAYLp99iSsA+6
3AerVhkKiE0T6nZiyHGdANaSbxTg2IAW+v5f1JtJmXkKVEFLCWoiOl/znwsDPr2a
lGGGdzFjVQoFNN6PPpq8/HpnwNHSOFquzJ5UUqGDD8lvgo8fmwz16n4Y21y9Ne6k
UqN5yhTs9/MUFX/sBNRPKt1foUxkA8N9CdgnAZigOooNjzExc/M08tqJtfT31J/k
ptzw0dKgGirrmaYFiq9PvwarKWhKPnwONtrzM75RfjjEdm3t8eQ81s+st9VybiM4
90B74smfmnMC4/1l8jRUrpwuRBfx7qflc3JOethUI6Rw3pT4h6zGonnYoRF33GC7
waZYCxuIUqa2iERsLBM1EyngSYaw4ahjL/BifBU86cktsTefU0o+m9oWB8n6s4a0
o59TPtp13SYdJfN5r1pRECBjRMLXOaxmBQKUzUGAZDPFwoURQQPrqDMhCBzBxizR
gfjQj8njs2k+yYQO+opaAvhXFMIzEefuNZLICb9vYGpGDQ8YyubYcmyXDP/xllLR
190CeDm0JigTg6+aY+thtk8N5a3Z8Z4dRuU/yoAqRlH/hPSx98jRLKU+u55XkMfn
eBGcBjbhhFpyrcdCCZ5P
=e7Jg
-----END PGP SIGNATURE-----

--=-U8oJjjQvY1Fxqzy9tFI+--
