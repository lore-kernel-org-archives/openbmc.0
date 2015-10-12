Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1C27C1A075E
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 04:15:53 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444670149198239.28965742363653;
 Mon, 12 Oct 2015 10:15:49 -0700 (PDT)
Date: Mon, 12 Oct 2015 12:15:47 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc v2] bitbake and package files for host-ipmid
Message-ID: <20151012171547.GM12084@asimov.ibm.com>
References: <1444662234-13303-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="umrsQkkrw7viUWFs"
Content-Disposition: inline
In-Reply-To: <1444662234-13303-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_6
X-ZohoMail-Owner: <20151012171547.GM12084@asimov.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
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
X-List-Received-Date: Mon, 12 Oct 2015 17:15:55 -0000


--umrsQkkrw7viUWFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Patch looks good to me.

On Mon, Oct 12, 2015 at 10:03:53AM -0500, OpenBMC Patches wrote:
> https://github.com/openbmc/openbmc/pull/14
>=20
> vishwabmc (1):
>   bitbake and package files for host-ipmid
>=20
>  .../host-ipmid/files/host-ipmid.service              |  8 ++++++++
>  .../common/recipes-phosphor/host-ipmid/host-ipmid.bb | 20 ++++++++++++++=
++++++
>  .../packagegroups/packagegroup-obmc-phosphor-apps.bb |  1 +
>  3 files changed, 29 insertions(+)
>  create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/file=
s/host-ipmid.service
>  create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host=
-ipmid.bb
>=20
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--umrsQkkrw7viUWFs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWG+rCAAoJEKsDR8wtAMEZZ0IP/iri4oz4FPUXBzDKHbJdqG9x
5NlLo7uMbCOvlh+HYOwNORhnrkz2JNq9sfLU6F+G5yX54TGHzWJb9Ll7/86GNurn
kBOMT63kGHDX3W/EDUmUint6Z4AX+DWQ/RYhFCzbc1LSuzGMlZ+aCC3tGKlH1QdF
0gKKbx+uWfBO+Z3nNpdrnTJ4HUlPSMY7kU/vJNp7KZFzv+4aRZu/ZUZ/p1PSz+UP
j/iXCIvmqassU9rV75Jak59ONNyBIPUx9Im3BbSldV+G2qUypaeWCX9Mzsft3by9
aqZOXCGDTldhv0gusbcw/IJCHFUudJFbFgIxACfdDXia6WMfwV3JeMvcu+jSnZWT
K2KGShT69XxsRo4WDOlxOYrrUn6BLvnTlsF41s6GK9KvOGsrnsEnfgbQTpsDULNZ
PNYVPzgQ279+wyhi9dwWk4IHAZBzRtqhGEOsY8lzf+wpRWVqtqrX6iRZfuuYM2Et
5BnemLXDdrtycW5PvrM7UsPVTtsJjkHbdy6eY677+f7Hdf032nnQBGvIMePt1C1v
u+qYvSdHMKCwKaGbmUF0OtxjxxEBk74cK7OHysredO+SOiPCOzVbgnHz8CEA2OqH
ytj+oWVrAmlt0kPC7PuwD0snACE3HXDv1Y42H1rIPCm0ZeEw8O18zAOILA/XBm31
YKx+UdTEJLT7V7U9qNZi
=sTsE
-----END PGP SIGNATURE-----

--umrsQkkrw7viUWFs--
