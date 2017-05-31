Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wd9Z62VCczDq5W
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 23:00:29 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1496235620920488.99263758857023;
 Wed, 31 May 2017 06:00:20 -0700 (PDT)
Date: Wed, 31 May 2017 08:00:20 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rahul Maheshwari3 <rahulmaheshwari@in.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Consistent naming for physical LED.
Message-ID: <20170531130020.GA29772@asimov.ibmmodules.com>
References: <20170505180537.GG25937@heinlein.lan>
 <OF867BE263.6CF5588B-ON00258117.003404BD-00258117.003612B8@notes.na.collabserv.com>
 <OF8328B8DE.E0C57A25-ON0025811A.00373812-0025811A.0037D739@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <OF8328B8DE.E0C57A25-ON0025811A.00373812-0025811A.0037D739@notes.na.collabserv.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 31 May 2017 13:00:31 -0000


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2017 at 10:09:55AM +0000, Rahul Maheshwari3 wrote:
>    Patrick
>    I was believing that these 3 physical LEDs(Identify, Fault, Power) will
>    be lit on/off based on group LED asserted state. Example: Physical's
>    fault LED will be lit ON when any fault LED(e.g. cpu0fault) in group is
>    asserted.
>    If that is not the case and we need to rely on below LED groups to get
>    full system status then - how are we going to display state like blink
>    in future using these group LED?

Specific LED behavior is a system policy that differs by system and
OEM/ODM.  There is not a common set of tests we can create for that.

The groups indicate a virtual function like "the FRU x has a fault" or
"the system is powered on", which may cause an indicator like an LED to
behave in a certain way.  The behavior itself is system specific.  (As
an example, Witherspoon has a front-fault and rear-fault LED that are
both turned 'on' when the system has a fault).

>=20
>    /xyz/openbmc_project/led/groups/enclosure_fault
>    /xyz/openbmc_project/led/groups/enclosure_identify
>    /xyz/openbmc_project/led/groups/power_on
>    /xyz/openbmc_project/led/groups/power_off
>=20
>    Thanks
>    Rahul
>=20
>      ----- Original message -----
>      From: Patrick Williams <patrick@stwcx.xyz>
>      To: Rahul Maheshwari3 <rahulmaheshwari@in.ibm.com>
>      Cc: openbmc@lists.ozlabs.org
>      Subject: Re: Consistent naming for physical LED.
>      Date: Fri, May 5, 2017 11:35 PM
>=20
>    On Fri, May 05, 2017 at 09:50:37AM +0000, Rahul Maheshwari3 wrote:
>    >    Hi
>    >    With new xyz interface, I see that physical Identify LED is named
>    >    differently as "id" in Witherspoon and system state led as "beep"
>    in
>    >    Barreleye. Also I see that we have 3rd LED in Witherspoon is
>    "fault"
>    >    (for enclosure fault) and in Barreleye and palmetto "heartbeat"
>    (for
>    >    BMC state state).
>    >
>    >    Can we have same set of name/xyz url for physical LED across
>    different
>    >    systems?
>    >
>    >    Witherspoon
>    >        "/xyz/openbmc_project/led/physical/power",         System
>    State LED
>    >        "/xyz/openbmc_project/led/physical/id",
>    Identify LED
>    >        "/xyz/openbmc_project/led/physical/fault"
>    Enclosure
>    >    fault LED
>    >    Barreleye
>    >        "/xyz/openbmc_project/led/physical/identify",        Identify
>    LED
>    >        "/xyz/openbmc_project/led/physical/beep",           System
>    State
>    >    LED
>    >        "/xyz/openbmc_project/led/physical/heartbeat"     BMC state
>    >    Palmetto
>    >        "/xyz/openbmc_project/led/physical/power",         System
>    state
>    >        "/xyz/openbmc_project/led/physical/identify",        Identify
>    LED
>    >        "/xyz/openbmc_project/led/physical/heartbeat"     BMC state
>    >
>    >    Thanks
>    >    Rahul
>    Rahul,
>    We expect those to potentially be generated from board schematics and
>    are not intended to be used as a universal identifier for anything.  We
>    do have requirements on the naming of the LED groups, which is what we
>    intend users to interact with.  What are you trying to use the physical
>    LED for that you would like some kind of consistent naming and are you
>    sure the group would not be more appropriate for your purpose?
>    --
>    Patrick Williams

--=20
Patrick Williams

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkuvmEACgkQqwNHzC0A
wRk3Wg//R1osjH8kw3uSYG36awIGkO+r6z5Ptta4KxPpdqopnignJNVxFLr94oe/
U2CPAKu/X68tgNj8A/yO1IfNqx5Em4jQFvV/ppJS9E8b2AaOZCLxdl/ct7lTp/c4
57wb92sCKiNuGNtlTod2PEkEJiTlprKjsninHqsHbqQNoFkyD1QJseBFmGnOtQP1
IIoIaDyYpFD1WsZrew8yiiiZRgsc6cbvuLJECdRXV1X73qm+tjqTJbubcHKn101d
Z1t7QiPsiPYjQQGFsttVBXxxXzbw24XGB3kCI/4GNswcV4iMcP8lveva3B4NfT6Q
7yRgJOFBs5HYfhIEe8bFS36S4B9g/gwp4vMls2FQYbOsv1YBCrOeOaH9r8KGCtIr
sm3jY8wDLuqW1/ma9KXT1WeUuZvUyMs5JcKiKVesuzDMMvmgaCFY2zrj0Ra5eG+M
gSrc+H9a01Z5ssE5T8DLSLUwgmRUdvk1H0c8dWJhgXs+UifTmVavmiBSzuG6+pmQ
gpR9QzI6Z4mTeWltTrybeDH/IFvX8+gasX1+rPmOg3YIbgfqbv2wMLvQBso9BVJ6
BxyrDwmByMkQPVKOxRMmI3a/pJBO7xA+nL7LYBdBzXnKkELV1mdccM2rtIGF2mDP
GtHCQj3qfb3v2hwlqbEKL3aCC6pjj3m6jyfVNNjC+niEz7bzjXs=
=5DOz
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
