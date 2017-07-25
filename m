Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHCtP4sLCzDqmD
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 08:42:37 +1000 (AEST)
Received: from localhost (32.97.110.53 [32.97.110.53]) by mx.zohomail.com
 with SMTPS id 1501022551128732.860517535548;
 Tue, 25 Jul 2017 15:42:31 -0700 (PDT)
Date: Tue, 25 Jul 2017 17:42:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH u-boot 0/1] RFC: How to configure boot options?
Message-ID: <20170725224224.GB473@asimov.austin.ibm.com>
References: <20170721223326.28674-1-patrick@stwcx.xyz>
 <CAPLgG==ZSsfgAm38616-32W5P6vZJsKJ+e8-XfhPxK3CVvVDmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <CAPLgG==ZSsfgAm38616-32W5P6vZJsKJ+e8-XfhPxK3CVvVDmw@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Tue, 25 Jul 2017 22:42:38 -0000


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 11:19:52AM -0700, Rick Altherr wrote:
> The current bootcmd script is there to provide backward compatibility for
> pre-FIT ramdisks.  That can probably be removed but we now want fallback
> behavior for images that still use a ramdisk.

Thanks for giving me the history on that BOOTCOMMAND snippet.  It wasn't
obvious what it was doing to me.

Agreed.  It seems a little odd to me that this is all controlled in the
u-boot repository directly, hence my questions.  I would have expected
that an IMAGE_FEATURE or MACHINE_FEATURE of Yocto would have triggered
FIT vs non-FIT.  Same now with the transition to UBI with kernel and
squashfs instead of distinct MTD devices.

>=20
> On Fri, Jul 21, 2017 at 3:33 PM, Patrick Williams <patrick@stwcx.xyz> wro=
te:
>=20
> > As part of the change-over from an initramfs-based boot sequence to a
> > direct rootfs boot, we need to change some of the boot options for
> > u-boot.  I expect these to change a few times in the near future as we
> > also transition to UBI-managed volumes and we figure out how to set
> > u-boot environment options to switch between different UBI kernels and
> > rootfses.
> >
> > This is really independent from the current ast-*-defconfigs, in that
> > those currently select between different network options.  I suspect
> > we do not N*M combinations of defconfigs for network*image-structure.
> > I plan to make a MACHINE_FEATURE (or DISTRO_FEATURE) in bitbake to
> > control this, but looking for feedback on how we should change u-boot.
> >
> > Ideally, to me, this would have been passed in via the config file and
> > we could have used config-snippets in Yocto like we do for the kernel.
> > Due to the way u-boot builds, I could not find a simple way to even
> > change this option from a include/config/ast-common.h #define into a
> > machine_config driven option.
> >
> > Anyone have ideas?
> >
> > Patrick Williams (1):
> >   config/ast-common: hack bootopts
> >
> >  include/configs/ast-common.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > --
> > 2.13.0
> >
> >
> >

--=20
Patrick Williams

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAll3yVAACgkQqwNHzC0A
wRnzLxAAhQ3i5ffCXR21AsioSFGM9fdnT6i7cD86cY6jyRvg8L6+BN2CQBE+t9OK
nL1+EFCkIHa7jyh3vUHlnmt9Qx+ruA4nJM1jGmk6ZC1OsUgahwWnzllcCi07vmhT
zrPg5M5VDw8DIvgIE5BvHLzpbj/pcAZOVzzt9+5WZnSmS/jDkshqzJHS8BIWNjYV
aDBIPSSkrkw7vp76tDHKHk89R/2JA7AGNseAVyTaOcEwVAmQc++AR/xbZ18OSerC
tRc5wvUcN/oBifChavdjX+5F6QJmu0U50IA7j60VdP2FRYPoiRCL7Bjtq3ao1gSq
iYLj3azjv4bjRv8n2FSKQN0v2V6Sf/0lE3Anqj3O9ruMjcZjAHtIHGYe7vVqTcyj
kNclTzlX9cE7tCW57ZElLbpFvdJOILUSD525J0Ny1GbNFBcTbeqcOtK8b7ZCI4j0
MkAPWRnfI4UvLB6C54wGCnofyTEx2JqDyLhvU7ErR1J9+9pSx5gVW/x65OwJqnrg
FWfBYQTisMZ2puJkbgyhT7qYDn8sgPGbYGRcxikQ8BMyQg+PAFfMcae4q7mto2s8
oeycrRa/963qhqCCp8HO1nP+YVa2OLc0zlo2SoEpL08ZB4yO1+WGvqNvpiO6/ca2
eIHOLfXpLGHcT64goWR6+HFI9OxZZ0o06Vp4gNst9sOSyQ77y+o=
=g4bX
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
