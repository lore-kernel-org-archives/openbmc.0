Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZf0253B7zDqRd
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 08:09:38 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1466633373021626.7077610138659;
 Wed, 22 Jun 2016 15:09:33 -0700 (PDT)
Date: Wed, 22 Jun 2016 17:09:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@us.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid] Fix minor fw revision to be BCD
 encoded
Message-ID: <20160622220931.GC20922@asimov.austin.ibm.com>
References: <20160622220051.29188-1-openbmc-patches@stwcx.xyz>
 <20160622220051.29188-2-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline
In-Reply-To: <20160622220051.29188-2-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 22 Jun 2016 22:09:39 -0000


--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2016 at 05:00:51PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> The IPMI spec requires the minor version revision to be BCD encoded.
> Currently the hex value was returned.

Might want to say "The IPMI 2.0 spec requires the minor version revision
to be BCD encoded, but the current implementation uses a binary
encoding."

It isn't really a "hex value" or anything else.  Hex vs decimal are just
a human way of looking at the data.

> Fixes https://github.com/openbmc/phosphor-host-ipmid

This should be 'Fixes openbmc/phosphor-host-ipmid#89'.

> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  apphandler.C | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20

--=20
Patrick Williams

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXawybAAoJEKsDR8wtAMEZlNsQAKQnS3GY7CW6NZ5F037I+Ht6
ZmE112Zawp3vtrs02Tbw2k/gGP6jhuujcKACjVuf2k+vBZrOi6b1PMbP21bwYwHJ
AwpaotcVv3Dz9pSEflDMvZPgO8VLaQvRDoVHTCBJXzjzrEz/GxHSt5TyCYYxaCA0
bX80G8YGSq1ST5aVbPSJa1bzqPZVjXkIUJ9Y9D/uqCTaJ2eddti59QoePOFA+4zQ
aXuK3t6SDU+HeXHM6ydVwYiyEUXGJ18+KNH+9H7NhCln6qfiGEP+U/mnvJWeoLne
jrFOc3qE4Q0VJF52b81NKu3KRS3lH/yH3FYA0XIHL7PNfqwlGVCOvBht6BJe7jxk
juCkRw5Oh7mI02crXBuLQmFETzJECW128Yp86zRSqHH3+7UH+2Vh7xTP3zd6OW1s
2TNDGI0NWJt45BeVlK3Ap9x1/Le7XGiBQa2byPQRvK/td2o9thyViYggW1m5le8T
zVtJYw6wWevTQf1obC9yz1lat7BdKpH2kpDzhNGOF164kbf2sSwtS1a38u8TWBf1
xkWN2wQtK5kDpM7NZ+rfb8WCEpJp0r/UVdzMGgL6VV0QhGJuMxyNk3f/XPno8863
8y28C92Y9PwvSJxMIISxlKcwm9GMgp1ENRgNom3f4AhC/nKlC485G/qoZFP0n34z
O1NtccckD05ulIkpU1U8
=ZJsQ
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--
