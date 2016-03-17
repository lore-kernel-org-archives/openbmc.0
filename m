Return-Path: <andrew@aj.id.au>
Received: from homiemail-a21.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qQbZl0KWYzDqWs
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 15:53:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=SYai5FP7; 
 dkim-atps=neutral
Received: from homiemail-a21.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTP id 09B2A300072
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 21:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 QpRnaC8g7GPmJ80JbxAJB0jAcC8=; b=SYai5FP7WDki2t0ePhj983tmHf2F0C4g
 MFuP0EVQzK1Jrx5tkdvAxr39phJBJ+zMCIhkmoJzM/xa92N9qNDSoI52viL53Wi3
 Anqmf5wVeP/Qz9cbPVWuUQImAhbvsNwdfz5gsGyhUqAK/UxIy0QVsk0yIfNSTTu1
 V5MNIfZbxCY=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPSA id 9CA2B300064
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 21:53:01 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH] runqemu: Add palmetto target
Date: Thu, 17 Mar 2016 15:22:48 +1030
Message-Id: <1458190368-24002-2-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
References: <1458190368-24002-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Thu, 17 Mar 2016 04:53:03 -0000

The patch does a few things, but is more for inciting feedback than for
merging:

* Adds qemu_git.bb in favour of qemu_2.4.0.bb
* Configured to build from master, at the commit merging the AST2400 support
* Adds a runqemu target 'palmetto'

Example use:

    $ bitbake obmc-phosphor-image
    $ runqemu palmetto slirp

Specifying slirp avoids needing root to configure network, which won't
work anyway. The palmetto-bmc machine currently only models the VIC and
timers from the AST2400, and adds a 8250 UART for a console so there's not
much interesting to play with in terms of hardware support. But, we can now
boot the one kernel on both the hardware and in QEMU.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 yocto-poky/meta/recipes-devtools/qemu/qemu.inc     | 17 -----------------
 .../meta/recipes-devtools/qemu/qemu_2.4.0.bb       | 22 ----------------------
 yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb  | 21 +++++++++++++++++++++
 yocto-poky/scripts/runqemu                         |  9 ++++++---
 yocto-poky/scripts/runqemu-internal                | 12 ++++++++++++
 5 files changed, 39 insertions(+), 42 deletions(-)
 delete mode 100644 yocto-poky/meta/recipes-devtools/qemu/qemu_2.4.0.bb
 create mode 100644 yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb

diff --git a/yocto-poky/meta/recipes-devtools/qemu/qemu.inc b/yocto-poky/meta/recipes-devtools/qemu/qemu.inc
index f6c0ae3..80ba2ca 100644
--- a/yocto-poky/meta/recipes-devtools/qemu/qemu.inc
+++ b/yocto-poky/meta/recipes-devtools/qemu/qemu.inc
@@ -14,20 +14,6 @@ PR = "r1"
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
-SRC_URI = "\
-    file://powerpc_rom.bin \
-    file://disable-grabs.patch \
-    file://exclude-some-arm-EABI-obsolete-syscalls.patch \
-    file://wacom.patch \
-    file://add-ptest-in-makefile.patch \
-    file://run-ptest \
-    file://cpus.c-qemu_mutex_lock_iothread-fix-race-condition-a.patch \
-    "
-
-SRC_URI_append_class-native = "\
-    file://fix-libcap-header-issue-on-some-distro.patch \
-    file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
-    "
 
 EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
 
@@ -83,7 +69,6 @@ do_install () {
 	export STRIP="true"
 	autotools_do_install
 	install -d ${D}${datadir}/qemu
-	install -m 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
 }
 
 # The following fragment will create a wrapper for qemu-mips user emulation
@@ -114,12 +99,10 @@ PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap a
 PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
 PACKAGECONFIG[xfs] = "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
 PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen,xen-libxenstore xen-libxenctrl xen-libxenguest"
-PACKAGECONFIG[vnc-tls] = "--enable-vnc --enable-vnc-tls,--disable-vnc-tls, gnutls,"
 PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
 PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpeg,"
 PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng,"
 PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
-PACKAGECONFIG[nss] = "--enable-smartcard-nss,--disable-smartcard-nss,nss,"
 PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
 PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+ libvte,"
diff --git a/yocto-poky/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/yocto-poky/meta/recipes-devtools/qemu/qemu_2.4.0.bb
deleted file mode 100644
index 59b1788..0000000
--- a/yocto-poky/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require qemu.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-
-SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
-            file://qemu-enlarge-env-entry-size.patch \
-            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
-            file://smc91c111_fix1.patch \
-            file://smc91c111_fix2.patch \
-            file://smc91c111_fix3.patch \
-           "
-SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-SRC_URI[sha256sum] = "72b0b991bbcc540663a019e1e8c4f714053b691dda32c9b9ee80b25f367e6620"
-
-COMPATIBLE_HOST_class-target_mips64 = "null"
-
-do_install_append() {
-    # Prevent QA warnings about installed ${localstatedir}/run
-    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
-}
diff --git a/yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb b/yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb
new file mode 100644
index 0000000..5128425
--- /dev/null
+++ b/yocto-poky/meta/recipes-devtools/qemu/qemu_git.bb
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
+SRC_URI = "git://git.qemu.org/qemu.git;protocol=git"
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST_class-target_mips64 = "null"
+
+do_install_append() {
+    # Prevent QA warnings about installed ${localstatedir}/run
+    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
+}
diff --git a/yocto-poky/scripts/runqemu b/yocto-poky/scripts/runqemu
index 23cf5be..f09da50 100755
--- a/yocto-poky/scripts/runqemu
+++ b/yocto-poky/scripts/runqemu
@@ -110,7 +110,7 @@ while true; do
     arg=${1}
     case "$arg" in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
-        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
+        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq" | "palmetto")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
@@ -236,13 +236,13 @@ fi
 
 if [ -z "$MACHINE" ]; then
     if [ "x$FSTYPE" = "xvmdk" ] || [ "x$FSTYPE" = "xhddimg" ] || [ "x$FSTYPE" = "xhdddirect" ]; then
-        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4|palmetto\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from image filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on image [$VM]"
     else
-        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4|palmetto\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename [$KERNEL]"
         fi
@@ -332,6 +332,9 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
 QEMUZYNQ_DEFAULT_KERNEL=uImage
 QEMUZYNQ_DEFAULT_FSTYPE=cpio
 
+PALMETTO_DEFAULT_KERNEL=cuImage
+PALMETTO_DEFAULT_FSTYPE=cpio.gz
+
 AKITA_DEFAULT_KERNEL=zImage-akita.bin
 AKITA_DEFAULT_FSTYPE=jffs2
 
diff --git a/yocto-poky/scripts/runqemu-internal b/yocto-poky/scripts/runqemu-internal
index 1527268..479d61c 100755
--- a/yocto-poky/scripts/runqemu-internal
+++ b/yocto-poky/scripts/runqemu-internal
@@ -53,6 +53,9 @@ else
         "qemuarm64")
             mem_size=512
             ;;
+        "palmetto")
+            mem_size=512
+            ;;
         "qemumicroblaze")
             mem_size=64
             ;;
@@ -295,6 +298,7 @@ fi
 
 case "$MACHINE" in
     "qemuarm") ;;
+    "palmetto") ;;
     "qemuarm64") ;;
     "qemumicroblaze") ;;
     "qemumips") ;;
@@ -384,6 +388,14 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     fi
 fi
 
+if [ "$MACHINE" = "palmetto" ]; then
+    QEMU=qemu-system-arm
+    MACHINE_SUBTYPE=palmetto-bmc
+    export QEMU_AUDIO_DRV="none"
+    KERNCMDLINE="console=ttyS4"
+    QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -initrd $ROOTFS -no-reboot -nographic"
+fi
+
 if [ "$MACHINE" = "qemuarm64" ]; then
     QEMU=qemu-system-aarch64
 
-- 
2.5.0
