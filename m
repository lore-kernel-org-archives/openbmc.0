Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWQPR21dqzDr54
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 05:18:18 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1502738292698419.4870317670493;
 Mon, 14 Aug 2017 12:18:12 -0700 (PDT)
Date: Mon, 14 Aug 2017 14:18:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Design proposal on removing /org/openbmc/settings/boot_policy"
Message-ID: <20170814191811.GD20526@asimov.lan>
References: <b820c5bf-3f9c-b59d-97d1-549df44aa1e5@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline
In-Reply-To: <b820c5bf-3f9c-b59d-97d1-549df44aa1e5@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 14 Aug 2017 19:18:20 -0000


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2017 at 04:55:21PM +0530, vishwa wrote:
> Now, the proposal is to remove=20
> '"/org/openbmc/settings/host0:boot_policy"' and then put this as a=20
> boolean into 'persist' property into:
>=20
> /xyz/openbmc_project/Control/Boot/Mode and=20
> /xyz/openbmc_project/Control/Boot/Source.

I understand we have two different interfaces for these two different
properties but do we want them on a single object path?  It seems like
having multiple properties on /xyz/.../control/hostN/boot would be
better, but this will preclude using the same property name in both
interfaces.

>=20
> IPMID would then look at this new boolean to see if its ONETIME (=20
> boolean : 0 ) or PERMANENT ( boolean : 1 ) and respond to Get-Boot-Option=
s.

Why are we not instead creating two objects?  This proposal creates a
bit of undefined behavior in my mind:

1. Since only one dbus property ca be updated at a time, which order is
the user suppose to update?

2. What happens when the property is ONETIME (false), the value of Mode
itself is changed, and then the property is changed to PERMANENT (true)?
Does this restore the old value persisted or does it now persist the
previous ONETIME value?

3. As a user, how can I identify what the PERMANENT value is if someone
has temporarily done a ONETIME?  I have to wait until the ONETIME is
consumed?

It seems like having an optional, perhaps dynamically create, second
object to separate PERMANENT and ONETIME would take care of this,
wouldn't it?  Is there a reason you did not want to have two settings
objects to represent this?

--=20
Patrick Williams

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmR93EACgkQqwNHzC0A
wRlMBg//Q1CNUefs7ugexkZPMacW0psXQCAs6N27NbaGhSiLI6ntWr9bUDRqJHqX
zxOD7tqBCdLr/GOtNDhN+ayxdj2YWJcX7+jmSNKsQRHY3ieuCZaFkJwTNN7aQNEx
rieUlYpZS+Fy2G4YULgLOG++XNOTm6tf6P/xOlT/lBz8/J0/tjsEzqCy22zGeTd/
LojRHiU6W3+wOjbJQiphaoWDPW+eSJbG3cKwDkMu1DM8aCCj+ftl42UWI/rzPXlf
VhZdaDKDZa6DvD8aS8xjFiaNI8cNg0zJpkvsmzczJQ5UsDQehsHHM5e9cYNlCTO4
xuw/qJ0pCNh0MPhUbhy4IquTi8rKiIYCPXKGivwQS+qn1mCT9DOo475NccUwR6cl
lyjpxbpV4mMem1mvQsZXXXp0o77hW/rnliUlKVVbVxOpg76m4ZciULYnrEHRTM1o
bFe2b/xCtapEWnpRY9Muh0nx9rivgwiG4X0s/ktXspH/hjVXUVpLbo3qp1NNEbHF
5LYPXYOOO9+4KCuKJn6wmlEb33IP+ZtUl2rDmTLH0v+u3oDs9Jv833ZBJR/7wD7y
Bic7wXdJopONHcyIy2wehDdAvx7hgLBSGdNL9Y87JGBIzVMM1mx8tt+Z/o6CiOH+
ENBSHpnHd0B7kq0JrMnbOlWnu1D0UwsWbHJMPV2tslN6UYoksBg=
=TSeJ
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--
