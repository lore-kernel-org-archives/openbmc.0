Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 63AFB1A0D04
 for <openbmc@lists.ozlabs.org>; Sat,  7 Nov 2015 14:58:41 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446867642945511.5986786986523;
 Fri, 6 Nov 2015 19:40:42 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Enable robottest for ssh
Date: Fri,  6 Nov 2015 21:40:30 -0600
Message-Id: <1446867630-18102-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446867630-18102-1-git-send-email-patches@stwcx.xyz>
References: <1446867630-18102-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 07 Nov 2015 03:58:42 -0000

From: Chris Austen <austenc@us.ibm.com>

Dropbear last year added a change that breaks the SSHLibrary for
robot test framework.

Details about the problem...
https://github.com/robotframework/SSHLibrary/issues/128

The actual commit that caused the problem
https://github.com/mkj/dropbear/commit/ca86726f9f943b2b18e5694b442d3d2e1c0fa903
---
 yocto-poky/meta/recipes-core/dropbear/dropbear.inc |  1 +
 ...0-stop-robot-test-SSHLibrary-from-hanging.patch | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 yocto-poky/meta/recipes-core/dropbear/dropbear/0010-stop-robot-test-SSHLibrary-from-hanging.patch

diff --git a/yocto-poky/meta/recipes-core/dropbear/dropbear.inc b/yocto-poky/meta/recipes-core/dropbear/dropbear.inc
index a2c736e..9d65020 100644
--- a/yocto-poky/meta/recipes-core/dropbear/dropbear.inc
+++ b/yocto-poky/meta/recipes-core/dropbear/dropbear.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0003-configure.patch \
            file://0004-fix-2kb-keys.patch \
            file://0007-dropbear-fix-for-x32-abi.patch \
+           file://0010-stop-robot-test-SSHLibrary-from-hanging.patch \
            file://init \
            file://dropbearkey.service \
            file://dropbear@.service \
diff --git a/yocto-poky/meta/recipes-core/dropbear/dropbear/0010-stop-robot-test-SSHLibrary-from-hanging.patch b/yocto-poky/meta/recipes-core/dropbear/dropbear/0010-stop-robot-test-SSHLibrary-from-hanging.patch
new file mode 100644
index 0000000..851c89f
--- /dev/null
+++ b/yocto-poky/meta/recipes-core/dropbear/dropbear/0010-stop-robot-test-SSHLibrary-from-hanging.patch
@@ -0,0 +1,28 @@
+From aa4ff477eed539085609dc9a8a011ff2f010bd1c Mon Sep 17 00:00:00 2001
+From: Chris Austen <austenc@us.ibm.com>
+Date: Fri, 6 Nov 2015 13:15:54 -0600
+Subject: [PATCH] stop robot test SSHLibrary from hanging
+
+This reverts a change made in this commit
+
+https://github.com/mkj/dropbear/commit/ca86726f9f943b2b18e5694b442d3d2e1c0fa903
+---
+ common-channel.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/common-channel.c b/common-channel.c
+index abe5941..5a02d73 100644
+--- a/common-channel.c
++++ b/common-channel.c
+@@ -258,6 +258,8 @@ void channelio(fd_set *readfds, fd_set *writefds) {
+ 			do_check_close = 1;
+ 			ses.channel_signal_pending = 0;
+ 		}
++
++do_check_close = 1;
+ 	
+ 		/* handle any channel closing etc */
+ 		if (do_check_close) {
+-- 
+1.9.1
+
-- 
2.6.0
