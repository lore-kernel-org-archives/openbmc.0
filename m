Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRVDd4wTMzDq5d
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2016 02:54:47 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1458316481995423.29568819900567;
 Fri, 18 Mar 2016 08:54:41 -0700 (PDT)
Date: Fri, 18 Mar 2016 10:54:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: [RFC PATCH] Add palmetto target to runqemu
Message-ID: <20160318155438.GB11491@asimov.austin.ibm.com>
References: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
 <20160317155312.GA6045@asimov.austin.ibm.com>
 <1458254455.27546.23.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline
In-Reply-To: <1458254455.27546.23.camel@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Mar 2016 15:55:30 -0000


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 18, 2016 at 09:10:55AM +1030, Andrew Jeffery wrote:
> On Thu, 2016-03-17 at 10:53 -0500, Patrick Williams wrote:
> > On Thu, Mar 17, 2016 at 03:22:47PM +1030, Andrew Jeffery wrote:
> > > Hi all,
> > >=20
> > > The patches modelling a bare-bones AST2400 in QEMU have been merged i=
nto
> > > master for the upcoming 2.6 release. Attached is a half-hearted attem=
pt at
> > > integrating the necessary bits into openbmc so we can `bitbake
> > > obmc-phosphor-image` then `runqemu palmetto` to boot the BMC kernel a=
nd some
> > > representation of the userspace.
> > >=20
> > > I'm not sure if the hacks I've made to runqemu{,-internal} are the ri=
ght
> > > approach or even something we'd want to carry going forward. Similarl=
y, a
> > > wholesale switch to qemu_git.bb might be a bit extreme - any thoughts=
 there? I
> > > must admit I haven't tried applying the AST2400 patches to 2.4, maybe=
 that's a
> > > better approach? Regardless, depending on 2.6 when it gets released is
> > > prefereble, but that's probably a month or so away.
> > >=20
> > > I'll split the patches up in the future, just wanted to get this on t=
he list
> > > for some feedback.
> > >=20
> > > Cheers,
> > >=20
> > > Andrew
> > >=20
> > > Andrew Jeffery (1):
> > >   RFC: Add palmetto target to runqemu
> > >=20
> > >  yocto-poky/meta/recipes-devtools/qemu/qemu.inc     | 17 ------------=
-----
> > >  .../meta/recipes-devtools/qemu/qemu_2.4.0.bb       | 22 ------------=
----------
> > >  yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb  | 21 ++++++++++++=
+++++++++
> > >  yocto-poky/scripts/runqemu                         |  9 ++++++---
> > >  yocto-poky/scripts/runqemu-internal                | 12 ++++++++++++
> >=20
> > Please refrain from making changes to content in the yocto-poky tree.
> > This is intended to be a clean mirror of upstream yocto.  Yocto has lots
> > of capability for overrides in the openbmc parts of the tree.
>=20
> Yep, just wasn't sure how to go about it, so I took the sledgehammer
> approach and got something working. I'll take a look at the
> Yocto/bitbake documentation to see how this is best achieved. Do you
> have any good links on the subject?
>=20
> Andrew

I understand it was just RFC quality code.

The "Mega Manual" is the definitive source of documentation on
everything Yocto.  It is, unfortunately, rather complete.

I would start with this chapter:

http://www.yoctoproject.org/docs/1.8/mega-manual/mega-manual.html#using-bba=
ppend-files

--=20
Patrick Williams

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW7CS+AAoJEKsDR8wtAMEZhVEP/2Gg39BeTxXMOnFS+1SQleLL
DJN8gcbMnF0RLWklOpUnabvuPYKtL9veclaHtCM7PibG+QfXlLag0JEW6evfrVkm
iopxI9hpiBYT90b5+1JW/9sdIpUOmhRUV7iJDDh4NHQJY55LWuYQRUtyfFqknoy4
56hJjLTlcF8GP0F6i1GOA4CFR0vYIK63ooUgAr5jwhTi0lsJIe3Z9Vi0Mq1iG3Wr
4zFkS7eR06FHR8knA3HpU6uHJtXXACzfvKWuSZWscwuyLZtv8Syj2TQTsRF0+oel
zUv5bnsZyDImrdBmtTRqOJjH+BiI5Jlj2o1qcGNvYBuIhxwSqRWL/1QrYGsR2Ni5
7C4WBFr6SCYuoL3vbKwaGfmw3ia9vrSN/eEeLv5VeAhXr7kzl8dbpi6kdtnfEs5g
Y1HGk4KVoL3xLUdAKpZj/YPcOezpYf12RGpo9CtNZ39qKRnINqMbTe71p88c3gTJ
jy7jbZ8pnNBq0IFKagGGmKkWvaLjTiuzWLVKEuYeshXirozLzn+CfLEYcin0rRZC
JGxlbIyg3MKQRbX6STnjsZXtw0KmVMjzSnX6WwqBVc4i+GSEi9X8cfBxc+zuw61A
SW9C9uSR0TwbqdZrQp7hVXz9cyzNHGrGA35RpqYeyn8U4B+R2K/BcptLwg9IgIhs
qZbI3uivZRBkP+4mOlE/
=XZo+
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
