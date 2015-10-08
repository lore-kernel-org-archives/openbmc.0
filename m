Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 24E781A02AD
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2015 09:43:24 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 144434420211155.54624334754885;
 Thu, 8 Oct 2015 15:43:22 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/5] Add uboot image type specialization
Date: Thu,  8 Oct 2015 17:43:14 -0500
Message-Id: <1444344197-7122-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444344197-7122-1-git-send-email-patches@stwcx.xyz>
References: <1444344197-7122-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 22:43:25 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Combines all the build artifacts into a single flash image.
---
 .../obmc-phosphor-image_types_uboot.bbclass        | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass

diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
new file mode 100644
index 0000000..6652f3b
--- /dev/null
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -0,0 +1,47 @@
+inherit image_types_uboot
+
+# oe_mkimage() was defined in image_types_uboot. Howver, it does not consider
+# the image load address and entry point. Override it here.
+
+oe_mkimage () {
+    mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
+        -a ${INITRD_IMAGE_LOADADDRESS} -e ${INITRD_IMAGE_ENTRYPOINT} \
+        -d ${DEPLOY_DIR_IMAGE}/$1 ${DEPLOY_DIR_IMAGE}/$1.u-boot
+}
+
+INITRD_IMAGE_ENTRYPOINT ?= "0x42000000"
+INITRD_IMAGE_LOADADDRESS ?= "${INITRD_IMAGE_ENTRYPOINT}"
+
+FLASH_IMAGE_NAME ?= "flash-${MACHINE}-${DATETIME}"
+FLASH_IMAGE_LINK ?= "flash-${MACHINE}"
+
+FLASH_UBOOT_OFFSET ?= "0"
+FLASH_KERNEL_OFFSET ?= "512"
+FLASH_ROOTFS_OFFSET ?= "3072"
+
+IMAGE_POSTPROCESS_COMMAND += "do_generate_flash"
+
+do_generate_flash() {
+       kernel="${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
+       uboot="${DEPLOY_DIR_IMAGE}/u-boot.${UBOOT_SUFFIX}"
+       rootfs="${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.cpio.${IMAGE_CTYPE}.u-boot"
+       if [ ! -f $kernel ]; then
+              bbfatal "Kernel file ${kernel} does not exist"
+       fi
+       if [ ! -f $uboot ]; then
+              bbfatal "U-boot file ${uboot} does not exist"
+       fi
+       if [ ! -f $rootfs ]; then
+              bbfatal "Rootfs file ${rootfs} does not exist"
+       fi
+
+       dst="${DEPLOY_DIR_IMAGE}/${FLASH_IMAGE_NAME}"
+       rm -rf $dst
+       dd if=/dev/zero of=${dst} bs=1k count=${FLASH_SIZE}
+       dd if=${uboot} of=${dst} bs=1k seek=${FLASH_UBOOT_OFFSET}
+       dd if=${kernel} of=${dst} bs=1k seek=${FLASH_KERNEL_OFFSET}
+       dd if=${rootfs} of=${dst} bs=1k seek=${FLASH_ROOTFS_OFFSET}
+       dstlink="${DEPLOY_DIR_IMAGE}/${FLASH_IMAGE_LINK}"
+       rm -rf $dstlink
+       ln -sf ${FLASH_IMAGE_NAME} $dstlink
+}
-- 
2.6.0
