Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTt8S3cbTzDqh9
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 14:00:24 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465963219560708.7906005269768;
 Tue, 14 Jun 2016 21:00:19 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] cheatsheet.md: Re-write QEMU invocation example
Date: Tue, 14 Jun 2016 23:00:14 -0500
Message-Id: <20160615040014.5450-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615040014.5450-1-openbmc-patches@stwcx.xyz>
References: <20160615040014.5450-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 04:00:25 -0000

From: Andrew Jeffery <andrew@aj.id.au>

The commandline provided had several issues:

* The -dtb option was redundant as we boot with the cuImage, and caused
  some kernel configuration to be skipped which in turn ended in a
  kernel panic
* -append argument was redundant with respect to the devicetree
* The file paths used typically required the user to change up out of
  the build directory after bitbaking obmc-phosphor-image

The patch addresses all of the above.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 cheatsheet.md | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/cheatsheet.md b/cheatsheet.md
index 4e2c8f5..f51522c 100644
--- a/cheatsheet.md
+++ b/cheatsheet.md
@@ -91,18 +91,16 @@ temporary work-arounds that add to QEMU's capabilities where appropriate.
 QEMU's wiki has instructions for [building from
 source](http://wiki.qemu.org/Documentation/GettingStartedDevelopers).
 
-Assuming the CWD is the root of the openbmc tree, a palmetto-bmc machine can be
-invoked with:
+Assuming the current working directory is the `build` directory (from sourcing
+`oe-init-build-env`), a palmetto-bmc machine can be invoked with:
 
 ```
 qemu-system-arm \
     -M palmetto-bmc \
     -m 256 \
-    -append "console=ttyS4" \
     -nographic \
-    -kernel build/tmp/deploy/images/palmetto/cuImage-palmetto.bin \
-    -dtb build/tmp/deploy/images/palmetto/cuImage-aspeed-bmc-opp-palmetto.dtb \
-    -initrd build/tmp/deploy/images/palmetto/obmc-phosphor-image-palmetto.cpio.gz
+    -kernel tmp/deploy/images/palmetto/cuImage-palmetto.bin \
+    -initrd tmp/deploy/images/palmetto/obmc-phosphor-image-palmetto.cpio.gz
 ```
 
 To quit, type `Ctrl-a c` to switch to the QEMU monitor, and then `quit` to exit.
-- 
2.8.4
