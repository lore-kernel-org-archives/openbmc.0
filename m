Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdFLp4dpFzDqRd
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 13:49:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=N9GrAeAe; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=R6AmVKaj; dkim-atps=neutral
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8BABE222;
 Sun, 26 Jun 2016 23:49:52 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute5.internal (MEProxy); Sun, 26 Jun 2016 23:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=gtffF
 r9bWZbUCHgN82WNh1X4pAc=; b=N9GrAeAej/pSVsIzoCIBfppC6WCnwA5hvE3VO
 US3a16L6JLGIT2FbDNn91yvlNzYjfSvkqWQ/Iu76x9nr704mT28vXHP6Mjm+lY5n
 840GNo8Zq/cg6HMHbXO7QmUZFSGJXUNute2bvJ40nNCfzwhpOeywOO67XyJW1ZAS
 2HrR/o=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=gtffFr9bWZbUCHgN82WNh1X4pAc=; b=R6AmV
 KajdBSd9IzDgnBGc1hDJs5UyYrhOo8FAXiFjtYft+52thfonvn6jjwk3MGuw9s9W
 4QXNqkKwSVCHMB+2YfT97Jz8BPJ6+bcqMGnI3WBRpiioNrurBqhTUVjo5k5seDUU
 x4ZXmETkWuL48rsUBUxA8y94CryrK+l4CImTUE=
X-Sasl-enc: B3Wjg96j7tsHhwTsISgUtMGTHiOReHKaOCJLO0pZjA3q 1466999391
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25681F29FC;
 Sun, 26 Jun 2016 23:49:49 -0400 (EDT)
Message-ID: <1466999386.23740.157.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 16/18] initfs: update: handle no images to
 update
From: Andrew Jeffery <andrew@aj.id.au>
To: Milton Miller II <miltonm@us.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 27 Jun 2016 13:19:46 +0930
In-Reply-To: <OFB254FE20.F4AE1E82-ON00257FDC.007FC408-00257FDE.000120E1@notes.na.collabserv.com>
References: <1466662295.23740.79.camel@aj.id.au>
 ,<20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-17-openbmc-patches@stwcx.xyz>
 <OFB254FE20.F4AE1E82-ON00257FDC.007FC408-00257FDE.000120E1@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-u7c/nO6ZM6+gjB5UNgv/"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Mon, 27 Jun 2016 03:49:55 -0000


--=-u7c/nO6ZM6+gjB5UNgv/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2016-06-26 at 00:12 +0000, Milton Miller II wrote:
>=20
> On 06/23/2016 01:11AM Andrew Jeffery wrote:
> >
> >On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:
> >> From: Milton Miller <miltonm@us.ibm.com>
> >>=C2=A0
> >> Notify the user if image wildcard expansion fails instead of
> >printing
> >> message about failing to find partition to flash.
> >>=C2=A0
> >
> >This kind of problem is why I have reservations about our early/late
> >shell scripts. I wonder how many more of these issues are lurking...
> >
> >> The update script errors with the message that it can't figure out
> >what
> >> partition to flash for /run/initramfs/image-* if there are no
> >images
> >> pending.
> >>=C2=A0
> >> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> >> ---
> >> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1=
3
> >+++++++++++--
> >> =C2=A01 file changed, 11 insertions(+), 2 deletions(-)
> >>=C2=A0
> >> diff --git
> >a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >> index 1dbf65f..7120a18 100755
> >> ---
> >a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >> +++
> >b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob
> >mc-update.sh
> >> @@ -99,6 +99,7 @@ checkmount=3Dy
> >> =C2=A0whitelist=3D/run/initramfs/whitelist
> >> =C2=A0image=3D/run/initramfs/image-
> >> =C2=A0E=3D"ERROR:"
> >> +imglist=3D
> >> =C2=A0
> >> =C2=A0while test "$1" !=3D "${1#-}"
> >> =C2=A0do
> >> @@ -184,7 +185,15 @@ then
> >> =C2=A0 fi
> >> =C2=A0fi
> >> =C2=A0
> >> -for f in $image*
> >> +imglist=3D$(echo $image*)
> >
> >If there are no wildcard matches doesn't this expand to the string
> >"/run/initramfs/image-*"? Why are we using echo in a subshell?
> >
>=20
> Because that causes path expansion to be performed before
> assigning the output to the parameter.
>=20
> >> +if test "$imglist" =3D "$image*" -a ! -e "$imglist"
> >
> >What's the idea behind the first condition ("imglist" =3D "$image*")?
> >Won't they always be the same?
> >
>=20
> No, because parameter splitting and path expansion are
> suppressed by the double quotes here but path expansion
> occurred in the echo above.

Okay, I understand, but it still feels subtle. Can you add some
comments?

Cheers,

Andrew
--=-u7c/nO6ZM6+gjB5UNgv/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXcKJaAAoJEJ0dnzgO5LT5YDMQAIEUQVmJ0ENDi8ztDeHGiXdU
9SeMW2WiXn3hMrG7NaUbinb5iotUOGaCZjLZz9uSiWel10Qc6fYEY8jJsjWMuvel
Y20ejzGyo4yXxgARZcj7pHna7WdcFBrmDy2Q4QQCz9wG3eI8Dicq9gSH0ZueKsCC
xfxyB0uzM67YT79cZvPQg9I0S/mYDHDRXpGXIwecCGQD79+3xh5mjTRsRg7VHuOd
cNbA0j4LlkWrRng9gGvadOmSG4rq0ZY3/iKM+5zKs3bzmerjVVnVwCGvRgKUtC8F
hJoJbfN0FkttJBsyHKTCNTcujgWZRNnQa+0ii2BeUJNwUUABEJg/4M6U9MZSGGa2
BA1lk4p9hWj7DwLsXRiEvqVfqHmc4PUvf4RkHI+2tsmJCnvqrP1RbGDw5SMVkk+d
oBhx0yXOmcntZObJWZfNiaDfXIhrmlcW4kS6Ngc+4Z0+XUmn7gPhf1igQvNDVjaB
ffPXZ4NNtPzTtTn3BLrK2K+YgQ8FclgAcypCufxVJdEyOop2DlFfZHUGswub08/z
+AQDDxrN1aFMVZbrC0OC/OE5F7Zb5nNMxsIJYK2xIt2tohRFrOXYcCZ8gEoKGFQ9
yZwqKIou2tK/sanfFz1RPYlPurNnqh0YYBypKXd0XpfreO63siU8Qa2982XY//IR
mu+W5LtwbsCRhgA2Rc0W
=sKVE
-----END PGP SIGNATURE-----

--=-u7c/nO6ZM6+gjB5UNgv/--
