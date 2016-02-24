Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 722A91A04DF
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 05:40:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456339232758737.8485579416753;
 Wed, 24 Feb 2016 10:40:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 5/9] openbmc: Lift mkfs opts to variables and use
 OVERRIDES capability
Date: Wed, 24 Feb 2016 12:40:20 -0600
Message-Id: <1456339224-27295-6-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 24 Feb 2016 18:40:39 -0000

From: Andrew Jeffery <andrew@aj.id.au>

Moves the ext4-specific mkfs options out to configuration variables.
OVERLAY_MKFS_OPTS can be overridden using the usual bitbake OVERRIDES
mechanism, where the override postfix is 'rwfs-${OVERLAY_BASETYPE}',
e.g. rwfs-ext4.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../classes/obmc-phosphor-image_types_uboot.bbclass        | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index 96193a3..adb86e0 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -23,6 +23,14 @@ FLASH_ROFS_OFFSET ?= "4864"
 FLASH_RWFS_OFFSET ?= "28672"
 RWFS_SIZE ?= "4096"
 
+# Allow rwfs mkfs configuration through OVERLAY_MKFS_OPTS and OVERRIDES. However,
+# avoid setting 'ext4' or 'jffs2' in OVERRIDES as such raw filesystem types are
+# reserved for the primary image (and setting them currently breaks the build).
+# Instead, prefix the overlay override value with 'rwfs-' to avoid collisions.
+DISTROOVERRIDES .= ":rwfs-${OVERLAY_BASETYPE}"
+
+OVERLAY_MKFS_OPTS_rwfs-ext4 = "-b 4096 -F -O^huge_file"
+
 # $(( ${FLASH_SIZE} - ${FLASH_RWFS_OFFSET} ))
 
 # IMAGE_POSTPROCESS_COMMAND += "do_generate_flash"
@@ -58,8 +66,12 @@ do_generate_flash() {
        fi
 
        oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimage initrd"
+
        mk_nor_image ${ddir}/${rwfs} ${RWFS_SIZE}
-       mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
+       if [ "${OVERLAY_BASETYPE}" != jffs2 ]; then
+              mkfs.${OVERLAY_BASETYPE} ${OVERLAY_MKFS_OPTS} ${ddir}/${rwfs} || \
+                     bbfatal "mkfs rwfs"
+       fi
 
        dst="${ddir}/${FLASH_IMAGE_NAME}"
        rm -rf $dst
-- 
2.7.1
