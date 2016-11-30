Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT72D0Y2WzDvHf
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 15:37:55 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1480480668858117.8429400361589;
 Tue, 29 Nov 2016 20:37:48 -0800 (PST)
Date: Tue, 29 Nov 2016 22:37:47 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Shih, Deanna" <deanna.shih@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Roadmap for AST2500?
Message-ID: <20161130043747.GU15757@heinlein.lan>
References: <5051234241C6FC48A7CDB8BFB480285A9ABEB10F@ORSMSX110.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XSEVMyPRvc8xgDhM"
Content-Disposition: inline
In-Reply-To: <5051234241C6FC48A7CDB8BFB480285A9ABEB10F@ORSMSX110.amr.corp.intel.com>
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
X-List-Received-Date: Wed, 30 Nov 2016 04:37:56 -0000


--XSEVMyPRvc8xgDhM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Deanna,

On Wed, Nov 30, 2016 at 12:36:17AM +0000, Shih, Deanna wrote:
> NC-SI is working in U-boot? Could you provide some details on supporting =
NC-SI interface in u-boot and ast2500 specifically.

Yes, NC-SI is working on both AST2400 and AST2500.  We've tested it with
a Broadcom chip.

This u-boot config variable is what enables it:

https://github.com/openbmc/u-boot/blob/v2016.07-aspeed-openbmc/board/aspeed=
/Kconfig#L13

Hopefully you can use that to determine the details you're looking for.

--=20
Patrick Williams

--XSEVMyPRvc8xgDhM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYPleYAAoJEKsDR8wtAMEZQPAP/2Ut3EFbdEGeMrh+/+F4VkSX
kQnb7DJLfs5fGex3ukGNDroru8o9wWSRJSnUPkRQhotY/xdFLoAtUNWpK9KcFr5P
AZ3roRqwznwir6LAyi7/TO8PoMjjyihNeFLQxOcfD0m1U4a4tNI72FO1efmE0PuN
xstA9zXttJhl6IWeYlRkt2WbmFATpu4f/56i4AjfvN70PmCtlFqXB0FbY04GMW8r
nwxDAMc/ZjcrX+Rf2C20k8Rz3qMeJhKMwsdOyKGrxJL9bjpT33Jz67hSOVjsaLv/
J3LoRxDh+HOXxv2WOxcKaS3dMKkUBbc7VnrYE5q37J/737k6DE0nYMWZ1NvFaQwP
rw44Us3YaET4Yfg0tRoqdcRSMK1kegWkITOny3SDX88YMF+d1wqGbB1Y6XMOVJLT
LkTTSWxret+VB6fnxd6KwTIGWzhA6XL+apXuTpcKEJSA/aKsQr6MNOFJEo/cv8HR
/N7KpqrJ3EakNB9ka25SJQAkp1qOtnJrQXYiHW+n04Fp4a5uOI2lmpgQpLsiMCzB
9fVxMJk7deVc9+51f8mn+CUsRiaYmCckcOrHPKw2BrwC7JhT2265CZgn064kYiU3
wpa/CiEJooky4Ua2Wfu4vltIFNOt/cKaaToA0tMFjxazghOaQRu/bbyky3gEFoD6
z1lh8sTCv10T5sBFSEu6
=ktbT
-----END PGP SIGNATURE-----

--XSEVMyPRvc8xgDhM--
