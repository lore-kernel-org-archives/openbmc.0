Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8Csj4Jy8zDqQq
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 11:16:40 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1470791794559961.6179916788902;
 Tue, 9 Aug 2016 18:16:34 -0700 (PDT)
Date: Tue, 9 Aug 2016 20:16:32 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Linux dev-4.7 tree: Request for testing
Message-ID: <20160810011632.qtpu2b5hy5kfou5t@asimov>
References: <CACPK8Xd1M2x5rrPUNwvhg4Yes85hPHxPbnysiC-jNii8W3KBHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="alg5r3b5jt7spns4"
Content-Disposition: inline
In-Reply-To: <CACPK8Xd1M2x5rrPUNwvhg4Yes85hPHxPbnysiC-jNii8W3KBHA@mail.gmail.com>
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
X-List-Received-Date: Wed, 10 Aug 2016 01:16:42 -0000


--alg5r3b5jt7spns4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 12:43:14AM +0930, Joel Stanley wrote:
> Hello OpenBMCers,
>=20
> I've pushed a new Linux tree to https://github.com/openbmc/linux as
> dev-4.7. I intend this to become the new tree used for openbmc's
> master branch.

Joel,

I tried to pull this into the greater OpenBMC build at:
    https://gerrit.openbmc-project.xyz/#/c/159/

Good news: it compiles fine and gets to userspace with network!  Bad
news: lots of other things are broken.

My first observations:

* The host tty has changed from S5 to S4?
    Aug 09 21:52:37 barreleye systemd[1]: Found device /dev/ttyS4.
    Aug 09 21:52:41 barreleye obmc-console-server[588]: obmc-console-server:
        Can't access attribute sirq on device ttyS5: Permission denied
    Aug 09 21:52:41 barreleye obmc-console-server[588]: obmc-console-server:
        Can't access attribute lpc_address on device ttyS5: Permission deni=
ed
    Aug 09 21:52:41 barreleye obmc-console-server[588]: obmc-console-server:
        Can't read tty termios: Input/output error

* There might be some 'startup_hacks' to remove in skeleton:
    Aug 09 21:53:27 barreleye system_manager.py[606]:
        /usr/sbin/startup_hacks.sh: line 7:
        /sys/devices/platform/ahb/ahb:apb/1e787000.vuart/sirq: Permission d=
enied
    Aug 09 21:53:27 barreleye system_manager.py[606]:
        /usr/sbin/startup_hacks.sh: line 8:
        /sys/devices/platform/ahb/ahb:apb/1e787000.vuart/lpc_address: Permi=
ssion
        denied
    Aug 09 21:53:27 barreleye system_manager.py[606]:
        /usr/sbin/startup_hacks.sh: line 9:
        /sys/devices/platform/ahb/ahb:apb/1e787000.vuart/enabled: Permission
        denied

* i2c and LEDs seems to be broken in general.
    Aug 09 21:53:33 barreleye system_manager.py[606]: sh:
        /sys/class/i2c-adapter/i2c-3/3-0050/online: No such file or directo=
ry
    Aug 09 21:53:33 barreleye system_manager.py[606]: sh:
        /sys/class/i2c-adapter/i2c-3/3-0050/online: No such file or directo=
ry
    Aug 09 21:53:37 barreleye system_manager.py[606]: No LEDs present in the
        system

    Also, no /sys/class/i2c-adapter at all and no dmesg about i2c.
    Maybe missing in kernel config somehow?  /sys/class/leds and
    /sys/class/hwmon are both empty.

* pinctrl problems when we try to set up GPIOs
    aspeed-g4-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request() failed for
    pin 138
    aspeed-g4-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: pin-138
    (1e780000.gpio:458) status -22
    aspeed-g4-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: request() failed for
    pin 34
    aspeed-g4-pinctrl 1e6e2000.syscon:pinctrl@1e6e2000: pin-34
    (1e780000.gpio:354) status -22




--=20
Patrick Williams

--alg5r3b5jt7spns4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXqoBwAAoJEKsDR8wtAMEZzIkP/jdf2ugkM/WHkg38hiFl16FC
zEZmLuwsN18VYcTzI60BXl3Qu1yILi23xM3N2uJaY20Edypfd3Tb8XE0nWJu8DSr
BK/B4uG/8iaSxItFNBHYhF0dua4LiP8n12X/CNas6rb4pwR8/rhcahVrtzm67k5h
dFjQtWo+IFxQKvOqWK9fZ1y/Tsy7D4U5Hma4wtqPsRu6oL+MQaBJcbokb/8D++b1
KHw+2wkVPtE70GdZO6RkpHywKipYOwquE8XJCMlFjNMJOXvjX2LY9ezqH4dSPrZ+
gwRoj/DkVdvW0k38rTfJMKwQdxlRcoGk2sXSwYY9j81EU+CXySh0CCA+wQvvhaDE
zqxVptcnQxmqvazcMZV7w7oLFsMYy1Dz+7tQPYjj1OIgZHPCKBuDdepdNOja+QWw
iz8BPjRIe42aJRKmizCXL1rgJQORccPuvYjwc2s6jYGnnXNlCLXD+BhNZaJgryfy
5IoVAkXP0m7nn1rGTWmoHVaPSXPZ39+1QJW0p4HBTIeFbS25rAk6AeLusEY48VyA
C5hsrhKIG8LWEyhRg7DlZLtkrqtZXBb7mV936/DlZaEk7JKnivQnTjVFUQlXHGwi
y85T9ulS8jGJBbKRYuXUomgGwZAWDII8O6JHrm+4qej3caajQ9ur8Iv43LefVWg5
B782LqbhCTUbpjlQWnRo
=Oqxk
-----END PGP SIGNATURE-----

--alg5r3b5jt7spns4--
