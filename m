Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8C2001A04F9
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 05:40:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456339231346233.53027835004355;
 Wed, 24 Feb 2016 10:40:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 4/9] openbmc: Generate images with empty NOR sections
 in the erased state
Date: Wed, 24 Feb 2016 12:40:19 -0600
Message-Id: <1456339224-27295-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 24 Feb 2016 18:40:38 -0000

From: Andrew Jeffery <andrew@aj.id.au>

An erased NOR partition is considered to be a valid JFFS2 filesystem
(i.e. can be successfully mounted as JFFS2). As such there's no need to
execute mkfs to produce an empty JFFS2 image if the target partition is
in the erased state. Thus, when generating the flash-palmetto and
image-rwfs image files, start with a base image file in the erased state
(with all bits set).

The change shifts the common logic to generate the base image files into
a shell function.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index bf987bb..96193a3 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -27,6 +27,13 @@ RWFS_SIZE ?= "4096"
 
 # IMAGE_POSTPROCESS_COMMAND += "do_generate_flash"
 
+mk_nor_image() {
+       image_dst="$1"
+       image_size_kb=$2
+       dd if=/dev/zero bs=1k count=${image_size_kb} \
+              | tr '\000' '\377' > ${image_dst}
+}
+
 do_generate_flash() {
        INITRD_CTYPE=${INITRAMFS_CTYPE}
        ddir="${DEPLOY_DIR_IMAGE}"
@@ -51,12 +58,12 @@ do_generate_flash() {
        fi
 
        oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimage initrd"
-       dd if=/dev/zero of=${ddir}/${rwfs} bs=1k count=${RWFS_SIZE}
+       mk_nor_image ${ddir}/${rwfs} ${RWFS_SIZE}
        mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
 
        dst="${ddir}/${FLASH_IMAGE_NAME}"
        rm -rf $dst
-       dd if=/dev/zero of=${dst} bs=1k count=${FLASH_SIZE}
+       mk_nor_image ${dst} ${FLASH_SIZE}
        dd if=${ddir}/${uboot} of=${dst} bs=1k seek=${FLASH_UBOOT_OFFSET}
        dd if=${ddir}/${kernel} of=${dst} bs=1k seek=${FLASH_KERNEL_OFFSET}
        dd if=${ddir}/${uinitrd} of=${dst} bs=1k seek=${FLASH_INITRD_OFFSET}
-- 
2.7.1
