Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E2DCA1A0244
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2016 06:30:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452627026374460.0600042943653;
 Tue, 12 Jan 2016 11:30:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Upgrade to Dropbear 71
Date: Tue, 12 Jan 2016 13:30:24 -0600
Message-Id: <1452627024-28414-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452627024-28414-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452627024-28414-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 12 Jan 2016 19:30:31 -0000

From: Chris Austen <austenc@us.ibm.com>

The issue I asked to be fixed is in the new version of dropbear.
The problem was causing robot test code from running remote
commands like ipmitool.  I had to work around the issue building
my own private 'requests' robot code.  Now that it is fixed
you do not need any special code for Robot test automation
Additional details can be found here...
https://github.com/robotframework/SSHLibrary/issues/128
---
 yocto-poky/meta/recipes-core/dropbear/dropbear.inc |  1 -
 ...0-stop-robot-test-SSHLibrary-from-hanging.patch | 28 ----------------------
 .../meta/recipes-core/dropbear/dropbear_2015.68.bb |  4 ----
 .../meta/recipes-core/dropbear/dropbear_2015.71.bb |  4 ++++
 4 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 yocto-poky/meta/recipes-core/dropbear/dropbear/0010-stop-robot-test-SSHLibrary-from-hanging.patch
 delete mode 100644 yocto-poky/meta/recipes-core/dropbear/dropbear_2015.68.bb
 create mode 100644 yocto-poky/meta/recipes-core/dropbear/dropbear_2015.71.bb

diff --git a/yocto-poky/meta/recipes-core/dropbear/dropbear.inc b/yocto-poky/meta/recipes-core/dropbear/dropbear.inc
index 9d65020..a2c736e 100644
--- a/yocto-poky/meta/recipes-core/dropbear/dropbear.inc
+++ b/yocto-poky/meta/recipes-core/dropbear/dropbear.inc
@@ -17,7 +17,6 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0003-configure.patch \
            file://0004-fix-2kb-keys.patch \
            file://0007-dropbear-fix-for-x32-abi.patch \
-           file://0010-stop-robot-test-SSHLibrary-from-hanging.patch \
            file://init \
            file://dropbearkey.service \
            file://dropbear@.service \
diff --git a/yocto-poky/meta/recipes-core/dropbear/dropbear/0010-stop-robot-test-SSHLibrary-from-hanging.patch b/yocto-poky/meta/recipes-core/dropbear/dropbear/0010-stop-robot-test-SSHLibrary-from-hanging.patch
deleted file mode 100644
index 851c89f..0000000
--- a/yocto-poky/meta/recipes-core/dropbear/dropbear/0010-stop-robot-test-SSHLibrary-from-hanging.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From aa4ff477eed539085609dc9a8a011ff2f010bd1c Mon Sep 17 00:00:00 2001
-From: Chris Austen <austenc@us.ibm.com>
-Date: Fri, 6 Nov 2015 13:15:54 -0600
-Subject: [PATCH] stop robot test SSHLibrary from hanging
-
-This reverts a change made in this commit
-
-https://github.com/mkj/dropbear/commit/ca86726f9f943b2b18e5694b442d3d2e1c0fa903
----
- common-channel.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/common-channel.c b/common-channel.c
-index abe5941..5a02d73 100644
---- a/common-channel.c
-+++ b/common-channel.c
-@@ -258,6 +258,8 @@ void channelio(fd_set *readfds, fd_set *writefds) {
- 			do_check_close = 1;
- 			ses.channel_signal_pending = 0;
- 		}
-+
-+do_check_close = 1;
- 	
- 		/* handle any channel closing etc */
- 		if (do_check_close) {
--- 
-1.9.1
-
diff --git a/yocto-poky/meta/recipes-core/dropbear/dropbear_2015.68.bb b/yocto-poky/meta/recipes-core/dropbear/dropbear_2015.68.bb
deleted file mode 100644
index 1b749d7..0000000
--- a/yocto-poky/meta/recipes-core/dropbear/dropbear_2015.68.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "7664ac10f7cc2301c530eb80c756fc5d"
-SRC_URI[sha256sum] = "55ea7c1e904ffe4b1cdbe1addca8291a2533d7d285fd22ac33608e9502a62446"
diff --git a/yocto-poky/meta/recipes-core/dropbear/dropbear_2015.71.bb b/yocto-poky/meta/recipes-core/dropbear/dropbear_2015.71.bb
new file mode 100644
index 0000000..4dabefa
--- /dev/null
+++ b/yocto-poky/meta/recipes-core/dropbear/dropbear_2015.71.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "2ccc0a2f3e37ca221db12c5af6a88137"
+SRC_URI[sha256sum] = "376214169c0e187ee9f48ae1a99b3f835016ad5b98ede4bfd1cf581deba783af"
-- 
2.6.4
