Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0D4AB1A0912
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2015 07:29:56 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445027393271916.3137299501641;
 Fri, 16 Oct 2015 13:29:53 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem v3 6/7] Clean up Makefile
Date: Fri, 16 Oct 2015 15:29:40 -0500
Message-Id: <1445027381-30153-7-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445027381-30153-1-git-send-email-patches@stwcx.xyz>
References: <1445027381-30153-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 16 Oct 2015 20:29:57 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index e2ed670..2dbcc46 100644
--- a/Makefile
+++ b/Makefile
@@ -6,22 +6,22 @@ TESTER_OBJ  = testit.o oemhandler.o
 LIB_OEM_OBJ = oemhandler.o
 LIB_OEM     = liboemhandler.so
 
-LDFLAGS += -rdynamic
+LDFLAGS += -rdynamic -ldl
 CXXFLAGS += -fpic -Wall
 
 
 all:  $(TESTER) $(LIB_OEM)
 
 %.o: %.C
-	$(CXX) -fpic -c $< $(CXXFLAGS) -o $@
+	$(CXX) -c $< $(CXXFLAGS) -o $@
 	
 
 $(LIB_OEM): $(LIB_OEM_OBJ)
-	$(CXX) $^ -shared $(LDFLAGS) $(LIB_FLAG) -o $@
+	$(CXX) $^ -shared $(LDFLAGS) -o $@
 
 
 $(TESTER): $(TESTER_OBJ)
-	$(CXX) $^ $(LDFLAGS) $(LIB_FLAG) -o $@ -ldl
+	$(CXX) $^ $(LDFLAGS) -o $@ -ldl
 
 clean:
 	$(RM) $(LIB_OEM_OBJ) $(LIB_OEM) $(TESTER_OBJ) $(TESTER)
-- 
2.6.0
