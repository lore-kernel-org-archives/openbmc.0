Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0E3ED1A0889
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 01:17:00 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444659417858768.2252131002418;
 Mon, 12 Oct 2015 07:16:57 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 5/7] Move Palmetto specific metadata to Palmetto layer
Date: Mon, 12 Oct 2015 09:16:38 -0500
Message-Id: <1444659400-4196-6-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 14:17:01 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../meta-aspeed/meta-ast2400/conf/layer.conf            |  4 ----
 .../meta-ast2400/conf/machine/include/ast2400.inc       |  1 -
 .../recipes-kernel/linux/linux-obmc.bbappend            |  3 ---
 .../recipes-kernel/linux/linux-obmc/0000-config.patch   | 17 -----------------
 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes.txt   |  1 -
 5 files changed, 26 deletions(-)
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc.bbappend
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0000-config.patch
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes.txt

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/layer.conf b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/layer.conf
index ce5a49b..a12e3f4 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/layer.conf
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/layer.conf
@@ -1,9 +1,5 @@
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
-# We have a recipes-* directories, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
-	${LAYERDIR}/recipes-*/*/*.bbappend"
-
 BBFILE_COLLECTIONS += "ast2400"
 BBFILE_PATTERN_ast2400 = ""
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
index 492b473..58af4bb 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
@@ -3,7 +3,6 @@
 #@DESCRIPTION: Common machine configuration for the Aspeed AST2400 Chip
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
-KERNEL_CONFIG_COMMAND ?= "oe_runmake aspeed_defconfig"
 
 UBOOT_MACHINE ?= "versatileab_config"
 UBOOT_ENTRYPOINT ?= "0x40001000"
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc.bbappend
deleted file mode 100644
index 065b1c4..0000000
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://0000-config.patch"
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0000-config.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0000-config.patch
deleted file mode 100644
index 04611ee..0000000
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0000-config.patch
+++ /dev/null
@@ -1,17 +0,0 @@
---- a/arch/arm/configs/aspeed_defconfig
-+++ b/arch/arm/configs/aspeed_defconfig
-@@ -1,12 +1,12 @@
- CONFIG_CROSS_COMPILE="arm-linux-"
--CONFIG_LOCALVERSION="-joel"
-+# CONFIG_LOCALVERSION is not set
- CONFIG_KERNEL_XZ=y
- # CONFIG_SWAP is not set
- CONFIG_SYSVIPC=y
- CONFIG_IRQ_DOMAIN_DEBUG=y
- CONFIG_LOG_BUF_SHIFT=14
- CONFIG_BLK_DEV_INITRD=y
--CONFIG_INITRAMFS_SOURCE="~/ibm/openbmc/buildroot-arm-rootfs.cpio.gz"
-+# CONFIG_INITRAMFS_SOURCE is not set
- CONFIG_CC_OPTIMIZE_FOR_SIZE=y
- CONFIG_KALLSYMS_ALL=y
- CONFIG_EMBEDDED=y
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes.txt b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes.txt
deleted file mode 100644
index db84c6f..0000000
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes.txt
+++ /dev/null
@@ -1 +0,0 @@
-recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
-- 
2.6.0
