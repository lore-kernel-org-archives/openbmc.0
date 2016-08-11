Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8rLx3ds5zDqgN
 for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2016 11:40:41 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id CF22C20581;
 Wed, 10 Aug 2016 21:40:38 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Wed, 10 Aug 2016 21:40:38 -0400
X-Sasl-enc: 6GeCYyrXxKbpPYMeaJdtyusYxOqB4TTLQE8wqZQ696Ml 1470879637
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id CDF6CCCD84;
 Wed, 10 Aug 2016 21:40:36 -0400 (EDT)
Message-ID: <1470879628.27272.41.camel@aj.id.au>
Subject: Re: [PATCH 1/2] pinctrl/aspeed: Add GPIOR to g4 pinmux
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Date: Thu, 11 Aug 2016 11:10:28 +0930
In-Reply-To: <1470820879-18661-1-git-send-email-joel@jms.id.au>
References: <1470820879-18661-1-git-send-email-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-j4bksuBkJoTEFOlm4lge"
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
X-List-Received-Date: Thu, 11 Aug 2016 01:40:42 -0000


--=-j4bksuBkJoTEFOlm4lge
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-08-10 at 18:51 +0930, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 81 +++++++++++++++++++=
+++++++++--
> =C2=A01 file changed, 78 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g4.c
> index d36e14892d4e..96952bf33b9f 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> @@ -585,6 +585,71 @@ SIG_EXPR_LIST_DECL(ROMCS1, SIG_EXPR_PTR(ROMCS1, ROM8=
),
> =C2=A0		SIG_EXPR_PTR(ROMCS1, ROM16S));
> =C2=A0MS_PIN_DECL_(V20, SIG_EXPR_LIST_PTR(ROMCS1), SIG_EXPR_LIST_PTR(GPIO=
R0));
> =C2=A0
> +#define W21 137
> +#define W21_DESC	SIG_DESC_SET(SCU88, 25)
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOR1, GPIOR1);
> +SIG_EXPR_DECL(ROMCS2, ROM8, W21_DESC);
> +SIG_EXPR_DECL(ROMCS2, ROM16, W21_DESC);
> +SIG_EXPR_DECL(ROMCS2, ROM16S, W21_DESC);
> +SIG_EXPR_LIST_DECL(ROMCS2, SIG_EXPR_PTR(ROMCS2, ROM8),
> +		SIG_EXPR_PTR(ROMCS2, ROM16),
> +		SIG_EXPR_PTR(ROMCS2, ROM16S));
> +MS_PIN_DECL_(W21, SIG_EXPR_LIST_PTR(ROMCS2), SIG_EXPR_LIST_PTR(GPIOR1));

I'm thinking we should separate out muxing of the chip selects from
enabling the optional ROM signals. We need to hash that out before I
resend the patches upstream.

> +
> +#define Y22 138
> +#define Y22_DESC	SIG_DESC_SET(SCU88, 26)
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOR2, GPIOR2);
> +SIG_EXPR_DECL(ROMCS3, ROM8, Y22_DESC);
> +SIG_EXPR_DECL(ROMCS3, ROM16, Y22_DESC);
> +SIG_EXPR_DECL(ROMCS3, ROM16S, Y22_DESC);
> +SIG_EXPR_LIST_DECL(ROMCS3, SIG_EXPR_PTR(ROMCS3, ROM8),
> +		SIG_EXPR_PTR(ROMCS3, ROM16),
> +		SIG_EXPR_PTR(ROMCS3, ROM16S));
> +MS_PIN_DECL_(Y22, SIG_EXPR_LIST_PTR(ROMCS3), SIG_EXPR_LIST_PTR(GPIOR2));
> +
> +#define U19 139
> +#define U19_DESC	SIG_DESC_SET(SCU88, 27)
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOR3, GPIOR3);
> +SIG_EXPR_DECL(ROMCS4, ROM8, U19_DESC);
> +SIG_EXPR_DECL(ROMCS4, ROM16, U19_DESC);
> +SIG_EXPR_DECL(ROMCS4, ROM16S, U19_DESC);
> +SIG_EXPR_LIST_DECL(ROMCS4, SIG_EXPR_PTR(ROMCS4, ROM8),
> +		SIG_EXPR_PTR(ROMCS4, ROM16),
> +		SIG_EXPR_PTR(ROMCS4, ROM16S));
> +MS_PIN_DECL_(U19, SIG_EXPR_LIST_PTR(ROMCS4), SIG_EXPR_LIST_PTR(GPIOR3));
> +
> +#define V21 140
> +#define V21_DESC	SIG_DESC_SET(SCU88, 28)
> +SIG_EXPR_DECL(ROMA24, ROM8, V21_DESC);
> +SIG_EXPR_DECL(ROMA24, ROM16, V21_DESC);
> +SIG_EXPR_DECL(ROMA24, ROM16S, V21_DESC);

Ah, bug here, the DECLs above should be:

SIG_EXPR_DECL(ROMA24, ROM8, V21_DESC, VPO_OFF_12);
SIG_EXPR_DECL(ROMA24, ROM16, V21_DESC, VPO_OFF_12);
SIG_EXPR_DECL(ROMA24, ROM16S, V21_DESC, VPO_OFF_12);

> +SIG_EXPR_LIST_DECL(ROMA24, SIG_EXPR_PTR(ROMA24, ROM8),
> +		SIG_EXPR_PTR(ROMA24, ROM16),
> +		SIG_EXPR_PTR(ROMA24, ROM16S));
> +SIG_EXPR_LIST_DECL_SINGLE(VPOR6, VPO24, V21_DESC, VPO_24_OFF);
> +MS_PIN_DECL(V21, GPIOR4, ROMA24, VPOR6);
> +
> +#define W22 141
> +#define W22_DESC	SIG_DESC_SET(SCU88, 29)
> +SIG_EXPR_DECL(ROMA25, ROM8, W22_DESC);
> +SIG_EXPR_DECL(ROMA25, ROM16, W22_DESC);
> +SIG_EXPR_DECL(ROMA25, ROM16S, W22_DESC);

Similarly, these DECLs should be:

SIG_EXPR_DECL(ROMA25, ROM8, W22_DESC, VPO_OFF_12);
SIG_EXPR_DECL(ROMA25, ROM16, W22_DESC, VPO_OFF_12);
SIG_EXPR_DECL(ROMA25, ROM16S, W22_DESC, VPO_OFF_12);

Cheers,

Andrew

> +SIG_EXPR_LIST_DECL(ROMA25, SIG_EXPR_PTR(ROMA25, ROM8),
> +		SIG_EXPR_PTR(ROMA25, ROM16),
> +		SIG_EXPR_PTR(ROMA25, ROM16S));
> +SIG_EXPR_LIST_DECL_SINGLE(VPOR7, VPO24, W22_DESC, VPO_24_OFF);
> +MS_PIN_DECL(W22, GPIOR5, ROMA25, VPOR7);
> +
> +#define C6 142
> +SIG_EXPR_LIST_DECL_SINGLE(MDC1, MDIO1, SIG_DESC_SET(SCU88, 30));
> +SS_PIN_DECL(C6, GPIOR6, MDC1);
> +
> +#define A5 143
> +SIG_EXPR_LIST_DECL_SINGLE(MDIO1, MDIO1, SIG_DESC_SET(SCU88, 31));
> +SS_PIN_DECL(A5, GPIOR7, MDIO1);
> +
> +FUNC_GROUP_DECL(MDIO1, C6, A5);
> +
> =C2=A0#define U21 144
> =C2=A0#define U21_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG=
_DESC_SET(SCU8C, 0)
> =C2=A0SIG_EXPR_DECL(ROMD4, ROM8, U21_DESC, VPOOFF0_DESC);
> @@ -681,11 +746,12 @@ SIG_EXPR_LIST_DECL(ROMA23, SIG_EXPR_PTR(ROMA23, ROM=
8),
> =C2=A0SIG_EXPR_LIST_DECL_SINGLE(VPOR5, VPO24, K18_DESC, VPO_24_OFF);
> =C2=A0MS_PIN_DECL(K18, GPIOS7, ROMA23, VPOR5);
> =C2=A0
> -FUNC_GROUP_DECL(ROM8, V20, U21, T19, V22, U20, R18, N21, L22, K18);
> +FUNC_GROUP_DECL(ROM8, V20, U21, T19, V22, U20, R18, N21, L22, K18, W21, =
Y22,
> +		U19);
> =C2=A0FUNC_GROUP_DECL(ROM16, V20, U21, T19, V22, U20, R18, N21, L22, K18,
> -		A8, C7, B7, A7, D7, B6, A6, E7);
> +		A8, C7, B7, A7, D7, B6, A6, E7, W21, Y22, U19);
> =C2=A0FUNC_GROUP_DECL(VPO12, U21, T19, V22, U20);
> -FUNC_GROUP_DECL(VPO24, U21, T19, V22, U20, L22, K18);
> +FUNC_GROUP_DECL(VPO24, U21, T19, V22, U20, L22, K18, V21, W22);
> =C2=A0
> =C2=A0#define RMII1_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC_BIT(=
HW_STRAP1, 6, 0)
> =C2=A0
> @@ -792,6 +858,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_=
G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(A2),
> =C2=A0	ASPEED_PINCTRL_PIN(A3),
> =C2=A0	ASPEED_PINCTRL_PIN(A4),
> +	ASPEED_PINCTRL_PIN(A5),
> =C2=A0	ASPEED_PINCTRL_PIN(A6),
> =C2=A0	ASPEED_PINCTRL_PIN(A7),
> =C2=A0	ASPEED_PINCTRL_PIN(A8),
> @@ -820,6 +887,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_=
G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(C3),
> =C2=A0	ASPEED_PINCTRL_PIN(C4),
> =C2=A0	ASPEED_PINCTRL_PIN(C5),
> +	ASPEED_PINCTRL_PIN(C6),
> =C2=A0	ASPEED_PINCTRL_PIN(C7),
> =C2=A0	ASPEED_PINCTRL_PIN(D1),
> =C2=A0	ASPEED_PINCTRL_PIN(D11),
> @@ -861,6 +929,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_=
G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(T5),
> =C2=A0	ASPEED_PINCTRL_PIN(U1),
> =C2=A0	ASPEED_PINCTRL_PIN(U18),
> +	ASPEED_PINCTRL_PIN(U19),
> =C2=A0	ASPEED_PINCTRL_PIN(U2),
> =C2=A0	ASPEED_PINCTRL_PIN(U20),
> =C2=A0	ASPEED_PINCTRL_PIN(U21),
> @@ -870,11 +939,15 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEE=
D_G4_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(V1),
> =C2=A0	ASPEED_PINCTRL_PIN(V2),
> =C2=A0	ASPEED_PINCTRL_PIN(V20),
> +	ASPEED_PINCTRL_PIN(V21),
> =C2=A0	ASPEED_PINCTRL_PIN(V22),
> =C2=A0	ASPEED_PINCTRL_PIN(V6),
> =C2=A0	ASPEED_PINCTRL_PIN(W1),
> +	ASPEED_PINCTRL_PIN(W21),
> +	ASPEED_PINCTRL_PIN(W22),
> =C2=A0	ASPEED_PINCTRL_PIN(W4),
> =C2=A0	ASPEED_PINCTRL_PIN(W5),
> +	ASPEED_PINCTRL_PIN(Y22),
> =C2=A0	ASPEED_PINCTRL_PIN(Y3),
> =C2=A0	ASPEED_PINCTRL_PIN(Y4),
> =C2=A0	ASPEED_PINCTRL_PIN(Y5),
> @@ -952,6 +1025,7 @@ static const struct aspeed_pin_group aspeed_g4_group=
s[] =3D {
> =C2=A0	ASPEED_PINCTRL_GROUP(VPO24),
> =C2=A0	ASPEED_PINCTRL_GROUP(RGMII1),
> =C2=A0	ASPEED_PINCTRL_GROUP(RMII1),
> +	ASPEED_PINCTRL_GROUP(MDIO1),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct aspeed_pin_function aspeed_g4_functions[] =3D {
> @@ -1022,6 +1096,7 @@ static const struct aspeed_pin_function aspeed_g4_f=
unctions[] =3D {
> =C2=A0	ASPEED_PINCTRL_FUNC(VPO24),
> =C2=A0	ASPEED_PINCTRL_FUNC(RGMII1),
> =C2=A0	ASPEED_PINCTRL_FUNC(RMII1),
> +	ASPEED_PINCTRL_FUNC(MDIO1),
> =C2=A0};
> =C2=A0
> =C2=A0static struct aspeed_pinctrl_data aspeed_g4_pinctrl_data =3D {
--=-j4bksuBkJoTEFOlm4lge
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXq9eMAAoJEJ0dnzgO5LT5sdoP/1rrNU0kuTZbvkmmkxNEytSw
Spt2CNLUicBCLskVLS/pOFvsj62t+lcNx+SUggI0h38J3+uxGRgW/WDGyd/SirSg
IItdIw2sEowUqkS4xUt+JcTUOuXVIPAGHQuX337uvTmjJcQkmz9/C8e9tzR/Ai4c
KkGo7u/XzyYcswwFdKWAqPXB3YqvT/kNT0nTRNTrKuul2qplReFjSUg4ukZAiIw6
nS0D0/2a87iV08/ZI2YOuq+XOV4BqJanMHq7MhrKxpGD/B0EJAszLDrhYk8OMXkv
ArbYCDmsusm9i8161Od10wFmVyeeJQ6Uda6NLqEOsygtWni6dz8f8epXjVwhd0Yr
ER8vuXmXx/uDDorLDW3gFDuRAjUWWzDV8YZe1YDfb579CcZWiK42i7Y8wC3dqFEf
QEQacvjrVQBTIKEWr4tN1on/MV5f3OTM+RyfDAcxv4jCbWMGtJ6SblAQ7ygPuy5p
AaQs8e6Gr12OhQsU4uJGPEz+p6aHElj8SOzKk918MmkTKuX0+Q3drCXJesTJALeh
tTImVhzE53BK3pW+Xt6I4z9srXMQLXESWhRSEZ1O4U22p/8Jw5gZED3UEH/x81BR
IZqtgFudth5j5eN8JF2VWVevxUbcoz8tRXiBy9h7mX7npS4DCptif4rqUiqzMFGX
zrcn/Nv2l9rIys9uzvRh
=g00J
-----END PGP SIGNATURE-----

--=-j4bksuBkJoTEFOlm4lge--
