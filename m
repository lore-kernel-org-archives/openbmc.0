Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1A53D1A0A93
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 03:29:10 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1447432145182641.5058420506147;
 Fri, 13 Nov 2015 08:29:05 -0800 (PST)
Date: Fri, 13 Nov 2015 10:29:00 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Chris Austen <austenc@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: dbus connections
Message-ID: <20151113162900.GA21764@asimov.pw-on-the.net>
References: <201511130024.tAD0Oesn030327@d03av02.boulder.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <201511130024.tAD0Oesn030327@d03av02.boulder.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 13 Nov 2015 16:29:11 -0000


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I think we should expose APIs in ipmid-api.h for performing dbus
operations.  I think work Vishwa is doing is going to require an IPMI
module to be able to create a dbus object too.  The ipmid is going to
need to deal with the sequencing and callbacks for this.

On Fri, Nov 13, 2015 at 12:24:30AM +0000, Chris Austen wrote:
> <div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;=
font-size:10.5pt" ><div dir=3D"ltr" >Brad found a problem today where the i=
pmi processes are creating dbus connections rather then relying on the pare=
nt IPMI starting program.&nbsp; What happens is each error log is a connect=
ion, each fru is a connection. on our palmettos this wasn't obvious but on =
a broken Barreleye with 115 error logs and 46 different FRUs if certainly w=
as.</div>
> <div dir=3D"ltr" >&nbsp;</div>
> <div dir=3D"ltr" >so how to fix this.&nbsp; #1 you could just extern the =
ipmid.C's bus variable to the files that need it.&nbsp; OR you could add th=
e bus variable to every single ipmi calback input parameter.&nbsp;&nbsp;</d=
iv>
> <div dir=3D"ltr" >&nbsp;</div>
> <div dir=3D"ltr" >Thoughts?</div>
> <div dir=3D"ltr" >&nbsp;</div>
> <div dir=3D"ltr" >&nbsp;</div>
> <div dir=3D"ltr" >&nbsp;</div>
> <div dir=3D"ltr" ><div>&nbsp;</div>
> <div>&nbsp;</div>
> <div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-51=
84 (T/L: 363-5184)</div></div></div><BR>
>=20

> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--=20
Patrick Williams

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWRg/MAAoJEKsDR8wtAMEZgwEP/1lvS+AZvKL4CzLP7YIVvbbH
KUfGs2vP0uG2YYpzovdnN7jAimXzimHcQE0HCRUgkTe2UkRnTP1QxAdRQcupm3h9
+r+jOoAuwmXUWR3j6QiYLS5s23RjPY3Uvmb0q43uijbczzP4sG6uVUE1vsLAVwKF
3NaRxtN8migs0U2qFCN81p47yiCCD9IG1yJNAUURVV8wkAtN8RABSkTYavecpHj/
wRl/Rg7I1yihRXp6gYfDg7h6/mPsgLh7MHvdBWawo+oPPIhEp4GOz3cb9ufhymAk
BeDWODI5sAUJY+xNA+X75e8H2rptm9frj1fhPRUJuLE9H1KXP+8WqPAbQhN8lqx1
xdzKTS4+lQ83SCz/WZn+7zS4BdOWydorAdRjafIatoy/KXDR2VYCiB7PgqWPPxAG
li0n28s+cwIKpZAmGuzZBTKO6+jtIpci/OvpyNNDJmeyvLG8/fYmQMaS0QYIqk9k
N5ylluhHWvKeLOqLoQyj5CFtqFVv1UoNhfX1dvkXZWbRjD3g8tnoJzcNGBlAtWlJ
Wd5py+lh5MLrWu5f40HLaazxd9SOxqS2cTObiFeBYLCLkPBmtAypQSoKJxdf5+5m
ekVQ7l7VDkjr+TLHEnt8waKQonpze8XxWqm9Rb0MaJ7NaFfXHA2LMkXIJlc9tCRN
22ktBQUrAFnDQIVkrbMr
=3C7Q
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
