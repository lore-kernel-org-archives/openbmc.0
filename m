Return-Path: <wsa@the-dreams.de>
X-Greylist: delayed 620 seconds by postgrey-1.36 at bilbo;
 Tue, 09 May 2017 12:31:25 AEST
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 3wMNfP6pnszDqJL
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 12:31:25 +1000 (AEST)
Received: from localhost (unknown [89.233.230.99])
 by pokefinder.org (Postfix) with ESMTPSA id BC9932C315B;
 Tue,  9 May 2017 04:21:01 +0200 (CEST)
Date: Tue, 9 May 2017 04:21:01 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>, Joel Stanley <joel@jms.id.au>,
 Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v7 4/5] i2c: aspeed: added driver for Aspeed I2C
Message-ID: <20170509022101.GA2562@tetsubishi>
References: <20170424181818.2754-1-brendanhiggins@google.com>
 <20170424181818.2754-5-brendanhiggins@google.com>
 <CAFd5g47VGa=wqeyg5tFjB5xD=YsTuP27hLN3-ZM62MJD8dCP_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <CAFd5g47VGa=wqeyg5tFjB5xD=YsTuP27hLN3-ZM62MJD8dCP_Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 09 May 2017 02:31:26 -0000


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +              /* TODO: provide device tree option for multi-master mod=
e.
> > */
>=20
>=20
> I am curious what everyone thinks about this. It seemed that, earlier on,
> people did not like me disabling multi-master mode, but I think that it
> would make bus recovery not work as well. Given that, I think it makes the
> most sense to provide a device tree option either to enable multi-master
> support or disable it. Thoughts?

Check Documentation/devicetree/bindings/i2c/i2c.txt, there is a
"multi-master" property already which I think you could use here.


--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZESeMAAoJEBQN5MwUoCm2YSQP/2gqSPIVc08y4YZYIB6b92J+
gKNpDJI9ZDceKPtUr6TGzpdc5Tlb4KZBjHMLhD5pdKYG2ERs1NY9Oi8j4BfxR5kL
RhODk3Mp2IZrZhv4X2gU4ZLv0SzB46t0dDO0TT2WBHsDJOessbgIK/UZX2KoY342
0bKLhOuZS+USKd5xYYerL7CLi0LaKo1MM/+V2Kx8xQhdXSFGj5Qd9ijX3f79pgeL
JjdLoCdvZVmax6kvV3RsHCH3i4rW9PZDgSuUEbFX9CfK2yNKDFgJXTElliycfl5z
GPL36el1tJ+AZZWib72+ZwgzXmakA6l8Sj7s8hpJZC+nyRKxb8ediUfNZm2k5aQR
7KQBJoPaexLDKS0jv6wPf2RAWJkjAdz6/wiEGjia0mXlGFKHvattDy+23hVOR9fb
0wGuq/YvamSqNZif7pgOkMyQThCORffDM+6OBHFZYI5N1dhkHehv7bbgFfjAcg7Q
VpFsy1pOezSBT5Y049Bar2LlRqOrsVRdOoBO41KY8MV3ipBUG5ONyjpVAiESmSTt
NMxK07xkK0TqdxVwLO2as2k5hH9o0EGVw+R1MbgUHsaRGcnXT8Wwz39VzpZGLSPV
m8Z1ZGsljFiFqkZS/wYN9etWrRLEhe/z9WgJXfOFVOoiQSxyUp/WAd9i+uCSLO9J
hqZjimFyVoZ8KzYBAmu4
=3pWS
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
