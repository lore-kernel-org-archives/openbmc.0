Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sJ1W86SfSzDrJq
 for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2016 03:57:40 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 14718886563891023.7375288467598;
 Mon, 22 Aug 2016 10:57:36 -0700 (PDT)
Date: Mon, 22 Aug 2016 12:57:34 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC v1.0.5 released.
Message-ID: <20160822175734.ljnnyghwioar6njr@asimov>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b5j2mxmzfgviobkx"
Content-Disposition: inline
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Mon, 22 Aug 2016 17:57:41 -0000


--b5j2mxmzfgviobkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Another fix release for the v1.0.x stable tree was tagged today.

https://github.com/openbmc/openbmc/releases/tag/v1.0.5

Changes since v1.0.4:
    * Cache all inventory properties and preserve inventory during BMC
      firmware update (openbmc/openbmc#487)
    * Update the power button behavior on Barreleye to:
        * Short press: Only power on. Remove the power off action.
        * Long press (>3 seconds): Hard power off.
    * Kernel version update:
        * Stable release 4.4.18
        * Ensure the LEDs stay at the same state on boot (openbmc/linux#98)

--=20
Patrick Williams

--b5j2mxmzfgviobkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXuz0OAAoJEKsDR8wtAMEZCd0P/1uk0Fgk8JNQak4IM5et4MYq
syUsNJiJKJ46xN3ittPg9bKWIaszj8v5ceM8hwHkehM/1YjHk5UZT4vJ12Cgb2wp
HJ9kyTNGJEM3m1gbasLZ660KE6PiMsJpElPUG0zjRyKyAEuQRDoH+cMlDDvqFG7o
YDJk/R3qlFKyZWBEhL2T1nqAmWPRweT1WhaKvmw8GJUrvrqrXOZybyn1jPryr0o+
CC+y06T5FLIBlgRTBXRS3gu+68QGwJQ4h8d0yKosJGePcOQkK/pfSGDRs8AlACDI
pZbHZnpShzhEWp9Gyd8wH+e1FeZ5alLKNd5R2vfbQNr2QFpzsLeF4musFh3JyrKL
63fR2i3Yb+ODTWQnAceJJhae8r0Q6RaptTI8PIYblw7E4fGxmTTXgCKFICacQHo5
QdQRKW2BWPLHyUc4p1HJzyBUY8+azpft7ysoHDgz6kD/hUi4hs5tQVUYlrutNVrI
4l5fDiwS6dZIE6qPugB26yfac/QA4xDHMeVqmn5DEY4V2kbcoNymXRySQ1qU9zii
VYj4vPCYkSpcvVEjByakD0VW+/Sr/fOk9Ad/8HPn3/b/11SGj5dd1WTwo1QlnRkq
PdvsrM6TNaNWnFTqYEkgqdiO21eyH0MKEoRSP82uVGStYAeS7gsOcTgEZH7k5XUW
Rn70iHCrfntAL5/L5Hzl
=hO2b
-----END PGP SIGNATURE-----

--b5j2mxmzfgviobkx--
