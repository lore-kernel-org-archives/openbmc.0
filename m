Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x2MKB3pVbzDqkF
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jul 2017 10:32:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fnQHGUqp"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IenXQpk4"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E50F520A34;
 Tue,  4 Jul 2017 20:32:42 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 04 Jul 2017 20:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=nqd8XhpEZekgJ4OyV2jMUfDkYs+gJOHOrtgXp1zN0
 Lk=; b=fnQHGUqpQsmifVoas7MpK15K4mAdk3d5GDVDXlZlpUI9WXX6RPDJJq8jw
 rS6IJB4+TAsB4E7MaoCBPm/ZY9rJ/JtpWDQo1rERwrBp8Ra30yAoSFvhHx5niQhb
 sMGk6e9p5AWLGamOBMihft7XrFjt8wgCnLbHZTOiSriAtWl/sdytULEO2mLmhT3w
 bgk5oCe131h4Rt+1Q5FXm7SVyIb2yqvcNhNa5LQSvmDnR5YMp7ak6c4MgO1gJ5VT
 Db5X3TdcYusyzAVLwLUmZHTozgapnyM0e2qF9g5CF3pFF86t9hFhfJ608CvLvO6O
 1VblKR1jVK+M2zJB0M6HE56YgiE2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=nqd8XhpEZekgJ4OyV2
 jMUfDkYs+gJOHOrtgXp1zN0Lk=; b=IenXQpk4H+YJeYk4dSQcwDO6Py6hijO7EJ
 N7h0pnjPLW1qjdLClgXubJYhtfK1UEuWfSXtdtBA23y0wO/NT+b5v8bGJp/WspHQ
 cr6Q6eEOIuUJeCYfOI2zEoERY2L4iVf8+jaS5nL1CGDT503hLYZXWR6RuECHG3B1
 JJ/P3lxuG4jnmHe35B//plQpqPrE8xuG800TSCOACyZwHBHex7EmjTF3Bm1t+Lt3
 JqkWyklIWsVJubCLsTOuRPHmS9ycnzvJqFRE+JJFa8OjeSjUXi7NA0YawVykzkts
 WWXhxQQMtcvWmDZcyaOjKSfOm+moOSTNxzNTzvRgGNOQU7zZluxw==
X-ME-Sender: <xms:qjNcWUd0gqOrk3U7os7fWoONomsR4DMGlVS4JIY_KLTAfmylcYoP4w>
X-Sasl-enc: wZKAmlZ5Db+ADcAPN3nHi6LkjIdQkBLzZtZMOF1KJX64 1499214761
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0774424253;
 Tue,  4 Jul 2017 20:32:40 -0400 (EDT)
Message-ID: <1499214754.4935.1.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Set quality factor
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rick Altherr
 <raltherr@google.com>
Date: Wed, 05 Jul 2017 10:02:34 +0930
In-Reply-To: <CACPK8XfDNa_mUs=ARZMRVZWODnUQu3b8MQxZicyiTsEKzfVzYw@mail.gmail.com>
References: <20170704060528.17290-1-joel@jms.id.au>
 <1499163214.4990.1.camel@aj.id.au>
 <CACPK8XfDNa_mUs=ARZMRVZWODnUQu3b8MQxZicyiTsEKzfVzYw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-bHIZYBbNtSYwL8dv55J4"
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
X-List-Received-Date: Wed, 05 Jul 2017 00:32:48 -0000


--=-bHIZYBbNtSYwL8dv55J4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-07-04 at 21:51 +0930, Joel Stanley wrote:
>=20
>=20
> > On 4 Jul. 2017 19:43, "Andrew Jeffery" <andrew@aj.id.au> wrote:
> On Tue, 2017-07-04 at 15:35 +0930, Joel Stanley wrote:
> > From the timeriomem_rng bindings:
> >
> > =C2=A0quality: estimated number of bits of true entropy per 1024 bits r=
ead
> > =C2=A0from the rng.=C2=A0=C2=A0Defaults to zero which causes the kernel=
's default
> > =C2=A0quality to be used instead.=C2=A0=C2=A0Note that the default qual=
ity is usually
> > =C2=A0zero which disables using this rng to automatically fill the kern=
el's
> > =C2=A0entropy pool.
>=20
> This does not appear in the 4.12 kernel's bindings at
> Documentation/devicetree/bindings/rng/timeriomem_rng.txt, and doesn't
> appear in Ted T'so's dev branch[1].
>=20
> Where did you find this binding description?
>=20
> Herbet's tree. They will be in 4.13.

Okay, I found it here:

https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/t=
ree/Documentation/devicetree/bindings/rng/timeriomem_rng.txt

Looks like to be useful we need to cherry-pick https://patchwork.kernel
.org/patch/9741401/ as well. Were you planning to do that (as the patch
doesn't appear to be in dev-4.10 as of this morning), or is your intent
just to future-proof us for=C2=A0when the patch gets pulled in through
general progress?

Andrew

>=20
> Cheers,
>=20
> Joel
>=20
>=20
> Andrew
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tytso/random.git/tree=
/Documentation/devicetree/bindings/rng/timeriomem_rng.txt?h=3Ddev
>=20
> >
> > As to the recommended value for us to use:
> >
> > > > Rick Altherr <raltherr@google.com> wrote:
> > > Quality is #bit of entropy per 1000 bits read.=C2=A0=C2=A0100 is a
> > > conservative value that was suggested by those in the know.
> >
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > =C2=A0arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
> > =C2=A0arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
> > =C2=A02 files changed, 2 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspee=
d-g4.dtsi
> > index 9cc959fccfa0..470a6335399a 100644
> > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> > @@ -193,6 +193,7 @@
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =
=3D "timeriomem_rng";
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D <0x1e=
6e2078 0x4>;
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0period =3D <1=
>;
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quality =3D <100=
>;
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};
> > =C2=A0
> > > > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl: pinctrl@1e6e2000 {
> > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspee=
d-g5.dtsi
> > index 992242d3b22e..466b322951e1 100644
> > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > @@ -232,6 +232,7 @@
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D "timeriomem_rng";
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D <0x1e6e2078 0x4>;
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0period =3D <1>;
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quality =3D <100>;
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0};
> > =C2=A0
> > > > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0gfx: display@1e6e6000 {
>=20
--=-bHIZYBbNtSYwL8dv55J4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZXDOiAAoJEJ0dnzgO5LT5o/YP/34Wd7TtysSADgwNCfGWqe/7
8UIB5ozh2CAVBOaO71cpBsZvRVqAWsVGtTdoGPmWk/6CMQ5SRedtAMUYlQi3wHFk
081tfs7f6dqZhYgzt/Ue3qFtQ9w+MyLYP0TA5NIGarnIg15uzz95qjSnKTo446PE
SrlGwmaExrQUOPg+FtGsMYBlw1bsxaRd6EKZLnsNniazlQIVcXP4MBkJJgLWoceS
bq8ywViiu59xeNzstFqifTD+e6c9AVdQeWGNVEKfrGIUflT3IuRQzGsyLJPZcXjS
B2DEJ165XIGN+GORCNxkRodGRvUjY7xdXg2KOtpVhA+9VgnjGVyFQPBv+5IsQ3KA
nwwmwyOJesxLyN45TwLrLoN9NBZAntfhm1vsbIeZukUkJOZW3YYvb7Dd0UWO3mbl
FxziHHnWY2wH34ig3vPY+/XHf0s9pjQ7qDXxxNF/B/2YShv6bmsU+cuc31P9KfPP
jiYLW+8Z0CDgyyKQ1ovxo5rtSkGPKjb9qyfEZxeTaNxn7UIWELAgVkBsGvG9aCnL
VktkRGjJL3zbuTxhmjH+EJ2MkT50kg/C2fE+9uv8EfnqzZqDD5VmTuRWUOpkPTv3
eKS+Eo/kj+kQH+NDZHws0wiSRQKoOy1NEvMiV/4qztZioIhv5bBKw+t5I97pl3o6
pmEg/BhxQZ5+3FPu0wL9
=cTdg
-----END PGP SIGNATURE-----

--=-bHIZYBbNtSYwL8dv55J4--
