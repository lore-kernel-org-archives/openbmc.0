Return-Path: <pavel@ucw.cz>
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgnnm6F5zzDq7d
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 20:19:56 +1000 (AEST)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 329088253B; Mon, 28 Aug 2017 12:19:53 +0200 (CEST)
Date: Mon, 28 Aug 2017 12:19:52 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net,
 jacek.anaszewski@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Message-ID: <20170828101952.GE18012@amd>
References: <20170828001711.19662-1-andrew@aj.id.au>
 <20170828001711.19662-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Content-Disposition: inline
In-Reply-To: <20170828001711.19662-2-andrew@aj.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Mon, 28 Aug 2017 22:08:50 +1000
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
X-List-Received-Date: Mon, 28 Aug 2017 10:19:57 -0000


--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-08-28 09:47:10, Andrew Jeffery wrote:
> On Baseboard Management Controller (BMC) systems it's sometimes
> necessary for a LED to retain its state across a BMC reset (which is
> independent of the host system state). Add a devicetree property to
> describe this behaviour. The property would typically be used in
> conjunction with 'default-state =3D "keep"'.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmj7kgACgkQMOfwapXb+vL3CgCgplOFTkPz2V1Xp3ZDHDs/gwVz
3TkAn3nXAQgflvygLscshEnRsncfNU25
=fdA/
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
