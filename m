Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVsvn57JwzDqpd
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 04:52:53 +1000 (AEST)
Received: from localhost (207.45.155.253 [207.45.155.253]) by mx.zohomail.com
 with SMTPS id 1466103157149669.8548138496352;
 Thu, 16 Jun 2016 11:52:37 -0700 (PDT)
Date: Thu, 16 Jun 2016 13:52:30 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH inarp 0/3] Invalid signed and unsigned comparison in
 netlink_recv.
Message-ID: <20160616185230.GD19968@asimov.austin.ibm.com>
References: <20160606202013.20287-1-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h13GW2gLSV2TxsNR"
Content-Disposition: inline
In-Reply-To: <20160606202013.20287-1-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Thu, 16 Jun 2016 18:52:54 -0000


--h13GW2gLSV2TxsNR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jeremy,

We are ready for this to be merged.

On Mon, Jun 06, 2016 at 03:20:10PM -0500, OpenBMC Patches wrote:
>=20
>=20
> <!-- Reviewable:start -->
> This change is [<img src=3D"https://reviewable.io/review_button.svg" heig=
ht=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>](https://reviewable.io/r=
eviews/openbmc/inarp/4)
> <!-- Reviewable:end -->
>=20
>=20
> https://github.com/openbmc/inarp/pull/4
>=20
> Patrick Williams (3):
>   Makefile: Do not override CC.
>   Makefile: Append instead of overwrite CFLAGS.
>   Avoid signed and unsigned comparison
>=20
>  Makefile | 4 ++--
>  inarp.c  | 4 +++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> --=20
> 2.8.3
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--h13GW2gLSV2TxsNR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXYvVuAAoJEKsDR8wtAMEZDKYP+wZ8TjY49WQnj+zEQvg9xAYy
n5y+wWIcjbCKY9XLqCxkvHA4IhOC+YP/lZU9xVfMUm7KUGlV7+7TnNpSXZCVE9bK
qUbEr4M0zOhzvMDpDSXFFmkbfbrXiezN4H95kNuvEjzqdL0v1jW1xrKQX8AzXhIV
FfvsQ7h5FefYI6lITC5HuMmVlZyeUw0jDu6iQZ4sJ139ODVoMWOh7TMdgkp+F7JR
d8CBScrhsRHBhNi/0vZc2lJuzTtAZGpkdmfzzOjAYfXmzGans63Mn5lJWSSU5WiF
LTKbzaZMwRPaZXgqTBPu/tXi9wiBPGvEL6sIq1vOQyI+f+9onBLW1CXMayhO9HMK
raUp+W0zkaEaED5f7Li+edDC2GKyzcF/UZc96wxG3nwSJGWiKMsY3qdIyTAyrlL2
DOYGBwFGjKNR/dqiMOt+zLb2VfePVPoROTVTmZ0CadNc3P934eBJETlUe6BExl6O
6faSvyNRrfYyx3QUzR5L4TnNC1zZbrpJeF2j+Nbr+2lpmzcxhR0lyGM+EWbxnTal
EMjvZVOmN5pzCh+8/Q8vZHueVIT5arE72gCUMWC4VAqF0yiwpsILftln8XMOSVvu
S8v0MG+xmbunPJOym5pHDaiLCvNK+Iy+IGGdoU/mt5RffXQ9/Ak30R1gxFGR60pU
rBtjiduS40DV9E5UYvcq
=vqOR
-----END PGP SIGNATURE-----

--h13GW2gLSV2TxsNR--
