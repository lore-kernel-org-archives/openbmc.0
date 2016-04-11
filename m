Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qjr7P1LlhzDqQB
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 10:10:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460333437027233.34198835635834;
 Sun, 10 Apr 2016 17:10:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/7] qemu_git.bb: Update to palmetto-bmc model with
 Cadence GEM
Date: Sun, 10 Apr 2016 19:10:27 -0500
Message-Id: <1460333431-28399-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460333431-28399-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460333431-28399-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 11 Apr 2016 00:10:41 -0000

From: Andrew Jeffery <andrew@aj.id.au>

This enables networking on the QEMU side. The Cadence GEM isn't the
controller actually used by the AST2400, but is an existing, in-tree
MMIO-based device that is a reasonable substitute.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb b/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
index 97667ba..80af060 100644
--- a/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
+++ b/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
@@ -5,12 +5,12 @@
 
 require qemu.inc
 
-SRCREV = "d1f8764099022bc1173f2413331b26d4ff609a0c"
+SRCREV = "openbmc-20160404-1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI = "git://github.com/openbmc/qemu.git;protocol=https"
+SRC_URI = "git://github.com/openbmc/qemu.git;protocol=https;tag=${SRCREV};rebaseable=1"
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
-- 
2.7.1
