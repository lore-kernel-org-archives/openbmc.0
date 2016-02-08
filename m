Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479B21A0018
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 03:37:38 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH openbmc 3/7] obmc-initfs: use varables for paths and mount
 arguments
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <1454803221-12014-4-git-send-email-openbmc-patches@stwcx.xyz>
Date: Mon, 8 Feb 2016 11:37:35 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <86DB8BF7-3062-4E9E-B339-1BC9A5F21DA9@bwbmail.net>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454803221-12014-4-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 Feb 2016 16:37:38 -0000

Reviewed-by: Brad Bishop <brad@bwbmail.net>

> On Feb 6, 2016, at 7:00 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> Create variables for all mount parameters and paths related to
> the read-only and read-write mounts, including fs type, full
> device name, and options.  Reorder mount arguments to always
> place options last.
>=20
> Also add variables for update save directory and real init.
>=20
> This allows easy testing of a file systems by changing a few
> parameters including making the rofs an image in ram.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> .../obmc-phosphor-initfs/files/obmc-init.sh        | 22 =
++++++++++-----
> .../obmc-phosphor-initfs/files/obmc-update.sh      | 32 =
++++++++++++----------
> 2 files changed, 33 insertions(+), 21 deletions(-)
>=20
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> index f0d8522..0109925 100644
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-in=
it.sh
> @@ -1,12 +1,13 @@
> #!/bin/sh
>=20
> +fslist=3D"proc sys dev run"
> rodir=3Drun/initramfs/ro
> rwdir=3Drun/initramfs/rw
> upper=3D$rwdir/cow
> work=3D$rwdir/work
>=20
> cd /
> -mkdir -p sys proc dev run
> +mkdir -p $fslist
> mount dev dev -tdevtmpfs
> mount sys sys -tsysfs
> mount proc proc -tproc
> @@ -39,13 +40,20 @@ fi
> rofs=3D$(findmtd rofs)
> rwfs=3D$(findmtd rwfs)
>=20
> +rodev=3D/dev/mtdblock${rofs#mtd}
> +rwdev=3D/dev/mtdblock${rwfs#mtd}
> +
> rofst=3Dsquashfs
> rwfst=3Dext4
> +roopts=3Dro
> +rwopts=3Drw
> +
> +init=3D/sbin/init
>=20
> echo rofs =3D $rofs $rofst   rwfs =3D $rwfs $rwfst
>=20
> if grep -w debug-init-sh /proc/cmdline ||
> -	! mount -o rw /dev/mtdblock${rwfs#mtd} $rwdir -t $rwfst
> +	! mount $rwdev $rwdir -t $rwfst -o $rwopts
> then
> 	echo Please mount the rw file system on $rwdir from this shell
> 	while ! sulogin && ! test -f /takeover
> @@ -61,7 +69,7 @@ then
> 	exec /bin/sh
> fi
>=20
> -mount -o ro /dev/mtdblock${rofs#mtd} $rodir -t $rofst
> +mount $rodev $rodir -t $rofst -o $roopts
>=20
> rm -rf $work
> mkdir -p $upper
> @@ -69,17 +77,17 @@ mkdir -p $work
>=20
> mount -t overlay -o lowerdir=3D$rodir,upperdir=3D$upper,workdir=3D$work =
cow /root
>=20
> -if ! chroot /root /bin/sh -c "test -x /sbin/init -a -s /sbin/init"
> +if ! chroot /root /bin/sh -c "test -x '$init' -a -s '$init'"
> then
> 	echo "Change Root test failed!  Invoking emergency shell."
> 	PS1=3Drescue#\  sulogin
> fi
>=20
> -for f in sys dev proc run
> +for f in $fslist
> do
> 	mount --move $f root/$f
> done
>=20
> -# switch_root /root /sbin/init
> -exec chroot /root /sbin/init
> +# switch_root /root $init
> +exec chroot /root $init
>=20
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh
> index f83b1ad..ec4a769 100755
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh
> @@ -35,30 +35,35 @@ findmtd() {
> 	echo $m
> }
>=20
> -rofs=3D$(findmtd rofs)
> rwfs=3D$(findmtd rwfs)
>=20
> -rofst=3Dsquahsfs
> +rwdev=3D/dev/mtdblock${rwfs#mtd}
> rwfst=3Dext4
> +rwopts=3Drw
> +rorwopts=3Dro${rwopts#rw}
> +
> +rwdir=3Drw
> +upper=3D$rwdir/cow
> +save=3Dsave/${upper##*/}
>=20
> if test -n "$rwfs" && test -s whitelist
> then
>=20
> -	mkdir -p rw
> -	mount /dev/mtdblock${rwfs#mtd} rw -oro -t $rwfst
> +	mkdir -p $rwdir
> +	mount $rwdev $rwdir -t $rwfst -o $rorwopts
>=20
> 	while read f
> 	do
> -		if ! test -e rw/cow/$f
> +		if ! test -e $upper/$f
> 		then
> 			continue
> 		fi
> -		d=3D"save/cow/$f"
> +		d=3D"$save/$f"
> 		mkdir -p "${d%/*}"
> -		cp -rp rw/cow/$f "${d%/*}/"
> +		cp -rp $upper/$f "${d%/*}/"
> 	done < whitelist
>=20
> -	umount rw
> +	umount $rwdir
> fi
>=20
> image=3D/run/initramfs/image-
> @@ -67,7 +72,7 @@ do
> 	m=3D$(findmtd ${f#$image})
> 	if test -z "$m"
> 	then
> -		echo 1>&2  "Unable to find mtd partiton for $f"
> +		echo 1>&2  "Unable to find mtd partiton for ${f##*/}."
> 		exec /bin/sh
> 	fi
> done
> @@ -80,12 +85,11 @@ do
> 	flashcp -v $f /dev/$m
> done
>=20
> -
> -if test -d save/cow
> +if test -d $save
> then
> -	mount /dev/mtdblock${rwfs#mtd} rw -o rw -t $rwfst
> -	cp -rp save/cow/. rw/cow/
> -	umount rw
> +	mount $rwdev rw -t $rwfst -o rw
> +	cp -rp $save/. $upper/
> +	umount $rwdir
> fi
>=20
> # Execute the command systemd told us to ...
> --=20
> 2.6.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
