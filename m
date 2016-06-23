Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZr1Y6gRszDqhT
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 15:41:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=UZAoexM1; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Wx0hCEJP; dkim-atps=neutral
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id CA3ECC06;
 Thu, 23 Jun 2016 01:41:35 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute6.internal (MEProxy); Thu, 23 Jun 2016 01:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=uZjY7
 QULiQtsJAt70CQ3d2k40vw=; b=UZAoexM14UHT7dYHyyResjiRpjjyODkyeOiQd
 OeIjW5+e1ROye91W06vNk/4ZCrMbdp+bkly/stpJ/SKl8zUqwpPYCqZdB4opDDtV
 QVHVI6xnEyvKduJWmy46qdVhM9coWZXYJVwYKanVWBhxEo0XO8WbL+Dio+Vmnp7L
 2NxjpY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=uZjY7QULiQtsJAt70CQ3d2k40vw=; b=Wx0hC
 EJPrkLkWirL16MG4SGITAxk/2fkwr8qR26Ckjs+mByTeQIpzI2IPXMVj+TN6gW1C
 qGVTKwGFuoy6ewx46YMsML2grpr7gcWLyqoBn0d4M69gX/Ab/HQV9i7I7pxD7T+g
 Gs7XK0JtIze4LkQy8C8PysCNKAES9m+VTrm84Y=
X-Sasl-enc: Q9Hnwfc0/2yguZAtEy2m4Vzp7jbsVaP2ysYIN4dUNwjZ 1466660494
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id AB0F7CC01B;
 Thu, 23 Jun 2016 01:41:33 -0400 (EDT)
Message-ID: <1466660489.23740.60.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 12/18] initfs: update: add check for image
 size vs mtd size
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 15:11:29 +0930
In-Reply-To: <20160623003038.2361-13-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-13-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4bxTDhq0X35G2rxcxI/I"
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
X-List-Received-Date: Thu, 23 Jun 2016 05:41:38 -0000


--=-4bxTDhq0X35G2rxcxI/I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>=20
> The flashcp command will check the file size vs the partition size,
> so add a check when looking at images.
>=20
> Use stat -L -c "%s" to get the file size, and compare it to the mtd
> size from the sysfs size attribute.
>=20
> If this check is suppressed the enforcement is left to flashcp.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 17 +++++++++++++++++
> =C2=A01 file changed, 17 insertions(+)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-i=
nitfs/files/obmc-update.sh
> index 22c9dcc..06e0e74 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> @@ -48,6 +48,14 @@ childmtds() {
> =C2=A0	done
> =C2=A0}
> =C2=A0
> +toobig() {
> +	if test $(stat -L -c "%s" "$1") -gt $(cat /sys/class/mtd/"$2"/size)
> +	then
> +		return 0
> +	fi
> +	return 1
> +}
> +
> =C2=A0findmtd() {
> =C2=A0	m=3D$(grep -xl "$1" /sys/class/mtd/*/name)
> =C2=A0	m=3D${m%/name}
> @@ -85,6 +93,7 @@ doclean=3D
> =C2=A0dosave=3Dy
> =C2=A0dorestore=3Dy
> =C2=A0toram=3D
> +checksize=3Dy
> =C2=A0checkmount=3Dy
> =C2=A0
> =C2=A0whitelist=3D/run/initramfs/whitelist
> @@ -115,6 +124,9 @@ do
> =C2=A0	--no-flash)
> =C2=A0		doflash=3D
> =C2=A0		shift ;;
> +	--ignore-size)
> +		checksize=3D
> +		shift ;;
> =C2=A0	--ignore-mount)
> =C2=A0		checkmount=3D
> =C2=A0		doflash=3D
> @@ -162,6 +174,11 @@ do
> =C2=A0		echo 1>&2 "$E Unable to find mtd partiton for ${f##*/}."
> =C2=A0		exit 1
> =C2=A0	fi
> +	if test -n "$checksize" && toobig "$f" "$m"
> +	then
> +		echo 1>&2 "$E Image ${f##*/} too big for $m."
> +		exit 1
> +	fi
> =C2=A0	for s in $m $(childmtds $m)
> =C2=A0	do
> =C2=A0		if test -n "$checkmount" && mtdismounted $s

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
--=-4bxTDhq0X35G2rxcxI/I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa3aJAAoJEJ0dnzgO5LT5jVQP/0Q3CVLu/DGPR+S7s9Qb6SWV
7A44f2vOKCOCVxGjkYT+v6cLoD0NSNQvvsIUo+LPFOCgCzKrEkEwOk4JuzwL6Wgl
EQmq+HS0KRIjA9nhP3ZadzBnKsbbDeq+7jm0JLHhzG2C9rIyVauF/nLA0NVe9H0E
O/tIAjZ6upsQ/l97N3rT5OLp9wYEEOfCs/QiBcRZbGGDaLbWlO2pTPMDkvBWUgYA
IBVpFtNsaQwGYYqNM1ZxW18h+M1pZQbS96/DkvPUSpgInbm+TzJVZpp3UW/RbzNi
jCFwrUD1EO1EsK9nlN4CMXh88x1NLzPbbnEMHoSWyXw94gDnoOJNaRvSu20jy73k
i4o/elgpnwy7iZe/V/qgl0sv2FxEPseKxdnlJkIl2CeJ75UoweZ7/2icWEy8RQ7w
cyIpw4ZVSg/wiiYvI/ZxI78KxPn8/5fIN3SeiEbPKKnf3DKHjk1tO3c8lZK5Ecr8
efWcEOuA47YcKmlr979exj1ZinK9RERUhuWfDXMrbVxNxDQYx4IE4qDusy5okv6i
NNO+oTQ7WYIacIwPCnnnw9aYjrIEojEJ/qrmOY4HnW7slUjPXvsyZFy3Xig1Kwfz
VbPdbh6eYOEfy8Av3gbbZivsK6PQm5RmNnCa2vi0rs2ALlheAlAUjm1v0DQXPeT/
cdHBSrF5mA2cKr3ojFOv
=Ll4+
-----END PGP SIGNATURE-----

--=-4bxTDhq0X35G2rxcxI/I--
