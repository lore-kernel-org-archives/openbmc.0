Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rddLd237NzDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 04:51:05 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467053457515790.5573878007342;
 Mon, 27 Jun 2016 11:50:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH skeleton 1/9] Add install-headers target
Date: Mon, 27 Jun 2016 13:50:46 -0500
Message-Id: <20160627185054.12379-2-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 27 Jun 2016 18:51:06 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Install the libopenbmc_intf includes in prep for a devel
package.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 libopenbmc_intf/Makefile | 7 ++++++-
 rules.mk                 | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/libopenbmc_intf/Makefile b/libopenbmc_intf/Makefile
index 8853318..54bef57 100644
--- a/libopenbmc_intf/Makefile
+++ b/libopenbmc_intf/Makefile
@@ -1,14 +1,19 @@
 PACKAGE_DEPS=gio-unix-2.0 glib-2.0
-INSTALLDEPS=install-lib
+INSTALLDEPS=install-lib install-headers
 CLEANDEPS=clean-lib
 DEFAULT_ALL=$(LIBOBMC)
 ALL_CFLAGS+=-iquote ../gdbus
 LIBOBMC=openbmc_intf
+INCLUDES=openbmc_intf.h openbmc.h gpio.h
 
 $(LIBOBMC): %: %.o gpio.o
 	$(CC) -shared $(CFLAGS) $(LDFLAGS) -Wl,-soname,lib$(LIBOBMC).so \
 		-o lib$@.so.1 $^ $(LDLIBS)
 
+install-headers:
+	@mkdir -p $(DESTDIR)$(includedir)
+	install $(INCLUDES) $(DESTDIR)$(includedir)
+
 install-lib:
 	@mkdir -p $(DESTDIR)$(libdir)
 	install lib$(LIBOBMC).so.1 $(DESTDIR)$(libdir)
diff --git a/rules.mk b/rules.mk
index fb6c000..c7075c1 100644
--- a/rules.mk
+++ b/rules.mk
@@ -3,6 +3,7 @@ TOP := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
 .DEFAULT_GOAL := all
 sbindir=/usr/sbin
 libdir=/usr/lib
+includedir=/usr/include
 
 LDLIBS+=$(shell pkg-config --libs $(PACKAGE_DEPS))
 ALL_CFLAGS+=$(shell pkg-config --cflags $(PACKAGE_DEPS)) -fPIC -Werror $(CFLAGS)
-- 
2.9.0
