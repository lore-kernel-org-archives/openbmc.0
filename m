Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 50AB11A0018
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 04:06:03 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Subject: Re: [PATCH openbmc 6/7] obmc-initfs: run update as a sub-script
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <1454803221-12014-7-git-send-email-openbmc-patches@stwcx.xyz>
Date: Mon, 8 Feb 2016 12:05:59 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <777CA4D1-661C-4881-8924-BC9A0FAE1597@bwbmail.net>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454803221-12014-7-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 Feb 2016 17:06:03 -0000

Reviewed-by: Brad Bishop <brad@bwbmail.net>

> On Feb 6, 2016, at 7:00 PM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Milton Miller <miltonm@us.ibm.com>
>=20
> The update script has replicated logic to do the final reboot, kexec,
> halt, or poweroff command.  Instead of transferring control via exec
> just call it as a normal command, and return to shutdown for the
> final mounted fs debug print and command.
>=20
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
> .../obmc-phosphor-initfs/files/obmc-shutdown.sh           |  3 +--
> .../obmc-phosphor-initfs/files/obmc-update.sh             | 15 =
++++-----------
> 2 files changed, 5 insertions(+), 13 deletions(-)
>=20
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> index d530265..7d1157a 100644
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-sh=
utdown.sh
> @@ -34,7 +34,7 @@ fi
>=20
> if test -x /update && ls $image* > /dev/null 2>&1
> then
> -	exec /update ${1+"$@"}
> +	/update ${1+"$@"}
> fi
>=20
> echo Remaining mounts:
> @@ -43,7 +43,6 @@ cat /proc/mounts
> test "umount_proc" && umount /proc && rmdir /proc
>=20
>=20
> -
> # Execute the command systemd told us to ...
> if test -d /oldroot  && test "$1"
> then
> diff --git =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh
> index ec4a769..3cf6bc3 100755
> --- =
a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh
> +++ =
b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-up=
date.sh
> @@ -92,19 +92,12 @@ then
> 	umount $rwdir
> fi
>=20
> -# Execute the command systemd told us to ...
> -if test -d /oldroot && test -x "/sbin/$1" && test -f "/sbin/$1"
> -then
> -	if test "$1" =3D=3D kexec
> -	then
> -		/sbin/$1 -f -e
> -	else
> -		/sbin/$1 -f
> -	fi
> -fi
> +exit
>=20
> +# NOT REACHED without edit
> +# NOT REACHED without edit
>=20
> -echo "Execute ${1-reboot} -f if all is ok"
> +echo "Flash completed.  Inspect, cleanup and reboot -f to continue."
>=20
> export PS1=3Dupdate-sh#\=20
> exec /bin/sh
> --=20
> 2.6.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
