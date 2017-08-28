Return-Path: <pavel@ucw.cz>
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xh2km4byDzDqD0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 06:03:11 +1000 (AEST)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 6F4CE8255F; Mon, 28 Aug 2017 22:03:06 +0200 (CEST)
Date: Mon, 28 Aug 2017 22:03:05 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Oleksandr Shamray <oleksandrs@mellanox.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jiri@resnulli.us" <jiri@resnulli.us>,
 system-sw-low-level <system-sw-low-level@mellanox.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mec@shout.net" <mec@shout.net>, "joel@jms.id.au" <joel@jms.id.au>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "vadimp@maellanox.com" <vadimp@maellanox.com>,
 "tklauser@distanz.ch" <tklauser@distanz.ch>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [patch v1 0/2] JTAG driver introduction
Message-ID: <20170828200305.GA5132@amd>
References: <1501679918-20486-1-git-send-email-oleksandrs@mellanox.com>
 <20170802141209.GB25781@lunn.ch>
 <AM4PR0501MB2194E6B8D14EC15356C1C0BFB1B10@AM4PR0501MB2194.eurprd05.prod.outlook.com>
 <20170803174822.GI15018@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <20170803174822.GI15018@lunn.ch>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Wed, 30 Aug 2017 01:19:22 +1000
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
X-List-Received-Date: Mon, 28 Aug 2017 20:03:13 -0000


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Thanks a lot for review.
> >=20
>=20
> > We used user space tool for that, which is an adaptation of some
> > Lattice tools, which allows programming of SVF files. We are using
> > it for Lattice CPLD burning, since we have for such devices on our
> > system, but this tool could be used for programming other devices
> > from other vendors as well.
> =20
> > https://github.com/mellanoxbmc/mellanox-bmc-tools
>=20
> Since you are defining a new Kernel ABI here, it would be good to get
> some buy-in from potential users for the ABI. Maybe for the next
> version of the patchset you can cross post to the OpenOCD-devel list?

Actually, since you are defining a new ABI, it would be nice to have a
Documentation/ file with the ABI description, so that people can
review it...

Otherwise... yes, this looks like a step in right direction from 60000
feet above. I guess it is still a lot of work to get gdb running...

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmkdvgACgkQMOfwapXb+vKkXQCghrgqdzW9nSfI8109zd6tzRlZ
5xoAniVlWnQFwV4TrpfbMvOW2cNp+FcA
=b1qT
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
