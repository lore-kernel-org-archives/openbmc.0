Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdRCS0mSgzDsTW
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 12:14:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=RaXFXMHz; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=BBhmVcw3; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 723CB20549;
 Mon, 19 Sep 2016 22:14:21 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 19 Sep 2016 22:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=njJts
 Mdk0bwgIr4QVoGl7wo7DHI=; b=RaXFXMHzarxqubMHvIAYDGJB2Ko9s07DOY+Iy
 XHxM+TgmMBJKP4s6HOfpPhXybdx3kiKTXA4iG0QmB715IqyvH3vWgsVdy53wbnna
 mfr5LSp74PJ/L/z9GK5cJl/+drGqg13xZpbpF519Cn0iruDjt8L6z4QuUyyHvG66
 C/vezc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=njJtsMdk0bwgIr4QVoGl7wo7DHI=; b=BBhmV
 cw3lA0t1ShHaiZz/T4eEfbMMsBqC9Xlamkfr3Dm9N1r9ylNBFFFzux5UBLT1UJNC
 2lUiYWq7JFEb2Zv267RSvtzMoowJVok2eSA16WXE4qXtSjaztiTPqZdlw+jY1ZDb
 iX0lN3/MfRht8L5YOdVpHmCW/7U7B5jkCwtzBQ=
X-Sasl-enc: 3nUq+zRiaDgypkwHVmXX6bMtcW+hrkmQmIszqI5nlIkN 1474337660
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 220F1CCE96;
 Mon, 19 Sep 2016 22:14:18 -0400 (EDT)
Message-ID: <1474337647.13249.76.camel@aj.id.au>
Subject: Re: [PATCH 03/19] Ensure that the old style MDIO interface is active
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: openbmc@lists.ozlabs.org
Date: Tue, 20 Sep 2016 11:44:07 +0930
In-Reply-To: <57E09533.9020702@raptorengineeringinc.com>
References: <1035223108.1714.1474325416863.JavaMail.zimbra@raptorengineeringinc.com>
 <1474331367.13249.72.camel@aj.id.au>
 <57E09533.9020702@raptorengineeringinc.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-6ZgXpuipXejPQPwrwfeo"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Tue, 20 Sep 2016 02:14:29 -0000


--=-6ZgXpuipXejPQPwrwfeo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-09-19 at 20:47 -0500, Timothy Pearson wrote:
> > Separately, I had some questions on the v1 of the patch. Can you
> > pleaserespond to those?
>=20
> Sure!=C2=A0 From a high level, this driver does not support anything othe=
r
> than the old-style MDIO interface.=C2=A0 The hardware sets the new-style
> bit
> when support is available, so the driver itself should be able to
> determine which style of interface to use at runtime (in theory).

Yes, so if we continue down this road we can remove the hack in the
board file for the ast2500 evb. I guess that can be a separate patch
dependent on this series. Then if/when we add support to the driver for
the new MDIO interface we can add a new compatible string.

Andrew
--=-6ZgXpuipXejPQPwrwfeo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX4JtvAAoJEJ0dnzgO5LT5jzIP/3/tNOCTFth18kt+QjzWIR0j
fDzJbrwPgk+TuXXnSl/yE/AN1bmMN671yWo7407TH7ZKUNc1fQxsjHqubmSON+OP
MbkVXPoVHpe7SjdQ/mX6WYB4l5L2zZO3ZvYP2VdCr1Z2dqUKMLk5zgBA3wYwqDId
4BnhtEqB1L5HArrd810VM6jykV50bdoY8LfMYs4S3HiSc3Yp7HZVmbcnYZXThyxq
qJX5I9AL4fLH4tXSpT4+TWMJ7vKx1jR8aBXjCxmO3ORfuDDPgkd8ChNm5Ufb9r3Y
78LvUuL+tXmgaObQXoVFJk8twdfGa9GmxpskS6g/mxkbgg2Z5eOe42Vt+D/dbdxp
i1lJw+49vWvD44/lKtt/dDBYtDgemEw+8Q5f8juxwN/EwkdZKs7SH80WaRU/xC3J
dKjmb4or+BqO/Mxox0bljB2EE56B6RqvewnXgJ1h+mF60Wv55Zm7BcHzp2I6QdtL
LW3oCzVBPu67UGaeab2X/Xy2rkbUj3o2rJcFYqHk2/BO6uNqz1csUczzHm2cFoYt
iuk+1GqdFYlQuq/ARrfd1XB+DSUHXkji/4zQqx1Wsv/TgV3LOBxB4RLxCtyNvh1m
nPosulWqZNuIFBA6EH+Q/sezFyk+2E0GL3nGZAW9P9tI25sehTSeX91RJCfXzf5k
0SQYRHuj0GTZjwhBfJAN
=nrIQ
-----END PGP SIGNATURE-----

--=-6ZgXpuipXejPQPwrwfeo--
