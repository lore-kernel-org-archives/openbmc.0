Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT3672FYGzDqdh
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 05:40:31 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465846821275193.99729710251347;
 Mon, 13 Jun 2016 12:40:21 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH ipmi-fru-parser 2/3] Makefile whitespace fixes
Date: Mon, 13 Jun 2016 14:40:14 -0500
Message-Id: <20160613194015.23561-3-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 13 Jun 2016 19:40:32 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

A couple spaces at the end of line.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index dc66a77..958ac16 100644
--- a/Makefile
+++ b/Makefile
@@ -1,5 +1,5 @@
-LIBS += libwritefrudata.so 
-HOST_LIBS += libstrgfnhandler.so 
+LIBS += libwritefrudata.so
+HOST_LIBS += libstrgfnhandler.so
 libwritefrudata.so_OBJS  += frup.o writefrudata.o
 libstrgfnhandler.so_OBJS += strgfnhandler.o
 
@@ -26,8 +26,8 @@ __PKG_CONFIG = $(if $1,$(shell pkg-config $2 $1))
 __EXTRA_LIB_RESOLV = $(if $1,$1)
 
 define __BUILD_EXE
-$1 : $$($1_OBJS) | $$(LIBS) $$(HOST_LIBS) 
-		$$(LINK.cpp) -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$(addprefix -l,$($1_EXTRA_LIBS))) -L. $(call __PKG_CONFIG,$($1_NEEDED),--libs) 
+$1 : $$($1_OBJS) | $$(LIBS) $$(HOST_LIBS)
+		$$(LINK.cpp) -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$(addprefix -l,$($1_EXTRA_LIBS))) -L. $(call __PKG_CONFIG,$($1_NEEDED),--libs)
 
 $(eval CXXFLAGS += $(call __PKG_CONFIG,$($1_NEEDED),--cflags))
 
@@ -38,7 +38,7 @@ $(foreach exe,$(EXES),$(eval $(call __BUILD_EXE,$(exe))))
 
 define __BUILD_LIB
 $1 : $$($1_OBJS) | $$(addsuffix .so,$$(addprefix lib,$$($1_EXTRA_LIBS)))
-		$$(LINK.cpp) -fPIC -shared -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$(addprefix -l,$($1_EXTRA_LIBS))) -L. $(call __PKG_CONFIG,$($1_NEEDED),--libs) 
+		$$(LINK.cpp) -fPIC -shared -o $$@ $$^ $(call __EXTRA_LIB_RESOLV,$(addprefix -l,$($1_EXTRA_LIBS))) -L. $(call __PKG_CONFIG,$($1_NEEDED),--libs)
 
 $(eval CXXFLAGS += $(call __PKG_CONFIG,$($1_NEEDED),--cflags))
 
-- 
2.8.4
