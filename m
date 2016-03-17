Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qR35n4Y9qzDq5s
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 09:33:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=vKDwpjqA; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id 326AD458083;
 Thu, 17 Mar 2016 15:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=VYQAugbV8JNp54EZOgplv
 usy0Rk=; b=vKDwpjqAmNNEI92Cz64uEsb1ooGa9VBKih6Nl/7lBuTnTXpyCUOoX
 wUERYuEqwiJdJfUofafv8PjRfR32mUqa9fDTghUkRhgwzfFIjg8k6fCIYO8jaoYW
 HAg4uwKhPqmSWOwV9f3USnt0ONsim0IjgU2wsFm48v3YbGRUm3sfaA=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 3BE17458080;
 Thu, 17 Mar 2016 15:32:59 -0700 (PDT)
Message-ID: <1458253971.27546.15.camel@aj.id.au>
Subject: Re: [PATCH] runqemu: Add palmetto target
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Patrick Williams <patrick@stwcx.xyz>
Date: Fri, 18 Mar 2016 09:02:51 +1030
In-Reply-To: <CACPK8XfWpkJ8HEbK4wOzWGrcfccBdRKoumsoQboj772jrgzUKA@mail.gmail.com>
References: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
 <1458190368-24002-2-git-send-email-andrew@aj.id.au>
 <CACPK8XfWpkJ8HEbK4wOzWGrcfccBdRKoumsoQboj772jrgzUKA@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-V98cZ2+OSv5qC9303AnK"
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
X-List-Received-Date: Thu, 17 Mar 2016 22:33:02 -0000


--=-V98cZ2+OSv5qC9303AnK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-03-17 at 15:49 +1030, Joel Stanley wrote:
> On Thu, Mar 17, 2016 at 3:22 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > The patch does a few things, but is more for inciting feedback than for
> > merging:
> >=20
> > * Adds qemu_git.bb in favour of qemu_2.4.0.bb
> > * Configured to build from master, at the commit merging the AST2400 su=
pport
> > * Adds a runqemu target 'palmetto'
>=20
> This is a good idea. Fix up the commit message so we can merge it :)
>=20
> >=20
> > diff --git a/yocto-poky/meta/recipes-devtools/qemu/qemu.inc b/yocto-pok=
y/meta/recipes-devtools/qemu/qemu.inc
> > index f6c0ae3..80ba2ca 100644
> > --- a/yocto-poky/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/yocto-poky/meta/recipes-devtools/qemu/qemu.inc
>=20
> yocto-poky is supposed to be the upstream repository, and shouldn't be
> patched by us.

Yep, I understand that :) My process here was "hack things 'til it
builds and boots - oh look it works, I'll post the patch and get
feedback".

>=20
> I don't know how poky lets us override built in recipies with those
> from other meta- packages. Can we carry your qemu-git.bb in
> meta-whatever instead?

I wasn't immediately sure about the answer to this, so I used the most
practical approach I thought would work :)

>=20
> Patrick, do you have any suggestions here?

I'll have a dig through the yocto/bitbake documentation, Patrick
suggests there's plenty of override capability in a separate email.

>=20
>=20
> > diff --git a/yocto-poky/scripts/runqemu b/yocto-poky/scripts/runqemu
> > index 23cf5be..f09da50 100755
> > --- a/yocto-poky/scripts/runqemu
> > +++ b/yocto-poky/scripts/runqemu
>=20
> The changes to this script look like a good start.
>=20
> > @@ -110,7 +110,7 @@ while true; do
> >      arg=3D${1}
> >      case "$arg" in
> >          "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips=
" | "qemumipsel" | \
> > -        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qe=
muzynq")
> > +        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qe=
muzynq" | "palmetto")
>=20
> Perhaps call it qemupalmetto? qemupalmbmc? to match the existing ones.

Right, I considered that. However, I went with 'palmetto' as the script
searches for image names based on the machine name:

    findimage() {
        ...
        filename=3D`ls -t1 $where/*-image*$machine.$extension 2>/dev/null |=
 head -n1`
        if [ "x$filename" !=3D "x" ]; then
            ROOTFS=3D$filename
            return
        fi
        ...
    }

I guess we could strip off the qemu prefix in the qemupalmetto case, or
we could change the image name to match *
-image*qemupalmetto.$extension. Conditional stripping is certainly more
sensible than changing the image name, but IMO going with 'palmetto' is
easier and less redundant than doing either of the two. But less
consistent.

Andrew
--=-V98cZ2+OSv5qC9303AnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW6zCTAAoJEJ0dnzgO5LT5YuoP/2NAzdV7dYPWt8yUwCLWmWxQ
FdMhZK/zhQszFO/u/d6TapcB3FMF2W90EK5qwlp5zoGcTey0Ji3yky9yOvGkpIzZ
t/EW0IwytuAFv64vG9HluvnhsRhrZ9DoIWRj/72yeGdtPuALgUhkb5r0+1KOQCaM
AlgCRIALXU/wvklZ7bBfC1sSN/KYmgG/dwKFLqN2pgVaLeJ027B3cbY7maHXaLzY
5zwpN3sRJvPpQpt1m1NA99er8wQDGOHueJN0m2/K+l6YYqMG2uAdBFk0Gx2IeXxf
WxgNgzTpuozIhvA9SjfhOIqUxuOOKZ+kHm/SAgWx+BpOoBLxxIU0M2jaqNfwf8A1
6HfRQktaybz0mlCEN6GCj6i4GeXq8k9dCHZQpeH4YEAca3QDmZtlWIBdyWmMW5z1
KDjKL/kY7SWbCLUn1CMnq6+bitKNaEUJRt0kN1P+nnaQsbAf671zOWu1ufFyn4h8
JzNr6hSVZAE/kfFmABgJrup+A4AmDC46brHYEhvL27MMVdJNCrydNMoQXzw+j89c
SCwmE1rP7ExP6GyP4XumZiWawmj5bbhOgHvHhX4i32V6pRgToDuJNYGnAdMhK+pH
Ey/VTfAqjy9IgedrHMJpvVnTXfTo/Be1ivwaj+6yjzBQwHkvqIgbk9wMTCWaktlE
InBqbrtYOVX/LR6aiBfB
=N78M
-----END PGP SIGNATURE-----

--=-V98cZ2+OSv5qC9303AnK--
