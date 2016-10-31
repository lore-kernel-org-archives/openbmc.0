Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t76Qm3nQWzDvHf
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 08:08:15 +1100 (AEDT)
Received: from localhost (32.97.110.51 [32.97.110.51]) by mx.zohomail.com
 with SMTPS id 1477948090234698.4541182439378;
 Mon, 31 Oct 2016 14:08:10 -0700 (PDT)
Date: Mon, 31 Oct 2016 16:08:08 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Comments on Sensor design.
Message-ID: <20161031210739.k2x67uz6m55j3n2u@asimov>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m7js5gchwc3zz5ux"
Content-Disposition: inline
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Mon, 31 Oct 2016 21:08:17 -0000


--m7js5gchwc3zz5ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There was a request for us to start on the openbmc interfaces for
Sensors in the near future.  Before we get started on it I wanted to
solicit feedback on two divergent approaches.

Before I start, keep in mind that any proposals for DBus designs will
show up here:
    https://gerrit.openbmc-project.xyz/#/q/project:openbmc/phosphor-dbus-in=
terfaces+status:open

The two divergent approaches are:

    1. Have a single interface for all sensor readings.  Example:
            Interface xyz.openbmc_project.Sensor
                Properties:
                     - Value (integer)
                     - Unit (string [enumeration])
                     - Scale (integer, n where real_value =3D value*10^n)

    2. Have unique interfaces for different kinds of sensor readings.
            Interface xyz.openbmc_project.Sensor.Temperature
            Interface xyz.openbmc_project.Sensor.Tach
                ( Same value and scale properties )

In both cases the dbus path could contain the 'type':
    /xyz/openbmc_project/sensors/temperature/ambient
    /xyz/openbmc_project/sensors/fan_tach/fan0

The question is essentially should the "Unit" property be used to
resolve the 'type' or should we have distinct interfaces for each
'type'?

For some comparison with other standards, CIM had a single Sensor class
while Redfish seems to have multiple classes (Fan, Temperature) for each
type.

--=20
Patrick Williams

--m7js5gchwc3zz5ux
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYF7K4AAoJEKsDR8wtAMEZaUkP/R1wbuvQS/RwIIMVPciwC5fv
vPWkTYwJRf/4mcH2L/eKFSsxIAj2Pft8hakY9AynM0L2Uj5zCIN9boCsNprdfePa
5oWk/9K0PRBrBzlOEl7jkIhDv0LdnVKIvbqTWypM0RW77jI227ozZovfz8SPP8vA
d98hczaQ2xpPgh6XrS/jyAMTebPcEDUYuc50duomtbDS4SzcKuaEmLH2+wPGyJqw
6h361ZBvUFYVWQGg3csKE3uT4teiiXgsh/tF/ccgKWueDFFlMw/QblaqRS/pKbmY
kqqEX/rMSn1/pngeyoqKeyA0+0WKiN1HHWZbV/A/47SEIlRcyQIhSza/zWG5lEHr
XkGhPua8IcHpibbLjMwCYl8yRBwtElxzGud4RmSEOGqVdKnJZFYRAQo9jn3ORxm1
tSRg/oznj5llcAUMhp3UHnY8lGBRfNpQM/1BKEqUJUuN9pfeNuGenTqW+CUiTjRg
RFwY2QE3vDx79r6JMqQOyG8N9wthUEgKH9sqKZdf9HA+CNM1eqKMXBsCYqcLdsJB
Sb3NhDn5HYF4XY+Ikd3vJWBl51+ToaZVp2OkSrjEU6dnuKVSQm1zhAiqF7staVkx
eSmTMM1AD8f3gF4tRJeDdWBqEu7Rk7fKJkxL17rG9KxZN5+qUnoeUukQamBjWwnE
U+7AjnJwTXJaM28OrSr1
=yLuj
-----END PGP SIGNATURE-----

--m7js5gchwc3zz5ux--
