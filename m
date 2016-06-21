Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYwlR25sCzDqCX
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 04:11:14 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466532665341101.63557593736743;
 Tue, 21 Jun 2016 11:11:05 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton] Enable user-overriable CFLAGS
Date: Tue, 21 Jun 2016 13:11:01 -0500
Message-Id: <20160621181101.26402-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160621181101.26402-1-openbmc-patches@stwcx.xyz>
References: <20160621181101.26402-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 18:11:16 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Put required CFLAGS (ie pkg-config --cflags) in ALL_CFLAGS and append
user specified CFLAGS to that.

Use CFLAGS during link.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 gdbus.mk                 | 4 ++--
 libopenbmc_intf/Makefile | 4 ++--
 op-flasher/Makefile      | 6 +++---
 rules.mk                 | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/gdbus.mk b/gdbus.mk
index dcbf6c9..4b320cb 100644
--- a/gdbus.mk
+++ b/gdbus.mk
@@ -1,5 +1,5 @@
 PACKAGE_DEPS=gio-unix-2.0 glib-2.0
-CFLAGS+=-iquote ../gdbus -iquote ../libopenbmc_intf
+ALL_CFLAGS+=-iquote ../gdbus -iquote ../libopenbmc_intf
 
 LIBOBMC=$(TOP)/libopenbmc_intf/libopenbmc_intf.so.1
 EXTRA_OBJS+=$(LIBOBMC)
@@ -8,4 +8,4 @@ $(LIBOBMC):
 	$(MAKE) -C $(TOP)/libopenbmc_intf
 
 %.o: %_obj.c
-	$(CC) -c $(CFLAGS) -fPIC -o $@ $<
+	$(CC) -c $(ALL_CFLAGS) -o $@ $<
diff --git a/libopenbmc_intf/Makefile b/libopenbmc_intf/Makefile
index 9cd7be6..8853318 100644
--- a/libopenbmc_intf/Makefile
+++ b/libopenbmc_intf/Makefile
@@ -2,11 +2,11 @@ PACKAGE_DEPS=gio-unix-2.0 glib-2.0
 INSTALLDEPS=install-lib
 CLEANDEPS=clean-lib
 DEFAULT_ALL=$(LIBOBMC)
-CFLAGS+=-iquote ../gdbus
+ALL_CFLAGS+=-iquote ../gdbus
 LIBOBMC=openbmc_intf
 
 $(LIBOBMC): %: %.o gpio.o
-	$(CC) -shared $(LDFLAGS) -Wl,-soname,lib$(LIBOBMC).so \
+	$(CC) -shared $(CFLAGS) $(LDFLAGS) -Wl,-soname,lib$(LIBOBMC).so \
 		-o lib$@.so.1 $^ $(LDLIBS)
 
 install-lib:
diff --git a/op-flasher/Makefile b/op-flasher/Makefile
index 80b9ccb..6876ad0 100644
--- a/op-flasher/Makefile
+++ b/op-flasher/Makefile
@@ -4,11 +4,11 @@ EXTRA_OBJS+=progress.o \
 	    libflash.o \
 	    libffs.o \
 	    arm_io.o
-CFLAGS+=-Ipflash
+ALL_CFLAGS+=-Ipflash
 include ../gdbus.mk
 include ../rules.mk
 
 %.o: pflash/%.c
-	$(CC) -c -o $(CFLAGS) -fPIC -o $@ $<
+	$(CC) -c $(ALL_CFLAGS) -o $@ $<
 %.o: pflash/libflash/%.c
-	$(CC) -c -o $(CFLAGS) -fPIC -o $@ $<
+	$(CC) -c $(ALL_CFLAGS) -o $@ $<
diff --git a/rules.mk b/rules.mk
index 9cad8cf..758e9f2 100644
--- a/rules.mk
+++ b/rules.mk
@@ -5,7 +5,7 @@ sbindir=/usr/sbin
 libdir=/usr/lib
 
 LDLIBS+=$(shell pkg-config --libs $(PACKAGE_DEPS))
-CFLAGS+=$(shell pkg-config --cflags $(PACKAGE_DEPS)) -Werror
+ALL_CFLAGS+=$(shell pkg-config --cflags $(PACKAGE_DEPS)) -fPIC -Werror $(CFLAGS)
 
 INSTALLDEPS?=install-bins
 BIN_SUFFIX?=.exe
@@ -14,10 +14,10 @@ DEFAULT_ALL?=$(BINS)
 all: $(DEFAULT_ALL)
 
 %.o: %.c
-	$(CC) -c $(CFLAGS) -fPIC -o $@ $<
+	$(CC) -c $(ALL_CFLAGS) -o $@ $<
 
 $(BINS): %: %.o $(EXTRA_OBJS)
-	$(CC) $(LDFLAGS) -o $@$(BIN_SUFFIX) $^ $(LDLIBS)
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@$(BIN_SUFFIX) $^ $(LDLIBS)
 
 install-bins:
 	@mkdir -p $(DESTDIR)$(sbindir)
-- 
2.9.0
