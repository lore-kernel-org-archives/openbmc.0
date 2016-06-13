Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT36B0q5dzDqf3
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 05:40:33 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465846823126784.898328192586;
 Mon, 13 Jun 2016 12:40:23 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH ipmi-fru-parser 3/3] Add shared library versioning
Date: Mon, 13 Jun 2016 14:40:15 -0500
Message-Id: <20160613194015.23561-4-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160613194015.23561-1-openbmc-patches@stwcx.xyz>
References: <20160613194015.23561-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 13 Jun 2016 19:40:35 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Use -soname and install a library symlink.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 Makefile | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 958ac16..937b393 100644
--- a/Makefile
+++ b/Makefile
@@ -1,7 +1,9 @@
 LIBS += libwritefrudata.so
 HOST_LIBS += libstrgfnhandler.so
 libwritefrudata.so_OBJS  += frup.o writefrudata.o
+libwritefrudata.so_VERSION = 1
 libstrgfnhandler.so_OBJS += strgfnhandler.o
+libstrgfnhandler.so_VERSION = 1
 
 EXES += phosphor-read-eeprom
 
@@ -38,7 +40,8 @@ $(foreach exe,$(EXES),$(eval $(call __BUILD_EXE,$(exe))))
 
 define __BUILD_LIB
 $1 : $$($1_OBJS) | $$(addsuffix .so,$$(addprefix lib,$$($1_EXTRA_LIBS)))
-		$$(LINK.cpp) -fPIC -shared -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$(addprefix -l,$($1_EXTRA_LIBS))) -L. $(call __PKG_CONFIG,$($1_NEEDED),--libs)
+		$$(LINK.cpp) -fPIC -shared -Wl,-soname,$$@ -o $$(addsuffix .$($1_VERSION), $$@) $$^ $(call __EXTRA_LIB_RESOLV,$(addprefix -l,$($1_EXTRA_LIBS))) -L. $(call __PKG_CONFIG,$($1_NEEDED),--libs)
+		ln -sf $$(addsuffix .$($1_VERSION), $$@) $1
 
 $(eval CXXFLAGS += $(call __PKG_CONFIG,$($1_NEEDED),--cflags))
 
@@ -51,8 +54,8 @@ $(foreach lib,$(HOST_LIBS),$(eval $(call __BUILD_LIB,$(lib))))
 .PHONY: clean
 clean:
 		$(RM) $(foreach exe,$(EXES),$(exe) $($(exe)_OBJS)) \
-			  $(foreach lib,$(LIBS),$(lib) $($(lib)_OBJS)) \
-			  $(foreach lib,$(HOST_LIBS),$(lib) $($(lib)_OBJS))
+			  $(foreach lib,$(LIBS),$(addsuffix .$($(lib)_VERSION), $(lib)) $(lib) $($(lib)_OBJS)) \
+			  $(foreach lib,$(HOST_LIBS),$(addsuffix .$($(lib)_VERSION), $(lib)) $(lib) $($(lib)_OBJS))
 
 DESTDIR ?= /
 BINDIR ?= /usr/bin
@@ -66,8 +69,10 @@ install:
 		)
 		$(if $(LIBS),\
 		install -m 0755 -d $(DESTDIR)$(LIBDIR)/host-ipmid && \
-		install -m 0755 $(HOST_LIBS) $(DESTDIR)$(LIBDIR)/host-ipmid && \
-		install -m 0755 $(LIBS) $(DESTDIR)$(LIBDIR) \
+		install -m 0755 $(foreach lib,$(HOST_LIBS),$(addsuffix .$($(lib)_VERSION), $(lib))) $(DESTDIR)$(LIBDIR)/host-ipmid && \
+		install -m 0755 $(foreach lib,$(LIBS),$(addsuffix .$($(lib)_VERSION), $(lib))) $(DESTDIR)$(LIBDIR) \
+		$(foreach lib,$(HOST_LIBS), && ln -sf $(addsuffix .$($(lib)_VERSION), $(lib)) $(DESTDIR)$(LIBDIR)/host-ipmid/$(lib)) \
+		$(foreach lib,$(LIBS), && ln -sf $(addsuffix .$($(lib)_VERSION), $(lib)) $(DESTDIR)$(LIBDIR)/$(lib)) \
 		)
 
 .DEFAULT_GOAL: all
-- 
2.8.4
