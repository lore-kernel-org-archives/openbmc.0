Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKHXm1KYrzDqCL
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 02:34:15 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1494002047724413.1549509389955;
 Fri, 5 May 2017 09:34:07 -0700 (PDT)
Date: Fri, 5 May 2017 11:34:06 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 Nancy Yuen <yuenn@google.com>, Matthew Barth <msbarth@linux.vnet.ibm.com>
Subject: Re: phosphor-hwmon bottleneck potential
Message-ID: <20170505163406.GB25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <1493960865.3948.70.camel@fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 05 May 2017 16:34:16 -0000


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2017 at 01:07:45AM -0400, Brad Bishop wrote:
> > The solution that comes to mind would be to simply parallelize sensor
> > updates, such that phosphor-hwmon uses threads to update the sensor
>=20
> I think this is a great idea.  But I would vote for some kind of
> non-blocking or async io rather than threads.  I don't know what support
> for that sort of thing is available in the hwmon subsystem so I'm not
> sure if its even possible, but it seems worth a look anyway.

If the IO operation within the hwmon kernel driver is taking 1 second, I
don't think multi-threading does anything to improve this, except
perhaps if you have two threads: 1 for dbus and 1 for hwmon polling.
Going to N threads or N processes for the hwmon polling would not be
beneficial since there would only be single driver queueing up the N
threads anyhow.  Two threads just improves the dbus get-property
response time for returning the cached value.

Hopefully we can use sd-event with a non-blocking read on the hwmon
sysfs entry to avoid having to resort to multi-threading.

I don't know which device you are interacting with that is taking so
long or how the driver was written, but a very common optimization in
other hwmon drivers is to read all N hwmon registers from the device
when the user touches any of the N sysfs entries and then cache them for
a polling interval.  This would hopefully take your 8 seconds down to 1
second for 8 devices.  Still pretty horrible if you are having to take 1
second of kernel time for IO every <2 seconds.

--=20
Patrick Williams

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkMqXwACgkQqwNHzC0A
wRme2Q//b5XN4T0qTFadhHqOvwmj3ny/P0ActkBHBNgYHJyQ2UlGKMgWbz8kIYdC
/HYD68SOHYd7fuRkODKPeev3N5gl/5l/htgMzMdPDz7wvGK4B0duY+sfsRezYhQH
DdX55sk3nvmjgaYUiRJPeid3xLsjW0fPv0fKhYQplm9zUZ0cR1gznudvmUakiH6j
3KqEvysUoCUNRo2HP5730mohXR6PXLW1bpUPxsnIxCnUQKoZmmEKnpVdFhzexvCE
KweBsGidLuQALWNEwa10FMgRtu3ppr0Ho6qwhcfyqrubWs6ty42s8hNGIThrwqZH
hGHQaoylH4APoP3S6ceUbqqwhODJWFelH1ISaw9bpD8yI6RZsjP4UZjkGUd33dWQ
yn09V6TVDKT3q9SRfnYzgsfW0gDZXPWO0z6XtYOUkHEyo96EWqg6JKJCd2TN67gR
EYkr3eA/xKqgHmTg76WKhKZeGki4Dk3qpYMmogIbkqrJ05B7dHCEPJ+/AbGWiaF/
6p2xaTxcvljRsOl60YdJ16nev78wVlJLjj+eydiKYvPUQ5CGim1Q9OwNRydzJmrk
UplgjGguhdDii2TGdeRm5BI0jHOZUe/PrncQ//uXoKavHzjxp2QK4IQZ1xO4kzhp
CJaw39jXPfIxULH7zY/e5vSXtk/1lQsYWhK7G95jY8eKV3wXEn8=
=Irht
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
