Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQtDc4srmzDq6W
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 02:53:20 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1458229994637824.9476211920393;
 Thu, 17 Mar 2016 08:53:14 -0700 (PDT)
Date: Thu, 17 Mar 2016 10:53:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: [RFC PATCH] Add palmetto target to runqemu
Message-ID: <20160317155312.GA6045@asimov.austin.ibm.com>
References: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 17 Mar 2016 15:53:21 -0000


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2016 at 03:22:47PM +1030, Andrew Jeffery wrote:
> Hi all,
>=20
> The patches modelling a bare-bones AST2400 in QEMU have been merged into
> master for the upcoming 2.6 release. Attached is a half-hearted attempt at
> integrating the necessary bits into openbmc so we can `bitbake
> obmc-phosphor-image` then `runqemu palmetto` to boot the BMC kernel and s=
ome
> representation of the userspace.
>=20
> I'm not sure if the hacks I've made to runqemu{,-internal} are the right
> approach or even something we'd want to carry going forward. Similarly, a
> wholesale switch to qemu_git.bb might be a bit extreme - any thoughts the=
re? I
> must admit I haven't tried applying the AST2400 patches to 2.4, maybe tha=
t's a
> better approach? Regardless, depending on 2.6 when it gets released is
> prefereble, but that's probably a month or so away.
>=20
> I'll split the patches up in the future, just wanted to get this on the l=
ist
> for some feedback.
>=20
> Cheers,
>=20
> Andrew
>=20
> Andrew Jeffery (1):
>   RFC: Add palmetto target to runqemu
>=20
>  yocto-poky/meta/recipes-devtools/qemu/qemu.inc     | 17 -----------------
>  .../meta/recipes-devtools/qemu/qemu_2.4.0.bb       | 22 ----------------=
------
>  yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb  | 21 ++++++++++++++++=
+++++
>  yocto-poky/scripts/runqemu                         |  9 ++++++---
>  yocto-poky/scripts/runqemu-internal                | 12 ++++++++++++

Please refrain from making changes to content in the yocto-poky tree.
This is intended to be a clean mirror of upstream yocto.  Yocto has lots
of capability for overrides in the openbmc parts of the tree.

>  5 files changed, 39 insertions(+), 42 deletions(-)
>  delete mode 100644 yocto-poky/meta/recipes-devtools/qemu/qemu_2.4.0.bb
>  create mode 100644 yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb
>=20
> --=20
> 2.5.0
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW6tLoAAoJEKsDR8wtAMEZDN4P/iYA9wHXhg7VTSqxW69utzNS
dx5gQX3YyTfDqECO/IVBfTsdcrczVzccQVcb3Ec3pDGLR1jWRu48JkGp2yv4+xsz
mnItQ9Am2H0OnJqtYdfNnEYKLcdUOodZhIqDpiBt1aR6Lm12RIFvoXneVsto5WCx
7Nnh4Isj/cjxlnMyTESQNp62GPYSuUX9+HKNqOhhArQUXN89TWTD7xJr6mNGAH/1
IGDP56b69nvkrydn5qjBgWrGJ3C+BjDWqRu3OzLvGEL46grNx4d+iz+z7DJ4x29j
bnrNZSYAXhZPegefgjv8Cz5M1hwAdONJSiL9+swyAOuNffUWzY/V+QMiTB78B9/Q
yfMEFYqcdqxbfo7DFwKvh7BxLrW0ADRl/LT8Ae+8P6dass6tP/gXGAJKPvRQgmfP
pPa6z6fzhANPL0nQLhWYDNwolv3LoySApOonqxzJSdZJPiK/GjNHCR/aZ/x5/yuQ
7HQkzXDbcNTo51A7eL5K5ytmhBqQNsqEWMJ/NFtuoUXKnpXgeTj8G5TJ5sCLW8a+
hhaWvNrXH2hayttKD7FEB6BYWyX3ujGWKHdgMAU8i6LtLbjMu6bvNWHyjiUJ0pMb
PBB62yq6pTKrWyTl/h1KK2rdfVgGKIGxx5f+EscmIZrgpNeCSmEFWN+xMxQsaFML
7NHy3gik1+b/AezIkZ5f
=lsBW
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
