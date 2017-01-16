Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2Q4f21vnzDqRN
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 07:36:34 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1484598986109703.7771386655876;
 Mon, 16 Jan 2017 12:36:26 -0800 (PST)
Date: Mon, 16 Jan 2017 14:36:24 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] arm: dts: aspeed: witherspoon: Add devices
Message-ID: <20170116203624.kjichnwsz5umv5w3@asimov>
References: <20170113192359.18149-1-mspinler@linux.vnet.ibm.com>
 <CACPK8XdNFcZjs7e3X4vWFzYjAyBL6KMyzJ91i=qNF43SZXEzeQ@mail.gmail.com>
 <71b0925f-8103-76ab-fe97-ecd1c30ff480@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5nasjlmgwnt56a33"
Content-Disposition: inline
In-Reply-To: <71b0925f-8103-76ab-fe97-ecd1c30ff480@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 16 Jan 2017 20:36:34 -0000


--5nasjlmgwnt56a33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2017 at 01:43:32PM -0600, Matt Spinler wrote:
> >> +
> >> +       leds {
> >> +               compatible =3D "gpio-leds";
> >> +
> >> +               rear-fault-led {
> > Follow the naming of the other machines. This should be "rear-fault".
> >
> > Are there other fault leds? If not, call it "fault".
> There's also a set of front LEDs for these functions.  They're off of a=
=20
> 9552 and just I haven't gotten to their representation yet.
> When I eventually get the autogeneration of the device tree working,=20
> these names will be whatever they show up as in the MRW.
> I will change these to 'rear-fault', etc.

Is there any concern with name collisions with removing the 'led'
portion of the name?  If, for example,  we have a button (GPIO) and LED
with the name 'power is there any problem instead of being named
'power-button' and 'power-led'?

--=20
Patrick Williams

--5nasjlmgwnt56a33
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYfS7IAAoJEKsDR8wtAMEZc9oQAJK8DXJ3JFk4c2rquLgdzo51
NlrQQvNzIUXXQNXlmE6vay+66z6aTogQ7u2s70CDfSwfd8PV0BZ+lV0N75zvLHSl
0d/LGHfPWRbiZ7+h4kFYlVo/4VLZR7Va5jWKapdMBBTj3yA0fHIcXYz5i1pgnIRD
BY+uTE+olqIYwxxn6dqa7m6XCckk7MBUoxbYBC/3XCleKg1gvmM4TdcS5JxG0jqC
ZcfqfVhV+Iv3UuFotuPV0D3a1WW+lU7hAvYq3GiF38Ey9MXf/TYVqHwfZWQrQJK1
m1MnOLLb5gBKklDSVBzMhySjZ2FBrAL9kwnXiW2QN/um8QSyCKW+dfWGhNhhK6YS
3uzWYVLi44AO1+xZ56c8jCfjQu5jx4JuMNfXy8NDY6sO7ydvMVFTqCx7faxC8Kts
iW5JZFC/LDccXENczEVu2bQCL4BfhVH0es6U8kG5qgjdX9/X0vDRfwEd/oyG1sWj
Zo7+iaKcM2w7nP1x/qsgPdho7Z+lgQrPtLHfyQEZdTualXBIiSRMSp34QeRuktoj
y6RMkrpUTJzHQ08OaNDWh+cdz8P1iJ5MTEiSqs4fYDSamorGc4cC16CmUEgHr9PU
alI/b1PERboXp44jLw7Fnp5RBoil4g4Ep7lEWV7ICH4PG8nIaAbzBPj7d4pXRny/
xNxrAmzNqPz0fY/cYWaj
=pETK
-----END PGP SIGNATURE-----

--5nasjlmgwnt56a33--
