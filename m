Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vCZz01pj1zDq9K
 for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2017 05:48:27 +1100 (AEDT)
Received: from localhost (32.97.110.57 [32.97.110.57]) by mx.zohomail.com
 with SMTPS id 148588849532819.543659860875096;
 Tue, 31 Jan 2017 10:48:15 -0800 (PST)
Date: Tue, 31 Jan 2017 12:48:08 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Matt Barth <msbarth@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com
Subject: Re: GPIO expander user space access(ie. pca9552)
Message-ID: <20170131184808.absjhzv6bg2r2a3e@asimov>
References: <6af19fb7-e5aa-bcb5-8027-9cf609e30eda@linux.vnet.ibm.com>
 <1485216565.4137.9.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="com2dje63t767svm"
Content-Disposition: inline
In-Reply-To: <1485216565.4137.9.camel@aj.id.au>
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
X-List-Received-Date: Tue, 31 Jan 2017 18:48:28 -0000


--com2dje63t767svm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2017 at 10:39:25AM +1030, Andrew Jeffery wrote:
> On Mon, 2017-01-23 at 09:58 -0600, Matt Barth wrote:
> > Is there a defined process/interface to access GPIO expanders from user=
=A0
> > space to be able to determine when the state changes? Possibly polling =
a=A0
> > fd or getting notified on the state change?
> >=20
> > Previously this was an i2c device that was accessed over i2c and the se=
t=A0
> > of interested bits were simply read into the application. An example is=
=A0
> > the use of a pca9552 for presence detection on chassis fans.
>=20
> I expect it should be implemented as a gpiochip driver in the kernel
> and exposed via the usual methods to userspace (GPIO chardev and sysfs,
> though sysfs is considered deprecated).
>=20
> Andrew

There is already leds-pca955x for manipulating a 9552 as an LED
controller.  That chip can also be used as a GPIO expander (moreover,=20
individual bits can be configured as a GPIO).  I don't see anything
obvious in the leds-pca955x that allows manipulating the GPIO aspects.

The leds-pca955x also supports 9553 and 9554.  There is also a gpio-pca953x,
which supports the 9554, 9555, and 9556.  There does not currently
appear to be any mechanism, either using leds-... or gpio-... to
manipulate the GPIO settings of a 9552.

The 955[456] chips have an interrupt line that would typically be wired
back to the BMC.  This allow the normal GPIO interrupt to be waited on
(per Joel's email in this stream).  For chips that do not have the
interrupt line, the gpio-pca953x driver gives a 'dev_warn' if you
attempt to register an interrupt.

It isn't typical to have the same i2c chip registered in two subsystems
(leds and gpio) at the same time, is it?  So we would need to get the leds
driver enhanced to also support gpio manipulation?  Since the chip
doesn't support an interrupt line we are also stuck with polling,
correct?

--=20
Patrick Williams

--com2dje63t767svm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYkNvoAAoJEKsDR8wtAMEZlncQAIZG1mtKHBUkn5Ft0Gxs7K+t
bK3TTo4tAU3QbcuYG9BlOJtkcVznGSfNqsWpEtcmKcPsk6f5cXcqGR49eC7G2kmU
BvgcjRXZWA7f8aLYBfbTH4DqQZZaAQNh63Ys3yxbpT7Nm9kBlU8hrEzb72PsVvIJ
gSsYRLOQrYQmVDpej4+BAJs7Rpu/ta/L5EJ9r06vR7UhF9qyILSUSgNw8H50dnIb
s4Y5xyh+F11Wm9qVoNy3rd6sRqD41PoGhqdf9DeEG9xqPN/kQkTiaySoiM61Kuj1
g4SPVvUlfXUdHd7tMx1TVQ6zj3E3U/2Si93lQE/7DBX1lwRgU4AQKh0qH1P0v0vQ
TEiPsE7bjARLztwJjF5gBLirZqTThSJecLRctgaILeaRIBRpv4oTfEhR5SktgXxj
V14qPoYz32QkN0QIN0rWLp37GIueVXaTrRYnkIiO9li8oBNM7Gfo7DKuOCyFdcZ+
PHBr82HCWIisonfFPDHrPTWcD7oQu//wjexZCFJnL74SZ6UDdJIb3WCQXLu2ngiB
AEEx3ajD7srhOJkqas7NSE3bKY3/UfQYx1lCoewg56UoSf/UmZSxp5PrdpB7sX/0
vyu4Tz4dK+HogyExfk74pQuaVtk75AhJ0nijvxGvzuhhfg6CbaGgI5ZQIY//kPQH
cM97vTERJOhIIXc7A47j
=sEW6
-----END PGP SIGNATURE-----

--com2dje63t767svm--
