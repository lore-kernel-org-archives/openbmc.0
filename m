Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8rYG60W6zDqgN
 for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2016 11:49:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=cT/yoaXk; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=JDIo78lP; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B4AF2046D;
 Wed, 10 Aug 2016 21:49:36 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Wed, 10 Aug 2016 21:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=E5hYG
 Gv8jHH+jLemnf3SeDmrGoA=; b=cT/yoaXkTARBcB+c9DbIxj+6kp81HtgK5W2kh
 L0TTgQqvRqRziaV5DUTg5DRDqQzsn15Dbj+jKTovxp11fpyLJfz2KhLy7F6dhCMw
 372DzwiLUOw72xWVQSPe0GcmI3PbjEYP8FR7dtWIY55lvR/yOPp4fA+weDwO5cir
 B0Rqw8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=E5hYGGv8jHH+jLemnf3SeDmrGoA=; b=JDIo7
 8lPVnHTcnRDaM3ixEWIav14+p1HoRXeiP9BnR2Od/gelo8tBeExUDSu9pQ9TNzoP
 gWjP25aMYCH7obh6VzcLw+/RjAL98B/nqvYPaKuytuqqeEQhxOOZ9KnIYVmfzpZ6
 V/NG1ooH8Np0FC1zx9sWudr+zrpXr0ssm3nkrc=
X-Sasl-enc: ODdVV80T5/9USHnFBWiZJrnj2zVIFg+6VM/oeTHEd4NY 1470880175
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id EE9AACCE66;
 Wed, 10 Aug 2016 21:49:34 -0400 (EDT)
Message-ID: <1470880170.27272.42.camel@aj.id.au>
Subject: Re: [PATCH 2/2] pinctrl/aspeed: Add GPIOE to g4 pinmux
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Date: Thu, 11 Aug 2016 11:19:30 +0930
In-Reply-To: <1470820879-18661-2-git-send-email-joel@jms.id.au>
References: <1470820879-18661-1-git-send-email-joel@jms.id.au>
 <1470820879-18661-2-git-send-email-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ygzy1Dy05Bwvzcj/y+/X"
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
X-List-Received-Date: Thu, 11 Aug 2016 01:49:39 -0000


--=-ygzy1Dy05Bwvzcj/y+/X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-08-10 at 18:51 +0930, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 84 +++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 84 insertions(+)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g4.c
> index 96952bf33b9f..c7aa8519188a 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> @@ -172,6 +172,9 @@ FUNC_GROUP_DECL(GPID0, A18, D16);
> =C2=A0
> =C2=A0#define GPIE_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC=
_SET(HW_STRAP1, 22)
> =C2=A0#define GPIE0_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC_SET(=
SCU8C, 12)
> +#define GPIE2_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC_SET(SCU8C=
, 13)
> +#define GPIE4_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC_SET(SCU8C=
, 14)
> +#define GPIE6_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC_SET(SCU8C=
, 15)
> =C2=A0
> =C2=A0#define D15 32
> =C2=A0SIG_EXPR_LIST_DECL_SINGLE(NCTS3, NCTS3, SIG_DESC_SET(SCU80, 16));
> @@ -192,6 +195,63 @@ MS_PIN_DECL(C15, GPIOE1, NDCD3, GPIE0OUT);
> =C2=A0FUNC_GROUP_DECL(NDCD3, C15);
> =C2=A0FUNC_GROUP_DECL(GPIE0, D15, C15);
> =C2=A0
> +#define B15 34
> +SIG_EXPR_LIST_DECL_SINGLE(NDSR3, NDSR3, SIG_DESC_SET(SCU80, 18));
> +SIG_EXPR_DECL(GPIE2IN, GPIE2, GPIE2_DESC);
> +SIG_EXPR_DECL(GPIE2IN, GPIE, GPIE_DESC);
> +SIG_EXPR_LIST_DECL_DUAL(GPIE2IN, GPIE2, GPIE);
> +MS_PIN_DECL(B15, GPIOE2, NDSR3, GPIE2IN);
> +
> +FUNC_GROUP_DECL(NDSR3, B15);
> +
> +#define A15 35
> +SIG_EXPR_LIST_DECL_SINGLE(NRI3, NRI3, SIG_DESC_SET(SCU80, 19));
> +SIG_EXPR_DECL(GPIE2OUT, GPIE2, GPIE2_DESC);
> +SIG_EXPR_DECL(GPIE2OUT, GPIE, GPIE_DESC);
> +SIG_EXPR_LIST_DECL_DUAL(GPIE2OUT, GPIE2, GPIE);
> +MS_PIN_DECL(A15, GPIOE3, NRI3, GPIE2OUT);
> +
> +FUNC_GROUP_DECL(NRI3, A15);
> +FUNC_GROUP_DECL(GPIE2, B15, A15);
> +
> +#define E14 36
> +SIG_EXPR_LIST_DECL_SINGLE(NDTR3, NDTR3, SIG_DESC_SET(SCU80, 20));
> +SIG_EXPR_DECL(GPIE4IN, GPIE4, GPIE4_DESC);
> +SIG_EXPR_DECL(GPIE4IN, GPIE, GPIE_DESC);
> +SIG_EXPR_LIST_DECL_DUAL(GPIE4IN, GPIE4, GPIE);
> +MS_PIN_DECL(E14, GPIOE4, NDTR3, GPIE4IN);
> +
> +FUNC_GROUP_DECL(NDTR3, E14);
> +
> +#define D14 37
> +SIG_EXPR_LIST_DECL_SINGLE(NRTS3, NRTS3, SIG_DESC_SET(SCU80, 21));
> +SIG_EXPR_DECL(GPIE4OUT, GPIE4, GPIE4_DESC);
> +SIG_EXPR_DECL(GPIE4OUT, GPIE, GPIE_DESC);
> +SIG_EXPR_LIST_DECL_DUAL(GPIE4OUT, GPIE4, GPIE);
> +MS_PIN_DECL(D14, GPIOE5, NRTS3, GPIE4OUT);
> +
> +FUNC_GROUP_DECL(NRTS3, D14);
> +FUNC_GROUP_DECL(GPIE4, E14, D14);
> +
> +#define C14 38
> +SIG_EXPR_LIST_DECL_SINGLE(TXD3, TXD3, SIG_DESC_SET(SCU80, 22));
> +SIG_EXPR_DECL(GPIE6IN, GPIE6, GPIE6_DESC);
> +SIG_EXPR_DECL(GPIE6IN, GPIE, GPIE_DESC);
> +SIG_EXPR_LIST_DECL_DUAL(GPIE6IN, GPIE6, GPIE);
> +MS_PIN_DECL(C14, GPIOE6, TXD3, GPIE6IN);
> +
> +FUNC_GROUP_DECL(TXD3, C14);
> +
> +#define B14 39
> +SIG_EXPR_LIST_DECL_SINGLE(RXD3, RXD3, SIG_DESC_SET(SCU80, 23));
> +SIG_EXPR_DECL(GPIE6OUT, GPIE6, GPIE6_DESC);
> +SIG_EXPR_DECL(GPIE6OUT, GPIE, GPIE_DESC);
> +SIG_EXPR_LIST_DECL_DUAL(GPIE6OUT, GPIE6, GPIE);
> +MS_PIN_DECL(B14, GPIOE7, RXD3, GPIE6OUT);
> +
> +FUNC_GROUP_DECL(RXD3, B14);
> +FUNC_GROUP_DECL(GPIE6, C14, B14);
> +
> =C2=A0#define D18 40
> =C2=A0SSSF_PIN_DECL(D18, GPIOF0, NCTS4, SIG_DESC_SET(SCU80, 24));
> =C2=A0
> @@ -854,6 +914,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_=
G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(A11),
> =C2=A0	ASPEED_PINCTRL_PIN(A12),
> =C2=A0	ASPEED_PINCTRL_PIN(A13),
> +	ASPEED_PINCTRL_PIN(A15),
> =C2=A0	ASPEED_PINCTRL_PIN(A18),
> =C2=A0	ASPEED_PINCTRL_PIN(A2),
> =C2=A0	ASPEED_PINCTRL_PIN(A3),
> @@ -872,6 +933,8 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_=
G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(B1),
> =C2=A0	ASPEED_PINCTRL_PIN(B11),
> =C2=A0	ASPEED_PINCTRL_PIN(B12),
> +	ASPEED_PINCTRL_PIN(B14),
> +	ASPEED_PINCTRL_PIN(B15),
> =C2=A0	ASPEED_PINCTRL_PIN(B19),
> =C2=A0	ASPEED_PINCTRL_PIN(B2),
> =C2=A0	ASPEED_PINCTRL_PIN(B3),
> @@ -881,6 +944,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_=
G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(C1),
> =C2=A0	ASPEED_PINCTRL_PIN(C11),
> =C2=A0	ASPEED_PINCTRL_PIN(C12),
> +	ASPEED_PINCTRL_PIN(C14),
> =C2=A0	ASPEED_PINCTRL_PIN(C15),
> =C2=A0	ASPEED_PINCTRL_PIN(C17),
> =C2=A0	ASPEED_PINCTRL_PIN(C2),
> @@ -892,6 +956,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_=
G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(D1),
> =C2=A0	ASPEED_PINCTRL_PIN(D11),
> =C2=A0	ASPEED_PINCTRL_PIN(D12),
> +	ASPEED_PINCTRL_PIN(D14),
> =C2=A0	ASPEED_PINCTRL_PIN(D15),
> =C2=A0	ASPEED_PINCTRL_PIN(D16),
> =C2=A0	ASPEED_PINCTRL_PIN(D17),
> @@ -904,6 +969,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_=
G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(E10),
> =C2=A0	ASPEED_PINCTRL_PIN(E11),
> =C2=A0	ASPEED_PINCTRL_PIN(E12),
> +	ASPEED_PINCTRL_PIN(E14),
> =C2=A0	ASPEED_PINCTRL_PIN(E16),
> =C2=A0	ASPEED_PINCTRL_PIN(E2),
> =C2=A0	ASPEED_PINCTRL_PIN(E3),
> @@ -974,6 +1040,15 @@ static const struct aspeed_pin_group aspeed_g4_grou=
ps[] =3D {
> =C2=A0	ASPEED_PINCTRL_GROUP(NCTS3),
> =C2=A0	ASPEED_PINCTRL_GROUP(NDCD3),
> =C2=A0	ASPEED_PINCTRL_GROUP(GPIE0),
> +	ASPEED_PINCTRL_GROUP(NDSR3),
> +	ASPEED_PINCTRL_GROUP(NRI3),
> +	ASPEED_PINCTRL_GROUP(GPIE2),
> +	ASPEED_PINCTRL_GROUP(NDTR3),
> +	ASPEED_PINCTRL_GROUP(NRTS3),
> +	ASPEED_PINCTRL_GROUP(GPIE4),
> +	ASPEED_PINCTRL_GROUP(TXD3),
> +	ASPEED_PINCTRL_GROUP(RXD3),
> +	ASPEED_PINCTRL_GROUP(GPIE6),
> =C2=A0	ASPEED_PINCTRL_GROUP(NCTS4),
> =C2=A0	ASPEED_PINCTRL_GROUP(ACPI),
> =C2=A0	ASPEED_PINCTRL_GROUP(NDCD4),
> @@ -1047,6 +1122,15 @@ static const struct aspeed_pin_function aspeed_g4_=
functions[] =3D {
> =C2=A0	ASPEED_PINCTRL_FUNC(NCTS3),
> =C2=A0	ASPEED_PINCTRL_FUNC(NDCD3),
> =C2=A0	ASPEED_PINCTRL_FUNC(GPIE0),
> +	ASPEED_PINCTRL_FUNC(NDSR3),
> +	ASPEED_PINCTRL_FUNC(NRI3),
> +	ASPEED_PINCTRL_FUNC(GPIE2),
> +	ASPEED_PINCTRL_FUNC(NDTR3),
> +	ASPEED_PINCTRL_FUNC(NRTS3),
> +	ASPEED_PINCTRL_FUNC(GPIE4),
> +	ASPEED_PINCTRL_FUNC(TXD3),
> +	ASPEED_PINCTRL_FUNC(RXD3),
> +	ASPEED_PINCTRL_FUNC(GPIE6),
> =C2=A0	ASPEED_PINCTRL_FUNC(NCTS4),
> =C2=A0	ASPEED_PINCTRL_FUNC(ACPI),
> =C2=A0	ASPEED_PINCTRL_FUNC(NDCD4),
--=-ygzy1Dy05Bwvzcj/y+/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXq9mqAAoJEJ0dnzgO5LT5m1MP/3IS5Tw9grUJCb7P2whxLwyx
oz3G6Iy7UxJFhFyOkFSGT1hhzJXxVQXasaATyMJS+3SJNy/wUAkdd45guCnD32Ky
Guqlw+YdZwrJU72ffMA6w4GqHvp3Ksy1czTLcI0vaBK0Fk2Ftk5sLlmucf+SwySW
HEP8DWfQSMor0oFAUGzlQHPPTDBM1n6b4VdX2kKrhvpQX7bfgG/b5pUnWT8D4oHo
QUWrBLOoxC/MgfDsWLXuzGTLmy7U3GwRYWUYxMSnD2SU9H/pq6KubifjDN5vxfS6
ym2NCeIKbWt0uFNIRDWaCkeTM8VwmxpgLaYx3DUNfQWIRqZjBub023bEVH5/eO6G
n/5XHeM7UP11Jj6cquhCwzcC5NxESql0VRCSTTABH0hQFMftrNz69+Uv1hnAlOpA
HABOL278jrI2DtaEvG+Q9mRaU5TMEjcMgc2Fz0ygDs1IKwrMp3c6H1AFznX42T9j
kf2cqfQo7Axj3UGWd9hsZxOydQ7eNkxuyitkywSRV5pJ/l+qfJQxOqLNlExFSAb5
iprHlthNBjXbrO/NfUluMsIx90hUvufiDsGI+4d08WN/NuQJMlTMBBGVPOIRjS59
BBIckUI7XdK1aYhVBSBqKbKVZJM9S+lJtZ7e7yzU0A+66tb0fGj2GhZjVV2JWYm6
Z7h4LkCSYSKuerMsnpLb
=0zia
-----END PGP SIGNATURE-----

--=-ygzy1Dy05Bwvzcj/y+/X--
