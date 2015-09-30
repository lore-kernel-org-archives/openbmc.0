Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0F0A41A061E
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2015 05:14:01 +1000 (AEST)
Received: from localhost (32.97.110.53 [32.97.110.53]) by mx.zohomail.com
 with SMTPS id 1443640434338792.0349061335978;
 Wed, 30 Sep 2015 12:13:54 -0700 (PDT)
Date: Wed, 30 Sep 2015 14:13:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: EEPROM driver
Message-ID: <20150930191352.GC20477@asimov.ibm.com>
References: <20150929143413.GE14293@asimov.ibm.com>
 <CACPK8XeHTP4gUa=P3hdeo-uCU6_O+3SJg8qnwadfn=+GH3h5WA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline
In-Reply-To: <CACPK8XeHTP4gUa=P3hdeo-uCU6_O+3SJg8qnwadfn=+GH3h5WA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Sep 2015 19:14:02 -0000


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 10:17:59AM +0930, Joel Stanley wrote:
> > If we have enabled this driver correctly and probe the i2c bus then
> > there will be an entry in /sys/bus/i2c/devices/ with a file containing
> > the EEPROM data.  This file can then be passed to our IPMI FRU parser
> > and then updated in the appropriate fru-manager DBus object.
>=20
> IIRC it lives on i2c1 - the second bus. We should be able to add it to
> the device tree and have the kernel load the driver at boot; this is
> working for the rtc device that sits on i2c0.
>=20

Joel,

There is a slight philosophical question embedded in your response:

Do we want devices to generally be required to be added to the device tree=
=20
or do we want to have a userspace app that probes the i2c bus for devices b=
ased on hotplug events?

Other questions that come to mind:

For device tree entries are you just suggesting that the i2c master
would be in the device tree or all the end devices?

Is there an easy way for us to pre-populate a device tree at build time
for elements we know about a particular BMC / machine combination?  We
may need to incorporate elements from both the bmc-bsp layer and the
machine-bsp layer.

--=20
Patrick Williams

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWDDRwAAoJEKsDR8wtAMEZTBwP/3Rz68q4inenP7HVNRRL+3kU
cEYVTIYqwSQdDL8z0gOxO1tGg0T03L0Mwc4Ey9Vy2Vthv6nVn+9S2mSoWjDh1CDR
JAfWa1jiX1cyfopuF8x83F/InoNWCZRpZuV2GTHZPJHqk3hpXQQDgrlgYjVkgOOj
v38uHZsEb5s2vjN6PYuMWqnvgx5wAcg7JZ9SAHhX9z1hUF7bW1XqdYVSCgnwHTbg
8X6ku8KFDnpgNqbozkmn3CiI6Gemo1Mhou3gvQjDBUA4JGwgd8DmWnBv6e+z+Z3j
3z9bVcY4LmP5yx86UgtuwPdz4G81xTFBmDskzLD8j4hbmojCs5yyWxP6N2smiBYl
aDcvMbuyMipnHW7knyLnYJBk3LNVeZ603FgkYKy8yopchOlsqerPpt8tOQ0Jdomp
wvA80XPySAtf9ZH1ZGQ4otqJBTEvvLiqNS+IxYUm3WcVePVTYBQAAKsKZRcHugyX
vY1IIrQCj9hUKb3ZkmZQDCoHgX+R+BQWYRrYqo5A43gBnsRg3byEdEwHIW1fJmoY
gLG59TCJmn07bwPcgcEnOmQRWvz2uaioKMmn0BrCOue/pPLulJiptlYpodan18YV
0BvjbUtI0RNeLQAU5ozL5De0LsIyC3nIWlvhPD/GMftPJMbK5pbHQLzPb1KU5s0V
D57ntf9x0/xENh0J9v4i
=ODdo
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
