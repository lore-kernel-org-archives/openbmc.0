Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYPqJ01kJzDq5d
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 07:57:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466459863667454.03282155205477;
 Mon, 20 Jun 2016 14:57:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc 4/7] openssl: run 'make depend'
Date: Mon, 20 Jun 2016 16:57:34 -0500
Message-Id: <20160620215737.13107-5-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160620215737.13107-1-openbmc-patches@stwcx.xyz>
References: <20160620215737.13107-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 20 Jun 2016 21:57:48 -0000

From: Patrick Williams <patrick@stwcx.xyz>

The configure flags we have require openssl to be built with:
    make depend && make
The current openssl.inc file only has 'make', so prepend a call
to 'make depend'.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 .../recipes-connectivity/openssl/openssl/Configure.patch  | 15 +++++++++++++++
 .../recipes-connectivity/openssl/openssl_%.bbappend       |  8 ++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-connectivity/openssl/openssl/Configure.patch

diff --git a/meta-phosphor/common/recipes-connectivity/openssl/openssl/Configure.patch b/meta-phosphor/common/recipes-connectivity/openssl/openssl/Configure.patch
new file mode 100644
index 0000000..690301b
--- /dev/null
+++ b/meta-phosphor/common/recipes-connectivity/openssl/openssl/Configure.patch
@@ -0,0 +1,15 @@
+diff --git a/Configure.bak b/Configure
+index c98107a..320cf2c 100755
+--- a/Configure.bak
++++ b/Configure
+@@ -1723,8 +1723,8 @@ while (<IN>)
+ 		s/^CC=.*$/CC= $cc/;
+ 		s/^AR=\s*ar/AR= $ar/;
+ 		s/^RANLIB=.*/RANLIB= $ranlib/;
+-		s/^MAKEDEPPROG=.*$/MAKEDEPPROG= $cc/ if $cc eq "gcc";
+-		s/^MAKEDEPPROG=.*$/MAKEDEPPROG= $cc/ if $ecc eq "gcc" || $ecc eq "clang";
++		s/^MAKEDEPPROG=.*$/MAKEDEPPROG= $cc/; # if $cc eq "gcc";
++		#s/^MAKEDEPPROG=.*$/MAKEDEPPROG= $cc/ if $ecc eq "gcc" || $ecc eq "clang";
+ 		}
+ 	s/^CFLAG=.*$/CFLAG= $cflags/;
+ 	s/^DEPFLAG=.*$/DEPFLAG=$depflags/;
diff --git a/meta-phosphor/common/recipes-connectivity/openssl/openssl_%.bbappend b/meta-phosphor/common/recipes-connectivity/openssl/openssl_%.bbappend
index a18a552..ead4ec3 100644
--- a/meta-phosphor/common/recipes-connectivity/openssl/openssl_%.bbappend
+++ b/meta-phosphor/common/recipes-connectivity/openssl/openssl_%.bbappend
@@ -1,3 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI_append = "file://Configure.patch"
 
 # General config settings.
 EXTRA_OECONF_append = " shared no-hw no-err no-psk no-srp no-engines "
@@ -9,3 +11,9 @@ EXTRA_OECONF_append = " no-ssl2 no-ssl3 "
 EXTRA_OECONF_append = " no-idea no-md2 no-mdc2 no-rc5 no-md4 \
         no-ripemd160 no-rmd160 no-whirlpool no-sha0 no-camellia \
         no-rc2 no-rc4 no-bf no-cast no-seed no-gost "
+
+do_configure_append() {
+    pwd
+    cat Makefile
+    oe_runmake depend
+}
-- 
2.9.0
