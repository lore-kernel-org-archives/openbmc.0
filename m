Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 63AA41A0CCA
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 12:36:40 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446255396620952.3335660357558;
 Fri, 30 Oct 2015 18:36:36 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] moved to btbridge version that supports the correct
 seq/net/lun/cmd order fixed makefile.patch because it couldn't auto patch
 with version of btbridge
Date: Fri, 30 Oct 2015 20:36:16 -0500
Message-Id: <1446255376-17351-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446255376-17351-1-git-send-email-patches@stwcx.xyz>
References: <1446255376-17351-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 31 Oct 2015 01:36:40 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 .../common/recipes-phosphor/host-ipmid/btbridged.bb        |  2 +-
 .../recipes-phosphor/host-ipmid/btbridged/makefile.patch   | 14 ++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
index 8572add..27efa3f 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
@@ -11,7 +11,7 @@ inherit obmc-phosphor-host-ipmi-hw
 
 S = "${WORKDIR}/git"
 SRC_URI += "git://github.com/openbmc/btbridge file://makefile.patch"
-SRCREV="5cb9032815aa9d2866229caac4943520d5f40dd8"
+SRCREV="c0ee3595f9a4784c7cf7ee60fd247d9712ec7e6b"
 
 # This is how linux-libc-headers says to include custom uapi headers
 EXTRA_OEMAKE_append = "CFLAGS=-I${STAGING_KERNEL_DIR}/include/uapi"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch
index a2cd522..61123f3 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch
@@ -1,11 +1,13 @@
 diff --git a/Makefile b/Makefile
-index 7f62be2..52e1063 100644
+index a55897f..73206b4 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -2,3 +2,6 @@ all: btbridged
+@@ -5,5 +5,8 @@ EXE = btbridged
  
- btbridged: btbridged.c
- 	$(CC) $(CFLAGS) `pkg-config --cflags --libs libsystemd` $^ -o $@
+ all: $(EXE)
+ 
++btbridged: btbridged.c
++	$(CC) $(CFLAGS) `pkg-config --cflags --libs libsystemd` $^ -o $@
 +
-+clean:
-+	rm -f *.o btbridge
+ clean:
+ 	rm -rf *.o $(EXE)
-- 
2.6.0
