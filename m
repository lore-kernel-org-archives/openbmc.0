Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 14C7E1A08F5
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:52:25 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445482343437982.5312244572068;
 Wed, 21 Oct 2015 19:52:23 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openpower-host-ipmi-oem 6/8] Clean up Makefile
Date: Wed, 21 Oct 2015 21:52:11 -0500
Message-Id: <1445482333-2053-7-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445482333-2053-1-git-send-email-patches@stwcx.xyz>
References: <1445482333-2053-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:52:26 -0000

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
