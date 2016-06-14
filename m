Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTRbc1nkjzDqjk
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 21:03:55 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1465902223234497.90050649986426;
 Tue, 14 Jun 2016 04:03:43 -0700 (PDT)
Date: Tue, 14 Jun 2016 06:03:41 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Adriana Kobylak <anoo@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Authentication for OpenBMC port 3000
Message-ID: <20160614110341.GY19968@asimov.austin.ibm.com>
References: <OF97E67B46.5B644A38-ON86257FD2.000986B3-86257FD2.000A1137@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pM5zeTSooDOHDhuH"
Content-Disposition: inline
In-Reply-To: <OF97E67B46.5B644A38-ON86257FD2.000986B3-86257FD2.000A1137@notes.na.collabserv.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 14 Jun 2016 11:03:57 -0000


--pM5zeTSooDOHDhuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 08:49:58PM -0500, Adriana Kobylak wrote:
> Adi brought up the concern that accessing port 3000 doesn't require=20
> authentication. Since the OpenBMC UI, which would replace the port 3000,=
=20
> is not close to being delivered yet, and the Barreleye GA build=20
> approaches, any thoughts on how to proceed: add authentication to the por=
t=20
> 3000, remove it from the build, other?
>=20

In my view, the port 3000 code was only there for debug / development
purposes.  I would suggest we disable it in production builds.

--=20
Patrick Williams

--pM5zeTSooDOHDhuH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXX+SNAAoJEKsDR8wtAMEZbCUQAIaL9QGHyweQgalx6YpBagzX
zSNjychLeRKkzI6cS2xrNopMo+DnJ53QTWGyPvzq1YnYHl1gNT/rjHsBm5v4rlAk
dON0v5C2WlfPfyK6viOXNJ1R0aBpvL94b2U3tASd3S/zdzr4LvsdUysYyEscBgkc
SkwkxrK9B0+YdRPnO13xinN0UqifWtpaj3TvJCo4ifZE3rqZowQe7lRSzctYjBlK
/TpFuyRuJRYwrINn7ObsCmG50ZQ4PVfaEOBMJDE5Y5ITfdO0Tr41sEovdHWlPwIX
a82B0JNe18xKJ5IgxKbpa8CqhhfCyTe+HkaNNN5sIzaF6hnN2GGbJMf5Zj640y9B
kIhEGZGzUUtKATTHWeUteLjbtgWrNBqCxdZTYEBOOX2df23RWA6VlDt+lRoVitPd
4Rh4vcg2LPNF1PK9KbcVFF4oKG2FFjeBxAxJL2235k6MJ15Nyd9Uec685u5+0oMe
sN4drt4qxpsuiFy85A70Iv/LnbYwAV9dgRFLfsfWrC/b1gvBTFaZYfec/Q7/4eaS
1tdeArKdNwXcRO+CUPaVZqVdcm3rmj/3yaqtw9eNetZQumBdkZI/30VQk9DpI7z1
NTsBX6SE7lz5cWynEh/u3pLH38W7wo14dw2rv519WkVzRLm0QTlVbabrrao0or3y
XwKK+n19dGKirdNwaylf
=bXlQ
-----END PGP SIGNATURE-----

--pM5zeTSooDOHDhuH--
