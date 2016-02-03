Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E23FF1A0167
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 14:40:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454470823042584.8640227808979;
 Tue, 2 Feb 2016 19:40:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: shgoupf <shgoupf@cn.ibm.com>
Subject: [PATCH openbmc] Add support for gevent package.
Date: Tue,  2 Feb 2016 21:40:21 -0600
Message-Id: <1454470821-15611-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454470821-15611-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454470821-15611-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 03 Feb 2016 03:40:29 -0000

From: shgoupf <shgoupf@cn.ibm.com>

Gevent package is required by latest obmc-rest for streaming.
---
 .../python/python-backports-ssl_3.4.0.2.bb         | 23 ++++++++++++++
 .../python/python-certifi_14.05.14.bb              | 20 ++++++++++++
 .../python/python-gevent/libev-conf.patch          | 19 ++++++++++++
 .../python/python-gevent_1.1rc3.bb                 | 36 ++++++++++++++++++++++
 .../python/python-greenlet_0.4.1.bb                | 14 +++++++++
 .../recipes-devtools/python/python-tblib_1.2.0.bb  | 18 +++++++++++
 .../common/recipes-phosphor/dbus/obmc-rest.bb      |  6 ++++
 .../common/recipes-support/libevent_1.4.14b.bb     | 15 +++++++++
 8 files changed, 151 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-certifi_14.05.14.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-gevent/libev-conf.patch
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-gevent_1.1rc3.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-greenlet_0.4.1.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-tblib_1.2.0.bb
 create mode 100644 meta-phosphor/common/recipes-support/libevent_1.4.14b.bb

diff --git a/meta-phosphor/common/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb b/meta-phosphor/common/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
new file mode 100644
index 0000000..9caae41
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-backports-ssl_3.4.0.2.bb
@@ -0,0 +1,23 @@
+SUMMARY = "The ssl.match_hostname() function from Python 3.4"
+DESCRIPTION = "The Secure Sockets layer is only actually secure if you check the hostname in the \
+certificate returned by the server to which you are connecting, and verify that it matches to hostname \
+that you are trying to reach. But the matching logic, defined in RFC2818, can be a bit tricky to implement \
+on your own. So the ssl package in the Standard Library of Python 3.2 and greater now includes a \
+match_hostname() function for performing this check instead of requiring every application to \
+implement the check separately. This backport brings match_hostname() to users of earlier versions of Python"
+HOMEPAGE = "https://pypi.python.org/pypi/backports.ssl_match_hostname"
+SECTION = "devel/python"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=77b684960b86b7a4bb4a450ffde08605"
+
+SRCNAME = "backports.ssl_match_hostname"
+
+SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "788214f20214c64631f0859dc79f23c6"
+SRC_URI[sha256sum] = "07410e7fb09aab7bdaf5e618de66c3dac84e2e3d628352814dc4c37de321d6ae"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
diff --git a/meta-phosphor/common/recipes-devtools/python/python-certifi_14.05.14.bb b/meta-phosphor/common/recipes-devtools/python/python-certifi_14.05.14.bb
new file mode 100644
index 0000000..5e0404e
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-certifi_14.05.14.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Python package for providing Mozilla's CA Bundle."
+DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
+Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
+which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
+HOMEPAGE = "https://pypi.python.org/pypi/certifi"
+SECTION = "devel/python"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
+
+SRCNAME = "certifi"
+
+SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "315ea4e50673a16ab047099f816fd32a"
+SRC_URI[sha256sum] = "1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
diff --git a/meta-phosphor/common/recipes-devtools/python/python-gevent/libev-conf.patch b/meta-phosphor/common/recipes-devtools/python/python-gevent/libev-conf.patch
new file mode 100644
index 0000000..283705f
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-gevent/libev-conf.patch
@@ -0,0 +1,19 @@
+Due to differences in library locations, the cross compile test can fail because it can't run
+the conftest binary (dynamically linked). Building it statically instead.
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ libev/configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/libev/configure
++++ b/libev/configure
+@@ -2730,7 +2730,7 @@
+ ac_ext=c
+ ac_cpp='$CPP $CPPFLAGS'
+ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+-ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
++ac_link='$CC -static -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}gcc", so it can be a program name with args.
diff --git a/meta-phosphor/common/recipes-devtools/python/python-gevent_1.1rc3.bb b/meta-phosphor/common/recipes-devtools/python/python-gevent_1.1rc3.bb
new file mode 100644
index 0000000..327276b
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-gevent_1.1rc3.bb
@@ -0,0 +1,36 @@
+HOMEPAGE = "http://www.gevent.org"
+SUMMARY = "A coroutine-based Python networking library"
+DESCRIPTION = "\
+  gevent is a coroutine-based Python networking library that uses greenlet \
+  to provide a high-level synchronous API on top of the libevent event \
+  loop. \
+  " 
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2"
+DEPENDS += "python-greenlet libevent"
+RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
+
+SRCNAME = "gevent"
+
+SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
+# SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
+SRC_URI[md5sum] = "cc96707c13ce2014dad386784fa105f5"
+# SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
+SRC_URI[sha256sum] = "cb94ffdf4bd147261b6b72423d208075c32c5989c2a55473d0c99c0cdb41e19d"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI += "file://libev-conf.patch"
+# SRC_URI += "file://gevent-allow-ssl-v2-or-v3-certificates.patch"
+
+# The python-gevent has no autoreconf ability
+# and the logic for detecting a cross compile is flawed
+# so always force a cross compile
+do_configure_append() {
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/libev/configure
+	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/c-ares/configure
+}
diff --git a/meta-phosphor/common/recipes-devtools/python/python-greenlet_0.4.1.bb b/meta-phosphor/common/recipes-devtools/python/python-greenlet_0.4.1.bb
new file mode 100644
index 0000000..a6db8ab
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-greenlet_0.4.1.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python lightweight in-process concurrent programming"
+HOMEPAGE = "http://pypi.python.org/pypi/greenlet"
+SECTION = "devel/python"
+LICENSE = "MIT & PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
+                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
+SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.zip"
+SRC_URI[md5sum] = "c2deda75bdda59c38cae12a77cc53adc"
+SRC_URI[sha256sum] = "ea671592f8460541286b133ed46a6cf5311a6b75051cc31b53e2bc38992b775a"
+
+S = "${WORKDIR}/greenlet-${PV}"
+
+inherit distutils
+
diff --git a/meta-phosphor/common/recipes-devtools/python/python-tblib_1.2.0.bb b/meta-phosphor/common/recipes-devtools/python/python-tblib_1.2.0.bb
new file mode 100644
index 0000000..926fd43
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-tblib_1.2.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Traceback fiddling library."
+DESCRIPTION = "For now allows you to pickle tracebacks and raise exceptions with pickled tracebacks in different processes. This allows better error handling when running code over multiple processes (imagine multiprocessing, billiard, futures, celery etc)"
+HOMEPAGE = "https://pypi.python.org/pypi/tblib"
+SECTION = "devel/python"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=cbdf69ffe15ef6bf937556e126c586a5"
+
+SRCNAME = "tblib"
+
+SRC_URI = "https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "804aed92abafcffa7439b0ce4e5dbc95"
+SRC_URI[sha256sum] = "80bb2d8782cc6f4b898e6455ac51abca3529f20205e5bcf34ae2ebf3e10df613"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
diff --git a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
index 3033a8d..339ce71 100644
--- a/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
+++ b/meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb
@@ -17,6 +17,12 @@ RDEPENDS_${PN} += " \
 	python-rocket \
 	python-bottle \
 	python-spwd \
+        python-gevent \
+        python-mime \
+        python-pprint \
+        python-re \
+        python-tblib \
+        python-ctypes \
         "
 SRC_URI += "git://github.com/openbmc/phosphor-rest-server"
 
diff --git a/meta-phosphor/common/recipes-support/libevent_1.4.14b.bb b/meta-phosphor/common/recipes-support/libevent_1.4.14b.bb
new file mode 100644
index 0000000..4209305
--- /dev/null
+++ b/meta-phosphor/common/recipes-support/libevent_1.4.14b.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "an asynchronous event notification library"
+HOMEPAGE = "http://www.monkey.org/~provos/libevent/"
+SECTION = "libs"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://event.c;endline=26;md5=bc20aa63bf60c36c2d8edb77746f6b7c"
+
+PR = "r0"
+
+SRC_URI = "http://www.monkey.org/~provos/${BPN}-${PV}-stable.tar.gz"
+S = "${WORKDIR}/${BPN}-${PV}-stable"
+
+inherit autotools
+
+LEAD_SONAME = "libevent-1.4.so"
-- 
2.6.4
