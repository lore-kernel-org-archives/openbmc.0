Return-Path: <wsa@the-dreams.de>
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wvS2W2ktFzDqjL
 for <openbmc@lists.ozlabs.org>; Sat, 24 Jun 2017 04:41:07 +1000 (AEST)
Received: from localhost (p54B338B8.dip0.t-ipconnect.de [84.179.56.184])
 by pokefinder.org (Postfix) with ESMTPSA id 79CC72C0710;
 Fri, 23 Jun 2017 20:41:05 +0200 (CEST)
Date: Fri, 23 Jun 2017 20:41:05 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org, joel@jms.id.au,
 martin.petersen@oracle.com, benh@kernel.crashing.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v11 2/4] i2c: aspeed: added documentation for Aspeed I2C
 driver
Message-ID: <20170623184105.vbfvayn6puczbjeq@ninjato>
References: <20170620211516.13095-1-brendanhiggins@google.com>
 <20170620211516.13095-3-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mk4lswix4km7ihfv"
Content-Disposition: inline
In-Reply-To: <20170620211516.13095-3-brendanhiggins@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
X-List-Received-Date: Fri, 23 Jun 2017 18:41:08 -0000


--mk4lswix4km7ihfv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2017 at 02:15:14PM -0700, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C busses.
>=20
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--mk4lswix4km7ihfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllNYMAACgkQFA3kzBSg
KbZwHQ//ZmopCbw9Q+9k1RhtAlofs1645GLJZ6M4FPs/8YB6L/cobUB/91BhTPAY
j7HsnZQWFZc3iBBqpf+zftGuMaYBbYmv5kxX28p6OL2peG4fSet+ez90+eEVhA8W
BsTM/f3fB/KE0tOWBICgvBFmJGd4gJY9GMRLdrV/zeg+m6maim+YcIRsSCLDzGdQ
gWvZ83qgaB/2rJeeMqeJMz1X5g35KlA2od/mKQ583YMuFXRYc01kjvHBlM/YVN0W
y7sbm+4whSJfCsJHGSNqNA5mgCPUPqgjbtk4jK6WscvV721rJUNNIyUdkuQ1ib79
rPJknw0ZUcd6H5Afyr/+Td29NfyKkRX5PiXmvsKdlEOZL5Is4eqRGKeTdTYPMCeX
oKE0/EHdcUEhTp4tgx+ZLrB9ikwANk0nnZVbdJ9+maU94SUoMejP5GyTfq75M7+o
yKrhCTfhzzwE+9IZZh7vP+JEUXizPSHS+MPE5KG4f7xHE/mKfLWK+NQeEQ7Cs2KT
4QBrRYX+sK5G+PKu8evl5Z2JivUKGIvB7kz8nHqK63vjQHYgCp2iaAyZe4FxVOXq
TI11DY0UZ7otzYjatr6IL7cj75XDowPKp3ggQk/D2oxyr66iO74VF8fTTDjjnGQ2
eJ82zVw2zRJq3ha1l/LI4ADeOAgfpLOcfDNEtxKnaLxzDV5W+Nc=
=LMl/
-----END PGP SIGNATURE-----

--mk4lswix4km7ihfv--
