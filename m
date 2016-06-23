Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZq3V5JqBzDqhc
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 14:58:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=MOun1EFE; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=uTj8DcPi; dkim-atps=neutral
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3BBA5279;
 Thu, 23 Jun 2016 00:58:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute3.internal (MEProxy); Thu, 23 Jun 2016 00:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=vipuS
 3LJLLbKVPkLSEe0Kl3bu+4=; b=MOun1EFEnwlhQCEYWTWIgb01BL+O7zzNDbkAX
 0eZJW3AA6U+9cOJ0U1cTpqqPKIbfTNYvW2s2UuqJlmuZ5+m3kRzCDylwOe4AEoxd
 AUg7SUMAWw4y9VnYupWP9WtdSrAQCzKRD6nrR50+OuYok5A6NOcHuj/212r1hYO0
 NvYvWg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=vipuS3LJLLbKVPkLSEe0Kl3bu+4=; b=uTj8D
 cPij4UcRI2XXQk/z4gujDZzs66ZNLfVBAuUPYFW+Cuvy50RgKX4aHqDlbyDW9qIu
 0B0CaIurQvkQEOv9o1miNOqAlAtJaOHFDTmVH5DsTrvLT8DMWRxeysmq1F2mw7iZ
 nMNsHv6GRSioshmghivnWcgxfua+cfJcOK1CQ0=
X-Sasl-enc: Rc5n+CO5hidW+yH8WQH7H17HV367GXl/UF79S1SXD+hL 1466657890
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CE9FF29EE;
 Thu, 23 Jun 2016 00:58:09 -0400 (EDT)
Message-ID: <1466657885.23740.45.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 07/18] initfs: update: Don't exec sh or
 sulogin on error just exit 1
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 14:28:05 +0930
In-Reply-To: <20160623003038.2361-8-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-8-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-HsFDlT3IFz9Gv5pgN1QR"
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
X-List-Received-Date: Thu, 23 Jun 2016 04:58:15 -0000


--=-HsFDlT3IFz9Gv5pgN1QR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>=20
> When update was written it was exec'd from the shutdown script
> and hence took over pid 1.=C2=A0=C2=A0Since exiting in that environment w=
as
> a panic situation, the script instead started a rescue shell with
> its output presumably on the console.
>=20
> The calling convention was updated to be a simple invocation in
> commit dbacf104885c ("obmc-initfs: run update as a sub-script")
> but the error handling was not updated.=C2=A0=C2=A0That error handling is
> now becoming a hinderance

hindrance

>  to use from additional environments so
> change it.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 23 ++++++----------------
> =C2=A01 file changed, 6 insertions(+), 17 deletions(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-i=
nitfs/files/obmc-update.sh
> index aa8fd89..f8e551c 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> @@ -2,9 +2,6 @@
> =C2=A0
> =C2=A0echo update: "$@"
> =C2=A0
> -export PS1=3Dupdate-sh#\=C2=A0
> -# exec /bin/sh
> -
> =C2=A0cd /
> =C2=A0if ! test -r /proc/mounts || ! test -f /proc/mounts
> =C2=A0then
> @@ -21,12 +18,12 @@ then
> =C2=A0	mkdir -p /dev
> =C2=A0	mount -t devtmpfs dev dev
> =C2=A0fi
> -while grep mtd /proc/mounts
> -do
> +
> +if grep mtd /proc/mounts
> +then
> =C2=A0	echo 1>&2 "Error: A mtd device is mounted."
> -	sulogin
> -	# exec /bin/sh
> -done
> +	exit 1
> +fi
> =C2=A0
> =C2=A0findmtd() {
> =C2=A0	m=3D$(grep -xl "$1" /sys/class/mtd/*/name)
> @@ -130,7 +127,7 @@ do
> =C2=A0	if test -z "$m"
> =C2=A0	then
> =C2=A0		echo 1>&2=C2=A0=C2=A0"Unable to find mtd partiton for ${f##*/}."
> -		exec /bin/sh
> +		exit 1

Is there any value differentiating between the failure cases? I.e.
could we `exit 2` here instead?

It is just a thought and I am not overly fussed by it.


> =C2=A0	fi
> =C2=A0done
> =C2=A0
> @@ -173,11 +170,3 @@ then
> =C2=A0fi
> =C2=A0
> =C2=A0exit
> -
> -# NOT REACHED without edit
> -# NOT REACHED without edit
> -
> -echo "Flash completed.=C2=A0=C2=A0Inspect, cleanup and reboot -f to cont=
inue."
> -
> -export PS1=3Dupdate-sh#\=C2=A0
> -exec /bin/sh
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

--=-HsFDlT3IFz9Gv5pgN1QR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa2xdAAoJEJ0dnzgO5LT5rEYP/3S3V0BxBPwtJsmutiO8L3LZ
bD3TApOuU7arNoU/hx5tpQfZaGKzzRgLCXTGLsYSLtGvaIUqALB/1vC6iS75mviM
6gRjcm7njQ0N+X6SEj5m+P3/f6bPJJUiuCRzp0O4c8WOapelScy9V3AcYLlr2rDf
YYC0cyhR8T8DlIItlvr+DuNGzfzb+LjDHU8OnAK0suxJ2F1uLcr0tMgLkYLUY+XU
9qxY/33nYGx9DGUR+DS6OEzOYeKyT6hmezgxhIZHoEPzexyWcrJnce+pJfm44AbD
toHN+FH9f8rRHn2YjM1LPJfi2sWBzsGn2U00kPPXGFtsStsAT6MSYV5SkNwnKC1i
+kFBPuPsw1Z3wdUpBlWgiJFABm2mMn4gX27oWgYjh/1gMvaJpETNFedoxQmYmSTC
2ESfneQzqtidlOOLa0l7h8q8dB2hovOoNXA0RDBsWu7YTimxZiHt20P4cMUsC84G
3tVPS2cifGT1jP9vAeu3gipEK92rbtX0/QFXCcm6SS4NS1BKEazXtlLwOY99MqfK
BeaXlKHIcRv3k/sDHW+kQp5UCNvru6CM8vF4IKpLnlQ5T+yVyx7jsgrzya5ALpqT
YLgfvQd1ypPECp5V7XhN2BxqbviVQimq3EKftdW/Kfh0EBiArSZKMHoVG3crdDBe
blSahn+coBd/QjgILteE
=pMUf
-----END PGP SIGNATURE-----

--=-HsFDlT3IFz9Gv5pgN1QR--
