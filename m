Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYwJ54YZwzDqDR
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 03:51:01 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14665314505241022.6712444381913;
 Tue, 21 Jun 2016 10:50:50 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Add pflash parallel build fix patch
Date: Tue, 21 Jun 2016 12:50:46 -0500
Message-Id: <20160621175046.25171-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160621175046.25171-1-openbmc-patches@stwcx.xyz>
References: <20160621175046.25171-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 21 Jun 2016 17:51:02 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This resolves https://github.com/openbmc/openbmc/issues/325

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../common/recipes-bsp/pflash/pflash.bb            |  1 +
 ...-Fix-ARM-build-failure-with-parallel-make.patch | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-make.patch

diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
index 496e900..ec43b4f 100644
--- a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0003-external-Fix-pflash-install-target.patch"
 SRC_URI += "file://0004-external-Remove-m64-from-shared-CFLAGS-on-ARM.patch"
 SRC_URI += "file://0005-external-Create-shared-rules.mk.patch"
 SRC_URI += "file://0006-external-Add-dynamically-linked-pflash.patch"
+SRC_URI += "file://0007-external-Fix-ARM-build-failure-with-parallel-make.patch"
 
 LIC_FILES_CHKSUM = "file://${S}/LICENCE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
diff --git a/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-make.patch b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-make.patch
new file mode 100644
index 0000000..a9d219c
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/common/recipes-bsp/pflash/pflash/0007-external-Fix-ARM-build-failure-with-parallel-make.patch
@@ -0,0 +1,28 @@
+From 55749b091414e0cf2691bd8f72c4cb48235b51c3 Mon Sep 17 00:00:00 2001
+From: Brad Bishop <bradleyb@fuzziesquirrel.com>
+Date: Mon, 20 Jun 2016 20:31:07 -0400
+Subject: [PATCH] external: Fix ARM build failure with parallel make
+
+Arch headers need to be linked in before compiling.
+
+Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
+---
+ external/common/rules.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/external/common/rules.mk b/external/common/rules.mk
+index 5558cd3..bb12fd5 100644
+--- a/external/common/rules.mk
++++ b/external/common/rules.mk
+@@ -67,7 +67,7 @@ arch_clean:
+ 
+ $(ARCH_SRC): | common
+ 
+-$(ARCH_OBJS): common-%.o: common/%.c
++$(ARCH_OBJS): common-%.o: common/%.c $(ARCH_LINKS)
+ 	$(Q_CC)$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@
+ 
+ common-arch_flash.o: $(ARCH_OBJS)
+-- 
+1.8.3.1
+
-- 
2.9.0
