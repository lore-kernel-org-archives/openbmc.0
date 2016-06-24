Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbq8y4kyjzDqlN
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 06:06:26 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1466798779830435.86058581908924;
 Fri, 24 Jun 2016 13:06:19 -0700 (PDT)
Date: Fri, 24 Jun 2016 15:06:18 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc v5 09/11] u-boot-fw-utils: Update to latest
 version.
Message-ID: <20160624200618.GG20922@asimov.austin.ibm.com>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-10-openbmc-patches@stwcx.xyz>
 <CACPK8XfYmEOtb+PxiHi4VuH72hkNDRZheUO8BWRvC1N4-GNyQw@mail.gmail.com>
 <CACPK8XcRpMrryPuoRkPqFS-bXq13WFfFYi48+qo+2i1kKfn=Rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z0mFw3+mXTC5ycVe"
Content-Disposition: inline
In-Reply-To: <CACPK8XcRpMrryPuoRkPqFS-bXq13WFfFYi48+qo+2i1kKfn=Rg@mail.gmail.com>
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
X-List-Received-Date: Fri, 24 Jun 2016 20:06:27 -0000


--Z0mFw3+mXTC5ycVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 12:12:08PM +0930, Joel Stanley wrote:
> On Fri, Jun 24, 2016 at 12:10 PM, Joel Stanley <joel@jms.id.au> wrote:
> >> diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2=
013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07=
=2Ebb
> >> index bfbdcf6..a514cf2 100644
> >> --- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.=
bb
> >> +++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.=
bb
> >
> > Can we delete this recipe now we're using 2016.05?
>=20
> Yes, you delete the file in the final commit. Perhaps you can drop
> this commit from the series then?

Will delete.  I guess it is just noise at this point.

--=20
Patrick Williams

--Z0mFw3+mXTC5ycVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXbZK6AAoJEKsDR8wtAMEZCJsP/REvSHqiwOcIsFv65O0MX4U1
y8Tcvi68vQCdCsCACzOUA2eHAfnCulP9cnSMEGSO5T7Mo6EJeJ5ThsCnsdzFzTtt
GA4UBefkYWl525R18b8yOBH4Ja1KXaUM4a0qknQIqXlFyDioZIsUGeppNwLcPRoz
2Pz+YC0weVm26nr904djypHrUysotATpHRKeHDA5RIazTr9W4n5Z6Css/n1NkKdh
xCgFshI/HFI4dboMu/IA8BRIBZGH1WCxZFUMlUgA5dPJt9srm742Lxdmdx3iI3V6
X2iK5xg0NLoKGzSqPy/4YIF68R8HH+2uLcThvHcVQhGqF5I3bMnu1igRnAJuNal7
OOaAUoRYQeerckYraXVSZ3HfRfMpSKQKlJ2ceBwSb1aqC42/NSvZlsH2JESthNzw
Ueu9sTVKScS5ZRSfILsG9dxLBxSk+nqWsDbC/vKkSTU2EDsF1hPDkMfeaV+Drehe
qVeQdBvMpfYJtk5tBnc09Re6byMO4dY+stVsi4chEfoQPaA/G+/9GGomRjeXRymP
UjGffPJ4kXFW3K7oY16NR/arKQ/tJCCmqw1LQuoam/oUXT7Biu67uMjbUo6d9Mhj
08G98i9yVU3TEaIYdXSbJEvdij9l0uk5tiggeo2yKm8POX1ZSPp/cS0bWv6fbhzS
qCacupE5bI7AT4m4C3R6
=iaB7
-----END PGP SIGNATURE-----

--Z0mFw3+mXTC5ycVe--
