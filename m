Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7sKK2jmMzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 06:20:37 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1463430030811602.4214029038069;
 Mon, 16 May 2016 13:20:30 -0700 (PDT)
Date: Mon, 16 May 2016 15:20:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: [RFC PATCH openbmc v3 8/8] runqemu-internal: Configure tun/tap
 network for palmetto-bmc
Message-ID: <20160516202028.GL19968@asimov.austin.ibm.com>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
 <1458720215-25302-9-git-send-email-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Pz0BBB9QxoYXlT+x"
Content-Disposition: inline
In-Reply-To: <1458720215-25302-9-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 16 May 2016 20:20:38 -0000


--Pz0BBB9QxoYXlT+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 06:33:35PM +1030, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  yocto-poky/scripts/runqemu-internal | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/yocto-poky/scripts/runqemu-internal b/yocto-poky/scripts/run=
qemu-internal
> index f461e9f..bdaea01 100755
> --- a/yocto-poky/scripts/runqemu-internal
> +++ b/yocto-poky/scripts/runqemu-internal
> @@ -392,7 +392,10 @@ if [ "$MACHINE" =3D "palmetto" ]; then
>      QEMU=3Dqemu-system-arm
>      MACHINE_SUBTYPE=3Dpalmetto-bmc
>      export QEMU_AUDIO_DRV=3D"none"
> -    KERNCMDLINE=3D"console=3DttyS4"
> +    if [ "$SLIRP_ENABLED" !=3D "yes" ]; then
> +        KERNEL_NETWORK_CMD=3D${KERNEL_NETWORK_CMD}"::eth0"
> +    fi
> +    KERNCMDLINE=3D"console=3DttyS4 $KERNEL_NETWORK_CMD mem=3D$QEMU_MEMOR=
Y highres=3Doff"

Lots of stuff that is "palmetto" specific shoved in to the
runqemu-internal.  I think we need to propose a way to upstream to add
machine-specific gorp in here from the meta layer.

>      KERNELDTB=3D${DEPLOY_DIR_IMAGE}/${PALMETTO_DEFAULT_KERNEL}-aspeed-bm=
c-opp-qemu${MACHINE}.dtb
>      QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -dtb $KERNELD=
TB -initrd $ROOTFS -no-reboot -nographic"
>  fi
> --=20
> 2.5.0
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--Pz0BBB9QxoYXlT+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXOiuMAAoJEKsDR8wtAMEZd0EP/RXpldgO5Bk3OHTcRqslpgN4
9BNq9mWGIBM6dl2zEVyUrVeGvUpgStvynZpOug+231yQ3tTaYY9O8tEOFfE+U5jz
NoaZMFgbOoANY7aKwRwDSNl3e8p3KMIVYYP6Z3iwrTS0nnLw7fmsdUxDtXrVo4NP
iNznuk6yXJlrb91QjkV6UM6XSFHBsuoAV3FoIgZyfy/PGIJpb3wiPan4GlZbLipM
hIywV58CrIoFyPKedyFXAdCzT01SC2xfc37X+qRWA6dZJh4qCmjOekFWqMg/4wWc
Im7TNZ3M0O0oxtbJf9gLE8jaiNVeo7wgfchdF2BnsZ/0iqZh9cl+ds3wENgGye/l
z2ebn8o3Ewwn1xmAPLEUuV81jrSj9sez2U5IwPTnaCg8gJkeBi5cqcvRzhEYltVy
RFaIh2GbW5E01Xip/XcPOJnnRn2ByTX7ftsKTIUtag8cc0Vg5elsGrOZbukNxeRz
N6v49mr0x0bbKb9rpgK9m/LYnAizqABQ154CKTKj1T24OvmhimRRhoR64qVENPVC
YOOuAmN7L5D10i0mc3Kd56n/s4myhxa7vwMsmf/Ch3c1U285lYIet0GR0LTzo8Bm
lORAAg+xLR4CiFXyEIzc1nUhMJVPinzqAixpy3UVzXKUMGNCwfAB2eADU+kn4Z/Z
TEFp6Dksfe2jGkbP+fVM
=8MfS
-----END PGP SIGNATURE-----

--Pz0BBB9QxoYXlT+x--
