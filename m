Return-Path: <andrew@aj.id.au>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s2fv46cF6zDqQ4
 for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2016 10:13:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Ky7FKXNU; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=FdZmhJKc; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7451F2674;
 Sun, 31 Jul 2016 20:13:33 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Sun, 31 Jul 2016 20:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=1uzyZ
 lMHucy92Si6fbbwu+ScUDM=; b=Ky7FKXNUM1qL5J9pYzG72/jSO54M+VzKbM8ih
 opeU0CIZd8/VkSpDhd34OssTQytRaN8LjSLFE/bN24r4j/T1/Y9LNHodG18jPYXB
 qmI3d6kO/EclMOLoA6iMSscAoexlvl50wHoHWMHSSxMaxz3SbAbptlASgzZIkRgx
 7fbKL4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=1uzyZlMHucy92Si6fbbwu+ScUDM=; b=FdZmh
 JKc92TGjox05OFj6LnCyXIfqxSePM7P4uG9ck9qsQnWJXmuG7fnY1KmskU0L1jh3
 7riOL4hnhOFjFmEIAxmHd/WUotI5EGPb9aSNaLgx1Fjwecen2piqnct1+tNt7W7L
 gwgqqs/VHj9zfWjfXPOqu1N9KFpx4bX/r1sw60=
X-Sasl-enc: BcP9ZpWpFeiR/7j8VLCwqjfJEi+uAHXUQEcJkFyGauQS 1470010412
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 800AFCCD26;
 Sun, 31 Jul 2016 20:13:31 -0400 (EDT)
Message-ID: <1470010405.4428.3.camel@aj.id.au>
Subject: Re: Aspeed 2500 EVB i2c transaction time out
From: Andrew Jeffery <andrew@aj.id.au>
To: Shay Slobodkin <shays@mellanox.com>, Joel Stanley <joel@jms.id.au>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Mon, 01 Aug 2016 09:43:25 +0930
In-Reply-To: <DB4PR05MB0941D264C3F26B9F9378E78ED50F0@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <DB4PR05MB0941FC06CBEC427C99A40C80D5090@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <CACPK8Xf-jSXs=EcF3tQrC7xeFkKXOhXxPxz=6pBQ9408-uhcHA@mail.gmail.com>
 <DB4PR05MB0941D946BC03E134592BCA21D50C0@DB4PR05MB0941.eurprd05.prod.outlook.com>
 <1469408379.5468.33.camel@aj.id.au>
 <DB4PR05MB0941D264C3F26B9F9378E78ED50F0@DB4PR05MB0941.eurprd05.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4PnSHsyT4jb5WzrXPK3j"
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
X-List-Received-Date: Mon, 01 Aug 2016 00:13:38 -0000


--=-4PnSHsyT4jb5WzrXPK3j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shay,

On Wed, 2016-07-27 at 06:52 +0000, Shay Slobodkin wrote:
> > PS: if you are interested in testing the most recent pinctrl patches th=
ey are
> > available at [1]. However, they're based on upstream and so will need a=
 bit of
> > massaging to integrate them with the openbmc/linux kernel, for instance
> > adding the I2C mux requests to the I2C devicetree nodes.
> >=C2=A0
> > [1]=C2=A0https://github.com/amboar/linux/commits/aspeed-pinctrl-4.7-rc7
>=20
> Thank you. We tried to use this pinctrl, with no luck.
> Currently we are still using kernel 4.6 and we receive transaction time o=
ut for LM75.
> We are pending Joel's 4.7.3 when it is done.

Sorry for the distraction here, it was a bit of a long shot. Building
that branch without further patching probably would not have muxed what
you needed, but it also should not have had the bugs you pointed out. I
think Joel was intending to push out a branch to support the extra i2c
bus(es) you need. Joel?

Cheers,

Andrew
--=-4PnSHsyT4jb5WzrXPK3j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXnpQlAAoJEJ0dnzgO5LT5qT0P+gOMnMB3ivOClNmSEQAC9KbO
SwFOc/FUUXMD9Zz9zyBfrR85AOSbI5KBKTbiDEEj85x2zdM0ehkvdohn9tM+OK5a
oWsdBhrR+noEqbGQbU79SRrZo8mVJI6HLU65JQpJcWeTt2EabaLCIhT779lxGwaK
mQmoG/QMtyRtyZpnGrOXI8eeHKoaLTpEAN4rzUeRWvOtproskc1sadM8OJ0A4+jq
XqCGMQ7F6x+MpxQ2P3CRS4slgIwy1D1+GVCIJWrMbL2ApQlL7UasE+gzxtKPkaC7
rvt8FH3ZDVYPVcVK/WaJs8xhCmJUr+8H8I7nzbp9tudQqZ8GNyx35Xqgoenp6AkJ
0LuoZYMHh1bpvrZbslyc/JmGw09vYOFFqL0Kgqu9N5G/cYq7tVWB45rkCt0hYlx7
wOfT/S16uP7xS4wud06VvkKlETSfHgdVSiZwdqV79H0zWb4UzGwf5C96DoszOPfO
ZWfJ4KkuC3i4G1bTEMHa09jFuiRU4tereV/Et6NNEeVh2hHvCJxzu4f5QVdFLPoE
baogPT5fZ4pl/O8jSghhYsGwKh8UY+7d58lccdN7PKtlkiaSAjaK/hc5tEL4o/N9
yMRlvQ99DJA9ickZRT9iBmZhVN2YnZ+hIQdI0hb9Yr1dUETc/BVnKzL5OpwJ3eMq
y8swNNWytPSaYnWKAcbu
=6x20
-----END PGP SIGNATURE-----

--=-4PnSHsyT4jb5WzrXPK3j--
