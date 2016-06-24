Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbq354d9CzDqlk
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 06:01:21 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466798476253164.99360951188885;
 Fri, 24 Jun 2016 13:01:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc v7 11/11] u-boot: Remove unused 2013.07 packages.
Date: Fri, 24 Jun 2016 15:00:51 -0500
Message-Id: <20160624200051.28156-12-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160624200051.28156-1-openbmc-patches@stwcx.xyz>
References: <20160624200051.28156-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 24 Jun 2016 20:01:22 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 .../u-boot/u-boot-fw-utils_2013.07%.bbappend       |  3 --
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |  3 --
 .../recipes-bsp/u-boot/u-boot_2013.07%.bbappend    |  3 --
 .../recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb  | 55 ----------------------
 .../common/recipes-bsp/u-boot/u-boot_2013.07.bb    | 23 ---------
 5 files changed, 87 deletions(-)
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
 delete mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
 delete mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
 delete mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
deleted file mode 100644
index 77fcfef..0000000
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI += "file://config.patch"
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
deleted file mode 100644
index 77fcfef..0000000
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI += "file://config.patch"
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
deleted file mode 100644
index 1eeec2e..0000000
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-bsp/u-boot/u-boot_2013.07%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_append := "${THISDIR}/files:"
-
-SRC_URI += "file://u-boot-barreleye.patch"
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
deleted file mode 100644
index a514cf2..0000000
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-#require recipes-bsp/u-boot/u-boot.inc
-
-SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
-SECTION = "bootloader"
-DEPENDS = "mtd-utils"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
-
-# This revision corresponds to the tag "v2013.07"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-# SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
-SRCREV="44f1262bdf39ad93032d39f17a298165372be82e"
-
-PV = "v2013.07+git${SRCPV}"
-
-UBRANCH = "v2013.07-aspeed-openbmc"
-SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
-S = "${WORKDIR}/git"
-
-#INSANE_SKIP_${PN} = "already-stripped"
-#EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
-#EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
-EXTRA_OEMAKE = 'HOSTCC="${CC}" CC="${CC}" HOSTSTRIP="true"'
-
-inherit uboot-config
-
-do_compile () {
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake env
-}
-
-do_install () {
-	install -d ${D}${base_sbindir}
-	install -d ${D}${sysconfdir}
-	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
-	ln -sf fw_printenv ${D}${base_sbindir}/fw_setenv
-	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
-}
-
-#do_install_class-cross () {
-#	install -d ${D}${bindir_cross}
-#	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
-#	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
-#}
-
-#SYSROOT_PREPROCESS_FUNCS_class-cross = "uboot_fw_utils_cross"
-#uboot_fw_utils_cross() {
-#	sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
-#}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-#BBCLASSEXTEND = "cross native"
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
deleted file mode 100644
index f2434ad..0000000
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require recipes-bsp/u-boot/u-boot.inc
-
-# To build u-boot for your machine, provide the following lines in your machine
-# config, replacing the assignments as appropriate for your machine.
-# UBOOT_MACHINE = "omap3_beagle_config"
-# UBOOT_ENTRYPOINT = "0x80008000"
-# UBOOT_LOADADDRESS = "0x80008000"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
-
-# We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "44f1262bdf39ad93032d39f17a298165372be82e"
-
-PV = "v2013.07+git${SRCPV}"
-
-UBRANCH = "v2013.07-aspeed-openbmc"
-SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.9.0
