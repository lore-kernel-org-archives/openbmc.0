Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LYqP3cN+"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fTD37smK"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVJgG3CGpzDr0j
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 16:56:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 67CDA20B7E;
 Mon, 29 Jan 2018 00:56:53 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 29 Jan 2018 00:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=5R7Wr88pq2Ogb9sPxpwuxwv/6PsL4Q2ZXgkf7OhqAfQ=; b=LYqP3cN+
 72UmZoxpj0+6sbMgnH9HbTRMaHtSsBRimK5OkLWFIrCjGK2epbORpCocS4T0dEPx
 /urI91NCAE5t6XSFoHR0pM2vkLBVf0MtKulYjL46P0iveRqd61q3RvD4SiYWb+xg
 r7FcZ6y/58AOtmePcV9rRzTc7l8cxS64Q/sktA9rGdRQu5apiDhw5AMjq3FZTCdx
 ghBQMSl86reWYNV+5cluOuXyegdqeRpY7qxDL7T8znUjxCTBa3BghsmTjiwcxeem
 GfRbt7Iy5oFHgwgQfcMPvdRcOlkvuKXTjM/RF44hm4A89M+2ECo7OOSZ0Y4nmIly
 kyZHqWBYBo9oiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=5R7Wr88pq2Ogb9sPxpwuxwv/6PsL4
 Q2ZXgkf7OhqAfQ=; b=fTD37smK4eINLpsH5zu1/8EVKk6yb8ZGwAY6nqcmC8s15
 wjrGQKqmJXO8zCkIZmg05XGhUvgpjMGJ/2s5KFeJoPWbd+OW8Al+kE2klywIKRVA
 ncdb/jSYHW+fFkXk2vdkaUteNrXvqHHWD/tHbGf8W3WQEehP261/jw0CVi7sH8YD
 gzsSVs6nOXGypQ1/WcOLFYI9tPLKqpXokhQaZdXhLA3ddm93xYsOEhtaWKA+L514
 7XsYLjVqup/RXMFEszpVG8yGflB7Yy4wwqcJDPAQjUirXS8VEMkl2pheUxZOjYRX
 iIAOeJFCerQYEsRg4RMN/8Np/sz3INePDI6MSOaWg==
X-ME-Sender: <xms:pbduWni6in8GZ6-vmczPyN4oebEGSpv-NLrJtIDyp81DgB3eLPeumg>
Received: from dave (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 341E324235;
 Mon, 29 Jan 2018 00:56:51 -0500 (EST)
Message-ID: <1517205405.21006.5.camel@aj.id.au>
Subject: Re: BMC Image Signing Proposal
From: Andrew Jeffery <andrew@aj.id.au>
To: anoo <anoo@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Mon, 29 Jan 2018 16:26:45 +1030
In-Reply-To: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-LAR8DZm1Iqu18Xfpv3A2"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 05:57:00 -0000


--=-LAR8DZm1Iqu18Xfpv3A2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-25 at 15:15 -0600, anoo wrote:
> Hi all,
>=20
> During the hackaton meetup, we touched on BMC image verification and=20
> signing and concluded that the community would like to see two=20
> verification steps, one prior to writing the image to flash (via digital=
=20
> signature verification), and another one by checking FIT in U-Boot prior=
=20
> to booting from the new image.
>=20
> The proposal would be to implement the digital signature verification=20
> first.
>=20
> At a high level, during the build:
> * A SHA-256 hash would be calculated over tbd files that make up the=20
> firmware image.
> * The hash would be signed by a private key that's part of the=20
> repository (community key). Companies could overwrite it with their own=
=20
> private key when building production images.
> * The encrypted hash (digital signature) and corresponding public key=20
> would be added to the firmware image.
> * Yocto may already provide a way to sign images and generate keys.

I'm starting to look into signing of artefacts as part of the build
process. Some quick searching suggests Yocto doesn't have support for
it out of the box, but there is the swupdate project[1] and the
corresponding meta-swupdate[2] Yocto layer that sound interesting.
However, it may require a rework of how we manage image updates if we
were to make use of it. I'll keep poking around, but if anyone has any
other pointers please let me know.

[1] https://github.com/sbabic/swupdate
[2] https://github.com/sbabic/meta-swupdate

>=20
> On the BMC:
> * The hash would be calculated on the image files that were uploaded to=
=20
> the BMC.
> * The signature would be decrypted using an existing public key on the=
=20
> BMC (this validates the new public key delivered with the image is also=
=20
> valid).
> * Accept image if both values are the same.
>=20
> Any thoughts or comments?

Can you take a look at swupdate and reply with your thoughts?

Cheers,

Andrew
--=-LAR8DZm1Iqu18Xfpv3A2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJabredAAoJEJ0dnzgO5LT5dfEP/j+aElSfY0nQDiqqiBG5hd9P
N8WOWqTGh1kj0z07jwgO3XoYV4zPrXet8bVVsbfnwv6tEeZASyGqnHej8uesT/2Q
LZtLzHV6peJD1cUy4apSUTEKynIDdj5su91AnLXOwAzzvdHykyW2iZHP4ugZjcVA
SfxixJxavcslhPzaAMrgtUscNxpXaAWKAffR11+j+2tAJ/v+1bmbxIDE0P81K8M9
GevwDrWXAvfqMHt4z5Dc24/PO3rTURhlS2wsin3FV+kc2V6xs/BW08YQ4799/oJx
DSkqJ13qR4fwTWXWHz2BImvOars3JS3COOJ+aJqx+zw6IbMf4kdrMUAYya56Zfx2
+mUMwLqbCfpo5hg0OQNQ/qWumNYkNVcprtoZk7Y1VdyGg4DZGtcur0Fcc9kBbOk0
b8UkbzptruBWSBdEMSTghlWmwSVttwZX1Fnsmp6xriGT5iWDoyr1RUp+KlYT9o8a
9CgvTb4GlIdCAvfjEjDKvggRwDnDZHQm8kkpZfrcXKHtCF+QPm5ziCN0EtgdQxzT
KWSKCrshNTd8LuMFzr/YVXROPv1zJQyl3IPq1vrEcFhje7eYKgWsqLLzw6L/La4F
hhWXGkWJo/36kwCMkEZ4FJq8GjIUSaT6h8IoakiOjm9myQrwA6GHMvudD0+/DR9U
jzrbYfE+8Hd/pJkfHyBQ
=z1/e
-----END PGP SIGNATURE-----

--=-LAR8DZm1Iqu18Xfpv3A2--
