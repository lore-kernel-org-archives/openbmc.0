Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTq3M3swxzDqhF
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 11:40:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465954843736984.8142019929854;
 Tue, 14 Jun 2016 18:40:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v4 10/10] image-types_uboot: Package a self contained
 netboot image
Date: Tue, 14 Jun 2016 20:40:31 -0500
Message-Id: <20160615014031.32062-11-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615014031.32062-1-openbmc-patches@stwcx.xyz>
References: <20160615014031.32062-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 01:40:48 -0000

From: Milton Miller <miltonm@us.ibm.com>

Create a cpio containing the base read-only image, and create a
single combined initramfs image consisting of the image-rofs
and the existing initramfs.

There has been a desire to have a self contained netboot image present
for developer testing and experimentation.   The init script already
supports having the rofs layer sourced from a file packaged into the
initramfs, and will use it if found.

While this image will not fit in the current flash layout in
the initrd space, it will load over the network.  This method
leaves the squashfs compressed in RAM, decompreses is invoked as
needed at runtime, trading boot time and memory space for runtime
decompress on demand.  This will also give similar file access
overheads and performance to reading the data from flash.

Because the rofs is already compressed with xz compression,
don't try to compress this cpio (the cpio packaging adds about 40
bytes of ascii before and after, plus some alignment padding).
Because the kernel requires uncompressed cpios to appear on a
4-byte boundary with 0 byte fill between archives, place this
cpio first in the combined image.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index 164d1ed..1c0d9b0 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -51,6 +51,8 @@ do_generate_flash() {
        uinitrd="${initrd}.u-boot"
        rootfs="${IMAGE_LINK_NAME}.${IMAGE_BASETYPE}"
        rwfs="rwfs.${OVERLAY_BASETYPE}"
+       rofsimg=rofs.${IMAGE_BASETYPE}.cpio
+       netimg=initramfs-netboot.cpio
 
        if [ ! -f $ddir/$kernel ]; then
               bbfatal "Kernel file ${ddir}/${kernel} does not exist"
@@ -94,4 +96,12 @@ do_generate_flash() {
 
        tar -h -cvf ${ddir}/${MACHINE}-${DATETIME}.all.tar -C ${ddir} image-bmc
        tar -h -cvf ${ddir}/${MACHINE}-${DATETIME}.tar -C ${ddir} image-u-boot image-kernel image-initramfs image-rofs image-rwfs
+
+       # Package the root image (rofs layer) with the initramfs for net booting.
+       # Uses the symlink above to get the desired name in the cpio
+       ( cd $ddir && echo image-rofs | cpio -oHnewc -L > ${rofsimg} )
+       # Prepend the rofs cpio -- being uncompressed it must be 4-byte aligned
+       cat ${ddir}/${rofsimg} ${ddir}/${initrd} > ${ddir}/${netimg}
+       oe_mkimage  "${netimg}" "${INITRD_CTYPE}"
+
 }
-- 
2.8.4
