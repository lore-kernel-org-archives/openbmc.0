Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478E01A01E7
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 03:50:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449420620031423.9825947777664;
 Sun, 6 Dec 2015 08:50:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/8] Updating base build with sprint 3 candidate 3
Date: Sun,  6 Dec 2015 11:50:11 -0500
Message-Id: <1449420618-3202-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449420618-3202-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449420618-3202-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 06 Dec 2015 16:50:24 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 .../common/recipes-phosphor/dbus/obmc-rest.bb          |  2 +-
 .../common/recipes-phosphor/host-ipmid/btbridged.bb    |  4 ++--
 .../host-ipmid/btbridged/makefile.patch                | 18 ------------------
 .../recipes-phosphor/host-ipmid/host-ipmid-fru.bb      | 11 +++++++----
 .../common/recipes-phosphor/host-ipmid/host-ipmid.bb   |  2 +-
 .../obmc-phosphor-event/obmc-phosphor-event.bb         |  2 +-
 .../common/recipes-phosphor/skeleton/skeleton.bb       |  2 +-
 7 files changed, 13 insertions(+), 28 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch

diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
index 8b4459e..19da738 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -21,6 +21,6 @@ SRC_URI += " \
         git://github.com/openbmc/phosphor-rest-server \
         "
 
-SRCREV = "275ec270684cd3b946674d02462bc9ed1890360e"
+SRCREV = "f481dfc6b059677d06c158a5e23cfffab56edc3f"
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
index aa8cc94..1de0cc4 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
@@ -10,8 +10,8 @@ SYSTEMD_SERVICE_${PN} = "btbridged.service"
 inherit obmc-phosphor-host-ipmi-hw
 
 S = "${WORKDIR}/git"
-SRC_URI += "git://github.com/openbmc/btbridge file://makefile.patch"
-SRCREV="e71c7941a35949c0b93ce5e7864ab35447d30df2"
+SRC_URI += "git://github.com/openbmc/btbridge"
+SRCREV="eee5a2c00faf794a40bf11650e7c0585adc88932"
 
 # This is how linux-libc-headers says to include custom uapi headers
 EXTRA_OEMAKE_append = "CFLAGS=-I${STAGING_KERNEL_DIR}/include/uapi"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch
deleted file mode 100644
index 7cb1abe..0000000
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-diff --git a/Makefile b/Makefile
-index a55897f..52e1063 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,9 +1,7 @@
--CPPFLAGS=$(shell pkg-config --cflags libsystemd)
--LDFLAGS=$(shell pkg-config --libs libsystemd)
-+all: btbridged
- 
--EXE = btbridged
--
--all: $(EXE)
-+btbridged: btbridged.c
-+	$(CC) $(CFLAGS) `pkg-config --cflags --libs libsystemd` $^ -o $@
- 
- clean:
--	rm -rf *.o $(EXE)
-+	rm -f *.o btbridge
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
index 26eea2a..d61b2e6 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb
@@ -18,14 +18,17 @@ TARGET_CFLAGS += "-std=gnu++14"
 
 SRC_URI += "git://github.com/openbmc/ipmi-fru-parser"
 
-SRCREV = "1c779b8570849a52dac828538c36a59798f4583a"
+SRCREV = "20656b1e15bebd7bc2754bd680f045e253bd2809"
 
 FILES_${PN} += "${libdir}/host-ipmid/*.so"
 FILES_${PN}-dbg += "${libdir}/host-ipmid/.debug"
 
 S = "${WORKDIR}/git"
 
-do_install() {  
-        install -m 0755 -d ${D}${libdir}/host-ipmid
-        install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
+do_install() {
+	oe_runmake install DESTDIR=${D} LIBDIR=${libdir} BINDIR=${sbindir}
 }
+
+
+#        install -m 0755 -d ${D}${libdir}/host-ipmid
+#        install -m 0755 ${S}/*.so ${D}${libdir}/host-ipmid/
\ No newline at end of file
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 7393889..c20bd9a 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -14,7 +14,7 @@ inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
 
-SRCREV = "f0d4635fa2b417bd0eef3f19ae98e56ec615e703"
+SRCREV = "7e478ce6b065a8bbd2de0ac00934e43cc1639501"
 
 
 S = "${WORKDIR}/git"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
index c27937a..78856dd 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-event/obmc-phosphor-event.bb
@@ -12,7 +12,7 @@ inherit obmc-phosphor-c-daemon
 
 SRC_URI += "git://github.com/openbmc/phosphor-event"
 
-SRCREV = "0a4a39e46622a9d6d4719b14f8955866fdb51a20"
+SRCREV = "bebdb23ea092df6cde23e6da2a8940bd84de4810"
 
 RDEPENDS_${PN} += "libsystemd"
 DEPENDS += "systemd"
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index c3d240a..b8259a0 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,7 +16,7 @@ DEPENDS += "glib-2.0"
 RDEPENDS_${PN} += "python-subprocess python-tftpy"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-SRCREV = "af915f1251b4989f41829f9ae8589b42ef81efd7"
+SRCREV = "4732708e4e10411145f7eb4652f23dbfac341a2d"
 
 S = "${WORKDIR}"
 
-- 
2.6.3
