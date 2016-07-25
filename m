Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ryNFc16ZnzDqZq
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jul 2016 10:59:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=GIJ1pTm3; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=U3z7kBRk; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2A52BA30;
 Sun, 24 Jul 2016 20:59:45 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Sun, 24 Jul 2016 20:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=qgAXP
 Ao/F6wxQf0xIKWXOK5pVTM=; b=GIJ1pTm3vopw7wu2uDvHljdT3w/sTvFOewqxE
 +ouyiK3PbsoB1kk+ROI171OKYBWRpoff2YEc7BvH25q1u730BPFlHQu3yjpbKgMI
 6WBE1yLbJRwMlBp2aHIf5WGjp98Ws9vyXPipUZ0VaZpgPYp/1fC+EKLJb7DozSZO
 ANzjd4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=qgAXPAo/F6wxQf0xIKWXOK5pVTM=; b=U3z7k
 BRk9OTeVn5v0ydz/jJFHWVPPy4I8B42zIvBvSo2P50ZkQmM4UMewtl8m+ew03kfG
 b2Isr24QCSScSroSmF3ElAu83naI2sdcfl6l5xyvXw97TSnGBu2g/CHy3cj0Md34
 Y+OWXcMb6+V6nrcuO+MLhu8ckxad5AUMKrIjro=
X-Sasl-enc: ydhsMx8hTcrU5Oq5t7atTFfjlFwi00OZz/BgZHOXkO8M 1469408383
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1D717F29F5;
 Sun, 24 Jul 2016 20:59:42 -0400 (EDT)
Message-ID: <1469408379.5468.33.camel@aj.id.au>
Subject: Re: Aspeed 2500 EVB i2c transaction time out
From: Andrew Jeffery <andrew@aj.id.au>
To: Shay Slobodkin <shays@mellanox.com>, Joel Stanley <joel@jms.id.au>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Mon, 25 Jul 2016 10:29:39 +0930
In-Reply-To: <DB4PR05MB0941D946BC03E134592BCA21D50C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB0941FC06CBEC427C99A40C80D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <CACPK8Xf-jSXs=EcF3tQrC7xeFkKXOhXxPxz=6pBQ9408-uhcHA@mail.gmail.com>
 <DB4PR05MB0941D946BC03E134592BCA21D50C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-aVvJxoSS5d3iDnXV9n5E"
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
X-List-Received-Date: Mon, 25 Jul 2016 00:59:49 -0000


--=-aVvJxoSS5d3iDnXV9n5E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shay,

On Sun, 2016-07-24 at 11:45 +0000, Shay Slobodkin wrote:
> >=20
> > -----Original Message-----
> > From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of Joe=
l
> > Stanley
> > Sent: Thursday, July 21, 2016 7:36 PM
> > To: Shay Slobodkin <shays@mellanox.com>
> > Cc: openbmc@lists.ozlabs.org
> > Subject: Re: Aspeed 2500 EVB i2c transaction time out
> Hello Joel,
>=20
> Thanks for your answer.
> Until we merge from remote the new kernel trees you will push, I was wond=
ering why in aspeed.c for EVB we have the below mapping (there is no i2c bu=
s here):=C2=A0

"no i2c bus here"? if you mean at 1e6e2000 you are right - it's the
base address of the SCU. In this case it's telling the pinctrl
subsystem which pin-controller should be used to affect the mux
configuration request. Otherwise, there are 14 I2C buses, so 3, 4 and 9
are valid.

> static struct pinctrl_map ast2500_mapping[] __initdata =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PIN_MAP_MUX_GROUP_DEFAULT=
("i2c-8", "1e6e2000.pinmux", NULL, "I2C9"),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PIN_MAP_MUX_GROUP_DEFAULT=
("i2c-3", "1e6e2000.pinmux", NULL, "I2C4"),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PIN_MAP_MUX_GROUP_DEFAULT=
("i2c-2", "1e6e2000.pinmux", NULL, "I2C3"), };
>=20
> While for Palmetto, we have the below set (with no shift like in EVB: i2c=
-x - I2C(x+1))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PIN_MAP_MUX_GROUP_DEFAULT=
("i2c-3", "1e6e2000.pinmux", NULL, "I2C3"),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PIN_MAP_MUX_GROUP_DEFAULT=
("i2c-4", "1e6e2000.pinmux", NULL, "I2C4"),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PIN_MAP_MUX_GROUP_DEFAULT=
("i2c-5", "1e6e2000.pinmux", NULL, "I2C5"),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PIN_MAP_MUX_GROUP_DEFAULT=
("i2c-6", "1e6e2000.pinmux", NULL, "I2C6"),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PIN_MAP_MUX_GROUP_DEFAULT=
("i2c-7", "1e6e2000.pinmux", NULL, "I2C7"),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PIN_MAP_MUX_GROUP_DEFAULT=
("i2c-8", "1e6e2000.pinmux", NULL, "I2C8"),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PIN_MAP_MUX_GROUP_DEFAULT=
("i2c-8", "1e6e2000.pinmux", NULL, "I2C9"),
>=20
> Maybe understanding this could be of some more assistance for us.

Looks like there is a bug with the palmetto configuration; the I2Cx
strings are the values from the datasheet and are 1 indexed, while the
Linux devices are 0 indexed, and so they should be offset.

It's unfortunate that this made it into the openbmc/linux trees. The
patches were very much half-baked and we were using them for an
internal bring-up on an ast2500; we weren't paying enough attention to
the ast2400 configuration and this has slipped through.

I've mentioned to Joel the idea of backing out the bad pinctrl patches.
Some were reverted recently, though they removed the GPIO driver hooks
and not the mux group macros above.

Cheers,

Andrew

PS: if you are interested in testing the most recent pinctrl patches
they are available at [1]. However, they're based on upstream and so
will need a bit of massaging to integrate them with the openbmc/linux
kernel, for instance adding the I2C mux requests to the I2C devicetree
nodes.

[1]=C2=A0https://github.com/amboar/linux/commits/aspeed-pinctrl-4.7-rc7
--=-aVvJxoSS5d3iDnXV9n5E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXlWR7AAoJEJ0dnzgO5LT5RhcP/33qRYWalQ26h6/9wadp620o
3TaGsbmLYLw4uAvde/BWhm2SS6Zwt6UM5TP945zXwtz4cu4GoBhuVdMUZv5x/2Bc
55c1HLRNLmNygMr4dkC5zYwDzqS+tQHjOsy4l4mcyPOfZLiRB619NixyodP9v6Lv
kSo01cSzrboo3cLLF1tHsRFb/JGWeN9WOosAXxqzIGIj6ab3SGs0HGQIx1LDubDi
3i9GDFvuLrfmfx8BfpPGEojP50As02Q5ajpJAZab0KVG34YhmTM8x6yhgy8D3Asq
6T/3BfISJn2LbGV/3RsaXWFlY16QV6axYQ5AXMPTSpbzXzDVWcL/vrXnWKHVmFKE
Ip2z93NOAqQmjSxiruyi3oENajhpvfMsM5sjfpS0tCjRfwiJFTdlKxqVpdTFUkkr
ijv20FhNhZd2OHo4OWxh5WJtOjVshgJQvBIy2787X/V4O3v3PXwfWtopkjbMaKkj
GYIwWk1FP8DDzbmi3y4Bh7kh0EjtU3bUyjGAiaC653Qk8jJgi1yrPcu7rsxc4XVs
/VODe8fUF7YOAdaB7QiXEZixal9hzlnkQMV/EMC7WTI4bSJXGjba/8mInpu+CZUu
EeY9KQlgm+JKQ2odBzj73zha2EBQ0EgoEzje0lVAVzHoDO/rhmWu/qG7juzBdkHF
2UNG0CBBpOqW14J50GL/
=udgf
-----END PGP SIGNATURE-----

--=-aVvJxoSS5d3iDnXV9n5E--
