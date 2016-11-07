Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBz8b12f7zDvNT
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 14:54:22 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1478490854538535.1732693254572;
 Sun, 6 Nov 2016 19:54:14 -0800 (PST)
Date: Sun, 6 Nov 2016 21:54:12 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Comments on Sensor design.
Message-ID: <20161107035412.GC15757@heinlein.lan>
References: <20161031210739.k2x67uz6m55j3n2u@asimov>
 <CAPLgG==F66J2S4Ex+tF1dAQY7RxiDD=rOcmZ8Y50jTcMLDWjrw@mail.gmail.com>
 <53C4D16D-D216-4C12-B760-5328AF3B8685@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline
In-Reply-To: <53C4D16D-D216-4C12-B760-5328AF3B8685@fuzziesquirrel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Mon, 07 Nov 2016 03:54:23 -0000


--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2016 at 10:12:47AM -0400, Brad Bishop wrote:
>=20
> > On Nov 2, 2016, at 12:58 AM, Rick Altherr <raltherr@google.com> wrote:
> The difference really is just with signal match rules and I don=E2=80=99t=
 really see that one approach over the other
> provides any more or less flexibility.  If you want signals for an entire=
 class of sensors, you just use
> the pathnamespace match rule.

As long as you feel we have this covered with a mapper call or a signal
filter I am fine.  I was concerned with, especially, the number of calls
the REST server would need to do in order to subscribe to all the
sensors.

> > In both cases the dbus path could contain the 'type':
> >     /xyz/openbmc_project/sensors/temperature/ambient
> >     /xyz/openbmc_project/sensors/fan_tach/fan0
> >=20
> > The question is essentially should the "Unit" property be used to
> > resolve the 'type' or should we have distinct interfaces for each
> > 'type=E2=80=99?
>=20
> Patrick - after reading this again I don=E2=80=99t understand.  Why would=
 you not just use
> the path namespace to resolve the type?

I think this was making leap that we would require / document paths as
well.  Maybe that is the right thing to do but we don't have a currently
defined mechanism for it.  I'm especially not happy with 'fan_tach' as a
path match string.

--=20
Patrick Williams

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYH/rkAAoJEKsDR8wtAMEZmiAP/3UuVzwH1h9snoJWqxZibE84
lGMk+JhEDJXhPsj+xt3I/TFlanunsVqgf85dJY/h0IDhaK2K9prO9VmxN/slovV7
sax7d4T31Px4qfH4kK5VmbrXDHyQraaAAGVv83qABdICC1hfm06t9ZeqqTEET2tJ
/9RCYq4jMew7qqs2ikveznbCKryzm/RsqQLEy9OKOltj4nZzXkTGexuoGOt6cq2N
01fc/X2+yN+LwxeGQ++cDm3fJZS4QYUH1DfNe3BGsoUUa2qUOQAsyuwoyY9oYm2V
inQpDJLtTZadKlSdkv46K7dZlhvbWJiIf36LwWnNxW4LQMnZ4AqTTiYz1bbRStN9
sWrmDqjtczbxXJjZ2ih2bcWEVW41Lugr1rwVzCVIGdrgJpzuhxBMlrNhwm9MEOz4
Ra6pHA3/uOiAUBCGPzswap+ikFD+9k4qE3V4DEQu8XIIWaZ5AOw5dxQKdobfAKYN
JnrIZCJZi1muTYiDOywmc76WsoJPIIb5S8N8wLoaa3M10leZxPCey/+9CIwqnd/c
OuVLm9qE7qnLMhAfPEXLFn6oroYz5ByQrh7DN6M9eU2kEG7Ll2Z8Qo7Y2NgyRHUw
Y/RpM8h61OCrQSN8h057td309p5GmAQWEiYAtrMfWRYtGADvdtd6byE073kFW7Tu
iqs2K1qsXlxK1h9Co95/
=gTG+
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
