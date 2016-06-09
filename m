Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ5Yq1MHWzDr7d
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:20:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465431640382102.4922515383771;
 Wed, 8 Jun 2016 17:20:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v2 05/11] AST2400: Set kernel preferred provider
 version
Date: Wed,  8 Jun 2016 19:20:26 -0500
Message-Id: <20160609002032.984-6-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 09 Jun 2016 00:20:48 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

In preparation for supporting AST2500 with a different branch.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-ast2400/conf/machine/include/ast2400.inc  |  1 +
 .../common/recipes-kernel/linux/linux-obmc.inc     | 28 ++++++++++++++++++++++
 .../common/recipes-kernel/linux/linux-obmc_4.4.bb  | 28 +---------------------
 3 files changed, 30 insertions(+), 27 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
index 58af4bb..97a8834 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Common machine configuration for the Aspeed AST2400 Chip
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
+PREFERRED_VERSION_linux-obmc ?= "4.4+git%"
 
 UBOOT_MACHINE ?= "versatileab_config"
 UBOOT_ENTRYPOINT ?= "0x40001000"
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
new file mode 100644
index 0000000..75f5e3f
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc.inc
@@ -0,0 +1,28 @@
+DESCRIPTION = "Linux kernel for OpenBMC"
+SECTION = "kernel"
+LICENSE = "GPLv2"
+
+KCONFIG_MODE="--alldefconfig"
+
+KSRC ?= "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
+SRC_URI = "${KSRC}"
+SRC_URI += "file://hwmon.cfg"
+
+LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
+
+do_patch_append() {
+        for DTB in "${KERNEL_DEVICETREE}"; do
+               DT=`basename ${DTB} .dtb`
+                if [ -r "${WORKDIR}/${DT}.dts" ]; then
+                        cp ${WORKDIR}/${DT}.dts \
+                                ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts
+               fi
+       done
+}
+
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
index c0d8e38..539ea43 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
@@ -1,31 +1,5 @@
-DESCRIPTION = "Linux kernel for OpenBMC"
-SECTION = "kernel"
-LICENSE = "GPLv2"
-
 KBRANCH ?= "dev-4.4"
-KCONFIG_MODE="--alldefconfig"
-
-SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
-SRC_URI += "file://hwmon.cfg"
-
 LINUX_VERSION ?= "4.4"
-LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
-
 SRCREV="openbmc-20160521-1"
 
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
-
-inherit kernel
-require recipes-kernel/linux/linux-yocto.inc
-
-do_patch_append() {
-        for DTB in "${KERNEL_DEVICETREE}"; do
-               DT=`basename ${DTB} .dtb`
-                if [ -r "${WORKDIR}/${DT}.dts" ]; then
-                        cp ${WORKDIR}/${DT}.dts \
-                                ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts
-               fi
-       done
-}
+require linux-obmc.inc
-- 
2.8.3
