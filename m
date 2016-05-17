Return-Path: <andrew@aj.id.au>
Received: from homiemail-a17.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7ydH6QPFzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 10:19:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=hzG1gEEB; 
 dkim-atps=neutral
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id 1A1062B206A;
 Mon, 16 May 2016 17:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=AhfoDv7ldZFI3YJXZMZU+
 gvj6nE=; b=hzG1gEEBNd9h30utrPiODFo7j0W3zjCSHV0zVPnqhzfmX0EHzdJmT
 b9zqDH6ikyoW2M8+sKK5w0jFaTdSOUma7PygA+yHlpDdy4Vulxvz7ktjRtkneoCj
 cvLkix/JcZcZ8wzFRIrbIziPLb/ywTJMHNSj7Nvw/2Y6kCQb8KfAUI=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id 27BCA2B2065;
 Mon, 16 May 2016 17:19:44 -0700 (PDT)
Message-ID: <1463444380.2703.83.camel@aj.id.au>
Subject: Re: [RFC PATCH openbmc v3 1/8] meta-openbmc-bsp: Add qemu git recipe
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Tue, 17 May 2016 09:49:40 +0930
In-Reply-To: <20160516201453.GH19968@asimov.austin.ibm.com>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
 <1458720215-25302-2-git-send-email-andrew@aj.id.au>
 <20160516201453.GH19968@asimov.austin.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-+1MjJYXQqARCLMLSf5Oe"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2016 00:19:48 -0000


--=-+1MjJYXQqARCLMLSf5Oe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

Thanks for the feedback.

On Mon, 2016-05-16 at 15:14 -0500, Patrick Williams wrote:
> On Wed, Mar 23, 2016 at 06:33:28PM +1030, Andrew Jeffery wrote:
> ...
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0meta-openbmc-bsp/conf/layer.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A0=C2=A08 ++
> >=20
> > =C2=A0.../recipes-devtools/qemu/qemu-targets.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A022 ++++
> > =C2=A0meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc=C2=A0=C2=A0=C2=A0=
=C2=A0| 125 +++++++++++++++++++++
> These files are originally in meta/recipes-devtools/qemu.=C2=A0=C2=A0We s=
hould
> be able to continue to use those.

As pointed out in my comment on the pull-req[1] qemu.inc isn't a bit-
for-bit copy, I've changed (removed) some parts. However it's likely
there is a better approach than deleting parts of the configuration.

qemu-targets.inc was a straight copy, but I don't know of a way to
reference it from the new qemu recipe. Removing it doesn't make the new
recipe find it in the old recipe's directory...

>=20
> >=20
> > =C2=A0meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb |=C2=A0=C2=A02=
1 ++++
> I would prefer this under
> meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp , since it is the
> 2400 specific qemu tree.
>=20
> I think you can avoid the layer.conf and bblayers.conf changes if you
> use the (already supported) meta-ast2400 tree as well.

Yeah, happy to do that. I asked where people prefer I put it (can't
remember where I asked though) and got no feedback, so for the patch I
put it here on the basis that if people disagreed they'd have an
opinion :)

>=20
> >=20
> > =C2=A0.../meta-palmetto/conf/bblayers.conf.sample=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> > =C2=A0.../meta-barreleye/conf/bblayers.conf.sample=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A01 +
> >=20
> > diff --git a/meta-openbmc-bsp/conf/layer.conf b/meta-openbmc-bsp/conf/l=
ayer.conf
> > new file mode 100644
> > index 0000000..7f07802
> > --- /dev/null
> > +++ b/meta-openbmc-bsp/conf/layer.conf
> > @@ -0,0 +1,8 @@
> > +# We have a conf and classes directory, add to BBPATH
> > +BBPATH .=3D ":${LAYERDIR}"
> > +# We have a recipes directory containing .bb and .bbappend files, add =
to BBFILES
> > +BBFILES :=3D "${BBFILES} ${LAYERDIR}/recipes*/*/*.bb \ ${LAYERDIR}/rec=
ipes*/*/*.bbappend"
> > +
> > +BBFILE_COLLECTIONS +=3D "openbmc-bsp"
> > +BBFILE_PATTERN_openbmc-bsp =3D ""
> > +BBFILE_PRIORITY =3D "1"
> I think we can remove this by moving to meta-ast2400.=C2=A0=C2=A0Not sure=
 I
> understand why this was required.

Yeah it's likely we can remove it. It was an experiment that I don't
think is required and shouldn't have made it into the pull-req.

>=20
> >=20
> > diff --git a/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb b/meta-=
openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
> > new file mode 100644
> > index 0000000..97667ba
> > --- /dev/null
> > +++ b/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
> > @@ -0,0 +1,21 @@
> > +# Based off of [1], appears to be MIT licensed [2].
> > +#
> > +# [1] https://github.com/dirtybit/gumstix-yocto/blob/master/meta/recip=
es-devtools/qemu/qemu_git.bb
> > +# [2] https://github.com/dirtybit/gumstix-yocto/blob/master/meta/COPYI=
NG.MIT
> I don't think you need to say this.=C2=A0=C2=A0This doesn't look that muc=
h
> different from qemu_2.4.0.bb except for the SRCREV / SRC_URI / S
> variables and those are really standard with other of our recipes.
>=20

Yeah I'll strip it out. Initially it looked more like the linked
content, but I stripped it back as I went.

> >=20
> > +
> > +require qemu.inc
> > +
> > +SRCREV =3D "d1f8764099022bc1173f2413331b26d4ff609a0c"
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a7=
2fbac \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0file://COPYING.LIB;endli=
ne=3D24;md5=3Dc04def7ae38850e7d3ef548588159913"
> > +
> > +SRC_URI =3D "git://github.com/openbmc/qemu.git;protocol=3Dhttps"
> > +S =3D "${WORKDIR}/git"
> > +
> > +COMPATIBLE_HOST_class-target_mips64 =3D "null"
> > +
> > +do_install_append() {
> > +=C2=A0=C2=A0=C2=A0=C2=A0# Prevent QA warnings about installed ${locals=
tatedir}/run
> > +=C2=A0=C2=A0=C2=A0=C2=A0if [ -d ${D}${localstatedir}/run ]; then rmdir=
 ${D}${localstatedir}/run; fi
> > +}

[1]=C2=A0https://github.com/openbmc/openbmc/pull/230#issuecomment-212228955
--=-+1MjJYXQqARCLMLSf5Oe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXOmOdAAoJEJ0dnzgO5LT5bEgP/jAzZWtuDXj2RRfO24H5gsMR
/8Q6itYO/46hQNnGJ1r+8Ux004Sv+LEB+zIor2dkTSfBk9B0lzP/SngJs9VI/Uyf
iaTz6FcxsJoZJBQouYFF51YEQ/aDdsfQFXHiirija9LRdC9r7mL3z7rrkNvlUc1k
DtU9SzPnMRWv4xbZdXMhK3huwedKXxm+zFQpSJf3BTWAFShHibQjy4rB3yuM2hbQ
LywTCddMcQSfzcQg5mwegEwnUMgr13v0/MflkxcS2KhUUHEzLCgpo7Nb0ohqmlwi
HyeEQhNH+UaP1BX62/9oqsEag8ldyJYwYHq9/ZSzQgpMeqp01LyYaiZi4t5KTCAX
zWLaT+/Sl++jddmmhTY0StLpuRqYzrl5ActoNgeXTBv95HebeC29MAhhFVWGMAfJ
1mSvP1TXTYbQePF+U6ZlE6ojNSxkNwFzZMJay99i0fjTDfHs15Mgm6YBaeYnI4Yf
3DaaixckiA124i0pp47VZoCLdw4VoMwCZhY0m0G7fkEKtkdHmR1oaP90WHt8f6Pq
BNgM4ZDqm5FWXP0DoHtwfhPSJS4C/hWwylp0cBYUkzw9O2MIHOVbSeehMcH7ze0k
pxtkr4RXVHTUGEc9uOze9M3yjoO6yXYCgPVNKbW1PCPEJhJMwZ6o/IuZ1Q1ptvSH
fgA+Zod7XX7Eh6eb7U25
=adO5
-----END PGP SIGNATURE-----

--=-+1MjJYXQqARCLMLSf5Oe--
