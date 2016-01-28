Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A1B5C1A1A76
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 09:50:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454021425335300.16992633333643;
 Thu, 28 Jan 2016 14:50:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 6/8] create u-boot-fw-utils for our u-boot version
Date: Thu, 28 Jan 2016 16:50:17 -0600
Message-Id: <1454021419-16743-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 28 Jan 2016 22:50:30 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

This commit creates a class and recipie based on the upstream 2015
branch of u-boot and patches it with our fw_env.config.

Having these tools for the initfs will allow us to modify the u-boot
enviornment to do things like boot from network for update and set the
bmc mac addresses in the environment for u-boot and use by the kernel.

This commit is based on the upstream fw-utils commit.  However, the
initial commit was not creating target binaries.  After commenting
out the cross class support for creating host binaries to prepare
an environment, a study of the u-boot Makefile showed that HOSTCC
etc needed to be set.  It is anticipated something to the commented
lines will be necessary for merging upstream but this addresses our
immediate use case.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../u-boot/u-boot-fw-utils_2013.07%.bbappend       | 13 +++++
 .../recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb  | 55 ++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
new file mode 100644
index 0000000..4020696
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-boot/u-boot-fw-utils_2013.07%.bbappend
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://fw_env.config"
+SRC_URI += "file://config.patch"
+
+do_install_append() {
+    if [ -e ${WORKDIR}/fw_env.config ] ; then
+        install -d ${D}${sysconfdir}
+        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
+    fi
+}
+
+BBCLASSEXTEND += "native"
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
new file mode 100644
index 0000000..c8ae846
--- /dev/null
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -0,0 +1,55 @@
+#require recipes-bsp/u-boot/u-boot.inc
+
+SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
+SECTION = "bootloader"
+DEPENDS = "mtd-utils"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
+
+# This revision corresponds to the tag "v2013.07"
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+# SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+SRCREV="${AUTOREV}"
+
+PV = "v2013.07+git${SRCPV}"
+
+UBRANCH = "v2013.07-aspeed-openbmc"
+SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
+S = "${WORKDIR}/git"
+
+#INSANE_SKIP_${PN} = "already-stripped"
+#EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
+#EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
+EXTRA_OEMAKE = 'HOSTCC="${CC}" CC="${CC}" HOSTSTRIP="true"'
+
+inherit uboot-config
+
+do_compile () {
+	oe_runmake ${UBOOT_MACHINE}
+	oe_runmake env
+}
+
+do_install () {
+	install -d ${D}${base_sbindir}
+	install -d ${D}${sysconfdir}
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+	ln -sf fw_printenv ${D}${base_sbindir}/fw_setenv
+	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
+}
+
+#do_install_class-cross () {
+#	install -d ${D}${bindir_cross}
+#	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
+#	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
+#}
+
+#SYSROOT_PREPROCESS_FUNCS_class-cross = "uboot_fw_utils_cross"
+#uboot_fw_utils_cross() {
+#	sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
+#}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+#BBCLASSEXTEND = "cross native"
-- 
2.6.4
