Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E712A1A07C7
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 06:30:05 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446233398198400.532797998129;
 Fri, 30 Oct 2015 12:29:58 -0700 (PDT)
Date: Fri, 30 Oct 2015 14:29:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Cyril Bur <cyril.bur@au1.ibm.com>
Subject: Re: [PATCH btbridge v4 2/8] Use builtin make rules
Message-ID: <20151030192956.GI31364@asimov.austin.ibm.com>
References: <1446208934-25969-1-git-send-email-patches@stwcx.xyz>
 <1446208934-25969-3-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2nTeH+t2PBomgucg"
Content-Disposition: inline
In-Reply-To: <1446208934-25969-3-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151030192956.GI31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 19:30:06 -0000


--2nTeH+t2PBomgucg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 07:42:08AM -0500, OpenBMC Patches wrote:
> From: Cyril Bur <cyril.bur@au1.ibm.com>
>=20
> ---
>  Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 7f62be2..54d9964 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,4 +1,4 @@
> -all: btbridged
> +CPPFLAGS=3D$(shell pkg-config --cflags libsystemd)
> +LDFLAGS=3D$(shell pkg-config --libs libsystemd)
> =20
> -btbridged: btbridged.c
> -	$(CC) $(CFLAGS) `pkg-config --cflags --libs libsystemd` $^ -o $@
> +all: btbridged
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

Would prefer to see a 'make install' when you get a chance and a 'make
clean'.

Also recommend:
=2EDEFAULT_GOAL: all
=2EPHONY: all
--=20
Patrick Williams

--2nTeH+t2PBomgucg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWM8U0AAoJEKsDR8wtAMEZOQAP/3WPo/hCE73JsSk5gD/CwV7B
C8sX4wyuBwVe/cMt5nhhdl5ZqjRigY/N/YIIc5rYHVwBw6OBKsQqzK367Kc9I38R
nfO9nKbrCDYTCiACOBeA0J3ZeQIWDn1+5XGb3AhTYtbmSA3a8VVnnc5ibIADUuVM
lR3u0KdOiOuVp0IdYhjiARCiRaG6G7TCzoot5zTXENQlwIIz2a7OnP3HcOcPJs7M
POYMAYF2La2LwljeZ3DvPwEXMNCi2INdTWfdSfPDEkRfNuERaGPkuw0cTTeRP0tb
C7BgozRNLJ57QTgwrZ5Oro9MwX0Q5zYTh0NI9JzORcOLlL0h+5PRsoUXIuL06g3y
/tSTujDKTrI19AA81Zkzt5CFzlL7M5qEf6sXYbqLXt3MzBGC6IDpvgBPLjFRePMZ
Otavka/qF3aVPVVKjIvoQEHC0DbaabbUf9kcUMfZjtJww4A1tpK3McWYPVsnoA+F
2aO2+JO5QdyR67HqmvH5TlzFSuupn33I8PSgjXW3YALngCyGZKAAx0Ahnc6JJopY
C/H+yr2GfRawAidZaaAyXb4a+UTLvvlIXJNt68aFGsg0w2Ycld6bLVT7lr7pjYpB
H/5Piibg0MVr9Pdxttl/hZeygwjl8sVl6B+inC4cr6db22+1ul0OU+nmUzSuhoI6
x3555V/Lfbhh7a4Lo0pN
=Gbt4
-----END PGP SIGNATURE-----

--2nTeH+t2PBomgucg--
