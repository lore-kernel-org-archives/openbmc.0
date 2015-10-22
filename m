Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CEB0F1A0512
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:45:34 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445481930266979.3665538743304;
 Wed, 21 Oct 2015 19:45:30 -0700 (PDT)
Date: Wed, 21 Oct 2015 21:45:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v2] add dynamic lookup of sensor types
Message-ID: <20151022024527.GT13316@asimov.austin.ibm.com>
References: <1445481125-30036-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wlFCko3yyTbBmKK8"
Content-Disposition: inline
In-Reply-To: <1445481125-30036-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_1
X-ZohoMail-Owner: <20151022024527.GT13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
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
X-List-Received-Date: Thu, 22 Oct 2015 02:45:35 -0000


--wlFCko3yyTbBmKK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2015 at 09:32:04PM -0500, OpenBMC Patches wrote:
> Why yes the testit file does need to compile Chris
>=20
> https://github.com/openbmc/phosphor-host-ipmid/pull/15
>=20
> Chris Austen (1):
>   add dynamic lookup of sensor types
>=20
>  ipmid.C         |  79 ++++++++++++++---------
>  ipmisensor.C    |  22 +++----
>  sensorhandler.C | 194 +++++++++++++++++++++-----------------------------=
------
>  sensorhandler.h |  14 ++++
>  testit.C        |   9 +--
>  5 files changed, 146 insertions(+), 172 deletions(-)
>=20
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

This pull request needs a rebase.

--=20
Patrick Williams

--wlFCko3yyTbBmKK8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWKE3HAAoJEKsDR8wtAMEZx6AP/1wKPhYqYq922qXmywmfU2Ey
W9XnDjBjBdv4V9ZAjhEF7gYo+Knb7dUn0zuTwLUGEMJg3/0wnZZGXQoKCu7JdVZE
ycP8WSJRoRBPMK8X1F9Es3y2sPHZLngWmxOjtOGPhPzGMizH676r27jvDDJ8BJfZ
wu/b7MT5JMKDmfSyDocFI5B2bC0VM00xIvrYvYEyapsYmsjNHjzr0yRRalavGLZn
VF1kTeyQkHM2qQlFzEsrlAP1rGMTI+u7+YI65iz/BtoAck0Dosrc2YVYrd0Nk3uq
OQtz+VgmsgKE1JXL1taT0Ljryxd1jcpvschUJTglXfDFRTxSbSS8oHoxqJFX5fHO
6P548FnJNswztXkk0Ntr1LgJgcieo+BY7Gr5o9m+c6OaddGzj8wQbRmVknMDFY69
EK+K5kQYTR/leRMBHWNThMwCN7GeYEE9ikZmLFixY+iPnqMTX2tKRS30ns3pPXO0
M2zmviEcCKxI3OvBa0aQHRmZvHoX5QW5mOhq6+PjbJTHosjdfTZ2jeVBmxPtyIux
38bt+xftwSbaeabh9po5xG7vTvchfCqd43E1nsOt1OpG77iuM8DGdB+2zGCwISnG
0flft4pF+IGHn+E6hGPIfGMq53h0cwo7DzB1VrA6/aGEcqoMbXvES4tzQO3LPj1S
gjOrCzyAjrAj8avjS0PI
=XTYk
-----END PGP SIGNATURE-----

--wlFCko3yyTbBmKK8--
