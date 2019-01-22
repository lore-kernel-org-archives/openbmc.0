Return-Path: <wsa@the-dreams.de>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=the-dreams.de
 (client-ip=88.99.104.3; helo=pokefinder.org; envelope-from=wsa@the-dreams.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 43kkrP1XXDzDqL8;
 Wed, 23 Jan 2019 10:18:59 +1100 (AEDT)
Received: from localhost (p54B333AA.dip0.t-ipconnect.de [84.179.51.170])
 by pokefinder.org (Postfix) with ESMTPSA id A084A2C78FF;
 Wed, 23 Jan 2019 00:18:54 +0100 (CET)
Date: Wed, 23 Jan 2019 00:18:54 +0100
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
Subject: Re: [PATCH] i2c: aspeed: Remove hard-coded bus timeout value setting
Message-ID: <20190122231854.g75ijhg6halhzdvh@ninjato>
References: <20190116193943.6004-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n33otukcn44nvdcc"
Content-Disposition: inline
In-Reply-To: <20190116193943.6004-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Tue, 22 Jan 2019 23:19:01 -0000


--n33otukcn44nvdcc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2019 at 11:39:43AM -0800, Jae Hyun Yoo wrote:
> This commit removes hard-coded bus timeout value setting so that
> it can be set by i2c-core-base.
>=20
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Applied to for-next, thanks!


--n33otukcn44nvdcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxHpN0ACgkQFA3kzBSg
KbY1fw/9H06zwh4pL8+szV13WMpPIU1rXCyiRitiy1m4Q6GgfHgyNUyjAAeuNmO/
TcwZNmGx4yGlonk7LmL1xg98w7mjcbAwwu4B5ihlPN28MJGGT+WIdpHibjzB8Dvz
Qwqh23tWxaU0KtMRwZppKKbKv5T8jux6qarxfxVFDY5eEd8qSWiqRCzN/5i9pE3Y
gVpxKi5cQwSANEveQ9rjLU+tqq+VNo48PlcybHMaVImGL8V9lDVOKwosoQnISJ71
Wnx+FfX0f/Mlu00gIcB/LrPnz4JbWRLvvyTr8RRtjJXHEmaicIncj6vmGvLp8m3l
NsUAalTrwdDJq9EzzTRYNhlDlkUEonESnIlaQmjgSGKLYJ3u8sO1vL6P7SNfYRbu
dP7O/e0eZFlovb+6XnF21arafl/J8bN4Qv0MLgm3/kUWxcmw6MpDBoiQ58eLn0et
hFG4AJCWNszEA1btFdt+kR2VSl65+6rHydDqJIP7aDwnoXVYqIJjYjs79tHbs+jS
jIKvcIpXvzMpPwQ4W7pO9QwqCfDDadnKuOoFpe2L59a+OYT6orTNqfl3kSRey7sv
9WfLkus8l7nZovpkeXW9vwkEUvdC3xQX5f6eIiKiB4is7uArt5cZmH7BHQOiypX0
jh0pSX9f6dI9eDCMq/VGzOysDHitI6K+E/0tiv6wFAycN/IVIfg=
=nQmG
-----END PGP SIGNATURE-----

--n33otukcn44nvdcc--
