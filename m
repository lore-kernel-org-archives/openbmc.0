Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rkXnq0JxZzDqsr
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jul 2016 04:43:09 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1467744183806786.5345564939556;
 Tue, 5 Jul 2016 11:43:03 -0700 (PDT)
Date: Tue, 5 Jul 2016 13:43:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, adamliyi@msn.com
Subject: Re: [PATCH skeleton] skeleton: chassis_control - Add an ESEL when
 emergency shutdown host
Message-ID: <20160705184301.GZ20922@asimov.austin.ibm.com>
References: <20160702144052.9068-1-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4YatIo8qwOC8yTX3"
Content-Disposition: inline
In-Reply-To: <20160702144052.9068-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 05 Jul 2016 18:43:11 -0000


--4YatIo8qwOC8yTX3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yi,

I closed this pull request.  It should be submitted through Gerrit now.

On Sat, Jul 02, 2016 at 09:40:51AM -0500, OpenBMC Patches wrote:
> This patch fixes issue: https://github.com/openbmc/skeleton/issues/64
> According to BMC Firmware Specification, on occasion the BMC will be requ=
ired
> to shut down the host due to high ambient or fan fails. A SEL must be
> present in this case.
>=20
> Signed-off-by: Yi Li <adamliyi@msn.com>
>=20
> Change-Id: I65ea7e3284eab3e10e14604306f6d8e23f77d57e
>=20
> <!-- Reviewable:start -->
> ---
> This change is [<img src=3D"https://reviewable.io/review_button.svg" heig=
ht=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>](https://reviewable.io/r=
eviews/openbmc/skeleton/126)
> <!-- Reviewable:end -->
>=20
>=20
> https://github.com/openbmc/skeleton/pull/126
>=20
> Yi Li (1):
>   skeleton: chassis_control - Add an ESEL when emergency shutdown host
>=20
>  pychassisctl/chassis_control.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> --=20
> 2.9.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--4YatIo8qwOC8yTX3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXe/+1AAoJEKsDR8wtAMEZWNsP/RIMpAxbSZa4szKaRZ1tBWX5
tBmDqUV6n+jZ7QqKjZfbBmOqANPS5GNuzXyp20FoFsX6qNqhcA6RNklTdGrm5Zz2
luzcr4A3uIy3EV3OK+l8yO5FzW4OXzeCd7vZPJUlLgXbJX1rYzmOCVSe0g7rKouH
8IPMfR0V/YXyJry2VKXk1Oo5Cf1LHLCJyKgf0yES09OHZwFp5RrFArsCXP3NE3DD
fRKyg28kERwjsEu4kojBb9KtZ/GYKoh42anhV1CMFeBEmotJ/sxPpzBxPVhk91Iv
PrcXtyaKAJdKmrl2Q4VGWYKaIn6pxl8ByU3vlz43WpcPibHycjvOrgu2UC/M4ZgN
hyOmoUKLy429XTZ6UP/qvGN7Gz7LiVW5j/5DLoOJKtPYd1ou0bt8W10koFPKW9Pk
ndVESYYifQgiCyTA5MC6S0NpetiOkn2KDq+aRVdblr3WKULgqMl+VDx7cIvcyru4
BAgs+FLohHXSikRIkxdP6lsXbE6GUWC/+3spnm+woINuruM3/5woOYFTpJ/rgOF4
YSBjo5Q4BxZjvDOUhLEXVlOrhc4yecuZ6pvqw3BBds0Wox8NbU+Z/55yMHDwx0Xy
GgwJRwncBpoWgflpr3y1S5I2/1X5SiPLKBAEBO4VcmYovmQw8ZjyKND8Mci7nsfK
+lTWDVKlNGHIc9D8CqZG
=0Izr
-----END PGP SIGNATURE-----

--4YatIo8qwOC8yTX3--
