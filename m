Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EC8251A0CD1
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:25 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208939791570.8477949160149;
 Fri, 30 Oct 2015 05:42:19 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v4 2/8] Use builtin make rules
Date: Fri, 30 Oct 2015 07:42:08 -0500
Message-Id: <1446208934-25969-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446208934-25969-1-git-send-email-patches@stwcx.xyz>
References: <1446208934-25969-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:26 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 7f62be2..54d9964 100644
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,4 @@
-all: btbridged
+CPPFLAGS=$(shell pkg-config --cflags libsystemd)
+LDFLAGS=$(shell pkg-config --libs libsystemd)
 
-btbridged: btbridged.c
-	$(CC) $(CFLAGS) `pkg-config --cflags --libs libsystemd` $^ -o $@
+all: btbridged
-- 
2.6.0
