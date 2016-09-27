Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjk7v1kJNzDrSf
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 11:41:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=ZzWrjYvg; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=shEzOPpD; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5ED33207DB;
 Mon, 26 Sep 2016 21:41:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Mon, 26 Sep 2016 21:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=YIJUh
 0Jhl7po2Gk7Cu9znVEYk7c=; b=ZzWrjYvgSqLzGCf8MntmtRxPfHh2/o/9b42Mw
 0qASqpnLEF32HV3EqvNZulrvn6rRlL0TaAtUw4g/ogH2Qrx1Iq3SUWnVNVtEOSXo
 xEQlgcgHEJt9OkV0sXUaQuAcklziaTtui28TXN7tPFT2h5lX3I0DIw3xQFLLD0/i
 vxjzW4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=YIJUh0Jhl7po2Gk7Cu9znVEYk7c=; b=shEzO
 PpD8bmXnC5Vwu/6Xo+TYbvDDngtsF1q8OifKmRXG0lykVYYnutR5gHHAQmMi994r
 vv9GgK5pzaERMMIuRcO+F1zG867WJ9U0sqNcRzyJdguW1H6G8+k24Zn1myA3dLgt
 cHsjWKSIGmbO6Ko1f9b+Xt4pO4zj2IVZwgUITk=
X-Sasl-enc: VOKL2O8N9e/9aBM+VJuJeJ/oP0N2ZVAyT+Ivd+7bAhn8 1474940471
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 12434F29CD;
 Mon, 26 Sep 2016 21:41:10 -0400 (EDT)
Message-ID: <1474940464.24463.2.camel@aj.id.au>
Subject: Re: [PATCH v2] pinctrl: aspeed: Fix names for balls at GPIOD2,3
From: Andrew Jeffery <andrew@aj.id.au>
To: Xo Wang <xow@google.com>, openbmc@lists.ozlabs.org
Date: Tue, 27 Sep 2016 11:11:04 +0930
In-Reply-To: <1474940002-73911-1-git-send-email-xow@google.com>
References: <1474940002-73911-1-git-send-email-xow@google.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-c/Yx/Xy7P//Ml6DiU4Qb"
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
X-List-Received-Date: Tue, 27 Sep 2016 01:41:16 -0000


--=-c/Yx/Xy7P//Ml6DiU4Qb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xo,

On Mon, 2016-09-26 at 18:33 -0700, Xo Wang wrote:
> Update ball names in SDIO block per AST2500 pin mapping table. Functions
> and select expressions are correct; they were just one ball low.

Thanks. I also found this whilst preparing some follow-up patches which
I'm hoping to send out shortly. I'll add your Reported-by.

Cheers,

Andrew

>=20
> Signed-off-by: Xo Wang <xow@google.com>
> ---
> Changes for v2: now it compiles.
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 12 ++++++------
> =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g5.c
> index c98beb6..d8e5824 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -129,21 +129,21 @@ FUNC_GROUP_DECL(GPID0, F19, E21);
> =C2=A0
> =C2=A0#define GPID1_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC_SET(=
SCU8C, 9)
> =C2=A0
> -#define D20 26
> +#define F20 26
> =C2=A0SIG_EXPR_LIST_DECL_SINGLE(SD2DAT0, SD2, SD2_DESC);
> =C2=A0SIG_EXPR_DECL(GPID1IN, GPID1, GPID1_DESC);
> =C2=A0SIG_EXPR_DECL(GPID1IN, GPID, GPID_DESC);
> =C2=A0SIG_EXPR_LIST_DECL_DUAL(GPID1IN, GPID1, GPID);
> -MS_PIN_DECL(D20, GPIOD2, SD2DAT0, GPID1IN);
> +MS_PIN_DECL(F20, GPIOD2, SD2DAT0, GPID1IN);
> =C2=A0
> -#define D21 27
> +#define D20 27
> =C2=A0SIG_EXPR_LIST_DECL_SINGLE(SD2DAT1, SD2, SD2_DESC);
> =C2=A0SIG_EXPR_DECL(GPID1OUT, GPID1, GPID1_DESC);
> =C2=A0SIG_EXPR_DECL(GPID1OUT, GPID, GPID_DESC);
> =C2=A0SIG_EXPR_LIST_DECL_DUAL(GPID1OUT, GPID1, GPID);
> -MS_PIN_DECL(D21, GPIOD3, SD2DAT1, GPID1OUT);
> +MS_PIN_DECL(D20, GPIOD3, SD2DAT1, GPID1OUT);
> =C2=A0
> -FUNC_GROUP_DECL(GPID1, D20, D21);
> +FUNC_GROUP_DECL(GPID1, F20, D20);
> =C2=A0
> =C2=A0#define I2C5_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC=
_SET(SCU90, 18)
> =C2=A0
> @@ -522,8 +522,8 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_=
G5_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(D1),
> =C2=A0	ASPEED_PINCTRL_PIN(D10),
> =C2=A0	ASPEED_PINCTRL_PIN(D2),
> +	ASPEED_PINCTRL_PIN(F20),
> =C2=A0	ASPEED_PINCTRL_PIN(D20),
> -	ASPEED_PINCTRL_PIN(D21),
> =C2=A0	ASPEED_PINCTRL_PIN(D4),
> =C2=A0	ASPEED_PINCTRL_PIN(D5),
> =C2=A0	ASPEED_PINCTRL_PIN(D6),
--=-c/Yx/Xy7P//Ml6DiU4Qb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX6c4wAAoJEJ0dnzgO5LT5ixIP/3JM1WzTyGv2sdFgEee3asX3
JSCdjGS8HmqFElKK8tfEWfWnu3yH2YUn1VYivXvwcIBT9PjbjM2a5fVBh82j7kVg
j8wRBhxmXatXsvLeoxKVMRo29BfVtUWDQWJqeNloNo3yuNm9Xm/7oVZEZDyEB45o
TGYapp8N8yZyQFT/qfGHv0aJaohi25MylDUfQXN2tv4X8LIbtBdXXucpNAyZ6pwC
/RFb5UWq+O046/ZHJbjVlLcyKzTS4/Yi9Kb3j/CSVhmoB1MAyvgMAyIzsS/8sdAo
7eAV/PQcypTZh7cCfZaB2joMw948vPHx7eqv8NlYLDSZczZ91QXLdT7ZNYsc7MJu
6ddiSn/Qiy8OacW7mo2gx0GsDlLYqjbR8UPi5s9V5l4MFrDDx2Ap50Y0LERjO67T
ylpI5d0HEkegnYttF328+QOin4ffZkL7RYXLdc0PfBUrHX6GKs2mYcDYrsj1qkrC
B/xELLuBcZr+i3ouv4gp8TrAACKrSNriydemvhlDmLDUNV5T6lY551o0YQN+CTgL
RgqOmW7KS30TA2q5Xad7Yr5sTR9B7qhPEwe4HAa1seR5t3CffTBW6RM76jbTI60u
TkghuPIVi+LbX5J2RaDB2e0+ssTxeVnfMHvQbQiyl7oims3du4Dm+X1uoxJ53PBo
A1CAOy8GRSNI+RKbqQoZ
=pbwU
-----END PGP SIGNATURE-----

--=-c/Yx/Xy7P//Ml6DiU4Qb--
