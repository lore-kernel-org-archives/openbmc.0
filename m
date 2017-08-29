Return-Path: <wsa@the-dreams.de>
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 3xhMf10hlyzDqYG;
 Tue, 29 Aug 2017 18:45:11 +1000 (AEST)
Received: from localhost (p54B33289.dip0.t-ipconnect.de [84.179.50.137])
 by pokefinder.org (Postfix) with ESMTPSA id 6C4632C30DD;
 Tue, 29 Aug 2017 10:45:09 +0200 (CEST)
Date: Tue, 29 Aug 2017 10:45:09 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-i2c@vger.kernel.org, brendanhiggins@google.com,
 benh@kernel.crashing.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 ryan_chen@aspeedtech.com
Subject: Re: [PATCH] i2c: aspeed: Retain delay/setup/hold values when
 configuring bus frequency
Message-ID: <20170829084508.edybxf6zctgx4xwy@ninjato>
References: <20170815072102.23067-1-andrew@aj.id.au>
 <20170828160702.x45hagij4kkm5zzc@ninjato>
 <1503989809.5933.5.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kvm256seylhxblkl"
Content-Disposition: inline
In-Reply-To: <1503989809.5933.5.camel@aj.id.au>
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
X-List-Received-Date: Tue, 29 Aug 2017 08:45:16 -0000


--kvm256seylhxblkl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'd argue that Brendan's patch should go in for-current as well,
> because it fixes a divisor rounding error for the ast2500 (bus is
> clocked faster than requested).

Hmmm, pity, the description said "potential" issue so I decided for
for-next. However, I wouldn't like to reshuffle my branches much so
short before the merge window. So, would it be OK with you that you send
both patches to stable after rc1?


--kvm256seylhxblkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmlKY4ACgkQFA3kzBSg
KbbMbw//aVe77sPGCbEkvl2GTBtH+61PghLdggKTthWj2fY/+y2+OV6MeM70XdJO
HhNh2lykrzKZ9YUS/Omufhu3NmdmPeE1skmiZqbmFw/BMQJ1o8BpzqCPjuVM45NS
bjzFb9dSLy5wM15Ve4Wq3fHwn7b8D3/Mlhygf8Gk5P37RGxr6Wj5nWrS2ZyY7Osb
cpnMZxtYcs4E1dOPpupIOS2+6r42f2+gGhqtwm/hlBRI2C4qhEwqpdP4PxIfFGpp
2ZJF1+T58PqA1NLsqi+RZKNmtFUcLfMlncpugC6GLPie72/vUvyMWcGukQtDTvg0
cuIIsMC4cL2FjVcIVlFUE0/nvl80Ks510jx5bB6L/xELVqU6yDgoSnYEYJ50/JuA
dxaNtnGqnRew3jfHahkkscLUcRUxR3A5i0SGg9a84mUASo8KYAjZ/7+disRQb7Iy
dsE7LpTy1YkO6dT2wfo3LvesSOmMt83gnwpfrr312bc360+Xa7zFnqQGtGwJnSb7
OiOwtsHyrB8Yv3+pkEQaAExPF5hSNzijCE4QbsWNOKTc/liuuFZRvl5qgOfBPeM6
gA8i2XdPy84tKBID4TiaqEnaHDCDGHk53FASiNqoBgDoMh1jmbUIeM7CPwLkorRq
UoswvohQw2XbT3fA1/8LV3gI0gf/V+K2oQsL2BqO7vfBy4Twg6g=
=vZjk
-----END PGP SIGNATURE-----

--kvm256seylhxblkl--
