Return-Path: <miltonm@us.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F1CCA1A0476
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2016 10:08:53 +1100 (AEDT)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 18 Feb 2016 16:08:52 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 18 Feb 2016 16:08:49 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id CD52D1FF0025
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 15:56:58 -0700 (MST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1IN8me226673156
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 23:08:48 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1IN8msZ027685
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 18:08:48 -0500
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1IN8lEm027637
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 18:08:47 -0500
Message-Id: <201602182308.u1IN8lEm027637@d01av01.pok.ibm.com>
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 18 Feb 2016 18:08:47 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 18 Feb 2016 18:08:45 -0500
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 18 Feb 2016 23:08:44 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 18 Feb 2016 23:08:41 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016021823084158-513039 ;
 Thu, 18 Feb 2016 23:08:41 +0000 
In-Reply-To: <1455694038-29771-3-git-send-email-andrew@aj.id.au>
Subject: Re: [RFC PATCH v2 2/2] openbmc: Use JFFS2 for RW overlay filesystem
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
Date: Thu, 18 Feb 2016 23:08:41 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1455694038-29771-3-git-send-email-andrew@aj.id.au>,
 <1455694038-29771-1-git-send-email-andrew@aj.id.au>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02082016 February 08, 2016
X-LLNOutbound: False
X-Disclaimed: 42151
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16021823-0029-0000-0000-000010A22202
X-IBM-ISS-SpamDetectors: Score=0.404685; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.404685; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004937; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000145; SDB=6.00661702; UDB=6.00301025; UTC=2016-02-18
 23:08:42
x-cbparentid: 16021823-7792-0000-0000-0000020E7527
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
X-List-Received-Date: Thu, 18 Feb 2016 23:08:54 -0000

Around 02/17/2016 01:27AM in some time zone Andrew Jeffery wrote:

> We can enable JFFS2 support on mtd6 (the RW mtd partition) with a
> (first-pass) kernel patch[1] applied to work-around a 'stutter' in the
> (optimised) ARM mmiocpy() implementation.
>=20
> [1] Unmerged, but tested: https://lists.ozlabs.org/pipermail/openbmc/2016=
-February/001874.html
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
=C2=A0meta-phosphor/classes/image-overlay.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A07 ++++++-
=C2=A0.../classes/obmc-phosphor-image=5Ftypes=5Fuboot.bbclass =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 14 ++++++++++++--
=C2=A0.../obmc-phosphor-initfs/files/obmc-init.sh =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-
=C2=A0.../obmc-phosphor-initfs/files/obmc-update.sh =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-
=C2=A04 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/classes/image-overlay.bbclass b/meta-phosphor/cl=
asses/image-overlay.bbclass
index 1c6137d..9203955 100644
--- a/meta-phosphor/classes/image-overlay.bbclass
+++ b/meta-phosphor/classes/image-overlay.bbclass
@@ -3,7 +3,12 @@ INITRD=5FIMAGE ?=3D "core-image-minimal-initramfs"
=C2=A0INITRD ?=3D "${DEPLOY=5FDIR=5FIMAGE}/${INITRD=5FIMAGE}-${MACHINE}.cpi=
o.${INITRD=5FCTYPE}${uboot}"
=C2=A0
=C2=A0IMAGE=5FBASETYPE ?=3D "squashfs-xz"
-OVERLAY=5FBASETYPE ?=3D "ext4"
+OVERLAY=5FBASETYPE ?=3D "jffs2"
+
> +# Note: OVERLAY=5FBASETYPE=5FOPTS is not used when OVERLAY=5FBASETYPE=3D=
jffs2
> +# Options for when OVERLAY=5FBASETYPE=3Dext4
> +#
> +# OVERLAY=5FBASETYPE=5FOPTS ?=3D "-b 4096 -F -O^huge=5Ffile"
>=20

This should be something like OVERLAY=5FMKFS=5FOPTS=5Fext4

Its options for the mkfs invocation of the overlay, not the=20
base type.

The options are likely mkfs.ext4 specific.

In bitbake, if you want options to apply for a specific type the=20
convention is to use that type of naming.  In many cases the build system=20
resolves conditionally adding the text to the base variable (but it might=20
need to be tested explicitly in this use case).

That also removes the need for a comment explaining it doesn't apply.

=C2=A0
> diff --git a/meta-phosphor/classes/obmc-phosphor-image=5Ftypes=5Fuboot.bb=
class b/meta-phosphor/classes/obmc-phosphor-
> image=5Ftypes=5Fuboot.bbclass
> index c390c36..abbbe75 100644
> --- a/meta-phosphor/classes/obmc-phosphor-image=5Ftypes=5Fuboot.bbclass
> +++ b/meta-phosphor/classes/obmc-phosphor-image=5Ftypes=5Fuboot.bbclass
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0oe=5Fmkimage =C2=A0"${initrd}" "${INITRD=
=5FCTYPE}" || bbfatal "oe=5Fmkimage initrd"
> - =C2=A0 =C2=A0 =C2=A0 dd if=3D/dev/zero of=3D${ddir}/${rwfs} bs=3D1k cou=
nt=3D${RWFS=5FSIZE}
> - =C2=A0 =C2=A0 =C2=A0 mkfs.${OVERLAY=5FBASETYPE} -b 4096 -F -O^huge=5Ffi=
le ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
> +
> + =C2=A0 =C2=A0 =C2=A0 # Set all the bits to effecitvely erase the RW par=
tition on the NOR when

transposed typo: effectively=20

> + =C2=A0 =C2=A0 =C2=A0 # the image is written
> + =C2=A0 =C2=A0 =C2=A0 dd if=3D/dev/zero bs=3D1k count=3D${RWFS=5FSIZE} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| tr '\000' '\377' > ${=
ddir}/${rwfs}
> + =C2=A0 =C2=A0 =C2=A0 if [ "${OVERLAY=5FBASETYPE}" !=3D jffs2 ]; then

Maybe you could create a mkfs.jffs2 that just does nothing ?  Or verifies t=
he erased
pattern?   Maybe it becomes jffs2-nor like squashfs-xz?   Not sure on this =
last part.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# jffs2 can mount an er=
ased filesystem as if it were formatted,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# so don't bother forma=
tting unless we're configured to use
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# something different.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.${OVERLAY=5FBASETY=
PE} ${OVERLAY=5FBASETYPE=5FOPTS} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $=
{ddir}/${rwfs} || bbfatal "mkfs rwfs"
> + =C2=A0 =C2=A0 =C2=A0 fi


Also could you try taking a stab at trying to mount ext4 before jffs2 in the
update copy-from script to allow the upgrade transition to work?

If not I will put it on top of your branch.

milton
