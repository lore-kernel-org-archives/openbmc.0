Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1973C1A0018
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 03:25:45 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH openbmc 1/7] obmc-initfs: minor updates
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <1454803221-12014-2-git-send-email-openbmc-patches@stwcx.xyz>
Date: Mon, 8 Feb 2016 11:25:42 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <83A3E7A3-FF91-41B5-B060-D668B617BD18@bwbmail.net>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454803221-12014-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 Feb 2016 16:25:47 -0000

Reviewed-by: Brad Bishop <brad@bwbmail.net>

> On Feb 6, 2016, at 7:00 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> In shutdown, Like init and update, cd to / to be clear the
> expected environment.  Although shorter names are not used, it
> prevents problems with unmounting filesystems, even if this is
> the normal state for a call of this script by systemd.  Also
> make a few paths absolute and don't follow symlinks in ln.
>=20
> In init, check the new init is an executable file with non-zero
> size in addition to the shell being executable with its shared
> libraries.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh       | 4 =
++--
> .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh   | 7 =
++++---
> 2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> index 0dc4c35..f0d8522 100644
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> @@ -69,9 +69,9 @@ mkdir -p $work
>=20
> mount -t overlay -o lowerdir=3D$rodir,upperdir=3D$upper,workdir=3D$work =
cow /root
>=20
> -if ! chroot /root /bin/sh -c exit
> +if ! chroot /root /bin/sh -c "test -x /sbin/init -a -s /sbin/init"
> then
> -	echo 'chroot test failed; invoking emergency shell.'
> +	echo "Change Root test failed!  Invoking emergency shell."
> 	PS1=3Drescue#\  sulogin
> fi
>=20
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> index cc076fd..c550e06 100644
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> @@ -5,10 +5,11 @@ echo shutdown: "$@"
> export PS1=3Dshutdown-sh#\=20
> # exec bin/sh
>=20
> +cd /
> if [ ! -e /proc/mounts ]
> then
> 	mkdir -p /proc
> -	mount  proc proc -tproc
> +	mount  proc /proc -tproc
> 	umount_proc=3D1
> else
> 	umount_proc=3D
> @@ -27,10 +28,10 @@ set +x
> if test -s /run/fw_env -a -c /run/mtd:u-boot-env -a ! -e =
/image-u-boot-env &&
> 	! cmp /run/mtd:u-boot-env /run/fw_env
> then
> -	ln -s /run/fw_env /image-u-boot-env
> +	ln -sn /run/fw_env /image-u-boot-env
> fi
>=20
> -if test -x /update && ls image-* > /dev/null 2>&1
> +if test -x /update && ls /image-* > /dev/null 2>&1
> then
> 	exec /update ${1+"$@"}
> fi
> --=20
> 2.6.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
