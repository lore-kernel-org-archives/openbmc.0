Return-Path: <wsa@the-dreams.de>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=the-dreams.de
 (client-ip=88.99.104.3; helo=pokefinder.org; envelope-from=wsa@the-dreams.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 42L3HZ08YtzF3Lb;
 Thu, 27 Sep 2018 02:27:04 +1000 (AEST)
Received: from localhost (i577A6E88.versanet.de [87.122.110.136])
 by pokefinder.org (Postfix) with ESMTPSA id 70CD62C0114;
 Wed, 26 Sep 2018 18:27:01 +0200 (CEST)
Date: Wed, 26 Sep 2018 18:27:01 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: linux-aspeed@lists.ozlabs.org, James Feist <james.feist@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: Add
 'idle-wait-timeout-ms' setting
Message-ID: <20180926162701.GB2736@kunai>
References: <20180910214519.14126-1-jae.hyun.yoo@linux.intel.com>
 <20180910214519.14126-2-jae.hyun.yoo@linux.intel.com>
 <a81a6092-a9d0-78d5-3596-cddc5d6a0713@linux.intel.com>
 <20180924215850.GD18592@kunai>
 <2c8563fd-0641-5237-0026-f559c480ad91@linux.intel.com>
 <20180925082717.GB2270@kunai>
 <7b4e5715-3a87-8f77-8d0d-4647f02c87a8@linux.intel.com>
 <f20a2e1d-e1db-1e63-3df8-ad650b931f7d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline
In-Reply-To: <f20a2e1d-e1db-1e63-3df8-ad650b931f7d@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Wed, 26 Sep 2018 16:27:06 -0000


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Should I use timeout in struct i2c_adapter instead just like i2c-mpc
> does?

I would accept that.


--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlurs1UACgkQFA3kzBSg
KbYdWRAAgd9KqRsqZO/I6SWF9Y1Q7nfCO2fz5OLKF1sR0SW+vtOk66U+HVPJcknP
hHny/DCujDrLMMnhjfCwNDm4JYqRepAJnM7cCUgMlcHayKCX4Xc7uQQK884YuxJ0
URDnuunW27j16EEnVoj0MYjrhLHMFRxLiqkO4PuNYLv/ivAb8jPEBbzzknDP447V
CWv6wlzcRgML1DUAS9H1bVmEydKlXsliQm0614zu6gRGOMZrHnTJwoNirUPEXTpD
R3JY4p5AHXaw6t6haEdsSDlj+vQsMGGnL1+QIr51vMKSY++rHb+Vt+CWGA6yutkK
NIPEAuEN2z0jSWtO3TFPpzh9cwy8Y4Vn3/2/Qme3MTh0+URZlyIe+ZjC0tug/GTW
L4T7oV6Qw3F0RLkX/wI4vf21IRYry2yd1qePnDFAu5NtqipRpMc8Mx5m86VFoCQD
RCx5sNxD9qGI2yfqZk2sqly/wOssU8FSMiZPdOvwqENcaV0bdMrTGrgqo/FOUtsn
gB6xdN3SNTVhaTHo3sLdou+7g+aZdZJKJjUQQXxhR26JKLrkxSc4LHiaEmM2Dv/k
gJpx4VQIjOPAKHVz2DDanSOXDqFiVxazUajSmzvXXDfE9Roys41vDj7bZ4+ikxJy
5VSac74TGdHLfTWhKWZ67HZPT0JcxgdOlLjtaVHZeisOI27BAmw=
=gHIN
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
