Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 375A91A0774
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 01:16:59 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444659415150850.944388587513;
 Mon, 12 Oct 2015 07:16:55 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 4/7] Add linux-obmc kernel recipe
Date: Mon, 12 Oct 2015 09:16:37 -0500
Message-Id: <1444659400-4196-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
References: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 14:16:59 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../linux/linux-obmc/initrd-source.patch           | 11 ++++++++
 .../linux/linux-obmc/obmc-bsp-user-config.cfg      |  8 ++++++
 .../linux/linux-obmc/obmc-bsp-user-patches.scc     |  8 ++++++
 .../recipes-kernel/linux/linux-obmc/obmc-bsp.cfg   |  3 +++
 .../recipes-kernel/linux/linux-obmc/obmc-bsp.scc   | 17 +++++++++++++
 .../linux/linux-obmc/systemd-reqs.patch            |  8 ++++++
 .../common/recipes-kernel/linux/linux-obmc_4.2.bb  | 29 ++++++++++++++++++++++
 meta-phosphor/common/recipes.txt                   |  1 +
 8 files changed, 85 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-source.patch
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp-user-config.cfg
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp-user-patches.scc
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp.cfg
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp.scc
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-source.patch b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-source.patch
new file mode 100644
index 0000000..a685df5
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/initrd-source.patch
@@ -0,0 +1,11 @@
+--- a/arch/arm/configs/aspeed_defconfig
++++ b/arch/arm/configs/aspeed_defconfig
+@@ -6,7 +6,7 @@ CONFIG_SYSVIPC=y
+ CONFIG_IRQ_DOMAIN_DEBUG=y
+ CONFIG_LOG_BUF_SHIFT=14
+ CONFIG_BLK_DEV_INITRD=y
+-CONFIG_INITRAMFS_SOURCE="~/ibm/openbmc/buildroot-arm-rootfs.cpio.gz"
++CONFIG_INITRAMFS_SOURCE=""
+ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+ CONFIG_KALLSYMS_ALL=y
+ CONFIG_EMBEDDED=y
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp-user-config.cfg b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp-user-config.cfg
new file mode 100644
index 0000000..17c8b50
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp-user-config.cfg
@@ -0,0 +1,8 @@
+#
+# Used by yocto-kernel to manage config options.
+#
+# yocto-kernel may change the contents of this file in any
+# way it sees fit, including removing comments like this,
+# so don't manually make any modifications you don't want
+# to lose.
+#
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp-user-patches.scc b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp-user-patches.scc
new file mode 100644
index 0000000..7a598d9
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp-user-patches.scc
@@ -0,0 +1,8 @@
+#
+# Used by yocto-kernel to manage patches.
+#
+# yocto-kernel may change the contents of this file in any
+# way it sees fit, including removing comments like this,
+# so don't manually make any modifications you don't want
+# to lose.
+#
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp.cfg b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp.cfg
new file mode 100644
index 0000000..95170b1
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp.cfg
@@ -0,0 +1,3 @@
+#
+# A convenient place to add config options, nothing more.
+#
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp.scc b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp.scc
new file mode 100644
index 0000000..88e76e6
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/obmc-bsp.scc
@@ -0,0 +1,17 @@
+#
+# The top-level 'feature' for the meta-obmc-bsp custom kernel.
+#
+# Essentially this is a convenient top-level container or starting
+# point for adding lower-level config fragements and features.
+#
+
+# meta-obmc-bsp.cfg in the linux-yocto-custom subdir is just a
+# convenient place for adding random config fragments.
+
+kconf hardware obmc-bsp.cfg
+
+# These are used by yocto-kernel to add config fragments and features.
+# Don't remove if you plan on using yocto-kernel with this BSP.
+
+kconf hardware obmc-bsp-user-config.cfg
+include obmc-bsp-user-patches.scc
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch
new file mode 100644
index 0000000..f6530d7
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc/systemd-reqs.patch
@@ -0,0 +1,8 @@
+--- a/arch/arm/configs/aspeed_defconfig
++++ b/arch/arm/configs/aspeed_defconfig
+@@ -192,3 +192,5 @@ CONFIG_CRYPTO_GHASH=y
+ # CONFIG_CRYPTO_HW is not set
+ CONFIG_CRC_CCITT=y
+ CONFIG_AVERAGE=y
++CONFIG_CGROUPS=y
++CONFIG_FHANDLE=y
diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
new file mode 100644
index 0000000..b38d1a8
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Linux kernel for OpenBMC"
+SECTION = "kernel"
+LICENSE = "GPLv2"
+
+KBRANCH ?= "dev"
+
+SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
+SRC_URI += "file://systemd-reqs.patch file://initrd-source.patch"
+SRC_URI += "file://obmc-bsp.scc \
+            file://obmc-bsp.cfg \
+            file://obmc-bsp-user-config.cfg \
+            file://obmc-bsp-user-patches.scc \
+           "
+
+LINUX_VERSION ?= "4.2"
+LINUX_VERSION_EXTENSION ?= "-openbmc-${SRCPV}"
+
+SRCREV="${AUTOREV}"
+
+PV = "${LINUX_VERSION}+git${SRCPV}"
+
+COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
+
+inherit kernel
+require recipes-kernel/linux/linux-yocto.inc
+
+do_configure_prepend() {
+        sed -i 's/CONFIG_LOCALVERSION=.\+/CONFIG_LOCALVERSION=${LINUX_VERSION_EXTENSION}/' ${S}/arch/${ARCH}/configs/${KMACHINE}_defconfig
+}
diff --git a/meta-phosphor/common/recipes.txt b/meta-phosphor/common/recipes.txt
index b6a8cde..d38d789 100644
--- a/meta-phosphor/common/recipes.txt
+++ b/meta-phosphor/common/recipes.txt
@@ -1,4 +1,5 @@
 recipes-connectivity - Libraries and applications related to communication with other devices 
 recipes-extended     - Applications which whilst not essential add features compared to the alternatives in
                        core. May be needed for full tool functionality or LSB compliance.
+recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
 recipes-phosphor     - Phosphor OpenBMC applications and configuration
-- 
2.6.0
