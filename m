Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbqj46xmmzDqlc
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 06:30:48 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466800244831366.93539084052395;
 Fri, 24 Jun 2016 13:30:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc v9 06/10] obmc-phosphor-image: Improper use of DATETIME
Date: Fri, 24 Jun 2016 15:30:30 -0500
Message-Id: <20160624203034.29228-7-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160624203034.29228-1-openbmc-patches@stwcx.xyz>
References: <20160624203034.29228-1-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Fri, 24 Jun 2016 20:30:50 -0000

From: Patrick Williams <patrick@stwcx.xyz>

The use of the DATETIME variable has issues with the sstate cache
because of the variable changing values, and therefore the checksum
used for sstate calculation also changing.

Other existing recipes add DATETIME to the 'vardepsexclude' list.
This case is glossed over very rapidly in section 21.3.2 "Checksums"
of the Mega Manual.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index adb86e0..c44139e 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -14,6 +14,7 @@ INITRD_IMAGE_LOADADDRESS ?= "${INITRD_IMAGE_ENTRYPOINT}"
 INITRD_LINK_NAME = "${INITRD_IMAGE}-${MACHINE}${INITRAMFS_FSTYPE}"
 
 FLASH_IMAGE_NAME ?= "flash-${MACHINE}-${DATETIME}"
+FLASH_IMAGE_NAME[vardepsexclude] = "DATETIME"
 FLASH_IMAGE_LINK ?= "flash-${MACHINE}"
 
 FLASH_UBOOT_OFFSET ?= "0"
@@ -95,3 +96,4 @@ do_generate_flash() {
        tar -h -cvf ${ddir}/${MACHINE}-${DATETIME}.all.tar -C ${ddir} image-bmc
        tar -h -cvf ${ddir}/${MACHINE}-${DATETIME}.tar -C ${ddir} image-u-boot image-kernel image-initramfs image-rofs image-rwfs
 }
+do_generate_flash[vardepsexclude] = "DATETIME"
-- 
2.9.0
