Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZrCM5kgYzDqjb
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 15:50:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=WEoa2K3k; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=AMjWDavn; dkim-atps=neutral
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id AAB3CA0D;
 Thu, 23 Jun 2016 01:50:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute3.internal (MEProxy); Thu, 23 Jun 2016 01:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=XJVzQ
 esTmfECDVaQFyiERkm5QRg=; b=WEoa2K3ktkNtIlvikxPLh/Ec2Nce1q6IbFIfR
 yVCthPmovqj9wDKW3kp8leNLEm6KMK/CeJp+lZvtMJfD+KlXfhLY5KFDz1nIXQyd
 bxm7EgFMQW1rj5mDpYxyiOvW/qlX3c7IyUqf3V5skd9HmqQkrw7G9c4ah2Q+nYiM
 mbnZEg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=XJVzQesTmfECDVaQFyiERkm5QRg=; b=AMjWD
 avn9+2HQ3nY74n5cPWLEeebR68duU6zqlmfPFG15v2CXr9MAFycUQ9+gRMBz+QNQ
 ZFG6AiyTmiWP0nh/5lRz1ULfqxKM4KTITbgzEiXnfCjqfNZvIFP1g+4d5mnCCvcj
 9WYuC3DoaIu+uPFXxd2wLkWIucuTI3qneMkAbQ=
X-Sasl-enc: spTuqqfi4Qjkp1KUqefseuqg1yZgViscm+uetlw6FLxl 1466661004
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C54ECCD39;
 Thu, 23 Jun 2016 01:50:02 -0400 (EDT)
Message-ID: <1466660998.23740.69.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 13/18] initfs: update: add --help message
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 15:19:58 +0930
In-Reply-To: <20160623003038.2361-14-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-14-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-vTGdcoHi2GjWoAiTEi/a"
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
X-List-Received-Date: Thu, 23 Jun 2016 05:50:08 -0000


--=-vTGdcoHi2GjWoAiTEi/a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> Now that update is intended for use at runtime and not just by
> the init and shutdown scripts, add a short help message listing
> the options so people don't have to understand how to read shell.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| 20 +++++++++++++++++++-
> =C2=A01 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-i=
nitfs/files/obmc-update.sh
> index 06e0e74..1dbf65f 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> @@ -103,6 +103,24 @@ E=3D"ERROR:"
> =C2=A0while test "$1" !=3D "${1#-}"
> =C2=A0do
> =C2=A0	case "$1" in
> +	--help)
> +		cat <
> +Usage: $0 [options] -- Write images in /run/initramfs to flash (/dev/mtd=
*)
> +=C2=A0=C2=A0=C2=A0=C2=A0--help=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Show this message
> +=C2=A0=C2=A0=C2=A0=C2=A0--no-flash	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Don't attempt to write imag=
es to flash

Looks like a tab snuck in and is messing up the alignment

> +=C2=A0=C2=A0=C2=A0=C2=A0--ignore-size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Don't compare image size to mt=
d device size
> +=C2=A0=C2=A0=C2=A0=C2=A0--ignore-mount=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Don't check if destination is mounte=
d

Maybe it is worth adding some words about --ignore-mount also setting
--no-flash?

> +=C2=A0=C2=A0=C2=A0=C2=A0--save-files=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Copy whitelisted files to s=
ave directory in RAM
> +=C2=A0=C2=A0=C2=A0=C2=A0--no-save-files=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Don't copy whitelisted files to save direc=
tory
> +=C2=A0=C2=A0=C2=A0=C2=A0--copy-files=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Copy files from save direct=
ory to rwfs mountpoint
> +=C2=A0=C2=A0=C2=A0=C2=A0--restore-files=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Restore files from save directory to rwfs =
layer
> +=C2=A0=C2=A0=C2=A0=C2=A0--no-restore-files=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0Don't restore saved files from ram to rwfs layer
> +=C2=A0=C2=A0=C2=A0=C2=A0--clean-saved-files=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0Delete saved whitelisted files from RAM
> +=C2=A0=C2=A0=C2=A0=C2=A0--no-clean-saved-files=C2=A0=C2=A0=C2=A0=C2=A0Re=
tain saved whitelisted files in RAM

Hmm, I think we need more words about how copy and restore are
different - I've forgotten and the documentation isn't making it clear
to me.

Cheers,

Andrew

> +HERE

> +
> +	=C2=A0=C2=A0=C2=A0=C2=A0exit 0 ;;
> +
> =C2=A0	--no-clean-saved-files)
> =C2=A0		doclean=3D
> =C2=A0		shift ;;
> @@ -135,7 +153,7 @@ do
> =C2=A0		toram=3Dy
> =C2=A0		shift ;;
> =C2=A0	*)
> -		echo 1>&2 "$E Unknown option $1"
> +		echo 1>&2 "$E Unknown option $1.=C2=A0=C2=A0Try $0 --help."
> =C2=A0		exit 1 ;;
> =C2=A0	esac
> =C2=A0done
--=-vTGdcoHi2GjWoAiTEi/a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa3iGAAoJEJ0dnzgO5LT53/UP/25BIIrEv7yomy8DIe5QPbp2
6iR751VdL6YTEmGbzVttLMflbUdHoU21zWYjOjfgZSPdta2s8gkj0L7wd7rvJ3ww
ukhk1sGj9OI2MNXI3/CdBO7vihZ8kxBeSiXEGdEuGrlP4nc+rxbHkZc/SVs+RWuh
c5kKlHL1Dk/vtzr74nsKRp0rLFi+AH2hlaW4ocED018MCdgUz10KupNfk6OwfYhg
CWb8e+HRGXXuLudd1Qz7+0cKA1Ls3MOonzHKPcjpEfcwVE70gIHqRF8SqNpTMviE
vj5U3B1ckNjmSKSfXpugOelt+nddGaE8seDWlSfs2BGOZuwQXzNxk4yQsJPrzAG+
+yaonUmjEeTK7J4/pUbLNVa+S+wjKymM31IvUVthmRKrHXFvjTVD4GTBR8rkOM/Y
gGdGjSmpnuWCDyHDFelPMLznfw5fpwSONyRQYhXPAE01qSii2Ljw32XYrwC2T5mW
0iudzKY+uIyKqWEz8YGVWPeILBOpgmPr+XVpE4tq6+ovTTM8uS7YCjkTg+3wUxoX
F8duROgP93bHGnHmrXpqb5N+slH7D3F96+dlPXPFeGodTD5WarioJ+M6a6CmTfkE
i3H0d8upmJO+YdAlEmv3wr/T4HCWK901wma+m3Y0FSPk77XxrRFkpulo2dof6w3C
BFhpXoLn5/4VrdA12lcw
=PoE2
-----END PGP SIGNATURE-----

--=-vTGdcoHi2GjWoAiTEi/a--
