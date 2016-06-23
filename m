Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZqNK4W9QzDqhf
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 15:12:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=cdDCWBGq; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Lp8S1Tzk; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id D49C7C21;
 Thu, 23 Jun 2016 01:12:46 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute5.internal (MEProxy); Thu, 23 Jun 2016 01:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=SMCvj
 d0yDsfQ3pfgANlktLNTMFg=; b=cdDCWBGqsrd80h30wWrY/ThFFhoeLFT/lKfiJ
 SwooPz+k6c2ehO3L7XhaVsT6PVGYzn7u/LiKvPKBOticEkkIIWtWbtL0P2IrxBVp
 k7Q8rVwYvNcUEzYIkvE5a686oqvrmAZ16dQTxmxj23Hc+iQk/HJPcDyUt/qUtpdf
 eYEex0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=SMCvjd0yDsfQ3pfgANlktLNTMFg=; b=Lp8S1
 TzkkCnLZGOHq+OnZNuQhvxgtLQdoNhnTF4GqCpbaPC0vEHMghHQinyXUYHoN0ipk
 yrADXFvo5px7tFG08Fn63SXW9mx8NDjvY2/zm/1wuMbcjd6qK085E0HZwsP/8x+O
 /GFKambMUbSGWH+sLSbbpQ3zz+a5BrEFRatIb4=
X-Sasl-enc: DXDWhKBr7mhkbNMZfbwaHA+Ea9FYgFT9UvJGG9PnRZEU 1466658765
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id B83F8CC023;
 Thu, 23 Jun 2016 01:12:44 -0400 (EDT)
Message-ID: <1466658760.23740.53.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 10/18] initfs: update: add option to perform
 checks but skip actual update
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 14:42:40 +0930
In-Reply-To: <20160623003038.2361-11-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-11-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-1pAKGyQVSi/QfBxkcPAk"
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
X-List-Received-Date: Thu, 23 Jun 2016 05:12:50 -0000


--=-1pAKGyQVSi/QfBxkcPAk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>=20
> Provide a way to check if update is likely to succeed without
> attempting actual updates.
>=20
> This will check the image names correspond to mtd partition names,
> and will be enhanced with additional checking for file size and
> individual partition mounts.
>=20
> This is not called --dry-run because it will still do file save
> and restore if those are enabled.

Is save/restore useful if nothing's going to change - as in, why not
make it a true dry-run? Or are you concerned about adding more logic to
prevent the save/restore from happening?

Cheers,

Andrew

>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 31 +++++++++++++---------
> =C2=A01 file changed, 19 insertions(+), 12 deletions(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-i=
nitfs/files/obmc-update.sh
> index 4249161..4442e5b 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> @@ -57,6 +57,7 @@ upper=3D$rwdir/cow
> =C2=A0save=3D/run/save/${upper##*/}
> =C2=A0
> =C2=A0mounted=3D
> +doflash=3Dy
> =C2=A0doclean=3D
> =C2=A0dosave=3Dy
> =C2=A0dorestore=3Dy
> @@ -88,6 +89,9 @@ do
> =C2=A0	--restore-files)
> =C2=A0		dorestore=3Dy
> =C2=A0		shift ;;
> +	--no-flash)
> +		doflash=3D
> +		shift ;;
> =C2=A0	--copy-files)
> =C2=A0		toram=3Dy
> =C2=A0		shift ;;
> @@ -133,18 +137,21 @@ do
> =C2=A0	fi
> =C2=A0done
> =C2=A0
> -for f in $image*
> -do
> -	if test ! -s $f
> -	then
> -		echo "Skipping empty update of ${f#$image}."
> -		rm $f
> -		continue
> -	fi
> -	m=3D$(findmtd ${f#$image})
> -	echo "Updating ${f#$image}..."
> -	flashcp -v $f /dev/$m && rm $f
> -done
> +if test -n "$doflash"
> +then
> +	for f in $image*
> +	do
> +		if test ! -s $f
> +		then
> +			echo "Skipping empty update of ${f#$image}."
> +			rm $f
> +			continue
> +		fi
> +		m=3D$(findmtd ${f#$image})
> +		echo "Updating ${f#$image}..."
> +		flashcp -v $f /dev/$m && rm $f
> +	done
> +fi
> =C2=A0
> =C2=A0if test -d $save -a "x$toram" =3D xy
> =C2=A0then
--=-1pAKGyQVSi/QfBxkcPAk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa2/IAAoJEJ0dnzgO5LT5kGsP/1jE8EUwGQB6oDzU3oF5I0CA
c3mdqpetP6WElDNWlOlueR45bDnRl/uoCh3CzdoldqdNTxyIfOXVyo90drQyScUB
rQG+vJCzRnWiGKm/IfFugx44wrK+GC2ONW5R8ut70NhMMMs5t6Gy7GsQLjJ167RK
0dL6rM4CtRyd1NabsWbGH5zBHxVpMK5z07QpGqVD162WVKJALFA66K7X41UJrY1t
0+PQTGNUuNVRsm2UQWwoQCHhxG4J2Eu0fFuimBqcMOBpf0KaXj7fIKd0XOKaQF80
nFHJ736oXC/+g5NFIUvljablnlaaTjvD+tF6bZF3riql/togYtDu2LqZ9rX9joZM
1JOdfYoU5IlkkCkMsL55WbJh5ehieBstrFmLEnA2fHSMfGrcQRZlIUClqPr96ZLv
EvSM8Qa/9xP60p9gUsvUeNdCMSYg0sshdc2WOWa06eV9vGSr4QeI35VtbwZ9vEFm
YanwKr/iE07GL9kZ7fLCoGUpXVDVMXCRN9e6YcS6ncpluyewoAMR5jvuYiVXVDiN
5HRYdO2U90JdsiLYE+j1XCMZ7lYAd1XTEdDkh8OiJnY8aUcqNxs84lwxfBI4CxgK
kwzj6b2X8XJ+bfjgzxunqirOkGYoE0lfAIRNkMUyJxs3zHRhtwEngahfnMxnPrBO
ulp7OsZRc8O6eSj+8//O
=e/uj
-----END PGP SIGNATURE-----

--=-1pAKGyQVSi/QfBxkcPAk--
