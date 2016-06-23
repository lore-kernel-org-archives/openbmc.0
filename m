Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZqHk6VD4zDqhh
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 15:08:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=g11i0+GE; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=elrH3y7g; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8B0C24F3;
 Thu, 23 Jun 2016 01:08:48 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute5.internal (MEProxy); Thu, 23 Jun 2016 01:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=ZDN1j
 OdZ7icpXD9pH75PqUUAJL8=; b=g11i0+GE/nUUXa6YTkpvDHu+hgwivTFq/cCrU
 GsqXpbkTUSPKJcP01w0tAXKNEXtQ6l//gjtK1xruasfyHL55YIo6R6JbeKKaEjBb
 H0CQTTDfXc9RLfXhsvGHzhrj1rh/C1VBKxxN0X4vba236/UgX1u9yYYS3Y8aw2Cp
 E6jqxE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=ZDN1jOdZ7icpXD9pH75PqUUAJL8=; b=elrH3
 y7gA7WFS8p/pAwRKdgnId/K+pKkSvGVmLAIs2f0LBASEPz2A+Lf0HHt3n41KLYIf
 5izblujHVCvcnC2N+0rplGRQU6b17jM6InrpicRbqrrEsllHxVbQfHRpKPKfue19
 CDePrbRZNwkVIjekTYEcGepCkIP2eiqMU239ac=
X-Sasl-enc: hzfS2FfyIbFm9nuoIFudzgOwvK+UaVy2FuFWndXuB+zm 1466658526
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 50D37CCDAC;
 Thu, 23 Jun 2016 01:08:45 -0400 (EDT)
Message-ID: <1466658521.23740.50.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 09/18] initfs: update: Consistently add
 ERROR: and print to stderr
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 14:38:41 +0930
In-Reply-To: <20160623003038.2361-10-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-10-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-x/ykJKmEi4LPKCTSrCGd"
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
X-List-Received-Date: Thu, 23 Jun 2016 05:08:51 -0000


--=-x/ykJKmEi4LPKCTSrCGd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> Make sure all error messages start with the tag ERROR.=C2=A0=C2=A0Also re=
direct
> output to stderr (once case had the file descriptors backwards).

Maybe we should lift the calls out to a shell function, something like:

print_err() {
	echo 1>&2 ERROR: $@
}

>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0.../recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh=C2=
=A0=C2=A0=C2=A0=C2=A0| 8 +++++---
> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-i=
nitfs/files/obmc-update.sh
> index f0ca989..4249161 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> @@ -21,7 +21,7 @@ fi
> =C2=A0
> =C2=A0if grep mtd /proc/mounts
> =C2=A0then
> -	echo 1>&2 "Error: A mtd device is mounted."
> +	echo 1>&2 "ERROR: A mtd device is mounted."
> =C2=A0	exit 1
> =C2=A0fi
> =C2=A0
> @@ -65,6 +65,8 @@ toram=3D
> =C2=A0whitelist=3D/run/initramfs/whitelist
> =C2=A0image=3D/run/initramfs/image-
> =C2=A0
> +E=3D"ERROR:"

I'd prefer the function approach, but if we're going to do this
instead, lets at least do it at the top of the script so we can use the
same approach in the hunk above.

> +
> =C2=A0while test "$1" !=3D "${1#-}"
> =C2=A0do
> =C2=A0	case "$1" in
> @@ -90,7 +92,7 @@ do
> =C2=A0		toram=3Dy
> =C2=A0		shift ;;
> =C2=A0	*)
> -		echo 2>&1 "Unknown option $1"
> +		echo 1>&2 "$E Unknown option $1"
> =C2=A0		exit 1 ;;
> =C2=A0	esac
> =C2=A0done
> @@ -126,7 +128,7 @@ do
> =C2=A0	m=3D$(findmtd ${f#$image})
> =C2=A0	if test -z "$m"
> =C2=A0	then
> -		echo 1>&2=C2=A0=C2=A0"Unable to find mtd partiton for ${f##*/}."
> +		echo 1>&2 "$E Unable to find mtd partiton for ${f##*/}."
> =C2=A0		exit 1
> =C2=A0	fi
> =C2=A0done
--=-x/ykJKmEi4LPKCTSrCGd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa27ZAAoJEJ0dnzgO5LT5ee8P/1deRK3Cw0a/OVnAu8DM8dVF
8aI9r6HjeRmhuQshTw0OCZQNpi8Q689tG1xFpyTNEaxggHu9tpAKiGi2Wo0hQndZ
sOAotkhJ2o8K8adBWq8GiRyUv0M3WWjq+Egc6QA/MNzw1xH6gVAOgdvvX6BBJrfs
livAmTzOtz8CCLfTo0TxRJ8QQVxZbqVoCEoKWzbuKKsS6daJXc5TYNBJk7Yt2nO4
KM97BJAcJFSXZXg4wJzUJaGcWMn0xBpB1fiQXD6T0eu6Oz9a9wlF1vQCmHXNoQlI
+Q4f9X6fps95+DwR8sGPxQivFSWz7WsBTjYaVaBloPK8+3LHugHtctx2tYvh/try
viXvOf/U3T9zBlLybnoV+rRDcHH2kn3XKkWTWBhjmkkKTh5n3dfg0KetXj/FbZv5
xhwCJdmo5waMoDdKHrjCpuV7yQM3vVgcDWwG3rILZvybVuZCF6FblF4+PvdiEWeB
JotqLTcIrfzkgDN+IT+UbDCVICmOoOGkz3jyADTqQc9zIhe9EeElczwUzANoq8Qx
CajdjVOxlA4CaXPx2UKsxKJ6YJjFYa7AK3CuTenFSS+5BuO1EDHlhoq0gh3qwiTX
qp6uvgfyfHGh3FDjePexA49BR7jPCm6Fp41aYUGWQ9QSMrktpUPsOVckcSUfzzth
lSyKJ5/f4WZPi4di4Zh8
=K+32
-----END PGP SIGNATURE-----

--=-x/ykJKmEi4LPKCTSrCGd--
