Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3MnW6Zy1zDr3x
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 01:57:19 +1000 (AEST)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1499356632428652.1661307758535;
 Thu, 6 Jul 2017 08:57:12 -0700 (PDT)
Date: Thu, 6 Jul 2017 10:57:05 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Patrick Venture <venture@google.com>
Subject: Re: [PATCH linux dev-4.10] hwmon: (aspeed-pwm-tacho) cooling device
 support
Message-ID: <20170706155705.GA22100@asimov.austin.ibm.com>
References: <20170704135608.12334-1-c_mykolak@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <20170704135608.12334-1-c_mykolak@mellanox.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
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
X-List-Received-Date: Thu, 06 Jul 2017 15:57:20 -0000


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2017 at 04:56:08PM +0300, Mykola Kostenok wrote:
> Add support in aspeed-pwm-tacho driver for cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control. Device will appear in /sys/class/thermal
> folder as cooling_deviceX. Then it could be bound to particular
> thermal zones. Allow specification of the cooling levels
> vector - PWM duty cycle values in a range from 0 to 255
> which correspond to thermal cooling states.
>=20
> Add basic pwm-tacho-controller node to ast-g5 dtsi.
> Add basic pwm-tacho-controller node to ast-g4 dtsi.
>=20
> Change pwm-tacho in aspeed-bmc-quanta-q71l.dts according new
> pwm-tacho structure.
>=20
> Add pwm-tacho to aspeed-bmc-mellanox-msn.dts.
>=20
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts |  61 +++++++++++
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts  | 103 +++++++++----------
>  arch/arm/boot/dts/aspeed-g4.dtsi              |   9 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi              |  17 ++++
>  drivers/hwmon/aspeed-pwm-tacho.c              | 139 ++++++++++++++++++++=
+++++-

This commit is both modifying a set of device trees and adding support
to the hwmon driver.  Don't we need these as two separate commits?  The
hwmon driver changes should go upstream first to get feedback from the
hwmon subsystem owner and then we can backport them into the current
OpenBMC kernel.

https://github.com/openbmc/docs/blob/master/kernel-development.md

--=20
Patrick Williams

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlleXc8ACgkQqwNHzC0A
wRka9xAAmfHlCnUWeAgaK7CGn19AuiXMm+6v+Iln/r3OEOx3sE67+oIqKsKAX/aV
Nmisdt+xmCuxkPrj7Cskbw6yDVYV8D7VqTEz4L3B3+R7WmwyVCYr5Pd7jGD/9U3d
dvfyqBISJy/n9+AubHzwad0bq9AMl3zfl6I4O/uXz2sMmTbO/E6D69sLT9Gjcf7+
ltRmItDDERPpQEfEeU2c5sxQnhGhwvGbFfJZPn9s0dyAZoAtztpWbiwrApupT9oG
vTa7KcScCw5s7HrAfITF95eGc4IDA4u3GsZhG5Yhyeg8H9w/PiZmqZGwYTtM25qm
LCJkCEcmb6oy3ETnfP9VEAoSFBIUSwAip81JMvHbF696ta5gyoh4GGIw6DHt792F
sJdfx0UqKHpcV0p6+sBfsz3H+ioGdEIYSwLGnMA5+IiEyMyVh4NPAyGeZ33Ws6a1
X6h7bQkhWDznt66OPl1/eW4MQHQyrquy/ixxXUyzYPvepRgvuU+4KIO02xJsURJ/
97XdcS3/Mu8nLAR3GiDZlD/BwKLc+PocWWcIXt8EyezcrklJ39RWAVmTaYv1t+Ky
wFiOVMxdN5jG1Wg2K7aapkYwlw0S7Ov1X4ykFSImJGruNmw/QBQV4F/BWjdv31rw
rJly69i2c6pK4zoU6tpDvnDwj26H4799WhQ78umCoeJJ3XzZaVE=
=m5Kn
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
