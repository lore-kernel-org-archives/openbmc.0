Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbppv33XxzDqlf
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 05:50:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466797842114600.0304975272804;
 Fri, 24 Jun 2016 12:50:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc v6 05/11] meta-phosphor: Ensure INITRAMFS_CTYPE defined
Date: Fri, 24 Jun 2016 14:50:28 -0500
Message-Id: <20160624195034.27662-6-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160624195034.27662-1-openbmc-patches@stwcx.xyz>
References: <20160624195034.27662-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 19:50:48 -0000

From: Patrick Williams <patrick@stwcx.xyz>

The hardware platforms use obmc-bsp-common.inc, which defines
INITRAMFS_CTYPE, but the simulation (qemu) platforms do not.
core-image-minimal-initramfs.bbappend currrently uses INITRAMFS_CTYPE
so we need to make sure it is defined.  Default there to 'lzma' if not
already defined.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 .../common/recipes-core/images/core-image-minimal-initramfs.bbappend     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend b/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend
index 90a1c3f..5710d22 100644
--- a/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend
+++ b/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend
@@ -1,3 +1,4 @@
 PACKAGE_INSTALL_remove = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi"
 PACKAGE_INSTALL += "obmc-phosphor-initfs"
+INITRAMFS_CTYPE ?= "lzma"
 INITRAMFS_FSTYPES = "cpio.${INITRAMFS_CTYPE}"
-- 
2.9.0
