Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMd1K0yTPzDvfn
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 16:48:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="B/Ec2yI2"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NbYpAF9v"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 613E820565;
 Mon, 21 Nov 2016 00:48:01 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 00:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=exG69S5mNi7RVyKh+hkTZIMGtXk=; b=B/Ec2y
 I2A8SdFhL/ozK0Wyc/3hMx64BmQwRw5YvH3xItrgG10q+c0kYWJomhdALQnalYaO
 QDNNnFDJhb1LiM7rdtKzEzJ+UkFEjRFKnGK10dHa8y4UFvV4UUiFu64PUwg7l8Iv
 zeHr3EYoOGNYdhQqNlDnuI37VlVmQVSaCfJHA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=exG69S5mNi7RVy
 Kh+hkTZIMGtXk=; b=NbYpAF9vYvSHhCCgZOy+Lgr2yKSsvtrKRTPi4lmT6UvrZJ
 DaA1dm5C3eXv3dI4zaMneNl3G5/M0UWSIV/9ryU0vlgAaxWIsMyyd88mKU1aXWqR
 8g2rqJFscfCYJgP1k1O749ZOSpODG6NUEg4T8RF5F2H1crF4uNMbyXe8vAMOo=
X-ME-Sender: <xms:kYoyWKIy0HRytJ9AJk2Uaf-ZYfTnxBElfLfK8cCV3c5lNCKWH_UQnA>
X-Sasl-enc: bGdG9u+Mhm83hMBTelCmjDVSGjAxDSJ72everVyE31Xq 1479707280
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8484024754;
 Mon, 21 Nov 2016 00:47:58 -0500 (EST)
Message-ID: <1479707274.5215.19.camel@aj.id.au>
Subject: Re: Fw: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
From: Andrew Jeffery <andrew@aj.id.au>
To: Christopher Bostic <christopher.lee.bostic@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Jeremy Kerr
 <jk@ozlabs.org>, xxpetri@de.ibm.com, zahrens@us.ibm.com
Date: Mon, 21 Nov 2016 16:17:54 +1030
In-Reply-To: <CAA0LjjXej1XQ=voNfX_=5YL21bgjf73WK-UE=OgBcb=Pt=aKhg@mail.gmail.com>
References: <OF6A1A7417.88F14B99-ON0025806F.004E9A7D-8625806F.004EA327@notes.na.collabserv.com>
 <CAA0LjjXej1XQ=voNfX_=5YL21bgjf73WK-UE=OgBcb=Pt=aKhg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-WDRIkeTr6MQNCBLLQ5NZ"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Mon, 21 Nov 2016 05:48:06 -0000


--=-WDRIkeTr6MQNCBLLQ5NZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

>=20
> Hi Andrew,
>=20
> I notice Pin H6 is in your list assigned as a gpio-hog.=C2=A0=C2=A0=C2=A0=
This is a
> pin I use for the voltage direction control via the translator for
> openFSI.=C2=A0=C2=A0Not familiar with the history here but is that pin be=
ing
> used for other purposes or is required to be flagged as a gpio-hog?

Ultimately none of these should be hogged. This was just a brain-dead
way to get the GPIOs in a state that can boot a Palmetto host. There
was a time where several issues including wrong GPIO state prevented
OpenBMC from booting a Palmetto host for a month or so, hence this
patch.

Happy to drop the H6 hog if we still boot okay. I'm still waiting for
Joel to weigh in on whether he wants to take it.


> Currently I'm attempting to grab a descriptor for this without that
> requirement.

Have you been testing on a Palmetto using an OpenBMC build? If so the
request should still fail as the patch is applied in the OpenBMC kernel
build. All I'm proposing here is we move it from OpenBMC into the
Aspeed kernel tree.

Andrew

>=20
> Thanks,
> Chris
>=20
>=20
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > index 21619fd8cd8d..5c689613e5bd 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > @@ -167,6 +167,133 @@
> > output-low;
> > line-name =3D "func_mode2";
> > };
> > +
> > + pin_gpio_a0 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
> > + input;
> > + line-name =3D "A0";
> > + };
> > +
> > + pin_gpio_a1 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
> > + output-high;
> > + line-name =3D "A1";
> > + };
> > +
> > + pin_gpio_b1 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
> > + output-high;
> > + line-name =3D "B1";
> > + };
> > +
> > + pin_gpio_b2 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> > + output-high;
> > + line-name =3D "B2";
> > + };
> > +
> > + pin_gpio_b7 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(B, 7) GPIO_ACTIVE_HIGH>;
> > + output-high;
> > + line-name =3D "B7";
> > + };
> > +
> > + pin_gpio_d1 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
> > + output-high;
> > + line-name =3D "D1";
> > + };
> > +
> > + pin_gpio_f1 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(F, 1) GPIO_ACTIVE_HIGH>;
> > + input;
> > + line-name =3D "F1";
> > + };
> > +
> > + pin_gpio_f4 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
> > + input;
> > + line-name =3D "F4";
> > + };
> > +
> > + pin_gpio_f5 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(F, 5) GPIO_ACTIVE_HIGH>;
> > + input;
> > + line-name =3D "F5";
> > + };
> > +
> > + pin_gpio_f7 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(F, 7) GPIO_ACTIVE_HIGH>;
> > + output-high;
> > + line-name =3D "F7";
> > + };
> > +
> > + pin_gpio_g3 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
> > + output-high;
> > + line-name =3D "G3";
> > + };
> > +
> > + pin_gpio_g4 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>;
> > + input;
> > + line-name =3D "G4";
> > + };
> > +
> > + pin_gpio_g5 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
> > + input;
> > + line-name =3D "G5";
> > + };
> > +
> > + pin_gpio_h0 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
> > + input;
> > + line-name =3D "H0";
> > + };
> > +
> > + pin_gpio_h1 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
> > + input;
> > + line-name =3D "H1";
> > + };
> > +
> > + pin_gpio_h2 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> > + output-high;
> > + line-name =3D "H2";
> > + };
> > +
> > + pin_gpio_h6 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
> > + output-high;
> > + line-name =3D "H6";
> > + };
> > +
> > + pin_gpio_h7 {
> > + gpio-hog;
> > + gpios =3D <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
> > + output-high;
> > + line-name =3D "H7";
> > + };
> > +
> > };
> >=20
> > &vuart {
> > --
> > 2.7.4
> >=20
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> >=20
> >=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
--=-WDRIkeTr6MQNCBLLQ5NZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMoqKAAoJEJ0dnzgO5LT5Qm8P/2e9WTi2LzQ5u3cXYbo171Ci
gBbkCYA3LncY4BTEYHWmaTp58BCstscECjPv3YjtdBhzo1Se7BelqyzDA9yCuk27
6ZeHnzLn93UNVyRcvxA+vsnAYV/U3kQGQ1EHfw97Mv80XEN3DKgnr6x/tZgOQO1X
FgNYf0Z8GoLYhpWJ3JNDhejwhCl2YlesZhIavzIooVn8CnJ7wchuqgm108xqQpwF
dfjK2KZGLC5m170t8/DrI+4poxW4ljVScQUHLDuSM7nAoYjPIeY1SBRY1qkknZUO
4KQ8Iab9zCMSqIuigvcZilsROf/+nn4mJ6n8unAjfc99gKBFSdKLUlI+4uPRZG2w
JHZai2J/sLW08CCOzwThNqGrZa6zuV6iy+sUkfauoSvGU16Lus67ognRUsQcjU3U
i6bpV4ctfX5PIl9FUGVNi+6qQhPJ8I2mWSomaFd8aMDbWBr4tytaOOKTF8WplF89
liu3PygioUjW2kxWZJRmJpf8FOp2fs51e74uxIUyg+pXiAH51KFxSwJQlFzpxwUi
Blb28s6zs+jSPaPuCJL21TKwrTBlEr8rc1HNLg5YtDXUQCnfDkmUeazOv+00Thdn
LFXXwts+QjuBiecFjeHJIf1Jd544Zun7xVA6Iuf9T00MFYKNCVnaYEI1IJHeQJXJ
eqF47lDMiMrI/dqbm2oh
=y3ds
-----END PGP SIGNATURE-----

--=-WDRIkeTr6MQNCBLLQ5NZ--
