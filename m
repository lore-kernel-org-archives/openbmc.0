Return-Path: <wsa@the-dreams.de>
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wvS2b5rjHzDqlB
 for <openbmc@lists.ozlabs.org>; Sat, 24 Jun 2017 04:41:11 +1000 (AEST)
Received: from localhost (p54B338B8.dip0.t-ipconnect.de [84.179.56.184])
 by pokefinder.org (Postfix) with ESMTPSA id E465D2C073A;
 Fri, 23 Jun 2017 20:41:09 +0200 (CEST)
Date: Fri, 23 Jun 2017 20:41:09 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org, joel@jms.id.au,
 martin.petersen@oracle.com, benh@kernel.crashing.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v11 4/4] i2c: aspeed: added slave support for Aspeed I2C
 driver
Message-ID: <20170623184109.7boedcpkabakqsyy@ninjato>
References: <20170620211516.13095-1-brendanhiggins@google.com>
 <20170620211516.13095-5-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="owiosvqpeefixxhx"
Content-Disposition: inline
In-Reply-To: <20170620211516.13095-5-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 23 Jun 2017 18:41:12 -0000


--owiosvqpeefixxhx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2017 at 02:15:16PM -0700, Brendan Higgins wrote:
> Added slave support for Aspeed I2C controller. Supports fourteen busses
> present in AST24XX and AST25XX BMC SoCs by Aspeed.
>=20
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

Applied to for-next, thanks!


--owiosvqpeefixxhx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllNYMUACgkQFA3kzBSg
KbaosRAAroS1hFFADwLKeneaq+Ig08XhzU/AXlHoCorEzdnyVf/83UjN7cp4e48d
rYJUNIP4N4FT20M+HLzvdZY8c5+84vyT1vLCD6PwKTACsZ3+L4blaONsfGVbY8y0
L2zCGBq+viwSqpr3QQaun5B4NEXfk5M0sQKJER7ZwLErzZ3zhZCplEUNX5QiHZAY
YluQdrEOjStYnjV5wUsdoAGmcU8UaFYtHJzxouZZQVe9JBXTJta1I6R5HczoKBMg
B3ZAu3Vy0IbvX2c38uF/EPKo69Kj3IVx6jZb90qM/VsrlNk5LVu2DN9LEIdjG9M9
g2jMqRB9MZvpcpaIADlF6SrtY8l/gL0+5XLk5X9JwgzQbv44475USrWg43irDx6n
VhRtTtOAi4ZVECndyhV7TS7Ij9FJ8hvBAkDGa4g175j22mppZCXqpeL0F7nTDljB
Ls0UcLo0i6VavVQqLL4a4S6Y25EJGhwwBMycxsg0SizAjufC2QTWQpiisGaccxkl
Ksp4z/R0wk8v/7NQgz35knI3gGGUP1caZJ7c94TuBypMD6shgsAm38KtR4VMDTq3
DnaYT/Rr1CsDIb1vIhy9OrrV0/d/caBFexeD5S66NTSeEDVLHMmQSPFBxso3ChoZ
ELYYowKFfBpJEfOcE3vUm6Zkfrb80bKb+ZaStCDkB490en31Yo8=
=sDba
-----END PGP SIGNATURE-----

--owiosvqpeefixxhx--
