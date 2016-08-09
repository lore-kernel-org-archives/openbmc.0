Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s7ZfG2qLNzDqQp
 for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2016 10:19:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=NJWRqNu7; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=WUofyooR; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D42E20419;
 Mon,  8 Aug 2016 20:19:32 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 08 Aug 2016 20:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=5yv9x
 LrwNr5NMsQA3h/251F7cdY=; b=NJWRqNu7wo3d1zhRauJq0mC+daGwD90XjxhpO
 E4EOK72YqBSufO8MxZTg7lC8IZ54q6bjHbA6yK/Dr9Q+Zsr2nWYqOaGqbD8SgNcS
 CM3QVh07Tx+QPaKDX8xUn/7+nAiQITuxtrejX5odLayrW1IJdQK778fkxuFoBwcw
 RmmTvI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=5yv9xLrwNr5NMsQA3h/251F7cdY=; b=WUofy
 ooRrOPqGmtHBxL9JrvLa6P0VVs8RhwM2Jb2vRaVaZePgcYazSczBwsPeRZmkqoIe
 4rfG/W8uN19ejbYjThb+hW1MUnhKKAQtDD1HrwGJ27FHKrLLnsw+eGancvveFPtR
 cF22JNzrlEOsUPW0rhC1Q+SA8AT4S7aNs5q5ok=
X-Sasl-enc: dCnTloKhzqIqisNhVXuP7kU+LQXHVvZvDoHkHbaSnD4/ 1470701971
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9EF9FCCE6E;
 Mon,  8 Aug 2016 20:19:30 -0400 (EDT)
Message-ID: <1470701966.27272.16.camel@aj.id.au>
Subject: Re: [linux dev-4.7] pinctrl/aspeed: Add RGMII2/RMII2 for ast2500
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Date: Tue, 09 Aug 2016 09:49:26 +0930
In-Reply-To: <1470643372-28221-1-git-send-email-joel@jms.id.au>
References: <1470643372-28221-1-git-send-email-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-MdEkxSeMmKZeKo9SAR3o"
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
X-List-Received-Date: Tue, 09 Aug 2016 00:19:34 -0000


--=-MdEkxSeMmKZeKo9SAR3o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-08-08 at 17:32 +0930, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Two small issues, but otherwise:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A010 +++
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 109 ++++++++++++++++++=
+++++++++++
> =C2=A02 files changed, 119 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 2daf0045173a..136c921a532b 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -191,6 +191,16 @@
> =C2=A0						function =3D "RMII1";
> =C2=A0						groups =3D "RMII1";
> =C2=A0					};
> +
> +					pinctrl_rgmii2_default: rgmii2_default {
> +						function =3D "RGMII2";
> +						groups =3D "RGMII2";
> +					};
> +
> +					pinctrl_rmii2_default: rmii2_default {
> +						function =3D "RMII2";
> +						groups =3D "RMII2";

Can you please add RGMII2 and RMII2 to the bindings documentation?

> +					};
> =C2=A0				};
> =C2=A0			};
> =C2=A0
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g5.c
> index b1464ad7f06f..b9dd7be75766 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -395,6 +395,98 @@ MS_PIN_DECL_(C4, SIG_EXPR_LIST_PTR(GPIOV1), SIG_EXPR=
_LIST_PTR(RMII1RXER),
> =C2=A0FUNC_GROUP_DECL(RGMII1, B4, A4, A3, D6, C5, C4, B5, E9, F9, A5, E7,=
 D7);
> =C2=A0FUNC_GROUP_DECL(RMII1, B4, A3, D6, C5, C4, B5, E9, F9, A5);
> =C2=A0
> +/* RGMII2/RMII2 */
> +
> +#define RMII2_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC_BIT(HW_ST=
RAP1, 7, 0)
> +
> +#define B2 158
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOT6, GPIOT6, SIG_DESC_SET(SCUA0, 6));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2RCLKO, RMII2, RMII2_DESC,
> +		SIG_DESC_SET(SCU48, 30));
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXCK, RGMII2);
> +MS_PIN_DECL_(B2, SIG_EXPR_LIST_PTR(GPIOT6), SIG_EXPR_LIST_PTR(RMII2RCLKO=
),
> +		SIG_EXPR_LIST_PTR(RGMII2TXCK));
> +
> +#define B1 159
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOT7, GPIOT7, SIG_DESC_SET(SCUA0, 7));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2TXEN, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXCTL, RGMII2);
> +MS_PIN_DECL_(B1, SIG_EXPR_LIST_PTR(GPIOT7), SIG_EXPR_LIST_PTR(RMII2TXEN)=
,
> +		SIG_EXPR_LIST_PTR(RGMII2TXCTL));
> +
> +#define A2 160
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOU0, GPIOU0, SIG_DESC_SET(SCUA0, 8));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2TXD0, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXD0, RGMII2);
> +MS_PIN_DECL_(A2, SIG_EXPR_LIST_PTR(GPIOU0), SIG_EXPR_LIST_PTR(RMII2TXD0)=
,
> +		SIG_EXPR_LIST_PTR(RGMII2TXD0));
> +
> +#define B3 161
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOU1, GPIOU1, SIG_DESC_SET(SCUA0, 9));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2TXD1, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXD1, RGMII2);
> +MS_PIN_DECL_(B3, SIG_EXPR_LIST_PTR(GPIOU1), SIG_EXPR_LIST_PTR(RMII2TXD1)=
,
> +		SIG_EXPR_LIST_PTR(RGMII2TXD1));
> +
> +#define D5 162
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOU2, GPIOU2, SIG_DESC_SET(SCUA0, 10));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2DASH0, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXD2, RGMII2);
> +MS_PIN_DECL_(D5, SIG_EXPR_LIST_PTR(GPIOU2), SIG_EXPR_LIST_PTR(RMII2DASH0=
),
> +		SIG_EXPR_LIST_PTR(RGMII2TXD2));
> +
> +#define D4 163
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOU3, GPIOU3, SIG_DESC_SET(SCUA0, 11));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2DASH1, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2TXD3, RGMII2);
> +MS_PIN_DECL_(D4, SIG_EXPR_LIST_PTR(GPIOU3), SIG_EXPR_LIST_PTR(RMII2DASH1=
),
> +		SIG_EXPR_LIST_PTR(RGMII2TXD3));
> +
> +#define C2 170
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOV2, GPIOV2, SIG_DESC_SET(SCUA0, 18));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2RCLKI, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXCK, RGMII2);
> +MS_PIN_DECL_(C2, SIG_EXPR_LIST_PTR(GPIOV2), SIG_EXPR_LIST_PTR(RMII2RCLKI=
),
> +		SIG_EXPR_LIST_PTR(RGMII2RXCK));
> +
> +#define C1 171
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOV3, GPIOV3, SIG_DESC_SET(SCUA0, 19));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2DASH2, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXCTL, RGMII2);
> +MS_PIN_DECL_(C1, SIG_EXPR_LIST_PTR(GPIOV3), SIG_EXPR_LIST_PTR(RMII2DASH2=
),
> +		SIG_EXPR_LIST_PTR(RGMII2RXCTL));
> +
> +#define C3 172
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOV4, GPIOV4, SIG_DESC_SET(SCUA0, 20));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2RXD0, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXD0, RGMII2);
> +MS_PIN_DECL_(C3, SIG_EXPR_LIST_PTR(GPIOV4), SIG_EXPR_LIST_PTR(RMII2RXD0)=
,
> +		SIG_EXPR_LIST_PTR(RGMII2RXD0));
> +
> +#define D1 173
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOV5, GPIOV5, SIG_DESC_SET(SCUA0, 21));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2RXD1, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXD1, RGMII2);
> +MS_PIN_DECL_(D1, SIG_EXPR_LIST_PTR(GPIOV5), SIG_EXPR_LIST_PTR(RMII2RXD1)=
,
> +		SIG_EXPR_LIST_PTR(RGMII2RXD1));
> +
> +#define D2 174
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOV6, GPIOV6, SIG_DESC_SET(SCUA0, 22));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2CRSDV, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXD2, RGMII2);
> +MS_PIN_DECL_(D2, SIG_EXPR_LIST_PTR(GPIOV6), SIG_EXPR_LIST_PTR(RMII2CRSDV=
),
> +		SIG_EXPR_LIST_PTR(RGMII2RXD2));
> +
> +#define E6 175
> +SIG_EXPR_LIST_DECL_SINGLE(GPIOV7, GPIOV7, SIG_DESC_SET(SCUA0, 23));
> +SIG_EXPR_LIST_DECL_SINGLE(RMII2RXER, RMII2, RMII2_DESC);
> +SIG_EXPR_LIST_DECL_SINGLE(RGMII2RXD3, RGMII2);
> +MS_PIN_DECL_(E6, SIG_EXPR_LIST_PTR(GPIOV7), SIG_EXPR_LIST_PTR(RMII2RXER)=
,
> +		SIG_EXPR_LIST_PTR(RGMII2RXD3));
> +
> +FUNC_GROUP_DECL(RGMII2, B2, B1, A2, B3, D5, D4, C2, C1, C3, D1, D2, E6);
> +FUNC_GROUP_DECL(RMII2, B2, B1, A2, B3, C2, C3, D1, D2, E6);
> +
> =C2=A0static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_G5_NR_PINS] =
=3D {
> =C2=A0	ASPEED_PINCTRL_PIN(C14),
> =C2=A0	ASPEED_PINCTRL_PIN(A13),
> @@ -434,12 +526,23 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEE=
D_G5_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(N22),
> =C2=A0	ASPEED_PINCTRL_PIN(D10),
> =C2=A0	ASPEED_PINCTRL_PIN(E12),
> +	ASPEED_PINCTRL_PIN(A2),
> +	ASPEED_PINCTRL_PIN(B3),
> +	ASPEED_PINCTRL_PIN(D5),
> +	ASPEED_PINCTRL_PIN(D4),
> +	ASPEED_PINCTRL_PIN(A2),
> =C2=A0	ASPEED_PINCTRL_PIN(B4),
> =C2=A0	ASPEED_PINCTRL_PIN(A4),
> =C2=A0	ASPEED_PINCTRL_PIN(A3),
> =C2=A0	ASPEED_PINCTRL_PIN(D6),
> =C2=A0	ASPEED_PINCTRL_PIN(C5),
> =C2=A0	ASPEED_PINCTRL_PIN(C4),
> +	ASPEED_PINCTRL_PIN(C2),
> +	ASPEED_PINCTRL_PIN(C1),
> +	ASPEED_PINCTRL_PIN(C3),
> +	ASPEED_PINCTRL_PIN(D1),
> +	ASPEED_PINCTRL_PIN(D2),
> +	ASPEED_PINCTRL_PIN(E6),
> =C2=A0	ASPEED_PINCTRL_PIN(D8),
> =C2=A0	ASPEED_PINCTRL_PIN(E10),
> =C2=A0	ASPEED_PINCTRL_PIN(B5),
> @@ -448,6 +551,8 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_=
G5_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(A5),
> =C2=A0	ASPEED_PINCTRL_PIN(E7),
> =C2=A0	ASPEED_PINCTRL_PIN(D7),
> +	ASPEED_PINCTRL_PIN(B2),
> +	ASPEED_PINCTRL_PIN(B1),

B2 and B1 should go above A2.

> =C2=A0};
> =C2=A0
> =C2=A0static const struct aspeed_pin_group aspeed_g5_groups[] =3D {
> @@ -477,6 +582,8 @@ static const struct aspeed_pin_group aspeed_g5_groups=
[] =3D {
> =C2=A0	ASPEED_PINCTRL_GROUP(MDIO1),
> =C2=A0	ASPEED_PINCTRL_GROUP(RMII1),
> =C2=A0	ASPEED_PINCTRL_GROUP(RGMII1),
> +	ASPEED_PINCTRL_GROUP(RMII2),
> +	ASPEED_PINCTRL_GROUP(RGMII2),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct aspeed_pin_function aspeed_g5_functions[] =3D {
> @@ -506,6 +613,8 @@ static const struct aspeed_pin_function aspeed_g5_fun=
ctions[] =3D {
> =C2=A0	ASPEED_PINCTRL_FUNC(MDIO1),
> =C2=A0	ASPEED_PINCTRL_FUNC(RMII1),
> =C2=A0	ASPEED_PINCTRL_FUNC(RGMII1),
> +	ASPEED_PINCTRL_FUNC(RMII2),
> +	ASPEED_PINCTRL_FUNC(RGMII2),
> =C2=A0};
> =C2=A0
> =C2=A0static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data =3D {
--=-MdEkxSeMmKZeKo9SAR3o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXqSGPAAoJEJ0dnzgO5LT5ePAQAJQGjD57rCZJN99uG7oKZr6l
+yTmnvq0IF7s//XelySsdlGCrGOSsmFSN45gPYtmihDzV2T0/hYFR8aj24JAN5+M
6xJXBqvE0nNGH0rdSSPXno3h+0UNMsd/hNz5sASz67v4z85JYNSEwT+FNGx2ivuU
HegFZsbjxqAghsFl6IaIyxkhtJQxmAGhUDyy/3i9/UfFkNVVBQOxKBSv1jZmEJUM
553zyFbLSb59+uE8pI6uzFjrFpP0tveM9hrYLqxKyO7ojldcwO4IXrBqFS/5a1Gb
TKIaj2M8HJMTEnGs+CQR5wRxcBY3g9ZK/jgU2DlX6yDM7f72A2smSUfj0IlNthK1
44CkNkS5EKK4paLFX3fXlJwb7P0iKCjf5tstxAQF5bGhoEDolDNR7QuCsOeJuQ5p
5hSs9RBYV6KW0Q4SR2/b+ruLpqBfNRbEcHn1MJTaFNWyOyPx2fj+H/W8PWmS9C9W
MLvHVd7ppoRi5fYEweJG9LRmFPNHvMQ/Nzo7w9t/+wjx3OFX5ZmalTfXJR0qx+hG
nLnS3zOBAOlMEfY+77MM/Tmp37gfkX5fAM1TAo75Offq2hWH3ulmTje7CUncQvfY
d6c2wF7SpH8hOaXhh6paq3nRxvA+ybSmtHIvar1xcHIGO3iczWKRIF6QiJJ3lpoh
+UPXp6JJNoT53+Pr3OIh
=+Izc
-----END PGP SIGNATURE-----

--=-MdEkxSeMmKZeKo9SAR3o--
