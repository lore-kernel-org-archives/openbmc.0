Return-Path: <andrew@aj.id.au>
Received: from homiemail-a17.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 21E7B1A0018
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2016 18:27:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=EP4nYYb4; 
 dkim-atps=neutral
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id 39A572B206D;
 Tue, 16 Feb 2016 23:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 6EV5pkQUegIzqtqnXky/lM6bsoo=; b=EP4nYYb4m3938+huv/HIBPSjjawrRvWS
 m+t8yx2yDpBJN+ELel4kGY4gJ+XWIzSMzCo1egFSeVLzcWrZhdJzyRQmch+a73JL
 W9ktjJnko3xc9yZ9yd4hxaucxcWGOTZJRwoIJ7ua3aNozWuPapIxlgmXXs81e66l
 mBFQJEc2Xmk=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id A01842B206A;
 Tue, 16 Feb 2016 23:27:27 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH v2 2/2] openbmc: Use JFFS2 for RW overlay filesystem
Date: Wed, 17 Feb 2016 17:57:18 +1030
Message-Id: <1455694038-29771-3-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455694038-29771-1-git-send-email-andrew@aj.id.au>
References: <1455694038-29771-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 17 Feb 2016 07:27:29 -0000

We can enable JFFS2 support on mtd6 (the RW mtd partition) with a
(first-pass) kernel patch[1] applied to work-around a 'stutter' in the
(optimised) ARM mmiocpy() implementation.

[1] Unmerged, but tested: https://lists.ozlabs.org/pipermail/openbmc/2016-February/001874.html

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-phosphor/classes/image-overlay.bbclass                |  7 ++++++-
 .../classes/obmc-phosphor-image_types_uboot.bbclass        | 14 ++++++++++++--
 .../obmc-phosphor-initfs/files/obmc-init.sh                |  2 +-
 .../obmc-phosphor-initfs/files/obmc-update.sh              |  2 +-
 4 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/classes/image-overlay.bbclass b/meta-phosphor/classes/image-overlay.bbclass
index 1c6137d..9203955 100644
--- a/meta-phosphor/classes/image-overlay.bbclass
+++ b/meta-phosphor/classes/image-overlay.bbclass
@@ -3,7 +3,12 @@ INITRD_IMAGE ?= "core-image-minimal-initramfs"
 INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.${INITRD_CTYPE}${uboot}"
 
 IMAGE_BASETYPE ?= "squashfs-xz"
-OVERLAY_BASETYPE ?= "ext4"
+OVERLAY_BASETYPE ?= "jffs2"
+
+# Note: OVERLAY_BASETYPE_OPTS is not used when OVERLAY_BASETYPE=jffs2
+# Options for when OVERLAY_BASETYPE=ext4
+#
+# OVERLAY_BASETYPE_OPTS ?= "-b 4096 -F -O^huge_file"
 
 IMAGE_TYPES_${PN} += "${IMAGE_BASETYPE}"
 
diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index c390c36..abbbe75 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -51,8 +51,18 @@ do_generate_flash() {
        fi
 
        oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimage initrd"
-       dd if=/dev/zero of=${ddir}/${rwfs} bs=1k count=${RWFS_SIZE}
-       mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
+
+       # Set all the bits to effecitvely erase the RW partition on the NOR when
+       # the image is written
+       dd if=/dev/zero bs=1k count=${RWFS_SIZE} \
+              | tr '\000' '\377' > ${ddir}/${rwfs}
+       if [ "${OVERLAY_BASETYPE}" != jffs2 ]; then
+              # jffs2 can mount an erased filesystem as if it were formatted,
+              # so don't bother formatting unless we're configured to use
+              # something different.
+              mkfs.${OVERLAY_BASETYPE} ${OVERLAY_BASETYPE_OPTS} \
+                     ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
+       fi
 
        dst="${ddir}/${FLASH_IMAGE_NAME}"
        rm -rf $dst
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 9674765..f1e448b 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -72,7 +72,7 @@ rodev=/dev/mtdblock${rofs#mtd}
 rwdev=/dev/mtdblock${rwfs#mtd}
 
 rofst=squashfs
-rwfst=ext4
+rwfst=jffs2
 roopts=ro
 rwopts=rw
 
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index face06d..4b08e17 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -38,7 +38,7 @@ findmtd() {
 rwfs=$(findmtd rwfs)
 
 rwdev=/dev/mtdblock${rwfs#mtd}
-rwfst=ext4
+rwfst=jffs2
 rwopts=rw
 rorwopts=ro${rwopts#rw}
 
-- 
2.5.0
