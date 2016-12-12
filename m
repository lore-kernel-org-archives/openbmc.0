Return-Path: <wsa-dev@sang-engineering.com>
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tcg9L07XFzDvk9
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 22:10:12 +1100 (AEDT)
Received: (qmail 28347 invoked from network); 12 Dec 2016 12:10:06 +0100
Received: from p54b3376b.dip0.t-ipconnect.de (HELO localhost)
 (l3s3148p1@84.179.55.107)
 by mail.zeus03.de with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted,
 authenticated); 12 Dec 2016 12:10:06 +0100
Date: Mon, 12 Dec 2016 12:10:05 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Kachalov Anton <mouse@mayc.ru>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 "vz@mleia.com" <vz@mleia.com>, "clg@kaod.org" <clg@kaod.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v5 1/2] i2c: aspeed: added driver for Aspeed I2C
Message-ID: <20161212111005.GA1450@katana>
References: <1480467618-7497-1-git-send-email-brendanhiggins@google.com>
 <1480467618-7497-2-git-send-email-brendanhiggins@google.com>
 <20161211222622.GK2552@katana> <825541481540788@web11j.yandex.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <825541481540788@web11j.yandex.ru>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Mon, 12 Dec 2016 11:10:15 -0000


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> =C2=A0+ /* Switch from master mode to slave mode. */
> >> =C2=A0+ func_ctrl_reg_val =3D aspeed_i2c_read(bus, ASPEED_I2C_FUN_CTRL=
_REG);
> >> =C2=A0+ func_ctrl_reg_val &=3D ~ASPEED_I2CD_MASTER_EN;
> >> =C2=A0+ func_ctrl_reg_val |=3D ASPEED_I2CD_SLAVE_EN;
> >> =C2=A0+ aspeed_i2c_write(bus, func_ctrl_reg_val, ASPEED_I2C_FUN_CTRL_R=
EG);
> >
> > Can't the hardware work both as master and slave on the same bus?
>=20
> The hardware can work as master and slave on the same bus. This is how IP=
MB over i2c works on Aspeed.

Thanks! Then the driver should support this. Maybe it is an idea to
first upstream the master support and add the slave support
incrementally?

Regards,

   Wolfram


--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYToWNAAoJEBQN5MwUoCm2hFAP/22BMbapwx6CqPolipaU+8Bz
BC1Onxd5oWZ9odKoDRkgpg1GUdIOK6o/12s4HMG2XDweuqLysW3ZaCzKTGL1jsqI
b1I32go7nSAmMLMtlP3QW+R4YSXymVSjRYWj5nfTp0ovdPeh5bTbv4zUk25dhTuy
e/ULjgMeLXaIB6Ujopcrs3+6OuuwuIKM/23v23d+wePoPa2cmSPIzNKi5URjmle+
VcTjEkPIF8aLpJhwYdZvG5QAUCB5dSWpKrAUo/oY0/g6HbABDkBWbMZXTCwl7rmP
b1G1J9ebjffFTmbdxm4w6rWyt0J1X3WwyNXB3mpNYPBYiQgrdITi4el4XITRXPsJ
+lsfhslHpWqswHWYDeUo9M3HzuH9DmhDj9QeR/C5qXueX0sBPAhVmfb8tbbXe5wR
lBmMT6ONT1UaQnGYNoN3eMF+Viz88lH41dDoJT1X0/23m9xSB0AwcSBKbqoo8RsA
NXm1Y8UMAO7dUcbqvhDCXwK5lmdmUv4N4pKohXByiJHfogfeTMHczeYnVL+2doTO
Sm+7/JqbVCOCO1iNxwQdJFjCIw/HBi9YyFP5opujWWJan8+UqSTvlTNw/YfsxkDB
yWaFeewk1czTUt30tzMXCZ+XhffIvOQayZCOfvmN/4smWHIzL9dNoRSWAVx64/IE
eLDrHM7Yy44gtva5BUk9
=A4Ap
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
