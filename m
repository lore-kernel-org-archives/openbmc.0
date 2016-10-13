Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svs0p0YhMzDt0J
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 00:25:13 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1476365107555841.3534397106195;
 Thu, 13 Oct 2016 06:25:07 -0700 (PDT)
Date: Thu, 13 Oct 2016 08:25:00 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: Re: [openbmc] Adding new recipe qa error
Message-ID: <20161013132500.GC32710@heinlein.lan>
References: <C160D2872FE0DE4683E1910F9BF829414846E409@avsrvexchmbx2.microsemi.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Content-Disposition: inline
In-Reply-To: <C160D2872FE0DE4683E1910F9BF829414846E409@avsrvexchmbx2.microsemi.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 13 Oct 2016 13:25:14 -0000


--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2016 at 01:07:30PM +0000, Arjun Padmanabhan wrote:
> As an alternative way, I am adding a custom recipe which includes my appl=
ication. Application folder structure includes cross-compiled *.a and *.so.
>=20
> I am getting following errors while do_package_qa().
>=20
>=20
> -          Mycode-1.0-r0 do_package_qa: QA Issue: non -staticdev package =
contains static .a library ...............
>=20
> -          Mycode-1.0-r0 do_package_qa: QA Issue:No GNU_HASH in elf binar=
y .......................
>=20
> -Is there any way to include static library in my recipe to openbmc image=
 by getting past qa issue?
>=20
> -Is there a way to skip GNU_HASH check in so files which is in my custom =
development recipe?
>=20
> -          A way I found while searching through google was to add export=
 LD=3D"${LD} --hash-style=3Dgnu" before compiling my binaries. Is there any=
 other way where I can disable GNU_CHECK for my recipe?
>=20

Generally speaking, Yocto prefers you to use bitbake itself to build
your package.  Rather than your recipe pointing to a pre-compiled set of
binaries, your recipe should point to your source and then build it
directly.

The "QA Issue: non -staticdev pacakge..." issue is a valid issue and one
you should not disable.  It does not make sense to put a .a file onto an
installed package on your target because you do not compile and link
programs on your target.  There is no way to use a .a file on the target
so it shouldn't be in your recipe.

It sounds like you might be missing one of the general bbclasses that
you should be importing.  This would create packages within your recipe,
such as ${PN}-staticdev where all *.a files would be automatically
placed.

The GNU_HASH check is also likely valid.  You need to make sure that
your precompiled binaries, if you continue to go that route, are
compiled with the same flags as the rest of the recipes.

--=20
Patrick Williams

--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX/4ssAAoJEKsDR8wtAMEZddcP/1XDdN1Aio++pP9uKCMxac6L
sSlQjoDdOrXUt+ddnRPQUcpeYFF4CNxtLcRbRm28hsEg6YJ0961e5+03InPnBiIZ
gObhLo4OTYUadvnHkOIXeaT0onsem3mRTDhL+j+9gr+iasH4m7N8QC6ntGbdGwj1
HFUMxmgQkQgNfwAP3Fv2+4In13r5XJkfSwGbUhnC6jf3ftgzbXEUMJeudNL8E2P4
+515utiXTFAp7dWeq1Ew/srbVcjlJPrtkdhFV25pwhesoUqTdnsC8p3TjluxE4mT
B3Va2l7Vxyf+JvJD6j/Aox8Oa0BcrEhtsrVB3icOcvB/3mqZIh6BfWjbackGh9fn
17nLF02zBsIyXIufc0kXF1SfgkO1ZM0FHRxOT9yNvVBzNg9R02XG3K75kbg0opIK
az+i39Z2lGEte8D7O3mVRT7Vu9xKZe3rqot75hlYtgbANlHX6Mr6RANnwPRTrDbP
wr38/1G6DB72J6/C99/EQ1s5tza2E6Q9ptiEWVpJtysYSO7Xtd0wLFmnkhtxDVXB
djIkFOjyui/VhIMlLgkMdtCT9N+yVh75VZalJaOVMwwf3bvLpWmUEPS+QIilOOkd
ZH1VxiOfOobmKtZmcUzBE0P26CIPUtLqJBJ/PhEvsOrd9pQJkce7615Llaqp+IqT
xxFFp1hTlVsB1++EeWEz
=aK6q
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--
