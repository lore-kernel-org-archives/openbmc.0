Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vC7bq6RgWzDq74
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 12:15:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="K8rKZHRb"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="T9IZrNWo"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D5E5320986;
 Mon, 30 Jan 2017 20:15:17 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 30 Jan 2017 20:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=+GcimluM3aHiHd5znOjYiFpuv7Q=; b=K8rKZH
 Rbn551PNIGoBcmCPDbDIMBawdR6AwPvLd5sRCq+mAYlzP1UqgEN8Km27cPn007HP
 PUTAQ5qz7TZvu2Whw+pnbjf1dp0ob2V9gphXsF2NIAdwxzAt+gxY7EbWzMw8We/t
 k3B/oewlJkeJgYHblQpgdxpjxB+jcEMJVva0M=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=+GcimluM3aHiHd
 5znOjYiFpuv7Q=; b=T9IZrNWoxV2JNGfIYkoVRGC5v+/JsjR/6beA+RvCEwuGwF
 pd/KVFmG4Up/5GX1dKkT5I8xfxWjgsas+vrZunbX92Gql6XWgela9a0b7G4+Lxp9
 Z/QgCgpGfJVLMWD51Ln2syp4TwBp80T127lw+G1qbvmGqROlxK6l4nTn++LWw=
X-ME-Sender: <xms:JeWPWElSBtZh6ZBkJvWiJhizT3BSy_G3zv7QiUnSATvrc4WVqIFZJw>
X-Sasl-enc: 6Gsm+S0JHZYha8CRm6TC0l2/DooryVTmfEJeQGevYU2S 1485825317
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 139D37E399;
 Mon, 30 Jan 2017 20:15:15 -0500 (EST)
Message-ID: <1485825312.4137.25.camel@aj.id.au>
Subject: Re: GPIO offsets used by userspace
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, OpenBMC <openbmc@lists.ozlabs.org>
Date: Tue, 31 Jan 2017 11:45:12 +1030
In-Reply-To: <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
References: <1485740080.4137.21.camel@aj.id.au>
 <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-hxcq31cHoM5/cjp6BW+n"
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
X-List-Received-Date: Tue, 31 Jan 2017 01:15:20 -0000


--=-hxcq31cHoM5/cjp6BW+n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-01-31 at 10:55 +1030, Joel Stanley wrote:
> > On Mon, Jan 30, 2017 at 12:04 PM, Andrew Jeffery <andrew@aj.id.au> wrot=
e:
> > Hi all,
> >=20
> > Just a heads up that when the linked patch is pulled into the OpenBMC
> > kernel it will break our userspace. We will need to synchronise the
> > kernel bump with the fixes for the machine configs to update the magic
> > GPIO offset number.
> >=20
> > https://lkml.org/lkml/2017/1/26/786
> >=20
> > The magic offset is essentially 512-(ngpios) (I don't know why, but
> > that's the behaviour), and this now varies between AST2400 and AST2500
> > systems due to the AST2500 having an extra bank, and also because the
> > AST2400 has a "hole" at the end of its GPIO number space.
>=20
> Can you suggest a way to detect this from userspace?

Not off the top of my head.

>=20
> Would using the chardev api make this easier?

To a degree. I'm not sure if named gpios are exposed by the sysfs
interface, but with the chardev API you can open the devices and
request a GPIO by name. If that fails and you have multiple devices, I
guess you can try the other gpiochips.

Andrew
--=-hxcq31cHoM5/cjp6BW+n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYj+UgAAoJEJ0dnzgO5LT5SiYP/3Uji9yV9IoMm8Ut0+JWeFeR
sntIuQ8zTUCeCf70j0yz7KIYj8gmCm1Z4KENZuVlWmHLGxRBNeCa56UwQLQ3DUoR
gt5RFXoTrV4nguojIyGSanKX2zfrBRJwPlWLR9mH1Hj/6AhB7yPR2yVWr5TlNVMg
OHKGHjspxBXW3qa/SaczGCzfMfEtkW81Nm5WH5O1pc2Vw2bWY9hL3DIXCPQ77TEv
5TK4D7WDvklj8jd6UaCsvItyyt9wzBuB9rBKAK4p3+9fVDJOEfsvqgXPfDmMOOhp
IOEftr92+ig362srXAuHGBgMNnQbuVTJ8nel9GOt0QT5p0tCloOFzw4BLZooPDRi
/XsEUaaQ77fEwGydHHalVguyBvPrJ8/Yp2y+0mtH3QW7Y2D7M4S5A8FY+w/+O/G/
B4EwklE0EwZS9Iv5yWzLUnhNy4Y0nXdBBlV/1aGQIOanq0bzyCT68rJtLfDl2CxR
OrqAirtCd5BSrX+OQB+YZSCsZ5Z0VXtn3+6AOHm4pu65v3eov5jA8QR96gvkmJFh
orFesREnIK7N4zdcYyWa5LoP25xSqWsAGPAeZjlYjWJlFuCuLxoLlqTq18oa095v
LaQOzvJ23hg9Bn5z/Jr2sULxvuiUPIBNQA0DWxAw1RLOQuHKKVmP4uqYovgQe5dO
bDRCDD5j8ksW5BhWW7Dl
=QfVc
-----END PGP SIGNATURE-----

--=-hxcq31cHoM5/cjp6BW+n--
