Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qR3hK4vNFzDq6W
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 09:59:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=BzuOm7S5; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id B9470334075;
 Thu, 17 Mar 2016 15:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=tNWou9NnT5M+jpS1OHPmo
 jN8zYA=; b=BzuOm7S5EMSnr4CBdAA19HeMwb3eBUGYc7jos8qi77hxdpKHbBQxl
 3r3SyV6xdKLXO7zRghvKdn69/hgyMvLMJ2aV3MXlDoG+2zOl8Js7pra3CrY6eF7D
 ZFS+1UErr4RFeKMI4aeI4ttbQjuNN4VyNzjHHxdHjk9ilYewzDKTSs=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id EAACA334072;
 Thu, 17 Mar 2016 15:59:27 -0700 (PDT)
Message-ID: <1458255564.27546.34.camel@aj.id.au>
Subject: Re: [PATCH] runqemu: Add palmetto target
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Fri, 18 Mar 2016 09:29:24 +1030
In-Reply-To: <20160317162845.GB6045@asimov.austin.ibm.com>
References: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
 <1458190368-24002-2-git-send-email-andrew@aj.id.au>
 <20160317162845.GB6045@asimov.austin.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-OjwzeROwxcILYSmW2H10"
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
X-List-Received-Date: Thu, 17 Mar 2016 22:59:30 -0000


--=-OjwzeROwxcILYSmW2H10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-03-17 at 11:28 -0500, Patrick Williams wrote:
> On Thu, Mar 17, 2016 at 03:22:48PM +1030, Andrew Jeffery wrote:
> > diff --git a/yocto-poky/scripts/runqemu b/yocto-poky/scripts/runqemu
> > index 23cf5be..f09da50 100755
> > --- a/yocto-poky/scripts/runqemu
> > +++ b/yocto-poky/scripts/runqemu
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
> It seems like there should be a way to extend the machines in runqemu
> without modifying the script.  Maybe an environment variable like
> "palmetto_SUPPORTS_QEMU=3D1" that we can set in one of the bitbake machin=
e
> files for each machine?

Yeah reading the script it did seem odd that there doesn't appear to be
a way to add qemu machine support.

>=20
> Might want to bounce this problem off of #yocto on IRC.

Will do.

>=20
> > +PALMETTO_DEFAULT_KERNEL=3DcuImage
> > +PALMETTO_DEFAULT_FSTYPE=3Dcpio.gz
>=20
> Also ideally have these come from a bitbake file.

So I was just following the convention here - but I'm taking your
comment was tied to the "it should be easier" issue above? I'll have to
see what my priorities are wrt reorganising the upstream scripts.

>=20
> > +        "palmetto")
> > +            mem_size=3D512
> > +            ;;
>=20
> > +if [ "$MACHINE" =3D "palmetto" ]; then
> > +    QEMU=3Dqemu-system-arm
> > +    MACHINE_SUBTYPE=3Dpalmetto-bmc
> > +    export QEMU_AUDIO_DRV=3D"none"
> > +    KERNCMDLINE=3D"console=3DttyS4"
> > +    QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -initrd $RO=
OTFS -no-reboot -nographic"
> > +fi
> > +
>=20
> Would be nice if this stuff was also in a bitbake file of sorts.  Would
> really be nice if we could leverage the machine classes (palmetto is-a
> openpower) to reduce the redundancy.

I'm not enough of a bitbake master to know how easily that can be
achieved, but it sounds nice in theory. The script as it stands just
tests against the relevant 'qemu*' names and goes from there - the code
I've added just follows that same pattern. Eg, from the script:

    ...
    if [ "$MACHINE" =3D "qemuarm" -o "$MACHINE" =3D "qemuarmv6" -o "$MACHIN=
E" =3D "qemuarmv7" ]; then
        QEMU=3Dqemu-system-arm
        ...
    fi
    ...
    if [ "$MACHINE" =3D "qemumips" -o "$MACHINE" =3D "qemumipsel" -o "$MACH=
INE" =3D "qemumips64" ]; then
        case "$MACHINE" in
        ...
    fi
    ...

Andrew
--=-OjwzeROwxcILYSmW2H10
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW6zbMAAoJEJ0dnzgO5LT5KzkP/33TtPzCBRQZxw01XOt7KJss
/HC5+ix3lkL1Dx3gYHvuJfrEkNs9s9MPqGrTHJJpfv/JDPcyNysRycqgelqudJkH
X7RYXSTjQP0IX8eVW7gtZOReIVauSeiMSJ/8jDvoKkY/wpbXlY9cO0pBjOZLRJ7V
YJ8Q4arhxpJJsYQDMJ37GVRfdD6cx7ump1IDA7bWYGAtPzHn1OU+2ubpYn23NJeR
qUV536zqRjOIOv1Rne27ivh1q0NnEtOdFzg/XJ4ExvHGX0wjtBIHQ0yDKrIVyYPQ
N6ydd4iXB5tTKd0x9M+oRfLC1RopI63/PmTtCJPoNHUbwOJ/sSKKicQY+iDuQn0o
eakH99rBQZwQQV4NrCX8iaGvxO9t6Pa78iJRjmKkirmG0NkbbEbNqpTvdJKg9ayb
Hac0SFhUjU62D2X/4VgouKt7JIO7DWb7RJD2BbrERRtg3pDnPdbe0iZ0jTbU3OYU
X6gpJ1t9xK9PHNRGY1atwmQIHUsqXkX9qlix5kCpHT5s0ELxKoZ6X/cUjmFaP4AE
G7jibZzzXhU+KrFdfXQ3HCq1w8AI+iS8cxVCe7PkACDi75evwPFhy2PNtwWCHpNf
QsP2C7LxJPdrPbXY3/qEfB/KlRh4NpqlOREs6SSNj36XbK1xoSyqr4BNPiyqN72b
bNwplRCS8PuGvJ43XCA+
=kAHE
-----END PGP SIGNATURE-----

--=-OjwzeROwxcILYSmW2H10--
