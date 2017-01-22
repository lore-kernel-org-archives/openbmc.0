Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v5btB6ZzhzDqRC;
 Sun, 22 Jan 2017 12:08:32 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1485047306648882.9818309531419;
 Sat, 21 Jan 2017 17:08:26 -0800 (PST)
Date: Sat, 21 Jan 2017 19:08:25 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenPower-Firmware Maillist <openpower-firmware@lists.ozlabs.org>
Subject: OpenBMC v1.99.1 and OpenPower v1.14
Message-ID: <20170122010825.GE5120@heinlein.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uCPdOCrL+PnN2Vxy"
Content-Disposition: inline
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
X-List-Received-Date: Sun, 22 Jan 2017 01:08:35 -0000


--uCPdOCrL+PnN2Vxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I just tagged two levels on Github:

    OpenBMC - v1.99.1
    OpenPower - v1.14

Together these contain the boot support for Power9 systems: Witherspoon
and Zaius.

The full release notes for OpenPower are at:
    https://github.com/open-power/op-build/releases/tag/v1.14

For OpenBMC this also represents a fairly major point release in our
development towards v2.0.  There are 425 commits between the two, in
addition to the commits in many referenced repositories, and roughly
4.5 months of development by the team.

--=20
Patrick Williams

--uCPdOCrL+PnN2Vxy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYhAYIAAoJEKsDR8wtAMEZlEMP/RObGlEBJzIEYF+IFd7zwZ5R
tj0T9UiTrPq8pNk77pp+mH/Vuk9PzaXeqiuNkkDFwU1nUtoans/5ad+tAg1dVJGv
uVGbut4DezgO9juKUKo7bXfo8QKNyEXNm3Sq4XOpKCIpUDixBnxpGKc+J980hI96
sw/pHRwfX5cl1cDbVXprcbZuVYHDNibfTlExHlcDauqWYiGGLNvH4OEypIPrdTsU
kafDa5GU3YtUt/XwiQZTDV/HEMkoosceHiTyjD1Ao4+nlmq99Bb7u6kiJ+WKfvvT
GwLGnZ1IvUxZ53r4AqGmbYA7U+TmTNmH3+IDh2Ep/vNfOeFRJhhLtBA1hYa9ESBD
3oElHp3C9+uYMkGwtMFnUdqvRpFUS2WkZKZb9GBHltiQYqWYb1xtoXEKSlnpfuS8
cgdKzsGl9rx0e+HlqLqnjBbSZbWDipS8agsfG96FbXRrA4btagUp6BksXku67jMT
Q2Wb6Dr0gLJtvxtBkE4BXniN6v28kUbnjKrlXN1vEoz0q94btmNkkHHYF5BJaxdd
8D1e0lTgzEDVldbIcscwrC9OXjFmNxQqDsMC12IL3cUrdKG9xpoaqVl186I/pBgA
d8gbBOXeMjB+9ebtsr3oeW2reKCmdcUCZel0G7cbHbTGfLK7w/YBS25/uYOHwTZQ
W329XWDmYbUGDuSzyigh
=LGNK
-----END PGP SIGNATURE-----

--uCPdOCrL+PnN2Vxy--
