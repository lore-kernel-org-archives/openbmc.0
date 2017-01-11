Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyrsY3DzfzDq5s
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 12:29:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dFauBmbT"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Mm3Ey+Wv"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D17E20811;
 Tue, 10 Jan 2017 20:29:35 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 10 Jan 2017 20:29:35 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=BtJQsFC7ClIpy4lGBjxRJyzUULk=; b=dFauBm
 bT0eAuh2Ms6tfJtg+8QDsikx8otWIKGmysn84ZV+IAoEylTefmO38K5VZSZ4SNA+
 WuVFEkYM6+W5rhGmUKorpNqZd1cJVzDGrX8l2nwzjUxCYPScD2C0SBVBkkMjYniN
 z966NOo6/Nt9Yci9gMIPlZi+LrAbwV4fVjNFQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=BtJQsFC7ClIpy4
 lGBjxRJyzUULk=; b=Mm3Ey+Wv01x/2hMPUPVUSQhJkoO8jujp/zII+B25+/gA6+
 aMCxWOHbsNOtoofE4jVIFoSfWoKm0DM8gu2abJ7zZKKDWHmwoY7HeNLnBIETB7sJ
 X19stOfY+alfcbtzfVeQCuy3RN1ffxI3mIXleVdwSFV4i61Z2bLA8139ILiA4=
X-ME-Sender: <xms:f4p1WJ9xqioD5O-Im82RXQPLvyv1VHe1-1G2OZF2I0CFGFLl_qDgpw>
X-Sasl-enc: HI+PWQ3mbr/BDM+QaEbBFaDqh2pxuNA+abmwZBUnvEzV 1484098174
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id B90B124242;
 Tue, 10 Jan 2017 20:29:33 -0500 (EST)
Message-ID: <1484098170.12800.15.camel@aj.id.au>
Subject: Re: [PATCH v3 2/5] Documentation: dt: misc: Add Aspeed ast2400/2500
 LPC Control bindings
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Date: Wed, 11 Jan 2017 11:59:30 +1030
In-Reply-To: <20170110090640.12608-3-cyrilbur@gmail.com>
References: <20170110090640.12608-1-cyrilbur@gmail.com>
 <20170110090640.12608-3-cyrilbur@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-0npl6UMKrEnSdJeHvTMk"
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
X-List-Received-Date: Wed, 11 Jan 2017 01:29:37 -0000


--=-0npl6UMKrEnSdJeHvTMk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-01-10 at 20:06 +1100, Cyril Bur wrote:
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
> @@ -0,0 +1,78 @@
> +ASpeed LPC Control
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +This binding defines the LPC control for ASpeed SoCs. Portitions of

Typo here ('Portions'), but otherwise the bindings look okay.

> +the LPC bus can be access by other processors on the system, address
> +ranges on the bus can map accesses from another processor to regions
> +of the ASpeed SoC memory space.
--=-0npl6UMKrEnSdJeHvTMk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYdYp6AAoJEJ0dnzgO5LT5rbYQAJ7Ual26+cBcOSgRp42Jg+ie
j2XXDBCVJrMiz4SLeJIVqx/4P9+ZZPwj0nr/9vNMgEZZIRuaSY5XE9xtvwKbh3n4
ZrOE7ZzHT6km2o4dyo5tx4VrGqRf1EwnSQAG1GO6EmmvIfGb9EWUZkC1sd7DD42h
fx2dbNUK2Y3GGQg/nJHb/dntxJZp97WHp+oyhNTfZfmN78qvnzsE6M5TXhLghldV
an3O80prYJbGEpaeVSdz+Iz75x3+MS9G50HlDB7VLDym4SDd60gLwd1ciZurjm5L
8vHgJPqF7koYifS8BhtOk+mx0DLF42audUTA4AW3y5EG2KYIVSjVIwF3WXLm3DQT
ydaWaDlzBif7LcKJYBvFXmZl8X2aW7Xf8+317R1FM6NnCX1ruq/NwwvYl+WSoovC
Q7qmT4D15UOQ6hwBwN4Ey/v9YOLZp1LUGxJbGkt12onk8mQ1NiGH/yj22wPI0LVX
ktYFrapIOnxDjGnuNVQDFDEZgzfhX2cOe9+Mw+znu7cigp8rnaKn9d6YpwoNinUc
D3Ghaaj/zBT6xe8ms0+DNiLA/XIjUlJaItB/fJQYFYu19OVAnOg/Rr4f1xV5SWRc
1Whfxi+UPyt4D+KXFzm7a6dR/n1I6xFo6qnQonU1CKdq/E+IDJ5jsWmZGC/1+bg/
z9/fe8tMsYk+3LP5BV6H
=YOnk
-----END PGP SIGNATURE-----

--=-0npl6UMKrEnSdJeHvTMk--
