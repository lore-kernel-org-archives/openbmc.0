Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B5D881A08C9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 06:36:34 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444678591156807.7785128525857;
 Mon, 12 Oct 2015 12:36:31 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Code to allow building on Power  based systems
Date: Mon, 12 Oct 2015 14:36:27 -0500
Message-Id: <1444678587-27997-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444678587-27997-1-git-send-email-patches@stwcx.xyz>
References: <1444678587-27997-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 19:36:35 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 yocto-poky/meta/classes/siteinfo.bbclass           |  1 +
 .../0001-add-support-for-Power8-LE-mode.patch      | 26 ++++++++++++++++++++++
 .../glibc/cross-localedef-native_2.22.bb           |  1 +
 3 files changed, 28 insertions(+)
 create mode 100644 yocto-poky/meta/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch

diff --git a/yocto-poky/meta/classes/siteinfo.bbclass b/yocto-poky/meta/classes/siteinfo.bbclass
index 9f6eac4..3b562ee 100644
--- a/yocto-poky/meta/classes/siteinfo.bbclass
+++ b/yocto-poky/meta/classes/siteinfo.bbclass
@@ -42,6 +42,7 @@ def siteinfo_data(d):
         "powerpc64": "endian-big bit-64 powerpc-common",
         "ppc": "endian-big bit-32 powerpc-common",
         "ppc64": "endian-big bit-64 powerpc-common",
+        "ppc64le": "endian-little bit-64 powerpc-common",
         "sh3": "endian-little bit-32 sh-common",
         "sh4": "endian-little bit-32 sh-common",
         "sparc": "endian-big bit-32",
diff --git a/yocto-poky/meta/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch b/yocto-poky/meta/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch
new file mode 100644
index 0000000..5b8c240
--- /dev/null
+++ b/yocto-poky/meta/recipes-core/glibc/cross-localedef-native/0001-add-support-for-Power8-LE-mode.patch
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
diff --git a/yocto-poky/meta/recipes-core/glibc/cross-localedef-native_2.22.bb b/yocto-poky/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
index 2153ece..c7a9db7 100644
--- a/yocto-poky/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
+++ b/yocto-poky/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
@@ -20,6 +20,7 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 SRC_URI = "${GLIBC_GIT_URI};branch=${BRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
            file://fix_for_centos_5.8.patch \
+           file://0001-add-support-for-Power8-LE-mode.patch \
            ${EGLIBCPATCHES} \
 "
 EGLIBCPATCHES = "\
-- 
2.6.0
