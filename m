Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4LxZ2lg8zDqGD
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 13:21:22 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462936878640394.2948915053423;
 Tue, 10 May 2016 20:21:18 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Ken Lai <ken1029@gmail.com>
Subject: [PATCH skeleton v10 22/22] Fix Makefile issue
Date: Tue, 10 May 2016 22:20:52 -0500
Message-Id: <1462936852-25327-23-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462936852-25327-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462936852-25327-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 May 2016 03:21:22 -0000

From: Ken Lai <ken1029@gmail.com>

---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index e2aac60..db05f88 100755
--- a/Makefile
+++ b/Makefile
@@ -9,6 +9,10 @@ LIBS=$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_intf
 INCLUDES += $(shell pkg-config --cflags --libs libsystemd) -I. -O2
 LIB_FLAG += $(shell pkg-config  --libs libsystemd)
 
+DEPPKGS = libsystemd
+INCLUDES_info += $(shell pkg-config --cflags $(DEPPKGS))
+LIBS_info += $(shell pkg-config --libs $(DEPPKGS))
+
 %.o: interfaces/%.c 
 	$(CC) -c -fPIC -o obj/$@ $< $(CFLAGS) $(INCLUDES)
 
-- 
2.8.1
