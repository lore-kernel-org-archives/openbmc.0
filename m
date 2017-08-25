Return-Path: <pavel@ucw.cz>
X-Greylist: delayed 394 seconds by postgrey-1.36 at bilbo;
 Fri, 25 Aug 2017 17:39:24 AEST
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xdtMw1MptzDqY8
 for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2017 17:39:23 +1000 (AEST)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id E81A5825AE; Fri, 25 Aug 2017 09:32:39 +0200 (CEST)
Date: Fri, 25 Aug 2017 09:32:39 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] leds: gpio: Allow LED to retain state at shutdown
Message-ID: <20170825073239.GB15494@amd>
References: <20170825063503.31577-1-andrew@aj.id.au>
 <20170825063503.31577-3-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline
In-Reply-To: <20170825063503.31577-3-andrew@aj.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Mon, 28 Aug 2017 13:40:16 +1000
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
X-List-Received-Date: Fri, 25 Aug 2017 07:39:24 -0000


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2017-08-25 16:05:03, Andrew Jeffery wrote:
> In some systems, such as BMCs, we want to retain the state of LEDs
> across a reboot of the BMC whilst the host remains up.

I'd spell out what BMC is...

Otherwise series looks good.

Acked-by: Pavel Machek <pavel@ucw.cz>


								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmf0pcACgkQMOfwapXb+vK2bQCdHsMlxUDUGCrKSU0qXN6A/oF8
xLwAoJdV1UxnnPeOWeGpUOStV5SM1e5d
=eGz1
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
