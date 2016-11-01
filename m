Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7h4P1KMgzDvM9
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 06:24:20 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1478028251508483.7416435307771;
 Tue, 1 Nov 2016 12:24:11 -0700 (PDT)
Date: Tue, 1 Nov 2016 14:24:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Comments on Sensor design.
Message-ID: <20161101192409.3zgt6gauspdera77@asimov>
References: <20161031210739.k2x67uz6m55j3n2u@asimov>
 <09ACC961-A154-4930-B6F1-1CA0DCC65559@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xeg2xpteevtx6w6u"
Content-Disposition: inline
In-Reply-To: <09ACC961-A154-4930-B6F1-1CA0DCC65559@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 01 Nov 2016 19:24:21 -0000


--xeg2xpteevtx6w6u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2016 at 10:10:08AM -0400, Brad Bishop wrote:
> I can see a path here to extending what a sensor is (additional propertie=
s)=20
> without impacting the existing API.  Do we lose that capability with opti=
on #1?
> What about com.ibm.Sensor or org.open_power.Sensor?

I don't think we lose that.  Someone could always extend it with a
'com.ibm.Sensor.Temperature' interface if they wanted.

I fully expect that we will have at least one extension which is related
to thresholds.
    xyz.openbmc_project.Sensor.Threshold
        property max
        property min

I suspect what I just wrote isn't correct and may require multiple
interfaces to handle all the different threshold types.

> >=20
> > In both cases the dbus path could contain the 'type':
> >    /xyz/openbmc_project/sensors/temperature/ambient
> >    /xyz/openbmc_project/sensors/fan_tach/fan0
> >=20
> > The question is essentially should the "Unit" property be used to
> > resolve the 'type' or should we have distinct interfaces for each
> > 'type=E2=80=99?
>=20
> Leaning towards the latter, for the reason stated above.
>=20

The big trade-off to me between them, besides minor impact of multiple
implementations of effectively the same content, has to do with signals
and filtering.  I could see it interesting to listen for signals on all
*.Sensor instead of having to listen for them each individually.  Maybe
the path is sufficient for this as well.

--=20
Patrick Williams

--xeg2xpteevtx6w6u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYGOvZAAoJEKsDR8wtAMEZnQMP/3QGlKTqAhp6qxDNvJp33fPi
a1qrEq7HoypEhexkFq4es3/nDgAJAEwli3VVehMj6K1FJMOAPws7g1jzmfKiB/0d
sdX8U9PfvQ80txFeWflN3feLZMbiXG/rx1okQihOM2ZJjurjZ1kRoREATuBINuaG
FIXDyNvWhq4MOb5GBsTEpPpwupS4ts1Wkvpi+2NUWrTgbrEmhBzdsuy7Mnbqr9er
54QZEhG+Y5/1VUIaDc0QgUQ+jVIHLOkpOacBW/CxK9ZqsFKpad4yEPMxatqun9/T
8w8rSk6ZuINxKciDtzZfoQPME9NgfUmpaCkPdgtKizOB5m4ry6m3Dy7C1hhnfaxz
IxVxIybTXhcqxLV6Ggzr8GzEwfw60ENOcvC/cKN0/LyTq6SURdI6C4NdiMtO6ckM
pdyKDXW4SEUIOm4ftx8ILEj420ss/8m26T+YhZUJY5vr7e1h2R8+dEFbgzYg2WEf
sTwfUC74bBj3f7eBr3gJMgRs9g48AEZbmNOcf4icdNKxbF1IPvZCn6MfaMj+kYbM
LihwY2U5l5x4vfBczR4YYg9j6hXlHPRYXeE+SzdUjF+7+TtPNM1d22iihvpolMPT
4akH9ePbfZgPA9n9jpNVDVikn29IJXZk3ZDY7lbVywHJJmZ9TPovRFOmVOQI2xFT
oZZw4gqEPlaSd57PrWZx
=gijZ
-----END PGP SIGNATURE-----

--xeg2xpteevtx6w6u--
