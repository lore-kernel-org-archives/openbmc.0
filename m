Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYthL3WbfzDvj3
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 09:38:58 +1100 (AEDT)
Received: from localhost (170.225.9.145 [170.225.9.145]) by mx.zohomail.com
 with SMTPS id 1481150330762663.9950744042782;
 Wed, 7 Dec 2016 14:38:50 -0800 (PST)
Date: Wed, 7 Dec 2016 16:38:48 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Starting the phosphor-hwmon service from udev rules
Message-ID: <20161207223848.lciwemew7hhhfngb@asimov>
References: <32e4f53c-5bab-55ba-50f2-25ba891d4127@linux.vnet.ibm.com>
 <20161129024216.GS15757@heinlein.lan>
 <accb6902-8485-6f7f-c981-4930bb911b08@linux.vnet.ibm.com>
 <20161130021902.GT15757@heinlein.lan>
 <bfe482f8-3731-53f2-b73d-e99331fbac39@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uqysnbz22m5dh3le"
Content-Disposition: inline
In-Reply-To: <bfe482f8-3731-53f2-b73d-e99331fbac39@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 07 Dec 2016 22:38:59 -0000


--uqysnbz22m5dh3le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2016 at 01:44:52PM -0600, Matt Spinler wrote:
> The issue with this is the %i is the device path of the hwmon driver,=20
> which looks like
> /devices/platform/ahb/ahb:apb/1e78a000.i2c/i2c-0/i2c-0/0-0068/hwmon/hwmon=
0,
> and the hwmon<num> can't be known ahead of time by the MRW so it can't ma=
ke
> conf files named that way.

Isn't this %i vs %I?  %I would be the unescaped path.  %i would be
escaped, so it would be devices-platform-ahb-ahb:apb-  (slash changed to
dash in general)

--=20
Patrick Williams

--uqysnbz22m5dh3le
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYSI94AAoJEKsDR8wtAMEZP74QAJtbPjjYIbpSR6rIRUPsBjwb
fV5bJ0fW8r88QdarkuLCFuvvIEYarapS4SM0MJTQmdx06DXMadIz+SIxL03yitwN
s6FnIa3v0bZadqelK/LFieDaxNFHI1x5+aE48NUTl6uI4QoJsGO5BdI/xhY80ieZ
ymMVIZ2NgzRObSBu2JtqFLZ/iF0jZHvhfrMLjQsHuJvwnmm+fPJKQEkaOy8mp7Db
GY2uicDeOL88ZsbqY9I6MmclMwjWgNYspK0l91TaE2ze8b7mm6FS7l58dbjZ3BJ9
LzrZJRE9psyDa8aVelEBdBVzJTxyyZ+e9HzhxMCn9dsU9CfGfZoGlrqNax3M5YaQ
gksLo/o8o+70fbVRu42KQG3p/HHpCeI7Yn+d7PehMRXd73KRXghC6lXcr8Mz2oDW
MUAkqskCaZyolwDVFMiQmGsjZVqGjx+ZFEVXmJVNybMrRiXDWdnfT35o9SgAO1yE
WBvbbBgdR6Dh5mHm89PQKsBAOaHsTO4912vwZv3ksE+Ghw5KJI1Itxf/Bl4/N1/I
zXV4DIMUslRVh6WDf6B57UoLp/a59CEgvamzRQoAFqWIE+pebVCKv/y5XQcZrj9j
j7b6z7p4hUB14QpxNxQBrz8VCtH4DMLIlECRZJVh91/PRwtF/6S3VoNgnwkJRDwl
Hj4wCiWo5JfTU3M3OYM1
=/TSx
-----END PGP SIGNATURE-----

--uqysnbz22m5dh3le--
