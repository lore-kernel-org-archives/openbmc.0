Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3pK40jmpzDqBt
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 15:51:19 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462859475996395.202509683215;
 Mon, 9 May 2016 22:51:15 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken Lai <ken1029@gmail.com>
Subject: [PATCH skeleton v9 23/23] Fix Makefile
Date: Tue, 10 May 2016 00:50:49 -0500
Message-Id: <1462859449-5466-24-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462859449-5466-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462859449-5466-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 10 May 2016 05:51:20 -0000

From: Ken Lai <ken1029@gmail.com>

---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index eb9fac7..db05f88 100755
--- a/Makefile
+++ b/Makefile
@@ -9,6 +9,7 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
 INCLUDES += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
 LIB_FLAG += $(shell pkg-config  --libs libsystemd)
 
+DEPPKGS = libsystemd
 INCLUDES_info += $(shell pkg-config --cflags $(DEPPKGS))
 LIBS_info += $(shell pkg-config --libs $(DEPPKGS))
 
-- 
2.8.1
