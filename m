Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK62x3M2PzDsyf
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 14:25:45 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 147935313321826.943884011201135;
 Wed, 16 Nov 2016 19:25:33 -0800 (PST)
Date: Wed, 16 Nov 2016 21:25:25 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Abhishek Pandit <abhishekpandit@google.com>
Cc: Cyril Bur <cyrilbur@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rick Altherr <raltherr@google.com>, anoo@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>
Subject: Re: Refactoring skeleton flash control
Message-ID: <20161117032525.GN15757@heinlein.lan>
References: <CAN61Adc8nt_R47Edj8YYTzwSMqGLB8LSd=ZxE5jeL_sthn=O4w@mail.gmail.com>
 <20161115113954.GK15757@heinlein.lan>
 <CAN61AdfuRqu=fB1UnOhHBti=xPErz3uETfh8jcPtyftxnbUMVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nb8zVy0QMK3AA1xu"
Content-Disposition: inline
In-Reply-To: <CAN61AdfuRqu=fB1UnOhHBti=xPErz3uETfh8jcPtyftxnbUMVQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Nov 2016 03:25:46 -0000


--nb8zVy0QMK3AA1xu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 16, 2016 at 05:06:27PM -0800, Abhishek Pandit wrote:
> Important use cases (from REST perspective):
> >     - How does a user identify which levels are installed?  Which levels
> >       are activated?  Which levels are kept for optional downgrade?
> >       Which levels are stored on redundant media (ex. dual side flash).
> >     - How does a user upload new levels?
> >     - How does a user request a level to be activated?
>=20
>=20
> Our traditional approach is host managed. +raltherr might have some more
> thoughts on this for more bmc-centric software management.

Keep in mind that on most systems, the REST API will be present, which
means all DBus interfaces become, by default, available there as well.
This is a big part of why I am proposing the interface model be "data
oriented" rather than "method oriented", for lack of better words.

--=20
Patrick Williams

--nb8zVy0QMK3AA1xu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYLSMlAAoJEKsDR8wtAMEZ2zUP/3tGrKZ7Qmoo7b32/rbwjOUr
352WubBzriBxhUJFfQ+3q5HHtOFJctAHgx3jpebR9F6hxhcD2NXO5ExQl6piWEb4
MTKewnxZGTeS3+atIkpZREl2x5T2inW0IxO3jNOqhpW9auZWQgRjERgerHjfzI4F
HilVrDVXQcJEnMN0QSsH4YPtdGM+UsO/6LBTOah7rF7na4LbV13qyQ0jx+ySKP7O
5imNE5z7L07K4L440LVihtQSU8knJX4MMP2jEs5TEvO6ybZYVUCe+m+W9l72Qpkv
bUHKCa07U4y/ZShDm4CFruTKYuafymiwFINYiJYmgCL9+ehilox84ZO/oO5Q1IrS
V8lipBtFXXKN9M/ulgaBlQlC0eeFmcaiL3/VaiRMbpRDROT7+SybdQzWIF5IYrPj
IEzq/rP3SKDZR1l3L7uOAcBr4JL9VQe4pKVC6wMluhWvwBltxgwa1iYolrrf+dsY
A7gS6gpRZXVGasQIPrd/23Y80+TPt84MltFqkmELff6RILUwJbgW8vwb0Y7zrFK3
xsvqT9axATBfJt6kDjLijtLW+T2gjUZK/SwYZgNQH+fWb8loxNVKnfaFrXQMsyjU
76Hxh1F3Ahc29M8powZhLkw7pUeDoyw5RH+Q9/hl6MQSlaPkGi0p/bcm1HHC6uc4
J7/5tAXuz6j+DMHG8z4u
=FR0w
-----END PGP SIGNATURE-----

--nb8zVy0QMK3AA1xu--
