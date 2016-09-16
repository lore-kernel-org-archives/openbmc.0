Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZzQR0NZgzDsYs
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 12:15:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=UNRKOpk9; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=R8lcUzl8; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D9D76204D8;
 Thu, 15 Sep 2016 22:15:22 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 15 Sep 2016 22:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=E9rLu
 nQ1xWu+FV88KdQUsRUUBzQ=; b=UNRKOpk9sWI/XmA6L+X0YqsZSRaTy0Sg4Ipec
 xadiug5/CV7K5ohQbwzZzzJy62oOb5zHbLDKqlistjgq9ZuVdwWWuujeBuP2llsp
 4eJu6f6HIbbiwxWPFP52CUa1xOW/lfKIdyTFHVsSPltilSLwYX33xhWfH2EGYdNa
 /gsvp4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=E9rLunQ1xWu+FV88KdQUsRUUBzQ=; b=R8lcU
 zl8R42tzVQc41c8wdo4HSY5vBEpacMBA1t8skvo1RjflXZr1KmVxjLb624Vc+cU2
 VjAPtNfJHGosBGa0sxSOT4ZVRm/2g834ZlZvaVVg0MIY4yZ3tSLD2sxsDWGz9X3X
 0uMVVclruROsgKPQqKiyYU84tKx4iQyp5dhKHQ=
X-Sasl-enc: yCKlNwJMS3Dxsi5kild3593NO8qo9nV5SZ7pdg+QitPu 1473992122
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 483BFCCE9A;
 Thu, 15 Sep 2016 22:15:20 -0400 (EDT)
Message-ID: <1473992113.13249.36.camel@aj.id.au>
Subject: Re: [PATCH 07/16] pinctrl-aspeed-g4: Add definition for GPIO pins
 J2 and
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, openbmc@lists.ozlabs.org
Date: Fri, 16 Sep 2016 11:45:13 +0930
In-Reply-To: <1740217293.194628.1473971738317.JavaMail.zimbra@raptorengineeringinc.com>
References: <1740217293.194628.1473971738317.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BVfrwE0rmGe5sgryaUQt"
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
X-List-Received-Date: Fri, 16 Sep 2016 02:15:28 -0000


--=-BVfrwE0rmGe5sgryaUQt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-09-15 at 15:35 -0500, Timothy Pearson wrote:
> =C2=A0O2
>=20
> This is required for Firestone to boot.

Just for future reference, on Firestone:

GPIOJ1 is=C2=A0BMC_CFAM_RESET_N
GPIOO2 is=C2=A0BMC_CP0_RESET_N

This looks good to me.

However, I was intending to implement all outstanding pins for the 2400
and 2500 today now that the Aspeed pinctrl core has been accepted
upstream. If you don't mind I'll just merge what you have done here
into those patches.

Cheers,

Andrew

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
--=-BVfrwE0rmGe5sgryaUQt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX21WxAAoJEJ0dnzgO5LT5MesP/1L15WWiocQAQxsKSnqp9z1W
FfW1558r2Wy3EzWCDvw8jkn6Mq7IWl1ucww7jQ6MR99gXAJ7wpCtbKeENHyNBbkE
ADH26MpbpEvsfM1l6YEj2Foy91SZeNOTlyRlpWZS8I+XWSAAPKtr5E5hZOLz/GJ/
yBKewhWdtIkjwRetVmDbseZAp4Hti5vmsPnX77eHkzi6Gx9ks/tbuq7PyLKeOILP
RXa++umVCm8bWSTe3Qz3YycnRVkYBWPHjCnecuGZwl66pOhDQH1kJU9uTznycjRG
VmoW0gMf92KgewXXx2dqRc9gCr/Hr+CNBhTZmCmf49mnmHc2+BAgPdzR8NfUU4TC
JeetpfalX9nVA+SHbiyYCHOXgtHkG0MWA+HK7k/KraBbbBThOq/GhNknz91zBcFv
4AU24/Eq0LZ8ErFNtwrrfT9nZemSWRTNH4795xEhsR9u5hfe0T7ubAHf7jBdiOVU
dWA/sUCUIvVw/0SfqkUvtSp/k2SRxXHiVFOgGILBs3Vj5JNRyTgvnm3xi7bxqVdY
1t6Tl5tc/R3gMrXtijCyOz4U6NiRdufICKp2Vm6h4i9MnuRA+FqLAZbGoOq/i1xH
xMtmNKLACux6BYlbtZHSXbsCcrGikUaPzx0XMimFpA1cLanF7Z9g5/9UyLAs/I3n
9Cj1oQOpX5QsF/OQWYtu
=cS2E
-----END PGP SIGNATURE-----

--=-BVfrwE0rmGe5sgryaUQt--
