Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQv7K507XzDq6W
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 03:33:49 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1458232128254711.6476245801977;
 Thu, 17 Mar 2016 09:28:48 -0700 (PDT)
Date: Thu, 17 Mar 2016 11:28:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] runqemu: Add palmetto target
Message-ID: <20160317162845.GB6045@asimov.austin.ibm.com>
References: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
 <1458190368-24002-2-git-send-email-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline
In-Reply-To: <1458190368-24002-2-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 17 Mar 2016 16:33:50 -0000


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2016 at 03:22:48PM +1030, Andrew Jeffery wrote:
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

It seems like there should be a way to extend the machines in runqemu
without modifying the script.  Maybe an environment variable like
"palmetto_SUPPORTS_QEMU=3D1" that we can set in one of the bitbake machine
files for each machine?

Might want to bounce this problem off of #yocto on IRC.

> +PALMETTO_DEFAULT_KERNEL=3DcuImage
> +PALMETTO_DEFAULT_FSTYPE=3Dcpio.gz

Also ideally have these come from a bitbake file.

> +        "palmetto")
> +            mem_size=3D512
> +            ;;

> +if [ "$MACHINE" =3D "palmetto" ]; then
> +    QEMU=3Dqemu-system-arm
> +    MACHINE_SUBTYPE=3Dpalmetto-bmc
> +    export QEMU_AUDIO_DRV=3D"none"
> +    KERNCMDLINE=3D"console=3DttyS4"
> +    QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -initrd $ROOT=
FS -no-reboot -nographic"
> +fi
> +

Would be nice if this stuff was also in a bitbake file of sorts.  Would
really be nice if we could leverage the machine classes (palmetto is-a
openpower) to reduce the redundancy.

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

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW6ts9AAoJEKsDR8wtAMEZtn0P/iKnxx8QzjRgg8mcj9HSBrIR
nNuYnMUpgFD/YCdPf9LxbEOlCx9xTaXhQ7uS4j9gx+vpptQd6at0eYeiBPUyjApu
10MDiTES0O1IDDtW2ENlOXgkmGjZdAjOvYm1j3V398r/WEQf8vtSAbULoM4kFUUN
R9NgD0SaNTDTAbtAkM4GEnSUCnfwtqOirijIlCk4UqM7ABc/w7NbPV6fx6pyuWbp
2J097OW9ZV4B18Zjf9MjiZkLZ9zUCIS8wBLX3KOQkocIcYC7eAru8KIKYw4XnR7m
gI7YioGF3FrL4fAaeRAEj0AT8AiXyk0k4m0OXQTpd4S/NzwcWaQYnSiowOxbTiO2
gGIPJgFvQgu9QBDK8o1rF/FIG0vwDX3D4b2xko9LqhPUCKe9gukwWLatdfGKf9g7
LpR7vOVTGH1szngQXVJduEk9bG7IdxUxTooMMtQ7Zqt5zUJ5XpDgofey5cOEAWMj
pVyJUaV4pELV6Hg6uxGR4zoTzQr1M/Zt68OIkPGGpoVogCceObXs9coBbfw+zNeV
eOjSZm1G5jHieqO/QuWWqOvI4sknIwVuoK7z0et4HtpL9NrOkRPbjUUkFld0+Pt8
LZiaAdgDgNaCjTAuhqmjdGB/2sqoqINAO/qQeW1aEOvs4DlFv8ES7cHJC+7BM18w
4TTQWQXLikQekTgFUXWT
=EEJt
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
