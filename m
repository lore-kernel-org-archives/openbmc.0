Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xW6nK5J2XzDr9Q
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 17:34:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SI2PHlwp"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="iM1Md97P"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8EEAC2103F;
 Mon, 14 Aug 2017 03:34:27 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 14 Aug 2017 03:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=WUKCyrQmVZXe9pSZ+HvDJwVc9gmVVs5rbKLovzX1U
 6I=; b=SI2PHlwpg4zPMc8CPDmiR5baJ1BL/B/EVbSYCrNYsTSE0NWYb+7GrbssL
 mKOoCTC3DermF0FjAgdei+Ara9P0zUuCPhm/88TgXwL1VbGLGv5ipRDMjPmmRMlp
 J1c/lTBz/IvsHGVlEOME8QZ4Zv+roedAa/jAuv9j2IwTzGdcC1fERKj0EzrpyAVk
 RCAEPC1FmRkc2lxKJjs5BqnlVOFPUOilVCvVz596qO17PlZ7JnQ0tpR3UwrmA+C/
 K3DVGSgLxHH+G/yVifUgG8PJJ4yBMY2WTVhF2946e0fBxYvtX3uPNXZPnITP4qHX
 tjWgYA8U1yL3TR3zdjUexbnGjm79g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=WUKCyrQmVZXe9pSZ+H
 vDJwVc9gmVVs5rbKLovzX1U6I=; b=iM1Md97PP36ShFwEmGw9A/IOKbUTSY5o5V
 H0gjhfHYhfl/68gp7teg+VQi1U4P600SFth5rhyweOM4v6Q+Pr1r0SF0CONPPnPK
 UoUxNDr3fq1u0SfcvlBVtz7Sh4gzF7+EgJiqTEkofg7zxQao5pCAmIvioiJFo8s2
 W7sPPJ75H4jVkV/n4AAI30q8VRsfrzW12V8NK2g49blJl3mFGM4i8jE//eFXMRY3
 DHZiYMJH0MYGrMacAGbex/ZJKJoPMI+ROTP4PmirgDNSeKwdio+r6YaCC4+e+S1A
 oeND1GBbnzfRZdOhFO10oEcs7JnCiuzZiv3uDKk11QG/rvT9rrgQ==
X-ME-Sender: <xms:g1KRWYd_FEhAIC8h7Qdh8yB6F9OTIVha4-WmsSyKhi8mKZ7Y9XURQw>
X-Sasl-enc: Uf5qqn/txjd1268ex2m/5Sc8wvYiGaIr38UD3SAeu7kq 1502696066
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDD94246A3;
 Mon, 14 Aug 2017 03:34:25 -0400 (EDT)
Message-ID: <1502696062.14932.23.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v5 4/4] ARM: dts: aspeed: Witherspoon:
 Add power supplies to i2c bus
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
Date: Mon, 14 Aug 2017 17:04:22 +0930
In-Reply-To: <1502474205-1557-5-git-send-email-eajames@linux.vnet.ibm.com>
References: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474205-1557-5-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-q3eW+2BYDVEO5kajU9YB"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Mon, 14 Aug 2017 07:34:30 -0000


--=-q3eW+2BYDVEO5kajU9YB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-08-11 at 12:56 -0500, Eddie James wrote:
> > From: "Edward A. James" <eajames@us.ibm.com>
>=C2=A0
> > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=C2=A0
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 9ab8e46..dd30c20 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -417,6 +417,16 @@
> > =C2=A0			type =3D <PCA955X_TYPE_GPIO>;
> > =C2=A0		};
> > =C2=A0	};
> +
> > +	power-supply@68 {
> > +		compatible =3D "ibm,cffps1";
> > +		reg =3D <0x68>;
> > +	};
> +
> > +	power-supply@69 {
> > +		compatible =3D "ibm,cffps1";
> > +		reg =3D <0x69>;
> > +	};
> =C2=A0};
> =C2=A0
> =C2=A0&i2c4 {

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
--=-q3eW+2BYDVEO5kajU9YB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZkVJ+AAoJEJ0dnzgO5LT5+DgP/0JELBpanXSEZJ1hJt06D2lQ
U/WGXcQfI7mJnegHkQYXw+EKr/i/Oj0cgFbA8RWegj+FBadGb1icBavr5mjbQ0r6
lx5NFAskkBnzFEaRt7ypDUhP1zpP0yZQlekPhamgHH45ZvUvw0IYr6An4O57GCkN
jWB24Aec1UKGroIn+entdeZiB2O89561JlqIx+jfgfalwdJ9fajom6soZQ/9Yt/W
huH93dpU277xRhHv/Xhf7mHYsctetaBwMUFxnw9ynT7ltyKIAwx8o0IG0Iwe3oIf
U/tE9mw7/uX9OnMvvEop/jkkju6L4wCn8emICwT2N8+tlLERZ4l9gCO5Tf1rZmma
b6AGMwy8RgZw73tX70qiywYFg7bOckwsOuNg1MtuL5EFVkQ66BpE2teVQQYAEl3d
dB7idLu4tIWJ4XuPbp/pFKRTdTyzKY9kcjOrY6S5wKSLi8uzpKWtKgsQMNUjqE8u
ZN6VoUcvRFzLVfc1BVFmzgareVYVAReP7HdmlnJRJMcfG5xgiywLN9aCinx54H4o
UydExEUhYBoNnL/YMh/Uew1SmdoCtsWyzdl3Ku4Zez2Srrx1mrrVvdFBumclEUY+
VRdBnReJ9V2wt6fShYhBhyCTyfPOA90bI+cm5WUIv6YWdho6bo2G7tQy99bpLtZP
nxyg3KWweGeaM405bN7r
=uhub
-----END PGP SIGNATURE-----

--=-q3eW+2BYDVEO5kajU9YB--
