Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CD8E41A08EF
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 23:55:48 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144500014506068.91579914478189;
 Fri, 16 Oct 2015 05:55:45 -0700 (PDT)
Date: Fri, 16 Oct 2015 07:55:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc 1/2] linux-obmc: Remove unnecessary config patches
Message-ID: <20151016125541.GB13316@asimov.austin.ibm.com>
References: <1444998046-17813-1-git-send-email-patches@stwcx.xyz>
 <1444998046-17813-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <1444998046-17813-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_0
X-ZohoMail-Owner: <20151016125541.GB13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
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
X-List-Received-Date: Fri, 16 Oct 2015 12:55:50 -0000


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2015 at 07:20:45AM -0500, OpenBMC Patches wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
>=20
> These are both present in the current linux tree.
>=20
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>  .../recipes-kernel/linux/linux-obmc/initrd-source.patch       | 11 -----=
------
>  .../common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch |  8 -----=
---
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb   |  1 -
>  3 files changed, 20 deletions(-)
>  delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/=
initrd-source.patch
>  delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/=
systemd-reqs.patch
>=20
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-=
source.patch b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-=
source.patch
> deleted file mode 100644
> index a685df5..0000000
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-source.=
patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> ---- a/arch/arm/configs/aspeed_defconfig
> -+++ b/arch/arm/configs/aspeed_defconfig
> -@@ -6,7 +6,7 @@ CONFIG_SYSVIPC=3Dy
> - CONFIG_IRQ_DOMAIN_DEBUG=3Dy
> - CONFIG_LOG_BUF_SHIFT=3D14
> - CONFIG_BLK_DEV_INITRD=3Dy
> --CONFIG_INITRAMFS_SOURCE=3D"~/ibm/openbmc/buildroot-arm-rootfs.cpio.gz"
> -+CONFIG_INITRAMFS_SOURCE=3D""
> - CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> - CONFIG_KALLSYMS_ALL=3Dy
> - CONFIG_EMBEDDED=3Dy
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd=
-reqs.patch b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-=
reqs.patch
> deleted file mode 100644
> index f6530d7..0000000
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-reqs.p=
atch
> +++ /dev/null
> @@ -1,8 +0,0 @@
> ---- a/arch/arm/configs/aspeed_defconfig
> -+++ b/arch/arm/configs/aspeed_defconfig
> -@@ -192,3 +192,5 @@ CONFIG_CRYPTO_GHASH=3Dy
> - # CONFIG_CRYPTO_HW is not set
> - CONFIG_CRC_CCITT=3Dy
> - CONFIG_AVERAGE=3Dy
> -+CONFIG_CGROUPS=3Dy
> -+CONFIG_FHANDLE=3Dy
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb =
b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
> index b38d1a8..3e5bc94 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
> @@ -5,7 +5,6 @@ LICENSE =3D "GPLv2"
>  KBRANCH ?=3D "dev"
> =20
>  SRC_URI =3D "git://github.com/openbmc/linux;protocol=3Dgit;branch=3D${KB=
RANCH}"
> -SRC_URI +=3D "file://systemd-reqs.patch file://initrd-source.patch"
>  SRC_URI +=3D "file://obmc-bsp.scc \
>              file://obmc-bsp.cfg \
>              file://obmc-bsp-user-config.cfg \
> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

I thought about this after I merged this set.

You removed the systemd config options because they are added to the
defconfig.  Are those generally enabled in defconfigs?

If we want to use a common kernel tree for both aspeed hardware and qemu
then it seems like we would want this as a software-determined config
option outside of the kernel so that we can apply it onto any
hardware-target defconfig.

If that is so, it seems to me we should add that config snippet back
here and remove it from the aspeed_defconfig in kernel.
--=20
Patrick Williams

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWIPPNAAoJEKsDR8wtAMEZ7gQP/23NjssFU67cOwzF2BELya0F
AHQfzWpJha1oD8Wa5+7BK9iZunAFVfFp7AU0vCPF+kYHLasCJtFchslUn0ODmeYz
V/nFOA7jKEqpCnXEZs/znQK79hQ1MzwDdAEnDCcG4F3QVZXoJluC83XqoFSoimCK
B5sKUWHJTExo5i3HXk7uCu1xjVGxLqdV8DW6yqI2COhDJiTy5TTbDJCU6Zajhbny
Udzq++Khp9CBGQn3CYx6g2O2E3jkj5WsR2iV0A1gdOI9N9DxY8HjSBXF9GfPpyt3
OIaBc1y4kvbzi2ggxhhMtDKfIzJnykuMLAO6H41gvrhIGRJ58/V8QobBJvn0Rd4f
9GXotc5O4UHju1saShPARQkJMIS2TXK9wnaC0YxPoH95Hhm8qe7FDVGmhW1QidYW
COMLl1uBHFBr75cKAONwB+3CIFaQn8ku2Y++sEt4rk+V4lRiSFI6QEP5tZPtSxUo
hz20ciGCaApljgnOEJy3iqDB9JSx7tS4IB7vQPkGhMqO697TLmf2oOYwS2VfaQxT
IuTJMastQ9emVvsG2wkSDAVnsRVKQsUAScVecUy2pdVXsFOnTGbVBq07qSSGYa/L
6IkRo7CYlcL+vaJ/1fmCLNRIQa1Jn+Z/M1ghCeE1wS0+GF0kXOHJeWABU4tJd6Jl
QP/XSOFhiDnUkG0zY9WL
=rYgG
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
