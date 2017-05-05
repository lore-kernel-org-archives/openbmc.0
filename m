Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKKZH1sf1zDq5W
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 04:05:42 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1494007538498969.5295101073768;
 Fri, 5 May 2017 11:05:38 -0700 (PDT)
Date: Fri, 5 May 2017 13:05:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rahul Maheshwari3 <rahulmaheshwari@in.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Consistent naming for physical LED.
Message-ID: <20170505180537.GG25937@heinlein.lan>
References: <OF867BE263.6CF5588B-ON00258117.003404BD-00258117.003612B8@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
Content-Disposition: inline
In-Reply-To: <OF867BE263.6CF5588B-ON00258117.003404BD-00258117.003612B8@notes.na.collabserv.com>
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
X-List-Received-Date: Fri, 05 May 2017 18:05:44 -0000


--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2017 at 09:50:37AM +0000, Rahul Maheshwari3 wrote:
>    Hi
>    With new xyz interface, I see that physical Identify LED is named
>    differently as "id" in Witherspoon and system state led as "beep" in
>    Barreleye. Also I see that we have 3rd LED in Witherspoon is "fault"
>    (for enclosure fault) and in Barreleye and palmetto "heartbeat" (for
>    BMC state state).
>=20
>    Can we have same set of name/xyz url for physical LED across different
>    systems?
>=20
>    Witherspoon
>        "/xyz/openbmc_project/led/physical/power",         System State LED
>        "/xyz/openbmc_project/led/physical/id",                Identify LED
>        "/xyz/openbmc_project/led/physical/fault"             Enclosure
>    fault LED
>    Barreleye
>        "/xyz/openbmc_project/led/physical/identify",        Identify LED
>        "/xyz/openbmc_project/led/physical/beep",           System State
>    LED
>        "/xyz/openbmc_project/led/physical/heartbeat"     BMC state
>    Palmetto
>        "/xyz/openbmc_project/led/physical/power",         System state
>        "/xyz/openbmc_project/led/physical/identify",        Identify LED
>        "/xyz/openbmc_project/led/physical/heartbeat"     BMC state
>=20
>    Thanks
>    Rahul

Rahul,

We expect those to potentially be generated from board schematics and
are not intended to be used as a universal identifier for anything.  We
do have requirements on the naming of the LED groups, which is what we
intend users to interact with.  What are you trying to use the physical
LED for that you would like some kind of consistent naming and are you
sure the group would not be more appropriate for your purpose?

--=20
Patrick Williams

--GdbWtwDHkcXqP16f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkMvvEACgkQqwNHzC0A
wRkCgQ//UT5SomfSjS8Uk406BavCByAnE5NfK9NwY0/ulAUOFRloIQRYwIRu5ajT
NAIIbW7HusNAyZ8G6dOYKzyWDjXmZCNmUcSUPVFrFFyiYOWEWvMAvtr2ud6JiUER
Ch1EOSTdtp95XKXEDuNexa9+GqM2c48jk4+s8Z03uizf267LeXJWYe/j6kAGwSB+
9qFv+24iK0vB6TOuQk4AEvYJs3dopYg5f6FyXlfJPOQu8KKg1ez19djvlAjl9d4G
U6ovAtEYcLC4FNSAVgeBI6klByLKdOk+1qMi9WPn06m6Du7UuRIUff5zo+R4fY66
LSrcSFjmPSKYXRF3v6beXOux9nRz2qy3hyYzO7awUlQpLyxxnSkhQAfut9YxHXLo
y/s79+2Zo63kpybQjCCv7R0fhN5AraUhCTBlfAKUiTwBzyntiYAGZ9iC/QWQE3TM
owoZTv31Hcw/MNshhvyXITciHAQ0ma9lVHU9gMlOI2KEat7dGoH1UrZycRZqTJui
BbVvecYVanLTRyB0rtZzaIl9PRg9tcNOJdRrjnTrFzycxwYzWh+OKMhlF6abBXMB
HF57HirPOpW2wpOnzzWvJKzcX44drEOea6ZKRGfvpjbpSWKO38HNlFPA57dlrJ+C
Of3+WyAgw75ytouuHn29ZRrFlIignPjdXF+46lDJpXvu8ezYYb0=
=idHq
-----END PGP SIGNATURE-----

--GdbWtwDHkcXqP16f--
