Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ6ln6qgHzDqFJ
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 11:14:29 +1000 (AEST)
Received: from localhost (156.39.10.45 [156.39.10.45]) by mx.zohomail.com
 with SMTPS id 1465434846621260.52529540376975;
 Wed, 8 Jun 2016 18:14:06 -0700 (PDT)
Date: Wed, 8 Jun 2016 20:14:06 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: ratagupt <ratagupt@in.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Implement Network Override
Message-ID: <20160609011406.GU19968@asimov.austin.ibm.com>
References: <20160606180044.15374-1-openbmc-patches@stwcx.xyz>
 <20160606180044.15374-2-openbmc-patches@stwcx.xyz>
 <20160607112957.7fc13fe0@camb691>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m1rwLFmcefDs/2Y3"
Content-Disposition: inline
In-Reply-To: <20160607112957.7fc13fe0@camb691>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jun 2016 01:14:31 -0000


--m1rwLFmcefDs/2Y3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2016 at 11:29:57AM +1000, Cyril Bur wrote:
> > +struct host_network_config_t {
> > +     string ipaddress;
> > +     string prefix;
> > +     string gateway;
> > +     string macaddress;
> > +     string isDHCP;
> > +
> > +     host_network_config_t()
> > +     {
> > +         ipaddress =3D "";
> > +         prefix =3D "";
> > +         gateway =3D "";
> > +         macaddress =3D "";
> > +         isDHCP =3D "";
> > +     }
>=20
> Admittedly I don't do c++, is this c++? Do c++ programmers recommend this?
>=20

No, they don't.

In modern C++, this would have accomplished the same thing more
efficiently:

    host_network_config_t() =3D default;

If you want to be explicit about initializing the strings to empty, this
is preferred:

    host_network_config_t() : ipaddress(""), prefix("") ... {}
or better yet...
    host_network_config_t() : ipaddress(""s), prefix(""s) ... {}

Both of these are better than assign-to-empty because it avoids a
copy-constructor (C++04) or move-constructor (C++11) from the temporary.

Neither of these two options are actually preferred though.  Since,
'string() =3D=3D ""', there really is no reason to do any explicit
construction.  Internally 'string()' likely results in "string->data"
being NULL while 'string("")' likely results in the data pointer being a
zero-sized malloc.  Again, if you prefer to be explicit, this does the
same job:

    host_network_config_t() : ipaddress(), prefix() ... {}

> > +
> > +    uint8_t data[SIZE_BOOT_OPTION]=3D{0x80,0x21, 0x70 ,0x62 ,0x21,0x00=
 ,0x01 ,0x06 ,0x04};
>=20
> uint8_t data[SIZE_BOOT_OPTION] =3D {0x80, 0x21, 0x70, 0x62, 0x21, 0x00, 0=
x01,
> 0x06, 0x04};
>=20

If we're going to use C++, preferred way is:

    std::array<uint8_t, SIZE_BOOT_OPTION> data {0x80, 0x21, ...};

This will do an in-place initialization of a type-safe and
bounds-checked array.

--=20
Patrick Williams

--m1rwLFmcefDs/2Y3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXWMLeAAoJEKsDR8wtAMEZkMYQAI3A2ZX72QHM0O1/0T5q2aWM
YNuZeptrtURRWzxVZ9wI4RkeCpdLhpdxN+UyZE5irV6vSn54OJHtWdoUTbI8YcSu
QvAe6pJ/Ui4qFJ1RA3XgC9++H/qrZfKKMQi9/PJI2weXb98Gg+Hl6+LXWtl72SLN
qmaHRZCSFBkpdoFWkDOOouETY60bbpfHtG8FYeRJ5NKf/bt7LKdYXvYUN8jdQb/1
GIfrCeWwsg3WxV4Fx2QVdTBdudFO8gPFs+wcZCtci8xDPEYgmvGNHm6WAHcKi5tg
Lz/N4R0cPYTbztnD+2HF4jbvp994pMW0F/ATwj+DyWVPinPg31P6i8ZeN6D4UCdk
4vJfxR2aJnLNaRsR8ajLq2I9PkJuLij5lJeq55v76S9AhMevFtgKKN2K0526h3jY
7DMerRK/CBLg/ish8GsqP0aLGmVv3HP7ZUuU/dJBX5VtbeRg7tbb7kBhdYRM5R97
aKuDMGQe8FP2zw5oBcWVI0f8NSjZv0na0SZ0v0IKCoDMhcoR72xTwzFIeJ1KUigu
W9pcMJCoaMjeybwgLfmHK/rl0tY/Vex+wOI9oTx2jUSDaRCMNWB2DdKH2lqIQ9uC
VtNkKbwdKLHRICPwdeK+kdUIqa9OzjPm+KKhF5Ecd4ACej5CV7dIJ/y04Gwi0pTS
guYmaoHLHrQIgb/iXigu
=i77f
-----END PGP SIGNATURE-----

--m1rwLFmcefDs/2Y3--
