Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 844971A0704
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 03:10:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448295024126438.66836731465537;
 Mon, 23 Nov 2015 08:10:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc v2 3/3] Update kernel version
Date: Mon, 23 Nov 2015 11:10:20 -0500
Message-Id: <1448295020-21218-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448295020-21218-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448295020-21218-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 16:10:30 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

The kernel contains many changes, including

  - rewritten i2c driver
  - interrupt facilities for the iBT host driver
  - drop dts patches, we now use the in-tree device tree
  - rebased on Linux 4.3
---
 .../common/recipes-kernel/linux/linux-obmc_4.2.bb  | 30 ----------------------
 .../common/recipes-kernel/linux/linux-obmc_4.3.bb  | 30 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 30 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
deleted file mode 100644
index 1d8106d..0000000
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "Linux kernel for OpenBMC"
-SECTION = "kernel"
-LICENSE = "GPLv2"
-
-KBRANCH ?= "dev"
-KCONFIG_MODE="--alldefconfig"
-
-SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
-
-LINUX_VERSION ?= "4.2"
-LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
-
-SRCREV="openbmc-20151104-1"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
-
-inherit kernel
-require recipes-kernel/linux/linux-yocto.inc
-
-do_patch_append() {
-        for DTB in "${KERNEL_DEVICETREE}"; do
-		DT=`basename ${DTB} .dtb`
-                if [ -r "${WORKDIR}/${DT}.dts" ]; then
-                        cp ${WORKDIR}/${DT}.dts \
-                                ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts
-		fi
-	done
-}
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
new file mode 100644
index 0000000..2b2ff39
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Linux kernel for OpenBMC"
+SECTION = "kernel"
+LICENSE = "GPLv2"
+
+KBRANCH ?= "dev-4.3"
+KCONFIG_MODE="--alldefconfig"
+
+SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
+
+LINUX_VERSION ?= "4.3"
+LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
+
+SRCREV="openbmc-20151123-1"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
+
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+do_patch_append() {
+        for DTB in "${KERNEL_DEVICETREE}"; do
+		DT=`basename ${DTB} .dtb`
+                if [ -r "${WORKDIR}/${DT}.dts" ]; then
+                        cp ${WORKDIR}/${DT}.dts \
+                                ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts
+		fi
+	done
+}
-- 
2.6.3
