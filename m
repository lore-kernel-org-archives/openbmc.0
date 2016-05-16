Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7sFs4htRzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 06:17:37 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1463429851348624.8109912761549;
 Mon, 16 May 2016 13:17:31 -0700 (PDT)
Date: Mon, 16 May 2016 15:17:29 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: [RFC PATCH openbmc v3 2/8] runqemu: Add palmetto target
Message-ID: <20160516201729.GI19968@asimov.austin.ibm.com>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
 <1458720215-25302-3-git-send-email-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YhFoJY/gx7awiIuK"
Content-Disposition: inline
In-Reply-To: <1458720215-25302-3-git-send-email-andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 16 May 2016 20:17:38 -0000


--YhFoJY/gx7awiIuK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

We need to find a way to do this without adding new machines to
scripts/runqemu each time.

On Wed, Mar 23, 2016 at 06:33:29PM +1030, Andrew Jeffery wrote:
> Example use:
>=20
>     $ bitbake obmc-phosphor-image
>     $ runqemu palmetto slirp
>=20
> Specifying slirp avoids needing root to configure network, which won't
> work (yet). The palmetto-bmc machine currently only models the VIC and
> timers from the AST2400, and adds a 8250 UART for a console, so there's
> not much interesting to play with in terms of hardware support. But, we
> can now boot the one kernel both on the hardware and in QEMU.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../meta-ibm/meta-palmetto/conf/conf-notes.txt               |  3 +++
>  yocto-poky/scripts/runqemu                                   |  9 ++++++=
---
>  yocto-poky/scripts/runqemu-internal                          | 12 ++++++=
++++++
>  3 files changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/=
conf/conf-notes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-pa=
lmetto/conf/conf-notes.txt
> index 9b3c01a..24bfffe 100644
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/co=
nf-notes.txt
> +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/co=
nf-notes.txt
> @@ -1,2 +1,5 @@
>  Common targets are:
>       obmc-phosphor-image
> +
> +You can also run generated images with qemu:
> +     runqemu palmetto
> diff --git a/yocto-poky/scripts/runqemu b/yocto-poky/scripts/runqemu
> index 23cf5be..f09da50 100755
> --- a/yocto-poky/scripts/runqemu
> +++ b/yocto-poky/scripts/runqemu
> @@ -110,7 +110,7 @@ while true; do
>      arg=3D${1}
>      case "$arg" in
>          "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" =
| "qemumipsel" | \
> -        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemu=
zynq")
> +        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemu=
zynq" | "palmetto")
>              [ -z "$MACHINE" ] && MACHINE=3D$arg || \
>                  error "conflicting MACHINE types [$MACHINE] and [$arg]"
>              ;;
> @@ -236,13 +236,13 @@ fi
> =20
>  if [ -z "$MACHINE" ]; then
>      if [ "x$FSTYPE" =3D "xvmdk" ] || [ "x$FSTYPE" =3D "xhddimg" ] || [ "=
x$FSTYPE" =3D "xhdddirect" ]; then
> -        MACHINE=3D`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qem=
uarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
> +        MACHINE=3D`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qem=
uarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4|palmetto\).*/\1/p'`
>          if [ -z "$MACHINE" ]; then
>              error "Unable to set MACHINE from image filename [$VM]"
>          fi
>          echo "Set MACHINE to [$MACHINE] based on image [$VM]"
>      else
> -        MACHINE=3D`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\=
|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
> +        MACHINE=3D`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\=
|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4|palmetto\).*/\1=
/p'`
>          if [ -z "$MACHINE" ]; then
>              error "Unable to set MACHINE from kernel filename [$KERNEL]"
>          fi
> @@ -332,6 +332,9 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=3Dcpio
>  QEMUZYNQ_DEFAULT_KERNEL=3DuImage
>  QEMUZYNQ_DEFAULT_FSTYPE=3Dcpio
> =20
> +PALMETTO_DEFAULT_KERNEL=3DcuImage
> +PALMETTO_DEFAULT_FSTYPE=3Dcpio.gz
> +
>  AKITA_DEFAULT_KERNEL=3DzImage-akita.bin
>  AKITA_DEFAULT_FSTYPE=3Djffs2
> =20
> diff --git a/yocto-poky/scripts/runqemu-internal b/yocto-poky/scripts/run=
qemu-internal
> index 1527268..479d61c 100755
> --- a/yocto-poky/scripts/runqemu-internal
> +++ b/yocto-poky/scripts/runqemu-internal
> @@ -53,6 +53,9 @@ else
>          "qemuarm64")
>              mem_size=3D512
>              ;;
> +        "palmetto")
> +            mem_size=3D512
> +            ;;
>          "qemumicroblaze")
>              mem_size=3D64
>              ;;
> @@ -295,6 +298,7 @@ fi
> =20
>  case "$MACHINE" in
>      "qemuarm") ;;
> +    "palmetto") ;;
>      "qemuarm64") ;;
>      "qemumicroblaze") ;;
>      "qemumips") ;;
> @@ -384,6 +388,14 @@ if [ "$MACHINE" =3D "qemuarm" -o "$MACHINE" =3D "qem=
uarmv6" -o "$MACHINE" =3D "qemuarm
>      fi
>  fi
> =20
> +if [ "$MACHINE" =3D "palmetto" ]; then
> +    QEMU=3Dqemu-system-arm
> +    MACHINE_SUBTYPE=3Dpalmetto-bmc
> +    export QEMU_AUDIO_DRV=3D"none"
> +    KERNCMDLINE=3D"console=3DttyS4"
> +    QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -initrd $ROOT=
FS -no-reboot -nographic"
> +fi
> +
>  if [ "$MACHINE" =3D "qemuarm64" ]; then
>      QEMU=3Dqemu-system-aarch64
> =20
> --=20
> 2.5.0
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--YhFoJY/gx7awiIuK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXOirZAAoJEKsDR8wtAMEZacEP/0OhOH/uRbfZeoPn5varB1vI
UhprS8cfEWyY0Es034P3Qj5NJr/B2p1d0E5UaKSbYhzeGW2l//PuSMtsicDJCEzM
yLP123LcFRUDRdE7U/PVPinlFddG7o/z8s5mJ9l4UzVptn31faRYj0kVpa4OFfQi
96S8SNau6eLEl8p5icHTnjZVa478DATZ0s8DF5kLmXKvYp/Gun3hINtcMNhYTYhg
5IJ9NnQPkwAuHJxyzAx8Yky2fHoFU5d9F5nRfGadf/wYdmUS/tYvYtFubhSWetud
DD6XfH+daLVKBSqnsHpKm9VzuQDG5nOMbtohx5cQW+EyT+ul4Q3ZrguYL3fPCFH7
d3h530h23Ovw9u5bAGTp9T2d021Ozh+8sNX737tAc8b58ah1Xtf245rCdSKP2cc/
8UXOzbiBfllMasRToXqBLaM9XxCYBwsff9WZVX9UCQ/PxLyTy86oYq0VbB1kWJsE
xPybpYCcwxbCjl6W1QqXEE2U1gKTtjOh9ertn/Qwy1cVqRrA27SQ3MRYoF7WAAtc
QFvi8hH2+FMsGSo0JeA0Z6bgaX7GZp9NR0RJdyK9WZOgLcSsal8cdtuYHuUGSomR
AuZKXDWMaH8XVnSx7KNxCJ/VHu9LW/eZ3jKqX8rfg9DEE1vGYbTEGcMPXQgNV/rT
t1nX1xjW+ooiQnOErBUN
=DAr3
-----END PGP SIGNATURE-----

--YhFoJY/gx7awiIuK--
