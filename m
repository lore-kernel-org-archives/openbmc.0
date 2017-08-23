Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcTbt6SJGzDrJL
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 10:59:54 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7N0wxtF099599
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 20:59:51 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.113])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cgsktj821-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 20:59:51 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 23 Aug 2017 00:59:50 -0000
Received: from us1b3-smtp08.a3dr.sjc01.isc4sb.com (10.122.203.190)
 by smtp.notes.na.collabserv.com (10.122.47.56) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 23 Aug 2017 00:59:48 -0000
Received: from us1b3-mail79.a3dr.sjc01.isc4sb.com ([10.122.105.126])
 by us1b3-smtp08.a3dr.sjc01.isc4sb.com
 with ESMTP id 2017082300594759-921897 ;
 Wed, 23 Aug 2017 00:59:47 +0000 
In-Reply-To: <1503379589.7266.23.camel@aj.id.au>
Subject: Re: New design for file system layout and code update
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Milton Miller <mdmii@outlook.com>, "Patrick
 Williams III" <iawillia@us.ibm.com>
Date: Wed, 23 Aug 2017 00:59:47 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1503379589.7266.23.camel@aj.id.au>,
 <CACPK8XdWGzL1B5-yMB-V1Zr-v28UHKjwPR3fF24LzydCgCHS9Q@mail.gmail.com>, 
 <DM5PR1201MB0171FC7B8400A4193427C5D5B8880@DM5PR1201MB0171.namprd12.prod.outlook.com>
 <OF2107EFE4.3D30FFF5-ON00258183.007F687D-00258184.000D4EE1@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 984.1) | IBM Domino Build
 SCN17206_20170725T0035 July 25, 2017 at 00:35
X-LLNOutbound: False
X-Disclaimed: 1787
X-TNEFEvaluated: 1
X-LLNXfer: False
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17082300-1529-0000-0000-000000BB6474
X-IBM-SpamModules-Scores: BY=0.266141; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.378364; ST=0; TS=0; UL=0; ISC=; MB=0.374690
X-IBM-SpamModules-Versions: BY=3.00007594; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000223; SDB=6.00906243; UDB=6.00454199; IPR=6.00686444; 
 BA=6.00005550; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016817; XFM=3.00000015;
 UTC=2017-08-23 00:59:49
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-08-22 21:28:32 - 6.00007219
x-cbparentid: 17082300-1530-0000-0000-00004B0360EE
Message-Id: <OF62DAF6F7.6CB33731-ON00258184.00834350-00258185.0005796F@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-22_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Aug 2017 00:59:55 -0000

[Some trimming]

On 08/22/2017 at 12:26AM in some time zone, Andrew Jeffery <andrew@aj.id.au=
> wrote:
>On Tue, 2017-08-22 at 02:25 +0000, Milton Miller II wrote:
>> On 08/21/2017 around 06:22AM in some timezone, Joel Stanley wrote:
>> >=20
>> > Firstly, a clarification about the kernel: your doc mentions that
>> > it'll be present (as the raw kernel binary) in a UBI volume, but
>> > the discussion today you mentioned that it will be a raw flash
>area.
>> > Can you clear that up?
>>=20
>> I don't remember my exact words on the call last night, but I =20
>> remember talking about putting the FIT image in a bare UBI static=20
>> partition instead of a file in an ubifs instance..  I probably=20
>> used the terminology raw ubi partition.
>>=20
>> As stated, the current plan does not require any UBI volume to=20
>> be written, only read.  The only raw flash space in the proposed
>plan=20
>> is for u-boot itself and two 64k sectors for its environment space.
>>=20

I should point out I left out "in u-boot" when talking write support. =20
The kernel will need to write to the read/write file systems, currently=20
the rwfs containing either the whole overlay (before) or /var with the=20
/etc overlay in the new.

>> >=20
>> > > All distribution images (except Das U-boot and its environemnt)
>> > > will be stored in seperate ubi volumes named by their image
>type.
>> > > A hash of version identifiers will be generated during
>deployment
>> > > to make unique image names.
>> > >=20
>> > > The kernel and its device tree will be stored in a fit image
>> > > in a ubi volume.
>> >=20
>> > Am I correct in assuming that this allows us to be flexible in
>the
>> > partition sizing? ie, we can perform single-volume updates at
>runtime
>> > that may be larger than the space originally allocated for that
>> > volume?
>>=20
>> Yes.  To me, that is the primary motivation for enabling UBI
>volumes.
>
>I haven't played much with UBI, so this is a naive question: is this
>the case
>for all UBI volumes? It appears there are both 'static' and 'dynamic'
>volumes.

Yes.  The maximum number of LEBs (logical erase blocks) in a volume=20
is stored in the volume header.  This is like a quota for the volume,
and ubi forces all volumes combined plus overhead to be less than=20
the device size. =20

From [1]:
>
>	UBI volume size is specified when the volume is created and may
>later
>	be changed (volumes are dynamically re-sizable). There are
>user-space
>	tools which may be used to manipulate UBI volumes.
>
>	There are 2 types of UBI volumes - dynamic volumes and static
>volumes.
>	Static volumes are read-only and their contents are protected by
>CRC-32
>	checksums, while dynamic volumes are read-write and the upper layers
>	(e.g., a file-system) are responsible for ensuring data integrity.
>
>[1] http://www.linux-mtd.infradead.org/doc/ubi.html
>
>
>The order its written in does seem to suggest both static and dynamic
>volumes
>can be resized, but clarity there would be good.

I have resized static volumes.  No volume can be resized below its=20
current max LEB.  A static volume content can be replaced with a new=20
image.  Both the old a new content must fit in the flash, a truncate=20
option on the command line updates to an zero-length image allowing a=20
new image up to the maximum size.

On a dynamic volume, individual LEBs can be replaced.  For static=20
volumes, when moving a LEB that is part of a static volume UBI will
write the crc32 to the header in the new block, and on recovery it
checks this crc to determine if the new block was full written or if
the new block should be reclaimed instead of the old.


>> > > To support a total flash chip failure, each flash chip will
>> > > contain an independent ubi device.  The mtd=5Fconcat driver will
>not
>> > > be used to form an ubi device that spans flash chip boundaries.
>> > >=20
>> > > Both the primary chip (mtd label bmc) and alternate chip (mtd
>> > > label alt) will contain a complete copy of u-boot, and a
>redundant
>> > > environment, and kernel images.  For space reasons root
>squashfs
>> > > volumes may be on a different ubi device than the kernel.
>> >=20

I just noticed the above is somewhat inconsistent.  We still plan
to not use the concat driver instead have two volumes.  But since
we can only store one root today, we need more code to fall back
to the image fully contained within the good chip.

>> > Do we really need this though? It seems that the functionality
>that
>> > the
>> > hardware provides here (flipping to a completely independent
>backup
>> > flash)
>> > gives us a simple, fail-safe mechanism for disaster recovery.
>> >=20
>>=20
>> I think its important to separate out failure cases and recovery
>actions =20
>> for different users and machine classes.  Of the 11 machine dts in
>the=20
>> current openbmc/linux dev-4.10 branch, 2 use other layouts, and of
>the=20
>> remaining 9, only the three IBM HPC nodes (firestone, garrison,
>and=20
>> witherspoon) have populated dual bmc flash devices.  Unless there
>are=20
>> other machines that populate dual flash without showing them in
>the=20
>> current dts files (firestone and garrison don't show this in the
>present=20
>> device trees).
>>=20
>> That said, using a totally independent flash gives the best chance=20
>> of recovery, at the largest expense (double the storage cost plus
>the=20
>> board space).
>>=20
>> In the current hardware, there is not space for two complete code=20
>> stacks on each chip.  There is an issue open suggesting the file=20
>> system shrink to a target that may allow this goal.
>>=20
>> (thoughts continue after more quotes)
>>=20
>>=20
>> > Using some components from "primary" and some from "secondary"
>seems
>> > like an invitation for incompatibility issues.
>> >=20
>>=20
>> I wasn't aware until I asked in last friday's code reivew/merge=20
>> party^Wmeeting detail what was planned.
>>=20
>> The current plans will always use a kernel and rofs from the same=20
>> yocto build.  The two images will be stored with the same image
>hash=20
>> name.  The question came up how to transition from one image to
>the=20
>> next, and for the time being, all kernels will be placed on both
>the=20
>> primary and alternate ubi devices, allowing any u-boot to start=20
>> any kernel.
>>=20
>> Further discussion below.



>>=20
>> > If we do continue with this approach, how will it interact with
>the
>> > auto-fallback via chip-select?
>> >=20
>>=20
>> Yes.  I haven't fully developed my plans, and so I have not
>written=20
>> a full proposal yet.  But since (1) users will be confused if the=20
>> contents of the primary and alternate change because the secondary=20
>> boot code was triggered on the 2500 and (2) users of the 2400 will=20
>> not be able to access the primary if the alternate chip is
>booted, =20
>> I am making the following proposal:
>>=20
>> Before linux will probe the FMC, it will clear all boot watchdog=20
>> secondary source selects, ensuring the labels in the device tree=20
>> correspond to the physical chip selects and hence placement on the=20
>> board.  The kernel command line will assign ubi device numbers=20
>> to all bmc ubi storage, and these will not change based on which=20
>> chip was selected to load u-boot and its environment.
>>=20
>> [We can decide to clear the secondary source in u-boot but that=20
>> would require dual flash support to be implemented and tested in=20
>> u-boot.  In addition the environment code would need to be updated=20
>> to recognise, remember, and react to the secondary source select=20
>> at least to prevent saveenv on the alt u-boot writing the primary=20
>> environment.]
>>=20
>> The code update activation will be responsible to update both=20
>> u-boot environments.
>
>By 'both u-boot environments' do you mean on the primary and
>alternative chips?

Yes

>Or both flash erase blocks reserved for the environment on one chip?

No, the fw=5Fenv command and u-boot both erase and program one=20
copy before starting to update the secondary copy, and use a=20
crc32 to check if a copy was fully written.

>
>If the former, this seems like dangerous territory for a
>fallback/recovery
>mechanism. What if code update activation corrupts the environment?
>We would
>corrupt the primary and alternative boot configuration. I guess we
>fall-back to
>the backup environment on the primary somehow? The backup environment
>would
>have to be modified at some point as well, as otherwise the images it
>points to
>might not correspond to what was intended?
>

Simple answer: code update will totally write well defined variables
that it "owns", and the default env bootcmd will take these variables
and boot

Original answer:

First of all, there is no harware fallback to switch from the=20
secondary boot source back to the first boot on any failure.  This
will require new code, which means we at least had to start u-boot.

Second of all, today we do not have space for two copies of the root
file system in one chip.  That is still a goal.  Until it is reached,
we have a window where one chip will not be bootable while the file
system image is being replaced on that chip.

So it comes down to trade-offs.  How do we make use of the second chip?

- We could disallow all updates.
- We could declare the alternate chip golden.
- We could create a smaller fall-back that only supports code update.
- We can not update the primary while running directly from it
- We can enforce an update mode precondition, where the update
- We could force boot to alternate flash before writing the primary
- We could copy the primary fs into ram before writing new content

The proposal / current and pending code design says: Either the
primary or the secodary u-boot will be able to load a functional=20
bmc.  There is never a window where a volume should be missing, only
a period of time where both will rely on the same ubi device and
volumes.  Factory will ship with two copies.  Field updates will=20
maintain the last booted image and a new image. =20

Having the second chip gives us additional space, but we are close.
The current proposal handles windows during code update but not
all cases where code writes to errant flash sectors.  But I don't
know how to protect the alternate chip without hiding it from the
kernel.  I don't know if I know how to test it works, and won't
be subject to the same issue that caused the primary to fail.

Enhanced u-boot boot scripts could fall back to the root and=20
kernel on the remaining chip.

Remember there are a limited number of systems that have alternate
chips.  This design allows single large flash chip systems to
have multiple images.  (It also allows systems to spill the root
file system into the host chip if its host access policies allow.)


I need to send before I write another tome.

milton
