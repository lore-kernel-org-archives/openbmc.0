Return-Path: <pavel@ucw.cz>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=ucw.cz
 (client-ip=195.113.26.193; helo=atrey.karlin.mff.cuni.cz;
 envelope-from=pavel@ucw.cz; receiver=<UNKNOWN>)
X-Greylist: delayed 485 seconds by postgrey-1.36 at bilbo;
 Fri, 19 Jan 2018 08:35:34 AEDT
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zMy1L0YGDzF0mP
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jan 2018 08:35:33 +1100 (AEDT)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 85C2380186; Thu, 18 Jan 2018 22:27:21 +0100 (CET)
Date: Thu, 18 Jan 2018 22:27:21 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jiri@resnulli.us,
 tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com,
 robh+dt@kernel.org, openocd-devel-owner@lists.sourceforge.net,
 linux-api@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org
Subject: Re: [patch v15 4/4] Documentation: jtag: Add ABI documentation
Message-ID: <20180118212720.GA17196@amd>
References: <1514202808-29747-1-git-send-email-oleksandrs@mellanox.com>
 <1514202808-29747-5-git-send-email-oleksandrs@mellanox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <1514202808-29747-5-git-send-email-oleksandrs@mellanox.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Sat, 20 Jan 2018 14:54:29 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jan 2018 21:35:34 -0000


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-12-25 13:53:28, Oleksandr Shamray wrote:
> Added document that describe the ABI for JTAG class drivrer
>=20
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v14->v15
> v13->v14
> v12->v13
> v11->v12
> Tobias Klauser <tklauser@distanz.ch>
> - rename /Documentation/ABI/testing/jatg-dev -> jtag-dev
> - Typo: s/interfase/interface
> v10->v11
> v9->v10
> Fixes added by Oleksandr:
> - change jtag-cdev to jtag-dev in documentation
> - update Kernel Version and Date in jtag-dev documentation;
> v8->v9
> v7->v8
> v6->v7
> Comments pointed by Pavel Machek <pavel@ucw.cz>
> - Added jtag-cdev documentation to Documentation/ABI/testing folder
> ---
>  Documentation/ABI/testing/jtag-dev |   27 +++++++++++++++++++++++++++
>  1 files changed, 27 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/ABI/testing/jtag-dev
>=20
> diff --git a/Documentation/ABI/testing/jtag-dev b/Documentation/ABI/testi=
ng/jtag-dev
> new file mode 100644
> index 0000000..cab867d
> --- /dev/null
> +++ b/Documentation/ABI/testing/jtag-dev
> @@ -0,0 +1,27 @@
> +What:		/dev/jtag[0-9]+
> +Date:		October 2017
> +KernelVersion:	4.15
> +Contact:	oleksandrs@mellanox.com
> +Description:
> +		The misc device files /dev/jtag* are the interface
> +		between JTAG master interface and userspace.
> +
> +		The ioctl(2)-based ABI is defined and documented in
> +		[include/uapi]<linux/jtag.h>.
> +
> +		The following file operations are supported:
> +
> +		open(2)
> +		The argument flag currently support only one access
> +		mode O_RDWR.
> +
> +		ioctl(2)
> +		Initiate various actions.
> +		See the inline documentation in [include/uapi]<linux/jtag.h>
> +		for descriptions of all ioctls.

Sorry, can we have real docs? I tried to decipher it from jtag.h, but
its not easy. We should have API docs...


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlphETgACgkQMOfwapXb+vIdlgCgmALuEMnT/Z0QjMoTW0PROYpU
cvsAoKjf0/vYF2UTD7vKwoJE1m/4b9Im
=AJrt
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
