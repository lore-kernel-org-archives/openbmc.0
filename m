Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rddLz6hgPzDqmZ
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 04:51:23 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467053476082163.52920914956212;
 Mon, 27 Jun 2016 11:51:16 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 7/9] libopenbmc_intf rules simplification
Date: Mon, 27 Jun 2016 13:50:52 -0500
Message-Id: <20160627185054.12379-8-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160627185054.12379-1-openbmc-patches@stwcx.xyz>
References: <20160627185054.12379-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 27 Jun 2016 18:51:25 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Don't use rules.mk for libopenbmc_intf.  There isn't enough
overlap here to warrant the extra complexity.

Fix an issue where the library is rebuilt for every make invocation.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 libopenbmc_intf/Makefile | 43 +++++++++++++++++++++++++------------------
 rules.mk                 | 12 +++---------
 2 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/libopenbmc_intf/Makefile b/libopenbmc_intf/Makefile
index f82bce5..cd86906 100644
--- a/libopenbmc_intf/Makefile
+++ b/libopenbmc_intf/Makefile
@@ -1,26 +1,33 @@
+libdir=/usr/lib
+includedir=/usr/include
+
 PACKAGE_DEPS=gio-unix-2.0 glib-2.0
-INSTALLDEPS=install-lib install-headers
-CLEANDEPS=clean-lib
-DEFAULT_ALL=$(LIBOBMC)
-LIBOBMC=openbmc_intf
+SONAME=libopenbmc_intf.so
+VERSION=1
+LIBOBMC=$(SONAME).$(VERSION)
 INCLUDES=openbmc_intf.h openbmc.h gpio.h
 
-$(LIBOBMC): %: %.o gpio.o
-	$(CC) -shared $(CFLAGS) $(LDFLAGS) -Wl,-soname,lib$(LIBOBMC).so \
-		-o lib$@.so.1 $^ $(LDLIBS)
-	ln -sf lib$(LIBOBMC).so.1 lib$(LIBOBMC).so
+LDLIBS+=$(shell pkg-config --libs $(PACKAGE_DEPS))
+ALL_CFLAGS+=$(shell pkg-config --cflags $(PACKAGE_DEPS)) -fPIC -Werror $(CFLAGS)
+
+all: $(SONAME)
+
+%.o: %.c
+	$(CC) -c $(ALL_CFLAGS) -o $@ $<
+
+$(SONAME): $(LIBOBMC)
+	ln -sf $^ $@
 
-install-headers:
+$(LIBOBMC): lib%.so.$(VERSION): %.o gpio.o
+	$(CC) -shared $(CFLAGS) $(LDFLAGS) -Wl,-soname,$(SONAME) \
+		-o $@ $^ $(LDLIBS)
+
+install: $(SONAME) $(LIBOBMC)
 	@mkdir -p $(DESTDIR)$(includedir)
 	install $(INCLUDES) $(DESTDIR)$(includedir)
-
-install-lib:
 	@mkdir -p $(DESTDIR)$(libdir)
-	install lib$(LIBOBMC).so.1 $(DESTDIR)$(libdir)
-	ln -sf lib$(LIBOBMC).so.1 $(DESTDIR)$(libdir)/lib$(LIBOBMC).so
-
-clean-lib:
-	rm -f lib$(LIBOBMC).so.1
-	rm -f lib$(LIBOBMC).so
+	install $(LIBOBMC) $(DESTDIR)$(libdir)
+	ln -sf $(LIBOBMC) $(DESTDIR)$(libdir)/$(SONAME)
 
-include ../rules.mk
+clean:
+	rm -f *.o $(LIBOBMC) $(SONAME)
diff --git a/rules.mk b/rules.mk
index c7075c1..dec78b8 100644
--- a/rules.mk
+++ b/rules.mk
@@ -2,17 +2,13 @@ TOP := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
 
 .DEFAULT_GOAL := all
 sbindir=/usr/sbin
-libdir=/usr/lib
-includedir=/usr/include
 
 LDLIBS+=$(shell pkg-config --libs $(PACKAGE_DEPS))
 ALL_CFLAGS+=$(shell pkg-config --cflags $(PACKAGE_DEPS)) -fPIC -Werror $(CFLAGS)
 
-INSTALLDEPS?=install-bins
 BIN_SUFFIX?=.exe
-DEFAULT_ALL?=$(BINS)
 
-all: $(DEFAULT_ALL)
+all: $(BINS)
 
 %.o: %.c
 	$(CC) -c $(ALL_CFLAGS) -o $@ $<
@@ -20,13 +16,11 @@ all: $(DEFAULT_ALL)
 $(BINS): %: %.o $(EXTRA_OBJS)
 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@$(BIN_SUFFIX) $^ $(LDLIBS)
 
-install-bins: $(BINS)
+install: $(BINS)
 	@mkdir -p $(DESTDIR)$(sbindir)
 	@for b in $(BINS); do \
 		install $$b$(BIN_SUFFIX) $(DESTDIR)$(sbindir) || exit 1; \
 	done
 
-install: all $(INSTALLDEPS)
-
-clean: $(CLEANDEPS)
+clean:
 	rm -rf *.o $(BINS:=$(BIN_SUFFIX))
-- 
2.9.0
