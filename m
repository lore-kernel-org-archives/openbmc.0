Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZpKZ5snvzDqhc
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 14:25:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=KcyzaMrz; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=UGZqonrg; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 76962BBA;
 Thu, 23 Jun 2016 00:25:20 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 23 Jun 2016 00:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=lUb6O
 vm9ZyjUgFjoZ9lO6SRNFRk=; b=KcyzaMrzeBeBzEHQor+keMYxGL+6V8S2JAqRw
 RDjHCkIx3eJ9lunwfyjDKow1NRSa7k3JFnzoTC1fglXi2NXqyGotclWBKqhY1tMn
 TEAAiPOz0qC0h1olUQCwqeJY13YD7o/5Ur6CGZBxdMkyRifqvJsCobgu/Qj77JoV
 XaJ0CQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=lUb6Ovm9ZyjUgFjoZ9lO6SRNFRk=; b=UGZqo
 nrgAe9HscRM1zkGDzdXv2WVYrnC+ieKXfWI4xBZGETT59gb1JCLjqrXp1SGVPTGt
 4EJ71S2hrMJ5+25kQ7PIhyI3Y/do1hUqkVzdUC2XAPu7vFuhQxXmbQNCuubShoo4
 mYZUUzt9dsFXDYsPL4va2K6dV4ZxLwAm1stc6o=
X-Sasl-enc: g7ExyP2ztJ1xZSTAw2g6QpTX90zAL61pF31oehLBR1Lq 1466655919
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 34818CCDA1;
 Thu, 23 Jun 2016 00:25:17 -0400 (EDT)
Message-ID: <1466655914.23740.39.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 04/18] image_types_uboot: Don't truncate when
 assembling flash
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 13:55:14 +0930
In-Reply-To: <20160623003038.2361-5-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-5-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-PPo7XN5Xdi3CZGa5YPYv"
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
X-List-Received-Date: Thu, 23 Jun 2016 04:25:23 -0000


--=-PPo7XN5Xdi3CZGa5YPYv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>=20
> The generate_flash_image step was creating a file then using dd to
> fill in the pieces, but missed adding the conv=3Dnotrunc flag, so each
> step was shortening the file to its output.
>=20
> Add the forgotten conversion flag to each dd command.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 10 =
+++++-----
> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclas=
s b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> index adb86e0..164d1ed 100644
> --- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> +++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> @@ -76,11 +76,11 @@ do_generate_flash() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dst=3D"${ddir}/${FLASH_IM=
AGE_NAME}"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -rf $dst
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mk_nor_image ${dst} ${FLA=
SH_SIZE}
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dd if=3D${ddir}/${uboot} of=3D=
${dst} bs=3D1k seek=3D${FLASH_UBOOT_OFFSET}
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dd if=3D${ddir}/${kernel} of=
=3D${dst} bs=3D1k seek=3D${FLASH_KERNEL_OFFSET}
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dd if=3D${ddir}/${uinitrd} of=
=3D${dst} bs=3D1k seek=3D${FLASH_INITRD_OFFSET}
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dd if=3D${ddir}/${rootfs} of=
=3D${dst} bs=3D1k seek=3D${FLASH_ROFS_OFFSET}
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dd if=3D${ddir}/${rwfs} of=3D$=
{dst} bs=3D1k seek=3D${FLASH_RWFS_OFFSET}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dd if=3D${ddir}/${uboot} of=3D=
${dst} conv=3Dnotrunc bs=3D1k seek=3D${FLASH_UBOOT_OFFSET}

Would be good to keep the option ordering consistent here (conv=3Dnotrunc
is after bs=3D1k on the remaining dd invocations). That's a minor issue
though and this is a good catch, so:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dd if=3D${ddir}/${kernel} of=
=3D${dst} bs=3D1k conv=3Dnotrunc seek=3D${FLASH_KERNEL_OFFSET}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dd if=3D${ddir}/${uinitrd} of=
=3D${dst} bs=3D1k conv=3Dnotrunc seek=3D${FLASH_INITRD_OFFSET}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dd if=3D${ddir}/${rootfs} of=
=3D${dst} bs=3D1k conv=3Dnotrunc seek=3D${FLASH_ROFS_OFFSET}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dd if=3D${ddir}/${rwfs} of=3D$=
{dst} bs=3D1k conv=3Dnotrunc seek=3D${FLASH_RWFS_OFFSET}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dstlink=3D"${ddir}/${FLAS=
H_IMAGE_LINK}"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -rf $dstlink
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ln -sf ${FLASH_IMAGE_NAME=
} $dstlink
--=-PPo7XN5Xdi3CZGa5YPYv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa2SqAAoJEJ0dnzgO5LT58n4QAIckQxPc865nrbXyBBjNzzLE
lsxMd1Fe9Iiu8UT2D7NPD6Vl7RKOZyT6I62zcY/HnGZeRCCXNu8fLb9uTcM4V1i7
0e90aPfv4aiHVzHdQtoD8QfE3OG73Ulh+ncqtxL5jFRVY2WKbYbtrl9wONo4ZN/J
CJz4v8Q0ZnJ/4CqwfMkAxwyWgdWYq+h+NbdJ3boHa4fbnLLxU/08LrGZebRjt/ZX
FSyV0BkRU0mlNUMkMjnHHTRj3bi71/JWzruQgdrXXz2uMZqcGFKt4zaWrgxIYlLo
X6IfWOtDtDAmA4twAAaMo15f11Px+zmf9VC1nOL+Ha5lUJTNICkMFGKHYag6kURQ
Knd2N0ykeXj1xD1E7oaNONsjA66Xq6vf+E3vSVyoKQhamrN1OFk1hbmLZzoF8Bj0
ha7s0FF+kDUM0I7yX69kMGnuSggJ9bEFiw8YvworVV5PUO6B0aIjIXHhxR28HVdn
nxxsfDe8WBjuxVn5O9KCGZD6CBFWRJsuSrq55F+/Vsqe1RxF7LRNkad/eURkY4Mi
eQMJyPS0KeMSPpmdJyhPwLfr+17qOgOqii9e0AtyNPd0Gd8hg6zKQdouMChWy+/n
0l0yD36TOnaqywVSYfEPkCTH18HJIrk1IB9xuNb7Kro38cYAhYhLwQic8js2vloZ
yP5CwN7KJdCAXIFfRJc9
=47c+
-----END PGP SIGNATURE-----

--=-PPo7XN5Xdi3CZGa5YPYv--
