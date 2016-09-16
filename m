Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZx2y4zTqzDsZJ
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 10:28:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Sq9rUrSy; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Vz/V3ue5; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 06CBC20729;
 Thu, 15 Sep 2016 20:28:22 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 15 Sep 2016 20:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=7iA1s
 gloWd5R1U4GKyWhDFOSfwU=; b=Sq9rUrSyY1ePQdM4Db+xWfpEiXIjvIN5pW37n
 JLAbud+471FygYB7J9b6Ozehv0LVZgHKpPfFxeXTy/VfvABjqgKNqohbYuLtv8Oo
 VoOu0Z8RVSVYr+jngqM/f2balQoPj/4c4A9P2FeYWRdHar2HZFg9QNsbxTJyKRnR
 DmW5XU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=7iA1sgloWd5R1U4GKyWhDFOSfwU=; b=Vz/V3
 ue5AvQ7MOzYO4MIjyBSw1jjDZLi9LauLqej6ITuOE5mlJ9LgOFXD/01xma8ow3C5
 xYM8AeqZC+iUCoNFFEMaP+5IpxQaBOebH300JRR5tp6J7I89ckeRvmqAyHyLW4O8
 safOj7lmylCqoGCRDmMZMyogeyeFhNsQfE68ko=
X-Sasl-enc: o3Ly5yVjKOCTHdPYKzf3eGSB1HZP0D29N5NdBpkHqRpm 1473985701
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E80ACCE8F;
 Thu, 15 Sep 2016 20:28:20 -0400 (EDT)
Message-ID: <1473985691.13249.1.camel@aj.id.au>
Subject: Re: [linux dev-4.7 1/3] pinctrl: aspeed: Add SPI pins to G5
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
Date: Fri, 16 Sep 2016 09:58:11 +0930
In-Reply-To: <20160915111308.31481-1-joel@jms.id.au>
References: <20160915111308.31481-1-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-76whlYGYB6u4HMqzMpGu"
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
X-List-Received-Date: Fri, 16 Sep 2016 00:28:28 -0000


--=-76whlYGYB6u4HMqzMpGu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-09-15 at 20:43 +0930, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 89 +++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 89 insertions(+)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g5.c
> index a0b1d4ee3b5e..6e5b90e62e99 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -140,6 +140,77 @@ MS_PIN_DECL(D21, GPIOD3, SD2DAT1, GPID1OUT);
> =C2=A0
> =C2=A0FUNC_GROUP_DECL(GPID1, D20, D21);
> =C2=A0
> +#define SYSSPI_DESC SIG_DESC_SET(HW_STRAP1, 13)
> +
> +#define C18 64
> +SIG_EXPR_LIST_DECL_SINGLE(SYSCS, SYSSPI, COND1, SYSSPI_DESC);
> +SS_PIN_DECL(C18, GPIOI0, SYSCS);
> +
> +#define E15 65
> +SIG_EXPR_LIST_DECL_SINGLE(SYSCK, SYSSPI, COND1, SYSSPI_DESC);
> +SS_PIN_DECL(E15, GPIOI1, SYSCK);
> +
> +#define B16 66=C2=A0
> +SIG_EXPR_LIST_DECL_SINGLE(SYSMOSI, SYSSPI, COND1, SYSSPI_DESC);
> +SS_PIN_DECL(B16, GPIOI2, SYSMOSI);
> +
> +#define C16 67=C2=A0
> +SIG_EXPR_LIST_DECL_SINGLE(SYSMISO, SYSSPI, COND1, SYSSPI_DESC);
> +SS_PIN_DECL(C16, GPIOI3, SYSMISO);
> +
> +FUNC_GROUP_DECL(SYSSPI, C18, E15, B16, C16);
> +
> +#define SPI1_MASTER_DESC	{ HW_STRAP1, GENMASK(13, 12), 1, 0 }
> +#define SPI1_DEBUG_DESC		{ HW_STRAP1, GENMASK(13, 12), 2, 0 }
> +#define SPI1_PASSTHRU_DESC	{ HW_STRAP1, GENMASK(13, 12), 3, 0 }
> +
> +#define VB_DESC	SIG_DESC_SET(HW_STRAP1, 5)
> +
> +#define B15 68=C2=A0
> +SIG_EXPR_DECL(SPI1CS0, SPI1_MASTER, COND1, SPI1_MASTER_DESC);
> +SIG_EXPR_DECL(SPI1CS0, SPI1_DEBUG, COND1, SPI1_DEBUG_DESC);
> +SIG_EXPR_DECL(SPI1CS0, SPI1_PASSTHRU, COND1, SPI1_PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL(SPI1CS0, SIG_EXPR_PTR(SPI1CS0, SPI1_MASTER),
> +			=C2=A0=C2=A0=C2=A0=C2=A0SIG_EXPR_PTR(SPI1CS0, SPI1_DEBUG),
> +			=C2=A0=C2=A0=C2=A0=C2=A0SIG_EXPR_PTR(SPI1CS0, SPI1_PASSTHRU));
> +SIG_EXPR_LIST_DECL_SINGLE(VBCS, VGABIOS_ROM, COND1, VB_DESC);
> +MS_PIN_DECL(B15, GPIOI4, SPI1CS0, VBCS);
> +	=09
> +#define C15 69
> +SIG_EXPR_DECL(SPI1CK, SPI1_MASTER, COND1, SPI1_MASTER_DESC);
> +SIG_EXPR_DECL(SPI1CK, SPI1_DEBUG, COND1, SPI1_DEBUG_DESC);
> +SIG_EXPR_DECL(SPI1CK, SPI1_PASSTHRU, COND1, SPI1_PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL(SPI1CK, SIG_EXPR_PTR(SPI1CK, SPI1_MASTER),
> +			=C2=A0=C2=A0=C2=A0=C2=A0SIG_EXPR_PTR(SPI1CK, SPI1_DEBUG),
> +			=C2=A0=C2=A0=C2=A0=C2=A0SIG_EXPR_PTR(SPI1CK, SPI1_PASSTHRU));
> +SIG_EXPR_LIST_DECL_SINGLE(VBCK, VGABIOS_ROM, COND1, VB_DESC);
> +MS_PIN_DECL(C15, GPIOI5, SPI1CK, VBCK);
> +
> +#define A14 70
> +SIG_EXPR_DECL(SPI1MOSI, SPI1_MASTER, COND1, SPI1_MASTER_DESC);
> +SIG_EXPR_DECL(SPI1MOSI, SPI1_DEBUG, COND1, SPI1_DEBUG_DESC);
> +SIG_EXPR_DECL(SPI1MOSI, SPI1_PASSTHRU, COND1, SPI1_PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL(SPI1MOSI, SIG_EXPR_PTR(SPI1MOSI, SPI1_MASTER),
> +			=C2=A0=C2=A0=C2=A0=C2=A0SIG_EXPR_PTR(SPI1MOSI, SPI1_DEBUG),
> +			=C2=A0=C2=A0=C2=A0=C2=A0SIG_EXPR_PTR(SPI1MOSI, SPI1_PASSTHRU));
> +SIG_EXPR_LIST_DECL_SINGLE(VBMOSI, VGABIOS_ROM, COND1, VB_DESC);
> +MS_PIN_DECL(A14, GPIOI6, SPI1MOSI, VBMOSI);
> +
> +#define A15 71
> +SIG_EXPR_DECL(SPI1MISO, SPI1_MASTER, COND1, SPI1_MASTER_DESC);
> +SIG_EXPR_DECL(SPI1MISO, SPI1_DEBUG, COND1, SPI1_DEBUG_DESC);
> +SIG_EXPR_DECL(SPI1MISO, SPI1_PASSTHRU, COND1, SPI1_PASSTHRU_DESC);
> +SIG_EXPR_LIST_DECL(SPI1MISO, SIG_EXPR_PTR(SPI1MISO, SPI1_MASTER),
> +			=C2=A0=C2=A0=C2=A0=C2=A0SIG_EXPR_PTR(SPI1MISO, SPI1_DEBUG),
> +			=C2=A0=C2=A0=C2=A0=C2=A0SIG_EXPR_PTR(SPI1MISO, SPI1_PASSTHRU));
> +SIG_EXPR_LIST_DECL_SINGLE(VBMISO, VGABIOS_ROM, COND1, VB_DESC);
> +MS_PIN_DECL(A15, GPIOI7, SPI1MISO, VBMISO);
> +
> +FUNC_GROUP_DECL(SPI1_MASTER, B15, C15, A14, A15);=C2=A0
> +FUNC_GROUP_DECL(SPI1_DEBUG, B15, C15, A14, A15);=C2=A0
> +FUNC_GROUP_DECL(SPI1_PASSTHRU, B15, C15, A14, A15);=C2=A0
> +FUNC_GROUP_DECL(VGABIOS_ROM, B15, C15, A14, A15);=C2=A0
> +
> =C2=A0#define I2C5_DESC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC=
_SET(SCU90, 18)
> =C2=A0
> =C2=A0#define L3 80
> @@ -492,6 +563,8 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_=
G5_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(A11),
> =C2=A0	ASPEED_PINCTRL_PIN(A12),
> =C2=A0	ASPEED_PINCTRL_PIN(A13),
> +	ASPEED_PINCTRL_PIN(A14),
> +	ASPEED_PINCTRL_PIN(A15),
> =C2=A0	ASPEED_PINCTRL_PIN(A2),
> =C2=A0	ASPEED_PINCTRL_PIN(A3),
> =C2=A0	ASPEED_PINCTRL_PIN(A4),
> @@ -501,6 +574,8 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_=
G5_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(B1),
> =C2=A0	ASPEED_PINCTRL_PIN(B11),
> =C2=A0	ASPEED_PINCTRL_PIN(B12),
> +	ASPEED_PINCTRL_PIN(B15),
> +	ASPEED_PINCTRL_PIN(B16),
> =C2=A0	ASPEED_PINCTRL_PIN(B2),
> =C2=A0	ASPEED_PINCTRL_PIN(B3),
> =C2=A0	ASPEED_PINCTRL_PIN(B4),
> @@ -510,6 +585,9 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_=
G5_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(C11),
> =C2=A0	ASPEED_PINCTRL_PIN(C12),
> =C2=A0	ASPEED_PINCTRL_PIN(C14),
> +	ASPEED_PINCTRL_PIN(C15),
> +	ASPEED_PINCTRL_PIN(C16),
> +	ASPEED_PINCTRL_PIN(C18),
> =C2=A0	ASPEED_PINCTRL_PIN(C2),
> =C2=A0	ASPEED_PINCTRL_PIN(C3),
> =C2=A0	ASPEED_PINCTRL_PIN(C4),
> @@ -527,6 +605,7 @@ static struct pinctrl_pin_desc aspeed_g5_pins[ASPEED_=
G5_NR_PINS] =3D {
> =C2=A0	ASPEED_PINCTRL_PIN(D9),
> =C2=A0	ASPEED_PINCTRL_PIN(E10),
> =C2=A0	ASPEED_PINCTRL_PIN(E12),
> +	ASPEED_PINCTRL_PIN(E15),
> =C2=A0	ASPEED_PINCTRL_PIN(E21),
> =C2=A0	ASPEED_PINCTRL_PIN(E6),
> =C2=A0	ASPEED_PINCTRL_PIN(E7),
> @@ -581,6 +660,11 @@ static const struct aspeed_pin_group aspeed_g5_group=
s[] =3D {
> =C2=A0	ASPEED_PINCTRL_GROUP(RGMII1),
> =C2=A0	ASPEED_PINCTRL_GROUP(RMII2),
> =C2=A0	ASPEED_PINCTRL_GROUP(RGMII2),
> +	ASPEED_PINCTRL_GROUP(SPI1_MASTER),
> +	ASPEED_PINCTRL_GROUP(SPI1_DEBUG),
> +	ASPEED_PINCTRL_GROUP(SPI1_PASSTHRU),
> +	ASPEED_PINCTRL_GROUP(VGABIOS_ROM),
> +	ASPEED_PINCTRL_GROUP(SYSSPI),
> =C2=A0};
> =C2=A0
> =C2=A0static const struct aspeed_pin_function aspeed_g5_functions[] =3D {
> @@ -612,6 +696,11 @@ static const struct aspeed_pin_function aspeed_g5_fu=
nctions[] =3D {
> =C2=A0	ASPEED_PINCTRL_FUNC(RGMII1),
> =C2=A0	ASPEED_PINCTRL_FUNC(RMII2),
> =C2=A0	ASPEED_PINCTRL_FUNC(RGMII2),
> +	ASPEED_PINCTRL_FUNC(SPI1_MASTER),
> +	ASPEED_PINCTRL_FUNC(SPI1_DEBUG),
> +	ASPEED_PINCTRL_FUNC(SPI1_PASSTHRU),
> +	ASPEED_PINCTRL_FUNC(VGABIOS_ROM),
> +	ASPEED_PINCTRL_FUNC(SYSSPI),
> =C2=A0};
> =C2=A0
> =C2=A0static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data =3D {
--=-76whlYGYB6u4HMqzMpGu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX2zybAAoJEJ0dnzgO5LT5upYQAJwq4B+tAYogCvWP6s/TuW7x
+HT13CDcXpTUaxAv3CRCu+8KDagDCMD+bjSOdp+Ht7ftFOdqtbhlOevAf3/MFzNR
a8aAzx0jz3mc9h/z5QTKGDI4SIzEUjTaKkr82JQOMxGOj5E0LTbcYwW/wiht8OMx
NWbV1g+iHBqN1HVYrojsJwWlKZhg6MWuxOkKTJiuTmePxEyaA/fBhZNdR4LBSCbH
bLRkRhN3hRM+pprv1Ip7ced3K4dFUDhuSFG08AH1sABWbnFI5QZuvI/C9JB0Im4D
s1soxef4xXTmm3fk86t293KbnGxUlvMa3+PD7q+Lu8G+8xDt0OLAOJc/G1DTF+s8
kBuafx/O5eHuJ4h70zJ+f82S7Q5LCfrvkCCE1RZbtD5W8ssr5bDF740Hhd3Htz4Z
GhZyjUZZA/PbObhz3oi17cKVSIf5UKUwHIiukYOBUfT24R0xK9yQBiT/JA2uhHXp
947dPT1C4y/0H66m8Sf/H5RLjI6N0F/viywKNHRUDcuSiI2xucc8F20gKixc0gIa
nNfYEZde5duf0OgzlULjUOSUWlgV6QbVhAyhvtpBsU1BmSHco1pYzn7rL6CPSUPA
WD6hiZ4ij922agKj4JINz+bWvQ3hq3IsYNQ6yrdgoHekvjnuIraOmUTA59a8LJqb
XPnNJfnlLFq7kYYVqr+9
=MHw3
-----END PGP SIGNATURE-----

--=-76whlYGYB6u4HMqzMpGu--
