Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZs0k00nCzDqhj
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 16:25:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=kookE1Jr; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=DVizEa1h; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D5EA3C17;
 Thu, 23 Jun 2016 02:25:55 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 23 Jun 2016 02:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=KVofI
 zQ6lOK6nX4q1pmXDtZ52+U=; b=kookE1JrJO1bpEhemyxbWD4eRRYBb2h00tcEh
 ziNjYbhVoMgWOAe+yKQEIK9WYWA4GSAYFUHJ3dmi2m8B9WgfiJ/CWujtX/Rcvqda
 t3V7skhCDpdPU7xFtIL30Cs5BdHMUsagUEBsxMk/IgkZAucGZIrAT54LjZtHTfnt
 0swb58=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=KVofIzQ6lOK6nX4q1pmXDtZ52+U=; b=DVizE
 a1hNKFzXJ8/ADVcnCkJZU3wKdiU0EkvIEjk5hk79QmmeEsBfNCfqc/vANc1lsjxF
 AALZv3IcGgFMzIXy8WxW2ITOf/qZmWJnwYIGzPiQ/TDamg2Rjyb6uCjsyLvag0DE
 8nytBMxfjZsUT7nsaiQiDnHEyk6GAA+6ARVa9E=
X-Sasl-enc: /DRFi8/xGibhlIk6wUTW4SotFLRQgo98j5RXj7tfhzPG 1466663154
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id ED406CCDB2;
 Thu, 23 Jun 2016 02:25:53 -0400 (EDT)
Message-ID: <1466663149.23740.88.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 17/18] initfs: update: Sanitze whitelist
 directory entries
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 15:55:49 +0930
In-Reply-To: <20160623003038.2361-18-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-18-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BuD5CsBlXHwWbURJG+wt"
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
X-List-Received-Date: Thu, 23 Jun 2016 06:25:58 -0000


--=-BuD5CsBlXHwWbURJG+wt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> Repeatedly strip trailing / and /. from whitelist entries and
> fail if an entry includes /../ or ends with /.. or doesn't start
> with a /.=C2=A0=C2=A0Also use the entries quoted to avoid any glob.

Right. Ending this particular sentence with a '/' is a bit subtle. I
think you should quote your path bits: "/", "/.", "/../", "/.."; this
way the sentence would end '... or doesn't start with a "/".'.
>=20
> It was noticed the save code was saving directories that ended in /
> into a subdirectory of the last component name.=C2=A0=C2=A0This was trace=
d
> the the code creating the directory just stripping the last /
> and then copying to the directory.
>=20
> Choose to sanitize the entry where possible for ease of use verses
> a small performance penality.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 15 +++++++++++++=
--
> =C2=A01 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-i=
nitfs/files/obmc-update.sh
> index 7120a18..bfacd00 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> @@ -170,13 +170,24 @@ then
> =C2=A0
> =C2=A0	while read f
> =C2=A0	do
> -		if ! test -e $upper/$f
> +		# Entries shall start with /, no trailing /.. or embedded /../
> +		if test "/${f#/}" !=3D "$f" -o "${f%/..}" !=3D "${f#*/../}"

Can we do this with `readlink -f` or `realpath` instead? Do we have
them available in this environment? As in, test that the result before
and after realpath are the same. You can tell realpath to not expand
symlinks.

> +		then
> +			echo 1>&2 "WARNING: Skipping bad whitelist entry $f."
> +			continue
> +		fi
> +		if ! test -e "$upper/$f"
> =C2=A0		then
> =C2=A0			continue
> =C2=A0		fi
> =C2=A0		d=3D"$save/$f"
> +		while test "${d%/}" !=3D "${d%/.}"
> +		do
> +			d=3D"${d%/.}"
> +			d=3D"${d%/}"
> +		done
> =C2=A0		mkdir -p "${d%/*}"
> -		cp -rp $upper/$f "${d%/*}/"
> +		cp -rp "$upper/$f" "${d%/*}/"

Again the while loop and other bits can hopefully be replaced by
`readlink -f` or `realpath`. The whole trailing-slash thing with `cp`
always throws me.

Andrew

> =C2=A0	done < $whitelist
> =C2=A0
> =C2=A0	if test -n "$mounted"
--=-BuD5CsBlXHwWbURJG+wt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa4DtAAoJEJ0dnzgO5LT5K+oP/0LbaJ3HlhbTbdxGU+iZV5vX
dfAq0SrVoFY71ZKYkZSGCR8T/Lj7A6yYWIQkQODRcJTDjAZYQBZB02vel9bne31l
aUzr1olLYlwhNBPTBsvbPtSsKwhFRI0fWBHOY02rA+emM6b2zoQd4gXxlCpUhtL7
at1BtM2jR6tt3gkVI3NInKz3+0XAyjdeLa7TffeZ887xQxLJic/LhGiVbJ1Sra19
MizX6p8SaOShboymLFgGV6m+tDLvP34c0v7zq1JfrklzSIgsbmB8FOlZlRP5wHu8
gNi8X5BiGIgdzWpY1n6xfYO0Dnuk+Ie3FeItDVmxcwXYbSW+baX8iHf4Q3j4yVZE
2NB8mchmkmtCXrVGDN4Nax0yX1Z8a84U5x9tzUAzK0Mv28UwL68pkZNrA0DxsFpG
/5DmfFvoHVZjKYfd4d1um40hiSM7qKVQhUOWkpgDeu9nw32qtH2ypMbI36dQ7iUH
p41JKp9fEbIkVDs16JH7nxv31fhje1amuiqWmS2tkcjF9BsH+57OgQqRIixcKWDW
52EOeFi7jNan/exAZbXu/ujagXP1pheSQ2xzjmk7tTwz1vcdHGD91fDRuWToOWFJ
SadjvTcmUmNbqrLkRlVO3nGTBzOnDYIm8319+glHN/nOEkAXNOE+o3gj1rh5ZQ9n
7ftsrXnTliXzhcsRplaz
=6sX+
-----END PGP SIGNATURE-----

--=-BuD5CsBlXHwWbURJG+wt--
