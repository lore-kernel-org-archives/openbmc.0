Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcYQS4Z0TzDqlk
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:50:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466902235130143.45078672942066;
 Sat, 25 Jun 2016 17:50:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v7 01/15] image_types_uboot: Don't truncate when
 assembling flash
Date: Sat, 25 Jun 2016 19:50:19 -0500
Message-Id: <20160626005033.21336-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160626005033.21336-1-openbmc-patches@stwcx.xyz>
References: <20160626005033.21336-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jun 2016 00:50:41 -0000

From: Milton Miller <miltonm@us.ibm.com>

The generate_flash_image step was creating a file then using dd to
fill in the pieces, but missed adding the conv=notrunc flag, so each
step was shortening the file to its output.

Add the forgotten conversion flag to each dd command.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index adb86e0..67a389f 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -76,11 +76,11 @@ do_generate_flash() {
        dst="${ddir}/${FLASH_IMAGE_NAME}"
        rm -rf $dst
        mk_nor_image ${dst} ${FLASH_SIZE}
-       dd if=${ddir}/${uboot} of=${dst} bs=1k seek=${FLASH_UBOOT_OFFSET}
-       dd if=${ddir}/${kernel} of=${dst} bs=1k seek=${FLASH_KERNEL_OFFSET}
-       dd if=${ddir}/${uinitrd} of=${dst} bs=1k seek=${FLASH_INITRD_OFFSET}
-       dd if=${ddir}/${rootfs} of=${dst} bs=1k seek=${FLASH_ROFS_OFFSET}
-       dd if=${ddir}/${rwfs} of=${dst} bs=1k seek=${FLASH_RWFS_OFFSET}
+       dd if=${ddir}/${uboot} of=${dst} bs=1k conv=notrunc seek=${FLASH_UBOOT_OFFSET}
+       dd if=${ddir}/${kernel} of=${dst} bs=1k conv=notrunc seek=${FLASH_KERNEL_OFFSET}
+       dd if=${ddir}/${uinitrd} of=${dst} bs=1k conv=notrunc seek=${FLASH_INITRD_OFFSET}
+       dd if=${ddir}/${rootfs} of=${dst} bs=1k conv=notrunc seek=${FLASH_ROFS_OFFSET}
+       dd if=${ddir}/${rwfs} of=${dst} bs=1k conv=notrunc seek=${FLASH_RWFS_OFFSET}
        dstlink="${ddir}/${FLASH_IMAGE_LINK}"
        rm -rf $dstlink
        ln -sf ${FLASH_IMAGE_NAME} $dstlink
-- 
2.9.0
