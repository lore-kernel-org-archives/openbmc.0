Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7C3AF1A0166
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2016 15:40:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454301621272915.7491096454779;
 Sun, 31 Jan 2016 20:40:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <njames@us.ibm.com>,
	Norman James <nkskjames@gmail.com>
Subject: [PATCH openbmc] Create tarball of update files with correct names
Date: Sun, 31 Jan 2016 22:40:19 -0600
Message-Id: <1454301619-10500-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454301619-10500-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454301619-10500-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 01 Feb 2016 04:40:28 -0000

From: Norman James <njames@us.ibm.com>

Signed-off-by: Norman James <nkskjames@gmail.com>
---
 meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index 14e9289..29dbb87 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -65,4 +65,13 @@ do_generate_flash() {
        dstlink="${ddir}/${FLASH_IMAGE_LINK}"
        rm -rf $dstlink
        ln -sf ${FLASH_IMAGE_NAME} $dstlink
+
+       ln -sf ${FLASH_IMAGE_NAME} ${ddir}/image-bmc
+       ln -sf ${uboot} ${ddir}/image-u-boot
+       ln -sf ${kernel} ${ddir}/image-kernel
+       ln -sf ${uinitrd} ${ddir}/image-initramfs
+       ln -sf ${rootfs} ${ddir}/image-rofs
+
+       tar -h -cvf ${ddir}/${MACHINE}-${DATETIME}.all.tar -C ${ddir} image-bmc
+       tar -h -cvf ${ddir}/${MACHINE}-${DATETIME}.tar -C ${ddir} image-u-boot image-kernel image-initramfs image-rofs
 }
-- 
2.6.4
