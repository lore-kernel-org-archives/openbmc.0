Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7sHp6j15zDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 06:19:18 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1463429954230203.15615794515566;
 Mon, 16 May 2016 13:19:14 -0700 (PDT)
Date: Mon, 16 May 2016 15:19:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: [RFC PATCH openbmc v3 7/8] palmetto: Build devicetrees for
 hardware and QEMU
Message-ID: <20160516201911.GK19968@asimov.austin.ibm.com>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
 <1458720215-25302-8-git-send-email-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iSeZnk6FyAS3EJ1y"
Content-Disposition: inline
In-Reply-To: <1458720215-25302-8-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 16 May 2016 20:19:19 -0000


--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 06:33:34PM +1030, Andrew Jeffery wrote:
> Using a separate devicetree for QEMU allows us to integrate existing
> models for hardware features, compromising on accuracy but hopefully
> providing a net benefit by reducing development time.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf   |=
 1 +
>  yocto-poky/scripts/runqemu-internal                                    |=
 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/=
conf/machine/palmetto.conf b/meta-openbmc-machines/meta-openpower/meta-ibm/=
meta-palmetto/conf/machine/palmetto.conf
> index f6256a7..d41127d 100644
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/ma=
chine/palmetto.conf
> +++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/ma=
chine/palmetto.conf
> @@ -1,5 +1,6 @@
>  KMACHINE =3D "aspeed"
>  KERNEL_DEVICETREE =3D "${KMACHINE}-bmc-opp-${MACHINE}.dtb"
> +KERNEL_DEVICETREE +=3D "${KMACHINE}-bmc-opp-qemu${MACHINE}.dtb"
> =20
>  require conf/machine/include/ast2400.inc
>  require conf/machine/include/obmc-bsp-common.inc
> diff --git a/yocto-poky/scripts/runqemu-internal b/yocto-poky/scripts/run=
qemu-internal
> index 479d61c..f461e9f 100755
> --- a/yocto-poky/scripts/runqemu-internal
> +++ b/yocto-poky/scripts/runqemu-internal
> @@ -393,7 +393,8 @@ if [ "$MACHINE" =3D "palmetto" ]; then
>      MACHINE_SUBTYPE=3Dpalmetto-bmc
>      export QEMU_AUDIO_DRV=3D"none"
>      KERNCMDLINE=3D"console=3DttyS4"
> -    QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -initrd $ROOT=
FS -no-reboot -nographic"
> +    KERNELDTB=3D${DEPLOY_DIR_IMAGE}/${PALMETTO_DEFAULT_KERNEL}-aspeed-bm=
c-opp-qemu${MACHINE}.dtb
> +    QEMUOPTIONS=3D"$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -dtb $KERNELD=
TB -initrd $ROOTFS -no-reboot -nographic"

Need to find a way to do this generically as well.

>  fi
> =20
>  if [ "$MACHINE" =3D "qemuarm64" ]; then
> --=20
> 2.5.0
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXOis/AAoJEKsDR8wtAMEZLZQP/3SVk1MDvVdR4NImOkp9rMcS
zNvc48ybumTFDJ3DhLaBioGqG94YbHRW/d9gt9uGR09u0KkS0SMLt4gIQ3Sa0/X2
IDeEw32VZ5rM2UFlekLynWJC1g2k6V9Pqcthk6jB4VpXbKUZ+ci0VPSZ9BK30haQ
EgbdKjPxBtFGd2UphxrJ7aQZrrHsEOntd9uyE3IMqbRZqCF6LkxapIpPyOnS86pp
GlMc+jU5HQa7TgLIEfJpDT6B7StwDg0NZEqilmIRGNQ5VK0/TcTD/EL8VN6shz9t
p/sFR0ZsrPHwHiRPp9ZLb6IeIJxx/Z3Zj6uTBP2zWHiM/xCbCTQ0ReG9LO7913M2
auzHwFahE5kTQoPpfmTr3h8QLH5NApRRDD+IR2dW9A/lFy7AFRB5ncrZesjk1pn3
jpsGZgpJYIyPtWQUVGocy07b/Rug5sIor2A/UJezhhKMSo0Vm3y8ULsTcT1N27ZF
l4Uujeo5NCA8Clxj66eUJashsqOOIxgt57r6Mbqc4oAt0fx2eHUqPdMO2MyjBYio
WMXxtAqTvGX8bORO8KQvZwzzldfLZBNZnf4jbj4UgOfFf+WG6t6VbamblMLG2jn2
4T1vbZDQEJTmR6l3JGtrEq/eT5AWfCc5d8Uaq1MG52ik5DRVrWEoZofr5Rrmd0bt
U7LXeZAqyb09FtJf8fZc
=Rn1V
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--
