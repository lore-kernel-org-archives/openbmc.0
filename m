Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 24F471A02E6
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2015 09:43:26 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1444344204787299.65934495140664;
 Thu, 8 Oct 2015 15:43:24 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 4/5] Use OpenBMC uboot image
Date: Thu,  8 Oct 2015 17:43:16 -0500
Message-Id: <1444344197-7122-5-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 22:43:27 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

This makes all machines use the OpenBMC flash image uboot
image fstype specialization.
---
 meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
index ca65285..4a800dd 100644
--- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
+++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
@@ -10,6 +10,9 @@ KERNEL_IMAGETYPE ?= "cuImage"
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 UBOOT_SUFFIX ?= "bin"
-IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX}"
 
 MACHINEOVERRIDES =. "openbmc:"
+
+IMAGE_CLASSES += "obmc-phosphor-image_types_uboot"
+IMAGE_CTYPE = "gz"
+IMAGE_FSTYPES += "cpio.${IMAGE_CTYPE}.u-boot"
-- 
2.6.0
