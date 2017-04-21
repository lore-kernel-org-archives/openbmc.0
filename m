Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8p1t3w1jzDq99
 for <openbmc@lists.ozlabs.org>; Sat, 22 Apr 2017 06:56:33 +1000 (AEST)
Received: from localhost (32.97.110.57 [32.97.110.57]) by mx.zohomail.com
 with SMTPS id 1492808129672999.1525820776726;
 Fri, 21 Apr 2017 13:55:29 -0700 (PDT)
Date: Fri, 21 Apr 2017 15:55:23 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] hwmon (pmbus): Add client driver for IR35221
Message-ID: <20170421205523.5jqqroooeqmfzl36@asimov>
References: <20170421042505.20403-1-sam@mendozajonas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qhd4y2fkxct54o2c"
Content-Disposition: inline
In-Reply-To: <20170421042505.20403-1-sam@mendozajonas.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Fri, 21 Apr 2017 20:56:35 -0000


--qhd4y2fkxct54o2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Sam,

On Fri, Apr 21, 2017 at 02:25:05PM +1000, Samuel Mendoza-Jonas wrote:
> IR35221 is a Digital DC-DC Multiphase Converter
>=20
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
> - Tested on a ppc64 system which includes several of these devices.
> - This patch re-implements the linear reg2data/data2reg functions from
>   pmbus-core like some other drivers in order to scale some results. Is
>   this something that would be better off being made generic for pmbus
>   drivers to call?
> - The resolution of iout0 is apparently configurable between two values,
>   however the documentation I have access to does not specify how this is
>   actually configured - currently it is left at the default resolution in
>   the driver.
>=20
>  Documentation/hwmon/ir35221   |  87 ++++++++++++
>  drivers/hwmon/pmbus/Kconfig   |  11 ++
>  drivers/hwmon/pmbus/Makefile  |   1 +
>  drivers/hwmon/pmbus/ir35221.c | 322 ++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 421 insertions(+)
>  create mode 100644 Documentation/hwmon/ir35221
>  create mode 100644 drivers/hwmon/pmbus/ir35221.c

Thanks for working on this.

Would it be possible to enhance it in a follow up to support an
'inN_target' also?  I see this is not documented by the sysfs-interface
for hwmon but we likely need support for this.  There are voltage
slewing operations we do in system manufacturing.  Without an hwmon
interface for programming the target voltage we're going to have to
unbind the device and manually do the i2c operations.


Guenter,

I mention 'inN_target' to match 'fanN_target'.  Do you have
any opposition to either formally adding that as an option for voltage
readings or adding it to this specific driver?

--=20
Patrick Williams

--qhd4y2fkxct54o2c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY+nG7AAoJEKsDR8wtAMEZcw4QAJTboDsdxtRFNzyq9E7IEXA2
qMQ0fbKv4sjHmXujT1uTwzQzBTAusw1HmrxKK/JvbL1/eUcKjOwLAdaHUVULmdBc
f+foNtK0EkNMTd2loayrF7zX/ZhuijDMAxnHX5KxJ+miztbQJEGBKXSWpPyJpj4C
TDPMeXWhAdc1WBZAUbxZN7K/Bvnswv9Eu70jEAvLx5UdcS37wlcsNr1tZlr9tJ8v
fwInF963liYQ0UrCj6XU7aLAdw4LclhuKCGMNHqUEQpaBYYQkiA96PY4RntW6tjA
py+MzMduAEmT5OW/CCbDfHRV+4rNlvm4C+NVH4lQl68wv333jwuic9uocZyP3HAr
rUrJSCgvOQB3sFtZnTkO+7babPaf0VbsCTQ+rC7q0bSpB0SP5Tdc+QDVO/1ysL6O
4xcUlBHqHc9+cVvolEw/NOuh8TXwENIRL7RAYKK9Pk2NduaCrV65MSs9zC+XlWx8
N9BIalnCqZF37L6hyUVErgyG2ytDTH730I1Mk6fJJvIco9Kjx99oHdkJ89KxF6BW
BRzUOwYwdrz9Z83NFGsNMf2h8JlsxEpft1cKpNutw4esKBxgRLA4RnQ2/4RFAD+0
oExGqsxD4NHKVCMCRO4pFMJrJCBg/u6a9uxBPP1GVJk6KJSZT0uQ88XcA4D4CxuC
Uwx0wntoQE3/0UaRoUA7
=1UQn
-----END PGP SIGNATURE-----

--qhd4y2fkxct54o2c--
