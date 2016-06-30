Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgXS03RkMzDqmT
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 07:17:18 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1467321432492985.682765731907;
 Thu, 30 Jun 2016 14:17:12 -0700 (PDT)
Date: Thu, 30 Jun 2016 16:17:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Andrew Geissler <andrewg@us.ibm.com>
Subject: Re: [PATCH skeleton v3 2/2] Disable watchdog timer if debug_mode is
 set
Message-ID: <20160630211710.GU20922@asimov.austin.ibm.com>
References: <20160630175112.5387-1-openbmc-patches@stwcx.xyz>
 <20160630175112.5387-3-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TegBI+r9roYdcP94"
Content-Disposition: inline
In-Reply-To: <20160630175112.5387-3-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 21:17:21 -0000


--TegBI+r9roYdcP94
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2016 at 12:51:12PM -0500, OpenBMC Patches wrote:
> From: Andrew Geissler <andrewg@us.ibm.com>
>=20
> https://github.com/openbmc/openbmc/issues/246

Should be something like 'Resolves openbmc/openbmc#246'.
See https://help.github.com/articles/closing-issues-via-commit-messages/

--=20
Patrick Williams

--TegBI+r9roYdcP94
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdYxWAAoJEKsDR8wtAMEZUToP/RZnYNrJ0diLWg2W96zT2Jad
hAvYuPjGqVWI/3TaWAW+3BcnRui/vkIBGu6sc9ZEne/TETX6LOQSEgIKZmUEiNuQ
g7ex6rpRD48RL4tv08RbYxX8YEgguC5TMT0mCX7jJSAoTRT+c1MiCOkmF7IQ/NUk
efU/2jH1LKXnUuZ1UPde+Ie0hK1lKA0n8/6iQQa93Oo+O+l6pdCM6V+X0F+5LaiG
lIqd7rvmPbMY0f1ZdSo2uc5HHxdwfhOsT4Xnk3JAHady/A1KUFoPfhOqb2Ac3+5p
kAdb3602Tv4xybqhruH+KNKjHnFpctGebrmAHoLmKB+0/oMmKHvA63J53eiXiL8K
DLMxEvyu3ZU7A3mdVLQQAdN8cU3dZ+gJQBcn/rIny8D+t5mPJVWK0jK5Q2XWOUlO
YQuH/1EyQ9zGLZrbxOH54zhz7gtH38tN4VZP2cwXVl8B7S9bvapZkMvJg8zyzsnb
vcjqybM7MHYy32DK1l8699d3Z5u3Sqhdgst/6NUy47pPall+wMb0Ibvz2qoPYpuP
vZ/Eb7G4jEwxdtoVhhkpujuMdRtJ3zgUfRg/7TCUbF2O1VyeaIEC55RC53MqM3T7
IJO6vDRavdHBHM6UCQYXMqUh7OeK2phlnK7c7GCE3VJKz2Q5O1CGA7FCj0U6uQrw
NgjBimQnbZSPyEPq69OR
=KZwR
-----END PGP SIGNATURE-----

--TegBI+r9roYdcP94--
