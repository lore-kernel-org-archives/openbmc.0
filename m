Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZqtD36s6zDqmf
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 15:35:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=AHMhENLL; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=uwutJfX/; dkim-atps=neutral
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C267AA96;
 Thu, 23 Jun 2016 01:35:13 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute6.internal (MEProxy); Thu, 23 Jun 2016 01:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=lxa35
 kvlcmb0fuNBLRHWwinzua4=; b=AHMhENLLBvO3fk8FUJDblaHnTAJfQ5qgGgkKQ
 9CrpPwAjwI8eUoBSxU82jrkPqr1JDPin2YGY8LGHOe+wqT3XXQwJjabZA52ztVOl
 cdTgzId9Ys0871A2NFa0L3xEFDJYAzY1E68D1s2hAJj5akb9sW46UUr3LTlYAy/r
 S4n53c=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=lxa35kvlcmb0fuNBLRHWwinzua4=; b=uwutJ
 fX/6EPrqp0ZhtMA6H4pZSOnfA2NYkVU1AIyoqfRCPsh9cfAKXTET5ypO0BMNHlWr
 q1WAPqM/PDEMxlgFb2/JkL6JQC+vcv0MagoOlNisJ6XeJmo2BJAREf2WPEPfKGmM
 tESmrPm8045mo3kJ3S2BON6LhV6p2BBxsO/foY=
X-Sasl-enc: x9YV5GEBxUda49zlDsU88oy9H9bL5krS/KcCrHSWqovl 1466660112
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55BFDF2022;
 Thu, 23 Jun 2016 01:35:11 -0400 (EDT)
Message-ID: <1466660106.23740.59.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 11/18] initfs: update: check individual mtd
 partitions for mounts
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 15:05:06 +0930
In-Reply-To: <20160623003038.2361-12-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-12-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-2NVPMxQVPSRd5jsxAUKt"
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
X-List-Received-Date: Thu, 23 Jun 2016 05:35:17 -0000


--=-2NVPMxQVPSRd5jsxAUKt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>=20
> Instead of checking for any mtd device, only check mtd devices
> that are to be updated.

What do you mean by "instead of"? We're not removing any code here, and
from a quick look we loop over the update images in existing checks.

> =C2=A0=C2=A0Include child mtd devices when looking
> for mounted filesystems.
>=20
> If this check is suppressed flash updates are suppressed.
> Suppressing the check may be useful to verify a update could
> succeed at shutdown.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 47 +++++++++++++++++++---
> =C2=A01 file changed, 41 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-i=
nitfs/files/obmc-update.sh
> index 4442e5b..22c9dcc 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> @@ -19,11 +19,34 @@ then
> =C2=A0	mount -t devtmpfs dev dev
> =C2=A0fi
> =C2=A0
> -if grep mtd /proc/mounts
> -then
> -	echo 1>&2 "ERROR: A mtd device is mounted."
> -	exit 1
> -fi
> +# mtd number N with mtd name Name can be mounted via mtdN, or mtd:Name
> +# (with a mtd aware fs) or by /dev/mtdblockN (with a mtd or block fs).
> +mtdismounted() {

I keep reading this as mt-dismounted rather than mtd-is-mounted. Can we
add some underscores?

> +	m=3D${1##mtd}
> +	if grep -s "mtdblock$m " /proc/mounts || grep -s "mtd$m " /proc/mounts
> +	then
> +		return 0
> +	fi
> +	n=3D$(cat /sys/class/mtd/mtd$m/name)
> +	if test -n "$n" && grep -s "mtd:$n " /proc/mounts
> +	then
> +		return 0
> +	fi
> +	return 1
> +}
> +
> +# Detect child partitions when the whole flash is to be updated.
> +# Ignore mtdNro and mtdblockN names in the class subsystem directory.
> +childmtds() {
> +	for m in /sys/class/mtd/$1/mtd*
> +	do
> +		m=3D${m##*/}
> +		if test "${m%ro}" =3D "${m#mtdblock}"
> +		then
> +			echo $m
> +		fi
> +	done
> +}
> =C2=A0
> =C2=A0findmtd() {
> =C2=A0	m=3D$(grep -xl "$1" /sys/class/mtd/*/name)
> @@ -62,10 +85,10 @@ doclean=3D
> =C2=A0dosave=3Dy
> =C2=A0dorestore=3Dy
> =C2=A0toram=3D
> +checkmount=3Dy
> =C2=A0
> =C2=A0whitelist=3D/run/initramfs/whitelist
> =C2=A0image=3D/run/initramfs/image-
> -
> =C2=A0E=3D"ERROR:"
> =C2=A0
> =C2=A0while test "$1" !=3D "${1#-}"
> @@ -92,6 +115,10 @@ do
> =C2=A0	--no-flash)
> =C2=A0		doflash=3D
> =C2=A0		shift ;;
> +	--ignore-mount)
> +		checkmount=3D
> +		doflash=3D
> +		shift ;;
> =C2=A0	--copy-files)
> =C2=A0		toram=3Dy
> =C2=A0		shift ;;
> @@ -135,6 +162,14 @@ do
> =C2=A0		echo 1>&2 "$E Unable to find mtd partiton for ${f##*/}."
> =C2=A0		exit 1
> =C2=A0	fi
> +	for s in $m $(childmtds $m)
> +	do
> +		if test -n "$checkmount" && mtdismounted $s

$checkmount is invariant with respect to $s, so is it worth hoisting
the check out of the loop? Though it would mean another indent...

Cheers,

Andrew

> +		then
> +			echo 1>&2 "$E Device $s is mounted, ${f##*/} is busy."
> +			exit 1
> +		fi
> +	done
> =C2=A0done
> =C2=A0
> =C2=A0if test -n "$doflash"
--=-2NVPMxQVPSRd5jsxAUKt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa3UKAAoJEJ0dnzgO5LT5wMIQAJVTbuvOPiUeCaEnI7kpyaFa
ptcVAesPisgmHkog3yIAV2E5JXr5iKgvfxiASP6VSzrsvbWoE0wNDPuCAbsKTQqS
4ofCFKP90S1vbItT6KLTyBFUbs5hs9SZXa/GKaLJPYL7uJEf6862hUl4uENjckmB
XJ4dNuTgHsty7t75DlhrTR5sB4uAlVGO90NhakknXV4GlIK+DZfjZo89alnVPX2x
c0BE7xFat5hu0SZ0BKourKBiaNY8zxoquwfsg3/Bt3jRlQ/+3u2xAzDRwhQSph0o
H1EMjaNeNwhMPe4EMKqbCW84T+Qjp6BuCygBJISPav3gOavrt6Eg/ZUd9HEd38W3
FtSerYOmW//VJLstSo4DtCjXH6H7b6iTzOVCTu5S/iKcIk5mWHnqRF2r+wz6iAtE
aZilazYxXa4rdrEymAgSt29Qy+/GpZv6vwudB4d06hLAEUIDnOyO7GnL+vk896nt
LjKuRYg1KN2x783DYgnM0oHInbWhO3MmQ0ffMRNR4GMA8QjTapcv144+VHtj8rZm
Iu/d9bvDrZHDSuuRCa4koWg2IvRjgdFYMXwmSCYJKE0P3k1S3ttoCSYn3AD9Sxv8
DICU0QLQ0egRpt+a/0Mt96y9FHFNrkrd1V++19Xe93wXA53C09CroPyMlcP111Qr
DPNjUwUu9wxGu9sNhoAF
=pGpt
-----END PGP SIGNATURE-----

--=-2NVPMxQVPSRd5jsxAUKt--
