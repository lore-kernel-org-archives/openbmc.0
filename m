Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rRGZv301dzDqWg
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 08:10:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465596641463943.8149229655262;
 Fri, 10 Jun 2016 15:10:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v3 07/11] Add a u-boot 2016.05 recipe
Date: Fri, 10 Jun 2016 17:10:26 -0500
Message-Id: <20160610221030.3943-8-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160610221030.3943-1-openbmc-patches@stwcx.xyz>
References: <20160610221030.3943-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 10 Jun 2016 22:10:48 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Adding a 2016.05 u-boot for the AST2500.  AST2400 remains on
2013.07.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb  | 46 ++++++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb   | 29 ++++++++++++++
 .../common/recipes-bsp/u-boot/u-boot_2016.05.bb    | 12 ++++++
 3 files changed, 87 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
 create mode 100644 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb

diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
new file mode 100644
index 0000000..305c2b7
--- /dev/null
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2016.05.bb
@@ -0,0 +1,46 @@
+SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+SECTION = "bootloader"
+DEPENDS = "mtd-utils"
+
+SRCREV = "d0847e6b3eda43d4d2b4f9928a549c3c2d52865f"
+UBRANCH = "v2016.05-ast2500"
+SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
+
+PV = "v2016.05+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+INSANE_SKIP_${PN} = "already-stripped"
+EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
+EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
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
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
+}
+
+do_install_class-cross () {
+	install -d ${D}${bindir_cross}
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
+}
+
+SYSROOT_PREPROCESS_FUNCS_class-cross = "uboot_fw_utils_cross"
+uboot_fw_utils_cross() {
+	sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+BBCLASSEXTEND = "cross"
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
new file mode 100644
index 0000000..eed5f9c
--- /dev/null
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-mkimage_2016.05.bb
@@ -0,0 +1,29 @@
+SUMMARY = "U-Boot bootloader image creation tool"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+SECTION = "bootloader"
+
+DEPENDS = "openssl"
+
+SRCREV = "d0847e6b3eda43d4d2b4f9928a549c3c2d52865f"
+UBRANCH = "v2016.05-ast2500"
+SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
+
+PV = "v2016.05+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
+
+do_compile () {
+	oe_runmake sandbox_defconfig
+	oe_runmake cross_tools NO_SDL=1
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
+	ln -sf uboot-mkimage ${D}${bindir}/mkimage
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb
new file mode 100644
index 0000000..0a229d5
--- /dev/null
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2016.05.bb
@@ -0,0 +1,12 @@
+require recipes-bsp/u-boot/u-boot.inc
+
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+DEPENDS += "dtc-native"
+
+SRCREV = "d0847e6b3eda43d4d2b4f9928a549c3c2d52865f"
+UBRANCH = "v2016.05-ast2500"
+SRC_URI = "git://git@github.com/openbmc/u-boot.git;branch=${UBRANCH};protocol=https"
+
+PV = "v2016.05+git${SRCPV}"
+
+EXTRA_OEMAKE_append = " KCFLAGS=-fgnu89-inline"
-- 
2.8.3
