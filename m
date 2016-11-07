Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCHh403DpzDvMQ
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 03:19:15 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1478535545548303.80063334559236;
 Mon, 7 Nov 2016 08:19:05 -0800 (PST)
Date: Mon, 7 Nov 2016 10:19:03 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Yi TZ Li <shliyi@cn.ibm.com>
Cc: Mine <mine260309@gmail.com>,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: How to handle GPIO differences between P8 and P9
Message-ID: <20161107161903.7gbgafvj6vb6w4k4@asimov>
References: <CAARXrtmemiSFPH7RGxFLcddt1Ld4pGTwsDX-rPtAmf2coS8VDg@mail.gmail.com>
 <20161107040643.GE15757@heinlein.lan>
 <OF7F37D1BE.BCC7E74A-ON48258064.00313B2C-48258064.003271BA@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k5c7vdikt6eig2o7"
Content-Disposition: inline
In-Reply-To: <OF7F37D1BE.BCC7E74A-ON48258064.00313B2C-48258064.003271BA@notes.na.collabserv.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2016 16:19:16 -0000


--k5c7vdikt6eig2o7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 05:10:59PM +0800, Yi TZ Li wrote:
> I committed a patch: https://gerrit.openbmc-project.xyz/#/c/1019/
> to add a getSystemName() dbus method in org.obmc.managers.System interfac=
e.
> There are several places in skeleton requires fix for a specific system.
>=20
> Other way be add a compile flag in yocto when building Skeleton.

We are really trying to avoid "if (machine_type =3D=3D ...)" type code.  Th=
is
becomes a gigantic problem when we are talking about supporting 3 dozen
machines.

--=20
Patrick Williams

--k5c7vdikt6eig2o7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYIKl3AAoJEKsDR8wtAMEZYmsP/R8H5/lqiRLOhrcjjrjZ6p5V
jgcrNuach2wFRE03iV0JTLqQOnu1hwUhUExPY2kvLB3OdltV0DzNb7+G+Cp/XESV
9Imw422FDHHnOf6fHdnjqlVO9XkXaWWX/x5vi0RhyczktftYOS5X9200erRVS23K
UlHhgsPcW3vtEy8/ATFnCeefAVMmdI+aqG50idGdQSKzHpcPKnUVzG1HU4xtkW8M
mLCI7LaG+oscvEc/9NJvulmsSO3MweMRw8sg1nak60e+nLl4q018qtwE3N6sLMrA
OG9yzFtYq0zuBYganMZHntxea7x3KsGUOb8XpYJEU7WsV9fk6HpFFQTJM3Dz8+cS
O+aEpgsQXQb+Ex//6FFZJnDgtXziUxT1RUS0DZrW2Zci0BDfnSI5lacILEX+c23C
KdCAznEKMOs97htuvYhYrVjKvILOGzq6Iuy8YsZ8zcclpUlLXtuksHhMmCZ+7TJ6
SFWLdsFzm6V0PNUQsPfr7o8sxe7YTLrPcDjfppYtfCaG0KRiFV3BghxVaIn8N5Ru
LCRNf5PO4cUCl+o8SpgMYYUtL53RCi2hU55nBaQesGHA5nY7dDVegeyYQWOGk6fH
aVjr+W4QRMe9FJffivXOBe/d9VJh/PlyBdW1TtlJgqWk7rjMUGrxoK/eHjMFMzn9
iFZ2fON0LYRYfLCm25B8
=RF5G
-----END PGP SIGNATURE-----

--k5c7vdikt6eig2o7--
