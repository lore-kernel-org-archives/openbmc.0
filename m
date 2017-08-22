Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbzZ54X20zDqgy
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 15:26:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rhoB4HqV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ma8JUYeS"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F54E213E0;
 Tue, 22 Aug 2017 01:26:35 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 22 Aug 2017 01:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ALlkG3XWSgSHCvlidVlCJlqmwHtuggx7WAKyLQNYD
 hU=; b=rhoB4HqVDMRY+9+qJmu3srxxHc0RABLWWp0+rUA+m7ZMtY9Szu3e9Vyv+
 u9Mym6bB/+Sd8iRN2btPSIjJDgaF5NE9PB7id2aC3EKnBrlRCWDK+eERFtOUQ0qw
 PFLyQR0hAdQTt5FcYb2EGU6R4DDNRh2W1n+BMSRV3mPI/m/glFOM+WiojJorIVId
 UddkvGdCMo190JzTD8gByQ6xUqyh/08wWUvFiJc7/u3tQDYUvdUho8T5iiQGFQQG
 6k/JUjPG8E9BdDWmO5qlT8A/BsdaLKC7seNd33tKRgcOlvhW0+7mTh/Kpqjd3lq+
 lF7SQ0SPFE8zHRvZ6pF6Q9dWO7PSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=ALlkG3XWSgSHCvlidV
 lCJlqmwHtuggx7WAKyLQNYDhU=; b=ma8JUYeS+2s5U1VWuAWyz5C/4C7ObaJi4t
 lMJObmf57O9mIHw+7F0dxGO7oTnUq6d+LHzowpVGQw4Cac8qHbmvCJLRCXNr9BcC
 Bjzq8XwO9IYD8h3QtqPmjw/1f8dQh5FYWYR8dcmQH2FGs9uz03sT3wbZeNMAlaEh
 n5Ve+x68jK20zKyNLd53AvV6XYbZxY8+XgnoINeDUKqNreqog+4PgpG3qsx4huo5
 Na2mJn46QLxKDyhl3nbmZGKukV9O7ryKjsnadTUWAcMjnTFI69HFOSByokyaE5fb
 UOqGRkVl++3X5J2z86kvZrmRUE2xoJUfxXwRYSwJ69wEPHwtuCTQ==
X-ME-Sender: <xms:i8CbWcJ0k7dvU9WZssdaJBW7k00QQmIYbKhsdp2xHlTExK8bxh_-Zg>
X-Sasl-enc: xEWhmwbdNU+4YSDyC+3Xy5lMxEFX/g1CIfOt30KOV1+D 1503379594
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id F142124871;
 Tue, 22 Aug 2017 01:26:32 -0400 (EDT)
Message-ID: <1503379589.7266.23.camel@aj.id.au>
Subject: Re: New design for file system layout and code update
From: Andrew Jeffery <andrew@aj.id.au>
To: Milton Miller II <miltonm@us.ibm.com>, Joel Stanley <joel@jms.id.au>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Milton Miller
 <mdmii@outlook.com>, Patrick Williams III <iawillia@us.ibm.com>
Date: Tue, 22 Aug 2017 14:56:29 +0930
In-Reply-To: <OF2107EFE4.3D30FFF5-ON00258183.007F687D-00258184.000D4EE1@notes.na.collabserv.com>
References: <CACPK8XdWGzL1B5-yMB-V1Zr-v28UHKjwPR3fF24LzydCgCHS9Q@mail.gmail.com>
 ,
 <DM5PR1201MB0171FC7B8400A4193427C5D5B8880@DM5PR1201MB0171.namprd12.prod.outlook.com>
 <OF2107EFE4.3D30FFF5-ON00258183.007F687D-00258184.000D4EE1@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-yI/9MpmN1ZR8HVDEBiH5"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 22 Aug 2017 05:26:38 -0000


--=-yI/9MpmN1ZR8HVDEBiH5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-08-22 at 02:25 +0000, Milton Miller II wrote:
> [Sorry for the ever shorter lines, but I don't see a nice !fmt
> in this mailer's UI.=C2=A0=C2=A0I tried to add trailing spaces like quote=
d-
> printable to the end of lines for flow, if they survive ...]
>=C2=A0
> On 08/21/2017 around 06:22AM in some timezone, Joel Stanley wrote:
> >=C2=A0
> > Hi Milton,
> >=C2=A0
> > Thanks for the write-up. We weren't yet looking for something as
> > comprehensive,
> > but thanks for the attention to detail here. Before we get too far
> > ahead though,
> > there are a few questions about the higher-level design (quotes are
> > from your
> > doc):
>=C2=A0
> Part of the write-up was to provide background and discussion of=C2=A0
> what I had researched.=C2=A0=C2=A0Part of the write-up was documentation=
=C2=A0
> that should have been written last April before openbmc-1.0 and=C2=A0
> should be added to the openbmc/docs with some further editing.
>=C2=A0
> And I wanted to provide background and a glossary at the end to=C2=A0
> try and invite all members of the list to participate in any=C2=A0
> discussion.
>=C2=A0
>=C2=A0
>=C2=A0
> >=C2=A0
> > Firstly, a clarification about the kernel: your doc mentions that
> > it'll be present (as the raw kernel binary) in a UBI volume, but
> > the discussion today you mentioned that it will be a raw flash area.
> > Can you clear that up?
>=C2=A0
> I don't remember my exact words on the call last night, but I=C2=A0=C2=A0
> remember talking about putting the FIT image in a bare UBI static=C2=A0
> partition instead of a file in an ubifs instance..=C2=A0=C2=A0I probably=
=C2=A0
> used the terminology raw ubi partition.
>=C2=A0
> As stated, the current plan does not require any UBI volume to=C2=A0
> be written, only read.=C2=A0=C2=A0The only raw flash space in the propose=
d plan=C2=A0
> is for u-boot itself and two 64k sectors for its environment space.
>=C2=A0
> >=C2=A0
> > > All distribution images (except Das U-boot and its environemnt)
> > > will be stored in seperate ubi volumes named by their image type.
> > > A hash of version identifiers will be generated during deployment
> > > to make unique image names.
> > >=C2=A0
> > > The kernel and its device tree will be stored in a fit image
> > > in a ubi volume.
> >=C2=A0
> > Am I correct in assuming that this allows us to be flexible in the
> > partition sizing? ie, we can perform single-volume updates at runtime
> > that may be larger than the space originally allocated for that
> > volume?
>=C2=A0
> Yes.=C2=A0=C2=A0To me, that is the primary motivation for enabling UBI vo=
lumes.

I haven't played much with UBI, so this is a naive question: is this the ca=
se
for all UBI volumes? It appears there are both 'static' and 'dynamic' volum=
es.
=46rom [1]:

	UBI volume size is specified when the volume is created and may later
	be changed (volumes are dynamically re-sizable). There are user-space
	tools which may be used to manipulate UBI volumes.

	There are 2 types of UBI volumes - dynamic volumes and static volumes.
	Static volumes are read-only and their contents are protected by CRC-32
	checksums, while dynamic volumes are read-write and the upper layers
	(e.g., a file-system) are responsible for ensuring data integrity.

The order its written in does seem to suggest both static and dynamic volum=
es
can be resized, but clarity there would be good.

[1] http://www.linux-mtd.infradead.org/doc/ubi.html

>=C2=A0
> >=C2=A0
> > [ie, with the partitioned mtd scheme that we have now, increasing
> > a partition beyond its original size isn't possible without
> > having to shuffle the data around]
> >=C2=A0
> > If so, this would be a fairly significant reason for adopting the
> > UBI-volume-based approach.
> >=C2=A0
>=C2=A0
> I'm glad you agree.
>=C2=A0
> Without this, we could shift space between the kernel FIT and the=C2=A0
> read-only file system, but there is no provision to grow or shrink=C2=A0
> a jffs2 volume that is used for read-write.=C2=A0=C2=A0=C2=A0And moving t=
he boundary=C2=A0
> is difficult because the partition starts are in the dts and the=C2=A0
> seperate images won't fit or need to be shifted across the old boundary=
=C2=A0
> as we distribute the image in pieces with the old binaries.
>=C2=A0
> > > To support a total flash chip failure, each flash chip will
> > > contain an independent ubi device.=C2=A0=C2=A0The mtd_concat driver w=
ill not
> > > be used to form an ubi device that spans flash chip boundaries.
> > >=C2=A0
> > > Both the primary chip (mtd label bmc) and alternate chip (mtd
> > > label alt) will contain a complete copy of u-boot, and a redundant
> > > environment, and kernel images.=C2=A0=C2=A0For space reasons root squ=
ashfs
> > > volumes may be on a different ubi device than the kernel.
> >=C2=A0
> > Do we really need this though? It seems that the functionality that
> > the
> > hardware provides here (flipping to a completely independent backup
> > flash)
> > gives us a simple, fail-safe mechanism for disaster recovery.
> >=C2=A0
>=C2=A0
> I think its important to separate out failure cases and recovery actions=
=C2=A0=C2=A0
> for different users and machine classes.=C2=A0=C2=A0Of the 11 machine dts=
 in the=C2=A0
> current openbmc/linux dev-4.10 branch, 2 use other layouts, and of the=C2=
=A0
> remaining 9, only the three IBM HPC nodes (firestone, garrison, and=C2=A0
> witherspoon) have populated dual bmc flash devices.=C2=A0=C2=A0Unless the=
re are=C2=A0
> other machines that populate dual flash without showing them in the=C2=A0
> current dts files (firestone and garrison don't show this in the present=
=C2=A0
> device trees).
>=C2=A0
> That said, using a totally independent flash gives the best chance=C2=A0
> of recovery, at the largest expense (double the storage cost plus the=C2=
=A0
> board space).
>=C2=A0
> In the current hardware, there is not space for two complete code=C2=A0
> stacks on each chip.=C2=A0=C2=A0There is an issue open suggesting the fil=
e=C2=A0
> system shrink to a target that may allow this goal.
>=C2=A0
> (thoughts continue after more quotes)
>=C2=A0
>=C2=A0
> > Using some components from "primary" and some from "secondary" seems
> > like an invitation for incompatibility issues.
> >=C2=A0
>=C2=A0
> I wasn't aware until I asked in last friday's code reivew/merge=C2=A0
> party^Wmeeting detail what was planned.
>=C2=A0
> The current plans will always use a kernel and rofs from the same=C2=A0
> yocto build.=C2=A0=C2=A0The two images will be stored with the same image=
 hash=C2=A0
> name.=C2=A0=C2=A0The question came up how to transition from one image to=
 the=C2=A0
> next, and for the time being, all kernels will be placed on both the=C2=
=A0
> primary and alternate ubi devices, allowing any u-boot to start=C2=A0
> any kernel.
>=C2=A0
> Further discussion below.
>=C2=A0
> > If we do continue with this approach, how will it interact with the
> > auto-fallback via chip-select?
> >=C2=A0
>=C2=A0
> Yes.=C2=A0=C2=A0I haven't fully developed my plans, and so I have not wri=
tten=C2=A0
> a full proposal yet.=C2=A0=C2=A0But since (1) users will be confused if t=
he=C2=A0
> contents of the primary and alternate change because the secondary=C2=A0
> boot code was triggered on the 2500 and (2) users of the 2400 will=C2=A0
> not be able to access the primary if the alternate chip is booted,=C2=A0=
=C2=A0
> I am making the following proposal:
>=C2=A0
> Before linux will probe the FMC, it will clear all boot watchdog=C2=A0
> secondary source selects, ensuring the labels in the device tree=C2=A0
> correspond to the physical chip selects and hence placement on the=C2=A0
> board.=C2=A0=C2=A0The kernel command line will assign ubi device numbers=
=C2=A0
> to all bmc ubi storage, and these will not change based on which=C2=A0
> chip was selected to load u-boot and its environment.
>=C2=A0
> [We can decide to clear the secondary source in u-boot but that=C2=A0
> would require dual flash support to be implemented and tested in=C2=A0
> u-boot.=C2=A0=C2=A0In addition the environment code would need to be upda=
ted=C2=A0
> to recognise, remember, and react to the secondary source select=C2=A0
> at least to prevent saveenv on the alt u-boot writing the primary=C2=A0
> environment.]
>=C2=A0
> The code update activation will be responsible to update both=C2=A0
> u-boot environments.

By 'both u-boot environments' do you mean on the primary and alternative ch=
ips?
Or both flash erase blocks reserved for the environment on one chip?

If the former, this seems like dangerous territory for a fallback/recovery
mechanism. What if code update activation corrupts the environment? We woul=
d
corrupt the primary and alternative boot configuration. I guess we fall-bac=
k to
the backup environment on the primary somehow? The backup environment would
have to be modified at some point as well, as otherwise the images it point=
s to
might not correspond to what was intended?

>=C2=A0Each environment will contain a set of=C2=A0
> variables that will cause u-boot to load a named kernel by=C2=A0
> volume and supply that kernel with a command line to find the=C2=A0
> squashfs by ubi device and volume number (because that is what=C2=A0
> can be supported with the current u-boot and kernel command=C2=A0
> line).
>=C2=A0
> The limitation here is that if the primary chip becomes unreadable=C2=A0
> and contains the root volume for the alternate chip, the alternate=C2=A0
> side will also fail to boot.=C2=A0=C2=A0This could be improved with a TBD=
=C2=A0
> mechanism where u-boot would try the kernel matching the rootfs=C2=A0
> volume that is stored on its flash.
>=C2=A0
> There is a similar window whenever the alternate flash rootfs=C2=A0
> image is being replaced until there is space to hold two complete=C2=A0
> images (current and pending) on one flash chip (or a full and=C2=A0
> recovery image, eg that only includes code-update and very limited=C2=A0
> system management).
>=C2=A0
> > > Since all binaries will exist in the root file system, systemd can
> > > be started directly from the squashfs without an intermediate
> > > initramfs.=C2=A0=C2=A0Eliminating the initramfs will remove the requi=
rement
> > > to build and store it, however, it also requires the bootloader
> > > to will need to specify how to locate the root filesystem.
> >=C2=A0
> > So we'd also be moving from the current initramfs-based flashing
> > mechanism to something that requires the rootfs to be working, right?
>=C2=A0
> I think discussion of update and recovery scenarios is a worthwhile=C2=A0
> topic.=C2=A0=C2=A0I included the glossary to have defined terms to facili=
tate=C2=A0
> such discussion.=C2=A0=C2=A0[That said, a review of the glossary was skip=
ped=C2=A0
> in the rush to publish the tome].
>=C2=A0
> As I mentioned in the alternatives section, the xz-squashfs image=C2=A0
> can be loaded into ram, either as an initrd to be mounted on /dev/ram0,=
=C2=A0
> or with an initramfs script (similar the current obmc-phosphor-initfs=C2=
=A0
> obmc-phosphor-init.sh) that would use an image in rootfs via /dev/loop.
>=C2=A0
> There are some techincal details to work though to get yocto to=C2=A0
> build such a recovery image but it is quite reasonable.=C2=A0=C2=A0And un=
like=C2=A0
> the cpio.xz ramdisk, the squashfs will be decompressed on demand=C2=A0
> instead of taking 30-90 seconds of time with no console output.
>=C2=A0
> > That is a bit concerning, as it means that more infrastrcuture
> > needs to be working & correct to be able to boot *anything*,
> > including recovery. Or have I read the design incorrectly here?
> >=C2=A0
>=C2=A0
> The current code proposal bypasses the initramfs and requires=C2=A0
> finding the root filesystem.
>=C2=A0
> For human based recovery, from a u-boot prompt:
>=C2=A0
> (1) u-boot provides a ubi command with an info subcommand=C2=A0
> that can be used to show ubi volume name and volume numbers.
>=C2=A0
> (2) The process to extract the information and build a=C2=A0
> boot command and bootargs can be documented, including the=C2=A0
> intermediate variables in the proposed u-boot environment.=C2=A0=C2=A0
>=C2=A0
> Alternatively,
>=C2=A0
> (3) The existing phosphor-initfs init.sh script can be modified=C2=A0
> to look for ubi volumes by name in addition to mtd partitions=C2=A0
> by name.=C2=A0=C2=A0The images could be located from its rich recovery=C2=
=A0
> environment (which I hint at in the documentation part of my=C2=A0
> mega-post, but have never fully documnted).
>=C2=A0
> (4) Alternatively a recovery FIT can be built with initrd=C2=A0
> or initramfs including the squashfs root image.=C2=A0=C2=A0This image=C2=
=A0
> could be setup for a netboot fallback or even to be probed=C2=A0
> u-boot from a deployment server (eg attempt dhcp similar to PXE).
>=C2=A0
> In the intrest of full disclosure...
>=C2=A0
> Not fully documented but observed in testing:
>=C2=A0
> If var fails to mount or the /etc overlay fails to mount for any=C2=A0
> reason, the network is not configured and the console getty=C2=A0
> does not start.=C2=A0=C2=A0
>=C2=A0
> This implies the alternate boot watchdog should not be stopped
> in this case.
>=C2=A0
>=C2=A0
>=C2=A0
> > How about something like:
> >=C2=A0
> > - completely independent primary & backup images, and use the
> > =C2=A0 BMC's watchdog to revert to the backup on severe boot problems
> >=C2=A0
> > - kernel and initramfs as (raw) UBI volumes, with u-boot having
> > =C2=A0 support to boot from those
> >=C2=A0
> > - rootfs (ro) + /var (rw) [plus whatever else is required] as
> > =C2=A0 UBI volumes, likely with squashfs for ro and jffs2 for rw.
> >=C2=A0
> > That means:
> >=C2=A0
> > - we still have a fairly simple path to boot to initramfs, which
> > =C2=A0 allows for system recovery
> >=C2=A0
> > - kernel, initramfs and filesystem sizes are not fixed, and can be
> > =C2=A0 modified during firmware update
> >=C2=A0
> > How does that sound?
>=C2=A0
>=C2=A0
> Let me highlight what I see as the differences.=C2=A0=C2=A0I'm going to g=
o
> in reverse order for a moment:
>=C2=A0
> (1) jffs2 vs ubifs on the ubirw volume
> (2) kernel and initramfs are in separate ubi volumes.
> (3) there is an initramfs
> (4) flashes are independent
> (5) further discussion on needed extension for (4)
>=C2=A0
> Regarding (1):
>=C2=A0
> I don't have a strong feeling between ubifs and jffs2.=C2=A0=C2=A0I will=
=C2=A0
> note that glubi, which provides for mtd emulation over ubi,=C2=A0
> presents a odd sized erase block to its customer (64k-2*64 in=C2=A0
> our case).=C2=A0=C2=A0As I mentioned jffs2 has two non-standard compressi=
on=C2=A0
> options that may or may not reduced size including storing=C2=A0
> compressed data.=C2=A0=C2=A0A concern would be if few users are testing=
=C2=A0
> the nonstandard block size exposes some hole or boundary=C2=A0
> condition while ubifs on ubi would have a larger user base.
>=C2=A0
> (2)
> I am not aware of any advantage to keeping separate kernel=C2=A0
> and initramfs images vs the current layout combining them into=C2=A0
> a FIT image.=C2=A0=C2=A0(Ok it might be eaiser to add a kernel built=C2=
=A0
> outside yocto, but u-boot can load the dts and/or initramfs=C2=A0
> images independently from FIT and the FIT images.=C2=A0=C2=A0And this=C2=
=A0
> would only apply to kernel hackers vs consumers of the build=C2=A0
> system.)
>=C2=A0
> As long as we plan to distribute kernel and rofs as a=C2=A0
> package I see no reason not to include an initramfs, should=C2=A0
> one be needed, into a FIT image.
>=C2=A0
> [FIT is a flat device tree binary (blob) containing=C2=A0
> pointers to data and metadata including signatures].
>=C2=A0
> (3) I haven't talked to Patrick as to why, but I know he=C2=A0
> had requested several times the initramfs be removed.
>=C2=A0
> One motivation can be that our build currently requires=C2=A0
> two complete copies of busybox and its linked libraries=C2=A0
> be stored, using MB of space even with XZ compression.=C2=A0=C2=A0
>=C2=A0
> Another may be the presumption of boot time savings, but=C2=A0
> I never saw that as an issue and have not heard it expressed.
>=C2=A0
> Both of these could be addressed with a custom binary=C2=A0
> (I would write in C) that implements the search logic=C2=A0
> currently in the init script.
>=C2=A0
> That said, the only reason I have not proposed making=C2=A0
> the new var a writeable file system and etc an overlay=C2=A0
> is the time to implement the proposal.=C2=A0=C2=A0I would start by=C2=A0
> making the necessary changes to obmc-phosphor-init.sh=C2=A0
> and then look at what it would take to choose the=C2=A0
> current overlay vs the new via a machine feature (and=C2=A0
> therefore init option via the base options file).
>=C2=A0
> One thing not mentioned is the ability of ubifs to=C2=A0
> rename volumes atomically including swapping names of=C2=A0
> volumes.=C2=A0=C2=A0The volume number is stored throughout the=C2=A0
> flash but the name is only in the (double stored)=C2=A0
> table of contents.=C2=A0=C2=A0But until the kernel can mount=C2=A0
> a squashfs only by name its not useful to use to=C2=A0
> implement a constant "name is primary, alt-name is=C2=A0
> secondary" policy.
>=C2=A0
> I do have some concerns with mounting etc after systemd=C2=A0
> starts, but I think the init script can be invoked=C2=A0
> before systemd from within the squashfs image (either=C2=A0
> init=3D or linuxrc in initrd for recovery).
>=C2=A0
> I think managing the rwfs is an area that deserves=C2=A0
> attention and enhancement.=C2=A0=C2=A0The existing initramfs=C2=A0
> code is underutilized according to its author :-).
>=C2=A0
> (4)
> I think most of the difference is in how the rootfs is=C2=A0
> located;=C2=A0=C2=A0either it is programmed by code update into=C2=A0
> the environment (and if it doesn't work we fix it), or=C2=A0
> the alternate boot doesn't rely on the alternate chip=C2=A0
> at all.
>=C2=A0
> If we don't reset the secondary boot flag then all=C2=A0
> the names are backwards wrt the device tree, and we=C2=A0
> either have two dts images on the 2500.=C2=A0=C2=A0It also=C2=A0
> means we can't support any access to the alternate=C2=A0
> chip from the 2400.=C2=A0=C2=A0Which probably means we can't=C2=A0
> even check its version as access would conflict with=C2=A0
> access to the primary chip.=C2=A0=C2=A0I strongly believe that=C2=A0
> we need to clear the boot flag by the Linux kernel=C2=A0
> flash driver probe.
>=C2=A0
> If this is given, then it comes down to failure=C2=A0
> recovery scenarios.
>=C2=A0
> The current strategy is each u-boot can read either=C2=A0
> the previous or new env because of the redundant=C2=A0
> copy in each flash.
>=C2=A0
> The current and previous or current and new kernel=C2=A0
> volumes will be available to u-boot.=C2=A0=C2=A0It comes=C2=A0
> down to finding a matching root file system.
>=C2=A0
> The currently running code will be protected from=C2=A0
> deletion so a vaild image will exist, it may just=C2=A0
> be stored over two flash chips.=C2=A0=C2=A0The current=C2=A0
> discussion was to update the alternate chip env to=C2=A0
> boot the current image, and then move the newly=C2=A0
> selected image to be selected on the primary boot=C2=A0
> chip.
>=C2=A0
>=C2=A0
> (5)
> The other scenario is the primary ubi device=C2=A0
> becomes unusable, either due to corruption or=C2=A0
> flash chip failure.=C2=A0=C2=A0With further enhancement=C2=A0
> to the ubi boot script, I anticipate that a=C2=A0
> secondary kernel and rootfs could be stored,=C2=A0=C2=A0
> enabling either the primary or alternate u-boot=C2=A0
> to boot the either the highest priority or=C2=A0
> the alternate, second-priority image.
>=C2=A0
> I think this is needed for supporting recovery=C2=A0
> for systems without a second bmc flash chip.
>=C2=A0
> I think this could be automated by exposing=C2=A0
> the watchdog activation count(s) to the u-boot=C2=A0
> environment and allowing the boot script to=C2=A0
> take action based on the counts.=C2=A0=C2=A0An earlier=C2=A0
> idea was to have a countdown variable that=C2=A0
> selects an alternate boot until it reaches=C2=A0
> zero that is stored in the environment.
>=C2=A0
> If this is implemented, then the current=C2=A0=C2=A0
> proposal of storing the new image in alternate=C2=A0
> ubi devices can be argues to increase robustness,=C2=A0=C2=A0
> as either the current or secondary root=C2=A0
> will be in the alternate chip, while during=C2=A0
> update the alternate chip will have no valid=C2=A0
> file system with your proposal (an alt that=C2=A0
> is golden would be more robust).
>=C2=A0
> That said, there is a lot more to talk about=C2=A0
> regarding full alternate boot image support=C2=A0
> and what that means.=C2=A0=C2=A0The in-process code aims=C2=A0
> to not do anything bad if the secondary boot=C2=A0
> source is selected on a ast2500 but this has not=C2=A0
> been tested and may be missing pieces.
>=C2=A0
> The goal for the current sprint is to allow the=C2=A0
> alternate chip to boot and be able to repair=C2=A0
> the primary image to a booting state in the=C2=A0
> absence of hardware failures, in a deployed=C2=A0
> environment (without serial console attached).
>=C2=A0
> There are several details that are needed=C2=A0
> including keeping a watchdog that will select=C2=A0
> the alternate boot running, and only pinging=C2=A0
> it if the user is able to interact via the=C2=A0
> network with the current image.=C2=A0=C2=A0This may=C2=A0
> require updates to the kernel and u-boot to=C2=A0
> leave a watchdog running in addition to=C2=A0
> clearing the boot source select.=C2=A0=C2=A0I am not=C2=A0
> aware of any test of booting from the alternate=C2=A0
> chip intentionally; I know several boots=C2=A0
> have worked with the old layout :-).
>=C2=A0
>=C2=A0
> =3D=3D=3D=3D=3D=3D
>=C2=A0
> The initramfs today provides several hooks to=C2=A0
> dump to the serial port a sulogin (root login)=C2=A0
> request if anything goes wrong.
>=C2=A0
> So, how much is making sure we find and mount the=C2=A0=C2=A0
> rootfs, how much is a developer recovering in=C2=A0
> system with help of the serial console, and how much
> is something else?
>=C2=A0
> >=C2=A0
> > Cheers,
> >=C2=A0
> > Joel
> >=C2=A0
> >=C2=A0
>=C2=A0
> milton
>=C2=A0
--=-yI/9MpmN1ZR8HVDEBiH5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZm8CFAAoJEJ0dnzgO5LT5MFQP/3kVUoJXupkGoMh7xB1Zwo5+
Du/VwmI0qOHN+Vty6VxHVeUq9bKFdHbEn4mKRqhBC2vD9cTW0lbGNDaL1IWwC0In
U7SgfJr9Dhfr71nMXFFh85sfyVdbky6qG8nKVB6gY7NnlFEyEZhnOWFO1fs0P/Rk
+Y6R3rjOPsju5rqvt/Mm6BBw5vOSd1CCymXJIoJk1HcpDqeXtXcXzZFQMr5rUtPP
UvhJvtMVQjeUFZDIsfNzy8E1yp9bUBx+3sAU/jZcVgBCs70HmigMVpuK1t16dJIp
MXIciQ4kj9ZZGe9XFKhw05hMQssAJwpQq9EYvvp46gxUnPI9D1PpAmUNlgHKXmFP
7YcNv2KxU7+JpRhLyW5dBi+eDdpbFdvxDroWyiofqUDnT6lQVRKXEoNEnsWDqqo4
LITLdAyQn1sQV2KrUDlNUErhzX71a6EmDO+C40cT3NKtW+XjDGyoqQbkOs+DRzn4
xxUOylisootmeB3fxasuK2eHWz+KABRLQ2l0zwlvy1prbMel1r+OxOr3M0x507QT
dHDgiDDUTFOVYrIccvfdQvSxPIgRg/K5fKYLLEolIv3JFsdW/aPQJXekdCMkuTSg
uLs3VXae0cB6sEN265kkpdGJOrcOCymz5jr8Q8rc/c7aMzS5A3YSvZFEufv5Du6n
InDz8B0dteEYehUCrvpo
=FpVs
-----END PGP SIGNATURE-----

--=-yI/9MpmN1ZR8HVDEBiH5--
