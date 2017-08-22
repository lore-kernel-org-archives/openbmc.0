Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbvY42Y5RzDqYP
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 12:25:28 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7M2OEiI026560
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 22:25:25 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cg8xbyu8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 22:25:25 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 22 Aug 2017 02:25:25 -0000
Received: from us1b3-smtp03.a3dr.sjc01.isc4sb.com (10.122.7.173)
 by smtp.notes.na.collabserv.com (10.122.47.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 22 Aug 2017 02:25:21 -0000
Received: from us1b3-mail79.a3dr.sjc01.isc4sb.com ([10.122.105.126])
 by us1b3-smtp03.a3dr.sjc01.isc4sb.com
 with ESMTP id 2017082202252155-1077409 ;
 Tue, 22 Aug 2017 02:25:21 +0000 
In-Reply-To: <CACPK8XdWGzL1B5-yMB-V1Zr-v28UHKjwPR3fF24LzydCgCHS9Q@mail.gmail.com>
Subject: Re: New design for file system layout and code update
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Milton Miller <mdmii@outlook.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Patrick Williams III" <iawillia@us.ibm.com>
Date: Tue, 22 Aug 2017 02:25:21 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XdWGzL1B5-yMB-V1Zr-v28UHKjwPR3fF24LzydCgCHS9Q@mail.gmail.com>,
 <DM5PR1201MB0171FC7B8400A4193427C5D5B8880@DM5PR1201MB0171.namprd12.prod.outlook.com>
X-Mailer: IBM iNotes ($HaikuForm 984.1) | IBM Domino Build
 SCN17206_20170725T0035 July 25, 2017 at 00:35
X-LLNOutbound: False
X-Disclaimed: 47347
X-TNEFEvaluated: 1
X-LLNXfer: False
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17082202-6371-0000-0000-000000D24623
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.415104;
 ST=0; TS=0; UL=0; ISC=; MB=0.378526
X-IBM-SpamModules-Versions: BY=3.00007588; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000223; SDB=6.00905804; UDB=6.00453936; IPR=6.00686007; 
 BA=6.00005545; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016803; XFM=3.00000015;
 UTC=2017-08-22 02:25:23
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-08-21 21:41:25 - 6.00007215
x-cbparentid: 17082202-6372-0000-0000-000083D24EDE
Message-Id: <OF2107EFE4.3D30FFF5-ON00258183.007F687D-00258184.000D4EE1@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-21_14:, , signatures=0
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
X-List-Received-Date: Tue, 22 Aug 2017 02:25:28 -0000

[Sorry for the ever shorter lines, but I don't see a nice !fmt
in this mailer's UI.  I tried to add trailing spaces like quoted-
printable to the end of lines for flow, if they survive ...]

On 08/21/2017 around 06:22AM in some timezone, Joel Stanley wrote:
>
>Hi Milton,
>
>Thanks for the write-up. We weren't yet looking for something as
>comprehensive,
>but thanks for the attention to detail here. Before we get too far
>ahead though,
>there are a few questions about the higher-level design (quotes are
>from your
>doc):

Part of the write-up was to provide background and discussion of=20
what I had researched.  Part of the write-up was documentation=20
that should have been written last April before openbmc-1.0 and=20
should be added to the openbmc/docs with some further editing.

And I wanted to provide background and a glossary at the end to=20
try and invite all members of the list to participate in any=20
discussion.



>
>Firstly, a clarification about the kernel: your doc mentions that
>it'll be present (as the raw kernel binary) in a UBI volume, but
>the discussion today you mentioned that it will be a raw flash area.
>Can you clear that up?

I don't remember my exact words on the call last night, but I =20
remember talking about putting the FIT image in a bare UBI static=20
partition instead of a file in an ubifs instance..  I probably=20
used the terminology raw ubi partition.

As stated, the current plan does not require any UBI volume to=20
be written, only read.  The only raw flash space in the proposed plan=20
is for u-boot itself and two 64k sectors for its environment space.

>
>> All distribution images (except Das U-boot and its environemnt)
>> will be stored in seperate ubi volumes named by their image type.
>> A hash of version identifiers will be generated during deployment
>> to make unique image names.
>>
>> The kernel and its device tree will be stored in a fit image
>> in a ubi volume.
>
>Am I correct in assuming that this allows us to be flexible in the
>partition sizing? ie, we can perform single-volume updates at runtime
>that may be larger than the space originally allocated for that
>volume?

Yes.  To me, that is the primary motivation for enabling UBI volumes.

>
>[ie, with the partitioned mtd scheme that we have now, increasing
>a partition beyond its original size isn't possible without
>having to shuffle the data around]
>
>If so, this would be a fairly significant reason for adopting the
>UBI-volume-based approach.
>

I'm glad you agree.

Without this, we could shift space between the kernel FIT and the=20
read-only file system, but there is no provision to grow or shrink=20
a jffs2 volume that is used for read-write.   And moving the boundary=20
is difficult because the partition starts are in the dts and the=20
seperate images won't fit or need to be shifted across the old boundary=20
as we distribute the image in pieces with the old binaries.

>> To support a total flash chip failure, each flash chip will
>> contain an independent ubi device.  The mtd=5Fconcat driver will not
>> be used to form an ubi device that spans flash chip boundaries.
>>
>> Both the primary chip (mtd label bmc) and alternate chip (mtd
>> label alt) will contain a complete copy of u-boot, and a redundant
>> environment, and kernel images.  For space reasons root squashfs
>> volumes may be on a different ubi device than the kernel.
>
>Do we really need this though? It seems that the functionality that
>the
>hardware provides here (flipping to a completely independent backup
>flash)
>gives us a simple, fail-safe mechanism for disaster recovery.
>

I think its important to separate out failure cases and recovery actions =20
for different users and machine classes.  Of the 11 machine dts in the=20
current openbmc/linux dev-4.10 branch, 2 use other layouts, and of the=20
remaining 9, only the three IBM HPC nodes (firestone, garrison, and=20
witherspoon) have populated dual bmc flash devices.  Unless there are=20
other machines that populate dual flash without showing them in the=20
current dts files (firestone and garrison don't show this in the present=20
device trees).

That said, using a totally independent flash gives the best chance=20
of recovery, at the largest expense (double the storage cost plus the=20
board space).

In the current hardware, there is not space for two complete code=20
stacks on each chip.  There is an issue open suggesting the file=20
system shrink to a target that may allow this goal.

(thoughts continue after more quotes)


>Using some components from "primary" and some from "secondary" seems
>like an invitation for incompatibility issues.
>

I wasn't aware until I asked in last friday's code reivew/merge=20
party^Wmeeting detail what was planned.

The current plans will always use a kernel and rofs from the same=20
yocto build.  The two images will be stored with the same image hash=20
name.  The question came up how to transition from one image to the=20
next, and for the time being, all kernels will be placed on both the=20
primary and alternate ubi devices, allowing any u-boot to start=20
any kernel.

Further discussion below.

>If we do continue with this approach, how will it interact with the
>auto-fallback via chip-select?
>

Yes.  I haven't fully developed my plans, and so I have not written=20
a full proposal yet.  But since (1) users will be confused if the=20
contents of the primary and alternate change because the secondary=20
boot code was triggered on the 2500 and (2) users of the 2400 will=20
not be able to access the primary if the alternate chip is booted, =20
I am making the following proposal:

Before linux will probe the FMC, it will clear all boot watchdog=20
secondary source selects, ensuring the labels in the device tree=20
correspond to the physical chip selects and hence placement on the=20
board.  The kernel command line will assign ubi device numbers=20
to all bmc ubi storage, and these will not change based on which=20
chip was selected to load u-boot and its environment.

[We can decide to clear the secondary source in u-boot but that=20
would require dual flash support to be implemented and tested in=20
u-boot.  In addition the environment code would need to be updated=20
to recognise, remember, and react to the secondary source select=20
at least to prevent saveenv on the alt u-boot writing the primary=20
environment.]

The code update activation will be responsible to update both=20
u-boot environments.  Each environment will contain a set of=20
variables that will cause u-boot to load a named kernel by=20
volume and supply that kernel with a command line to find the=20
squashfs by ubi device and volume number (because that is what=20
can be supported with the current u-boot and kernel command=20
line).

The limitation here is that if the primary chip becomes unreadable=20
and contains the root volume for the alternate chip, the alternate=20
side will also fail to boot.  This could be improved with a TBD=20
mechanism where u-boot would try the kernel matching the rootfs=20
volume that is stored on its flash.

There is a similar window whenever the alternate flash rootfs=20
image is being replaced until there is space to hold two complete=20
images (current and pending) on one flash chip (or a full and=20
recovery image, eg that only includes code-update and very limited=20
system management).

>> Since all binaries will exist in the root file system, systemd can
>> be started directly from the squashfs without an intermediate
>> initramfs.  Eliminating the initramfs will remove the requirement
>> to build and store it, however, it also requires the bootloader
>> to will need to specify how to locate the root filesystem.
>
>So we'd also be moving from the current initramfs-based flashing
>mechanism to something that requires the rootfs to be working, right?

I think discussion of update and recovery scenarios is a worthwhile=20
topic.  I included the glossary to have defined terms to facilitate=20
such discussion.  [That said, a review of the glossary was skipped=20
in the rush to publish the tome].

As I mentioned in the alternatives section, the xz-squashfs image=20
can be loaded into ram, either as an initrd to be mounted on /dev/ram0,=20
or with an initramfs script (similar the current obmc-phosphor-initfs=20
obmc-phosphor-init.sh) that would use an image in rootfs via /dev/loop.

There are some techincal details to work though to get yocto to=20
build such a recovery image but it is quite reasonable.  And unlike=20
the cpio.xz ramdisk, the squashfs will be decompressed on demand=20
instead of taking 30-90 seconds of time with no console output.

>That is a bit concerning, as it means that more infrastrcuture
>needs to be working & correct to be able to boot *anything*,
>including recovery. Or have I read the design incorrectly here?
>

The current code proposal bypasses the initramfs and requires=20
finding the root filesystem.

For human based recovery, from a u-boot prompt:

(1) u-boot provides a ubi command with an info subcommand=20
that can be used to show ubi volume name and volume numbers.

(2) The process to extract the information and build a=20
boot command and bootargs can be documented, including the=20
intermediate variables in the proposed u-boot environment. =20

Alternatively,

(3) The existing phosphor-initfs init.sh script can be modified=20
to look for ubi volumes by name in addition to mtd partitions=20
by name.  The images could be located from its rich recovery=20
environment (which I hint at in the documentation part of my=20
mega-post, but have never fully documnted).

(4) Alternatively a recovery FIT can be built with initrd=20
or initramfs including the squashfs root image.  This image=20
could be setup for a netboot fallback or even to be probed=20
u-boot from a deployment server (eg attempt dhcp similar to PXE).

In the intrest of full disclosure...

Not fully documented but observed in testing:

If var fails to mount or the /etc overlay fails to mount for any=20
reason, the network is not configured and the console getty=20
does not start. =20

This implies the alternate boot watchdog should not be stopped
in this case.



>How about something like:
>
> - completely independent primary & backup images, and use the
>   BMC's watchdog to revert to the backup on severe boot problems
>
> - kernel and initramfs as (raw) UBI volumes, with u-boot having
>   support to boot from those
>
> - rootfs (ro) + /var (rw) [plus whatever else is required] as
>   UBI volumes, likely with squashfs for ro and jffs2 for rw.
>
>That means:
>
> - we still have a fairly simple path to boot to initramfs, which
>   allows for system recovery
>
> - kernel, initramfs and filesystem sizes are not fixed, and can be
>   modified during firmware update
>
>How does that sound?


Let me highlight what I see as the differences.  I'm going to go
in reverse order for a moment:

(1) jffs2 vs ubifs on the ubirw volume
(2) kernel and initramfs are in separate ubi volumes.
(3) there is an initramfs
(4) flashes are independent
(5) further discussion on needed extension for (4)

Regarding (1):

I don't have a strong feeling between ubifs and jffs2.  I will=20
note that glubi, which provides for mtd emulation over ubi,=20
presents a odd sized erase block to its customer (64k-2*64 in=20
our case).  As I mentioned jffs2 has two non-standard compression=20
options that may or may not reduced size including storing=20
compressed data.  A concern would be if few users are testing=20
the nonstandard block size exposes some hole or boundary=20
condition while ubifs on ubi would have a larger user base.

(2)
I am not aware of any advantage to keeping separate kernel=20
and initramfs images vs the current layout combining them into=20
a FIT image.  (Ok it might be eaiser to add a kernel built=20
outside yocto, but u-boot can load the dts and/or initramfs=20
images independently from FIT and the FIT images.  And this=20
would only apply to kernel hackers vs consumers of the build=20
system.)

As long as we plan to distribute kernel and rofs as a=20
package I see no reason not to include an initramfs, should=20
one be needed, into a FIT image.

[FIT is a flat device tree binary (blob) containing=20
pointers to data and metadata including signatures].

(3) I haven't talked to Patrick as to why, but I know he=20
had requested several times the initramfs be removed.

One motivation can be that our build currently requires=20
two complete copies of busybox and its linked libraries=20
be stored, using MB of space even with XZ compression. =20

Another may be the presumption of boot time savings, but=20
I never saw that as an issue and have not heard it expressed.

Both of these could be addressed with a custom binary=20
(I would write in C) that implements the search logic=20
currently in the init script.

That said, the only reason I have not proposed making=20
the new var a writeable file system and etc an overlay=20
is the time to implement the proposal.  I would start by=20
making the necessary changes to obmc-phosphor-init.sh=20
and then look at what it would take to choose the=20
current overlay vs the new via a machine feature (and=20
therefore init option via the base options file).

One thing not mentioned is the ability of ubifs to=20
rename volumes atomically including swapping names of=20
volumes.  The volume number is stored throughout the=20
flash but the name is only in the (double stored)=20
table of contents.  But until the kernel can mount=20
a squashfs only by name its not useful to use to=20
implement a constant "name is primary, alt-name is=20
secondary" policy.

I do have some concerns with mounting etc after systemd=20
starts, but I think the init script can be invoked=20
before systemd from within the squashfs image (either=20
init=3D or linuxrc in initrd for recovery).

I think managing the rwfs is an area that deserves=20
attention and enhancement.  The existing initramfs=20
code is underutilized according to its author :-).

(4)
I think most of the difference is in how the rootfs is=20
located;  either it is programmed by code update into=20
the environment (and if it doesn't work we fix it), or=20
the alternate boot doesn't rely on the alternate chip=20
at all.

If we don't reset the secondary boot flag then all=20
the names are backwards wrt the device tree, and we=20
either have two dts images on the 2500.  It also=20
means we can't support any access to the alternate=20
chip from the 2400.  Which probably means we can't=20
even check its version as access would conflict with=20
access to the primary chip.  I strongly believe that=20
we need to clear the boot flag by the Linux kernel=20
flash driver probe.

If this is given, then it comes down to failure=20
recovery scenarios.

The current strategy is each u-boot can read either=20
the previous or new env because of the redundant=20
copy in each flash.

The current and previous or current and new kernel=20
volumes will be available to u-boot.  It comes=20
down to finding a matching root file system.

The currently running code will be protected from=20
deletion so a vaild image will exist, it may just=20
be stored over two flash chips.  The current=20
discussion was to update the alternate chip env to=20
boot the current image, and then move the newly=20
selected image to be selected on the primary boot=20
chip.


(5)
The other scenario is the primary ubi device=20
becomes unusable, either due to corruption or=20
flash chip failure.  With further enhancement=20
to the ubi boot script, I anticipate that a=20
secondary kernel and rootfs could be stored, =20
enabling either the primary or alternate u-boot=20
to boot the either the highest priority or=20
the alternate, second-priority image.

I think this is needed for supporting recovery=20
for systems without a second bmc flash chip.

I think this could be automated by exposing=20
the watchdog activation count(s) to the u-boot=20
environment and allowing the boot script to=20
take action based on the counts.  An earlier=20
idea was to have a countdown variable that=20
selects an alternate boot until it reaches=20
zero that is stored in the environment.

If this is implemented, then the current =20
proposal of storing the new image in alternate=20
ubi devices can be argues to increase robustness, =20
as either the current or secondary root=20
will be in the alternate chip, while during=20
update the alternate chip will have no valid=20
file system with your proposal (an alt that=20
is golden would be more robust).

That said, there is a lot more to talk about=20
regarding full alternate boot image support=20
and what that means.  The in-process code aims=20
to not do anything bad if the secondary boot=20
source is selected on a ast2500 but this has not=20
been tested and may be missing pieces.

The goal for the current sprint is to allow the=20
alternate chip to boot and be able to repair=20
the primary image to a booting state in the=20
absence of hardware failures, in a deployed=20
environment (without serial console attached).

There are several details that are needed=20
including keeping a watchdog that will select=20
the alternate boot running, and only pinging=20
it if the user is able to interact via the=20
network with the current image.  This may=20
require updates to the kernel and u-boot to=20
leave a watchdog running in addition to=20
clearing the boot source select.  I am not=20
aware of any test of booting from the alternate=20
chip intentionally; I know several boots=20
have worked with the old layout :-).


=3D=3D=3D=3D=3D=3D

The initramfs today provides several hooks to=20
dump to the serial port a sulogin (root login)=20
request if anything goes wrong.

So, how much is making sure we find and mount the =20
rootfs, how much is a developer recovering in=20
system with help of the serial console, and how much
is something else?

>
>Cheers,
>
>Joel
>
>

milton
