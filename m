Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A6A251A184F
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 10:10:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453331425767503.8660412901428;
 Wed, 20 Jan 2016 15:10:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH openbmc 6/6] phosphor: Create image class image-overlay and
 move phosphor to use it
Date: Wed, 20 Jan 2016 17:10:20 -0600
Message-Id: <1453331420-6524-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Wed, 20 Jan 2016 23:10:30 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

This commit creates a new class image-overlay based on how the
image-live class is structured.  It takes parameters for the base
and overlayed file system types but the initfs only support ext4
over squashfs presently.

It then moves invoking the generation of the flash image from a
post image creation command to a seperate task invoked from the
overlay image so that building the initramfs image by itself does
not try to create
a flash image.
---
 meta-phosphor/classes/image-overlay.bbclass        | 18 +++++++
 .../obmc-phosphor-image_types_uboot.bbclass        | 55 +++++++++++++++-------
 meta-phosphor/conf/distro/openbmc-phosphor.conf    |  1 +
 .../conf/machine/include/obmc-bsp-common.inc       | 10 +++-
 4 files changed, 65 insertions(+), 19 deletions(-)
 create mode 100644 meta-phosphor/classes/image-overlay.bbclass

diff --git a/meta-phosphor/classes/image-overlay.bbclass b/meta-phosphor/classes/image-overlay.bbclass
new file mode 100644
index 0000000..1c6137d
--- /dev/null
+++ b/meta-phosphor/classes/image-overlay.bbclass
@@ -0,0 +1,18 @@
+
+INITRD_IMAGE ?= "core-image-minimal-initramfs"
+INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.${INITRD_CTYPE}${uboot}"
+
+IMAGE_BASETYPE ?= "squashfs-xz"
+OVERLAY_BASETYPE ?= "ext4"
+
+IMAGE_TYPES_${PN} += "${IMAGE_BASETYPE}"
+
+IMAGE_TYPEDEP_overlay = "${IMAGE_BASETYPE} ${OVERLAY_BASETYPE}"
+IMAGE_TYPES_MASKED += "overlay"
+
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.${IMAGE_BASETYPE}"
+
+do_generate_flash[depends] += "${INITRD_IMAGE}:do_rootfs"
+do_generate_flash[depends] += "${PN}:do_rootfs"
+
+addtask generate_flash after do_rootfs before do_build
diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index 835e890..14e9289 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -4,44 +4,65 @@ inherit image_types_uboot
 # the image load address and entry point. Override it here.
 
 oe_mkimage () {
-    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
+    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_BASENAME} \
         -a ${INITRD_IMAGE_LOADADDRESS} -e ${INITRD_IMAGE_ENTRYPOINT} \
         -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
 }
 
 INITRD_IMAGE_ENTRYPOINT ?= "0x40800000"
 INITRD_IMAGE_LOADADDRESS ?= "${INITRD_IMAGE_ENTRYPOINT}"
+INITRD_LINK_NAME = "${INITRD_IMAGE}-${MACHINE}${INITRAMFS_FSTYPE}"
 
 FLASH_IMAGE_NAME ?= "flash-${MACHINE}-${DATETIME}"
 FLASH_IMAGE_LINK ?= "flash-${MACHINE}"
 
 FLASH_UBOOT_OFFSET ?= "0"
 FLASH_KERNEL_OFFSET ?= "512"
-FLASH_ROOTFS_OFFSET ?= "3072"
+FLASH_INITRD_OFFSET ?= "3072"
+FLASH_ROFS_OFFSET ?= "4864"
+FLASH_RWFS_OFFSET ?= "28672"
+RWFS_SIZE ?= "4096"
 
-IMAGE_POSTPROCESS_COMMAND += "do_generate_flash"
+# $(( ${FLASH_SIZE} - ${FLASH_RWFS_OFFSET} ))
+
+# IMAGE_POSTPROCESS_COMMAND += "do_generate_flash"
 
 do_generate_flash() {
-       kernel="${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
-       uboot="${DEPLOY_DIR_IMAGE}/u-boot.${UBOOT_SUFFIX}"
-       rootfs="${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.cpio.${IMAGE_CTYPE}.u-boot"
-       if [ ! -f $kernel ]; then
-              bbfatal "Kernel file ${kernel} does not exist"
+       INITRD_CTYPE=${INITRAMFS_CTYPE}
+       ddir="${DEPLOY_DIR_IMAGE}"
+       kernel="${KERNEL_IMAGETYPE}"
+       uboot="u-boot.${UBOOT_SUFFIX}"
+       initrd="${INITRD_LINK_NAME}.cpio.${INITRD_CTYPE}"
+       uinitrd="${initrd}.u-boot"
+       rootfs="${IMAGE_LINK_NAME}.${IMAGE_BASETYPE}"
+       rwfs="rwfs.${OVERLAY_BASETYPE}"
+
+       if [ ! -f $ddir/$kernel ]; then
+              bbfatal "Kernel file ${ddir}/${kernel} does not exist"
        fi
-       if [ ! -f $uboot ]; then
-              bbfatal "U-boot file ${uboot} does not exist"
+       if [ ! -f $ddir/$uboot ]; then
+              bbfatal "U-boot file ${ddir}/${uboot} does not exist"
        fi
-       if [ ! -f $rootfs ]; then
-              bbfatal "Rootfs file ${rootfs} does not exist"
+       if [ ! -f $ddir/$initrd ]; then
+              bbfatal "initrd file ${ddir}/${initrd} does not exist"
        fi
+       if [ ! -f $ddir/$rootfs ]; then
+              bbfatal "Rootfs file ${ddir}/${rootfs} does not exist"
+       fi
+
+       oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimage initrd"
+       dd if=/dev/zero of=${ddir}/${rwfs} bs=1k count=${RWFS_SIZE}
+       mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
 
-       dst="${DEPLOY_DIR_IMAGE}/${FLASH_IMAGE_NAME}"
+       dst="${ddir}/${FLASH_IMAGE_NAME}"
        rm -rf $dst
        dd if=/dev/zero of=${dst} bs=1k count=${FLASH_SIZE}
-       dd if=${uboot} of=${dst} bs=1k seek=${FLASH_UBOOT_OFFSET}
-       dd if=${kernel} of=${dst} bs=1k seek=${FLASH_KERNEL_OFFSET}
-       dd if=${rootfs} of=${dst} bs=1k seek=${FLASH_ROOTFS_OFFSET}
-       dstlink="${DEPLOY_DIR_IMAGE}/${FLASH_IMAGE_LINK}"
+       dd if=${ddir}/${uboot} of=${dst} bs=1k seek=${FLASH_UBOOT_OFFSET}
+       dd if=${ddir}/${kernel} of=${dst} bs=1k seek=${FLASH_KERNEL_OFFSET}
+       dd if=${ddir}/${uinitrd} of=${dst} bs=1k seek=${FLASH_INITRD_OFFSET}
+       dd if=${ddir}/${rootfs} of=${dst} bs=1k seek=${FLASH_ROFS_OFFSET}
+       dd if=${ddir}/${rwfs} of=${dst} bs=1k seek=${FLASH_RWFS_OFFSET}
+       dstlink="${ddir}/${FLASH_IMAGE_LINK}"
        rm -rf $dstlink
        ln -sf ${FLASH_IMAGE_NAME} $dstlink
 }
diff --git a/meta-phosphor/conf/distro/openbmc-phosphor.conf b/meta-phosphor/conf/distro/openbmc-phosphor.conf
index b59715d..418a98e 100644
--- a/meta-phosphor/conf/distro/openbmc-phosphor.conf
+++ b/meta-phosphor/conf/distro/openbmc-phosphor.conf
@@ -7,6 +7,7 @@ TARGET_VENDOR="-openbmc"
 
 GCCVERSION ?= "4.9.3"
 IMAGE_FSTYPES += "cpio.gz"
+IMAGE_FSTYPES += "squashfs-xz"
 IMAGE_LINGUAS = "en-us"
 
 VIRTUAL-RUNTIME_keymaps = ""
diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
index d7a681c..916fa48 100644
--- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
+++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
@@ -13,6 +13,12 @@ UBOOT_SUFFIX ?= "bin"
 
 MACHINEOVERRIDES =. "openbmc:"
 
+IMAGE_FSTYPES += "overlay"
+
 IMAGE_CLASSES += "obmc-phosphor-image_types_uboot"
-IMAGE_CTYPE = "lzma"
-IMAGE_FSTYPES += "cpio.${IMAGE_CTYPE}.u-boot"
+IMAGE_CLASSES += "image-overlay"
+
+INITRAMFS_CTYPE ?= "lzma"
+INITRAMFS_FSTYPES += "cpio.${INITRAMFS_CTYPE}"
+
+
-- 
2.6.4
