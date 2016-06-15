Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rV9252FH8zDqkX
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 01:10:53 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466003442216750.4812689545013;
 Wed, 15 Jun 2016 08:10:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v5 1/3] Add OBMC_IMAGE_EXTRA_INSTALL variable
Date: Wed, 15 Jun 2016 10:10:34 -0500
Message-Id: <20160615151036.30021-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615151036.30021-1-openbmc-patches@stwcx.xyz>
References: <20160615151036.30021-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 15:10:54 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Prior to this patch packagegroup-core-boot was not being pulled in.
core-boot is what brings in the init_manager (systemd) but
somehow systemd was added as a dependency by OE for the skeleton package
so the missing core-boot packagegroup went unnoticed.

core-boot was not being pulled in because of an assignment to
IMAGE_INSTALL in the global configuration.  Yocto core provides a
mechanism to do the same thing safely - CORE_IMAGE_EXTRA_INSTALL;
use this and also adopt a similar approach for adding extra packages
to image recipes using obmc-phosphor-image.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-phosphor/images/obmc-phosphor-image.bbappend     | 4 +---
 meta-phosphor/classes/obmc-phosphor-image.bbclass                   | 6 ++++--
 meta-phosphor/conf/machine/include/obmc-bsp-common.inc              | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/images/obmc-phosphor-image.bbappend b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/images/obmc-phosphor-image.bbappend
index 7b8aa6f..cf4f29d 100644
--- a/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/images/obmc-phosphor-image.bbappend
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-phosphor/images/obmc-phosphor-image.bbappend
@@ -1,3 +1 @@
-IMAGE_INSTALL += " \
-        inventory-upload \
-"
+OBMC_IMAGE_EXTRA_INSTALL_append = " inventory-upload"
diff --git a/meta-phosphor/classes/obmc-phosphor-image.bbclass b/meta-phosphor/classes/obmc-phosphor-image.bbclass
index ce54777..c715ded 100644
--- a/meta-phosphor/classes/obmc-phosphor-image.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image.bbclass
@@ -36,15 +36,17 @@ IMAGE_FEATURES += " \
         ssh-server-dropbear \
         "
 
-IMAGE_INSTALL += " \
-        bash \
+CORE_IMAGE_EXTRA_INSTALL_append = " bash \
         packagegroup-obmc-phosphor-apps-extras \
         i2c-tools \
         screen \
         inarp \
         obmc-console \
+        ${OBMC_IMAGE_EXTRA_INSTALL} \
         "
 
+OBMC_IMAGE_EXTRA_INSTALL ?= ""
+
 def build_overlay(d):
         if bb.utils.contains("IMAGE_FSTYPES", "overlay", "overlay", "0", d) != "0":
                 return "image-overlay"
diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
index 260cc90..8d1fd7e 100644
--- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
+++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
@@ -15,7 +15,7 @@ MACHINEOVERRIDES =. "openbmc:"
 
 IMAGE_FSTYPES += "overlay"
 IMAGE_FSTYPES += "cpio.${INITRAMFS_CTYPE}.u-boot"
-IMAGE_INSTALL += "u-boot-fw-utils"
+OBMC_IMAGE_EXTRA_INSTALL_append = " u-boot-fw-utils"
 
 IMAGE_CLASSES += "obmc-phosphor-image_types_uboot"
 
-- 
2.8.4
