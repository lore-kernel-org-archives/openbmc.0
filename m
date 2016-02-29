Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B31A31A03DF
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 05:49:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456771230668576.4180289493173;
 Mon, 29 Feb 2016 10:40:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 2/2] Don't inherit image-overlay by default
Date: Mon, 29 Feb 2016 12:40:23 -0600
Message-Id: <1456771223-7654-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456771223-7654-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456771223-7654-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Mon, 29 Feb 2016 18:49:26 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This attempts to address a race condition in the build where
we attempt to build a complete flash image before all the sub-images
are available (specifically the initramfs image).

Any classes in IMAGE_CLASSES are inherited by all image recipes, including
the initramfs image.  OE-Core's live/hddimg recipes address this
by pulling in the class configuration in recipe scope, rather than
global scope.  Copy that behavior here.
---
 meta-phosphor/classes/image-overlay.bbclass            | 8 +++++---
 meta-phosphor/classes/obmc-phosphor-image.bbclass      | 7 +++++++
 meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 1 -
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/classes/image-overlay.bbclass b/meta-phosphor/classes/image-overlay.bbclass
index 8997aae..71768a6 100644
--- a/meta-phosphor/classes/image-overlay.bbclass
+++ b/meta-phosphor/classes/image-overlay.bbclass
@@ -1,3 +1,5 @@
+PACKAGES = " "
+EXCLUDE_FROM_WORLD = "1"
 
 INITRD_IMAGE ?= "core-image-minimal-initramfs"
 INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.${INITRD_CTYPE}${uboot}"
@@ -5,9 +7,9 @@ INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.${INITRD_CTYPE}${
 IMAGE_BASETYPE ?= "squashfs-xz"
 OVERLAY_BASETYPE ?= "jffs2"
 
-IMAGE_TYPES_${PN} += "${IMAGE_BASETYPE}"
+IMAGE_TYPES += "overlay"
 
-IMAGE_TYPEDEP_overlay = "${IMAGE_BASETYPE} ${OVERLAY_BASETYPE}"
+IMAGE_TYPEDEP_overlay = "${IMAGE_BASETYPE}"
 IMAGE_TYPES_MASKED += "overlay"
 
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.${IMAGE_BASETYPE}"
@@ -15,4 +17,4 @@ ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.${IMAGE_BASETYPE}"
 do_generate_flash[depends] += "${INITRD_IMAGE}:do_rootfs"
 do_generate_flash[depends] += "${PN}:do_rootfs"
 
-addtask generate_flash after do_rootfs before do_build
+addtask generate_flash before do_build
diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index 811bbd3..0d4a0d0 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -42,3 +42,10 @@ IMAGE_INSTALL += " \
         i2c-tools \
         screen \
         "
+
+def build_overlay(d):
+        if bb.utils.contains("IMAGE_FSTYPES", "overlay", "overlay", "0", d) != "0":
+                return "image-overlay"
+        return ""
+
+inherit ${@build_overlay(d)}
diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
index fb6cc8c..60ed088 100644
--- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
+++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
@@ -17,7 +17,6 @@ IMAGE_FSTYPES += "overlay"
 IMAGE_INSTALL += "u-boot-fw-utils"
 
 IMAGE_CLASSES += "obmc-phosphor-image_types_uboot"
-IMAGE_CLASSES += "image-overlay"
 
 INITRAMFS_CTYPE ?= "lzma"
 INITRAMFS_FSTYPES += "cpio.${INITRAMFS_CTYPE}"
-- 
2.7.1
