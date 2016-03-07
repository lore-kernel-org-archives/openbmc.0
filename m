Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1DD371A0365
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 05:50:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457376630030766.8377170518274;
 Mon, 7 Mar 2016 10:50:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/2] Move glibc-cross-localedef patches from
 yocto-poky.
Date: Mon,  7 Mar 2016 12:50:25 -0600
Message-Id: <1457376625-657-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457376625-657-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457376625-657-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_2_02036_20
X-ZohoMail-Owner: <1457376625-657-3-git-send-email-openbmc-patches@stwcx.xyz>+zmo_0_<openbmc-patches@stwcx.xyz>
X-ZohoMail-Sender: 172.110.7.206
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
X-List-Received-Date: Mon, 07 Mar 2016 18:50:36 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 .../0001-add-support-for-Power8-LE-mode.patch      | 26 ++++++++++++++++++++++
 .../glibc/cross-localedef-native_2.22.bbappend     |  2 ++
 .../0001-add-support-for-Power8-LE-mode.patch      | 26 ----------------------
 .../glibc/cross-localedef-native_2.22.bb           |  1 -
 4 files changed, 28 insertions(+), 27 deletions(-)
 create mode 100644 meta-phosphor/common/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch
 create mode 100644 meta-phosphor/common/recipes-core/glibc/cross-localedef-native_2.22.bbappend
 delete mode 100644 yocto-poky/meta/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch

diff --git a/meta-phosphor/common/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch b/meta-phosphor/common/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch
new file mode 100644
index 0000000..5b8c240
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch
@@ -0,0 +1,26 @@
+From bc89a1d5329cf8f8a67a5e8c2b7ed53aa6611183 Mon Sep 17 00:00:00 2001
+From: Chris Austen <austenc@us.ibm.com>
+Date: Thu, 24 Sep 2015 14:49:24 -0500
+Subject: [PATCH 1/1] add support for Power8 LE mode
+
+---
+ config.guess | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/localedef/config.guess b/localedef/config.guess
+index 61f2e4c..c77ec22 100644
+--- a/localedef/config.guess
++++ b/localedef/config.guess
+@@ -876,6 +876,9 @@ EOF
+     ppc64:Linux:*:*)
+ 	echo powerpc64-unknown-linux-gnu
+ 	exit 0 ;;
++    ppc64le:Linux:*:*)
++       echo powerpc64le-unknown-linux-gnu
++       exit 0 ;;
+     alpha:Linux:*:*)
+ 	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
+ 	  EV5)   UNAME_MACHINE=alphaev5 ;;
+-- 
+1.9.1
+
diff --git a/meta-phosphor/common/recipes-core/glibc/cross-localedef-native_2.22.bbappend b/meta-phosphor/common/recipes-core/glibc/cross-localedef-native_2.22.bbappend
new file mode 100644
index 0000000..f065ed7
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/glibc/cross-localedef-native_2.22.bbappend
@@ -0,0 +1,2 @@
+SRC_URI += "file://0001-add-support-for-Power8-LE-mode.patch"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/yocto-poky/meta/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch b/yocto-poky/meta/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch
deleted file mode 100644
index 5b8c240..0000000
--- a/yocto-poky/meta/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From bc89a1d5329cf8f8a67a5e8c2b7ed53aa6611183 Mon Sep 17 00:00:00 2001
-From: Chris Austen <austenc@us.ibm.com>
-Date: Thu, 24 Sep 2015 14:49:24 -0500
-Subject: [PATCH 1/1] add support for Power8 LE mode
-
----
- config.guess | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/localedef/config.guess b/localedef/config.guess
-index 61f2e4c..c77ec22 100644
---- a/localedef/config.guess
-+++ b/localedef/config.guess
-@@ -876,6 +876,9 @@ EOF
-     ppc64:Linux:*:*)
- 	echo powerpc64-unknown-linux-gnu
- 	exit 0 ;;
-+    ppc64le:Linux:*:*)
-+       echo powerpc64le-unknown-linux-gnu
-+       exit 0 ;;
-     alpha:Linux:*:*)
- 	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
- 	  EV5)   UNAME_MACHINE=alphaev5 ;;
--- 
-1.9.1
-
diff --git a/yocto-poky/meta/recipes-core/glibc/cross-localedef-native_2.22.bb b/yocto-poky/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
index c7a9db7..2153ece 100644
--- a/yocto-poky/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
+++ b/yocto-poky/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
@@ -20,7 +20,6 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
            file://fix_for_centos_5.8.patch \
-           file://0001-add-support-for-Power8-LE-mode.patch \
            ${EGLIBCPATCHES} \
 "
 EGLIBCPATCHES = "\
-- 
2.7.1
