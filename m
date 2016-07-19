Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rtkBz2tb9zDqMf
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2016 12:14:51 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1468894483063456.22771782026325;
 Mon, 18 Jul 2016 19:14:43 -0700 (PDT)
Date: Mon, 18 Jul 2016 21:14:41 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC v1.0.3 released.
Message-ID: <20160719021441.GJ12735@asimov.austin.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OX7PPUk8qMPP4++R"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 19 Jul 2016 02:14:51 -0000


--OX7PPUk8qMPP4++R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

We released a minor fix release for the v1.0.x stable tree.  There is
one fix above v1.0.2 but it is essential for IPMI to function correctly.

https://github.com/openbmc/openbmc/releases/tag/v1.0.3

Release notes:
* Fix issue in Host IPMI inventory due to versioned shared libraries
    (openbmc/openbmc#423).

--=20
Patrick Williams

--OX7PPUk8qMPP4++R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXjY0RAAoJEKsDR8wtAMEZinQP/j5/yvuzb+m2JX/lULEzbaed
N1nVWA1nyX8uXfp95Rk96FvQ7eDq2hlWuzepKETCI+tLqhxEGBsDtsSjOqsPj/l9
QNimhYQTjcMWiLg4moBle63FcUfcrJh6T++EMLwC8r8C4fuw3KJC2CHFgTHhexLK
jJzS0TPT4FvVrBX6txzhZkZWCFpAs7fIxmkqplVWYlib+WxVZFCXFGpMIcjXOiLW
AHd1qcaskU1J8afDPTBpFvE6kABqUlL8AKgk/0VC7OLWFlIsGBRWw4N7Z+Z5AjJt
amDk+1D1KzhIhVCpxVq0nv0qj9ofr753B1wtthKFlSmChwX/ph66wc/vT8eM2baE
DhQcM2t58InxnoqWqTtmdH5LRkwnmDcYBonb6CDJDIG+6CX3K333bBWoa/s2wrIc
m5oVJAcG3jCZ8nShQ4+WjacJn/OXepNU9jSIwqchud7fVNHJFhDKiZY8JgAyy7pF
Brntlh/2Oi0+L8dglF2CmGCovNLy6yItDc0UBynOo689xkXmVd4BgWd7iED/Q+ah
WsVmPeJaHP3L8l1ov7kzqQILv92O8xajdycN/sTBLsf3IWMjogFoZBlbWkT+ZeMP
ZlViY/uqt/ft1lJLGsDH8LvzKvBGITlaFKNtPBDn1M88UZkxhaTugPr1Aksnp6/+
xVcSOGEKGjMhOCM2hxhf
=yc6u
-----END PGP SIGNATURE-----

--OX7PPUk8qMPP4++R--
