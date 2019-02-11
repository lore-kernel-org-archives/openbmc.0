Return-Path: <wsa@the-dreams.de>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=the-dreams.de
 (client-ip=88.99.104.3; helo=pokefinder.org; envelope-from=wsa@the-dreams.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 43yvBm6J8bzDqXB;
 Tue, 12 Feb 2019 05:17:02 +1100 (AEDT)
Received: from localhost (p54B333B4.dip0.t-ipconnect.de [84.179.51.180])
 by pokefinder.org (Postfix) with ESMTPSA id 2CCBA2E3542;
 Mon, 11 Feb 2019 19:16:59 +0100 (CET)
Date: Mon, 11 Feb 2019 19:16:58 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: [PATCH] i2c: aspeed: Add multi-master use case support
Message-ID: <20190211181658.u55ggc2xi4nsxxvy@katana>
References: <20190116193958.6049-1-jae.hyun.yoo@linux.intel.com>
 <20190208214849.GH12451@kunai>
 <d26a95ac-41ab-91eb-bbae-e4143235e531@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b7kjvamtr6un2ngr"
Content-Disposition: inline
In-Reply-To: <d26a95ac-41ab-91eb-bbae-e4143235e531@linux.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2019 18:17:05 -0000


--b7kjvamtr6un2ngr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Can you please apply above changes on top of this patch? Or I can submit
> v2 with it.

Please send v2.


--b7kjvamtr6un2ngr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxhvBYACgkQFA3kzBSg
KbZ58hAAmNRU6mM70EOa6sDNBXGmzcZENP6uaJPIZhmXqGs2hZGLkU6mSJic0Q+m
GfvX9fFAYCSagyUe/TIjgdxW0zsYPvo+791TQkB7L+d4ttcMRWVymCBoiGVsQj8q
I1toNkiWc6cMUKpdTifAAjjuK5x5CVnyYEdlCkaH96CejSh++DzdCxqtoKBu+YZH
sIfcpclSkuyXJB1Auzc36FVmcYMxUZbsHhE1pAQUGOgV+6RqmreNctPC7OvDYeJx
Xi2z5GmlB2J/CWE7nxD6vWIz17O6hzmLHf5/xsgP0YewwqYkib/jiKIwxmdzAO7c
5e8R3mO/ivmnj+/0+ez0gENLneu9hu0NnkqcuC1VJ0BddNLsNIOYmjnpu2x8NHhB
HNxmop4N0jaFkloCGq6o9HfMuwLWIR7/AkK9LOfrw2ZGS1zwJZqb5aesysT9yy0F
uzw+srgi+bnYOfGD2+rZxmMHCYv/cW9QT2bA4/15KAo39yXfNup1+XZr/94QRej+
3Bo0NDqTQLIk1Gvd0NjsK7Ohdr+XPA3amgfPnUqZ+cTH4sEwU6ezaV5DvCXj9plx
kxFgWksLgBpaCGIzd6A7ui7lsSfpuFZgo6zlQFTtGNtYNNakhoKz3gvIVXMSNwMn
Y6S9MM25vev0yn/qX2APLeN6fWVL0ixI6ZlI0qAVBs5xmoIHQo8=
=SJHw
-----END PGP SIGNATURE-----

--b7kjvamtr6un2ngr--
