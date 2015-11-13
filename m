Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 10E591A0AC6
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 03:43:06 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1447432982884893.0821274448014;
 Fri, 13 Nov 2015 08:43:02 -0800 (PST)
Date: Fri, 13 Nov 2015 10:42:59 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-rest-server] Add self-signed cert
Message-ID: <20151113164259.GC21764@asimov.pw-on-the.net>
References: <1447427425-3614-1-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0vzXIDBeUiKkjNJl"
Content-Disposition: inline
In-Reply-To: <1447427425-3614-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <20151113164259.GC21764@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 13 Nov 2015 16:43:07 -0000


--0vzXIDBeUiKkjNJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2015 at 10:10:24AM -0500, OpenBMC Patches wrote:
> Eventually will be running with SSL.
>=20
> https://github.com/openbmc/phosphor-rest-server/pull/4
>=20
> Brad Bishop (1):
>   Add self-signed cert
>=20
>  cert.pem | 48 ++++++++++++++++++++++++++++++++++++++++++++++++

Why aren't we generating a new self-signed certificate on the machine
instead of including a global one here in the package?  It seems like at
a minimum we should generate a new one on each build.

>  setup.py |  6 ++++--
>  2 files changed, 52 insertions(+), 2 deletions(-)
>  create mode 100644 cert.pem
>=20
> --=20
> 2.6.3
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--0vzXIDBeUiKkjNJl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWRhMTAAoJEKsDR8wtAMEZNyAP/RXKNKCISMSzJlGf6pJ5krYw
C05zkMBDGTMv4Hiq5BcgDX5YLKlHalMyJRAQm8fRijXjxPcHbag7rpxns5CumGsU
UZ+aLCVAN7wmwsHzNSfdpWJtd8vDRCidgdTM6+P0AnKNlwDYgHDM7WJyVThUD3nP
tQgWETaZ/UjxppfqfU/O4GCJACjr+KobjdNmjRjvZIOKGW5P3A1aAWfky6CbhhrA
+Pvd/GYM4zrTyw3mMrHxvRDjaL3DcxtPVyQjc3Mp05LoNarFA/r90bmSJIbM71S1
VnERb1EKuKg/gjtmBFSfj915FfYn87QeMq6Culz+/HQ9Nho23nQuvPYOToSS9Pmb
ODx721gA/53kaUR73xA/iBKCtfSas6cQrmJ8qrUQ12KPtH1uw6Az+WxouqpUc0K5
IpmCdGPSPdnl2DJWMeBbu474uVw/FTQ6azMFTFHT/UAtmKRUxdwUygSxYXloXiKP
hCIEzoDLAEWyrkAfijI2AcRq3Qx7e23bvMUBhv54JK1h+sFdd6DO9zwh3Iszx00O
gp6MQhHBF4aIUfj6bkoKiXrKHMd6BcrTB88HXFDT/PgYh7h8w5v7arikwU6L+Whb
JaEejs/WciocMYTKNYSbVYqK9K/GyrNAKgUaqZpCrRsR+dDAHNoRdA2pytVMPQnz
pEXairi9+LP65jpkvJqy
=ApDJ
-----END PGP SIGNATURE-----

--0vzXIDBeUiKkjNJl--
