Return-Path: <miltonm@us.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 291201A0038
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 11:11:09 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 15 Feb 2016 19:11:07 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 15 Feb 2016 19:11:04 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 8898038C8039
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2016 19:11:03 -0500 (EST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1G0B3CZ27394136
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 00:11:03 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1G07XIL021122
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2016 19:07:33 -0500
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1G07WS5021112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2016 19:07:33 -0500
Message-Id: <201602160007.u1G07WS5021112@d01av05.pok.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 15 Feb 2016 17:11:02 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 15 Feb 2016 17:10:59 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 16 Feb 2016 00:10:58 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 16 Feb 2016 00:10:57 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016021600122868-433115 ;
 Tue, 16 Feb 2016 00:12:28 +0000 
In-Reply-To: <1455522808-22864-2-git-send-email-andrew@aj.id.au>
Subject: Re: [RFC PATCH] openbmc: Use JFFS2 for RW overlay filesystem
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Date: Tue, 16 Feb 2016 00:10:56 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1455522808-22864-2-git-send-email-andrew@aj.id.au>,
 <1455522808-22864-1-git-send-email-andrew@aj.id.au>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02012016_FP2 February 05, 2016
X-LLNOutbound: False
X-Disclaimed: 30355
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16021600-0057-0000-0000-0000036E7328
X-IBM-ISS-SpamDetectors: Score=0.404685; BY=0.058006; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.404685; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004926; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000144; SDB=6.00660411; UDB=6.00300190; UTC=2016-02-16
 00:10:58
x-cbparentid: 16021600-5938-0000-0000-000001FD24DD
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
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
X-List-Received-Date: Tue, 16 Feb 2016 00:11:10 -0000

Hi Andrew.

You got ahead of me and explored some issues, thanks.  I wasn't thinking
about some of the details but I had plans for some others, and had been
manually changing the type on my own system (causing someone to re-flash
when it didn't boot for them.  cie la vie.


On  02/15/2016 around 01:54AM in some timezone,  Andrew Jeffery wrote:
> Subject: [RFC PATCH] openbmc: Use JFFS2 for RW overlay filesystem
>=20
> We can enable JFFS2 support on mtd6 (the RW mtd partition) with a
> (first-pass) kernel patch[1] applied to work-around a 'stutter' in the
> (optimised) ARM mmiocpy() implementation.

optimised is flagged in my spell checker.

>=20
> Whilst the original scripting surrounding the filesystem selection aimed
> to be generic, creating and mounting JFFS2 has some warts that seems to
> require special-case logic.

Or at least some versions of the tools think so :-)

>=20
> [1] Unmerged, but tested: https://lists.ozlabs.org/pipermail/openbmc/2016=
-February/001874.html
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> =C2=A0meta-phosphor/classes/image-overlay.bbclass =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A03 ++-
> =C2=A0meta-phosphor/classes/obmc-phosphor-image.bbclass =C2=A0| =C2=A02 ++
> =C2=A0.../obmc-phosphor-image=5Ftypes=5Fuboot.bbclass =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 12 ++++++++++--
> =C2=A0.../obmc-phosphor-initfs/files/obmc-init.sh =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 22 +++++++++++++++-------
> =C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh =C2=A0 =C2=A0 =C2=A0|=
 13 +++++++++----
> =C2=A05 files changed, 38 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta-phosphor/classes/image-overlay.bbclass b/meta-phosphor/=
classes/image-overlay.bbclass
> index 1c6137d..5043e82 100644
> --- a/meta-phosphor/classes/image-overlay.bbclass
> +++ b/meta-phosphor/classes/image-overlay.bbclass
> @@ -3,7 +3,8 @@ INITRD=5FIMAGE ?=3D "core-image-minimal-initramfs"
> =C2=A0INITRD ?=3D "${DEPLOY=5FDIR=5FIMAGE}/${INITRD=5FIMAGE}-${MACHINE}.c=
pio.${INITRD=5FCTYPE}${uboot}"
> =C2=A0
> =C2=A0IMAGE=5FBASETYPE ?=3D "squashfs-xz"
> -OVERLAY=5FBASETYPE ?=3D "ext4"
> +OVERLAY=5FBASETYPE ?=3D "jffs2"
> +OVERLAY=5FBASETYPE=5FOPTS ?=3D "--pagesize=3D4096 --little-endian --squa=
sh"
> =C2=A0

Lots of options on that mkfs.   Not sure what the --squash flag would be fo=
r.

> =C2=A0IMAGE=5FTYPES=5F${PN} +=3D "${IMAGE=5FBASETYPE}"
> =C2=A0
diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosp=
hor/classes/obmc-phosphor-image.bbclass
index 9a13f7f..8afa1ea 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -38,4 +38,6 @@ IMAGE=5FINSTALL +=3D " \
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0packagegroup-obmc-phosphor-apps-extras \
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c-tools \
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0screen \
+ =C2=A0 =C2=A0 =C2=A0 mtd-utils-jffs2 \
+ =C2=A0 =C2=A0 =C2=A0 mtd-utils-misc \
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0"

You say below that there is no fsck.jffs2, so why are you adding=20
mtd-utils instead of using the busybox built-in files?  Also, the=20
u-boot utilities seem to be ok to compile with out adding these to=20
the package list.

> diff --git a/meta-phosphor/classes/obmc-phosphor-image=5Ftypes=5Fuboot.bb=
class b/meta-phosphor/classes/obmc-phosphor-
> image=5Ftypes=5Fuboot.bbclass
> index c390c36..dc69dc1 100644
> --- a/meta-phosphor/classes/obmc-phosphor-image=5Ftypes=5Fuboot.bbclass
> +++ b/meta-phosphor/classes/obmc-phosphor-image=5Ftypes=5Fuboot.bbclass
> @@ -51,8 +51,16 @@ do=5Fgenerate=5Fflash() {
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0oe=5Fmkimage =C2=A0"${initrd}" "${INITRD=
=5FCTYPE}" || bbfatal "oe=5Fmkimage initrd"
> - =C2=A0 =C2=A0 =C2=A0 dd if=3D/dev/zero of=3D${ddir}/${rwfs} bs=3D1k cou=
nt=3D${RWFS=5FSIZE}
> - =C2=A0 =C2=A0 =C2=A0 mkfs.${OVERLAY=5FBASETYPE} -b 4096 -F -O^huge=5Ffi=
le ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
> +
> + =C2=A0 =C2=A0 =C2=A0 if [ x"${OVERLAY=5FBASETYPE}" =3D xjffs2 ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.${OVERLAY=5FBASETY=
PE} ${OVERLAY=5FBASETYPE=5FOPTS} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
-pad=3D$(expr ${RWFS=5FSIZE} \* 1024) \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
o ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D=
${ddir}/${rwfs} bs=3D1k count=3D${RWFS=5FSIZE}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.${OVERLAY=5FBASETY=
PE} ${OVERLAY=5FBASETYPE=5FOPTS} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
{ddir}/${rwfs} || bbfatal "mkfs rwfs"
> + =C2=A0 =C2=A0 =C2=A0 fi
>=20

That seems like a lot of logic including special caseing the type but then =
using the variable,=20
and some kind of --pad option.   However, it was pointed out to me while I =
originally used=20
the -j option on the busybox flash=5Feraseall =C2=A0command, which writes 1=
985 to each erase block,=20
the Facebook and other code just did erase=5Fall and mount.  Investigation =
shows jffs2 seems=20
to be very happy with a blank NOR flash; I suspect the markers may be more =
for NAND and/or=20
RAM.

Also while there were some ext4 specific options not in variables they shou=
ld be moved there
before switching the type so it will be easier to go back (if, for instance=
, someone wants=20
to use managed nand eg emmc or usb for their read-write storage).

So, my suggestion here for empty mkfs.jffs2:

dd (size options) | tr '\x00' '\xff'


> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-init.sh b/meta-phosphor/common
> /recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> index 6750de3..226b199 100644
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-init.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-init.sh
> @@ -65,18 +65,26 @@ then
> =C2=A0	cp /run/mtd:u-boot-env /run/fw=5Fenv
> =C2=A0fi
> =C2=A0
> +rofst=3Dsquashfs
> =C2=A0rofs=3D$(findmtd rofs)
> -rwfs=3D$(findmtd rwfs)
> -
> +roopts=3Dro
> =C2=A0rodev=3D/dev/mtdblock${rofs#mtd}
> -rwdev=3D/dev/mtdblock${rwfs#mtd}
> =C2=A0
> -rofst=3Dsquashfs
> -rwfst=3Dext4
> -roopts=3Dro
> +rwfst=3Djffs2
> +rwfs=3D$(findmtd rwfs)
> =C2=A0rwopts=3Drw
> +rwdev=3D${rwfs}
> +

You seem to have reordered the lines for a different grouping.  That's prob=
ably ok but please do it in a seperate patch either before or after changin=
g the file system type.

> +# mount.jffs2 requires the device node basename, not the absolute device=
 node
> +# path. But still support alternative filesystems through /dev/mtdblockX.
> +if [ x"$rwfst" !=3D xjffs2 ]; then
> +	rwdev=3D/dev/mtdblock${rwdev#mtd}
> +fi

The kernel mount system call is very happy to accept the /dev/mtdblockX and=
=20
I have been doing all my testing by just changing rwfst.  If the mount.jffs=
2=20
that you added from mtdutils does not accept this then not only is it a was=
te=20
of space but actively harmeful. =20

Please remove that broken code from the build and try without.  Busybox mou=
nt
seems to be fine when the fstype is listed.

Alternatively the kernel accepts mtd:<name> where name is the mtd name.  Wh=
ile=20
that is useful I have not checked if squashfs is happy with that, and it ma=
kes=20
it harder to switch to other fs types (eg loop mount).

=C2=A0
>=C2=A0init=3D/sbin/init
> +
> +# There is no fsck for jffs2 - For rwfst=3Djffs2 just produces a warning=
 in the
> +# output about being unable to find the binary and the boot continues.

That is true, or we could create a link to /bin/true.  The comment it not=20
given to the screen where the user sees the message.

=C2=A0
> =C2=A0Mounting read-write $rwdev filesystem failed. =C2=A0Please fix and =
run
> -	mount $rwdev $rwdir -t $rwfs -o $rwopts
> +	mount $rwdev $rwdir -t $rwfst -o $rwopts
> =C2=A0to to continue, or do change nothing to run from RAM for this boot.
> =C2=A0HERE

Good catch, I must not have tried to cut and paste that.
It should arguably be a seperate patch.


> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/f=
iles/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-i=
nitfs/files/obmc-update.sh
> index face06d..2bba4b0 100755
> --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
mc-update.sh
> @@ -35,13 +35,18 @@ findmtd() {

[ Same comments about variable order changes and updates in update script ]


But I also had plans to have the concept of "old" and "new" rwfst , where u=
pdate
would check for the fs mounting as the old type before but be mounted with =
the
new type after the update.

Its a bit tricky because jffs2 will try to mount anything but complain abou=
t erase=20
marks on every block that it can not parse.  ext4 relies on magic numbers a=
nd so=20
should always be tried before jffs2.

Also I was thinking about taking advantage of flash=5Feraseall being an ali=
as for=20
mkfs.jffs2 and doing the wipe in more cases, maybe by an alternate trigger =
file.  I
don't want to do it for a u-boot-env update but probably should when we do =

image-rofs.


I have a patch series to split the whitelist into pieces that affects mostl=
y=20
update (and a rename in init).  I didn't post it because I wanted a chance =
to=20
review it and had yet to investigate making moving the files in the build=20
system.  I will probably send that tomorrow.  Actually the merge looks easy=
 its=20
all contained to the save loop block; most of the work is in the recipe.



Thanks,
milton
