Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 579361A0018
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2016 18:10:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=qw1NLjUf; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 72662604079;
 Tue, 16 Feb 2016 23:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=7GcifmwpjKuBZ/hsO9vJG
 MS1YzY=; b=qw1NLjUfnOZIRk9FeyFmO3GzMncE/9oEAr5zcoJfRXSQYECdQ3i/R
 a2G2aYxJiyym7zgF7/o3jNBN+B0LrVScwvrY06fpNeJPjdaKnOkP/lV+BP1flzdb
 YPUSeVZSYc2/6ig2tJ1n9PG3QLUHkvWmhXXy2uenGQ5TsYYhD1TsMo=
Received: from nat104.cor1.adl1.base64.com.au (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id A216A604078;
 Tue, 16 Feb 2016 23:10:13 -0800 (PST)
Message-ID: <1455692990.3022.82.camel@aj.id.au>
Subject: Re: [RFC PATCH] openbmc: Use JFFS2 for RW overlay filesystem
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Milton Miller II <miltonm@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Date: Wed, 17 Feb 2016 17:39:50 +1030
In-Reply-To: <201602160011.u1G0B2KG009069@d03av04.boulder.ibm.com>
References: <1455522808-22864-2-git-send-email-andrew@aj.id.au>
 ,<1455522808-22864-1-git-send-email-andrew@aj.id.au>
 <201602160011.u1G0B2KG009069@d03av04.boulder.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Efqdbi069STRjILLA9EN"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 17 Feb 2016 07:10:17 -0000


--=-Efqdbi069STRjILLA9EN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Milton,

Well - with prompts you gave me below the patch has been significantly
reduced and is much less twisty. It seems I sent myself off down rabbit
holes on several fronts.

On Tue, 2016-02-16 at 00:10 +0000, Milton Miller II wrote:
> Hi Andrew.
>=20
> You got ahead of me and explored some issues, thanks.  I wasn't thinking
> about some of the details but I had plans for some others, and had been
> manually changing the type on my own system (causing someone to re-flash
> when it didn't boot for them.  cie la vie.
>=20
>=20
> On  02/15/2016 around 01:54AM in some timezone,  Andrew Jeffery wrote:
> > Subject: [RFC PATCH] openbmc: Use JFFS2 for RW overlay filesystem
> >=20
> > We can enable JFFS2 support on mtd6 (the RW mtd partition) with a
> > (first-pass) kernel patch[1] applied to work-around a 'stutter' in the
> > (optimised) ARM mmiocpy() implementation.
>=20
> optimised is flagged in my spell checker.

Hah - do we have a preference for US vs UK spelling? I don't mind.

>=20
> >=20
> > Whilst the original scripting surrounding the filesystem selection aime=
d
> > to be generic, creating and mounting JFFS2 has some warts that seems to
> > require special-case logic.
>=20
> Or at least some versions of the tools think so :-)

Right - for some reason it was in my head that the mount.jffs2 helper
was required and overlooked the fact that busybox would mount it out-of
-the-box. Additionally I figured we'd want to access /dev/mtd6 rather
than go through the block emulation layer and I don't think busybox was
happy about that? Anyway, this all lead to dragging in mtd-utils-jffs2.
I've thrown that out and just used busybox.

>=20
> >=20
> > [1] Unmerged, but tested: https://lists.ozlabs.org/pipermail/openbmc/20=
16-February/001874.html
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  meta-phosphor/classes/image-overlay.bbclass        |  3 ++-
> >  meta-phosphor/classes/obmc-phosphor-image.bbclass  |  2 ++
> >  .../obmc-phosphor-image_types_uboot.bbclass        | 12 ++++++++++--
> >  .../obmc-phosphor-initfs/files/obmc-init.sh        | 22 ++++++++++++++=
+-------
> >  .../obmc-phosphor-initfs/files/obmc-update.sh      | 13 +++++++++----
> >  5 files changed, 38 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/meta-phosphor/classes/image-overlay.bbclass b/meta-phospho=
r/classes/image-overlay.bbclass
> > index 1c6137d..5043e82 100644
> > --- a/meta-phosphor/classes/image-overlay.bbclass
> > +++ b/meta-phosphor/classes/image-overlay.bbclass
> > @@ -3,7 +3,8 @@ INITRD_IMAGE ?=3D "core-image-minimal-initramfs"
> >  INITRD ?=3D "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.${INI=
TRD_CTYPE}${uboot}"
> > =20
> >  IMAGE_BASETYPE ?=3D "squashfs-xz"
> > -OVERLAY_BASETYPE ?=3D "ext4"
> > +OVERLAY_BASETYPE ?=3D "jffs2"
> > +OVERLAY_BASETYPE_OPTS ?=3D "--pagesize=3D4096 --little-endian --squash=
"
> > =20
>=20
> Lots of options on that mkfs.   Not sure what the --squash flag would be =
for.

Hah, yeah that was some over-enthusiasm with options. Would've helped
if I actually followed through on reading what the option was for.
Instead, I've defined OVERLAY_BASETYPE_OPTS with the ext4 options and
commented it out, as it's not used unless OVERLAY_BASETYPE is not jffs2
(see below).

>=20
> >  IMAGE_TYPES_${PN} +=3D "${IMAGE_BASETYPE}"
> > =20
> diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-pho=
sphor/classes/obmc-phosphor-image.bbclass
> index 9a13f7f..8afa1ea 100644
> --- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
> +++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
> @@ -38,4 +38,6 @@ IMAGE_INSTALL +=3D " \
>         packagegroup-obmc-phosphor-apps-extras \
>         i2c-tools \
>         screen \
> +       mtd-utils-jffs2 \
> +       mtd-utils-misc \
>         "
>=20
> You say below that there is no fsck.jffs2, so why are you adding=20
> mtd-utils instead of using the busybox built-in files?  Also, the=20
> u-boot utilities seem to be ok to compile with out adding these to=20
> the package list.

I've dropped them, as above.

>=20
> > diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbcl=
ass b/meta-phosphor/classes/obmc-phosphor-
> > image_types_uboot.bbclass
> > index c390c36..dc69dc1 100644
> > --- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> > +++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> > @@ -51,8 +51,16 @@ do_generate_flash() {
> >         fi
> > =20
> >         oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimag=
e initrd"
> > -       dd if=3D/dev/zero of=3D${ddir}/${rwfs} bs=3D1k count=3D${RWFS_S=
IZE}
> > -       mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs=
} || bbfatal "mkfs rwfs"
> > +
> > +       if [ x"${OVERLAY_BASETYPE}" =3D xjffs2 ]; then
> > +              mkfs.${OVERLAY_BASETYPE} ${OVERLAY_BASETYPE_OPTS} \
> > +                     --pad=3D$(expr ${RWFS_SIZE} \* 1024) \
> > +                     -o ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
> > +       else
> > +              dd if=3D/dev/zero of=3D${ddir}/${rwfs} bs=3D1k count=3D$=
{RWFS_SIZE}
> > +              mkfs.${OVERLAY_BASETYPE} ${OVERLAY_BASETYPE_OPTS} \
> > +                     ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
> > +       fi
> >=20
>=20
> That seems like a lot of logic including special caseing the type but the=
n using the variable,=20
> and some kind of --pad option.

--pad was needed to set the output to a specific size when using mtd
-utils mkfs.jffs2.

>    However, it was pointed out to me while I originally used=20
> the -j option on the busybox flash_eraseall  command, which writes 1985 t=
o each erase block,=20
> the Facebook and other code just did erase_all and mount.  Investigation =
shows jffs2 seems=20
> to be very happy with a blank NOR flash; I suspect the markers may be mor=
e for NAND and/or=20
> RAM.
>=20
> Also while there were some ext4 specific options not in variables they sh=
ould be moved there
> before switching the type so it will be easier to go back (if, for instan=
ce, someone wants=20
> to use managed nand eg emmc or usb for their read-write storage).

Yeah, done.

>=20
> So, my suggestion here for empty mkfs.jffs2:
>=20
> dd (size options) | tr '\x00' '\xff'

I've now unconditionally done this, and then special-cased the call to
mkfs.${OVERLAY_BASETYPE}. The only issue was tr doesn't seem to parse
'\xNN'? I've used octal instead (tr '\000' '\377').

>=20
>=20
> > diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs=
/files/obmc-init.sh b/meta-phosphor/common
> > /recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
> > index 6750de3..226b199 100644
> > --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/=
obmc-init.sh
> > +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/=
obmc-init.sh
> > @@ -65,18 +65,26 @@ then
> >  > > 	> > cp /run/mtd:u-boot-env /run/fw_env
> >  fi
> > =20
> > +rofst=3Dsquashfs
> >  rofs=3D$(findmtd rofs)
> > -rwfs=3D$(findmtd rwfs)
> > -
> > +roopts=3Dro
> >  rodev=3D/dev/mtdblock${rofs#mtd}
> > -rwdev=3D/dev/mtdblock${rwfs#mtd}
> > =20
> > -rofst=3Dsquashfs
> > -rwfst=3Dext4
> > -roopts=3Dro
> > +rwfst=3Djffs2
> > +rwfs=3D$(findmtd rwfs)
> >  rwopts=3Drw
> > +rwdev=3D${rwfs}
> > +
>=20
> You seem to have reordered the lines for a different grouping.=20
>  That's probably ok but please do it in a seperate patch either
> before or after changing the file system type.

I re-ordered it so that the rwdev munging made (slightly) more sense.
I've now dropped all of this munging and re-arranging as we can
continue to use /dev/mtdblockX as you pointed out.

>=20
> > +# mount.jffs2 requires the device node basename, not the absolute devi=
ce node
> > +# path. But still support alternative filesystems through /dev/mtdbloc=
kX.
> > +if [ x"$rwfst" !=3D xjffs2 ]; then
> > +> > 	> > rwdev=3D/dev/mtdblock${rwdev#mtd}
> > +fi
>=20
> The kernel mount system call is very happy to accept the /dev/mtdblockX a=
nd=20
> I have been doing all my testing by just changing rwfst.  If the mount.jf=
fs2=20
> that you added from mtdutils does not accept this then not only is it a w=
aste=20
> of space but actively harmeful. =20
>=20
> Please remove that broken code from the build and try without.  Busybox m=
ount
> seems to be fine when the fstype is listed.
>=20
> Alternatively the kernel accepts mtd: where name is the mtd name.  While=
=20
> that is useful I have not checked if squashfs is happy with that, and it =
makes=20
> it harder to switch to other fs types (eg loop mount).

I've dropped the change and kept rwdev as /dev/mtdblockX

>=20
> =20
> >  init=3D/sbin/init
> > +
> > +# There is no fsck for jffs2 - For rwfst=3Djffs2 just produces a warni=
ng in the
> > +# output about being unable to find the binary and the boot continues.
>=20
> That is true, or we could create a link to /bin/true.  The comment it not=
=20
> given to the screen where the user sees the message.=20
> > >=20
 Mounting read-write $rwdev filesystem failed.  Please fix and run
> > -> > 	> > mount $rwdev $rwdir -t $rwfs -o $rwopts
> > +> > 	> > mount $rwdev $rwdir -t $rwfst -o $rwopts
> >  to to continue, or do change nothing to run from RAM for this boot.
> >  HERE
>=20
> Good catch, I must not have tried to cut and paste that.
> It should arguably be a seperate patch.

Done

>=20
>=20
> > diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs=
/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor=
-initfs/files/obmc-update.sh
> > index face06d..2bba4b0 100755
> > --- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/=
obmc-update.sh
> > +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/=
obmc-update.sh
> > @@ -35,13 +35,18 @@ findmtd() {
>=20
> [ Same comments about variable order changes and updates in update script=
 ]
>=20

Yeah, these rearrangements are no-longer part of the patch.

Cheers,

Andrew

>=20
> But I also had plans to have the concept of "old" and "new" rwfst , where=
 update
> would check for the fs mounting as the old type before but be mounted wit=
h the
> new type after the update.
>=20
> Its a bit tricky because jffs2 will try to mount anything but complain ab=
out erase=20
> marks on every block that it can not parse.  ext4 relies on magic numbers=
 and so=20
> should always be tried before jffs2.
>=20
> Also I was thinking about taking advantage of flash_eraseall being an ali=
as for=20
> mkfs.jffs2 and doing the wipe in more cases, maybe by an alternate trigge=
r file.  I
> don't want to do it for a u-boot-env update but probably should when we d=
o=20
> image-rofs.
>=20
>=20
> I have a patch series to split the whitelist into pieces that affects mos=
tly=20
> update (and a rename in init).  I didn't post it because I wanted a chanc=
e to=20
> review it and had yet to investigate making moving the files in the build=
=20
> system.  I will probably send that tomorrow.  Actually the merge looks ea=
sy its=20
> all contained to the save loop block; most of the work is in the recipe.
>=20
>=20
>=20
> Thanks,
> milton
>=20
--=-Efqdbi069STRjILLA9EN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWxBy+AAoJEJ0dnzgO5LT5d5MP/1s/OBjHK2rpCvuQNSuATw1s
IqC97vKz/QGZ5U8yAxPk0ZhvUnjksEymljpa6EI/+BHSLLlzQTekad8d4mES/7k7
X0sHIJLG39zFZtTpZdD3ZTU3OH/fukaNujbR4NTnIsjpXeDvrDJjes7xOeKp0QvG
qr9Ncy3EhgWav8CTJcDILhyN8ZkWe86XmMKgo4/8biuwKUP+ipUiePWAa2vY5GE/
tge1xyjFgxgeMIZaE4ZdHVRmsob+sq3INSda8JhODqMHYOuew91vwA0sINNdy93S
fQ/5+B6aI7XPQAe34GF36ZY/aJTqb2MyTHODiJ1M8Bxtp5/pwDA8f/G7pfqjTf+D
9tlghICcMSEB7M/aXZP+c7ujN0r+hFMDSo89e39pN+CVlzipn9GmY8MYBdteYPCO
eOepYJ+U+DkHlGcuB2JSA4HpHKr2CfM9BTMbB6iFt3tfqwBkEzg4I8vtGHUNs/Hp
IxJkKv2fG53UXnSS7ikyrH+rgg/LmG2C/udH7VRnP5jpeW5ZmqD5r6oaXibyFcRR
GsP7T6yGDBTx2JpEh3O2m88OgcJKsWu6dljFkGhRp2hw3i8aOymRzJm94FXBKuPP
5hkh9l54+/2/LYGwXPI96n8kJQ2ZjhBT+yOQL55TmxWRIoaT2mbdge5t+eoFTInC
AvRKRLnzhSMt5crb5Dt9
=ut5j
-----END PGP SIGNATURE-----

--=-Efqdbi069STRjILLA9EN--
