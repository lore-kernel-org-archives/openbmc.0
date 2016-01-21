Return-Path: <miltonm@us.ibm.com>
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CFAAD1A001D
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 03:07:02 +1100 (AEDT)
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 21 Jan 2016 09:06:59 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Jan 2016 09:06:58 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 93A893E40030
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 09:06:57 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0LG6vgX29687868
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 09:06:57 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0LG6v8Y000937
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 09:06:57 -0700
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0LG6uMr000899
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 09:06:57 -0700
Message-Id: <201601211606.u0LG6uMr000899@d03av01.boulder.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 21 Jan 2016 09:06:56 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 21 Jan 2016 09:06:53 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 21 Jan 2016 16:06:52 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 21 Jan 2016 16:06:50 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016012116064952-302075 ;
 Thu, 21 Jan 2016 16:06:49 +0000 
In-Reply-To: <56A06F64.8050501@ozlabs.org>
Subject: Re: [PATCH openbmc 3/6] linux-obmc: apply the aspeed-spi-nor
 controller patchset
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
Date: Thu, 21 Jan 2016 16:06:49 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: <56A06F64.8050501@ozlabs.org>,
 <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453331420-6524-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_01112016_FP3 January 19, 2016
X-LLNOutbound: False
X-Disclaimed: 61331
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16012116-0017-0000-0000-00001160F085
X-IBM-ISS-SpamDetectors: Score=0.425523; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.425523; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004823; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000135; SDB=6.00648495; UDB=6.00292977; UTC=2016-01-21
 16:06:51
x-cbparentid: 16012116-4778-0000-0000-000001A9E8C4
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-Mailman-Approved-At: Fri, 22 Jan 2016 10:37:03 +1100
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
X-List-Received-Date: Thu, 21 Jan 2016 16:07:04 -0000


-----Jeremy Kerr <jk@ozlabs.org> wrote: -----
> On  01/20/2016 11:41PM, Milton Miller  wrote:
>=20
> Hi Milton,
>=20
>> Thie applies the apseed-spi-nor driver and patches the dts for
>> palmetto and barreleye when building the linux image. =C2=A0It also
>> enables the config options for the driver and some file systems to
>> support the overlay filesystem stack used by obmc-phosphor-initfs.
>>=20
>> It also applies the rtc month fix patch.
>=20
> OK, these should be separate.
>=20
> However, I'd prefer we apply the patches directly to our kernel repo.
> Can you post a patch for that, then this change should just be an
> updated kernel reference.

Actually both patches were submitted as separate pull requests to the
openbmc/linux repository.  I submitted them as patching via openbmc=20
bitbake recipe to make it easier for others to test; it avoids=20
having bitbake transfer a tarball for each new repository and me keeping
a merged branch with all the fixes.  Someday we can teach the git fetcher=20
about reference repositories.

>=20
> Some minor comments on the kernel patch though:
>=20
>> +diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/asp=
eed-smc.c
>> +new file mode 100644
>> +index 0000000..2497648
>> +--- /dev/null
>> ++++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> +@@ -0,0 +1,539 @@
>> ++/* ASPEED Static Memory Controller driver
>> >++ * Copyright 2015
>> ++ * Milton Miller
>> ++ *
>> ++ */
>
> Make sure you have the right copyright headers on this one.
=20
This is a literal post of what I had submitted in 2015.  However I=20
admit I am a noob at copyright headers and detailed advice will=20
be gladly accepted.

>
>> ++#define DEBUG
>=20
> Remove on the final version; we have dynamic debug enabled in the
> OpenBMC kernels.

Sure.

>=20
>> ++
>> ++#include <linux/device.h>
>> ++#include <linux/io.h>
>> ++#include <linux/module.h>
>> ++#include <linux/mutex.h>
>> ++#include <linux/mtd/mtd.h>
>> ++#include <linux/mtd/partitions.h>
>> ++#include <linux/mtd/spi-nor.h>
>> ++#include <linux/of.h>
>> ++#include <linux/of=5Fplatform.h>
>> ++#include <linux/sysfs.h>
>> ++
>> ++enum smc=5Fcontroller=5Ftype {
>> ++	smc=5Ftype=5Fleg,		/* legacy register mode and map */
>> ++	smc=5Ftype=5Ffmc,		/* new FMC 5 CEs multiple flash types */
>> ++	smc=5Ftype=5Fsmc,		/* SPI memory controller for BIOS / host */
>> ++};
>> ++
>> ++enum smc=5Fflash=5Ftype {
>> ++	smc=5Ftype=5Fnor =3D 0,	/* controller connected to nor flash */
>> ++	smc=5Ftype=5Fnand =3D 1,	/* controller connected to nand flash */
>> ++	smc=5Ftype=5Fspi =3D 2,	/* controller connected to spi flash */
>> ++};
>> ++
>> ++struct aspeed=5Fsmc=5Finfo {
>> ++	unsigned long nce : 3;		/* number of chip enables */
>> ++	unsigned long hasdma : 1;	/* has dma engine */
>> ++	unsigned long maxwidth : 3;	/* max width of spi bus */
>> ++	unsigned long we0 : 5;		/* we shift for ce 0 in cfg reg */
>> ++	unsigned long hastype : 1;	/* type shift for ce 0 in cfg reg */
>> ++	u8 ctl0;			/* offset in regs of ctl for ce 0 */
>> ++	u8 cfg;				/* offset in regs of cfg */
>> ++	u8 time;			/* offset in regs of timing */
>> ++};
>
> I wouldn't worry about bitfields here.

I can adapt.

>=20
>> ++
>> ++#define E(=5Fce, =5Fdma, =5Fw, =5Fctl, =5Fcfg, =5Fwe0, =5Fhastype, =5F=
time, =5Fmisc) \
>> ++	.nce =3D =5Fce, .ctl0 =3D =5Fctl, .cfg =3D 0, .we0 =3D =5Fwe0, .hasty=
pe =3D =5Fhastype, \
>> ++	.hasdma =3D =5Fdma, .maxwidth =3D =5Fw, .time =3D =5Ftime
>> ++
>> ++struct aspeed=5Fsmc=5Finfo aspeed=5Ftable[] =3D {
>> ++	[smc=5Ftype=5Ffmc] =3D { E(5, 1, 4, 0x10, 0x00, 16, 1, 0x54, 0x50) },
>> ++	[smc=5Ftype=5Fsmc] =3D { E(1, 0, 2, 0x04, 0x00, 0, =C2=A00, 0x14, 0x1=
0) },
>> ++};
>=20
> And it'll be a little more readable to expand this:
>=20
> struct aspeed=5Fsmc=5Finfo aspeed=5Ftable[] =3D {
> 	[smc=5Ftype=5Ffmc] =3D {
> 		.nce =3D 5,
> 		.hasdma =3D 1,
> 		.maxwidth =3D 0x10,
> 		/* ... etc */
> 	},
> };

I think I'll go a step further, and make them separate structs, there
is not much in keeping them in an array.

>=20
>> ++#if 0 /* ATTR */
>> ++static u32 spi=5Fcontrol=5Fto=5Ffreq=5Fdiv(u32 control)
>> ++{
>> ++	u32 sel;
>> ++
>> ++	sel =3D control & CONTROL=5FSPI=5FCLOCK=5FFREQ=5FSEL=5FMASK;
>> ++	sel >>=3D CONTROL=5FSPI=5FCLOCK=5FFREQ=5FSEL=5FSHIFT;
>> ++
>> ++	/* 16, 14, 12, 10, 8, 6, 4, 2, 15, 13, 11, 9, 7, 5, 3, 1 */
>> ++	return 16 - (((sel & 7) << 1) + ((sel & 8) >> 1));
>> ++}
>> ++
>> ++static u32 spi=5Fcontrol=5Fto=5Fdummy=5Fbytes(u32 control)
>> ++{
>> ++
>> ++	return ((control & CONTROL=5FSPI=5FIO=5FDUMMY=5FCYCLES=5FLO) >>
>> ++			CONTROL=5FSPI=5FIO=5FDUMMY=5FCYCLES=5FLO=5FSHIFT) |
>> ++		((control & CONTROL=5FSPI=5FIO=5FDUMMY=5FCYCLES=5FHI=5FSHIFT) >>
>> ++			CONTROL=5FSPI=5FIO=5FDUMMY=5FCYCLES=5FHI=5FSHIFT);
>> ++}
>> ++
>> ++static size=5Ft show=5Fctl=5Fdiv(u32 control, char *buf)
>> ++{
>> ++	return sprintf(buf, "%u\n", spi=5Fcontrol=5Fto=5Ffreq=5Fdiv(control));
>> ++}
>> ++
>> ++static size=5Ft show=5Fctl=5Fdummy=5Fbytes(u32 control, char *buf)
>> ++{
>> ++	return sprintf(buf, "%u\n", spi=5Fcontrol=5Fto=5Fdummy=5Fbytes(contro=
l));
>> ++}
>> ++#endif /* ATTR */
>=20
> There are a couple of `#if 0`-ed blocks in this patch. Was this just for
> development, or something we want to keep?

Actually I wrote them and made them compile except for the unused static=20
function warning.  I intended to hook them up at least to debugfs but=20
have not yet written that code.  I think they will be useful when developin=
g=20
the code to tune the transfer speeds.

So with that background, should I remove it or wait until we have done the =

next phase of tuning?


There are also a couple of functions that use more of the hardware to handle
sending the address, which should reduce the overhead.  I chose to wait to
test those until the base access was known to work.

[snip]

>> ++
>> ++const struct of=5Fdevice=5Fid aspeed=5Fsmc=5Fmatches[] =3D {
>> ++	{ .compatible =3D "aspeed,fmc", .data =3D &aspeed=5Ftable[smc=5Ftype=
=5Ffmc] },
>> ++	{ .compatible =3D "aspeed,smc", .data =3D &aspeed=5Ftable[smc=5Ftype=
=5Fsmc] },
>> ++	{ }
>> ++};
>> ++MODULE=5FDEVICE=5FTABLE(of, aspeed=5Fsmc=5Fmatches);
>=20
> I'd suggest grouping this with the platform=5Fdevice definition below.

I put it before probe() to allow the  table to be matched to retrieve
the data pointer.  Moving it next to the the platform=5Fdriver struct=20
would require a forward declaration of either the match table or the=20
probe function.

>=20
> But in general, all looks good to me. Ben - any thoughts about the
> smc controller implementation?
>=20
> Cheers,
> Jeremy

milton
