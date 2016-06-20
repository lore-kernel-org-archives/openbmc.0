Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYRg31342zDqFD
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 09:20:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466464841718608.59680264135;
 Mon, 20 Jun 2016 16:20:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc v2 5/6] meta-phosphor: Make image-overlay a machine
 feature.
Date: Mon, 20 Jun 2016 18:20:33 -0500
Message-Id: <20160620232034.16483-6-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160620232034.16483-1-openbmc-patches@stwcx.xyz>
References: <20160620232034.16483-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 20 Jun 2016 23:20:48 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Previously, obmc-bsp-common.inc added "overlay" to the IMAGE_FSTYPES
but this only has meaning if the 'image-overlay' class is used.  The
obmc-phosphor-image class explicitly includes 'image-overlay' when
appropriate but no other images (ie. ones that come with yocto) do.

Changed obmc-bsp-common to instead enable a machine feature called
"image-overlay".  Then in obmc-phosphor-image we add "overlay" to
the IMAGE_FSTYPES only when enabled as a machine feature.

This will (hopefully) fix both non-phosphor images on hardware platforms
and all images on simulation platforms.
---
 meta-phosphor/classes/obmc-phosphor-image.bbclass      | 4 ++++
 meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index d3960c7..2d13fff 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -48,6 +48,10 @@ CORE_IMAGE_EXTRA_INSTALL_append = " bash \
 
 OBMC_IMAGE_EXTRA_INSTALL ?= ""
 
+IMAGE_FSTYPES += \
+    "${@bb.utils.contains("MACHINE_FEATURES", "image-overlay", \
+                          "overlay", "", d)}"
+
 def build_overlay(d):
         if bb.utils.contains("IMAGE_FSTYPES", "overlay", "overlay", "0", d) != "0":
                 return "image-overlay"
diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
index 8d1fd7e..3e2ec34 100644
--- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
+++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
@@ -13,7 +13,7 @@ UBOOT_SUFFIX ?= "bin"
 
 MACHINEOVERRIDES =. "openbmc:"
 
-IMAGE_FSTYPES += "overlay"
+MACHINE_FEATURES += "image-overlay"
 IMAGE_FSTYPES += "cpio.${INITRAMFS_CTYPE}.u-boot"
 OBMC_IMAGE_EXTRA_INSTALL_append = " u-boot-fw-utils"
 
-- 
2.9.0
