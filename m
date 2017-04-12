Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w2rH66FZ7zDq7h
 for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2017 14:17:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="hpC7ginJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="AGEgCtrQ"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B8FF620C53;
 Wed, 12 Apr 2017 00:17:19 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 12 Apr 2017 00:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=rD+SHHUf6lxhDUbPWA1OdiwMAE1hZJlz60xqAt9C9
 ks=; b=hpC7ginJXzCgvajAB7/+JBiVgd3HoeBJhb3s47zseG1812PxaZBsS4Gmu
 /as+W0aMgSGLVwQuMAJmyV/mSqzIGLtat3eqtv73rR9c1c49t284CawGaQRiQ5Tz
 Ja1wkqDZaf6T1erbTDvAoED95GnQOj5taUW3XjHlWJeclcfmUGIgMhAsqkeSaYBJ
 Ed2rrdQJvKHj/OmPYi11otaSfNRs5UunMdNMmXGM5dCrEq2hFI0U+minhL+WQICA
 zZLw4lVFCLw8xVkHlL/z8MD05J6+rYK0KUas1dSes427pGaQkFylRmjM7CVOnA9J
 S2hZxBRN4X4jE0A3AgMxyaE5KZRvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=rD+SHHUf6lxhDUbPWA
 1OdiwMAE1hZJlz60xqAt9C9ks=; b=AGEgCtrQjSkm30+U2aRDcy60TGxdoE+Igv
 8lRigvJ2o9QnbuOdqwjxYnRXKERjV6LfCTy0z55VcdaU+frzku2FFYYn0YSyH37E
 euqd9Jg1d94GH4izABYFYOCKdD7j4QiHKJ7GW3JviuYSFAYZC3bSQcR7892x1rhw
 6vyyG4uqnKISN9AGQGEEyLq2V7E/7L40HMOJKabbreQ24ialhwnAcPVUc1MaB3tZ
 Y/RGGIVurMBj34NPRphwe0J2lPRH1P4r59zYC80GT+z+rebuftqO7DXoRJhd68Gq
 pITC15EqOR9mBL27qSc89AR1B37iBIaU+RKa8SNT31TlSkqzYXqA==
X-ME-Sender: <xms:T6rtWFFiRCm7yHRjNcceZ8XR0cP0UtD6XrmR_Ec2nY7yFAoxGDwbcQ>
X-Sasl-enc: hikVRDyqgiQ581Fu9hxYjPlJUVk4fiUbcBHZSZM1Cj0H 1491970638
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id EBC47241ED;
 Wed, 12 Apr 2017 00:17:17 -0400 (EDT)
Message-ID: <1491970634.3829.7.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 2/2] ARM: dts: Enable checkstop and
 cooling gpio keys
From: Andrew Jeffery <andrew@aj.id.au>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, joel@jms.id.au
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 12 Apr 2017 13:47:14 +0930
In-Reply-To: <1491970386.3829.5.camel@aj.id.au>
References: <1491961541-10864-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1491961541-10864-3-git-send-email-bradleyb@fuzziesquirrel.com>
 <1491970386.3829.5.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-7kQzPUmgnxSga9Q959yK"
X-Mailer: Evolution 3.22.3-0ubuntu0.1 
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
X-List-Received-Date: Wed, 12 Apr 2017 04:17:24 -0000


--=-7kQzPUmgnxSga9Q959yK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cc'ing the list as it got sent privately.

On Wed, 2017-04-12 at 13:43 +0930, Andrew Jeffery wrote:
> On Tue, 2017-04-11 at 21:45 -0400, Brad Bishop wrote:
> > Enable gpio-keys events for the checkstop and water/air cooled
> > gpios for use by applications on the Witherspoon system.
> >=20
> > > Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> >=20
> > ---
> > =C2=A0arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 17
> > +++++++++++++++++
> > =C2=A01 file changed, 17 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > index e3a7b77..dbf64f5 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > @@ -2,6 +2,7 @@
> > =C2=A0
> > =C2=A0#include "aspeed-g5.dtsi"
> > =C2=A0#include <dt-bindings/gpio/aspeed-gpio.h>
> > +#include <dt-bindings/input/input.h>
> > =C2=A0
> > =C2=A0/ {
> > > =C2=A0	model =3D "Witherspoon BMC";
> >=20
> > @@ -31,6 +32,22 @@
> > > =C2=A0		};
> > > =C2=A0	};
> >=20
> > =C2=A0
> > > +	gpio-keys {
> > > +		compatible =3D "gpio-keys";
> >=20
> > +
> > > +		air-water {
> > > +			label =3D "air-water";
> > > +			gpios =3D <&gpio ASPEED_GPIO(B, 5)
> > > GPIO_ACTIVE_LOW>;
> >=20
> > +			linux,code =3D <KEY_1>;
>=20
> What do you think of the idea of using the GPIO index instead of
> linearly assigning keycodes as needed? So:
>=20
> 			linux,code =3D <ASPEED_GPIO(B, 5)>;
>=20
> That way at least the assignment isn't completely arbitrary.
>=20
> Andrew
--=-7kQzPUmgnxSga9Q959yK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJY7apKAAoJEJ0dnzgO5LT55gkQAJzoU6yh7BiOmZ/vqyTT1AD3
cSdBNXaISbCd1s8OZYCjBAHr+RsBcEGwdM7fOwoAhCOgT8GcJ4dsESaO9bDmhxlH
DAA8JPjvaSSZc/S6dHB+lsBBGFSd57wWc1lX2mSiNrgX/0+EccSfrQlWacHOqhE8
FMUmDN0PZ0sTVbY01+0zG8cXNtcju+BMfAIno0tnVmrdSs1UXLQ1YNsbkBVuUrHi
wZgdeJX0vWBGiHsgL7z88wVbKb8t97CkvEi9P9Ny2Nw8znKsRIK77bQYOZNCd90J
YcQrHuXxF6y1JNS4OYhkeFNG/SpZWk45kUEso0vj1Q26BeoePxNwnB1NmRbfOWre
BkNc4YLIccuAwuJAeXoN/WnRMlC+zdd+DXCWKNvxs1rodOXnzR2eEoWkoc+igJvZ
X12n6dhdsQT2M7j70+TrAjRIu5AYQqmvQEDvWmQaviDKB8SO8rIOiN+aKfS71fkf
ezvD4x+HcYw2/+3+a+LcjTLJE22puyvo6Td7YGCQPdQTyuHmZxnXPWY7ZqdzLyV7
Ac56Z5JX18TAgYah9sy/tSlifrDwZtD0W8BJkpwXkuC2/BpwgzMH1HTebJ7ptIle
gG010FEiJ8sc6Rn9SG16/T1jBVRmZat9SnejpFW7PDvkuMNURyRh7lFjePX5yB3g
h8mmWyTz/z5x37TNDdtN
=tUcg
-----END PGP SIGNATURE-----

--=-7kQzPUmgnxSga9Q959yK--
