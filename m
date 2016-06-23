Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZq842jwgzDqlb
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 15:02:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=JP6papkP; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=GCmoXHDR; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4819BC1D;
 Thu, 23 Jun 2016 01:02:10 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 23 Jun 2016 01:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=N5aVs
 CDE25u69tKYUE9boQg9Eo0=; b=JP6papkPLTUv1DZ4ZGm+0AutTcqijptvQT+oo
 1a+62Way3n1y15u7dba3dErKls56ovl1svVgGnKujrvhl8D8JSLIEZ/Ff0VsD8p5
 Z3cZDXp+SCGPA9ugjXN7OF+5bef3YKWTkbIdc4oCAGduxd9TABMUxh0nnxk9lDKL
 CG/7lY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=N5aVsCDE25u69tKYUE9boQg9Eo0=; b=GCmoX
 HDR5DRaylJ3zcL9NBZJ60KqpcNY+XAhNB6D+N/e9JnuetDXoYcxOGMGGP7DLq/r3
 HWwyyJJJ6g9PT/7zsydIRAHvoDNYldSQx+f0QCy1OPV2g0fwbdtFwRDH17aNvXxD
 8g44g5pjuuOST6pQ5gIVehwLmT+b64ltjR4hOQ=
X-Sasl-enc: 3yZeFPAvxFmYJv6EJ4npExOneqipWMqrGsO4I3xRcNWo 1466658128
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB4F0F2022;
 Thu, 23 Jun 2016 01:02:07 -0400 (EDT)
Message-ID: <1466658123.23740.46.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 08/18] initfs: update: Do not cause an error
 if no files were saved
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 23 Jun 2016 14:32:03 +0930
In-Reply-To: <20160623003038.2361-9-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-9-openbmc-patches@stwcx.xyz>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8k55SEtuvJw08hFioG9V"
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
X-List-Received-Date: Thu, 23 Jun 2016 05:02:12 -0000


--=-8k55SEtuvJw08hFioG9V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>=20
> If there were no files in the read-write overlay file system that
> were in the persistent file list, then the save directory will
> not be created and therefore not exist.=C2=A0=C2=A0Skip attempting copyin=
g
> the non-existent directory in that case to avoid the error message.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> =C2=A0.../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.=
sh=C2=A0=C2=A0=C2=A0| 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-i=
nitfs/files/obmc-update.sh
> index f8e551c..f0ca989 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> @@ -144,7 +144,7 @@ do
> =C2=A0	flashcp -v $f /dev/$m && rm $f
> =C2=A0done
> =C2=A0
> -if test "x$toram" =3D xy
> +if test -d $save -a "x$toram" =3D xy
> =C2=A0then
> =C2=A0	mkdir -p $upper
> =C2=A0	cp -rp $save/. $upper/

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
--=-8k55SEtuvJw08hFioG9V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXa21LAAoJEJ0dnzgO5LT5yHYP/jizZfDIerX9h1hpr9EKwZRQ
xbGd+Qmtk4RsdlfDxZwQirosilwwW97GEedLRTwvT6IjNJxSKFtLIkMbEt/beIW0
yUq1gwYYE7VXsezGpukqAQYUSkIEqzMrL7hB1Dfa2AxkhmOaY3QLS5XtLALtzT+U
YfJB4vGzv9k2CMkkb08DP1XxEDpRqMVNThVpNSuExFhr491gfrj1otFofi0F1vFP
EE/mlT9/Uxy+eI+aTKeYj6bcuWrXhEkzRGKPNmNyi6wWUg7VwX6trhIbZ6cCDBCB
+NKqNqrjAUV9ChS0J3iIGnmASoR7wGwLQm6dvzVSoYKR+y/7et1Xw1Re1TCb2QK8
BZrUPRjuTNqNTLDDB5mm15OD8xcT0aOaDuuoCIairIMd/hd4iFm/Q21TDnvg566f
GmbUyZ6ecobPztutsdlqlyMIzwqEPSOjFozrkmSVhoFS/X7it96v3qyoj+UH4vfi
szi56pw9vMlYBBIuCXSlG0ZOGmVC4++zAYyt8m8uJTMCR1Rc0OopXDAsPC8E2/2j
rthX1L54kGqqB3FjU0uP2EQbxPlb51jOgRjwoEkFGVuSanvqjUGFpXavawQPmYEp
ukPQCI6jDP8VAcmG4Z1vm2HC13XrZthATwjGpK/1UCzmWcc19sn+IELytNgcFNjw
T3tNwOJ3zOJr8ir9jVfm
=0buN
-----END PGP SIGNATURE-----

--=-8k55SEtuvJw08hFioG9V--
