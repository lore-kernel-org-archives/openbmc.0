Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8KWG4L3LzDqBK
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 00:30:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463495438540232.9392468903859;
 Tue, 17 May 2016 07:30:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Add pflash to SDK
Date: Tue, 17 May 2016 09:30:36 -0500
Message-Id: <1463495436-27711-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463495436-27711-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463495436-27711-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 May 2016 14:30:52 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Make use of the skiboot external/shared support for dynamic so/bin.
This allows us to completely remove pflash from skeleton.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-bsp/pflash/pflash.bb            |   8 +-
 .../pflash/pflash/0001-pflash-Build-solib.patch    | 119 +++++++++++++++++++++
 .../common/recipes-phosphor/skeleton/skeleton.bb   |   7 +-
 3 files changed, 127 insertions(+), 7 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Build-solib.patch

diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
index 5c0cfa4..862f4fb 100644
--- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
@@ -8,15 +8,19 @@ LIC_FILES_CHKSUM = "file://${S}/LICENCE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "skiboot-5.2.1"
 PV = "5.2.1"
+SRC_URI += "file://0001-pflash-Build-solib.patch"
 
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} PFLASH_VERSION=${PV} V=1'
+CFLAGS_append = ' -fPIC'
 
 do_compile () {
-        oe_runmake -C external/pflash all
+        oe_runmake -C external/shared all
 }
 
 do_install () {
-        oe_runmake -C external/pflash install DESTDIR=${D}
+        oe_runmake -C external/shared install DESTDIR=${D}
 }
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Build-solib.patch b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Build-solib.patch
new file mode 100644
index 0000000..59f2ebc
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0001-pflash-Build-solib.patch
@@ -0,0 +1,119 @@
+diff --git a/external/pflash/rules.mk b/external/pflash/rules.mk
+index aa426b5..c0199e3 100644
+--- a/external/pflash/rules.mk
++++ b/external/pflash/rules.mk
+@@ -1,12 +1,12 @@
+ .DEFAULT_GOAL := all
+ 
+ override CFLAGS  += -O2 -Wall -I.
+-OBJS    = pflash.o progress.o version.o
++PFLASH_OBJS    = pflash.o progress.o version.o common-arch_flash.o
+ LIBFLASH_FILES := libflash.c libffs.c ecc.c blocklevel.c file.c
+ LIBFLASH_OBJS := $(addprefix libflash-, $(LIBFLASH_FILES:.c=.o))
+ LIBFLASH_SRC := $(addprefix libflash/,$(LIBFLASH_FILES))
++OBJS	+= $(PFLASH_OBJS)
+ OBJS	+= $(LIBFLASH_OBJS)
+-OBJS	+= common-arch_flash.o
+ EXE     = pflash
+ 
+ PFLASH_VERSION ?= $(shell ../../make_version.sh $(EXE))
+diff --git a/external/shared/.gitignore b/external/shared/.gitignore
+new file mode 100644
+index 0000000..541d2a2
+--- /dev/null
++++ b/external/shared/.gitignore
+@@ -0,0 +1,2 @@
++pflash-dynamic
++libflash.so*
+diff --git a/external/shared/Makefile b/external/shared/Makefile
+index 4c31657..aa1d881 100644
+--- a/external/shared/Makefile
++++ b/external/shared/Makefile
+@@ -1,56 +1,44 @@
+-.DEFAULT_GOAL := all
+ GET_ARCH = ../../external/common/get_arch.sh
++include ../../external/pflash/rules.mk
+ include ../../external/common/rules.mk
+ 
+-PREFIX ?= /usr/local/
+-LIBDIR = $(PREFIX)/lib
+-INCDIR = $(PREFIX)/include/libflash
++libdir=/usr/lib
++incdir=/usr/include
++sbindir=/usr/sbin
+ 
+-VERSION = $(shell ../../make_version.sh)
++PFLASH_DIR=../pflash/
++EXE=pflash-dynamic
++LIB=libflash.so
++SONAME=$(LIB).1
++VERSION = $(shell ../../make_version.sh "$(SONAME)")
++OBJS=$(addprefix $(PFLASH_DIR), $(LIBFLASH_OBJS))
++OBJS+=$(addprefix $(PFLASH_DIR), $(ARCH_OBJS))
++DYN_OBJS=$(addprefix $(PFLASH_DIR), $(PFLASH_OBJS))
+ 
+-CFLAGS += -m64 -Werror -Wall -g2 -ggdb -I. -fPIC
++LIBFLASH_HEADERS=libffs.h libflash.h blocklevel.h errors.h ffs.h
++ARCHFLASH_HEADERS=arch_flash.h io.h
+ 
+-.PHONY: links
+-links: libflash ccan common
++all: $(EXE)
+ 
+-libflash:
+-	ln -sf ../../libflash .
++$(LIB):
++	$(MAKE) -C $(PFLASH_DIR)
++	$(Q_CC)$(CC) -shared -fPIC -Wl,-soname,$(SONAME) $(OBJS) -o $(VERSION)
+ 
+-common:
+-	ln -sf ../common .
++$(EXE): $(LIB)
++	$(Q_CC)$(CC) $(CFLAGS) $(DYN_OBJS) $(VERSION) -lrt -o $(EXE)
+ 
+-ccan:
+-	ln -sf ../../ccan .
++install: install-bins install-headers
+ 
+-LIBFLASH_OBJS = libflash-file.o libflash-libflash.o libflash-libffs.o libflash-ecc.o libflash-blocklevel.o
+-ARCHFLASH_OBJS = common-arch_flash.o
+-OBJS = $(LIBFLASH_OBJS) $(ARCHFLASH_OBJS)
++install-headers:
++	$(Q_MKDIR)mkdir -p $(DESTDIR)$(incdir)/libflash $(DESTDIR)$(incdir)/common
++	install -m644 $(addprefix $(PFLASH_DIR)libflash/, $(LIBFLASH_HEADERS)) $(DESTDIR)$(incdir)/libflash
++	install -m644 $(addprefix $(PFLASH_DIR)common/, $(ARCHFLASH_HEADERS)) $(DESTDIR)$(incdir)/common
+ 
+-LIBFLASH_H = libflash/file.h libflash/libflash.h libflash/libffs.h libflash/ffs.h libflash/ecc.h libflash/blocklevel.h libflash/errors.h
+-ARCHFLASH_H = common/arch_flash.h
+-
+-$(LIBFLASH_OBJS) : libflash-%.o : libflash/%.c
+-	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
++install-bins: all
++	install -D $(EXE) $(DESTDIR)$(sbindir)/pflash
++	install -D $(VERSION) $(DESTDIR)$(libdir)/$(VERSION)
++	$(Q_LN)ln -sf $(VERSION) $(DESTDIR)$(libdir)/$(SONAME)
++	$(Q_LN)ln -sf $(VERSION) $(DESTDIR)$(libdir)/$(LIB)
+ 
+ clean:
+-	rm -f $(OBJS) common-*.o *.so*
+-
+-distclean: clean
+-	rm -f ccan libflash common
+-
+-all: links arch_links $(OBJS)
+-	$(CC) -shared -Wl,-soname,libflash.so -o libflash.so.$(VERSION) $(OBJS)
+-
+-install-lib: all
+-	install -D -m 0755 libflash.so.$(VERSION) $(LIBDIR)/libflash.so.$(VERSION)
+-	ln -sf libflash.so.$(VERSION) $(LIBDIR)/libflash.so
+-
+-install-dev: links arch_links
+-	mkdir -p $(INCDIR)
+-	install -m 0644 $(LIBFLASH_H) $(ARCHFLASH_H) $(INCDIR)
+-
+-install: install-lib install-dev
+-
+-uninstall:
+-	rm -f $(LIBDIR)/libflash*
+-	rm -rf $(INCDIR)
++	rm -rf $(LIB).* $(EXE)
diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
index 1553314..8a11ee1 100644
--- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
+++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
@@ -16,9 +16,9 @@ DEPENDS += "glib-2.0 systemd"
 RDEPENDS_${PN} += "python-subprocess python-compression libsystemd"
 SRC_URI += "git://github.com/openbmc/skeleton"
 
-# RDEPEND on pflash if the openpower-pflash machine feature is set.
+# DEPEND/RDEPEND on pflash if the openpower-pflash machine feature is set.
 PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
-PACKAGECONFIG[openpower-pflash] = ",,,pflash"
+PACKAGECONFIG[openpower-pflash] = ",,pflash,pflash"
 
 SRCREV = "264009617c231447d6c8fc61264cf3c6ea7f49d5"
 
@@ -26,9 +26,6 @@ S = "${WORKDIR}"
 
 do_compile() {
         oe_runmake -C git
-
-        # Remove deprecated files.
-        rm ${S}/git/bin/pflash
 }
 
 do_install() {
-- 
2.8.2
