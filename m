Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vzZDN0ZXpzDqHK
 for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2017 06:33:39 +1000 (AEST)
Received: from localhost (32.97.110.50 [32.97.110.50]) by mx.zohomail.com
 with SMTPS id 1491510814666766.0131250952356;
 Thu, 6 Apr 2017 13:33:34 -0700 (PDT)
Date: Thu, 6 Apr 2017 15:33:33 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Release v1.99.4
Message-ID: <20170406203333.y44jjya7zmb4hg4h@asimov>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yu2qyc3wuud56iqa"
Content-Disposition: inline
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Thu, 06 Apr 2017 20:33:41 -0000


--yu2qyc3wuud56iqa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I released a tag v1.99.4 as our next development milestone towards
v2.0.  There are 209 commits between v1.99.4 and v1.99.3, plus the
usual many more commits in sub-repositories we manage.

Big changes in this tag:
    * Upgrade from Yocto 2.2 to Yocto 2.1.
        - This was a major change in Yocto/Bitbake.  They upgraded
          all bitbake scripts from python2 to python3.
    * Power9 systems use OpenFSI and compiled application for processor
      control instead of shell scripts.
    * Elimination of "debug mode" in favor of systemd targets:
        - External FSI control for Cronus is done by systemd targets.
        - Automatic reboot of the host can be disabled independently
          by systemd targets.  This leaves the system in quiesce state
          when the host-watchdog fail or checkstop detection occurs.
    * LED management is refactored out of 'skeleton' and old
      /org/openbmc interfaces are removed.
    * Soft power-off should be supported.
        - This allows the host OS to gracefully shutdown on a power-off
          request.
    * Inventory:
        - All local EEPROM and host-IPMI based inventory is migrated to new
          /xyz/openbmc_project interfaces.
        - Fan presence should be reported to inventory.
    * P8/P9 eSEL IPMI commands create /xyz/openbmc_project error events.
    * Error events allow associations to inventory items for suggested
      hardware replacement actions.
        - Triggering fault LED actions as a side-effect should be coming
          in v1.99.5.
    * Support BMC reboot while Host is kept running.
        - The systemd target support for this was completed, but some
          systems may still have trouble successfully coming out of a
          reboot.

--=20
Patrick Williams

--yu2qyc3wuud56iqa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY5qYdAAoJEKsDR8wtAMEZW8YP/jhO5vEeZFPDr8Mcie/lNWKx
nDKkGwkM4duzz0qTrQzBZyJiCYehD1+Z3dFEwAAk37XOor9PolT6B1d3puyuxc++
/OafDMeVxnGEmt11gbIaq/8OB0RrSMfL1ZarkRm+dsr4GbO55ou+lUtGkn1jHVIR
+ukSLtq/qDcmnAi2LxLxYDW7U+5NfAWtpqz7w+6svqLeRGFDdGO03iKUUnm1rLUq
Dus8as95Byb2jtPUvyFR1i3UgFFSKthXlEuIR4zsrbda+bmQDtj7lS1stJNxY1yr
vWIAUT3Co2bWidJ4SPfeavgmgPjYOcPnLkE0BJ6R0dJSsG5rsvJAE1s+SQzFappJ
J3oTR7cv50xNt9UhGfCiY6OYX7cv1O0sFj9i2rZNUcC3oNbPNxK4VIl7G4/hJewd
onN93M76bzkTO+sZHNK63wgwzJJPa8EXfsFxev0rP8NpA1BEBh3ju7Hir4VTtC5m
jAl+9to5/D8VQ9ySxg++0JCXbs2jK6O9Uo3QQ3HrRrWu6YTYMYBzx5G1uRvmYGP8
tF+Mq/IdNjF7SCllTbwMPkK+S7ZmTW/ZTT/m68B8jCoTKe9ITOXVFc0Sf0bCzMhY
/01+HFInbjHUYn0Y4heBE9OXffdJnUKpFSjJxSmUqxHCmGkO4JOgyzGTihr4Tg3T
NlQIb3N9VJAh5XWKomOU
=4MYN
-----END PGP SIGNATURE-----

--yu2qyc3wuud56iqa--
