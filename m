Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 442 seconds by postgrey-1.35 at bilbo;
 Tue, 09 Feb 2016 03:33:21 AEDT
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AA1F61A02C1
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 03:33:20 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH openbmc 2/7] obmc-initfs: look for images in
 /run/initramfs/image-
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1454803221-12014-3-git-send-email-openbmc-patches@stwcx.xyz>
Date: Mon, 8 Feb 2016 11:25:54 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F7D89AD-A56B-4AC3-B20A-81038EA239AB@fuzziesquirrel.com>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454803221-12014-3-git-send-email-openbmc-patches@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 Feb 2016 16:33:22 -0000

Reviewed-by: Brad Bishop <brad@bwbmail.net>

> On Feb 6, 2016, at 7:00 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> Teach update to look for /run/initramfs/image- not /image-*.
>=20
> When describing how to recover from a corrupted flash by grabbing
> the images and running update from the init debug shell, it
> became aparent that while at systemd shutdown /run/initramfs/
> is mounted at /, it is not the case during init.  Use variable
> image to hold this pathname.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> .../obmc-phosphor-initfs/files/obmc-shutdown.sh              |  7 =
++++---
> .../obmc-phosphor-initfs/files/obmc-update.sh                | 12 =
++++++------
> 2 files changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> index c550e06..d530265 100644
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> @@ -25,13 +25,14 @@ do
> done
> set +x
>=20
> -if test -s /run/fw_env -a -c /run/mtd:u-boot-env -a ! -e =
/image-u-boot-env &&
> +image=3D/run/initramfs/image-
> +if test -s /run/fw_env -a -c /run/mtd:u-boot-env -a ! -e =
${image}u-boot-env &&
> 	! cmp /run/mtd:u-boot-env /run/fw_env
> then
> -	ln -sn /run/fw_env /image-u-boot-env
> +	ln -sn /run/fw_env ${image}u-boot-env
> fi
>=20
> -if test -x /update && ls /image-* > /dev/null 2>&1
> +if test -x /update && ls $image* > /dev/null 2>&1
> then
> 	exec /update ${1+"$@"}
> fi
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh
> index 1122e83..f83b1ad 100755
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh
> @@ -61,10 +61,10 @@ then
> 	umount rw
> fi
>=20
> -
> -for f in image-*
> +image=3D/run/initramfs/image-
> +for f in $image*
> do
> -	m=3D$(findmtd ${f#image-})
> +	m=3D$(findmtd ${f#$image})
> 	if test -z "$m"
> 	then
> 		echo 1>&2  "Unable to find mtd partiton for $f"
> @@ -72,10 +72,10 @@ do
> 	fi
> done
>=20
> -for f in image-*
> +for f in $image*
> do
> -	m=3D$(findmtd ${f#image-})
> -	echo "Updating ${f#image-}"
> +	m=3D$(findmtd ${f#$image})
> +	echo "Updating ${f#$image}..."
> 	# flasheraseall /dev/$m && dd if=3D$f of=3D/dev/$m
> 	flashcp -v $f /dev/$m
> done
> --=20
> 2.6.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
