Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id DF00E1A0013
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 11:26:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=YJGEqURU; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id D443C604069;
 Tue, 23 Feb 2016 16:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=kgz5zLb2zrBhGaOehMbWG
 ZkcmzQ=; b=YJGEqURUUD8k8CpAjq9l5TxMnhSAuJNEHZQMqTJFE8OqUzsZuwVzI
 8bbpdsA7bGcUzZjztajXPO2o50BBLnAw/y0975ubwrkQCmLEP8juoRRdisGf1G6Q
 QYFVMRYLZXJyrnuaB9z/hZe5EOEWoYgv+/nDINtq3akds7ZGrSRJuE=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 19E02604061;
 Tue, 23 Feb 2016 16:26:07 -0800 (PST)
Message-ID: <1456273564.27420.30.camel@aj.id.au>
Subject: Re: [PATCH v3 5/6] openbmc: Lift mkfs opts to variables and use
 OVERRIDES capability
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Milton Miller II <miltonm@us.ibm.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 24 Feb 2016 10:56:04 +1030
In-Reply-To: <201602240009.u1O09FrJ000479@d03av03.boulder.ibm.com>
References: <1456238703-11117-6-git-send-email-andrew@aj.id.au>
 ,<1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <201602240009.u1O09FrJ000479@d03av03.boulder.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-m9WiCSZEHxvYyjifobz9"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Feb 2016 00:26:10 -0000


--=-m9WiCSZEHxvYyjifobz9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-02-24 at 00:09 +0000, Milton Miller II wrote:
>=20
>=20
> Andrew Jeffery <andrew@aj.id.au> wrote:
> >Subject: [PATCH v3 5/6] openbmc: Lift mkfs opts to variables and use
> >OVERRIDES capability
> >
> >Moves the ext4-specific mkfs options out to configuration variables.
> >OVERLAY_MKFS_OPTS can be overridden using the usual bitbake OVERRIDES
> >mechanism, where the override postfix is 'rwfs-${OVERLAY_BASETYPE}',
> >e.g. rwfs-ext4.
> >
> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >---
> > .../classes/obmc-phosphor-image_types_uboot.bbclass | 12
> >+++++++++++-
> > 1 file changed, 11 insertions(+), 1 deletion(-)
> >
> >diff --git
> >a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> >b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> >index 96193a3..f75cdc1 100644
> >--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> >+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> >@@ -23,6 +23,12 @@ FLASH_ROFS_OFFSET ?=3D "4864"
> > FLASH_RWFS_OFFSET ?=3D "28672"
> > RWFS_SIZE ?=3D "4096"
> >=20
> >+# Avoid setting 'ext4' or 'jffs2' in OVERRIDES as this breaks the
> >build. Prefix
> >+# with 'rwfs-' to avoid option collisions.
> >+DISTROOVERRIDES .=3D ":rwfs-${OVERLAY_BASETYPE}"
>=20
> or more simply comment the reason it breaks:
>=20
> # OVERRIDES of just the file system type are reserved for=20
> # the primary image type.  Prefix with rwfs- for the overlay.

Gah, got a link to the documentation? I concluded this through blood,
sweat and bitbake, but didn't have anything formal to clear it up.

Andrew

>=20
> otherwise,
> Acked-by: Milton Miller <miltonm@us.ibm.com>
>=20
> milton
>=20
--=-m9WiCSZEHxvYyjifobz9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWzPicAAoJEJ0dnzgO5LT5zxwP/jGU+/sWuKFhth1GPjidINKg
aXekCNBjzbuzGsvwsdXglCxNWGaRhJ8dktyobEx4wIWULOApIEZDI41uBA/DmlDZ
DCl5bJfGGmlzYsdALEmKZDNXjrVa9IM5jTnT+0Nm+dMHiNY8eyvUx+apfNeBTVt2
81DwIn8oV8M83DRj23YST2UT/RM3cD+DUI267gNivftqtpEBZODgLy06nVpMoemV
M+ravqtCm0FgHvEsLzNSdphVlejak2VlkfYyPAGYgwU0NdwlreJaEgugKX+bWwCN
kcnapTCtpCaPDqSMAgdn6aJoAANVv39mOuIXCfmB0dv/JyQtrhZuwdVEaXep373M
xDrxTu2ZPVfi530oE5zUfS+lNx0/OUMmmdUrZH4o4pYa+GMv0/L1llW4yL7TTDCw
bKY9Y471TFwNXYBblgp+483KYYI1CW8qlToHA/90gDYDFTIMKoSU+0ifLOQrMtpW
Fbu3pxYF4OBU0FHNvh8R7l7f70S6qTYfprNiimTcWjMDbMElKO59sV6MfsPRIa80
tAHtzub3zJkJrN1CVdDKGiY3YijNGJdaSOjGtjQcD6EZekJHTDMYUw/GOXvgRHWM
KdXMJMhepmgjL3P74hpvEkxUcjD35+3WZmm7tVXLSXec70cKy4bFuZbn0EYKBA0W
rTJiAPlpsE9xurQxQczs
=z50T
-----END PGP SIGNATURE-----

--=-m9WiCSZEHxvYyjifobz9--
