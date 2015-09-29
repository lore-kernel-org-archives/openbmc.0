Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.158])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 929621A0024
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2015 00:51:24 +1000 (AEST)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1443537257350254.02708993221302;
 Tue, 29 Sep 2015 07:34:17 -0700 (PDT)
Date: Tue, 29 Sep 2015 09:34:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: EEPROM driver
Message-ID: <20150929143413.GE14293@asimov.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 29 Sep 2015 14:51:25 -0000


--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The EEPROM connected to the BMC is an AT24C256.  This is already
supported by a kernel driver: drivers/misc/eeprom/at24.c.  It is enabled
with EEPROM_AT24.

If we have enabled this driver correctly and probe the i2c bus then
there will be an entry in /sys/bus/i2c/devices/ with a file containing
the EEPROM data.  This file can then be passed to our IPMI FRU parser
and then updated in the appropriate fru-manager DBus object.

[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/misc-devices/eeprom
[2] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/misc/eeprom/at24.c
--=20
Patrick Williams

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWCqFlAAoJEKsDR8wtAMEZri4P/0lAqVdUxvqYOdiL3DLegnM+
cNJJmvT9t2NOSItRtEfZ7g4fowsSKoDqX/DoYwFiyKa5A8V9CQxjHJkAz/YVyMmG
azjIXjvk15BmJuXhq5Op4DyCkq6kij94r6tbCk/TxHctwSZz15eTpEyC9CPh9xaq
NFPAb6xDx73rNNUsRFuxo400+CSaDUUnJEztrYtwdX8uNCCNQPuUNjuzWVfDi7yS
nFyfJBb5oNgsnFt516F0mb+vqb6woWLx15gQqzCVJDuqTofsaeQspMpjRFPchTF7
1qE16o0C9fjmW3SM9opt6AcgzPSmEomB8epCF/I3R7LTQShkZJW7/Bg1Bxq1XDvL
RVR3qVTiluJpgfLXEQVRxxsLvidAWg6SuvEN3trUOmOG2zPfHwKz7AkfXZIih4/F
AvAlXN2uF2szIvE11W7folzY5CovmefU0RQ+W9W4A4jDa9CTT9w/U6k29OWGxWHV
qRT3IkOGCGC9xIzkp1JYGHhikm/nM/+G9Yv/F3Yo5kbHB7GbFGK3wJTm436zE5zf
WTCOnoW77o/YUHkt15nTDnXHfa1xOaAJNhnjkLipGQsZ6bk1icmoLSCtva/9D2kb
Z09pi2bAZuYtZYy5EhFxwKs0G8/ODAxupm/14Da9mq7r9MmQKNbGUlAHHcwXASLa
uJo5EcVAE7J47IXB+v2/
=8h7f
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--
