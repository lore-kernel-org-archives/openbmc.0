Return-Path: <wsa-dev@sang-engineering.com>
X-Greylist: delayed 315 seconds by postgrey-1.36 at bilbo;
 Tue, 20 Jun 2017 17:55:06 AEST
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsKrV0vlhzDqhk
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 17:55:05 +1000 (AEST)
Received: (qmail 16987 invoked from network); 20 Jun 2017 09:49:40 +0200
Received: from p200300cf5bc57b00021de0fffea0c865.dip0.t-ipconnect.de (HELO
 localhost) (l3s3148p1@2003:cf:5bc5:7b00:21d:e0ff:fea0:c865)
 by mail.zeus03.de with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted,
 authenticated); 20 Jun 2017 09:49:40 +0200
Date: Tue, 20 Jun 2017 09:49:40 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>, Joel Stanley <joel@jms.id.au>,
 Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v10 4/5] i2c: aspeed: added driver for Aspeed I2C
Message-ID: <20170620074940.GB1541@katana>
References: <20170603012952.2192-1-brendanhiggins@google.com>
 <20170603012952.2192-5-brendanhiggins@google.com>
 <20170619141322.devvmcbjaeq4jnv5@ninjato>
 <20170619142105.kynebk74y7nbvmfx@ninjato>
 <CAFd5g47D0zJax1X8MeV_OwMJvzd2Ba-hZc+8_X_Ks1ibH8ipeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline
In-Reply-To: <CAFd5g47D0zJax1X8MeV_OwMJvzd2Ba-hZc+8_X_Ks1ibH8ipeg@mail.gmail.com>
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
X-List-Received-Date: Tue, 20 Jun 2017 07:55:07 -0000


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2017 at 05:58:19PM -0700, Brendan Higgins wrote:
> On Mon, Jun 19, 2017 at 7:21 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> >
> > And any chance for a MAINTAINERS entry?
> >
>=20
> We already have one:
> http://elixir.free-electrons.com/linux/v4.11.5/source/MAINTAINERS#L1090
>=20
> However, if you would like me to own this driver, I could add an entry
> for myself.

As far as get_maintainers.pl prints out someone responsibe, I am very
happy. The above line won't work for I2C (and maybe some other
subsystems), though,  because we are one directory level deeper
(drivers/i2c/busses/*aspeed*). That might want fixing.


--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllI05QACgkQFA3kzBSg
KbbNMBAAn/W1J+PtOGC7KB2IylKR79ve8dDiQcJUlqByR8CZ42UoyStLtXtyP+ew
oSg8q8eiQjpLxrL1zB0MZecKOvMH+JhdLsmXt0q7S7nT8Z1KvqyHgMTZxSYLgINL
PX43QGCBXdI502w4nPZH2Il1W4+CnYSV6Q46hmF8ZEytqoyIiAbfkrIipBPhIZXl
/hIqX2QoTLVZsLrz0eAID6GzN6YxVDaKdi4bVIkUHAvqyOrBJ+zO12/G/yygiic+
NrZmoylPPfJWJ2HMojOWud92e+zDnrnpQDlqwtTFdej1f9RjsJ6gFTPT2aLQt3p4
1uRtTSd5kBWnBYUPP2UnQW/i9/M/G95BnHcjl4/jJe1Ff4hUqfaR0ndYuAa7eEQy
ghYEhDB/63O9CH4E4cCbLbChp+8xqYLjqKz+XzP1Ep+xxUhddnXOC+BUb6XMgV9R
nYwzbDVsr0lmhX8CyBhDkRnlx+KtbDlPHviSaRTeZH6MiCPWmj9DXxUqxqPHaBai
DJKyduB8fhIEe7xclwwFqHrayXfQV7q4JD8Wx6QTnzEK49ss98fsK5ENvF2pCjBf
Cuk/zaHKljolHQF+Q+oM0prrRFgheHoHV8au8UCeOZwC355RpL/O0fZ6PWszzge+
3jGvwi4t5MVD+aeX32+ZmYi4szFM1TIMCj4PVLzhbvgEg5md12M=
=wg8i
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
