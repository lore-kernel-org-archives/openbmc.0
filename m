Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgPsl4V9yzDrP3
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 02:20:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467303640249425.4198645918756;
 Thu, 30 Jun 2016 09:20:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/3] meta-openpower: Update pflash version
Date: Thu, 30 Jun 2016 11:20:33 -0500
Message-Id: <20160630162033.2330-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630162033.2330-1-openbmc-patches@stwcx.xyz>
References: <20160630162033.2330-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 16:20:44 -0000

From: Joel Stanley <joel@jms.id.au>

Move to HEAD so we can drop the patches we carry.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../common/recipes-bsp/pflash/pflash.bb            |  13 +-
 .../pflash/0001-Make-links-target-reusable.patch   | 186 ---------------------
 ...ernal-Remove-external-shared-link-targets.patch |  40 -----
 .../0003-external-Fix-pflash-install-target.patch  |  28 ----
 ...rnal-Remove-m64-from-shared-CFLAGS-on-ARM.patch |  32 ----
 .../0005-external-Create-shared-rules.mk.patch     |  60 -------
 ...06-external-Add-dynamically-linked-pflash.patch |  68 --------
 ...-Fix-ARM-build-failure-with-parallel-make.patch |  28 ----
 8 files changed, 2 insertions(+), 453 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-Make-links-target-reusable.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0002-external-Remove-external-shared-link-targets.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0003-external-Fix-pflash-install-target.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0004-external-Remove-m64-from-shared-CFLAGS-on-ARM.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0005-external-Create-shared-rules.mk.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0006-external-Add-dynamically-linked-pflash.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-make.patch

diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
index ec43b4f..effc966 100644
--- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
@@ -5,22 +5,13 @@ LICENSE = "Apache-2.0"
 
 SRC_URI += "git://github.com/open-power/skiboot.git"
 
-SRC_URI += "file://0001-Make-links-target-reusable.patch"
-SRC_URI += "file://0002-external-Remove-external-shared-link-targets.patch"
-SRC_URI += "file://0003-external-Fix-pflash-install-target.patch"
-SRC_URI += "file://0004-external-Remove-m64-from-shared-CFLAGS-on-ARM.patch"
-SRC_URI += "file://0005-external-Create-shared-rules.mk.patch"
-SRC_URI += "file://0006-external-Add-dynamically-linked-pflash.patch"
-SRC_URI += "file://0007-external-Fix-ARM-build-failure-with-parallel-make.patch"
-
 LIC_FILES_CHKSUM = "file://${S}/LICENCE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "skiboot-5.2.2"
-PV = "5.2.2"
+SRCREV = "e46199974cca896f8012743eaad3cae140aba5a9"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} PFLASH_VERSION=${PV} V=1'
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} PFLASH_VERSION=${SRCREV} V=1'
 
 do_compile () {
         oe_runmake -C external/pflash all LINKAGE=dynamic
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-Make-links-target-reusable.patch b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-Make-links-target-reusable.patch
deleted file mode 100644
index 9088f2e..0000000
--- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-Make-links-target-reusable.patch
+++ /dev/null
@@ -1,186 +0,0 @@
-From e42206bf0729782330778e77283af2aca23499dc Mon Sep 17 00:00:00 2001
-From: Dinar Valeev <dvaleev@suse.com>
-Date: Tue, 29 Mar 2016 14:36:37 +0200
-Subject: [PATCH] Make links target reusable
-
-Move symlinking target to external/common/rules.mk, so the rule
-could be reused by gard and opal-prd.
-
-Signed-off-by: Dinar Valeev <dvaleev@suse.com>
-Reviewed-by: Joel Stanley <joel@jms.id.au>
-Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
----
- external/common/rules.mk   | 24 ++++++++++++++++++++++++
- external/gard/Makefile     | 19 ++-----------------
- external/opal-prd/Makefile | 25 ++-----------------------
- external/pflash/Makefile   | 24 +-----------------------
- 4 files changed, 29 insertions(+), 63 deletions(-)
-
-diff --git a/external/common/rules.mk b/external/common/rules.mk
-index ec20593..4a929d6 100644
---- a/external/common/rules.mk
-+++ b/external/common/rules.mk
-@@ -17,6 +17,30 @@ endif
- endif
- endif
- 
-+# Use make V=1 for a verbose build.
-+ifndef V
-+        Q_CC=	@echo '    CC ' $@;
-+        Q_LINK=	@echo '  LINK ' $@;
-+        Q_LN=   @echo '    LN ' $@;
-+        Q_MKDIR=@echo ' MKDIR ' $@;
-+endif
-+
-+
-+.PHONY: links
-+links: libflash ccan common
-+
-+libflash:
-+	$(Q_LN)ln -sf ../../libflash ./libflash
-+
-+ccan:
-+	$(Q_LN)ln -sf ../../ccan ./ccan
-+
-+common:
-+	$(Q_LN)ln -sf ../common ./common
-+
-+make_version.sh:
-+	$(Q_LN)ln -sf ../../make_version.sh
-+
- ARCH_SRC := $(addprefix common/,$(ARCH_FILES))
- ARCH_OBJS := $(addprefix common-,$(ARCH_FILES:.c=.o))
- 
-diff --git a/external/gard/Makefile b/external/gard/Makefile
-index be3d1ba..b54923d 100644
---- a/external/gard/Makefile
-+++ b/external/gard/Makefile
-@@ -3,22 +3,7 @@ include rules.mk
- GET_ARCH = ../../external/common/get_arch.sh
- include ../../external/common/rules.mk
- 
--all: $(EXE)
--
--.PHONY: links
--links: libflash ccan common make_version.sh
--
--libflash:
--	ln -sf ../../libflash .
--
--ccan:
--	ln -sf ../../ccan .
--
--common:
--	ln -sf ../common .
--
--make_version.sh:
--	ln -sf ../../make_version.sh
-+all: links arch_links $(EXE)
- 
- #Rebuild version.o so that the the version always matches
- #what the test suite will get from ./make_version.sh
-@@ -26,7 +11,7 @@ check: version.o all
- 	@ln -sf ../../test/test.sh test/test.sh
- 	@test/test-gard
- 
--$(OBJS): | links arch_links
-+links += make_version.sh
- 
- .PHONY: VERSION-always
- .version: VERSION-always
-diff --git a/external/opal-prd/Makefile b/external/opal-prd/Makefile
-index 3f34371..e89f73d 100644
---- a/external/opal-prd/Makefile
-+++ b/external/opal-prd/Makefile
-@@ -10,19 +10,11 @@ sbindir = $(prefix)/sbin
- datadir = $(prefix)/share
- mandir = $(datadir)/man
- 
--all: opal-prd
-+all: links arch_links | opal-prd
- 
- GET_ARCH = ../../external/common/get_arch.sh
- include ../../external/common/rules.mk
- 
--# Use make V=1 for a verbose build.
--ifndef V
--        Q_CC=	@echo '    CC ' $@;
--        Q_LINK=	@echo '  LINK ' $@;
--        Q_LN=   @echo '    LN ' $@;
--        Q_MKDIR=@echo ' MKDIR ' $@;
--endif
--
- LIBFLASH_OBJS = libflash-blocklevel.o libflash-libffs.o \
-                 libflash-libflash.o libflash-ecc.o \
-                 libflash-file.o
-@@ -30,30 +22,17 @@ LIBFLASH_OBJS = libflash-blocklevel.o libflash-libffs.o \
- OBJS = opal-prd.o thunk.o pnor.o i2c.o module.o version.o \
-        $(LIBFLASH_OBJS) common-arch_flash.o
- 
--LINKS = ccan common libflash $(ARCH_LINKS)
--
- OPAL_PRD_VERSION ?= $(shell ../../make_version.sh opal-prd)
- 
- ifdef KERNEL_DIR
--LINKS += asm/opal-prd.h
-+links += asm/opal-prd.h
- endif
- 
--ccan:
--	$(Q_LN)ln -sfr ../../ccan ./ccan
--
--libflash:
--	$(Q_LN)ln -sfr ../../libflash ./libflash
--
--common:
--	$(Q_LN)ln -sfr ../common ./common
--
- asm/opal-prd.h:
- 	$(Q_MKDIR)mkdir -p asm
- 	$(Q_LN)ln -sfr $(KERNEL_DIR)/arch/powerpc/include/uapi/asm/opal-prd.h \
- 			asm/opal-prd.h
- 
--$(OBJS): | $(LINKS)
--
- %.o: %.c
- 	$(Q_CC)$(COMPILE.c) $< -o $@
- 
-diff --git a/external/pflash/Makefile b/external/pflash/Makefile
-index 9d7c183..bc371a3 100644
---- a/external/pflash/Makefile
-+++ b/external/pflash/Makefile
-@@ -1,30 +1,8 @@
--# Use make V=1 for a verbose build.
--ifndef V
--        Q_CC=	@echo '    CC ' $@;
--        Q_LD=	@echo '    LD ' $@;
--        Q_LN=   @echo '    LN ' $@;
--        Q_MKDIR=@echo ' MKDIR ' $@;
--endif
--
- include rules.mk
- GET_ARCH = ../../external/common/get_arch.sh
- include ../../external/common/rules.mk
- 
--all: $(EXE)
--
--.PHONY: links
--links: libflash ccan common
--
--libflash:
--	$(Q_LN)ln -sf ../../libflash .
--
--ccan:
--	$(Q_LN)ln -sf ../../ccan .
--
--common:
--	$(Q_LN)ln -sf ../common .
--
--$(OBJS): | links arch_links
-+all: links arch_links $(EXE)
- 
- .PHONY: VERSION-always
- .version: VERSION-always
--- 
-1.8.3.1
-
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0002-external-Remove-external-shared-link-targets.patch b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0002-external-Remove-external-shared-link-targets.patch
deleted file mode 100644
index 335a1f8..0000000
--- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0002-external-Remove-external-shared-link-targets.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 7c7911eb7bea505474c3062bf5b0c60d99b502a5 Mon Sep 17 00:00:00 2001
-From: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Date: Wed, 25 May 2016 21:54:28 -0400
-Subject: [PATCH 1/5] external: Remove external/shared link targets
-
-These are already defined just like we need them in common/rules.mk
-
-Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Reviewed-by: Joel Stanley <joel@jms.id.au>
-Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
----
- external/shared/Makefile | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/external/shared/Makefile b/external/shared/Makefile
-index 4c31657..40ba2b9 100644
---- a/external/shared/Makefile
-+++ b/external/shared/Makefile
-@@ -10,18 +10,6 @@ VERSION = $(shell ../../make_version.sh)
- 
- CFLAGS += -m64 -Werror -Wall -g2 -ggdb -I. -fPIC
- 
--.PHONY: links
--links: libflash ccan common
--
--libflash:
--	ln -sf ../../libflash .
--
--common:
--	ln -sf ../common .
--
--ccan:
--	ln -sf ../../ccan .
--
- LIBFLASH_OBJS = libflash-file.o libflash-libflash.o libflash-libffs.o libflash-ecc.o libflash-blocklevel.o
- ARCHFLASH_OBJS = common-arch_flash.o
- OBJS = $(LIBFLASH_OBJS) $(ARCHFLASH_OBJS)
--- 
-1.8.3.1
-
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0003-external-Fix-pflash-install-target.patch b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0003-external-Fix-pflash-install-target.patch
deleted file mode 100644
index 7e52e5e..0000000
--- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0003-external-Fix-pflash-install-target.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e5fc583e610d4360f8fe50f225c868cb3019c1a7 Mon Sep 17 00:00:00 2001
-From: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Date: Thu, 26 May 2016 10:47:14 -0400
-Subject: [PATCH 2/5] external: Fix pflash install target
-
-The install target used $(sbindir) which isn't set anywhere.
-
-Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
----
- external/pflash/rules.mk | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/external/pflash/rules.mk b/external/pflash/rules.mk
-index aa426b5..9e73adf 100644
---- a/external/pflash/rules.mk
-+++ b/external/pflash/rules.mk
-@@ -8,6 +8,7 @@ LIBFLASH_SRC := $(addprefix libflash/,$(LIBFLASH_FILES))
- OBJS	+= $(LIBFLASH_OBJS)
- OBJS	+= common-arch_flash.o
- EXE     = pflash
-+sbindir?=/usr/sbin
- 
- PFLASH_VERSION ?= $(shell ../../make_version.sh $(EXE))
- 
--- 
-1.8.3.1
-
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0004-external-Remove-m64-from-shared-CFLAGS-on-ARM.patch b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0004-external-Remove-m64-from-shared-CFLAGS-on-ARM.patch
deleted file mode 100644
index 56f3906..0000000
--- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0004-external-Remove-m64-from-shared-CFLAGS-on-ARM.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e415b3b9bf0441745f442e12bfce25ed49c589bf Mon Sep 17 00:00:00 2001
-From: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Date: Thu, 26 May 2016 10:47:16 -0400
-Subject: [PATCH 3/5] external: Remove -m64 from shared CFLAGS on ARM
-
--m64 isn't an ARM flag.
-
-Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
----
- external/shared/Makefile | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/external/shared/Makefile b/external/shared/Makefile
-index 40ba2b9..b96c662 100644
---- a/external/shared/Makefile
-+++ b/external/shared/Makefile
-@@ -8,7 +8,10 @@ INCDIR = $(PREFIX)/include/libflash
- 
- VERSION = $(shell ../../make_version.sh)
- 
--CFLAGS += -m64 -Werror -Wall -g2 -ggdb -I. -fPIC
-+ifneq ($(ARCH), ARCH_ARM)
-+CFLAGS += -m64
-+endif
-+CFLAGS += -Werror -Wall -g2 -ggdb -I. -fPIC
- 
- LIBFLASH_OBJS = libflash-file.o libflash-libflash.o libflash-libffs.o libflash-ecc.o libflash-blocklevel.o
- ARCHFLASH_OBJS = common-arch_flash.o
--- 
-1.8.3.1
-
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0005-external-Create-shared-rules.mk.patch b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0005-external-Create-shared-rules.mk.patch
deleted file mode 100644
index 16bb04f..0000000
--- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0005-external-Create-shared-rules.mk.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 45e548176e16ad8ba9540fcd75131ba4993e42b7 Mon Sep 17 00:00:00 2001
-From: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Date: Thu, 26 May 2016 10:47:17 -0400
-Subject: [PATCH 4/5] external: Create shared rules.mk
-
-Building a dynamically linked pflash will need the shared library
-name.  Export it here.
-
-Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
----
- external/shared/Makefile | 9 ++++-----
- external/shared/rules.mk | 1 +
- 2 files changed, 5 insertions(+), 5 deletions(-)
- create mode 100644 external/shared/rules.mk
-
-diff --git a/external/shared/Makefile b/external/shared/Makefile
-index b96c662..c643666 100644
---- a/external/shared/Makefile
-+++ b/external/shared/Makefile
-@@ -1,13 +1,12 @@
- .DEFAULT_GOAL := all
- GET_ARCH = ../../external/common/get_arch.sh
- include ../../external/common/rules.mk
-+include rules.mk
- 
- PREFIX ?= /usr/local/
- LIBDIR = $(PREFIX)/lib
- INCDIR = $(PREFIX)/include/libflash
- 
--VERSION = $(shell ../../make_version.sh)
--
- ifneq ($(ARCH), ARCH_ARM)
- CFLAGS += -m64
- endif
-@@ -30,11 +29,11 @@ distclean: clean
- 	rm -f ccan libflash common
- 
- all: links arch_links $(OBJS)
--	$(CC) -shared -Wl,-soname,libflash.so -o libflash.so.$(VERSION) $(OBJS)
-+	$(CC) -shared -Wl,-soname,libflash.so -o $(SHARED_NAME) $(OBJS)
- 
- install-lib: all
--	install -D -m 0755 libflash.so.$(VERSION) $(LIBDIR)/libflash.so.$(VERSION)
--	ln -sf libflash.so.$(VERSION) $(LIBDIR)/libflash.so
-+	install -D -m 0755 $(SHARED_NAME) $(LIBDIR)/$(SHARED_NAME)
-+	ln -sf $(SHARED_NAME) $(LIBDIR)/libflash.so
- 
- install-dev: links arch_links
- 	mkdir -p $(INCDIR)
-diff --git a/external/shared/rules.mk b/external/shared/rules.mk
-new file mode 100644
-index 0000000..a4976a1
---- /dev/null
-+++ b/external/shared/rules.mk
-@@ -0,0 +1 @@
-+SHARED_NAME=libflash.so.$(shell ../../make_version.sh)
--- 
-1.8.3.1
-
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0006-external-Add-dynamically-linked-pflash.patch b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0006-external-Add-dynamically-linked-pflash.patch
deleted file mode 100644
index 8240f48..0000000
--- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0006-external-Add-dynamically-linked-pflash.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 24ae270984a37525f8393eeccbd0ac55da4503e1 Mon Sep 17 00:00:00 2001
-From: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Date: Thu, 26 May 2016 10:47:18 -0400
-Subject: [PATCH 5/5] external: Add dynamically linked pflash
-
-Modify the $(EXE) and install target dependencies if LINKAGE=dynamic.
-The default remains a statically linked pflash binary.
-
-Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
----
- external/pflash/Makefile |  2 +-
- external/pflash/rules.mk | 19 ++++++++++++++++---
- 2 files changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/external/pflash/Makefile b/external/pflash/Makefile
-index bc371a3..3a4c563 100644
---- a/external/pflash/Makefile
-+++ b/external/pflash/Makefile
-@@ -10,7 +10,7 @@ all: links arch_links $(EXE)
- 	@cmp -s $@ $@.tmp || cp $@.tmp $@
- 	@rm -f $@.tmp
- 
--install: all
-+install: all $(INSTALLDEPS)
- 	install -D pflash $(DESTDIR)$(sbindir)/pflash
- 
- .PHONY: dist
-diff --git a/external/pflash/rules.mk b/external/pflash/rules.mk
-index 9e73adf..df814fe 100644
---- a/external/pflash/rules.mk
-+++ b/external/pflash/rules.mk
-@@ -1,16 +1,29 @@
- .DEFAULT_GOAL := all
- 
- override CFLAGS  += -O2 -Wall -I.
--OBJS    = pflash.o progress.o version.o
-+PFLASH_OBJS    = pflash.o progress.o version.o common-arch_flash.o
- LIBFLASH_FILES := libflash.c libffs.c ecc.c blocklevel.c file.c
- LIBFLASH_OBJS := $(addprefix libflash-, $(LIBFLASH_FILES:.c=.o))
- LIBFLASH_SRC := $(addprefix libflash/,$(LIBFLASH_FILES))
--OBJS	+= $(LIBFLASH_OBJS)
--OBJS	+= common-arch_flash.o
-+OBJS	= $(PFLASH_OBJS) $(LIBFLASH_OBJS)
- EXE     = pflash
- sbindir?=/usr/sbin
- 
- PFLASH_VERSION ?= $(shell ../../make_version.sh $(EXE))
-+LINKAGE?=static
-+
-+ifeq ($(LINKAGE),dynamic)
-+include ../shared/rules.mk
-+SHARED=../shared/$(SHARED_NAME)
-+OBJS=$(PFLASH_OBJS) $(SHARED)
-+INSTALLDEPS+=install-shared
-+
-+install-shared:
-+	$(MAKE) -C ../shared install PREFIX=$(PREFIX)
-+
-+$(SHARED):
-+	$(MAKE) -C ../shared
-+endif
- 
- version.c: .version
- 	@(if [ "a$(PFLASH_VERSION)" = "a" ]; then \
--- 
-1.8.3.1
-
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-make.patch b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-make.patch
deleted file mode 100644
index a9d219c..0000000
--- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-make.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 55749b091414e0cf2691bd8f72c4cb48235b51c3 Mon Sep 17 00:00:00 2001
-From: Brad Bishop <bradleyb@fuzziesquirrel.com>
-Date: Mon, 20 Jun 2016 20:31:07 -0400
-Subject: [PATCH] external: Fix ARM build failure with parallel make
-
-Arch headers need to be linked in before compiling.
-
-Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
----
- external/common/rules.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/external/common/rules.mk b/external/common/rules.mk
-index 5558cd3..bb12fd5 100644
---- a/external/common/rules.mk
-+++ b/external/common/rules.mk
-@@ -67,7 +67,7 @@ arch_clean:
- 
- $(ARCH_SRC): | common
- 
--$(ARCH_OBJS): common-%.o: common/%.c
-+$(ARCH_OBJS): common-%.o: common/%.c $(ARCH_LINKS)
- 	$(Q_CC)$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
- 
- common-arch_flash.o: $(ARCH_OBJS)
--- 
-1.8.3.1
-
-- 
2.9.0
