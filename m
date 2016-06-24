Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbpps2kNfzDqlV
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 05:50:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466797840910401.33352653804707;
 Fri, 24 Jun 2016 12:50:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc v6 04/11] meta-phosphor: Make image-overlay an
 optional feature
Date: Fri, 24 Jun 2016 14:50:27 -0500
Message-Id: <20160624195034.27662-5-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 19:50:46 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Previously, obmc-bsp-common.inc added "overlay" to the IMAGE_FSTYPES
but this only has meaning if the 'image-overlay' class is used.  The
obmc-phosphor-image class explicitly includes 'image-overlay' when
appropriate but no other images (ie. ones that come with yocto) do.

Changed obmc-bsp-common to instead enable an obmc-phosphor-image feature
by setting OBMC_PHOSPHOR_IMAGE_OVERLAY=1. Then in obmc-phosphor-image we
add "overlay" to the IMAGE_FSTYPES only when the feature is enabled.

This will fix both non-phosphor images on hardware platforms and all images
on simulation platforms.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-phosphor/classes/obmc-phosphor-image.bbclass      | 15 +++++++++------
 meta-phosphor/conf/machine/include/obmc-bsp-common.inc |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index d3960c7..b2925c2 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -48,9 +48,12 @@ CORE_IMAGE_EXTRA_INSTALL_append = " bash \
 
 OBMC_IMAGE_EXTRA_INSTALL ?= ""
 
-def build_overlay(d):
-        if bb.utils.contains("IMAGE_FSTYPES", "overlay", "overlay", "0", d) != "0":
-                return "image-overlay"
-        return ""
-
-inherit ${@build_overlay(d)}
+def image_overlay_enabled(d, fstype):
+        if d.getVar('OBMC_PHOSPHOR_IMAGE_OVERLAY', True) != "1":
+            return ""
+        if fstype:
+            return "overlay"
+        return "image-overlay"
+
+IMAGE_FSTYPES += "${@image_overlay_enabled(d, True)}"
+inherit ${@image_overlay_enabled(d, False)}
diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
index 8d1fd7e..2b6a163 100644
--- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
+++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
@@ -13,7 +13,7 @@ UBOOT_SUFFIX ?= "bin"
 
 MACHINEOVERRIDES =. "openbmc:"
 
-IMAGE_FSTYPES += "overlay"
+OBMC_PHOSPHOR_IMAGE_OVERLAY= "1"
 IMAGE_FSTYPES += "cpio.${INITRAMFS_CTYPE}.u-boot"
 OBMC_IMAGE_EXTRA_INSTALL_append = " u-boot-fw-utils"
 
-- 
2.9.0
