Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 190581A1A40
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 09:50:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454021427027673.6122346035543;
 Thu, 28 Jan 2016 14:50:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 8/8] Add u-boot fw-utils to the image
Date: Thu, 28 Jan 2016 16:50:19 -0600
Message-Id: <1454021419-16743-9-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Jan 2016 22:50:32 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

This adds the u-boot-fw-utils package to the obmc phosphor bsp
include file to include the fw_setenv and fw_printenv utilities
in the image.

This will allow us to read and update the u-boot boot environment
including setting the mac address of the ethernet.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
index d7a681c..fb6cc8c 100644
--- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
+++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
@@ -13,6 +13,13 @@ UBOOT_SUFFIX ?= "bin"
 
 MACHINEOVERRIDES =. "openbmc:"
 
+IMAGE_FSTYPES += "overlay"
+IMAGE_INSTALL += "u-boot-fw-utils"
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
