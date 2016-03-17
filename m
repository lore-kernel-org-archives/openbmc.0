Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQw0H6Zt9zDq6W
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 04:12:47 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1458234760008777.0463046917986;
 Thu, 17 Mar 2016 10:12:40 -0700 (PDT)
Date: Thu, 17 Mar 2016 12:12:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Shay Slobodkin <shays@mellanox.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Assistance adding new system into openbmc project
Message-ID: <20160317171238.GF6045@asimov.austin.ibm.com>
References: <DB4PR05MB09410DE4CC28F7164F053B26D5B40@DB4PR05MB0941.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Content-Disposition: inline
In-Reply-To: <DB4PR05MB09410DE4CC28F7164F053B26D5B40@DB4PR05MB0941.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 17 Mar 2016 17:12:48 -0000


--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Shay,

Sorry for my slow response on this.  Some comments below.

On Thu, Mar 10, 2016 at 01:03:22PM +0000, Shay Slobodkin wrote:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> root
> |-- meta-openbmc-bsp
> |   `-- meta-aspeed
> |       |-- conf
> |       |   `-- layer.conf
> |       `-- meta-ast2520 (New SoC)

Is the ast2500 the "class" like ast2400 or are ast2520 and ast2500 two
different things?  If we can add most of the support as a 'class' of
SOC, I would prefer that, so that we can reuse support between all the
flavors of the ast25xx family.

> |-- meta-openbmc-x86-machines

This should be under meta-openbmc-machines I believe.  Then meta-x86?

> |   `-- meta-mellanox
> |   |   |-- conf
> |   |   |   |-- layer.conf
> |   |   |   `-- machine
> |   |   |       `-- include
> |   |   |           `-- mellanox.inc
> |   |   `-- meta-mellanox-edr
> |   |       |-- conf
> |   |       |   |-- layer.conf
> |   |       |   `-- machine
> |   |       |       `-- include
> |   |       |           `-- mellanox.inc

This all looks fine otherwise.

> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Also, should we add a "local.conf.sample" file under the "meta-openbmc-x8=
6-machines/conf" path?
> If so, we were wondering about the following variables under the local.co=
nf.sample file (we took the phosphor one as example):
> PACKAGE_CLASSES ?=3D "package_rpm"
> SANITY_TESTED_DISTROS_append ?=3D " RedHatEnterpriseWorkstation-6.*"
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
> USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
> PATCHRESOLVE =3D "noop"
> BB_DISKMON_DIRS =3D "\
>     STOPTASKS,${TMPDIR},1G,100K \
>     STOPTASKS,${DL_DIR},1G,100K \
>     STOPTASKS,${SSTATE_DIR},1G,100K \
>     STOPTASKS,/tmp,100M,100K \
>     ABORT,${TMPDIR},100M,1K \
>     ABORT,${DL_DIR},100M,1K \
>     ABORT,${SSTATE_DIR},100M,1K \
>     ABORT,/tmp,10M,1K"
>=20
> Guess we should use the "genericx86-64" as MACHINE variable

I think 'edr' would be your MACHINE variable value.  The openbmc build
system doesn't care really what processor type the host has, except when
it comes to the corresponding application suite needed to support that
host processor.  (Host vs BMC in this context).

>=20
> We were wondering what specific "oe-init-build-env" and similar files we =
should change, in order for the project to compile.

Under meta-mellanox-edr you need a few files.  Compare with
meta-palmetto as a reference.  The local.conf.sample you mentioned above
actually goes under the machine.  You shouldn't need to update
oe-init-build-env, because you pass in a TEMPLATECONF environment
variable that selects the local.conf.sample associated with 'edr'.

>=20
> Cheers,
> Shay

> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--=20
Patrick Williams

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW6uWGAAoJEKsDR8wtAMEZygkP/3iBoTdLZC1D8QcBT0vybW6h
H8mPLEjHBg3gl0NruEXnNCeegGO/XXshzxpHEnb5Km78Njy2YwCLJbtdWfTWY5Xu
ImpW/3kn6cNb5HuamWDD4kraGoW4TQ/fml68SWw8LFKyIgRZbqXNpP2I+57kTeqd
XJ0glwTuwittowndHGIMDSHuCgG8MXItXelKw8n5onxMumyVG6r+BAE0vDHCHN+0
M2xWQWQ4RSd/t4nEKRVKbUSK7WpvwKMFP5l8YszENbd518iHgtRfg5Uajc+MBTmC
lJvlukbVlcoMyS/0zW4uKjYj5JcCaaXz/mEgvlaa5zQYZckYC78tfZS1uuUvkU4m
USeqVzZ9Pac34jAKewBFGqEQmRWwtznWILmWS5A2yl1m/bVuMvbGSsMqqlVUE25U
qVAiSrkolQU2rTSIsi/tyOb/5pWCp8TSN+u5ITYr//8GqpMfYRodRROnpPiQUNYf
GjMJE+0tf5seX0HCtLlph+6dDqVCzClYYU3kn3EKFqRrQilIxZk85W+g0odyRT38
wEhJWQ/6yIsSubFX1F9uBY4Lt4ONX8+qe8NKoboZ4Wtzlu15Dx3WCJkY5yNExBHG
9sPrrhTaI2MrYMCf9MqwKj5w8Q4Z0DIq17s0t9UoTEWRbuYbSjocCWRFilAcGOqR
TE6uOfTNhL1ULpSpueEi
=MrQL
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
