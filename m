Return-Path: <andrew@aj.id.au>
Received: from homiemail-a39.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDwHP41f0zDqKX
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 11:51:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=bDVJzLZR; 
 dkim-atps=neutral
Received: from homiemail-a39.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTP id 6E2D6150069;
 Tue, 24 May 2016 18:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id; s=aj.id.au; bh=bKRBm8pt0sMHwFHEai+6Ld9
 1G1s=; b=bDVJzLZRL9/l7mELuxGJFfwTeYmApEcwC7V/tFLF7LaM1EumNBBhlgJ
 X0ZmsAUVD87ICwyWGyHHS48Qg9kS4ipxWa9572XJU/XxhS5ix2XicIPgLaF5HssS
 ialJRRZr5lIvce2MzVGFclPFWFA2OclQKow6NbOIWHRC6ZmeHmEg=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a39.g.dreamhost.com (Postfix) with ESMTPSA id 950DF15005C;
 Tue, 24 May 2016 18:51:26 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH] cheatsheet: QEMU commandline for palmetto-bmc
Date: Wed, 25 May 2016 11:21:14 +0930
Message-Id: <1464141074-20966-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
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
X-List-Received-Date: Wed, 25 May 2016 01:51:29 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 cheatsheet.md | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/cheatsheet.md b/cheatsheet.md
index 2a7748102c6c..4e2c8f56458c 100644
--- a/cheatsheet.md
+++ b/cheatsheet.md
@@ -80,3 +80,29 @@ busctl call <path> <interface> <object> <method> <parameters>
 ```
 
 * \<parameters\> example : sssay "t1" "t2" "t3" 2 2 3
+
+## Using QEMU
+
+QEMU has a palmetto-bmc machine (as of v2.6.0) which implements the core
+devices to boot a Linux kernel. OpenBMC also [maintains a
+tree](https://github.com/openbmc/qemu) with patches on their way upstream or
+temporary work-arounds that add to QEMU's capabilities where appropriate.
+
+QEMU's wiki has instructions for [building from
+source](http://wiki.qemu.org/Documentation/GettingStartedDevelopers).
+
+Assuming the CWD is the root of the openbmc tree, a palmetto-bmc machine can be
+invoked with:
+
+```
+qemu-system-arm \
+    -M palmetto-bmc \
+    -m 256 \
+    -append "console=ttyS4" \
+    -nographic \
+    -kernel build/tmp/deploy/images/palmetto/cuImage-palmetto.bin \
+    -dtb build/tmp/deploy/images/palmetto/cuImage-aspeed-bmc-opp-palmetto.dtb \
+    -initrd build/tmp/deploy/images/palmetto/obmc-phosphor-image-palmetto.cpio.gz
+```
+
+To quit, type `Ctrl-a c` to switch to the QEMU monitor, and then `quit` to exit.
-- 
2.7.4
