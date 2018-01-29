Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jJk6okc/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="C2azFfJP"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVKQ32hRkzF0Px
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 17:30:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2EA0920A5D;
 Mon, 29 Jan 2018 01:30:31 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 29 Jan 2018 01:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TCkmKy13QX74BrslDnOyrP1vOKZiWycR+lkfSiUpUF0=; b=jJk6okc/
 2yr24RZwUaVLem1METcT/xFkqxW6ugh/5ZAX2bMs6Xd2S2l31WfGKGdehmHYIcUH
 SBFpSXxGG6wvjQUCb0PkxlHX4j9mtCvgKmEiCqonYd4mUAmJ2d79MXz3t3H4tOKQ
 n+ocIaDlUG+PVVXigZZJyl/fgAXFqLTzrGBh9au2CKbiLITmfWIgee+gAsbxV05o
 M6DZzwwgYvcWUNrFt4L6Y+JSzFvpQ+kZ1DUPQBPuXJQMDd5uatUkDhQfp8rG8KPh
 zuakfJ4JIBgvXGbh1ig1kGhwE50evdQ9ExCYVu3Qry4hySu92DDeknT0xUFg+6x6
 UkxMz9moL2cOuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=TCkmKy13QX74BrslDnOyrP1vOKZiW
 ycR+lkfSiUpUF0=; b=C2azFfJPHBSpEjhfqFgkhL/REViLBMi+3gSE/kZy0U2NM
 w70bkPl9oaV/oESrq5U+A9MjFuEnEmFfWx2nrZjn7EcJ0A1oYQOae/3BhoQseIuM
 TD8LynGddzkq5UKBHvJqGzzG2B1rBO4OTbJdh3yFmDdhUQzBw/2kByYFJXLfmXfi
 aVXS1Fga6lyCOu9Q0FH5zpd2D+NqDZ29DIJyoBbadUJGMtloNliZRQFk0qjeZo/I
 zA4hqSjK1OoFW9Eh8nmH9Q2pqk10OvSzna3bYAayC4/lP0y63cCfGA8endR2phkg
 1xlnXzNY/0cQ5NUstaYx4Ppht60iv9bOIGoXutThA==
X-ME-Sender: <xms:h79uWrWO0eyHjcqeen8t-4MP25WXcOBdg_phDvDu8XL8mfzjc3oikw>
Received: from dave (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF49A7E448;
 Mon, 29 Jan 2018 01:30:29 -0500 (EST)
Message-ID: <1517207425.21006.27.camel@aj.id.au>
Subject: Re: BMC Image Signing Proposal
From: Andrew Jeffery <andrew@aj.id.au>
To: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org
Date: Mon, 29 Jan 2018 17:00:25 +1030
In-Reply-To: <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4AUZtKWlPKtXkNlxSvXz"
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
X-List-Received-Date: Mon, 29 Jan 2018 06:30:36 -0000


--=-4AUZtKWlPKtXkNlxSvXz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Fri, 2018-01-26 at 14:07 +0300, Alexander Amelkin wrote:
> Hi, Anoo!
>=20
> The thoughts are as follows:
>=20
> 1. BMC usually runs in a secured environment where probability of=20
> tampering with flash IC contents by means other than BMC's firmware=20
> itself is negligible.

This does bring up the issue of developing a threat model to develop
against; we should probably do that. However, without one, I feel like
we should design *for* defense in depth and allow people to remove
protections as they see fit for their environment, rather than make
potentially compromising assumptions about what that environment is at
the outset.

For instance, whilst BMCs might typically be isolated from customer
traffic on a separate LAN, there's still the in-band interface which
can be used to poke at the BMC. Vulnerabilities in the IPMI stack could
lead to BMC compromise and undesirable flash writes*. Therefore BMC
flash integrity remains a valid concern despite network isolation.

* This ties into Michael Brown's talks of isolating daemons to their
own user/group and enforcing SELinux policy against them.

>=20
> 2. U-Boot already performs image checksum validation before booting a=20
> FIT image

Typically the rootfs is not part of the FIT, so it will not be checked.
    Some systems supported by OpenBMC directly mount the rootfs rather
than booting through an initrd, which makes rootfs authentication
somewhat tricky. Regardless, with signed images we should expand the
FIT hash check to be a full signature check.

>=20
> 3. User input really needs validation, at least to make the system=20
> fool-proof
>=20
> Having said that, I suggest that the only thing that really needs doing=
=20
> is signing (and checking) of the overall firmware image file that is=20
> supplied by the user (admin) during the firmware upgrade procedure.=20
> Applying asymmetric cryptography to a digest hash looks to me like a=20
> good idea as it indeed allows for verifying the supplier of the firmware=
=20
> image.

Agreed - do Yadro do this already? If so, what did you do to integrate
image signing into the build process? If not, then I'd be keen to keep
the discussion alive on how we can achieve it.

Cheers,

Andrew
--=-4AUZtKWlPKtXkNlxSvXz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJabr+BAAoJEJ0dnzgO5LT5OzwQAJm4wGSgeRHpwgSrKDDezsij
QTcsSJYLpqN0gHOs6K5mF0AAnlmTJ7AuFyNUKeOWnCnJ7LuMBr52s3rkzXErOvx0
tRx4UaHt4OvpNjnHuVxcacZDE6mfMS80CzAIWwArugBnghRzq35qJCA1L5cwov4P
VRiCOYvKwr2pmoVxb5OkoqTQXln6UVJcfZ322LGwy4jrFvQ5IUsn2/AUm2rbq0IQ
qUPPObv2D0mMJZOs8Qx26FhzOV3QF4++5D01+DARLNaVh/DXl1bgDxFS1SONb3zb
sy3AYROl+TZ1W9M46YpUUw1vQJOvwGkOJfGtG0Ohycqr8lioylDD125W2k0Vgkhu
OyVZHFVJpOzsBMLquC5wj6NV06paJUBvdyKoCD4OQQ7iEh8nNQH79OxCYgCQuKJ1
9sRP+SmUuo/lZkwOidvy7LKzIPXCpafL2MeDLJpJEtKUIg2IppDLgetaNFOOLKD8
uj6drFnHYemCVt94HRy9s09RJYyNtHTdM98wwur2nhBjlxG2mNrBUSVAWGg2i4H3
mL3G048eIW7ouQCs6nnwkvUYAAmBPv2obuiqML00MQFCs7qSlanhpBJRfZYLZOLg
BubDTJFNENmtgULIbxUTLffannSONYhUi68+wHK20hSss4FDubS8I3UBh15HX592
jmfJzTL7RZb8X9RbWUeH
=sUJK
-----END PGP SIGNATURE-----

--=-4AUZtKWlPKtXkNlxSvXz--
