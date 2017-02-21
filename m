Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS6dv5CS6zDqBV
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 15:17:07 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1487650614400780.9255262642076;
 Mon, 20 Feb 2017 20:16:54 -0800 (PST)
Date: Mon, 20 Feb 2017 22:16:53 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: aspeed: Update reserved memory nodes for zaius
 and witherspoon
Message-ID: <20170221041653.GA21380@heinlein.lan>
References: <20170216054922.19722-1-cyrilbur@gmail.com>
 <20170216140524.GA5077@heinlein.lan>
 <1487299721.16373.2.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <1487299721.16373.2.camel@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 21 Feb 2017 04:17:08 -0000


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2017 at 01:48:41PM +1100, Cyril Bur wrote:
> On Thu, 2017-02-16 at 08:05 -0600, Patrick Williams wrote:
> > On Thu, Feb 16, 2017 at 04:49:22PM +1100, Cyril Bur wrote:
> > > -		flash_memory: region@94000000 {
> > > +		flash_memory: region@98000000 {
> > >  			no-map;
> > > -			reg =3D <0x94000000 0x04000000>; /* 64M */
> > > +			reg =3D <0x98000000 0x04000000>; /* 64M */
> > > +		};
> > > +
> > > +		vga_memory: framebuffer@9c000000 {
> > > +			no-map;
> > > +			reg =3D <0x9c000000 0x04000000>; /* 64MB */
> >=20
> > Do we really have to allocate 64MB to a VGA framebuffer?  We can store a
> > 4K resolution monitor with 32bit color in 32MB, so why is it required to
> > reserve this much memory?  Between this and the PNOR memory region, now
> > 1/4th of the BMCs memory is reserved.
>=20
> The reservation of 64MB is because the hardware is capable of using
> 64MB, therefore the host can use that region of memory. We're playing
> it safe here by ensuring the BMC doesn't use any of it to avoid any
> possibility of the host corrupting BMC memory. This is the most generic
> dts for the platform so we've gone with stability over performance.

Is there anything the BMC can do to restrict how big of a memory map the
host side of the VGA can open up?  If there isn't we're going to have to
allocate this much on all systems because we can't trust the host to
"behave".

--=20
Patrick Williams

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYq78zAAoJEKsDR8wtAMEZfjcP/RXq/cgMBn4EmPBTbwa6glIH
U8fhC1kN/BmlpFd2bjqhtDWzGBKFTXk7UFo9ZVCfvWbFLP/+8QuK2PUvH3E1cvin
I0ic1s+HdLABOX1KRoN9I5rD6fbA1Bilv5GWqk0mBph6zOEVByQrKw/LuPzV8ZhE
wxeSbMsrnBvuSdrGFCKlMVKV1AOTqxfCB7DNjdyol1tzeBZ/d9RnbS4F9oFgY8Bt
EbO0ynHE6NFuj0e7nxGpONqVKVomiklm+JWvhA82U/O2IifRiXkJPnVdfYwUmxKo
D/PmnryFib9WMXwLS0E3inolR3+F4z0wORSDl1UtwJaXaTPGCT14KMsuLmsYGna0
dLCbVArgrdTv3jTNZWlwgX/jungOC0WIyakgj69KyJhKUYkTOyeG1p9qWg6AKmzE
jHd+PwJQMSdeqiFivrmHjKetUQk6VCYX5DmrfyaN8dJr1NwIE+J13XPPuRR6dZtW
W5wL88WYcJg+8RUznWtPmCeHtyKwfbXOWWqltFhuHiIiUsr+AS0n5+DDfGMCwBYR
hZ8Rhp/5S+qa8FXWPE02G0/tgE7JpugLwvfYKQFx78/diIDNji1Q+ZPjJto0GLAj
qLTr2qojqGzKAivNEirjYZb4F+ZnHzY7NskRUwuQFS7LE7TQCjc4xt6pQfibhoDQ
AJD+4C2RgK7lYQlu5N9Z
=j/bG
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
