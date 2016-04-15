Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmjhK5DtkzDq64
 for <openbmc@lists.ozlabs.org>; Sat, 16 Apr 2016 02:30:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460737835890858.1614397097393;
 Fri, 15 Apr 2016 09:30:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/4] pflash: Add pflash recipe
Date: Fri, 15 Apr 2016 11:30:30 -0500
Message-Id: <1460737833-13353-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460737833-13353-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460737833-13353-1-git-send-email-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Fri, 15 Apr 2016 16:30:42 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 .../common/recipes-bsp/pflash/pflash.bb            | 23 +++++
 .../0001-pflash-Allow-building-under-yocto.patch   | 98 ++++++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Allow-building-under-yocto.patch

diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
new file mode 100644
index 0000000..b84335c
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
@@ -0,0 +1,23 @@
+SUMMARY = "pflash programmer for OpenPower"
+DESCRIPTION = "pflash firmware programming tool for OpenPower machines"
+HOMEPAGE = "https://github.com/open-power"
+LICENSE = "Apache-2.0"
+
+SRC_URI += "git://github.com/open-power/skiboot.git"
+LIC_FILES_CHKSUM = "file://${S}/LICENCE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRCREV = "6677d2cefb60103156db713e2cdffb02b4a2d270"
+PV = "pflash-git${SRCPV}"
+SRC_URI += "file://0001-pflash-Allow-building-under-yocto.patch"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} PFLASH_VERSION=${PV} V=1'
+
+do_compile () {
+        oe_runmake -C external/pflash all
+}
+
+do_install () {
+        oe_runmake -C external/pflash install DESTDIR=${D}
+}
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Allow-building-under-yocto.patch b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Allow-building-under-yocto.patch
new file mode 100644
index 0000000..60d6a7b
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Allow-building-under-yocto.patch
@@ -0,0 +1,98 @@
+From bb362203a7cc7012ba723d8828491756f9bb4ecb Mon Sep 17 00:00:00 2001
+From: Patrick Williams <patrick@stwcx.xyz>
+Date: Thu, 14 Apr 2016 10:46:22 -0500
+Subject: [PATCH] pflash: Allow building under yocto.
+
+The makefiles under external/* utilize the $(CROSS_COMPILE) variable
+to determine the cross-compiler prefix.  In a few places,
+$(CROSS_COMPILE)gcc is called instead of $(CC).  The issue with this is
+that yocto build passes some compile flags as part of $(CC) instead of
+$(CFLAGS), the most important of these is '--sysroot=...'.  Without the
+proper --sysroot flag, pflash compile fails to find critical libc
+headers like stdio.h.
+
+This change delegates setting of $(CC) and $(LD) to
+external/common/rules.mk, which is widely used in the external tree, and
+ensures that:
+    1) $(CC) is used instead of $(CROSS_COMPILE)gcc.
+    2) CC is only set when not passed from the environment.
+
+Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
+---
+ external/common/rules.mk   | 6 ++++--
+ external/gard/rules.mk     | 2 --
+ external/opal-prd/Makefile | 2 --
+ external/pflash/rules.mk   | 2 --
+ external/shared/Makefile   | 1 -
+ 5 files changed, 4 insertions(+), 9 deletions(-)
+
+diff --git a/external/common/rules.mk b/external/common/rules.mk
+index ec20593..95a2757 100644
+--- a/external/common/rules.mk
++++ b/external/common/rules.mk
+@@ -1,3 +1,5 @@
++CC ?= $(CROSS_COMPILE)gcc
++LD ?= $(CROSS_COMPILE)ld
+ ARCH := $(shell $(GET_ARCH) "$(CROSS_COMPILE)")
+ 
+ ifeq ($(ARCH),ARCH_ARM)
+@@ -42,8 +44,8 @@ arch_clean:
+ $(ARCH_SRC): | common
+ 
+ $(ARCH_OBJS): common-%.o: common/%.c
+-	$(Q_CC)$(CROSS_COMPILE)gcc $(CFLAGS) $(CPPFLAGS) -c $< -o $@
++	$(Q_CC)$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
+ 
+ common-arch_flash.o: $(ARCH_OBJS)
+-	$(Q_LD)$(CROSS_COMPILE)ld -r $(ARCH_OBJS) -o $@
++	$(Q_LD)$(LD) -r $(ARCH_OBJS) -o $@
+ 
+diff --git a/external/gard/rules.mk b/external/gard/rules.mk
+index f0086a2..0dd14ed 100644
+--- a/external/gard/rules.mk
++++ b/external/gard/rules.mk
+@@ -7,8 +7,6 @@ OBJS     += $(LIBFLASH_OBJS)
+ OBJS     += common-arch_flash.o
+ EXE       = gard
+ 
+-CC = $(CROSS_COMPILE)gcc
+-
+ prefix = /usr/local/
+ sbindir = $(prefix)/sbin
+ datadir = $(prefix)/share
+diff --git a/external/opal-prd/Makefile b/external/opal-prd/Makefile
+index 3f34371..ff5ba6b 100644
+--- a/external/opal-prd/Makefile
++++ b/external/opal-prd/Makefile
+@@ -1,5 +1,3 @@
+-CC = $(CROSS_COMPILE)gcc
+-
+ CFLAGS += -m64 -Werror -Wall -g2 -ggdb
+ LDFLAGS += -m64
+ ASFLAGS = -m64
+diff --git a/external/pflash/rules.mk b/external/pflash/rules.mk
+index 219e3d3..aa426b5 100644
+--- a/external/pflash/rules.mk
++++ b/external/pflash/rules.mk
+@@ -9,8 +9,6 @@ OBJS	+= $(LIBFLASH_OBJS)
+ OBJS	+= common-arch_flash.o
+ EXE     = pflash
+ 
+-CC	= $(CROSS_COMPILE)gcc
+-
+ PFLASH_VERSION ?= $(shell ../../make_version.sh $(EXE))
+ 
+ version.c: .version
+diff --git a/external/shared/Makefile b/external/shared/Makefile
+index ffc049f..4c31657 100644
+--- a/external/shared/Makefile
++++ b/external/shared/Makefile
+@@ -1,5 +1,4 @@
+ .DEFAULT_GOAL := all
+-CC ?= $(CROSS_COMPILE)gcc
+ GET_ARCH = ../../external/common/get_arch.sh
+ include ../../external/common/rules.mk
+ 
+-- 
+2.6.3
+
-- 
2.7.1
