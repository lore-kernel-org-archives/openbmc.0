Return-Path: <andrew@aj.id.au>
Received: from homiemail-a22.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qR3H06xchzDq70
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 09:41:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Wt7wkdnS; 
 dkim-atps=neutral
Received: from homiemail-a22.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTP id 00A4F11406C;
 Thu, 17 Mar 2016 15:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=rwpo7Bjb9ryALiWuzNKTl
 8l3kdw=; b=Wt7wkdnS0JvG6w4+lQD2Gvz274qdPBTYOhwGVJDdHiuffQFmylrEg
 25nCPTWMewtFPi21fSJvdjKlEo5MZ/xhMvvl+1yTc0ypHb4ifPjqcGoUBg9UFNed
 TlV5GemsjEwFUsGV/Dy3CIq79gb8KTAOcuoO/uwnYx3EjcZS/G5wPg=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPSA id 3824F11406A;
 Thu, 17 Mar 2016 15:40:58 -0700 (PDT)
Message-ID: <1458254455.27546.23.camel@aj.id.au>
Subject: Re: [RFC PATCH] Add palmetto target to runqemu
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Fri, 18 Mar 2016 09:10:55 +1030
In-Reply-To: <20160317155312.GA6045@asimov.austin.ibm.com>
References: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
 <20160317155312.GA6045@asimov.austin.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-MBF2viVDA9LIlnuN4KIF"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 17 Mar 2016 22:41:01 -0000


--=-MBF2viVDA9LIlnuN4KIF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-03-17 at 10:53 -0500, Patrick Williams wrote:
> On Thu, Mar 17, 2016 at 03:22:47PM +1030, Andrew Jeffery wrote:
> > Hi all,
> >=20
> > The patches modelling a bare-bones AST2400 in QEMU have been merged int=
o
> > master for the upcoming 2.6 release. Attached is a half-hearted attempt=
 at
> > integrating the necessary bits into openbmc so we can `bitbake
> > obmc-phosphor-image` then `runqemu palmetto` to boot the BMC kernel and=
 some
> > representation of the userspace.
> >=20
> > I'm not sure if the hacks I've made to runqemu{,-internal} are the righ=
t
> > approach or even something we'd want to carry going forward. Similarly,=
 a
> > wholesale switch to qemu_git.bb might be a bit extreme - any thoughts t=
here? I
> > must admit I haven't tried applying the AST2400 patches to 2.4, maybe t=
hat's a
> > better approach? Regardless, depending on 2.6 when it gets released is
> > prefereble, but that's probably a month or so away.
> >=20
> > I'll split the patches up in the future, just wanted to get this on the=
 list
> > for some feedback.
> >=20
> > Cheers,
> >=20
> > Andrew
> >=20
> > Andrew Jeffery (1):
> >   RFC: Add palmetto target to runqemu
> >=20
> >  yocto-poky/meta/recipes-devtools/qemu/qemu.inc     | 17 --------------=
---
> >  .../meta/recipes-devtools/qemu/qemu_2.4.0.bb       | 22 --------------=
--------
> >  yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb  | 21 ++++++++++++++=
+++++++
> >  yocto-poky/scripts/runqemu                         |  9 ++++++---
> >  yocto-poky/scripts/runqemu-internal                | 12 ++++++++++++
>=20
> Please refrain from making changes to content in the yocto-poky tree.
> This is intended to be a clean mirror of upstream yocto.  Yocto has lots
> of capability for overrides in the openbmc parts of the tree.

Yep, just wasn't sure how to go about it, so I took the sledgehammer
approach and got something working. I'll take a look at the
Yocto/bitbake documentation to see how this is best achieved. Do you
have any good links on the subject?

Andrew
--=-MBF2viVDA9LIlnuN4KIF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW6zJ3AAoJEJ0dnzgO5LT5rdsP/3kvDC02ObrKRU8hfL//wmjT
QjFvYIBxfnLciaGCjH3Bx6cdBXwThf1N2gZE6ExWkCv41gMmCFbX8FWv6UQOADbc
WYVx2K5in4Sqf1lDpKPA9f+bhTb+Ml/qNFVLgVLOhJA710YJtUzJgSEV4Jszr8vl
hstftTjAKA3YMJLIJtUkNn1NwPrcdpc4oMjS5MbBXuibVZ8uoT1C8zPI7Ehnvwt3
8y8DwOOinMCP5YnsGKi89T11t1FXXj9QATAwIX8IUM6AlXz8ogdNBNxjvfVvYRiB
TcWNiSkY6DVVc2r+nqV58RE0rMghYM0vPOIySRy4QWnGFXyupiyfyZnLPUg7q2Aj
IahH4Sqx83n1ewpRqYdANwGILr2QQUfz4NH+4gvX+ppPGSyriB5jI6dEJ+OiaUzn
QPepJ2btdEgrCPqYBn5PopbgHXLncJAzJExtmGSeIQ53P8hCFCtTQtLjGdTEsqzZ
9SHKryLwUOxGwzgLlsxSb+2NfzyGc9HuiggtH6r3tEXDRYkBBQ+exQfQT5a2FPc6
nck/sQ0fky+fR3OQuSmZKFouJmy6dLFVEREK6WRPSJH2K/cIlE2kFwlA1mh0iumh
2Izh/5YDLk7T9wD0Mwbk2FibX5LB3ivHSAImk+dEbT3/FPCdZNFx/a77NcZb4SKz
M0apmt/D0xUZ90vbACxD
=gJbW
-----END PGP SIGNATURE-----

--=-MBF2viVDA9LIlnuN4KIF--
