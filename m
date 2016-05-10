Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3jR93ZRMzDqC8
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 12:11:17 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462846273428788.5994157012868;
 Mon, 9 May 2016 19:11:13 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken Lai <ken1029@gmail.com>
Subject: [PATCH skeleton v8 22/22] Fix Makefile issue
Date: Mon,  9 May 2016 21:10:50 -0500
Message-Id: <1462846250-29392-23-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462846250-29392-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462846250-29392-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 May 2016 02:11:18 -0000

From: Ken Lai <ken1029@gmail.com>

---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index e2aac60..eb9fac7 100755
--- a/Makefile
+++ b/Makefile
@@ -9,6 +9,9 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
 INCLUDES += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
 LIB_FLAG += $(shell pkg-config  --libs libsystemd)
 
+INCLUDES_info += $(shell pkg-config --cflags $(DEPPKGS))
+LIBS_info += $(shell pkg-config --libs $(DEPPKGS))
+
 %.o: interfaces/%.c 
 	$(CC) -c -fPIC -o obj/$@ $< $(CFLAGS) $(INCLUDES)
 
-- 
2.8.1
