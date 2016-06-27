Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rddM46MBqzDqmK
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 04:51:28 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467053478724812.6488379816759;
 Mon, 27 Jun 2016 11:51:18 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 9/9] Conditionally use system provided libopenbmc_intf
Date: Mon, 27 Jun 2016 13:50:54 -0500
Message-Id: <20160627185054.12379-10-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 27 Jun 2016 18:51:30 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This patch structures the make rules such that building from the top
will build the in-tree libopenbmc_intf and link to that.  For example:
 $make
 $make bmcctl
would both result in ../libopenbmc_intf being built and the applications
will link to that.

Alternatively when building applications directly like:
 $make -C bmcctl
the default compiler/linker search paths will be used.

The latter facilitates package managers and the former retains a level
of flexibility for developers working from the repository.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 Makefile | 12 ++++++------
 gdbus.mk |  8 +-------
 rules.mk |  2 --
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index 9bbd042..b79675d 100644
--- a/Makefile
+++ b/Makefile
@@ -9,8 +9,7 @@ GDBUS_APPS = bmcctl \
 	     pwrbutton \
 	     rstbutton
 
-SUBDIRS = $(GDBUS_APPS) \
-	  hacks \
+SUBDIRS = hacks \
 	  ledctl \
 	  libopenbmc_intf \
 	  pychassisctl \
@@ -25,19 +24,20 @@ SUBDIRS = $(GDBUS_APPS) \
 	  pysystemmgr \
 	  pytools
 
-REVERSE_SUBDIRS = $(shell echo $(SUBDIRS) | tr ' ' '\n' | tac |tr '\n' ' ')
+REVERSE_SUBDIRS = $(shell echo $(SUBDIRS) $(GDBUS_APPS) | tr ' ' '\n' | tac |tr '\n' ' ')
 
-.PHONY: subdirs $(SUBDIRS)
+.PHONY: subdirs $(SUBDIRS) $(GDBUS_APPS)
 
-subdirs: $(SUBDIRS)
+subdirs: $(SUBDIRS) $(GDBUS_APPS)
 
 $(SUBDIRS):
 	$(MAKE) -C $@
 
 $(GDBUS_APPS): libopenbmc_intf
+	$(MAKE) -C $@ CFLAGS="-I ../$^" LDFLAGS="-L ../$^"
 
 install: subdirs
-	@for d in $(SUBDIRS); do \
+	@for d in $(SUBDIRS) $(GDBUS_APPS); do \
 		$(MAKE) -C $$d $@ DESTDIR=$(DESTDIR) PREFIX=$(PREFIX) || exit 1; \
 	done
 clean:
diff --git a/gdbus.mk b/gdbus.mk
index 250e2cf..220a650 100644
--- a/gdbus.mk
+++ b/gdbus.mk
@@ -1,11 +1,5 @@
 PACKAGE_DEPS=gio-unix-2.0 glib-2.0
-ALL_CFLAGS+=-I ../libopenbmc_intf
-
-LIBOBMC=$(TOP)/libopenbmc_intf/libopenbmc_intf.so.1
-EXTRA_OBJS+=$(LIBOBMC)
-
-$(LIBOBMC):
-	$(MAKE) -C $(TOP)/libopenbmc_intf
+LDLIBS=-lopenbmc_intf
 
 %.o: %_obj.c
 	$(CC) -c $(ALL_CFLAGS) -o $@ $<
diff --git a/rules.mk b/rules.mk
index fcb7b44..d5d1625 100644
--- a/rules.mk
+++ b/rules.mk
@@ -1,5 +1,3 @@
-TOP := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
-
 .DEFAULT_GOAL := all
 sbindir=/usr/sbin
 
-- 
2.9.0
