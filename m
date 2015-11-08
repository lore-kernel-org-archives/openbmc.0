Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 126FE1A0C23
 for <openbmc@lists.ozlabs.org>; Sun,  8 Nov 2015 14:59:19 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1446955153044783.5002491688782;
 Sat, 7 Nov 2015 19:59:13 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH ipmi-fru-parser 06/11] Removing depency in Makefile on the
 systemd library.
Date: Sat,  7 Nov 2015 22:59:03 -0500
Message-Id: <1446955148-30303-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1446955148-30303-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1446955148-30303-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 08 Nov 2015 03:59:20 -0000

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
2.6.3
