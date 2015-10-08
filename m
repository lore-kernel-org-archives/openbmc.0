Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D2B6D1A02AE
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2015 09:43:25 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1444344203408801.7400372425634;
 Thu, 8 Oct 2015 15:43:23 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/5] Backport 2013.07 uboot recipe
Date: Thu,  8 Oct 2015 17:43:15 -0500
Message-Id: <1444344197-7122-4-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 22:43:26 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 ...h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch | 74 ++++++++++++++++++++++
 .../common/recipes-bsp/u-boot/u-boot_2013.07.bb    | 25 ++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb

diff --git a/meta-phosphor/common/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch b/meta-phosphor/common/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
new file mode 100644
index 0000000..77e35bb
--- /dev/null
+++ b/meta-phosphor/common/recipes-bsp/u-boot/files/0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch
@@ -0,0 +1,74 @@
+From 5701384cea4a829b772bf7a96a74825b58c22385 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Thu, 17 Apr 2014 12:25:40 -0400
+Subject: [PATCH] am335x_evm.h: Add, use DEFAULT_LINUX_BOOT_ENV environment
+ string
+
+Modified version of the patch currently being reviewed for mainline:
+http://patchwork.ozlabs.org/patch/334861/
+
+To deal with a reoccurring problem properly we need to specify addresses
+for the Linux kernel, Flatted Device Tree and ramdisk that obey the
+constraints within the kernel's Documentation/arm/Booting file but also
+make sure that we relocate things within a valid address range.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+Signed-off-by: Tom Rini <trini@ti.com>
+
+Upstream-Status: Pending
+---
+ include/configs/am335x_evm.h | 31 ++++++++++++++++++++++++++-----
+ 1 file changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index c5a6d4b..01e32b3 100644
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -54,10 +54,7 @@
+ #define CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
+ #ifndef CONFIG_SPL_BUILD
+ #define CONFIG_EXTRA_ENV_SETTINGS \
+-	"loadaddr=0x80200000\0" \
+-	"fdtaddr=0x80F80000\0" \
+-	"fdt_high=0xffffffff\0" \
+-	"rdaddr=0x81000000\0" \
++	DEFAULT_LINUX_BOOT_ENV \
+ 	"bootdir=/boot\0" \
+ 	"bootfile=uImage\0" \
+ 	"fdtfile=undefined\0" \
+@@ -197,7 +194,31 @@
+ #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START \
+ 					+ (8 * 1024 * 1024))
+ 
+-#define CONFIG_SYS_LOAD_ADDR		0x81000000 /* Default load address */
++/*
++ * Our DDR memory always starts at 0x80000000 and U-Boot shall have
++ * relocated itself to higher in memory by the time this value is used.
++ * However, set this to a 32MB offset to allow for easier Linux kernel
++ * booting as the default is often used as the kernel load address.
++ */
++#define CONFIG_SYS_LOAD_ADDR		0x82000000 /* Default load address */
++
++/*
++ * We setup defaults based on constraints from the Linux kernel, which should
++ * also be safe elsewhere.  We have the default load at 32MB into DDR (for
++ * the kernel), FDT above 128MB (the maximum location for the end of the
++ * kernel), and the ramdisk 512KB above that (allowing for hopefully never
++ * seen large trees).  We say all of this must be within the first 256MB
++ * as that will normally be within the kernel lowmem and thus visible via
++ * bootm_size and we only run on platforms with 256MB or more of memory.
++ */
++#define DEFAULT_LINUX_BOOT_ENV \
++	"loadaddr=0x82000000\0" \
++	"kernel_addr_r=0x82000000\0" \
++	"fdtaddr=0x88000000\0" \
++	"fdt_addr_r=0x88000000\0" \
++	"rdaddr=0x88080000\0" \
++	"ramdisk_addr_r=0x88080000\0" \
++	"bootm_size=0x10000000\0"
+ 
+ #define CONFIG_MMC
+ #define CONFIG_GENERIC_MMC
+-- 
+1.9.2
+
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
new file mode 100644
index 0000000..f3e2f56
--- /dev/null
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
@@ -0,0 +1,25 @@
+require recipes-bsp/u-boot/u-boot.inc
+
+# To build u-boot for your machine, provide the following lines in your machine
+# config, replacing the assignments as appropriate for your machine.
+# UBOOT_MACHINE = "omap3_beagle_config"
+# UBOOT_ENTRYPOINT = "0x80008000"
+# UBOOT_LOADADDRESS = "0x80008000"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
+
+# This revision corresponds to the tag "v2013.07"
+# We use the revision in order to avoid having to fetch it from the repo during parse
+SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+
+PV = "v2013.07+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
+          file://0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.6.0
