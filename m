Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rfrz35pNBzDqy0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 04:38:23 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 14672254976001013.9756090272388;
 Wed, 29 Jun 2016 11:38:17 -0700 (PDT)
Date: Wed, 29 Jun 2016 13:38:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@us.ibm.com>
Subject: Re: [PATCH skeleton v2] Add IO Board VPD handling
Message-ID: <20160629183816.GS20922@asimov.austin.ibm.com>
References: <20160629153057.1177-1-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rQAi4ZBraoACHIeu"
Content-Disposition: inline
In-Reply-To: <20160629153057.1177-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 29 Jun 2016 18:38:24 -0000


--rQAi4ZBraoACHIeu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 10:30:56AM -0500, OpenBMC Patches wrote:
> Add argument to phosphor-read-eeprom to add additional handling
> for reading the IO Board VPD.
>=20
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
>=20
> https://github.com/openbmc/skeleton/pull/119
>=20
> Adriana Kobylak (1):
>   Add IO Board VPD handling
>=20
>  configs/Barreleye.py | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> --=20
> 2.9.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

+1.

This has dependency on the corresponding ipmi commit.
--=20
Patrick Williams

--rQAi4ZBraoACHIeu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdBWYAAoJEKsDR8wtAMEZeOcP/ilIWkVfj5Oh/TCzkRcfr/QA
xj8NdUehMeMVflFCkhLKbBD7WRuTQvTuCKgVLwHkjtj0d7FxWxesC385HJOfDW8A
arN8thr+w4EAAvR5EHLa6nPYn6R0aPG6+lXs+snTEGUWUOtTiOsadnyYodZv9Qqs
d3tt0O5flfWHbD98kwfzsSYyIUJJUEiEJnStPjWSQ4hg2nFA7unnEIVUBGj3+Xf+
AUDyzR5qTUhe9IIhjDeaO6jedHzcULEgkn/XhYsUT0tinPubIcb+TR/MAaBlDc16
fsnve4ypEplavTHdSTik01zC7EDayhNyZd4ZHf1lxjoXekgkJsVJB28TQNjfGUX/
lWrAAfMiMhIxLFLtnP6yd7E5G+nC12z4vPcOkaolhFOYdpulxgsdQKeKpV+QPoEP
Gd5dFy7klA46tXHca5qJn9Z5/gP1N9JMoMIbw9VS8aFDpvECbymCIPLhxbd6D7DZ
5ajgAo72PeZbFyPmN6bEcJcuXkqtpvzK4CBiNfZwnfqALcwvTOGQxuh2ZflOxNov
2VDufcVQqe+3vApuUR5q2JgXdskB9VrMB7lPA/FVDwUnUMLFG7Z5lc1v6/JNTH0Y
ToNt9Gsc7vMPgZRN/1xtUvNY00YucS1SdrxpV1vG2bXWKlphyZQMAR8+v3B7iHdf
USvLmZKU+9ezVtUwzdvB
=0VbQ
-----END PGP SIGNATURE-----

--rQAi4ZBraoACHIeu--
