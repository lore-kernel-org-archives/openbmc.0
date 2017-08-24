Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xddpP1KQgzDqGj
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 08:13:00 +1000 (AEST)
Received: from localhost (170.225.9.142 [170.225.9.142]) by mx.zohomail.com
 with SMTPS id 1503612772921281.6164459378864;
 Thu, 24 Aug 2017 15:12:52 -0700 (PDT)
Date: Thu, 24 Aug 2017 17:12:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Michael Tritz <mtritz@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Issue #2149 - BMC patching - service file changes
Message-ID: <20170824221245.GC3583@asimov.austin.ibm.com>
References: <OF4E02A31F.E0F17469-ON00258185.0073368B-00258185.007400A6@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline
In-Reply-To: <OF4E02A31F.E0F17469-ON00258185.0073368B-00258185.007400A6@notes.na.collabserv.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Thu, 24 Aug 2017 22:13:01 -0000


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2017 at 09:07:03PM +0000, Michael Tritz wrote:
>    All,
>=20
>    Per commit [1]https://gerrit.openbmc-project.xyz/#/c/6009/ (related to
>    issue [2]https://github.com/openbmc/openbmc/issues/2149), service file
>    references to {sbindir} and {bindir} are changing to "/usr/bin/env ".
>    Additionally, we're using the SyslogIdentifier parameter to ensure that
>    all executables have their output recorded in an identifiable format in
>    the logs. Please follow this example for new service files.
>=20
>    The purpose of this change is to enable patching from the
>    /usr/local/bin and /usr/local/sbin paths - these directories are higher
>    priority in the PATH than the typical executable directories /usr/bin
>    and /usr/sbin, so developers will be able to patch specific executables
>    without overwriting the files in those locations.
>=20
>    Please let me know if you have any further questions.
>=20
>    Thanks,
>    Michael Tritz
>=20
> References
>=20
>    1. https://gerrit.openbmc-project.xyz/#/c/6009/
>    2. https://github.com/openbmc/openbmc/issues/2149

This has now been merged.

--=20
Patrick Williams

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmfT1sACgkQqwNHzC0A
wRljNQ//fjRFAJ3MB9AtZV6Ngsldn5ZVcTRfBtmlnbsFQqqXQINCLoDRWtWiWF5f
JDYTnLe2D6sN9MEuVWcQQJVGxbLgJeRCw65ItycnaWQyAoYXEpMEmeR9vy6v9cPM
evJ9hMKPdpmP4vcEBXGkGXUkcT86HjNKF3Kz+BMfK82yCrnKv5NqJSgVlmWRblWg
7JajhWkvvwvo+buI/d4T2a/hmndSqSe/xJ0PYWq7u7FCiWDRlzhwmZEINHm9OiBD
Pj2TvcxpBlSg1HHEtSR3O08Mw7k4Yc6cDMencFmfwNEDBkiO8hhSxIY2oaBWRAQa
rZjl5XYMOoqK3MxLvoCgX1O9RkYSVz+4hVSt54GRd85sqEcNwfoQmEF5KNofsE7e
Mtps6YcDtwGsjIVGvTndb4lrkIEHCjF009VR/gIuOH19ExoApAt2teBhpNRMKh0w
OyY8HOGF78Y4IHKUDAwJc36xJWx5D4CgxTCTcsF4RRi3Z6vvO6hN6AII5LXWZPWV
vWRJ+8Ki/JH/iMUQh8HPvjACZRN/jGkcGVYr1MJUeb0qDLqNeAcFdc1juB+KniNC
0PdU1YYkXKbgtcKGg/oxKfLRxL0mZiVkp2+SEj9d0XHllNoKcKDMArCEcs6I0EgQ
321X11CTRACo3W7kdJa5DBuC3a+KCpWdJ4DmuwiE/jrOkAJWf7A=
=rQsQ
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
