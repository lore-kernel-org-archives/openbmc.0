Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3DB501A0CFD
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:36 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208950354582.7973587707654;
 Fri, 30 Oct 2015 05:42:30 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v4 8/8] Makefile improvements, clean target
Date: Fri, 30 Oct 2015 07:42:14 -0500
Message-Id: <1446208934-25969-9-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:37 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 54d9964..a55897f 100644
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,9 @@
 CPPFLAGS=$(shell pkg-config --cflags libsystemd)
 LDFLAGS=$(shell pkg-config --libs libsystemd)
 
-all: btbridged
+EXE = btbridged
+
+all: $(EXE)
+
+clean:
+	rm -rf *.o $(EXE)
-- 
2.6.0
