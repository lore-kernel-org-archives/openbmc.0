Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 299491A0A6A
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 08:31:19 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445549458184183.88625766010773;
 Thu, 22 Oct 2015 14:30:58 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser v5 6/7] Removing depency in Makefile on the
 systemd library.
Date: Thu, 22 Oct 2015 16:30:46 -0500
Message-Id: <1445549447-2577-7-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445549447-2577-1-git-send-email-patches@stwcx.xyz>
References: <1445549447-2577-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 21:31:19 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index cf75af3..bcb3648 100644
--- a/Makefile
+++ b/Makefile
@@ -4,7 +4,8 @@ IPMI_FRU_PARSER_LIB = libifp.so
 IPMI_FRU_PARSER_OBJS = frup.o
 
 INC_FLAGS += $(shell pkg-config --cflags --libs libsystemd) -I. -O2 --std=gnu++11
-LIB_FLAGS += $(shell pkg-config  --libs libsystemd) -rdynamic
+#LIB_FLAGS += $(shell pkg-config  --libs libsystemd) -rdynamic
+LIB_FLAGS += -rdynamic
 #IPMID_PATH ?= -DHOST_IPMI_LIB_PATH=\"/usr/lib/host-ipmid/\" 
 
 all: $(IPMI_FRU_PARSER_LIB)
-- 
2.6.0
