Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wD6FP3qPGzDqJX
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 16:18:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QBWwd5xq"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iZrs4R9a"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F8EA208D3;
 Thu, 27 Apr 2017 02:17:59 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Apr 2017 02:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=2W48VO1xYbjPrsbevi+1UeVhu+TxtbdpG8TAHhw/B
 BA=; b=QBWwd5xqyCCBT+u2UKomH6CeZ947nBtEW461uiCPzjigEtkWOUOzaC4V6
 DM5B2u8OGZMuhGcTyfhdilq7+hvW7I45I5hZuHyiYjSDWiheI6D6cek6c6O7gGtH
 rHo3xaeMBXol2xcmtS3NAEPxiJ6lqTAtu02wGbbW1mToxx+4jQE7n9w5lj9yWsCf
 1sGLQ5PqT1HpNbAW2VZs/k7Oj3Fq4C3CU3EPS2R9PTFqCY++FhyVQIOUGU0JlVlL
 hLn/2IzfmLaZgq5GiehLKia8QWKfdVyVZ7jOgEhI1BXX3qp7L3Zd/vs1JBoQ8pLN
 LIdv7K9aw1f0+2O1q21AxlvDHhO+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=2W48VO1xYbjPrsbevi
 +1UeVhu+TxtbdpG8TAHhw/BBA=; b=iZrs4R9acIUtzfUAq+SU+gqCx0py56K9zv
 Ly5RH+8b33jMlN/sqoOgMLIvsXZ+bygltTwisnwu1kwpVVzJ8mgY7xuiuE5waxsp
 p+pvmkc7o/NuvvBoqkNXoq9drpT4haOhhn6Ouhg9OaKLCVOqx/4164AsBj1IbVLn
 yfOfTLJdsOjFigeDLkb3dQbtbrWLuhU/MiVRX42g1fWCocMUr3xpT7CvHgiJSkyu
 9A6YWNZ5sbEyV02sfjFhz/tpkLDsVapd2oUsi/Ld9SATLw0m+7kO0Rj4jNgJsUHW
 WEjtSWmXtFXJXJAkIstCsU7qRKYVccfC3qep/IfXKMOsQaCTCSRA==
X-ME-Sender: <xms:F40BWZgzBxLaenQHu7bRCDf6iI3SH50VdpoVcyKm0yjaQrsItQyevA>
X-Sasl-enc: e7GQFsPFjBDULlqBlmZePzOQ+7q0uSadx6HDo7O2Ckjy 1493273878
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id DFDEC24765;
 Thu, 27 Apr 2017 02:17:57 -0400 (EDT)
Message-ID: <1493273870.4433.4.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v4] ARM: dts: aspeed: Modify Laanyang BMC
 device tree
From: Andrew Jeffery <andrew@aj.id.au>
To: Ken Chen <chen.kenyy@inventec.com>, openbmc@lists.ozlabs.org
Date: Thu, 27 Apr 2017 15:47:50 +0930
In-Reply-To: <20170427040214.15096-1-chen.kenyy@inventec.com>
References: <20170427040214.15096-1-chen.kenyy@inventec.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-3FBiX6WdiYtJex85bSR/"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Thu, 27 Apr 2017 06:18:02 -0000


--=-3FBiX6WdiYtJex85bSR/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-04-27 at 12:02 +0800, Ken Chen wrote:
> Modify Lanyang dts and add lanyang initial in aspeed.c
>=20
> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 13 ++++++-------
> =C2=A0arch/arm/mach-aspeed/aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 17 ++++++++++=
+++++++
> =C2=A02 files changed, 23 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-lanyang.dts
> index 176e4b4..6456458 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> @@ -1,4 +1,4 @@
> -/dts-v1/;
> +/dts-v3/;
> =C2=A0

Was this necessary? What do we get from the change?

Cheers,

Andrew

> =C2=A0#include "aspeed-g5.dtsi"
> =C2=A0#include <dt-bindings/gpio/aspeed-gpio.h>
> @@ -302,18 +302,17 @@
> =C2=A0};
> =C2=A0
> =C2=A0&gpio {
> > -	line_apss_reset {
> > -		gpio-hog;
> > -		gpios =3D <ASPEED_GPIO(E, 4) GPIO_ACTIVE_HIGH>;
> > -		output-high;
> > -		line-name =3D "BMC_APSS_RESET_N";
> > -	};
> +
> =C2=A0};
> =C2=A0
> =C2=A0&vuart {
> > =C2=A0	status =3D "okay";
> =C2=A0};
> =C2=A0
> +&gfx {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0status =3D "okay";
> +};
> +
> =C2=A0&pinctrl {
> > =C2=A0	aspeed,external-nodes =3D <&gfx &lhc>;
> =C2=A0};
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index a7b03a0..0717181 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -238,6 +238,21 @@ static void __init do_romulus_setup(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC |=
 0x98));
> =C2=A0}
> =C2=A0
> +static void __init do_lanyang_setup(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long reg;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0do_common_setup();
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Disable default behav=
ior of UART1 being held in reset by LPCRST#.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* By releasing UAR=
T1 from being controlled by LPC reset, it becomes
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* immediately avai=
lable regardless of the host being up.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg =3D readl(AST_IO(AST=
_BASE_LPC | 0x98));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Clear "Enable UART1 r=
eset source from LPC" */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0writel(reg & ~BIT(4), AS=
T_IO(AST_BASE_LPC | 0x98));
> +}
> +
> > =C2=A0#define SCU_PASSWORD	0x1688A8A8
> =C2=A0
> =C2=A0static void __init aspeed_init_early(void)
> @@ -275,6 +290,8 @@ static void __init aspeed_init_early(void)
> > =C2=A0		do_witherspoon_setup();
> > =C2=A0	if (of_machine_is_compatible("ibm,romulus-bmc"))
> > =C2=A0		do_romulus_setup();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (of_machine_is_compat=
ible("inventec,lanyang-bmc"))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0do_lanyang_setup();
> =C2=A0}
> =C2=A0
> =C2=A0static void __init aspeed_map_io(void)
--=-3FBiX6WdiYtJex85bSR/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZAY0OAAoJEJ0dnzgO5LT544YP/1WGRgqJkh962Tf0gfirTqvK
ce9k9y9GuQaAmg89l7vBOMu3mD9oX6ZV0kkQ/+fu7eyGfJsVtNv+g2umnA8Vdgvp
/anU4ijd8dUbOZRCdVJk/w6AwGdiqclW0pQQ0YaITAd27j2ngYoLJjxH9l+EDggo
XQeuUY1S+HlJvUMVHRLwUIA8gebG/VohE7kHSZRfrK8UAKZHs/LvphcGC7Q2nK/z
GotOErBkCi8Nr+OhVoQdgkUFo0Wc5VFXoZ30LlfQhKzjMU9pIyvokdmsSlozVb3G
AoqlWJqr+6dJU5YQoZadTOFPG/09ZkbaIGrUnEsCysfRsyF2Qv53cgv59z4RU3Eh
oVMZMYyM3bKPQ7EWHp3V90NLICWSPD7XT2XHTC8PTQxydUkOTANBnau+UEdyS3ec
F3LudW+qlyT9AQcrzuohiCul8BrG9ZUnpmVMzAt14k6rCfCSdJdRTno+jwTo49rm
dlPOIrI1qJWj2/3e/SF6xyCrofq/K/v+Po6oFsTTR3JuF/XkcSyFG8OJspg7E192
dEMOo9khnQyQ4bt7XVp4zJjLDcdgEQ7lj1SWyZgsLOU4DW+qXuup5GsUSey9llzk
CupkoZ9WSrIr7qtJhrEtK/ForGWkc65LS9tjOu8PIStUc/BtxFF1FQzIUD1Y6BpK
WA3KN1v6A7coUjTXHrSC
=lEX7
-----END PGP SIGNATURE-----

--=-3FBiX6WdiYtJex85bSR/--
