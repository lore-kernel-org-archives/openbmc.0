Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w06YY5JxZzDqHq
 for <openbmc@lists.ozlabs.org>; Sat,  8 Apr 2017 03:50:24 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1491587418546436.82300465341075;
 Fri, 7 Apr 2017 10:50:18 -0700 (PDT)
Date: Fri, 7 Apr 2017 12:50:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Release v1.99.4
Message-ID: <20170407175012.GA10151@heinlein.lan>
References: <20170406203333.y44jjya7zmb4hg4h@asimov>
 <1491522001.5817.6.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <1491522001.5817.6.camel@aj.id.au>
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
X-List-Received-Date: Fri, 07 Apr 2017 17:50:26 -0000


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 07, 2017 at 09:10:01AM +0930, Andrew Jeffery wrote:
> A few points and queries:
>=20
> > =A0=A0=A0=A0* Elimination of "debug mode" in favor of systemd targets:
> > =A0=A0=A0=A0=A0=A0=A0=A0- External FSI control for Cronus is done by sy=
stemd targets.
> > =A0=A0=A0=A0=A0=A0=A0=A0- Automatic reboot of the host can be disabled =
independently
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0by systemd targets.=A0=A0This leaves the =
system in quiesce state
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0when the host-watchdog fail or checkstop =
detection occurs.
>=20
> Patrick: Do you have a link to documentation of these targets? Ideally
> these announcements would also provide these pointers.

This was posted to the mailing list recently.

https://lists.ozlabs.org/pipermail/openbmc/2017-March/007103.html

Matt Spinler, can you put a commit into openbmc/docs to permanently
document?

>=20
> > =A0=A0=A0=A0* LED management is refactored out of 'skeleton' and old
> > =A0=A0=A0=A0=A0=A0/org/openbmc interfaces are removed.
> > =A0=A0=A0=A0* Soft power-off should be supported.
> > =A0=A0=A0=A0=A0=A0=A0=A0- This allows the host OS to gracefully shutdow=
n on a power-off
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0request.
>=20
> Again, is there documentation?

https://github.com/openbmc/phosphor-dbus-interfaces is the starting
point for all dbus interfaces now. State-management is pretty well
documented: https://github.com/openbmc/phosphor-dbus-interfaces/tree/master=
/xyz/openbmc_project/State

Your specific question about soft power-off, this is the default now for
the host object.  If you want to simply pull power (hard power-off) you
operate on the chassis object.

--=20
Patrick Williams

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAljn0VIACgkQqwNHzC0A
wRlNCg/9F2vjOZ+wpsOxTkQULquV+lkqfijIrEt87PodY1CKlFMkSLPgNZRSokb6
UKuePYtuVey2BtvrVtRnIOi52m7k7TmnM/yQ0asH1XoY0/rw2k9sukifs9JiPdc7
H67QDkZXatIr8vFGGOGWscklj9Q7HAS/qFu8rtKQ6MAcgo0KO1nGPzRTKdaRZAXG
3O3tqCDBxGwGb9IuoAWt2s1ddSlNM+lZy+cdBXEnSi+2aLTDMECa1bORRTR2r4lf
12cmMDx6yKnWA2AclqO76tG0u4i3oqDl4Jy61BdAvv992m5HcbjJUE2PZtKIqRZr
Y85wy7MwBb8x7E8U6+AX7QLLkgYza9i3mTzphG9LJet3gwkoU00g1tL04oPC5Lp3
tXNRNz7wEwc9xIXTM5vaVkV7wkBpcMTFxtIwB0T1XhqCPNV0tXmcypelXxuHpbVw
mTgCU4wM52iF9eFnnwgapGz4EN6jv+ZCmJ9JWNbgPGRhhJ9p2aIgG/89ToBIhJMm
AAcu8wab4q7fgWB29i5KKLaUMdCubY3JiRb8j/CntHc5rLvvF9o8KEAKnnhJUwG6
W2txGvYnZgdL9jT/AfPcFTLTIMryY1EQ83QFoxgb6N11VZ0ib9VvXCMj72Wvzdmm
j03nVHOv6bI9KyafgL47YIRlUlwgtgO/EkA4osg/rtFm6qurRoM=
=J6jt
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
