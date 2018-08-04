Return-Path: <wsa@the-dreams.de>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=the-dreams.de
 (client-ip=88.99.104.3; helo=pokefinder.org; envelope-from=wsa@the-dreams.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 41jc9234dbzF3H9;
 Sun,  5 Aug 2018 07:13:56 +1000 (AEST)
Received: from localhost (p54B337AD.dip0.t-ipconnect.de [84.179.55.173])
 by pokefinder.org (Postfix) with ESMTPSA id 8372B684E28;
 Sat,  4 Aug 2018 23:13:52 +0200 (CEST)
Date: Sat, 4 Aug 2018 23:13:52 +0200
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
Subject: Re: [PATCH i2c-next v2] i2c: aspeed: Add an explicit type casting
 for *get_clk_reg_val
Message-ID: <20180804211352.h7ctrfw7qzmmxfzu@ninjato>
References: <20180724203615.5770-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="icyj4bvzuxifguk6"
Content-Disposition: inline
In-Reply-To: <20180724203615.5770-1-jae.hyun.yoo@linux.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Aug 2018 21:13:59 -0000


--icyj4bvzuxifguk6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2018 at 01:36:15PM -0700, Jae Hyun Yoo wrote:
> This commit fixes this sparse warning:
> drivers/i2c/busses/i2c-aspeed.c:875:38: warning: incorrect type in assign=
ment (different modifiers)
> drivers/i2c/busses/i2c-aspeed.c:875:38:    expected unsigned int ( *get_c=
lk_reg_val )( ... )
> drivers/i2c/busses/i2c-aspeed.c:875:38:    got void const *const data
>=20
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Added the 'Reported-tag' and applied to for-next, thanks!


--icyj4bvzuxifguk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltmFw8ACgkQFA3kzBSg
KbaYIA/9FuNWOqzwhC2mmkt+mVEYgsimRNK2jkwCRHGqNoTW8/ys1CHm1+2ibJfG
Q5/auzEuTwotmMN0aJXjlObMTwzqnkOVC4Mhi8At/NrL5eX5LaDMyjhzXVykR9jr
+0HDzPXqEIR52HxbScbQfnc8Y2d48sYc/riSnlzYDw2FAVaDhUAtf87Y6JHZSw+o
7+xK2hHSfgOXJVNWR6YV7YF6YQdDZj3LqoF4XUufYGZO2LZGZIxmJ90mI+xgqVcM
v1O+7UDNaLJ7xd0zgocEMOZ3urKoxp1ltf/tdW/yuGpa18YcVOHj4DCuinhJcngy
9IDvbW9QjV2xiKy9D3h67PiD3gWasfrvZE1Zd/9OhBTKnOQ11+fFaw1wCs6ivHND
F2mpnsC+DmJzcw80yqi9SlC2S9TfxGluv+46gOZiBJpj9kRVi817DR9c4PjACs2E
aslqNpoLKs9Qy6OjfOhVzm0r8IYTnGTYaNpscrRTaPM+6mztDchw2BRE9jgT7CGf
3/f7ZDDxLUm1//P7swQcXsIgnJl4EwYmJAZTH4rfzjFcgWIyLhsqQ2pKOCc7Myp3
IoREiuD89+aZ/JtWDJ2hM/LidYBRYy2sG+KY4BQwS4KYmfUJASVuwK77X0JPoSmr
kSohS7uwR7JIwpZCnk9PCGJF2UgTuZH2/njbiOGcpPXi4DrjOp4=
=lG6B
-----END PGP SIGNATURE-----

--icyj4bvzuxifguk6--
