Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D60881A0741
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 06:17:16 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 144493663281321.11945661953837;
 Thu, 15 Oct 2015 12:17:12 -0700 (PDT)
Date: Thu, 15 Oct 2015 14:17:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openpower-host-ipmi-oem 0/2] B1 Added oem so and test
 program
Message-ID: <20151015191711.GD21126@asimov.austin.ibm.com>
References: <1444832603-18260-1-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline
In-Reply-To: <1444832603-18260-1-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_1
X-ZohoMail-Owner: <20151015191711.GD21126@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 15 Oct 2015 19:17:17 -0000


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Can you update the title of the pull request to not have 'B1'.

On Wed, Oct 14, 2015 at 09:23:21AM -0500, OpenBMC Patches wrote:
> https://github.com/openbmc/openpower-host-ipmi-oem/pull/1
>=20
> Chris Austen (2):
>   Support OpenPOWERs OEM commands on openbmc
>   Add a test framework for the .so
>=20
>  Makefile     |  27 ++++++++++
>  README.md    |   1 +
>  ipmid-api.h  |  83 +++++++++++++++++++++++++++++++
>  ipmid.H      |  15 ++++++
>  oemhandler.C |  92 ++++++++++++++++++++++++++++++++++
>  oemhandler.h |  32 ++++++++++++
>  testit.C     | 157 +++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  testit.h     |  14 ++++++
>  8 files changed, 421 insertions(+)
>  create mode 100644 Makefile
>  create mode 100644 README.md
>  create mode 100644 ipmid-api.h
>  create mode 100644 ipmid.H
>  create mode 100644 oemhandler.C
>  create mode 100644 oemhandler.h
>  create mode 100644 testit.C
>  create mode 100644 testit.h
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

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWH/u3AAoJEKsDR8wtAMEZZ60P/RbEMTOyYmZyuqWpZy+Ak7Xc
khBNfa7x/5KiVvfPPR/44dKogj6P8r3lrGpHv2SZY0P4OGvin36GWuaRDYQFESx8
QuBFgWQCA2ZTTjipzELw0U1DXJbmEpzM+BnB66DKgQiKHoBup9l+eThs7Socn/qL
JbIdAomuD/oNeIteNUfdInJuYYQARW1A1AhmMRqk7o5UJPUDLWc3MttJX/4ax1Tg
66he1X0CYs3u1QLFAjzQTg+/yUc8Z4Otd+rlZ4QpoiZSKx1k0dNtUwCZiEuE3Ncs
y+e/+8jbh79kUoDQDxmVLKMM6H9XekPOIyX0Ng5rbpu5HP8wUkRAqvy6Xd4C3mhh
xSy6zB/aCKzVSFeDhsX+j8dHctwvyYgZEmo6uESqHgQ0KcF3W2Lb+ZdLqhMGV5x9
9GeHH0rlhEbEA60ORI84eUE6IARk40ycZH4YAHOB64VxmZ3E7r/n/Oomd3TPX5BL
Jskc11Bu0mq4EcffZCe8QZ0Ya/R4JmeXe7YgjerX+ONSQ1Zu5UTkUh3oiEs7yt6G
q/DKNcB1uAug8UZCiWc6UZGNbI5BhyKhp0LzKXJtR7+l7YHz7omkueJwRJYiKx0i
1NPAqw7DWGG3PKdnN9q8LZGMhRmNEUpFly0Y8BIor02eveh44G031IWOXzsS0Uoo
qpGJXvgAVEv6CKPvFjSP
=thg1
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
