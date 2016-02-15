Return-Path: <andrew@aj.id.au>
Received: from homiemail-a101.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3B3831A033B
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2016 18:53:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Yoemp9Cq; 
 dkim-atps=neutral
Received: from homiemail-a101.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTP id D9C54117E06C
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2016 23:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 qHiN4l6kmuql9SmVbknzWDyO6Vg=; b=Yoemp9Cq9DPe6TPMDGYF9Y/Yy9QAsfVc
 OH7Kp3LjdBGrYiVEbih9doU8BAEnVsGksrzK9p70dx4Xs1TXjluCSenzIjpg/kde
 JeuZrm6z3YWjnQetSi2UjTx0GCmwIhGOfi4iygJSVA3MwN6c0B/PoVvhvErk2F7k
 5EqAaPBI7Mw=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a101.g.dreamhost.com (Postfix) with ESMTPSA id 6B8F8117E065
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2016 23:53:38 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH] openbmc: Use JFFS2 for RW overlay filesystem
Date: Mon, 15 Feb 2016 18:23:28 +1030
Message-Id: <1455522808-22864-2-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455522808-22864-1-git-send-email-andrew@aj.id.au>
References: <1455522808-22864-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Mon, 15 Feb 2016 07:53:41 -0000

We can enable JFFS2 support on mtd6 (the RW mtd partition) with a
(first-pass) kernel patch[1] applied to work-around a 'stutter' in the
(optimised) ARM mmiocpy() implementation.

Whilst the original scripting surrounding the filesystem selection aimed
to be generic, creating and mounting JFFS2 has some warts that seems to
require special-case logic.

[1] Unmerged, but tested: https://lists.ozlabs.org/pipermail/openbmc/2016-February/001874.html

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-phosphor/classes/image-overlay.bbclass        |  3 ++-
 meta-phosphor/classes/obmc-phosphor-image.bbclass  |  2 ++
 .../obmc-phosphor-image_types_uboot.bbclass        | 12 ++++++++++--
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 22 +++++++++++++++-------
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 13 +++++++++----
 5 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/meta-phosphor/classes/image-overlay.bbclass b/meta-phosphor/classes/image-overlay.bbclass
index 1c6137d..5043e82 100644
--- a/meta-phosphor/classes/image-overlay.bbclass
+++ b/meta-phosphor/classes/image-overlay.bbclass
@@ -3,7 +3,8 @@ INITRD_IMAGE ?= "core-image-minimal-initramfs"
 INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.${INITRD_CTYPE}${uboot}"
 
 IMAGE_BASETYPE ?= "squashfs-xz"
-OVERLAY_BASETYPE ?= "ext4"
+OVERLAY_BASETYPE ?= "jffs2"
+OVERLAY_BASETYPE_OPTS ?= "--pagesize=4096 --little-endian --squash"
 
 IMAGE_TYPES_${PN} += "${IMAGE_BASETYPE}"
 
diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index 9a13f7f..8afa1ea 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -38,4 +38,6 @@ IMAGE_INSTALL += " \
        packagegroup-obmc-phosphor-apps-extras \
        i2c-tools \
        screen \
+       mtd-utils-jffs2 \
+       mtd-utils-misc \
        "
diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index c390c36..dc69dc1 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -51,8 +51,16 @@ do_generate_flash() {
        fi
 
        oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimage initrd"
-       dd if=/dev/zero of=${ddir}/${rwfs} bs=1k count=${RWFS_SIZE}
-       mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
+
+       if [ x"${OVERLAY_BASETYPE}" = xjffs2 ]; then
+              mkfs.${OVERLAY_BASETYPE} ${OVERLAY_BASETYPE_OPTS} \
+                     --pad=$(expr ${RWFS_SIZE} \* 1024) \
+                     -o ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
+       else
+              dd if=/dev/zero of=${ddir}/${rwfs} bs=1k count=${RWFS_SIZE}
+              mkfs.${OVERLAY_BASETYPE} ${OVERLAY_BASETYPE_OPTS} \
+                     ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
+       fi
 
        dst="${ddir}/${FLASH_IMAGE_NAME}"
        rm -rf $dst
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 6750de3..226b199 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -65,18 +65,26 @@ then
 	cp /run/mtd:u-boot-env /run/fw_env
 fi
 
+rofst=squashfs
 rofs=$(findmtd rofs)
-rwfs=$(findmtd rwfs)
-
+roopts=ro
 rodev=/dev/mtdblock${rofs#mtd}
-rwdev=/dev/mtdblock${rwfs#mtd}
 
-rofst=squashfs
-rwfst=ext4
-roopts=ro
+rwfst=jffs2
+rwfs=$(findmtd rwfs)
 rwopts=rw
+rwdev=${rwfs}
+
+# mount.jffs2 requires the device node basename, not the absolute device node
+# path. But still support alternative filesystems through /dev/mtdblockX.
+if [ x"$rwfst" != xjffs2 ]; then
+	rwdev=/dev/mtdblock${rwdev#mtd}
+fi
 
 init=/sbin/init
+
+# There is no fsck for jffs2 - For rwfst=jffs2 just produces a warning in the
+# output about being unable to find the binary and the boot continues.
 fsck=/sbin/fsck.$rwfst
 fsckopts=-a
 
@@ -114,7 +122,7 @@ then
 	msg="$(cat)" << HERE
 
 Mounting read-write $rwdev filesystem failed.  Please fix and run
-	mount $rwdev $rwdir -t $rwfs -o $rwopts
+	mount $rwdev $rwdir -t $rwfst -o $rwopts
 to to continue, or do change nothing to run from RAM for this boot.
 HERE
 	debug_takeover "$msg"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index face06d..2bba4b0 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -35,13 +35,18 @@ findmtd() {
 	echo $m
 }
 
+rwfst=jffs2
 rwfs=$(findmtd rwfs)
-
-rwdev=/dev/mtdblock${rwfs#mtd}
-rwfst=ext4
 rwopts=rw
-rorwopts=ro${rwopts#rw}
+rwdev=${rwfs}
 
+# mount.jffs2 requires the device node basename, not the absolute device node
+# path. But still support alternative filesystems through /dev/mtdblockX.
+if [ x"$rwfst" != xjffs2 ]; then
+	rwdev=/dev/mtdblock${rwdev#mtd}
+fi
+
+rorwopts=ro${rwopts#rw}
 rwdir=rw
 upper=$rwdir/cow
 save=save/${upper##*/}
-- 
2.5.0
