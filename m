Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5BC7D1A03A9
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2015 10:08:19 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445296096200279.6836513084164;
 Mon, 19 Oct 2015 16:08:16 -0700 (PDT)
Date: Mon, 19 Oct 2015 18:08:14 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Watchdog support
Message-ID: <20151019230814.GL13316@asimov.austin.ibm.com>
References: <1445293375-844-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tKy6e3LXpfmanBFM"
Content-Disposition: inline
In-Reply-To: <1445293375-844-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_7
X-ZohoMail-Owner: <20151019230814.GL13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
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
X-List-Received-Date: Mon, 19 Oct 2015 23:08:19 -0000


--tKy6e3LXpfmanBFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 05:22:54PM -0500, OpenBMC Patches wrote:
> Add support for ipmi watchdog functions
>=20
> https://github.com/openbmc/phosphor-host-ipmid/pull/9
>=20
> Adriana Kobylak (1):
>   Watchdog support
>=20
>  apphandler.C | 110 ++++++++++++++++++++++++++++++++++++++++++++++-------=
------
>  1 file changed, 86 insertions(+), 24 deletions(-)
>=20
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--tKy6e3LXpfmanBFM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWJXfeAAoJEKsDR8wtAMEZXUUP/1tZMyCPacSwCtFK/ZreiybR
fqUWES8m33CIaPjoZKGjsGYxJ/Tfc4kM6w7mCWR462OQxMnayb8AZKqe74S03EpI
frALPvWtSqyChirZeZ9/zm9EhCtS4PhTH90UBiLdFfjVZBsA3Q6Tio9QMMJttq6p
Xyxo8RGLgONcJoxxhCdoVi/M8jfWq2+wgqLERI0n9fHtMfxukvqJQqkd0HcLrliO
uRWD/ZCc+DnsY481pq8DreJocU97oyx1nukKrMKjurqKGJc3ucjButT4JftDukpL
JZQr0aqjmTB4cO42NX7m4Sx0ByAeaFpkvyDTzi1pF5oTA1H+4XSu+osJ5ngf+nzd
lXc6Ab7gXGdo57MUVxd+dRDbbGL/fiZwS04UMafFkDWaTXSOFKL+ZpkSJEUVJ0CF
CI0cvX04PafJ8Xx6fRr5J/fjynrwT4mH9edGtuCQPSoIkz6ntMxvHQ6BnnLJdVtd
h4ZWGg7w/J84kqwRcvBbAbQRWI4BfTVqFrnDKRnke4uFVYUNWc0Ni9Ot6jUR2f0a
/KGE2SEMxDVLoIyrD44bYLLv2nCZ3gLV3lWgsiaHOnZulY3ltrnPIzu5RXGBdjI5
zIcQ/ecTwLCtkrn6tv/nRecEkbBzTrV6bInAACvX0rvnmQjNJFyARm55fIqjKZ2G
n+J1ntZA4e2uivzpx51L
=25Xt
-----END PGP SIGNATURE-----

--tKy6e3LXpfmanBFM--
