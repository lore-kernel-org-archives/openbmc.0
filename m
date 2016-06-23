Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZrhK1qb8zDqhj
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 16:11:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=imxygVt+; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=nImOKJnm; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B6BF5C37;
 Thu, 23 Jun 2016 02:11:42 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 23 Jun 2016 02:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=jiyyD
 EHpxJ0fdgDB4WtpyafjM1g=; b=imxygVt+Cgd0SiO9Z20oLG7TzmPQLLyo39aUD
 gBucvRiRmwtJ3d3gTt8JsDTY+xAlwPkOHoRq6cVfwDNzS83r4Rwu9nAD5FCMzcyM
 I6YKoJBqrUV8j/5+ld8WpP+I8tpTQ31Si1nDJiW4HZd0LJedB6efhxbqa0EywjB5
 Xw23VE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=jiyyDEHpxJ0fdgDB4WtpyafjM1g=; b=nImOK
 Jnm12Njc4ll+y/z1IFIjfQryHsMfI7ohQlUzp3gpf9buFE3MDHvRcjOV2YMhC4wf
 k3PAJKZFsCRHrfogYylHQSaUDg6ERx8nRxCPJQ6YBnev06gN/ysYwwJ6FdJYn8mN
 RWduQGgDOCjMBpNB1rqBfuKaZ6uUHBkXwC9Q0c=
X-Sasl-enc: OPHp90n4trTj/NzeoavPNH3qS2zgTa6ix3LjqTe5PE0H 1466662301
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 70E34CCDB7;
 Thu, 23 Jun 2016 02:11:40 -0400 (EDT)
Message-ID: <1466662295.23740.79.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 16/18] initfs: update: handle no images to
 update
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 15:41:35 +0930
In-Reply-To: <20160623003038.2361-17-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-17-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-QVfeo2iTsZNKn33sUXAV"
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
X-List-Received-Date: Thu, 23 Jun 2016 06:11:46 -0000


--=-QVfeo2iTsZNKn33sUXAV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> Notify the user if image wildcard expansion fails instead of printing
> message about failing to find partition to flash.
>=20

This kind of problem is why I have reservations about our early/late
shell scripts. I wonder how many more of these issues are lurking...

> The update script errors with the message that it can't figure out what
> partition to flash for /run/initramfs/image-* if there are no images
> pending.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 13 +=
++++++++++--
> =C2=A01 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-i=
nitfs/files/obmc-update.sh
> index 1dbf65f..7120a18 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> @@ -99,6 +99,7 @@ checkmount=3Dy
> =C2=A0whitelist=3D/run/initramfs/whitelist
> =C2=A0image=3D/run/initramfs/image-
> =C2=A0E=3D"ERROR:"
> +imglist=3D
> =C2=A0
> =C2=A0while test "$1" !=3D "${1#-}"
> =C2=A0do
> @@ -184,7 +185,15 @@ then
> =C2=A0	fi
> =C2=A0fi
> =C2=A0
> -for f in $image*
> +imglist=3D$(echo $image*)

If there are no wildcard matches doesn't this expand to the string
"/run/initramfs/image-*"? Why are we using echo in a subshell?

> +if test "$imglist" =3D "$image*" -a ! -e "$imglist"

What's the idea behind the first condition ("imglist" =3D "$image*")?
Won't they always be the same?

> +then
> +	# shell didn't expand the wildcard, so no files exist
> +	echo "No images found to update."

Is this worthy of the ERROR: prefix?

> +	imglist=3D
> +fi
> +
> +for f in $imglist

If imglist is empty don't we run into the same issue with findmtd, just
that we have printed the warning above? Should we exit?

Cheers,

Andrew

> =C2=A0do
> =C2=A0	m=3D$(findmtd ${f#$image})
> =C2=A0	if test -z "$m"
> @@ -209,7 +218,7 @@ done
> =C2=A0
> =C2=A0if test -n "$doflash"
> =C2=A0then
> -	for f in $image*
> +	for f in $imglist
> =C2=A0	do
> =C2=A0		if test ! -s $f
> =C2=A0		then
--=-QVfeo2iTsZNKn33sUXAV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa32XAAoJEJ0dnzgO5LT5Op4P/jeBAEHTXQrCt56s9yTl7u5y
eTvek9ytxS8lXLcwclYspW2usPDI7Yy348WdXYEiPNHdI9WAdbYMQ9hZCysRtV8+
EWzWB6QIRoII+PewRjljP7OUxnCzlo+q+B61lVwb14JNtVWPeTNpygmqhjyPbp9x
Rff3LfIacyAW9f9WfsgMmQfexUI8AItLc82vfMoaEOA0y0pMMiEyOAKafpqesgDr
bsajlbkbMhs+embrpHgnkwdNH8V2BeZJJbqt4oMA/ZUJLByBSehHOtFPcfrMhPbE
vkg6R+4fXfxSGnYkMwH6ocbTZkqYuwbACqLBegivRnlzmud9fLqISttEL1k4Q19r
TO/9eAJqq9eoqdbhYKek+0HYQZiuoxPcEob/kZuniJkgp4SlHZdLVPhqh1yqSNAo
/5S1gN4g/30V6okzwSHDO4qml3VYGk7jtjccG4iUx6P2naeJ7S32JUdH2JLQ/2bH
FZVCBWYlEPmM6xYm/dPZstwzGLWW2QqmCUIyVN9Wnwx1RVnNBO2O9vF2lB5wCzwd
mwTrRl6ZHtpg20fUSAHtHg4N8CXA2KK3pgqXU25/l+u3oUV+d7xDe9h2xkeEjuvi
aMz865xTm066vdofbMODLFi09LDWjyJ4UyJOD2mmkWn/ij4Wv/Et6uiiVaQQY50m
w+jYO+uXyhewXSACXw4z
=Nhjo
-----END PGP SIGNATURE-----

--=-QVfeo2iTsZNKn33sUXAV--
