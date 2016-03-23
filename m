Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVMX44YsDzDq6y
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:03:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=FcVgbdDi; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id B3795334075
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 aEr3bxORYCF3xgTwX+irzjtFgB0=; b=FcVgbdDiqPBtjGWKEMgm9RzFIGWPW9ry
 Vk8bl/GbE0ldxnfDMtoZVXj5RHj1vcou6YJJRldRL0Ir0TxFWtBAfnhq4N8h/yU8
 gIxnFRa+gBE0IvyzN5+H6MU+7z/4pKwloiN7zt4anodrZQy46t3S/VJ5WkwN2zC1
 8lrxaKiWl7M=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 294D233406F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:45 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [RFC PATCH openbmc v3 1/8] meta-openbmc-bsp: Add qemu git recipe
Date: Wed, 23 Mar 2016 18:33:28 +1030
Message-Id: <1458720215-25302-2-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 23 Mar 2016 08:03:49 -0000

The change adds meta-openbmc-bsp/recipes-devtools/qemu, building qemu
from git as priority over yocto-poky/meta/recipes-devtools/qemu. The .bb
is configured to build from openbmc/qemu's master branch, at the merging
of the AST2400 SoC support. This commit enables a future change to add
palmetto-bmc support to the runqemu scripts.

The files qemu.inc and qemu-targets.inc are copies from
yocto-poky/meta/recipes-devtools/qemu, but with the extra support files
(patches and binaries) removed due to conflicts and lack of necessity.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-openbmc-bsp/conf/layer.conf                   |   8 ++
 .../recipes-devtools/qemu/qemu-targets.inc         |  22 ++++
 meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc    | 125 +++++++++++++++++++++
 meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb |  21 ++++
 .../meta-palmetto/conf/bblayers.conf.sample        |   1 +
 .../meta-barreleye/conf/bblayers.conf.sample       |   1 +
 6 files changed, 178 insertions(+)
 create mode 100644 meta-openbmc-bsp/conf/layer.conf
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu-targets.inc
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb

diff --git a/meta-openbmc-bsp/conf/layer.conf b/meta-openbmc-bsp/conf/layer.conf
new file mode 100644
index 0000000..7f07802
--- /dev/null
+++ b/meta-openbmc-bsp/conf/layer.conf
@@ -0,0 +1,8 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+# We have a recipes directory containing .bb and .bbappend files, add to BBFILES
+BBFILES := "${BBFILES} ${LAYERDIR}/recipes*/*/*.bb \ ${LAYERDIR}/recipes*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "openbmc-bsp"
+BBFILE_PATTERN_openbmc-bsp = ""
+BBFILE_PRIORITY = "1"
diff --git a/meta-openbmc-bsp/recipes-devtools/qemu/qemu-targets.inc b/meta-openbmc-bsp/recipes-devtools/qemu/qemu-targets.inc
new file mode 100644
index 0000000..5c35655
--- /dev/null
+++ b/meta-openbmc-bsp/recipes-devtools/qemu/qemu-targets.inc
@@ -0,0 +1,22 @@
+# possible arch values are arm aarch64 mips mipsel mips64 mips64el ppc ppc64 ppc64abi32
+# ppcemb armeb alpha sparc32plus i386 x86_64 cris m68k microblaze sparc sparc32
+# sparc32plus
+
+def get_qemu_target_list(d):
+    import bb
+    archs = d.getVar('QEMU_TARGETS', True).split()
+    tos = d.getVar('HOST_OS', True)
+    softmmuonly = ""
+    for arch in ['mips64', 'mips64el', 'ppcemb']:
+        if arch in archs:
+            softmmuonly += arch + "-softmmu,"
+            archs.remove(arch)
+    linuxuseronly = ""
+    for arch in ['armeb', 'alpha', 'ppc64abi32', 'sparc32plus']:
+        if arch in archs:
+            linuxuseronly += arch + "-linux-user,"
+            archs.remove(arch)
+    if 'linux' not in tos:
+        return softmmuonly + ''.join([arch + "-softmmu" + "," for arch in archs]).rstrip(',')
+    return softmmuonly + linuxuseronly + ''.join([arch + "-linux-user" + "," + arch + "-softmmu" + "," for arch in archs]).rstrip(',')
+
diff --git a/meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc b/meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc
new file mode 100644
index 0000000..c867d53
--- /dev/null
+++ b/meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc
@@ -0,0 +1,125 @@
+SUMMARY = "Fast open source processor emulator"
+HOMEPAGE = "http://qemu.org"
+LICENSE = "GPLv2 & LGPLv2.1"
+DEPENDS = "glib-2.0 zlib pixman"
+RDEPENDS_${PN}_class-target += "bash python"
+RDEPENDS_${PN}-ptest = "bash make"
+
+require qemu-targets.inc
+inherit autotools ptest
+BBCLASSEXTEND = "native nativesdk"
+
+PR = "r0"
+
+# QEMU_TARGETS is overridable variable
+QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
+
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
+
+EXTRA_OECONF_append_class-native = " --enable-debug --enable-debug-info"
+INHIBIT_SYSROOT_STRIP = "1"
+
+EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
+				"
+export LIBTOOL="${HOST_SYS}-libtool"
+
+do_configure_prepend_class-native() {
+	# Append build host pkg-config paths for native target since the host may provide sdl
+	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
+	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
+		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
+		# link with system dbus on Ubuntu 15.10
+		# FIXME: remove below 4 lines when oe dbus is upgraded
+		if [ -r /etc/lsb-release -a "$(lsb_release -is)$(lsb_release -rs)" = "Ubuntu15.10" ] ; then
+			libs=$(PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_PATH=$BHOST_PKGCONFIG_PATH PATH=/usr/bin:/bin pkg-config --libs dbus-1 || echo "")
+			[ -n "$libs" ] && export LDFLAGS="$libs $LDFLAGS"
+		fi
+	fi
+}
+
+KVMENABLE = "--enable-kvm"
+KVMENABLE_darwin = "--disable-kvm"
+KVMENABLE_mingw32 = "--disable-kvm"
+
+do_configure() {
+    # Handle distros such as CentOS 5 32-bit that do not have kvm support
+    KVMOPTS="--disable-kvm"
+    if [ "${PN}" != "qemu-native" -a "${PN}" != "nativesdk-qemu" ] \
+       || [ -f /usr/include/linux/kvm.h ] ; then
+       KVMOPTS="${KVMENABLE}"
+    fi
+
+    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --localstatedir=${localstatedir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
+    test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
+}
+
+do_compile_ptest() {
+	make buildtest-TESTS
+}
+
+do_install_ptest() {
+	cp -rL ${B}/tests ${D}${PTEST_PATH}
+	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf {}
+
+	cp ${S}/tests/Makefile ${D}${PTEST_PATH}/tests
+}
+
+do_install () {
+	export STRIP="true"
+	autotools_do_install
+	install -d ${D}${datadir}/qemu
+}
+
+# The following fragment will create a wrapper for qemu-mips user emulation
+# binary in order to work around a segmentation fault issue. Basically, by
+# default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
+# This will trigger a MMU access fault in the virtual CPU. With this change,
+# the qemu-mips works fine.
+# IMPORTANT: This piece needs to be removed once the root cause is fixed!
+do_install_append() {
+	if [ -e "${D}/${bindir}/qemu-mips" ]; then
+		create_wrapper ${D}/${bindir}/qemu-mips \
+			QEMU_RESERVED_VA=0x0
+	fi
+}
+# END of qemu-mips workaround
+
+PACKAGECONFIG ??= " \
+	fdt sdl \
+	${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen', '', d)} \
+	"
+PACKAGECONFIG_class-native ??= "fdt alsa uuid"
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl"
+NATIVEDEPS = ""
+NATIVEDEPS_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxext-native', '',d)}"
+PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl ${NATIVEDEPS},"
+PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
+PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
+PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
+PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen,xen-libxenstore xen-libxenctrl xen-libxenguest"
+PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
+PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpeg,"
+PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng,"
+PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
+PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
+PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
+PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+ libvte,"
+PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
+PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
+PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
+PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
+PACKAGECONFIG[alsa] = ",,alsa-lib"
+PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,mesa"
+PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
+PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
+PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
+
+EXTRA_OECONF += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '--audio-drv-list=oss,alsa', '', d)}"
+
+# Qemu target will not build in world build for ARM or Mips
+BROKEN_qemuarm = "1"
+BROKEN_qemumips64 = "1"
+BROKEN_qemumips = "1"
+
+INSANE_SKIP_${PN} = "arch"
diff --git a/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb b/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
new file mode 100644
index 0000000..97667ba
--- /dev/null
+++ b/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
@@ -0,0 +1,21 @@
+# Based off of [1], appears to be MIT licensed [2].
+#
+# [1] https://github.com/dirtybit/gumstix-yocto/blob/master/meta/recipes-devtools/qemu/qemu_git.bb
+# [2] https://github.com/dirtybit/gumstix-yocto/blob/master/meta/COPYING.MIT
+
+require qemu.inc
+
+SRCREV = "d1f8764099022bc1173f2413331b26d4ff609a0c"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
+                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
+
+SRC_URI = "git://github.com/openbmc/qemu.git;protocol=https"
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST_class-target_mips64 = "null"
+
+do_install_append() {
+    # Prevent QA warnings about installed ${localstatedir}/run
+    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
+}
diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/bblayers.conf.sample
index d0e0219..c0dc6cf 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/bblayers.conf.sample
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/bblayers.conf.sample
@@ -9,6 +9,7 @@ BBLAYERS ?= " \
   ##OEROOT##/meta \
   ##OEROOT##/meta-yocto \
   ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-openbmc-bsp \
   ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
   ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2400 \
   ##OEROOT##/meta-openbmc-machines/meta-openpower \
diff --git a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/bblayers.conf.sample b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/bblayers.conf.sample
index a261b26..b68e458 100644
--- a/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/bblayers.conf.sample
+++ b/meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/conf/bblayers.conf.sample
@@ -9,6 +9,7 @@ BBLAYERS ?= " \
   ##OEROOT##/meta \
   ##OEROOT##/meta-yocto \
   ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-openbmc-bsp \
   ##OEROOT##/meta-openbmc-bsp/meta-aspeed \
   ##OEROOT##/meta-openbmc-bsp/meta-aspeed/meta-ast2400 \
   ##OEROOT##/meta-openbmc-machines/meta-openpower \
-- 
2.5.0
