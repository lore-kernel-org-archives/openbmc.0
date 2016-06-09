Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ6Jw6nTwzDqHF
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:54:40 +1000 (AEST)
Received: from localhost (156.39.10.45 [156.39.10.45]) by mx.zohomail.com
 with SMTPS id 1465433655977315.4683257798688;
 Wed, 8 Jun 2016 17:54:15 -0700 (PDT)
Date: Wed, 8 Jun 2016 19:54:15 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Shay Slobodkin <shays@mellanox.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: AST2500 support questions
Message-ID: <20160609005415.GT19968@asimov.austin.ibm.com>
References: <DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0@DB4PR05MB0941.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2mNuWrpDTYoom6W8"
Content-Disposition: inline
In-Reply-To: <DB4PR05MB0941CA88039CFE2BEEA8ECD9D55D0@DB4PR05MB0941.eurprd05.prod.outlook.com>
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
X-List-Received-Date: Thu, 09 Jun 2016 00:54:41 -0000


--2mNuWrpDTYoom6W8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2016 at 06:43:13PM +0000, Shay Slobodkin wrote:
> Hi,
>=20
> 3. We saw in a latest updates that there is a new u-boot https://github.c=
om/legoater/u-boot/tree/v2016.05-ast2500.
> Is it stable enough for using it?
>=20

Shay,

Like Rick said, work is going on to get all the AST2500 work upstreamed
into openbmc recipes.  There are a lot of moving parts to make that
happen and we've got a few different teams with a few different pieces
of hardware hacking on all the parts.

Cedric's repository is where he is doing some of the hacking.  You can
obviously use that if it seems to work for you.  Once the pieces
involved with supporting the AST2500 are ready you'll see the openbmc
recipes updated and they will point at an "official" openbmc-uboot tree.

--=20
Patrick Williams

--2mNuWrpDTYoom6W8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXWL43AAoJEKsDR8wtAMEZohMQAJrGYUnC1s7p0RtYKn+Hu+/T
4DPHUCVOQ4MFEXvRyVjKlYoBpl2RuK7C+zzZqBsrA0urCrc8deVUWOSfNIFSWUXV
/xCuWr/o837IoFZggM90xfA1Iix3qbHfjQZyWtB372WwMNuQwlHp8c5AqHGUnyJu
lPq+UsTtccYt3oEFBTKPTeV8Cp1miib+ttH56RFS4CUHOxtIpPm21gKF1Fv5woz/
SgvelCZpFEM2yX3XaRdX+d7BTzB7Oo86PbceqLlfvMjNIKaxQ5dRihaQi3pHSflh
qALx8zNqtGF2fOcCRQyIVxYrb6sAcV/E5OwPVrm70a1IDN+Nm6mga2VLC53u9AaX
tJxgbuWTY0TYz6mPybP1nENwsDssxQK6dZ1JrfJaWdkhLv7XW7g1YapNXQng0/Sg
l1N9orPa4+0OIPBK5clsKJxFTaPKh5toBGAQa5rvNz1TG108jUOJmuT7fb5QitY1
WdKMocNroGxT8noP3WPlDMbX+4AodTWOHg/WQGwsP9qf+xIEIran0ENDsSTbopqb
MWxAbGKvvidSjnrwIy54V+s4BjuhTC3K38D85e3EF5FVLMkdvBRMvS6jMFSnfFoY
uqIM5m48xUBE/Nuhv/WMJLr6o5oQjC/KYI/m5Jxna7UE6CBRYMb4I1NI0xvpC5GY
0j+uiBGxs6PNu2aw/yAM
=OOnE
-----END PGP SIGNATURE-----

--2mNuWrpDTYoom6W8--
