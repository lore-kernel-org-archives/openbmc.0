Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbDLv45TqzDql5
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 06:57:59 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1466715473820211.25208327578673;
 Thu, 23 Jun 2016 13:57:53 -0700 (PDT)
Date: Thu, 23 Jun 2016 15:57:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc v5 00/11] Phosphor changes needed for Yocto 2.1
Message-ID: <20160623205752.GF20922@asimov.austin.ibm.com>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5Mfx4RzfBqgnTE/w"
Content-Disposition: inline
In-Reply-To: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Thu, 23 Jun 2016 20:58:00 -0000


--5Mfx4RzfBqgnTE/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

These two pull requests are both ready for a complete review.  We have
Yocto 2.1 working now on hardware and qemu.

https://github.com/openbmc/openbmc/pull/397
https://github.com/openbmc/openbmc/pull/396

On Thu, Jun 23, 2016 at 03:40:22PM -0500, OpenBMC Patches wrote:
>=20
>=20
> <!-- Reviewable:start -->
> This change is [<img src=3D"https://reviewable.io/review_button.svg" heig=
ht=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>](https://reviewable.io/r=
eviews/openbmc/openbmc/397)
> <!-- Reviewable:end -->
>=20
>=20
> https://github.com/openbmc/openbmc/pull/397
>=20
> Brad Bishop (1):
>   Fix systemd packageconfig
>=20
> Patrick Williams (10):
>   meta-phosphor: Use obmc-phosphor-event for qemu systems
>   meta-phosphor: use obmc-phosphor-user for qemu systems
>   meta-phosphor: Remove unused systemd patch
>   meta-phosphor: Make image-overlay an optional feature
>   meta-phosphor: Ensure INITRAMFS_CTYPE defined
>   obmc-phosphor-image: Improper use of DATETIME
>   btbridged: Change how kernel-source depend is specified
>   u-boot-fw-utils: Update to latest version.
>   u-boot: Upgrade AST2400 machines to 2016.15 tree.
>   u-boot: Remove unused 2013.07 packages.
>=20
>  .../meta-ast2400/conf/machine/include/ast2400.inc  |    6 +-
>  ...013.07%.bbappend =3D> u-boot-fw-utils_%.bbappend} |    1 -
>  ...{u-boot_2013.07%.bbappend =3D> u-boot_%.bbappend} |    1 -
>  .../meta-firestone/conf/machine/firestone.conf     |    2 +-
>  .../meta-garrison/conf/machine/garrison.conf       |    2 +-
>  .../meta-palmetto/conf/machine/palmetto.conf       |    2 +-
>  .../meta-barreleye/conf/machine/barreleye.conf     |    2 +-
>  .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |    3 -
>  meta-phosphor/classes/obmc-phosphor-image.bbclass  |   15 +-
>  .../obmc-phosphor-image_types_uboot.bbclass        |    2 +
>  .../recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb  |   55 -
>  .../recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb  |    4 +-
>  .../common/recipes-bsp/u-boot/u-boot_2013.07.bb    |   23 -
>  .../common/recipes-bsp/u-boot/u-boot_2016.05.bb    |    4 +-
>  .../images/core-image-minimal-initramfs.bbappend   |    1 +
>  .../0100-systemd_networkd_dbus_setaddress.patch    | 1209 --------------=
------
>  .../common/recipes-core/systemd/systemd_%.bbappend |    4 +-
>  .../recipes-phosphor/host-ipmid/btbridged.bb       |    2 +-
>  .../conf/machine/include/obmc-bsp-common.inc       |    2 +-
>  meta-phosphor/conf/machine/include/sample.inc      |    4 +-
>  20 files changed, 29 insertions(+), 1315 deletions(-)
>  rename meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/{u-b=
oot-fw-utils_2013.07%.bbappend =3D> u-boot-fw-utils_%.bbappend} (90%)
>  rename meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/{u-b=
oot_2013.07%.bbappend =3D> u-boot_%.bbappend} (71%)
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/m=
eta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
>  delete mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-uti=
ls_2013.07.bb
>  delete mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.0=
7.bb
>  delete mode 100644 meta-phosphor/common/recipes-core/systemd/systemd/010=
0-systemd_networkd_dbus_setaddress.patch
>=20
> --=20
> 2.9.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--5Mfx4RzfBqgnTE/w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXbE1QAAoJEKsDR8wtAMEZeiAP/iHtj4Sfw1LVJ8ZOuex7UURB
Vt/VKQwcx0246sSuyjpihzgwKhkF4NVl+EHn4R1cDRH/Trz3gipcHGHqK6pxh4Ra
qDehTgJiDxg5mIBkPdD6lXSoP/2R93U/vzFvDcnvS5M38lrfPHiMfyqpAmSQfS0p
oBkaSHJCfnaFJR0tMP/TyDk9QqJRchGQbGFKkMLlSiN91tukKMPgF6Y7lER9TZsA
JUsatOmWLl5Jz1fEG3DFaK96GoFnQrHlORV/2FJ9MITcDqT+gt8cYTzAXf5Phc+U
IENMq0Tlqil0tVvqty/zY9H5OaEMzWMaM8FSeoPGSwjb12S30UbTJet7jD3aB6+N
9fU48x19zshq0psO7KqR7gp5oWjwzn/dA2EGblvP7SbLV7yoDNs95vA2EPDTpamP
8i9C3grhURVKexPhtc85nUlFN1SoSGzob11izon/n78yh8mzSeST0cB0VAWDCI3X
F1mKJE/l34AZwcvk+knHG9tI4klsXW9ojgH/ieF6enT3SOHsAOL8jTiIP7LHQiBE
Yln4tzcIjNDkX73k/9Ox/HGSwGUccogTOz9Im/2MSAFrNJ6JCzVOpd9J74QSAHLu
J8nm5gbNsDcNopwb79VCNIH3KC47tR3TupS3p2FgLdqAzYSbGX4tCeCADG1EliDi
H+aTZ/O8ILQrrtvmYnnN
=K0sp
-----END PGP SIGNATURE-----

--5Mfx4RzfBqgnTE/w--
